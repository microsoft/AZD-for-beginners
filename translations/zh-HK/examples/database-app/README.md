# 使用 AZD 部署 Microsoft SQL 數據庫和網絡應用程式

⏱️ **預計時間**：20-30 分鐘 | 💰 **預計費用**：約 $15-25/月 | ⭐ **複雜度**：中階

此 **完整且可運行的範例** 展示如何使用 [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) 將 Python Flask 網絡應用程式連同 Microsoft SQL 數據庫部署到 Azure。所有程式碼均已包含並經過測試——無需外部依賴。

## 您將學習

完成此範例後，您將能夠：
- 使用基礎架構即代碼部署多層應用程式（網絡應用程式 + 資料庫）
- 配置安全的資料庫連接，避免硬編碼密鑰
- 使用 Application Insights 監測應用程式健康狀態
- 使用 AZD CLI 高效管理 Azure 資源
- 遵循 Azure 最佳實踐，確保安全性、成本優化和可觀察性

## 情境概要
- **網絡應用程式**：Python Flask REST API，支援資料庫連接
- **資料庫**：Azure SQL Database，包含示例資料
- **基礎架構**：使用 Bicep 模板（模組化、可重用）
- **部署**：完全自動化，透過 `azd` 指令完成
- **監控**：利用 Application Insights 收集日誌和遙測資料

## 先決條件

### 必備工具

開始之前，請確認已安裝以下工具：

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（版本 2.50.0 或以上）
   ```sh
   az --version
   # 預期輸出: azure-cli 2.50.0 或更高版本
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（版本 1.0.0 或以上）
   ```sh
   azd version
   # 預期輸出：azd 版本 1.0.0 或以上
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)**（用於本地開發）
   ```sh
   python --version
   # 預期輸出：Python 3.8 或以上版本
   ```

4. **[Docker](https://www.docker.com/get-started)**（可選，用於本地容器化開發）
   ```sh
   docker --version
   # 預期輸出：Docker 版本 20.10 或更新版本
   ```

### Azure 要求

- 有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 有權在訂閱中建立資源
- 在訂閱或資源群組中擁有 **擁有者** 或 **參與者** 角色

### 知識先備條件

此為 **中階** 範例。您應熟悉：
- 基本命令行操作
- 基本雲端概念（資源、資源群組）
- 基本理解網絡應用與資料庫

**初次使用 AZD？** 請先參閱 [快速入門指南](../../docs/chapter-01-foundation/azd-basics.md)。

## 架構

此範例部署兩層架構，包括網絡應用程式與 SQL 資料庫：

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
- **應用服務方案**：基於 Linux 的主機（B1 層，成本效益高）
- **網絡應用程式**：Python 3.11 運行時搭配 Flask 應用程式
- **SQL 伺服器**：託管資料庫伺服器，最低 TLS 1.2
- **SQL 資料庫**：基本層（2GB，適合開發/測試）
- **Application Insights**：監控與日誌
- **Log Analytics 工作區**：集中式日誌儲存

**類比說明**：想像像餐廳（網絡應用程式）有個冷藏室（資料庫）。顧客點餐（API 端點），廚房（Flask 應用程式）從冷藏室取食材（資料）。餐廳經理（Application Insights）監控所有流程。

## 資料夾結構

所有檔案均包含於此範例中——無需外部依賴：

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

**各檔案功能說明：**
- **azure.yaml**：告訴 AZD 要部署什麼與在哪裡
- **infra/main.bicep**：協調所有 Azure 資源
- **infra/resources/*.bicep**：個別資源定義（模組化可重用）
- **src/web/app.py**：Flask 應用程式與資料庫邏輯
- **requirements.txt**：Python 套件依賴
- **Dockerfile**：容器化部署指令

## 快速開始（步驟說明）

### 步驟 1：複製並切換目錄

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 成功檢查**：確認看到 `azure.yaml` 與 `infra/` 資料夾：
```sh
ls
# 預期: README.md, azure.yaml, infra/, src/
```

### 步驟 2：Azure 登入驗證

```sh
azd auth login
```

將會開啟瀏覽器以登入 Azure，使用您的 Azure 帳戶登入。

**✓ 成功檢查**：您應會看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```sh
azd init
```

**說明**：AZD 會建立本地部署設定。

**您將遇到的提示**：
- **環境名稱**：輸入一個簡短名稱（例如 `dev`，`myapp`）
- **Azure 訂閱**：從清單選擇您的訂閱
- **Azure 地區**：選擇一個區域（例如 `eastus`，`westeurope`）

**✓ 成功檢查**：應看到：
```
SUCCESS: New project initialized!
```

### 步驟 4：啟用 Azure 資源

```sh
azd provision
```

**說明**：AZD 會部署所有基礎架構（約 5-8 分鐘）：
1. 建立資源群組
2. 建立 SQL 伺服器及資料庫
3. 建立應用服務方案
4. 建立網絡應用程式
5. 建立 Application Insights
6. 配置網路與安全性

**系統會提示您**：
- **SQL 管理員使用者名稱**：輸入使用者名稱（例如 `sqladmin`）
- **SQL 管理員密碼**：輸入強密碼（請妥善保存！）

**✓ 成功檢查**：應會看到：
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

**說明**：AZD 建構並部署 Flask 應用程式：
1. 打包 Python 應用程式
2. 建置 Docker 容器
3. 推送至 Azure 網絡應用程式
4. 初始化資料庫並載入示例資料
5. 啟動應用程式

**✓ 成功檢查**：您應該看到：
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

這會在瀏覽器中打開部署好的網絡應用程式，網址為 `https://app-<unique-id>.azurewebsites.net`

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

**列出產品**（示例資料）：
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

**取得單一產品**：
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 成功檢查**：所有端點皆正確回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 您已成功使用 AZD 在 Azure 上部署網絡應用程式與資料庫。

## 配置深入解析

### 環境變數

密鑰安全地透過 Azure App Service 設定管理——**切勿硬編碼於原始碼**。

**由 AZD 自動配置**：
- `SQL_CONNECTION_STRING`：帶加密憑證的資料庫連接字串
- `APPLICATIONINSIGHTS_CONNECTION_STRING`：監控遙測端點
- `SCM_DO_BUILD_DURING_DEPLOYMENT`：啟用自動依賴安裝

**密鑰儲存位置**：
1. 部署時 (`azd provision`) 藉由安全提示提供 SQL 憑證
2. AZD 儲存在本地 `.azure/<env-name>/.env` 檔案中（被 git 忽略）
3. AZD 注入至 Azure App Service 設定（靜態加密）
4. 程式執行時透過 `os.getenv()` 讀取

### 本地開發

可從範本建立 `.env` 檔以便本地測試：

```sh
cp .env.sample .env
# 使用本地資料庫連接編輯 .env
```

**本地開發流程**：
```sh
# 安裝依賴
cd src/web
pip install -r requirements.txt

# 設置環境變量
export SQL_CONNECTION_STRING="your-local-connection-string"

# 運行應用程式
python app.py
```

**本地測試**：
```sh
curl http://localhost:8000/health
# 預期結果: {"status": "healthy", "database": "connected"}
```

### 基礎架構即代碼

所有 Azure 資源定義於 **Bicep 模板** (`infra/` 文件夾)：

- **模組化設計**：每種類型的資源皆有單獨檔案，方便重用
- **參數化**：可客製化 SKU、區域及命名規則
- **遵循最佳實務**：符合 Azure 命名及安全標準
- **版本控制**：基礎架構變更追蹤於 Git

**自訂範例**：
如需更改資料庫層級，請編輯 `infra/resources/sql-database.bicep`：
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 安全最佳實務

此範例遵循 Azure 安全最佳實務：

### 1. **原始碼中不存放密鑰**
- ✅ 憑證儲存在 Azure App Service 配置中（加密）
- ✅ `.env` 檔案透過 `.gitignore` 排除於 Git 之外
- ✅ 部署期間以安全參數輸入密鑰

### 2. **連線加密**
- ✅ SQL 伺服器強制 TLS 1.2 以上
- ✅ 網絡應用程式強制 HTTPS
- ✅ 資料庫連接使用加密通道

### 3. **網路安全**
- ✅ SQL 伺服器防火牆設為僅允許 Azure 服務存取
- ✅ 公網存取受限（可用 Private Endpoints 進一步鎖定）
- ✅ 禁用 Web App 的 FTPS

### 4. **認證與授權**
- ⚠️ **目前**：SQL 認證（使用者名稱/密碼）
- ✅ **正式環境建議**：使用 Azure 託管身份，實現無密碼驗證

**升級為託管身份（正式環境）流程**：
1. 在網絡應用程式啟用託管身份
2. 授予該身份 SQL 存取權限
3. 更新連接字串以使用託管身份
4. 移除基於密碼的認證

### 5. **稽核與合規性**
- ✅ Application Insights 紀錄所有請求與錯誤
- ✅ 啟用 SQL 資料庫稽核（符合合規需求設定）
- ✅ 所有資源加上標籤方便治理

**正式環境前的安全清單**：
- [ ] 啟用 Azure Defender for SQL
- [ ] 配置 SQL 資料庫的 Private Endpoints
- [ ] 啟用 Web 應用程式防火牆 (WAF)
- [ ] 實作 Azure Key Vault 以便密碼輪替
- [ ] 配置 Azure AD 認證
- [ ] 啟用所有資源的診斷日誌

## 成本優化

**預估月費**（截至 2025 年 11 月）：

| 資源 | SKU/層級 | 預估費用 |
|----------|----------|----------------|
| 應用服務方案 | B1（基礎） | 約 $13/月 |
| SQL 資料庫 | 基礎層（2GB） | 約 $5/月 |
| Application Insights | 按量付費 | 約 $2/月（低流量） |
| **合計** | | **約 $20/月** |

**💡 省錢提示**：

1. **使用免費層學習**：
   - 應用服務：F1 層（免費，有限使用時間）
   - SQL 資料庫：使用 Azure SQL Database 無伺服器選項
   - Application Insights：每月 5GB 免費資料注入

2. **不使用時暫停資源**：
   ```sh
   # 停止網頁應用程式（資料庫仍會收費）
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 需要時重新啟動
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **測試完成後刪除所有資源**：
   ```sh
   azd down
   ```
 這會移除所有資源並停止產生費用。

4. **開發與正式用 SKU 差異**：
   - **開發**：使用本範例中的基礎層
   - **正式**：標準/高級層，具備冗餘與高可用

**費用監控**：
- 可透過 [Azure 成本管理](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) 查看花費
- 設定費用警報避免意外超支
- 對所有資源標記 `azd-env-name` 方便追蹤

**免費層替代方案**：
學習用途可修改 `infra/resources/app-service-plan.bicep`：
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**注意**：免費層有限制（每日 CPU 使用時間 60 分鐘，無恆開功能）。

## 監控與可觀察性

### Application Insights 整合

本範例包含 **Application Insights**，提供完整監控：

**監控項目**：
- ✅ HTTP 請求（延遲、狀態碼、端點）
- ✅ 應用程式錯誤與異常
- ✅ Flask 應用程式的自訂日誌
- ✅ 資料庫連接狀態
- ✅ 效能指標（CPU、記憶體）

**訪問 Application Insights**：
1. 開啟 [Azure 入口網站](https://portal.azure.com)
2. 導覽至您的資源群組 (`rg-<env-name>`)
3. 點擊 Application Insights 資源 (`appi-<unique-id>`)

**實用查詢**（Application Insights → 日誌）：

**查看全部請求**：
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

### SQL 資料庫稽核

**已啟用 SQL 資料庫稽核功能**，可追蹤：
- 資料庫訪問模式
- 登入失敗嘗試
- 結構變更
- 資料存取（合規需求）

**訪問稽核日誌**：
1. Azure 入口網站 → SQL 資料庫 → 稽核
2. 在 Log Analytics 工作區查看日誌

### 即時監控

**查看即時指標**：
1. Application Insights → 即時指標
2. 即時查看請求、錯誤和效能

**設置警示**：
建立關鍵事件警示：
- HTTP 500 錯誤在 5 分鐘內超過 5 次
- 資料庫連接失敗
- 高響應時間（>2 秒）

**示例警報創建**：
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

#### 1. `azd provision` 失敗並顯示「位置不可用」

**症狀**：
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**解決方案**：
選擇不同的 Azure 區域或註冊資源提供者：
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. 部署期間 SQL 連線失敗

**症狀**：
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**解決方案**：
- 確認 SQL Server 防火牆允許 Azure 服務（自動配置）
- 檢查在執行 `azd provision` 時輸入的 SQL 管理密碼是否正確
- 確保 SQL Server 已完全佈建（可能需時 2-3 分鐘）

**驗證連接**：
```sh
# 從 Azure 入口網站，前往 SQL 資料庫 → 查詢編輯器
# 嘗試使用你的憑證連接
```

#### 3. Web 應用程式顯示「應用程式錯誤」

**症狀**：
瀏覽器顯示一般錯誤頁面。

**解決方案**：
檢查應用程式日誌：
```sh
# 查看最近的日誌
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**常見原因**：
- 缺少環境變數（檢查 App Service → 配置）
- Python 套件安裝失敗（檢查部署日誌）
- 資料庫初始化錯誤（檢查 SQL 連接）

#### 4. `azd deploy` 失敗並顯示「建置錯誤」

**症狀**：
```
Error: Failed to build project
```

**解決方案**：
- 確保 `requirements.txt` 無語法錯誤
- 確認 `infra/resources/web-app.bicep` 中指定的是 Python 3.11
- 驗證 Dockerfile 使用正確的基底映像

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

**解決方案**：
重新進行 Azure 認證：
```sh
azd auth login
az login
```

確認您在訂閱上具有正確權限（貢獻者角色）。

#### 6. 數據庫費用過高

**症狀**：
收到意外的 Azure 帳單。

**解決方案**：
- 檢查是否忘記測試後執行 `azd down`
- 確認 SQL 資料庫使用的是基礎層（非高級層）
- 查看 Azure 成本管理中的費用
- 設定成本警報

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
- [AZD 疑難排解指南](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service 疑難排解](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL 疑難排解](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 實作練習

### 練習 1：驗證您的部署（初學者）

**目標**：確認所有資源已部署且應用程式正常運作。

**步驟**：
1. 列出資源群組內所有資源：
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **預期結果**：6-7 個資源（Web App、SQL Server、SQL 資料庫、App Service 計劃、Application Insights、Log Analytics）

2. 測試所有 API 端點：
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **預期結果**：全部回傳有效且無錯誤的 JSON

3. 檢查 Application Insights：
   - 在 Azure 入口網站進入 Application Insights
   - 前往「即時指標」
   - 在瀏覽器中重新整理 Web App
   **預期結果**：看到請求即時出現

**成功標準**：所有 6-7 個資源存在，所有端點都回傳資料，即時指標顯示有活動。

---

### 練習 2：新增 API 端點（中階）

**目標**：擴充 Flask 應用程式，新增一個端點。

**起始程式碼**：現有端點位於 `src/web/app.py`

**步驟**：
1. 編輯 `src/web/app.py`，在 `get_product()` 函式後添加新端點：
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
   **預期結果**：回傳符合 "laptop" 條件的產品

**成功標準**：新端點正常運作，回傳篩選結果，並顯示於 Application Insights 日誌中。

---

### 練習 3：新增監控與警報（進階）

**目標**：建立主動監控及警報。

**步驟**：
1. 建立 HTTP 500 錯誤警報：
   ```sh
   # 獲取 Application Insights 資源 ID
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

2. 製造錯誤以觸發警報：
   ```sh
   # 請求一個不存在的產品
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. 檢查警報是否觸發：
   - Azure 入口網站 → 警報 → 警報規則
   - 檢查您的電子郵件（若有設定）

**成功標準**：成功建立警報規則，錯誤發生時觸發通知。

---

### 練習 4：資料庫結構變更（進階）

**目標**：新增資料表並修改應用程式使用它。

**步驟**：
1. 使用 Azure 入口網站查詢編輯器連線至 SQL 資料庫

2. 建立新 `categories` 表：
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

3. 更新 `src/web/app.py`，回應中加上類別資訊

4. 部署並測試

**成功標準**：新表存在，產品回應中包含類別資訊，應用程式正常運作。

---

### 練習 5：實作快取（專家）

**目標**：加入 Azure Redis Cache 提升效能。

**步驟**：
1. 將 Redis Cache 加入 `infra/main.bicep`
2. 更新 `src/web/app.py`，快取產品查詢結果
3. 使用 Application Insights 測量效能提升
4. 比較快取前後響應時間

**成功標準**：Redis 成功部署，快取功能正常，響應時間提升超過 50%。

**提示**：從 [Azure Cache for Redis 文件](https://learn.microsoft.com/azure/azure-cache-for-redis/) 開始。

---

## 清理作業

完成後請刪除所有資源以避免持續費用：

```sh
azd down
```

**確認提示**：
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

**✓ 成功檢查**：
- 所有資源從 Azure 入口網站刪除
- 無持續費用
- 本地 `.azure/<env-name>` 資料夾可刪除

**替代方案**（保留基礎架構，刪除資料）：
```sh
# 僅刪除資源組（保留 AZD 設定）
az group delete --name rg-<env-name> --yes
```
## 進一步學習

### 相關文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL 資料庫文件](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service 文件](https://learn.microsoft.com/azure/app-service/)
- [Application Insights 文件](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 語言參考](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 本課程接下來的內容
- **[Container Apps 範例](../../../../examples/container-app)**：使用 Azure Container Apps 部署微服務
- **[AI 整合指南](../../../../docs/ai-foundry)**：為應用程式添加 AI 功能
- **[部署最佳實踐](../../docs/chapter-04-infrastructure/deployment-guide.md)**：生產部署模式

### 進階主題
- **Managed Identity**：移除密碼，使用 Azure AD 認證
- **Private Endpoints**：在虛擬網路中加固資料庫連線
- **CI/CD 整合**：透過 GitHub Actions 或 Azure DevOps 自動部署
- **多環境管理**：建立開發、測試與生產環境
- **資料庫遷移**：使用 Alembic 或 Entity Framework 進行架構版本控制

### 與其他方法的比較

**AZD vs. ARM 模板**：
- ✅ AZD：較高階抽象，指令簡潔易用
- ⚠️ ARM：較冗長，提供更細粒度控制

**AZD vs. Terraform**：
- ✅ AZD：Azure 原生，與 Azure 服務整合
- ⚠️ Terraform：跨多雲支持，生態系統較大

**AZD vs. Azure 入口網站**：
- ✅ AZD：可重複、版本控制、自動化
- ⚠️ 入口網站：手動點擊，難以復現

**可把 AZD 想成**：Azure 的 Docker Compose——簡化複雜部署的配置。

---

## 常見問題

**問：可以使用其他程式語言嗎？**  
答：可以！將 `src/web/` 替換成 Node.js、C#、Go 或其他任意語言。並相應更新 `azure.yaml` 和 Bicep。

**問：如何添加更多資料庫？**  
答：在 `infra/main.bicep` 新增另一個 SQL 資料庫模組，或使用 Azure 資料庫服務的 PostgreSQL/MySQL。

**問：能用於生產環境嗎？**  
答：這是起點。生產環境需加入托管身份、私有端點、高可用性、備份策略、WAF 及強化監控。

**問：如果想用容器而非程式碼部署怎麼辦？**  
答：參考 [Container Apps 範例](../../../../examples/container-app)，全程使用 Docker 容器。

**問：如何從本地連接資料庫？**  
答：將您的 IP 加入 SQL Server 防火牆：
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**問：可以使用現有資料庫，不新建嗎？**  
答：可以，修改 `infra/main.bicep` 指向現有 SQL Server，並更新連接字串參數。

---

> **注意：** 此範例示範如何使用 AZD 部署帶有資料庫的 Web 應用程式的最佳實踐，包括可運行的程式碼、完整文件與實作練習。生產部署請依組織需求檢視安全、擴充性、合規性與成本。

**📚 課程導航：**
- ← 上一章：[Container Apps 範例](../../../../examples/container-app)
- → 下一章：[AI 整合指南](../../../../docs/ai-foundry)
- 🏠 [課程首頁](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->