# Bring Your Own App - Add azd to an Existing Project

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 1 - Fundament & Hurtigstart
- **⬅️ Forrige**: [Dit første projekt](first-project.md)
- **➡️ Næste**: [Dev Containers & Codespaces](dev-containers.md)

> Valideret mod `azd 1.25.6` i juni 2026.

## Introduktion

I [Dit første projekt](first-project.md) deployede du en app ved at starte fra en skabelon. Men oftest har du allerede en app—en Node.js API, en Python Flask-service, en .NET web-app—liggende i en mappe på din maskine. Denne lektion viser, hvordan du tilføjer azd til den eksisterende kode, så du kan deploye den med `azd up`, uden skabelon.

## Læringsmål

Når du er færdig med denne lektion, vil du:
- Forstå de tre måder at starte et azd-projekt på
- Køre `azd init` inde i et eksisterende kodebase
- Forstå hvad `azure.yaml` og `infra/` mappen gør for din app
- Vide, hvornår du skal lade azd generere infrastrukturen vs. skrive din egen
- Deploye din eksisterende app til Azure med `azd up`

## Læringsresultater

Efter at have gennemført denne lektion vil du kunne:
- Initialisere azd i et projekt, du allerede har
- Læse og redigere en grundlæggende `azure.yaml` fil
- Generere startinfrastruktur med `azd infra generate`
- Vælge en passende Azure-host til din app
- Deploje og rydde op i din egen applikation

---

## Tre måder at starte et azd-projekt på

| Udgangspunkt | Kommando | Hvornår at bruge |
|----------------|---------|-------------|
| **Fra en skabelon** | `azd init --template <name>` | Læring, eller når du starter en ny app fra et gennemprøvet eksempel |
| **Fra din eksisterende kode** | `azd init` (i din projektmappe) | Du har allerede en app og vil deploye den |
| **Fra et Git-repo** | `azd init --from-code` (i et klonet repo) | Tage azd i brug for et eksisterende repository |

Du har allerede øvet den første mulighed. Denne lektion dækker den anden—det mest almindelige scenarie i praksis.

---

## Trin 1: Kør `azd init` i dit projekt

Åbn en terminal **inde i din eksisterende projektmappe** og kør:

```bash
cd my-existing-app
azd init
```

azd vil spørge, hvordan du vil initialisere. Vælg:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vælg **"Use code in the current directory."** azd scanner så din mappe, registrerer dit sprog og framework, og foreslår en host.

### Hvad azd registrerer

azd leder efter signaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, eller en `Dockerfile`, og foreslår en matchende Azure-host:

| Din app | Sandsynlig registreret host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service eller Container Apps |
| Containeriseret app (`Dockerfile`) | Azure Container Apps |
| Function-app | Azure Functions |
| Statisk site (React/Vue build output) | Azure Static Web Apps |

Bekræft de registrerede service(r), og azd skaber de filer, du har brug for.

---

## Trin 2: Forstå hvad azd oprettede

Efter init får du to nye ting i dit projekt:

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

Dette er kernen i et azd-projekt. En minimal en ser sådan ud:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blokken `services` er den centrale del: hver post kortlægger en mappe med din kode til en Azure-host. Hvis din app har både en frontend og et API, vil du have to services.

### `infra/` — dine Azure-ressourcer som kode

`infra/` mappen indeholder Bicep-filer, der definerer de Azure-ressourcer, din app har brug for (App Service, databasen osv.). Du behøver ikke skrive disse manuelt—azd genererer et fungerende udgangspunkt. Du kan redigere dem senere for at tilføje ressourcer eller stramme sikkerheden (dækket i [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Vil du se eller tilpasse den genererede infrastruktur før deploy? Kør `azd infra generate` (også tilgængelig som `azd infra synth`) for at skrive IaC til disk, så du kan gennemgå og versionsstyre det.

---

## Trin 3: Indstil påkrævet konfiguration

Hvis din app har brug for indstillinger eller hemmeligheder (en connection string, en API-nøgle), så hardcod ikke disse. Brug miljøværdier:

```bash
# Opret et miljø
azd env new dev

# Angiv en ikke-fortrolig værdi
azd env set API_VERSION 1.0.0
```

For rigtige hemmeligheder, gem dem i Key Vault og referer til dem fra din infrastruktur—se [Kapitel 3: Konfiguration & Autentificering](../chapter-03-configuration/authsecurity.md).

---

## Trin 4: Deploy

Brug nu samme arbejdsgang, som du allerede kender:

```bash
# Autentificer (kræves for azd)
azd auth login

# Forhåndsvis de ressourcer, der vil blive oprettet
azd provision --preview

# Opsæt infrastruktur og udrul din kode
azd up
```

Når det er færdigt, udskriver azd din apps URL. Verificer den på samme måde som enhver anden azd-app:

```bash
azd show           # vis endepunkter
azd monitor --logs # tjek logfiler om nødvendigt
```

---

## Almindelige problemer første gang

| Symptom | Sandsynlig årsag | Løsning |
|---------|--------------|-----|
| azd opdagede ikke min app | Manglende manifest (f.eks. `package.json`) | Tilføj manifestet, eller vælg host manuelt under `azd init` |
| Build fejler under `azd up` | Appen kræver et build-step | Tilføj `buildCommand`/`outputPath` under servicen i `azure.yaml` |
| Appen starter men returnerer fejl | Manglende konfiguration/hemmelighed | Sæt værdier med `azd env set` eller tilslut Key Vault |
| Forkert host valgt | Auto-detektion gættede forkert | Rediger `host:` i `azure.yaml` og kør `azd up` igen |

For mere, se [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md).

---

## Ryd op

```bash
azd down --force --purge
```

---

## Resumé

- `azd init` → **"Use code in the current directory"** tilføjer azd til en app, du allerede har.
- `azure.yaml` kortlægger dine kodemapper til Azure-hosts; `infra/` definerer ressourcerne som Bicep.
- `azd infra generate` lader dig gennemgå eller tilpasse den genererede infrastruktur.
- Når det er initialiseret, bruger din eksisterende app præcis samme `azd up` / `azd down` arbejdsgang som en skabelonbaseret app.

---

## 🔗 Navigation

| Retning | Lektion |
|-----------|--------|
| **Forrige** | [Dit første projekt](first-project.md) |
| **Næste** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Relaterede ressourcer

- [AZD grundlæggende](azd-basics.md)
- [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/README.md)
- [Konfiguration & Autentificering](../chapter-03-configuration/authsecurity.md)
- [Kommandooversigt](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->