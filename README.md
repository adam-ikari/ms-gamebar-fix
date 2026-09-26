# ms-gamebar-fix

修复 Windows 10/11 LTSC 等无 Xbox 组件的系统在连接手柄时弹出
「需要新应用以打开此 ms-gamebar 链接」提示的问题。

**在线页面**:<https://adam-ikari.github.io/ms-gamebar-fix/>

## 用法

下载 `fix.bat` 双击运行即可。无需管理员权限;
之后连接手柄完全无感:无弹窗、无任何窗口。
`undo.bat` 用于还原。

## 原理

连接手柄时 Windows 通过 `ms-gamebar://` 协议拉起 Xbox Game Bar。
精简系统没有该组件、也没有协议处理器,系统找不到应用就弹窗。
`fix.bat` 做两件事:

1. 在 `%LocalAppData%` 写入一个空操作的 `ms-gamebar-noop.vbs`;
2. 给 `ms-gamebar` / `ms-gamebarservices` 两个协议注册处理器(HKCU 用户级),
   命令为 `wscript.exe //B //Nologo <vbs>` —— wscript 是 GUI 子系统程序,
   不会创建控制台窗口,触发时静默执行立即退出,完全无感。

## 文件

| 文件 | 用途 |
|---|---|
| `fix.bat` | 一键修复 |
| `undo.bat` | 一键还原 |
