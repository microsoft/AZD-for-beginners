# Lage ditt eget azd-mal

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 4 - Infrastruktur som kode & Distribusjon
- **⬅️ Forrige**: [Distribusjonsveiledning](deployment-guide.md)
- **🚀 Neste Kapittel**: [Kapittel 5: Multi-Agent Løsninger](../chapter-05-multi-agent/README.md)

> Gjennomgått mot `azd 1.37.2` (november 2026). Dette er en **gjennomgang for forfattere med delvise filer**, ikke en komplett mal: du må levere applikasjonskode og `modules/web.bicep` med dets miljø, register, Container App og utdata før distribusjon. Azure-provisjonering ble ikke utført i denne gjennomgangen.

## Introduksjon

Til nå har du *brukt* maler med `azd init --template <name>`. Men når du har et prosjektoppsett teamet ditt liker—si en Container App med Cosmos DB og riktig overvåkning—vil du gjøre det om til en gjenbrukbar mal du selv eier. En mal er bare et Git-repositorium med en forutsigbar struktur som azd vet hvordan den skal lese. Denne leksjonen viser deg hvordan du bygger en fra bunnen av, tester den, og (valgfritt) publiserer den til fellesskapet galleri.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Forstå hva som gjør en mappe til en "azd-mal"
- Kjenne til nødvendige filer og mappestruktur
- Legge til en `azure.yaml` og `infra/` som andre kan gjenbruke
- Teste malen din lokalt før du deler den
- Publisere den og (valgfritt) sende den inn til Awesome AZD

## Læringsutbytte

Etter å ha fullført denne leksjonen vil du kunne:
- Tilrettelegge et nytt mal-repositorium
- Parametrisere infrastruktur slik at det fungerer i hvilken som helst abonnement
- Validere en mal med `azd init` og `azd up`
- Legge til metadata som fellesskapsgalleriet krever

---

## Hva er egentlig en mal?

En azd-mal er **et Git-repositorium** som inneholder, som et minimum:

| Fil / mappe | Formål | Nødvendig? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver tjenester, hoster og infrastrukturleverandør | ✅ Ja |
| `infra/` | Bicep eller Terraform provisjonsdefinisjoner | Påkrevd for dette eksplisitte IaC-eksempelet; prosjekter med generert infrastruktur kan utelate det |
| `src/` (eller koden din) | Applikasjonskoden azd distribuerer | Påkrevd for kildebaserte tjenester; ikke alle maler inneholder applikasjonskode |
| `README.md` | Hvordan bruke malen | ✅ Sterkt anbefalt |
| `.azdo/` eller `.github/` | CI/CD pipeline-definisjoner | Valgfritt |
| `.devcontainer/` | Reproduserbart utviklingsmiljø | Valgfritt |
| `azure.yaml` `metadata` | Malens identitet/telemetri-info | Anbefalt; publisering av et Git-repositorium krever det ikke |

Det er ingenting magisk her: når du kjører `azd init --template you/your-repo`, kloner azd repoet og leser `azure.yaml`.

---

## Steg 1: Tilrettelegg repositoriet

Lag mappestrukturen manuelt eller start fra en minimal mal og rediger den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

En typisk ferdig struktur ser slik ut:

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

## Steg 2: Skriv `azure.yaml`

Dette er kjernen i malen. Det forteller azd hva som skal distribueres og hvordan:

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

> Feltet `metadata.template` er det galleri-telemetri bruker for å telle bruk. Bruk `name@version` konvensjonen.

---

## Steg 3: Parametriser infrastrukturen

Den viktigste regelen for en *gjenbrukbar* mal: **aldri hardkod navn, regioner eller abonnementsspesifikke verdier.** Bruk parametere og ressurs-token-mønsteret slik at den samme malen fungerer i andres abonnementer.

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

To ting gjør denne malen malvennlig:

1. **`azd-env-name`-tag** — azd bruker den for å spore og rydde opp ressurser per miljø.
2. **`uniqueString(...)` ressurs-token** — produserer et stabilt hash-suffiks for å redusere kollisjoner; det er ingen garanti for global unikhet.

Den manglende `modules/web.bicep` må akseptere `name`, `location`, og `tags`, provisjonere Container Apps-miljø/registre og app, tagge appen med `azd-service-name: web`, og eksportere `uri`. Den må også eksponere registerverdier som trengs av valgt build/deploy flyt (for eksempel `AZURE_CONTAINER_REGISTRY_ENDPOINT` fra rotmodulen). En endepunktutgang alene kobler ikke sammen tjenesteoppdagelse, applikasjonsinnstillinger eller registerautentisering.

Tilby en matchende parameterfil som leser verdier azd injiserer fra miljøet:

Lagre følgende som `infra/main.parameters.json`:

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

azd substituerer `${AZURE_ENV_NAME}` og `${AZURE_LOCATION}` fra gjeldende miljø automatisk.

---

## Steg 4: Test malen lokalt

Før deling, bevis at malen fungerer fra en ren tilstand.

**Test fra lokal mappe** (ingen Git push kreves):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Test så nedriggingen**—en god mal rydder opp helt:

```bash
azd down --force --purge
```

Hvis `azd down` etterlater ressurser, sjekk miljø-/ressursgruppe-oppdagelse, eksterne/delte ressurser, tillatelser, låser og purge-beskyttelse. `--purge` sletter ikke lokal `.azure/` tilstand.

> **Tips:** etter å ha levert alle manglende filer, kjør `azd provision --preview` først. Inspiser hooks før forhåndsvisning fordi de kan utføre sideeffektkommandoer. Forhåndsvisning er ikke et prisestimat eller garanti for at provisjoneringen vil lykkes.

---

## Steg 5: Publiser malen

Push repositoriet til GitHub (offentlig hvis du ønsker at andre skal bruke det):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Nå kan hvem som helst bruke det:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Steg 6 (valgfritt): Send inn til Awesome AZD

Galleriet [Awesome AZD](https://azure.github.io/awesome-azd/) viser maler fra fellesskapet. For å bli oppført bør repoet ditt inkludere:

- ✅ En klar `README.md` med forutsetninger, et arkitekturdiagram og kostnadsnotater
- ✅ En fungerende `azure.yaml` med `metadata.template`
- ✅ Infrastruktur som provisjoneres rent i et nytt abonnement
- ✅ En `LICENSE`-fil
- ✅ (Anbefalt) En `.devcontainer/` for ett-klikk Codespaces

Send inn ved å åpne en pull request som legger til malen din i galleriets datafil, i henhold til bidragsveiledningen i [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Vanlige fallgruver

| Fallgruve | Løsning |
|---------|-----|
| Hardkodede ressursnavn | Bruk `uniqueString()` ressurs-token |
| `azd down` etterlater ressurser | Merk hver ressurs (eller ressursgruppen) med `azd-env-name` |
| Mal fungerer for deg, feiler for andre | Fjern abonnement-IDer, leietaker-IDer og regionsantakelser |
| Output ikke koblet til appen | Match `azd-service-name`/`resourceName` for distribusjon og kartlegg eksplisitt output til app-innstillinger |
| Galleri-innsending avvist | Legg til `README.md`, `LICENSE`, og `metadata.template` |

---

## Sammendrag

- En mal er bare et Git-repositorium med `azure.yaml`, `infra/`, og koden din.
- Parameteriser alt—navn, regioner, og ID-er—slik at det kjører hvor som helst.
- Merk alltid ressurser med `azd-env-name` slik at `azd down` fungerer.
- Test lokalt med `azd init --template <local-path>` før publisering.
- Legg til metadata og en README for innsending til Awesome AZD.

---

## 🔗 Navigasjon

| Retning | Ressurs |
|-----------|----------|
| **Forrige** | [Deployering Guide](deployment-guide.md) |
| **Kapittel Hjem** | [Kapittel 4: Infrastruktur som kode](README.md) |
| **Neste Kapittel** | [Kapittel 5: Multi-agent løsninger](../chapter-05-multi-agent/README.md) |

## 📖 Relaterte ressurser

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->