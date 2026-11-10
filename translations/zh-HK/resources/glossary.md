# 詞彙表 - Azure 與 AZD 術語

<strong>所有章節參考</strong>
- **📚 課程首頁**: [AZD 入門](../README.md)
- **📖 學習基礎**: [第1章：AZD 基礎](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI 術語**: [第2章：AI 優先開發](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合詞彙表提供 Azure Developer CLI 和 Azure 雲端開發中使用的術語、概念及縮寫的定義。是理解技術文件、排解問題及有效溝通 azd 專案和 Azure 服務的重要參考。

## 學習目標

使用此詞彙表，您將能：
- 理解重要的 Azure Developer CLI 術語和概念
- 掌握 Azure 雲端開發詞彙與技術術語
- 有效率地參考基礎架構即程式碼和部署術語
- 理解 Azure 服務名稱、縮寫及其用途
- 獲取排解和調試相關術語的定義
- 學習進階的 Azure 架構與開發概念

## 學習成果

經常參考此詞彙表後，您將能：
- 使用正確的 Azure Developer CLI 術語進行有效溝通
- 更清楚理解技術文件和錯誤訊息
- 自信地導航 Azure 服務與概念
- 運用適當技術詞彙進行問題排解
- 用準確技術語言參與團隊討論
- 有系統地擴展 Azure 雲端開發知識

## A

**ARM 模板**  
Azure Resource Manager 模板。基於 JSON 的基礎架構即程式碼格式，用於宣告式定義和部署 Azure 資源。

**App Service**  
Azure 的平台即服務（PaaS）產品，用於在不管理基礎設施的情況下承載 Web 應用程式、REST API 和行動後端。

**Application Insights**  
Azure 的應用程式效能監控（APM）服務，提供深入的應用效能、可用性及使用狀況洞察。

**Azure CLI**  
用於管理 Azure 資源的命令列介面。其與 AZD 相輔相成，但須使用獨立登入；AZD 核心身份驗證則用 `azd auth login`。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，透過範本和基礎架構即程式碼加速 Azure 應用程式建立與部署流程。

**azure.yaml**  
azd 專案的主要設定檔，定義服務、基礎架構和部署掛勾。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，提供用於建立、更新及刪除資源的管理層。

## B

**Bicep**  
微軟開發的特定領域語言（DSL），用於部署 Azure 資源。語法比 ARM 模板更簡潔，並編譯成 ARM。

**Build**  
編譯原始碼、安裝相依性並準備應用程式部署的過程。

**Blue-Green Deployment**  
部署策略，使用兩個相同的生產環境（藍綠）以降低停機時間和風險。

## C

**Container Apps**  
Azure 的無伺服器容器服務，使容器化應用程式能在無需管理複雜基礎設施下運行。

**CI/CD**  
持續整合/持續部署。自動化程式碼變更整合與應用程式部署的實務。

**Cosmos DB**  
Azure 全球分布式、多模型資料庫服務，提供完整的吞吐量、延遲、可用性和一致性 SLA。

**Configuration**  
控制應用行為和部署選項的設定與參數。

## D

**Deployment**  
在目標基礎設施上安裝和配置應用程式及其相依性的過程。

**Docker**  
使用容器化技術開發、發行及運行應用程式的平台。

**Dockerfile**  
包含建構 Docker 容器映像指令的文字檔案。

## E

**Environment**  
表示應用程式特定執行實例的部署目標（例如開發、測試、正式）。

**Environment Variables**  
以鍵值對形式儲存的設定值，應用程式可於執行時存取。

**Endpoint**  
可存取應用程式或服務的 URL 或網路位址。

## F

**Function App**  
Azure 的無伺服器運算服務，支援執行事件驅動的程式碼而無需管理基礎設施。

## G

**GitHub Actions**  
與 GitHub 程式碼庫整合的 CI/CD 平台，自動化工作流程。

**Git**  
分散式版本控制系統，用於追蹤原始碼變更。

## H

**Hooks**  
在部署生命週期特定階段（如預供應、供應後、預部署、部署後）執行的自訂腳本或指令。

**Host**  
應用程式將部署的 Azure 服務類型（例如 appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
透過程式碼定義與管理基礎設施，而非手動操作的做法。

**Init**  
初始化新 azd 專案的過程，通常由範本開始。

## J

**JSON**  
JavaScript 物件表示法。常用於設定檔與 API 回應的資料交換格式。

**JWT**  
JSON Web Token。安全地在雙方間傳輸資訊的 JSON 格式標準。

## K

**Key Vault**  
Azure 用於安全存放與管理密碼、金鑰及憑證的服務。

**Kusto Query Language (KQL)**  
用於分析 Azure Monitor、Application Insights 及其他 Azure 服務中資料的查詢語言。

## L

**Load Balancer**  
負載平衡服務，將進入的網路流量分散到多台伺服器或實例。

**Log Analytics**  
Azure 用於蒐集、分析及利用雲端和本地環境遙測資料的服務。

## M

**Managed Identity**  
Azure 功能，為 Azure 服務提供自動管理的身份，以便認證其他 Azure 服務。

**Microservices**  
將應用拆解為多個小型獨立服務的架構方法。

**Monitor**  
Azure 的統一監控解決方案，提供跨應用和基礎設施的全方位可觀察性。

## N

**Node.js**  
以 Chrome V8 JavaScript 引擎建立的 JavaScript 執行環境，用於建置伺服器端應用。

**npm**  
Node.js 的套件管理工具，用於管理相依套件與包裹。

## O

**Output**  
從基礎架構部署返回的數值，可供應用程式或其他資源使用。

## P

**Package**  
準備應用程式程式碼與相依性以便部署的過程。

**Parameters**  
傳給基礎架構範本以客製化部署的輸入值。

**PostgreSQL**  
以開源為基礎的關聯式資料庫系統，Azure 以受控服務支援。

**Provisioning**  
依基礎架構範本中的定義建立和設定 Azure 資源的過程。

## Q

**Quota**  
Azure 訂閱或區域中可建立資源數量的限制。

## R

**Resource Group**  
存放共用相同生命週期、權限及政策的 Azure 資源的邏輯容器。

**Resource Token**  
由 azd 產生的唯一字串，確保資源名稱在各部署中獨一無二。

**REST API**  
使用 HTTP 方法設計網路應用的架構風格。

**Rollback**  
回復至先前版本的應用程式或基礎架構設定的過程。

## S

**Service**  
azure.yaml 中定義的應用組件（例如 web 前端、API 後端、資料庫）。

**SKU**  
庫存單位。代表 Azure 資源的不同服務層級或效能等級。

**SQL Database**  
Azure 基於 Microsoft SQL Server 的受控關聯式資料庫服務。

**Static Web Apps**  
Azure 服務，從原始碼倉儲構建與部署全棧網頁應用程式。

**Storage Account**  
Azure 服務，提供用於儲存 Blob、檔案、佇列及資料表的雲端儲存空間。

**Subscription**  
Azure 帳戶容器，包含資源群組及資源，並管理計費與存取。

## T

**Template**  
預建專案結構，包含應用程式碼、基礎架構定義及常見情境設定。

**Terraform**  
開源基礎架構即程式碼工具，支援多雲服務商包括 Azure。

**Traffic Manager**  
Azure 的基於 DNS 的流量負載平衡器，用以分配全球 Azure 區域間流量。

## U

**URI**  
統一資源識別碼。識別特定資源的字串。

**URL**  
統一資源定位器。URI 的一種，指定資源所在位置及存取方式。

## V

**Virtual Network (VNet)**  
Azure 私有網路的基本建構單元，提供隔離及分段功能。

**VS Code**  
Visual Studio Code。流行的程式碼編輯器，具有優良的 Azure 和 azd 整合。

## W

**Webhook**  
由特定事件觸發的 HTTP 回調，常用於 CI/CD 管線。

**What-if**  
Azure 功能，顯示部署會帶來哪些變更但不實際執行。

## Y

**YAML**  
YAML 非標記語言。用於配置檔如 azure.yaml 的人類可讀資料序列化標準。

## Z

**Zone**  
Azure 區域內的物理獨立地點，提供冗余和高可用性。

---

## 常用縮寫

| 縮寫 | 全稱 | 說明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory（現為 Microsoft Entra ID） | 身份與存取管理服務 |
| ACR | Azure Container Registry | 容器映像註冊服務 |
| AKS | Azure Kubernetes Service | 托管 Kubernetes 服務 |
| API | Application Programming Interface | 用於建立軟體的協定集合 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分散式伺服器網路 |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化開發實務 |
| CLI | Command Line Interface | 基於文字的用戶介面 |
| DNS | Domain Name System | 將網域名稱轉換為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | 安全版的 HTTP |
| IaC | Infrastructure as Code | 以程式碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全資訊傳輸的令牌格式 |
| KQL | Kusto Query Language | 用於 Azure 資料服務的查詢語言 |
| RBAC | Role-Based Access Control | 基於角色的存取控制方法 |
| REST | Representational State Transfer | 網路服務架構風格 |
| SDK | Software Development Kit | 開發工具組合 |
| SLA | Service Level Agreement | 服務可用性/效能承諾 |
| SQL | Structured Query Language | 管理關聯式資料庫的語言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密協定 |
| URI | Uniform Resource Identifier | 識別資源的字串 |
| URL | Uniform Resource Locator | 指定資源位置的 URI 類型 |
| VM | Virtual Machine | 電腦系統模擬 |
| VNet | Virtual Network | Azure 私人網路 |
| YAML | YAML 非標記語言 | 資料序列化標準 |

---

## Azure 服務名稱對照

| 常用名稱 | 官方 Azure 服務名稱 | azd Host 類型 |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | 基礎架構資源，非應用程式 `host` |
| NoSQL DB | Azure Cosmos DB | 基礎架構資源，非應用程式 `host` |
| Storage | Azure Storage Account | 基礎架構資源，非內建應用程式 `host` |
| Cache | Azure Managed Redis | 基礎架構資源，非應用程式 `host` |
| Search | Azure AI Search | 基礎架構資源，非應用程式 `host` |
| Messaging | Azure Service Bus | 基礎架構資源，非應用程式 `host` |

`services.<name>.host` 選擇應用程式部署目標；不是任何 Azure 資源類型的縮寫。資料庫、快取、搜尋服務和佇列通常透過基礎架構提供者供應，並透過輸出/設定連接到應用程式。

---

## 情境特定術語

### 開發術語
- **Hot Reload**：開發過程中自動更新應用程式而無需重啟
- **Build Pipeline**：建置及測試程式碼的自動化流程
- **Deployment Slot**：App Service 中的測試環境
- **Environment Parity**：保持開發、測試和正式環境的一致性

### 安全術語
- **Managed Identity**：Azure 提供自動憑證管理功能
- **Key Vault**：安全存放密鑰、金鑰及憑證
- **RBAC**：Azure 資源的基於角色存取控制
- **Network Security Group**：用於控制網路流量的虛擬防火牆

### 監控術語
- **Telemetry**：自動化收集量測數據
- **Application Performance Monitoring (APM)**：監控軟體效能
- **Log Analytics**：蒐集與分析日誌資料的服務
- **Alert Rules**：基於指標或條件的自動通知

### 部署術語
- **Blue-Green Deployment**：零停機部署策略
- **Canary Deployment**：逐步推送給部分使用者
- **Rolling Update**：順序替換應用實例
- **Rollback**：回復至之前的應用版本

---

<strong>使用提示</strong>：使用 `Ctrl+F` 可快速搜尋本詞彙表中具體術語。術語間有相互參照。

---

<strong>導覽</strong>
- <strong>上一課</strong>：[速查表](cheat-sheet.md)
- <strong>下一課</strong>：[常見問題](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->