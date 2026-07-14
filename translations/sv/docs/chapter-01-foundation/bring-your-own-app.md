# Ta med din egen app - Lägg till azd till ett befintligt projekt

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund & Snabbstart
- **⬅️ Föregående**: [Ditt första projekt](first-project.md)
- **➡️ Nästa**: [Utvecklingscontainrar & Codespaces](dev-containers.md)

> Validerad mot `azd 1.27.1` i juli 2026.

## Introduktion

I [Ditt första projekt](first-project.md) distribuerade du en app genom att börja från en mall. Men oftast har du redan *en* app—en Node.js API, en Python Flask-tjänst, en .NET-webbapp—som ligger i en mapp på din dator. Den här lektionen visar hur du lägger till azd till denna befintliga kod så att du kan distribuera den med `azd up`, ingen mall behövs.

## Lärandemål

I slutet av denna lektion kommer du att:
- Förstå de tre sätten att starta ett azd-projekt
- Köra `azd init` i en befintlig kodbas
- Förstå vad `azure.yaml` och mappen `infra/` gör för din app
- Veta när du ska låta azd generera infrastruktur vs. skriva din egen
- Distribuera din befintliga app till Azure med `azd up`

## Läranderesultat

Efter att ha genomfört denna lektion kan du:
- Initiera azd i ett projekt du redan har
- Läsa och redigera en grundläggande `azure.yaml`-fil
- Generera startinfrastruktur med `azd infra generate`
- Välja en lämplig Azure-värd för din app
- Distribuera och städa upp din egen applikation

---

## Tre sätt att starta ett azd-projekt

| Startpunkt | Kommando | När man ska använda |
|----------------|---------|------------------|
| **Från en mall** | `azd init --template <namn>` | Lära sig eller starta en ny app från ett beprövat exempel |
| **Från din befintliga kod** | `azd init` (i din projektmapp) | Du har redan en app och vill distribuera den |
| **Från ett Git-repo** | `azd init --from-code` (i ett klonat repo) | Ta i bruk azd för ett befintligt repository |

Du har redan övat på det första alternativet. Den här lektionen täcker det andra—det vanligaste verkliga scenariot.

---

## Steg 1: Kör `azd init` i ditt projekt

Öppna en terminal **inne i din befintliga projektmapp** och kör:

```bash
cd my-existing-app
azd init
```

azd kommer att fråga hur du vill initiera. Välj:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Välj **"Use code in the current directory."** azd skannar då din mapp, upptäcker ditt språk och ramverk, och föreslår en värd.

### Vad azd upptäcker

azd letar efter signaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` eller en `Dockerfile` och föreslår en matchande Azure-värd:

| Din app | Troligen upptäckt värd |
|----------|-----------------------|
| Node.js / Python / .NET webbapp | Azure App Service eller Container Apps |
| Containeriserad app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Statisk webbplats (React/Vue byggutdata) | Azure Static Web Apps |

Bekräfta den upptäckta tjänsten/tjänsterna, och azd skapar de filer du behöver.

---

## Steg 2: Förstå vad azd skapade

Efter init har du två nya saker i ditt projekt:

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

Detta är hjärtat i ett azd-projekt. En minimal fil ser ut så här:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services`-blocket är nyckeldelen: varje post kopplar en kodmapp till en Azure-värd. Om din app har både en frontend och ett API kommer du ha två tjänster.

### `infra/` — dina Azure-resurser som kod

Mappen `infra/` innehåller Bicep-filer som definierar de Azure-resurser din app behöver (App Service, databasen, etc.). Du behöver inte skriva dessa för hand—azd genererar en fungerande startpunkt. Du *kan* redigera dem senare för att lägga till resurser eller öka säkerheten (behandlas i [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tips:** Vill du se eller anpassa den genererade infrastrukturen innan distribution? Kör `azd infra generate` (finns också som `azd infra synth`) för att skriva IaC till disk så att du kan granska och versionshantera den.

---

## Steg 3: Sätt nödvändig konfiguration

Om din app behöver inställningar eller hemligheter (en anslutningssträng, en API-nyckel) ska du inte hårdkoda dem. Använd miljövärden:

```bash
# Skapa en miljö
azd env new dev

# Sätt ett icke-hemligt värde
azd env set API_VERSION 1.0.0
```

För riktiga hemligheter, lagra dem i Key Vault och referera till dem från din infrastruktur—se [Kapitel 3: Konfiguration & Autentisering](../chapter-03-configuration/authsecurity.md).

---

## Steg 4: Distribuera

Använd nu samma arbetsflöde som du redan kan:

```bash
# Autentisera (krävs för azd)
azd auth login

# Förhandsgranska resurserna som kommer att skapas
azd provision --preview

# Tillhandahåll infrastruktur och distribuera din kod
azd up
```

När det är klart skriver azd ut din apps URL. Verifiera den på samma sätt som vilken azd-app som helst:

```bash
azd show           # visa slutpunkter
azd monitor --logs # kontrollera loggar vid behov
```

---

## Vanliga problem första gången

| Symptom | Trolig orsak | Lösning |
|---------|-------------|--------|
| azd upptäckte inte min app | Saknas manifest (t.ex. `package.json`) | Lägg till manifestet, eller välj värden manuellt vid `azd init` |
| Bygge misslyckas under `azd up` | Appen behöver byggsteg | Lägg till `buildCommand`/`outputPath` under tjänsten i `azure.yaml` |
| App startar men ger fel | Saknad konfiguration/hemlighet | Sätt värden med `azd env set` eller koppla Key Vault |
| Fel värd valdes | Automatisk upptäckt gissade fel | Redigera `host:` i `azure.yaml` och kör `azd up` igen |

För mer, se [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md).

---

## Städa upp

```bash
azd down --force --purge
```

---

## Sammanfattning

- `azd init` → **"Use code in the current directory"** lägger till azd i en app du redan har.
- `azure.yaml` kartlägger dina kodmappar till Azure-värdar; `infra/` definierar resurserna som Bicep.
- `azd infra generate` låter dig granska eller anpassa den genererade infrastrukturen.
- När den är initierad använder din befintliga app exakt samma `azd up` / `azd down` arbetsflöde som en mallbaserad app.

---

## 🔗 Navigering

| Riktning | Lektion |
|----------|---------|
| **Föregående** | [Ditt första projekt](first-project.md) |
| **Nästa** | [Utvecklingscontainrar & Codespaces](dev-containers.md) |

## 📖 Relaterade resurser

- [AZD Grunder](azd-basics.md)
- [Kapitel 4: Infrastruktur som kod](../chapter-04-infrastructure/README.md)
- [Konfiguration & Autentisering](../chapter-03-configuration/authsecurity.md)
- [Kommandokapplista](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->