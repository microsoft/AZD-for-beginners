# Ta med din egen app - Lägg till azd i ett befintligt projekt

**Kapitelnavigation:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grunder & Snabbstart
- **⬅️ Föregående**: [Ditt Första Projekt](first-project.md)
- **➡️ Nästa**: [Dev Containers & Codespaces](dev-containers.md)

> Kommando- och konfigurationsgranskningsmål: `azd 1.37.2` (november 2026). Genererade filer beror på den upptäckta applikationen; Azure-distributionen utfördes inte i denna granskning.

## Introduktion

I [Ditt Första Projekt](first-project.md) distribuerade du en app genom att börja från en mall. Men oftast har du redan *en* app – en Node.js API, en Python Flask-tjänst, en .NET webbapp – liggande i en mapp på din dator. Den här lektionen visar hur du lägger till azd till den befintliga koden så att du kan distribuera den med `azd up`, ingen mall krävs.

## Lärandemål

Vid slutet av denna lektion kommer du att:
- Förstå de tre sätten att starta ett azd-projekt
- Köra `azd init` i en befintlig kodbas
- Förstå vad `azure.yaml` och mappen `infra/` gör för din app
- Veta när du ska låta azd generera infrastruktur vs att skriva din egen
- Distribuera din befintliga app till Azure med `azd up`

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Initiera azd i ett projekt du redan har
- Läsa och redigera en grundläggande `azure.yaml`-fil
- Generera startinfrastruktur med `azd infra generate`
- Välja en lämplig Azure-värd för din app
- Distribuera och städa upp din egen applikation

---

## Tre sätt att starta ett azd-projekt

| Startpunkt | Kommando | När används |
|----------------|---------|-------------|
| **Från en mall** | `azd init --template <name> .` (tom katalog) | Lära sig eller starta en ny app från ett beprövat exempel |
| **Från din befintliga kod** | `azd init` (i din projektmapp) | Du har redan en app och vill distribuera den |
| **Från ett Git-repo** | `azd init --from-code` (i ett klonat repo) | Införa azd för ett befintligt repository |

Du har redan övat på det första alternativet. Den här lektionen täcker det andra – det vanligaste scenario i verkligheten.

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

Välj **"Use code in the current directory."** azd skannar sedan din mapp, upptäcker ditt språk och ramverk, och föreslår en värd.

### Vad azd upptäcker

azd letar efter applikationssignaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` eller en `Dockerfile`. Förloppet från kod är inte en generell värdvals-guide för varje stödd distributionsmål:

| Din app | Troligt upptäckt värd |
|----------|----------------------|
| Stödd Node.js / Python / .NET webbapp | Vanligtvis Azure Container Apps; inspektera den genererade definitionen |
| Containeriserad app (`Dockerfile`) | Azure Container Apps |
| Funktionsapp eller Static Web Apps-projekt | Använd en matchande mall eller skapa `azure.yaml` och infrastruktur om från kod inte stöder din layout |

Bekräfta den upptäckta tjänsten/tjänsterna, och azd skapar de filer du behöver.

---

## Steg 2: Förstå vad azd skapade

Efter init, undersök `azure.yaml`. Flödet för genererad infrastruktur kan hålla infrastrukturen implicit tills du kör `azd infra generate`; anta inte att `infra/` redan finns:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projektdefinitionen

Detta är kärnan i ett azd-projekt. Följande **illustrativa App Service-definition** kräver matchande App Service-infrastruktur; det är inte en anledning att ändra en genererad Container Apps-värd utan att ändra infrastrukturen:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blocket `services` är den viktiga delen: varje post kopplar en mapp av din kod till en Azure-värd. Om din app har både frontend och API, kommer du ha två tjänster.

### `infra/` — dina Azure-resurser som kod

Mappen `infra/` innehåller Bicep-filer som definierar Azure-resurserna din app behöver (App Service, databasen etc.). Du behöver inte skriva dessa för hand – azd genererar en fungerande startpunkt. Du *kan* redigera dem senare för att lägga till resurser eller skärpa säkerheten (behandlas i [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tips:** Vill du se eller anpassa den genererade infrastrukturen innan du distribuerar? Kör `azd infra generate` (finns även som `azd infra synth`) för att skriva IaC till disk så att du kan granska och versionshantera den.

---

## Steg 3: Ställ in nödvändig konfiguration

Om din app behöver inställningar eller hemligheter (en anslutningssträng, en API-nyckel), ska du inte hårdkoda dem. Använd miljövärden:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Detta sparar endast ett lokalt värde. För att påverka appen måste du uttryckligen konsumera det i infrastrukturparametrar, en stödd tjänstinställning, eller en hook; att bara sätta en godtycklig variabel konfigurerar inte den distribuerade runtime-miljön.

För riktiga hemligheter, lagra dem i Key Vault och referera till dem från din infrastruktur – se [Kapitel 3: Konfiguration & autentisering](../chapter-03-configuration/authsecurity.md).

---

## Steg 4: Distribuera

Använd nu samma arbetsflöde som du redan känner till:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

När det är klart, visar azd URL:en för din app. Verifiera den på samma sätt som en vilken azd-app som helst:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Vanliga problem första gången

| Symptom | Trolig orsak | Lösning |
|---------|--------------|-----|
| azd upptäckte inte min app | Saknas manifest (t.ex. `package.json`) | Lägg till manifestet, eller välj värd manuellt under `azd init` |
| Build misslyckas under `azd up` | Appen behöver ett byggsteg | Konfigurera appens paketskript eller tjänstens `prepackage` hook; använd `dist` för distributionsutdata, inte `buildCommand`/`outputPath` |
| Appen startar men ger fel | Saknad konfig/hemlighet | Koppla värden till runtime-appinställningar eller en Key Vault-referens; `azd env set` räcker inte ensam |
| Fel värd valdes | Automatisk upptäckt matchar inte dina behov | Ändra både `host:` och motsvarande infrastruktur, eller välj en matchande mall |

För mer, se [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md).

---

## Rensa upp

```bash
azd down --force --purge
```

---

## Sammanfattning

- `azd init` → **"Use code in the current directory"** lägger till azd i en app du redan har.
- `azure.yaml` kopplar dina kodmappar till Azure-värdar; `infra/` definierar resurserna som Bicep.
- `azd infra generate` låter dig granska eller anpassa den genererade infrastrukturen.
- När det är initierat använder din befintliga app exakt samma `azd up` / `azd down` arbetsflöde som en mallbaserad app.

---

## 🔗 Navigering

| Riktning | Lektion |
|-----------|--------|
| **Föregående** | [Ditt Första Projekt](first-project.md) |
| **Nästa** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Relaterade resurser

- [AZD Basics](azd-basics.md)
- [Kapitel 4: Infrastruktur som kod](../chapter-04-infrastructure/README.md)
- [Konfiguration & autentisering](../chapter-03-configuration/authsecurity.md)
- [Kommandofusklapp](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->