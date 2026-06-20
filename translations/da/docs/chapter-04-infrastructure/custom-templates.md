# Oprettelse af din egen azd-skabelon

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 4 - Infrastruktur som kode & Udrulning
- **⬅️ Forrige**: [Udrulningsvejledning](deployment-guide.md)
- **🚀 Næste kapitel**: [Kapitel 5: Multi-Agent-løsninger](../chapter-05-multi-agent/README.md)

> Valideret mod `azd 1.25.6` i juni 2026.

## Introduktion

Indtil nu har du *brugt* skabeloner med `azd init --template <name>`. Men når du har en projektsstruktur, dit team kan lide—for eksempel en Container App med en Cosmos DB og den rette overvågning—vil du gerne gøre den til en genanvendelig skabelon. En skabelon er bare et Git-repositorium med en forudsigelig struktur, som azd ved, hvordan den læses. Denne lektion viser dig, hvordan du bygger en fra bunden, tester den, og (valgfrit) offentliggør den i community-galleriet.

## Læringsmål

Når du er færdig med denne lektion, vil du:
- Forstå, hvad der gør en mappe til en "azd-skabelon"
- Kende de nødvendige filer og mappestrukturen
- Tilføje en `azure.yaml` og `infra/`, som andre kan genbruge
- Teste din skabelon lokalt før du deler den
- Offentliggøre den og (valgfrit) indsende den til Awesome AZD

## Læringsudbytte

Efter at have gennemført denne lektion vil du kunne:
- Oprette et nyt skabelon-repositorium
- Parameterisere infrastrukturen, så den virker i et hvilket som helst abonnement
- Validere en skabelon med `azd init` og `azd up`
- Tilføje metadata, som community-galleriet kræver

---

## Hvad er en skabelon egentlig?

En azd-skabelon er **et Git-repositorium**, der indeholder, mindst følgende:

| Fil / mappe | Formål | Påkrævet? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver services, hosts og infra-udbyder | ✅ Ja |
| `infra/` | Bicep, Terraform eller Pulumi, der provisionerer ressourcer | ✅ Ja |
| `src/` (or your code) | Applikationskoden, som azd udruller | ✅ Ja |
| `README.md` | Sådan bruger du skabelonen | ✅ Stærkt anbefalet |
| `.azdo/` or `.github/` | CI/CD-pipeline-definitioner | Valgfri |
| `.devcontainer/` | Reproducerbart udviklingsmiljø | Valgfri |
| `azure.yaml` `metadata` | Galleri + telemetrioplysninger | Valgfri (krævet for at offentliggøre) |

Der er intet magisk her: når du kører `azd init --template you/your-repo`, kloner azd repositoriet og læser `azure.yaml`.

---

## Trin 1: Opsæt repositoriet

Opret mappestrukturen manuelt eller start fra en minimal skabelon og rediger den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Opret standardlayoutet
mkdir -p src infra
```

En typisk færdig struktur ser sådan ud:

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

Dette er skabelonens kerne. Den fortæller azd, hvad der skal udrulles og hvordan:

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

> Feltet `metadata.template` er det, galleri-telemetrien bruger til at tælle anvendelse. Brug konventionen `name@version`.

---

## Trin 3: Parameterisér infrastrukturen

Den enkelt vigtigste regel for en *genanvendelig* skabelon: **hardkod aldrig navne, regioner eller værdier, der er specifikke for et abonnement.** Brug parametre og resource token-mønstret, så den samme skabelon virker i enhver brugers abonnement.

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

To ting gør denne skabelon genanvendelig:

1. **`azd-env-name` tag** — azd bruger den til at spore og rydde op i ressourcer pr. miljø.
2. **`uniqueString(...)` resource token** — producerer en stabil, globalt-unik suffiks, så navne ikke kolliderer.

Tilføj en tilsvarende parameterfil, der læser værdier, som azd injicerer fra miljøet:

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

Før du deler, bevis at skabelonen virker fra en ren tilstand.

**Test fra den lokale mappe** (ingen Git-push påkrævet):

```bash
# Fra en tom mappe initialiser ved hjælp af din lokale skabelonsti
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionering og udrulning fra ende til ende
azd auth login
azd up
```

**Test derefter nedtagningen**—en god skabelon rydder helt op:

```bash
azd down --force --purge
```

Hvis `azd down` efterlader ressourcer, har du sandsynligvis glemt `azd-env-name`-tagget på en ressource.

> **Tip:** kør `azd provision --preview` først. Den udfører en what-if og viser skabelonfejl, inden nogen ressourcer oprettes.

---

## Trin 5: Offentliggør skabelonen

Push repositoriet til GitHub (offentligt, hvis du vil have andre til at bruge det):

```bash
gh repo create my-azd-template --public --source=. --push
```

Alle kan nu bruge den:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Trin 6 (valgfrit): Indsend til Awesome AZD

Galleriet [Awesome AZD](https://azure.github.io/awesome-azd/) viser community-skabeloner. For at blive opført bør dit repositorium inkludere:

- ✅ En tydelig `README.md` med forudsætninger, et arkitekturdiagram og bemærkninger om omkostninger
- ✅ En fungerende `azure.yaml` med `metadata.template`
- ✅ Infrastruktur, der provisioneres korrekt i et nyt abonnement
- ✅ En `LICENSE`-fil
- ✅ (Anbefalet) En `.devcontainer/` for one-click Codespaces

Indsend ved at oprette en pull request, der tilføjer din skabelon til galleriets datafil, og følg bidragsvejledningen i [Awesome AZD-repositoriet](https://github.com/Azure/awesome-azd).

---

## Almindelige faldgruber

| Faldgrube | Løsning |
|---------|-----|
| Hardkodede ressourcenavne | Brug `uniqueString()` resource token |
| `azd down` efterlader ressourcer | Tag hver ressource (eller ressourcegruppen) med `azd-env-name` |
| Skabelonen virker for dig, fejler for andre | Fjern abonnements-id'er, tenant-id'er og regionsantagelser |
| Output er ikke koblet til appen | Eksporter `SERVICE_<NAME>_ENDPOINT_URL` og andre `AZURE_*` outputs |
| Galleriindsendelse afvist | Tilføj `README.md`, `LICENSE`, og `metadata.template` |

---

## Opsummering

- En skabelon er bare et Git-repo med `azure.yaml`, `infra/`, og din kode.
- Parameterisér alt—navne, regioner, og id'er—så det kører overalt.
- Tag altid ressourcer med `azd-env-name`, så `azd down` virker.
- Test lokalt med `azd init --template <local-path>` før publicering.
- Tilføj metadata og en README for at indsende til Awesome AZD.

---

## 🔗 Navigation

| Retning | Ressource |
|-----------|----------|
| **Forrige** | [Udrulningsvejledning](deployment-guide.md) |
| **Kapitel Hjem** | [Kapitel 4: Infrastruktur som kode](README.md) |
| **Næste kapitel** | [Kapitel 5: Multi-Agent-løsninger](../chapter-05-multi-agent/README.md) |

## 📖 Relaterede ressourcer

- [Provisionering af ressourcer](provisioning.md)
- [Awesome AZD-galleri](https://azure.github.io/awesome-azd/)
- [Officiel azd-skabelondokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->