# Lage din egen azd-mal

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 4 - Infrastruktur som kode og distribusjon
- **⬅️ Forrige**: [Deployment Guide](deployment-guide.md)
- **🚀 Neste kapittel**: [Kapittel 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validert mot `azd 1.25.6` i juni 2026.

## Introduksjon

Så langt har du *brukt* maler med `azd init --template <name>`. Men når du har en prosjektstruktur teamet ditt liker — for eksempel en Container App med en Cosmos DB og riktig overvåking — vil du gjøre det om til en gjenbrukbar mal. En mal er bare et Git-repositorium med en forutsigbar struktur som azd vet hvordan den skal lese. Denne leksjonen viser hvordan du bygger en fra bunnen av, tester den, og (valgfritt) publiserer den til community-galleriet.

## Læringsmål

Etter denne leksjonen vil du:
- Forstå hva som gjør en mappe til en "azd-mal"
- Vite hvilke filer og mappestruktur som kreves
- Legge til en `azure.yaml` og `infra/` som andre kan gjenbruke
- Teste malen lokalt før deling
- Publisere den og (valgfritt) sende den til Awesome AZD

## Læringsutbytte

Etter å ha fullført denne leksjonen vil du kunne:
- Skape et nytt mal-repositorium
- Parameterisere infrastruktur slik at det fungerer i enhver abonnement
- Validere en mal med `azd init` og `azd up`
- Legge til metadata som kreves av community-galleriet

---

## Hva er en mal, egentlig?

En azd-mal er **et Git-repositorium** som inneholder, minst:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Describes services, hosts, and infra provider | ✅ Ja |
| `infra/` | Bicep, Terraform, or Pulumi that provisions resources | ✅ Ja |
| `src/` (or your code) | The application code azd deploys | ✅ Ja |
| `README.md` | How to use the template | ✅ Sterkt anbefalt |
| `.azdo/` or `.github/` | CI/CD pipeline definitions | Valgfritt |
| `.devcontainer/` | Reproducible dev environment | Valgfritt |
| `azure.yaml` `metadata` | Gallery + telemetry info | Valgfritt (påkrevd for publisering) |

Det er ingenting magisk her: når du kjører `azd init --template you/your-repo`, kloner azd repoet og leser `azure.yaml`.

---

## Trinn 1: Opprett depotstrukturen

Lag mappestrukturen for hånd eller start fra en minimal mal og rediger den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Opprett standardoppsettet
mkdir -p src infra
```

En typisk ferdig layout ser slik ut:

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

## Trinn 2: Skriv `azure.yaml`

Dette er hjertet i malen. Det forteller azd hva som skal deployes og hvordan:

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

> Feltet `metadata.template` er det galleriets telemetri bruker for å telle bruk. Bruk konvensjonen `name@version`.

---

## Trinn 3: Parameteriser infrastrukturen

Den enkelt viktigste regelen for en *gjenbrukbar* mal: **aldri hardkode navn, regioner eller abonnementsspesifikke verdier.** Bruk parametere og resource token-mønsteret slik at samme mal fungerer i noens abonnement.

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

To ting gjør denne malen malvennlig:

1. **`azd-env-name` tag** — azd bruker den for å spore og rydde opp ressurser per miljø.
2. **`uniqueString(...)` resource token** — gir en stabil, globalt unik suffiks slik at navn ikke kolliderer.

Gi en tilsvarende parameterfil som leser verdier azd injiserer fra miljøet:

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

azd erstatter `${AZURE_ENV_NAME}` og `${AZURE_LOCATION}` fra gjeldende miljø automatisk.

---

## Trinn 4: Test malen lokalt

Før du deler, bevis at malen fungerer fra en ren tilstand.

**Test fra den lokale mappen** (ingen Git-push nødvendig):

```bash
# Fra en tom katalog, initialiser ved å bruke den lokale malstien
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Sett opp og distribuer fra ende til ende
azd auth login
azd up
```

**Test så nedriving**—en god mal rydder helt opp:

```bash
azd down --force --purge
```

Hvis `azd down` etterlater ressurser, har du sannsynligvis glemt `azd-env-name` taggen på en ressurs.

> **Tips:** kjør `azd provision --preview` først. Den utfører en what-if og viser malfeil før noen ressurser opprettes.

---

## Trinn 5: Publiser malen

Push repositoriet til GitHub (offentlig hvis du vil at andre skal bruke det):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nå kan alle bruke den:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Trinn 6 (valgfritt): Send til Awesome AZD

[Awesome AZD gallery](https://azure.github.io/awesome-azd/) lister community-maler. For å bli oppført bør repoet ditt inkludere:

- ✅ En tydelig `README.md` med forutsetninger, et arkitekturdiagram og kostnadsnotater
- ✅ En fungerende `azure.yaml` med `metadata.template`
- ✅ Infrastruktur som provisjonerer ryddig i et nytt abonnement
- ✅ En `LICENSE`-fil
- ✅ (Anbefalt) En `.devcontainer/` for ett-klikk Codespaces

Send inn ved å åpne en pull request som legger til malen din i galleriets datafil, og følg bidragsveiledningen i [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Vanlige fallgruver

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Use the `uniqueString()` resource token |
| `azd down` leaves resources | Tag every resource (or the resource group) with `azd-env-name` |
| Template works for you, fails for others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs not wired into the app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery submission rejected | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## Oppsummering

- En mal er bare et Git-repo med `azure.yaml`, `infra/`, og koden din.
- Parameteriser alt—navn, regioner og ID-er—slik at det kan kjøres hvor som helst.
- Tagg alltid ressurser med `azd-env-name` slik at `azd down` fungerer.
- Test lokalt med `azd init --template <local-path>` før publisering.
- Legg til metadata og en README for å sende til Awesome AZD.

---

## 🔗 Navigasjon

| Direction | Resource |
|-----------|----------|
| **Previous** | [Deployment Guide](deployment-guide.md) |
| **Chapter Home** | [Chapter 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Relaterte ressurser

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Offisiell dokumentasjon for azd-maler](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->