#!/bin/bash

set -euo pipefail

EXPECTED_MANIFEST_HASH="a522b34b29a78516457b8bcc6675ed65912f99e76ec4a02298105d35422bcffe"
EXPECTED_SPRITE_HASH="f5b41c2b07544ded1b63ac4867cf3d8143f84fb3e6f409ceeafdd3630f7cbb19"

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

echo "[PASS] Yue Li R4 installed correctly at: $target_pet_dir"
echo "[NEXT] Fully quit and reopen the Codex/ChatGPT desktop app."
