# 編寫您自己的 azd 範本

**章節導航：**
- **📚 課程首頁**：[AZD 初學者](../../README.md)
- **📖 目前章節**：第4章 - 基礎架構即程式碼與部署
- **⬅️ 上一章**：[部署指南](deployment-guide.md)
- **🚀 下一章**：[第5章：多代理解決方案](../chapter-05-multi-agent/README.md)

> 已於2026年7月針對 `azd 1.27.1` 驗證。

## 介紹

到目前為止，您已經使用 `azd init --template <name>` <em>消費</em> 範本。但一旦您的團隊喜歡了一個專案架構——例如，一個帶有 Cosmos DB 及適當監控的容器應用——您就會想把它變成一個可重複使用的範本。範本只是 azd 能夠讀取的具有可預測結構的 Git 倉庫。本課程會教您如何從零開始構建一個範本、測試它，並（可選）將其發佈到社區畫廊。

## 學習目標

完成本課程後，您將能：
- 了解什麼樣的資料夾算是「azd 範本」
- 知道所需的檔案與資料夾佈局
- 新增一個可供他人重用的 `azure.yaml` 和 `infra/`
- 在分享前於本機測試範本
- 發佈範本並（可選）提交到 Awesome AZD

## 學習成果

完成本課程後，您將能夠：
- 搭建新的範本倉庫骨架
- 參數化基礎結構，使其適用於任何訂閱
- 使用 `azd init` 和 `azd up` 驗證範本
- 新增社區畫廊所需的元資料

---

## 範本究竟是什麼？

azd 範本是 **一個 Git 倉庫**，至少包含：

| 檔案 / 資料夾 | 目的 | 必要？ |
|---------------|---------|-----------|
| `azure.yaml` | 描述服務、主機與基礎結構提供者 | ✅ 是 |
| `infra/` | 使用 Bicep、Terraform 或 Pulumi 佈建資源 | ✅ 是 |
| `src/`（或您的程式碼） | azd 部署的應用程式程式碼 | ✅ 是 |
| `README.md` | 如何使用範本 | ✅ 強烈建議 |
| `.azdo/` 或 `.github/` | CI/CD 管道定義 | 選擇性 |
| `.devcontainer/` | 可重現的開發環境 | 選擇性 |
| `azure.yaml` 的 `metadata` | 畫廊 + 遙測資訊 | 選擇性（發佈必需） |

這裡沒有魔法：當您執行 `azd init --template you/your-repo` 時，azd 會克隆此倉庫並讀取 `azure.yaml`。

---

## 第1步：搭建倉庫骨架

手動建立資料夾結構，或從最小範本開始並修改：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 建立標準佈局
mkdir -p src infra
```

一個典型的完成佈局如下：

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

## 第2步：編寫 `azure.yaml`

這是範本的核心。它告訴 azd 需要部署什麼和如何部署：

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

> `metadata.template` 欄位是畫廊遙測用來計算使用率的。請使用 `名稱@版本` 風格。

---

## 第3步：參數化基礎結構

<em>可重用</em> 範本最重要的規則是：**絕不硬編碼名稱、地區或訂閱專屬值。** 使用參數與資源令牌模式，使相同範本可在任何訂閱中使用。

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

這兩個要點讓範本更友善：

1. **`azd-env-name` 標籤** —— azd 用它來追蹤並清理每個環境的資源。
2. **`uniqueString(...)` 資源令牌** —— 產生穩定且全球唯一的字尾，避免名稱衝突。

提供一份對應的參數檔，從環境讀入 azd 注入的值：

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

azd 會自動以當前環境的 `${AZURE_ENV_NAME}` 和 `${AZURE_LOCATION}` 替換。

---

## 第4步：本地測試您的範本

在分享之前，請先證明範本可從乾淨狀態成功運作。

<strong>從本地資料夾測試</strong>（不需 Git 推送）：

```bash
# 從一個空目錄，使用你的本地模板路徑進行初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 從頭到尾完成配置與部署
azd auth login
azd up
```

<strong>然後測試拆除流程</strong>——好的範本會完全清理：

```bash
azd down --force --purge
```

如果 `azd down` 留下資源，您大概忽略在某些資源上標註 `azd-env-name` 標籤了。

> **提示：** 先執行 `azd provision --preview`。它會執行預覽，並在建立任何資源前顯示範本錯誤。

---

## 第5步：發佈範本

將倉庫推送到 GitHub（如果想讓他人使用，請設為公開）：

```bash
gh repo create my-azd-template --public --source=. --push
```

現在任何人都可以使用：

```bash
azd init --template your-github-username/my-azd-template
```

---

## 第6步（可選）：提交到 Awesome AZD

[Awesome AZD 畫廊](https://azure.github.io/awesome-azd/) 列出社區範本。被列入畫廊的倉庫應包含：

- ✅ 清楚的 `README.md`，包含先決條件、架構圖與費用說明
- ✅ 可正常運作的 `azure.yaml`，含 `metadata.template`
- ✅ 在新訂閱中可乾淨佈建基礎結構
- ✅ `LICENSE` 檔案
- ✅（建議）一個可一鍵啟動 Codespaces 的 `.devcontainer/`

透過開 pull request 將您的範本加入畫廊的資料檔，詳情請參閱 [Awesome AZD 倉庫](https://github.com/Azure/awesome-azd) 的貢獻指南。

---

## 常見陷阱

| 陷阱 | 解決方式 |
|---------|-----|
| 硬編碼資源名稱 | 使用 `uniqueString()` 資源令牌 |
| `azd down` 留下資源 | 標示每個資源（或資源組）`azd-env-name` |
| 範本您本人可用，他人則失敗 | 移除訂閱ID、租戶ID和區域假設 |
| 輸出未接入應用 | 輸出 `SERVICE_<NAME>_ENDPOINT_URL` 與其他 `AZURE_*`輸出 |
| 畫廊提交被拒絕 | 補上 `README.md`、`LICENSE` 和 `metadata.template` |

---

## 總結

- 範本就是一個含 `azure.yaml`、`infra/` 和您的程式碼的 Git 倉庫。
- 參數化一切——名稱、地區和 ID——讓它能在任何地方執行。
- 資源務必加上 `azd-env-name` 標籤，讓 `azd down` 可正常運作。
- 發佈前，先用 `azd init --template <local-path>` 本地測試。
- 加上元資料和 README 以提交給 Awesome AZD。

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
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->