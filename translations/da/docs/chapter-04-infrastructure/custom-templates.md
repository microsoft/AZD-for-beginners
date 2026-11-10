# Lav din egen azd-skabelon

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 4 - Infrastruktur som kode & Udrulning
- **⬅️ Forrige**: [Udrulningsvejledning](deployment-guide.md)
- **🚀 Næste kapitel**: [Kapitel 5: Multi-Agent-løsninger](../chapter-05-multi-agent/README.md)

> Gennemgået mod `azd 1.37.2` (november 2026). Dette er en **vejledning til oprettelse med delvise filer**, ikke en komplet skabelon: du skal levere applikationskode og `modules/web.bicep` med dens miljø, registreringsdatabase, Container App og outputs før udrulning. Azure-provisionering blev ikke udført i denne gennemgang.

## Introduktion

Indtil nu har du *brugt* skabeloner med `azd init --template <name>`. Men når du har et projektlayout, som dit team kan lide—f.eks. en Container App med en Cosmos DB og den rette overvågning—vil du gerne omdanne det til en genanvendelig skabelon. En skabelon er blot et Git-repositorium med en forudsigelig struktur, som azd ved, hvordan den skal læse. Denne lektion viser dig, hvordan du bygger en fra bunden, tester den og (valgfrit) publicerer den til fællesskabsgalleriet.

## Læringsmål

Når du har færdiggjort denne lektion, vil du:
- Forstå, hvad der gør en mappe til en "azd-skabelon"
- Kende de nødvendige filer og mappestruktur
- Tilføje en `azure.yaml` og `infra/`, som andre kan genbruge
- Teste din skabelon lokalt, før du deler den
- Publicere den og (valgfrit) indsende den til Awesome AZD

## Læringsresultater

Efter at have gennemført denne lektion, vil du kunne:
- Oprette et nyt skabelon-repositorium
- Parameterisere infrastrukturen, så den fungerer i enhver abonnement
- Validere en skabelon med `azd init` og `azd up`
- Tilføje de metadata, som fællesskabsgalleriet kræver

---

## Hvad er en skabelon egentlig?

En azd-skabelon er **et Git-repositorium**, som indeholder mindst:

| Fil / mappe | Formål | Påkrævet? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver tjenester, hosts og infra-udbyder | ✅ Ja |
| `infra/` | Bicep- eller Terraform-provisioneringsdefinitioner | Påkrævet for dette eksplicitte IaC-eksempel; genererede-infrastrukturprojekter kan udelade det |
| `src/` (eller din kode) | Applikationskoden som azd udruller | Påkrævet for kildebaserede tjenester; ikke alle skabeloner indeholder applikationskode |
| `README.md` | Hvordan man bruger skabelonen | ✅ Stærkt anbefalet |
| `.azdo/` eller `.github/` | CI/CD-pipeline definitioner | Valgfrit |
| `.devcontainer/` | Reproducerbart udviklingsmiljø | Valgfrit |
| `azure.yaml` `metadata` | Skabelon-identitet/telemetri info | Anbefalet; publicering af et Git-repositorium kræver det ikke |

Der er intet magisk her: når du kører `azd init --template you/your-repo`, kloner azd repoet og læser `azure.yaml`.

---

## Trin 1: Opret repositoriet

Opret mappestrukturen manuelt eller start fra en minimal skabelon og rediger den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

En typisk færdig layout ser sådan ud:

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
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Feltet `metadata.template` er det, som galleriets telemetri bruger til at tælle brug. Brug `name@version` konventionen.

---

## Trin 3: Parameteriser infrastrukturen

Den vigtigste regel for en *genanvendelig* skabelon: **hardcod aldrig navne, regioner eller abonnements-specifikke værdier.** Brug parametre og ressource-token-mønstret, så den samme skabelon virker i alles abonnement.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

To ting gør denne skabelon skabelon-venlig:

1. **`azd-env-name` tag** — azd bruger det til at spore og rydde ressourcer per miljø.
2. **`uniqueString(...)` resource token** — producerer et stabilt hash-suffiks for at mindske kollisioner; det er ikke en garanti for global unikhed.

Den manglende `modules/web.bicep` skal acceptere `name`, `location` og `tags`, provisionere Container Apps miljø/registry og app, tagge appen med `azd-service-name: web`, og eksportere `uri`. Den skal også eksponere registreringsværdier, som den valgte build/udrulnings-flow behøver (for eksempel `AZURE_CONTAINER_REGISTRY_ENDPOINT` fra root-modulet). En endpoint-output alene forbinder ikke service discovery, applikationsindstillinger eller registry-autentificering.

Lever en matchende parameterfil, som læser værdier, som azd injicerer fra miljøet:

Gem følgende som `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd erstatter `${AZURE_ENV_NAME}` og `${AZURE_LOCATION}` automatisk fra det aktuelle miljø.

---

## Trin 4: Test din skabelon lokalt

Før du deler, vis at skabelonen virker fra en ren tilstand.

**Test fra den lokale mappe** (ingen Git push krævet):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Test derefter nedlukningen** — en god skabelon rydder helt op:

```bash
azd down --force --purge
```

Hvis `azd down` efterlader ressourcer, så tjek miljø-/ressourcegruppe-opdagelse, eksterne/delte ressourcer, tilladelser, låse og slettebeskyttelse. `--purge` sletter ikke lokal `.azure/` tilstand.

> **Tip:** efter at have leveret alle manglende filer, kør `azd provision --preview` først. Inspicer hooks før preview, fordi de kan udføre sideeffekt-kommandoer. Preview er ikke et prisoverslag eller en garanti for, at provisionering lykkes.

---

## Trin 5: Publicér skabelonen

Push repositoriet til GitHub (offentligt, hvis du vil have andre til at bruge det):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Nu kan alle bruge den:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Trin 6 (valgfrit): Indsend til Awesome AZD

Galleri for [Awesome AZD](https://azure.github.io/awesome-azd/) indeholder community-skabeloner. For at blive listet skal dit depot inkludere:

- ✅ En klar `README.md` med forudsætninger, et arkitekturdiagram og omkostningsnoter
- ✅ En fungerende `azure.yaml` med `metadata.template`
- ✅ Infrastruktur, der provisioneres rent i et nyt abonnement
- ✅ En `LICENSE` fil
- ✅ (Anbefalet) En `.devcontainer/` til ét-klik Codespaces

Indsend ved at åbne en pull-anmodning, der tilføjer din skabelon til galleriets datafil, i henhold til bidragsguiden i [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Almindelige faldgruber

| Fælde | Løsning |
|---------|-----|
| Hardkodede ressourcenavne | Brug `uniqueString()` ressource-tokenet |
| `azd down` efterlader ressourcer | Tag hver ressource (eller ressourcegruppen) med `azd-env-name` |
| Skabelon virker for dig, fejler for andre | Fjern abonnements-id'er, lejer-id'er og regionsantagelser |
| Outputs ikke tilsluttet app'en | Synkroniser `azd-service-name`/`resourceName` til deployment og kortlæg outputs eksplicit til app-indstillinger |
| Galleri-indsendelse afvist | Tilføj `README.md`, `LICENSE`, og `metadata.template` |

---

## Resumé

- En skabelon er bare et Git-repo med `azure.yaml`, `infra/` og din kode.
- Parameterisér alt—navne, regioner og ID'er—så det kan køre overalt.
- Tag altid ressourcer med `azd-env-name` så `azd down` fungerer.
- Test lokalt med `azd init --template <local-path>` før offentliggørelse.
- Tilføj metadata og en README for at indsende til Awesome AZD.

---

## 🔗 Navigation

| Retning | Ressource |
|-----------|----------|
| **Forrige** | [Deployering Vejledning](deployment-guide.md) |
| **Kapitel Hjem** | [Kapitel 4: Infrastruktur som kode](README.md) |
| **Næste Kapitel** | [Kapitel 5: Multi-Agent Løsninger](../chapter-05-multi-agent/README.md) |

## 📖 Relaterede Ressourcer

- [Provisionering af ressourcer](provisioning.md)
- [Awesome AZD Galleri](https://azure.github.io/awesome-azd/)
- [Officiel azd skabelon dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->