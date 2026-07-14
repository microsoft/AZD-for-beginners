# Forfatning af din egen azd-skabelon

**Kapitelnavigation:**
- **📚 Kursusstart**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 4 - Infrastruktur som kode & implementering
- **⬅️ Forrige**: [Implementeringsguide](deployment-guide.md)
- **🚀 Næste kapitel**: [Kapitel 5: Multi-agent-løsninger](../chapter-05-multi-agent/README.md)

> Valideret mod `azd 1.27.1` i juli 2026.

## Introduktion

Indtil videre har du *brugt* skabeloner med `azd init --template <name>`. Men når du først har et projektlayout, som dit team kan lide - for eksempel en Container App med en Cosmos DB og den rette overvågning - vil du gerne gøre det til en genanvendelig skabelon for dig selv. En skabelon er blot et Git-repositorium med en forudsigelig struktur, som azd ved, hvordan man læser. Denne lektion viser dig, hvordan du bygger en fra bunden, tester den og (valgfrit) publicerer den i fællesskabsgalleriet.

## Læringsmål

Ved slutningen af denne lektion vil du:
- Forstå hvad der gør en mappe til en "azd-skabelon"
- Kende de krævede filer og mappestruktur
- Tilføje en `azure.yaml` og `infra/`, som andre kan genbruge
- Teste din skabelon lokalt før deling
- Publicere den og (valgfrit) indsende den til Awesome AZD

## Læringsresultater

Efter at have gennemført denne lektion, vil du kunne:
- Oprette et nyt skabelon-repositorium
- Parametrisere infrastrukturen, så den fungerer i enhver abonnement
- Validere en skabelon med `azd init` og `azd up`
- Tilføje metadata, som fællesskabsgalleriet kræver

---

## Hvad er en skabelon egentlig?

En azd-skabelon er **et Git-repositorium**, som indeholder som minimum:

| Fil / mappe | Formål | Krævet? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver services, hosts og infrastrukturudbyder | ✅ Ja |
| `infra/` | Bicep, Terraform eller Pulumi som provisionerer ressourcer | ✅ Ja |
| `src/` (eller din kode) | Applikationskoden, som azd deployer | ✅ Ja |
| `README.md` | Hvordan man bruger skabelonen | ✅ Stærkt anbefalet |
| `.azdo/` eller `.github/` | CI/CD-pipeline-definitioner | Valgfrit |
| `.devcontainer/` | Reproducerbart udviklingsmiljø | Valgfrit |
| `azure.yaml` `metadata` | Galleri + telemetri-info | Valgfrit (krævet for at publicere) |

Der er intet magisk her: når du kører `azd init --template you/your-repo`, kloner azd repoet og læser `azure.yaml`.

---

## Trin 1: Opret repositoriets struktur

Opret mappestrukturen manuelt eller start fra en minimal skabelon og rediger den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Opret standardlayoutet
mkdir -p src infra
```

Et typisk færdigt layout ser sådan ud:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Trin 2: Skriv `azure.yaml`

Dette er skabelonens kerne. Det fortæller azd, hvad der skal deployeres og hvordan:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Feltet `metadata.template` er det, som galleri-telemetri bruger til at tælle brug. Brug konventionen `name@version`.

---

## Trin 3: Parametrisér infrastrukturen

Den enkelt vigtigste regel for en *genanvendelig* skabelon: **aldig hardcode navne, regioner eller abonnements-specifikke værdier.** Brug parametre og resource token-mønstret, så den samme skabelon fungerer i nogens abonnement.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

To ting gør denne skabelon skabelon-venlig:

1. **`azd-env-name` tag** — azd bruger det til at spore og rydde op i ressourcer per miljø.
2. **`uniqueString(...)` resource token** — producerer en stabil, globalt unik suffix, så navne ikke kolliderer.

Lever en matchende parameterfil, som læser værdier, som azd injicerer fra miljøet:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd erstatter `${AZURE_ENV_NAME}` og `${AZURE_LOCATION}` fra det aktuelle miljø automatisk.

---

## Trin 4: Test din skabelon lokalt

Før deling, bevis at skabelonen virker fra en ren tilstand.

**Test fra den lokale mappe** (ingen Git push nødvendig):

```bash
# Fra en tom mappe, initialiser ved brug af din lokale skabelonsti
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisoner og deploy fra start til slut
azd auth login
azd up
```

**Test derefter nedrivningen**—en god skabelon rydder helt op:

```bash
azd down --force --purge
```

Hvis `azd down` efterlader ressourcer, har du sandsynligvis glemt `azd-env-name` tagget på en ressource.

> **Tip:** kør først `azd provision --preview`. Det udfører en what-if og viser skabelonfejl, før nogen ressourcer oprettes.

---

## Trin 5: Publicer skabelonen

Push repositoriet til GitHub (offentligt, hvis du ønsker, at andre skal bruge det):

```bash
gh repo create my-azd-template --public --source=. --push
```

Alle kan nu bruge den:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Trin 6 (valgfrit): Indsend til Awesome AZD

[Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) viser fællesskabsskabeloner. For at blive listet bør dit repo indeholde:

- ✅ En klar `README.md` med forudsætninger, et arkitekturdiagram og omkostningsnoter
- ✅ En fungerende `azure.yaml` med `metadata.template`
- ✅ Infrastruktur, der provisioneres rent i et nyt abonnement
- ✅ En `LICENSE`-fil
- ✅ (Anbefalet) En `.devcontainer/` til one-click Codespaces

Indsend ved at åbne en pull request, som tilføjer din skabelon til galleriets datafil, efter bidragsvejledningen i [Awesome AZD-repositoriet](https://github.com/Azure/awesome-azd).

---

## Almindelige faldgruber

| Faldgrube | Løsning |
|---------|-----|
| Hardcodede ressource-navne | Brug `uniqueString()` resource token |
| `azd down` efterlader ressourcer | Tag hver ressource (eller ressourcegruppen) med `azd-env-name` |
| Skabelonen virker for dig, fejler for andre | Fjern abonnements-ID'er, tenant-ID'er og regionsantagelser |
| Outputs ikke koblet til appen | Eksporter `SERVICE_<NAME>_ENDPOINT_URL` og andre `AZURE_*` outputs |
| Galleri-indsendelse afvist | Tilføj `README.md`, `LICENSE` og `metadata.template` |

---

## Resumé

- En skabelon er blot et Git-repo med `azure.yaml`, `infra/` og din kode.
- Parametrisér alt – navne, regioner og ID'er – så det kører overalt.
- Tag altid ressourcer med `azd-env-name`, så `azd down` fungerer.
- Test lokalt med `azd init --template <local-path>` før publicering.
- Tilføj metadata og en README for at indsende til Awesome AZD.

---

## 🔗 Navigation

| Retning | Ressource |
|-----------|----------|
| **Forrige** | [Implementeringsguide](deployment-guide.md) |
| **Kapitelstart** | [Kapitel 4: Infrastruktur som kode](README.md) |
| **Næste kapitel** | [Kapitel 5: Multi-agent-løsninger](../chapter-05-multi-agent/README.md) |

## 📖 Relaterede ressourcer

- [Provisionering af ressourcer](provisioning.md)
- [Awesome AZD-galleri](https://azure.github.io/awesome-azd/)
- [Officiel azd skabelondokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->