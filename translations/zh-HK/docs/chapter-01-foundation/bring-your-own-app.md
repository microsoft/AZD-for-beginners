# 自攜應用程式 - 在現有專案加入 azd

**Chapter Navigation:**
- **📚 Course Home**: [AZD 初學者指南](../../README.md)
- **📖 Current Chapter**: 第 1 章 - 基礎與快速開始
- **⬅️ Previous**: [你的第一個專案](first-project.md)
- **➡️ Next**: [開發容器與 Codespaces](dev-containers.md)

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 介紹

在 [你的第一個專案](first-project.md) 你是從範本部署應用程式。但大多數情況下你已經有一個應用程式——例如放在機器資料夾內的 Node.js API、Python 的 Flask 服務或 .NET 網站應用程式。本課程示範如何把 azd 加到現有程式碼，讓你可以使用 `azd up` 部署，不需要範本。

## 學習目標

完成本課程後，你將會：
- 了解啟動 azd 專案的三種方式
- 在既有程式碼庫中執行 `azd init`
- 了解 `azure.yaml` 與 `infra/` 資料夾對你的應用程式有什麼作用
- 知道何時讓 azd 產生基礎架構以及何時自行撰寫
- 使用 `azd up` 部署你現有的應用程式到 Azure

## 學習成果

完成本課程後，你將能夠：
- 在已存在的專案中初始化 azd
- 讀取並編輯基本的 `azure.yaml` 檔案
- 使用 `azd infra generate` 產生起始基礎架構
- 為你的應用程式選擇合適的 Azure 主機
- 部署並清理你自己的應用程式

---

## 啟動 azd 專案的三種方式

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

你已經練習過第一種選項。本課程涵蓋第二種——最常見的實務情境。

---

## 步驟 1：在你的專案中執行 `azd init`

在你現有的專案資料夾內開啟終端機，然後執行：

```bash
cd my-existing-app
azd init
```

azd 會詢問你要如何初始化。選擇：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

選擇 **"使用目前目錄中的程式碼。"**，azd 會掃描你的資料夾、偵測你的語言和框架，並建議一個主機。

### azd 會偵測到什麼

azd 會尋找像是 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 等訊號，並建議相對應的 Azure 主機：

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

確認被偵測到的服務，azd 會幫你支援所需的檔案。

---

## 步驟 2：了解 azd 所建立的內容

init 完成後，你的專案會有兩樣新東西：

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — 專案定義

這是 azd 專案的核心。一個極簡的範例如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 區塊是關鍵：每個條目會把你的程式碼資料夾對應到一個 Azure 主機。如果你的應用程式同時有前端和 API，你會看到兩個服務。

### `infra/` — 以程式碼表示的 Azure 資源

`infra/` 資料夾包含定義應用程式所需 Azure 資源（例如 App Service、資料庫等）的 Bicep 檔案。你不必手動撰寫這些檔案——azd 會產生一個可運作的起始點。之後你可以編輯它們以新增資源或強化安全性（涵蓋於 [第 4 章](../chapter-04-infrastructure/README.md)）。

> **Tip:** 想在部署前查看或自訂產生的基礎架構嗎？執行 `azd infra generate`（也可用 `azd infra synth`）將 IaC 寫到磁碟，方便審查與版本控制。

---

## 步驟 3：設定必要的組態

如果你的應用程式需要設定或秘密（例如連線字串、API 金鑰），不要把它們硬編碼。請使用環境值：

```bash
# 建立環境
azd env new dev

# 設定非機密值
azd env set API_VERSION 1.0.0
```

對於真正的機密，請將它們儲存在 Key Vault，並從你的基礎架構中參照它們—請參閱 [第 3 章：組態與驗證](../chapter-03-configuration/authsecurity.md)。

---

## 步驟 4：部署

現在使用你已經熟悉的相同步驟：

```bash
# 驗證 (azd 所需)
azd auth login

# 預覽將會建立的資源
azd provision --preview

# 佈建基礎架構並部署你的程式碼
azd up
```

完成後，azd 會列印出你的應用程式 URL。像驗證任何 azd 應用程式一樣檢查它：

```bash
azd show           # 顯示端點
azd monitor --logs # 如有需要，檢查日誌
```

---

## 常見的首次問題

| 症狀 | 可能原因 | 修正 |
|---------|--------------|-----|
| azd 未偵測到我的應用程式 | 缺少描述檔（例如 `package.json`） | 新增描述檔，或在 `azd init` 期間手動選擇主機 |
| 在 `azd up` 期間建置失敗 | 應用程式需要建置步驟 | 在 `azure.yaml` 的服務下新增 `buildCommand`/`outputPath` |
| 應用程式啟動但回傳錯誤 | 缺少組態/機密 | 使用 `azd env set` 設定值或串接 Key Vault |
| 選到錯誤的主機 | 自動偵測猜錯 | 編輯 `azure.yaml` 裡的 `host:` 並重新執行 `azd up` |

如需更多資訊，請參閱 [第 7 章：疑難排解](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 總結

- `azd init` → **"使用目前目錄中的程式碼。"** 可把 azd 加到你已擁有的應用程式。
- `azure.yaml` 將你的程式碼資料夾對應到 Azure 主機；`infra/` 以 Bicep 定義資源。
- `azd infra generate` 可讓你在部署前檢查或自訂產生的基礎架構。
- 一旦初始化完成，你現有的應用程式可以使用與範本式應用程式完全相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [你的第一個專案](first-project.md) |
| **Next** | [開發容器與 Codespaces](dev-containers.md) |

## 📖 相關資源

- [AZD 基礎](azd-basics.md)
- [第 4 章：基礎架構即程式碼](../chapter-04-infrastructure/README.md)
- [組態與驗證](../chapter-03-configuration/authsecurity.md)
- [指令速查表](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->