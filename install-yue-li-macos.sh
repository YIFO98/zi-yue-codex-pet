#!/bin/bash

set -euo pipefail

EXPECTED_MANIFEST_HASH="7d861a8ff747b3b8024704df48f59ab1ed81e1848fde7ccc1f12a124bfa2efdd"
EXPECTED_SPRITE_HASH="695315d95d6fc8f4a5df2560b02cd93e07372c3904e7aaa97c55a1ca78014ff6"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
SOURCE_PET_DIR="$SCRIPT_DIR/pet/yue-li"

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
    backup_dir="$pet_home/pet-backups/yue-li-$(date +%Y%m%d-%H%M%S)-$$"
    /bin/mkdir -p "$backup_dir"

    if [ -f "$target_pet_dir/pet.json" ]; then
        /bin/cp -f "$target_pet_dir/pet.json" "$backup_dir/pet.json"
    fi
    if [ -f "$target_pet_dir/spritesheet.webp" ]; then
        /bin/cp -f "$target_pet_dir/spritesheet.webp" "$backup_dir/spritesheet.webp"
    fi
    echo "[OK] Existing Yue Li files backed up to: $backup_dir"
fi

/bin/mkdir -p "$target_pet_dir"
/bin/cp -f "$SOURCE_PET_DIR/pet.json" "$target_pet_dir/pet.json"
/bin/cp -f "$SOURCE_PET_DIR/spritesheet.webp" "$target_pet_dir/spritesheet.webp"

assert_hash "$target_pet_dir/pet.json" "$EXPECTED_MANIFEST_HASH"
assert_hash "$target_pet_dir/spritesheet.webp" "$EXPECTED_SPRITE_HASH"

echo "[PASS] Yue Li R7 installed correctly at: $target_pet_dir"
echo "[NEXT] Fully quit and reopen the Codex/ChatGPT desktop app."
