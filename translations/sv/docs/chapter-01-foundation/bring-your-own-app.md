# Ta med din egen app - Lägg till azd i ett befintligt projekt

**Kursnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund & Snabbstart
- **⬅️ Föregående**: [Ditt första projekt](first-project.md)
- **➡️ Nästa**: [Utvecklingscontainrar & Codespaces](dev-containers.md)

> Validerad mot `azd 1.25.6` i juni 2026.

## Introduktion

I [Ditt första projekt](first-project.md) distribuerade du en app genom att utgå från en mall. Men oftast har du redan *en* app—en Node.js API, en Python Flask-tjänst, en .NET webbapp—liggande i en mapp på din maskin. Denna lektion visar hur du lägger till azd i den befintliga koden så att du kan distribuera den med `azd up`, ingen mall krävs.

## Lärandemål

I slutet av denna lektion kommer du att:
- Förstå de tre sätten att starta ett azd-projekt
- Köra `azd init` i en befintlig kodbas
- Förstå vad `azure.yaml` och mappen `infra/` gör för din app
- Veta när du ska låta azd generera infrastruktur vs. skriva din egen
- Distribuera din befintliga app till Azure med `azd up`

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Initiera azd i ett projekt du redan har
- Läsa och redigera en grundläggande `azure.yaml`-fil
- Generera startinfrastruktur med `azd infra generate`
- Välja en lämplig Azure-värd för din app
- Distribuera och ta bort din egen applikation

---

## Tre sätt att starta ett azd-projekt

| Utgångspunkt | Kommando | När använda |
|----------------|---------|-------------|
| **Från en mall** | `azd init --template <name>` | Lärande, eller när du startar en ny app från ett beprövat exempel |
| **Från din befintliga kod** | `azd init` (i din projektmapp) | Du har redan en app och vill distribuera den |
| **Från ett Git-repo** | `azd init --from-code` (i ett klonat repo) | Införa azd i ett befintligt repository |

Du övade redan på det första alternativet. Den här lektionen täcker det andra—det vanligaste scenariot i verkliga projekt.

---

## Steg 1: Kör `azd init` i ditt projekt

Öppna en terminal **inne i din befintliga projektmapp** och kör:

```bash
cd my-existing-app
azd init
```

azd frågar hur du vill initiera. Välj:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Välj **"Använd koden i den aktuella katalogen."** azd skannar sedan din mapp, upptäcker ditt språk och ramverk, och föreslår en värd.

### Vad azd upptäcker

azd letar efter signaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, eller en `Dockerfile`, och föreslår en matchande Azure-värd:

| Din app | Troligt förslag på värd |
|----------|----------------------|
| Node.js / Python / .NET webbapp | Azure App Service eller Container Apps |
| Containeriserad app (`Dockerfile`) | Azure Container Apps |
| Funktionsapp | Azure Functions |
| Statisk webbplats (React/Vue byggresultat) | Azure Static Web Apps |

Bekräfta de upptäckta tjänsterna, så skapar azd de filer du behöver.

---

## Steg 2: Förstå vad azd skapade

Efter init kommer du att ha två nya saker i ditt projekt:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projektdefinitionen

Detta är hjärtat i ett azd-projekt. En minimal ser ut så här:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blocket `services` är nyckeldelen: varje post kopplar en mapp i din kod till en Azure-värd. Om din app har både ett frontend och ett API kommer du att ha två tjänster.

### `infra/` — dina Azure-resurser som kod

Mappen `infra/` innehåller Bicep-filer som definierar de Azure-resurser din app behöver (App Service, databasen, etc.). Du behöver inte skriva dessa för hand—azd genererar en fungerande startpunkt. Du *kan* redigera dem senare för att lägga till resurser eller skärpa säkerheten (behandlas i [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tips:** Vill du se eller anpassa den genererade infrastrukturen innan distribution? Kör `azd infra generate` (finns även som `azd infra synth`) för att skriva IaC till disk så att du kan granska och versionskontrollera den.

---

## Steg 3: Ange nödvändig konfiguration

Om din app behöver inställningar eller hemligheter (en anslutningssträng, en API-nyckel), hårdkoda dem inte. Använd miljövärden:

```bash
# Skapa en miljö
azd env new dev

# Ange ett icke-hemligt värde
azd env set API_VERSION 1.0.0
```

För riktiga hemligheter, lagra dem i Key Vault och referera till dem från din infrastruktur—se [Kapitel 3: Konfiguration & Autentisering](../chapter-03-configuration/authsecurity.md).

---

## Steg 4: Distribuera

Använd nu samma arbetsflöde som du redan kan:

```bash
# Autentisera (krävs för azd)
azd auth login

# Förhandsgranska de resurser som kommer att skapas
azd provision --preview

# Provisionera infrastruktur och distribuera din kod
azd up
```

När det är klart skriver azd ut din apps URL. Verifiera den på samma sätt som för vilken azd-app som helst:

```bash
azd show           # visa slutpunkter
azd monitor --logs # kontrollera loggar vid behov
```

---

## Vanliga första-gångsproblem

| Symptom | Trolig orsak | Åtgärd |
|---------|--------------|-----|
| azd upptäckte inte min app | Saknad manifestfil (t.ex. `package.json`) | Lägg till manifestet, eller välj värden manuellt under `azd init` |
| Bygg misslyckas under `azd up` | Appen kräver ett byggsteg | Lägg till `buildCommand`/`outputPath` under tjänsten i `azure.yaml` |
| Appen startar men returnerar fel | Saknad konfig/hemlighet | Sätt värden med `azd env set` eller koppla upp Key Vault |
| Fel värd valdes | Automatisk upptäckt gissade fel | Redigera `host:` i `azure.yaml` och kör om `azd up` |

För mer, se [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md).

---

## Rensa upp

```bash
azd down --force --purge
```

---

## Sammanfattning

- `azd init` → **"Använd koden i den aktuella katalogen"** lägger till azd i en app du redan har.
- `azure.yaml` kopplar dina kodmappar till Azure-värdar; `infra/` definierar resurserna som Bicep.
- `azd infra generate` låter dig granska eller anpassa den genererade infrastrukturen.
- När det är initierat använder din befintliga app exakt samma `azd up` / `azd down`-arbetsflöde som en mallbaserad app.

---

## 🔗 Navigering

| Riktning | Lektion |
|-----------|--------|
| **Föregående** | [Ditt första projekt](first-project.md) |
| **Nästa** | [Utvecklingscontainrar & Codespaces](dev-containers.md) |

## 📖 Relaterade resurser

- [AZD-grunderna](azd-basics.md)
- [Kapitel 4: Infrastruktur som kod](../chapter-04-infrastructure/README.md)
- [Konfiguration & Autentisering](../chapter-03-configuration/authsecurity.md)
- [Kommandosnabbreferens](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->