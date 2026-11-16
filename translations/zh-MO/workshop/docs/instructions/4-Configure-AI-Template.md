# 4. 配置範本

!!! tip "完成本單元後您將能夠"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. 從實際範本開始

開啟您初始化的儲存庫中 [`azure.yaml` 在用 AI 代理入門中](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml)。上游範本可以獨立於本工作坊變更。以下 <strong>節錄</strong> 於 2026 年 11 月 4 日檢視；它不是完整檔案的替代品：

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` 識別 AZD 專案；`metadata.template` 記錄範本版本。
- `requiredVersions.azd` 是範本的最低版本，不是建議繼續使用舊有 CLI。請使用目前支援的 AZD 發行版本。
- `services` 定義應用程式部署目標。此範本將其 Python API 與前端作為一個 Container Apps 服務部署。
- `project` 是相對於 `azure.yaml`。
- `remoteBuild` 請求遠端容器建置。您的身份仍需要具備所需的 Azure 權限。

範本的 Bicep 檔案位於 `infra/`，而非單靠 `services` 列表，宣告了資源如 Microsoft Foundry、模型部署、儲存以及可選的 AI 搜索。

## 2. 了解生命週期掛鉤

在執行範本前，檢查 `hooks` 區段及其參考的腳本。審查版本包含：

| 掛鉤 | 目的 | 重要行為 |
|------|---------|--------------------|
| `preup` | 在 `up` 工作流程前驗證範本環境輸入 | 特定平台 Shell 腳本失敗時可停止工作流程 |
| `postdeploy` | 應用程式部署後執行範本特定設定 | 檢查 `continueOnError` 及腳本輸出；部署成功不代表所有設定任務均成功 |

此版本 <strong>不包含</strong> 早期工作坊資料中的舊 `postprovision` / `write_env` 掛鉤。不要複製指向已不存在腳本的掛鉤引用。

掛鉤鍵選取生命週期事件；`posix` 和 `windows` 選擇平台實作。`shell`、`run`、`interactive` 和 `continueOnError` 控制執行。這些都是以您的權限執行的腳本，請如同應用程式程式碼般仔細檢閱。

請參閱完整生命週期的 [AZD 掛鉤文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility)。

## 3. 追踪環境輸入到基礎架構

從初始化的範例儲存庫執行這些命令：

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

檢查 `infra/main.parameters.json` 以了解範本實際使用哪些環境變數。使用 `azd env set` 設定任意名稱並不會自動更改 Azure 資源。

審查的預設值包括：

| 輸入 | 預設 / 目的 |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`；配額單位取決於模型與部署類型 |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`；除非已審核資料處理，否則保持禁用 |

這些是範例專用輸入，不是全域 AZD 設定。選擇模型、SKU、容量或地區前，請查閱 [模型及地區支援文件](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) 並核訂您訂閱的配額。不要將每個容量單位解讀為每分鐘 1,000 個 token。

若要選擇不同聊天模型，請更新相容的<strong>名稱、版本、格式、SKU 及容量</strong>，請參考 [範例的自訂指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md)。只變更名稱可能導致版本或部署類型不相容。

## 4. 實驗：啟用選用的搜尋與追踪

!!! warning "這些設定可能會增加計費資源"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

基礎架構變更需要供應；單獨執行 `azd deploy` 只會部署應用程式服務。欲索引搜尋與支援的檢索選項，請遵循 [AI 搜索指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md)。欲監控，請遵循 [可觀察性指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md)。

未經必要的同意、存取控制、保留政策和編輯，不要在真實客戶資料上啟用提示/回應內容捕獲。

## 5. 現有資源與 CI/CD

若要重用 Foundry 專案，請遵循範例的 [現有資源說明](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources)。設置 `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` 會變更部署路徑；在該情況下範本不會為您建立 Application Insights 或 AI 搜索。請明確驗證相依項、角色指派與模型部署。

`pipeline.variables` 區段控制傳入產生管線的數值；它不是祕密庫且不會建立 Azure 資源。應用中優先使用託管身份識別以及 CI/CD 使用 OIDC。AZD 環境檔案為明文，不應提交。

AZD 支援匯入信任的本地 dotenv 檔案：

```bash
azd env set --file .env
```

匯入前請審閱該檔案，且不要在共享終端機或 CI 日誌印出含祕密的環境檔案。

## 6. 檢查您的理解

- 哪一個 `azure.yaml` 服務部署應用程式？
- 每個您變更的值由哪個基礎架構參數消費？
- 哪些變更需要供應，而非僅是部署？
- 選定的地區與訂閱是否支援該模型與配額？
- 所有設定掛鉤是否成功，以及您能否驗證已部署應用程式的行為？

繼續前往 [自訂範本](5-Customize-AI-Template.md)。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->