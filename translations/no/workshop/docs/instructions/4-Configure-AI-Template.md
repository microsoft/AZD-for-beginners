# 4. Konfigurer en mal

!!! tip "VED SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Start med selve malen

Åpne [`azure.yaml` i Kom i gang med AI-agenter](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) i depotet du opprettet. Den opprinnelige malen kan endres uavhengig av denne workshopen. Følgende **utdrag** ble sjekket 4. november 2026; det er ikke en erstatning for den komplette filen:

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

- `name` identifiserer AZD-prosjektet; `metadata.template` registrerer malversjonen.
- `requiredVersions.azd` er malens minimum, ikke en anbefaling om å bruke en gammel CLI. Bruk en nåværende støttet AZD-utgivelse.
- `services` definerer distribusjonsmål for applikasjonen. Denne malen distribuerer sin Python API og frontend som én Container Apps-tjeneste.
- `project` er relativ til `azure.yaml`.
- `remoteBuild` ber om en ekstern containerbygging. Din identitet må fortsatt ha nødvendige Azure-tillatelser.

Malens Bicep-filer under `infra/`, ikke bare listen `services` alene, deklarerer ressurser som Microsoft Foundry, modell-distribusjoner, lagring og valgbar AI-søk.

## 2. Forstå livssyklus-hooks

Undersøk `hooks`-seksjonen og dens refererte skript før du kjører malen. Den gjennomgåtte versjonen inneholder:

| Hook | Formål | Viktig oppførsel |
|------|---------|--------------------|
| `preup` | Validerer malens miljøinnspill før `up`-arbeidsflyten | Plattformspesifikke shell-skript kan stoppe arbeidsflyten ved feil |
| `postdeploy` | Kjører malspesifikke oppsett etter applikasjonsdistribusjon | Undersøk `continueOnError` og scriptutgangen; en vellykket distribusjon beviser ikke at alle oppgaveskripter fullførte |

Denne versjonen inneholder **ikke** den eldre `postprovision` / `write_env`-hook som vises i tidligere workshop-materiale. Ikke kopier hook-referanser til skript som ikke lenger eksisterer.

Hook-nøkler velger livssyklus-hendelser; `posix` og `windows` velger plattformimplementasjoner. `shell`, `run`, `interactive`, og `continueOnError` kontrollerer kjøringen. Disse er kjørbare skript med dine tillatelser, så gjennomgå dem som du ville gjort med applikasjonskode.

Se [AZD hooks dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) for hele livssyklusen.

## 3. Spor miljøinnspill inn i infrastrukturen

Kjør disse kommandoene fra det initierte eksempel-depotet:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Undersøk `infra/main.parameters.json` for å se hvilke miljøvariabler malen faktisk bruker. Å sette et vilkårlig navn med `azd env set` endrer ikke automatisk en Azure-ressurs.

Gjennomgåtte standardverdier inkluderer:

| Inndata | Standard / formål |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvoteenheter avhenger av modellen og distribusjonstype |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; la være deaktivert med mindre databehandling er gjennomgått |

Dette er eksemplerelaterte innspill, ikke globale AZD-innstillinger. Sjekk [modell- og regionsstøttedokumentasjonen](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) og abonnementets kvote før du velger modell, SKU, kapasitet eller lokasjon. Tolke ikke hver kapasitetenhet som 1 000 tokens per minutt.

For å velge en annen chatte-modell, oppdater dens kompatible **navn, versjon, format, SKU og kapasitet sammen**, i henhold til [eksempelets tilpasningsguide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Bare å endre navnet kan føre til en inkompatibel versjon eller distribusjonstype.

## 4. Lab: aktiver valgbar søk og sporing

!!! warning "Disse innstillingene kan legge til fakturerbare ressurser"

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

Infrastrukturendringer krever provisjonering; kun `azd deploy` distribuerer applikasjonstjenester. For søkeindeksering og støttede gjenopprettingsalternativer, følg [AI Search-guiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). For overvåkning, følg [observability-guiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Ikke aktiver innsamling av prompt-/responsinnhold på ekte kundedata uten nødvendig samtykke, tilgangskontroller, lagringspolicy og sensur.

## 5. Eksisterende ressurser og CI/CD

For å gjenbruke et Foundry-prosjekt, følg eksempelets [instruksjoner for eksisterende ressurser](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Å sette `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` endrer distribusjonsbanen; i det tilfellet oppretter ikke malen Application Insights eller AI Search for deg. Verifiser avhengigheter, rolleoppdrag og modell-distribusjoner eksplisitt.

`pipeline.variables`-seksjonen kontrollerer verdiene som sendes inn i en generert pipeline; det er ikke en hemmelig-lagring og oppretter ikke Azure-ressurser. Foretrekk administrert identitet i appen og OIDC for CI/CD. AZD-miljøfiler er vanlig tekst og bør ikke sjekkes inn.

AZD støtter import av en pålitelig, lokalt forberedt dotenv-fil:

```bash
azd env set --file .env
```

Gå gjennom den filen før import, og ikke skriv ut hemmelighetsfylte miljøfiler i delte terminaler eller CI-logger.

## 6. Sjekk din forståelse

- Hvilken `azure.yaml`-tjeneste distribuerer applikasjonen?
- Hvilket infrastrukturparameter bruker hver verdi du endret?
- Hvilke endringer krever provisjonering snarere enn bare distribusjon?
- Støttet den valgte regionen og abonnementet modellen og kvoten?
- Lyktes alle oppsett-hooks, og kan du verifisere oppført applikasjons oppførsel?

Fortsett til [Tilpass en mal](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->