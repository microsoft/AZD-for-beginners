# Medbring Din Egen App - Tilføj azd til Et Eksisterende Projekt

**Kapitel Navigation:**
- **📚 Kursus Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start
- **⬅️ Forrige**: [Dit Første Projekt](first-project.md)
- **➡️ Næste**: [Dev Containere & Codespaces](dev-containers.md)

> Mål for kommando- og konfigurationsgennemgang: `azd 1.37.2` (november 2026). Genererede filer afhænger af den opdagede applikation; Azure-udrulning blev ikke udført i denne gennemgang.

## Introduktion

I [Dit Første Projekt](first-project.md) deployerede du en app ved at starte fra en skabelon. Men det meste af tiden har du allerede *en* app—en Node.js API, en Python Flask-service, en .NET webapp—liggende i en mappe på din maskine. Denne lektion viser, hvordan du tilføjer azd til den eksisterende kode, så du kan deploye den med `azd up`, uden skabelon.

## Læringsmål

Ved slutningen af denne lektion vil du:
- Forstå de tre måder at starte et azd-projekt på
- Køre `azd init` inde i en eksisterende kodebase
- Forstå hvad `azure.yaml` og mappen `infra/` gør for din app
- Vide, hvornår du skal lade azd generere infrastruktur versus skrive din egen
- Deploye din eksisterende app til Azure med `azd up`

## Læringsresultater

Efter at have gennemført denne lektion vil du kunne:
- Initialisere azd i et projekt, du allerede har
- Læse og redigere en grundlæggende `azure.yaml` fil
- Generere startinfrastruktur med `azd infra generate`
- Vælge en passende Azure-vært til din app
- Deploye og rydde op i din egen applikation

---

## Tre måder at starte et azd-projekt på

| Startpunkt | Kommando | Hvornår man bruger |
|----------------|---------|-------------|
| **Fra en skabelon** | `azd init --template <name> .` (tom mappe) | Læring eller starte en ny app fra et bevist eksempel |
| **Fra din eksisterende kode** | `azd init` (i din projektmappe) | Du har allerede en app og vil deploye den |
| **Fra et Git-repo** | `azd init --from-code` (i et klonet repo) | Tage azd i brug for et eksisterende repository |

Du har allerede prøvet den første mulighed. Denne lektion dækker den anden—det mest almindelige virkelige scenarie.

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

Vælg **"Use code in the current directory."** azd scanner derefter din mappe, registrerer dit sprog og framework og foreslår en vært.

### Hvad azd registrerer

azd leder efter applikationssignaler som `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` eller en `Dockerfile`. ”From-code”-flowet er ikke en generel vært-udvælgelsesguide for alle understøttede deploymål:

| Din app | Sandsynligt registreret vært |
|----------|----------------------|
| Understøttet Node.js / Python / .NET webapp | Typisk Azure Container Apps; undersøg den genererede definition |
| Containeriseret app (`Dockerfile`) | Azure Container Apps |
| Function app eller Static Web Apps projekt | Brug en matchende skabelon eller skriv selv `azure.yaml` og infrastruktur, hvis from-code ikke understøtter dit layout |

Bekræft de registrerede tjenester, og azd genererer de nødvendige filer.

---

## Trin 2: Forstå, hvad azd har oprettet

Efter init skal du inspicere `azure.yaml`. Det genererede-infrastruktur flow kan holde infrastrukturen implicit, indtil du kører `azd infra generate`; antag ikke at `infra/` allerede findes:

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

Dette er kernen i et azd-projekt. Følgende **illustrative App Service-definition** kræver matchende App Service-infrastruktur; det er ikke en grund til at ændre en genereret Container Apps-vært uden at ændre infrastrukturen:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blokken `services` er den vigtigste del: hver post kortlægger en mappe af din kode til en Azure-vært. Hvis din app har både en frontend og en API, vil du have to services.

### `infra/` — dine Azure-ressourcer som kode

Mappen `infra/` indeholder Bicep-filer, der definerer de Azure-ressourcer, din app har brug for (App Service, databasen osv.). Du behøver ikke skrive dem manuelt—azd genererer et fungerende udgangspunkt. Du *kan* redigere dem senere for at tilføje ressourcer eller stramme sikkerheden (omtalt i [Kapitel 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Vil du se eller tilpasse den genererede infrastruktur før udrulning? Kør `azd infra generate` (også tilgængelig som `azd infra synth`) for at skrive IaC til disk, så du kan gennemgå og version-styre det.

---

## Trin 3: Indstil nødvendige konfigurationer

Hvis din app har brug for indstillinger eller hemmeligheder (en forbindelsesstreng, en API-nøgle), skal du ikke hardkode dem. Brug miljøværdier:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Dette gemmer kun en lokal værdi. For at påvirke appen, skal du eksplicit bruge den i infrastrukturparametre, en understøttet serviceindstilling eller en hook; indstilling af en vilkårlig variabel konfigurerer ikke den udrullede runtime.

For ægte hemmeligheder, gem dem i Key Vault og referer til dem fra din infrastruktur—se [Kapitel 3: Konfiguration & Autentificering](../chapter-03-configuration/authsecurity.md).

---

## Trin 4: Udrul

Brug nu den samme arbejdsgang, som du allerede kender:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Når det er færdigt, viser azd din apps URL. Bekræft den på samme måde som enhver azd-app:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Almindelige problemer første gang

| Symptom | Sandsynlig årsag | Løsning |
|---------|-----------------|---------|
| azd opdagede ikke min app | Manglende manifest (f.eks. `package.json`) | Tilføj manifestet, eller vælg manuelt host under `azd init` |
| Build fejler under `azd up` | Appen kræver et build-trin | Konfigurer pakkesk scripts eller service `prepackage` hook; brug `dist` til udrulningsoutput, ikke `buildCommand`/`outputPath` |
| App starter men returnerer fejl | Manglende konfig/hemmelighed | Tilkobling af værdier i runtime app-indstillinger eller en Key Vault-reference; `azd env set` alene er ikke nok |
| Forkert host valgt | Automatisk registrering matcher ikke dine behov | Skift både `host:` og den tilsvarende infrastruktur, eller vælg en matchende skabelon |

For mere, se [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md).

---

## Ryd op

```bash
azd down --force --purge
```

---

## Resumé

- `azd init` → **"Brug kode i den aktuelle mappe"** tilføjer azd til en app, du allerede har.
- `azure.yaml` kobler dine kodemapper til Azure-værter; `infra/` definerer ressourcerne som Bicep.
- `azd infra generate` lader dig gennemgå eller tilpasse den genererede infrastruktur.
- Når den er initialiseret, bruger din eksisterende app den helt samme `azd up` / `azd down` arbejdsgang som en skabelonbaseret app.

---

## 🔗 Navigation

| Retning | Lektion |
|-----------|--------|
| **Forrige** | [Dit første projekt](first-project.md) |
| **Næste** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Relaterede ressourcer

- [AZD Grundlæggende](azd-basics.md)
- [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/README.md)
- [Konfiguration & godkendelse](../chapter-03-configuration/authsecurity.md)
- [Kommando oversigt](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->