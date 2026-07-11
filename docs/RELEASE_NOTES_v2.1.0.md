# Zi Yue v2.1

紫月 v2.1 保留原角色设计，收敛左右拖动的动作幅度，并把悬停回应改成指尖比心。

## Highlights

- Replaced exaggerated airborne dragging with a grounded, gentle small-step cadence.
- Kept opposite light crossing phases so the feet remain readable without overacting.
- Replaced the hover lift response with a finger-heart gesture and attached heart animation.
- Preserved the existing v2 16-direction pointer-gaze set and all untouched rows.
- Updated one clean Windows/macOS package with backup and SHA256 verification.

## Download

Download `zi-yue-v2-win-mac-clean-20260711.zip` under **Assets**. Do not download GitHub's auto-generated source archives.

## Install

Windows:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\install-zi-yue-windows.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File ".\verify-zi-yue-windows.ps1"
```

macOS:

```bash
/bin/bash "./install-zi-yue-macos.sh"
/bin/bash "./verify-zi-yue-macos.sh"
```

After `[PASS]`, fully quit and reopen the Codex / ChatGPT desktop app.

## SHA256

```text
eb92bfd6b3503a6eb1a1a82719182819c6c1e96cd5798d171e1077ab9e51391a  zi-yue-v2-win-mac-clean-20260711.zip
```

## Runtime limits

- Hover is fixed to Row 4 by the current client.
- Vertical drag has no dedicated client state; diagonal drag uses the horizontal component.
- Rows 9–10 are pointer-gaze directions, not 16-way movement.
