# 月璃 · Yue Li

月冠、紫眸、淡紫汉服的小仙子：御剑随行，静坐陪伴，戴耳机工作，捧莲检查成果，捧星庆祝。

A moon-crowned companion with sword flight, a calm seated idle, headphone typing, lotus inspection and a star celebration.

![专注工作与检查成果的原速对照](preview/yue-li/work-vs-review.gif)

这是独立制作的自定义宠物项目，并非 OpenAI 官方宠物包。仓库沿用 `zi-yue-codex-pet` 地址，当前主版本为月璃 R4。

## 下载与预览

最新正式版本：[v3.0.0 · 月璃 R4](https://github.com/YIFO98/zi-yue-codex-pet/releases/tag/v3.0.0)。

- **[下载月璃 R4 安装包（Windows / macOS）](https://github.com/YIFO98/zi-yue-codex-pet/releases/download/v3.0.0/yue-li-r4-win-mac.zip)**
- [完整动作 GIF](preview/yue-li/yueli-all-states.gif) · [完整动作 MP4](preview/yue-li/yueli-all-states.mp4)
- [交互预览源码](preview/yue-li/index.html)：下载仓库后用浏览器打开，可切换动作、逐帧查看及跟随指针。
- [图集 WebP](pet/yue-li/spritesheet.webp) · [安装说明](docs/INSTALL.md)

Download `yue-li-r4-win-mac.zip` from the latest release, extract the entire package, then run the installer for your OS. Earlier Zi Yue releases remain available.

## 安装

先解压完整安装包，在解压后的目录运行。安装器会校验素材、备份已有同名月璃，再复制并复验，无需管理员权限。

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

如果 Windows 脚本策略阻止执行，按[手动安装说明](docs/INSTALL.md#手动安装)复制文件。看到 `[PASS]` 后，完全退出并重开客户端，在宠物选择器中选择「月璃」。

安装位置为 `$CODEX_HOME/pets/yue-li`；未设置 `CODEX_HOME` 时使用 `$HOME/.codex/pets/yue-li`。新包使用独立的 `yue-li` 标识，保留原有的 `zi-yue` 文件。

## 动作

| 状态 | 月璃的表现 |
| --- | --- |
| 待机 | 坐姿、呼吸和轻柔眨眼 |
| 向右 / 向左移动 | 踏剑飞行 |
| 招手 | 轻轻挥手 |
| 跳跃 / 庆祝 | 捧星跃起并落回原位 |
| 失败 | 失落、垂眸 |
| 等待 | 等待回应 |
| 专注工作 | 戴金色蓝花耳机，在紫色笔记本前打字 |
| 检查成果 | 双手捧蓝莲，侧头端详、眨眼点头 |
| 视线 | 十六个顺时针方向 |

图集为 v2：`1536 × 2288`、`8 × 11` 格、每格 `192 × 208`，共 73 个有效帧。WebP 为无损编码，与通过 Pets 校验的 PNG 逐像素一致。

预览默认按 Pets 帧时长播放。0.65 / 0.5 倍选项仅影响预览，不会修改客户端的播放速度；十六个视线方向也不代表十六种移动方向。

## 校验与目录

安装器内置两个素材文件的 SHA256，包内 `SHA256SUMS.txt` 提供完整校验清单。制作与校验说明见 [R4 更新记录](docs/YUE-LI-R4.md)。

- `pet/yue-li/`：当前月璃素材与清单。
- `preview/yue-li/`：当前动画与本地交互预览。
- `packages/`：可直接下载的安装包。
- `install-yue-li-*`、`verify-yue-li-*`：安装与验证脚本。
- `docs/`：安装、版本和验证说明。
- `pet/zi-yue/`、旧安装器与旧预览：保留的紫月 v2 文件。

旧版紫月：[v2.0.0 Release](https://github.com/YIFO98/zi-yue-codex-pet/releases/tag/v2.0.0) · [旧版安装文档](docs/INSTALL-ZI-YUE-v2.md)。
