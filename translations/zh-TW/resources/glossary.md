# 詞彙表 - Azure 與 AZD 術語

<strong>所有章節參考</strong>
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 學習基礎**: [第 1 章：AZD 基礎](../docs/getting-started/azd-basics.md)
- **🤖 AI 術語**: [第 2 章：以 AI 為先的開發](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## 介紹

本完整詞彙表提供在 Azure Developer CLI 與 Azure 雲端開發中使用的術語、概念與縮寫的定義。是理解技術文件、排解問題以及在 azd 專案與 Azure 服務上有效溝通的重要參考。

## 學習目標

透過使用此詞彙表，你將能：
- 了解 Azure Developer CLI 的重要術語與概念
- 精通 Azure 雲端開發相關詞彙與技術用語
- 有效率地查閱基礎設施即程式碼與部署相關術語
- 理解 Azure 服務名稱、縮寫及其用途
- 取得故障排除與偵錯相關術語的定義
- 學習進階的 Azure 架構與開發概念

## 學習成效

經常參考此詞彙表後，你將能夠：
- 使用正確的 Azure Developer CLI 術語進行有效溝通
- 更清楚地理解技術文件與錯誤訊息
- 自信地瀏覽 Azure 服務與概念
- 使用適當的技術用語來排解問題
- 在團隊討論中提供準確的技術表述
- 系統性地擴展你的 Azure 雲端開發知識

## A

**ARM Template**  
Azure Resource Manager 範本。基於 JSON 的基礎設施即程式碼格式，用於以宣告式方式定義並部署 Azure 資源。

**App Service**  
Azure 的平台即服務 (PaaS)，用於托管網站、REST API 與行動後端，而不需管理基礎設施。

**Application Insights**  
Azure 的應用程式效能監控 (APM) 服務，提供應用程式效能、可用性與使用情況的深度洞察。

**Azure CLI**  
用於管理 Azure 資源的命令列介面。azd 會使用它進行認證與某些操作。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，加速使用範本與基礎設施即程式碼將應用程式建置並部署到 Azure 的流程。

**azure.yaml**  
azd 專案的主要設定檔，用以定義服務、基礎設施與部署鉤子。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，提供建立、更新與刪除資源的管理層。

## B

**Bicep**  
微軟為部署 Azure 資源開發的領域特定語言 (DSL)。語法比 ARM 範本更簡潔，會編譯為 ARM。

**Build**  
編譯原始程式碼、安裝相依性並準備應用程式以供部署的過程。

**Blue-Green Deployment**  
使用兩個相同的生產環境（藍色與綠色）來最小化停機與風險的部署策略。

## C

**Container Apps**  
Azure 的無伺服器容器服務，可在不管理複雜基礎設施的情況下執行容器化應用程式。

**CI/CD**  
持續整合 / 持續部署。用於整合程式碼變更與自動部署應用程式的自動化實務。

**Cosmos DB**  
Azure 全球分散式、多模型資料庫服務，提供涵蓋吞吐量、延遲、可用性與一致性的完整 SLA。

**Configuration**  
控制應用程式行為與部署選項的設定與參數。

## D

**Deployment**  
在目標基礎設施上安裝與配置應用程式及其相依性的過程。

**Docker**  
使用容器化技術來開發、運送與執行應用程式的平台。

**Dockerfile**  
包含用於建立 Docker 容器映像指令的文字檔。

## E

**Environment**  
代表應用程式特定實例的部署目標（例如：開發、預備、正式環境）。

**Environment Variables**  
以鍵值對形式儲存的設定值，應用程式在執行時可以存取。

**Endpoint**  
可存取應用程式或服務的 URL 或網路位址。

## F

**Function App**  
Azure 的無伺服器運算服務，可在不管理基礎設施的情況下執行事件驅動的程式碼。

## G

**GitHub Actions**  
與 GitHub 倉庫整合的 CI/CD 平台，用於自動化工作流程。

**Git**  
用於追蹤原始程式碼變更的分散式版本控制系統。

## H

**Hooks**  
在部署生命週期特定時點執行的自訂指令或腳本（preprovision、postprovision、predeploy、postdeploy）。

**Host**  
應用程式將被部署的 Azure 服務類型（例如：appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
以程式碼而非手動流程來定義與管理基礎設施的實作方式。

**Init**  
初始化新的 azd 專案的過程，通常來自範本。

## J

**JSON**  
JavaScript 物件表示法。常用於設定檔與 API 回應的資料交換格式。

**JWT**  
JSON Web Token。用於在各方之間以 JSON 物件安全傳輸資訊的標準。

## K

**Key Vault**  
Azure 用於安全儲存與管理機密、金鑰與憑證的服務。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 與其他 Azure 服務中資料的查詢語言。

## L

**Load Balancer**  
將進入的網路流量分散到多個伺服器或執行個體的服務。

**Log Analytics**  
Azure 用於收集、分析並對雲端與內部部署環境的遙測資料採取行動的服務。

## M

**Managed Identity**  
Azure 的功能，可為 Azure 服務提供自動管理的身分以便向其他 Azure 服務驗證。

**Microservices**  
一種將應用程式構建為多個小型、獨立服務的架構方法。

**Monitor**  
Azure 的統一監控解決方案，提供跨應用程式與基礎設施的完整可觀察性。

## N

**Node.js**  
基於 Chrome 的 V8 JavaScript 引擎的 JavaScript 執行環境，用於建立伺服器端應用程式。

**npm**  
Node.js 的套件管理工具，用於管理相依性與套件。

## O

**Output**  
從基礎設施部署返回的值，可供應用程式或其他資源使用。

## P

**Package**  
為部署準備應用程式程式碼與相依性的過程。

**Parameters**  
傳遞給基礎設施範本以自訂部署的輸入值。

**PostgreSQL**  
在 Azure 上受支援的開源關聯式資料庫系統，作為託管服務提供。

**Provisioning**  
建立並配置在基礎設施範本中定義的 Azure 資源的過程。

## Q

**Quota**  
在 Azure 訂閱或區域中可建立資源數量的限制。

## R

**Resource Group**  
用於將具有相同生命週期、權限與政策的 Azure 資源彙整的邏輯容器。

**Resource Token**  
azd 產生的唯一字串，用以確保部署期間資源名稱的唯一性。

**REST API**  
使用 HTTP 方法設計網路應用程式的架構風格。

**Rollback**  
回復到先前版本的應用程式或基礎設施設定的過程。

## S

**Service**  
在 azure.yaml 中定義的應用程式組件（例如：web 前端、API 後端、資料庫）。

**SKU**  
庫存單位。表示 Azure 資源不同的服務等級或效能等級。

**SQL Database**  
基於 Microsoft SQL Server 的 Azure 託管關聯式資料庫服務。

**Static Web Apps**  
Azure 用於從原始碼倉庫建置與部署全端網頁應用程式的服務。

**Storage Account**  
Azure 提供用於儲存物件（blobs）、檔案、佇列與表格等資料的雲端儲存服務。

**Subscription**  
包含資源群組與資源的 Azure 帳戶容器，並具相關計費與存取管理。

## T

**Template**  
預建的專案結構，包含應用程式程式碼、基礎設施定義與常見情境的設定。

**Terraform**  
支援包含 Azure 在內多個雲端供應者的開源基礎設施即程式碼工具。

**Traffic Manager**  
Azure 的基於 DNS 的流量負載平衡器，用於在全球 Azure 區域間分配流量。

## U

**URI**  
統一資源識別碼。識別特定資源的字串。

**URL**  
統一資源定位符。URI 的一種類型，用於指定資源位置與如何取得該資源。

## V

**Virtual Network (VNet)**  
Azure 中私有網路的基本構建區塊，提供隔離與網路分割。

**VS Code**  
Visual Studio Code。受歡迎的程式碼編輯器，與 Azure 及 azd 有良好整合。

## W

**Webhook**  
由特定事件觸發的 HTTP 回呼，常用於 CI/CD 管線。

**What-if**  
Azure 的功能，可在不實際執行部署的情況下顯示部署將會做出的變更。

## Y

**YAML**  
YAML Ain't Markup Language。人可讀的資料序列化標準，用於像 azure.yaml 這類的設定檔。

## Z

**Zone**  
Azure 區域內物理分離的位置，提供冗餘與高可用性。

---

## 常見縮寫

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | 身分與存取管理服務 |
| ACR | Azure Container Registry | 容器映像註冊服務 |
| AKS | Azure Kubernetes Service | 託管 Kubernetes 服務 |
| API | Application Programming Interface | 建構軟體的協定集合 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分散式伺服器網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發實務 |
| CLI | Command Line Interface | 文字介面使用者介面 |
| DNS | Domain Name System | 將網域名稱轉為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | 安全版本的 HTTP |
| IaC | Infrastructure as Code | 以程式碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全資訊傳輸的令牌格式 |
| KQL | Kusto Query Language | 用於 Azure 資料服務的查詢語言 |
| RBAC | Role-Based Access Control | 基於使用者角色的存取控制方法 |
| REST | Representational State Transfer | Web 服務的架構風格 |
| SDK | Software Development Kit | 開發工具集合 |
| SLA | Service Level Agreement | 對服務可用性/效能的承諾 |
| SQL | Structured Query Language | 管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密通訊協定 |
| URI | Uniform Resource Identifier | 識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 電腦系統的模擬實作 |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## 情境專屬術語

### 開發相關術語
- **Hot Reload**: 在開發期間自動更新應用程式而不需重新啟動
- **Build Pipeline**: 自動化建置與測試程式碼的流程
- **Deployment Slot**: App Service 內的預備環境
- **Environment Parity**: 保持開發、預備與正式環境相似

### 安全相關術語
- **Managed Identity**: 提供自動憑證管理的 Azure 功能
- **Key Vault**: 用於安全儲存機密、金鑰與憑證
- **RBAC**: 對 Azure 資源實施的基於角色的存取控制
- **Network Security Group**: 控制網路流量的虛擬防火牆

### 監控相關術語
- **Telemetry**: 自動收集度量與資料
- **Application Performance Monitoring (APM)**: 監控軟體效能
- **Log Analytics**: 用於收集與分析日誌資料的服務
- **Alert Rules**: 根據指標或條件的自動通知

### 部署相關術語
- **Blue-Green Deployment**: 零停機部署策略
- **Canary Deployment**: 逐步向部分使用者推出的新版本
- **Rolling Update**: 依序替換應用程式執行個體
- **Rollback**: 回復到先前的應用程式版本

---

<strong>使用提示</strong>: 使用 `Ctrl+F` 可以快速搜尋此詞彙表中的特定術語。術語在適用時會互相參照。

---

<strong>導覽</strong>
- <strong>上一課</strong>: [Cheat Sheet](cheat-sheet.md)
- <strong>下一課</strong>: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->