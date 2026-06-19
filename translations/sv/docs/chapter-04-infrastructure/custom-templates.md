# Skapa din egen azd-mall

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 4 - Infrastruktur som kod & distribution
- **⬅️ Föregående**: [Deployment Guide](deployment-guide.md)
- **🚀 Nästa kapitel**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validerad mot `azd 1.25.6` i juni 2026.

## Introduktion

Hittills har du *använt* mallar med `azd init --template <name>`. Men när du har en projektstruktur som ditt team gillar—till exempel en Container App med en Cosmos DB och rätt övervakning—kommer du vilja göra den till en återanvändbar mall. En mall är helt enkelt ett Git-repository med en förutsägbar struktur som azd vet hur man läser. Den här lektionen visar hur du bygger en från grunden, testar den och (valfritt) publicerar den i community-galleriet.

## Lärandemål

Efter den här lektionen kommer du att:
- Förstå vad som gör en mapp till en "azd-mall"
- Känna till nödvändiga filer och mappstruktur
- Lägga till en `azure.yaml` och `infra/` som andra kan återanvända
- Testa din mall lokalt innan du delar den
- Publicera den och (valfritt) skicka in den till Awesome AZD

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Skapa ett nytt mall-repo
- Parametrisera infrastrukturen så att den fungerar i vilken prenumeration som helst
- Validera en mall med `azd init` och `azd up`
- Lägga till metadata som community-galleriet kräver

---

## Vad är en mall, egentligen?

En azd-mall är **ett Git-repository** som innehåller, som minimum:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Beskriver tjänster, värdar och infra-leverantör | ✅ Ja |
| `infra/` | Bicep, Terraform eller Pulumi som provisionerar resurser | ✅ Ja |
| `src/` (or your code) | Applikationskoden som azd distribuerar | ✅ Ja |
| `README.md` | Hur man använder mallen | ✅ Stark rekommendation |
| `.azdo/` eller `.github/` | Definitioner för CI/CD-pipelines | Valfritt |
| `.devcontainer/` | Reproducerbar utvecklingsmiljö | Valfritt |
| `azure.yaml` `metadata` | Galleri- och telemetriinformation | Valfritt (krävs för publicering) |

Det är inget magiskt här: när du kör `azd init --template you/your-repo`, klonar azd repot och läser `azure.yaml`.

---

## Steg 1: Skapa repository-strukturen

Skapa mappstrukturen för hand eller börja från en minimal mall och redigera den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Skapa standardlayouten
mkdir -p src infra
```

En typisk färdig struktur ser ut så här:

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

Detta är mallens hjärta. Det talar om för azd vad som ska distribueras och hur:

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

> Fältet `metadata.template` är vad galleriets telemetri använder för att räkna användning. Använd konventionen `name@version`.

---

## Steg 3: Parametrisera infrastrukturen

Den viktigaste regeln för en *återanvändbar* mall: **använd aldrig hårdkodade namn, regioner eller prenumerationsspecifika värden.** Använd parametrar och resurstoken-mönstret så att samma mall fungerar i någon annans prenumeration.

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

Två saker gör den här mallen återanvändbar:

1. **`azd-env-name`-taggen** — azd använder den för att spåra och städa upp resurser per miljö.
2. **`uniqueString(...)` resurstoken** — genererar ett stabilt, globalt unikt suffix så att namn inte kolliderar.

Tillhandahåll en matchande parameterfil som läser värden som azd injicerar från miljön:

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

azd ersätter `${AZURE_ENV_NAME}` och `${AZURE_LOCATION}` från den aktuella miljön automatiskt.

---

## Steg 4: Testa din mall lokalt

Innan du delar, bekräfta att mallen fungerar från en ren miljö.

**Testa från den lokala mappen** (ingen Git-push krävs):

```bash
# Från en tom katalog, initiera med din lokala mallväg
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionera och driftsätt från början till slut
azd auth login
azd up
```

**Testa sedan nedmontering**—en bra mall städar upp helt:

```bash
azd down --force --purge
```

Om `azd down` lämnar resurser kvar har du förmodligen missat `azd-env-name`-taggen på en resurs.

> **Tips:** kör `azd provision --preview` först. Den utför en what-if och visar mallfel innan någon resurs skapas.

---

## Steg 5: Publicera mallen

Pusha repot till GitHub (offentligt om du vill att andra ska kunna använda det):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nu kan vem som helst använda den:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Steg 6 (valfritt): Skicka in till Awesome AZD

[Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) listar community-mallar. För att bli listad bör ditt repo innehålla:

- ✅ En tydlig `README.md` med förutsättningar, ett arkitekturdiagram och kostnadsanteckningar
- ✅ En fungerande `azure.yaml` med `metadata.template`
- ✅ Infrastruktur som provisioneras utan problem i en ny prenumeration
- ✅ En `LICENSE`-fil
- ✅ (Rekommenderat) En `.devcontainer/` för en-knapps Codespaces

Skicka in genom att öppna en pull request som lägger till din mall i galleriets datafil, enligt bidragsguiden i [Awesome AZD-repositoriet](https://github.com/Azure/awesome-azd).

---

## Vanliga fallgropar

| Fallgrop | Lösning |
|---------|-----|
| Hårdkodade resursnamn | Använd `uniqueString()` resurstoken |
| `azd down` lämnar resurser | Tagga varje resurs (eller resursgruppen) med `azd-env-name` |
| Mallen fungerar för dig men misslyckas för andra | Ta bort prenumerations-ID:n, tenant-ID:n och antaganden om regioner |
| Utdata inte kopplade till appen | Exportera `SERVICE_<NAME>_ENDPOINT_URL` och andra `AZURE_*`-utdata |
| Galleriinlämning avvisad | Lägg till `README.md`, `LICENSE` och `metadata.template` |

---

## Sammanfattning

- En mall är bara ett Git-repo med `azure.yaml`, `infra/` och din kod.
- Parametrisera allt—namn, regioner och ID:n—så att det körs var som helst.
- Tagga alltid resurser med `azd-env-name` så att `azd down` fungerar.
- Testa lokalt med `azd init --template <local-path>` innan publicering.
- Lägg till metadata och en README för att skicka in till Awesome AZD.

---

## 🔗 Navigering

| Direction | Resource |
|-----------|----------|
| **Föregående** | [Deployment Guide](deployment-guide.md) |
| **Kapitelstartsida** | [Chapter 4: Infrastructure as Code](README.md) |
| **Nästa kapitel** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Relaterade resurser

- [Provisionering av resurser](provisioning.md)
- [Awesome AZD-galleriet](https://azure.github.io/awesome-azd/)
- [Officiell azd-mall-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->