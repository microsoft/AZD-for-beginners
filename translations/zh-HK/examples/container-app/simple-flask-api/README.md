# Simple Flask API - Container App 範例

**學習路線：** 初階 ⭐ | **時間：** 25-35 分鐘 | **費用：** $0-15/月

一個完整且可運作的 Python Flask REST API，使用 Azure Developer CLI (azd) 部署到 Azure Container Apps。這個範例示範容器部署、自動擴充和監控基礎。

## 🎯 你會學習到什麼

- 部署容器化的 Python 應用程式到 Azure
- 配置自動縮放並支援縮減到零
- 實作健康檢查與就緒探針
- 監控應用程式日誌及指標
- 使用 Azure Developer CLI 進行快速部署

## 📦 包含內容

✅ **Flask 應用程式** - 完整支援 CRUD 操作的 REST API (`src/app.py`)  
✅ **Dockerfile** - 生產環境容器設定檔  
✅ **Bicep 基礎架構** - Container Apps 環境及 API 部署設定  
✅ **AZD 設定** - 一指令部署配置  
✅ **健康探針** - 配置活躍及就緒檢查  
✅ **自動縮放** - HTTP 負載下 0-10 個副本  

## 架構圖

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## 先決條件

### 必須
- **Azure Developer CLI (azd)** - [安裝指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure 訂閱** - [免費帳戶](https://azure.microsoft.com/free/)
- **Docker Desktop** - [安裝 Docker](https://www.docker.com/products/docker-desktop/)（用於本地測試）

### 驗證先決條件

```bash
# 檢查 azd 版本（需要 1.5.0 或更高）
azd version

# 驗證 Azure 登入
azd auth login

# 檢查 Docker（可選，用於本地測試）
docker --version
```

## ⏱️ 部署時間表

| 階段 | 時間 | 內容 |
|-------|----------|--------------||
| 環境設定 | 30 秒 | 建立 azd 環境 |
| 建置容器 | 2-3 分鐘 | 用 Docker 建置 Flask 應用程式 |
| 建立基礎設施 | 3-5 分鐘 | 建立 Container Apps、註冊表、監控資源 |
| 部署應用程式 | 2-3 分鐘 | 推送映像並部署到 Container Apps |
| **總計** | **8-12 分鐘** | 部署完成並可使用 |

## 快速開始

```bash
# 導航到範例
cd examples/container-app/simple-flask-api

# 初始化環境（選擇獨特名稱）
azd env new myflaskapi

# 部署所有內容（基礎設施 + 應用程式）
azd up
# 你會被提示：
# 1. 選擇 Azure 訂閱
# 2. 選擇地點（例如，eastus2）
# 3. 等待 8-12 分鐘部署完成

# 取得你的 API 端點
azd env get-values

# 測試 API
curl $(azd env get-value API_ENDPOINT)/health
```

**預期輸出：**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ 驗證部署

### 第一步：檢查部署狀態

```bash
# 檢視已部署的服務
azd show

# 預期輸出顯示：
# - 服務：api
# - 端點：https://ca-api-[env].xxx.azurecontainerapps.io
# - 狀態：正在運行
```

### 第二步：測試 API 端點

```bash
# 獲取 API 端點
API_URL=$(azd env get-value API_ENDPOINT)

# 測試健康狀態
curl $API_URL/health

# 測試根端點
curl $API_URL/

# 建立一個項目
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 獲取所有項目
curl $API_URL/api/items
```

**成功標準：**
- ✅ Health 端點回應 HTTP 200
- ✅ Root 端點顯示 API 資訊
- ✅ POST 建立項目並回應 HTTP 201
- ✅ GET 回傳已建立項目清單

### 第三步：觀看日誌

```bash
# 使用 azd monitor 實時串流日誌
azd monitor --logs

# 或使用 Azure CLI：
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 你應該會見到：
# - Gunicorn 啟動訊息
# - HTTP 請求日誌
# - 應用程式資訊日誌
```

## 專案結構

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API 端點

| 端點 | 方法 | 描述 |
|----------|--------|-------------|
| `/health` | GET | 健康檢查 |
| `/api/items` | GET | 列出所有項目 |
| `/api/items` | POST | 建立新項目 |
| `/api/items/{id}` | GET | 取得特定項目 |
| `/api/items/{id}` | PUT | 更新項目 |
| `/api/items/{id}` | DELETE | 刪除項目 |

## 配置

### 環境變數

```bash
# 設定自訂配置
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 縮放設定

API 根據 HTTP 流量自動縮放：
- **最小副本數**：0（空閒時縮放到零）
- **最大副本數**：10
- **每個副本併發請求數**：50

## 開發

### 本地執行

```bash
# 安裝依賴項
cd src
pip install -r requirements.txt

# 運行應用程式
python app.py

# 本地測試
curl http://localhost:8000/health
```

### 建置並測試容器

```bash
# 建構 Docker 映像
docker build -t flask-api:local ./src

# 本地運行容器
docker run -p 8000:8000 flask-api:local

# 測試容器
curl http://localhost:8000/health
```

## 部署

### 完整部署

```bash
# 部署基礎設施及應用程式
azd up
```

### 僅部署程式碼

```bash
# 只部署應用程式代碼（基礎設施不變）
azd deploy api
```

### 更新配置

```bash
# 更新環境變數
azd env set API_KEY "new-api-key"

# 使用新配置重新部署
azd deploy api
```

## 監控

### 查看日誌

```bash
# 使用 azd monitor 流式傳輸即時日誌
azd monitor --logs

# 或使用 Azure CLI 管理容器應用程式：
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 查看最後 100 行
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### 監控指標

```bash
# 開啟 Azure 監控儀表板
azd monitor --overview

# 查看特定指標
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## 測試

### 健康檢查

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

預期回應：
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### 建立項目

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### 取得所有項目

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## 成本優化

此部署可縮減至零，因此只有在 API 正在處理請求時才會付費：

- **閒置成本**：約 $0/月（縮減至零）
- **活躍成本**：約 $0.000024/秒（每副本）
- **預估月費**（輕度使用）：$5-15

### 進一步降低成本

```bash
# 將開發環境最大副本數縮減
azd env set MAX_REPLICAS 3

# 使用較短的空閒超時時間
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 分鐘
```

## 疑難排解

### 容器無法啟動

```bash
# 使用 Azure CLI 檢查容器日誌
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# 驗證 Docker 映像本地構建
docker build -t test ./src
```

### API 無法存取

```bash
# 驗證入口是否為外部
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 響應時間過長

```bash
# 檢查CPU/記憶體使用情況
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 如有需要，擴大資源規模
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 清理資源

```bash
# 刪除所有資源
azd down --force --purge
```

## 後續步驟

### 擴展此範例

1. **加入資料庫** - 整合 Azure Cosmos DB 或 SQL Database
   ```bash
   # 將 Cosmos DB 模組新增至 infra/main.bicep
   # 更新 app.py 以連接資料庫
   ```

2. **加入身份驗證** - 實作 Azure AD 或 API 金鑰  
   ```python
   # 為 app.py 新增身份驗證中介軟件
   from functools import wraps
   ```

3. **設定 CI/CD** - GitHub Actions 工作流程  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **新增託管身分** - 保護存取 Azure 服務  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 相關範例

- **[資料庫應用程式](../../../../../examples/database-app)** - 完整 SQL Database 範例
- **[微服務架構](../../../../../examples/container-app/microservices)** - 多服務架構
- **[Container Apps 主導指南](../README.md)** - 全部容器模式

### 學習資源

- 📚 [AZD 初學者課程](../../../README.md) - 主要課程首頁
- 📚 [Container Apps 使用範例](../README.md) - 更多部署模式
- 📚 [AZD 範本集](https://azure.github.io/awesome-azd/) - 社群範本收集

## 其他資源

### 文件
- **[Flask 文件](https://flask.palletsprojects.com/)** - Flask 框架指南
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 官方 Azure 文件
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 指令參考

### 教學
- **[Container Apps 快速入門](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 部署你的第一個應用程式
- **[Azure Python 開發](https://learn.microsoft.com/azure/developer/python/)** - Python 開發指南
- **[Bicep 語言](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 基礎架構即程式碼

### 工具
- **[Azure 入口網站](https://portal.azure.com)** - 視覺化管理資源
- **[VS Code Azure 擴充功能](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 整合

---

**🎉 恭喜！** 你已成功部署一個具備自動縮放與監控功能的生產等級 Flask API 至 Azure Container Apps。

**有問題嗎？** [提出議題](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [常見問題](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件經由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保翻譯的準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用此翻譯而導致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->