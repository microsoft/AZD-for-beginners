# Skapa din egen azd-mall

**Kapitelnavigering:**
- **📚 Kursstartsida**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 4 - Infrastruktur som kod och distribution
- **⬅️ Föregående**: [Deployering-guide](deployment-guide.md)
- **🚀 Nästa kapitel**: [Kapitel 5: Multi-Agent-lösningar](../chapter-05-multi-agent/README.md)

> Granskad mot `azd 1.37.2` (november 2026). Detta är en **genomgång av skapande med partiella filer**, inte en komplett mall: du måste tillhandahålla applikationskod och `modules/web.bicep` med dess miljö, register, Container-app och utdata före distribution. Azure-provisionering utfördes inte i denna granskning.

## Introduktion

Hittills har du *använt* mallar med `azd init --template <name>`. Men när du har en projektstruktur som ditt team gillar – t.ex. en Container-app med en Cosmos DB och rätt övervakning – vill du förvandla den till en återanvändbar mall. En mall är bara ett Git-repositorium med en förutsägbar struktur som azd kan läsa. Denna lektion visar hur du bygger en från grunden, testar den och (valfritt) publicerar den till community-galleriet.

## Lärandemål

I slutet av denna lektion ska du:
- Förstå vad som gör en mapp till en "azd-mall"
- Känna till nödvändiga filer och mappstruktur
- Lägga till en `azure.yaml` och `infra/` som andra kan återanvända
- Testa din mall lokalt innan du delar den
- Publicera den och (valfritt) skicka in den till Awesome AZD

## Läranderesultat

Efter att ha slutfört denna lektion kommer du kunna:
- Skapa ett nytt mall-repo
- Parameterisera infrastrukturen så den fungerar i alla prenumerationer
- Validera en mall med `azd init` och `azd up`
- Lägga till metadata som community-galleriet kräver

---

## Vad är egentligen en mall?

En azd-mall är **ett Git-repositorium** som innehåller minst:

| Fil / mapp | Syfte | Obligatorisk? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver tjänster, värdar och infra-leverantör | ✅ Ja |
| `infra/` | Bicep- eller Terraform-definitioner för provisioning | Obligatoriskt för detta tydliga infra-som-kod-exempel; projekt med genererad infrastruktur kan utelämna det |
| `src/` (eller din kod) | Applikationskoden som azd distribuerar | Obligatoriskt för källbaserade tjänster; inte alla mallar innehåller applikationskod |
| `README.md` | Hur man använder mallen | ✅ Stark rekommendation |
| `.azdo/` eller `.github/` | CI/CD-pipeline-definitioner | Valfritt |
| `.devcontainer/` | Reproducerbar utvecklingsmiljö | Valfritt |
| `azure.yaml` `metadata` | Mall-identitet/telemetriinfo | Rekommenderas; publicering av ett Git-repo kräver det inte |

Här finns ingen magi: när du kör `azd init --template you/your-repo` klonas repot och `azure.yaml` läses.

---

## Steg 1: Skapa repositoriet

Skapa mappstrukturen för hand eller börja med en minimal mall och redigera den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

En typisk färdig layout ser ut så här:

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

Detta är mallens hjärta. Den talar om för azd vad som ska distribueras och hur:

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

> Fältet `metadata.template` används av galleriets telemetri för att räkanvändning. Använd konventionen `name@version`.

---

## Steg 3: Parameterisera infrastrukturen

Den viktigaste regeln för en *återanvändbar* mall: **hårdkoda aldrig namn, regioner eller prenumerationsspecifika värden.** Använd parametrar och resurstokenmönstret så att samma mall fungerar i vem som helst prenumeration.

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

Två saker gör denna mall mallvänlig:

1. **`azd-env-name`-tagg** — azd använder den för att spåra och rensa resurser per miljö.
2. **`uniqueString(...)` resurstoken** — genererar ett stabilt hash-suffix för att minska kollisioner; det är inte en garanti för global unikhet.

Den saknade `modules/web.bicep` måste acceptera `name`, `location` och `tags`, provisionera Container Apps-miljön/registrets och appen, tagga appen med `azd-service-name: web` och exportera `uri`. Den måste också exponera registervärden som krävs av det valda build-/deploy-flödet (t.ex. `AZURE_CONTAINER_REGISTRY_ENDPOINT` från root-modulen). Bara en endpoint-output kopplar inte ihop tjänsteupptäckt, applikationsinställningar eller registerautentisering.

Tillhandahåll en matchande parameterfil som läser värden som azd injicerar från miljön:

Spara följande som `infra/main.parameters.json`:

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

azd ersätter automatiskt `${AZURE_ENV_NAME}` och `${AZURE_LOCATION}` från den aktuella miljön.

---

## Steg 4: Testa din mall lokalt

Bevisa att mallen fungerar från ett rent tillstånd innan du delar den.

**Testa från den lokala mappen** (ingen Git-push krävs):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Testa sedan teardown**—en bra mall städar upp helt:

```bash
azd down --force --purge
```

Om `azd down` lämnar kvar resurser, kontrollera miljö-/resursgruppsupptäckt, externa/delade resurser, behörigheter, lås och rensningsskydd. `--purge` raderar inte lokalt `.azure/`-tillstånd.

> **Tips:** efter att ha tillhandahållit alla saknade filer, kör `azd provision --preview` först. Inspektera hooks före förhandsgranskning eftersom de kan köra biverkande kommandon. Förhandsgranskning är inte en prisuppskattning eller en garanti att provisionering lyckas.

---

## Steg 5: Publicera mallen

Pusha repositoriet till GitHub (offentligt om du vill att andra ska använda det):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Vem som helst kan nu använda det:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Steg 6 (valfritt): Skicka in till Awesome AZD

Galleriet [Awesome AZD](https://azure.github.io/awesome-azd/) listar communitymallar. För att listas bör ditt repo inkludera:

- ✅ En tydlig `README.md` med förutsättningar, en arkitekturdiagram och kostnadsanteckningar
- ✅ En fungerande `azure.yaml` med `metadata.template`
- ✅ Infrastruktur som provisioneras rent i en ny prenumeration
- ✅ En `LICENSE`-fil
- ✅ (Rekommenderas) En `.devcontainer/` för en-klikks Codespaces

Skicka in genom att öppna en pull-begäran som lägger till din mall i galleriets datafil, enligt bidragsguiden i [Awesome AZD-förvaret](https://github.com/Azure/awesome-azd).

---

## Vanliga fallgropar

| Fallgrop | Lösning |
|---------|-----|
| Hårdkodade resursnamn | Använd `uniqueString()` resurs-token |
| `azd down` lämnar resurser | Tagga varje resurs (eller resursgruppen) med `azd-env-name` |
| Mall fungerar för dig, misslyckas för andra | Ta bort prenumerations-ID, tenant-ID och regionsantaganden |
| Utdata kopplas inte till appen | Matcha `azd-service-name`/`resourceName` för distribution och mappa explicit utdata till appinställningar |
| Galleriansökan avvisad | Lägg till `README.md`, `LICENSE`, och `metadata.template` |

---

## Sammanfattning

- En mall är bara ett Git-repo med `azure.yaml`, `infra/`, och din kod.
- Parametrisera allt — namn, regioner och ID:n — så att det kan köras var som helst.
- Tagga alltid resurser med `azd-env-name` så att `azd down` fungerar.
- Testa lokalt med `azd init --template <local-path>` innan du publicerar.
- Lägg till metadata och en README för att skicka in till Awesome AZD.

---

## 🔗 Navigering

| Riktning | Resurs |
|-----------|----------|
| **Föregående** | [Deploymentsguide](deployment-guide.md) |
| **Kapitel Hem** | [Kapitel 4: Infrastruktur som Kod](README.md) |
| **Nästa Kapitel** | [Kapitel 5: Multi-Agent Lösningar](../chapter-05-multi-agent/README.md) |

## 📖 Relaterade Resurser

- [Provisionering av Resurser](provisioning.md)
- [Awesome AZD Galleri](https://azure.github.io/awesome-azd/)
- [Officiell azd mall dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->