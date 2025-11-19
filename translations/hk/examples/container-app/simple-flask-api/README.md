<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1c0a9f09606dbd775c684b2a1143e546",
  "translation_date": "2025-11-19T12:53:00+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "hk"
}
-->
# 簡單 Flask API - 容器應用程式範例

一個基本的 Python Flask REST API，使用 AZD CLI 部署到 Azure Container Apps。

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

- 已安裝 Azure Developer CLI (azd)
- 本地已安裝 Docker
- Azure 訂閱

## 快速開始

```bash
# Clone and navigate
cd examples/container-app/simple-flask-api

# Initialize environment
azd env new dev

# Deploy everything
azd up

# Test the API
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
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
| `/api/items` | POST | 新增項目 |
| `/api/items/{id}` | GET | 獲取特定項目 |
| `/api/items/{id}` | PUT | 更新項目 |
| `/api/items/{id}` | DELETE | 刪除項目 |

## 配置

### 環境變數

```bash
# Set custom configuration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 擴展配置

API 會根據 HTTP 流量自動擴展：
- **最少副本數**: 0（閒置時縮減至零）
- **最多副本數**: 10
- **每個副本的並發請求數**: 50

## 開發

### 本地運行

```bash
# Install dependencies
cd src
pip install -r requirements.txt

# Run the app
python app.py

# Test locally
curl http://localhost:8000/health
```

### 建立及測試容器

```bash
# Build Docker image
docker build -t flask-api:local ./src

# Run container locally
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## 部署

### 完整部署

```bash
# Deploy infrastructure and application
azd up
```

### 僅代碼部署

```bash
# Deploy only application code (infrastructure unchanged)
azd deploy api
```

### 更新配置

```bash
# Update environment variables
azd env set API_KEY "new-api-key"

# Redeploy with new configuration
azd deploy api
```

## 監控

### 查看日誌

```bash
# Stream live logs
azd logs api --follow

# View last 100 lines
azd logs api --tail 100
```

### 監控指標

```bash
# Open Azure Monitor dashboard
azd monitor --overview

# View specific metrics
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

### 新增項目

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

此部署使用零擴展，因此只有在 API 處理請求時才需付費：

- **閒置成本**: 約 $0/月（縮減至零）
- **活躍成本**: 每副本每秒約 $0.000024
- **預期每月成本**（輕量使用）: $5-15

### 進一步降低成本

```bash
# Scale down max replicas for dev
azd env set MAX_REPLICAS 3

# Use shorter idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## 疑難排解

### 容器無法啟動

```bash
# Check container logs
azd logs api --tail 100

# Verify Docker image builds locally
docker build -t test ./src
```

### API 無法訪問

```bash
# Verify ingress is external
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 回應時間過長

```bash
# Check CPU/Memory usage
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Scale up resources if needed
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 清理

```bash
# Delete all resources
azd down --force --purge
```

## 下一步

- 添加數據庫整合（請參閱 [database-integration 範例](../../../../../examples/container-app/database-integration)）
- 實現身份驗證（請參閱 [auth-example](../../../../../examples/container-app/auth-example)）
- 設置 CI/CD 管道（請參閱 [cicd-example](../../../../../examples/container-app/cicd-example)）
- 添加 Dapr 用於微服務（請參閱 [dapr-example](../../../../../examples/container-app/dapr-example)）

## 其他資源

- [Flask 文件](https://flask.palletsprojects.com/)
- [Azure Container Apps 文件](https://learn.microsoft.com/azure/container-apps/)
- [AZD Container Apps 指南](../../../docs/microsoft-foundry/ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業的人類翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->