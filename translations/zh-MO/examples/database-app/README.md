# 使用 AZD 部署 Microsoft SQL 資料庫與 Web 應用程式

⏱️ <strong>預計時間</strong>: 20-30 分鐘 | 💰 <strong>預計費用</strong>: ~$15-25/月 | ⭐ <strong>複雜度</strong>: 中階

此範例為一個<strong>完整且可運作的範例</strong>，示範如何使用 [Azure 開發者 CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) 將 Python Flask 網頁應用程式與 Microsoft SQL 資料庫部署到 Azure。所有程式碼皆已包含並測試完成—不需要外部相依性。

## 你將學到的內容

完成此範例後，你將能：
- 使用基礎架構即程式碼部署多層應用程式（Web 應用 + 資料庫）
- 在不將機密寫死於程式碼的情況下設定安全的資料庫連線
- 使用 Application Insights 監控應用程式健康狀態
- 使用 AZD CLI 有效率地管理 Azure 資源
- 遵循 Azure 在安全性、成本優化與可觀察性方面的最佳實務

## 情境概覽
- **Web 應用程式**：具備資料庫連線的 Python Flask REST API
- <strong>資料庫</strong>：含範例資料的 Azure SQL Database
- <strong>基礎架構</strong>：使用 Bicep 佈建（模組化、可重用的範本）
- <strong>部署</strong>：使用 `azd` 指令全自動化部署
- <strong>監控</strong>：使用 Application Insights 收集日誌與遙測

## 前置需求

### 必要工具

開始前，請確認已安裝下列工具：

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (版本 2.50.0 或更新)
   ```sh
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (版本 1.0.0 或更新)
   ```sh
   azd version
   # 預期輸出：azd 版本 1.0.0 或更高
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (用於本機開發)
   ```sh
   python --version
   # 預期輸出：Python 3.8 或更高版本
   ```

4. **[Docker](https://www.docker.com/get-started)** (選用，用於本機容器化開發)
   ```sh
   docker --version
   # 預期輸出：Docker 版本 20.10 或更高
   ```

### Azure 要求

- 一個有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 有權在你的訂閱中建立資源
- 在訂閱或資源群組上具有 **Owner** 或 **Contributor** 角色

### 知識前提

這是一個 <strong>中階</strong> 範例。你應該熟悉：
- 基本的命令列操作
- 基本雲端概念（資源、資源群組）
- Web 應用與資料庫的基本概念

**剛接觸 AZD？** 請先參考 [入門指南](../../docs/chapter-01-foundation/azd-basics.md)。

## 架構

此範例部署一個二層架構，包含 Web 應用與 SQL 資料庫：

```mermaid
graph TD
    Browser[使用者瀏覽器] <--> WebApp[Azure Web 應用程式<br/>Flask 應用程式介面<br/>/health<br/>/products]
    WebApp -- 安全連線<br/>已加密 --> SQL[Azure SQL 資料庫<br/>產品資料表<br/>範例資料]
```

**資源部署：**
- **Resource Group**：所有資源的容器
- **App Service Plan**：基於 Linux 的主機方案（為節省成本採用 B1 層）
- **Web App**：使用 Python 3.11 執行環境的 Flask 應用程式
- **SQL Server**：受控的資料庫伺服器，最低支援 TLS 1.2
- **SQL Database**：Basic 等級（2GB，適用於開發/測試）
- **Application Insights**：監控與日誌記錄
- **Log Analytics Workspace**：集中式日誌儲存

<strong>類比</strong>：可以把這個架構想像成一家餐廳（Web 應用），內有一個冷藏庫（資料庫）。顧客從菜單（API 端點）下單，廚房（Flask 應用）從冷藏庫取出食材（資料）。餐廳經理（Application Insights）追蹤所有發生的事情。

## 資料夾結構

此範例包含所有檔案—不需要外部相依性：

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**每個檔案的用途：**
- **azure.yaml**：告訴 AZD 要部署的項目以及部署位置
- **infra/main.bicep**：協調所有 Azure 資源
- **infra/resources/*.bicep**：單一資源定義（模組化以便重用）
- **src/web/app.py**：含資料庫邏輯的 Flask 應用程式
- **requirements.txt**：Python 套件相依清單
- **Dockerfile**：部署用的容器化指示

## 快速開始（逐步指南）

### 第一步：複製並進入目錄

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功檢查**：確認你可以看到 `azure.yaml` 與 `infra/` 資料夾：
```sh
ls
# 預期： README.md, azure.yaml, infra/, src/
```

### 第二步：登入 Azure

```sh
azd auth login
```

這會開啟你的瀏覽器以進行 Azure 驗證。使用你的 Azure 帳戶登入。

**✓ 成功檢查**：你應該會看到：
```
Logged in to Azure.
```

### 第三步：初始化環境

```sh
azd init
```

<strong>發生的事</strong>：AZD 會為你的部署建立本機設定。

<strong>你會看到的提示</strong>：
- **Environment name**：輸入一個簡短的名稱（例如 `dev`、`myapp`）
- **Azure subscription**：從清單中選擇你的訂閱
- **Azure location**：選擇一個區域（例如 `eastus`、`westeurope`）

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: New project initialized!
```

### 第四步：佈建 Azure 資源

```sh
azd provision
```

<strong>發生的事</strong>：AZD 會部署所有基礎架構（需時 5-8 分鐘）：
1. 建立資源群組
2. 建立 SQL Server 與資料庫
3. 建立 App Service Plan
4. 建立 Web App
5. 建立 Application Insights
6. 設定網路與安全性

<strong>系統會提示你輸入</strong>：
- **SQL admin username**：輸入使用者名稱（例如 `sqladmin`）
- **SQL admin password**：輸入強密碼（請務必儲存！）

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**：5-8 分鐘

### 第五步：部署應用程式

```sh
azd deploy
```

<strong>發生的事</strong>：AZD 會建置並部署你的 Flask 應用程式：
1. 封裝 Python 應用程式
2. 建置 Docker 映像
3. 推送到 Azure Web App
4. 初始化資料庫並匯入範例資料
5. 啟動應用程式

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**：3-5 分鐘

### 第六步：瀏覽應用程式

```sh
azd browse
```

這會在瀏覽器中開啟你已部署的 Web 應用，位於 `https://app-<unique-id>.azurewebsites.net`

**✓ 成功檢查**：你應該會看到 JSON 輸出：
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### 第七步：測試 API 端點

<strong>健康檢查</strong>（驗證資料庫連線）：
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

<strong>預期回應</strong>：
```json
{
  "status": "healthy",
  "database": "connected"
}
```

<strong>列出產品</strong>（範例資料）：
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

<strong>預期回應</strong>：
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

<strong>取得單一產品</strong>：
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 成功檢查**：所有端點皆回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 你已成功使用 AZD 將 Web 應用與資料庫部署到 Azure。

## 設定深入解析

### 環境變數

機密透過 Azure App Service 的設定安全管理—<strong>絕不在原始程式碼中寫死機密</strong>。

**由 AZD 自動設定：**
- `SQL_CONNECTION_STRING`：包含加密認證的資料庫連線字串
- `APPLICATIONINSIGHTS_CONNECTION_STRING`：監控遙測端點
- `SCM_DO_BUILD_DURING_DEPLOYMENT`：啟用在部署期間自動安裝相依性

**機密的儲存位置：**
1. 在 `azd provision` 過程中，你會透過安全提示輸入 SQL 認證
2. AZD 會將這些儲存在本機的 `.azure/<env-name>/.env` 檔案（已被 git 忽略）
3. AZD 會將它們注入到 Azure App Service 設定中（靜態儲存時已加密）
4. 應用程式在執行時透過 `os.getenv()` 讀取這些變數

### 本機開發

如需在本機測試，從範本建立一個 `.env` 檔案：

```sh
cp .env.sample .env
# 在 .env 中填入您的本地資料庫連線資訊
```

<strong>本機開發工作流程</strong>：
```sh
# 安裝相依套件
cd src/web
pip install -r requirements.txt

# 設定環境變數
export SQL_CONNECTION_STRING="your-local-connection-string"

# 執行應用程式
python app.py
```

<strong>本機測試</strong>：
```sh
curl http://localhost:8000/health
# 預期: {"status": "healthy", "database": "connected"}
```

### 基礎架構即程式碼

所有 Azure 資源都定義在 **Bicep 範本**（`infra/` 資料夾）中：

- <strong>模組化設計</strong>：每種資源型別有其自己的檔案以便重用
- <strong>參數化</strong>：可自訂 SKU、區域、命名規則
- <strong>最佳實務</strong>：遵循 Azure 命名標準與安全預設
- <strong>版本控制</strong>：基礎架構變更皆納入 Git 追蹤

<strong>客製化範例</strong>：
如要變更資料庫等級，編輯 `infra/resources/sql-database.bicep`：
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 安全最佳實務

此範例遵循 Azure 的安全最佳實務：

### 1. <strong>原始程式碼中無機密資訊</strong>
- ✅ 認證儲存在 Azure App Service 設定（已加密）
- ✅ `.env` 檔案透過 `.gitignore` 排除於 Git 之外
- ✅ 機密在佈建過程中由安全參數傳遞

### 2. <strong>連線加密</strong>
- ✅ SQL Server 最低支援 TLS 1.2
- ✅ Web App 強制使用 HTTPS
- ✅ 資料庫連線使用加密通道

### 3. <strong>網路安全</strong>
- ✅ SQL Server 防火牆設定僅允許 Azure 服務
- ✅ 限制公開網路存取（可進一步透過 Private Endpoints 鎖定）
- ✅ Web App 停用 FTPS

### 4. <strong>驗證與授權</strong>
- ⚠️ <strong>目前</strong>：使用 SQL 驗證（使用者名稱/密碼）
- ✅ <strong>生產建議</strong>：在生產環境使用 Azure Managed Identity 以達成免密碼驗證

**升級為 Managed Identity**（用於生產環境）：
1. 在 Web App 上啟用 Managed Identity
2. 授予該身分 SQL 權限
3. 更新連線字串以使用 Managed Identity
4. 移除基於密碼的驗證

### 5. <strong>稽核與合規</strong>
- ✅ Application Insights 記錄所有請求與錯誤
- ✅ 啟用 SQL Database 稽核（可為合規性進行設定）
- ✅ 所有資源均加上標記以便治理

<strong>上線前安全檢查清單</strong>：
- [ ] 啟用 Azure Defender for SQL
- [ ] 為 SQL Database 設定 Private Endpoints
- [ ] 啟用 Web Application Firewall (WAF)
- [ ] 實作 Azure Key Vault 以進行機密輪替
- [ ] 設定 Microsoft Entra ID 驗證
- [ ] 為所有資源啟用診斷紀錄

## 成本優化

<strong>預估每月費用</strong>（截至 2025 年 11 月）：

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/月 |
| SQL Database | Basic (2GB) | ~$5/月 |
| Application Insights | Pay-as-you-go | ~$2/月（低流量） |
| **Total** | | **~$20/月** |

**💡 節省成本小撇步**：

1. <strong>使用免費等級學習</strong>：
   - App Service：F1 層（免費，使用時數有限）
   - SQL Database：改用 Azure SQL Database serverless
   - Application Insights：每月 5GB 免費匯入

2. <strong>不使用時停用資源</strong>：
   ```sh
   # 停止網頁應用程式（資料庫仍會收費）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 需要時重新啟動
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. <strong>測試後刪除所有資源</strong>：
   ```sh
   azd down
   ```
   這會移除所有資源並停止收費。

4. **開發與生產的 SKU 區分**：
   - <strong>開發環境</strong>：使用 Basic 層（本範例採用）
   - <strong>生產環境</strong>：使用具備冗援的 Standard/Premium 層

<strong>成本監控</strong>：
- 在 [Azure 成本管理](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) 查看成本
- 設定成本警示以避免超支
- 為所有資源加上 `azd-env-name` 標記以便追蹤

<strong>免費等級替代選項</strong>：
為學習用途，你可以修改 `infra/resources/app-service-plan.bicep`：
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
<strong>注意</strong>：免費等級有其限制（每天 60 分鐘 CPU，無常時啟動）。

## 監控與可觀察性

### Application Insights 整合

此範例包含 **Application Insights** 以進行完整監控：

<strong>監控項目</strong>：
- ✅ HTTP 請求（延遲、狀態碼、端點）
- ✅ 應用錯誤與例外
- ✅ Flask 應用的自訂日誌
- ✅ 資料庫連線健康狀態
- ✅ 效能指標（CPU、記憶體）

**存取 Application Insights**：
1. 開啟 [Azure Portal](https://portal.azure.com)
2. 瀏覽到你的資源群組（`rg-<env-name>`）
3. 點選 Application Insights 資源（`appi-<unique-id>`）

<strong>有用的查詢</strong>（Application Insights → Logs）：

<strong>檢視所有請求</strong>：
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

<strong>尋找錯誤</strong>：
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

<strong>檢查健康端點</strong>：
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL 資料庫稽核

**已啟用 SQL 資料庫稽核**，以追蹤：
- 資料庫存取模式
- 登入失敗嘗試
- 結構變更
- 資料存取（用於合規）

<strong>存取稽核日誌</strong>：
1. Azure Portal → SQL Database → Auditing
2. 在 Log Analytics 工作區查看日誌

### 即時監控

<strong>檢視即時指標</strong>：
1. Application Insights → Live Metrics
2. 即時查看請求、失敗與效能狀況

<strong>設定警示</strong>：
為關鍵事件建立警示：
- HTTP 500 錯誤 > 5 次於 5 分鐘內
- 資料庫連線失敗
- 響應時間過長（>2 秒）

<strong>範例警示建立</strong>：
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## 疑難排解
### 常見問題與解決方案

#### 1. `azd provision` 失敗並顯示 "Location not available"

<strong>症狀</strong>：
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

<strong>解決方法</strong>：
選擇不同的 Azure 區域或註冊資源提供者：
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL 連線在部署期間失敗

<strong>症狀</strong>：
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

<strong>解決方法</strong>：
- 驗證 SQL Server 防火牆允許 Azure 服務（會自動設定）
- 檢查在 `azd provision` 過程中是否正確輸入了 SQL 管理員密碼
- 確認 SQL Server 已完全建立（可能需要 2-3 分鐘）

<strong>驗證連線</strong>：
```sh
# 在 Azure 入口網站，前往 SQL 資料庫 → 查詢編輯器
# 嘗試使用您的認證進行連線
```

#### 3. Web 應用顯示 "Application Error"

<strong>症狀</strong>：
瀏覽器顯示通用錯誤頁面。

<strong>解決方法</strong>：
檢查應用程式日誌：
```sh
# 檢視最近的日誌
az webapp log tail --name <app-name> --resource-group <rg-name>
```

<strong>常見原因</strong>：
- 缺少環境變數（檢查 App Service → Configuration）
- Python 套件安裝失敗（檢查部署日誌）
- 資料庫初始化錯誤（檢查 SQL 連線）

#### 4. `azd deploy` 失敗並顯示 "Build Error"

<strong>症狀</strong>：
```
Error: Failed to build project
```

<strong>解決方法</strong>：
- 確保 `requirements.txt` 沒有語法錯誤
- 檢查 `infra/resources/web-app.bicep` 是否指定了 Python 3.11
- 驗證 Dockerfile 是否使用正確的 base image

<strong>在本機偵錯</strong>：
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. 執行 AZD 指令時出現 "Unauthorized"

<strong>症狀</strong>：
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

<strong>解決方法</strong>：
重新在 Azure 上驗證：
```sh
# AZD 工作流程所需
azd auth login

# 如果您也直接使用 Azure CLI 命令，則為可選
az login
```

確認您在該訂閱上擁有正確的權限（Contributor 角色）。

#### 6. 高額資料庫費用

<strong>症狀</strong>：
出現意外的 Azure 帳單。

<strong>解決方法</strong>：
- 檢查是否在測試後忘記執行 `azd down`
- 驗證 SQL Database 是否使用 Basic 層（而非 Premium）
- 在 Azure Cost Management 檢查費用
- 設定費用警示

### 尋求協助

**查看所有 AZD 環境變數**：
```sh
azd env get-values
```

<strong>檢查部署狀態</strong>：
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

<strong>存取應用程式日誌</strong>：
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**需要更多協助？**
- [AZD 疑難排解指南](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service 疑難排解](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL 疑難排解](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 實作練習

### 練習 1：驗證您的部署（初學者）

<strong>目標</strong>：確認所有資源已部署且應用程式運作正常。

<strong>步驟</strong>：
1. 列出資源群組中的所有資源：
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   <strong>預期</strong>: 6-7 個資源 (Web App、SQL Server、SQL Database、App Service Plan、Application Insights、Log Analytics)

2. 測試所有 API 端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   <strong>預期</strong>: 全部回傳有效的 JSON 並且沒有錯誤

3. 檢查 Application Insights：
   - 在 Azure 入口網站中前往 Application Insights
   - 前往 "Live Metrics"
   - 在網頁應用上重新整理您的瀏覽器
   <strong>預期</strong>: 可即時看到請求出現

<strong>成功標準</strong>：所有 6-7 個資源存在、所有端點回傳資料、Live Metrics 顯示有活動。

---

### 練習 2：新增一個 API 端點（中階）

<strong>目標</strong>：擴充 Flask 應用程式，新增一個端點。

<strong>範例程式碼</strong>：目前的端點在 `src/web/app.py`

<strong>步驟</strong>：
1. 編輯 `src/web/app.py` 並在 `get_product()` 函式後新增一個端點：
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. 部署更新後的應用程式：
   ```sh
   azd deploy
   ```

3. 測試新的端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   <strong>預期</strong>: 回傳符合 "laptop" 的產品

<strong>成功標準</strong>：新的端點運作正常，回傳篩選後的結果，且在 Application Insights 日誌中可看到紀錄。

---

### 練習 3：加入監控與警示（進階）

<strong>目標</strong>：設定主動監控與警示。

<strong>步驟</strong>：
1. 為 HTTP 500 錯誤建立警示：
   ```sh
   # 取得 Application Insights 資源 ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # 建立警示
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. 透過造成錯誤觸發警示：
   ```sh
   # 請求不存在的產品
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. 檢查警示是否觸發：
   - Azure 入口網站 → Alerts → Alert Rules
   - 檢查您的電子郵件（若已設定）

<strong>成功標準</strong>：已建立警示規則，會在錯誤發生時觸發，並收到通知。

---

### 練習 4：資料庫結構變更（進階）

<strong>目標</strong>：新增資料表並修改應用程式以使用該表。

<strong>步驟</strong>：
1. 透過 Azure 入口網站的查詢編輯器連線到 SQL Database

2. 建立新的 `categories` 資料表：
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. 更新 `src/web/app.py`，在回應中加入類別資訊

4. 部署並測試

<strong>成功標準</strong>：新的資料表已存在，產品顯示類別資訊，且應用程式仍能正常運作。

---

### 練習 5：實作快取（專家級）

<strong>目標</strong>：新增 Azure Redis Cache 以提升效能。

<strong>步驟</strong>：
1. 在 `infra/main.bicep` 中加入 Redis Cache
2. 更新 `src/web/app.py`，對產品查詢進行快取
3. 使用 Application Insights 量測效能提升
4. 比較快取前後的回應時間

<strong>成功標準</strong>：Redis 已部署、快取功能正常、回應時間改善超過 50%。

<strong>提示</strong>：參考 [Azure Cache for Redis 文件](https://learn.microsoft.com/azure/azure-cache-for-redis/)。

---

## 清理

為避免持續費用，完成後請刪除所有資源：

```sh
azd down
```

<strong>確認提示</strong>：
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Type `y` to confirm.

**✓ 成功檢查**： 
- 所有資源已從 Azure 入口網站刪除
- 沒有持續費用
- 本機的 `.azure/<env-name>` 資料夾可刪除

<strong>替代方案</strong>（保留基礎設施，刪除資料）：
```sh
# 只刪除資源群組（保留 AZD 設定）
az group delete --name rg-<env-name> --yes
```
## 進一步了解

### 相關文件
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 本課程的後續步驟
- **[Container Apps 範例](../../../../examples/container-app)**：使用 Azure Container Apps 部署微服務
- **[AI 整合指南](../../../../docs/ai-foundry)**：為您的應用加入 AI 功能
- **[部署最佳實務](../../docs/chapter-04-infrastructure/deployment-guide.md)**：生產部署模式

### 進階主題
- **Managed Identity**：移除密碼並使用 Microsoft Entra ID 驗證
- **Private Endpoints**：在虛擬網路中保護資料庫連線
- **CI/CD Integration**：使用 GitHub Actions 或 Azure DevOps 自動化部署
- **Multi-Environment**：設定開發、測試與生產環境
- **Database Migrations**：使用 Alembic 或 Entity Framework 進行結構版本管理

### 與其他方法的比較

**AZD vs. ARM Templates**：
- ✅ AZD：更高層的抽象、指令更簡單
- ⚠️ ARM：較冗長，但控制更細緻

**AZD vs. Terraform**：
- ✅ AZD：Azure 原生，與 Azure 服務整合
- ⚠️ Terraform：支援多雲，生態系更大

**AZD vs. Azure Portal**：
- ✅ AZD：可重複、可版本控制、可自動化
- ⚠️ 入口網站：手動點擊，難以重現

把 AZD 想像成 Azure 的 Docker Compose—為複雜部署簡化設定。

---

## 常見問題

**Q: 我可以使用不同的程式語言嗎？**  
A: 可以！把 `src/web/` 換成 Node.js、C#、Go 或任何語言。並相應更新 `azure.yaml` 與 Bicep。

**Q: 我如何新增更多資料庫？**  
A: 在 `infra/main.bicep` 中新增另一個 SQL Database 模組，或使用 Azure Database 的 PostgreSQL/MySQL。

**Q: 可以在生產環境使用嗎？**  
A: 這是一個起點。若要用於生產，請加入：managed identity、private endpoints、冗餘、備份策略、WAF 與強化的監控。

**Q: 如果我想使用容器而非原始碼部署怎麼辦？**  
A: 請參考 [Container Apps 範例](../../../../examples/container-app)，該範例在整個流程中使用 Docker 容器。

**Q: 如何從本機連線到資料庫？**  
A: 將您的 IP 加入 SQL Server 防火牆：
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: 我可以使用現有的資料庫而不是建立新的嗎？**  
A: 可以，修改 `infra/main.bicep` 以參考現有的 SQL Server，並更新連線字串參數。

---

> **注意：** 此範例示範使用 AZD 部署帶有資料庫的 Web 應用的最佳實務。它包含可運作的程式碼、完整的文件，以及強化學習的實作練習。針對生產部署，請檢視組織特定的安全性、擴充性、合規性與費用需求。

**📚 課程導覽：**
- ← 上一節： [Container Apps 範例](../../../../examples/container-app)
- → 下一節： [AI 整合指南](../../../../docs/ai-foundry)
- 🏠 [課程首頁](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->