# 自帶應用程式 — 將 azd 新增到現有專案

**章節導覽：**
- **📚 課程首頁**： [AZD 初學者指南](../../README.md)
- **📖 本章節**： 第一章 - 基礎與快速上手
- **⬅️ 上一章**： [您的第一個專案](first-project.md)
- **➡️ 下一章**： [開發容器與 Codespaces](dev-containers.md)

> 於 2026 年 7 月以 `azd 1.27.1` 驗證。

## 簡介

在 [您的第一個專案](first-project.md) 中，您是從範本開始部署應用程式。但多數情況下您已經 <em>有</em> 一個應用程式——Node.js API、Python Flask 服務、.NET 網頁應用程式——就在您電腦的資料夾中。本課程將示範如何將 azd 新增到該現有程式碼，以便您可以直接使用 `azd up` 部署，不需要範本。

## 學習目標

完成本課後，您將能夠：
- 理解啟動 azd 專案的三種方式
- 在現有程式碼庫中運行 `azd init`
- 了解 `azure.yaml` 與 `infra/` 資料夾在應用程式中的作用
- 了解何時讓 azd 產生基礎架構，何時自行編寫
- 使用 `azd up` 部署您現有的應用程式到 Azure

## 學習成果

完成本課後，您能夠：
- 在已有的專案中初始化 azd
- 閱讀並編輯基本的 `azure.yaml` 檔案
- 使用 `azd infra generate` 產生起始基礎架構
- 選擇適合的 Azure 主機來承載您的應用程式
- 部署並清理您自己的應用程式

---

## 啟動 azd 專案的三種方式

| 起點 | 指令 | 適用時機 |
|----------------|---------|-------------|
| <strong>從範本開始</strong> | `azd init --template <name>` | 學習，或從已驗證範例開新專案時 |
| <strong>從現有程式碼開始</strong> | 在專案資料夾內執行 `azd init` | 您已有應用程式，想直接部署 |
| **從 Git 倉庫開始** | 在克隆的倉庫中執行 `azd init --from-code` | 對現有版本庫採用 azd |

您已經練習過第一種方法。本課涵蓋第二種——最常見的實務情境。

---

## 第一步：在您的專案中執行 `azd init`

打開終端機，<strong>在現有專案資料夾內</strong>，執行：

```bash
cd my-existing-app
azd init
```

azd 會詢問您想如何初始化。請選擇：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

選擇 **"使用目前目錄中的程式碼。"** azd 隨即掃描資料夾，偵測語言與框架，並推薦主機。

### azd 偵測內容

azd 會尋找類似 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 的訊號，並建議對應的 Azure 主機：

| 您的應用程式 | 可能偵測到的主機 |
|----------|----------------------|
| Node.js / Python / .NET 網頁應用程式 | Azure App Service 或容器應用程式 |
| 容器化應用程式（`Dockerfile`） | Azure 容器應用程式 |
| Function 應用程式 | Azure Functions |
| 靜態網站（React/Vue 編譯輸出） | Azure 靜態網站應用程式 |

確認偵測到的服務，azd 會生成您需要的檔案骨架。

---

## 第二步：瞭解 azd 建立了什麼

初始化後，您的專案中會多出兩樣東西：

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

這是 azd 專案的核心。一個簡化版本如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 區段是關鍵：每個條目將您程式的資料夾對應到一個 Azure 主機。如果您的應用程式有前端和 API，您會有兩個服務。

### `infra/` — 以程式碼方式定義您的 Azure 資源

`infra/` 資料夾內含 Bicep 檔案，用以定義應用所需的 Azure 資源（App Service、資料庫等）。您不必手動撰寫這些檔案——azd 會產生可用的起始點。您 <em>可以</em> 稍後編輯它們以新增資源或強化安全性（內容詳見[第四章](../chapter-04-infrastructure/README.md)）。

> **提示：** 想在部署前查看或自訂產生的基礎架構？執行 `azd infra generate`（也可用 `azd infra synth`），把 IaC 輸出到磁碟，方便您審閱與版本控制。

---

## 第三步：設定必要的組態

如果應用程式需要設定值或祕密（連接字串、API 金鑰），請不要硬編碼。使用環境變數：

```bash
# 建立一個環境
azd env new dev

# 設定一個非秘密值
azd env set API_VERSION 1.0.0
```

真正的祕密訊息，請存在 Key Vault 並透過您的基礎架構引用——參見[第三章：組態與認證](../chapter-03-configuration/authsecurity.md)。

---

## 第四步：部署

現在使用您已熟悉的工作流程：

```bash
# 驗證（azd 需要）
azd auth login

# 預覽將要建立的資源
azd provision --preview

# 佈建基礎設施並部署您的程式碼
azd up
```

完成後，azd 會顯示您的應用程式 URL。驗證方法與其他 azd 應用相同：

```bash
azd show           # 顯示端點
azd monitor --logs # 如有需要請檢查日誌
```

---

## 常見初次使用問題

| 症狀 | 可能原因 | 解決方法 |
|---------|--------------|-----|
| azd 未偵測到我的應用程式 | 缺少描述文件（例如 `package.json`） | 新增描述文件，或在 `azd init` 時手動選主機 |
| `azd up` 執行構建時失敗 | 應用程式需要構建步驟 | 在 `azure.yaml` 中服務區塊新增 `buildCommand` / `outputPath` |
| 應用啟動後回傳錯誤 | 缺失組態或祕密資料 | 用 `azd env set` 設定，或連結 Key Vault |
| 選錯主機 | 自動偵測錯誤判斷 | 編輯 `azure.yaml` 中的 `host:`，再重跑 `azd up` |

更多詳見 [第七章：疑難排解](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 總結

- `azd init` → **"使用目前目錄中的程式碼"**，將 azd 加到您已有的應用程式。
- `azure.yaml` 將您的程式資料夾映射到 Azure 主機；`infra/` 以 Bicep 定義資源。
- `azd infra generate` 讓您查看或自訂產生的基礎架構。
- 一旦初始化，您現有的應用程式就跟範本產生的應用程式一樣，使用相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 導覽

| 方向 | 課程 |
|-----------|--------|
| <strong>上一章</strong> | [您的第一個專案](first-project.md) |
| <strong>下一章</strong> | [開發容器與 Codespaces](dev-containers.md) |

## 📖 相關資源

- [AZD 基礎](azd-basics.md)
- [第四章：基礎架構即程式碼](../chapter-04-infrastructure/README.md)
- [組態與認證](../chapter-03-configuration/authsecurity.md)
- [命令參考表](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->