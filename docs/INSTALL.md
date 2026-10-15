# 月璃 R4 安装说明

## 下载

从 [v3.0.0 Release](https://github.com/YIFO98/zi-yue-codex-pet/releases/tag/v3.0.0) 的 **Assets** 下载 `yue-li-r4-win-mac.zip`，解压整个文件夹。包内有 `pet/yue-li/pet.json`、`spritesheet.webp`、安装脚本和校验脚本。旧 `v2.0.0` / `v2.1.0` Releases 属于紫月。

## macOS

在解压目录打开终端：

```bash
/bin/bash ./install-yue-li-macos.sh
/bin/bash ./verify-yue-li-macos.sh
```

也可以运行对应的 `.command` 文件。无需 `sudo`。安装器只写入月璃目录，并在覆盖已有月璃文件前保存备份。

## Windows

在解压目录打开 PowerShell：

```powershell
powershell -NoProfile -File .\install-yue-li-windows.ps1
powershell -NoProfile -File .\verify-yue-li-windows.ps1
```

若系统策略不允许运行脚本，使用下方手动安装步骤，无需修改系统策略。

## 目录与验证

有 `CODEX_HOME` 时使用它；否则默认位置是：

```text
macOS:   ~/.codex/pets/yue-li/
Windows: %USERPROFILE%\.codex\pets\yue-li\

yue-li/
├── pet.json
└── spritesheet.webp
```

验证器应输出 `[PASS] Yue Li R4 is installed correctly`。随后完全退出并重开客户端，选择「月璃」，检查御剑、打字和捧莲动作。文件验证通过不等于在每个客户端版本上都完成了交互验证。

安装器不会覆盖 `pets/zi-yue`，也不会调用账户 Pets API 或切换账户里的当前宠物。

## 手动安装

把完整的 `pet/yue-li` 文件夹复制到上述 `pets` 目录；不要多套一层。已有同名月璃时，先将旧目录保存在其他位置。再运行对应验证器，或把两个文件的 SHA256 与 `package-info.json` 中的 `payloadSha256` 比较。

## 指定独立目录

macOS 支持 `--codex-home /absolute/path`，Windows 支持 `-CodexHome C:\absolute\path`。这些参数只作用于本次脚本，不会改写全局配置。

## 已验证的范围

- 图集通过 Pets 服务端预检，保存后回读的像素与验证稿一致。
- macOS 安装与验证在隔离目录完成，包括已有文件的备份和损坏包拒绝写入。
- Windows 脚本沿用原包的文件校验与复制流程，已核对清单和哈希；尚未在 Windows 设备上运行。
