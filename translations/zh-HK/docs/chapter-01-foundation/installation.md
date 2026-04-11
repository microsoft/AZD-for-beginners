# 安裝與設定指南

**章節導覽：**
- **📚 課程主頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: 第 1 章 - 基礎與快速上手
- **⬅️ 上一章**: [AZD Basics](azd-basics.md)
- **➡️ 下一章**: [Your First Project](first-project.md)
- **🚀 下一章節**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 簡介

本綜合指南將引導你在系統上安裝和配置 Azure Developer CLI (azd)。你將學習不同作業系統的多種安裝方式、驗證設定以及初始配置，以準備你的開發環境進行 Azure 部署。

## 學習目標

完成本課後，你將會：
- 在你的作業系統上成功安裝 Azure Developer CLI
- 使用多種方法配置與 Azure 的驗證
- 設定開發環境所需的先決條件
- 了解不同安裝選項以及何時使用各種方法
- 故障排解常見的安裝與設定問題

## 學習成果

完成本課程後，你將能夠：
- 使用適合你平台的方法安裝 azd
- 使用 `azd auth login` 與 Azure 進行驗證
- 驗證安裝並測試基本的 azd 指令
- 為最佳的 azd 使用配置你的開發環境
- 能夠獨立解決常見的安裝問題

本指南將協助你在任何作業系統或開發環境上安裝與配置 Azure Developer CLI。

## 先決條件

在安裝 azd 之前，請確保你已具備：
- **Azure 訂閱** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於驗證與資源管理
- **Git** - 用於複製範本與版本控制
- **Docker**（可選）- 用於容器化應用程式

## 安裝方法

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# 當 winget 不可用時有用
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. 從 [GitHub](https://github.com/Azure/azure-dev/releases) 下載最新版本
2. 解壓到 `C:\Program Files\azd\`
3. 加入到 PATH 環境變數

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# 下載並安裝
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# 從以下位置下載適用於你的 Linux 架構的最新封存檔：
# https://github.com/Azure/azure-dev/releases
# 然後解壓縮它，並將 azd 可執行檔加入你的 PATH。
```

### GitHub Codespaces

某些 Codespaces 和開發容器環境已包含 `azd`，但你應該確認是否存在，而不是假設：

```bash
azd version
```

如果系統缺少 `azd`，請使用該環境的標準腳本安裝。

### Docker

```bash
# 在容器內執行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 建立別名以便更方便使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝後，請驗證 azd 是否正常運作：

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

<strong>注意</strong>: 實際版本號會有所不同。請參閱 [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) 以取得最新版本。

**✅ 安裝成功檢查清單：**
- [ ] `azd version` 顯示版本號且無錯誤
- [ ] `azd --help` 顯示指令文件
- [ ] `azd template list` 顯示可用範本
- [ ] 你可以建立測試目錄並成功執行 `azd init`

**如果所有檢查都通過，你就可以前往 [Your First Project](first-project.md)！**

## 驗證設定

### 建議的初學者設定

對於以 AZD 為主的工作流程，請使用 `azd auth login` 登入。

```bash
# 為執行例如 azd up 這類的 AZD 指令所需
azd auth login

# 驗證 AZD 的認證狀態
azd auth login --check-status
```

只有在你打算在課程中自行執行 `az` 指令時，才使用 Azure CLI 登入。

### Azure CLI 驗證（可選）
```bash
# 如未安裝 Azure CLI，請先安裝
# Windows: 使用 winget install Microsoft.AzureCLI
# macOS: 使用 brew install azure-cli
# Linux: 請參閱適用於你的發行版的 Azure CLI 安裝說明文件

# 登入 Azure
az login

# 驗證身分
az account show
```

### 應該使用哪種登入流程？

- 如果你遵循初學者的 AZD 路徑，並主要執行 `azd` 指令，請使用 `azd auth login`。
- 如果你也想執行 Azure CLI 指令（例如 `az account show`）或直接檢查資源，請同時使用 `az login`。
- 如果練習中同時包含 `azd` 與 `az` 指令，請在開始時各執行一次這兩個登入指令。

### 裝置碼驗證
如果你在無頭系統或遇到瀏覽器問題：
```bash
azd auth login --use-device-code
```

### 服務主體（CI/CD）
針對自動化環境：
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### 驗證你的完整設定

如果你想在開始第 1 章前做快速就緒檢查：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## 設定

### 全域設定
```bash
# 設定預設訂閱
azd config set defaults.subscription <subscription-id>

# 設定預設位置
azd config set defaults.location eastus2

# 檢視所有設定
azd config show
```

### 環境變數
加入你的 shell 設定檔（`.bashrc`, `.zshrc`, `.profile`）：
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
安裝 Azure Developer CLI 延伸功能：
1. 開啟 VS Code
2. 前往 Extensions (Ctrl+Shift+X)
3. 搜尋 "Azure Developer CLI"
4. 安裝該延伸功能

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
2. 配置 Azure 認證
3. 在整合終端機使用 azd 指令

## 🐛 安裝疑難排解

### 常見問題

#### 權限被拒（Windows）
```powershell
# 以管理員身份執行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動將 azd 加入你的 PATH：

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
# 設定代理
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳過 SSL 驗證（不建議在生產環境使用）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊有安裝
# Windows: 執行 winget uninstall microsoft.azd
# macOS: 執行 brew uninstall azd
# Linux: 在重新安裝前移除舊的 azd 執行檔或符號連結

# 清除設定
rm -rf ~/.azd
```

### 取得更多協助
```bash
# 啟用偵錯日誌
export AZD_DEBUG=true
azd <command> --debug

# 檢視目前設定
azd config show

# 檢視目前部署狀態
azd show
```

## 更新 azd

### 檢查更新
azd 在有較新版本可用時會發出警告，你可以使用以下指令確認目前的 build：
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

**Azure CLI (az)**：用於管理單一 Azure 資源的低階工具
- `az webapp create`、`az storage account create`
- 一次處理一個資源
- 著重於基礎設施管理

**Azure Developer CLI (azd)**：用於完整應用程式部署的高階工具
- `azd up` 部署整個應用程式與所有資源
- 範本化工作流程
- 著重開發者生產力

<strong>你兩者都需要</strong>：azd 在驗證上會使用 az CLI
</details>

<details>
<summary><strong>我可以在現有的 Azure 資源上使用 azd 嗎？</strong></summary>

可以！你可以：
1. 將現有資源匯入 azd 環境
2. 在你的 Bicep 範本中參考現有資源
3. 在現有基礎架構旁使用 azd 進行新的部署

請參閱 [設定指南](configuration.md) 以取得詳細資料。
</details>

<details>
<summary><strong>azd 是否適用於 Azure Government 或 Azure China？</strong></summary>

可以，請配置雲端：
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

絕對可以！azd 是為自動化設計的：
- GitHub Actions 整合
- 支援 Azure DevOps
- 服務主體驗證
- 非互動模式

請參閱 [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) 以了解 CI/CD 範例。
</details>

<details>
<summary><strong>使用 azd 的費用是多少？</strong></summary>

azd 本身<strong>完全免費</strong>且為開源。你只需要支付：
- 你部署的 Azure 資源費用
- Azure 的消耗成本（運算、儲存等）

使用 `azd provision --preview` 在部署前估算費用。
</details>

## 下一步

1. <strong>完成驗證</strong>：確保你可以存取你的 Azure 訂閱
2. <strong>嘗試你的第一次部署</strong>：參考 [First Project Guide](first-project.md)
3. <strong>探索範本</strong>：使用 `azd template list` 瀏覽可用範本
4. **配置你的 IDE**：設定你的開發環境

## 支援

如果你遇到問題：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [回報問題](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)
- [**Azure Agent 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在你的編輯器中直接取得 Azure 指令指引，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽：**
- **📚 課程主頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: 第 1 章 - 基礎與快速上手
- **⬅️ 上一章**: [AZD Basics](azd-basics.md) 
- **➡️ 下一章**: [Your First Project](first-project.md)
- **🚀 下一章節**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 已完成安裝！** 繼續前往 [Your First Project](first-project.md) 開始使用 azd 建置。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們雖致力於追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具權威性的來源。若涉及重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯而導致的任何誤解或誤釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->