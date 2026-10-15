#!/bin/bash

set -euo pipefail

EXPECTED_MANIFEST_HASH="a522b34b29a78516457b8bcc6675ed65912f99e76ec4a02298105d35422bcffe"
EXPECTED_SPRITE_HASH="f5b41c2b07544ded1b63ac4867cf3d8143f84fb3e6f409ceeafdd3630f7cbb19"

if [ "$#" -eq 2 ] && [ "$1" = "--codex-home" ]; then
    pet_home="$2"
elif [ "$#" -ne 0 ]; then
    echo "Usage: $0 [--codex-home /absolute/path]" >&2
    exit 2
elif [ -n "${CODEX_HOME:-}" ]; then
    pet_home="$CODEX_HOME"
else
    pet_home="${HOME:?HOME is not set}/.codex"
fi

case "$pet_home" in
    /*) ;;
    *)
        echo "[ERROR] CODEX_HOME must be an absolute path: $pet_home" >&2
        exit 1
        ;;
esac

target_pet_dir="$pet_home/pets/yue-li"

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

echo "[PASS] Yue Li R4 is installed correctly at: $target_pet_dir"
