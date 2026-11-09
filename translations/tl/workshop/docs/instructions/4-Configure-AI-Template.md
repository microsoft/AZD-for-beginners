# 4. I-configure ang isang Template

!!! tip "SA WAKAS NG MODULONG ITO MAAARI MONG"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Simulan sa aktwal na template

Buksan ang [`azure.yaml` sa Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) sa repository na iyong inisyalisa. Ang upstream template ay maaaring magbago nang independyente mula sa workshop na ito. Ang sumusunod na **excerpt** ay na-check noong Nobyembre 4, 2026; hindi ito kapalit ng kumpletong file:

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

- `name` ay nagtutukoy sa AZD project; `metadata.template` ay nagtatala ng bersyon ng template.
- `requiredVersions.azd` ay ang minimum ng template, hindi isang rekomendasyon na manatili sa lumang CLI. Gumamit ng kasalukuyang suportadong AZD release.
- `services` ang nagtatakda ng mga deployment target ng aplikasyon. Ang template na ito ay nagdi-deploy ng Python API at frontend bilang isang Container Apps service.
- `project` ay relative sa `azure.yaml`.
- `remoteBuild` ay humihiling ng remote container build. Kailangan pa rin ng iyong pagkakakilanlan ng mga kinakailangang Azure permissions.

Ang mga Bicep files ng template sa ilalim ng `infra/`, hindi lamang ang listahan ng `services`, ang nagdedeklara ng mga resources gaya ng Microsoft Foundry, model deployments, storage, at opsyonal na AI Search.

## 2. Unawain ang lifecycle hooks

Suriin ang seksyon na `hooks` at ang mga tinutukoy nitong scripts bago patakbuhin ang template. Ang nirepasong bersyon ay naglalaman ng:

| Hook | Layunin | Mahalagang pag-uugali |
|------|---------|--------------------|
| `preup` | I-validate ang mga environment inputs ng template bago ang `up` workflow | Ang platform-specific shell scripts ay maaaring itigil ang workflow kapag nabigo |
| `postdeploy` | Patakbuhin ang template-specific setup pagkatapos ng application deployment | Suriin ang `continueOnError` at ang output ng script; ang matagumpay na deployment ay hindi patunay na nagtagumpay ang lahat ng setup task |

Ang bersyong ito ay **hindi** naglalaman ng mas lumang `postprovision` / `write_env` hook na ipinakita sa naunang materyal ng workshop. Huwag kopyahin ang hook references sa mga script na wala na.

Pinipili ng mga hook key ang lifecycle events; `posix` at `windows` ay pumipili ng platform implementations. `shell`, `run`, `interactive`, at `continueOnError` ay kumokontrol sa pagpapatupad. Mga executable scripts ito na may iyong mga permiso, kaya suriin ang mga ito tulad ng pagsusuri mo ng application code.

Tingnan ang [AZD hooks documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) para sa buong lifecycle.

## 3. Sundan ang environment inputs patungo sa infrastructure

Patakbuhin ang mga utos na ito mula sa na-initialize na sample repository:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Suriin ang `infra/main.parameters.json` upang makita kung alin sa mga environment variables ang tunay na ginagamit ng template. Ang pagseset ng arbitrary na pangalan gamit ang `azd env set` ay hindi awtomatikong nagbabago ng Azure resource.

Kasama sa nirepasong mga default ang:

| Input | Default / layunin |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; ang quota units ay nakadepende sa modelo at uri ng deployment |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; iwanang naka-disable maliban kung na-review na ang data handling |

Ito ay mga input na specific sa sample, hindi mga global na settings ng AZD. Suriin ang [model at region support documentation](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) at ang quota ng iyong subscription bago pumili ng modelo, SKU, kapasidad, o lokasyon. Huwag ipakahulugan na bawat kapasidad unit ay katumbas ng 1,000 tokens kada minuto.

Upang pumili ng ibang chat model, i-update nang magkasama ang compatible na **pangalan, bersyon, format, SKU, at kapasidad**, ayon sa [sample's customization guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Ang pagbabago lamang ng pangalan ay maaaring mag-iwan ng hindi compatible na bersyon o uri ng deployment.

## 4. Lab: paganahin ang opsyonal na search at tracing

!!! warning "Ang mga setting na ito ay maaaring magdagdag ng mga billable resources"

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

Nangangailangan ng provisioning ang mga pagbabago sa infrastructure; ang `azd deploy` lamang ay nagdi-deploy lang ng application services. Para sa search indexing at mga suportadong retrieval options, sundin ang [AI Search guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Para sa monitoring, sundin ang [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Huwag paganahin ang prompt/response content capture sa totoong data ng customer nang walang kinakailangang consent, kontrol sa access, patakaran sa retention, at redaction.

## 5. Mga umiiral na resources at CI/CD

Upang gamitin muli ang Foundry project, sundin ang [existing-resource instructions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) ng sample. Ang pagseset ng `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` ay nagbabago ng deployment path; sa ganitong sitwasyon, ang template ay hindi naglilikha ng Application Insights o AI Search para sa iyo. Siguraduhing suriin nang malinaw ang dependencies, role assignments, at model deployments.

Ang seksyon na `pipeline.variables` ay kumokontrol sa mga halagang ipinapasa sa nagawang pipeline; hindi ito isang secret store at hindi lumilikha ng Azure resources. Mas gusto ang managed identity sa app at OIDC para sa CI/CD. Ang mga AZD environment files ay plaintext at hindi dapat i-commit.

Sinusuportahan ng AZD ang pag-import ng pinagkakatiwalaang, lokal na inihandang dotenv file:

```bash
azd env set --file .env
```

Suriin muna ang file bago i-import, at huwag ipakita ang mga environment files na may laman na sikrito sa mga shared terminals o CI logs.

## 6. Suriin ang iyong pag-unawa

- Aling `azure.yaml` service ang nagde-deploy ng aplikasyon?
- Aling parameter ng infrastructure ang kumokonsumo sa bawat halagang binago mo?
- Aling mga pagbabago ang nangangailangan ng provisioning at hindi lang deployment?
- Sinusuportahan ba ng napiling rehiyon at subscription ang modelo at quota?
- Nagtagumpay ba ang lahat ng mga setup hook, at maaari mo bang beripikahin ang ugali ng na-deploy na aplikasyon?

Magpatuloy sa [Customize a Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->