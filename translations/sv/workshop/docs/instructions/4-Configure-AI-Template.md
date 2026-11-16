# 4. Konfigurera en mall

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Börja med själva mallen

Öppna [`azure.yaml` i Kom igång med AI-agenter](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) i det repository du initierade. Den upstream-mallen kan ändras oberoende av denna workshop. Följande **utdrag** kontrollerades den 4 november 2026; det är inte en ersättning för hela filen:

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

- `name` identifierar AZD-projektet; `metadata.template` registrerar mallversionen.
- `requiredVersions.azd` är mallens minimum, inte en rekommendation att använda en gammal CLI. Använd en aktuell stödd AZD-release.
- `services` definierar applikationsdistributionsmål. Denna mall distribuerar sin Python-API och frontend som en Container Apps-tjänst.
- `project` är relativt till `azure.yaml`.
- `remoteBuild` begär en fjärrkontainerbygge. Din identitet behöver fortfarande nödvändiga Azure-behörigheter.

Mallens Bicep-filer under `infra/`, inte enbart `services`-listan, deklarerar resurser som Microsoft Foundry, modelldistributioner, lagring och valfri AI Search.

## 2. Förstå livscykelhakar

Inspektera `hooks`-sektionen och de refererade skripten innan du kör mallen. Den granskade versionen innehåller:

| Hak | Syfte | Viktigt beteende |
|------|---------|--------------------|
| `preup` | Validera mallens miljöinputs innan `up`-arbetsflödet | Plattformsspecifika shell-skript kan stoppa arbetsflödet vid fel |
| `postdeploy` | Kör mall-specifik uppsättning efter applikationsdistribution | Inspektera `continueOnError` och skriptutdata; en lyckad distribution bevisar inte att alla uppgiftssteg lyckades |

Denna version innehåller **inte** den äldre `postprovision` / `write_env`-haken som visades i tidigare workshopmaterial. Kopiera inte haka-referenser till skript som inte längre finns.

Haknycklar väljer livscykelhändelser; `posix` och `windows` väljer plattformsimplementationer. `shell`, `run`, `interactive` och `continueOnError` styr körning. Det här är exekverbara skript med dina rättigheter, så granska dem på samma sätt som applikationskod.

Se [AZD hooks-dokumentationen](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) för hela livscykeln.

## 3. Spåra miljöinputs till infrastruktur

Kör dessa kommandon från det initierade exempelrytteriet:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspektera `infra/main.parameters.json` för att se vilka miljövariabler mallen faktiskt använder. Att sätta ett godtyckligt namn med `azd env set` ändrar inte automatiskt en Azure-resurs.

Granskade standardvärden inkluderar:

| Input | Standard / syfte |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvot-enheter beror på modell och distributionstyp |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; lämna inaktiverad om inte datapolicy och hantering har granskats |

Dessa är exempelspecifika inputs, inte globala AZD-inställningar. Kontrollera [modell- och regionsstödsdokumentationen](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) och ditt abonnemangs kvot innan du väljer modell, SKU, kapacitet eller plats. Tolk inte varje kapacitetenhet som 1000 token per minut.

För att välja en annan chattmodell, uppdatera dess kompatibla **namn, version, format, SKU och kapacitet tillsammans**, enligt [exemplets anpassningsguide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Att bara ändra namnet kan lämna en inkompatibel version eller distributionstyp.

## 4. Lab: aktivera valfri sökning och spårning

!!! warning "Dessa inställningar kan lägga till avgiftsbelagda resurser"

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

Infrastrukturförändringar kräver försörjning; `azd deploy` distribuerar endast applikationstjänster. För sökindexering och stödda hämtalternativ, följ [AI Search-guiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). För övervakning, följ [observabilitetsguiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Aktivera inte inspelning av prompt-/svars-innehåll på verkliga kunddata utan nödvändigt samtycke, åtkomstkontroller, lagringspolicy och maskering.

## 5. Befintliga resurser och CI/CD

För att återanvända ett Foundry-projekt, följ exempelns [instruktioner för befintlig resurs](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Att sätta `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` ändrar distributionsvägen; i det scenariot skapar mallen inte Application Insights eller AI Search åt dig. Verifiera beroenden, rolltilldelningar och modelldistributioner uttryckligen.

`pipeline.variables`-sektionen kontrollerar värden som skickas in i ett genererat pipeline; det är inte en sekretesshanterare och skapar inga Azure-resurser. Föredra hanterad identitet i appen och OIDC för CI/CD. AZD-miljöfiler är klartext och bör inte checkas in.

AZD stöder import av en betrodd, lokalt förberedd dotenv-fil:

```bash
azd env set --file .env
```

Granska filen innan import, och skriv inte ut miljöfiler som innehåller hemligheter i delade terminaler eller CI-loggar.

## 6. Kontrollera din förståelse

- Vilken `azure.yaml`-tjänst distribuerar applikationen?
- Vilken infrastrukturparameter använder varje värde du ändrade?
- Vilka ändringar kräver försörjning istället för bara distribution?
- Stöddes modellen och kvoten av den valda regionen och prenumerationen?
- Lyckades alla setup-hakar, och kan du verifiera den distribuerade applikationens beteende?

Fortsätt till [Anpassa en mall](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->