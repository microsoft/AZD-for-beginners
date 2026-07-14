# 自己編寫 azd 範本

**章節導覽：**
- **📚 課程首頁**：[AZD 入門](../../README.md)
- **📖 本章節**：第四章 - 基礎架構即程式碼及部署
- **⬅️ 上一章節**：[部署指南](deployment-guide.md)
- **🚀 下一章節**：[第五章：多代理方案](../chapter-05-multi-agent/README.md)

> 於 2026 年 7 月使用 `azd 1.27.1` 驗證。

## 介紹

目前你已經透過 `azd init --template <name>` <em>使用</em> 範本。但一旦你有團隊喜歡的專案佈局——例如具有 Cosmos DB 和適當監控的容器應用程式，你就會想要將它變成自己的可重用範本。範本只是 azd 能讀取的具有可預測結構的 Git 儲存庫。本課程會示範如何從頭建立範本，測試它，並（可選）將其發佈到社群畫廊。

## 學習目標

本課程結束時，你將能夠：
- 了解什麼使資料夾成為「azd 範本」
- 知道必需的檔案和資料夾佈局
- 新增其他人可重用的 `azure.yaml` 和 `infra/`
- 在分享前於本機測試範本
- 發佈範本並（可選）提交至 Awesome AZD

## 學習成果

完成本課後，你將能：
- 架構新的範本儲存庫
- 參數化基礎架構，讓其可在任一訂閱中運作
- 以 `azd init` 和 `azd up` 驗證範本
- 新增社群畫廊所需的 metadata

---

## 範本到底是什麼？

azd 範本是<strong>Git 儲存庫</strong>，至少包含：

| 檔案 / 資料夾 | 目的 | 必需？ |
|---------------|---------|-----------|
| `azure.yaml` | 描述服務、主機與基礎架構供應者 | ✅ 是 |
| `infra/` | 用 Bicep、Terraform 或 Pulumi 配置資源 | ✅ 是 |
| `src/`（或你的程式碼） | azd 部署的應用程式程式碼 | ✅ 是 |
| `README.md` | 如何使用範本 | ✅ 強烈建議 |
| `.azdo/` 或 `.github/` | CI/CD 管線定義 | 選擇性 |
| `.devcontainer/` | 可重現的開發環境 | 選擇性 |
| `azure.yaml` 中的 `metadata` | 畫廊與遙測資訊 | 選擇性（發佈必需） |

這裡沒有什麼神奇的：當你執行 `azd init --template you/your-repo` 時，azd 會將倉庫克隆並讀取 `azure.yaml`。

---

## 第一步：架構儲存庫

可手動建立資料夾結構，或從最小範本開始編輯：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 建立標準佈局
mkdir -p src infra
```

一般完成的佈局長這樣：

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## 第二步：編寫 `azure.yaml`

這是範本的核心，告訴 azd 要部署什麼以及如何部署：

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` 欄位是畫廊遙測計數使用的。請使用 `name@version` 命名規則。

---

## 第三步：參數化基礎架構

<em>可重用</em> 範本最重要的規則：**絕不硬編碼名稱、區域、或訂閱特定的值**。使用參數與資源代幣模式，使同一個範本能用於任何人的訂閱。

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

兩項讓此範本適合用作範本：

1. **`azd-env-name` 標籤** — azd 用它來追蹤與清理每個環境的資源。
2. **`uniqueString(...)` 資源代幣** — 產生穩定且全球唯一的字尾以避免名稱衝突。

提供匹配的參數檔，讀取 azd 從環境注入的值：

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd 會自動替換目前環境中的 `${AZURE_ENV_NAME}` 與 `${AZURE_LOCATION}`。

---

## 第四步：在本機測試範本

分享之前，先證明範本從乾淨狀態起能正常運作。

<strong>從本地資料夾測試</strong>（不需推送至 Git）：

```bash
# 從一個空目錄，使用你的本地模板路徑進行初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 端到端進行配置與部署
azd auth login
azd up
```

<strong>接著測試拆除</strong>——一個好的範本會完全清理：

```bash
azd down --force --purge
```

若 `azd down` 留下資源，可能是某資源遺漏了 `azd-env-name` 標籤。

> **提示：** 先執行 `azd provision --preview`。它會模擬判斷，並顯示範本錯誤，避免預先建立資源。

---

## 第五步：發佈範本

將儲存庫推送到 GitHub（若想讓他人使用，請設為公開）：

```bash
gh repo create my-azd-template --public --source=. --push
```

現在任何人都可以使用：

```bash
azd init --template your-github-username/my-azd-template
```

---

## 第六步（選擇性）：提交至 Awesome AZD

[Awesome AZD 畫廊](https://azure.github.io/awesome-azd/) 列出社群範本。要被列入，儲存庫應包含：

- ✅ 清楚的 `README.md`，包括前置條件、架構圖和成本說明
- ✅ 有效運作的 `azure.yaml`，含 `metadata.template`
- ✅ 可在全新訂閱中順利部署乾淨的基礎架構
- ✅ `LICENSE` 檔
- ✅（推薦）一鍵進入 Codespaces 的 `.devcontainer/`

請透過提 Pull Request 將您的範本新增到畫廊的資料檔，詳細指南請參考 [Awesome AZD 儲存庫](https://github.com/Azure/awesome-azd)。

---

## 常見陷阱

| 陷阱 | 解決方法 |
|---------|-----|
| 硬編碼的資源名稱 | 使用 `uniqueString()` 資源代幣 |
| `azd down` 後遺留資源 | 在每個資源（或資源群組）標注 `azd-env-name` 標籤 |
| 範本對你有效，對他人失敗 | 移除訂閱 ID、租戶 ID 和區域假設 |
| 輸出未連接至應用程式 | 輸出 `SERVICE_<NAME>_ENDPOINT_URL` 與其他 `AZURE_*` 輸出變數 |
| 畫廊提交被拒 | 補充 `README.md`、`LICENSE` 與 `metadata.template` |

---

## 小結

- 範本只是帶 `azure.yaml`、`infra/` 與程式碼的 Git 儲存庫。
- 參數化全部元素——名稱、區域和 ID——讓它能在任處執行。
- 資源務必加上 `azd-env-name` 標籤，才可以順利使用 `azd down`。
- 發佈前用 `azd init --template <local-path>` 在本機測試。
- 加上 metadata 和 README，提交給 Awesome AZD。

---

## 🔗 導覽

| 方向 | 資源 |
|-----------|----------|
| <strong>上一頁</strong> | [部署指南](deployment-guide.md) |
| <strong>本章首頁</strong> | [第四章：基礎架構即程式碼](README.md) |
| <strong>下一頁</strong> | [第五章：多代理方案](../chapter-05-multi-agent/README.md) |

## 📖 相關資源

- [資源佈署](provisioning.md)
- [Awesome AZD 畫廊](https://azure.github.io/awesome-azd/)
- [官方 azd 範本文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->