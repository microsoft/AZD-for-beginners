# 4. Konfigurer en Skabelon

!!! tip "SIDEN AFSLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Start med den faktiske skabelon

Åbn [`azure.yaml` i Kom Igang med AI-agenter](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) i det repository, du initialiserede. Den oprindelige skabelon kan ændre sig uafhængigt af denne workshop. Følgende **uddrag** blev kontrolleret den 4. november 2026; det er ikke en erstatning for den komplette fil:

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

- `name` identificerer AZD-projektet; `metadata.template` registrerer skabelonversionen.
- `requiredVersions.azd` er skabelonens minimum, ikke en anbefaling om at blive på en gammel CLI. Brug en nuværende understøttet AZD-udgave.
- `services` definerer applikationsdistributionsmål. Denne skabelon distribuerer sin Python API og frontend som en enkelt Container Apps-tjeneste.
- `project` er relativ til `azure.yaml`.
- `remoteBuild` anmoder om en fjern containerbygning. Din identitet har stadig brug for de nødvendige Azure-tilladelser.

Skabelonens Bicep-filer under `infra/`, ikke kun listen `services`, erklærer ressourcer såsom Microsoft Foundry, modeldistributioner, lagring og valgfri AI Search.

## 2. Forstå livscyklus-hooks

Undersøg `hooks`-afsnittet og dets refererede scripts, før du kører skabelonen. Den gennemgåede version indeholder:

| Hook | Formål | Vigtig adfærd |
|------|---------|--------------------|
| `preup` | Valider skabelonens miljøinput før `up`-arbejdsgangen | Platformsspecifikke shell-scripts kan stoppe arbejdsgangen ved fejl |
| `postdeploy` | Kør skabelonspecifik opsætning efter applikationsdistribuering | Undersøg `continueOnError` og scriptoutput; en vellykket deployment beviser ikke, at alle opsætningsopgaver lykkedes |

Denne version indeholder **ikke** den ældre `postprovision` / `write_env` hook vist i tidligere workshopmateriale. Kopiér ikke hook-referencer til scripts, der ikke længere findes.

Hook-nøgler vælger livscyklusbegivenheder; `posix` og `windows` vælger platformimplementeringer. `shell`, `run`, `interactive`, og `continueOnError` styrer udførelsen. Dette er eksekverbare scripts med dine tilladelser, så gennemse dem lige som applikationskode.

Se [AZD hooks dokumentationen](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) for hele livscyklussen.

## 3. Spor miljøinput til infrastruktur

Kør disse kommandoer fra det initialiserede eksemperepository:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Undersøg `infra/main.parameters.json` for at se, hvilke miljøvariabler skabelonen faktisk bruger. At sætte et vilkårligt navn med `azd env set` ændrer ikke automatisk en Azure-ressource.

Gennemgåede standarder inkluderer:

| Input | Standard / formål |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvotaenheder afhænger af modellen og distributionstype |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; lad være med at aktivere medmindre databehandling er gennemgået |

Dette er eksempelspecifikke input, ikke globale AZD-indstillinger. Tjek [modellen og regionsunderstøttelsesdokumentationen](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) og dit abonnementets kvota, før du vælger model, SKU, kapacitet eller placering. Fortolk ikke hver kapacitet som 1.000 tokens per minut.

For at vælge en anden chatmodel, opdater dens kompatible **navn, version, format, SKU og kapacitet sammen**, i henhold til [eksemplets tilpasningsvejledning](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Det at ændre kun navnet kan efterlade en inkompatibel version eller distributionstype.

## 4. Lab: aktiver valgfri søgning og sporing

!!! warning "Disse indstillinger kan tilføje fakturerbare ressourcer"

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

Infrastrukturændringer kræver levering; `azd deploy` alene deployer kun applikationstjenester. For søgeindeksering og understøttede hentningsmuligheder, følg [AI Search-guiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). For overvågning, følg [observabilitetsguiden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Aktivér ikke optagelse af prompt-/svarindhold på rigtige kundedata uden den nødvendige samtykke, adgangskontrol, opbevaringspolitik og udredning.

## 5. Eksisterende ressourcer og CI/CD

For at genbruge et Foundry-projekt, følg eksemplets [instruktioner for eksisterende ressourcer](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). At sætte `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` ændrer distributionsstien; i det scenarie opretter skabelonen ikke Application Insights eller AI Search for dig. Bekræft eksplicit afhængigheder, rollefordelinger og modeldistributioner.

`pipeline.variables`-afsnittet styrer værdier, der gives ind i en genereret pipeline; det er ikke en hemmelighedsføler og opretter ikke Azure-ressourcer. Foretræk managed identity i appen og OIDC til CI/CD. AZD-miljøfiler er i klartekst og bør ikke committes.

AZD understøtter import af en betroet, lokalt forberedt dotenv-fil:

```bash
azd env set --file .env
```

Gennemse den fil, før du importerer den, og udskriv ikke miljøfiler med hemmeligheder i delte terminaler eller CI-logs.

## 6. Tjek din forståelse

- Hvilken `azure.yaml`-tjeneste deployer applikationen?
- Hvilket infrastrukturparameter bruger hver værdi, du ændrede?
- Hvilke ændringer kræver levering fremfor blot deployment?
- Støttede den valgte region og abonnement modellen og kvotaen?
- Lykkedes alle opsætningshooks, og kan du bekræfte den deployerede applikations adfærd?

Fortsæt til [Tilpas en Skabelon](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->