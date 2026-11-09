# 4. 配置模板

!!! tip "在本模塊結束時，您將能夠"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. 從實際模板開始

開啟您初始化的倉庫中 [`azure.yaml` 在 Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) 的模板。上游模板可能獨立於此工作坊更新。以下<strong>摘錄</strong>於 2026 年 11 月 4 日檢查；它並不取代完整檔案：

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

- `name` 識別 AZD 專案；`metadata.template` 紀錄模板版本。
- `requiredVersions.azd` 是模板的最低版本需求，而非建議您使用舊版 CLI。請使用支援中的 AZD 發行版本。
- `services` 定義應用程式的部署目標。此模板將 Python API 和前端作為一個容器應用服務部署。
- `project` 是相對於 `azure.yaml`。
- `remoteBuild` 請求遠端容器建置。您的身分仍然需要必要的 Azure 權限。

模板在 `infra/` 底下的 Bicep 檔案，而非僅 `services` 清單，宣告了 Microsoft Foundry、模型部署、儲存以及可選的 AI 搜索等資源。

## 2. 了解生命週期鉤子

在執行模板前，檢查 `hooks` 區段及其引用的腳本。檢視版本包含：

| 鉤子 | 目的 | 重要行為 |
|------|---------|--------------------|
| `preup` | 在 `up` 工作流程前驗證模板環境輸入 | 平台特定的 Shell 腳本失敗時可中止流程 |
| `postdeploy` | 在應用程式部署後執行模板特定的設置 | 檢查 `continueOnError` 及腳本輸出；成功部署不代表每個設置任務都成功 |

此版本<strong>不含</strong>早期工作坊材料中的舊 `postprovision` / `write_env` 鉤子。請勿複製對已不存在腳本的鉤子引用。

鉤子鍵選擇生命週期事件；`posix` 與 `windows` 選擇平台實現。`shell`、`run`、`interactive` 與 `continueOnError` 控制執行。這些是以您權限執行的可執行腳本，請像檢閱應用程式碼一樣檢查它們。

完整生命週期請參閱 [AZD hooks 文檔](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility)。

## 3. 追蹤環境輸入至基礎設施

從初始化的範例倉庫執行以下命令：

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

檢查 `infra/main.parameters.json` 以查看模板實際使用哪些環境變量。利用 `azd env set` 設置任意名稱不會自動更改 Azure 資源。

已檢視的預設包括：

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
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`；除非已審查資料處理，否則保持禁用狀態 |

這些是範例專用輸入，非 AZD 全局設定。選擇模型、SKU、容量或區域前，請檢查 [模型及區域支援文件](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) 以及您的訂閱配額。不要將每個容量單位誤解為每分鐘 1,000 個標記。

若要選擇不同的聊天模型，請<strong>一起更新</strong>其兼容的名稱、版本、格式、SKU 與容量，詳見 [範例自訂指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md)。只更動名稱可能會留下不相容的版本或部署類型。

## 4. 實驗：啟用可選的搜尋與追蹤

!!! warning "這些設定可能會新增會產生費用的資源"

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

基礎設施變更需要進行佈署；僅 `azd deploy` 無法部署應用服務。有關搜尋索引和支援的檢索選項，請參考 [AI 搜索指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md)。監控請參考 [可觀察性指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md)。

未取得必要同意、存取控制、保留政策及遮罩前，請勿在真實客戶資料上啟用提示/回應內容擷取。

## 5. 現有資源與 CI/CD

若要重用 Foundry 專案，請遵循範例的 [現有資源說明](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources)。設定 `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` 變更部署路徑；此情況下，模板不會為您創建 Application Insights 或 AI Search。請明確驗證依賴、角色分配與模型部署。

`pipeline.variables` 區段控制傳入生成管線的值；它不是秘密存儲，且不會創建 Azure 資源。建議應用程式中使用受管身分，並在 CI/CD 中使用 OIDC。AZD 環境檔為純文本，不應提交。

AZD 支援導入可信且本地準備的 dotenv 檔：

```bash
azd env set --file .env
```

導入前請檢視該檔，且不要在共享終端或 CI 日誌中輸出含密鑰環境檔。

## 6. 檢查您的理解

- 哪個 `azure.yaml` 服務部署應用程式？
- 每個您更改的值被消耗於哪個基礎設施參數？
- 哪些更改需要進行佈署，而非僅是部署？
- 選擇的區域與訂閱是否支援模型及配額？
- 所有的設置鉤子是否成功？您能驗證已部署應用的行為嗎？

繼續閱讀 [自訂模板](5-Customize-AI-Template.md)。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->