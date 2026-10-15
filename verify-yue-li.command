#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
status=0
/bin/bash "$SCRIPT_DIR/verify-yue-li-macos.sh" || status=$?

echo
read -r -p "Press Return to close this window..." _
exit "$status"
