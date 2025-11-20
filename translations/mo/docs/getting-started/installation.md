<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-20T09:12:40+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "mo"
}
-->
# 安裝及設定指南

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[AZD 基本概念](azd-basics.md)
- **➡️ 下一章**：[您的第一個專案](first-project.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../microsoft-foundry/microsoft-foundry-integration.md)

## 簡介

這份全面的指南將引導您在系統上安裝及配置 Azure Developer CLI (azd)。您將學習針對不同操作系統的多種安裝方法、身份驗證設定，以及初始配置，為 Azure 部署準備您的開發環境。

## 學習目標

完成本課程後，您將能夠：
- 成功在您的操作系統上安裝 Azure Developer CLI
- 使用多種方法配置 Azure 的身份驗證
- 設定開發環境所需的必要條件
- 理解不同的安裝選項及其適用情境
- 解決常見的安裝及設定問題

## 學習成果

完成本課程後，您將能夠：
- 使用適合您平台的方法安裝 azd
- 使用 `azd auth login` 與 Azure 進行身份驗證
- 驗證安裝並測試基本的 azd 指令
- 配置您的開發環境以最佳化 azd 的使用
- 獨立解決常見的安裝問題

這份指南將協助您在系統上安裝及配置 Azure Developer CLI，無論您的操作系統或開發環境如何。

## 先決條件

在安裝 azd 之前，請確保您已具備：
- **Azure 訂閱** - [建立免費帳戶](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於身份驗證及資源管理
- **Git** - 用於複製範本及版本控制
- **Docker**（可選）- 用於容器化應用程式

## 安裝方法

### Windows

#### 方法 1：PowerShell（推薦）
```powershell
# 以管理員身份或具有提升的權限執行
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 方法 2：Windows 套件管理器 (winget)
```cmd
winget install Microsoft.Azd
```

#### 方法 3：Chocolatey
```cmd
choco install azd
```

#### 方法 4：手動安裝
1. 從 [GitHub](https://github.com/Azure/azure-dev/releases) 下載最新版本
2. 解壓縮至 `C:\Program Files\azd\`
3. 添加至 PATH 環境變數

### macOS

#### 方法 1：Homebrew（推薦）
```bash
brew tap azure/azd
brew install azd
```

#### 方法 2：安裝腳本
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 方法 3：手動安裝
```bash
# 下載並安裝
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 方法 1：安裝腳本（推薦）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 方法 2：套件管理器

**Ubuntu/Debian:**
```bash
# 添加 Microsoft 套件存儲庫
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 安裝 azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# 添加 Microsoft 套件存儲庫
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd 已預先安裝於 GitHub Codespaces。只需建立一個 Codespace 即可立即使用 azd。

### Docker

```bash
# 在容器中運行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 創建一個別名以便更容易使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝完成後，驗證 azd 是否正常運作：

```bash
# 檢查版本
azd version

# 查看幫助
azd --help

# 列出可用範本
azd template list
```

預期輸出：
```
azd version 1.5.0 (commit abc123)
```

**✅ 安裝成功檢查清單：**
- [ ] `azd version` 顯示版本號且無錯誤
- [ ] `azd --help` 顯示指令文件
- [ ] `azd template list` 顯示可用範本
- [ ] `az account show` 顯示您的 Azure 訂閱
- [ ] 您能建立測試目錄並成功執行 `azd init`

**如果所有檢查均通過，您已準備好進入 [您的第一個專案](first-project.md)！**

## 身份驗證設定

### Azure CLI 身份驗證（推薦）
```bash
# 如果尚未安裝，請安裝 Azure CLI
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 登錄至 Azure
az login

# 驗證身份認證
az account show
```

### 裝置代碼身份驗證
如果您使用無頭系統或瀏覽器有問題：
```bash
az login --use-device-code
```

### 服務主體（CI/CD）
適用於自動化環境：
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 配置

### 全域配置
```bash
# 設置預設訂閱
azd config set defaults.subscription <subscription-id>

# 設置預設位置
azd config set defaults.location eastus2

# 查看所有配置
azd config list
```

### 環境變數
添加至您的 shell 配置檔（`.bashrc`、`.zshrc`、`.profile`）：
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 配置
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 啟用調試日誌
```

## IDE 整合

### Visual Studio Code
安裝 Azure Developer CLI 擴展：
1. 打開 VS Code
2. 前往擴展（Ctrl+Shift+X）
3. 搜尋 "Azure Developer CLI"
4. 安裝擴展

功能：
- azure.yaml 的 IntelliSense
- 整合終端指令
- 範本瀏覽
- 部署監控

### GitHub Codespaces
建立 `.devcontainer/devcontainer.json`：
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. 安裝 Azure 插件
2. 配置 Azure 憑證
3. 使用整合終端執行 azd 指令

## 🐛 安裝故障排除

### 常見問題

#### 權限被拒絕（Windows）
```powershell
# 以管理員身份運行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動添加 azd 至 PATH：

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### 網絡/代理問題
```bash
# 配置代理
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳過 SSL 驗證（不建議用於生產環境）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊的安裝
# Windows: winget 卸載 Microsoft.Azd
# macOS: brew 卸載 azd
# Linux: sudo apt 移除 azd

# 清理配置
rm -rf ~/.azd
```

### 獲取更多幫助
```bash
# 啟用調試日誌
export AZD_DEBUG=true
azd <command> --debug

# 查看詳細日誌
azd logs

# 檢查系統資訊
azd info
```

## 更新 azd

### 自動更新
azd 會在有更新時通知您：
```bash
azd version --check-for-updates
```

### 手動更新

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 常見問題解答

<details>
<summary><strong>azd 和 az CLI 有什麼區別？</strong></summary>

**Azure CLI (az)**：管理單個 Azure 資源的低階工具
- `az webapp create`、`az storage account create`
- 一次管理一個資源
- 專注於基礎設施管理

**Azure Developer CLI (azd)**：部署完整應用程式的高階工具
- `azd up` 部署整個應用程式及所有資源
- 基於範本的工作流程
- 專注於開發者生產力

**您需要兩者**：azd 使用 az CLI 進行身份驗證
</details>

<details>
<summary><strong>我可以使用 azd 管理現有的 Azure 資源嗎？</strong></summary>

可以！您可以：
1. 將現有資源導入 azd 環境
2. 在 Bicep 範本中引用現有資源
3. 使用 azd 進行新部署並與現有基礎設施共存

詳情請參閱 [配置指南](configuration.md)。
</details>

<details>
<summary><strong>azd 是否支援 Azure 政府或 Azure 中國？</strong></summary>

可以，配置雲端：
```bash
# Azure 政府
az cloud set --name AzureUSGovernment
az login

# Azure 中國
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>我可以在 CI/CD 管道中使用 azd 嗎？</strong></summary>

當然可以！azd 專為自動化設計：
- GitHub Actions 整合
- 支援 Azure DevOps
- 服務主體身份驗證
- 非互動模式

詳情請參閱 [部署指南](../deployment/deployment-guide.md)。
</details>

<details>
<summary><strong>使用 azd 的成本是多少？</strong></summary>

azd 本身是 **完全免費** 且開源的。您只需支付：
- 部署的 Azure 資源費用
- Azure 使用成本（計算、存儲等）

使用 `azd provision --preview` 在部署前估算成本。
</details>

## 下一步

1. **完成身份驗證**：確保您能訪問您的 Azure 訂閱
2. **嘗試您的第一次部署**：按照 [第一個專案指南](first-project.md)
3. **探索範本**：使用 `azd template list` 瀏覽可用範本
4. **配置您的 IDE**：設置您的開發環境

## 支援

如果您遇到問題：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [提交問題](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[AZD 基本概念](azd-basics.md) 
- **➡️ 下一章**：[您的第一個專案](first-project.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ 安裝完成！** 繼續前往 [您的第一個專案](first-project.md)，開始使用 azd 建立專案。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->