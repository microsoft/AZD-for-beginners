# Ta med din egen app - Legg til azd i et eksisterende prosjekt

**Chapter Navigation:**
- **📚 Course Home**: [AZD for nybegynnere](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Ditt første prosjekt](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Validert mot `azd 1.25.6` i juni 2026.

## Introduction

I [Ditt første prosjekt](first-project.md) distribuerte du en app ved å starte fra en mal. Men som oftest *har* du allerede en app — en Node.js API, en Python Flask-tjeneste, en .NET nettapp — som ligger i en mappe på maskinen din. Denne leksjonen viser hvordan du legger til azd i den eksisterende koden slik at du kan distribuere den med `azd up`, uten å bruke en mal.

## Learning Goals

Når du er ferdig med denne leksjonen vil du:
- Forstå de tre måtene å starte et azd-prosjekt på
- Kjøre `azd init` inne i en eksisterende kodebase
- Forstå hva `azure.yaml` og `infra/`-mappen gjør for appen din
- Vite når du skal la azd generere infrastruktur vs. skrive din egen
- Distribuere din eksisterende app til Azure med `azd up`

## Learning Outcomes

Etter å ha fullført denne leksjonen vil du kunne:
- Initialisere azd i et prosjekt du allerede har
- Lese og redigere en grunnleggende `azure.yaml`-fil
- Generere startinfrastruktur med `azd infra generate`
- Velge en passende Azure-vert for appen din
- Distribuere og rydde opp i din egen applikasjon

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Læring, eller når du starter en ny app fra et gjennomprøvd eksempel |
| **From your existing code** | `azd init` (in your project folder) | Du har allerede en app og ønsker å distribuere den |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Ta i bruk azd for et eksisterende repository |

Du har allerede øvd på det første alternativet. Denne leksjonen dekker det andre — det vanligste scenariet i praksis.

---

## Step 1: Run `azd init` in Your Project

Åpne en terminal **inne i den eksisterende prosjektmappen** og kjør:

```bash
cd my-existing-app
azd init
```

azd vil spørre hvordan du vil initialisere. Velg:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Velg **"Bruk kode i den nåværende katalogen."** azd skanner deretter mappen din, oppdager språk og rammeverk, og foreslår en vert.

### What azd detects

azd ser etter signaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, eller en `Dockerfile`, og foreslår en matchende Azure-vert:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service eller Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Bekreft de oppdagede tjenestene, og azd genererer de filene du trenger.

---

## Step 2: Understand What azd Created

Etter init vil du ha to nye ting i prosjektet ditt:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — prosjektdefinisjonen

Dette er hjertet i et azd-prosjekt. En minimal en ser slik ut:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blokken `services` er den viktigste delen: hver oppføring kobler en mappe i koden din til en Azure-vert. Hvis appen din har både frontend og et API, vil du ha to tjenester.

### `infra/` — dine Azure-ressurser som kode

Mappen `infra/` inneholder Bicep-filer som definerer Azure-ressursene appen din trenger (App Service, databasen osv.). Du trenger ikke å skrive disse for hånd — azd genererer et fungerende utgangspunkt. Du *kan* redigere dem senere for å legge til ressurser eller skjerpe sikkerheten (dekket i [Kapittel 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Vil du se eller tilpasse den genererte infrastrukturen før du distribuerer? Kjør `azd infra generate` (også tilgjengelig som `azd infra synth`) for å skrive IaC til disk slik at du kan gjennomgå og versjonskontrollere den.

---

## Step 3: Set Required Configuration

Hvis appen din trenger innstillinger eller hemmeligheter (en tilkoblingsstreng, en API-nøkkel), ikke hardkod dem. Bruk miljøverdier:

```bash
# Opprett et miljø
azd env new dev

# Sett en ikke-hemmelig verdi
azd env set API_VERSION 1.0.0
```

For ekte hemmeligheter, lagre dem i Key Vault og referer til dem fra infrastrukturen din — se [Kapittel 3: Konfigurasjon og autentisering](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Bruk nå samme arbeidsflyt som du allerede kjenner:

```bash
# Autentiser (påkrevd for azd)
azd auth login

# Forhåndsvis ressursene som vil bli opprettet
azd provision --preview

# Opprett infrastruktur og distribuer koden din
azd up
```

Når den er ferdig, skriver azd ut appens URL. Verifiser den på samme måte som en hvilken som helst azd-app:

```bash
azd show           # vis endepunkter
azd monitor --logs # sjekk logger om nødvendig
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd oppdaget ikke appen min | Manglende manifest (f.eks. `package.json`) | Legg til manifestet, eller velg verten manuelt under `azd init` |
| Byggingen feiler under `azd up` | Appen trenger et byggesteg | Legg til `buildCommand`/`outputPath` under tjenesten i `azure.yaml` |
| Appen starter, men returnerer feil | Mangler konfigurasjon/hemmelighet | Angi verdier med `azd env set` eller koble opp Key Vault |
| Feil vert valgt | Automatisk gjenkjenning gjettet feil | Rediger `host:` i `azure.yaml` og kjør `azd up` på nytt |

For mer, se [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Bruk kode i den nåværende katalogen"** legger til azd i en app du allerede har.
- `azure.yaml` kobler kodemappene dine til Azure-verter; `infra/` definerer ressursene som Bicep.
- `azd infra generate` lar deg gjennomgå eller tilpasse den genererte infrastrukturen.
- Når prosjektet er initialisert, bruker din eksisterende app nøyaktig samme `azd up` / `azd down` arbeidsflyt som en mal-basert app.

---

## 🔗 Navigasjon

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Ditt første prosjekt](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Relaterte ressurser

- [AZD-grunnleggende](azd-basics.md)
- [Kapittel 4: Infrastruktur som kode](../chapter-04-infrastructure/README.md)
- [Konfigurasjon og autentisering](../chapter-03-configuration/authsecurity.md)
- [Kommando-hurtigreferanse](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->