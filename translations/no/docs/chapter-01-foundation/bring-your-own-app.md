# Bring Your Own App - Legg til azd i et eksisterende prosjekt

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag & Rask start
- **⬅️ Forrige**: [Ditt første prosjekt](first-project.md)
- **➡️ Neste**: [Dev Containers & Codespaces](dev-containers.md)

> Kommando- og konfigurasjonsgjennomgang mål: `azd 1.37.2` (november 2026). Genererte filer avhenger av den oppdagede applikasjonen; Azure-distribusjon ble ikke utført i denne gjennomgangen.

## Introduksjon

I [Ditt første prosjekt](first-project.md) deployerte du en app ved å starte fra en mal. Men de fleste ganger har du allerede *en* app—en Node.js API, en Python Flask-tjeneste, en .NET webapp—liggende i en mappe på maskinen din. Denne leksjonen viser hvordan du legger til azd til den eksisterende koden så du kan deployere den med `azd up`, ingen mal nødvendig.

## Læringsmål

Når du er ferdig med denne leksjonen vil du:
- Forstå de tre måtene å starte et azd-prosjekt på
- Kjøre `azd init` inne i en eksisterende kodebase
- Forstå hva `azure.yaml` og mappen `infra/` gjør for appen din
- Vite når du skal la azd generere infrastruktur vs. skrive din egen
- Deployere din eksisterende app til Azure med `azd up`

## Læringsresultater

Etter å ha fullført denne leksjonen vil du kunne:
- Initialisere azd i et prosjekt du allerede har
- Lese og redigere en grunnleggende `azure.yaml` fil
- Generere startinfrastruktur med `azd infra generate`
- Velge en passende Azure-vert for appen din
- Deploye og rydde opp din egen applikasjon

---

## Tre måter å starte et azd-prosjekt på

| Startpunkt | Kommando | Når du skal bruke den |
|----------------|---------|-------------|
| **Fra en mal** | `azd init --template <name> .` (tom mappe) | Læring, eller starte en ny app fra et bevist eksempel |
| **Fra din eksisterende kode** | `azd init` (i prosjektmappen din) | Du har allerede en app og vil deployere den |
| **Fra et Git-repo** | `azd init --from-code` (i et klonet repo) | Ta i bruk azd for et eksisterende repo |

Du har allerede øvd på det første alternativet. Denne leksjonen dekker det andre—det mest vanlige reelle scenariet.

---

## Steg 1: Kjør `azd init` i prosjektet ditt

Åpne et terminalvindu **inne i din eksisterende prosjektmappe** og kjør:

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

Velg **"Use code in the current directory."** azd skanner deretter mappen din, oppdager språk og rammeverk, og foreslår en vert.

### Hva azd oppdager

azd ser etter applikasjonssignaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, eller en `Dockerfile`. Fra-kode-flyten er ikke en generell veiviser for vertvalg for alle støttede distribusjonsmål:

| Din app | Sannsynlig oppdaget vert |
|----------|----------------------|
| Støttet Node.js / Python / .NET webapp | Vanligvis Azure Container Apps; undersøk den genererte definisjonen |
| Containerisert app (`Dockerfile`) | Azure Container Apps |
| Funksjonsapp eller Static Web Apps-prosjekt | Bruk en passende mal eller lag `azure.yaml` og infrastruktur hvis fra-kode ikke støtter layouten din |

Bekreft tjenesten(e) som ble oppdaget, og azd lager filene du trenger.

---

## Steg 2: Forstå hva azd opprettet

Etter init, undersøk `azure.yaml`. Den genererte infrastrukturen kan holdes implisitt til du kjører `azd infra generate`; ikke anta at `infra/` allerede eksisterer:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — prosjektdefinisjonen

Dette er hjertet i et azd-prosjekt. Følgende **illustrerende App Service-definisjon** krever tilsvarende App Service-infrastruktur; det er ikke en grunn til å endre en generert Container Apps-vert uten å endre infrastrukturen:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blokken `services` er nøkkeldelen: hver oppføring knytter en mappe av koden din til en Azure-vert. Hvis appen din har både frontend og API, vil du ha to tjenester.

### `infra/` — dine Azure-ressurser som kode

Mappen `infra/` inneholder Bicep-filer som definerer Azure-ressursene appen din trenger (App Service, databasen osv.). Du trenger ikke å skrive disse for hånd—azd genererer et fungerende utgangspunkt. Du *kan* redigere dem senere for å legge til ressurser eller stramme sikkerheten (dekket i [Kapittel 4](../chapter-04-infrastructure/README.md)).

> **Tips:** Vil du se eller tilpasse den genererte infrastrukturen før du deployerer? Kjør `azd infra generate` (også tilgjengelig som `azd infra synth`) for å skrive IaC til disk så du kan gjennomgå og versjonskontrollere den.

---

## Steg 3: Sett nødvendig konfigurasjon

Hvis appen din trenger innstillinger eller hemmeligheter (en tilkoblingsstreng, en API-nøkkel), ikke hardkod dem. Bruk miljøverdier:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Dette lagrer kun en lokal verdi. For å påvirke appen, må den eksplisitt brukes i infrastrukturparametere, en støttet tjenesteinnstilling, eller en hook; bare å sette en vilkårlig variabel konfigurerer ikke runtime som deployeres.

For ekte hemmeligheter, lagre dem i Key Vault og referer til dem fra infrastrukturen din—se [Kapittel 3: Konfigurasjon & Autentisering](../chapter-03-configuration/authsecurity.md).

---

## Steg 4: Deploy

Bruk nå samme arbeidsflyt som du allerede kjenner:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Når den er ferdig, skriver azd ut URL-en til appen din. Verifiser den på samme måte som enhver azd-app:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Vanlige problemer første gang

| Symptom | Sannsynlig årsak | Løsning |
|---------|--------------|-----|
| azd oppdaget ikke appen min | Manglende manifest (f.eks. `package.json`) | Legg til manifestet, eller velg vert manuelt under `azd init` |
| Bygging feiler under `azd up` | Appen trenger et byggesteg | Konfigurer appens pakke-skript eller tjenestens `prepackage` hook; bruk `dist` for distribusjonsutdata, ikke `buildCommand`/`outputPath` |
| Appen starter men gir feil | Manglende konfigurasjon/hemmelighet | Koble verdier inn i runtime app-innstillinger eller en Key Vault-referanse; kun `azd env set` er ikke nok |
| Feil vert valgt | Automatisk oppdagelse matcher ikke dine behov | Endre både `host:` og tilsvarende infrastruktur, eller velg en passende mal |

For mer, se [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md).

---

## Rydd opp

```bash
azd down --force --purge
```

---

## Oppsummering

- `azd init` → **"Use code in the current directory"** legger til azd i en app du allerede har.
- `azure.yaml` knytter kode-mappene dine til Azure-verter; `infra/` definerer ressursene som Bicep.
- `azd infra generate` lar deg gjennomgå eller tilpasse den genererte infrastrukturen.
- Når initialisert, bruker din eksisterende app nøyaktig samme `azd up` / `azd down` arbeidsflyt som en malbasert app.

---

## 🔗 Navigasjon

| Retning | Leksjon |
|-----------|--------|
| **Forrige** | [Ditt første prosjekt](first-project.md) |
| **Neste** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Relaterte ressurser

- [AZD Grunnleggende](azd-basics.md)
- [Kapittel 4: Infrastruktur som kode](../chapter-04-infrastructure/README.md)
- [Konfigurasjon & Autentisering](../chapter-03-configuration/authsecurity.md)
- [Kommando-hurtigreferanse](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->