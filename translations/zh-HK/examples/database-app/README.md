# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ <strong>預計時間</strong>: 20-30 分鐘 | 💰 <strong>預計費用</strong>: 約 $15-25/月 | ⭐ <strong>複雜度</strong>: 中級

這個 **完整、可運行的範例** 示範如何使用 [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) 將 Python Flask 網頁應用程式與 Microsoft SQL Database 部署到 Azure。所有程式碼皆已包含並測試—不需外部相依。

## 你將學到什麼

完成此範例後，你會：
- 使用基礎結構即程式碼（infrastructure-as-code）部署多層應用程式（Web 應用 + 資料庫）
- 在不將密碼寫死的情況下，設定安全的資料庫連線
- 使用 Application Insights 監控應用程式健康狀態
- 使用 AZD CLI 有效管理 Azure 資源
- 遵循 Azure 在安全性、成本優化與可觀測性上的最佳實務

## 情境概覽
- **Web 應用**: Python Flask REST API，具有資料庫連線
- <strong>資料庫</strong>: 含範例資料的 Azure SQL Database
- <strong>基礎建設</strong>: 使用 Bicep 佈建（模組化、可重用的範本）
- <strong>部署</strong>: 使用 `azd` 指令完全自動化
- <strong>監控</strong>: 使用 Application Insights 進行日誌與遙測

## 前置條件

### 必要工具

開始之前，請確認已安裝以下工具：

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (版本 2.50.0 或以上)
   ```sh
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (版本 1.0.0 或以上)
   ```sh
   azd version
   # 預期輸出：azd 版本 1.0.0 或以上
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)**（用於本機開發）
   ```sh
   python --version
   # 預期輸出：Python 3.8 或更高版本
   ```

4. **[Docker](https://www.docker.com/get-started)**（選用，供本機容器化開發）
   ```sh
   docker --version
   # 預期輸出：Docker 版本 20.10 或更高
   ```

### Azure 要求

- 有一個有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 在你的訂閱中有建立資源的權限
- 在訂閱或資源群組上具有 **Owner** 或 **Contributor** 角色

### 知識前提

這是一個 <strong>中級</strong> 範例。你應該熟悉：
- 基本指令列操作
- 基本雲端概念（資源、資源群組）
- 對 Web 應用與資料庫的基本理解

**不熟悉 AZD？** 請先參考 [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md)。

## 架構

此範例部署一個包含 Web 應用與 SQL 資料庫的兩層架構：

```mermaid
graph TD
    Browser[使用者 瀏覽器] <--> WebApp[Azure Web 應用程式<br/>Flask API<br/>/health<br/>/products]
    WebApp -- 安全連線<br/>已加密 --> SQL[Azure SQL 資料庫<br/>產品 資料表<br/>範例資料]
```
**資源部署：**
- **Resource Group**：所有資源的容器
- **App Service Plan**：基於 Linux 的主機（為節省成本使用 B1 階層）
- **Web App**：使用 Python 3.11 及 Flask 應用程式
- **SQL Server**：受管資料庫伺服器，最低要求 TLS 1.2
- **SQL Database**：Basic 階層（2GB，適合開發/測試）
- **Application Insights**：監控與日誌
- **Log Analytics Workspace**：集中式日誌儲存

<strong>類比</strong>：把它想像成一間餐廳（web 應用）和一個走入式冷凍庫（資料庫）。客人從菜單（API 端點）點餐，廚房（Flask 應用）從冷凍庫取食材（資料）。餐廳經理（Application Insights）追蹤所有發生的事。

## 資料夾結構

所有檔案皆包含在此範例中—不需外部相依：

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
- **azure.yaml**：告訴 AZD 要部署什麼與部署到哪裡
- **infra/main.bicep**：協調所有 Azure 資源
- **infra/resources/*.bicep**：個別資源定義（模組化以便重用）
- **src/web/app.py**：含資料庫邏輯的 Flask 應用程式
- **requirements.txt**：Python 套件相依
- **Dockerfile**：部署用的容器化指示

## 快速開始（逐步指引）

### 步驟 1：Clone 並切換目錄

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功檢查**：確認你可以看到 `azure.yaml` 與 `infra/` 資料夾：
```sh
ls
# 預期：README.md、azure.yaml、infra/、src/
```

### 步驟 2：使用 Azure 驗證

```sh
azd auth login
```

這會在瀏覽器中打開以進行 Azure 驗證。使用你的 Azure 帳號登入。

**✓ 成功檢查**：你應該會看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```sh
azd init
```

<strong>會發生的事</strong>：AZD 會為你的部署建立本機設定。

<strong>你會看到的提示</strong>：
- **Environment name**：輸入一個簡短名稱（例如 `dev`, `myapp`）
- **Azure subscription**：從清單中選擇你的訂閱
- **Azure location**：選擇地區（例如 `eastus`, `westeurope`）

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: New project initialized!
```

### 步驟 4：佈建 Azure 資源

```sh
azd provision
```

<strong>會發生的事</strong>：AZD 會佈署所有基礎建設（約需 5-8 分鐘）：
1. 建立資源群組
2. 建立 SQL Server 與 Database
3. 建立 App Service Plan
4. 建立 Web App
5. 建立 Application Insights
6. 設定網路與安全性

<strong>你會被提示輸入</strong>：
- **SQL admin username**：輸入一個使用者名稱（例如 `sqladmin`）
- **SQL admin password**：輸入一個強密碼（請保存！）

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**：5-8 分鐘

### 步驟 5：部署應用程式

```sh
azd deploy
```

<strong>會發生的事</strong>：AZD 會建置並部署你的 Flask 應用程式：
1. 封裝 Python 應用程式
2. 建置 Docker 容器
3. 推送到 Azure Web App
4. 使用範例資料初始化資料庫
5. 啟動應用程式

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 時間**：3-5 分鐘

### 步驟 6：瀏覽應用程式

```sh
azd browse
```

這會在瀏覽器中打開已部署的 Web 應用，網址為 `https://app-<unique-id>.azurewebsites.net`

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

### 步驟 7：測試 API 端點

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

**✓ 成功檢查**：所有端點都應回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 你已成功使用 AZD 將 Web 應用與資料庫部署到 Azure。

## 設定深入解析

### 環境變數

密碼透過 Azure App Service 設定安全管理—<strong>絕對不要將密碼寫死在原始碼中</strong>。

**由 AZD 自動配置：**
- `SQL_CONNECTION_STRING`：含加密認證的資料庫連線字串
- `APPLICATIONINSIGHTS_CONNECTION_STRING`：監控遙測端點
- `SCM_DO_BUILD_DURING_DEPLOYMENT`：啟用自動安裝相依套件

**密碼儲存位置：**
1. 在執行 `azd provision` 時，你會透過安全提示輸入 SQL 認證
2. AZD 會將它們儲存在本機的 `.azure/<env-name>/.env` 檔案（已被 git 忽略）
3. AZD 會將它們注入到 Azure App Service 設定中（靜態時已加密）
4. 應用程式在執行時透過 `os.getenv()` 讀取它們

### 本機開發

要在本機測試，請從範例建立一個 `.env` 檔案：

```sh
cp .env.sample .env
# 編輯 .env，填上本地資料庫連線設定
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

<strong>在本機測試</strong>：
```sh
curl http://localhost:8000/health
# 預期：{"狀態": "運作正常", "資料庫": "已連線"}
```

### 基礎設施即程式碼

所有 Azure 資源都定義在 **Bicep 範本**（`infra/` 資料夾）：

- <strong>模組化設計</strong>：每種資源類型都有自身檔案以便重用
- <strong>可參數化</strong>：可自訂 SKU、地區、命名慣例
- <strong>最佳實務</strong>：遵循 Azure 命名標準與安全預設
- <strong>版本控制</strong>：基礎設施變更受 Git 追蹤

<strong>自訂範例</strong>：
要變更資料庫階層，請編輯 `infra/resources/sql-database.bicep`：
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 安全性最佳實務

此範例遵循 Azure 的安全性最佳實務：

### 1. <strong>原始碼中無密碼</strong>
- ✅ 認證儲存在 Azure App Service 設定（已加密）
- ✅ `.env` 檔案透過 `.gitignore` 排除 Git
- ✅ 在佈建期間透過安全參數傳遞密碼

### 2. <strong>連線加密</strong>
- ✅ SQL Server 最低使用 TLS 1.2
- ✅ Web App 強制僅允許 HTTPS
- ✅ 資料庫連線使用加密通道

### 3. <strong>網路安全</strong>
- ✅ SQL Server 防火牆設定為僅允許 Azure 服務
- ✅ 限制公開網路存取（可透過 Private Endpoints 進一步鎖定）
- ✅ Web App 禁用 FTPS

### 4. <strong>驗證與授權</strong>
- ⚠️ <strong>目前</strong>：使用 SQL 驗證（使用者名稱/密碼）
- ✅ <strong>生產環境建議</strong>：使用 Azure Managed Identity 以達成無密碼驗證

**升級為 Managed Identity**（供生產環境使用）：
1. 在 Web App 上啟用 managed identity
2. 授予該 identity SQL 權限
3. 更新連線字串以使用 managed identity
4. 移除基於密碼的驗證

### 5. <strong>稽核與合規</strong>
- ✅ Application Insights 記錄所有請求與錯誤
- ✅ SQL Database 已啟用稽核功能（可為合規性進行設定）
- ✅ 所有資源均已加上標籤以利治理

<strong>生產上線前的安全檢查清單</strong>：
- [ ] 啟用 Azure Defender for SQL
- [ ] 為 SQL Database 設定 Private Endpoints
- [ ] 啟用 Web Application Firewall (WAF)
- [ ] 使用 Azure Key Vault 進行密鑰與密碼輪替
- [ ] 設定 Azure AD 驗證
- [ ] 為所有資源啟用診斷日誌

## 成本優化

<strong>預估每月費用</strong>（截至 2025 年 11 月）：

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 節省成本小技巧**：

1. <strong>學習時使用免費方案</strong>：
   - App Service：F1 階層（免費，使用時間有限）
   - SQL Database：使用 Azure SQL Database serverless
   - Application Insights：每月 5GB 免費匯入量

2. <strong>閒置時停止資源</strong>：
   ```sh
   # 停止 Web 應用程式（資料庫仍會收費）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 需要時再重新啟動
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. <strong>測試後刪除所有東西</strong>：
   ```sh
   azd down
   ```
   這會移除所有資源並停止計費。

4. **開發與生產的 SKU 區分**：
   - <strong>開發</strong>：Basic 階層（本範例使用）
   - <strong>生產</strong>：Standard/Premium 階層並具有冗餘

<strong>成本監控</strong>：
- 在 [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) 查看費用
- 設定費用警示以避免意外
- 為所有資源加上 `azd-env-name` 標籤以便追蹤

<strong>免費方案替代</strong>：
為學習用途，你可以修改 `infra/resources/app-service-plan.bicep`：
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
<strong>注意</strong>：免費階層有其限制（每日 CPU 限制 60 分鐘，無常駐功能）。

## 監控與可觀測性

### Application Insights 整合

此範例包含 **Application Insights**，提供完整的監控：

<strong>監控項目</strong>：
- ✅ HTTP 請求（延遲、狀態碼、端點）
- ✅ 應用程式錯誤與例外
- ✅ Flask 應用的自訂日誌
- ✅ 資料庫連線健康
- ✅ 效能指標（CPU、記憶體）

**存取 Application Insights**：
1. 開啟 [Azure Portal](https://portal.azure.com)
2. 前往你的資源群組（`rg-<env-name>`）
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

### SQL Database 稽核

**已啟用 SQL Database 稽核**，以追蹤：
- 資料庫存取模式
- 登入失敗嘗試
- 架構變更
- 資料存取（符合性需求）

<strong>存取稽核日誌</strong>：
1. Azure Portal → SQL Database → Auditing
2. 在 Log Analytics workspace 中檢視日誌

### 即時監控

<strong>檢視即時指標</strong>：
1. Application Insights → Live Metrics
2. 即時查看請求、失敗與效能

<strong>設定警示</strong>：
為關鍵事件建立警示：
- 5 分鐘內 HTTP 500 錯誤次數 > 5
- 資料庫連線失敗
- 高回應時間（>2 秒）

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
### 常見問題與解決方法

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

#### 2. 部署期間 SQL 連線失敗

<strong>症狀</strong>：
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

<strong>解決方法</strong>：
- 驗證 SQL Server 防火牆允許 Azure 服務（會自動設定）
- 確認在 `azd provision` 時有正確輸入 SQL 管理員密碼
- 確保 SQL Server 已完全佈建（可能需要 2-3 分鐘）

<strong>驗證連線</strong>：
```sh
# 在 Azure 入口網站，前往 SQL Database → 查詢編輯器
# 嘗試以你的認證連線
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
- 檢查是否在 `infra/resources/web-app.bicep` 指定了 Python 3.11
- 驗證 Dockerfile 是否有正確的基底映像

<strong>在本地偵錯</strong>：
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. 執行 AZD 命令時出現 "Unauthorized"

<strong>症狀</strong>：
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

<strong>解決方法</strong>：
重新在 Azure 登入：
```sh
# 為 AZD 工作流程所需
azd auth login

# 如果你也直接使用 Azure CLI 命令，則可選
az login
```

確認你在訂閱上擁有正確的權限（Contributor 角色）。

#### 6. 資料庫費用過高

<strong>症狀</strong>：
意外的 Azure 帳單。

<strong>解決方法</strong>：
- 檢查是否在測試後忘記執行 `azd down`
- 確認 SQL Database 使用的是 Basic 層級（非 Premium）
- 在 Azure Cost Management 檢視成本
- 設定成本警示

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

**需要更多幫助？**
- [AZD 疑難排解指南](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service 疑難排解](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL 疑難排解](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 實作練習

### 練習 1：驗證你的部署（初學者）

<strong>目標</strong>：確認所有資源已部署且應用程式運作正常。

<strong>步驟</strong>：
1. 列出資源群組中的所有資源：
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   <strong>預期</strong>：6-7 個資源（Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics）

2. 測試所有 API 端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   <strong>預期</strong>：所有回傳有效的 JSON 且無錯誤

3. 檢查 Application Insights:
   - 在 Azure 入口網站中前往 Application Insights
   - 前往 "Live Metrics"
   - 在 Web 應用上重新整理你的瀏覽器
   <strong>預期</strong>：可以看到即時出現的請求

<strong>成功標準</strong>：所有 6-7 個資源存在，所有端點回傳資料，Live Metrics 顯示有活動。

---

### 練習 2：新增 API 端點（中階）

<strong>目標</strong>：在 Flask 應用中新增一個端點。

<strong>起始程式碼</strong>：目前的端點位於 `src/web/app.py`

<strong>步驟</strong>：
1. 編輯 `src/web/app.py` 並在 `get_product()` 函式之後加入一個新端點：
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

2. 部署已更新的應用程式：
   ```sh
   azd deploy
   ```

3. 測試新的端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   <strong>預期</strong>：回傳符合 "laptop" 的產品

<strong>成功標準</strong>：新的端點能運作、回傳篩選後的結果，並在 Application Insights 日誌中出現。

---

### 練習 3：加入監控與警示（進階）

<strong>目標</strong>：建立主動監控並設定警示。

<strong>步驟</strong>：
1. 建立針對 HTTP 500 錯誤的警示：
   ```sh
   # 取得 Application Insights 資源 ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # 建立警報
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. 透過製造錯誤來觸發該警示：
   ```sh
   # 請求不存在的產品
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. 檢查警示是否已觸發：
   - Azure 入口網站 → Alerts → Alert Rules
   - 檢查你的電子郵件（若已設定）

<strong>成功標準</strong>：已建立警示規則、當錯誤發生時會觸發，且會收到通知。

---

### 練習 4：資料庫架構變更（進階）

<strong>目標</strong>：新增一個資料表並修改應用程式以使用該表。

<strong>步驟</strong>：
1. 透過 Azure 入口網站的 Query Editor 連接到 SQL Database

2. 建立一個新的 `categories` 資料表：
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

<strong>成功標準</strong>：新的資料表存在、產品顯示類別資訊，且應用程式仍然可用。

---

### 練習 5：實作快取（專家）

<strong>目標</strong>：新增 Azure Redis Cache 以提升效能。

<strong>步驟</strong>：
1. 在 `infra/main.bicep` 中新增 Redis Cache
2. 更新 `src/web/app.py`，對產品查詢進行快取
3. 使用 Application Insights 測量效能改善
4. 比較快取前後的回應時間

<strong>成功標準</strong>：Redis 已部署、快取運作，回應時間提升超過 50%。

<strong>提示</strong>：可以先參考 [Azure Cache for Redis 文件](https://learn.microsoft.com/azure/azure-cache-for-redis/)。

---

## 清理

為避免持續產生費用，完成後請刪除所有資源：

```sh
azd down
```

<strong>確認提示</strong>：
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

**✓ 成功檢查**： 
- 所有資源已從 Azure 入口網站刪除
- 沒有持續的費用
- 本機 `.azure/<env-name>` 資料夾可以刪除

<strong>替代方案</strong>（保留基礎架構，只刪除資料）：
```sh
# 只刪除資源群組（保留 AZD 設定）
az group delete --name rg-<env-name> --yes
```
## 深入了解

### 相關文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database 文件](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service 文件](https://learn.microsoft.com/azure/app-service/)
- [Application Insights 文件](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 語言參考](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 本課程的下一步
- **[Container Apps 範例](../../../../examples/container-app)**：使用 Azure Container Apps 部署微服務
- **[AI 整合指南](../../../../docs/ai-foundry)**：為你的應用加入 AI 能力
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**：生產部署範式

### 進階主題
- **Managed Identity**：移除密碼並使用 Azure AD 驗證
- **Private Endpoints**：在虛擬網路內保護資料庫連線
- **CI/CD Integration**：使用 GitHub Actions 或 Azure DevOps 自動化部署
- **Multi-Environment**：建立開發、測試（staging）和生產環境
- **Database Migrations**：使用 Alembic 或 Entity Framework 做架構版本管理

### 與其他方法的比較

**AZD vs. ARM Templates**：
- ✅ AZD：更高等的抽象，指令更簡單
- ⚠️ ARM：更冗長，但控制更細緻

**AZD vs. Terraform**：
- ✅ AZD：Azure 原生，與 Azure 服務整合
- ⚠️ Terraform：支援多雲，生態系更大

**AZD vs. Azure Portal**：
- ✅ AZD：可重複、具版本控制、可自動化
- ⚠️ 入口網站：需手動點擊，難以重現

**將 AZD 想像成**：Azure 的 Docker Compose —— 為複雜部署提供簡化的設定。

---

## 常見問題

**問：我可以使用不同的程式語言嗎？**  
答：可以！將 `src/web/` 換成 Node.js、C#、Go 或任何語言。並相應更新 `azure.yaml` 與 Bicep。

**問：我要如何新增更多資料庫？**  
答：在 `infra/main.bicep` 新增另一個 SQL Database 模組，或使用 Azure Database 的 PostgreSQL/MySQL。

**問：我可以用這個做生產環境嗎？**  
答：這只是一個起點。若用於生產，請加入：managed identity、private endpoints、冗餘、備份策略、WAF，以及強化的監控。

**問：如果我想用容器而不是直接部署程式碼，該怎麼辦？**  
答：請參閱使用整個流程 Docker 容器的 [Container Apps 範例](../../../../examples/container-app)。

**問：如何從本機連接到資料庫？**  
答：將你的 IP 新增到 SQL Server 防火牆：
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**問：我可以使用現有的資料庫而不是建立新的嗎？**  
答：可以，修改 `infra/main.bicep` 以引用現有的 SQL Server，並更新連接字串參數。

---

> **注意：** 此範例示範使用 AZD 部署帶有資料庫的 Web 應用之最佳實務。它包含可運作的程式碼、完整文件，以及強化學習的實作練習。對於生產部署，請檢視貴組織特定的安全性、擴充、合規性與成本需求。

**📚 課程導覽：**
- ← 上一章： [Container Apps 範例](../../../../examples/container-app)
- → 下一章： [AI 整合指南](../../../../docs/ai-foundry)
- 🏠 [課程首頁](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原文件的原文應被視為權威來源。若涉及重要資訊，建議採用專業人士進行人工翻譯。我們對因使用此翻譯而引致的任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->