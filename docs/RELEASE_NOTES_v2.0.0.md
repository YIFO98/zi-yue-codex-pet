# Zi Yue v2 — GPT-5.6 Sol Remaster

紫月 v2 是一次保留角色设计、重做动作表现的 Codex 宠物更新。

## Highlights

- Rebuilt left/right running footwork with readable feet, robe, and hair cadence.
- Replaced the abrupt hover jump with a gentle five-frame acknowledgement.
- Preserved waiting, idle-like, and review expressions.
- Retained the complete v2 16-direction pointer-gaze set.
- Added one verified package for Windows and macOS.
- Added install, backup, SHA256 verification, and GPT handoff scripts.

## Download

Download `zi-yue-v2-win-mac.zip` under **Assets**. Do not download GitHub's auto-generated source archives.

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

After `[PASS]`, fully quit and reopen the Codex/ChatGPT desktop app.

## SHA256

```text
12bae32d70d9d9bc9c0faae4927ade537d1dbb5acb73e3db26f8704a7e5c1f66  zi-yue-v2-win-mac.zip
```

## Known runtime limits

- Hover is fixed to Row 4 by the current client.
- Vertical and diagonal drag locomotion states are not currently exposed.
- Rows 9–10 are 16 pointer-gaze directions, not 16-way movement.

