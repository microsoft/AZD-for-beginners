# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入門指南](../../README.md)
- **📖 Current Chapter**: 第 4 章 - 基礎設施即程式碼與部署
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validated against `azd 1.25.6` in June 2026.

## Introduction

到目前為止你已經使用 `azd init --template <name>` <em>消費過</em> 範本。但一旦你有一個團隊喜歡的專案佈局 — 例如一個 Container App 搭配 Cosmos DB 與合適的監控 — 你會想把它轉成可重用的範本。範本其實就是一個具有可預測結構、azd 能讀取的 Git 倉庫。本課程示範如何從頭建立一個範本、測試它，並（選擇性地）發佈到社群畫廊。

## Learning Goals

完成本課後，你將會：
- 了解什麼條件會讓一個資料夾成為「azd 範本」
- 知道必要的檔案與資料夾配置
- 新增一個 `azure.yaml` 與其他人可重用的 `infra/`
- 在分享前於本機測試你的範本
- 發佈範本並（可選）提交到 Awesome AZD

## Learning Outcomes

完成本課程後，你將能夠：
- 搭建一個新的範本倉庫雛形
- 將基礎設施參數化，使其在任何訂閱都能運作
- 使用 `azd init` 與 `azd up` 驗證範本
- 新增社群畫廊所需的 metadata

---

## What Is a Template, Really?

一個 azd 範本是 **一個 Git 倉庫**，至少包含：

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | 描述服務、主機與基礎設施供應者 | ✅ Yes |
| `infra/` | 用於佈署資源的 Bicep、Terraform 或 Pulumi | ✅ Yes |
| `src/` (or your code) | azd 會部署的應用程式程式碼 | ✅ Yes |
| `README.md` | 如何使用這個範本 | ✅ Strongly recommended |
| `.azdo/` or `.github/` | CI/CD 管線定義 | Optional |
| `.devcontainer/` | 可重現的開發環境 | Optional |
| `azure.yaml` `metadata` | 畫廊與遙測資訊 | Optional (required to publish) |

這沒有什麼魔法：當你執行 `azd init --template you/your-repo` 時，azd 會 clone 該倉庫並讀取 `azure.yaml`。

---

## Step 1: Scaffold the Repository

手動建立資料夾結構，或從一個最小範本開始再進行編輯：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 建立標準佈局
mkdir -p src infra
```

一個典型完成的佈局長這樣：

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

## Step 2: Write `azure.yaml`

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

> `metadata.template` 欄位是畫廊遙測用來計算使用量的欄位。請使用 `name@version` 的慣例。

---

## Step 3: Parameterize the Infrastructure

對於一個「可重用」的範本來說，最重要的規則是：**切勿硬編碼名稱、地區或訂閱專屬的值。** 使用參數與資源 token 模式，讓同一個範本能在任何人的訂閱中運作。

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

有兩件事讓這個範本更友善：

1. **`azd-env-name` 標籤** — azd 使用它來追蹤並清理每個環境的資源。
2. **`uniqueString(...)` 資源 token** — 會產生穩定且全球唯一的後綴，避免名稱衝突。

提供一個相對應的參數檔，讀取 azd 從環境注入的值：

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

azd 會自動從當前環境取代 `${AZURE_ENV_NAME}` 與 `${AZURE_LOCATION}`。

---

## Step 4: Test Your Template Locally

在分享之前，請從乾淨的狀態驗證範本可運作。

<strong>從本地資料夾測試</strong>（不需 push 到 Git）：

```bash
# 從一個空目錄開始，使用你本地的範本路徑進行初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 端到端進行資源配置與部署
azd auth login
azd up
```

<strong>然後測試拆除流程</strong>— 一個好的範本應該能完全清理乾淨：

```bash
azd down --force --purge
```

如果 `azd down` 留下資源，代表你可能忘了在某個資源上加上 `azd-env-name` 標籤。

> **Tip:** 先執行 `azd provision --preview`。它會執行 what-if，並在建立任何資源前揭露範本錯誤。

---

## Step 5: Publish the Template

把倉庫推上 GitHub（若要讓其他人使用請設為公開）：

```bash
gh repo create my-azd-template --public --source=. --push
```

任何人現在都可以使用它：

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

[Awesome AZD 畫廊](https://azure.github.io/awesome-azd/) 列出社群範本。要被列入，倉庫應包含：

- ✅ 一個清楚的 `README.md`，包含先決條件、架構圖與費用說明
- ✅ 一個可運作的 `azure.yaml`，內含 `metadata.template`
- ✅ 能在全新訂閱中順利佈署的基礎設施
- ✅ 一個 `LICENSE` 檔案
- ✅（建議）一個 `.devcontainer/` 以提供一鍵的 Codespaces 體驗

透過開啟一個 Pull Request 並在畫廊的資料檔中加入你的範本來提交，遵循 [Awesome AZD repository](https://github.com/Azure/awesome-azd) 的貢獻指南。

---

## Common Pitfalls

| Pitfall | Fix |
|---------|-----|
| 硬編碼的資源名稱 | 使用 `uniqueString()` 資源令牌 |
| `azd down` 留下資源 | 在每個資源（或資源群組）上加上 `azd-env-name` 標籤 |
| 範本在你那裡可用，但在他人那裡失敗 | 移除訂閱 ID、租戶 ID 與區域的假設 |
| 輸出沒有連接到應用程式 | 匯出 `SERVICE_<NAME>_ENDPOINT_URL` 與其他 `AZURE_*` 輸出 |
| 畫廊提交被拒 | 加入 `README.md`、`LICENSE` 與 `metadata.template` |

---

## Summary

- 範本只是個含有 `azure.yaml`、`infra/` 與你的程式碼的 Git 倉庫。
- 將一切參數化 — 名稱、地區與 ID — 讓它能在任何地方執行。
- 總是在資源上加上 `azd-env-name` 標籤，讓 `azd down` 能正常運作。
- 在發佈前用 `azd init --template <local-path>` 在本機測試。
- 新增 metadata 與 README 以便提交到 Awesome AZD。

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [Deployment Guide](deployment-guide.md) |
| **Chapter Home** | [Chapter 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->