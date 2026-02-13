# 詞彙表 - Azure 與 AZD 術語

**所有章節參考**
- **📚 Course Home**: [AZD 新手指南](../README.md)
- **📖 Learn Basics**: [第 1 章：AZD 基礎](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [第 2 章：以 AI 為先的開發](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## 介紹

此綜合詞彙表提供在 Azure Developer CLI 與 Azure 雲端開發中使用的術語、概念與縮寫的定義。是理解技術文件、排解問題，以及就 azd 專案與 Azure 服務進行有效溝通的重要參考。

## 學習目標

使用此詞彙表，您將能：
- 了解 Azure Developer CLI 的基本術語與概念
- 熟悉 Azure 雲端開發的專業詞彙與技術術語
- 有效參考基礎設施即程式碼與部署相關術語
- 理解 Azure 服務名稱、縮寫及其用途
- 獲取排錯與偵錯術語的定義
- 學習進階的 Azure 架構與開發概念

## 學習成果

經常參考此詞彙表後，您將能：
- 使用正確的 Azure Developer CLI 術語進行有效溝通
- 更清楚地理解技術文件與錯誤訊息
- 自信地導覽 Azure 服務與相關概念
- 使用適當的技術詞彙進行問題排查
- 在團隊討論中提供準確的技術用語
- 系統性地擴展您的 Azure 雲端開發知識

## A

**ARM Template**  
Azure Resource Manager 範本。基於 JSON 的基礎設施即程式碼格式，用於以宣告式定義和部署 Azure 資源。

**App Service**  
Azure 的平台即服務 (PaaS) 提供，用於在不需管理基礎設施的情況下託管 Web 應用、REST API 與行動後端。

**Application Insights**  
Azure 的應用程式效能監控 (APM) 服務，提供對應用效能、可用性與使用情況的深入洞察。

**Azure CLI**  
用於管理 Azure 資源的命令列介面。azd 使用它來進行驗證與部分操作。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，使用範本與基礎設施即程式碼來加速應用程式部署到 Azure 的流程。

**azure.yaml**  
azd 專案的主要設定檔，定義服務、基礎設施與部署掛鉤。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，提供用於建立、更新與刪除資源的管理層。

## B

**Bicep**  
由 Microsoft 開發的領域特定語言 (DSL)，用於部署 Azure 資源。語法較 ARM 範本簡潔，並會編譯為 ARM。

**Build**  
編譯原始程式碼、安裝相依性並準備應用以供部署的過程。

**Blue-Green Deployment**  
使用兩個相同的生產環境（藍與綠）來最小化停機與風險的部署策略。

## C

**Container Apps**  
Azure 的無伺服器容器服務，允許在不管理複雜基礎設施的情況下執行容器化應用。

**CI/CD**  
持續整合/持續部署。用於整合程式碼變更與自動部署應用的自動化做法。

**Cosmos DB**  
Azure 的全球分散式多模型資料庫服務，提供吞吐量、延遲、可用性與一致性的完整 SLA。

**Configuration**  
控制應用行為與部署選項的設定與參數。

## D

**Deployment**  
在目標基礎設施上安裝與配置應用及其相依項目的過程。

**Docker**  
使用容器化技術來開發、打包與執行應用的平台。

**Dockerfile**  
包含用於建立 Docker 容器映像的指令的文字檔。

## E

**Environment**  
代表應用特定實例的部署目標（例如：開發、測試、正式環境）。

**Environment Variables**  
以鍵值對形式儲存的設定值，應用在執行時可存取。

**Endpoint**  
可存取應用或服務的 URL 或網路位址。

## F

**Function App**  
Azure 的無伺服器運算服務，使您能在不管理基礎設施的情況下執行事件驅動程式碼。

## G

**GitHub Actions**  
與 GitHub 儲存庫整合的 CI/CD 平台，用於自動化工作流程。

**Git**  
用於追蹤原始程式碼變更的分散式版本控制系統。

## H

**Hooks**  
在部署生命週期的特定時點執行的自訂腳本或命令（preprovision、postprovision、predeploy、postdeploy）。

**Host**  
應用將部署到的 Azure 服務類型（例如：appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
透過程式碼而非手動程序來定義與管理基礎設施的做法。

**Init**  
初始化新的 azd 專案的過程，通常是從範本建立。

## J

**JSON**  
JavaScript 物件表示法。常用於設定檔與 API 回應的資料交換格式。

**JWT**  
JSON Web Token。用於在各方間以 JSON 物件安全傳送資訊的標準。

## K

**Key Vault**  
Azure 用於安全儲存與管理機密、金鑰與憑證的服務。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 與其他 Azure 服務中資料的查詢語言。

## L

**Load Balancer**  
將進入的網路流量分配到多個伺服器或執行個體的服務。

**Log Analytics**  
Azure 用於收集、分析與對雲端與內部部署環境的遙測資料採取行動的服務。

## M

**Managed Identity**  
Azure 的功能，為 Azure 服務提供自動管理的身分以供向其他 Azure 服務驗證使用。

**Microservices**  
一種將應用構建為一組小型、獨立服務的架構方法。

**Monitor**  
Azure 的統一監控解決方案，提供跨應用與基礎設施的全方位可觀察性。

## N

**Node.js**  
基於 Chrome V8 引擎的 JavaScript 執行環境，用於構建伺服器端應用。

**npm**  
Node.js 的套件管理工具，用於管理相依性與套件。

## O

**Output**  
從基礎設施部署返回的值，可由應用或其他資源使用。

## P

**Package**  
為部署準備應用程式程式碼與相依項目的過程。

**Parameters**  
傳遞給基礎設施範本以自訂部署的輸入值。

**PostgreSQL**  
在 Azure 上作為受管服務支援的開源關聯式資料庫系統。

**Provisioning**  
建立並配置在基礎設施範本中定義的 Azure 資源的過程。

## Q

**Quota**  
對於 Azure 訂閱或區域可建立資源數量的限制。

## R

**Resource Group**  
Azure 資源的邏輯容器，具有相同的生命週期、權限與政策。

**Resource Token**  
由 azd 產生的唯一字串，用以確保資源名稱在部署間的唯一性。

**REST API**  
使用 HTTP 方法設計網路應用的架構風格。

**Rollback**  
將應用或基礎設施設定還原到先前版本的過程。

## S

**Service**  
在 azure.yaml 中定義的應用元件（例如：Web 前端、API 後端、資料庫）。

**SKU**  
庫存單位。代表 Azure 資源的不同服務等級或效能等級。

**SQL Database**  
基於 Microsoft SQL Server 的 Azure 受管關聯式資料庫服務。

**Static Web Apps**  
從原始程式碼儲存庫建立並部署全端網頁應用的 Azure 服務。

**Storage Account**  
提供 Blob、檔案、佇列與資料表等資料物件雲端儲存的 Azure 服務。

**Subscription**  
包含資源群組與資源的 Azure 帳戶容器，並具相關計費與存取管理。

## T

**Template**  
包含應用程式程式碼、基礎設施定義與常見情境設定的預建專案結構。

**Terraform**  
支援多雲供應商（包含 Azure）的開源基礎設施即程式碼工具。

**Traffic Manager**  
Azure 的基於 DNS 的流量負載平衡器，用於在全球 Azure 區域間分配流量。

## U

**URI**  
統一資源識別符。識別特定資源的字串。

**URL**  
統一資源定位符。指定資源位置及如何取得它的 URI 類型。

## V

**Virtual Network (VNet)**  
Azure 私有網路的基本構建區塊，提供隔離與分割。

**VS Code**  
Visual Studio Code。受歡迎的程式碼編輯器，具出色的 Azure 與 azd 整合。

## W

**Webhook**  
由特定事件觸發的 HTTP 回呼，常用於 CI/CD 管線。

**What-if**  
Azure 的一項功能，可在不實際執行部署的情況下顯示部署會造成的變更。

## Y

**YAML**  
YAML Ain't Markup Language。人類可讀的資料序列化標準，常用於像 azure.yaml 這類的設定檔。

## Z

**Zone**  
Azure 區域內物理分離的位置，提供冗餘與高可用性。

---

## 常見縮寫

| 縮寫 | 全稱 | 說明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory | 身份與存取管理服務 |
| ACR | Azure Container Registry | 容器映像註冊服務 |
| AKS | Azure Kubernetes Service | 受管的 Kubernetes 服務 |
| API | Application Programming Interface | 建構軟體的協定集合 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分散式伺服器網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發作法 |
| CLI | Command Line Interface | 文字介面的使用者介面 |
| DNS | Domain Name System | 將網域名稱轉換為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | 安全版本的 HTTP |
| IaC | Infrastructure as Code | 以程式碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全傳輸資訊的令牌格式 |
| KQL | Kusto Query Language | 用於 Azure 資料服務的查詢語言 |
| RBAC | Role-Based Access Control | 基於使用者角色的存取控制方法 |
| REST | Representational State Transfer | 網頁服務的架構風格 |
| SDK | Software Development Kit | 開發工具集合 |
| SLA | Service Level Agreement | 對服務可用性/效能的承諾 |
| SQL | Structured Query Language | 用於管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密通訊協定 |
| URI | Uniform Resource Identifier | 用於識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 電腦系統的模擬執行個體 |
| VNet | Virtual Network | Azure 中的私有網路 |
| YAML | YAML Ain't Markup Language | 資料序列化標準 |

---

## Azure 服務名稱對應

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

## 情境特定術語

### 開發術語
- **Hot Reload**: 在開發期間自動更新應用而無需重新啟動
- **Build Pipeline**: 自動化的建置與測試程式流程
- **Deployment Slot**: App Service 中的暫存環境
- **Environment Parity**: 保持開發、暫存與正式環境的一致性

### 安全術語
- **Managed Identity**: 提供自動憑證管理的 Azure 功能
- **Key Vault**: 用於安全儲存機密、金鑰與憑證
- **RBAC**: 對 Azure 資源的角色式存取控制
- **Network Security Group**: 用於控制網路流量的虛擬防火牆

### 監控術語
- **Telemetry**: 自動收集的度量與資料
- **Application Performance Monitoring (APM)**: 監控軟體效能
- **Log Analytics**: 用於收集與分析日誌資料的服務
- **Alert Rules**: 根據指標或條件發送自動通知的規則

### 部署術語
- **Blue-Green Deployment**: 零停機部署策略
- **Canary Deployment**: 漸進式對部分使用者開放的發布策略
- **Rolling Update**: 依序替換應用執行個體的方式
- **Rollback**: 還原到先前應用版本

---

**使用小技巧**: 使用 `Ctrl+F` 可快速搜尋本詞彙表中的特定術語。術語在適用時會有交叉參照。

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始語言版本應視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或錯誤詮釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->