# 常見問題集 (FAQ)

**按章節獲取幫助**
- **📚 課程主頁**：[AZD 初學者指南](../README.md)
- **🚆 安裝問題**：[第 1 章：安裝與設定](../docs/getting-started/installation.md)
- **🤖 人工智能問題**：[第 2 章：AI 優先開發](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 疑難排解**：[第 7 章：疑難排解與調試](../docs/troubleshooting/common-issues.md)

## 介紹

本全面 FAQ 提供了有關 Azure Developer CLI (azd) 與 Azure 部署的最常見問題解答。尋找常見問題的快速解決方案，了解最佳實踐，並澄清 azd 的概念和工作流程。

## 學習目標

透過檢視本 FAQ，您將能夠：
- 快速找到 Azure Developer CLI 常見問題與疑難解答
- 通過實際 Q&A 形式理解關鍵概念與術語
- 存取常見問題和錯誤情境的疑難排解解決方案
- 透過常見優化問題學習最佳實踐
- 通過專家級問題發掘進階功能與能力
- 有效率地參考成本、安全與部署策略的指引

## 學習成果

經常參考本 FAQ，您將能夠：
- 獨立解決常見 Azure Developer CLI 問題
- 就部署策略與配置作出明智決策
- 理解 azd 與其他 Azure 工具及服務的關係
- 根據社群經驗與專家建議應用最佳實踐
- 有效排除身份驗證、部署與配置問題
- 利用 FAQ 觀點與建議優化成本與效能

## 目錄

- [入門指南](../../../resources)
- [身份驗證與存取](../../../resources)
- [範本與專案](../../../resources)
- [部署與基礎架構](../../../resources)
- [配置與環境](../../../resources)
- [疑難排解](../../../resources)
- [成本與帳單](../../../resources)
- [最佳實踐](../../../resources)
- [進階主題](../../../resources)

---

## 入門指南

### 問：什麼是 Azure Developer CLI (azd)？
**答**：Azure Developer CLI (azd) 是一套以開發者為中心的命令列工具，加快您將應用程式從本地開發環境部署到 Azure 的速度。它透過範本提供最佳實踐，並協助完整部署生命週期。

### 問：azd 和 Azure CLI 有何不同？
**答**： 
- **Azure CLI**：用於管理 Azure 資源的通用工具
- **azd**：專注於應用部署工作流程的開發者工具
- azd 在內部使用 Azure CLI，但為常見開發場景提供更高階抽象
- azd 包含範本、環境管理和部署自動化功能

### 問：使用 azd 是否需要安裝 Azure CLI？
**答**：是的，azd 需要 Azure CLI 來進行身份驗證及部分操作。請先安裝 Azure CLI，再安裝 azd。

### 問：azd 支援哪些程式語言？
**答**：azd 不限語言，支援：
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 靜態網站
- 容器化應用程式

### 問：我可以在現有專案中使用 azd 嗎？
**答**：可以！您可以：
1. 使用 `azd init` 為現有專案新增 azd 配置
2. 調整現有專案以符合 azd 範本架構
3. 基於現有架構建立自訂範本

---

## 身份驗證與存取

### 問：如何使用 azd 進行 Azure 身份驗證？
**答**：使用 `azd auth login`，會開啟瀏覽器窗口進行 Azure 登入。CI/CD 場景則使用服務主體或受管身分。

### 問：azd 能否同時使用多個 Azure 訂閱？
**答**：可以。使用 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` 針對每個環境指定使用的訂閱。

### 問：部署時需要哪些權限？
**答**：通常需要：
- 資源群組或訂閱的 **Contributor** 角色
- 若部署需要角色指派，需 **User Access Administrator**
- 權限取決於範本及部署的資源

### 問：azd 能用於 CI/CD 管線嗎？
**答**：絕對可以！azd 設計即可整合 CI/CD。使用服務主體進行身份驗證並設定環境變數。

### 問：在 GitHub Actions 如何處理身份驗證？
**答**：使用 Azure Login action 搭配服務主體認證：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 範本與專案

### 問：azd 範本從哪裡找？
**答**： 
- 官方範本：[Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社群範本：GitHub 搜尋「azd-template」
- 使用 `azd template list` 瀏覽可用範本

### 問：如何建立自訂範本？
**答**： 
1. 從現有範本架構開始
2. 修改 `azure.yaml`、基礎架構文件和應用程式程式碼
3. 透過 `azd up` 充分測試
4. 以適當標籤發布至 GitHub

### 問：可以不用範本直接使用 azd 嗎？
**答**：可以，在現有專案使用 `azd init` 建立必要配置。需手動設定 `azure.yaml` 和基礎架構文件。

### 問：官方範本和社群範本有何差別？
**答**： 
- **官方範本**：由 Microsoft 維護，定期更新，文件完整
- **社群範本**：由開發者創建，可能有專門用途，品質及維護度不一

### 問：如何更新專案中的範本？
**答**：範本不會自動更新。您可以：
1. 手動比較並合併原始範本的改動
2. 使用更新後的範本重新執行 `azd init`
3. 從更新的範本挑選特定改進合併

---

## 部署與基礎架構

### 問：azd 可部署哪些 Azure 服務？
**答**：azd 可透過 Bicep/ARM 範本部署任何 Azure 服務，包括：
- 應用服務、容器應用、函數
- 資料庫（SQL、PostgreSQL、Cosmos DB）
- 儲存體、金鑰保管庫、應用程式洞察
- 網路、安全與監控資源

### 問：可以部署到多個區域嗎？
**答**：可以，在 Bicep 範本中設定多個地區，並在每個環境中適當設置 location 參數。

### 問：如何處理資料庫結構遷移？
**答**：在 `azure.yaml` 中使用部署 hook：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### 問：我可以只部署基礎架構，而不部署應用程式嗎？
**答**：可以，使用 `azd provision` 僅部署範本內定義的基礎架構元件。

### 問：如何部署到現有 Azure 資源？
**答**：這比較複雜，且不直接支援。您可以：
1. 將現有資源匯入 Bicep 範本
2. 在範本中使用現有資源參考
3. 修改範本以條件性地建立或引用資源

### 問：可以用 Terraform 替代 Bicep 嗎？
**答**：目前 azd 主要支援 Bicep/ARM 範本。尚無官方 Terraform 支援，但社群方案可能存在。

---

## 配置與環境

### 問：如何管理不同環境（開發、測試、正式）？
**答**：使用 `azd env new <environment-name>` 創建獨立環境，並分別配置不同設定：
```bash
azd env new development
azd env new staging  
azd env new production
```

### 問：環境配置儲存在哪裡？
**答**：在專案目錄內的 `.azure` 資料夾，每個環境有自己的資料夾及配置檔。

### 問：如何設置環境特定配置？
**答**：使用 `azd env set` 設定環境變數：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### 問：可以讓團隊成員共享環境配置嗎？
**答**：`.azure` 夾含有敏感資訊，不應提交版本控制。建議：
1. 記錄必要的環境變數
2. 使用部署腳本建立環境
3. 對敏感配置使用 Azure Key Vault

### 問：如何覆寫範本預設值？
**答**：設定與範本參數對應的環境變數：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 疑難排解

### 問：為什麼 `azd up` 會失敗？
**答**：常見原因：
1. **身份驗證問題**：執行 `azd auth login`
2. **權限不足**：檢查 Azure 角色指派
3. **資源命名衝突**：變更 AZURE_ENV_NAME
4. **配額/容量問題**：檢查區域可用性
5. **範本錯誤**：驗證 Bicep 範本

### 問：如何除錯部署失敗？
**答**： 
1. 使用 `azd deploy --debug` 獲取詳細輸出
2. 查看 Azure 入口網站部署歷史
3. 查看 Azure 入口網站的活動記錄
4. 使用 `azd show` 顯示當前環境狀態

### 問：環境變數為何沒作用？
**答**：檢查：
1. 變數名稱與範本參數完全一致
2. 值包含空白時有正確引號
3. 已選擇正確環境：`azd env select <environment>`
4. 在正確環境中設定變數

### 問：如何清理失敗部署？
**答**： 
```bash
azd down --force --purge
```
這會移除所有資源及環境配置。

### 問：部署後應用程式無法存取怎麼辦？
**答**：檢查：
1. 部署是否成功完成
2. 應用程式是否正在執行（檢查 Azure 入口網站日誌）
3. 網路安全群組允許流量
4. DNS/自訂網域設定是否正確

---

## 成本與帳單

### 問：azd 部署需多少費用？
**答**：費用取決於：
- 部署的 Azure 服務
- 選擇的服務等級/SKU
- 地區價格差異
- 使用模式

請使用 [Azure 計價計算器](https://azure.microsoft.com/pricing/calculator/) 估算。

### 問：如何控制 azd 部署的成本？
**答**： 
1. 開發環境使用較低等級 SKU
2. 設定 Azure 預算與警示
3. 不需要時用 `azd down` 移除資源
4. 選擇適當地區（不同地區價格不同）
5. 使用 Azure 成本管理工具

### 問：azd 範本有免費層選項嗎？
**答**：許多 Azure 服務提供免費層：
- 應用服務：有免費層
- Azure Functions：每月 1 百萬次免費執行
- Cosmos DB：400 RU/s 免費層
- 應用程式洞察：每月前 5GB 免費

可設定範本使用可用免費層。

### 問：如何在部署前估算成本？
**答**： 
1. 查看範本中的 `main.bicep` 所建立的資源
2. 使用 Azure 計價計算器搭配具體 SKU
3. 先部署到開發環境監控實際成本
4. 利用 Azure 成本管理進行詳細成本分析

---

## 最佳實踐

### 問：azd 專案結構的最佳實踐是什麼？
**答**： 
1. 將應用程式程式碼與基礎架構分開
2. 在 `azure.yaml` 使用有意義的服務名稱
3. 建置腳本實作適當的錯誤處理
4. 使用環境特定配置
5. 包含完整文件

### 問：應該如何組織多個服務？
**答**：使用推薦結構：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### 問：`.azure` 資料夾應該加入版本控制嗎？
**答**：**不應該！** `.azure` 內含敏感資訊，應加入 `.gitignore`：
```gitignore
.azure/
```

### 問：如何處理機密與敏感配置？
**答**： 
1. 使用 Azure Key Vault 管理機密
2. 在應用程式配置中引用 Key Vault 機密
3. 切勿將機密提交版本控制
4. 盡量使用受管身分進行服務間驗證

### 問：azd 的 CI/CD 建議做法是什麼？
**答**： 
1. 為各階段 (開發/測試/正式) 使用獨立環境
2. 部署前實施自動化測試
3. 使用服務主體身份驗證
4. 在管線秘密/變數中存儲敏感配置
5. 正式環境部署設置核准門檻

---

## 進階主題

### 問：能否用自訂功能擴充 azd？
**答**：可以，透過 `azure.yaml` 中的部署 hook：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### 問：如何將 azd 整合進既有 DevOps 流程？
**答**： 
1. 在既有管線腳本中使用 azd 指令
2. 團隊內部統一 azd 範本
3. 整合既有監控與告警系統
4. 利用 azd JSON 輸出整合管線

### 問：azd 可用於 Azure DevOps 嗎？
**答**：可以，azd 支援任何 CI/CD 系統。您可建立使用 azd 指令的 Azure DevOps 管線。

### 問：如何為 azd 貢獻或建立社群範本？
**答**： 
1. **azd 工具**：參與貢獻於 [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **範本**：依照 [範本指引](https://github.com/Azure-Samples/awesome-azd) 建立範本
3. **文件**：參與撰寫 [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) 的文件

### 問：azd 的發展路線圖是什麼？
**答**：請查看 [官方路線圖](https://github.com/Azure/azure-dev/projects) 了解規劃中的功能與改進。

### 問：如何從其他部署工具遷移到 azd？
**答**： 
1. 分析目前的部署架構
2. 建立等效的 Bicep 範本
3. 配置 `azure.yaml` 以匹配現有服務
4. 在開發環境中徹底測試
5. 逐步遷移環境

---

## 還有疑問？

### **先搜尋**
- 查閱 [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- 在 [GitHub issues](https://github.com/Azure/azure-dev/issues) 搜尋相似問題

### **尋求協助**
- [GitHub 討論區](https://github.com/Azure/azure-dev/discussions) - 社群支援
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術問答
- [Azure Discord](https://discord.gg/azure) - 即時社群聊天

### **回報問題**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 錯誤回報與功能請求
- 請包含相關日誌、錯誤訊息及重現步驟

### **深入了解**
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構指引](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*本常見問題集會定期更新。最後更新：2025 年 9 月 9 日*

---

**導覽**
- **上一課**： [術語表](glossary.md)
- **下一課**： [學習指南](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們致力於確保翻譯準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->