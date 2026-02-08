# 詞彙表 - Azure 及 AZD 術語

**所有章節參考資料**
- **📚 課程首頁**: [AZD 新手入門](../README.md)
- **📖 基本知識學習**: [第 1 章：AZD 基礎](../docs/getting-started/azd-basics.md)
- **🤖 人工智能術語**: [第 2 章：AI 優先開發](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## 介紹

本綜合詞彙表提供 Azure Developer CLI 和 Azure 雲端開發中使用的術語、概念及縮寫的定義。是理解技術文件、排解問題及有效溝通 azd 項目和 Azure 服務的重要參考。

## 學習目標

透過使用本詞彙表，您將能夠：
- 理解重要的 Azure Developer CLI 術語和概念
- 精通 Azure 雲端開發字彙和技術術語
- 有效參考基礎設施即代碼及部署術語
- 理解 Azure 服務名稱、縮寫及其用途
- 獲得排解和調試術語的定義
- 學習進階 Azure 架構與開發概念

## 學習成果

經常參考本詞彙表後，您將能：
- 使用恰當的 Azure Developer CLI 術語有效溝通
- 更清晰理解技術文件和錯誤訊息
- 自信地瀏覽 Azure 服務和概念
- 用合適的技術詞彙排解問題
- 在團隊討論中準確使用技術語言
- 系統性擴展 Azure 雲端開發知識

## A

**ARM Template**  
Azure Resource Manager 範本。基於 JSON 的基礎設施即代碼格式，用來宣告式定義及部署 Azure 資源。

**App Service**  
Azure 的平台即服務 (PaaS) 方案，提供無需管理基礎設施的網頁應用、REST API 和行動後端主機服務。

**Application Insights**  
Azure 的應用程式效能監控（APM）服務，提供深入的應用效能、可用性和使用情況洞察。

**Azure CLI**  
用於管理 Azure 資源的命令列介面。azd 用於身份驗證和部分操作。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，使用範本和基礎設施即代碼，加速構建和部署 Azure 應用程式的流程。

**azure.yaml**  
azd 專案的主要配置檔，定義服務、基礎設施和部署掛勾。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，提供用於創建、更新和刪除資源的管理層。

## B

**Bicep**  
由 Microsoft 開發的用於部署 Azure 資源的領域專用語言 (DSL)。語法比 ARM 範本更簡潔，並編譯成 ARM。

**Build**  
編譯原始碼、安裝依賴並準備應用程式以供部署的過程。

**Blue-Green Deployment**  
使用兩個相同生產環境（藍與綠）以最小化停機和風險的部署策略。

## C

**Container Apps**  
Azure 的無伺服器容器服務，允許在無需管理複雜基礎設施的情況下運行容器化應用。

**CI/CD**  
持續整合/持續部署。自動化整合代碼更改和部署應用的實踐。

**Cosmos DB**  
Azure 的全球分佈多模型資料庫服務，提供關於吞吐量、延遲、可用性和一致性的完整 SLA。

**Configuration**  
控制應用程式行為和部署選項的設定與參數。

## D

**Deployment**  
在目標基礎設施上安裝和配置應用程式及其依賴的過程。

**Docker**  
利用容器化技術開發、發佈和運行應用的平臺。

**Dockerfile**  
包含建構 Docker 容器映像指令的文本檔案。

## E

**Environment**  
表示應用程式特定實例的部署目標（例如開發、測試、正式）。

**Environment Variables**  
作為鍵值對儲存，應用程式可於運行時訪問的配置值。

**Endpoint**  
應用程式或服務可被存取的 URL 或網絡位址。

## F

**Function App**  
Azure 的無伺服器運算服務，允許運行事件驅動程式碼，無需管理基礎設施。

## G

**GitHub Actions**  
整合於 GitHub 儲存庫的 CI/CD 平臺，用於自動化工作流程。

**Git**  
分散式版本控制系統，用於追蹤程式碼變更。

## H

**Hooks**  
於部署生命週期特定階段執行的自訂腳本或指令（如 preprovision、postprovision、predeploy、postdeploy）。

**Host**  
應用程式將部署的 Azure 服務類型（例如 appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
透過代碼定義和管理基礎設施，而非手動流程的做法。

**Init**  
初始化全新 azd 專案的過程，通常從範本開始。

## J

**JSON**  
JavaScript 物件標記法。常用於配置文件和 API 回應的資料交換格式。

**JWT**  
JSON Web 令牌。用於安全傳輸資訊的 JSON 格式標準。

## K

**Key Vault**  
Azure 用於安全儲存與管理祕密、金鑰和憑證的服務。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 和其他 Azure 服務資料的查詢語言。

## L

**Load Balancer**  
將進入的網路流量分配至多個伺服器或實例的服務。

**Log Analytics**  
Azure 服務，用於收集、分析及處理來自雲端和本地環境的遙測數據。

## M

**Managed Identity**  
Azure 提供給服務自動管理的身份，用於驗證其他 Azure 服務。

**Microservices**  
將應用程式建構為小型、獨立服務集合的架構方法。

**Monitor**  
Azure 的統一監控解決方案，提供應用程式和基礎設施的全方位可觀察性。

## N

**Node.js**  
基於 Chrome V8 JavaScript 引擎的 JavaScript 執行環境，用於構建伺服器端應用。

**npm**  
Node.js 的套件管理器，管理相依性及套件。

## O

**Output**  
基礎設施部署完成後返回的值，可被應用程式或其他資源使用。

## P

**Package**  
準備應用程式碼和依賴以供部署的過程。

**Parameters**  
傳遞給基礎設施範本以自定義部署的輸入值。

**PostgreSQL**  
Azure 支援的開源關聯式資料庫管理系統，作為託管服務。

**Provisioning**  
創建和配置基礎設施範本中定義的 Azure 資源的過程。

## Q

**Quota**  
Azure 訂閱或區域可建立資源數量的限制。

## R

**Resource Group**  
Azure 資源的邏輯容器，共享相同的生命週期、權限和政策。

**Resource Token**  
azd 產生的唯一字串，確保資源名稱在部署中唯一。

**REST API**  
使用 HTTP 方法設計網路應用的架構風格。

**Rollback**  
回復至應用程式或基礎設施組態先前版本的過程。

## S

**Service**  
azure.yaml 中定義的應用組成部分（例如網頁前端、API 後端、資料庫）。

**SKU**  
存貨單位。代表 Azure 資源的不同服務級別或效能等級。

**SQL Database**  
基於 Microsoft SQL Server 的 Azure 託管關聯式資料庫服務。

**Static Web Apps**  
Azure 用於從原始碼庫構建和部署全棧網頁應用的服務。

**Storage Account**  
Azure 的雲端儲存服務，包含 blob、檔案、佇列和表格等資料物件。

**Subscription**  
Azure 帳戶容器，包含資源群組和資源，管理帳單和存取權限。

## T

**Template**  
包含應用程式碼、基礎設施定義和配置的預建專案結構，用於常見場景。

**Terraform**  
支援多雲平台（包含 Azure）的開源基礎設施即代碼工具。

**Traffic Manager**  
Azure 基於 DNS 的流量負載平衡器，用於跨全球 Azure 區域分配流量。

## U

**URI**  
統一資源識別符。用於識別特定資源的字串。

**URL**  
統一資源定位符。URI 的一種類型，指定資源位置及取用方式。

## V

**Virtual Network (VNet)**  
Azure 中私有網路的基本構建單元，提供隔離和分段。

**VS Code**  
Visual Studio Code。廣受歡迎的程式編輯器，與 Azure 和 azd 整合優異。

## W

**Webhook**  
由特定事件觸發的 HTTP 回調，常用於 CI/CD 流程。

**What-if**  
Azure 功能，顯示部署將做出的變更，而不實際執行。

## Y

**YAML**  
YAML 不是標記語言。人類可讀的資料序列化標準，用於配置檔如 azure.yaml。

## Z

**Zone**  
Azure 區域內物理分隔的位置，提供冗餘與高可用性。

---

## 常用縮寫

| 縮寫 | 全稱 | 描述 |
|---------|-----------|-------------|
| AAD | Azure Active Directory | 身份與存取管理服務 |
| ACR | Azure Container Registry | 容器映像登錄服務 |
| AKS | Azure Kubernetes Service | 託管 Kubernetes 服務 |
| API | Application Programming Interface | 建構軟件的協定集合 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分散式伺服器網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發實踐 |
| CLI | Command Line Interface | 文字介面 |
| DNS | Domain Name System | 將網域名稱轉為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP 的安全版本 |
| IaC | Infrastructure as Code | 以代碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全資訊傳輸的令牌格式 |
| KQL | Kusto Query Language | Azure 資料服務查詢語言 |
| RBAC | Role-Based Access Control | 基於角色的存取控制方法 |
| REST | Representational State Transfer | 網路服務的架構風格 |
| SDK | Software Development Kit | 開發工具集 |
| SLA | Service Level Agreement | 對服務可用性/效能的承諾 |
| SQL | Structured Query Language | 管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密通訊協定 |
| URI | Uniform Resource Identifier | 識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 電腦系統虛擬化 |
| VNet | Virtual Network | Azure 中的私有網路 |
| YAML | YAML Ain't Markup Language | 資料序列化標準 |

---

## Azure 服務名稱對照表

| 通用名稱 | 官方 Azure 服務名稱 | azd Host 類型 |
|-------------|------------------------------|---------------|
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

## 針對上下文的專用術語

### 開發術語
- **Hot Reload**：開發時自動更新應用程式而無需重啟
- **Build Pipeline**：自動化建構和測試代碼流程
- **Deployment Slot**：App Service 內的預備環境
- **Environment Parity**：維持開發、測試、正式環境一致性

### 安全術語
- **Managed Identity**：Azure 提供的自動憑證管理功能
- **Key Vault**：安全儲存祕密、金鑰和憑證
- **RBAC**：基於角色的 Azure 存取控制
- **Network Security Group**：控制網路流量的虛擬防火牆

### 監控術語
- **Telemetry**：自動收集的測量和資料
- **Application Performance Monitoring (APM)**：監控軟件效能
- **Log Analytics**：收集和分析日誌資料的服務
- **Alert Rules**：基於度量或條件的自動通知規則

### 部署術語
- **Blue-Green Deployment**：零停機部署策略
- **Canary Deployment**：逐步向部分用戶推出
- **Rolling Update**：逐步替換應用實例
- **Rollback**：回復至先前應用版本

---

**使用提示**：使用 `Ctrl+F` 可快速搜尋本詞彙表中特定術語。術語間有交叉參考。

---

**導覽**
- **上一課**: [速查表](cheat-sheet.md)
- **下一課**: [常見問題](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件乃使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力確保翻譯準確，但請注意，機器翻譯可能包含錯誤或不準確之處。文件原文版本應被視為具權威性的資料來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或誤釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->