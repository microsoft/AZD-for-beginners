# 詞彙表 - Azure 與 AZD 術語

<strong>所有章節參考</strong>  
- **📚 課程主頁**：[AZD 入門](../README.md)  
- **📖 基本學習**：[第1章：AZD 基礎知識](../docs/getting-started/azd-basics.md)  
- **🤖 AI 術語**：[第2章：AI-First 開發](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## 介紹

本綜合詞彙表提供 Azure Developer CLI 與 Azure 雲端開發中使用的術語、概念及縮寫定義，是理解技術文件、排解問題及有效溝通 azd 專案與 Azure 服務的必備參考。

## 學習目標

使用本詞彙表，你將能：  
- 理解 Azure Developer CLI 的重要術語與概念  
- 精通 Azure 雲端開發的詞彙與技術用語  
- 高效查找基礎設施即代碼及部署相關術語  
- 了解 Azure 服務名稱、縮寫及其用途  
- 訪問故障排除與除錯術語定義  
- 學習進階 Azure 架構與開發概念  

## 學習成果

透過定期查閱本詞彙表，你將能：  
- 使用正確 Azure Developer CLI 術語有效溝通  
- 更清晰理解技術文件與錯誤訊息  
- 更有信心駕馭 Azure 服務與相關概念  
- 使用合適的技術詞彙進行問題排解  
- 準確參與團隊技術討論  
- 系統化擴展 Azure 雲端開發知識  

## A

**ARM Template**  
Azure 資源管理器模板。以 JSON 為基礎的基礎設施即代碼格式，宣告式定義與部署 Azure 資源。

**App Service**  
Azure 平台即服務 (PaaS)，用於托管網站應用程式、REST API 和行動後端，無需管理底層基礎設施。

**Application Insights**  
Azure 的應用程式效能監控服務，提供深入的應用效能、可用性及使用情況洞察。

**Azure CLI**  
管理 Azure 資源的命令列介面。azd 使用其來進行身份驗證與部分操作。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，透過範本和基礎設施即代碼加速應用程式在 Azure 上的建立與部署流程。

**azure.yaml**  
azd 專案的主要設定檔，定義服務、基礎設施及部署掛鉤。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，為資源的建立、更新與刪除提供管理層。

## B

**Bicep**  
由微軟開發的領域專用語言 (DSL)，用於部署 Azure 資源。語法比 ARM 模板更簡潔，會編譯成 ARM 格式。

**Build**  
編譯原始碼、安裝相依套件及準備應用程式部署的過程。

**Blue-Green Deployment**  
使用兩個相同生產環境（藍色與綠色）以將停機時間與風險降到最低的部署策略。

## C

**Container Apps**  
Azure 的無伺服器容器服務，能夠執行容器化應用程式，無需管理複雜基礎架構。

**CI/CD**  
持續整合/持續部署。自動化整合程式碼修改與部署應用的實踐。

**Cosmos DB**  
Azure 的全球分布、多模型資料庫服務，提供完整的吞吐量、延遲、可用性及一致性 SLA。

**Configuration**  
控制應用行為與部署選項的設定與參數。

## D

**Deployment**  
在目標基礎設施上安裝與設定應用及其相依性過程。

**Docker**  
使用容器技術開發、運送及執行應用的平台。

**Dockerfile**  
包含建置 Docker 容器映像指令的文字檔。

## E

**Environment**  
代表應用特定執行個體的部署目標（例如開發、預備、正式）。

**Environment Variables**  
以鍵值對儲存，應用程式執行時可存取的設定值。

**Endpoint**  
可以存取應用程式或服務的 URL 或網路位址。

## F

**Function App**  
Azure 的無伺服器運算服務，能執行事件驅動程式碼，無需管理基礎設施。

## G

**GitHub Actions**  
與 GitHub 倉儲整合的 CI/CD 平台，用於自動化工作流程。

**Git**  
用於追蹤原始碼變更的分散式版本控制系統。

## H

**Hooks**  
在部署生命週期特定時點（preprovision、postprovision、predeploy、postdeploy）運行的自訂指令碼或命令。

**Host**  
應用將部署的 Azure 服務類型（例如 appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
以程式碼方式定義與管理基礎設施，取代手動處理。

**Init**  
初始化新 azd 專案的過程，通常以範本為基礎。

## J

**JSON**  
JavaScript 物件表示法。廣泛用於配置檔及 API 回應的資料交換格式。

**JWT**  
JSON 網頁令牌。用於安全傳輸雙方資訊的標準 JSON 格式。

## K

**Key Vault**  
Azure 的機密、金鑰及憑證安全儲存與管理服務。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 及其他 Azure 服務資料的查詢語言。

## L

**Load Balancer**  
分配輸入網路流量至多台伺服器或實例的服務。

**Log Analytics**  
Azure 用於收集、分析並對雲端與本地環境遙測資料採取行動的服務。

## M

**Managed Identity**  
Azure 功能，為 Azure 服務自動管理身份以進行其他 Azure 服務身份驗證。

**Microservices**  
將應用複製為一組小型獨立服務的架構方法。

**Monitor**  
Azure 統一監控解決方案，提供應用與基礎設施的全棧可觀察性。

## N

**Node.js**  
基於 Chrome V8 JavaScript 引擎的伺服器端 JavaScript 執行環境。

**npm**  
Node.js 的套件管理器，用於管理相依性與套件。

## O

**Output**  
基礎設施部署後返回的數值，可被應用或其他資源使用。

## P

**Package**  
準備應用程式程式碼與相依性以供部署的過程。

**Parameters**  
傳遞給基礎設施範本的輸入值，用以客製化部署。

**PostgreSQL**  
Azure 支援的開源關聯式資料庫系統，以管理服務形式提供。

**Provisioning**  
建立並配置範本中定義的 Azure 資源的過程。

## Q

**Quota**  
Azure 訂閱或區域可建立資源的數量限制。

## R

**Resource Group**  
管理 Azure 資源的邏輯容器，具有共同生命週期、權限與政策。

**Resource Token**  
由 azd 生成的獨特字串，確保資源名稱跨部署唯一。

**REST API**  
使用 HTTP 方法設計網路應用的架構風格。

**Rollback**  
還原至應用或基礎設施先前版本的過程。

## S

**Service**  
azure.yaml 中定義的應用組件（例如網頁前端、API 後端、資料庫）。

**SKU**  
庫存單位。代表 Azure 資源不同的服務層級或效能等級。

**SQL Database**  
基於 Microsoft SQL Server 的 Azure 管理式關聯式資料庫服務。

**Static Web Apps**  
Azure 用於從原始碼倉儲構建與部署全堆疊網頁應用的服務。

**Storage Account**  
Azure 用於儲存 Blob、檔案、佇列及表格等資料物件的雲端存放服務。

**Subscription**  
Azure 帳戶容器，包含資源群組與資源，負責計費與存取管理。

## T

**Template**  
預先建置的專案結構，包含應用程式程式碼、基礎設施定義及常見場景配置。

**Terraform**  
支援多雲端供應商（包括 Azure）的開源基礎設施即代碼工具。

**Traffic Manager**  
Azure 的 DNS 基流量負載平衡器，用以跨全球 Azure 區域分配流量。

## U

**URI**  
統一資源識別符。用字串識別特定資源。

**URL**  
統一資源定位符。指定資源位置及取得方式的 URI 類型。

## V

**Virtual Network (VNet)**  
Azure 私有網路的基本建構模組，提供隔離與分段功能。

**VS Code**  
Visual Studio Code。受歡迎的程式碼編輯器，具備優秀的 Azure 與 azd 整合。

## W

**Webhook**  
由特定事件觸發的 HTTP 回調，常用於 CI/CD 管線。

**What-if**  
Azure 功能，可模擬部署將產生的變更而不執行實際動作。

## Y

**YAML**  
YAML 非標記式語言。用於配置檔（如 azure.yaml）的可讀資料序列化標準。

## Z

**Zone**  
Azure 區域內物理分隔的位置，提供冗餘與高可用性。

---

## 常用縮寫

| 縮寫 | 全稱 | 說明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory (現在為 Microsoft Entra ID) | 身份與存取管理服務 |
| ACR | Azure Container Registry | 容器映像註冊服務 |
| AKS | Azure Kubernetes Service | 管理式 Kubernetes 服務 |
| API | Application Programming Interface | 構建軟體的協定集合 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分散式伺服器網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發實踐 |
| CLI | Command Line Interface | 文字介面操作工具 |
| DNS | Domain Name System | 將域名轉換為 IP 地址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP 的安全版本 |
| IaC | Infrastructure as Code | 以代碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全訊息傳輸的令牌格式 |
| KQL | Kusto Query Language | Azure 資料服務查詢語言 |
| RBAC | Role-Based Access Control | 基於角色的存取控制方法 |
| REST | Representational State Transfer | 網路服務架構風格 |
| SDK | Software Development Kit | 開發工具組合 |
| SLA | Service Level Agreement | 服務可用性/效能承諾 |
| SQL | Structured Query Language | 管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密通訊協議 |
| URI | Uniform Resource Identifier | 識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 電腦系統模擬機 |
| VNet | Virtual Network | Azure 私有網路 |
| YAML | YAML Ain't Markup Language | 資料序列化標準 |

---

## Azure 服務名稱對應表

| 常用名稱 | 官方 Azure 服務名稱 | azd 主機類型 |
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

## 情境特定術語

### 開發術語  
- <strong>熱重載</strong>：開發期間自動更新應用程式，無需重啟  
- <strong>建置管線</strong>：自動化建置與測試程式碼流程  
- <strong>部署插槽</strong>：App Service 中的預備環境  
- <strong>環境一致性</strong>：維持開發、預備與生產環境相似  

### 安全術語  
- **Managed Identity**：Azure 提供自動憑證管理的身份功能  
- **Key Vault**：安全儲存機密、金鑰與憑證  
- **RBAC**：Azure 資源的基於角色的存取控制  
- **Network Security Group**：虛擬防火牆，用於控管網路流量  

### 監控術語  
- **Telemetry**：自動收集度量與資料  
- **Application Performance Monitoring (APM)**：監控軟體效能  
- **Log Analytics**：收集與分析日誌數據服務  
- **Alert Rules**：基於指標或條件的自動通知  

### 部署術語  
- **Blue-Green Deployment**：零停機時間部署策略  
- **Canary Deployment**：逐步向部分用戶推出  
- **Rolling Update**：應用實例的逐步替換  
- **Rollback**：回復到先前應用版本  

---

<strong>使用提示</strong>：使用 `Ctrl+F` 可快速搜尋本詞彙表中的特定術語。術語間亦有適當交叉引用。

---

<strong>導覽</strong>  
- <strong>上一課</strong>：[速查表](cheat-sheet.md)  
- <strong>下一課</strong>：[常見問題](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->