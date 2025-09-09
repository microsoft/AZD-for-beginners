<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T20:29:41+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "mo"
}
-->
# 詞彙表 - Azure Developer CLI 專有名詞

## 介紹

這份全面的詞彙表提供了 Azure Developer CLI 和 Azure 雲端開發中使用的術語、概念和縮寫的定義。是理解技術文件、解決問題，以及有效溝通 azd 專案和 Azure 服務的重要參考。

## 學習目標

透過使用這份詞彙表，你將能夠：
- 理解 Azure Developer CLI 的基本術語和概念
- 掌握 Azure 雲端開發的詞彙和技術術語
- 高效參考基礎架構即代碼和部署相關術語
- 理解 Azure 服務名稱、縮寫及其用途
- 獲取解決問題和除錯相關術語的定義
- 學習進階的 Azure 架構和開發概念

## 學習成果

經常參考這份詞彙表，你將能夠：
- 使用正確的 Azure Developer CLI 術語進行有效溝通
- 更清楚地理解技術文件和錯誤訊息
- 自信地瀏覽 Azure 服務和概念
- 使用適當的技術詞彙解決問題
- 在團隊討論中使用準確的技術語言進行貢獻
- 系統性地擴展你的 Azure 雲端開發知識

## A

**ARM 模板**  
Azure Resource Manager 模板。基於 JSON 的基礎架構即代碼格式，用於宣告式地定義和部署 Azure 資源。

**App Service**  
Azure 的平台即服務 (PaaS) 提供，用於託管網頁應用程式、REST API 和行動後端，無需管理基礎架構。

**Application Insights**  
Azure 的應用程式效能監控 (APM) 服務，提供應用程式效能、可用性和使用情況的深入洞察。

**Azure CLI**  
用於管理 Azure 資源的命令列介面。azd 用於身份驗證和部分操作。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，透過模板和基礎架構即代碼加速構建和部署應用程式到 Azure。

**azure.yaml**  
azd 專案的主要配置檔案，定義服務、基礎架構和部署掛鉤。

**Azure Resource Manager (ARM)**  
Azure 的部署和管理服務，提供創建、更新和刪除資源的管理層。

## B

**Bicep**  
由 Microsoft 開發的領域專用語言 (DSL)，用於部署 Azure 資源。提供比 ARM 模板更簡單的語法，同時編譯為 ARM。

**Build**  
編譯原始碼、安裝依賴項，以及準備應用程式部署的過程。

**藍綠部署**  
使用兩個相同的生產環境（藍色和綠色）來最小化停機時間和風險的部署策略。

## C

**Container Apps**  
Azure 的無伺服器容器服務，允許運行容器化應用程式而無需管理複雜的基礎架構。

**CI/CD**  
持續整合/持續部署。自動化整合代碼變更和部署應用程式的實踐。

**Cosmos DB**  
Azure 的全球分佈、多模型資料庫服務，提供吞吐量、延遲、可用性和一致性的全面 SLA。

**配置**  
控制應用程式行為和部署選項的設置和參數。

## D

**部署**  
在目標基礎架構上安裝和配置應用程式及其依賴項的過程。

**Docker**  
使用容器化技術開發、運送和運行應用程式的平台。

**Dockerfile**  
包含構建 Docker 容器映像指令的文字檔案。

## E

**環境**  
代表應用程式特定實例的部署目標（例如，開發、測試、生產）。

**環境變數**  
以鍵值對形式存儲的配置值，應用程式可在運行時訪問。

**端點**  
應用程式或服務可被訪問的 URL 或網路地址。

## F

**Function App**  
Azure 的無伺服器計算服務，允許運行事件驅動的代碼而無需管理基礎架構。

## G

**GitHub Actions**  
與 GitHub 儲存庫整合的 CI/CD 平台，用於自動化工作流程。

**Git**  
分散式版本控制系統，用於追蹤原始碼的變更。

## H

**掛鉤**  
在部署生命週期的特定點（如 preprovision、postprovision、predeploy、postdeploy）運行的自定義腳本或命令。

**主機**  
應用程式將被部署的 Azure 服務類型（例如，appservice、containerapp、function）。

## I

**基礎架構即代碼 (IaC)**  
通過代碼而非手動過程定義和管理基礎架構的實踐。

**初始化**  
通常從模板初始化新的 azd 專案的過程。

## J

**JSON**  
JavaScript Object Notation。常用於配置檔案和 API 回應的資料交換格式。

**JWT**  
JSON Web Token。用於在各方之間安全傳輸資訊的標準。

## K

**Key Vault**  
Azure 的服務，用於安全存儲和管理秘密、密鑰和憑證。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 和其他 Azure 服務中的數據的查詢語言。

## L

**負載平衡器**  
將進入的網路流量分配到多個伺服器或實例的服務。

**Log Analytics**  
Azure 的服務，用於收集、分析和採取雲端及本地環境的遙測數據。

## M

**Managed Identity**  
Azure 的功能，為 Azure 服務提供自動管理的身份，用於驗證其他 Azure 服務。

**微服務**  
應用程式作為一組小型、獨立服務構建的架構方法。

**監控**  
Azure 的統一監控解決方案，提供跨應用程式和基礎架構的全棧可觀察性。

## N

**Node.js**  
基於 Chrome V8 JavaScript 引擎的 JavaScript 運行時，用於構建伺服器端應用程式。

**npm**  
Node.js 的套件管理器，用於管理依賴項和套件。

## O

**輸出**  
基礎架構部署返回的值，可供應用程式或其他資源使用。

## P

**打包**  
準備應用程式代碼和依賴項以進行部署的過程。

**參數**  
傳遞給基礎架構模板的輸入值，用於自定義部署。

**PostgreSQL**  
Azure 支援的開源關聯式資料庫系統，作為托管服務提供。

**配置**  
創建和配置基礎架構模板中定義的 Azure 資源的過程。

## Q

**配額**  
Azure 訂閱或區域中可創建的資源數量限制。

## R

**資源群組**  
Azure 資源的邏輯容器，共享相同的生命週期、權限和策略。

**資源令牌**  
由 azd 生成的唯一字串，用於確保資源名稱在部署中是唯一的。

**REST API**  
使用 HTTP 方法設計網路應用程式的架構風格。

**回滾**  
恢復到應用程式或基礎架構配置的先前版本的過程。

## S

**服務**  
在 azure.yaml 中定義的應用程式組件（例如，網頁前端、API 後端、資料庫）。

**SKU**  
庫存單位。代表 Azure 資源的不同服務層或性能級別。

**SQL 資料庫**  
基於 Microsoft SQL Server 的 Azure 托管關聯式資料庫服務。

**Static Web Apps**  
Azure 的服務，用於從原始碼儲存庫構建和部署全棧網頁應用程式。

**儲存帳戶**  
Azure 的服務，提供雲端儲存，用於數據對象，包括 Blob、文件、佇列和表。

**訂閱**  
Azure 帳戶容器，包含資源群組和資源，並與計費和訪問管理相關聯。

## T

**模板**  
包含應用程式代碼、基礎架構定義和常見場景配置的預構建專案結構。

**Terraform**  
支持多個雲端提供商（包括 Azure）的開源基礎架構即代碼工具。

**流量管理器**  
Azure 的基於 DNS 的流量負載平衡器，用於跨全球 Azure 區域分配流量。

## U

**URI**  
統一資源識別碼。識別特定資源的字串。

**URL**  
統一資源定位符。一種 URI，指定資源的位置以及如何檢索。

## V

**虛擬網路 (VNet)**  
Azure 中私有網路的基本構建塊，提供隔離和分段。

**VS Code**  
Visual Studio Code。流行的代碼編輯器，具有出色的 Azure 和 azd 整合。

## W

**Webhook**  
由特定事件觸發的 HTTP 回調，常用於 CI/CD 管道。

**What-if**  
Azure 的功能，顯示部署將進行的更改，而不實際執行。

## Y

**YAML**  
YAML Ain't Markup Language。用於配置檔案（如 azure.yaml）的可讀性高的數據序列化標準。

## Z

**區域**  
Azure 區域內物理上分離的位置，提供冗餘和高可用性。

---

## 常見縮寫

| 縮寫 | 全稱 | 描述 |
|------|------|------|
| AAD | Azure Active Directory | 身份和訪問管理服務 |
| ACR | Azure Container Registry | 容器映像註冊服務 |
| AKS | Azure Kubernetes Service | 托管 Kubernetes 服務 |
| API | Application Programming Interface | 構建軟體的協議集 |
| ARM | Azure Resource Manager | Azure 的部署和管理服務 |
| CDN | Content Delivery Network | 分佈式伺服器網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發實踐 |
| CLI | Command Line Interface | 基於文字的用戶介面 |
| DNS | Domain Name System | 將域名轉換為 IP 地址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP 的安全版本 |
| IaC | Infrastructure as Code | 通過代碼管理基礎架構 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全信息傳輸的令牌格式 |
| KQL | Kusto Query Language | 用於 Azure 數據服務的查詢語言 |
| RBAC | Role-Based Access Control | 基於用戶角色的訪問控制方法 |
| REST | Representational State Transfer | 網絡服務的架構風格 |
| SDK | Software Development Kit | 開發工具集合 |
| SLA | Service Level Agreement | 對服務可用性/性能的承諾 |
| SQL | Structured Query Language | 用於管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密協議 |
| URI | Uniform Resource Identifier | 識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 計算機系統的模擬 |
| VNet | Virtual Network | Azure 中的私有網路 |
| YAML | YAML Ain't Markup Language | 數據序列化標準 |

---

## Azure 服務名稱對應

| 常見名稱 | Azure 官方服務名稱 | azd 主機類型 |
|----------|--------------------|--------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## 特定情境術語

### 開發術語
- **熱重載**：在開發過程中自動更新應用程式而無需重啟
- **構建管道**：自動化構建和測試代碼的過程
- **部署槽位**：App Service 中的測試環境
- **環境一致性**：保持開發、測試和生產環境的相似性

### 安全術語
- **Managed Identity**：Azure 提供的自動憑證管理功能
- **Key Vault**：用於安全存儲秘密、密鑰和憑證
- **RBAC**：Azure 資源的基於角色的訪問控制
- **網路安全群組**：用於控制網路流量的虛擬防火牆

### 監控術語
- **遙測**：自動收集測量和數據
- **應用程式效能監控 (APM)**：監控軟體效能
- **Log Analytics**：用於收集和分析日誌數據的服務
- **警報規則**：基於指標或條件的自動通知

### 部署術語
- **藍綠部署**：零停機時間的部署策略
- **金絲雀部署**：逐步向部分用戶推出
- **滾動更新**：逐步替換應用程式實例
- **回滾**：恢復到應用程式的先前版本

---

**使用提示**：使用 `Ctrl+F` 快速搜尋詞彙表中的特定術語。術語在適用情況下已交叉引用。

---

**導航**
- **上一課**：[速查表](cheat-sheet.md)
- **下一課**：[常見問題](faq.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。