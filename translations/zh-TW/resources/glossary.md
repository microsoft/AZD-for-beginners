# 詞彙表 - Azure 與 AZD 術語

<strong>所有章節參考</strong>
- **📚 課程首頁**： [初學者的 AZD](../README.md)
- **📖 基礎學習**： [第1章：AZD 基礎](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI 術語**： [第2章：以 AI 為先的開發](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## 簡介

此全面詞彙表提供 Azure Developer CLI 與 Azure 雲端開發中使用的術語、概念及縮寫的定義。是理解技術文件、排解問題及有效溝通 azd 專案與 Azure 服務的重要參考資料。

## 學習目標

透過使用此詞彙表，您將能：
- 理解核心 Azure Developer CLI 術語與概念
- 精通 Azure 雲端開發詞彙與技術術語
- 有效查閱基礎設施即程式碼及部署術語
- 理解 Azure 服務名稱、縮寫及其用途
- 學習排除錯誤與除錯相關術語的定義
- 掌握進階 Azure 架構與開發概念

## 學習成果

定期參考此詞彙表，您將能：
- 使用正確的 Azure Developer CLI 術語進行有效溝通
- 更清晰地理解技術文件與錯誤訊息
- 有信心地導航 Azure 服務與相關概念
- 利用適當技術詞彙排除各種問題
- 在團隊討論中使用精確的技術語言貢獻
- 系統性擴展 Azure 雲端開發知識

## A

**ARM 範本**  
Azure 資源管理員範本。基於 JSON 的基礎設施即程式碼格式，用於宣告式定義與部署 Azure 資源。

**App Service**  
Azure 的平台即服務（PaaS）產品，用於托管網頁應用程式、REST API 與行動後端，無需管理基礎架構。

**Application Insights**  
Azure 的應用效能監控（APM）服務，提供應用效能、可用性與使用情況的深入洞察。

**Azure CLI**  
用於管理 Azure 資源的命令列介面。與 AZD 補充互用，但有獨立登入；AZD 核心的驗證使用 `azd auth login`。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，利用範本與基礎設施即程式碼，加速建立與部署 Azure 應用程式的流程。

**azure.yaml**  
azd 專案的主要設定檔，定義服務、基礎架構以及部署鉤子。

**Azure 資源管理員 (ARM)**  
Azure 的部署與管理服務，提供管理層以建立、更新與刪除資源。

## B

**Bicep**  
微軟開發的專門語言（DSL），用於部署 Azure 資源。提供比 ARM 範本更簡潔的語法，並編譯為 ARM。

<strong>建置</strong>  
編譯原始碼、安裝依賴並準備應用程式部署的過程。

<strong>藍綠部署</strong>  
使用兩個相同的生產環境（藍與綠）以降低停機時間與風險的部署策略。

## C

**Container Apps**  
Azure 的無服務器容器服務，允許在無需管理複雜基礎架構的情況下運行容器化應用。

**CI/CD**  
持續整合/持續部署。自動化代碼變更整合與應用程式部署流程。

**Cosmos DB**  
Azure 全球分布的多模型資料庫服務，提供全面的吞吐量、延遲、可用性及一致性 SLA。

<strong>設定</strong>  
控制應用程式行為與部署選項的設置與參數。

## D

<strong>部署</strong>  
在目標基礎架構上安裝與配置應用程式及其依賴的過程。

**Docker**  
使用容器技術開發、運送與運行應用程式的平台。

**Dockerfile**  
含有構建 Docker 容器映像檔指令的文字檔。

## E

<strong>環境</strong>  
部署目標，代表應用程式的特定執行實例（例如：開發、測試、正式環境）。

<strong>環境變數</strong>  
以鍵值對形式儲存，應用程式在執行時可存取的設定值。

<strong>端點</strong>  
應用程式或服務可被存取的網址或網路位址。

## F

**Function App**  
Azure 的無服務器計算服務，允許執行事件驅動代碼，無需管理基礎架構。

## G

**GitHub Actions**  
與 GitHub 儲存庫整合的 CI/CD 平台，用於自動化工作流程。

**Git**  
用於追蹤原始碼變更的分散式版本控制系統。

## H

<strong>鉤子</strong>  
在部署生命週期特定階段執行的自定義腳本或指令（如 preprovision、postprovision、predeploy、postdeploy）。

<strong>主機</strong>  
應用程式將部署的 Azure 服務類型（例如：appservice、containerapp、function）。

## I

**基礎設施即程式碼 (IaC)**  
透過程式碼定義與管理基礎設施的實踐，而非手動操作。

<strong>初始化</strong>  
建立新 azd 專案的過程，通常基於範本。

## J

**JSON**  
JavaScript 物件表示法。一種常用於設定檔與 API 回應的資料交換格式。

**JWT**  
JSON Web Token。以 JSON 物件形式安全傳遞資訊的標準。

## K

**Key Vault**  
Azure 用於安全存儲與管理秘密、金鑰及憑證的服務。

**Kusto 查詢語言 (KQL)**  
用於分析 Azure Monitor、Application Insights 及其他 Azure 服務資料的查詢語言。

## L

<strong>負載平衡器</strong>  
將進來的網路流量分配到多個伺服器或實例的服務。

**Log Analytics**  
Azure 服務，用於收集、分析與處理雲端與本地環境的遙測資料。

## M

<strong>託管身份</strong>  
Azure 功能，為 Azure 服務自動提供管理身份以驗證其他 Azure 服務。

<strong>微服務</strong>  
以一組小型獨立服務構建應用程式的架構方法。

<strong>監控</strong>  
Azure 統一監控解決方案，提供涵蓋應用程式與基礎架構的全方位可觀察性。

## N

**Node.js**  
建基於 Chrome V8 引擎的 JavaScript 執行環境，用於建構伺服器端應用程式。

**npm**  
Node.js 的套件管理器，管理依賴與套件。

## O

<strong>輸出</strong>  
基礎架構部署返回的值，可供應用程式或其他資源使用。

## P

<strong>封裝</strong>  
為部署準備應用程式程式碼和依賴的過程。

<strong>參數</strong>  
傳遞給基礎架構範本以自訂部署的輸入值。

**PostgreSQL**  
Azure 支援的開源關聯式資料庫系統，作為託管服務提供。

<strong>供應</strong>  
建立與配置基於基礎架構範本定義的 Azure 資源的過程。

## Q

<strong>配額</strong>  
Azure 訂閱或區域中可建立的資源數量限制。

## R

<strong>資源群組</strong>  
一組擁有相同生命週期、權限與政策的 Azure 資源的邏輯容器。

<strong>資源標記</strong>  
由 azd 產生的唯一字串，用以確保資源名稱在部署中唯一。

**REST API**  
使用 HTTP 方法設計網路應用程式的架構風格。

<strong>回滾</strong>  
回復應用程式或基礎架構配置到先前版本的過程。

## S

<strong>服務</strong>  
在 azure.yaml 中定義的應用程式組件（例如：網頁前端、API 後端、資料庫）。

**SKU**  
庫存單位，表示 Azure 資源的不同服務等級或效能層級。

**SQL 資料庫**  
基於 Microsoft SQL Server 的 Azure 托管關聯資料庫服務。

<strong>靜態網頁應用程式</strong>  
Azure 服務，從原始碼儲存庫建置與部署全端網頁應用。

<strong>儲存帳戶</strong>  
Azure 提供的雲端資料儲存服務，支援 Blob、檔案、佇列及表格資料物件。

<strong>訂閱</strong>  
Azure 帳戶容器，包含資源群組與資源，並負責計費及存取管理。

## T

<strong>範本</strong>  
預建的專案結構，包含應用程式程式碼、基礎架構定義與常用場景設定。

**Terraform**  
開源的基礎設施即程式碼工具，支援包括 Azure 在內的多種雲端供應商。

<strong>流量管理器</strong>  
Azure 基於 DNS 的流量負載平衡器，用於在全球 Azure 區域間分配流量。

## U

**URI**  
統一資源標識符。用以識別特定資源的字串。

**URL**  
統一資源定位符。URI 的一種類型，指定資源位置及提取方式。

## V

**虛擬網路 (VNet)**  
Azure 私有網路的基本構件，提供隔離與分段功能。

**VS Code**  
Visual Studio Code。廣受歡迎的程式編輯器，具備出色的 Azure 與 azd 整合。

## W

**Webhook**  
由特定事件觸發的 HTTP 回調，常用於 CI/CD 管線。

<strong>假如操作</strong>  
Azure 功能，可在不實際執行部署的前提下，展示部署會造成的變更。

## Y

**YAML**  
YAML 不是標記語言。人類可讀的資料序列化標準，用於像 azure.yaml 這類設定檔。

## Z

<strong>區域</strong>  
Azure 區域內物理分隔的位置，提供冗餘與高可用性。

---

## 常見縮寫

| 縮寫 | 全稱 | 說明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory (現為 Microsoft Entra ID) | 身份與存取管理服務 |
| ACR | Azure Container Registry | 容器映像檔註冊服務 |
| AKS | Azure Kubernetes Service | 託管的 Kubernetes 服務 |
| API | Application Programming Interface | 用於建構軟體的協定集合 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分散式伺服器網路 |
| CI/CD | 持續整合/持續部署 | 自動化開發實踐 |
| CLI | Command Line Interface | 文字介面 |
| DNS | Domain Name System | 將網域名稱轉譯為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP 的安全版本 |
| IaC | 基礎設施即程式碼 | 透過程式碼管理基礎設施 |
| JSON | JavaScript 物件表示法 | 資料交換格式 |
| JWT | JSON Web Token | 用於安全資訊傳輸的令牌格式 |
| KQL | Kusto 查詢語言 | 用於 Azure 資料服務的查詢語言 |
| RBAC | 基於角色的存取控制 | 根據用戶角色控制存取權 |
| REST | 表述性狀態轉換 | 網路服務架構風格 |
| SDK | 軟體開發套件 | 開發工具集合 |
| SLA | 服務等級協定 | 對服務可用性/效能的承諾 |
| SQL | 結構化查詢語言 | 管理關聯資料庫的語言 |
| SSL/TLS | 安全套接字層/傳輸層安全性 | 加密協定 |
| URI | 統一資源標識符 | 識別資源的字串 |
| URL | 統一資源定位符 | 指定資源位置的 URI 類型 |
| VM | 虛擬機器 | 電腦系統的模擬 |
| VNet | 虛擬網路 | Azure 中的私有網路 |
| YAML | YAML 不是標記語言 | 資料序列化標準 |

---

## Azure 服務名稱對照

| 常用名稱 | 官方 Azure 服務名稱 | azd 主機類型 |
|-------------|------------------------------|---------------|
| 網頁應用程式 | Azure App Service | `appservice` |
| API 應用程式 | Azure App Service | `appservice` |
| 容器應用程式 | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| 靜態網站 | Azure Static Web Apps | `staticwebapp` |
| 資料庫 | Azure Database for PostgreSQL | 基礎設施資源，非應用程式 `host` |
| NoSQL 資料庫 | Azure Cosmos DB | 基礎設施資源，非應用程式 `host` |
| 儲存 | Azure Storage Account | 基礎設施資源，非內建應用程式 `host` |
| 快取 | Azure Managed Redis | 基礎設施資源，非應用程式 `host` |
| 搜尋 | Azure AI Search | 基礎設施資源，非應用程式 `host` |
| 訊息 | Azure Service Bus | 基礎設施資源，非應用程式 `host` |

`services.<name>.host` 選擇應用程式部署目標；它並非任何 Azure 資源類型的簡寫。資料庫、快取、搜尋服務及佇列通常透過基礎架構提供者設置，並透過輸出/設定與應用程式連接。

---

## 依情境區分的術語

### 開發術語
- <strong>熱重載</strong>：開發時自動更新應用程式，而無需重啟
- <strong>建置管線</strong>：自動化的程式碼建置與測試流程
- <strong>部署插槽</strong>：App Service 內的測試環境
- <strong>環境一致性</strong>：保持開發、測試與正式環境相似

### 安全術語
- <strong>託管身份</strong>：Azure 提供的自動憑證管理功能
- <strong>金鑰保管庫</strong>：保存秘密、金鑰及憑證的安全場所
- **RBAC**：Azure 資源的基於角色的存取控制
- <strong>網路安全群組</strong>：用於控制網路流量的虛擬防火牆

### 監控術語
- <strong>遙測</strong>：自動化收集各種測量與資料
- **應用效能監控 (APM)**：監控軟體效能
- **Log Analytics**：收集與分析日誌資料的服務
- <strong>警示規則</strong>：基於指標或條件的自動通知

### 部署術語
- <strong>藍綠部署</strong>：零停機時間的部署策略
- <strong>金絲雀部署</strong>：逐步推出給部分用戶
- <strong>滾動更新</strong>：依序替換應用程式實例
- <strong>回滾</strong>：恢復到先前的應用程式版本

---

<strong>使用技巧</strong>：使用 `Ctrl+F` 可快速搜尋此詞彙表中的特定術語。相關術語處會有交叉參照。

---

<strong>導覽</strong>
- <strong>上一課</strong>： [速查表](cheat-sheet.md)
- <strong>下一課</strong>： [常見問答](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->