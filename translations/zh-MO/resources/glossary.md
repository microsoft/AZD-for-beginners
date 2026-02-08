# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

本綜合詞彙表提供在 Azure Developer CLI 與 Azure 雲端開發中所使用的術語、概念與縮寫的定義。是理解技術文件、排解問題及有效溝通 azd 專案與 Azure 服務的重要參考。

## Learning Goals

使用此詞彙表，您將能：
- 了解 Azure Developer CLI 的重要術語與概念
- 掌握 Azure 雲端開發的詞彙與技術術語
- 有效參照基礎設施即程式碼與部署相關術語
- 理解 Azure 服務名稱、縮寫及其用途
- 取得除錯與排障術語的定義
- 學習進階的 Azure 架構與開發概念

## Learning Outcomes

經常參考此詞彙表後，您將能：
- 使用正確的 Azure Developer CLI 術語進行有效溝通
- 更清楚地理解技術文件與錯誤訊息
- 自信地導覽 Azure 服務與概念
- 使用適當的技術詞彙來排解問題
- 在團隊討論中以準確的技術語言做出貢獻
- 有系統地擴展您的 Azure 雲端開發知識

## A

**ARM Template**  
Azure Resource Manager 範本。基於 JSON 的基礎設施即程式碼格式，用於以宣告式方式定義與部署 Azure 資源。

**App Service**  
Azure 的平台即服務 (PaaS) 提供，用於承載網站應用程式、REST API 與行動後端，無需管理基礎設施。

**Application Insights**  
Azure 的應用程式效能監控 (APM) 服務，提供對應用程式效能、可用性與使用情況的深入洞察。

**Azure CLI**  
管理 Azure 資源的命令列介面。azd 用於驗證與某些作業時會使用此工具。

**Azure Developer CLI (azd)**  
以開發人員為中心的命令列工具，透過範本與基礎設施即程式碼，加速在 Azure 上構建與部署應用程式的流程。

**azure.yaml**  
azd 專案的主要設定檔，用於定義服務、基礎設施與部署掛鉤。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，提供一層管理層用來建立、更新與刪除資源。

## B

**Bicep**  
由微軟開發的領域專用語言 (DSL)，用於部署 Azure 資源。語法比 ARM 範本更簡潔，並會編譯成 ARM。

**Build**  
編譯原始程式碼、安裝相依性並為部署準備應用程式的過程。

**Blue-Green Deployment**  
使用兩個相同的生產環境（藍與綠）來降低停機時間與風險的部署策略。

## C

**Container Apps**  
Azure 的無伺服器容器服務，讓您在不管理複雜基礎設施的情況下執行容器化應用程式。

**CI/CD**  
持續整合 / 持續部署。自動化將程式碼變更整合並部署應用程式的作法。

**Cosmos DB**  
Azure 的全球分散式、多模型資料庫服務，提供針對吞吐量、延遲、可用性與一致性的完整 SLA。

**Configuration**  
控制應用程式行為與部署選項的設定與參數。

## D

**Deployment**  
在目標基礎設施上安裝與設定應用程式及其相依項的過程。

**Docker**  
使用容器化技術來開發、發佈與執行應用程式的平台。

**Dockerfile**  
包含建立 Docker 容器映像指令的文字檔。

## E

**Environment**  
代表應用程式特定實例的部署目標（例如：開發、預備、正式）。

**Environment Variables**  
以鍵值對形式儲存，應用程式在執行時可以存取的設定值。

**Endpoint**  
可存取應用程式或服務的 URL 或網路位址。

## F

**Function App**  
Azure 的無伺服器運算服務，讓您在不管理基礎設施的情況下執行事件驅動的程式碼。

## G

**GitHub Actions**  
與 GitHub 儲存庫整合的 CI/CD 平台，用於自動化工作流程。

**Git**  
用於追蹤原始程式碼變更的分散式版本控制系統。

## H

**Hooks**  
在部署生命週期特定時點（preprovision、postprovision、predeploy、postdeploy）執行的自訂腳本或命令。

**Host**  
應用程式將被部署的 Azure 服務類型（例如：appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
透過程式碼定義與管理基礎設施，而非手動程序的做法。

**Init**  
初始化新的 azd 專案的過程，通常自範本建立。

## J

**JSON**  
JavaScript 物件表示法。常用於設定檔與 API 回應的資料交換格式。

**JWT**  
JSON Web Token。以 JSON 物件在各方之間安全傳輸資訊的標準。

## K

**Key Vault**  
Azure 用於安全儲存與管理祕密、金鑰與憑證的服務。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 與其他 Azure 服務中資料的查詢語言。

## L

**Load Balancer**  
將進入的網路流量分散到多個伺服器或執行個體的服務。

**Log Analytics**  
Azure 用於從雲端與內部部署環境收集、分析與採取行動的遙測資料服務。

## M

**Managed Identity**  
Azure 的功能，為 Azure 服務提供自動管理的身分以便驗證其他 Azure 服務。

**Microservices**  
以一組小型、獨立服務構建應用程式的架構方法。

**Monitor**  
Azure 的統一監控解決方案，提供跨應用程式與基礎設施的全堆疊可觀測性。

## N

**Node.js**  
基於 Chrome 的 V8 JavaScript 引擎構建的 JavaScript 執行環境，用於建立伺服器端應用程式。

**npm**  
Node.js 的套件管理器，用於管理相依性與套件。

## O

**Output**  
從基礎設施部署返回的值，可供應用程式或其他資源使用。

## P

**Package**  
為部署準備應用程式程式碼與相依項的過程。

**Parameters**  
傳遞給基礎設施範本以自訂部署的輸入值。

**PostgreSQL**  
在 Azure 中作為受管服務支援的開源關聯式資料庫系統。

**Provisioning**  
建立並設定基礎設施範本中定義的 Azure 資源的過程。

## Q

**Quota**  
Azure 訂閱或區域中可建立資源數量的限制。

## R

**Resource Group**  
一組具有相同生命週期、權限與政策的 Azure 資源的邏輯容器。

**Resource Token**  
由 azd 生成的唯一字串，用以確保部署中資源名稱的唯一性。

**REST API**  
使用 HTTP 方法設計網路應用程式的架構風格。

**Rollback**  
將應用程式或基礎設施設定還原到先前版本的過程。

## S

**Service**  
在 azure.yaml 中定義的應用程式元件（例如：網頁前端、API 後端、資料庫）。

**SKU**  
庫存單位。代表 Azure 資源的不同服務層級或效能等級。

**SQL Database**  
基於 Microsoft SQL Server 的 Azure 受管關聯式資料庫服務。

**Static Web Apps**  
Azure 用於從原始程式碼儲存庫建立與部署全端網頁應用程式的服務。

**Storage Account**  
Azure 用於提供 blob、檔案、佇列與表格等資料物件雲端儲存的服務。

**Subscription**  
包含資源群組與資源的 Azure 帳戶容器，並具有相關計費與存取管理。

## T

**Template**  
預先建置的專案結構，包含應用程式程式碼、基礎設施定義與常見情境的設定。

**Terraform**  
支援包含 Azure 在內多個雲端供應商的開源基礎設施即程式碼工具。

**Traffic Manager**  
Azure 的 DNS 為基礎的流量負載平衡器，用於在全球 Azure 區域之間分配流量。

## U

**URI**  
統一資源識別符。用來識別特定資源的字串。

**URL**  
統一資源定位器。一種 URI，指定資源的位置與如何擷取該資源。

## V

**Virtual Network (VNet)**  
Azure 私有網路的基本構建區塊，提供隔離與分段。

**VS Code**  
Visual Studio Code。流行的程式碼編輯器，具有優良的 Azure 與 azd 整合能力。

## W

**Webhook**  
由特定事件觸發的 HTTP 回呼，常用於 CI/CD 管線中。

**What-if**  
Azure 的一項功能，顯示部署將會做出的變更而不實際執行它們。

## Y

**YAML**  
YAML 不是標記語言。用於像 azure.yaml 這類設定檔的人類可讀資料序列化標準。

## Z

**Zone**  
Azure 區域內的物理分隔位置，提供冗餘與高可用性。

---

## Common Acronyms

| 縮寫 | 完整名稱 | 說明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory | 身分識別與存取管理服務 |
| ACR | Azure Container Registry | 容器映像的註冊服務 |
| AKS | Azure Kubernetes Service | 託管的 Kubernetes 服務 |
| API | Application Programming Interface | 用於建構軟體的一組通訊協定 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 伺服器的分散式網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發作法 |
| CLI | Command Line Interface | 文字型使用者介面 |
| DNS | Domain Name System | 將網域名稱轉換為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | 安全版本的 HTTP |
| IaC | Infrastructure as Code | 以程式碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全傳輸資訊的令牌格式 |
| KQL | Kusto Query Language | 用於 Azure 資料服務的查詢語言 |
| RBAC | Role-Based Access Control | 基於使用者角色的存取控制方法 |
| REST | Representational State Transfer | 網路服務的架構風格 |
| SDK | Software Development Kit | 開發工具集合 |
| SLA | Service Level Agreement | 對服務可用性/效能的承諾 |
| SQL | Structured Query Language | 管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密通訊協定 |
| URI | Uniform Resource Identifier | 識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 電腦系統的模擬 |
| VNet | Virtual Network | Azure 中的私有網路 |
| YAML | YAML Ain't Markup Language | 資料序列化標準 |

---

## Azure Service Name Mappings

| Common Name | Official Azure Service Name | azd Host Type |
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

## Context-Specific Terms

### Development Terms
- **Hot Reload**: 在開發期間自動更新應用程式而無需重新啟動
- **Build Pipeline**: 自動化的建置與測試程式碼流程
- **Deployment Slot**: App Service 中的預備環境
- **Environment Parity**: 使開發、預備與正式環境保持相似

### Security Terms
- **Managed Identity**: 提供自動憑證管理的 Azure 功能
- **Key Vault**: 用於安全儲存祕密、金鑰與憑證
- **RBAC**: 用於 Azure 資源的角色為基礎存取控制
- **Network Security Group**: 用於控制網路流量的虛擬防火牆

### Monitoring Terms
- **Telemetry**: 自動收集測量與資料
- **Application Performance Monitoring (APM)**: 監控軟體效能
- **Log Analytics**: 用於收集與分析日誌資料的服務
- **Alert Rules**: 基於指標或條件的自動通知

### Deployment Terms
- **Blue-Green Deployment**: 零停機時間的部署策略
- **Canary Deployment**: 漸進式向部分使用者推出
- **Rolling Update**: 依序替換應用程式執行個體
- **Rollback**: 還原到先前的應用程式版本

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：

本文件已使用 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本應以為權威參考；如涉及重要或關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->