<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T20:15:43+00:00",
  "source_file": "resources/faq.md",
  "language_code": "mo"
}
-->
# 常見問題 (FAQ)

## 簡介

這份全面的常見問題解答提供了關於 Azure Developer CLI (azd) 和 Azure 部署的最常見問題的答案。快速找到解決方案，了解最佳實踐，並釐清 azd 的概念和工作流程。

## 學習目標

透過閱讀這份常見問題解答，您將能夠：
- 快速找到 Azure Developer CLI 的常見問題和解決方案
- 透過實用的問答形式理解關鍵概念和術語
- 獲得常見問題和錯誤場景的故障排除解決方案
- 透過常見的優化問題學習最佳實踐
- 探索進階功能和能力，解答專家級問題
- 高效參考成本、安全性和部署策略指導

## 學習成果

定期參考這份常見問題解答，您將能夠：
- 獨立解決 Azure Developer CLI 的常見問題，使用提供的解決方案
- 就部署策略和配置做出明智的決策
- 理解 azd 與其他 Azure 工具和服務的關係
- 根據社群經驗和專家建議應用最佳實踐
- 有效地排除身份驗證、部署和配置問題
- 使用常見問題解答中的建議優化成本和性能

## 目錄

- [入門指南](../../../resources)
- [身份驗證與存取](../../../resources)
- [範本與專案](../../../resources)
- [部署與基礎架構](../../../resources)
- [配置與環境](../../../resources)
- [故障排除](../../../resources)
- [成本與計費](../../../resources)
- [最佳實踐](../../../resources)
- [進階主題](../../../resources)

---

## 入門指南

### 問：什麼是 Azure Developer CLI (azd)？
**答**：Azure Developer CLI (azd) 是一個以開發者為中心的命令列工具，能加速將應用程式從本地開發環境部署到 Azure 的時間。它透過範本提供最佳實踐，並協助完成整個部署生命周期。

### 問：azd 與 Azure CLI 有什麼不同？
**答**：
- **Azure CLI**：通用工具，用於管理 Azure 資源
- **azd**：以開發者為重點的工具，用於應用程式部署工作流程
- azd 內部使用 Azure CLI，但提供更高層次的抽象以適應常見的開發場景
- azd 包含範本、環境管理和部署自動化功能

### 問：使用 azd 是否需要安裝 Azure CLI？
**答**：是的，azd 需要 Azure CLI 進行身份驗證和部分操作。請先安裝 Azure CLI，然後再安裝 azd。

### 問：azd 支援哪些程式語言？
**答**：azd 是語言無關的，支援以下語言：
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 靜態網站
- 容器化應用程式

### 問：我可以將 azd 用於現有專案嗎？
**答**：可以！您可以：
1. 使用 `azd init` 為現有專案新增 azd 配置
2. 調整現有專案以符合 azd 範本結構
3. 根據現有架構建立自訂範本

---

## 身份驗證與存取

### 問：如何使用 azd 與 Azure 進行身份驗證？
**答**：使用 `azd auth login`，它會開啟瀏覽器窗口進行 Azure 身份驗證。對於 CI/CD 場景，請使用服務主體或受管理的身份。

### 問：我可以使用 azd 管理多個 Azure 訂閱嗎？
**答**：可以。使用 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` 為每個環境指定要使用的訂閱。

### 問：使用 azd 部署需要哪些權限？
**答**：通常需要：
- **Contributor** 角色，用於資源群組或訂閱
- **User Access Administrator**，如果部署的資源需要角色分配
- 具體權限因範本和部署的資源而異

### 問：我可以在 CI/CD 管道中使用 azd 嗎？
**答**：當然可以！azd 專為 CI/CD 整合設計。使用服務主體進行身份驗證，並設置環境變數進行配置。

### 問：如何在 GitHub Actions 中處理身份驗證？
**答**：使用 Azure Login action 並提供服務主體憑證：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 範本與專案

### 問：在哪裡可以找到 azd 範本？
**答**：
- 官方範本：[Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社群範本：在 GitHub 搜尋 "azd-template"
- 使用 `azd template list` 瀏覽可用範本

### 問：如何建立自訂範本？
**答**：
1. 從現有範本結構開始
2. 修改 `azure.yaml`、基礎架構文件和應用程式代碼
3. 使用 `azd up` 進行全面測試
4. 發佈到 GitHub 並添加適當的標籤

### 問：我可以不使用範本來使用 azd 嗎？
**答**：可以，使用 `azd init` 在現有專案中建立必要的配置文件。您需要手動配置 `azure.yaml` 和基礎架構文件。

### 問：官方範本與社群範本有什麼不同？
**答**：
- **官方範本**：由 Microsoft 維護，定期更新，提供全面的文件
- **社群範本**：由開發者創建，可能有專門的使用案例，品質和維護程度各異

### 問：如何更新專案中的範本？
**答**：範本不會自動更新。您可以：
1. 手動比較並合併來自原始範本的更改
2. 使用更新的範本重新執行 `azd init`
3. 從更新的範本中挑選特定改進

---

## 部署與基礎架構

### 問：azd 可以部署哪些 Azure 服務？
**答**：azd 可以透過 Bicep/ARM 範本部署任何 Azure 服務，包括：
- App Services、Container Apps、Functions
- 資料庫 (SQL、PostgreSQL、Cosmos DB)
- 儲存、Key Vault、Application Insights
- 網路、安全性和監控資源

### 問：我可以部署到多個地區嗎？
**答**：可以，在您的 Bicep 範本中配置多個地區，並為每個環境適當設置位置參數。

### 問：如何處理資料庫架構遷移？
**答**：在 `azure.yaml` 中使用部署掛鉤：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### 問：我可以僅部署基礎架構而不部署應用程式嗎？
**答**：可以，使用 `azd provision` 只部署範本中定義的基礎架構元件。

### 問：如何部署到現有的 Azure 資源？
**答**：這比較複雜，並非直接支援。您可以：
1. 將現有資源導入到您的 Bicep 範本中
2. 在範本中引用現有資源
3. 修改範本以有條件地創建或引用資源

### 問：我可以使用 Terraform 而不是 Bicep 嗎？
**答**：目前，azd 主要支援 Bicep/ARM 範本。Terraform 尚未正式支援，但可能有社群解決方案。

---

## 配置與環境

### 問：如何管理不同的環境 (開發、測試、正式)？
**答**：使用 `azd env new <environment-name>` 創建獨立的環境，並為每個環境配置不同的設置：
```bash
azd env new development
azd env new staging  
azd env new production
```

### 問：環境配置存儲在哪裡？
**答**：存儲在專案目錄中的 `.azure` 資料夾內。每個環境都有自己的資料夾和配置文件。

### 問：如何設置環境特定的配置？
**答**：使用 `azd env set` 設置環境變數：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### 問：我可以與團隊成員共享環境配置嗎？
**答**：`.azure` 資料夾包含敏感信息，不應提交到版本控制。建議：
1. 文件化所需的環境變數
2. 使用部署腳本設置環境
3. 使用 Azure Key Vault 存儲敏感配置

### 問：如何覆蓋範本預設值？
**答**：設置與範本參數對應的環境變數：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 故障排除

### 問：為什麼 `azd up` 失敗？
**答**：常見原因：
1. **身份驗證問題**：執行 `azd auth login`
2. **權限不足**：檢查您的 Azure 角色分配
3. **資源命名衝突**：更改 AZURE_ENV_NAME
4. **配額/容量問題**：檢查地區可用性
5. **範本錯誤**：驗證 Bicep 範本

### 問：如何調試部署失敗？
**答**：
1. 使用 `azd deploy --debug` 獲取詳細輸出
2. 檢查 Azure 入口網站的部署歷史
3. 查看 Azure 入口網站中的活動日誌
4. 使用 `azd show` 顯示當前環境狀態

### 問：為什麼我的環境變數不起作用？
**答**：檢查：
1. 變數名稱是否與範本參數完全匹配
2. 值是否正確引用，特別是包含空格的情況
3. 是否選擇了正確的環境：`azd env select <environment>`
4. 變數是否設置在正確的環境中

### 問：如何清理失敗的部署？
**答**：
```bash
azd down --force --purge
```
這將移除所有資源和環境配置。

### 問：為什麼我的應用程式在部署後無法訪問？
**答**：檢查：
1. 部署是否成功完成
2. 應用程式是否正在運行 (在 Azure 入口網站查看日誌)
3. 網路安全群組是否允許流量
4. DNS/自訂域名是否正確配置

---

## 成本與計費

### 問：azd 部署的成本是多少？
**答**：成本取決於：
- 部署的 Azure 服務
- 選擇的服務層級/SKU
- 地區定價差異
- 使用模式

使用 [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/) 進行估算。

### 問：如何控制 azd 部署的成本？
**答**：
1. 為開發環境使用較低層級的 SKU
2. 設置 Azure 預算和警報
3. 使用 `azd down` 在不需要時移除資源
4. 選擇適當的地區 (成本因地區而異)
5. 使用 Azure 成本管理工具

### 問：azd 範本是否有免費層選項？
**答**：許多 Azure 服務提供免費層：
- App Service：提供免費層
- Azure Functions：每月 1M 次免費執行
- Cosmos DB：提供 400 RU/s 的免費層
- Application Insights：每月前 5GB 免費

在範本中配置可用的免費層。

### 問：如何在部署前估算成本？
**答**：
1. 查看範本的 `main.bicep` 了解創建的資源
2. 使用 Azure 價格計算器選擇特定 SKU
3. 先部署到開發環境以監控實際成本
4. 使用 Azure 成本管理進行詳細成本分析

---

## 最佳實踐

### 問：azd 專案結構的最佳實踐是什麼？
**答**：
1. 將應用程式代碼與基礎架構分開
2. 在 `azure.yaml` 中使用有意義的服務名稱
3. 在建置腳本中實施適當的錯誤處理
4. 使用環境特定的配置
5. 包含全面的文件

### 問：如何在 azd 中組織多個服務？
**答**：使用推薦的結構：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### 問：我應該將 `.azure` 資料夾提交到版本控制嗎？
**答**：**不可以！** `.azure` 資料夾包含敏感信息。將其添加到 `.gitignore`：
```gitignore
.azure/
```

### 問：如何處理秘密和敏感配置？
**答**：
1. 使用 Azure Key Vault 存儲秘密
2. 在應用程式配置中引用 Key Vault 的秘密
3. 絕不要將秘密提交到版本控制
4. 使用受管理的身份進行服務間身份驗證

### 問：使用 azd 進行 CI/CD 的推薦方法是什麼？
**答**：
1. 為每個階段 (開發/測試/正式) 使用獨立的環境
2. 在部署前實施自動化測試
3. 使用服務主體進行身份驗證
4. 在管道秘密/變數中存儲敏感配置
5. 為正式部署實施批准流程

---

## 進階主題

### 問：我可以擴展 azd 的自訂功能嗎？
**答**：可以，透過在 `azure.yaml` 中使用部署掛鉤：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### 問：如何將 azd 整合到現有的 DevOps 流程中？
**答**：
1. 在現有管道腳本中使用 azd 命令
2. 在團隊中標準化 azd 範本
3. 與現有的監控和警報系統整合
4. 使用 azd 的 JSON 輸出進行管道整合

### 問：我可以將 azd 與 Azure DevOps 一起使用嗎？
**答**：可以，azd 與任何 CI/CD 系統兼容。建立使用 azd 命令的 Azure DevOps 管道。

### 問：如何為 azd 或社群範本做出貢獻？
**答**：
1. **azd 工具**：貢獻至 [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **範本**：按照 [範本指南](https://github.com/Azure-Samples/awesome-azd) 建立範本
3. **文件**：貢獻至 [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### 問：azd 的路線圖是什麼？
**答**：查看 [官方路線圖](https://github.com/Azure/azure-dev/projects) 了解計劃的功能和改進。

### 問：如何從其他部署工具遷移到 azd？
**答**：
1. 分析目前的部署架構  
2. 建立對應的 Bicep 模板  
3. 配置 `azure.yaml` 以符合現有服務  
4. 在開發環境中進行全面測試  
5. 逐步遷移環境  

---

## 還有疑問嗎？

### **先搜尋**
- 查看 [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- 搜尋 [GitHub 問題](https://github.com/Azure/azure-dev/issues) 以尋找類似問題  

### **尋求協助**
- [GitHub 討論區](https://github.com/Azure/azure-dev/discussions) - 社群支援  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術問題  
- [Azure Discord](https://discord.gg/azure) - 即時社群聊天  

### **回報問題**
- [GitHub 問題](https://github.com/Azure/azure-dev/issues/new) - 錯誤回報與功能請求  
- 請包含相關日誌、錯誤訊息及重現步驟  

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
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。