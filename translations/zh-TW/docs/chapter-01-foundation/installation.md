# 安裝與設定指南

**章節導航:**
- **📚 課程首頁**：[AZD 初學者](../../README.md)
- **📖 當前章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[AZD 基礎](azd-basics.md)
- **➡️ 下一章**：[你的第一個專案](first-project.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合指南將帶你逐步安裝及配置 Azure Developer CLI（azd）於你的系統。你將學到多種適用於不同作業系統的安裝方式、認證設定，以及初始配置，準備好你的開發環境以進行 Azure 部署。

## 學習目標

完成此課程後，你將能：
- 成功於作業系統上安裝 Azure Developer CLI
- 透過多種方式設定 Azure 認證
- 建置具備必要前置作業之開發環境
- 瞭解不同安裝選項及其適用時機
- 排解常見安裝與設定問題

## 學習成效

完成課程後，你將能夠：
- 使用適當的方法安裝 azd
- 透過 `azd auth login` 進行與 Azure 的認證
- 驗證安裝並測試基本的 azd 指令
- 配置開發環境以最佳化 azd 使用
- 獨立解決常見安裝問題

本指南將協助你無論使用何種作業系統或開發環境，都能安裝及設定 Azure Developer CLI。

## 前置需求

安裝 azd 前，請確定你已具備：
- **Azure 訂閱** - [建立免費帳號](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於認證與資源管理
- **Git** - 用於複製範本與版本控管
- **Docker**（選用）- 用於容器化應用程式

## 安裝方法

### Windows

#### 選項 1：Windows 套件管理員（推薦）
```cmd
winget install microsoft.azd
```

#### 選項 2：PowerShell 安裝腳本
```powershell
# 當 winget 無法使用時很有用
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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
# 下載並安裝
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 選項 1：安裝腳本（推薦）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 選項 2：套件管理器

**從發行資產手動安裝：**
```bash
# 從以下位置下載適用於您 Linux 架構的最新壓縮檔：
# https://github.com/Azure/azure-dev/releases
# 然後解壓縮並將 azd 執行檔加入您的 PATH 中。
```

### GitHub Codespaces

部分 Codespaces 與開發容器環境已內建 `azd`，但仍建議確認而非假設此狀況：

```bash
azd version
```

若缺少 `azd`，請使用環境適用的標準腳本安裝。

### Docker

```bash
# 在容器中執行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 建立別名以便於使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝完成後，請確認 azd 運作正常：

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

<strong>注意</strong>：實際版本號會有所不同。請參考 [Azure Developer CLI 版本發行](https://github.com/Azure/azure-dev/releases) 以取得最新版本。

**✅ 安裝完成檢查清單：**
- [ ] `azd version` 顯示版本號且無錯誤
- [ ] `azd --help` 顯示指令說明
- [ ] `azd template list` 顯示可用範本
- [ ] 可建立測試資料夾並成功執行 `azd init`

**請確保皆合格後，再繼續前往 [你的第一個專案](first-project.md)！**

## 認證設定

### 推薦的初學者設定

對於 AZD 為主的工作流程，請使用 `azd auth login` 登入。

```bash
# AZD 命令（例如 azd up）所需
azd auth login

# 驗證 AZD 認證狀態
azd auth login --check-status
```

只有當你計劃在課程中自行執行 `az` 指令時，才使用 Azure CLI 登入。

### Azure CLI 認證（選用）
```bash
# 如果尚未安裝，請安裝 Azure CLI
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: 請參考您發行版本的 Azure CLI 安裝文件

# 登入 Azure
az login

# 驗證身份驗證
az account show
```

### 該使用哪種登入流程？

- 若你跟隨初學者的 AZD 路徑，且主要使用 `azd` 指令，請使用 `azd auth login`。
- 想直接執行 Azure CLI 指令（如 `az account show`）或檢視資源，也可同時使用 `az login`。
- 若任務同時包含 `azd` 與 `az` 指令，請在開始時各執行一次登入指令。

### 裝置代碼認證
若你使用無頭系統或瀏覽器有問題：
```bash
azd auth login --use-device-code
```

### 服務主體（CI/CD）
適用於自動化環境：
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### 驗證完整設置

想在開始第 1 章前快速檢查準備狀態：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## 配置

### 全域設定
```bash
# 設定預設訂閱
azd config set defaults.subscription <subscription-id>

# 設定預設位置
azd config set defaults.location eastus2

# 查看所有設定
azd config show
```

### 環境變數
加入至你的 shell 設定檔 (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure 設定
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 設定
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 啟用除錯日誌記錄
```

## IDE 整合

### Visual Studio Code
安裝 Azure Developer CLI 擴充套件：
1. 開啟 VS Code
2. 前往擴充套件（Ctrl+Shift+X）
3. 搜尋「Azure Developer CLI」
4. 安裝套件

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
1. 安裝 Azure 插件
2. 設定 Azure 認證
3. 使用內建終端機執行 azd 指令

## 🐛 安裝問題排解

### 常見問題

#### 權限被拒（Windows）
```powershell
# 以系統管理員身分執行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動將 azd 加入 PATH：

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

# 跳過 SSL 驗證（不建議用於生產環境）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊的安裝
# Windows: winget 卸載 microsoft.azd
# macOS: brew 卸載 azd
# Linux: 重新安裝前請先移除之前的 azd 執行檔或符號連結

# 清理設定
rm -rf ~/.azd
```

### 尋求更多協助
```bash
# 啟用除錯記錄
export AZD_DEBUG=true
azd <command> --debug

# 查看目前設定
azd config show

# 查看目前部署狀態
azd show
```

## 更新 azd

### 更新檢查
當有新版發布時，azd 會提示，並可確認當前版本：
```bash
azd version
```

### 手動更新

**Windows（winget）：**
```cmd
winget upgrade microsoft.azd
```

**macOS（Homebrew）：**
```bash
brew upgrade azd
```

**Linux：**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 常見問題

<details>
<summary><strong>azd 與 az CLI 有什麼差別？</strong></summary>

**Azure CLI (az)**：管理單一 Azure 資源的底層工具
- `az webapp create`、`az storage account create`
- 每次操作一個資源
- 著重於基礎架構管理

**Azure Developer CLI (azd)**：針對完整應用部署的高階工具
- `azd up` 部署整個應用及所有資源
- 以範本驅動的工作流程
- 聚焦開發者生產力

<strong>兩者皆需</strong>：azd 使用 az CLI 做認證
</details>

<details>
<summary><strong>我可以用 azd 管理既有的 Azure 資源嗎？</strong></summary>

可以！你能：
1. 將既有資源匯入 azd 環境
2. 在 Bicep 範本中參考既有資源
3. 與既有基礎架構併用 azd 進行新部署

詳見[配置指南](configuration.md)。
</details>

<details>
<summary><strong>azd 支援 Azure Government 或 Azure China 嗎？</strong></summary>

支援，請設定雲端環境：
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
<summary><strong>azd 可以用在 CI/CD 管線中嗎？</strong></summary>

完全可以！azd 為自動化設計：
- 支援 GitHub Actions
- 支援 Azure DevOps
- 服務主體認證
- 非互動模式

詳見[部署指南](../chapter-04-infrastructure/deployment-guide.md)了解 CI/CD 模式。
</details>

<details>
<summary><strong>使用 azd 會產生費用嗎？</strong></summary>

azd 本身為 <strong>完全免費</strong> 且開源。你僅需支付：
- 你部署的 Azure 資源費用
- Azure 消耗成本（計算、儲存等）

部署前可使用 `azd provision --preview` 估算費用。
</details>

## 下一步

1. <strong>完成認證</strong>：確保你能存取 Azure 訂閱
2. <strong>嘗試首次部署</strong>：參考 [第一個專案指南](first-project.md)
3. <strong>探索範本</strong>：使用 `azd template list` 瀏覽範本
4. **設定 IDE**：建置開發環境

## 支援

遇到問題時：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [問題回報](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)
- [**Azure Agent 技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在你的編輯器內直接獲得 Azure 指令導引，透過 `npx skills add microsoft/github-copilot-for-azure`

---

**章節導航:**
- **📚 課程首頁**：[AZD 初學者](../../README.md)
- **📖 當前章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[AZD 基礎](azd-basics.md)
- **➡️ 下一章**：[你的第一個專案](first-project.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安裝完成！** 請繼續前往 [你的第一個專案](first-project.md) 開始使用 azd 建置你的專案。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於保持準確性，但請注意，機器翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威資料。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用本翻譯而產生的任何誤解或曲解概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->