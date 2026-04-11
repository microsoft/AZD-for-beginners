# 安裝與設定指南

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第1章 - 基礎與快速入門
- **⬅️ 上一章**: [AZD 基礎](azd-basics.md)
- **➡️ 下一章**: [你的第一個專案](first-project.md)
- **🚀 下一章節**: [第2章：AI為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合指南將帶您安裝與配置 Azure Developer CLI (azd) 至您的系統。您將學習多種安裝方法，涵蓋不同作業系統、認證設定，以及初步配置，以準備您的開發環境部署至 Azure。

## 學習目標

完成本課程後，您將能夠：
- 成功在您的作業系統上安裝 Azure Developer CLI
- 使用多種方法配置 Azure 認證
- 設定開發環境所需的前置條件
- 理解不同安裝選項及其適用時機
- 排解常見安裝與設定問題

## 學習成果

完成本課程後，您將能：
- 使用適合您平台的方法安裝 azd
- 使用 azd auth login 完成 Azure 認證
- 驗證安裝並測試基本 azd 指令
- 配置開發環境以獲得最佳 azd 使用體驗
- 獨立解決常見安裝問題

本指南將協助您在任意作業系統或開發環境中安裝與配置 Azure Developer CLI。

## 前置條件

安裝 azd 前請確認您擁有：
- **Azure 訂閱** - [建立免費帳戶](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於認證與資源管理
- **Git** - 用於克隆範本與版本控制
- **Docker**（可選） - 用於容器化應用程式

## 安裝方法

### Windows

#### 選項1：Windows 套件管理員（推薦）
```cmd
winget install microsoft.azd
```

#### 選項2：PowerShell 安裝腳本
```powershell
# winget 無法使用時有用
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 選項3：Chocolatey
```cmd
choco install azd
```

#### 選項4：手動安裝
1. 從 [GitHub](https://github.com/Azure/azure-dev/releases) 下載最新版本
2. 解壓縮到 `C:\Program Files\azd\`
3. 加入 PATH 環境變數

### macOS

#### 選項1：Homebrew（推薦）
```bash
brew tap azure/azd
brew install azd
```

#### 選項2：安裝腳本
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 選項3：手動安裝
```bash
# 下載及安裝
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 選項1：安裝腳本（推薦）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 選項2：套件管理器

**手動從發行資產安裝：**
```bash
# 從以下網址下載適用於您的 Linux 架構的最新壓縮檔：
# https://github.com/Azure/azure-dev/releases
# 然後解壓縮並將 azd 執行檔加入您的 PATH。
```

### GitHub Codespaces

部分 Codespaces 與開發容器環境已預裝 `azd`，但建議您自行確認：

```bash
azd version
```

若缺少 `azd`，請使用該環境的標準腳本安裝。

### Docker

```bash
# 在容器中運行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 建立別名以便更輕鬆使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝完成後，確認 azd 運作正常：

```bash
# 檢查版本
azd version

# 瀏覽說明
azd --help

# 列出可用範本
azd template list
```

預期輸出：
```
azd version 1.x.x (commit xxxxxx)
```

<strong>注意</strong>：實際版本號可能有所不同。請參考 [Azure Developer CLI 版本釋出](https://github.com/Azure/azure-dev/releases) 以獲取最新版本。

**✅ 安裝成功檢查清單：**
- [ ] `azd version` 顯示版本號且無錯誤
- [ ] `azd --help` 顯示指令說明
- [ ] `azd template list` 顯示可用範本
- [ ] 您已成功在測試資料夾運行 `azd init`

**若皆符合，即可繼續至 [你的第一個專案](first-project.md)！**

## 認證設定

### 推薦初學者設定

針對 AZD 為先的工作流程，請使用 `azd auth login` 登入。

```bash
# 需要用於像 azd up 這類 AZD 指令
azd auth login

# 驗證 AZD 認證狀態
azd auth login --check-status
```

只有在課程中您計劃自行使用 `az` 指令時，才使用 Azure CLI 登入。

### Azure CLI 認證（可選）
```bash
# 如果尚未安裝，請安裝 Azure CLI
# Windows：winget install Microsoft.AzureCLI
# macOS：brew install azure-cli
# Linux：請參閱適用於您的發行版的 Azure CLI 安裝文件

# 登入 Azure
az login

# 驗證身份驗證
az account show
```

### 該使用哪種登入流程？

- 若您走的是 AZD 初學者路徑並主要使用 `azd` 指令，請使用 `azd auth login`。
- 若您同時需要執行如 `az account show` 等 Azure CLI 指令，請也使用 `az login`。
- 若練習同時包含 `azd` 和 `az` 指令，請課程開始時同時執行兩者登入指令。

### 裝置代碼認證
若您使用無頭系統或遇到瀏覽器問題：
```bash
azd auth login --use-device-code
```

### 服務主體（CI/CD）
用於自動化環境：
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### 驗證您的完整設定

若想在開始第1章前快速檢查準備情況：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## 配置

### 全域配置
```bash
# 設定預設訂閱
azd config set defaults.subscription <subscription-id>

# 設定預設位置
azd config set defaults.location eastus2

# 檢視所有設定
azd config show
```

### 環境變數
加入您的 shell 配置檔（如 `.bashrc`、`.zshrc`、`.profile`）：
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 配置
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 啟用除錯日誌記錄
```

## IDE 整合

### Visual Studio Code
安裝 Azure Developer CLI 擴充套件：
1. 打開 VS Code
2. 前往擴充套件（Ctrl+Shift+X）
3. 搜尋 “Azure Developer CLI”
4. 安裝此擴充套件

功能：
- azure.yaml 智慧提示
- 內建終端機指令
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
2. 配置 Azure 認證
3. 使用整合終端機執行 azd 指令

## 🐛 安裝故障排除

### 常見問題

#### 權限被拒（Windows）
```powershell
# 以系統管理員身份運行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動加入 azd 至 PATH：

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

# 跳過 SSL 驗證（生產環境不建議）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊版安裝
# Windows：winget 卸載 microsoft.azd
# macOS：brew 卸載 azd
# Linux：重新安裝前移除之前的 azd 二進制檔或軟連結

# 清除設定
rm -rf ~/.azd
```

### 尋求更多協助
```bash
# 啟用除錯日誌記錄
export AZD_DEBUG=true
azd <command> --debug

# 查看當前配置
azd config show

# 查看當前部署狀態
azd show
```

## 更新 azd

### 更新檢查
azd 會在有新版時提醒您，並可用以下指令確認目前版本：
```bash
azd version
```

### 手動更新

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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
<summary><strong>azd 與 az CLI 有何不同？</strong></summary>

**Azure CLI (az)**：管理單一 Azure 資源的低階工具
- `az webapp create`、`az storage account create`
- 一次管理一個資源
- 專注於基礎架構管理

**Azure Developer CLI (azd)**：用於完整應用程式部署的高階工具
- `azd up` 部署整個應用與所有資源
- 範本導向工作流程
- 專注於開發者生產力

<strong>兩者皆需</strong>：azd 使用 az CLI 進行認證
</details>

<details>
<summary><strong>我可以用 azd 管理現有 Azure 資源嗎？</strong></summary>

可以！您能夠：
1. 將現有資源匯入 azd 環境
2. 在 Bicep 範本中引用現有資源
3. 同時使用 azd 及現有基礎架構進行新部署

詳細請參見 [配置指南](configuration.md)。
</details>

<details>
<summary><strong>azd 能支援 Azure Government 或 Azure China 嗎？</strong></summary>

可以，請設定對應的雲端：
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
<summary><strong>azd 可以用於 CI/CD 管線嗎？</strong></summary>

完全可以！azd 專為自動化設計：
- 支援 GitHub Actions
- 支援 Azure DevOps
- 服務主體認證
- 非互動模式

請參考 [部署指南](../chapter-04-infrastructure/deployment-guide.md) 了解 CI/CD 模式。
</details>

<details>
<summary><strong>使用 azd 會產生什麼費用？</strong></summary>

azd 本身<strong>完全免費且開放原始碼</strong>。您只需支付：
- 您部署的 Azure 資源費用
- Azure 消耗性費用（計算、儲存等）

使用 `azd provision --preview` 可於部署前估算費用。
</details>

## 下一步

1. <strong>完成認證</strong>：確保可存取您的 Azure 訂閱
2. <strong>嘗試首次部署</strong>：跟隨 [第一個專案指南](first-project.md)
3. <strong>探索範本</strong>：使用 `azd template list` 瀏覽可用範本
4. **配置您的 IDE**：設定開發環境

## 支援

若遇困難：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [回報問題](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 在您的編輯器內直接獲取 Azure 指令指導，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第1章 - 基礎與快速入門
- **⬅️ 上一章**: [AZD 基礎](azd-basics.md) 
- **➡️ 下一章**: [你的第一個專案](first-project.md)
- **🚀 下一章節**: [第2章：AI為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安裝完成！** 請繼續前往 [你的第一個專案](first-project.md) 開始使用 azd 建置。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力追求準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->