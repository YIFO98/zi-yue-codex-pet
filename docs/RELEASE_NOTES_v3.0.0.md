# 月璃 R4 · 御剑随行

月璃正式加入本仓库：淡紫汉服、月牙金冠与蓝莲相伴，左右移动改为御剑飞行，工作与审阅拥有清晰不同的动作。发布版本为 **v3.0.0**，美术修订为 **R4**。

## 本次更新

- 左右移动使用御剑飞行，保留轻柔衣摆与飘带。
- 坐姿待机、轻轻招手、捧星庆祝、失落和等待回应。
- **专注工作**：戴金色蓝花耳机，在木桌前用紫色笔记本打字。
- **检查成果**：双手捧蓝莲，侧头端详、眨眼点头；修复与工作动作过于相似的问题。
- 九组标准动作与十六个视线方向，共 73 帧；透明 v2 图集为 1536 × 2288。
- 独立安装标识 `yue-li`，保留已有 `zi-yue`。安装器在写入前后校验文件，并备份已有同名月璃。

![工作与审阅原速对照](https://raw.githubusercontent.com/YIFO98/zi-yue-codex-pet/5db312c2548985995f76c4967842119b06501bfd/preview/yue-li/work-vs-review.gif)

[完整动画 MP4](https://github.com/YIFO98/zi-yue-codex-pet/blob/5db312c2548985995f76c4967842119b06501bfd/preview/yue-li/yueli-all-states.mp4) · [完整动作 GIF](https://github.com/YIFO98/zi-yue-codex-pet/blob/5db312c2548985995f76c4967842119b06501bfd/preview/yue-li/yueli-all-states.gif)

## 下载与安装

在下方 **Assets** 下载 `yue-li-r4-win-mac.zip`。请解压整个安装包，使用包内脚本；GitHub 自动生成的 Source code 不是这份安装包。

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

如果 Windows 脚本策略阻止执行，使用包内 `docs/INSTALL.md` 的手动复制方法，无需修改系统策略。安装验证通过后，完全退出并重开客户端，选择「月璃」。

## 验证与已知限制

- 图集通过 Pets 服务端预检，保存后回读像素一致。
- 包内 WebP 与已确认 PNG 逐像素一致，使用无损编码。
- macOS 隔离目录测试通过：首次安装、复验、同名文件备份、损坏包拒绝写入及旧紫月保留。
- **Windows 脚本尚未在 Windows 设备上实测。**
- 客户端决定帧时长；预览的 0.65 / 0.5 倍慢放仅影响预览。十六个视线方向不代表十六种移动方向。

## SHA256

```text
dfd276f29f7bd9712271e09663ae2a0fe94060c0d1268467a038699f0feff33f  yue-li-r4-win-mac.zip
```

附件同时提供 `SHA256SUMS.txt` 与这份更新说明的 Markdown 文件。安装包内容与已同步的 R4 安装包完全一致。旧紫月 Releases 保留。

Yue Li R4 introduces sword flight and distinct typing / lotus-review states. The package includes macOS and Windows installers with backup and integrity checks; Windows runtime testing remains pending.
