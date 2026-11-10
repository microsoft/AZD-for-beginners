# 4. ಟೆಂಪ್ಲೇಟ್ ಸಂರಚಿಸಿ

!!! tip "ಈ ಮೊದಲಿನ ಅಧ್ಯಾಯದ ಕೊನೆಯಲ್ಲಿ ನೀವು ಸಾಧ್ಯವಾಗುವುದು"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. ನಿಜವಾದ ಟೆಂಪ್ಲೇಟ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ

ನೀವು ಪ್ರಾರಂಭಿಸಿದ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ [`azure.yaml` ಅನ್ನು Get Started with AI Agents ನಲ್ಲಿ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) ತೆರೆಯಿರಿ. ಮೇಲ್ಭಾಗದ ಟೆಂಪ್ಲೇಟ್ ಈ ಕಾರ್ಯಾಗಾರದಿಂದ ಪ್ರತ್ಯೇಕವಾಗಿ ಬದಲಾಗಬಹುದು. ಕೆಳಗಿನ **ಉದಾಹರಣೆ** ನವೆಂಬರ್ 4, 2026 ರಂದು ಪರಿಶೀಲಿಸಲಾಗಿದೆ; ಇದು ಪೂರ್ಣ ಫೈಲ್‌ಗೆ ಬದಲಿ ಅಲ್ಲ:

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

- `name` AZD ಯೋಜನೆಯನ್ನು ಸೂಚಿಸುತ್ತದೆ; `metadata.template` ಟೆಂಪ್ಲೇಟ್ ಆವೃತ್ತಿಯನ್ನು ದಾಖಲಿಸುತ್ತದೆ.
- `requiredVersions.azd` ಟೆಂಪ್ಲೇಟ್ ಕನಿಷ್ಟ ಮಟ್ಟ, ಹಳೆಯ CLI ಮೇಲೆ ಉಳಿಯಲು ಶಿಫಾರಸು ಅಲ್ಲ. ಪ್ರಸ್ತುತ ಬೆಂಬಲಿತ AZD ಬಿಡುಗಡೆ ಬಳಸಿ.
- `services` ಆಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಗುರಿಗಳನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ. ಈ ಟೆಂಪ್ಲೇಟ್ ತನ್ನ Python API ಮತ್ತು ಮುಂಭಾಗವನ್ನು ಒಂದು Container Apps ಸೇವೆಯಾಗಿ ನಿಯೋಜಿಸುತ್ತದೆ.
- `project` `azure.yaml` ಗೆ ಸಂಬಂಧಿತ.
- `remoteBuild` ದೂರಸ್ಥ ಕಂಟೈನರ್ ನಿರ್ಮಾಣವನ್ನು ವಿನಂತಿಸುತ್ತದೆ. ನಿಮ್ಮ ಅನ್ವಯಿಕತೆಗೆ ಅಗತ್ಯವಾದ ಅಜೂರ್ ಅನುಮತಿಗಳು ಇನ್ನೂ ಬೇಕಾಗಿವೆ.

`infra/` ಅಡಿಯಲ್ಲಿ ಟೆಂಪ್ಲೇಟಿನ Bicep ಫೈಲ್ಗಳು, `services` ಪಟ್ಟಿ ಮಾತ್ರವಲ್ಲ, Microsoft Foundry, ಮಾದರಿ ನಿಯೋಜನೆಗಳು, ಸಂಗ್ರಹಣೆ ಮತ್ತು ಐಚ್ಛಿಕ AI Search ಮುಂತಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಘೋಷಿಸುತ್ತವೆ.

## 2. ಜೀವಚಕ್ರ ಕೂಕ್ಗಳು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

ಟೆಂಪ್ಲೇಟು ಚಲಾಯಿಸುವ ಮೊದಲು `hooks` ವಿಭಾಗ ಮತ್ತು ಇದರ ಉಲ್ಲೇಖಿತ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ. ಪರಿಶೀಲಿಸಿದ ಆವೃತ್ತಿಯಲ್ಲಿ ಇವುಗಳಿವೆ:

| ಕೂಕು | ಉದ್ದೇಶ | ಪ್ರಮುಖ ವರ್ತನೆ |
|------|---------|--------------------|
| `preup` | `up` ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಿಂತ ಮುಂಚೆ ಟೆಂಪ್ಲೇಟ್ ಪರಿಸರ ಇನ್‌ಪುಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ | ಪ್ಲಾಟ್‌ಫಾರಂ-ನಿರ್ದಿಷ್ಟ ಶೆಲ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ವೈಫಲ್ಯದಲ್ಲಿ ಕಾರ್ಯಪ್ರವಾಹ ನಿಲ್ಲಿಸಬಹುದು |
| `postdeploy` | ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಯ ನಂತರ ಟೆಂಪ್ಲೇಟ್-ನಿರ್ದಿಷ್ಟ ಸೆಟಪ್ ನಡೆಸಿ | `continueOnError` ಮತ್ತು ಸ್ಕ್ರಿಪ್ಟ್ ಔಟ್‌ಪುಟ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ; ಯಶಸ್ವಿ ನಿಯೋಜನೆ ಎಲ್ಲ ಸೆಟಪ್ ಕಾರ್ಯಗಳು ಯಶಸ್ವಿಯಾಗಿವೆ ಎಂದು ವಾದಿಸುವುದು ಅಲ್ಲ |

ಈ ಸಂಸ್ಕರಣೆಯಲ್ಲಿ **ಹಳೆಯ** `postprovision` / `write_env` ಹುಕ್ ಇರುವುದು ಇಲ್ಲ, ಹಳೆಯ ಕಾರ್ಯಾಗಾರದ ಸಾಮಗ್ರಿಯಲ್ಲಿ ತೋರಿಸಿರುವುದು. ಈಗ ಯಾವುದೇ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳಲ್ಲಿ ಇರುವ ಹುಕ್ ಉಲ್ಲೇಖಗಳನ್ನು ನಕಲಿಸುವುದಿಲ್ಲ.

ಹುಕ್ ಕೀಲಿಗಳು ಜೀವನಚಕ್ರ ಘಟನೆಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡುತ್ತವೆ; `posix` ಮತ್ತು `windows` ವೇದಿಕೆ ಆಮ್ಲೇಜನಗಳನ್ನು ಆಯ್ಕೆಮಾಡುತ್ತವೆ. `shell`, `run`, `interactive`, ಮತ್ತು `continueOnError` ನಿರ್ವಹಣೆ ನಡೆಸುತ್ತಾರೆ. ಇವು ನಿಮ್ಮ ಅನುಮತಿಗಳೊಂದಿಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳಾಗಿವೆ, ಆದ್ದರಿಂದ ಅವುಗಳನ್ನು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್‌ಗಳಂತೆ ಪರಿಶೀಲಿಸಿ.

ಸಂಪೂರ್ಣ ಜೀವಚಕ್ರಕ್ಕಾಗಿ [AZD ಹುಕ್‌ಗಳ ದಾಖಲೆ](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) ನೋಡಿ.

## 3. ಪರಿಸರ ಇನ್‌ಪುಟ್‌ಗಳನ್ನು ಮೂಲಸೌಕರ್ಯದಲ್ಲಿ ಕಂಡುಹಿಡಿಯಿರಿ

ಹೀಗಿನ ಆರ್‌ಎಸ್ಸು ಸಂಗ್ರಹದಿಂದ ಈ ಆಜ್ಞೆಗಳನ್ನು ಚಲಾಯಿಸಿ:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

ಟೆಂಪ್ಲೇಟ್ ಯಾವ ಪರಿಸರ ಚರಗಳನ್ನು ಬಳಕೆ ಮಾಡುತ್ತದೆ ಎಂದು ನೋಡಲು `infra/main.parameters.json` ಪರಿಶೀಲಿಸಿ. `azd env set` ಜೊತೆಗೆ ಯಾವುದೇ ಯಾದೃಚ್ಛಿಕ ಹೆಸರನ್ನು ನಿಗದಿಪಡಿಸುವುದು ಸ್ವತಃ ಆಜರ್ ಸಂಪನ್ಮೂಲವನ್ನು ಬದಲಾಯಿಸುವುದಿಲ್ಲ.

ಪರಿಶೀಲಿಸಿದ ಡೀಫಾಲ್ಟ್‌ಗಳಿಗೆ ಸೇರಿವೆ:

| ಇನ್‌ಪುಟ್ | ಡೀಫಾಲ್ಟ್ / ಉದ್ದೇಶ |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; ಸಂಖ್ಯಾಪ್ರಮಾಣಕ ಘಟಕಗಳು ಮಾದರಿ ಮತ್ತು ಜಾಗೃತಪಡಿಸುವ ವಿಧಾನದ ಮೇಲೆ ಅವಲಂಬಿತವಾಗಿವೆ |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; ಡೇಟಾ ನಿರ್ವಹಣೆಯನ್ನು ಪರಿಶೀಲಿಸಿದ್ದರೆ ಮಾತ್ರ ಅಟೋ ನಡೆಸಿಕೊಳ್ಳದಿರಿ |

ಇವು ಮಾದರಿ-ವಿಶಿಷ್ಟ ಇನ್‌ಪುಟ್‌ಗಳು, ಜಾಗತಿಕ AZD ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಅಲ್ಲ. ಮಾದರಿ, SKU, ಸಾಮರ್ಥ್ಯ ಅಥವಾ ಸ್ಥಳವನ್ನು ಆಯ್ಕೆಮಾಡುವುದರ ಮೊದಲು [ಮಾದರಿ ಮತ್ತು ಪ್ರದೇಶ ಬೆಂಬಲದ ಡಾಕ್ಯುಮೆಂಟ್‌](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) ಮತ್ತು ನಿಮ್ಮ ಚಂದಾದಾರರ ಕ್ವೋಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ. ಪ್ರತಿ ಸಾಮರ್ಥ್ಯ ಘಟಕವನ್ನು ಪ್ರತಿ ನಿಮಿಷಕ್ಕೆ 1,000 ಟೋಕನ್ ಎಂದು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಡಿ.

ಬೇರೆ ಚಾಟ್ ಮಾದರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಲು, ಅದರ ಹೊಂದಾಣಿಕೆಯ **ಹೆಸರು, ಆವೃತ್ತಿ, ಸ್ವರೂಪ, SKU, ಮತ್ತು ಸಾಮರ್ಥ್ಯವನ್ನು ಒಟ್ಟಿಗೆ** ನವೀಕರಿಸಿ, [ನಮೂನೆಯ ಕಸ್ಟಮೈಜೆಷನ್ ಮಾರ್ಗದರ್ಶಿ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md) ಅನ್ನು ಅನುಸರಿಸಿ. ಕೇವలం ಹೆಸರನ್ನು ಮಾತ್ರ ಬದಲಾಯಿಸಿದರೆ ಅಸಂಗತ ಆವೃತ್ತಿ ಅಥವಾ ನಿಯೋಜನಾ ಪ್ರಕಾರ ಉಳಿದಿರಬಹುದು.

## 4. ಪ್ರಯೋಗಾಗಾರ: ಆಯ್ಕೆಮಾಡಬಹುದಾದ ಹುಡುಕಾಟ ಮತ್ತು ಟ್ರೇಸಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ

!!! warning "ಈ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಬಿಲ್ ಮಾಡಬಹುದಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸೇರ್ಪಡೆ ಮಾಡಬಹುದು"

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

ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳಿಗೆ ಪ್ರೊವಿಷನಿಂಗ್ ಅಗತ್ಯವಿದೆ; `azd deploy` ಮಾತ್ರ ಅಪ್ಲಿಕೇಶನ್ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ. ಹುಡುಕಾಟ ಸೂಚ್ಯಂಕ ಮತ್ತು ಬೆಂಬಲಿತ ಪ್ರಾಪ್ತಿ ಆಯ್ಕೆಯಿಗಾಗಿ [AI ಹುಡುಕಾಟ ಮಾರ್ಗದರ್ಶಿ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) ಅನ್ನು ಅನುಸರಿಸಿ. ಮೇಲ್ವಿಚಾರಣೆಗೆ, [ಪ್ರತ್ಬಂದನೀಯತೆ ಮಾರ್ಗದರ್ಶಿ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) ಅನ್ನು ಅನುಸರಿಸಿ.

ಅಗತ್ಯ ಅನುಮತಿ, ಪ್ರವೇಶ ನಿಯಂತ್ರಣ, ಸಂರಕ್ಷಣೆ ನೀತಿ, ಮತ್ತು ರೆಡಕ್ಷನ್ ಇಲ್ಲದೆ ನಿಜವಾದ ಗ್ರಾಹಕ ಡೇಟಾದ ಮೇಲೆ ಪ್ರಾಂಪ್ಟ್/ಪ್ರತಿಕ್ರಿಯೆ ವಿಷಯವನ್ನು ಸೆರೆಹಿಡಿಯಬೇಡಿ.

## 5. ಇದ್ದುಬಂದಿರುವ ಸಂಪನ್ಮೂಲಗಳು ಮತ್ತು CI/CD

ಫೌಂಡರಿ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪುನರ್ವಳಿಸಲು, ಮಾದರಿಯ [ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಸಂಪನ್ಮೂಲ ಸೂಚನೆಗಳು](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) ಅನ್ನು ಅನುಸರಿಸಿ. `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` ಅನ್ನು ಹೊಂದಿಸುವುದು ನಿಯೋಜನಾ ಮಾರ್ಗವನ್ನು ಬದಲಾಯಿಸುತ್ತದೆ; ಆ ಸಂದರ್ಭದಲ್ಲಿ, ಟೆಂಪ್ಲೇಟು ನಿಮಗಾಗಿ ಆಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಅಥವಾ AI ಹುಡುಕಾಟವನ್ನು ಸೃಷ್ಟಿಸುವುದಿಲ್ಲ. ಅವಲಂಬನೆಗಳು, ಪಾತ್ರ ನಿಯೋಗಗಳು, ಮತ್ತು ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ಸ್ಪಷ್ಟವಾಗಿ ಪರಿಶೀಲಿಸಿ.

ಜನರೇಟ್ ಮಾಡಲಾದ ಪೈಪ್ಲೈನ್‌ಗೆ ನೀಡಲ್ಪಡುವ ಮೌಲ್ಯಗಳನ್ನು `pipeline.variables` ವಿಭಾಗ ನಿಯಂತ್ರಿಸುತ್ತದೆ; ಇದು ರಹಸ್ಯ ಸಂಗ್ರಹಸ್ಥಳವಲ್ಲ ಮತ್ತು ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುವುದಿಲ್ಲ. ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ನಿರ್ವಹಿಸಲ್ಪಟ್ಟ ಗುರುತಿನ身份 ಮತ್ತು CI/CD ಗಾಗಿ OIDC ಅನ್ನು ಆದ್ಯತೆ ನೀಡಿ. AZD ಪರಿಸರ ಫೈಲ್‌ಗಳು ಪ್ಲೇನ್ಟೆಕ್ಸ್ಟ್ ಆಗಿದ್ದು, ಅವುಗಳನ್ನು ಸಮರ್ಪಕವಾಗಿ ನಿಬಂಧಿಸಬಾರದು.

AZD ವಿಶ್ವಾಸಾರ್ಹ, ಸ್ಥಳೀಯವಾಗಿ ತಯಾರಿಸಿದ dotenv ಫೈಲನ್ನು ಆಮದು ಮಾಡಲು ಬೆಂಬಲಿಸುತ್ತದೆ:

```bash
azd env set --file .env
```

ಆ ಫೈಲ್ ಅನ್ನು ಆಮದುಗೊಳಿಸುವ ಮೊದಲು ಪರಿಶೀಲಿಸಿ, ಮತ್ತು ರಹಸ್ಯವನ್ನು ಒಳಗೊಂಡಿರುವ ಪರಿಸರ ಫೈಲ್‌ಗಳನ್ನು ಹಂಚಿಕೆ ಮಾಡಲಾದ ಟರ್ಮಿನಲ್ಗಳು ಅಥವಾ CI ಲಾಗ್‌ಗಳಲ್ಲಿ ಮುದ್ರಿಸಬೇಡಿ.

## 6. ನಿಮ್ಮ ಗ್ರಹಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ

- ಯಾವ `azure.yaml` ಸೇವೆ ಅಪ್ಲಿಕೇಶನನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ?
- ನೀವು ಬದಲಾವಣೆ ಮಾಡಿದ ಪ್ರತಿ ಮೌಲ್ಯವನ್ನು ಯಾವ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಷರ್ ಪ್ಯಾರಾಮೀಟರ್ ಉಪಯೋಗಿಸುತ್ತದೆ?
- ಯಾವ ಬದಲಾವಣೆಗಳಿಗೆ ಕೇವಲ ನಿಯೋಜನೆಯಲ್ಲದೆ ವ್ಯವಸ್ಥಾಪನೆ ಅಗತ್ಯವಿದೆ?
- ಆಯ್ಕೆಮಾಡಲಾದ ಪ್ರದೇಶ ಮತ್ತು ಚಂದಾದಾರಿಕೆ ಮಾದರಿ ಮತ್ತು ಕೋಟಾವನ್ನು ಬೆಂಬಲಿಸತಕ್ಕದೆಯೇ?
- ಎಲ್ಲಾ ಸೆಟ್‌ಅಪ್ ಹೂಕಳು ಯಶಸ್ವಿಯಾಯಿತೇ, ಮತ್ತು ನಿಯೋಜಿಸಲಾದ ಅಪ್ಲಿಕೇಶನಿನ ವರ್ತನೆಯನ್ನು ನೀವು ದೃಢೀಕರಿಸಬಹುದೇ?

ಮುಂದುವರಿದು [ಟೆಂಪ್ಲೆಟ್ ಅನ್ನು ಹೊಂದಿಸಿ](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->