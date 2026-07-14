# Bring Your Own App - Legg til azd i et eksisterende prosjekt

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag & Rask start
- **⬅️ Forrige**: [Ditt første prosjekt](first-project.md)
- **➡️ Neste**: [Utviklingscontainere & Codespaces](dev-containers.md)

> Validert med `azd 1.27.1` i juli 2026.

## Introduksjon

I [Ditt første prosjekt](first-project.md) distribuerte du en app ved å starte fra en mal. Men som oftest *har* du allerede en app – en Node.js API, en Python Flask-tjeneste, en .NET webapp – som ligger i en mappe på maskinen din. Denne leksjonen viser hvordan du legger til azd i den eksisterende koden slik at du kan distribuere den med `azd up`, ingen mal nødvendig.

## Læringsmål

Når du er ferdig med denne leksjonen, vil du:
- Forstå de tre måtene å starte et azd-prosjekt
- Kjøre `azd init` i en eksisterende kodebase
- Forstå hva `azure.yaml` og `infra/`-mappen gjør for appen din
- Vite når du skal la azd generere infrastruktur vs. skrive din egen
- Deployere din eksisterende app til Azure med `azd up`

## Læringsutbytte

Etter å ha fullført denne leksjonen, vil du kunne:
- Initialisere azd i et prosjekt du allerede har
- Lese og redigere en enkel `azure.yaml`-fil
- Generere startinfrastruktur med `azd infra generate`
- Velge en passende Azure-vert for appen din
- Distribuere og rydde opp i din egen applikasjon

---

## Tre måter å starte et azd-prosjekt på

| Startpunkt | Kommando | Når du skal bruke det |
|----------------|---------|-------------|
| **Fra en mal** | `azd init --template <name>` | Læring, eller starte en ny app fra en tested mal |
| **Fra din eksisterende kode** | `azd init` (i prosjektmappen) | Du har allerede en app og vil distribuere den |
| **Fra et Git-repo** | `azd init --from-code` (i et klonet repo) | Ta i bruk azd for et eksisterende repo |

Du har allerede praktisert det første alternativet. Denne leksjonen dekker det andre—det vanligste scenariet i praksis.

---

## Steg 1: Kjør `azd init` i prosjektet ditt

Åpne et terminalvindu **inne i din eksisterende prosjektmappe** og kjør:

```bash
cd my-existing-app
azd init
```

azd spør hvordan du vil initialisere. Velg:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Velg **"Use code in the current directory."** azd skanner mappen din, oppdager språk og rammeverk, og foreslår en vert.

### Hva azd oppdager

azd ser etter signaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` eller en `Dockerfile`, og foreslår en tilsvarende Azure-vert:

| Din app | Sannsynlig oppdaget vert |
|----------|----------------------|
| Node.js / Python / .NET webapp | Azure App Service eller Container Apps |
| Containerisert app (`Dockerfile`) | Azure Container Apps |
| Funksjonsapp | Azure Functions |
| Statisk nettsted (React/Vue build output) | Azure Static Web Apps |

Bekreft den oppdagede tjenesten(e), og azd bygger opp filene du trenger.

---

## Steg 2: Forstå hva azd opprettet

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

Dette er kjernen i et azd-prosjekt. En minimal fil ser slik ut:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services`-blokken er nøkkeldelen: hver oppføring kobler en kode-mappe til en Azure-vert. Hvis appen din har både frontend og API, vil du ha to tjenester.

### `infra/` — dine Azure-ressurser som kode

`infra/`-mappen inneholder Bicep-filer som definerer Azure-ressursene appen din trenger (App Service, databasen, osv.). Du trenger ikke å skrive disse manuelt—azd genererer et fungerende utgangspunkt. Du *kan* redigere dem senere for å legge til ressurser eller stramme inn sikkerheten (behandlet i [Kapittel 4](../chapter-04-infrastructure/README.md)).

> **Tips:** Vil du se eller tilpasse den genererte infrastrukturen før distribusjon? Kjør `azd infra generate` (også tilgjengelig som `azd infra synth`) for å skrive IaC til disk, slik at du kan gjennomgå og versjonskontrollere det.

---

## Steg 3: Sett påkrevd konfigurasjon

Hvis appen din trenger innstillinger eller hemmeligheter (en tilkoblingsstreng, en API-nøkkel), ikke hardkod dem. Bruk miljøverdier:

```bash
# Opprett et miljø
azd env new dev

# Sett en ikke-hemmelig verdi
azd env set API_VERSION 1.0.0
```

For ekte hemmeligheter, lagre dem i Key Vault og referer til dem fra infrastrukturen—se [Kapittel 3: Konfigurasjon & Autentisering](../chapter-03-configuration/authsecurity.md).

---

## Steg 4: Distribuer

Nå bruker du samme arbeidsflyt som du allerede kjenner:

```bash
# Autentiser (kreves for azd)
azd auth login

# Forhåndsvis ressursene som vil bli opprettet
azd provision --preview

# Tilrettelegg infrastruktur og distribuer koden din
azd up
```

Når den er ferdig, skriver azd ut URL-en til appen din. Verifiser det på samme måte som med andre azd-apper:

```bash
azd show           # vis endepunkter
azd monitor --logs # sjekk logger om nødvendig
```

---

## Vanlige problemer første gang

| Symptom | Sannsynlig årsak | Løsning |
|---------|--------------|-----|
| azd oppdaget ikke appen min | Manglende manifest (f.eks. `package.json`) | Legg til manifestet, eller velg vert manuelt under `azd init` |
| Bygg feiler under `azd up` | Appen trenger et byggesteg | Legg til `buildCommand`/`outputPath` under tjenesten i `azure.yaml` |
| Appen starter men gir feil | Mangler konfigurasjon/hemmelighet | Sett verdier med `azd env set` eller koble til Key Vault |
| Feil vert valgt | Auto-detektering gjettet feil | Rediger `host:` i `azure.yaml` og kjør `azd up` på nytt |

For mer, se [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md).

---

## Rydd opp

```bash
azd down --force --purge
```

---

## Oppsummering

- `azd init` → **"Use code in the current directory"** legger til azd i en app du allerede har.
- `azure.yaml` kobler kode-mappene dine til Azure-verter; `infra/` definerer ressursene som Bicep.
- `azd infra generate` lar deg gjennomgå eller tilpasse den genererte infrastrukturen.
- Når initialisert bruker din eksisterende app nøyaktig samme `azd up` / `azd down` arbeidsflyt som en mal-basert app.

---

## 🔗 Navigasjon

| Retning | Leksjon |
|-----------|--------|
| **Forrige** | [Ditt første prosjekt](first-project.md) |
| **Neste** | [Utviklingscontainere & Codespaces](dev-containers.md) |

## 📖 Relaterte ressurser

- [AZD Grunnleggende](azd-basics.md)
- [Kapittel 4: Infrastruktur som kode](../chapter-04-infrastructure/README.md)
- [Konfigurasjon & Autentisering](../chapter-03-configuration/authsecurity.md)
- [Kommando Oversikt](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->