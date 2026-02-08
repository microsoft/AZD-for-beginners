# AZD Basics - 了解 Azure Developer CLI

# AZD Basics - 核心概念與基礎

**Chapter Navigation:**
- **📚 課程主頁**: [AZD For Beginners](../../README.md)
- **📖 當前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一節**: [課程概覽](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 下一節**: [安裝與設定](installation.md)
- **🚀 下一章**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本課程介紹 Azure Developer CLI (azd)，一個強大的命令列工具，可加速您從本地開發到 Azure 部署的流程。您將學習基本概念、核心功能，並了解 azd 如何簡化雲端原生應用程式的部署。

## 學習目標

完成本課程後，您將能夠：
- 了解 Azure Developer CLI 是什麼以及其主要用途
- 瞭解範本、環境與服務的核心概念
- 探索包括範本驅動開發與基礎設施即程式碼在內的主要功能
- 了解 azd 專案結構與工作流程
- 準備安裝並為您的開發環境設定 azd

## 學習成果

完成本課程後，您將能夠：
- 解釋 azd 在現代雲端開發工作流程中的角色
- 辨識 azd 專案結構的組成部分
- 描述範本、環境與服務如何協同運作
- 了解使用 azd 的基礎設施即程式碼的優點
- 辨認不同 azd 命令及其用途

## 什麼是 Azure Developer CLI (azd)？

Azure Developer CLI (azd) 是一個命令列工具，旨在加速您從本地開發到 Azure 部署的流程。它簡化了在 Azure 上建立、部署與管理雲端原生應用程式的過程。

### 🎯 為什麼使用 AZD？實務比較

以下比較部署一個有資料庫的簡單 Web 應用：

#### ❌ 沒有 AZD：手動 Azure 部署（30 分鐘以上）

```bash
# 步驟 1：建立資源群組
az group create --name myapp-rg --location eastus

# 步驟 2：建立 App Service 計劃
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# 步驟 3：建立 Web 應用程式
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# 步驟 4：建立 Cosmos DB 帳戶（10-15 分鐘）
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# 步驟 5：建立資料庫
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# 步驟 6：建立集合
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# 步驟 7：取得連線字串
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# 步驟 8：設定應用程式設定
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# 步驟 9：啟用記錄
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# 步驟 10：設定 Application Insights
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# 步驟 11：將 App Insights 連結到 Web 應用程式
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# 步驟 12：在本機建置應用程式
npm install
npm run build

# 步驟 13：建立部署套件
zip -r app.zip . -x "*.git*" "node_modules/*"

# 步驟 14：部署應用程式
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# 步驟 15：等待並祈禱它能運作 🙏
# （沒有自動化驗證，需要手動測試）
```

**問題：**
- ❌ 需要記住並按順序執行 15 個以上的命令
- ❌ 30-45 分鐘的手動工作
- ❌ 容易出錯（打字錯誤、參數錯誤）
- ❌ 連線字串會暴露在終端機歷史中
- ❌ 若發生失敗沒有自動回滾
- ❌ 因團隊成員複製困難
- ❌ 每次都不同（不可重現）

#### ✅ 使用 AZD：自動化佈署（5 個命令，10-15 分鐘）

```bash
# 第 1 步：從範本初始化
azd init --template todo-nodejs-mongo

# 第 2 步：驗證
azd auth login

# 第 3 步：建立環境
azd env new dev

# 第 4 步：預覽變更（可選，但建議執行）
azd provision --preview

# 第 5 步：部署所有項目
azd up

# ✨ 完成！所有項目已部署、配置並受監控
```

**好處：**
- ✅ **5 個命令** vs. 15+ 手動步驟
- ✅ **10-15 分鐘** 完成（大部分時間在等待 Azure）
- ✅ **零錯誤** - 自動化且經過測試
- ✅ **機密安全管理**，透過 Key Vault 管理
- ✅ **失敗自動回滾**
- ✅ **完全可重現** - 每次結果相同
- ✅ **團隊就緒** - 任何人都能使用相同命令部署
- ✅ **基礎設施即程式碼** - Bicep 範本受版本控制
- ✅ **內建監控** - 自動設定 Application Insights

### 📊 時間與錯誤減少

| 指標 | 手動部署 | AZD 部署 | 改善 |
|:-------|:------------------|:---------------|:------------|
| **命令數** | 15+ | 5 | 減少 67% |
| **時間** | 30-45 min | 10-15 min | 快 60% |
| **錯誤率** | ~40% | <5% | 減少 88% |
| **一致性** | 低（手動） | 100%（自動） | 完美 |
| **團隊上手時間** | 2-4 hours | 30 minutes | 快 75% |
| **回滾時間** | 30+ min（手動） | 2 min（自動） | 快 93% |

## 核心概念

### 範本
範本是 azd 的基礎。它們包含：
- **應用程式程式碼** - 您的原始程式碼與相依性
- **基礎設施定義** - 以 Bicep 或 Terraform 定義的 Azure 資源
- **設定檔** - 設定與環境變數
- **部署腳本** - 自動化部署流程

### 環境
環境代表不同的部署目標：
- **開發** - 用於測試與開發
- **暫存（Staging）** - 預生產環境
- **生產** - 實際生產環境

每個環境會維持其各自的：
- Azure 資源群組
- 設定值
- 部署狀態

### 服務
服務是應用程式的構建單元：
- **前端** - 網頁應用程式、單頁應用（SPA）
- **後端** - API、微服務
- **資料庫** - 資料儲存解決方案
- **儲存** - 檔案與 Blob 儲存

## 主要功能

### 1. 範本驅動的開發
```bash
# 瀏覽可用範本
azd template list

# 從範本初始化
azd init --template <template-name>
```

### 2. 基礎設施即程式碼
- **Bicep** - Azure 的領域特定語言
- **Terraform** - 多雲端基礎設施工具
- **ARM Templates** - Azure 資源管理員模板

### 3. 整合化工作流程
```bash
# 完整的部署工作流程
azd up            # 配置與部署：首次設定可無需人工操作

# 🧪 新功能：在部署前預覽基礎設施變更（安全）
azd provision --preview    # 模擬基礎設施部署而不進行變更

azd provision     # 建立 Azure 資源：如要更新基礎設施，請使用此項
azd deploy        # 部署應用程式代碼，或在更新後重新部署應用程式代碼
azd down          # 清理資源
```

#### 🛡️ 使用預覽進行安全的基礎設施規劃
`azd provision --preview` 命令對於安全佈署來說是個改變遊戲規則的工具：
- **模擬執行分析** - 顯示將會建立、修改或刪除的項目
- **零風險** - 不會對您的 Azure 環境做出實際更動
- **團隊協作** - 在佈署前分享預覽結果
- **成本估算** - 在承諾之前了解資源成本

```bash
# 範例預覽工作流程
azd provision --preview           # 檢視將會更改的內容
# 檢閱輸出，與團隊討論
azd provision                     # 放心套用更改
```

### 📊 視覺化：AZD 開發工作流程

```mermaid
graph LR
    A[azd init] -->|初始化專案| B[azd auth login]
    B -->|驗證| C[azd env new]
    C -->|建立環境| D{第一次部署？}
    D -->|是| E[azd up]
    D -->|否| F[azd provision --preview]
    F -->|檢閱變更| G[azd provision]
    E -->|配置並部署| H[資源運行中]
    G -->|更新基礎架構| H
    H -->|監控| I[azd monitor]
    I -->|進行程式碼變更| J[azd deploy]
    J -->|僅重新部署程式碼| H
    H -->|清理| K[azd down]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```
**工作流程說明：**
1. **初始化** - 從範本或新專案開始
2. **驗證** - 與 Azure 進行驗證
3. **環境** - 建立隔離的部署環境
4. **預覽** - 🆕 始終先預覽基礎設施變更（安全作法）
5. **Provision** - 建立/更新 Azure 資源
6. **部署** - 推送您的應用程式程式碼
7. **監控** - 觀察應用程式效能
8. **迭代** - 進行變更並重新部署程式碼
9. **清除** - 完成後移除資源

### 4. 環境管理
```bash
# 建立及管理環境
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 專案結構

典型的 azd 專案結構：
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 設定檔

### azure.yaml
主要的專案設定檔：
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
環境專屬設定：
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 常見工作流程與實作練習

> **💡 學習小提示：** 按順序完成這些練習，以逐步建立您的 AZD 技能。

### 🎯 練習 1：初始化您的第一個專案

**目標：** 創建一個 AZD 專案並探索其結構

**步驟：**
```bash
# 使用已被驗證的範本
azd init --template todo-nodejs-mongo

# 探索已產生的檔案
ls -la  # 查看所有檔案，包括隱藏檔案

# 已建立的關鍵檔案:
# - azure.yaml (主要設定)
# - infra/ (基礎架構程式碼)
# - src/ (應用程式原始碼)
```

**✅ 完成：** 您將擁有 azure.yaml、infra/ 與 src/ 目錄

---

### 🎯 練習 2：部署到 Azure

**目標：** 完成端到端部署

**步驟：**
```bash
# 1. 驗證
az login && azd auth login

# 2. 建立環境
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. 預覽變更（建議）
azd provision --preview

# 4. 部署所有內容
azd up

# 5. 驗證部署
azd show    # 檢視你的應用程式網址
```

**預期時間：** 10-15 分鐘  
**✅ 完成：** 應用程式 URL 在瀏覽器中開啟

---

### 🎯 練習 3：多個環境

**目標：** 部署到 dev 與 staging

**步驟：**
```bash
# 已經有 dev，建立 staging
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# 在兩者之間切換
azd env list
azd env select dev
```

**✅ 完成：** 在 Azure 入口網站有兩個獨立的資源群組

---

### 🛡️ 清除重設：`azd down --force --purge`

當您需要完全重設時：

```bash
azd down --force --purge
```

**功能說明：**
- `--force`：不會有確認提示
- `--purge`：刪除所有本地狀態與 Azure 資源

**何時使用：**
- 部署中途失敗
- 切換專案時
- 需要重新開始

---

## 🎪 原始工作流程參考

### 開始一個新專案
```bash
# 方法 1：使用現有範本
azd init --template todo-nodejs-mongo

# 方法 2：從頭開始
azd init

# 方法 3：使用目前目錄
azd init .
```

### 開發週期
```bash
# 設定開發環境
azd auth login
azd env new dev
azd env select dev

# 部署全部資源
azd up

# 作出更改並重新部署
azd deploy

# 完成後清理
azd down --force --purge # Azure Developer CLI 中的這個命令是對你的環境做一次**硬重置**—在你排查部署失敗、清理孤立資源或準備全新重新部署時尤其有用。
```

## 了解 `azd down --force --purge`
`azd down --force --purge` 命令是完全拆除您的 azd 環境與所有相關資源的強大方式。以下是每個旗標的作用說明：
```
--force
```
- 跳過確認提示。
- 適用於自動化或腳本化，當人工輸入不可行時。
- 確保拆除程序不中斷，即使 CLI 偵測到不一致性。

```
--purge
```
刪除**所有相關的元資料**，包括：
Environment state
Local `.azure` folder
Cached deployment info
Prevents azd from "remembering" previous deployments, which can cause issues like mismatched resource groups or stale registry references.


### 為什麼兩者都用？
當您因為殘留狀態或部分部署而在使用 `azd up` 時卡住，這組合可以確保得到一個**乾淨的起始點**。

在您已經在 Azure 入口網站手動刪除資源，或切換範本、環境或資源群組命名慣例時，這尤其有幫助。


### 管理多個環境
```bash
# 建立暫存環境
azd env new staging
azd env select staging
azd up

# 切換回開發環境
azd env select dev

# 比較各環境
azd env list
```

## 🔐 認證與憑證

理解認證對於成功的 azd 部署至關重要。Azure 使用多種認證方法，而 azd 採用與其他 Azure 工具相同的憑證鏈。

### Azure CLI 認證（`az login`）

在使用 azd 之前，您需要先向 Azure 驗證。最常見的方法是使用 Azure CLI：

```bash
# 互動式登入（會開啟瀏覽器）
az login

# 以指定租戶登入
az login --tenant <tenant-id>

# 以服務主體登入
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# 檢查目前登入狀態
az account show

# 列出可用訂閱
az account list --output table

# 設定預設訂閱
az account set --subscription <subscription-id>
```

### 認證流程
1. **互動式登入**：會在預設瀏覽器中開啟以進行驗證
2. **裝置代碼流程**：適用於沒有瀏覽器存取的環境
3. **服務主體**：用於自動化與 CI/CD 場景
4. **託管識別**：用於在 Azure 上執行的應用程式

### DefaultAzureCredential 憑證鏈

`DefaultAzureCredential` 是一種類型的憑證，透過自動以特定順序嘗試多種憑證來源，提供簡化的認證體驗：

#### 憑證鏈順序
```mermaid
graph TD
    A[預設 Azure 認證] --> B[環境變數]
    B --> C[工作負載身分]
    C --> D[受管理的身分]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[互動式瀏覽器]
```
#### 1. 環境變數
```bash
# 為服務主體設定環境變數
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. 工作負載識別（Kubernetes/GitHub Actions）
自動使用於：
- 在啟用工作負載識別的 Azure Kubernetes Service (AKS)
- 使用 OIDC 聯邦的 GitHub Actions
- 其他聯邦身份情境

#### 3. 託管識別
用於下列 Azure 資源：
- 虛擬機器
- App Service
- Azure Functions
- Container Instances

```bash
# 檢查是否在具備託管身分的 Azure 資源上執行
az account show --query "user.type" --output tsv
# 回傳：若使用託管身分則為「servicePrincipal」
```

#### 4. 開發工具整合
- **Visual Studio**：自動使用已登入帳戶
- **VS Code**：使用 Azure Account 擴充的憑證
- **Azure CLI**：使用 `az login` 憑證（本地開發最常用）

### AZD 認證設定

```bash
# 方法 1：使用 Azure CLI（建議於開發時使用）
az login
azd auth login  # 使用現有的 Azure CLI 認證

# 方法 2：直接使用 azd 進行認證
azd auth login --use-device-code  # 適用於無頭環境

# 方法 3：檢查認證狀態
azd auth login --check-status

# 方法 4：登出並重新認證
azd auth logout
azd auth login
```

### 認證最佳實務

#### 本地開發
```bash
# 1. 使用 Azure CLI 登入
az login

# 2. 確認訂閱是否正確
az account show
az account set --subscription "Your Subscription Name"

# 3. 以現有認證使用 azd
azd auth login
```

#### CI/CD 管線
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### 針對生產環境
- 在 Azure 資源上執行時使用 **託管識別**
- 在自動化場景中使用 **服務主體**
- 避免將憑證儲存在程式碼或設定檔中
- 對於敏感設定使用 **Azure Key Vault**

### 常見認證問題與解決方案

#### 問題：「找不到訂閱」
```bash
# 解決方法：設定預設訂閱
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### 問題：「權限不足」
```bash
# 解決方法：檢查並指派所需角色
az role assignment list --assignee $(az account show --query user.name --output tsv)

# 常見所需角色：
# - Contributor (用於資源管理)
# - User Access Administrator (用於角色指派)
```

#### 問題：「權杖過期」
```bash
# 解決方法：重新驗證
az logout
az login
azd auth logout
azd auth login
```

### 不同情境下的認證

#### 本地開發
```bash
# 個人發展戶口
az login
azd auth login
```

#### 團隊開發
```bash
# 為組織使用特定租戶
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### 多租戶情境
```bash
# 在租戶之間切換
az login --tenant tenant1.onmicrosoft.com
# 部署到租戶 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# 部署到租戶 2
azd up
```

### 安全性考量

1. **憑證儲存**：切勿在原始程式碼中儲存憑證
2. **範圍限制**：對服務主體採取最小權限原則
3. **憑證輪換**：定期輪換服務主體密鑰
4. **稽核追蹤**：監控認證與部署活動
5. **網路安全**：盡量使用私有端點

### 排解認證問題

```bash
# 除錯認證問題
azd auth login --check-status
az account show
az account get-access-token

# 常用診斷指令
whoami                          # 當前使用者上下文
az ad signed-in-user show      # Azure AD 使用者詳細資料
az group list                  # 測試資源存取
```

## 了解 `azd down --force --purge`

### 偵測
```bash
azd template list              # 瀏覽範本
azd template show <template>   # 範本詳情
azd init --help               # 初始化選項
```

### 專案管理
```bash
azd show                     # 項目概覽
azd env show                 # 目前環境
azd config list             # 配置設定
```

### 監控
```bash
azd monitor                  # 開啟 Azure 入口網站的監控
azd monitor --logs           # 檢視應用程式日誌
azd monitor --live           # 檢視即時指標
azd pipeline config          # 設定 CI/CD
```

## 最佳實務

### 1. 使用有意義的名稱
```bash
# 好
azd env new production-east
azd init --template web-app-secure

# 避免
azd env new env1
azd init --template template1
```

### 2. 利用範本
- 從現有範本開始
- 依需求客製化
- 為組織建立可重用的範本

### 3. 環境隔離
- 為 dev/staging/prod 使用獨立環境
- 切勿從本地機器直接部署到生產
- 對生產部署使用 CI/CD 管線

### 4. 設定管理
- 對敏感資料使用環境變數
- 將設定保存在版本控制中
- 記錄環境專屬設定

## 學習進度

### 初學者（第 1-2 週）
1. 安裝 azd 並驗證
2. 部署簡單範本
3. 了解專案結構
4. 學習基本命令（up、down、deploy）

### 中階（第 3-4 週）
1. 客製化範本
2. 管理多個環境
3. 了解基礎設施程式碼
4. 設定 CI/CD 管線

### 進階（第 5 週以上）
1. 建立自訂範本
2. 進階基礎設施模式
3. 跨區域部署
4. 企業等級設定

## 下一步

**📖 繼續第 1 章學習：**
- [安裝與設定](installation.md) - 安裝並設定 azd
- [你的第一個專案](first-project.md) - 完整實作教學
- [設定指南](configuration.md) - 進階設定選項

**🎯 準備好進入下一章了嗎？**
- [第2章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md) - 開始構建 AI 應用程式

## 額外資源

- [Azure 開發人員 CLI 概覽](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [範本庫](https://azure.github.io/awesome-azd/)
- [社群範例](https://github.com/Azure-Samples)

---

## 🙋 常見問題

### 一般問題

**Q: AZD 與 Azure CLI 有何不同？**

A: Azure CLI (`az`) 用於管理單一 Azure 資源。AZD (`azd`) 用於管理整個應用程式：

```bash
# Azure CLI - 低階資源管理
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...還需要更多指令

# AZD - 應用程式層級管理
azd up  # 部署整個應用程式及所有資源
```

**可以這樣想：**
- `az` = 操作單一個樂高積木
- `azd` = 處理完整的樂高套組

---

**Q: 要使用 AZD 是否需要知道 Bicep 或 Terraform？**

A: 不需要！從範本開始：
```bash
# 使用現有範本 - 無需 IaC 知識
azd init --template todo-nodejs-mongo
azd up
```

之後可以學習 Bicep 來自訂基礎架構。範本提供可運作的範例供學習。

---

**Q: 執行 AZD 範本大概需要多少成本？**

A: 成本依範本而異。大多數開發範本約為 $50-150/月：

```bash
# 在部署前預覽費用
azd provision --preview

# 不使用時務必清理
azd down --force --purge  # 移除所有資源
```

**小撇步：** 在可用時使用免費等級：
- App Service: F1 (Free) tier
- Azure OpenAI: 50,000 tokens/month free
- Cosmos DB: 1000 RU/s free tier

---

**Q: 我可以將 AZD 與現有的 Azure 資源一起使用嗎？**

A: 可以，但從頭開始比較簡單。當 AZD 管理整個生命週期時效果最佳。針對現有資源：

```bash
# 選項 1：匯入現有資源（進階）
azd init
# 然後修改 infra/ 以參考現有資源

# 選項 2：從頭開始（建議）
azd init --template matching-your-stack
azd up  # 建立新環境
```

---

**Q: 我如何與團隊成員分享我的專案？**

A: 將 AZD 專案提交到 Git（但不要提交 .azure 資料夾）：

```bash
# 預設已包含於 .gitignore
.azure/        # 包含機密與環境資料
*.env          # 環境變數

# 當時的團隊成員:
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

每個人都會從相同的範本取得相同的基礎架構。

---

### 疑難排解問題

**Q: "azd up" 執行到一半失敗。我應該怎麼做？**

A: 檢查錯誤、修正，然後重試：

```bash
# 檢視詳細日誌
azd show

# 常見修正：

# 1. 如果配額超出：
azd env set AZURE_LOCATION "westus2"  # 嘗試不同地區

# 2. 如果資源名稱衝突：
azd down --force --purge  # 重置為初始狀態
azd up  # 重試

# 3. 如果認證已過期：
az login
azd auth login
azd up
```

**最常見的問題：** 選錯 Azure 訂閱
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**Q: 我如何只部署程式碼變更而不重新配置？**

A: 使用 `azd deploy` 取代 `azd up`：

```bash
azd up          # 第一次：置備 + 部署 (慢)

# 修改程式碼...

azd deploy      # 其後：只部署 (快)
```

速度比較：
- `azd up`: 10-15 分鐘（配置基礎架構）
- `azd deploy`: 2-5 分鐘（僅程式碼）

---

**Q: 我可以自訂基礎架構範本嗎？**

A: 可以！編輯 `infra/` 中的 Bicep 檔案：

```bash
# azd init 之後
cd infra/
code main.bicep  # 在 VS Code 中編輯

# 預覽變更
azd provision --preview

# 套用變更
azd provision
```

**技巧：** 從小處開始 - 先更改 SKUs：
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**Q: 如何刪除 AZD 所建立的一切？**

A: 一個指令即可刪除所有資源：

```bash
azd down --force --purge

# 這會刪除：
# - 所有 Azure 資源
# - 資源群組
# - 本地環境狀態
# - 快取的部署資料
```

**在以下情況務必執行：**
- 完成範本測試
- 切換到不同專案
- 想重新開始

**節省成本：** 刪除未使用的資源 = $0 費用

---

**Q: 如果我不小心在 Azure 入口網站刪除了資源怎麼辦？**

A: AZD 的狀態可能會不同步。採取乾淨重置的方法：

```bash
# 1. 移除本地狀態
azd down --force --purge

# 2. 重新開始
azd up

# Alternative: 讓 AZD 偵測並修復
azd provision  # 會建立缺少的資源
```

---

### 進階問題

**Q: 我可以在 CI/CD 管線中使用 AZD 嗎？**

A: 可以！GitHub Actions 範例：

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**Q: 我該如何處理祕密與敏感資料？**

A: AZD 會自動整合 Azure Key Vault：

```bash
# 機密儲存在 Key Vault，而非程式碼中
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD 會自動：
# 1. 建立 Key Vault
# 2. 儲存機密
# 3. 透過 Managed Identity 授予應用程式存取權限
# 4. 在執行時注入
```

**切勿提交：**
- `.azure/` 資料夾（包含環境資料）
- `.env` 檔案（本機祕密）
- 連線字串

---

**Q: 我可以部署到多個地區嗎？**

A: 可以，為每個地區建立環境：

```bash
# 美國東部環境
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# 歐洲西部環境
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# 各環境互相獨立
azd env list
```

若要實現真正的多區域應用程式，請自訂 Bicep 範本以同時部署到多個地區。

---

**Q: 如果我卡住了，可以在哪裡取得協助？**

1. **AZD 文件：** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub Issues：** https://github.com/Azure/azure-dev/issues
3. **Discord：** [Azure Discord](https://discord.gg/microsoft-azure) - #azure-developer-cli 頻道
4. **Stack Overflow：** 使用標籤 `azure-developer-cli`
5. **本課程：** [疑難排解指南](../chapter-07-troubleshooting/common-issues.md)

**小撇步：** 在提問前執行：
```bash
azd show       # 顯示目前狀態
azd version    # 顯示你嘅版本
```
在你的問題中包含這些資訊以加快獲得協助。

---

## 🎓 下一步？

你現在已了解 AZD 的基本概念。選擇你的路徑：

### 🎯 初學者：
1. **下一步：** [安裝與設定](installation.md) - 在你的機器上安裝 AZD
2. **接著：** [你的第一個專案](first-project.md) - 部署你的第一個應用程式
3. **練習：** 完成本課的所有 3 個練習

### 🚀 AI 開發人員：
1. **跳到：** [第2章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **部署：** 從 `azd init --template get-started-with-ai-chat` 開始
3. **學習：** 在部署的同時建立

### 🏗️ 進階開發者：
1. **檢閱：** [設定指南](configuration.md) - 進階設定
2. **探索：** [基礎設施即程式碼](../chapter-04-infrastructure/provisioning.md) - Bicep 深入探討
3. **建立：** 為你的技術棧建立自訂範本

---

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門  
- **⬅️ 上一章**: [課程總覽](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 下一章**: [安裝與設定](installation.md)
- **🚀 下一章**: [第2章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們竭力確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本應被視為具權威性的資料來源。如屬關鍵資訊，建議採用專業人工翻譯。我們不會就因使用本翻譯而引致的任何誤解、誤釋或後果承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->