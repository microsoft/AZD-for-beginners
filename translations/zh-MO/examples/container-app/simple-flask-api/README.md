# 簡單 Flask API - Container App 範例

**學習路徑：** 初學者 ⭐ | **時間：** 25-35 分鐘 | **費用：** $0-15/月

一個完整可運作的 Python Flask REST API，使用 Azure Developer CLI (azd) 部署到 Azure Container Apps。此範例示範容器部署、自動縮放以及監控基礎。

## 🎯 你將學到什麼

- 將容器化的 Python 應用部署到 Azure
- 設定具有縮至零功能的自動縮放
- 實作存活與就緒健康檢查
- 監控應用程式日誌與指標
- 使用 Azure Developer CLI 進行快速部署

## 📦 包含內容

✅ **Flask Application** - 完整的 REST API 含 CRUD 操作 (`src/app.py`)  
✅ **Dockerfile** - 可用於生產的容器設定  
✅ **Bicep Infrastructure** - Container Apps 環境與 API 部署  
✅ **AZD Configuration** - 一條指令即可部署的設定  
✅ **Health Probes** - 已設定的存活與就緒檢查  
✅ **Auto-scaling** - 根據 HTTP 負載自動在 0-10 個複本間調整  

## Architecture

```mermaid
graph TD
    subgraph ACA[Azure Container Apps 環境]
        Flask[Flask API 容器<br/>健康端點<br/>REST API<br/>自動縮放 0-10 個副本]
        AppInsights[Application Insights (應用程式洞察)]
    end
```
## Prerequisites

### Required
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (for local testing)

### Verify Prerequisites

```bash
# 檢查 azd 版本（需要 1.5.0 或更高）
azd version

# 驗證 Azure 登入
azd auth login

# 檢查 Docker（可選，供本機測試）
docker --version
```

## ⏱️ 部署時間表

| 階段 | 時間 | 發生內容 |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| <strong>總計</strong> | **8-12 minutes** | 完成部署並可使用 |

## Quick Start

```bash
# 前往範例
cd examples/container-app/simple-flask-api

# 初始化環境（選擇唯一名稱）
azd env new myflaskapi

# 部署全部（基礎設施 + 應用程式）
azd up
# 系統會提示你：
# 1. 選擇 Azure 訂閱
# 2. 選擇位置（例如 eastus2）
# 3. 等待 8–12 分鐘以完成部署

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

### 步驟 1：檢查部署狀態

```bash
# 檢視已部署的服務
azd show

# 預期輸出顯示：
# - 服務：api
# - 端點：https://ca-api-[env].xxx.azurecontainerapps.io
# - 狀態：執行中
```

### 步驟 2：測試 API 端點

```bash
# 取得 API 端點
API_URL=$(azd env get-value API_ENDPOINT)

# 健康檢查
curl $API_URL/health

# 測試根端點
curl $API_URL/

# 建立一個項目
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 取得所有項目
curl $API_URL/api/items
```

**成功標準：**
- ✅ 健康端點回傳 HTTP 200
- ✅ 根端點顯示 API 資訊
- ✅ POST 建立項目並回傳 HTTP 201
- ✅ GET 回傳已建立的項目

### 步驟 3：檢視日誌

```bash
# 使用 azd monitor 串流即時日誌
azd monitor --logs

# 或使用 Azure CLI：
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 你應該會看到：
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

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | 健康檢查 |
| `/api/items` | GET | 列出所有項目 |
| `/api/items` | POST | 新增項目 |
| `/api/items/{id}` | GET | 取得特定項目 |
| `/api/items/{id}` | PUT | 更新項目 |
| `/api/items/{id}` | DELETE | 刪除項目 |

## 設定

### 環境變數

```bash
# 設定自訂配置
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 縮放設定

此 API 會根據 HTTP 流量自動縮放：
- <strong>最小複本數</strong>：0（閒置時縮至零）
- <strong>最大複本數</strong>：10
- <strong>每個複本的併發請求數</strong>：50

## 開發

### 在本地執行

```bash
# 安裝相依套件
cd src
pip install -r requirements.txt

# 執行應用程式
python app.py

# 在本機測試
curl http://localhost:8000/health
```

### 建構並測試容器

```bash
# 建立 Docker 映像
docker build -t flask-api:local ./src

# 在本地執行容器
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

### 僅程式碼部署

```bash
# 僅部署應用程式的程式碼（基礎架構不變）
azd deploy api
```

### 更新設定

```bash
# 更新環境變數
azd env set API_KEY "new-api-key"

# 使用新設定重新部署
azd deploy api
```

## 監控

### 檢視日誌

```bash
# 使用 azd monitor 串流即時日誌
azd monitor --logs

# 或使用適用於 Container Apps 的 Azure CLI：
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 檢視最後 100 行
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### 監控指標

```bash
# 開啟 Azure Monitor 儀表板
azd monitor --overview

# 檢視特定指標
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

此部署使用縮至零 (scale-to-zero)，因此只有在 API 處理請求時才會產生費用：

- <strong>閒置成本</strong>：約 $0/月（縮至零）
- <strong>啟用時成本</strong>：約 $0.000024/秒/每個複本
- <strong>預期每月成本</strong>（輕量使用）：$5-15

### 進一步降低成本

```bash
# 為開發環境縮減最大副本數
azd env set MAX_REPLICAS 3

# 使用較短的閒置逾時
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 分鐘
```

## 故障排除

### 容器無法啟動

```bash
# 使用 Azure CLI 檢查容器日誌
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# 在本機驗證 Docker 映像是否能成功建置
docker build -t test ./src
```

### API 無法存取

```bash
# 驗證 ingress 是否為外部
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 響應時間過長

```bash
# 檢查 CPU/記憶體使用量
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 如有需要，擴充資源
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 清理

```bash
# 刪除所有資源
azd down --force --purge
```

## 下一步

### 擴展此範例

1. <strong>新增資料庫</strong> - 整合 Azure Cosmos DB 或 SQL Database
   ```bash
   # 將 Cosmos DB 模組加入 infra/main.bicep
   # 更新 app.py，加入資料庫連線
   ```

2. <strong>新增驗證</strong> - 實作 Azure AD 或 API 金鑰
   ```python
   # 將驗證中介軟體加入到 app.py
   from functools import wraps
   ```

3. **建立 CI/CD** - GitHub Actions 工作流程
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. <strong>新增託管身分</strong> - 安全存取 Azure 服務
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 相關範例

- **[資料庫應用程式](../../../../../examples/database-app)** - 含 SQL Database 的完整範例
- **[微服務](../../../../../examples/container-app/microservices)** - 多服務架構
- **[Container Apps 綜合指南](../README.md)** - 所有容器模式

### 學習資源

- 📚 [AZD 新手課程](../../../README.md) - 主要課程首頁
- 📚 [Container Apps 範例模式](../README.md) - 更多部署模式
- 📚 [AZD 範本集錦](https://azure.github.io/awesome-azd/) - 社群範本

## 其他資源

### 文件
- **[Flask 文件](https://flask.palletsprojects.com/)** - Flask 框架指南
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 官方 Azure 文件
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 指令參考

### 教學
- **[Container Apps 快速入門](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 部署你的第一個應用
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python 開發指南
- **[Bicep 語言](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 基礎架構即程式碼

### 工具
- **[Azure 入口網站](https://portal.azure.com)** - 以視覺化方式管理資源
- **[VS Code Azure 延伸功能](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 整合

---

**🎉 恭喜！** 你已將一個具備自動縮放與監控的生產可用 Flask API 部署到 Azure Container Apps。

**有問題嗎？** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而導致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->