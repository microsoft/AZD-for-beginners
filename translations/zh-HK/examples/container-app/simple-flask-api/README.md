# Simple Flask API - Container App 範例

**學習路徑:** 初學者 ⭐ | **時間:** 25-35 分鐘 | **費用:** $0-15/月

一個完整、可運作的 Python Flask REST API，使用 Azure Developer CLI (azd) 部署到 Azure Container Apps。本範例示範容器部署、自動擴展及監控基礎。

## 🎯 你將學到什麼

- 部署容器化的 Python 應用程式到 Azure
- 配置可擴展至零的自動擴展
- 實作健康探測及準備就緒檢查
- 監控應用程式日誌和指標
- 使用 Azure Developer CLI 快速部署

## 📦 包含內容

✅ **Flask 應用程式** - 完整 REST API，含 CRUD 操作 (`src/app.py`)  
✅ **Dockerfile** - 生產環境容器設定檔  
✅ **Bicep 基礎架構** - Container Apps 環境與 API 部署  
✅ **AZD 配置** - 一鍵部署設定  
✅ <strong>健康探測</strong> - 配置存活與準備就緒檢查  
✅ <strong>自動擴展</strong> - 依 HTTP 負載 0-10 個副本擴展  

## 架構

```mermaid
graph TD
    subgraph ACA[Azure Container Apps 環境]
        Flask[Flask API 容器<br/>健康端點<br/>REST API<br/>自動縮放 0-10 個副本]
        AppInsights[應用程式洞察]
    end
```
## 前置需求

### 必要
- **Azure Developer CLI (azd)** - [安裝指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure 訂閱** - [免費帳戶](https://azure.microsoft.com/free/)
- **Docker Desktop** - [安裝 Docker](https://www.docker.com/products/docker-desktop/)（用於本機測試）

### 驗證前置需求

```bash
# 檢查 azd 版本（需要 1.5.0 或以上）
azd version

# 驗證 Azure 登入
azd auth login

# 檢查 Docker（可選，用於本地測試）
docker --version
```

## ⏱️ 部署時間軸

| 階段 | 時長 | 執行內容 |
|-------|----------|--------------||
| 環境設定 | 30 秒 | 建立 azd 環境 |
| 建置容器 | 2-3 分鐘 | 使用 Docker 建置 Flask 應用 |
| 配置基礎架構 | 3-5 分鐘 | 建立 Container Apps、註冊表、監控 |
| 部署應用程式 | 2-3 分鐘 | 推送映像並部署到 Container Apps |
| <strong>總計</strong> | **8-12 分鐘** | 完成並可立即使用 |

## 快速開始

```bash
# 導航至範例
cd examples/container-app/simple-flask-api

# 初始化環境（選擇唯一名稱）
azd env new myflaskapi

# 部署所有內容（基礎設施 + 應用程式）
azd up
# 你將會被提示：
# 1. 選擇 Azure 訂閱
# 2. 選擇地區（例如 eastus2）
# 3. 等待 8-12 分鐘完成部署

# 獲取你的 API 端點
azd env get-values

# 測試 API
curl $(azd env get-value API_ENDPOINT)/health
```

**預期輸出:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ 驗證部署

### 步驟 1: 檢查部署狀態

```bash
# 檢視已部署的服務
azd show

# 預期輸出顯示：
# - 服務：api
# - 端點：https://ca-api-[env].xxx.azurecontainerapps.io
# - 狀態：運行中
```

### 步驟 2: 測試 API 端點

```bash
# 獲取 API 端點
API_URL=$(azd env get-value API_ENDPOINT)

# 測試健康狀況
curl $API_URL/health

# 測試根端點
curl $API_URL/

# 創建一個項目
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 獲取所有項目
curl $API_URL/api/items
```

**成功標準:**
- ✅ Health 端點回傳 HTTP 200
- ✅ 根目錄顯示 API 資訊
- ✅ POST 建立項目並回傳 HTTP 201
- ✅ GET 回傳已建立的項目

### 步驟 3: 查看日誌

```bash
# 使用 azd monitor 直播串流日誌
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

### 擴展配置

API 會依 HTTP 流量自動擴展：
- <strong>最小副本數</strong>：0（閒置時擴展至零）
- <strong>最大副本數</strong>：10
- <strong>每個副本併發請求數</strong>：50

## 開發

### 本機運行

```bash
# 安裝依賴
cd src
pip install -r requirements.txt

# 運行應用程式
python app.py

# 本地測試
curl http://localhost:8000/health
```

### 建置並測試容器

```bash
# 建構 Docker 映像檔
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
# 僅部署應用程式代碼（基礎設施不變）
azd deploy api
```

### 更新配置

```bash
# 更新環境變量
azd env set API_KEY "new-api-key"

# 使用新配置重新部署
azd deploy api
```

## 監控

### 查看日誌

```bash
# 使用 azd monitor 串流即時日誌
azd monitor --logs

# 或使用 Azure CLI 進行容器應用管理：
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 查看最後 100 行
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### 監控指標

```bash
# 開啟 Azure 監察儀表板
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

預期回應:
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

此部署使用擴展至零，只有在 API 處理請求時才會產生費用：

- <strong>閒置成本</strong>：約 $0/月（擴展至零）
- <strong>活躍成本</strong>：約 $0.000024/秒/副本
- <strong>預期月成本</strong>（輕度使用）：$5-15

### 進一步降低成本

```bash
# 將開發環境的最大副本數縮減
azd env set MAX_REPLICAS 3

# 使用較短的閒置超時時間
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 分鐘
```

## 疑難排解

### 容器無法啟動

```bash
# 使用 Azure CLI 檢查容器日誌
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# 驗證本地 Docker 映像構建
docker build -t test ./src
```

### API 無法訪問

```bash
# 驗證 ingress 是否為外部
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 回應時間過長

```bash
# 檢查 CPU/記憶體使用情況
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

### 擴充此範例

1. <strong>新增資料庫</strong> - 整合 Azure Cosmos DB 或 SQL Database  
   ```bash
   # 將 Cosmos DB 模組新增至 infra/main.bicep
   # 使用資料庫連線更新 app.py
   ```

2. <strong>新增身份驗證</strong> - 實作 Azure AD 或 API 金鑰  
   ```python
   # 喺 app.py 加入身份驗證中介軟件
   from functools import wraps
   ```

3. **建立 CI/CD** - GitHub Actions 工作流程  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. <strong>新增管理身份</strong> - 確保存取 Azure 服務的安全性  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 相關範例

- **[資料庫應用程式](../../../../../examples/database-app)** - 含 SQL Database 的完整範例
- **[微服務](../../../../../examples/container-app/microservices)** - 多服務架構
- **[Container Apps 主控指南](../README.md)** - 所有容器模式

### 學習資源

- 📚 [AZD 初學者課程](../../../README.md) - 主課程首頁
- 📚 [Container Apps 模式](../README.md) - 更多部署模式
- 📚 [AZD 模板庫](https://azure.github.io/awesome-azd/) - 社群模板

## 附加資源

### 文件
- **[Flask 文件](https://flask.palletsprojects.com/)** - Flask 框架指南
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 官方 Azure 文件
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 指令參考

### 教學
- **[Container Apps 快速入門](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 部署你的第一個應用程式
- **[Azure 上的 Python](https://learn.microsoft.com/azure/developer/python/)** - Python 開發指南
- **[Bicep 語言](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 基礎架構即程式碼

### 工具
- **[Azure 入口網站](https://portal.azure.com)** - 視覺化管理資源
- **[VS Code Azure 擴充套件](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 整合

---

**🎉 恭喜！** 你已成功將具備自動擴展和監控的生產等級 Flask API 部署到 Azure Container Apps。

**有問題嗎？** [開啟議題](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [常見問題](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們致力於確保準確性，但自動翻譯可能會包含錯誤或不準確之處。應以原文文件為權威來源。對於重要資訊，建議採用專業人工翻譯。我們對使用此翻譯所引起的任何誤解或錯誤詮釋不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->