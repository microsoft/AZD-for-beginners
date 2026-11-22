# 4. Konfigea Template

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Star wit di real template

Open di [`azure.yaml` for Get Started wit AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) for di repository wey you don initialize. Di upstream template fit change on e own separate from dis workshop. Di following **excerpt** dem check am for November 4, 2026; e no be replacement for di complete file:

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

- `name` na im dey identify di AZD project; `metadata.template` dey record di template version.
- `requiredVersions.azd` na di template minimum, no be recommendation to still dey use old CLI. Make you use current supported AZD release.
- `services` dey define application deployment targets. Dis template dey deploy im Python API and frontend as one Container Apps service.
- `project` dey relative to `azure.yaml`.
- `remoteBuild` na to request remote container build. Your identity still need di required Azure permissions.

Di template Bicep files under `infra/`, no be only di `services` list dem, dem dey declare resources like Microsoft Foundry, model deployments, storage, and optional AI Search.

## 2. Undastan lifecycle hooks

Inspect di `hooks` section and di scripts e mention before you run di template. Di reviewed version get:

| Hook | Purpose | Important behavior |
|------|---------|--------------------|
| `preup` | Validate template environment inputs before di `up` workflow | Platform-specific shell scripts fit stop di workflow if e fail |
| `postdeploy` | Run template-specific setup after application deployment | Inspect `continueOnError` and di script output; successful deployment no mean all setup tasks finish correct |

Dis version **no** get di old `postprovision` / `write_env` hook wey dem show for earlier workshop material. No copy hook references go scripts wey no dey again.

Hook keys dey select lifecycle events; `posix` and `windows` dey select platform implementations. `shell`, `run`, `interactive`, and `continueOnError` dey control how everything go run. Dem na executable scripts with your permissions, so review am like how you go take review application code.

See di [AZD hooks documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) for complete lifecycle.

## 3. Trace environment inputs into infrastructure

Run these commands for di initialized sample repository:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspect `infra/main.parameters.json` make you see which environment variables di template really dey use. Just to set any name with `azd env set` no mean say e go automatic change Azure resource.

Reviewed defaults dey include:

| Input | Default / purpose |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; quota units dey depend on di model and deployment type |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; leave am disabled unless you don check data handling well well |

Dem na sample-specific inputs, no be global AZD settings. Make you check [model and region support documentation](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) plus your subscription quota before you choose model, SKU, capacity, or location. No make you think say every capacity unit na 1,000 tokens per minute.

To select different chat model, update all di compatible **name, version, format, SKU, and capacity togeder**, follow di [sample customization guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). If you change only di name, e fit still get version or deployment type wey no match.

## 4. Lab: enable optional search and tracing

!!! warning "These settings fit add billable resources"

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

Infrastructure changes need provisioning; `azd deploy` alone no dey deploy application services. For search indexing and supported retrieval options, follow di [AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). For monitoring, follow di [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

No enable prompt/response content capture on real customer data without di correct consent, access controls, retention policy, and redaction.

## 5. Existing resources and CI/CD

To reuse Foundry project, follow di sample's [existing-resource instructions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Setting `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` go change di deployment path; for dat case, di template no go create Application Insights or AI Search for you. Make you verify dependencies, role assignments, and model deployments well.

Di `pipeline.variables` section dey control values wey dem dey pass into generated pipeline; e no be secret store and e no dey create Azure resources. E better make you use managed identity for di app and OIDC for CI/CD. AZD environment files na plaintext so no make you commit am.

AZD fit import trusted, local prepared dotenv file:

```bash
azd env set --file .env
```

Review di file before you import am, and no print secret-containing environment files for shared terminals or CI logs.

## 6. Check your understanding

- Which `azure.yaml` service dey deploy di application?
- Which infrastructure parameter dey consume each value wey you change?
- Which changes need provisioning no be only deployment?
- Di selected region and subscription support di model and quota?
- All di setup hooks succeed, and you fit verify di deployed application's behavior?

Continue to [Customize a Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->