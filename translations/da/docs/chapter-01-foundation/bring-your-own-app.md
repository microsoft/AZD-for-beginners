# Bring Your Own App - Tilføj azd til et eksisterende projekt

**Kapitelnavigation:**
- **📚 Kursus Hjem**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Fundament & Hurtig start
- **⬅️ Forrige**: [Dit første projekt](first-project.md)
- **➡️ Næste**: [Dev Containere & Codespaces](dev-containers.md)

> Valideret mod `azd 1.27.1` i juli 2026.

## Introduktion

I [Dit første projekt](first-project.md) implementerede du en app ved at starte ud fra en skabelon. Men de fleste gange har du allerede *en app*—en Node.js API, en Python Flask service, en .NET web-app—liggende i en mappe på din maskine. Denne lektion viser, hvordan du tilføjer azd til den eksisterende kode, så du kan deploye den med `azd up`, uden brug af en skabelon.

## Læringsmål

Når du har gennemført denne lektion, vil du:
- Forstå de tre måder at starte et azd-projekt på
- Køre `azd init` inde i et eksisterende kodearkiv
- Forstå hvad `azure.yaml` og mappen `infra/` gør for din app
- Vide, hvornår du skal lade azd generere infrastruktur versus skrive din egen
- Deploye din eksisterende app til Azure med `azd up`

## Læringsudbytte

Efter at have gennemført denne lektion vil du kunne:
- Initialisere azd i et projekt, du allerede har
- Læse og redigere en basal `azure.yaml` fil
- Generere startinfrastruktur med `azd infra generate`
- Vælge et passende Azure-host for din app
- Deploye og rydde op i din egen applikation

---

## Tre måder at starte et azd-projekt på

| Startpunkt | Kommando | Hvornår det skal bruges |
|----------------|---------|-----------------------|
| **Fra en skabelon** | `azd init --template <name>` | Læring eller starte en ny app fra et gennemprøvet eksempel |
| **Fra din eksisterende kode** | `azd init` (i din projektmappe) | Du har allerede en app og ønsker at deploye den |
| **Fra et Git-repo** | `azd init --from-code` (i et klonet repo) | Tage azd i brug for et eksisterende repository |

Du har allerede øvet dig på den første mulighed. Denne lektion dækker den anden—det mest almindelige scenarie i praksis.

---

## Trin 1: Kør `azd init` i dit projekt

Åbn en terminal **inde i din eksisterende projektmappe** og kør:

```bash
cd my-existing-app
azd init
```

azd vil spørge, hvordan du ønsker at initialisere. Vælg:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vælg **"Brug kode i det aktuelle bibliotek."** azd scanner så din mappe, detekterer dit sprog og framework, og foreslår en hosting.

### Hvad azd opdager

azd leder efter signaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` eller en `Dockerfile` og foreslår en tilsvarende Azure-host:

| Din app | Sandsynligt opdaget host |
|----------|-----------------------|
| Node.js / Python / .NET web app | Azure App Service eller Container Apps |
| Containeriseret app (`Dockerfile`) | Azure Container Apps |
| Funktionsapp | Azure Functions |
| Statisk site (React/Vue build output) | Azure Static Web Apps |

Bekræft de opdagede service(r), og azd opretter de nødvendige filer for dig.

---

## Trin 2: Forstå, hvad azd har oprettet

Efter init har du to nye ting i dit projekt:

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

Dette er hjertet i et azd-projekt. En minimal fil ser sådan ud:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blokken `services` er den vigtigste del: hver post kortlægger en mappe med din kode til en Azure-host. Hvis din app både har frontend og API, vil du have to services.

### `infra/` — dine Azure-ressourcer som kode

Mappen `infra/` indeholder Bicep-filer, der definerer Azure-ressourcerne, din app har brug for (App Service, databasen osv.). Du behøver ikke skrive dem manuelt—azd genererer et fungerende udgangspunkt. Du *kan* redigere dem senere for at tilføje ressourcer eller øge sikkerheden (behandles i [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Vil du se eller tilpasse den genererede infrastruktur før deployment? Kør `azd infra generate` (tilgængelig som `azd infra synth`) for at skrive IaC til disk, så du kan gennemgå og versionere det.

---

## Trin 3: Sæt nødvendig konfiguration

Hvis din app har brug for indstillinger eller hemmeligheder (en connection string, en API-nøgle), hårdkod dem ikke. Brug miljøværdier:

```bash
# Opret et miljø
azd env new dev

# Indstil en ikke-hemmelig værdi
azd env set API_VERSION 1.0.0
```

For ægte hemmeligheder, gem dem i Key Vault og referer til dem fra din infrastruktur—se [Kapitel 3: Konfiguration & godkendelse](../chapter-03-configuration/authsecurity.md).

---

## Trin 4: Deploy

Brug nu den samme arbejdsgang, som du allerede kender:

```bash
# Godkend (påkrævet for azd)
azd auth login

# Forhåndsvis de ressourcer, der vil blive oprettet
azd provision --preview

# Tilvejebring infrastruktur og implementer din kode
azd up
```

Når det er færdigt, udskriver azd URL'en til din app. Bekræft den på samme måde som enhver azd-app:

```bash
azd show           # vis endepunkter
azd monitor --logs # tjek logs hvis nødvendigt
```

---

## Almindelige fejl ved første gang

| Symptom | Sandsynlig årsag | Løsning |
|---------|-----------------|---------|
| azd opdagede ikke min app | Manglende manifest (fx `package.json`) | Tilføj manifestet, eller vælg host manuelt under `azd init` |
| Build fejler under `azd up` | App kræver et build-step | Tilføj `buildCommand`/`outputPath` under servicen i `azure.yaml` |
| App starter men returnerer fejl | Manglende konfiguration/hemmelighed | Sæt værdier med `azd env set` eller tilslut Key Vault |
| Forkert host valgt | Auto-detektion gættede forkert | Rediger `host:` i `azure.yaml` og kør `azd up` igen |

For mere, se [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md).

---

## Ryd Op

```bash
azd down --force --purge
```

---

## Resumé

- `azd init` → **"Brug kode i det aktuelle bibliotek"** tilføjer azd til en app, du allerede har.
- `azure.yaml` kortlægger dine kodemapper til Azure-hosts; `infra/` definerer ressourcer som Bicep.
- `azd infra generate` lader dig gennemgå eller tilpasse den genererede infrastruktur.
- Når den er initialiseret, bruger din eksisterende app den samme `azd up` / `azd down` arbejdsgang som en skabelonbaseret app.

---

## 🔗 Navigation

| Retning | Lektion |
|----------|---------|
| **Forrige** | [Dit første projekt](first-project.md) |
| **Næste** | [Dev Containere & Codespaces](dev-containers.md) |

## 📖 Relaterede ressourcer

- [AZD Grundlæggende](azd-basics.md)
- [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/README.md)
- [Konfiguration & godkendelse](../chapter-03-configuration/authsecurity.md)
- [Kommando Quickreference](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->