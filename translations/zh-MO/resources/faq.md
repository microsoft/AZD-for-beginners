# 常見問題 (FAQ)

**按章節取得協助**
- **📚 課程主頁**: [AZD 初學者](../README.md)
- **🚆 安裝問題**: [第1章：安裝與設定](../docs/getting-started/installation.md)
- **🤖 AI 問題**: [第2章：AI 優先開發](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 故障排除**: [第7章：疑難排解與除錯](../docs/troubleshooting/common-issues.md)

## 介紹

本綜合常見問題集提供有關 Azure Developer CLI (azd) 與 Azure 部署的常見問題解答。快速找到常見問題的解決方案、了解最佳實務，並釐清 azd 的概念與工作流程。

## 學習目標

透過檢視本常見問題集，您將能：
- 快速找到針對 Azure Developer CLI 常見問題與議題的答案
- 透過實務問答格式理解關鍵概念與術語
- 存取針對常見問題與錯誤情境的疑難排解方案
- 透過常見的優化問題學習最佳實務
- 透過進階問題探索高階功能與能耐
- 有效率地查詢成本、安全性與部署策略的建議

## 學習成果

經常參考本常見問題集後，您將能：
- 使用所提供的解決方案獨立解決常見的 Azure Developer CLI 問題
- 就部署策略與設定做出明智的決策
- 理解 azd 與其他 Azure 工具及服務之間的關係
- 根據社群經驗與專家建議套用最佳實務
- 有效地排解驗證、部署與設定問題
- 使用常見問題集的見解與建議來優化成本與效能

## 目錄

- [入門](../../../resources)
- [驗證與存取](../../../resources)
- [範本與專案](../../../resources)
- [部署與基礎架構](../../../resources)
- [設定與環境](../../../resources)
- [疑難排解](../../../resources)
- [成本與計費](../../../resources)
- [最佳實務](../../../resources)
- [進階主題](../../../resources)

---

## 入門

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) 是一個以開發者為中心的指令列工具，可加速您將應用程式從本機開發環境部署到 Azure 的時間。它透過範本提供最佳實務，並協助整個部署生命週期。

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: 用於管理 Azure 資源的一般用途工具
- **azd**: 以開發者為重點的應用程式部署工作流程工具
- azd 在內部使用 Azure CLI，但為常見的開發情境提供較高層級的抽象
- azd 包含範本、環境管理與部署自動化

### Q: Do I need Azure CLI installed to use azd?
**A**: 是的，azd 需要 Azure CLI 來進行驗證與某些操作。請先安裝 Azure CLI，然後再安裝 azd。

### Q: What programming languages does azd support?
**A**: azd 與程式語言無關。它支援：
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 靜態網站
- 容器化應用程式

### Q: Can I use azd with existing projects?
**A**: 可以！您可以：
1. 使用 `azd init` 在現有專案新增 azd 設定
2. 調整現有專案以符合 azd 範本結構
3. 根據您現有的架構建立自訂範本

---

## 驗證與存取

### Q: How do I authenticate with Azure using azd?
**A**: 使用 `azd auth login`，它會開啟瀏覽器視窗進行 Azure 驗證。對於 CI/CD 情境，請使用服務主體或託管識別。

### Q: Can I use azd with multiple Azure subscriptions?
**A**: 可以。使用 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` 指定每個環境要使用的訂閱。

### Q: What permissions do I need to deploy with azd?
**A**: 通常您需要：
- 在資源群組或訂閱上具有 **Contributor** 角色
- 若要部署需要角色指派的資源，則需具有 **User Access Administrator**
- 具體權限會依範本與被部署的資源而有所不同

### Q: Can I use azd in CI/CD pipelines?
**A**: 絕對可以！azd 是為 CI/CD 整合設計。使用服務主體進行驗證並設定環境變數以做為設定。

### Q: How do I handle authentication in GitHub Actions?
**A**: 使用 Azure Login 動作搭配服務主體憑證：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 範本與專案

### Q: Where can I find azd templates?
**A**: 
- 官方範本: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社群範本: 在 GitHub 搜尋 "azd-template"
- 使用 `azd template list` 瀏覽可用的範本

### Q: How do I create a custom template?
**A**: 
1. 從現有範本結構開始
2. 修改 `azure.yaml`、基礎架構檔案與應用程式程式碼
3. 使用 `azd up` 徹底測試
4. 以適當的標籤發佈到 GitHub

### Q: Can I use azd without a template?
**A**: 可以，在現有專案使用 `azd init` 建立必要的設定檔。您需要手動設定 `azure.yaml` 與基礎架構檔案。

### Q: What's the difference between official and community templates?
**A**: 
- **官方範本**: 由 Microsoft 維護，定期更新，並具備完整文件
- **社群範本**: 由開發者建立，可能有專門用途，品質與維護情況各異

### Q: How do I update a template in my project?
**A**: 範本不會自動更新。您可以：
1. 手動比較並整合來自來源範本的變更
2. 使用更新後的範本重新以 `azd init` 開始
3. 從更新的範本中挑選特定改進

---

## 部署與基礎架構

### Q: What Azure services can azd deploy?
**A**: azd 可以透過 Bicep/ARM 範本部署任何 Azure 服務，包括：
- App Services、Container Apps、Functions
- 資料庫（SQL、PostgreSQL、Cosmos DB）
- 儲存體、Key Vault、Application Insights
- 網路、安全與監控資源

### Q: Can I deploy to multiple regions?
**A**: 可以，在您的 Bicep 範本中為多個地區進行設定，並為每個環境適當設置 location 參數。

### Q: How do I handle database schema migrations?
**A**: 在 `azure.yaml` 中使用部署掛鉤：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: 可以，使用 `azd provision` 僅部署範本中定義的基礎架構元件。

### Q: How do I deploy to existing Azure resources?
**A**: 這很複雜且不直接支援。您可以：
1. 將現有資源匯入到您的 Bicep 範本
2. 在範本中使用現有資源參考
3. 修改範本以有條件地建立或參考資源

### Q: Can I use Terraform instead of Bicep?
**A**: 目前，azd 主要支援 Bicep/ARM 範本。Terraform 支援並非官方提供，雖然可能存在社群解決方案。

---

## 設定與環境

### Q: How do I manage different environments (dev, staging, prod)?
**A**: 使用 `azd env new <environment-name>` 建立獨立環境，並為每個環境設定不同的設定：
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: 存放在專案目錄內的 `.azure` 資料夾中。每個環境都有自己的資料夾與設定檔。

### Q: How do I set environment-specific configuration?
**A**: 使用 `azd env set` 來設定環境變數：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: `.azure` 資料夾包含敏感資訊，應避免提交到版本控制。取而代之：
1. 文件化所需的環境變數
2. 使用部署腳本來設定環境
3. 使用 Azure Key Vault 儲存敏感設定

### Q: How do I override template defaults?
**A**: 設定對應於範本參數的環境變數：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 疑難排解

### Q: Why is `azd up` failing?
**A**: 常見原因：
1. **驗證問題**：執行 `azd auth login`
2. **權限不足**：檢查您的 Azure 角色指派
3. **資源命名衝突**：變更 AZURE_ENV_NAME
4. **配額/容量問題**：檢查區域可用性
5. **範本錯誤**：驗證 Bicep 範本

### Q: How do I debug deployment failures?
**A**: 
1. 使用 `azd deploy --debug` 取得詳細輸出
2. 檢查 Azure 入口網站的部署歷程
3. 檢閱 Azure 入口網站的活動記錄
4. 使用 `azd show` 顯示目前環境狀態

### Q: Why are my environment variables not working?
**A**: 檢查：
1. 變數名稱是否與範本參數完全相符
2. 若值包含空白，是否已正確加上引號
3. 是否已選取正確環境：`azd env select <environment>`
4. 變數是否在正確的環境中設定

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
這會移除全部資源和環境設定。

### Q: Why is my application not accessible after deployment?
**A**: 檢查：
1. 部署是否成功完成
2. 應用程式是否正在執行（在 Azure 入口網站檢查日誌）
3. 網路安全群組是否允許流量
4. DNS/自訂網域是否已正確設定

---

## 成本與計費

### Q: How much will azd deployments cost?
**A**: 成本取決於：
- 部署的 Azure 服務
- 所選的服務層級/SKU
- 區域價格差異
- 使用模式

請使用 [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) 估算。

### Q: How do I control costs in azd deployments?
**A**: 
1. 在開發環境使用較低階的 SKU
2. 設定 Azure 預算與警示
3. 使用 `azd down` 在不需要時移除資源
4. 選擇適當的地區（不同地點價格不同）
5. 使用 Azure 成本管理工具

### Q: Are there free tier options for azd templates?
**A**: 許多 Azure 服務提供免費額度：
- App Service：提供免費層
- Azure Functions：每月 1M 次免費執行
- Cosmos DB：提供 400 RU/s 的免費層
- Application Insights：前 5GB/月免費

在範本中於可行處設定使用免費層。

### Q: How do I estimate costs before deployment?
**A**: 
1. 檢閱範本的 `main.bicep` 以查看會建立哪些資源
2. 在 Azure Pricing Calculator 中使用具體的 SKU
3. 先部署到開發環境以監控實際成本
4. 使用 Azure 成本管理進行詳細成本分析

---

## 最佳實務

### Q: What are the best practices for azd project structure?
**A**: 
1. 將應用程式程式碼與基礎架構分開保存
2. 在 `azure.yaml` 使用有意義的服務名稱
3. 在建置腳本中實作適當的錯誤處理
4. 使用環境特定的設定
5. 包含完整的文件

### Q: How should I organize multiple services in azd?
**A**: 使用建議的結構：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **不行！** `.azure` 資料夾包含敏感資訊。將它加入 `.gitignore`：
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. 使用 Azure Key Vault 儲存秘密
2. 在應用程式設定中參考 Key Vault 的秘密
3. 絕不將秘密提交到版本控制
4. 使用託管識別進行服務間驗證

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. 對每個階段（dev/staging/prod）使用獨立環境
2. 在部署前實作自動化測試
3. 使用服務主體進行驗證
4. 在管線秘密/變數中儲存敏感設定
5. 對生產部署實作審批閘道

---

## 進階主題

### Q: Can I extend azd with custom functionality?
**A**: 可以，透過 `azure.yaml` 中的部署掛鉤：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. 在現有的管線腳本中使用 azd 指令
2. 在團隊間標準化 azd 範本
3. 與現有的監控與告警整合
4. 使用 azd 的 JSON 輸出進行管線整合

### Q: Can I use azd with Azure DevOps?
**A**: 可以，azd 與任何 CI/CD 系統相容。建立使用 azd 指令的 Azure DevOps 管線。

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd 工具**：貢獻至 [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **範本**：建立範本並遵循 [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **文件**：於 [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) 協助撰寫文件

### 問：azd 的路線圖是什麼？
**答**：請查看 [official roadmap](https://github.com/Azure/azure-dev/projects) 以瞭解計畫中的功能與改進。

### 問：我應如何從其他部署工具遷移到 azd？
**答**： 
1. 分析目前的部署架構
2. 建立等效的 Bicep 範本
3. 將 `azure.yaml` 設定為與目前服務相符
4. 在開發環境中徹底測試
5. 逐步遷移各環境

---

## 仍有疑問嗎？

### **先搜尋**
- 查看 [官方文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- 在 [GitHub issues](https://github.com/Azure/azure-dev/issues) 搜尋類似問題

### **尋求協助**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - 社群支援
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術問題
- [Azure Discord](https://discord.gg/azure) - 即時社群聊天室

### **回報問題**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 錯誤回報與功能建議
- 請包含相關日誌、錯誤訊息與重現步驟

### **深入瞭解**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*本常見問題集定期更新。最後更新：2025年9月9日*

---

**導覽**
- **上一課程**： [Glossary](glossary.md)
- **下一課程**： [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而導致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->