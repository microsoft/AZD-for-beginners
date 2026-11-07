# 4. 配置模板

!!! tip "完成本模块后，您将能够"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. 从实际模板开始

打开您初始化的仓库中的[`azure.yaml`，见“开始使用 AI 代理”章节](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml)。上游模板可能会独立于此工作坊而更新。以下<strong>摘录</strong>于2026年11月4日审核；它不能替代完整的文件：

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

- `name` 标识 AZD 项目；`metadata.template` 记录模板版本。
- `requiredVersions.azd` 是模板的最低要求，不是建议使用旧版 CLI。请使用当前支持的 AZD 版本。
- `services` 定义应用部署目标。此模板将其 Python API 和前端部署为一个容器应用服务。
- `project` 是相对于 `azure.yaml` 的路径。
- `remoteBuild` 请求远程容器构建。您的身份仍然需要具备所需的 Azure 权限。

模板的 Bicep 文件位于 `infra/` 下，而不仅是 `services` 列表声明资源，如 Microsoft Foundry、模型部署、存储和可选的 AI 搜索。

## 2. 理解生命周期钩子

在运行模板前，请检查 `hooks` 部分及其引用的脚本。审核版本包含：

| 钩子 | 目的 | 重要行为 |
|------|---------|--------------------|
| `preup` | 在 `up` 工作流开始前验证模板环境输入 | 平台特定的 shell 脚本失败时可终止工作流 |
| `postdeploy` | 应用部署后运行模板特定的配置 | 检查 `continueOnError` 和脚本输出；成功部署不代表所有配置任务均成功 |

此版本<strong>不包含</strong>早期工作坊材料中的旧 `postprovision` / `write_env` 钩子。不要复制指向已不存在脚本的钩子引用。

钩子键选择生命周期事件；`posix` 和 `windows` 选择平台实现。`shell`、`run`、`interactive` 和 `continueOnError` 控制执行。这些是具有您权限的可执行脚本，因此请像审查应用代码一样审查它们。

有关完整生命周期，请参阅[AZD 钩子文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility)。

## 3. 将环境输入追踪到基础设施

从初始化的示例仓库运行以下命令：

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

查看 `infra/main.parameters.json`，了解模板实际使用了哪些环境变量。使用 `azd env set` 设置任意名称不会自动更改 Azure 资源。

审核的默认值包括：

| 输入 | 默认值 / 用途 |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`；配额单位取决于模型和部署类型 |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`；除非经过数据处理审查，否则保持禁用状态 |

这些是示例特定输入，不是全局 AZD 设置。选择模型、SKU、容量或区域前，请查看[模型和区域支持文档](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support)和您的订阅配额。不要把每个容量单位都理解为每分钟1000个令牌。

若需选择其他聊天模型，请<strong>同时更新</strong>其兼容的名称、版本、格式、SKU 和容量，详见[示例的自定义指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md)。单独更改名称可能导致版本或部署类型不兼容。

## 4. 实验：启用可选搜索和追踪

!!! warning "这些设置可能添加计费资源"

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

基础设施更改需要预配；仅 `azd deploy` 只会部署应用服务。有关搜索索引和支持的检索选项，请遵循[AI 搜索指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md)。有关监控，请遵循[可观察性指南](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md)。

未经相关同意、访问控制、保留策略和脱敏，不要在真实客户数据上启用提示/响应内容捕获。

## 5. 现有资源和 CI/CD

若要重用 Foundry 项目，请遵循示例的[现有资源说明](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources)。设置 `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` 会改变部署路径；在此情况下，模板不会为您创建 Application Insights 或 AI 搜索。请显式验证依赖项、角色分配和模型部署。

`pipeline.variables` 部分控制传入生成流水线的值；它不是秘密存储，也不创建 Azure 资源。应用中优先使用托管身份，CI/CD 优先使用 OIDC。AZD 环境文件为明文，不应提交。

AZD 支持导入可信的、本地准备的 dotenv 文件：

```bash
azd env set --file .env
```

导入前请审查该文件，且不要在共享终端或 CI 日志中打印包含密钥的环境文件。

## 6. 检查理解

- 哪个 `azure.yaml` 服务部署了应用？
- 每个更改的值被哪个基础设施参数使用？
- 哪些更改需要重新预配，而不仅仅是重新部署？
- 选择的区域和订阅是否支持该模型和配额？
- 所有设置钩子都成功了吗？您能验证部署应用的行为吗？

继续前往[自定义模板](5-Customize-AI-Template.md)。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->