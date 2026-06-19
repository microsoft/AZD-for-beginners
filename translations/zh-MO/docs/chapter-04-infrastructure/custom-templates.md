# 建立您自己的 azd 範本

**章節導覽：**
- **📚 課程首頁**: [AZD 新手指南](../../README.md)
- **📖 目前章節**: 第 4 章 - 基礎架構即程式碼與部署
- **⬅️ 上一章**: [部署指南](deployment-guide.md)
- **🚀 下一章**: [第 5 章：多代理解決方案](../chapter-05-multi-agent/README.md)

> 在 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 簡介

到目前為止您已經使用 `azd init --template <name>` <em>使用</em> 範本。但當您有一個團隊喜歡的專案佈局——例如一個 Container App、Cosmos DB 與適當的監控——您會想把它變成可重複使用的範本。範本只是具有可預期結構且 azd 知道如何讀取的 Git 儲存庫。本課程示範如何從頭開始建立一個、測試它，並（選擇性）發佈到社群圖庫。

## 學習目標

完成本課程後，您將能：
- 了解什麼讓一個資料夾成為「azd 範本」
- 知道必要的檔案與資料夾佈局
- 新增讓其他人可重用的 `azure.yaml` 與 `infra/`
- 在分享前於本機測試您的範本
- 發佈它並（選擇性）提交到 Awesome AZD

## 學習成果

完成本課程後，您將能：
- 搭建新的範本儲存庫
- 將基礎架構參數化，使其能在任何訂閱中運作
- 使用 `azd init` 與 `azd up` 驗證範本
- 新增社群圖庫所需的 metadata

---

## 什麼是範本（Template）？

azd 範本是<strong>一個 Git 儲存庫</strong>，至少包含：

| 檔案 / 資料夾 | 用途 | 必須？ |
|---------------|---------|-----------|
| `azure.yaml` | 描述服務、主機與基礎架構提供者 | ✅ 是 |
| `infra/` | 用於部署資源的 Bicep、Terraform 或 Pulumi | ✅ 是 |
| `src/` (或您的程式碼) | azd 部署的應用程式程式碼 | ✅ 是 |
| `README.md` | 如何使用範本 | ✅ 強烈建議 |
| `.azdo/` 或 `.github/` | CI/CD 管線定義 | 選用 |
| `.devcontainer/` | 可重現的開發環境 | 選用 |
| `azure.yaml` `metadata` | 圖庫與遙測資訊 | 選用（發佈時需要） |

這裡沒有魔法：當您執行 `azd init --template you/your-repo` 時，azd 會複製該儲存庫並讀取 `azure.yaml`。

---

## 步驟 1：建立儲存庫雛形

手動建立資料夾結構，或從最小範本開始並編輯：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 建立標準佈局
mkdir -p src infra
```

一個典型完成的佈局如下：

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

## 步驟 2：撰寫 `azure.yaml`

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

> `metadata.template` 欄位是圖庫遙測用來計數使用量的欄位。請使用 `name@version` 慣例。

---

## 步驟 3：將基礎架構參數化

可重複使用範本的最重要規則：**絕不硬編碼名稱、地區或訂閱特定的值。** 使用參數與資源令牌模式，讓相同範本能在任何人的訂閱中運作。

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

兩件事讓這個範本具備良好重用性：

1. **`azd-env-name` 標籤** — azd 用它來追蹤並清理每個環境的資源。
2. **`uniqueString(...)` 資源令牌** — 產生穩定且全球唯一的後綴，使名稱不會衝突。

提供一個相對應的 parameters 檔案，從環境中讀取 azd 注入的值：

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

azd 會自動以目前環境中的 `${AZURE_ENV_NAME}` 與 `${AZURE_LOCATION}` 取代。

---

## 步驟 4：在本機測試您的範本

在分享之前，證明該範本在乾淨狀態下可運作。

<strong>從本地資料夾測試</strong>（不需要推送到 Git）：

```bash
# 由空目錄開始，使用你本機的範本路徑進行初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 端到端地完成資源佈建與部署
azd auth login
azd up
```

<strong>然後測試拆除</strong>— 一個好的範本會完全清理：

```bash
azd down --force --purge
```

如果 `azd down` 留下資源，您很可能忘了在某個資源上加上 `azd-env-name` 標籤。

> **小提示：** 先執行 `azd provision --preview`。它會執行 What-If（預覽）並在建立任何資源之前顯示範本錯誤。

---

## 步驟 5：發佈範本

將儲存庫推到 GitHub（若希望其他人使用，請設為公開）：

```bash
gh repo create my-azd-template --public --source=. --push
```

任何人現在都可以使用它：

```bash
azd init --template your-github-username/my-azd-template
```

---

## 步驟 6（選用）：提交到 Awesome AZD

[Awesome AZD 圖庫](https://azure.github.io/awesome-azd/) 列出社群範本。要被收錄，您的儲存庫應該包含：

- ✅ 清晰的 `README.md`，包含前置需求、架構圖與費用說明
- ✅ 可正常運作的 `azure.yaml`，含 `metadata.template`
- ✅ 能在全新訂閱中順利部署的基礎架構
- ✅ `LICENSE` 檔案
- ✅（建議）一個 `.devcontainer/`，以支援一鍵 Codespaces

請依照 [Awesome AZD 儲存庫](https://github.com/Azure/awesome-azd) 的貢獻指南，開一個 Pull Request 將您的範本加入圖庫的資料檔。

---

## 常見陷阱

| 常見陷阱 | 解法 |
|---------|-----|
| 硬編碼的資源名稱 | 使用 `uniqueString()` 資源令牌 |
| `azd down` 留下資源 | 在每個資源（或資源群組）上加上 `azd-env-name` 標籤 |
| 範本在您這邊可行，但其他人失敗 | 移除訂閱 ID、租戶 ID 與地區假設 |
| 輸出未連接到應用程式 | 匯出 `SERVICE_<NAME>_ENDPOINT_URL` 與其他 `AZURE_*` 輸出 |
| 圖庫提交被拒 | 加入 `README.md`、`LICENSE` 與 `metadata.template` |

---

## 總結

- 範本只是包含 `azure.yaml`、`infra/` 與您的程式碼的 Git 儲存庫。
- 把所有東西參數化——名稱、地區與 ID——以便可在任何地方執行。
- 務必以 `azd-env-name` 標記資源，讓 `azd down` 能正常運作。
- 在發佈前，先以 `azd init --template <local-path>` 在本地測試。
- 加入 metadata 與 README 以提交到 Awesome AZD。

---

## 🔗 導覽

| 方向 | 資源 |
|-----------|----------|
| <strong>上一步</strong> | [部署指南](deployment-guide.md) |
| <strong>章節首頁</strong> | [第 4 章：基礎架構即程式碼](README.md) |
| <strong>下一章</strong> | [第 5 章：多代理解決方案](../chapter-05-multi-agent/README.md) |

## 📖 相關資源

- [資源佈建](provisioning.md)
- [Awesome AZD 圖庫](https://azure.github.io/awesome-azd/)
- [官方 azd 範本文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->