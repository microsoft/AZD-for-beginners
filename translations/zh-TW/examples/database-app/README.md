# 使用 AZD 部署 Microsoft SQL 資料庫和網站應用程式

⏱️ **預估時間**: 20-30 分鐘 | 💰 **預估費用**: ~$15-25/月 | ⭐ **複雜度**: 中階

這個 **完整、可運作的範例** 示範如何使用 [Azure 開發者 CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) 將 Python Flask 網站應用程式與 Microsoft SQL 資料庫部署到 Azure。所有程式碼皆已包含並經測試—不需額外依賴。

## 你將學到的內容

完成此範例後，你將能：
- 使用基礎設施即程式碼部署多層應用程式（網站應用 + 資料庫）
- 在不將機密寫死於程式碼的情況下，設定安全的資料庫連線
- 使用 Application Insights 監控應用程式健康狀態
- 使用 AZD CLI 高效管理 Azure 資源
- 遵循 Azure 在安全性、成本最佳化與可觀察性方面的最佳實務

## 情境概覽
- **Web App**: 具有資料庫連線的 Python Flask REST API
- **Database**: 含範例資料的 Azure SQL Database
- **Infrastructure**: 使用 Bicep（模組化、可重用的範本）進行佈建
- **Deployment**: 使用 `azd` 指令完全自動化部署
- **Monitoring**: 使用 Application Insights 進行日誌與遙測

## 前置需求

### 必要工具

在開始之前，請確認已安裝下列工具：

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (版本 2.50.0 或更高)
   ```sh
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (版本 1.0.0 或更高)
   ```sh
   azd version
   # 預期輸出：azd 版本 1.0.0 或更高
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (用於本機開發)
   ```sh
   python --version
   # 預期輸出：Python 3.8 或更新版本
   ```

4. **[Docker](https://www.docker.com/get-started)** (選用，供本機容器化開發使用)
   ```sh
   docker --version
   # 預期輸出：Docker 版本 20.10 或以上
   ```

### Azure 要求

- 一個有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 在你的訂閱中建立資源的權限
- 對訂閱或資源群組具有 **Owner** 或 **Contributor** 角色

### 知識前置

這是一個 **中階** 範例。你應具備：
- 基本指令列操作經驗
- 基本的雲端概念（資源、資源群組）
- 對網站應用與資料庫的基本認識

**不熟悉 AZD？** 請先參閱 [入門指南](../../docs/chapter-01-foundation/azd-basics.md)。

## 架構

此範例部署一個含網站應用與 SQL 資料庫的兩層架構：

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**資源部署：**
- **Resource Group**：所有資源的容器
- **App Service Plan**：基於 Linux 的主機方案（使用 B1 級以節省成本）
- **Web App**：使用 Python 3.11 執行環境的 Flask 應用
- **SQL Server**：受管資料庫伺服器，最低使用 TLS 1.2
- **SQL Database**：基本層級（2GB，適合開發/測試）
- **Application Insights**：監控與日誌
- **Log Analytics Workspace**：集中式日誌儲存

**類比**：把這個架構想像成一家餐廳（網站應用）配有一個冷凍庫（資料庫）。顧客從菜單（API 端點）點餐，廚房（Flask 應用）從冷凍庫取出食材（資料）。餐廳經理（Application Insights）記錄所有發生的事。

## 資料夾結構

此範例包含所有檔案—不需外部依賴：

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

**各檔案說明：**
- **azure.yaml**：告訴 AZD 要部署什麼以及部署至何處
- **infra/main.bicep**：協調所有 Azure 資源
- **infra/resources/*.bicep**：各別資源定義（模組化以便重用）
- **src/web/app.py**：含資料庫邏輯的 Flask 應用程式
- **requirements.txt**：Python 套件相依性
- **Dockerfile**：部署用的容器化指示

## 快速入門（逐步）

### 步驟 1：Clone 並切換目錄

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功檢查**：確認你看見 `azure.yaml` 與 `infra/` 資料夾：
```sh
ls
# 預期：README.md、azure.yaml、infra/、src/
```

### 步驟 2：使用 Azure 認證登入

```sh
azd auth login
```

此指令會在瀏覽器中開啟以進行 Azure 認證。使用你的 Azure 帳戶登入。

**✓ 成功檢查**：你應該會看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```sh
azd init
```

**發生的事**：AZD 會為你的部署建立本機設定。

**你會看到的提示**：
- **Environment name**：輸入一個簡短名稱（例如：`dev`、`myapp`）
- **Azure subscription**：從清單中選取你的訂閱
- **Azure location**：選擇一個區域（例如：`eastus`、`westeurope`）

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: New project initialized!
```

### 步驟 4：佈建 Azure 資源

```sh
azd provision
```

**發生的事**：AZD 會部署所有基礎設施（需 5-8 分鐘）：
1. 建立資源群組
2. 建立 SQL Server 與資料庫
3. 建立 App Service Plan
4. 建立 Web App
5. 建立 Application Insights
6. 設定網路與安全性

**系統將提示你輸入**：
- **SQL admin username**：輸入一個使用者名稱（例如：`sqladmin`）
- **SQL admin password**：輸入一個強密碼（請妥善保存！）

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

**發生的事**：AZD 會建置並部署你的 Flask 應用程式：
1. 打包 Python 應用
2. 建置 Docker 映像
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

此指令會在瀏覽器開啟已部署的網站，位址為 `https://app-<unique-id>.azurewebsites.net`

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

**Health Check**（驗證資料庫連線）：
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**預期回應**：
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**List Products**（範例資料）：
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**預期回應**：
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

**Get Single Product**：
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 成功檢查**：所有端點皆回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 你已成功使用 AZD 將網站應用程式與資料庫部署到 Azure。

## 設定深入解析

### 環境變數

機密會透過 Azure App Service 設定安全管理—**絕不將機密寫死在原始碼中**。

**由 AZD 自動設定：**
- `SQL_CONNECTION_STRING`：含加密認證的資料庫連線字串
- `APPLICATIONINSIGHTS_CONNECTION_STRING`：監控遙測端點
- `SCM_DO_BUILD_DURING_DEPLOYMENT`：啟用部署期間自動安裝相依套件

**機密儲存位置：**
1. 在執行 `azd provision` 時，你會透過安全提示輸入 SQL 憑證
2. AZD 將這些憑證儲存在本機的 `.azure/<env-name>/.env` 檔案（已加入 git 忽略）
3. AZD 會將它們注入到 Azure App Service 的設定中（在靜態時會加密儲存）
4. 應用程式在執行時透過 `os.getenv()` 讀取它們

### 本機開發

要在本機測試，請從範例建立 `.env` 檔案：

```sh
cp .env.sample .env
# 在 .env 中設定您的本機資料庫連線
```

**本機開發流程**：
```sh
# 安裝相依套件
cd src/web
pip install -r requirements.txt

# 設定環境變數
export SQL_CONNECTION_STRING="your-local-connection-string"

# 執行應用程式
python app.py
```

**在本機測試**：
```sh
curl http://localhost:8000/health
# 預期: {"status": "healthy", "database": "connected"}
```

### 基礎設施即程式碼

所有 Azure 資源均在 **Bicep 範本**（`infra/` 資料夾）中定義：

- **模組化設計**：每種資源類型皆有自己的檔案以利重用
- **參數化**：可自訂 SKU、區域、命名慣例
- **最佳實務**：遵循 Azure 命名標準與安全性預設
- **版本控制**：基礎設施變更受 Git 管理

**自訂範例**：
若要變更資料庫層級，請編輯 `infra/resources/sql-database.bicep`：
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 安全性最佳實務

此範例遵循 Azure 的安全性最佳實務：

### 1. **原始碼中不含機密**
- ✅ 憑證儲存在 Azure App Service 設定中（加密）
- ✅ `.env` 檔案透過 `.gitignore` 排除於 Git 之外
- ✅ 機密在佈建時透過安全參數傳遞

### 2. **連線加密**
- ✅ SQL Server 最低使用 TLS 1.2
- ✅ Web App 強制使用 HTTPS
- ✅ 資料庫連線使用加密通道

### 3. **網路安全**
- ✅ SQL Server 防火牆設定為僅允許 Azure 服務
- ✅ 公共網路存取受限（可進一步使用 Private Endpoints 鎖定）
- ✅ Web App 關閉 FTPS

### 4. **驗證與授權**
- ⚠️ **目前**：SQL 認證（使用者名稱/密碼）
- ✅ **建議（生產）**：使用 Azure 託管識別（Managed Identity）以實現無密碼驗證

**升級為託管識別（適用於生產）**：
1. 在 Web App 上啟用託管識別
2. 授予該識別 SQL 權限
3. 更新連線字串以使用託管識別
4. 移除基於密碼的驗證

### 5. **稽核與合規**
- ✅ Application Insights 記錄所有請求與錯誤
- ✅ SQL Database 啟用稽核（可為合規性進一步設定）
- ✅ 所有資源皆加上標記以利治理

**上線前的安全檢查清單**：
- [ ] 啟用 Azure Defender for SQL
- [ ] 為 SQL Database 設定 Private Endpoints
- [ ] 啟用 Web Application Firewall (WAF)
- [ ] 使用 Azure Key Vault 實作機密輪替
- [ ] 設定 Azure AD 驗證
- [ ] 為所有資源啟用診斷記錄

## 成本最佳化

**預估每月費用**（截至 2025 年 11 月）：

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 節費建議**：

1. **學習時使用免費方案**：
   - App Service：F1 層（免費，時間有限）
   - SQL Database：使用 Azure SQL Database serverless
   - Application Insights：每月 5GB 免費輸入量

2. **不使用時暫停資源**：
   ```sh
   # 停止 Web 應用程式（資料庫仍會產生費用）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 在需要時重新啟動
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **測試後刪除所有資源**：
   ```sh
   azd down
   ```
   這會移除所有資源並停止計費。

4. **開發與生產用不同 SKU**：
   - **開發**：此範例使用 Basic 層
   - **生產**：使用具有冗援的 Standard/ Premium 層

**成本監控**：
- 在 [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) 檢視費用
- 設定成本警示以避免意外支出
- 為所有資源加上 `azd-env-name` 標記以便追蹤

**免費方案替代**：
如為學習用途，可修改 `infra/resources/app-service-plan.bicep`：
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**注意**：免費方案有使用限制（CPU 每日 60 分鐘，無 Always On）。

## 監控與可觀察性

### Application Insights 整合

本範例包含 **Application Insights** 以提供完整監控：

**監控項目**：
- ✅ HTTP 請求（延遲、狀態碼、端點）
- ✅ 應用程式錯誤與例外
- ✅ Flask 應用的自訂日誌
- ✅ 資料庫連線健康狀態
- ✅ 效能指標（CPU、記憶體）

**存取 Application Insights**：
1. 開啟 [Azure Portal](https://portal.azure.com)
2. 導覽至你的資源群組（`rg-<env-name>`）
3. 點選 Application Insights 資源（`appi-<unique-id>`）

**有用的查詢**（Application Insights → Logs）：

**檢視所有請求**：
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**查找錯誤**：
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**檢查健康端點**：
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database 稽核

**已啟用 SQL Database 稽核**，可追蹤：
- 資料庫存取模式
- 登入失敗嘗試
- 結構變更
- 資料存取（為合規性需求）

**存取稽核日誌**：
1. Azure Portal → SQL Database → Auditing
2. 在 Log Analytics 工作區檢視日誌

### 即時監控

**檢視即時指標**：
1. Application Insights → Live Metrics
2. 實時查看請求、失敗與效能

**設定警示**：
為關鍵事件建立警示：
- HTTP 500 錯誤 > 5 次於 5 分鐘內
- 資料庫連線失敗
- 回應時間過長 (>2 秒)

**範例警示建立**:
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

**症狀**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**解決方法**:
選擇不同的 Azure 區域或註冊資源提供者：
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. 部署期間 SQL 連線失敗

**症狀**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**解決方法**:
- 驗證 SQL Server 防火牆允許 Azure 服務（會自動設定）
- 檢查在 `azd provision` 期間是否正確輸入 SQL 管理員密碼
- 確保 SQL Server 已完全佈建（可能需要 2-3 分鐘）

**驗證連線**:
```sh
# 從 Azure 入口網站，前往 SQL 資料庫 → 查詢編輯器
# 嘗試使用您的認證連線
```

#### 3. Web 應用顯示 "Application Error"

**症狀**:
瀏覽器顯示通用錯誤頁面。

**解決方法**:
檢查應用程式日誌：
```sh
# 檢視近期日誌
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**常見原因**:
- 缺少環境變數（檢查 App Service → Configuration）
- Python 套件安裝失敗（檢查部署日誌）
- 資料庫初始化錯誤（檢查 SQL 連線）

#### 4. `azd deploy` 失敗並顯示 "Build Error"

**症狀**:
```
Error: Failed to build project
```

**解決方法**:
- 確保 `requirements.txt` 沒有語法錯誤
- 檢查 `infra/resources/web-app.bicep` 是否指定 Python 3.11
- 驗證 Dockerfile 是否使用正確的基底映像

**在本機偵錯**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. 在執行 AZD 指令時出現 "Unauthorized"

**症狀**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**解決方法**:
重新向 Azure 驗證：
```sh
azd auth login
az login
```

確認您在訂閱中具有正確的權限（Contributor 角色）。

#### 6. 資料庫費用過高

**症狀**:
意外的 Azure 帳單。

**解決方法**:
- 檢查是否在測試後忘記執行 `azd down`
- 驗證 SQL Database 是否使用 Basic 層級（非 Premium）
- 在 Azure Cost Management 檢視費用
- 設定費用警示

### 取得協助

**檢視所有 AZD 環境變數**:
```sh
azd env get-values
```

**檢查部署狀態**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**存取應用程式日誌**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**需要更多協助？**
- [AZD 疑難排解指南](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service 疑難排解](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL 疑難排解](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 實作練習

### 練習 1：驗證您的部署（初學者）

**目標**: 確認所有資源已部署且應用程式運作正常。

**步驟**:
1. 列出資源群組中的所有資源：
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **預期**：6-7 個資源（Web App、SQL Server、SQL Database、App Service Plan、Application Insights、Log Analytics）

2. 測試所有 API 端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **預期**：全部回傳有效的 JSON 並且沒有錯誤

3. 檢查 Application Insights：
   - 在 Azure 入口網站中前往 Application Insights
   - 前往「Live Metrics」
   - 在 Web 應用程式上重新整理瀏覽器
   **預期**：會看到請求即時出現

**成功標準**：所有 6-7 個資源存在、所有端點回傳資料、Live Metrics 顯示活動。

---

### 練習 2：新增 API 端點（中階）

**目標**：在 Flask 應用程式中擴充一個新端點。

**起始程式碼**：目前的端點在 `src/web/app.py`

**步驟**:
1. 編輯 `src/web/app.py`，在 `get_product()` 函式之後新增一個端點：
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

3. 測試新端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **預期**：回傳符合 "laptop" 的產品

**成功標準**：新端點運作正常，回傳過濾結果，並顯示在 Application Insights 日誌中。

---

### 練習 3：新增監控與警示（進階）

**目標**：設定主動監控與警示。

**步驟**:
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

2. 透過製造錯誤來觸發警示：
   ```sh
   # 請求不存在的產品
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. 檢查警示是否觸發：
   - Azure 入口網站 → Alerts → Alert Rules
   - 檢查您的電子郵件（若已設定）

**成功標準**：已建立警示規則，會在錯誤時觸發並收到通知。

---

### 練習 4：資料庫架構變更（進階）

**目標**：新增資料表並修改應用程式以使用它。

**步驟**:
1. 透過 Azure 入口網站的 Query Editor 連接到 SQL Database

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

3. 更新 `src/web/app.py`，在回應中包含類別資訊

4. 部署並測試

**成功標準**：新資料表存在，產品顯示類別資訊，應用程式仍然運作。

---

### 練習 5：實作快取（專家）

**目標**：新增 Azure Redis Cache 以提升效能。

**步驟**:
1. 在 `infra/main.bicep` 新增 Redis Cache
2. 更新 `src/web/app.py` 以快取產品查詢
3. 使用 Application Insights 測量效能改善
4. 比較快取前後的回應時間

**成功標準**：Redis 已部署、快取運作，回應時間改善 >50%。

**提示**：請參考 [Azure Cache for Redis 文件](https://learn.microsoft.com/azure/azure-cache-for-redis/)。

---

## 清理

為避免持續產生費用，完成後請刪除所有資源：

```sh
azd down
```

**確認提示**：
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

**✓ 成功檢查**: 
- 所有資源已從 Azure 入口網站刪除
- 沒有持續費用
- 本機 `.azure/<env-name>` 資料夾可以刪除

**替代方案**（保留基礎結構，刪除資料）：
```sh
# 僅刪除資源群組 (保留 AZD 設定)
az group delete --name rg-<env-name> --yes
```
## 進一步閱讀

### 相關文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database 文件](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service 文件](https://learn.microsoft.com/azure/app-service/)
- [Application Insights 文件](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 語言參考](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 本課程的下一步
- **[Container Apps 範例](../../../../examples/container-app)**：使用 Azure Container Apps 部署微服務
- **[AI 整合指南](../../../../docs/ai-foundry)**：為您的應用程式加入 AI 能力
- **[部署最佳實務](../../docs/chapter-04-infrastructure/deployment-guide.md)**：生產環境部署模式

### 進階主題
- **Managed Identity**：移除密碼並使用 Azure AD 驗證
- **Private Endpoints**：在虛擬網路內保護資料庫連線
- **CI/CD 整合**：使用 GitHub Actions 或 Azure DevOps 自動化部署
- **多環境**：設定開發、測試與生產環境
- **資料庫遷移**：使用 Alembic 或 Entity Framework 做為模式版本管理

### 與其他作法的比較

**AZD vs. ARM Templates**：
- ✅ AZD：較高層次的抽象，指令較簡單
- ⚠️ ARM：較冗長，提供更細緻的控制

**AZD vs. Terraform**：
- ✅ AZD：原生 Azure，與 Azure 服務整合
- ⚠️ Terraform：支援多雲，生態系更大

**AZD vs. Azure Portal**：
- ✅ AZD：可重複、受版本控制且可自動化
- ⚠️ 入口網站：需手動點擊，難以重現

**把 AZD 想像成**：Azure 的 Docker Compose—為複雜部署簡化設定。

---

## 常見問題

**問：我可以使用不同的程式語言嗎？**  
答：可以！將 `src/web/` 換成 Node.js、C#、Go 或任何語言，並相應更新 `azure.yaml` 和 Bicep。

**問：我如何新增更多資料庫？**  
答：在 `infra/main.bicep` 新增另一個 SQL Database 模組，或使用 Azure Database 服務的 PostgreSQL/MySQL。

**問：我可以用這個作為生產環境嗎？**  
答：這是起點。對於生產環境，請加入：managed identity、private endpoints、冗餘、備份策略、WAF 與加強的監控。

**問：如果我想使用容器而不是原始碼部署該怎麼辦？**  
答：請參考使用 Docker 容器的 [Container Apps 範例](../../../../examples/container-app)。

**問：我如何從本機連接到資料庫？**  
答：將您的 IP 新增到 SQL Server 的防火牆：
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**問：我可以使用既有的資料庫而不是建立新的嗎？**  
答：可以，修改 `infra/main.bicep` 以參考既有的 SQL Server 並更新連線字串參數。

---

> **注意：** 此範例示範使用 AZD 部署含資料庫的 Web 應用程式的最佳實務。它包含可運作的程式碼、完整的文件，以及強化學習的實作練習。針對生產環境部署，請檢視您組織特定的安全性、擴充性、合規性與費用需求。

**📚 課程導覽：**
- ← 上一個： [Container Apps 範例](../../../../examples/container-app)
- → 下一個： [AI 整合指南](../../../../docs/ai-foundry)
- 🏠 [課程首頁](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用人工智慧翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議委託專業人工翻譯。我們不負因使用本翻譯而導致之任何誤解或錯誤詮釋的責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->