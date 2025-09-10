<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:04:59+00:00",
  "source_file": "examples/README.md",
  "language_code": "hk"
}
-->
# 範例 - 實用的 AZD 模板與配置

## 簡介

此目錄包含實用範例、模板及真實場景，幫助您通過實際操作學習 Azure Developer CLI。每個範例都提供完整的工作代碼、基礎設施模板以及針對不同應用架構和部署模式的詳細指導。

## 學習目標

通過這些範例，您將能夠：
- 在真實應用場景中練習 Azure Developer CLI 的工作流程
- 理解不同應用架構及其 AZD 實現方式
- 掌握針對各種 Azure 服務的基礎設施即代碼模式
- 應用配置管理及針對環境的部署策略
- 在實際情境中實現監控、安全性及擴展模式
- 累積排查及調試真實部署場景的經驗

## 學習成果

完成這些範例後，您將能夠：
- 自信地使用 Azure Developer CLI 部署各類型應用
- 根據自己的應用需求調整提供的模板
- 使用 Bicep 設計並實現自定義基礎設施模式
- 配置具有正確依賴關係的複雜多服務應用
- 在真實場景中應用安全性、監控及性能最佳實踐
- 根據實際經驗排查及優化部署

## 目錄結構

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## 快速入門範例

### 初學者
1. **[簡單網頁應用](../../../examples/simple-web-app)** - 部署基本的 Node.js 網頁應用
2. **[靜態網站](../../../examples/static-website)** - 在 Azure Storage 上託管靜態網站
3. **[容器應用](../../../examples/container-app)** - 部署容器化應用

### 中級使用者
4. **[數據庫應用](../../../examples/database-app)** - 帶有 PostgreSQL 數據庫的網頁應用
5. **[無伺服器函數](../../../examples/serverless-function)** - 帶有 HTTP 觸發器的 Azure Functions
6. **[微服務](../../../examples/microservices)** - 帶有 API 閘道的多服務應用

## 📋 使用指導

### 本地運行範例

1. **克隆或複製範例**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **初始化 AZD 環境**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **配置環境**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **部署**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### 調整範例

每個範例包括：
- **README.md** - 詳細的設置及自定義指導
- **azure.yaml** - 帶有註解的 AZD 配置
- **infra/** - 帶有參數說明的 Bicep 模板
- **src/** - 示例應用代碼
- **scripts/** - 常用任務的輔助腳本

## 🎯 學習目標

### 範例分類

#### **基礎部署**
- 單一服務應用
- 簡單的基礎設施模式
- 基礎配置管理
- 成本效益高的開發設置

#### **進階場景**
- 多服務架構
- 複雜的網絡配置
- 數據庫集成模式
- 安全性及合規性實現

#### **生產級模式**
- 高可用性配置
- 監控及可觀察性
- CI/CD 集成
- 災難恢復設置

## 📖 範例描述

### 簡單網頁應用
**技術**: Node.js, App Service, Application Insights  
**複雜度**: 初學者  
**概念**: 基本部署、環境變數、健康檢查

### 靜態網站
**技術**: HTML/CSS/JS, Storage Account, CDN  
**複雜度**: 初學者  
**概念**: 靜態託管、CDN 集成、自定義域名

### 容器應用
**技術**: Docker, Container Apps, Container Registry  
**複雜度**: 中級  
**概念**: 容器化、擴展、入口配置

### 數據庫應用
**技術**: Python Flask, PostgreSQL, App Service  
**複雜度**: 中級  
**概念**: 數據庫連接、秘密管理、遷移

### 無伺服器函數
**技術**: Azure Functions, Cosmos DB, API Management  
**複雜度**: 中級  
**概念**: 事件驅動架構、綁定、API 管理

### 微服務
**技術**: 多個服務、Service Bus、API Gateway  
**複雜度**: 高級  
**概念**: 服務通信、消息隊列、負載均衡

## 🛠 配置範例

`configurations/` 目錄包含可重用的組件：

### 環境配置
- 開發環境設置
- 測試環境配置
- 生產級配置
- 多區域部署設置

### Bicep 模塊
- 可重用的基礎設施組件
- 常見資源模式
- 加強安全性的模板
- 成本優化配置

### 輔助腳本
- 環境設置自動化
- 數據庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自定義指南

### 調整範例以適應您的使用情境

1. **檢查先決條件**
   - 確認 Azure 服務需求
   - 驗證訂閱限制
   - 理解成本影響

2. **修改配置**
   - 更新 `azure.yaml` 服務定義
   - 自定義 Bicep 模板
   - 調整環境變數

3. **徹底測試**
   - 首先部署到開發環境
   - 驗證功能
   - 測試擴展性及性能

4. **安全性審查**
   - 檢查訪問控制
   - 實現秘密管理
   - 啟用監控及警報

## 📊 比較矩陣

| 範例 | 服務 | 數據庫 | 認證 | 監控 | 複雜度 |
|------|------|--------|------|------|--------|
| 簡單網頁應用 | 1 | ❌ | 基本 | 基本 | ⭐ |
| 靜態網站 | 1 | ❌ | ❌ | 基本 | ⭐ |
| 容器應用 | 1 | ❌ | 基本 | 完整 | ⭐⭐ |
| 數據庫應用 | 2 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| 無伺服器函數 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| 微服務 | 5+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |

## 🎓 學習路徑

### 推薦進度

1. **從簡單網頁應用開始**
   - 學習基本 AZD 概念
   - 理解部署工作流程
   - 練習環境管理

2. **嘗試靜態網站**
   - 探索不同的託管選項
   - 學習 CDN 集成
   - 理解 DNS 配置

3. **進入容器應用**
   - 學習容器化基礎
   - 理解擴展概念
   - 練習使用 Docker

4. **添加數據庫集成**
   - 學習數據庫配置
   - 理解連接字符串
   - 練習秘密管理

5. **探索無伺服器架構**
   - 理解事件驅動架構
   - 學習觸發器及綁定
   - 練習使用 API

6. **構建微服務**
   - 學習服務通信
   - 理解分布式系統
   - 練習複雜部署

## 🔍 找到合適的範例

### 按技術堆疊
- **Node.js**: 簡單網頁應用、微服務
- **Python**: 數據庫應用、無伺服器函數
- **靜態網站**: 靜態網站
- **容器**: 容器應用、微服務
- **數據庫**: 數據庫應用、無伺服器函數

### 按架構模式
- **單體架構**: 簡單網頁應用、數據庫應用
- **靜態架構**: 靜態網站
- **微服務架構**: 微服務範例
- **無伺服器架構**: 無伺服器函數
- **混合架構**: 容器應用

### 按複雜度級別
- **初學者**: 簡單網頁應用、靜態網站
- **中級**: 容器應用、數據庫應用、無伺服器函數  
- **高級**: 微服務

## 📚 附加資源

### 文件連結
- [Azure AI Foundry AZD 模板](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure 範例 AZD 模板](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry 模板](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI 資源庫](https://azure.github.io/awesome-azd/)

### 最佳實踐
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 範例貢獻

有有用的範例想分享嗎？我們歡迎您的貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含全面的 README.md
3. 為配置文件添加註解
4. 在提交前徹底測試
5. 包含成本估算及先決條件

### 範例模板結構
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**專業提示**: 從最簡單的範例開始，選擇符合您技術堆疊的範例，然後逐步進階到更複雜的場景。每個範例都基於前一個範例的概念進行構建！

**下一步**: 
- 選擇符合您技能水平的範例
- 按範例 README 中的設置指導操作
- 嘗試自定義
- 與社群分享您的學習成果

---

**導航**
- **上一課**: [學習指南](../resources/study-guide.md)
- **返回**: [主 README](../README.md)

---

**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋概不負責。