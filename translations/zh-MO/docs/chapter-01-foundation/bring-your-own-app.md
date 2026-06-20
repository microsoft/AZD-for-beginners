# Bring Your Own App - 將 azd 加入現有專案

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**：第 1 章 - 基礎與快速開始
- **⬅️ 上一章**： [你的第一個專案](first-project.md)
- **➡️ 下一章**： [開發容器與 Codespaces](dev-containers.md)

> 已在 2026 年 6 月以 `azd 1.25.6` 驗證。

## 介紹

在 [你的第一個專案](first-project.md) 中你是從範本開始部署應用程式。但大多數情況下你已經有一個應用程式——例如 Node.js API、Python Flask 服務、或 .NET 網頁應用——放在機器上的某個資料夾。本課程示範如何將 azd 新增到既有程式碼，以便使用 `azd up` 來部署，無需範本。

## 學習目標

完成本課程後，你將會：
- 了解開始 azd 專案的三種方式
- 在既有程式碼庫內執行 `azd init`
- 了解 `azure.yaml` 與 `infra/` 資料夾對你的應用程式有什麼作用
- 知道何時讓 azd 產生基礎設施、何時自行撰寫
- 使用 `azd up` 將既有應用程式部署到 Azure

## 學習成果

完成本課程後，你將能：
- 在已有專案中初始化 azd
- 閱讀與編輯基本的 `azure.yaml` 檔案
- 使用 `azd infra generate` 產生啟動用的基礎設施
- 為你的應用程式選擇適當的 Azure 主機
- 部署並清理你自己的應用程式

---

## 開始 azd 專案的三種方式

| 起始方式 | 指令 | 何時使用 |
|----------------|---------|-------------|
| <strong>從範本開始</strong> | `azd init --template <name>` | 用於學習或從已驗證的範例開始新應用程式 |
| <strong>從現有程式碼</strong> | `azd init` (在你的專案資料夾中) | 你已經有應用程式並想部署它 |
| **從 Git 倉庫** | `azd init --from-code` (在已複製的倉庫中) | 在現有倉庫中採用 azd |

你已經練習過第一個選項。本課程涵蓋第二種——最常見的實務情境。

---

## 第 1 步：在你的專案中執行 `azd init`

在你的現有專案資料夾內開啟終端機，並執行：

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

選擇 **"使用目前目錄中的程式碼。"**，azd 隨後會掃描你的資料夾，偵測你的語言與框架，並建議一個主機。

### azd 偵測的項目

azd 會尋找像 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 等訊號，並建議相對應的 Azure 主機：

| 你的應用 | 可能偵測到的主機 |
|----------|----------------------|
| Node.js / Python / .NET web 應用 | Azure App Service 或 Container Apps |
| 容器化應用（`Dockerfile`） | Azure Container Apps |
| Function 應用 | Azure Functions |
| 靜態網站（React/Vue 的建置輸出） | Azure Static Web Apps |

確認被偵測到的服務，azd 就會為你產生所需的檔案骨架。

---

## 第 2 步：了解 azd 所建立的內容

初始化後，你的專案會多出兩個新項目：

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

這是 azd 專案的核心。一個最小的範例如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 區塊是關鍵部分：每個條目都會將你的程式碼某個資料夾映射到一個 Azure 主機。如果你的應用同時有前端與 API，就會有兩個服務。

### `infra/` — 你的 Azure 資源以程式化基礎設施 (IaC)

`infra/` 資料夾包含定義應用所需 Azure 資源（例如 App Service、資料庫等）的 Bicep 檔案。你不需要手動撰寫這些檔案——azd 會產生一個可運作的起點。你之後可以編輯它們以新增資源或強化安全性（在 [第 4 章](../chapter-04-infrastructure/README.md) 中有介紹）。

> **提示：** 想在部署前查看或自訂產生的基礎設施嗎？執行 `azd infra generate`（也可使用 `azd infra synth`）將 IaC 寫到磁碟，方便你檢閱並放入版本控制。

---

## 第 3 步：設定必要的組態

如果你的應用需要設定或祕密（連線字串、API 金鑰），請不要把它們寫死在程式碼裡。使用環境變數或環境值：

```bash
# 建立環境
azd env new dev

# 設定非機密值
azd env set API_VERSION 1.0.0
```

若是實際的祕密，請將它們儲存在 Key Vault 中，並在你的基礎設施中參照——參見 [第 3 章：組態與驗證](../chapter-03-configuration/authsecurity.md)。

---

## 第 4 步：部署

現在使用你已熟悉的相同工作流程：

```bash
# 驗證（azd 必需）
azd auth login

# 預覽將建立的資源
azd provision --preview

# 佈建基礎架構並部署您的程式碼
azd up
```

完成後，azd 會列印出你的應用程式 URL。以與其他 azd 應用相同的方式驗證它：

```bash
azd show           # 顯示端點
azd monitor --logs # 如有需要，檢查日誌
```

---

## 常見初次問題

| 症狀 | 可能原因 | 解決方法 |
|---------|--------------|-----|
| azd 未偵測到我的應用程式 | 缺少清單檔案（例如 `package.json`） | 新增清單檔案，或在執行 `azd init` 時手動選擇主機 |
| 在執行 `azd up` 期間建置失敗 | 應用程式需要建置步驟 | 在 `azure.yaml` 的服務區塊下新增 `buildCommand`/`outputPath` |
| 應用程式啟動但回傳錯誤 | 缺少組態/祕密 | 使用 `azd env set` 設定值或將 Key Vault 接上 |
| 選到錯誤的主機 | 自動偵測猜錯 | 編輯 `azure.yaml` 中的 `host:` 並重新執行 `azd up` |

更多資訊請參閱 [第 7 章：故障排除](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 摘要

- `azd init` → **"使用目前目錄中的程式碼。"** 可將 azd 新增到你已有的應用程式。
- `azure.yaml` 將你的程式碼資料夾映射到 Azure 主機；`infra/` 以 Bicep 定義資源。
- `azd infra generate` 讓你檢閱或自訂產生的基礎設施。
- 一旦初始化，你的既有應用程式可使用與範本式應用相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 導覽

| 方向 | 教學 |
|-----------|--------|
| <strong>上一步</strong> | [你的第一個專案](first-project.md) |
| <strong>下一步</strong> | [開發容器與 Codespaces](dev-containers.md) |

## 📖 相關資源

- [AZD 基本概念](azd-basics.md)
- [第 4 章：基礎設施即代碼](../chapter-04-infrastructure/README.md)
- [組態與驗證](../chapter-03-configuration/authsecurity.md)
- [指令速查表](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->