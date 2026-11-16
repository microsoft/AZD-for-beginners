# Bring Your Own App - Voeg azd toe aan een Bestaand Project

**Hoofdstuk Navigatie:**
- **📚 Cursus thuis**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 1 - Fundament & Snelle Start
- **⬅️ Vorige**: [Je Eerste Project](first-project.md)
- **➡️ Volgende**: [Dev Containers & Codespaces](dev-containers.md)

> Doel van commando- en configuratiebeoordeling: `azd 1.37.2` (november 2026). De gegenereerde bestanden zijn afhankelijk van de gedetecteerde applicatie; Azure-implementatie werd niet uitgevoerd in deze beoordeling.

## Inleiding

In [Je Eerste Project](first-project.md) heb je een app geïmplementeerd door te starten vanaf een sjabloon. Maar in de meeste gevallen *heb* je al een app — een Node.js API, een Python Flask-service, een .NET-webapp — die in een map op je machine staat. Deze les laat zien hoe je azd toevoegt aan die bestaande code zodat je het kunt implementeren met `azd up`, zonder sjabloon.

## Leerdoelen

Aan het einde van deze les zul je:
- De drie manieren begrijpen om een azd-project te starten
- `azd init` uitvoeren binnen een bestaande codebasis
- Begrijpen wat `azure.yaml` en de `infra/` map doen voor je app
- Weten wanneer je azd infrastructuur laat genereren versus zelf schrijven
- Je bestaande app implementeren naar Azure met `azd up`

## Leerresultaten

Na het voltooien van deze les ben je in staat om:
- azd te initialiseren in een project dat je al hebt
- Een basis `azure.yaml` bestand te lezen en aan te passen
- Starter-infrastructuur genereren met `azd infra generate`
- Een geschikte Azure-host te kiezen voor je app
- Je eigen applicatie te implementeren en op te schonen

---

## Drie Manieren om een azd-project te Starten

| Startpunt | Commando | Wanneer te gebruiken |
|----------------|---------|-------------|
| **Vanuit een sjabloon** | `azd init --template <name> .` (lege map) | Leren of starten van een nieuwe app vanuit een bewezen voorbeeld |
| **Vanuit je bestaande code** | `azd init` (in je projectmap) | Je hebt al een app en wilt deze implementeren |
| **Vanuit een Git-repo** | `azd init --from-code` (in een gekloonde repo) | azd adopteren voor een bestaande repository |

Je hebt de eerste optie al geoefend. Deze les behandelt de tweede — het meest voorkomende scenario in de praktijk.

---

## Stap 1: Voer `azd init` uit in je Project

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

Kies **"Gebruik code in de huidige map."** azd scant dan je map, detecteert je taal en framework, en stelt een host voor.

### Wat azd detecteert

azd zoekt naar applicatiekenmerken zoals `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, of een `Dockerfile`. De van-code-stroom is geen algemene wizard voor host-selectie voor elk ondersteund implementatiedoel:

| Je app | Waarschijnlijk gedetecteerde host |
|----------|----------------------|
| Ondersteunde Node.js / Python / .NET webapp | Gewoonlijk Azure Container Apps; bekijk de gegenereerde definitie |
| Gecontaineriseerde app (`Dockerfile`) | Azure Container Apps |
| Function app of Static Web Apps-project | Gebruik een passend sjabloon of maak zelf `azure.yaml` en infrastructuur als van-code je layout niet ondersteunt |

Bevestig de gedetecteerde service(s), en azd maakt de benodigde bestanden aan.

---

## Stap 2: Begrijp Wat azd Heeft Gemaakt

Na init, inspecteer `azure.yaml`. De gegenereerde-infrastructuurstroom kan infrastructuur impliciet houden totdat je `azd infra generate` uitvoert; ga er niet vanuit dat `infra/` al bestaat:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — de projectdefinitie

Dit is het hart van een azd-project. De volgende **illustratieve App Service-definitie** vereist bijpassende App Service-infrastructuur; dit is geen reden om een gegenereerde Container Apps-host te veranderen zonder infrastructuur aan te passen:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Het `services` blok is het belangrijkste onderdeel: elke invoer koppelt een map van je code aan een Azure-host. Heeft je app zowel een frontend als een API, dan heb je twee services.

### `infra/` — je Azure-resources als code

De `infra/` map bevat Bicep-bestanden die de Azure-resources definiëren die je app nodig heeft (de App Service, de database, etc.). Je hoeft deze niet met de hand te schrijven—azd genereert een werkend startpunt. Je *kunt* ze later aanpassen om resources toe te voegen of beveiliging aan te scherpen (behandeld in [Hoofdstuk 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Wil je de gegenereerde infrastructuur bekijken of aanpassen voordat je gaat implementeren? Voer `azd infra generate` uit (ook beschikbaar als `azd infra synth`) om de IaC naar schijf te schrijven zodat je het kunt nakijken en versiebeheer kunt toepassen.

---

## Stap 3: Stel Vereiste Configuratie In

Als je app instellingen of geheimen (zoals een connectiestring, een API-sleutel) nodig heeft, codeer die dan niet hard. Gebruik omgevingswaarden:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Dit slaat alleen een lokale waarde op. Om de app te beïnvloeden, consumeer het expliciet in infrastructuurparameters, een ondersteunde service-instelling, of een hook; het instellen van een willekeurige variabele configureert de gedeployde runtime niet.

Voor echte geheimen sla je ze op in Key Vault en verwijs je daarnaar vanuit je infrastructuur—zie [Hoofdstuk 3: Configuratie & Authenticatie](../chapter-03-configuration/authsecurity.md).

---

## Stap 4: Implementeren

Gebruik nu dezelfde workflow die je al kent:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Als het klaar is, toont azd de URL van je app. Verifieer het op dezelfde manier als elke azd-app:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Veelvoorkomende Eerste-Keer Problemen

| Sympton | Waarschijnlijke oorzaak | Oplossing |
|---------|--------------|-----|
| azd detecteerde mijn app niet | Ontbrekende manifest (bijv. `package.json`) | Voeg het manifest toe, of kies de host handmatig tijdens `azd init` |
| Build faalt tijdens `azd up` | App heeft een buildstap nodig | Configureer de package-scripts van de app of service `prepackage` hook; gebruik `dist` voor implementatie-output, niet `buildCommand`/`outputPath` |
| App start maar geeft fouten | Ontbrekende configuratie/geheim | Verbind waarden met runtime app-instellingen of een Key Vault-verwijzing; alleen `azd env set` is niet genoeg |
| Verkeerde host gekozen | Auto-detectie komt niet overeen met je behoeften | Verander zowel `host:` als de bijbehorende infrastructuur, of kies een passend sjabloon |

Voor meer, zie [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/README.md).

---

## Opruimen

```bash
azd down --force --purge
```

---

## Samenvatting

- `azd init` → **"Gebruik code in de huidige map"** voegt azd toe aan een app die je al hebt.
- `azure.yaml` koppelt je codemappen aan Azure-hosts; `infra/` definieert de resources als Bicep.
- `azd infra generate` laat je de gegenereerde infrastructuur bekijken of aanpassen.
- Na initialisatie gebruikt je bestaande app exact dezelfde `azd up` / `azd down` workflow als een sjabloon-gebaseerde app.

---

## 🔗 Navigatie

| Richting | Les |
|-----------|--------|
| **Vorige** | [Je Eerste Project](first-project.md) |
| **Volgende** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Gerelateerde Bronnen

- [AZD Basisprincipes](azd-basics.md)
- [Hoofdstuk 4: Infrastructuur als Code](../chapter-04-infrastructure/README.md)
- [Configuratie & Authenticatie](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->