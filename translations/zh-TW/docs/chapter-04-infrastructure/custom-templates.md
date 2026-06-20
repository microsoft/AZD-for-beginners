# 撰寫你自己的 azd 範本

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> 已於 2026 年 6 月用 `azd 1.25.6` 驗證。

## 簡介

到目前為止你已經 <em>使用</em> `azd init --template <name>` 來取得範本。但一旦你的團隊喜歡某個專案佈局——例如，一個 Container App 搭配 Cosmos DB 和適當的監控——你會想把它變成自己可重複使用的範本。範本只是 azd 能夠讀取的一個具有可預測結構的 Git 倉庫。本課程示範如何從頭建立一個，測試它，並（可選）發佈到社群畫廊。

## 學習目標

完成本課程後，你將能：
- 了解哪些條件使一個資料夾成為「azd 範本」
- 知道必要的檔案與資料夾佈局
- 新增可被他人重用的 `azure.yaml` 與 `infra/`
- 在分享前於本機測試範本
- 發佈範本並（可選）提交至 Awesome AZD

## 學習成果

完成本課程後，你將能：
- 快速建立新的範本儲存庫骨架
- 將基礎設施參數化，使其可在任何訂閱中運行
- 使用 `azd init` 與 `azd up` 驗證範本
- 新增社群畫廊要求的 metadata

---

## 範本到底是什麼？

azd 範本是 **一個 Git 倉庫**，至少包含：

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Describes services, hosts, and infra provider | ✅ 是 |
| `infra/` | Bicep, Terraform, or Pulumi that provisions resources | ✅ 是 |
| `src/` (or your code) | The application code azd deploys | ✅ 是 |
| `README.md` | How to use the template | ✅ 強烈建議 |
| `.azdo/` or `.github/` | CI/CD pipeline definitions | Optional |
| `.devcontainer/` | Reproducible dev environment | Optional |
| `azure.yaml` `metadata` | Gallery + telemetry info | 可選（若要發佈則為必要） |

這裡沒有什麼魔法：當你執行 `azd init --template you/your-repo` 時，azd 會 clone 該倉庫並讀取 `azure.yaml`。

---

## Step 1: Scaffold the Repository

Create the folder structure by hand or start from a minimal template and edit it:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 建立標準版面配置
mkdir -p src infra
```

A typical finished layout looks like this:

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

This is the heart of the template. It tells azd what to deploy and how:

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

> `metadata.template` 欄位是畫廊遙測用來計算使用量的欄位。請使用 `name@version` 慣例。

---

## Step 3: Parameterize the Infrastructure

The single most important rule for a *reusable* template: **never hardcode names, regions, or subscription-specific values.** Use parameters and the resource token pattern so the same template works in anyone's subscription.

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

Two things make this template-friendly:

1. **`azd-env-name` tag** — azd uses it to track and clean up resources per environment.
2. **`uniqueString(...)` resource token** — produces a stable, globally-unique suffix so names don't collide.

Provide a matching parameters file that reads values azd injects from the environment:

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

azd substitutes `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from the current environment automatically.

---

## Step 4: Test Your Template Locally

Before sharing, prove the template works from a clean state.

**Test from the local folder** (no Git push required):

```bash
# 從一個空目錄，使用您本機的範本路徑進行初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 端到端佈建與部署
azd auth login
azd up
```

**Then test the teardown**—a good template cleans up completely:

```bash
azd down --force --purge
```

If `azd down` leaves resources behind, you probably missed the `azd-env-name` tag on a resource.

> **Tip:** run `azd provision --preview` first. It performs a what-if and surfaces template errors before any resource is created.

---

## Step 5: Publish the Template

Push the repository to GitHub (public if you want others to use it):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anyone can now use it:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

The [Awesome AZD gallery](https://azure.github.io/awesome-azd/) lists community templates. To be listed your repo should include:

- ✅ 清晰的 `README.md`，包含先決條件、架構圖和成本說明
- ✅ 一個可運作的 `azure.yaml`，包含 `metadata.template`
- ✅ 能在全新訂閱中順利佈署的基礎設施
- ✅ `LICENSE` 檔案
- ✅（建議）包含 `.devcontainer/` 以支援一鍵 Codespaces

Submit by opening a pull request that adds your template to the gallery's data file, following the contribution guide at the [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## 常見陷阱

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Use the `uniqueString()` resource token |
| `azd down` leaves resources | Tag every resource (or the resource group) with `azd-env-name` |
| Template works for you, fails for others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs not wired into the app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery submission rejected | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## 總結

- A template is just a Git repo with `azure.yaml`, `infra/`, and your code.
- Parameterize everything—names, regions, and IDs—so it runs anywhere.
- Always tag resources with `azd-env-name` so `azd down` works.
- Test locally with `azd init --template <local-path>` before publishing.
- Add metadata and a README to submit to Awesome AZD.

---

## 🔗 導覽

| Direction | Resource |
|-----------|----------|
| **Previous** | [Deployment Guide](deployment-guide.md) |
| **Chapter Home** | [Chapter 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 相關資源

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->