<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-20T09:43:04+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "mo"
}
-->
# 簡單 Flask API - 容器應用程式範例

**學習路徑:** 初學者 ⭐ | **時間:** 25-35 分鐘 | **成本:** 每月 $0-15

一個完整、可運作的 Python Flask REST API，使用 Azure Developer CLI (azd) 部署到 Azure Container Apps。本範例展示了容器部署、自動擴展及監控的基本概念。

## 🎯 學習目標

- 部署容器化的 Python 應用程式到 Azure
- 配置自動擴展，支援零負載縮減
- 實現健康檢查及準備檢查
- 監控應用程式日誌及指標
- 使用 Azure Developer CLI 快速部署

## 📦 包含內容

✅ **Flask 應用程式** - 完整的 REST API，包含 CRUD 操作 (`src/app.py`)  
✅ **Dockerfile** - 適合生產環境的容器配置  
✅ **Bicep 基礎架構** - 容器應用程式環境及 API 部署  
✅ **AZD 配置** - 一鍵部署設置  
✅ **健康檢查** - 配置了存活性及準備性檢查  
✅ **自動擴展** - 根據 HTTP 負載，0-10 副本  

## 架構

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

### 必需
- **Azure Developer CLI (azd)** - [安裝指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure 訂閱** - [免費帳戶](https://azure.microsoft.com/free/)
- **Docker Desktop** - [安裝 Docker](https://www.docker.com/products/docker-desktop/)（用於本地測試）

### 驗證先決條件

```bash
# 檢查 azd 版本（需要 1.5.0 或更高版本）
azd version

# 驗證 Azure 登錄
azd auth login

# 檢查 Docker（可選，用於本地測試）
docker --version
```

## ⏱️ 部署時間表

| 階段 | 時間 | 發生的事情 |
|------|------|------------|
| 環境設置 | 30 秒 | 建立 azd 環境 |
| 建立容器 | 2-3 分鐘 | Docker 建立 Flask 應用程式 |
| 配置基礎架構 | 3-5 分鐘 | 建立容器應用程式、註冊表、監控 |
| 部署應用程式 | 2-3 分鐘 | 推送映像並部署到容器應用程式 |
| **總計** | **8-12 分鐘** | 完成部署準備 |

## 快速開始

```bash
# 導航至範例
cd examples/container-app/simple-flask-api

# 初始化環境（選擇唯一名稱）
azd env new myflaskapi

# 部署所有內容（基礎設施 + 應用程式）
azd up
# 您將被提示：
# 1. 選擇 Azure 訂閱
# 2. 選擇位置（例如，eastus2）
# 3. 等待 8-12 分鐘完成部署

# 獲取您的 API 端點
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
# 查看已部署的服務
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

# 創建項目
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 獲取所有項目
curl $API_URL/api/items
```

**成功標準:**
- ✅ 健康檢查端點返回 HTTP 200
- ✅ 根端點顯示 API 資訊
- ✅ POST 創建項目並返回 HTTP 201
- ✅ GET 返回已創建的項目

### 步驟 3: 查看日誌

```bash
# 即時串流日誌
azd logs api --follow

# 你應該看到：
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
|------|------|------|
| `/health` | GET | 健康檢查 |
| `/api/items` | GET | 列出所有項目 |
| `/api/items` | POST | 創建新項目 |
| `/api/items/{id}` | GET | 獲取特定項目 |
| `/api/items/{id}` | PUT | 更新項目 |
| `/api/items/{id}` | DELETE | 刪除項目 |

## 配置

### 環境變數

```bash
# 設置自定義配置
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 擴展配置

API 根據 HTTP 流量自動擴展：
- **最小副本數**: 0（閒置時縮減至零）
- **最大副本數**: 10
- **每副本的並發請求數**: 50

## 開發

### 本地運行

```bash
# 安裝依賴項目
cd src
pip install -r requirements.txt

# 執行應用程式
python app.py

# 本地測試
curl http://localhost:8000/health
```

### 建立及測試容器

```bash
# 建立 Docker 映像檔
docker build -t flask-api:local ./src

# 在本地運行容器
docker run -p 8000:8000 flask-api:local

# 測試容器
curl http://localhost:8000/health
```

## 部署

### 完整部署

```bash
# 部署基礎設施和應用程式
azd up
```

### 僅代碼部署

```bash
# 僅部署應用程式代碼（基礎設施不變）
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
# 即時串流日誌
azd logs api --follow

# 查看最後100行
azd logs api --tail 100
```

### 監控指標

```bash
# 打開 Azure Monitor 儀表板
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

預期響應：
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### 創建項目

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### 獲取所有項目

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## 成本優化

此部署使用零負載縮減，因此僅在 API 處理請求時付費：

- **閒置成本**: ~$0/月（縮減至零）
- **活躍成本**: ~$0.000024/秒每副本
- **預期每月成本**（輕量使用）: $5-15

### 進一步降低成本

```bash
# 縮減開發環境的最大副本數量
azd env set MAX_REPLICAS 3

# 使用較短的閒置超時時間
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5分鐘
```

## 疑難排解

### 容器無法啟動

```bash
# 檢查容器日誌
azd logs api --tail 100

# 驗證 Docker 映像在本地構建
docker build -t test ./src
```

### API 無法訪問

```bash
# 驗證入口是外部
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 響應時間過長

```bash
# 檢查 CPU/記憶體使用情況
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 如有需要擴展資源
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

1. **添加資料庫** - 整合 Azure Cosmos DB 或 SQL Database
   ```bash
   # 添加 Cosmos DB 模組到 infra/main.bicep
   # 更新 app.py 以連接資料庫
   ```

2. **添加身份驗證** - 實現 Azure AD 或 API 密鑰
   ```python
   # 添加身份驗證中介軟件到 app.py
   from functools import wraps
   ```

3. **設置 CI/CD** - GitHub Actions 工作流程
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **添加管理身份** - 安全訪問 Azure 服務
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 相關範例

- **[資料庫應用程式](../../../../../examples/database-app)** - 包含 SQL Database 的完整範例
- **[微服務](../../../../../examples/container-app/microservices)** - 多服務架構
- **[容器應用程式主指南](../README.md)** - 所有容器模式

### 學習資源

- 📚 [AZD 初學者課程](../../../README.md) - 主課程首頁
- 📚 [容器應用程式模式](../README.md) - 更多部署模式
- 📚 [AZD 模板庫](https://azure.github.io/awesome-azd/) - 社群模板

## 附加資源

### 文件
- **[Flask 文件](https://flask.palletsprojects.com/)** - Flask 框架指南
- **[Azure 容器應用程式](https://learn.microsoft.com/azure/container-apps/)** - 官方 Azure 文件
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 命令參考

### 教程
- **[容器應用程式快速入門](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 部署您的第一個應用程式
- **[Python 在 Azure 上](https://learn.microsoft.com/azure/developer/python/)** - Python 開發指南
- **[Bicep 語言](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 基礎架構即代碼

### 工具
- **[Azure Portal](https://portal.azure.com)** - 視覺化管理資源
- **[VS Code Azure 擴展](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 整合

---

**🎉 恭喜！** 您已成功部署一個具備自動擴展及監控功能的生產級 Flask API 到 Azure 容器應用程式。

**有問題嗎？** [提交問題](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->