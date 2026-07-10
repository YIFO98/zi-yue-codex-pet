# 紫月 · Zi Yue v2

使用 GPT-5.6 Sol 重新打磨的 Codex 桌面宠物，保留紫月原本的角色设计，升级跑动脚步、悬停回应和 16 方向注视。

A GPT-5.6 Sol remaster of the Zi Yue Codex desktop pet—same character design, with more natural running footwork, a gentler hover response, and 16 pointer-gaze directions.

![Zi Yue v2 animated preview](preview/zi-yue-gpt56-sol-promo.gif)

> 这是独立制作的自定义宠物项目，并非 OpenAI 官方宠物包。<br>
> This is an independent custom-pet project, not an official OpenAI pet release.

## 下载 · Download

前往 [GitHub Releases](https://github.com/Yifo98/zi-yue-codex-pet/releases/latest)，在 **Assets** 中下载：

[`zi-yue-v2-win-mac.zip`](https://github.com/Yifo98/zi-yue-codex-pet/releases/download/v2.0.0/zi-yue-v2-win-mac.zip)

请不要下载 GitHub 自动生成的 `Source code (zip)`；它不是安装包。

Go to [GitHub Releases](https://github.com/Yifo98/zi-yue-codex-pet/releases/latest) and download `zi-yue-v2-win-mac.zip` under **Assets**. Do not use GitHub's auto-generated `Source code` archives.

## 快速安装 · Quick install

Codex 不会直接读取 ZIP。先完全退出 Codex/ChatGPT 桌面客户端，再解压安装包并运行对应脚本。

The app does not load the ZIP directly. Fully quit the Codex/ChatGPT desktop app, extract the package, and run the installer for your operating system.

### Windows

在解压目录打开 PowerShell：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\install-zi-yue-windows.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File ".\verify-zi-yue-windows.ps1"
```

### macOS

在解压目录打开 Terminal：

```bash
/bin/bash "./install-zi-yue-macos.sh"
/bin/bash "./verify-zi-yue-macos.sh"
```

看到 `[PASS]` 后，完全退出并重新打开 Codex/ChatGPT。安装器不需要管理员权限。

After `[PASS]`, fully quit and reopen the Codex/ChatGPT desktop app. No administrator access is required.

完整安装、手动安装与 Gatekeeper 说明见 [安装文档](docs/INSTALL.md)。

See [Installation Guide](docs/INSTALL.md) for complete, manual, and Gatekeeper instructions.

## Codex 读取位置 · Install location

- 设置了 `CODEX_HOME`：`$CODEX_HOME/pets/zi-yue`
- 未设置：`$HOME/.codex/pets/zi-yue`
- Windows 默认等价于 `%USERPROFILE%\.codex\pets\zi-yue`

安装器会先校验包内文件，备份已有紫月，再复制并复验。

## 动作升级 · Motion remaster

- 更自然的左右跑动脚步，脚、衣摆和长发有清晰节奏
- 五帧温柔悬停回应，不再用突兀的跳跃表现
- 保留等待、发呆与回看动作
- 16 个顺时针鼠标注视方向
- Windows 与 macOS 使用同一份 v2 图集

## 当前客户端限制 · Runtime limits

- 悬停状态固定调用 Row 4，宠物包不能随机选择 Row 0–10。
- 上下拖动没有独立移动状态；斜向拖动只按水平分量显示左跑或右跑。
- 16 个方向是看向鼠标的注视姿态，不是 16 方向移动。

These are current client-runtime limits; adding true vertical or diagonal locomotion requires new app states and a new atlas contract.

## 完整性 · Integrity

Release ZIP SHA256：

```text
12bae32d70d9d9bc9c0faae4927ade537d1dbb5acb73e3db26f8704a7e5c1f66  zi-yue-v2-win-mac.zip
```

包内安装器会再次校验 `pet.json` 和 `spritesheet.webp`。如果交给另一台电脑上的 GPT 安装，可以直接把 ZIP 和包内的 `INSTRUCTIONS-FOR-GPT.txt` 一起交给它。

## Project links

- Repository: <https://github.com/Yifo98/zi-yue-codex-pet>
- Latest release: <https://github.com/Yifo98/zi-yue-codex-pet/releases/latest>
- GPT-5.6 Sol preview: <https://openai.com/index/previewing-gpt-5-6-sol/>
