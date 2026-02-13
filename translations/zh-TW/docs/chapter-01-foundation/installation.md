# 安裝與設定指南

**章節導覽:**
- **📚 課程首頁**: [AZD 新手指南](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一節**: [AZD 基礎](azd-basics.md)
- **➡️ 下一節**: [你的第一個專案](first-project.md)
- **🚀 下一章**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合指南將引導你在系統上安裝並設定 Azure Developer CLI (azd)。你將學到針對不同作業系統的多種安裝方法、驗證設定，以及準備開發環境以便進行 Azure 部署的初始設定。

## 學習目標

在本課結束時，你將能夠：
- 在你的作業系統上成功安裝 Azure Developer CLI
- 使用多種方法設定與 Azure 的驗證
- 為開發環境安裝必要的前置需求
- 了解不同的安裝選項以及何時使用各種方法
- 排解常見的安裝與設定問題

## 學習成果

完成本課程後，你將能夠：
- 使用適合你平台的方法安裝 azd
- 使用 `azd auth login` 與 Azure 進行驗證
- 驗證你的安裝並測試基礎的 azd 指令
- 為最佳化 azd 使用配置你的開發環境
- 獨立解決常見的安裝問題

本指南將協助你在任何作業系統或開發環境中安裝並設定 Azure Developer CLI。

## 先決條件

在安裝 azd 之前，請確保你擁有：
- **Azure 訂閱** - [建立免費帳戶](https://azure.microsoft.com/free/)
- **Azure CLI** - 用於驗證與資源管理
- **Git** - 用於克隆範本與版本控制
- **Docker**（可選） - 用於容器化的應用程式

## 安裝方式

### Windows

#### 選項 1：PowerShell（建議）
```powershell
# 以系統管理員身分或以提升的權限執行
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
3. 加入到 PATH 環境變數

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

#### 選項 2：套件管理員

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
# 新增 Microsoft 套件存放庫
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd 已預先安裝於 GitHub Codespaces 中。只需建立一個 codespace 即可立即開始使用 azd。

### Docker

```bash
# 在容器中執行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 建立別名以方便使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 驗證安裝

安裝完成後，確認 azd 是否運作正常：

```bash
# 檢查版本
azd version

# 檢視說明
azd --help

# 列出可用的範本
azd template list
```

預期輸出：
```
azd version 1.x.x (commit xxxxxx)
```

**注意**：實際的版本號會有所不同。請查看 [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) 以取得最新版本。

**✅ 安裝成功檢查表:**
- [ ] `azd version` 顯示版本號且沒有錯誤
- [ ] `azd --help` 顯示指令說明
- [ ] `azd template list` 顯示可用的範本
- [ ] `az account show` 顯示你的 Azure 訂閱
- [ ] 你可以建立測試目錄並成功執行 `azd init`

**如果所有檢查都通過，你就可以前往 [你的第一個專案](first-project.md)！**

## 驗證設定

### Azure CLI 驗證（建議）
```bash
# 若尚未安裝 Azure CLI，請安裝
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 登入 Azure
az login

# 確認驗證狀態
az account show
```

### 裝置代碼驗證
如果你在無介面系統或遇到瀏覽器問題：
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
將其加入你的 shell 設定檔（`.bashrc`, `.zshrc`, `.profile`）：
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
2. 前往 Extensions（Ctrl+Shift+X）
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
2. 設定 Azure 憑證
3. 在整合終端機中使用 azd 指令

## 🐛 疑難排解

### 常見問題

#### 權限被拒（Windows）
```powershell
# 以系統管理員身分執行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 問題
手動將 azd 新增到你的 PATH：

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
# 設定代理伺服器
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳過 SSL 驗證（不建議在生產環境中使用）
azd config set http.insecure true
```

#### 版本衝突
```bash
# 移除舊版安裝
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# 清除設定
rm -rf ~/.azd
```

### 取得更多協助
```bash
# 啟用偵錯紀錄
export AZD_DEBUG=true
azd <command> --debug

# 檢視目前設定
azd config list

# 檢視目前部署狀態
azd show
```

## 更新 azd

### 自動更新
azd 會在有更新時通知你：
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

## 💡 常見問答

<details>
<summary><strong>azd 和 az CLI 有何不同？</strong></summary>

**Azure CLI (az)**：用於管理單一 Azure 資源的低階工具
- `az webapp create`、`az storage account create`
- 一次處理單一資源
- 著重於基礎設施管理

**Azure Developer CLI (azd)**：用於完整應用程式部署的高階工具
- `azd up` 部署包含所有資源的整個應用程式
- 以範本為基礎的工作流程
- 著重於開發者生產力

**你需要兩者**：azd 在驗證上會使用 az CLI
</details>

<details>
<summary><strong>我可以在既有的 Azure 資源上使用 azd 嗎？</strong></summary>

可以！你可以：
1. 將既有資源匯入到 azd 環境
2. 在你的 Bicep 範本中參考既有資源
3. 與既有基礎設施併行使用 azd 進行新部署

請參閱 [設定指南](configuration.md) 以取得詳細資訊。
</details>

<details>
<summary><strong>azd 能在 Azure Government 或 Azure China 上運作嗎？</strong></summary>

可以，請設定對應的 cloud：
```bash
# Azure 政府版
az cloud set --name AzureUSGovernment
az login

# Azure 中國版
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>我可以在 CI/CD 管線中使用 azd 嗎？</strong></summary>

當然可以！azd 是為自動化而設計：
- 與 GitHub Actions 整合
- 支援 Azure DevOps
- 服務主體驗證
- 非互動模式

請參閱 [部署指南](../chapter-04-infrastructure/deployment-guide.md) 了解 CI/CD 模式。
</details>

<details>
<summary><strong>使用 azd 的成本是多少？</strong></summary>

azd 本身是**完全免費**且開源的。你只需支付：
- 你部署的 Azure 資源費用
- Azure 的使用量（運算、儲存等）費用

使用 `azd provision --preview` 在部署前估算成本。
</details>

## 下一步

1. **完成驗證**：確保你可以存取你的 Azure 訂閱
2. **嘗試你的第一次部署**：請參閱 [第一個專案指南](first-project.md)
3. **探索範本**：使用 `azd template list` 瀏覽可用範本
4. **設定你的 IDE**：建立你的開發環境

## 支援

如果你遇到問題：
- [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [回報問題](https://github.com/Azure/azure-dev/issues)
- [社群討論](https://github.com/Azure/azure-dev/discussions)
- [Azure 支援](https://azure.microsoft.com/support/)

---

**章節導覽:**
- **📚 課程首頁**: [AZD 新手指南](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一節**: [AZD 基礎](azd-basics.md) 
- **➡️ 下一節**: [你的第一個專案](first-project.md)
- **🚀 下一章**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安裝完成！** 繼續前往 [你的第一個專案](first-project.md) 開始使用 azd 建置。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而導致的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->