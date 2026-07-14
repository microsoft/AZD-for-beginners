# Skapa Din Egen azd-mall

**Kapitelnavigation:**
- **📚 Kursens Startsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 4 - Infrastruktur som Kod & Distribution
- **⬅️ Föregående**: [Distribueringsguide](deployment-guide.md)
- **🚀 Nästa Kapitel**: [Kapitel 5: Multi-Agent Lösningar](../chapter-05-multi-agent/README.md)

> Validerad mot `azd 1.27.1` i juli 2026.

## Introduktion

Hittills har du *använt* mallar med `azd init --template <name>`. Men när du väl har en projektstruktur som ditt team gillar—till exempel en Container App med Cosmos DB och rätt övervakning—vill du göra om den till en återanvändbar mall. En mall är helt enkelt ett Git-repo med en förutsägbar struktur som azd vet hur man läser. Denna lektion visar hur du skapar en från grunden, testar den och (valfritt) publicerar den till community-galleriet.

## Lärandemål

I slutet av denna lektion ska du:
- Förstå vad som gör en mapp till en "azd-mall"
- Känna till nödvändiga filer och mappstruktur
- Lägga till en `azure.yaml` och `infra/` som andra kan återanvända
- Testa din mall lokalt innan du delar den
- Publicera den och (valfritt) skicka in den till Awesome AZD

## Läranderesultat

Efter lektionen kan du:
- Skapa ett nytt mall-repo
- Parametrisera infrastruktur så att den fungerar i vilken prenumeration som helst
- Verifiera en mall med `azd init` och `azd up`
- Lägga till metadata som community-galleriet kräver

---

## Vad är egentligen en mall?

En azd-mall är **ett Git-repo** som innehåller, minst:

| Fil / mapp | Syfte | Obligatorisk? |
|-----------|--------|---------------|
| `azure.yaml` | Beskriver tjänster, värdar och infra-leverantör | ✅ Ja |
| `infra/` | Bicep, Terraform eller Pulumi som tillhandahåller resurser | ✅ Ja |
| `src/` (eller din kod) | Applikationskoden som azd deployar | ✅ Ja |
| `README.md` | Hur man använder mallen | ✅ Stark rekommendation |
| `.azdo/` eller `.github/` | CI/CD pipelines | Valfritt |
| `.devcontainer/` | Reproducerbar utvecklingsmiljö | Valfritt |
| `azure.yaml` `metadata` | Galleri + telemetri information | Valfritt (obligatoriskt för publicering) |

Det finns inget magiskt här: när du kör `azd init --template you/your-repo`, klonar azd repo och läser `azure.yaml`.

---

## Steg 1: Skapa Repositoriet

Skapa mappstrukturen manuellt eller börja från en minimal mall och redigera den:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Skapa standardlayouten
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

> Fältet `metadata.template` är vad galleri-telemetrin använder för att räkna användning. Använd konventionen `name@version`.

---

## Steg 3: Parametrisera Infrastrukturen

Den enskilt viktigaste regeln för en *återanvändbar* mall: **aldig hårdkoda namn, regioner eller prenumerationsspecifika värden.** Använd parametrar och resurs-token-mönstret så att samma mall fungerar i vem som helst prenumeration.

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

Två saker gör denna mall mallvänlig:

1. **`azd-env-name` tagg** — azd använder den för att spåra och rensa resurser per miljö.
2. **`uniqueString(...)` resurs-token** — producerar ett stabilt, globalt unikt suffix så att namn inte kolliderar.

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

azd ersätter `${AZURE_ENV_NAME}` och `${AZURE_LOCATION}` automatiskt från den aktuella miljön.

---

## Steg 4: Testa Din Mall Lokalt

Innan du delar, bevisa att mallen fungerar från ett rent tillstånd.

**Testa från den lokala mappen** (ingen Git-push krävs):

```bash
# Från en tom katalog, initiera med din lokala mallväg
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Tillhandahåll + distribuera från början till slut
azd auth login
azd up
```

**Testa sedan nedmonteringen**—en bra mall städar upp helt:

```bash
azd down --force --purge
```

Om `azd down` lämnar resurser kvar har du antagligen glömt `azd-env-name` taggen på en resurs.

> **Tips:** kör `azd provision --preview` först. Det gör en what-if-analys och visar mallfel innan några resurser skapas.

---

## Steg 5: Publicera Mallen

Push repo till GitHub (offentligt om du vill att andra ska använda det):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nu kan vem som helst använda det:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Steg 6 (Valfritt): Skicka in till Awesome AZD

[Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) listar community-mallar. För att bli listad bör ditt repo innehålla:

- ✅ En tydlig `README.md` med förutsättningar, ett arkitekturdiagram och kostnadsnoteringar
- ✅ En fungerande `azure.yaml` med `metadata.template`
- ✅ Infrastruktur som provisioneras rent i en ny prenumeration
- ✅ En `LICENSE`-fil
- ✅ (Rekommenderat) En `.devcontainer/` för en-klick Codespaces

Skicka in genom att öppna en pull request som lägger till din mall i galleriers datafil, följande bidragsguiden på [Awesome AZD-repot](https://github.com/Azure/awesome-azd).

---

## Vanliga Fallgropar

| Fallgrop | Lösning |
|---------|---------|
| Hårdkodade resursnamn | Använd `uniqueString()` resurs-token |
| `azd down` lämnar resurser | Tagga varje resurs (eller resursgruppen) med `azd-env-name` |
| Mallen funkar för dig, inte för andra | Ta bort prenumerations-ID:n, tenant-ID:n och regionantaganden |
| Utdatan kopplas inte till appen | Exportera `SERVICE_<NAME>_ENDPOINT_URL` och andra `AZURE_*`-utdata |
| Galleriinlämning avvisad | Lägg till `README.md`, `LICENSE` och `metadata.template` |

---

## Sammanfattning

- En mall är ett Git-repo med `azure.yaml`, `infra/` och din kod.
- Parametrisera allt—namn, regioner och ID:n—så att det fungerar var som helst.
- Tagga alltid resurser med `azd-env-name` så att `azd down` fungerar.
- Testa lokalt med `azd init --template <local-path>` innan du publicerar.
- Lägg till metadata och en README för att skicka in till Awesome AZD.

---

## 🔗 Navigation

| Riktning | Resurs |
|----------|---------|
| **Föregående** | [Distribueringsguide](deployment-guide.md) |
| **Kapitel Startsida** | [Kapitel 4: Infrastruktur som Kod](README.md) |
| **Nästa Kapitel** | [Kapitel 5: Multi-Agent Lösningar](../chapter-05-multi-agent/README.md) |

## 📖 Relaterade Resurser

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Officiell azd-malldokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->