# 月璃 R7 · 举星停留

本次更新将悬停回应集中为 **举起星星 → 保持并轻眨眼 → 收回**。举星姿势连续保持三帧，共 **420 毫秒**，减少了动作切换带来的忙乱感。

**客户端真实播放倍率保持原值。** 单轮悬停仍是五帧、约 **840 毫秒**；本包调整的是姿势和停留分配，并没有为桌面宠物增加调速功能。

![当前悬停动作原速示例](https://raw.githubusercontent.com/YIFO98/zi-yue-codex-pet/v3.0.1/preview/yue-li/hover-hold.gif)

## 更新内容

- 使用单一的高举星星动作，保持三帧后收回。
- 稳定角色尺寸与起落位置，落地回到同一基线。
- 相比 v3.0.0，仅修改悬停所在的图集第 4 行，其余十行逐像素相同。
- 保留左右御剑、坐姿待机、耳机打字、捧莲审阅、招手、等待及十六方向注视。
- 更新交互预览的待机节奏，新增“模拟悬停（3轮）”。
- 更新 Windows / macOS 安装包、素材校验值和安装说明。

当前核对的桌面客户端默认连播三轮悬停动作后回到慢速待机。预览中的慢放选项只影响预览，实际行为以客户端版本为准。

## 下载与安装

下载下方 **Assets** 中的 `yue-li-r7-win-mac.zip`，解压整个文件夹。请使用该安装包，GitHub 自动生成的 Source code 不是安装包。

macOS：

```bash
/bin/bash ./install-yue-li-macos.sh
/bin/bash ./verify-yue-li-macos.sh
```

Windows PowerShell：

```powershell
powershell -NoProfile -File .\install-yue-li-windows.ps1
powershell -NoProfile -File .\verify-yue-li-windows.ps1
```

若 Windows 的脚本策略阻止执行，使用包内 `docs/INSTALL.md` 的手动安装方法。安装标识继续使用 `yue-li`；覆盖已有月璃前先备份，原有 `zi-yue` 目录保留。

[完整安装说明](https://github.com/YIFO98/zi-yue-codex-pet/blob/v3.0.1/docs/INSTALL.md) · [完整动作 MP4](https://github.com/YIFO98/zi-yue-codex-pet/blob/v3.0.1/preview/yue-li/yueli-all-states.mp4)

## 验证范围

- 图集通过本地及 Pets 预检，保存后回读像素与确认稿一致。
- 包内 WebP 使用无损编码，与当前月璃 PNG 逐像素一致。
- macOS 隔离目录测试通过：首次安装、R4 升级到 R7、旧文件完整备份、校验和损坏包拒绝写入。
- **Windows 脚本尚未在 Windows 设备实测。**
- 本包不修改客户端安装程序、签名或系统设置。

## SHA256

```text
0d7b7e29d3790031f535268d4ee990f735d42795094f5dd70381f13c52b4642b  yue-li-r7-win-mac.zip
```

附件同时提供 `SHA256SUMS.txt` 和 `RELEASE_NOTES_v3.0.1.md`。之前的 Releases 继续保留。

Yue Li R7 holds the overhead-star pose for three frames, reducing gesture changes while preserving the existing client playback rate. The package includes Windows and macOS installers with backup and integrity verification.
