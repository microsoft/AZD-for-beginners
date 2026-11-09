# 詞彙表 - Azure 與 AZD 術語

<strong>所有章節參考</strong>
- **📚 課程首頁**: [初學者的 AZD](../README.md)
- **📖 學習基礎**: [第一章：AZD 基礎](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI 術語**: [第二章：AI 優先開發](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

本綜合詞彙表提供 Azure Developer CLI 及 Azure 雲端開發中使用的術語、概念及縮寫定義。是理解技術文件、排解問題及有效溝通 azd 專案與 Azure 服務的必備參考資料。

## 學習目標

使用此詞彙表，您將能：
- 理解重要的 Azure Developer CLI 術語與概念
- 精通 Azure 雲端開發詞彙與技術術語
- 有效率參考基礎設施即代碼與部署術語
- 理解 Azure 服務名稱、縮寫及其功能
- 取得排錯與除錯術語定義
- 學習進階 Azure 架構與開發概念

## 學習成果

持續查閱此詞彙表後，您將能：
- 使用正確 Azure Developer CLI 術語有效溝通
- 更清晰理解技術文件和錯誤訊息
- 自信導覽 Azure 服務與相關概念
- 使用恰當技術術語排解問題
- 精確使用技術用語參與團隊討論
- 系統性擴展您的 Azure 雲端開發知識

## A

**ARM 範本**  
Azure Resource Manager 範本。以 JSON 為基礎的基礎設施即代碼格式，用於宣告性地定義和部署 Azure 資源。

<strong>應用服務</strong>  
Azure 的平台即服務 (PaaS)，用於主機托管網頁應用程式、REST API 及行動後端，無需管理基礎架構。

**Application Insights**  
Azure 的應用程式效能監控 (APM) 服務，提供對應用程式效能、可用性與使用情況的深入了解。

**Azure CLI**  
管理 Azure 資源的命令列介面。它是 AZD 的輔助工具，但登入獨立；AZD 核心驗證使用 `azd auth login`。

**Azure Developer CLI (azd)**  
以開發者為中心的命令列工具，通過範本和基礎設施即代碼加速建立和部署應用程式到 Azure。

**azure.yaml**  
azd 專案的主要設定文件，定義服務、基礎架構及部署掛鉤。

**Azure Resource Manager (ARM)**  
Azure 的部署與管理服務，提供建立、更新及刪除資源的管理層。

## B

**Bicep**  
微軟開發的領域專用語言 (DSL)，用於部署 Azure 資源。語法比 ARM 範本簡潔，編譯成 ARM。

<strong>建置</strong>  
編譯原始碼、安裝相依性及準備應用程式以供部署的過程。

<strong>藍綠部署</strong>  
利用兩個相同的生產環境（藍與綠）以減少停機時間和風險的部署策略。

## C

<strong>容器應用</strong>  
Azure 的無伺服器容器服務，允許在無需管理複雜基礎架構的情況下執行容器化應用程式。

**CI/CD**  
持續整合/持續部署。自動化整合代碼變更及部署應用程式的實踐。

**Cosmos DB**  
Azure 的全球分佈多模型資料庫服務，提供吞吐量、延遲、可用性及一致性的完整 SLA。

<strong>設定</strong>  
控制應用程式行為與部署選項的設定和值。

## D

<strong>部署</strong>  
在目標基礎架構上安裝及配置應用程式及其相依性的過程。

**Docker**  
使用容器化技術開發、傳送及執行應用程式的平台。

**Dockerfile**  
建立 Docker 容器映像檔的指令文本文件。

## E

<strong>環境</strong>  
代表應用程式具體實例的部署目標 (如開發、預備、正式)。

<strong>環境變數</strong>  
以鍵值對形式存儲的配置值，應用程式在執行時可存取。

<strong>端點</strong>  
可訪問應用程式或服務之 URL 或網絡地址。

## F

<strong>函式應用程式</strong>  
Azure 的無伺服器運算服務，允許執行事件驅動程式碼，無需管理基礎架構。

## G

**GitHub Actions**  
整合 GitHub 儲存庫的 CI/CD 平台，用於自動化工作流程。

**Git**  
用於追蹤原始碼更改的分散式版本控制系統。

## H

<strong>掛鉤</strong>  
在部署生命週期特定階段（預配置、後配置、預部署、後部署）執行的自定義腳本或命令。

<strong>主機</strong>  
應用程式將要部署的 Azure 服務類型 (例如 appservice、containerapp、function)。

## I

**基礎設施即代碼 (IaC)**  
透過程式碼定義與管理基礎設施的實踐，取代手動操作。

<strong>初始化</strong>  
初始化新 azd 專案的過程，通常從範本開始。

## J

**JSON**  
JavaScript 物件表示法。一種常用於配置文件及 API 回應的資料交換格式。

**JWT**  
JSON Web Token。用於安全傳輸資訊的 JSON 物件標準。

## K

**Key Vault**  
Azure 用於安全存儲與管理機密、金鑰及憑證的服務。

**Kusto 查詢語言 (KQL)**  
用於分析 Azure Monitor、Application Insights 及其他 Azure 服務資料的查詢語言。

## L

<strong>負載平衡器</strong>  
將進入網絡流量分配至多部伺服器或實例的服務。

<strong>日誌分析</strong>  
Azure 服務，用於收集、分析及處理雲端及本地環境的遙測資料。

## M

<strong>託管身份</strong>  
Azure 功能，提供自動管理身份以驗證至其他 Azure 服務。

<strong>微服務</strong>  
將應用程式建構為一組小型獨立服務的架構方法。

<strong>監控</strong>  
Azure 的統一監控解決方案，提供跨應用程式和基礎設施的全方位可觀察性。

## N

**Node.js**  
基於 Chrome V8 JavaScript 引擎的 JavaScript 執行環境，用於建構伺服器端應用程式。

**npm**  
Node.js 的套件管理器，管理相依性和套件。

## O

<strong>輸出</strong>  
從基礎設施部署中回傳的值，可供應用程式或其他資源使用。

## P

<strong>打包</strong>  
準備應用程式代碼與相依性以進行部署的過程。

<strong>參數</strong>  
傳遞給基礎設施範本的輸入值，用以自訂部署。

**PostgreSQL**  
開源關聯式資料庫系統，在 Azure 中作為託管服務支援。

<strong>配置</strong>  
建立與配置基礎設施範本中定義的 Azure 資源的過程。

## Q

<strong>配額</strong>  
Azure 訂閱或區域可建立資源數量的限制。

## R

<strong>資源群組</strong>  
邏輯容器，管理共用相同生命週期、權限與政策的 Azure 資源。

<strong>資源代幣</strong>  
由 azd 生成的唯一字串，確保跨部署資源名稱的唯一性。

**REST API**  
用 HTTP 方法設計網絡應用程式的架構風格。

<strong>回滾</strong>  
退回到應用程式或基礎設施配置的先前版本的過程。

## S

<strong>服務</strong>  
azure.yaml 中定義的應用程式組件（如網頁前端、API 後端、資料庫）。

**SKU**  
存貨單位，代表 Azure 資源的不同服務層級或效能等級。

**SQL 資料庫**  
基於 Microsoft SQL Server 的 Azure 託管關聯式資料庫服務。

<strong>靜態網頁應用</strong>  
Azure 服務，從原始碼儲存庫構建及部署完整堆疊網頁應用程式。

<strong>儲存帳戶</strong>  
Azure 服務，提供 blob、檔案、佇列和表格等資料物件的雲端儲存。

<strong>訂閱</strong>  
Azure 帳戶容器，包含資源群組和資源，並具帳單與存取管理。

## T

<strong>範本</strong>  
預先建構的專案結構，包含應用程式代碼、基礎架構定義及常見情境配置。

**Terraform**  
支援多雲供應商（含 Azure）的開源基礎設施即代碼工具。

**Traffic Manager**  
Azure 基於 DNS 的流量負載平衡器，用於全球 Azure 區域間分散流量。

## U

**URI**  
統一資源識別符。識別特定資源的字串。

**URL**  
統一資源定位符。指定資源位置及取得方式的 URI 類型。

## V

**虛擬網路 (VNet)**  
Azure 內私有網絡的基本建置區塊，提供隔離與分割功能。

**VS Code**  
Visual Studio Code。具優秀 Azure 和 azd 整合的熱門代碼編輯器。

## W

**Webhook**  
由特定事件觸發的 HTTP 回呼，常用於 CI/CD 流程。

<strong>假設執行</strong>  
Azure 功能，可顯示部署將會做出的變更而不實際執行。

## Y

**YAML**  
YAML 不是標記語言。用於配置文件（如 azure.yaml）的可讀性高的資料序列化標準。

## Z

<strong>區域</strong>  
Azure 區域內物理上分離的位置，提供冗餘和高可用性。

---

## 常用縮寫

| 縮寫 | 全稱 | 說明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory（現為 Microsoft Entra ID） | 身份與存取管理服務 |
| ACR | Azure Container Registry | 容器映像檔註冊服務 |
| AKS | Azure Kubernetes Service | 託管 Kubernetes 服務 |
| API | Application Programming Interface | 構建軟體的一組協定 |
| ARM | Azure Resource Manager | Azure 的部署與管理服務 |
| CDN | Content Delivery Network | 分布式伺服器網絡 |
| CI/CD | 持續整合/持續部署 | 自動化開發實踐 |
| CLI | 命令列介面 | 文字式使用者介面 |
| DNS | Domain Name System | 將域名轉換為 IP 位址的系統 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP 的安全版本 |
| IaC | 基礎設施即代碼 | 透過代碼管理基礎設施 |
| JSON | JavaScript Object Notation | 資料交換格式 |
| JWT | JSON Web Token | 用於安全資訊傳遞的代幣格式 |
| KQL | Kusto 查詢語言 | 用於 Azure 資料服務的查詢語言 |
| RBAC | 基於角色的存取控制 | 根據使用者角色的存取方法 |
| REST | 表述性狀態轉換 | 網路服務的架構風格 |
| SDK | 軟體開發工具包 | 開發工具集合 |
| SLA | 服務等級協議 | 對服務可用性/效能的承諾 |
| SQL | 結構化查詢語言 | 管理關聯式資料庫的語言 |
| SSL/TLS | 安全套接字層/傳輸層安全性 | 密碼學協定 |
| URI | 統一資源識別符 | 識別資源的字串 |
| URL | 統一資源定位符 | 指定資源位置的 URI 類型 |
| VM | 虛擬機器 | 電腦系統的模擬 |
| VNet | 虛擬網路 | Azure 內的私有網路 |
| YAML | YAML 不是標記語言 | 資料序列化標準 |

---

## Azure 服務名稱對應

| 常用名稱 | 官方 Azure 服務名稱 | azd 主機類型 |
|-------------|------------------------------|---------------|
| 網頁應用程式 | Azure App Service | `appservice` |
| API 應用程式 | Azure App Service | `appservice` |
| 容器應用程式 | Azure Container Apps | `containerapp` |
| 函式 | Azure Functions | `function` |
| 靜態網站 | Azure Static Web Apps | `staticwebapp` |
| 資料庫 | Azure Database for PostgreSQL | 基礎設施資源，非應用程式 `host` |
| NoSQL 資料庫 | Azure Cosmos DB | 基礎設施資源，非應用程式 `host` |
| 儲存 | Azure Storage Account | 基礎設施資源，非內建應用程式 `host` |
| 快取 | Azure Managed Redis | 基礎設施資源，非應用程式 `host` |
| 搜索 | Azure AI Search | 基礎設施資源，非應用程式 `host` |
| 訊息傳遞 | Azure Service Bus | 基礎設施資源，非應用程式 `host` |

`services.<name>.host` 選擇應用程式部署目標；它並非任一 Azure 資源類型的簡寫。資料庫、快取、搜索服務及佇列通常由基礎架構提供者建置，並透過輸出／配置連接至應用程式。

---

## 特定情境術語

### 開發術語
- <strong>熱重載</strong>：開發時自動更新應用程式，無需重啟
- <strong>建置管線</strong>：自動化建置與測試代碼的流程
- <strong>部署槽</strong>：App Service 中的預備環境
- <strong>環境一致性</strong>：保持開發、預備與正式環境相似

### 安全術語
- <strong>託管身份</strong>：Azure 提供的自動憑證管理功能
- <strong>金鑰保管庫</strong>：用於安全存儲機密、金鑰及憑證
- **RBAC**：基於角色的 Azure 資源存取控制
- <strong>網絡安全群組</strong>：控制網絡流量的虛擬防火牆

### 監控術語
- <strong>遙測</strong>：自動收集測量值與資料
- **應用效能監控 (APM)**：監控軟體效能
- <strong>日誌分析</strong>：收集及分析日誌資料的服務
- <strong>警示規則</strong>：根據指標或條件的自動通知

### 部署術語
- <strong>藍綠部署</strong>：零停機時間部署策略
- <strong>金絲雀發布</strong>：逐步向部分使用者釋出
- <strong>滾動更新</strong>：應用實例的順序替換
- <strong>回滾</strong>：復原至先前的應用程式版本

---

<strong>使用提示</strong>：使用 `Ctrl+F` 可快速搜尋本詞彙表中特定術語。術語間如有關聯會予以交叉參考。

---

<strong>導覽</strong>
- <strong>上一課</strong>：[速查表](cheat-sheet.md)
- <strong>下一課</strong>：[常見問題](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->