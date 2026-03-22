# 安裝及設定指南

**章節導航：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**: [AZD 基本知識](azd-basics.md)
- **➡️ 下一章**: [你的第一個專案](first-project.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合指南將引導您在系統上安裝並配置 Azure Developer CLI (azd)。您將學習適用於不同作業系統的多種安裝方法、認證設定，以及初步配置，以準備您的開發環境進行 Azure 部署。

## 學習目標

完成本課程後，您將能：
- 成功在您的作業系統上安裝 Azure Developer CLI
- 使用多種方法設定與 Azure 的認證
- 建立具備必要先決條件的開發環境
- 了解不同安裝選項及其適用時機
- 故障排除常見安裝及設定問題

## 學習成果

完成本課程後，您將能夠：
- 依平台適當方法安裝 azd
- 使用 azd auth login 進行 Azure 認證
- 驗證安裝並測試基本 azd 命令
- 配置您的開發環境以最佳化 azd 使用
- 獨立解決常見安裝問題

本指南將協助您在任何作業系統及開發環境中安裝與配置 Azure Developer CLI。

## 先決條件

在安裝 azd 前，請確保您具備：
- **Azure 訂閱** - [建立免費帳號](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於認證及資源管理
- **Git** - 用於克隆範本及版本控制
- **Docker**（選用）- 用於容器化應用程式

## 安裝方法

### Windows

#### 選項 1：PowerShell（推薦）
```powershell
# 以系統管理員身份或用提升的權限運行
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 選項 2：Windows 套件管理員 (winget)
```cmd
winget install Microsoft.Azd
```

#### 選項 3：Chocolatey
```cmd
choco install azd
```

#### 選項 4：手動安裝
1. 從 [GitHub](https://github.com/Azure/azure-dev/releases) 下載最新版本
2. 解壓縮至 `C:\Program Files\azd\`
3. 新增至 PATH 環境變數

### macOS

#### 選項 1：Homebrew（推薦）
```bash
brew tap azure/azd
brew install azd
```

#### 選項 2：安裝腳本
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 選項 3：手動安裝
```bash
# 下載及安裝
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 選項 1：安裝腳本（推薦）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 選項 2：套件管理員

**Ubuntu/Debian:**
```bash
# 新增 Microsoft 軟件包儲存庫
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 安裝 azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# 新增 Microsoft 軟件包倉庫
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd 已預裝於 GitHub Codespaces。只需建立一個 Codespace，即可立即使用 azd。

### Docker

```bash
# 在容器中運行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 創建別名以便更輕鬆使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝後，請確認 azd 正常運作：

```bash
# 檢查版本
azd version

# 查看幫助
azd --help

# 列出可用模板
azd template list
```

預期輸出：
```
azd version 1.x.x (commit xxxxxx)
```

<strong>注意</strong>：實際版本號會有所不同。請參考 [Azure Developer CLI 版本釋出](https://github.com/Azure/azure-dev/releases) 取得最新版本。

**✅ 安裝成功核對清單：**
- [ ] `azd version` 正確顯示版本號且無錯誤
- [ ] `azd --help` 顯示命令說明
- [ ] `azd template list` 列出可用範本
- [ ] `az account show` 顯示您的 Azure 訂閱資訊
- [ ] 您能建立測試資料夾並成功執行 `azd init`

**若全部核對皆通過，即可前往 [你的第一個專案](first-project.md)！**

## 認證設定

### Azure CLI 認證（推薦）
```bash
# 如果未安裝，請安裝 Azure CLI
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 登入 Azure
az login

# 驗證身份驗證
az account show
```

### 裝置碼認證
若您使用無頭系統或遇到瀏覽器問題：
```bash
az login --use-device-code
```

### 服務主體（CI/CD）
用於自動環境：
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 配置

### 全域配置
```bash
# 設定預設訂閱
azd config set defaults.subscription <subscription-id>

# 設定預設位置
azd config set defaults.location eastus2

# 查看所有配置
azd config list
```

### 環境變數
新增至您的 shell 設定檔（`.bashrc`、`.zshrc`、`.profile`）：
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 配置
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 啟用除錯記錄
```

## IDE 整合

### Visual Studio Code
安裝 Azure Developer CLI 擴充：
1. 開啟 VS Code
2. 前往擴充功能 (Ctrl+Shift+X)
3. 搜尋「Azure Developer CLI」
4. 安裝此擴充

功能包含：
- azure.yaml 的 IntelliSense
- 整合終端機命令
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
2. 設定 Azure 憑證
3. 使用整合終端執行 azd 命令

## 🐛 安裝故障排除

### 常見問題

#### 權限被拒 (Windows)
```powershell
# 以管理員身份運行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動將 azd 新增至 PATH：

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### 網路/代理問題
```bash
# 配置代理
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳過 SSL 驗證（不建議於生產環境使用）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊安裝
# Windows：winget 卸載 Microsoft.Azd
# macOS：brew 卸載 azd
# Linux：sudo apt 移除 azd

# 清理設定
rm -rf ~/.azd
```

### 獲取更多幫助
```bash
# 啟用除錯日誌
export AZD_DEBUG=true
azd <command> --debug

# 檢視當前設定
azd config list

# 檢視當前部署狀態
azd show
```

## 更新 azd

### 自動更新
azd 將在有更新時通知您：
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

## 💡 常見問題

<details>
<summary><strong>azd 與 az CLI 有什麼不同？</strong></summary>

**Azure CLI (az)**：管理單一 Azure 資源的底層工具
- `az webapp create`、`az storage account create`
- 一次管理一個資源
- 專注基礎架構管理

**Azure Developer CLI (azd)**：針對完整應用部署的高階工具
- `azd up` 部署整個應用及所有資源
- 範本工作流程
- 專注開發者生產力

<strong>兩者皆需</strong>：azd 會使用 az CLI 進行認證
</details>

<details>
<summary><strong>我可以用 azd 管理現有 Azure 資源嗎？</strong></summary>

可以！您可：
1. 將現有資源匯入 azd 環境
2. 在 Bicep 範本中引用現有資源
3. 使用 azd 進行新部署與現有基礎設施並行

詳細請參考[配置指南](configuration.md)。
</details>

<details>
<summary><strong>azd 是否支援 Azure Government 或 Azure China？</strong></summary>

可以，請設定目標雲端：
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
<summary><strong>我可以在 CI/CD 流水線中使用 azd 嗎？</strong></summary>

絕對可以！azd 專為自動化設計：
- GitHub Actions 整合
- Azure DevOps 支援
- 服務主體認證
- 非互動模式

詳細 CI/CD 模式請見[部署指南](../chapter-04-infrastructure/deployment-guide.md)。
</details>

<details>
<summary><strong>使用 azd 的成本是多少？</strong></summary>

azd 本身<strong>完全免費</strong>且為開源專案。您僅需支付：
- 您所部署的 Azure 資源
- Azure 使用量費用（運算、儲存等）

使用 `azd provision --preview` 可於部署前估算費用。
</details>

## 下一步

1. <strong>完成認證</strong>：確保您可存取 Azure 訂閱
2. <strong>嘗試首次部署</strong>：參考[第一個專案指南](first-project.md)
3. <strong>探索範本</strong>：以 `azd template list` 瀏覽範本
4. **配置您的 IDE**：設定開發環境

## 支援

遇到問題時：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [報告問題](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在編輯器內直接獲得 Azure 指令指引

---

**章節導航：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**: [AZD 基本知識](azd-basics.md) 
- **➡️ 下一章**: [你的第一個專案](first-project.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安裝完成！** 繼續至 [你的第一個專案](first-project.md) 開始使用 azd 建置。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應視為權威資料。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所引起之任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->