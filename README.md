# Cysic Verifier 文件更新工具

该项目提供了一个简单的脚本，用于自动化更新 Cysic 验证器所需的关键文件，并替换现有的旧文件。

## 功能
1. 自动下载最新版本的 `libdarwin_verifier.so` 和 `verifier_linux` 文件。
2. 替换目标目录中的旧文件。
3. 将 `verifier_linux` 重命名为 `verifier`。
4. 设置文件的执行权限，确保验证器正常运行。

---

### 运行脚本


```bash
bash <(curl -fsSL https://raw.githubusercontent.com/syydnr99/CY-/main/update_verifier.sh)
