<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T19:04:57+00:00",
  "source_file": "resources/faq.md",
  "language_code": "mo"
}
-->
# 常見問題 (FAQ)

**按章節獲取幫助**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **🚆 安裝問題**: [第1章：安裝與設置](../docs/getting-started/installation.md)
- **🤖 AI相關問題**: [第2章：AI優先開發](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 疑難排解**: [第7章：疑難排解與除錯](../docs/troubleshooting/common-issues.md)

## 簡介

這份全面的常見問題解答提供了關於 Azure Developer CLI (azd) 和 Azure 部署的常見問題答案。快速找到解決方案，了解最佳實踐，並釐清 azd 的概念和工作流程。

## 學習目標

通過閱讀這份常見問題解答，您將能夠：
- 快速找到 Azure Developer CLI 的常見問題和解決方案
- 通過實用的問答形式理解關鍵概念和術語
- 獲取常見問題和錯誤場景的疑難排解方案
- 通過常見的優化問題學習最佳實踐
- 通過專家級問題探索高級功能和能力
- 高效參考成本、安全性和部署策略指導

## 學習成果

定期參考這份常見問題解答，您將能夠：
- 獨立解決 Azure Developer CLI 的常見問題，使用提供的解決方案
- 就部署策略和配置做出明智的決策
- 理解 azd 與其他 Azure 工具和服務之間的關係
- 根據社群經驗和專家建議應用最佳實踐
- 有效排除身份驗證、部署和配置問題
- 使用常見問題解答中的建議優化成本和性能

## 目錄

- [入門指南](../../../resources)
- [身份驗證與訪問](../../../resources)
- [模板與專案](../../../resources)
- [部署與基礎架構](../../../resources)
- [配置與環境](../../../resources)
- [疑難排解](../../../resources)
- [成本與計費](../../../resources)
- [最佳實踐](../../../resources)
- [高級主題](../../../resources)

---

## 入門指南

### 問：什麼是 Azure Developer CLI (azd)?
**答**: Azure Developer CLI (azd) 是一個以開發者為中心的命令列工具，能加速將應用程式從本地開發環境部署到 Azure 的過程。它通過模板提供最佳實踐，並幫助完成整個部署生命周期。

### 問：azd 與 Azure CLI 有什麼不同？
**答**: 
- **Azure CLI**: 用於管理 Azure 資源的通用工具
- **azd**: 專注於應用程式部署工作流程的開發者工具
- azd 內部使用 Azure CLI，但提供更高層次的抽象以應對常見的開發場景
- azd 包括模板、環境管理和部署自動化功能

### 問：使用 azd 是否需要安裝 Azure CLI？
**答**: 是的，azd 需要 Azure CLI 進行身份驗證和部分操作。請先安裝 Azure CLI，然後再安裝 azd。

### 問：azd 支援哪些程式語言？
**答**: azd 是語言無關的，支援以下語言：
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 靜態網站
- 容器化應用程式

### 問：我可以將 azd 用於現有專案嗎？
**答**: 可以！您可以：
1. 使用 `azd init` 為現有專案添加 azd 配置
2. 調整現有專案以符合 azd 模板結構
3. 根據現有架構創建自定義模板

---

## 身份驗證與訪問

### 問：如何使用 azd 進行 Azure 身份驗證？
**答**: 使用 `azd auth login`，它會打開瀏覽器窗口進行 Azure 身份驗證。對於 CI/CD 場景，請使用服務主體或托管身份。

### 問：azd 是否可以用於多個 Azure 訂閱？
**答**: 可以。使用 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` 為每個環境指定要使用的訂閱。

### 問：部署 azd 需要哪些權限？
**答**: 通常需要：
- **Contributor** 角色，用於資源群組或訂閱
- **User Access Administrator**，如果部署的資源需要角色分配
- 具體權限因模板和部署的資源而異

### 問：azd 可以用於 CI/CD 管道嗎？
**答**: 當然可以！azd 專為 CI/CD 集成設計。使用服務主體進行身份驗證，並設置環境變數進行配置。

### 問：如何在 GitHub Actions 中處理身份驗證？
**答**: 使用 Azure Login action 並提供服務主體憑據：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 模板與專案

### 問：在哪裡可以找到 azd 模板？
**答**: 
- 官方模板：[Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社群模板：在 GitHub 搜索 "azd-template"
- 使用 `azd template list` 瀏覽可用模板

### 問：如何創建自定義模板？
**答**: 
1. 從現有模板結構開始
2. 修改 `azure.yaml`、基礎架構文件和應用程式代碼
3. 使用 `azd up` 進行全面測試
4. 在 GitHub 上發布並添加適當的標籤

### 問：可以不使用模板直接使用 azd 嗎？
**答**: 可以，使用 `azd init` 在現有專案中創建必要的配置文件。您需要手動配置 `azure.yaml` 和基礎架構文件。

### 問：官方模板與社群模板有什麼區別？
**答**: 
- **官方模板**: 由 Microsoft 維護，定期更新，文檔全面
- **社群模板**: 由開發者創建，可能有專門用途，質量和維護情況各異

### 問：如何更新專案中的模板？
**答**: 模板不會自動更新。您可以：
1. 手動比較並合併來自源模板的更改
2. 使用更新的模板重新執行 `azd init`
3. 從更新的模板中挑選特定改進

---

## 部署與基礎架構

### 問：azd 可以部署哪些 Azure 服務？
**答**: azd 可以通過 Bicep/ARM 模板部署任何 Azure 服務，包括：
- App Services、Container Apps、Functions
- 資料庫 (SQL、PostgreSQL、Cosmos DB)
- 儲存、Key Vault、Application Insights
- 網絡、安全和監控資源

### 問：可以部署到多個地區嗎？
**答**: 可以，在 Bicep 模板中配置多個地區，並為每個環境適當設置 location 參數。

### 問：如何處理資料庫架構遷移？
**答**: 在 `azure.yaml` 中使用部署掛鉤：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### 問：可以僅部署基礎架構而不部署應用程式嗎？
**答**: 可以，使用 `azd provision` 僅部署模板中定義的基礎架構組件。

### 問：如何部署到現有的 Azure 資源？
**答**: 這比較複雜，並非直接支援。您可以：
1. 將現有資源導入到您的 Bicep 模板中
2. 在模板中引用現有資源
3. 修改模板以有條件地創建或引用資源

### 問：可以使用 Terraform 替代 Bicep 嗎？
**答**: 目前，azd 主要支援 Bicep/ARM 模板。Terraform 尚未正式支援，但可能存在社群解決方案。

---

## 配置與環境

### 問：如何管理不同的環境 (開發、測試、正式)？
**答**: 使用 `azd env new <environment-name>` 創建獨立環境，並為每個環境配置不同的設置：
```bash
azd env new development
azd env new staging  
azd env new production
```

### 問：環境配置存儲在哪裡？
**答**: 存儲在專案目錄中的 `.azure` 文件夾內。每個環境都有自己的文件夾和配置文件。

### 問：如何設置環境特定的配置？
**答**: 使用 `azd env set` 設置環境變數：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### 問：可以在團隊成員之間共享環境配置嗎？
**答**: `.azure` 文件夾包含敏感信息，不應提交到版本控制。建議：
1. 記錄所需的環境變數
2. 使用部署腳本設置環境
3. 使用 Azure Key Vault 存儲敏感配置

### 問：如何覆蓋模板默認值？
**答**: 設置與模板參數對應的環境變數：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 疑難排解

### 問：為什麼 `azd up` 失敗？
**答**: 常見原因：
1. **身份驗證問題**: 執行 `azd auth login`
2. **權限不足**: 檢查您的 Azure 角色分配
3. **資源命名衝突**: 更改 AZURE_ENV_NAME
4. **配額/容量問題**: 檢查地區可用性
5. **模板錯誤**: 驗證 Bicep 模板

### 問：如何調試部署失敗？
**答**: 
1. 使用 `azd deploy --debug` 獲取詳細輸出
2. 檢查 Azure 入口網站的部署歷史
3. 查看 Azure 入口網站中的活動日誌
4. 使用 `azd show` 顯示當前環境狀態

### 問：為什麼我的環境變數不起作用？
**答**: 檢查：
1. 變數名稱與模板參數完全匹配
2. 值中包含空格時是否正確引用
3. 是否選擇了正確的環境：`azd env select <environment>`
4. 變數是否設置在正確的環境中

### 問：如何清理失敗的部署？
**答**: 
```bash
azd down --force --purge
```
此操作會移除所有資源和環境配置。

### 問：為什麼部署後我的應用程式無法訪問？
**答**: 檢查：
1. 部署是否成功完成
2. 應用程式是否正在運行 (在 Azure 入口網站查看日誌)
3. 網絡安全組是否允許流量
4. DNS/自定義域名是否正確配置

---

## 成本與計費

### 問：azd 部署的成本是多少？
**答**: 成本取決於：
- 部署的 Azure 服務
- 選擇的服務層級/SKU
- 地區定價差異
- 使用模式

使用 [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/) 進行估算。

### 問：如何控制 azd 部署的成本？
**答**: 
1. 為開發環境使用低層級 SKU
2. 設置 Azure 預算和警報
3. 使用 `azd down` 在不需要時移除資源
4. 選擇合適的地區 (成本因地區而異)
5. 使用 Azure 成本管理工具

### 問：azd 模板是否有免費層選項？
**答**: 許多 Azure 服務提供免費層：
- App Service: 提供免費層
- Azure Functions: 每月免費執行 1M 次
- Cosmos DB: 免費層提供 400 RU/s
- Application Insights: 每月前 5GB 免費

在模板中配置使用免費層 (如果可用)。

### 問：如何在部署前估算成本？
**答**: 
1. 查看模板的 `main.bicep` 了解創建的資源
2. 使用 Azure 價格計算器選擇具體 SKU
3. 首先部署到開發環境以監控實際成本
4. 使用 Azure 成本管理進行詳細成本分析

---

## 最佳實踐

### 問：azd 專案結構的最佳實踐是什麼？
**答**: 
1. 將應用程式代碼與基礎架構分開
2. 在 `azure.yaml` 中使用有意義的服務名稱
3. 在構建腳本中實現適當的錯誤處理
4. 使用環境特定的配置
5. 包含全面的文檔

### 問：如何在 azd 中組織多個服務？
**答**: 使用推薦的結構：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### 問：是否應該將 `.azure` 文件夾提交到版本控制？
**答**: **不可以！** `.azure` 文件夾包含敏感信息。將其添加到 `.gitignore`：
```gitignore
.azure/
```

### 問：如何處理秘密和敏感配置？
**答**: 
1. 使用 Azure Key Vault 存儲秘密
2. 在應用程式配置中引用 Key Vault 的秘密
3. 絕不要將秘密提交到版本控制
4. 使用托管身份進行服務間身份驗證

### 問：使用 azd 進行 CI/CD 的推薦方法是什麼？
**答**: 
1. 為每個階段 (開發/測試/正式) 使用獨立環境
2. 在部署前實現自動化測試
3. 使用服務主體進行身份驗證
4. 在管道秘密/變數中存儲敏感配置
5. 為正式部署實現批准流程

---

## 高級主題

### 問：可以通過自定義功能擴展 azd 嗎？
**答**: 可以，通過在 `azure.yaml` 中使用部署掛鉤：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### 問：如何將 azd 與現有的 DevOps 流程集成？
**答**: 
1. 在現有管道腳本中使用 azd 命令
2. 在團隊中標準化使用 azd 模板
3. 與現有的監控和警報系統集成
4. 使用 azd 的 JSON 輸出進行管道集成

### 問：可以將 azd 用於 Azure DevOps 嗎？
**答**: 可以，azd 支援任何 CI/CD 系統。創建使用 azd 命令的 Azure DevOps 管道。

### 問：如何為 azd 貢獻或創建社群模板？
**答**: 
1. **azd 工具**: 貢獻至 [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **範本**：按照[範本指南](https://github.com/Azure-Samples/awesome-azd)建立範本  
3. **文件**：在[MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)貢獻文件  

### 問：azd 的路線圖是什麼？  
**答**：查看[官方路線圖](https://github.com/Azure/azure-dev/projects)，了解計劃中的功能和改進。  

### 問：如何從其他部署工具遷移到 azd？  
**答**：  
1. 分析目前的部署架構  
2. 建立對應的 Bicep 範本  
3. 配置 `azure.yaml` 以匹配目前的服務  
4. 在開發環境中進行全面測試  
5. 逐步遷移環境  

---

## 還有疑問嗎？

### **先搜尋**  
- 查看[官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- 搜尋[GitHub 問題](https://github.com/Azure/azure-dev/issues)，尋找類似問題  

### **尋求幫助**  
- [GitHub 討論](https://github.com/Azure/azure-dev/discussions) - 社群支援  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術問題  
- [Azure Discord](https://discord.gg/azure) - 即時社群聊天  

### **回報問題**  
- [GitHub 問題](https://github.com/Azure/azure-dev/issues/new) - 錯誤回報和功能請求  
- 包含相關日誌、錯誤訊息和重現步驟  

### **了解更多**  
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*此常見問題定期更新。最後更新日期：2025 年 9 月 9 日*  

---

**導覽**  
- **上一課**：[術語表](glossary.md)  
- **下一課**：[學習指南](study-guide.md)  

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。