# 4. Configureer een sjabloon

!!! tip "AAN HET EINDE VAN DEZE MODULE KUNT U"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Begin met het daadwerkelijke sjabloon

Open de [`azure.yaml` in Begin met AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) in de repository die u hebt geïnitialiseerd. Het upstream-sjabloon kan onafhankelijk van deze workshop veranderen. De volgende **uittreksel** is gecontroleerd op 4 november 2026; het is geen vervanging voor het volledige bestand:

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

- `name` identificeert het AZD-project; `metadata.template` registreert de sjabloonversie.
- `requiredVersions.azd` is de minimumvereiste van het sjabloon, niet een aanbeveling om een oude CLI te gebruiken. Gebruik een actuele ondersteunde AZD-release.
- `services` definieert doelwitten voor applicatie-implementatie. Dit sjabloon implementeert zijn Python API en frontend als één Container Apps-service.
- `project` is relatief ten opzichte van `azure.yaml`.
- `remoteBuild` vereist een externe containerbuild. Uw identiteit heeft nog steeds de benodigde Azure-machtigingen nodig.

De Bicep-bestanden van het sjabloon onder `infra/`, niet alleen de lijst `services`, declareren resources zoals Microsoft Foundry, model-implementaties, opslag en optionele AI Search.

## 2. Begrijp lifecycle hooks

Bekijk de sectie `hooks` en de bijbehorende scripts voordat u het sjabloon uitvoert. De beoordeelde versie bevat:

| Hook | Doel | Belangrijk gedrag |
|------|---------|--------------------|
| `preup` | Valideer invoer van de sjabloonomgeving vóór de `up` workflow | Platformspecifieke shell-scripts kunnen de workflow bij falen stoppen |
| `postdeploy` | Voer sjabloonspecifieke setup uit na applicatie-implementatie | Controleer `continueOnError` en de scriptuitvoer; een geslaagde implementatie bewijst niet dat elke setup-taak gelukt is |

Deze versie bevat **niet** de oudere `postprovision` / `write_env` hook die in vroegere workshopmaterialen werd getoond. Kopieer geen verwijzingen naar hooks voor scripts die niet meer bestaan.

Hook-sleutels selecteren lifecycle-events; `posix` en `windows` selecteren platformimplementaties. `shell`, `run`, `interactive`, en `continueOnError` regelen de uitvoering. Dit zijn uitvoerbare scripts met uw machtigingen, dus bekijk ze net zoals u applicatiecode zou beoordelen.

Raadpleeg de [AZD hooks documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) voor de volledige lifecycle.

## 3. Volg omgevingsinvoer naar infrastructuur

Voer deze opdrachten uit in de geïnitialiseerde voorbeeldrepository:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Bekijk `infra/main.parameters.json` om te zien welke omgevingsvariabelen het sjabloon daadwerkelijk gebruikt. Het instellen van een willekeurige naam met `azd env set` verandert niet automatisch een Azure-resource.

Beoordeelde standaarden zijn onder andere:

| Invoer | Standaard / doel |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; quotameters zijn afhankelijk van het model en het type implementatie |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; laat uitgeschakeld tenzij gegevensverwerking is beoordeeld |

Dit zijn voorbeeld-specifieke invoerwaarden, geen globale AZD-instellingen. Controleer de [documentatie over model- en regio-ondersteuning](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) en het quotum van uw abonnement voordat u een model, SKU, capaciteit of locatie kiest. Interpreteer niet elke capaciteitsunit als 1.000 tokens per minuut.

Om een ander chatmodel te selecteren, werk de compatibele **naam, versie, formaat, SKU en capaciteit samen bij**, volgens de [customisatierichtlijnen van het voorbeeld](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Alleen de naam wijzigen kan leiden tot een incompatibele versie of implementatietype.

## 4. Lab: schakel optionele zoek- en tracering in

!!! warning "Deze instellingen kunnen kostenveroorzakende resources toevoegen"

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

Infrastructuurwijzigingen vereisen provisioning; `azd deploy` alleen implementeert applicatiediensten. Voor zoekindexering en ondersteunde retrieval-opties, volg de [AI Search handleiding](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Voor monitoring, volg de [observeerbaarheidsgids](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Schakel vastlegging van prompt/response-inhoud niet in op echte klantgegevens zonder de benodigde toestemmingen, toegangsbeperkingen, bewaarbeleid en redactie.

## 5. Bestaande resources en CI/CD

Om een Foundry-project opnieuw te gebruiken, volg de [instructies voor bestaande resources](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) van het voorbeeld. Het instellen van `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` wijzigt het implementatiepad; in dat geval maakt het sjabloon geen Application Insights of AI Search voor u aan. Controleer expliciet afhankelijkheden, roltoewijzingen en model-implementaties.

De sectie `pipeline.variables` regelt waarden die in een gegenereerde pipeline worden doorgegeven; het is geen geheimenbeheer en creëert geen Azure-resources. Geef de voorkeur aan beheerde identiteit in de app en OIDC voor CI/CD. AZD-omgevingsbestanden zijn platte tekst en mogen niet worden toegekend in commit.

AZD ondersteunt het importeren van een vertrouwd lokaal voorbereid dotenv-bestand:

```bash
azd env set --file .env
```

Controleer dat bestand voordat u het importeert, en print geen omgevingstabellen met geheimen in gedeelde terminals of CI-logs.

## 6. Controleer uw begrip

- Welke `azure.yaml` service implementeert de applicatie?
- Welke infrastructuurparameter gebruikt iedere waarde die u hebt gewijzigd?
- Welke wijzigingen vereisen provisioning in plaats van slechts implementatie?
- Ondersteunden de geselecteerde regio en het abonnement het model en het quotum?
- Zijn alle setup-hooks geslaagd en kunt u het gedrag van de geïmplementeerde applicatie verifiëren?

Ga verder naar [Configureer een sjabloon](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->