# 安裝與設定指南

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速開始
- **⬅️ 上一章**: [AZD Basics](azd-basics.md)
- **➡️ 下一章**: [Your First Project](first-project.md)
- **🚀 下一章節**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合指南將引導您在系統上安裝並設定 Azure Developer CLI (azd)。您將學習在不同作業系統上的多種安裝方法、驗證設定，以及為 Azure 部署準備開發環境的初始配置。

## 學習目標

完成本課程後，您將能夠：
- 在您的作業系統上成功安裝 Azure Developer CLI
- 使用多種方法配置與 Azure 的驗證
- 為開發環境設定必要的先決條件
- 了解不同安裝選項及何時使用各種方法
- 排解常見的安裝與設定問題

## 學習成果

完成本課程後，您將能：
- 使用適合您平台的方法安裝 azd
- 使用 `azd auth login` 與 Azure 進行驗證
- 驗證您的安裝並測試基本的 azd 指令
- 為最佳的 azd 使用體驗配置您的開發環境
- 能夠獨立解決常見的安裝問題

本指南將協助您在任何作業系統或開發環境上安裝並設定 Azure Developer CLI。

## 先決條件

在安裝 azd 之前，請確認您已具備：
- **Azure 訂閱** - [建立免費帳戶](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於驗證與資源管理
- **Git** - 用於複製範本與版本控制
- **Docker**（選用） - 用於容器化應用程式

## 安裝方法

### Windows

#### 選項 1：PowerShell（建議）
```powershell
# 以系統管理員身分或提升權限執行
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
2. 解壓縮到 `C:\Program Files\azd\`
3. 新增到 PATH 環境變數

### macOS

#### 選項 1：Homebrew（建議）
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
# 下載並安裝
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 選項 1：安裝腳本（建議）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 選項 2：套件管理工具

**Ubuntu/Debian:**
```bash
# 新增 Microsoft 套件儲存庫
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 安裝 azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# 新增 Microsoft 套件儲存庫
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd 已預先安裝於 GitHub Codespaces。只需建立 codespace 即可立即開始使用 azd。

### Docker

```bash
# 在容器中執行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 為方便使用建立別名
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝完成後，驗證 azd 是否正常運作：

```bash
# 檢查版本
azd version

# 查看說明
azd --help

# 列出可用範本
azd template list
```

預期輸出：
```
azd version 1.x.x (commit xxxxxx)
```

<strong>注意</strong>：實際版本號會有所不同。請查看 [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) 以取得最新版本。

**✅ 安裝成功檢查清單：**
- [ ] `azd version` 顯示版本號且沒有錯誤
- [ ] `azd --help` 顯示指令文件
- [ ] `azd template list` 顯示可用的範本
- [ ] `az account show` 顯示您的 Azure 訂閱
- [ ] 您可以建立測試目錄並成功執行 `azd init`

**如果所有檢查都通過，您即可前往 [Your First Project](first-project.md)！**

## 驗證/認證設定

### Azure CLI 驗證（建議）
```bash
# 若尚未安裝 Azure CLI，請安裝
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 登入 Azure
az login

# 驗證身分
az account show
```

### 裝置代碼驗證
如果您在無頭系統或瀏覽器有問題時：
```bash
az login --use-device-code
```

### 服務主體（CI/CD）
針對自動化環境：
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 設定

### 全域設定
```bash
# 設定預設訂閱
azd config set defaults.subscription <subscription-id>

# 設定預設位置
azd config set defaults.location eastus2

# 檢視所有設定
azd config list
```

### 環境變數
將以下新增到您的 shell 設定檔（`.bashrc`, `.zshrc`, `.profile`）：
```bash
# Azure 設定
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 設定
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 啟用偵錯記錄
```

## IDE 整合

### Visual Studio Code
安裝 Azure Developer CLI 擴充功能：
1. 開啟 VS Code
2. 前往擴充功能 (Ctrl+Shift+X)
3. 搜尋 "Azure Developer CLI"
4. 安裝該擴充功能

功能：
- azure.yaml 的 IntelliSense
- 整合終端機指令
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
1. 安裝 Azure 外掛
2. 設定 Azure 憑證
3. 使用整合終端機執行 azd 指令

## 🐛 安裝疑難排解

### 常見問題

#### 存取被拒（Windows）
```powershell
# 以系統管理員身分執行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動將 azd 新增到您的 PATH：

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### 網路/Proxy 問題
```bash
# 設定代理伺服器
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳過 SSL 驗證（不建議在生產環境使用）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊的安裝
# Windows: 執行 winget uninstall Microsoft.Azd
# macOS: 執行 brew uninstall azd
# Linux: 執行 sudo apt remove azd

# 清除設定
rm -rf ~/.azd
```

### 取得更多協助
```bash
# 啟用除錯日誌
export AZD_DEBUG=true
azd <command> --debug

# 檢視目前設定
azd config list

# 檢視目前部署狀態
azd show
```

## 更新 azd

### 自動更新
當有更新可用時，azd 會通知您：
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

## 💡 常見問題 (FAQ)

<details>
<summary><strong>azd 與 az CLI 有何不同？</strong></summary>

**Azure CLI (az)**：管理單一 Azure 資源的低階工具
- `az webapp create`, `az storage account create`
- 每次處理一個資源
- 以基礎設施管理為主

**Azure Developer CLI (azd)**：針對完整應用部署的高階工具
- `azd up` 可部署整個應用與所需資源
- 以範本為基礎的工作流程
- 著重於開發者生產力

<strong>兩者皆需</strong>：azd 使用 az CLI 來處理驗證
</details>

<details>
<summary><strong>我可以在現有的 Azure 資源上使用 azd 嗎？</strong></summary>

可以！您可以：
1. 將現有資源匯入到 azd 環境
2. 在您的 Bicep 範本中引用現有資源
3. 在現有基礎設施旁使用 azd 進行新部署

請參閱 [Configuration Guide](configuration.md) 取得詳細資訊。
</details>

<details>
<summary><strong>azd 能在 Azure Government 或 Azure China 上運作嗎？</strong></summary>

可以，請設定對應的雲端：
```bash
# Azure 政府雲
az cloud set --name AzureUSGovernment
az login

# Azure 中國
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>我可以在 CI/CD 管線中使用 azd 嗎？</strong></summary>

當然可以！azd 為自動化設計：
- 與 GitHub Actions 整合
- 支援 Azure DevOps
- 服務主體驗證
- 非互動模式

請參閱 [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) 以了解 CI/CD 範例。
</details>

<details>
<summary><strong>使用 azd 的費用是多少？</strong></summary>

azd 本身是<strong>完全免費</strong>且開源。您僅需支付：
- 您所部署的 Azure 資源費用
- Azure 的使用量（運算、儲存等）

部署前可使用 `azd provision --preview` 預估成本。
</details>

## 下一步

1. <strong>完成驗證</strong>：確保您可以存取您的 Azure 訂閱
2. <strong>嘗試您的第一次部署</strong>：遵循 [First Project Guide](first-project.md)
3. <strong>探索範本</strong>：使用 `azd template list` 瀏覽可用範本
4. **設定您的 IDE**：建立您的開發環境

## 支援

若遇到問題：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [回報問題](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在您的編輯器中直接取得 Azure 命令指引

---

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速開始
- **⬅️ 上一章**: [AZD Basics](azd-basics.md) 
- **➡️ 下一章**: [Your First Project](first-project.md)
- **🚀 下一章節**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安裝完成！** 繼續前往 [Your First Project](first-project.md) 開始使用 azd 建置。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原始母語文件應視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->