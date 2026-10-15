# 紫月 v2 安装说明 · Installation Guide

## 1. 下载正确的文件

打开：

<https://github.com/Yifo98/zi-yue-codex-pet/releases/latest>

在 **Assets** 下下载 `zi-yue-v2-win-mac.zip`。不要下载 GitHub 自动生成的 `Source code (zip)` 或 `Source code (tar.gz)`。

Download `zi-yue-v2-win-mac.zip` from **Assets**. Do not download the auto-generated source archives.

## 2. Codex 如何读取宠物

Codex 不会从 ZIP 内直接加载宠物。安装后目录必须是：

```text
${CODEX_HOME:-$HOME/.codex}/pets/zi-yue/
├── pet.json
└── spritesheet.webp
```

安装后必须完全退出并重新打开 Codex/ChatGPT 桌面客户端。

## 3. Windows 自动安装

1. 完全退出客户端。
2. 解压 `zi-yue-v2-win-mac.zip`。
3. 在解压后的 `zi-yue-v2-win-mac` 目录打开 PowerShell。
4. 运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\install-zi-yue-windows.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File ".\verify-zi-yue-windows.ps1"
```

看到 `[PASS]` 后重新打开客户端。默认目录是 `%USERPROFILE%\.codex\pets\zi-yue`；如果设置了 `CODEX_HOME`，安装器会优先使用它。

## 4. macOS 自动安装

1. 完全退出客户端。
2. 解压安装包。
3. 在解压目录打开 Terminal。
4. 运行：

```bash
/bin/bash "./install-zi-yue-macos.sh"
/bin/bash "./verify-zi-yue-macos.sh"
```

也可以 Control-click `install-zi-yue.command` 后选择“打开”，随后运行 `verify-zi-yue.command`。

如果 Gatekeeper 阻止双击 `.command`，使用上面的 `/bin/bash` 命令即可。不要关闭 Gatekeeper，不需要 `sudo`。

## 5. 手动安装兜底

将安装包内的 `pet/zi-yue` 文件夹复制到：

```text
$HOME/.codex/pets/zi-yue
```

若设置过 `CODEX_HOME`，则复制到 `$CODEX_HOME/pets/zi-yue`。确认该目录直接包含 `pet.json` 和 `spritesheet.webp`，不要再多套一层文件夹。

## 6. 验证标准

安装不是“脚本没报错”就算完成。验证脚本必须输出：

```text
[PASS] Zi Yue v2 is installed correctly
```

随后完全重启客户端，实际检查紫月的悬停回应、左右脚步和鼠标注视。

## 7. 交给 GPT 安装

把完整 ZIP 交给目标电脑上的 GPT，并让它读取包内 `INSTRUCTIONS-FOR-GPT.txt`。GPT 应当：

1. 解压完整 ZIP；
2. 判断 Windows 或 macOS；
3. 执行对应安装器与验证器；
4. 回报安装目录、两个 payload SHA256 和最终 `[PASS]`；
5. 提醒用户完全重启客户端。
