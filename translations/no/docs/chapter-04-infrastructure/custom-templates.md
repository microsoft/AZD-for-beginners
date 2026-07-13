# Lage din egen azd-mal

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 4 - Infrastruktur som kode og distribusjon
- **⬅️ Forrige**: [Distribusjonsguide](deployment-guide.md)
- **🚀 Neste kapittel**: [Kapittel 5: Multi-agent løsninger](../chapter-05-multi-agent/README.md)

> Validert mot `azd 1.27.1` i juli 2026.

## Introduksjon

Så langt har du *brukt* maler med `azd init --template <navn>`. Men når du har et prosjektoppsett teamet ditt liker—si, en Container App med Cosmos DB og riktig overvåking—vil du gjøre det til en gjenbrukbar mal selv. En mal er bare et Git-repositorium med en forutsigbar struktur som azd vet hvordan lese. Denne leksjonen viser deg hvordan du bygger en fra bunnen av, tester den, og (valgfritt) publiserer den til fellesskapsgalleriet.

## Læringsmål

På slutten av denne leksjonen vil du:
- Forstå hva som gjør en mappe til en "azd-mal"
- Kjenne til nødvendige filer og mappestruktur
- Legge til en `azure.yaml` og `infra/` som andre kan gjenbruke
- Teste malen din lokalt før deling
- Publisere den og (valgfritt) sende den til Awesome AZD

## Læringsresultater

Etter fullført leksjon vil du kunne:
- Skissere et nytt mal-repositorium
- Parametrisere infrastrukturen slik at den fungerer i enhver abonnement
- Validere en mal med `azd init` og `azd up`
- Legge til metadata som fellesskapsgalleriet krever

---

## Hva er egentlig en mal?

En azd-mal er **et Git-repositorium** som inneholder, som minimum:

| Fil / mappe | Formål | Påkrevd? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver tjenester, verter og infrastrukturleverandør | ✅ Ja |
| `infra/` | Bicep, Terraform eller Pulumi som provisjonerer ressurser | ✅ Ja |
| `src/` (eller koden din) | Applikasjonskoden som azd distribuerer | ✅ Ja |
| `README.md` | Hvordan bruke malen | ✅ Sterkt anbefalt |
| `.azdo/` eller `.github/` | CI/CD pipeline definisjoner | Valgfritt |
| `.devcontainer/` | Reproduserbart utviklingsmiljø | Valgfritt |
| `azure.yaml` `metadata` | Galleri- og telemetriinfo | Valgfritt (påkrevd for publisering) |

Det er ingenting magisk her: når du kjører `azd init --template you/your-repo`, kloner azd repoet og leser `azure.yaml`.

---

## Steg 1: Skissere Repositoriet

Lag mappestrukturen manuelt eller start fra en minimal mal og rediger den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Lag standardoppsettet
mkdir -p src infra
```

Et typisk ferdig oppsett ser slik ut:

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

Dette er kjernen i malen. Den forteller azd hva som skal distribueres og hvordan:

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

> `metadata.template`-feltet er det galleriets telemetri bruker for å telle bruk. Bruk `name@version` konvensjonen.

---

## Steg 3: Parametrisere Infrastrukturen

Den viktigste regelen for en *gjenbrukbar* mal: **aldri hardkode navn, regioner eller abonnementsspesifikke verdier.** Bruk parametere og ressurs-tokenmønsteret slik at samme mal fungerer i alle abonnement.

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

1. **`azd-env-name` tag** — azd bruker den til å spore og rydde opp ressurser per miljø.
2. **`uniqueString(...)` ressurs-token** — lager en stabil, globalt unik suffiks slik at navn ikke kolliderer.

Lever en tilsvarende parameterfil som leser verdier azd injiserer fra miljøet:

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

azd erstatter `${AZURE_ENV_NAME}` og `${AZURE_LOCATION}` automatisk fra gjeldende miljø.

---

## Steg 4: Test Malen Din Lokalt

Før deling, bevis at malen fungerer fra en ren tilstand.

**Test fra lokal mappe** (ingen Git push nødvendig):

```bash
# Fra en tom katalog, initialiser ved å bruke din lokale malbane
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisjoner + distribuer ende-til-ende
azd auth login
azd up
```

**Test så 'oppryddingen'**—en god mal rydder opp fullstendig:

```bash
azd down --force --purge
```

Hvis `azd down` etterlater ressurser, har du sannsynligvis glemt `azd-env-name` taggen på en ressurs.

> **Tips:** kjør `azd provision --preview` først. Det gjør en hva-hvis analyse og viser feil i malen før noen ressurser opprettes.

---

## Steg 5: Publiser Malen

Push repoet til GitHub (offentlig dersom du vil at andre skal bruke det):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nå kan hvem som helst bruke det:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Steg 6 (valgfritt): Send inn til Awesome AZD

[Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) lister opp fellesskapets maler. For å bli listet bør repoet inkludere:

- ✅ En klar `README.md` med forutsetninger, et arkitekturskjema og kostnadsnotater
- ✅ En fungerende `azure.yaml` med `metadata.template`
- ✅ Infrastruktur som provisionsfritt kan settes opp i et nytt abonnement
- ✅ En `LICENSE` fil
- ✅ (Anbefalt) En `.devcontainer/` for ett-klikk Codespaces

Send inn ved å åpne en pull request som legger til malen i galleriets datafil, i henhold til bidragsguiden i [Awesome AZD-repoet](https://github.com/Azure/awesome-azd).

---

## Vanlige fallgruver

| Fallgruve | Løsning |
|---------|-----|
| Hardkodede ressursnavn | Bruk `uniqueString()` ressurs-token |
| `azd down` etterlater ressurser | Tagg alle ressurser (eller ressursgruppen) med `azd-env-name` |
| Malen fungerer for deg, feiler for andre | Fjern abonnement-IDer, tenant-IDer og regionantakelser |
| Output ikke koblet til appen | Eksporter `SERVICE_<NAME>_ENDPOINT_URL` og andre `AZURE_*` outputs |
| Innsending til galleri avvist | Legg til `README.md`, `LICENSE` og `metadata.template` |

---

## Sammendrag

- En mal er bare et Git-repo med `azure.yaml`, `infra/` og koden din.
- Parametrisér alt—navn, regioner og IDer—slik at den kjører overalt.
- Tagg alltid ressurser med `azd-env-name` så `azd down` fungerer.
- Test lokalt med `azd init --template <local-path>` før publisering.
- Legg til metadata og README for å sende inn til Awesome AZD.

---

## 🔗 Navigasjon

| Retning | Ressurs |
|-----------|----------|
| **Forrige** | [Distribusjonsguide](deployment-guide.md) |
| **Kapittel-start** | [Kapittel 4: Infrastruktur som kode](README.md) |
| **Neste kapittel** | [Kapittel 5: Multi-agent løsninger](../chapter-05-multi-agent/README.md) |

## 📖 Relaterte ressurser

- [Allokering av ressurser](provisioning.md)
- [Awesome AZD-galleri](https://azure.github.io/awesome-azd/)
- [Offisiell azd maldokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->