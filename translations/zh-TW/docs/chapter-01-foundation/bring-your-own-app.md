# 自帶應用程式 - 將 azd 新增到現有專案

**章節導覽：**
- **📚 課程首頁**: [AZD 新手入門](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一節**: [你的第一個專案](first-project.md)
- **➡️ 下一節**: [開發容器與 Codespaces](dev-containers.md)

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 介紹

在 [你的第一個專案](first-project.md) 中你是從範本開始部署應用程式。但大多數情況下你已經擁有一個應用程式（例如 Node.js API、Python Flask 服務、或 .NET 網頁應用）放在機器上的某個資料夾。本課程示範如何將 azd 新增到該現有程式碼，以便你可以使用 `azd up` 部署，無需範本。

## 學習目標

完成本課後，你將能夠：
- 了解開始 azd 專案的三種方式
- 在現有程式碼庫中執行 `azd init`
- 了解 `azure.yaml` 與 `infra/` 資料夾對應用程式的用途
- 判斷何時讓 azd 產生基礎架構、何時自行撰寫
- 使用 `azd up` 將現有應用程式部署到 Azure

## 學習成果

完成本課後，你將能夠：
- 在已存在的專案中初始化 azd
- 閱讀並編輯基本的 `azure.yaml` 檔案
- 使用 `azd infra generate` 產生啟始基礎架構
- 為你的應用程式選擇適合的 Azure 主機
- 部署並清除你自己的應用程式

---

## 開始 azd 專案的三種方式

| 起點 | 指令 | 何時使用 |
|----------------|---------|-------------|
| <strong>從範本</strong> | `azd init --template <name>` | 學習或從已驗證的範例開始新應用程式 |
| <strong>從你現有的程式碼</strong> | `azd init` (在你的專案資料夾中) | 你已經有應用程式並想要部署它 |
| **從 Git 倉庫** | `azd init --from-code` (在已 clone 的 repo 中) | 為現有的程式庫採用 azd |

你已經練習過第一種選項。本課涵蓋第二種——最常見的真實世界情況。

---

## 步驟 1：在你的專案中執行 `azd init`

在現有專案資料夾內開啟終端機，然後執行：

```bash
cd my-existing-app
azd init
```

azd 會詢問你想如何初始化。選擇：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

選擇 **「在目前目錄中使用程式碼。」** azd 隨後會掃描你的資料夾，偵測你的語言與框架，並建議一個主機。

### azd 會偵測哪些項目

azd 會尋找像 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 這類訊號，並建議相符的 Azure 主機：

| 你的應用程式 | 可能偵測到的主機 |
|----------|----------------------|
| Node.js / Python / .NET 網頁應用 | Azure App Service 或 Container Apps |
| 容器化應用（`Dockerfile`） | Azure Container Apps |
| Function 應用 | Azure Functions |
| 靜態網站（React/Vue 建置輸出） | Azure Static Web Apps |

確認偵測到的服務，azd 會為你產生所需的檔案。

---

## 步驟 2：了解 azd 所建立的內容

初始化後，你的專案會新增兩個項目：

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

這是 azd 專案的核心。最小範例如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 區塊是關鍵部分：每個項目將你程式碼的資料夾對應到一個 Azure 主機。如果你的應用程式同時有前端與 API，則會有兩個服務。

### `infra/` — 你的 Azure 資源以程式碼方式表示

`infra/` 資料夾包含用來定義你的應用程式所需 Azure 資源（例如 App Service、資料庫等）的 Bicep 檔案。你不需要手動撰寫這些檔案——azd 會產生一個可運作的起始點。你可以之後編輯它們以新增資源或強化安全性（在 [第 4 章](../chapter-04-infrastructure/README.md) 中有說明）。

> **提示：** 想在部署前查看或自訂產生的基礎架構嗎？執行 `azd infra generate`（也可使用 `azd infra synth`）將 IaC 寫入磁碟，以便檢閱與納入版本控制。

---

## 步驟 3：設定必要的組態

如果你的應用程式需要設定或祕密（例如連線字串、API 金鑰），不要將它們寫死在程式碼中。使用環境變數：

```bash
# 建立一個環境
azd env new dev

# 設定一個非機密的值
azd env set API_VERSION 1.0.0
```

對於真正的祕密，請將它們儲存在 Key Vault 中，並從你的基礎架構參考它們——參見 [第 3 章：組態與驗證](../chapter-03-configuration/authsecurity.md)。

---

## 步驟 4：部署

現在使用你已熟悉的相同工作流程：

```bash
# 驗證 (azd 所需)
azd auth login

# 預覽將會建立的資源
azd provision --preview

# 佈建基礎架構並部署您的程式碼
azd up
```

完成後，azd 會印出你的應用程式 URL。以和任何 azd 應用相同的方式驗證：

```bash
azd show           # 顯示端點
azd monitor --logs # 如有需要，檢查日誌
```

---

## 常見初次使用問題

| 症狀 | 可能原因 | 解法 |
|---------|--------------|-----|
| azd 未偵測到我的應用程式 | 缺少描述檔（例如 `package.json`） | 新增描述檔，或在 `azd init` 時手動選擇主機 |
| 在 `azd up` 期間建置失敗 | 應用程式需要建置步驟 | 在 `azure.yaml` 的服務下新增 `buildCommand`/`outputPath` |
| 應用啟動但回傳錯誤 | 缺少組態/祕密 | 使用 `azd env set` 設定值或接上 Key Vault |
| 選到錯誤的主機 | 自動偵測判斷錯誤 | 編輯 `azure.yaml` 中的 `host:` 並重新執行 `azd up` |

欲了解更多，請參閱 [第 7 章：排除問題](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 摘要

- `azd init` → **「在目前目錄中使用程式碼。」** 可將 azd 新增到你已擁有的應用程式。
- `azure.yaml` 將你的程式碼資料夾對應到 Azure 主機；`infra/` 以 Bicep 定義資源。
- `azd infra generate` 讓你檢閱或自訂產生的基礎架構。
- 一旦初始化後，你現有的應用程式可使用與範本應用相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 導覽

| 方向 | 課程 |
|-----------|--------|
| <strong>上一節</strong> | [你的第一個專案](first-project.md) |
| <strong>下一節</strong> | [開發容器與 Codespaces](dev-containers.md) |

## 📖 相關資源

- [AZD 基礎](azd-basics.md)
- [第 4 章：基礎架構即程式碼](../chapter-04-infrastructure/README.md)
- [組態與驗證](../chapter-03-configuration/authsecurity.md)
- [指令備忘單](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->