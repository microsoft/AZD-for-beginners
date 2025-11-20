<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-20T09:56:01+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "mo"
}
-->
# 部署 Microsoft SQL 資料庫及 Web 應用程式使用 AZD

⏱️ **預估時間**：20-30 分鐘 | 💰 **預估成本**：約 $15-25/月 | ⭐ **複雜度**：中級

這個 **完整且可運行的範例** 示範如何使用 [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) 將 Python Flask 網頁應用程式與 Microsoft SQL 資料庫部署到 Azure。所有程式碼均已包含並測試—不需要外部依賴。

## 您將學到的內容

完成此範例後，您將能：
- 使用基礎架構即程式碼部署多層應用程式（網頁應用程式 + 資料庫）
- 配置安全的資料庫連接，避免硬編碼密碼
- 使用 Application Insights 監控應用程式健康狀況
- 使用 AZD CLI 高效管理 Azure 資源
- 遵循 Azure 的安全性、成本優化及可觀測性最佳實踐

## 情境概述
- **網頁應用程式**：Python Flask REST API，具備資料庫連接功能
- **資料庫**：Azure SQL 資料庫，包含範例數據
- **基礎架構**：使用 Bicep 部署（模組化、可重用模板）
- **部署**：完全自動化，使用 `azd` 指令
- **監控**：使用 Application Insights 進行日誌及遙測

## 先決條件

### 必需工具

開始之前，請確認您已安裝以下工具：

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（版本 2.50.0 或更高）
   ```sh
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（版本 1.0.0 或更高）
   ```sh
   azd version
   # 預期輸出：azd版本1.0.0或更高
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)**（用於本地開發）
   ```sh
   python --version
   # 預期輸出：Python 3.8 或更高版本
   ```

4. **[Docker](https://www.docker.com/get-started)**（可選，用於本地容器化開發）
   ```sh
   docker --version
   # 預期輸出：Docker版本20.10或更高
   ```

### Azure 要求

- 一個有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 創建資源的權限
- **擁有者**或**貢獻者**角色於訂閱或資源群組

### 知識要求

這是一個 **中級範例**。您應熟悉：
- 基本命令列操作
- 基本雲端概念（資源、資源群組）
- 網頁應用程式及資料庫的基本知識

**AZD 新手？** 請先參考 [入門指南](../../docs/getting-started/azd-basics.md)。

## 架構

此範例部署了一個包含網頁應用程式及 SQL 資料庫的雙層架構：

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
- **資源群組**：所有資源的容器
- **App Service Plan**：基於 Linux 的主機（B1 層以節省成本）
- **網頁應用程式**：Python 3.11 執行環境，搭載 Flask 應用程式
- **SQL Server**：管理式資料庫伺服器，最低支援 TLS 1.2
- **SQL 資料庫**：基本層（2GB，適合開發/測試）
- **Application Insights**：監控及日誌
- **Log Analytics Workspace**：集中式日誌存儲

**類比**：想像這像是一家餐廳（網頁應用程式）配有冷凍庫（資料庫）。顧客從菜單（API 端點）點餐，廚房（Flask 應用程式）從冷凍庫（資料）取出食材。餐廳經理（Application Insights）追蹤所有發生的事情。

## 資料夾結構

所有檔案均已包含於此範例—不需要外部依賴：

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

**每個檔案的功能：**
- **azure.yaml**：告訴 AZD 部署什麼及部署位置
- **infra/main.bicep**：協調所有 Azure 資源
- **infra/resources/*.bicep**：單一資源定義（模組化以便重用）
- **src/web/app.py**：包含資料庫邏輯的 Flask 應用程式
- **requirements.txt**：Python 套件依賴
- **Dockerfile**：部署的容器化指令

## 快速入門（逐步指南）

### 步驟 1：克隆並導航

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功檢查**：確認您看到 `azure.yaml` 和 `infra/` 資料夾：
```sh
ls
# 預期：README.md, azure.yaml, infra/, src/
```

### 步驟 2：使用 Azure 認證

```sh
azd auth login
```

這會開啟您的瀏覽器進行 Azure 認證。使用您的 Azure 資格登入。

**✓ 成功檢查**：您應看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```sh
azd init
```

**發生了什麼**：AZD 為您的部署創建本地配置。

**您會看到的提示**：
- **環境名稱**：輸入簡短名稱（例如 `dev`、`myapp`）
- **Azure 訂閱**：從列表中選擇您的訂閱
- **Azure 位置**：選擇一個區域（例如 `eastus`、`westeurope`）

**✓ 成功檢查**：您應看到：
```
SUCCESS: New project initialized!
```

### 步驟 4：配置 Azure 資源

```sh
azd provision
```

**發生了什麼**：AZD 部署所有基礎架構（需時 5-8 分鐘）：
1. 創建資源群組
2. 創建 SQL Server 和資料庫
3. 創建 App Service Plan
4. 創建網頁應用程式
5. 創建 Application Insights
6. 配置網絡及安全性

**您會被要求提供**：
- **SQL 管理員使用者名稱**：輸入使用者名稱（例如 `sqladmin`）
- **SQL 管理員密碼**：輸入強密碼（請保存！）

**✓ 成功檢查**：您應看到：
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

**發生了什麼**：AZD 構建並部署您的 Flask 應用程式：
1. 打包 Python 應用程式
2. 構建 Docker 容器
3. 推送至 Azure 網頁應用程式
4. 使用範例數據初始化資料庫
5. 啟動應用程式

**✓ 成功檢查**：您應看到：
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

這會在瀏覽器中打開您的已部署網頁應用程式，網址為 `https://app-<unique-id>.azurewebsites.net`

**✓ 成功檢查**：您應看到 JSON 輸出：
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

**健康檢查**（驗證資料庫連接）：
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

**列出產品**（範例數據）：
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

**獲取單一產品**：
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 成功檢查**：所有端點均返回 JSON 數據且無錯誤。

---

**🎉 恭喜！** 您已成功使用 AZD 將網頁應用程式及資料庫部署至 Azure。

## 配置深入解析

### 環境變數

密碼透過 Azure App Service 配置安全管理—**絕不硬編碼於源代碼中**。

**由 AZD 自動配置**：
- `SQL_CONNECTION_STRING`：包含加密憑證的資料庫連接
- `APPLICATIONINSIGHTS_CONNECTION_STRING`：監控遙測端點
- `SCM_DO_BUILD_DURING_DEPLOYMENT`：啟用自動依賴安裝

**密碼存儲位置**：
1. 在 `azd provision` 過程中，您透過安全提示提供 SQL 憑證
2. AZD 將其存儲於本地 `.azure/<env-name>/.env` 檔案（已被 git 忽略）
3. AZD 將其注入至 Azure App Service 配置（靜態加密存儲）
4. 應用程式在運行時透過 `os.getenv()` 讀取

### 本地開發

若需本地測試，請從範例創建 `.env` 檔案：

```sh
cp .env.sample .env
# 編輯 .env 以連接您的本地數據庫
```

**本地開發工作流程**：
```sh
# 安裝依賴項
cd src/web
pip install -r requirements.txt

# 設置環境變量
export SQL_CONNECTION_STRING="your-local-connection-string"

# 運行應用程序
python app.py
```

**本地測試**：
```sh
curl http://localhost:8000/health
# 預期: {"status": "healthy", "database": "connected"}
```

### 基礎架構即程式碼

所有 Azure 資源均定義於 **Bicep 模板**（`infra/` 資料夾）：

- **模組化設計**：每種資源類型均有自己的檔案以便重用
- **參數化**：可自定義 SKU、區域、命名規則
- **最佳實踐**：遵循 Azure 命名標準及安全性默認值
- **版本控制**：基礎架構變更可追蹤於 Git

**自定義範例**：
若需更改資料庫層級，請編輯 `infra/resources/sql-database.bicep`：
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 安全性最佳實踐

此範例遵循 Azure 安全性最佳實踐：

### 1. **源代碼中無密碼**
- ✅ 憑證存儲於 Azure App Service 配置（加密）
- ✅ `.env` 檔案透過 `.gitignore` 排除於 Git
- ✅ 密碼透過安全參數於配置過程中傳遞

### 2. **加密連接**
- ✅ SQL Server 最低支援 TLS 1.2
- ✅ 強制使用 HTTPS 於網頁應用程式
- ✅ 資料庫連接使用加密通道

### 3. **網絡安全**
- ✅ SQL Server 防火牆配置僅允許 Azure 服務
- ✅ 公共網絡訪問受限（可進一步透過私有端點鎖定）
- ✅ 網頁應用程式禁用 FTPS

### 4. **身份驗證與授權**
- ⚠️ **目前**：SQL 驗證（使用者名稱/密碼）
- ✅ **生產建議**：使用 Azure Managed Identity 進行無密碼驗證

**升級至 Managed Identity**（適用於生產環境）：
1. 啟用網頁應用程式的 Managed Identity
2. 授予身份 SQL 權限
3. 更新連接字串以使用 Managed Identity
4. 移除基於密碼的驗證

### 5. **審計與合規**
- ✅ Application Insights 記錄所有請求及錯誤
- ✅ SQL 資料庫啟用審計（可配置以符合合規要求）
- ✅ 所有資源均標記以便治理

**生產前安全檢查清單**：
- [ ] 啟用 Azure Defender for SQL
- [ ] 配置 SQL 資料庫的私有端點
- [ ] 啟用 Web 應用程式防火牆（WAF）
- [ ] 實施 Azure Key Vault 以進行密碼輪替
- [ ] 配置 Azure AD 驗證
- [ ] 啟用所有資源的診斷日誌

## 成本優化

**預估每月成本**（截至 2025 年 11 月）：

| 資源 | SKU/層級 | 預估成本 |
|------|----------|----------|
| App Service Plan | B1（基本） | 約 $13/月 |
| SQL 資料庫 | 基本（2GB） | 約 $5/月 |
| Application Insights | 按使用量付費 | 約 $2/月（低流量） |
| **總計** | | **約 $20/月** |

**💡 成本節省提示**：

1. **學習使用免費層**：
   - App Service：F1 層（免費，有限時數）
   - SQL 資料庫：使用 Azure SQL Database serverless
   - Application Insights：每月 5GB 免費數據攝取

2. **不使用時停止資源**：
   ```sh
   # 停止網絡應用程式（資料庫仍然收費）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 需要時重新啟動
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **測試後刪除所有資源**：
   ```sh
   azd down
   ```
   這會移除所有資源並停止收費。

4. **開發與生產 SKU**：
   - **開發**：基本層（此範例使用）
   - **生產**：標準/高級層，具備冗餘功能

**成本監控**：
- 在 [Azure 成本管理](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) 中查看成本
- 設置成本警報以避免意外
- 使用 `azd-env-name` 標記所有資源以便追蹤

**免費層替代方案**：
為學習目的，您可以修改 `infra/resources/app-service-plan.bicep`：
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**注意**：免費層有限制（每天 60 分鐘 CPU，無法保持在線）。

## 監控與可觀測性

### Application Insights 整合

此範例包含 **Application Insights** 以進行全面監控：

**監控內容**：
- ✅ HTTP 請求（延遲、狀態碼、端點）
- ✅ 應用程式錯誤及例外
- ✅ Flask 應用程式的自定義日誌
- ✅ 資料庫連接健康狀況
- ✅ 性能指標（CPU、記憶體）

**訪問 Application Insights**：
1. 打開 [Azure Portal](https://portal.azure.com)
2. 導航至您的資源群組（`rg-<env-name>`）
3. 點擊 Application Insights 資源（`appi-<unique-id>`）

**有用查詢**（Application Insights → 日誌）：

**查看所有請求**：
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

### SQL 資料庫審計

**SQL 資料庫審計已啟用**以追蹤：
- 資料庫訪問模式
- 登入失敗嘗試
- 架構變更
- 數據訪問（符合合規要求）

**訪問審計日誌**：
1. Azure Portal → SQL 資料庫 → 審計
2. 在 Log Analytics Workspace 中查看日誌

### 實時監控

**查看即時指標**：
1. Application Insights → 即時指標
2. 實時查看請求、失敗及性能

**設置警報**：
為關鍵事件創建警報：
- HTTP 500 錯誤 > 5 次於 5 分鐘內
- 資料庫連接失敗
- 高回應時間（>2秒）

**示例警報建立**：
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## 疑難排解

### 常見問題及解決方法

#### 1. `azd provision` 顯示「位置不可用」錯誤

**症狀**：
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**解決方法**：
選擇其他 Azure 地區或註冊資源提供者：
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. 部署期間 SQL 連接失敗

**症狀**：
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**解決方法**：
- 確認 SQL Server 防火牆允許 Azure 服務（自動配置）
- 檢查在執行 `azd provision` 時輸入的 SQL 管理員密碼是否正確
- 確保 SQL Server 已完全部署（可能需要2-3分鐘）

**驗證連接**：
```sh
# 從 Azure Portal，前往 SQL Database → 查詢編輯器
# 嘗試使用您的憑證連接
```

#### 3. 網頁應用顯示「應用程式錯誤」

**症狀**：
瀏覽器顯示通用錯誤頁面。

**解決方法**：
檢查應用程式日誌：
```sh
# 查看最近的日誌
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**常見原因**：
- 缺少環境變數（檢查 App Service → 配置）
- Python 套件安裝失敗（檢查部署日誌）
- 資料庫初始化錯誤（檢查 SQL 連接）

#### 4. `azd deploy` 顯示「建置錯誤」

**症狀**：
```
Error: Failed to build project
```

**解決方法**：
- 確保 `requirements.txt` 沒有語法錯誤
- 檢查 `infra/resources/web-app.bicep` 是否指定 Python 3.11
- 驗證 Dockerfile 是否使用正確的基礎映像

**本地除錯**：
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. 執行 AZD 命令時顯示「未授權」

**症狀**：
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**解決方法**：
重新驗證 Azure 身份：
```sh
azd auth login
az login
```

確認您在訂閱中擁有正確的權限（Contributor 角色）。

#### 6. 資料庫成本過高

**症狀**：
意外的 Azure 帳單。

**解決方法**：
- 檢查是否忘記在測試後執行 `azd down`
- 確認 SQL 資料庫使用的是基本層（而非高級層）
- 在 Azure 成本管理中檢視成本
- 設置成本警報

### 尋求協助

**查看所有 AZD 環境變數**：
```sh
azd env get-values
```

**檢查部署狀態**：
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**存取應用程式日誌**：
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**需要更多幫助？**
- [AZD 疑難排解指南](../../docs/troubleshooting/common-issues.md)
- [Azure App Service 疑難排解](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL 疑難排解](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 實踐練習

### 練習 1：驗證您的部署（初學者）

**目標**：確認所有資源已部署且應用程式正常運作。

**步驟**：
1. 列出資源群組中的所有資源：
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **預期結果**：6-7 個資源（Web App、SQL Server、SQL Database、App Service Plan、Application Insights、Log Analytics）

2. 測試所有 API 端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **預期結果**：所有端點返回有效的 JSON 並無錯誤

3. 檢查 Application Insights：
   - 在 Azure Portal 中導航至 Application Insights
   - 前往「即時度量」
   - 在網頁應用中刷新瀏覽器
   **預期結果**：即時顯示請求活動

**成功標準**：所有 6-7 個資源存在，所有端點返回數據，即時度量顯示活動。

---

### 練習 2：新增 API 端點（中級）

**目標**：擴展 Flask 應用程式，新增一個端點。

**起始代碼**：`src/web/app.py` 中的現有端點

**步驟**：
1. 編輯 `src/web/app.py`，在 `get_product()` 函數後新增一個端點：
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

3. 測試新端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **預期結果**：返回符合「laptop」的產品

**成功標準**：新端點正常運作，返回篩選結果，並顯示在 Application Insights 日誌中。

---

### 練習 3：新增監控及警報（高級）

**目標**：設置主動監控及警報。

**步驟**：
1. 為 HTTP 500 錯誤建立警報：
   ```sh
   # 獲取應用程式洞察資源 ID
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

2. 觸發警報以製造錯誤：
   ```sh
   # 請求一個不存在的產品
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. 檢查警報是否觸發：
   - Azure Portal → 警報 → 警報規則
   - 檢查您的電子郵件（如果已配置）

**成功標準**：警報規則已建立，錯誤時觸發，並收到通知。

---

### 練習 4：資料庫架構更改（高級）

**目標**：新增一個表並修改應用程式以使用它。

**步驟**：
1. 通過 Azure Portal Query Editor 連接到 SQL 資料庫

2. 建立新的 `categories` 表：
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

3. 更新 `src/web/app.py`，在響應中包含分類信息

4. 部署並測試

**成功標準**：新表存在，產品顯示分類信息，應用程式仍正常運作。

---

### 練習 5：實現快取（專家級）

**目標**：新增 Azure Redis Cache 以提升性能。

**步驟**：
1. 在 `infra/main.bicep` 中新增 Redis Cache
2. 更新 `src/web/app.py`，快取產品查詢
3. 使用 Application Insights 測量性能提升
4. 比較快取前後的回應時間

**成功標準**：Redis 已部署，快取正常運作，回應時間提升超過 50%。

**提示**：從 [Azure Cache for Redis 文件](https://learn.microsoft.com/azure/azure-cache-for-redis/) 開始。

---

## 清理

為避免持續費用，完成後刪除所有資源：

```sh
azd down
```

**確認提示**：
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

**✓ 成功檢查**： 
- 所有資源已從 Azure Portal 刪除
- 無持續費用
- 本地 `.azure/<env-name>` 資料夾可刪除

**替代方法**（保留基礎設施，刪除數據）：
```sh
# 只刪除資源組（保留 AZD 配置）
az group delete --name rg-<env-name> --yes
```
## 了解更多

### 相關文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database 文件](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service 文件](https://learn.microsoft.com/azure/app-service/)
- [Application Insights 文件](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 語言參考](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 本課程的下一步
- **[容器應用示例](../../../../examples/container-app)**：使用 Azure Container Apps 部署微服務
- **[AI 集成指南](../../../../docs/ai-foundry)**：為您的應用新增 AI 功能
- **[部署最佳實踐](../../docs/deployment/deployment-guide.md)**：生產部署模式

### 高級主題
- **托管身份**：移除密碼並使用 Azure AD 身份驗證
- **私有端點**：在虛擬網絡內保護資料庫連接
- **CI/CD 集成**：使用 GitHub Actions 或 Azure DevOps 自動化部署
- **多環境**：設置開發、測試及生產環境
- **資料庫遷移**：使用 Alembic 或 Entity Framework 進行架構版本管理

### 與其他方法的比較

**AZD vs. ARM Templates**：
- ✅ AZD：高層次抽象，簡化命令
- ⚠️ ARM：更詳細，提供細粒度控制

**AZD vs. Terraform**：
- ✅ AZD：Azure 原生，與 Azure 服務集成
- ⚠️ Terraform：支持多雲，生態系統更大

**AZD vs. Azure Portal**：
- ✅ AZD：可重複、版本控制、自動化
- ⚠️ Portal：手動操作，難以重現

**將 AZD 視為**：Azure 的 Docker Compose—簡化配置以進行複雜部署。

---

## 常見問題

**問：我可以使用其他程式語言嗎？**  
答：可以！將 `src/web/` 替換為 Node.js、C#、Go 或任何語言。相應更新 `azure.yaml` 和 Bicep。

**問：如何新增更多資料庫？**  
答：在 `infra/main.bicep` 中新增另一個 SQL Database 模組，或使用 Azure Database 服務中的 PostgreSQL/MySQL。

**問：可以用於生產環境嗎？**  
答：這是一個起點。對於生產環境，請新增：托管身份、私有端點、冗餘、備份策略、WAF 和增強監控。

**問：如果我想使用容器而不是代碼部署怎麼辦？**  
答：查看 [容器應用示例](../../../../examples/container-app)，該示例全程使用 Docker 容器。

**問：如何從本地機器連接到資料庫？**  
答：將您的 IP 新增到 SQL Server 防火牆：
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**問：可以使用現有的資料庫而不是創建新的嗎？**  
答：可以，修改 `infra/main.bicep` 以引用現有的 SQL Server，並更新連接字串參數。

---

> **注意：** 此示例展示了使用 AZD 部署帶有資料庫的網頁應用的最佳實踐。它包括工作代碼、全面文件及實踐練習以加強學習。對於生產部署，請根據您的組織需求檢視安全性、擴展性、合規性及成本要求。

**📚 課程導航：**
- ← 上一章：[容器應用示例](../../../../examples/container-app)
- → 下一章：[AI 集成指南](../../../../docs/ai-foundry)
- 🏠 [課程首頁](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->