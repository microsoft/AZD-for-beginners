# 自攜應用程式 - 為現有專案新增 azd

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 章節 1 - 基礎與快速入門
- **⬅️ 前一頁**: [你的第一個專案](first-project.md)
- **➡️ 下一頁**: [開發容器與 Codespaces](dev-containers.md)

> 已於 2026 年 7 月針對 `azd 1.27.1` 驗證。

## 介紹

在[你的第一個專案](first-project.md)中，你是從範本開始部署應用程式。但大多數時候你已經有一個應用程式——一個 Node.js API、Python Flask 服務、一個 .NET 網頁應用程式——放在你電腦的資料夾裡。本課程示範如何將 azd 新增到這些現有程式碼，以便你能用 `azd up` 部署，無須範本。

## 學習目標

完成本課後，你將：
- 了解三種啟動 azd 專案的方法
- 在現有程式碼庫中執行 `azd init`
- 了解 `azure.yaml` 與 `infra/` 資料夾對你的應用程式的作用
- 知道何時讓 azd 生成基礎設施，何時自己撰寫
- 透過 `azd up` 部署你現有的應用程式到 Azure

## 學習成果

完成本課後，你將能夠：
- 在已有的專案中初始化 azd
- 閱讀與編輯基本的 `azure.yaml` 檔案
- 使用 `azd infra generate` 產生入門基礎設施
- 選擇適合你的應用程式的 Azure 主機
- 部署並清理你自己的應用程式

---

## 啟動 azd 專案的三種方式

| 起點 | 指令 | 何時使用 |
|----------------|---------|-------------|
| <strong>從範本</strong> | `azd init --template <name>` | 學習或從已證明有效的範例開始新應用程式 |
| <strong>從現有程式碼</strong> | 在專案資料夾中執行 `azd init` | 已有應用程式並想部署它 |
| **從 Git 倉庫** | 在複製的倉庫中執行 `azd init --from-code` | 將 azd 用於現有的程式碼庫 |

你已經練習過第一種方式。本課程涵蓋第二種——最常見的真實世界情況。

---

## 第一步：在你的專案中執行 `azd init`

在<strong>你現有專案資料夾</strong>內打開終端機並執行：

```bash
cd my-existing-app
azd init
```

azd 會詢問你如何初始化。選擇：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

選擇 **「使用目前目錄的程式碼。」** azd 會掃描你的資料夾，偵測你的語言與框架，並建議合適的主機。

### azd 偵測了什麼

azd 會尋找像 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 等信號，並建議相符的 Azure 主機：

| 你的應用程式 | 可能偵測到的主機 |
|----------|----------------------|
| Node.js / Python / .NET 網頁應用程式 | Azure App Service 或 Container Apps |
| 容器化應用程式（`Dockerfile`） | Azure Container Apps |
| 函數應用程式 | Azure Functions |
| 靜態網站（React/Vue 編譯輸出） | Azure Static Web Apps |

確認偵測到的服務，azd 隨即搭建你所需的檔案。

---

## 第二步：了解 azd 建立了什麼

初始化後，你的專案會多兩樣東西：

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — 專案定義檔

這是 azd 專案的核心。最簡單版本如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 區塊是關鍵：每個條目對應你的程式碼資料夾到 Azure 主機。如果你的應用有前端與 API，會有兩個服務。

### `infra/` — 你的 Azure 資源即程式碼

`infra/` 資料夾內裝有定義 Azure 資源（App Service、資料庫等）的 Bicep 檔案。你不必手寫它們——azd 會產生一個可用的起點。你<em>可以</em>之後編輯它們，增加資源或加強安全性（詳見[章節4](../chapter-04-infrastructure/README.md)）。

> **提示：** 如果想在部署前查看或自訂產生的基礎設施，執行 `azd infra generate`（也可以用 `azd infra synth`）將基礎設施即程式碼寫入磁碟，方便審查與版本控管。

---

## 第三步：設定必要的組態

如果你的應用需要設定或機密（連接字串、API 金鑰），不要寫死在程式碼裡。使用環境變數：

```bash
# 建立一個環境
azd env new dev

# 設定一個非保密值
azd env set API_VERSION 1.0.0
```

真正的機密建議存放於 Key Vault，並從基礎設施引用——詳見[章節3：組態與認證](../chapter-03-configuration/authsecurity.md)。

---

## 第四步：部署

現在使用你已熟悉的工作流程：

```bash
# 驗證（azd 必需）
azd auth login

# 預覽將要建立的資源
azd provision --preview

# 配置基礎設施並部署您的程式碼
azd up
```

完成後，azd 會印出你應用程式的 URL。跟任何 azd 應用一樣進行驗證：

```bash
azd show           # 顯示端點
azd monitor --logs # 如有需要，檢查日誌
```

---

## 常見初次使用問題

| 症狀 | 可能原因 | 解決方式 |
|---------|--------------|-----|
| azd 沒偵測到我的應用 | 缺少描述檔（例如 `package.json`） | 新增描述檔，或在 `azd init` 時手動選擇主機 |
| `azd up` 時建置失敗 | 應用需要建置步驟 | 在 `azure.yaml` 的服務項目下加入 `buildCommand`/`outputPath` |
| 應用啟動後返回錯誤 | 缺少組態/機密 | 用 `azd env set` 設定值或設定 Key Vault |
| 選錯主機 | 自動偵測錯誤 | 編輯 `azure.yaml` 裡的 `host:`，然後重新執行 `azd up` |

更多資訊請見[章節7：故障排除](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 總結

- `azd init` → 選擇 **「使用目前目錄的程式碼」**，可為你已擁有的應用加入 azd。
- `azure.yaml` 對應程式碼資料夾至 Azure 主機；`infra/` 用 Bicep 定義資源。
- 使用 `azd infra generate` 可檢視或自訂產生的基礎設施。
- 一旦初始化，你現有的應用程式就可用跟範本一路相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 導覽

| 方向 | 課程 |
|-----------|--------|
| <strong>前一篇</strong> | [你的第一個專案](first-project.md) |
| <strong>下一篇</strong> | [開發容器與 Codespaces](dev-containers.md) |

## 📖 相關資源

- [AZD 基本概念](azd-basics.md)
- [章節4：基礎設施即程式碼](../chapter-04-infrastructure/README.md)
- [組態與認證](../chapter-03-configuration/authsecurity.md)
- [指令速查表](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->