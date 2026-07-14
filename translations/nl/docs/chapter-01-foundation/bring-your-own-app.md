# Bring Your Own App - Voeg azd toe aan een bestaand project

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [Je eerste project](first-project.md)
- **➡️ Volgende**: [Dev Containers & Codespaces](dev-containers.md)

> Gecontroleerd met `azd 1.27.1` in juli 2026.

## Introductie

In [Je eerste project](first-project.md) heb je een app gedeployed door te beginnen met een template. Maar meestal heb je al *een* app—een Node.js API, een Python Flask service, een .NET webapp—die ergens op je computer in een map staat. Deze les laat zien hoe je azd toevoegt aan die bestaande code zodat je deze kunt deployen met `azd up`, zonder template.

## Leerdoelen

Aan het einde van deze les zul je:
- Begrijpen wat de drie manieren zijn om een azd-project te starten
- `azd init` kunnen uitvoeren in een bestaande codebasis
- Begrijpen wat `azure.yaml` en de `infra/` map voor je app doen
- Weten wanneer je azd infrastructuur laat genereren versus zelf schrijft
- Je bestaande app deployen naar Azure met `azd up`

## Leerresultaten

Na het afronden van deze les kun je:
- azd initialiseren in een project dat je al hebt
- Een basis `azure.yaml` bestand lezen en bewerken
- Starter infrastructuur genereren met `azd infra generate`
- Een geschikte Azure-host voor je app kiezen
- Je eigen applicatie deployen en opruimen

---

## Drie manieren om een azd-project te starten

| Startpunt | Commando | Wanneer te gebruiken |
|----------------|---------|-------------|
| **Vanuit een template** | `azd init --template <naam>` | Leren, of een nieuwe app starten vanuit een bewezen voorbeeld |
| **Vanuit bestaande code** | `azd init` (in je projectmap) | Je hebt al een app en wilt deze deployen |
| **Vanuit een Git-repo** | `azd init --from-code` (in een gekloonde repo) | azd toepassen op een bestaande repository |

Je hebt de eerste optie al geoefend. Deze les behandelt de tweede—het meest voorkomende scenario in de praktijk.

---

## Stap 1: Voer `azd init` uit in je project

Open een terminal **in je bestaande projectmap** en voer uit:

```bash
cd my-existing-app
azd init
```

azd vraagt hoe je wilt initialiseren. Kies:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Kies **"Use code in the current directory."** azd scant dan je map, detecteert je taal en framework, en stelt een host voor.

### Wat azd detecteert

azd zoekt naar indicatoren zoals `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, of een `Dockerfile`, en stelt een passende Azure-host voor:

| Je app | Waarschijnlijk gedetecteerde host |
|----------|----------------------|
| Node.js / Python / .NET webapp | Azure App Service of Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Statische site (React/Vue build-uitvoer) | Azure Static Web Apps |

Bevestig de gedetecteerde service(s), en azd genereert de benodigde bestanden voor je.

---

## Stap 2: Begrijp wat azd heeft gemaakt

Na init heb je twee nieuwe dingen in je project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — de projectdefinitie

Dit is het hart van een azd-project. Een minimale ziet er zo uit:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

De `services` sectie is het belangrijkste deel: elke invoer koppelt een map van je code aan een Azure-host. Als je app zowel een frontend als een API heeft, heb je twee services.

### `infra/` — je Azure-resources als code

De map `infra/` bevat Bicep-bestanden die de Azure-resources definiëren die je app nodig heeft (de App Service, de database, enz.). Je hoeft deze niet zelf te schrijven—azd genereert een werkend startpunt. Je kunt ze *wel* later aanpassen om resources toe te voegen of de beveiliging te verbeteren (besproken in [Hoofdstuk 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Wil je de gegenereerde infrastructuur zien of aanpassen voordat je deployt? Voer `azd infra generate` uit (ook beschikbaar als `azd infra synth`) om de IaC naar schijf te schrijven zodat je deze kunt bekijken en versiebeheer kunt toepassen.

---

## Stap 3: Stel vereiste configuratie in

Als je app instellingen of geheimen nodig heeft (zoals een verbindingsreeks, een API-sleutel), hardcode deze dan niet. Gebruik omgevingswaarden:

```bash
# Maak een omgeving aan
azd env new dev

# Stel een niet-geheime waarde in
azd env set API_VERSION 1.0.0
```

Voor echte geheimen, sla ze op in Key Vault en verwijs ernaar vanuit je infrastructuur—zie [Hoofdstuk 3: Configuratie & Authenticatie](../chapter-03-configuration/authsecurity.md).

---

## Stap 4: Deploy

Gebruik nu dezelfde workflow die je al kent:

```bash
# Verifiëren (vereist voor azd)
azd auth login

# Bekijk de bronnen die zullen worden gemaakt
azd provision --preview

# Voorzie infrastructuur en implementeer je code
azd up
```

Als het klaar is, toont azd de URL van je app. Controleer deze op dezelfde manier als bij elke azd-app:

```bash
azd show           # laat eindpunten zien
azd monitor --logs # controleer logs indien nodig
```

---

## Veelvoorkomende problemen bij de eerste keer

| Symbool | Waarschijnlijke oorzaak | Oplossing |
|---------|--------------|-----|
| azd detected mijn app niet | Ontbrekend manifest (bijv. `package.json`) | Voeg het manifest toe, of kies handmatig de host tijdens `azd init` |
| Build mislukt tijdens `azd up` | App heeft een build-stap nodig | Voeg `buildCommand`/`outputPath` toe onder de service in `azure.yaml` |
| App start maar geeft fouten terug | Ontbrekende config/geheim | Stel waarden in met `azd env set` of verbind met Key Vault |
| Verkeerde host gekozen | Automatische detectie verkeerd | Bewerk `host:` in `azure.yaml` en voer `azd up` opnieuw uit |

Voor meer informatie, zie [Hoofdstuk 7: Probleemoplossing](../chapter-07-troubleshooting/README.md).

---

## Opruimen

```bash
azd down --force --purge
```

---

## Samenvatting

- `azd init` → **"Use code in the current directory"** voegt azd toe aan een app die je al hebt.
- `azure.yaml` koppelt je code-mappen aan Azure-hosts; `infra/` definieert de resources als Bicep.
- `azd infra generate` laat je de gegenereerde infrastructuur bekijken of aanpassen.
- Na initialisatie gebruikt je bestaande app exact dezelfde `azd up` / `azd down` workflow als een template-gebaseerde app.

---

## 🔗 Navigatie

| Richting | Les |
|-----------|--------|
| **Vorige** | [Je eerste project](first-project.md) |
| **Volgende** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Gerelateerde bronnen

- [AZD Basisprincipes](azd-basics.md)
- [Hoofdstuk 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuratie & Authenticatie](../chapter-03-configuration/authsecurity.md)
- [Command Cheatsheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->