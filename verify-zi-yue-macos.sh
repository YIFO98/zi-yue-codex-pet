#!/bin/bash

set -euo pipefail

EXPECTED_MANIFEST_HASH="23486333eef37b15500ecba695b553349bc503cb30d1a4055c3d56cff1b95770"
EXPECTED_SPRITE_HASH="78f8a8fb0a3e3f464bd485079cb123f574c3c63dc0754d8fd11143c58816ba15"

if [ -n "${CODEX_HOME:-}" ]; then
    codex_home="$CODEX_HOME"
else
    codex_home="${HOME:?HOME is not set}/.codex"
fi

case "$codex_home" in
    /*) ;;
    *)
        echo "[ERROR] CODEX_HOME must be an absolute path: $codex_home" >&2
        exit 1
        ;;
esac

target_pet_dir="$codex_home/pets/zi-yue"

hash_file() {
    /usr/bin/shasum -a 256 "$1" | /usr/bin/awk '{print $1}'
}

assert_hash() {
    file_path="$1"
    expected_hash="$2"

    if [ ! -f "$file_path" ]; then
        echo "[ERROR] Installed file is missing: $file_path" >&2
        exit 1
    fi

    actual_hash="$(hash_file "$file_path")"
    if [ "$actual_hash" != "$expected_hash" ]; then
        echo "[ERROR] SHA256 mismatch for $file_path" >&2
        echo "        expected: $expected_hash" >&2
        echo "        actual:   $actual_hash" >&2
        exit 1
    fi
    echo "[OK] $(basename "$file_path") SHA256 $actual_hash"
}

assert_hash "$target_pet_dir/pet.json" "$EXPECTED_MANIFEST_HASH"
assert_hash "$target_pet_dir/spritesheet.webp" "$EXPECTED_SPRITE_HASH"

echo "[PASS] Zi Yue v2 is installed correctly at: $target_pet_dir"

