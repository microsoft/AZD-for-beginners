# 4. Configure a Template

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Start with the actual template

Open the [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) in the repository you initialized. The upstream template can change independently of this workshop. The following **excerpt** was checked on November 4, 2026; it is not a replacement for the complete file:

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

- `name` identifies the AZD project; `metadata.template` records the template version.
- `requiredVersions.azd` is the template's minimum, not a recommendation to stay on an old CLI. Use a current supported AZD release.
- `services` defines application deployment targets. This template deploys its Python API and frontend as one Container Apps service.
- `project` is relative to `azure.yaml`.
- `remoteBuild` requests a remote container build. Your identity still needs the required Azure permissions.

The template's Bicep files under `infra/`, not the `services` list alone, declare resources such as Microsoft Foundry, model deployments, storage, and optional AI Search.

## 2. Understand lifecycle hooks

Inspect the `hooks` section and its referenced scripts before running the template. The reviewed version contains:

| Hook | Purpose | Important behavior |
|------|---------|--------------------|
| `preup` | Validate template environment inputs before the `up` workflow | Platform-specific shell scripts can stop the workflow on failure |
| `postdeploy` | Run template-specific setup after application deployment | Inspect `continueOnError` and the script output; a successful deployment does not prove every setup task succeeded |

This version does **not** contain the older `postprovision` / `write_env` hook shown in earlier workshop material. Do not copy hook references to scripts that no longer exist.

Hook keys select lifecycle events; `posix` and `windows` select platform implementations. `shell`, `run`, `interactive`, and `continueOnError` control execution. These are executable scripts with your permissions, so review them just as you would application code.

See the [AZD hooks documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) for the complete lifecycle.

## 3. Trace environment inputs into infrastructure

Run these commands from the initialized sample repository:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspect `infra/main.parameters.json` to see which environment variables the template actually consumes. Setting an arbitrary name with `azd env set` does not automatically change an Azure resource.

Reviewed defaults include:

| Input | Default / purpose |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; quota units depend on the model and deployment type |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; leave disabled unless data handling has been reviewed |

These are sample-specific inputs, not global AZD settings. Check the [model and region support documentation](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) and your subscription's quota before choosing a model, SKU, capacity, or location. Do not interpret every capacity unit as 1,000 tokens per minute.

To select a different chat model, update its compatible **name, version, format, SKU, and capacity together**, following the [sample's customization guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Changing only the name can leave an incompatible version or deployment type.

## 4. Lab: enable optional search and tracing

!!! warning "These settings can add billable resources"

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

Infrastructure changes need provisioning; `azd deploy` alone only deploys application services. For search indexing and supported retrieval options, follow the [AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). For monitoring, follow the [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Do not enable prompt/response content capture on real customer data without the required consent, access controls, retention policy, and redaction.

## 5. Existing resources and CI/CD

To reuse a Foundry project, follow the sample's [existing-resource instructions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Setting `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` changes the deployment path; in that scenario, the template does not create Application Insights or AI Search for you. Verify dependencies, role assignments, and model deployments explicitly.

The `pipeline.variables` section controls values passed into a generated pipeline; it is not a secret store and does not create Azure resources. Prefer managed identity in the app and OIDC for CI/CD. AZD environment files are plaintext and should not be committed.

AZD supports importing a trusted, locally prepared dotenv file:

```bash
azd env set --file .env
```

Review that file before importing it, and do not print secret-containing environment files in shared terminals or CI logs.

## 6. Check your understanding

- Which `azure.yaml` service deploys the application?
- Which infrastructure parameter consumes each value you changed?
- Which changes require provisioning rather than only deployment?
- Did the selected region and subscription support the model and quota?
- Did all setup hooks succeed, and can you verify the deployed application's behavior?

Continue to [Customize a Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->