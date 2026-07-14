# 自攜應用程式 — 將 azd 新增至現有專案

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章**：第 1 章 - 基礎與快速開始
- **⬅️ 上一節**：[你的第一個專案](first-project.md)
- **➡️ 下一節**：[開發容器與 Codespaces](dev-containers.md)

> 於 2026 年 7 月驗證通過版本為 `azd 1.27.1`。

## 介紹

在 [你的第一個專案](first-project.md) 中，你是從範本開始部署應用程式。但大多數時候你已經<em>擁有</em>一個應用程式——一個 Node.js API、Python Flask 服務、.NET 網頁應用程式——放在電腦中的資料夾裡。本課程將示範如何將 azd 新增到既有程式碼中，讓你可以直接用 `azd up` 部署，不需要範本。

## 學習目標

完成本課程後，你將能：
- 了解三種啟動 azd 專案的方式
- 在現有程式碼庫中執行 `azd init`
- 理解 `azure.yaml` 與 `infra/` 資料夾對你的應用程式的作用
- 了解何時讓 azd 生成基礎架構，何時自行撰寫
- 用 `azd up` 部署你既有的應用程式至 Azure

## 學習成效

完成本課後，你將能：
- 在已有的專案中初始化 azd
- 閱讀與編輯基本的 `azure.yaml` 檔案
- 使用 `azd infra generate` 生成起始基礎架構
- 選擇適合的 Azure 主機給你的應用程式
- 部署並清理你自己的應用程式

---

## 三種啟動 azd 專案的方式

| 起始點 | 指令 | 何時使用 |
|----------------|---------|-------------|
| <strong>從範本開始</strong> | `azd init --template <name>` | 學習，或從經過驗證的範例開始新應用 |
| <strong>從既有程式碼開始</strong> | (在專案資料夾內) 執行 `azd init` | 你已有應用程式，想要部署它 |
| **從 Git 儲存庫開始** | (在已克隆的儲存庫內) 執行 `azd init --from-code` | 為一個現有儲存庫採用 azd |

你已經練習過第一個選項，本課程涵蓋第二個選項——最常見的實務情況。

---

## 第 1 步：在你的專案中執行 `azd init`

開啟終端機，<strong>置於你的既有專案資料夾中</strong>，並執行：

```bash
cd my-existing-app
azd init
```

azd 會問你如何初始化。請選擇：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

選擇 **"使用當前目錄中的程式碼。"** azd 隨後掃描你的資料夾，偵測你的語言和框架，並建議主機。

### azd 偵測內容

azd 會尋找如 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 等訊號，並建議對應的 Azure 主機：

| 你的應用程式 | 可能偵測的主機 |
|----------|----------------------|
| Node.js / Python / .NET 網頁應用程式 | Azure App Service 或 Container Apps |
| 容器化應用程式（`Dockerfile`） | Azure Container Apps |
| 函式應用程式 | Azure Functions |
| 靜態網站（React/Vue 建置輸出） | Azure Static Web Apps |

確認偵測的服務，azd 會搭建你需要的檔案。

---

## 第 2 步：了解 azd 所建立的內容

初始化後，你的專案會有兩個新東西：

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

這是 azd 專案的核心。一個最簡約的示例如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 區段是關鍵部分：每個條目將你程式碼的資料夾對應到 Azure 主機。如果你的應用有前端與 API，就會有兩個服務。

### `infra/` — 你的 Azure 資源程式碼化

`infra/` 資料夾包含定義應用程式所需 Azure 資源（App Service、資料庫等）的 Bicep 檔案。你不必手寫這些檔案——azd 會產生可用的起點。你<em>可以</em>之後編輯它們，新增資源或加強安全（在 [第 4 章](../chapter-04-infrastructure/README.md) 會說明）。

> **提示：** 想要在部署前瀏覽或自訂生成的基礎架構？執行 `azd infra generate`（也可用 `azd infra synth`），將 IaC 生成到磁碟，方便你審查與版本控管。

---

## 第 3 步：設定必要的組態

如果你的應用需要設定或祕密（連接字串、API 金鑰），請不要硬編碼。使用環境變數：

```bash
# 建立一個環境
azd env new dev

# 設定一個非機密值
azd env set API_VERSION 1.0.0
```

對於真正的祕密，請儲存在 Key Vault，並從你的基礎架構引用——詳見 [第 3 章：組態與認證](../chapter-03-configuration/authsecurity.md)。

---

## 第 4 步：部署

現在使用你已熟悉的工作流程：

```bash
# 認證（azd 必需）
azd auth login

# 預覽即將建立的資源
azd provision --preview

# 配置基礎架構並部署您的代碼
azd up
```

執行完成時，azd 會印出你的應用網址。以與其他 azd 應用相同方式驗證：

```bash
azd show           # 顯示端點
azd monitor --logs # 如有需要，檢查日誌
```

---

## 常見首次問題

| 現象 | 可能原因 | 解決方法 |
|---------|--------------|-----|
| azd 未偵測到我的應用程式 | 缺少清單檔（如 `package.json`） | 新增清單檔，或在 `azd init` 時手動選擇主機 |
| `azd up` 時建置失敗 | 應用需要建置流程 | 在 `azure.yaml` 的服務區段增加 `buildCommand`/`outputPath` |
| 應用啟動但有錯誤回傳 | 缺少組態/祕密 | 使用 `azd env set` 設定值或連接 Key Vault |
| 選擇了錯誤的主機 | 自動偵測猜錯 | 編輯 `azure.yaml` 中的 `host:`，重新執行 `azd up` |

更多說明，請參閱 [第 7 章：疑難排解](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 總結

- `azd init` → **"使用現有目錄中的程式碼"** ，將 azd 新增至你已有的應用程式中。
- `azure.yaml` 將你的程式碼資料夾映射到 Azure 主機；`infra/` 以 Bicep 定義資源。
- `azd infra generate` 可讓你審查或自訂生成的基礎架構。
- 初始化後，你現有的應用程式與範本程式一樣，使用相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 導航

| 方向 | 課程 |
|-----------|--------|
| <strong>上一節</strong> | [你的第一個專案](first-project.md) |
| <strong>下一節</strong> | [開發容器與 Codespaces](dev-containers.md) |

## 📖 相關資源

- [AZD 基礎](azd-basics.md)
- [第 4 章：基礎架構即代碼](../chapter-04-infrastructure/README.md)
- [組態與認證](../chapter-03-configuration/authsecurity.md)
- [指令速查表](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->