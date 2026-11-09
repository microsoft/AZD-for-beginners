# 4. 配置範本

!!! tip "完成本單元後，你將能夠"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. 從實際的範本開始

開啟您初始化的存放庫中 [`azure.yaml` 在開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml)。上游範本可能會獨立於本工作坊變動。以下 <strong>節錄</strong> 於 2026 年 11 月 4 日檢查；此節錄不替代完整檔案：

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

- `name` 指定 AZD 專案；`metadata.template` 記錄範本版本。
- `requiredVersions.azd` 是範本的最低要求，不是推薦繼續使用舊版 CLI。請使用目前支援的 AZD 版本。
- `services` 定義應用程式部署目標。此範本將其 Python API 和前端一併部署為一個 Container Apps 服務。
- `project` 是相對於 `azure.yaml` 的路徑。
- `remoteBuild` 請求遠端容器建置。您的身份仍需擁有所需的 Azure 權限。

範本中於 `infra/` 下的 Bicep 檔案，而非單獨 `services` 清單，聲明了如 Microsoft Foundry、模型部署、儲存以及可選的 AI 搜尋等資源。

## 2. 理解生命週期掛鉤

在執行範本前，請檢查 `hooks` 區段及其所引用的腳本。此版本包含：

| 掛鉤 | 作用 | 重要行為 |
|------|---------|--------------------|
| `preup` | 在 `up` 工作流程前驗證範本環境輸入 | 平台專屬 shell 腳本在失敗時可中止工作流程 |
| `postdeploy` | 在應用程式部署後執行範本特定的設定 | 檢查 `continueOnError` 和腳本輸出；成功部署不代表所有設定任務皆成功 |

此版本<strong>不包含</strong>早期工作坊材料中顯示的舊 `postprovision` / `write_env` 掛鉤。請勿複製掛鉤中引用已不存在的腳本。

掛鉤鍵選擇生命週期事件；`posix` 和 `windows` 選擇平台實現。`shell`、`run`、`interactive` 及 `continueOnError` 控制執行。這些都是具您權限的可執行腳本，請像審查應用程式程式碼般檢視它們。

完整生命週期請參考 [AZD 掛鉤文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility)。

## 3. 追蹤環境輸入至基礎架構

從已初始化的範例存放庫執行這些命令：

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

檢查 `infra/main.parameters.json` 了解範本實際使用了哪些環境變數。隨意以 `azd env set` 設定名稱並不會自動改變 Azure 資源。

檢閱的預設設定包含：

| 輸入 | 預設 / 目的 |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`；配額單位依模型與部署類型而異 |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`；除非資料處理經過審查，否則保持停用狀態 |

這些是特定範例的輸入，而非全域 AZD 設定。選擇模型、SKU、容量或地區時，請檢查 [模型與地區支援文件](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) 以及您的訂閱配額。不要將每個容量單位直接解讀為每分鐘 1,000 令牌。

若要選擇不同的對話模型，請更新其相容的 **名稱、版本、格式、SKU 及容量**，詳見 [範例自訂指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md)。僅更改名稱可能會遺留不相容的版本或部署類型。

## 4. 實驗：啟用可選的搜尋與追蹤

!!! warning "這些設定可能增加計費資源"

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

基礎架構變更需佈建；單純執行 `azd deploy` 只會部署應用程式服務。針對搜尋索引與支援的檢索選項，請遵循 [AI 搜尋指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md)。監控方面，請參閱 [可觀察性指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md)。

未經所需同意、存取控制、保留政策及敏感資訊刪除，不要在真實客戶資料上啟用提示/回應內容擷取。

## 5. 現有資源與 CI/CD

若要重用 Foundry 專案，請依範例中的 [現有資源說明](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) 進行。設定 `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` 會改變部署路徑；此情況下範本不會為您建立 Application Insights 或 AI 搜尋。請明確驗證相依性、角色指派與模型部署。

`pipeline.variables` 區段控制傳入生成管線的值；它不是秘密儲存庫，也不會創建 Azure 資源。API 應用程式內優先使用管理身分，CI/CD 使用 OIDC。AZD 環境檔是明文，不應提交。

AZD 支援匯入受信任、本地準備的 dotenv 檔案：

```bash
azd env set --file .env
```

匯入前請檢查該檔案，且避免在共用終端機或 CI 日誌中列印包含機密的環境檔。

## 6. 檢查您的理解

- 哪個 `azure.yaml` 服務部署了應用程式？
- 您變更的每個值由哪個基礎架構參數消費？
- 哪些變更需要佈建而非僅部署？
- 選擇的地區和訂閱是否支援該模型與配額？
- 所有設定掛鉤是否皆成功？您能否驗證已部署應用程式的行為？

繼續至 [自訂範本](5-Customize-AI-Template.md)。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->