# ms-gamebar-fix

修复 Windows 10/11 LTSC 等无 Xbox 组件的系统在连接手柄时弹出
「需要新应用以打开此 ms-gamebar 链接」提示的问题。

**在线页面**:<https://adam-ikari.github.io/ms-gamebar-fix/>

## 原理

连接手柄时 Windows 通过 `ms-gamebar://` 协议拉起 Xbox Game Bar。
精简系统没有该组件、也没有协议处理器,系统找不到应用就弹窗。
本修复给 `ms-gamebar` 和 `ms-gamebarservices` 两个协议注册一个
空操作处理器(HKCU 用户级,无需管理员),调用时静默执行立即退出。

## 文件

| 文件 | 用途 |
|---|---|
| `fix-ms-gamebar.reg` | 基础修复,双击导入 |
| `undo-ms-gamebar.reg` | 撤销修复 |
| `fix-noflash.reg` + `ms-gamebar-noop.vbs` | 可选:消除 cmd 处理器的黑框闪烁 |
