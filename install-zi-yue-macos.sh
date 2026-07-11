#!/bin/bash

set -euo pipefail

EXPECTED_MANIFEST_HASH="23486333eef37b15500ecba695b553349bc503cb30d1a4055c3d56cff1b95770"
EXPECTED_SPRITE_HASH="4bc5889172bd73dd2b8ca074ad05735f70d0d5733e360deba2ac5ebea9e8fb8f"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
SOURCE_PET_DIR="$SCRIPT_DIR/pet/zi-yue"

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
        echo "[ERROR] Required file is missing: $file_path" >&2
        exit 1
    fi

    actual_hash="$(hash_file "$file_path")"
    if [ "$actual_hash" != "$expected_hash" ]; then
        echo "[ERROR] SHA256 mismatch for $file_path" >&2
        echo "        expected: $expected_hash" >&2
        echo "        actual:   $actual_hash" >&2
        exit 1
    fi
}

assert_hash "$SOURCE_PET_DIR/pet.json" "$EXPECTED_MANIFEST_HASH"
assert_hash "$SOURCE_PET_DIR/spritesheet.webp" "$EXPECTED_SPRITE_HASH"

if [ -f "$target_pet_dir/pet.json" ] || [ -f "$target_pet_dir/spritesheet.webp" ]; then
    backup_dir="$codex_home/pet-backups/zi-yue-$(date +%Y%m%d-%H%M%S)-$$"
    /bin/mkdir -p "$backup_dir"

    if [ -f "$target_pet_dir/pet.json" ]; then
        /bin/cp -f "$target_pet_dir/pet.json" "$backup_dir/pet.json"
    fi
    if [ -f "$target_pet_dir/spritesheet.webp" ]; then
        /bin/cp -f "$target_pet_dir/spritesheet.webp" "$backup_dir/spritesheet.webp"
    fi
    echo "[OK] Existing Zi Yue files backed up to: $backup_dir"
fi

/bin/mkdir -p "$target_pet_dir"
/bin/cp -f "$SOURCE_PET_DIR/pet.json" "$target_pet_dir/pet.json"
/bin/cp -f "$SOURCE_PET_DIR/spritesheet.webp" "$target_pet_dir/spritesheet.webp"

assert_hash "$target_pet_dir/pet.json" "$EXPECTED_MANIFEST_HASH"
assert_hash "$target_pet_dir/spritesheet.webp" "$EXPECTED_SPRITE_HASH"

echo "[PASS] Zi Yue v2 installed correctly at: $target_pet_dir"
echo "[NEXT] Fully quit and reopen the Codex/ChatGPT desktop app."
