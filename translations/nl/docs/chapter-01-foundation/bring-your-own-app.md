# Bring Your Own App - Voeg azd toe aan een bestaand project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Geverifieerd met `azd 1.25.6` in juni 2026.

## Introductie

In [Your First Project](first-project.md) heb je een app gedeployed door te beginnen vanuit een template. Maar meestal heb je al een app—een Node.js API, een Python Flask-service, een .NET-webapp—die al in een map op je machine staat. Deze les laat zien hoe je azd toevoegt aan die bestaande code, zodat je het met `azd up` kunt deployen, zonder template.

## Leerdoelen

Aan het einde van deze les zul je:
- Begrijpen op welke drie manieren je een azd-project kunt starten
- `azd init` uitvoeren binnen een bestaande codebase
- Begrijpen wat `azure.yaml` en de `infra/`-map voor je app doen
- Weten wanneer je azd infrastructuur laat genereren versus wanneer je je eigen infra schrijft
- Je bestaande app naar Azure deployen met `azd up`

## Leerresultaten

Na het voltooien van deze les kun je:
- azd initialiseren in een project dat je al hebt
- Een basis `azure.yaml`-bestand lezen en bewerken
- Starter-infrastructuur genereren met `azd infra generate`
- Een geschikte Azure-host voor je app kiezen
- Je eigen applicatie deployen en opruimen

---

## Drie manieren om een azd-project te starten

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Leren, of beginnen met een nieuwe app vanuit een beproefd voorbeeld |
| **From your existing code** | `azd init` (in your project folder) | Je hebt al een app en wilt deze deployen |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Azd overnemen voor een bestaande repository |

Je hebt al geoefend met de eerste optie. Deze les behandelt de tweede—de meest voorkomende situatie in de praktijk.

---

## Stap 1: Voer `azd init` uit in je project

Open een terminal **in je bestaande projectmap** en voer uit:

```bash
cd my-existing-app
azd init
```

azd zal vragen hoe je wilt initialiseren. Kies:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Kies **"Use code in the current directory."** azd scant vervolgens je map, detecteert je taal en framework, en stelt een host voor.

### Wat azd detecteert

azd zoekt naar signalen zoals `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, of een `Dockerfile`, en stelt een bijpassende Azure-host voor:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Bevestig de gedetecteerde service(s), en azd genereert de bestanden die je nodig hebt.

---

## Stap 2: Begrijp wat azd heeft aangemaakt

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

De `services`-blok is het belangrijkste deel: elke vermelding koppelt een map van je code aan een Azure-host. Als je app zowel een frontend als een API heeft, zul je twee services hebben.

### `infra/` — je Azure-resources als code

De `infra/`-map bevat Bicep-bestanden die de Azure-resources definiëren die je app nodig heeft (de App Service, de database, enz.). Je hoeft deze niet handmatig te schrijven—azd genereert een werkend startpunt. Je *kunt* ze later bewerken om resources toe te voegen of de beveiliging aan te scherpen (behandeld in [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Wil je de gegenereerde infrastructuur bekijken of aanpassen voordat je deployt? Voer `azd infra generate` uit (ook beschikbaar als `azd infra synth`) om de IaC naar schijf te schrijven zodat je het kunt bekijken en onder versiebeheer kunt zetten.

---

## Stap 3: Stel vereiste configuratie in

Als je app instellingen of secrets nodig heeft (een connection string, een API-sleutel), codeer die dan niet hard. Gebruik omgevingswaarden:

```bash
# Maak een omgeving aan
azd env new dev

# Stel een niet-geheime waarde in
azd env set API_VERSION 1.0.0
```

Voor echte secrets, sla ze op in Key Vault en verwijs ernaar vanuit je infrastructuur—zie [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Stap 4: Deploy

Gebruik nu dezelfde workflow die je al kent:

```bash
# Authenticeer (vereist voor azd)
azd auth login

# Bekijk de resources die zullen worden aangemaakt
azd provision --preview

# Voorzie infrastructuur en rol je code uit
azd up
```

Wanneer het klaar is, geeft azd de URL van je app weer. Verifieer het op dezelfde manier als bij elke azd-app:

```bash
azd show           # eindpunten weergeven
azd monitor --logs # controleer logbestanden indien nodig
```

---

## Veelvoorkomende problemen bij de eerste keer

| Symptoom | Waarschijnlijke oorzaak | Oplossing |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Voor meer, zie [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

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
- Zodra geïnitieerd, gebruikt je bestaande app precies dezelfde `azd up` / `azd down`-workflow als een op een template gebaseerde app.

---

## 🔗 Navigatie

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Gerelateerde bronnen

- [AZD Basics](azd-basics.md)
- [Hoofdstuk 4: Infrastructuur als Code](../chapter-04-infrastructure/README.md)
- [Configuratie & Authenticatie](../chapter-03-configuration/authsecurity.md)
- [Overzicht van commando's](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->