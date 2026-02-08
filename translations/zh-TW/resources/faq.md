# 常見問題 (FAQ)

**按章節取得幫助**
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **🚆 安裝問題**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI 問題**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 疑難排解**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## 介紹

這份完整的常見問題集提供有關 Azure Developer CLI (azd) 與 Azure 部署的常見問題解答。快速找到常見問題的解決方案、了解最佳實務，並釐清 azd 的概念與工作流程。

## 學習目標

閱讀本常見問題集後，您將能：
- 快速找到常見的 Azure Developer CLI 問題與解答
- 透過實務問答格式了解關鍵概念與術語
- 存取常見問題與錯誤情境的疑難排解方案
- 透過常見問題學習最佳實務以進行優化
- 透過進階問題探索進階功能與能力
- 有效率地參考成本、安全性與部署策略建議

## 學習成效

定期參考本常見問題集後，您將能：
- 使用提供的解決方案獨立解決常見的 Azure Developer CLI 問題
- 對部署策略與設定做出明智決策
- 了解 azd 與其他 Azure 工具和服務之間的關係
- 根據社群經驗與專家建議套用最佳實務
- 有效地疑難排解認證、部署與設定問題
- 使用常見問題集的見解與建議來最佳化成本與效能

## 目錄

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### 問：什麼是 Azure Developer CLI (azd)？
**答**：Azure Developer CLI (azd) 是一個以開發者為中心的命令列工具，可加速您將應用程式從本機開發環境部署到 Azure 的時間。它透過範本提供最佳實務，並協助整個部署生命週期。

### 問：azd 與 Azure CLI 有何不同？
**答**： 
- **Azure CLI**：用於管理 Azure 資源的一般用途工具
- **azd**：以開發者為主的工具，針對應用程式部署工作流程
- azd 在內部使用 Azure CLI，但為常見的開發情境提供更高層的抽象
- azd 包含範本、環境管理與部署自動化

### 問：使用 azd 是否需要先安裝 Azure CLI？
**答**：是的，azd 需要 Azure CLI 來進行驗證與部分操作。請先安裝 Azure CLI，再安裝 azd。

### 問：azd 支援哪些程式語言？
**答**：azd 與語言無關。它支援：
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
1. 使用 `azd init` 將 azd 設定加入現有專案
2. 調整現有專案以符合 azd 範本結構
3. 基於現有架構建立自訂範本

---

## Authentication & Access

### 問：如何使用 azd 在 Azure 上進行驗證？
**答**：使用 `azd auth login`，它會開啟瀏覽器進行 Azure 驗證。對於 CI/CD 情境，請使用服務主體或託管識別。

### 問：我可以在多個 Azure 訂閱中使用 azd 嗎？
**答**：可以。使用 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` 為每個環境指定要使用的訂閱。

### 問：我需要哪些權限才能使用 azd 進行部署？
**答**：通常您需要：
- 對資源群組或訂閱具有 **Contributor** 角色
- 若要部署需要角色指派的資源，則需要 **User Access Administrator**
- 具體權限會依範本與要部署的資源而異

### 問：我可以在 CI/CD 管線中使用 azd 嗎？
**答**：絕對可以！azd 是為 CI/CD 整合而設計的。使用服務主體進行驗證，並設定環境變數以供設定使用。

### 問：在 GitHub Actions 中要如何處理驗證？
**答**：使用 Azure Login action 搭配服務主體憑證：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### 問：我可以在哪裡找到 azd 範本？
**答**： 
- 官方範本： [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社群範本：在 GitHub 上搜尋 "azd-template"
- 使用 `azd template list` 瀏覽可用範本

### 問：如何建立自訂範本？
**答**： 
1. 以現有範本結構為起點
2. 修改 `azure.yaml`、基礎設施檔案與應用程式程式碼
3. 使用 `azd up` 充分測試
4. 以適當標記發佈到 GitHub

### 問：沒有範本可以使用 azd 嗎？
**答**：可以，對現有專案使用 `azd init` 以建立必要的設定檔。您需要手動設定 `azure.yaml` 與基礎設施檔案。

### 問：官方範本與社群範本有何差異？
**答**： 
- **官方範本**：由 Microsoft 維護、定期更新、並附有完整文件
- **社群範本**：由開發者建立，可能具有專門用途，品質與維護狀況各異

### 問：如何在專案中更新範本？
**答**：範本不會自動更新。您可以：
1. 手動比較並合併來源範本的變更
2. 使用更新後的範本重新執行 `azd init`
3. 從更新的範本中挑選特定改進並合併

---

## Deployment & Infrastructure

### 問：azd 可以部署哪些 Azure 服務？
**答**：azd 可以透過 Bicep/ARM 範本部署任何 Azure 服務，包括：
- App Services、Container Apps、Functions
- 資料庫（SQL、PostgreSQL、Cosmos DB）
- 儲存體、Key Vault、Application Insights
- 網路、資安與監控資源

### 問：我可以部署到多個區域嗎？
**答**：可以，在您的 Bicep 範本中為多個區域設定，並為每個環境適當設定 location 參數。

### 問：如何處理資料庫結構遷移？
**答**：在 `azure.yaml` 中使用部署鉤子（deployment hooks）：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### 問：我可以只部署基礎設施而不部署應用程式嗎？
**答**：可以，使用 `azd provision` 只部署範本中定義的基礎設施元件。

### 問：如何將資源部署到已存在的 Azure 資源？
**答**：這比較複雜，且不直接受到支援。您可以：
1. 將現有資源匯入到 Bicep 範本中
2. 在範本中使用現有資源參考
3. 修改範本以有條件地建立或參考資源

### 問：我可以使用 Terraform 來替代 Bicep 嗎？
**答**：目前 azd 主要支援 Bicep/ARM 範本。Terraform 尚未正式支援，儘管社群可能有解決方案。

---

## Configuration & Environments

### 問：我如何管理不同環境（dev、staging、prod）？
**答**：使用 `azd env new <environment-name>` 建立不同環境，並為每個環境設定不同的設定：
```bash
azd env new development
azd env new staging  
azd env new production
```

### 問：環境設定儲存在何處？
**答**：儲存在專案目錄內的 `.azure` 資料夾。每個環境都會有自己的資料夾與設定檔。

### 問：如何設定環境特定的設定？
**答**：使用 `azd env set` 設定環境變數：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### 問：我可以在團隊成員之間共用環境設定嗎？
**答**：`.azure` 資料夾包含敏感資訊，不應提交到版本控制。建議做法：
1. 撰寫文件說明所需的環境變數
2. 使用部署腳本來設定環境
3. 使用 Azure Key Vault 保存敏感設定

### 問：如何覆寫範本預設值？
**答**：設定對應於範本參數的環境變數：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### 問：為何 `azd up` 失敗？
**答**：常見原因包括：
1. **驗證問題**：執行 `azd auth login`
2. **權限不足**：檢查您的 Azure 角色指派
3. **資源命名衝突**：變更 AZURE_ENV_NAME
4. **配額/容量問題**：檢查區域可用性
5. **範本錯誤**：驗證 Bicep 範本

### 問：如何除錯部署失敗？
**答**： 
1. 使用 `azd deploy --debug` 取得詳細輸出
2. 檢查 Azure 入口網站的部署歷程
3. 檢閱 Azure 入口網站的活動記錄
4. 使用 `azd show` 顯示目前環境狀態

### 問：為何我的環境變數沒作用？
**答**：檢查：
1. 變數名稱是否與範本參數完全相符
2. 若值包含空格是否正確加上引號
3. 是否選取了正確的環境：`azd env select <environment>`
4. 變數是否在正確的環境中設定

### 問：如何清理失敗的部署？
**答**： 
```bash
azd down --force --purge
```
這會移除所有資源與環境設定。

### 問：為何我的應用程式部署後無法存取？
**答**：檢查：
1. 部署是否完成成功
2. 應用程式是否在執行（在 Azure 入口網站檢查日誌）
3. 網路安全群組是否允許流量
4. DNS/自訂網域是否正確設定

---

## Cost & Billing

### 問：azd 部署會花費多少？
**答**：成本取決於：
- 所部署的 Azure 服務
- 選擇的服務階層/SKU
- 各區域的價格差異
- 使用模式

使用 [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) 估算費用。

### 問：如何在 azd 部署中控制成本？
**答**： 
1. 在開發環境使用較低階的 SKU
2. 設定 Azure 預算與警示
3. 使用 `azd down` 在不需要時移除資源
4. 選擇合適的區域（不同地區的成本不同）
5. 使用 Azure 成本管理工具

### 問：azd 範本有免費階層選項嗎？
**答**：許多 Azure 服務提供免費階層：
- App Service：有免費階層
- Azure Functions：每月 100 萬次免費執行
- Cosmos DB：含 400 RU/s 的免費階層
- Application Insights：前 5GB/月免費

在範本中將可用項目設定為免費階層。

### 問：如何在部署前估算成本？
**答**： 
1. 檢閱範本的 `main.bicep`，查看會建立哪些資源
2. 在 Azure Pricing Calculator 中針對特定 SKU 估算
3. 先部署到開發環境，監控實際成本
4. 使用 Azure Cost Management 做詳細成本分析

---

## Best Practices

### 問：azd 專案結構的最佳實務是什麼？
**答**： 
1. 將應用程式程式碼與基礎設施分開
2. 在 `azure.yaml` 中使用有意義的服務名稱
3. 在建置腳本中實作適當的錯誤處理
4. 使用環境特定的設定
5. 包含完整的文件說明

### 問：我應如何在 azd 中組織多個服務？
**答**：使用建議的結構：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### 問：我應該把 `.azure` 資料夾提交到版本控制嗎？
**答**：**不可以！** `.azure` 資料夾包含敏感資訊。將它加入 `.gitignore`：
```gitignore
.azure/
```

### 問：如何處理秘密與敏感設定？
**答**： 
1. 使用 Azure Key Vault 存放秘密
2. 在應用程式設定中參考 Key Vault 秘密
3. 千萬不要將秘密提交到版本控制
4. 使用託管識別進行服務間的驗證

### 問：對於 azd 的 CI/CD，建議的做法是什麼？
**答**： 
1. 為每個階段（dev/staging/prod）使用獨立環境
2. 在部署前實作自動化測試
3. 使用服務主體進行驗證
4. 在管線祕密/變數中儲存敏感設定
5. 為生產部署實作審核閘道

---

## Advanced Topics

### 問：我可以用自訂功能擴充 azd 嗎？
**答**：可以，透過 `azure.yaml` 中的部署鉤子擴充：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### 問：如何將 azd 整合到現有的 DevOps 流程？
**答**： 
1. 在現有的管線腳本中使用 azd 命令
2. 在團隊間標準化 azd 範本
3. 與現有的監控與警示整合
4. 使用 azd 的 JSON 輸出供管線整合使用

### 問：我可以在 Azure DevOps 中使用 azd 嗎？
**答**：可以，azd 適用於任何 CI/CD 系統。建立使用 azd 命令的 Azure DevOps 管線。

### 問：如何為 azd 做出貢獻或建立社群範本？
**答**：
1. **azd 工具**: 貢獻至 [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **範本**: 建立範本，依據 [範本指南](https://github.com/Azure-Samples/awesome-azd)
3. **文件**: 在 [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) 貢獻文件

### Q: azd 的路線圖是什麼？
**A**: 查看 [官方路線圖](https://github.com/Azure/azure-dev/projects) 以取得計畫中的功能與改進。

### Q: 我該如何從其他部署工具遷移到 azd？
**A**: 
1. 分析目前的部署架構
2. 建立等效的 Bicep 範本
3. 將 `azure.yaml` 設定為與現有服務相符
4. 在開發環境中徹底測試
5. 逐步遷移各環境

---

## 還有問題嗎？

### **先搜尋**
- 檢查 [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- 在 [GitHub issues](https://github.com/Azure/azure-dev/issues) 搜尋類似問題

### **尋求協助**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - 社群支援
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術問題
- [Azure Discord](https://discord.gg/azure) - 即時社群聊天

### **回報問題**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 錯誤回報與功能需求
- 包含相關日誌、錯誤訊息與重現步驟

### **深入了解**
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*此常見問題集會定期更新。最後更新：2025 年 9 月 9 日*

---

**導覽**
- **上一課**: [詞彙表](glossary.md)
- **下一課**: [學習指南](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件係使用 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們盡力確保翻譯準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原文應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而產生的任何誤解或錯誤詮釋不負任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->