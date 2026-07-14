# 撰寫您自己的 azd 範本

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第4章 - 基礎架構即程式碼與部署
- **⬅️ 上一章**：[部署指南](deployment-guide.md)
- **🚀 下一章**：[第5章：多代理解決方案](../chapter-05-multi-agent/README.md)

> 以 `azd 1.27.1` 於2026年7月驗證。

## 介紹

到目前為止，您已經透過 `azd init --template <name>` <em>使用</em> 範本。但一旦您有了一個團隊喜歡的專案佈局—比方說，有一個容器應用程式搭配 Cosmos DB 和適當的監控—您會想把它轉成您自己的可重複使用範本。範本只是一個具有可預測結構且 azd 知道如何讀取的 Git 儲存庫。本課程將教您如何從零開始建立範本、測試，並（選擇性地）發佈到社群畫廊。

## 學習目標

完成本課程後，您將能：
- 了解什麼條件使資料夾成為「azd 範本」
- 知道所需的檔案與資料夾佈局
- 新增可重複使用的 `azure.yaml` 和 `infra/`
- 在分享前本機測試您的範本
- 發佈它，並（選擇性）提交至 Awesome AZD

## 學習成果

完成本課程後，您將能：
- 建立新的範本儲存庫腳手架
- 參數化基礎設施，使其適用於任何訂閱
- 使用 `azd init` 和 `azd up` 驗證範本
- 新增社群畫廊所需的元資料

---

## 範本到底是什麼？

azd 範本是 **一個 Git 儲存庫**，至少包含：

| 檔案 / 資料夾 | 目的 | 是否必需 |
|---------------|---------|-----------|
| `azure.yaml` | 描述服務、主機和基礎設施供應者 | ✅ 是 |
| `infra/` | 使用 Bicep、Terraform 或 Pulumi 佈建資源 | ✅ 是 |
| `src/`（或您的程式碼） | azd 部署的應用程式程式碼 | ✅ 是 |
| `README.md` | 範本使用說明 | ✅ 強烈建議 |
| `.azdo/` 或 `.github/` | CI/CD 流水線定義 | 選擇性 |
| `.devcontainer/` | 可重現的開發環境 | 選擇性 |
| `azure.yaml` 中的 `metadata` | 畫廊與遙測資訊 | 選擇性（發佈需具備） |

這裡沒有魔法：當您執行 `azd init --template you/your-repo` 時，azd 會複製儲存庫並讀取 `azure.yaml`。

---

## 步驟1：建立儲存庫腳手架

手動建立資料夾結構，或從簡約範本開始並編輯：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 建立標準佈局
mkdir -p src infra
```

完成的典型佈局看起來像這樣：

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

## 步驟2：撰寫 `azure.yaml`

這是範本的核心。它告訴 azd 要部署什麼以及如何部署：

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

> `metadata.template` 欄位是畫廊遙測用來計算使用量。請使用 `name@version` 慣例。

---

## 步驟3：參數化基礎架構

<em>可重複使用</em> 範本最重要的規則：**絕不硬編碼名稱、地區或訂閱特定值。** 使用參數和資源代幣模式，使相同範本能在任何人的訂閱中運作。

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

這兩點讓範本更友善：

1. **`azd-env-name` 標籤** — azd 用它來追蹤並清理每個環境的資源。
2. **`uniqueString(...)` 資源代幣** — 產生穩定且全球唯一的後綴，避免名稱衝突。

提供一個對應的參數檔，從環境讀取 azd 注入的值：

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

azd 會自動以當前環境替換 `${AZURE_ENV_NAME}` 及 `${AZURE_LOCATION}`。

---

## 步驟4：本機測試您的範本

分享前，請證明範本從清潔狀態開始能正常運作。

<strong>從本機資料夾測試</strong>（不需推送 Git）：

```bash
# 從一個空目錄，使用您的本地模板路徑初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 端到端配置與部署
azd auth login
azd up
```

<strong>接著測試拆除</strong>—好的範本會完全清理資源：

```bash
azd down --force --purge
```

如果 `azd down` 留下資源，您可能忘了給資源標記 `azd-env-name`。

> **提示：** 先執行 `azd provision --preview`。它會執行假設檢查，在建立任何資源前揭示範本錯誤。

---

## 步驟5：發佈範本

將儲存庫推上 GitHub（想讓其他人使用則公開）：

```bash
gh repo create my-azd-template --public --source=. --push
```

現在任何人都能使用它：

```bash
azd init --template your-github-username/my-azd-template
```

---

## 步驟6（選擇性）：提交至 Awesome AZD

[Awesome AZD 畫廊](https://azure.github.io/awesome-azd/)列出社群範本。要被列出，您的儲存庫應該包含：

- ✅ 具清晰的 `README.md`，包含前置需求、架構圖與成本說明
- ✅ 可用的 `azure.yaml` 與 `metadata.template`
- ✅ 能在全新訂閱環境乾淨佈建的基礎架構
- ✅ `LICENSE` 檔案
- ✅ （建議）具一鍵啟用 Codespaces 的 `.devcontainer/`

透過於 [Awesome AZD 儲存庫](https://github.com/Azure/awesome-azd) 開 Pull Request，新增您的範本至畫廊資料檔並遵循貢獻指南來提交。

---

## 常見陷阱

| 陷阱 | 解決方法 |
|---------|-----|
| 硬編碼資源名稱 | 使用 `uniqueString()` 資源代幣 |
| `azd down` 留下資源 | 給每個資源（或資源群組）加上 `azd-env-name` 標籤 |
| 範本您這裡可用，別人那裡失敗 | 移除訂閱ID、租戶ID、地區假設 |
| 輸出未連接到應用程式 | 匯出 `SERVICE_<NAME>_ENDPOINT_URL` 和其他 `AZURE_*` 輸出 |
| 交由畫廊投稿被拒 | 補充 `README.md`、`LICENSE` 以及 `metadata.template` |

---

## 摘要

- 範本就是包含 `azure.yaml`、`infra/` 和您的程式碼的 Git 儲存庫。
- 全部參數化——名稱、地區及 ID，讓它能在任何地方運行。
- 始終給資源加上 `azd-env-name` 標籤，使 `azd down` 能正常清理。
- 發佈前用 `azd init --template <local-path>` 在本機測試。
- 新增元資料和 README 再提交到 Awesome AZD。

---

## 🔗 導航

| 方向 | 資源 |
|-----------|----------|
| <strong>上一章</strong> | [部署指南](deployment-guide.md) |
| <strong>章節首頁</strong> | [第4章：基礎架構即程式碼](README.md) |
| <strong>下一章</strong> | [第5章：多代理解決方案](../chapter-05-multi-agent/README.md) |

## 📖 相關資源

- [佈建資源](provisioning.md)
- [Awesome AZD 畫廊](https://azure.github.io/awesome-azd/)
- [官方 azd 範本文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->