# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande ändringar, uppdateringar och förbättringar i AZD För Nybörjare-förvaret. Vi följer regler för semantisk versionering och underhåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa bugfixar och korrigeringar för att säkerställa korrekthet
- Följ utvecklingen av undervisningsmaterialet över tid

## Läranderesultat

Efter att ha granskat ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser som finns tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din läranderutt baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Uppdatering: Versionsvaluta
**Denna version verifierar kursen igen mot `azd` `1.27.1` (juli 2026, senaste stabila version) och den aktuella preview AI-agent-tillägget `azure.ai.agents` `1.0.0-beta.5`, och uppdaterar alla "validerat mot"-banderoller efter släppen 1.26.0, 1.27.0 och 1.27.1.**

#### Ändrat
- **✅ Valideringsbaslinjen uppdaterad** från `azd 1.25.6` (juni 2026) till `azd 1.27.1` (juli 2026) i rot-README-filen, alla kapitel-README-filer, lektionen om dev-containers i Kapitel 1 (inklusive exempel med fixad version), lektionen om anpassade mallar i Kapitel 4, lektionen om multi-agent i Kapitel 5 och workshopdokumentationen
- **🤖 Kapitel 2-baslinjen uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.27.1` i `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` och `microsoft-foundry-integration.md`; valideringsdatum uppdaterade till 2026-07-13
- **🧩 AI-agent-tillägget uppgraderat** från `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` till nuvarande `1.0.0-beta.5` i Kapitel 2 README och `agents.md`
- **🧪 Workshop-valideringsexempel** (`azd version`-utdata) uppdaterat till `1.27.1`

#### Noteringar om relevanta azd-utgåvor (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-stöd för Azure Functions på Flex Consumption, `azd config sub-filter` prenumerationsfilter per hyresgäst, självständiga extension-buntar (`azd x pack --bundle`), och `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellera Azure AI Foundry-projekt/agenter direkt i `azure.yaml` (init utan Bicep/Terraform), containerstöd för App Service (`host: appservice` + `language: docker`), direkt `-s/--source` för `azd extension`-kommandon och `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies`-flagga för `azd extension install`, föråldrade modeller uteslutna från katalog-/kvotfrågor som standard, och flera buggfixar

#### Uppdaterade filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Nybörjargap 2: Mallskapande, Dev Containers, Pulumi, Azure DevOps, Service Principals och mer
**Denna version stänger de kvarvarande mellanliggande luckorna som analyserats av azd-coverage: hur man skapar och publicerar egen mall, reproducerbara dev-container-/Codespaces-miljöer, Pulumi som infrastrukturleverantör, en guida i Azure DevOps CI/CD, autentisering med service principals, värdvalsguide (AKS/Spring Apps), förklaringar till `azd restore`/`azd package`, felhantering i krokar och arbets- och delade miljöpraktiker.**

#### Lagt till
- **🧱 Ny lektion i Kapitel 4** `docs/chapter-04-infrastructure/custom-templates.md` — att skapa din egen azd-mall: nödvändig struktur (`azure.yaml`, `infra/`, `src/`), fältet `metadata.template`, parameterisering av infrastruktur med `uniqueString()`-resurs-token och taggen `azd-env-name`, lokal testning med `azd init --template <local-path>`, publicering på GitHub och inskickande till Awesome AZD-galleriet
- **📦 Ny lektion i Kapitel 1** `docs/chapter-01-foundation/dev-containers.md` — reproducerbara azd-miljöer med Dev Containers och GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` som använder den officiella funktionen `ghcr.io/azure/azure-dev/azd`, språkberoende funktioner, `docker-in-docker` för containervärdar och `azd auth login --use-device-code` för fjärrinloggning
- **🧩 Pulumi med azd** avsnitt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-filstruktur, stackar kopplade till azd-miljöer, nödvändiga outputs/taggning och samma `azd up` / `azd down`-arbetsflöde
- **🎯 Värdvalsguide** i `docs/chapter-04-infrastructure/provisioning.md` — en nybörjarvänlig jämförelse av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` och `springapp`, med råd om när man ska välja AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD-genomgång** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceanslutning med arbetsbelastningsidentitetsfederation (OIDC), den genererade `azure-dev.yml` och inställning av variabelgrupper
- **🔑 Service Principals (Mönster 4)** tillagt i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, icke-interaktiv `azd auth login` med klienthemlighet jämfört med federerade/OIDC-referenser, när man ska använda dem och säker inloggningslagring
- **🪝 Felhantering i hooks** avsnitt i `docs/chapter-04-infrastructure/deployment-guide.md` — utgångskoder och `set -e`, `continueOnError`, test av hooks isolerat med `azd hooks run`, OS-specifika shell och `--debug`
- **👥 Team- / delade miljöer** avsnitt i `docs/chapter-03-configuration/configuration.md` — vad som finns i `.azure/`, vad som ska ignorera i git, miljöer per utvecklare, `azd env list`/`select` och hur man tillhandahåller miljövärden i CI/CD
- **🧰 Förklaringar till `azd restore` och utökad `azd package`** i `resources/cheat-sheet.md` — återställning av beroenden och att bygga en deploybar artefakt utan att deploya

#### Ändrat
- **🧭 Uppdaterad tabell för lektioner i Kapitel 4** för att inkludera nya lektionen "Skapa Din Egen Mall" (Lektion 3)
- **🧭 Uppdaterad tabell för lektioner i Kapitel 1** för att inkludera nya lektionen "Dev Containers & Codespaces" (Lektion 5); navigationsfötter kopplade mellan `bring-your-own-app.md` och `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Nybörjargap: Praktisk Multi-Agent-lektion, "Bring Your Own App," Terraform och CI/CD-genomgång
**Denna version stänger de största luckorna för en komplett nybörjarguide genom att lägga till två nya praktiska lektioner (en distribuerbar multi-agent-genomgång och att lägga till azd i en befintlig app), en nybörjarvänlig introduktion till hooks, ett Terraform-med-azd-avsnitt, en steg-för-steg-genomgång av GitHub Actions-pipeline, en förklaring av de nya preview-tilläggen och en tydlig checklista för verifiering av deployment.**

#### Lagt till
- **🤝 Ny lektion i Kapitel 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en helt praktisk, distribuerbar genomgång med två agenter (orkestrator + specialister) med en riktig mall (`contoso-creative-writer`), omfattar när man ska använda multi-agent, arbetsflödet `azd up`, förståelse för deployade resurser, spårning mellan agenter, anpassning och städning
- **📦 Ny lektion i Kapitel 1** `docs/chapter-01-foundation/bring-your-own-app.md` — hur man lägger till azd i ett befintligt projekt med `azd init` ("använd kod i nuvarande katalog"), förstå `azure.yaml` och `infra/`, `azd infra generate`, värddetektering och deployment med `azd up`
- **🌐 Terraform med azd** avsnitt tillagt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform`-konfiguration, `.tf`-mappstruktur, nödvändiga `AZURE_*`-utdata och `azd-env-name`-taggning samt samma `azd up` / `azd down`-arbetsflöde (stänger luckan där Terraform-stöd påstods men endast Bicep visades)
- **⚙️ Steg-för-steg-genomgång av GitHub Actions** i `docs/chapter-08-production/production-ai-practices.md` — från GitHub-repo till automatiska deploys: `azd pipeline config`, OIDC-federerade referenser (inga sparade hemligheter), den genererade `azure-dev.yml` och guide för hemligheter vs variabler
- **🪝 Nybörjarintroduktion "Ny till hooks?"** i `docs/chapter-04-infrastructure/deployment-guide.md` — vad en hook är, en tabell över hook-stadier, en minimal första hook och manuell körning av hooks med `azd hooks run`
- **✅ "Verifiera Din Deployment" checklista** tillagd i Steg 5 av `docs/chapter-01-foundation/first-project.md` — röktest, hälsokontroll av endpoint och tydliga framgångskriterier
- **🧩 Förklaring av nya preview-tillägg** `azure.ai.skills` och `azure.ai.connections` (vad de är och när man ska använda dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ändrat
- **🧭 Korrigerad tabel för lektioner i Kapitel 5**: `multi-agent-basics.md` är nu Lektion 1 (den enda helt praktiska lektionen), med tydlig märkning att Lektion 2 finns i Kapitel 6 och att detaljhandelsscenariot är en arkitekturplan, inte en enkommando-mall
- **🧭 Kapitel 1 lektionstabell** uppdaterad för att inkludera nya lektionen "Bring Your Own App" (Lektion 4)
- **🔗 Navigationsfötter** uppdaterade: `first-project.md` länkar nu framåt till `bring-your-own-app.md`

#### Fixat
- **🧱 Stängt "påstådd men saknad" Terraform-lucka** — kursen refererade tidigare till Terraform-stöd utan att visa det
- **🔀 Rättat vilseledande kapitellänkningar i Kapitel 5** som gav intryck av att en fullständig multi-agent-implementation fanns när bara en arkitekturplan fanns

#### Uppdaterade filer
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(ny)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(ny)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Uppdatering, Fullständiga Agentlivscykelkommandon & Aspire Ommärkning

**Denna version validerar om kursen mot `azd` `1.25.6` (juni 2026) och `azure.ai.agents` `0.1.40-preview`-tillägget, utökar AI-vägledningen från "skapa en agent" till hela agentens livscykel (testa → utvärdera → optimera → inspektera → ta bort), introducerar de nya förhandsversionstilläggen `azure.ai.skills` och `azure.ai.connections`, och noterar produktomprofileringen från ".NET Aspire" → "Aspire".**

#### Tillagt
- **🔁 Full täckning av agentens livscykel** för nybörjare och AI-ingenjörer i hela dokumentationen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livscykeltabell (skapa → testa → mäta → förbättra → inspektera → städa upp) tillagd i avsnittet Extension och AI-kommandon
  - `docs/chapter-08-production/production-ai-practices.md` — Nytt avsnitt "Hantera agentens livscykel" som täcker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, och `delete --force`
  - `resources/cheat-sheet.md` — Utökade AI-agentkommandon med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, och `delete --force`
- **🧩 Nya förhandsversionstillägg** dokumenterade: `azure.ai.skills` (återanvändbara agentskickligheter) och `azure.ai.connections` (Foundry-anslutningar) tillagda i tabellen över tillägg och fusklappen
- **⏱️ Vägledning för responstider** — `azd ai agent invoke` exempel visar nu total latens och tid-till-första-byte
- **📌 Versionsbanner** i huvud-README som pekar användare till `azd version` och `azd upgrade`

#### Ändrat
- **✅ Valideringsbaslinje uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.25.6` (juni 2026) i alla kapitel-README-filer och workshopdokument
- **🤖 Kapitel 2 utökning** uppdaterad från `azure.ai.agents` `0.1.18-preview` till `0.1.40-preview`
- **🧪 Workshop valideringsexempel** (`azd version` utskrift) uppdaterad till `1.25.6`
- **🧭 README "Vad är nytt i azd idag"** uppdaterad för att belysa agentens hela livscykel, nya AI-tillägg och senaste förbättringar (idempotens i `azd init`, rensning av föråldrade token i `azd auth login`, första-körningsprompt för `azd tool`)
- **📖 Kapitel 2 agents.md (Alternativ 4)** pekar nu användare till livscykelkommandon efter distribution istället för att sluta vid `azd up`

#### Fixat
- **🏷️ Produktnamn** — tillagt Aspire-omprofilering (".NET Aspire" heter nu bara "Aspire"); azd:s Aspire-stöd oförändrat
- **🔎 Liveutgåvevalidering** bekräftad mot Azure Developer CLI:s utgåvefeed: stabil CLI `1.25.6` (2026-06-12) och `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Uppdaterade filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Förtydligande av nybörjarintroduktion, validering av installation & slutstädning av AZD-kommandon
**Denna version följer upp AZD 1.23-valideringen med en dokumentationsgenomgång fokuserad på nybörjare: den förtydligar autentiseringsvägledning med AZD i första hand, lägger till lokala valideringsskript för installation, verifierar viktiga kommandon mot den aktiva AZD CLI:n samt tar bort de sista föråldrade engelska källkommandona utanför förändringsloggen.**

#### Tillagt
- **🧪 Valideringsskript för nybörjare** med `validate-setup.ps1` och `validate-setup.sh` så att användare kan bekräfta nödvändiga verktyg innan Kapitel 1
- **✅ Inledande installationsvalideringssteg** i roten och Kapitel 1 README för att fånga saknade krav innan `azd up`

#### Ändrat
- **🔐 Autentiseringsvägledning för nybörjare** behandlar nu konsekvent `azd auth login` som huvudsaklig väg för AZD-arbetsflöden, med `az login` som valfritt om Azure CLI-kommandon används direkt
- **📚 Kapitel 1 introduktionsflöde** pekar nu användare att validera sin lokala installation före installation, autentisering och första distribuering
- **🛠️ Meddelanden från validerare** skiljer tydligt krav som blockerar från valfria Azure CLI-varningar för AZD-bara nybörjarvägen
- **📖 Konfigurations-, felsöknings- och exempel-dokument** skiljer nu mellan krävd AZD-autentisering och valfri Azure CLI-inloggning där båda tidigare presenterades utan kontext

#### Fixat
- **📋 Återstående engelska källkommandoreferenser** uppdaterade till aktuella AZD-former, inklusive `azd config show` i fusklappen och `azd monitor --overview` där Azure Portal-översikt avsågs
- **🧭 Påståenden för nybörjare i Kapitel 1** mildrades för att undvika överlöften om garanterad fel- eller rollback-frihet över alla mallar och Azure-resurser
- **🔎 Live CLI-validering** bekräftade aktuellt stöd för `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` och `azd down --force --purge`

#### Uppdaterade filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12-validering, utökning av workshopmiljö & uppdatering av AI-modell
**Denna version utför en validering av dokumentationen mot `azd` `1.23.12`, uppdaterar föråldrade AZD-kommandon, uppdaterar AI-modellsvägledning till aktuella standardinställningar och breddar workshop-instruktionerna bortom GitHub Codespaces till att även stödja dev containers och lokala kopior.**

#### Tillagt
- **✅ Valideringsnoteringar i kärnkapitel och workshopdokument** för att göra den testade AZD-baslinjen tydlig för användare med nyare eller äldre CLI-versioner
- **⏱️ Vägledning för tidsgräns vid distribution** för långkörande AI-app-distributioner med `azd deploy --timeout 1800`
- **🔎 Inspektionssteg för tillägg** med `azd extension show azure.ai.agents` i AI-arbetsflödesdokument
- **🌐 Bredare vägledning för workshopmiljöer** som täcker GitHub Codespaces, dev containers och lokala kopior med MkDocs

#### Ändrat
- **📚 Introduktions-README-filer i kapitel** noterar nu konsekvent validering mot `azd 1.23.12` i grundläggande, konfigurations-, infrastruktur-, multi-agent-, fördistribution-, felsöknings- och produktionsavsnitt
- **🛠️ Referenser till AZD-kommandon** uppdaterade till aktuella former i hela dokumentationen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` beroende på sammanhang
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` där Application Insights-översikt avsågs
- **🧪 Exempel med provisioning förhandsversion** förenklade till nuvarande stöd såsom `azd provision --preview` och `azd provision --preview -e production`
- **🧭 Workshopflöde** uppdaterat så användare kan slutföra labbar i Codespaces, dev container eller lokal kopia istället för att anta att det endast funkar i Codespaces
- **🔐 Autentiseringsvägledning** prioriterar nu `azd auth login` för AZD-arbetsflöden, med `az login` som valfritt när Azure CLI-kommandon används direkt

#### Fixat
- **🪟 Windows installationskommandon** normaliserade till nuvarande `winget`-paketcasing i installationsguiden
- **🐧 Linux installationsvägledning** korrigerad för att undvika icke-stödda distributionsspecifika `azd` paketkommandon och istället peka på releasefiler när det är lämpligt
- **📦 AI-modellsexempel** uppdaterade från äldre standarder som `gpt-35-turbo` och `text-embedding-ada-002` till nuvarande som `gpt-4.1-mini`, `gpt-4.1` och `text-embedding-3-large`
- **📋 Utdrag för distribution och diagnoser** korrigerade för att använda aktuella miljö- och statuskommandon i loggar, skript och felsökningssteg
- **⚙️ GitHub Actions-vägledning** uppdaterad från `Azure/setup-azd@v1.0.0` till `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtyckesvägledning** uppdaterad från `azd mcp consent` till `azd copilot consent list`

#### Förbättrat
- **🧠 AI-kapitelns vägledning** förklarar nu bättre förhandsversionskänsligt beteende i `azd ai`, hyresgästspecifik inloggning, aktuellt tilläggsanvändande och uppdaterade rekommendationer för modelldistribution
- **🧪 Workshop-instruktioner** använder nu mer realistiska versionsexempel och tydligare miljökonfigurationsspråk för praktiska labbar
- **📈 Produktions- och felsökningsdokument** är nu bättre i linje med aktuella övervaknings-, reservmodell- och kostnadsnivåexempel

#### Uppdaterade filer
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Kommandon för AZD AI CLI, innehållsvalidering & mallutökning
**Denna version lägger till täckning av `azd ai`, `azd extension` och `azd mcp` kommando över alla AI-relaterade kapitel, fixar brutna länkar och föråldrad kod i agents.md, uppdaterar fusklappen och omarbetar avsnittet Exempelmallar med validerade beskrivningar och nya Azure AI AZD-mallar.**

#### Tillagt
- **🤖 Täcker AZD AI CLI** över 7 filer (tidigare bara i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nytt avsnitt "Extension och AI-kommandon" som introducerar `azd extension`, `azd ai agent init` och `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med jämförelsetabell (mall vs manifestmetod)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underavsnitt "AZD Extensions för Foundry" och "Agent-först-distribution"

  - `docs/chapter-05-multi-agent/README.md` — Snabbstart visar nu både mall- och manifestbaserade distributionsvägar
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Avsnittet Distribuera inkluderar nu alternativet `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underavsnittet "AZD AI Extension Commands för Diagnostik"
  - `resources/cheat-sheet.md` — Nytt avsnitt "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` och `azd infra generate`
- **📦 Nya AZD AI exempelmallar** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chatt med Blazor WebAssembly, Semantic Kernel och röstchattstöd
  - **azure-search-openai-demo-java** — Java RAG-chatt med Langchain4J och ACA/AKS distributionsalternativ
  - **contoso-creative-writer** — Multi-agent kreativ skrivapp med Azure AI Agent Service, Bing Grounding och Prompty
  - **serverless-chat-langchainjs** — Serverlös RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokalt utvecklingsstöd
  - **chat-with-your-data-solution-accelerator** — Företags-RAG accelerator med adminportal, Teams-integration och PostgreSQL/Cosmos DB-alternativ
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferensapp med servrar i .NET, Python, Java och TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktur Bicep startmall
  - **🔗 Fantastisk AZD AI Galleri-länk** — Referens till [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallar)

#### Fikserat
- **🔗 agents.md navigering**: Föregående/Nästa länkar matchar nu kapitel 2 README lektionernas ordning (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md brutna länkar**: `production-ai-practices.md` rättad till `../chapter-08-production/production-ai-practices.md` (3 förekomster)
- **📦 agents.md föråldrad kod**: Ersatt `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ogiltigt API**: Flyttade `max_tokens` från `create_agent()` till `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenräkning**: Ersatt grov uppskattning `len//4` med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rättat tjänster från "Cognitive Search + App Service" till "Azure AI Search + Azure Container Apps" (standardvärd ändrad oktober 2024)
- **contoso-chat**: Uppdaterad beskrivning för att referera till Azure AI Foundry + Prompty, i linje med repoets faktiska titel och teknikstack

#### Borttaget
- **ai-document-processing**: Borttagen icke-fungerande mallreferens (repo ej offentligt tillgängligt som en AZD-mall)

#### Förbättrat
- **📝 agents.md övningar**: Övning 1 visar nu förväntad utdata och `azd monitor` steg; Övning 2 inkluderar full `FunctionTool` registreringskod; Övning 3 ersätter vag vägledning med konkreta `prepdocs.py` kommandon
- **📚 agents.md resurser**: Uppdaterade dokumentationslänkar till aktuell Azure AI Agent Service-dokumentation och snabbstart
- **📋 agents.md Nästa steg tabell**: Lagt till AI Workshop Lab-länk för komplett kapitelgenomgång

#### Uppdaterade filer
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Förbättrad kursnavigering
**Denna version förbättrar README.md kapitelnavigering med ett förbättrat tabellformat.**

#### Ändringar
- **Kurskarttabell**: Förbättrad med direkta lektionslänkar, tidsuppskattningar och komplexitetsbetyg
- **Mappstädning**: Borttagna överflödiga gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Länkvalidering**: Alla 21+ interna länkar i Kurskarttabellen verifierade

### [v3.16.0] - 2026-02-05

#### Produktnamnsuppdateringar
**Denna version uppdaterar produktreferenser till aktuell Microsoft-varumärkning.**

#### Ändringar
- **Microsoft Foundry → Microsoft Foundry**: Alla referenser uppdaterade i icke-översättningsfiler
- **Azure AI Agent Service → Foundry Agents**: Tjänstens namn uppdaterat för att spegla aktuell varumärkning

#### Uppdaterade filer
- `README.md` - Huvudsida för kursen
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Guide för AI-agenter
- `examples/README.md` - Exempeldokumentation
- `workshop/README.md` - Workshops startsida
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Alla workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor omstrukturering av repot: Kapitelbaserade mappnamn
**Denna version omstrukturerar dokumentationen till dedikerade kapitelmappar för tydligare navigering.**

#### Mappbyten
Gamla mappar har ersatts med kapitelnumrerade mappar:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lagt till ny: `docs/chapter-05-multi-agent/`

#### Filöverföringar
| Fil | Från | Till |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Alla pre-deployment filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alla felsökningsfiler | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt till
- **📚 Kapitel-README-filer**: Skapade README.md i varje kapitelmapp med:
  - Lärandemål och tidsåtgång
  - Lektionstabell med beskrivningar
  - Snabbstartskommandon
  - Navigering till andra kapitel

#### Ändrat
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i all dokumentation
- **🗺️ Huvudsaklig README.md**: Uppdaterad kurskarta med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Borttaget
- Gammal mappstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering av repo: Kapitelnavigering
**Denna version lade till kapitelnavigering i README-filer (ersatt av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide för AI-agenter
**Denna version lägger till en omfattande guide för att distribuera AI-agenter med Azure Developer CLI.**

#### Lagt till
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chatbots
  - Tre snabbstartmallar för agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmönster (enkel agent, RAG, multi-agent)
  - Verktygskonfiguration och anpassning
  - Övervakning och mätspårning
  - Kostnadsöverväganden och optimering
  - Vanliga felsökningsscenarier
  - Tre praktiska övningar med framgångskriterier

#### Innehållsstruktur
- **Introduktion**: Agentkoncept för nybörjare
- **Snabbstart**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmönster**: Visuella diagram över agentmönster
- **Konfiguration**: Verktygsinställning och miljövariabler
- **Övervakning**: Integrering med Application Insights
- **Övningar**: Progressiv praktisk inlärning (20-45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### Uppdatering av DevContainer-miljö
**Denna version uppdaterar utvecklingscontainerkonfigurationen med moderna verktyg och bättre standardinställningar för AZD-inlärningsupplevelsen.**

#### Ändringar
- **🐳 Basbild**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (senaste Debian stabile)
- **📛 Container-namn**: Omdöpt från "Python 3" till "AZD for Beginners" för tydlighet

#### Lagt till
- **🔧 Nya Dev Container-funktioner**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för container app-distributioner

- **🔌 Portvidarebefordran**: Förkonfigurerade portar för vanlig utveckling:
  - 8000 (MkDocs förhandsvisning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code-tillägg**:
  - `ms-python.vscode-pylance` - Förbättrat Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-stöd
  - `ms-azuretools.vscode-docker` - Docker-stöd
  - `ms-azuretools.vscode-bicep` - Bicep språkstöd
  - `ms-azure-devtools.azure-resource-groups` - Azure resurshantering
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid diagramstöd
  - `redhat.vscode-yaml` - YAML-stöd (för azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-inställningar**: Lagt till standardinställningar för Python-interpreter, format vid sparande och trimning av blanksteg

- **📦 Uppdaterad requirements-dev.txt**:
  - Lagt till MkDocs minify-plugin
  - Lagt till pre-commit för kodkvalitet
  - Lagt till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fikserat
- **Post-Create kommando**: Verifierar nu AZD och Azure CLI installation vid containerstart

---

### [v3.11.0] - 2026-02-05

#### Nybörjarvänlig README-översyn
**Denna version förbättrar README.md avsevärt för att vara mer tillgänglig för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Lagt till
- **🆚 Azure CLI vs AZD Jämförelse**: Tydlig förklaring när varje verktyg ska användas med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direktlänkar till gemenskapens mallgalleri och bidragsresurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ färdiga att distribuera mallar
  - [Skicka in en mall](https://github.com/Azure/awesome-azd/issues) - Gemenskapsbidrag
- **🎯 Snabbstartsguide**: Förenklad 3-stegs introduktion (Installera → Logga in → Distribuera)
- **📊 Erfarenhetsbaserad navigeringstabell**: Tydlig vägledning om var man ska börja beroende på utvecklarerfarenhet

#### Ändrat
- **README Struktur**: Omdisponerad för successiv avslöjning - viktig information först
- **Introduktionsavsnitt**: Omskrivet för att förklara "Magin med `azd up`" för helt nya användare
- **Borttagen duplicerad innehåll**: Eliminering av duplicerat felsökningsavsnitt
- **Felsökningskommandon**: Fixad `azd logs` referens för att använda giltigt `azd monitor --logs`

#### Fikserat

- **🔐 Autentiseringskommandon**: Lagt till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga Kommandoreferenser**: Tog bort kvarvarande `azd logs` från README-felsökningssektionen

#### Anteckningar
- **Omfattning**: Ändringar tillämpade på huvudsakliga README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringar specifikt riktade till utvecklare nya inom AZD

---

### [v3.10.0] - 2026-02-05

#### Korrigering av Azure Developer CLI-kommandon
**Denna version rättar till icke-existerande AZD-kommandon i hela dokumentationen, och säkerställer att alla kodexempel använder giltig syntax för Azure Developer CLI.**

#### Fixat
- **🔧 Icke-existerande AZD-kommandon borttagna**: Omfattande granskning och korrigering av ogiltiga kommandon:
  - `azd logs` (finns inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` underkommandon (finns inte) → ersatt med `azd show` och Azure CLI
  - `azd infra import/export/validate` (finns inte) → borttaget eller ersatt med giltiga alternativ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flaggor (finns inte) → borttagna
  - `azd provision --what-if/--rollback` flaggor (finns inte) → uppdaterade till att använda `--preview`
  - `azd config validate` (finns inte) → ersatt med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finns inte) → borttagna

- **📚 Filer uppdaterade med kommando korrigeringar**:
  - `resources/cheat-sheet.md`: Stort omarbete av kommandoöversikten
  - `docs/deployment/deployment-guide.md`: Rättade rollback- och distributionsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerade logganalyssektioner
  - `docs/troubleshooting/common-issues.md`: Uppdaterade felsökningskommandon
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixade AZD-felsökningsavsnitt
  - `docs/getting-started/azd-basics.md`: Korrigerade övervakningskommandon
  - `docs/getting-started/first-project.md`: Uppdaterade övervaknings- och felsökningsexempel
  - `docs/getting-started/installation.md`: Fixade hjälp- och versionsexempel
  - `docs/pre-deployment/application-insights.md`: Korrigerade loggvisningskommandon
  - `docs/pre-deployment/coordination-patterns.md`: Fixade agentfelsökningskommandon

- **📝 Versionsreferens uppdaterad**: 
  - `docs/getting-started/installation.md`: Ändrade hårdkodad version `1.5.0` till generisk `1.x.x` med länk till releaser

#### Ändrat
- **Rollback-strategier**: Uppdaterad dokumentation för att använda Git-baserad rollback (AZD har ingen inbyggd rollback)
- **Loggvisning**: Ersatte `azd logs`-referenser med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektion**: Tog bort icke-existerande flaggor för parallell/incrementell distribution, gav giltiga alternativ

#### Tekniska detaljer
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Anteckningar
- **Verifiering**: Kommandon verifierade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Slutförande av workshop och dokumentationskvalitetsuppdatering
**Denna version slutför de interaktiva workshop-modulerna, fixar alla brutna dokumentationslänkar och förbättrar den övergripande innehållskvaliteten för AI-utvecklare som använder Microsoft AZD.**

#### Lagt till
- **📝 CONTRIBUTING.md**: Nytt dokument med riktlinjer för bidrag med:
  - Klara instruktioner för felrapportering och förslag på ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och konventioner för commit-meddelanden
  - Information om communityengagemang

#### Slutfört
- **🎯 Workshop Modul 7 (Avslutning)**: Fullständigt slutförd avslutningsmodul med:
  - Omfattande sammanfattning av workshopens prestationer
  - Avsnitt om nyckelkoncept som täcker AZD, mallar och Microsoft Foundry
  - Rekommendationer för fortsatt läranderesa
  - Workshop-utmaningsövningar med svårighetsgrader
  - Community-feedback och supportlänkar

- **📚 Workshop Modul 3 (Nedbrytning)**: Uppdaterade lärandemål med:
  - GitHub Copilot med MCP-servrar aktiveringsvägledning
  - Förståelse för AZD-mallars mappstruktur
  - Infrastruktur-som-kod (Bicep) organisationsmönster
  - Praktiska labbinstruktioner

- **🔧 Workshop Modul 6 (Nedmontering)**: Slutförd med:
  - Resursrensning och kostnadshanteringsmål
  - Användning av `azd down` för säker infrastrukturavveckling
  - Riktlinjer för återställning av mjukborttagna kognitiva tjänster
  - Bonusutforskningsuppmaningar för GitHub Copilot och Azure Portal

#### Fixat
- **🔗 Åtgärdade brutna länkar**: Löste 15+ brutna interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerade sökvägar för ai-model-deployment.md och production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fixade FAQ- och felsökningsguidesökvägar
  - `examples/container-app/microservices/README.md`: Korrigerade kursstarts- och deployguide-sökvägar
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade AI-avsnittsreferenser
  - `course-outline.md`: Fixade instruktörsguide- och AI-workshoplab-referenser

- **📅 Workshop Status Banner**: Uppdaterad från "Under Construction" till aktiv workshopstatus med februari 2026-datum

- **🔗 Workshopnavigering**: Fixade brutna navigeringslänkar i workshop README.md som pekade på icke-existerande labb-1-azd-basics-mapp

#### Ändrat
- **Workshop Presentation**: Tog bort varning om "under konstruktion", workshopen är nu komplett och redo att användas
- **Konsistens i navigering**: Säkerställde att alla workshop-moduler har korrekt intern navigering
- **Lärandebananvändningar**: Uppdaterade kapitelnas korsreferenser till att använda korrekta microsoft-foundry-sökvägar

#### Validerat
- ✅ Alla engelska markdown-filer har giltiga interna länkar
- ✅ Workshopmoduler 0-7 är kompletta med lärandemål
- ✅ Navigering mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehållen genom hela materialet
- ✅ CONTRIBUTING.md ger klar vägledning till community-bidragsgivare

#### Teknisk implementering
- **Länkverifiering**: Automatiserad PowerShell-skript verifierade alla .md interna länkar
- **Innehållsgranskning**: Manuell genomgång av workshopens fullständighet och nybörjarvänlighet
- **Navigationssystem**: Konsekventa mönster för kapitel- och modulsnavigering tillämpade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast på den engelska dokumentationen
- **Översättningar**: Översättningsmappar uppdaterades inte i denna version (automatiserad översättning kommer att synkroniseras senare)
- **Workshopens längd**: Komplett workshop erbjuder nu 3-4 timmar praktiskt lärande

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, Säkerhet och Multi-Agent-mönster
**Denna version lägger till omfattande A-klass-lektioner om Application Insights-integration, autentiseringsmönster och multi-agent-koordinering för produktionsdistribueringar.**

#### Lagt till
- **📊 Application Insights integrationslektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad distribution med automatisk provisioning
  - Kompletta Bicep-mallar för Application Insights + Log Analytics
  - Fungerande Python-applikationer med anpassad telemetri (1 200+ rader)
  - AI/LLM-övervakningsmönster (Microsoft Foundry Models token/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriflöde)
  - 3 praktiska övningar (aviseringar, dashboards, AI-övervakning)
  - Kusto-frågeexempel och kostnadsoptimeringsstrategier
  - Live metrics streaming och realtidsfelsökning
  - 40-50 minuters inlärning med produktionsklara mönster

- **🔐 Autentisering & säkerhetsmönster lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (anslutningssträngar, Key Vault, hanterad identitet)
  - Kompletta Bicep-infrastrukturmallar för säkra distributioner
  - Node.js applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera hanterad identitet, användartilldelad identitet, Key Vault rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara lösenordslösa autentiseringsmönster

- **🤖 Multi-Agent Koordinationsmönster lektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmönster (sekventiell, parallell, hierarkisk, händelsestyrd, konsensus)
  - Komplett orkestratörtjänstimplementation (Python/Flask, 1 500+ rader)
  - 3 specialiserade agentimplementationer (Forskning, Författare, Redaktör)
  - Service Bus-integrering för meddelandekö
  - Cosmos DB state management för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logik, säkringsbrytare)
  - Kostnadsuppdelning ($240-565/månad) med optimeringsstrategier
  - Application Insights integration för övervakning

#### Förbättrat
- **Pre-deployment kapitel**: Inkluderar nu omfattande övervakning och koordinationsmönster
- **Getting Started kapitel**: Förbättrat med professionella autentiseringsmönster
- **Produktionsberedskap**: Fullständig täckning från säkerhet till observabilitet
- **Kursöversikt**: Uppdaterad för att referera nya lektioner i kapitel 3 och 6

#### Ändrat
- **Lärandeprogression**: Bättre integration av säkerhet och övervakning genom kursen
- **Dokumentationskvalitet**: Konsekventa A-klass standarder (95-97%) över nya lektioner
- **Produktionsmönster**: Komplett end-to-end täckning för företagsdistributioner

#### Förbättrat
- **Utvecklarupplevelse**: Klar väg från utveckling till produktionsövervakning
- **Säkerhetsstandarder**: Professionella mönster för autentisering och hemlighetshantering
- **Observabilitet**: Komplett Application Insights integration med AZD
- **AI Arbetsbelastningar**: Specialiserad övervakning för Microsoft Foundry Models och multi-agent system

#### Validerat
- ✅ Alla lektioner inkluderar komplett fungerande kod (inte bara kodsnuttar)
- ✅ Mermaid-diagram för visuellt lärande (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsklara Bicep-mallar distribuerbara via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Dokumentationsbetygsresultat
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agent-arkitekturer
- **Övergripande nytt innehåll**: - Konsekventa högkvalitativa standarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Autentisering**: Hanterad identitet + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Övervakning**: Live metrics + Kusto-frågor + alarm + dashboards
- **Kostnadshantering**: Samplingstrategier, kvarhållningspolicyer, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättringar av dokumentationskvalitet och nytt Microsoft Foundry Models-exempel
**Denna version förbättrar dokumentationskvaliteten i hela arkivet och lägger till ett komplett Microsoft Foundry Models deployment-exempel med gpt-4.1 chatgränssnitt.**

#### Lagt till
- **🤖 Microsoft Foundry Models Chat Exempel**: Fullständig gpt-4.1-distribution med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 modelldistribution)
  - Python-kommandochattgränssnitt med konversationshistorik
  - Key Vault-integration för säker API-nyckelhantering
  - Tokenanvändningsspårning och kostnadsuppskattning
  - Rate limiting och felhantering
  - Omfattande README med 35-45 minuters deployguide
  - 11 produktionsklara filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lagt till praktiska övningar i konfigurationsguiden:
  - Övning 1: Multi-miljö konfiguration (15 minuter)
  - Övning 2: Praktik för hemlighetshantering (10 minuter)
  - Klara framgångskriterier och verifieringssteg
- **✅ Deployverifiering**: Lagt till verifieringssektion i deployguiden:
  - Hälsokontrollprocedurer
  - Framgångskriteriechecklista
  - Förväntade utdata för alla deploykommandon
  - Snabbreferens för felsökning

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-klass kvalitet (93%):
  - Lagt till azure-openai-chat i alla relevanta sektioner
  - Uppdaterat antal lokala exempel från 3 till 4
  - Lagt till i tabellen för AI-applikationsexempel
  - Integrerat i Quick Start för mellananvändare
  - Lagt till i Microsoft Foundry Templates-sektionen
  - Uppdaterat jämförelsematrisen och teknikavsnitt för sökning
- **Dokumentationskvalitet**: Förbättrad från B+ (87%) → A- (92%) i docs-mappen:

  - Lade till förväntade utdata i kritiska kommandoexempel
  - Inkluderade verifieringssteg för konfigurationsändringar
  - Förbättrad praktisk inlärning med övningar

#### Ändrat
- **Inlärningsprogression**: Bättre integration av AI-exempel för mellannivåinlärare
- **Dokumentationsstruktur**: Mer handlingsbara övningar med tydliga resultat
- **Verifieringsprocess**: Tydliga framgångskriterier tillagda i nyckelarbetsflöden

#### Förbättrat
- **Utvecklarupplevelse**: Microsoft Foundry Models-distribution tar nu 35-45 minuter (vs 60-90 för komplexa alternativ)
- **Kostnadstransparens**: Tydliga kostnadsuppskattningar (50-200 USD/månad) för Microsoft Foundry Models-exemplet
- **Inlärningsväg**: AI-utvecklare har tydlig startpunkt med azure-openai-chat
- **Dokumentationsstandarder**: Konsekventa förväntade utdata och verifieringssteg

#### Validerat
- ✅ Microsoft Foundry Models-exempel fullt fungerande med `azd up`
- ✅ Alla 11 implementationsfiler syntaktiskt korrekta
- ✅ README-instruktioner överensstämmer med faktisk distributionsupplevelse
- ✅ Dokumentationslänkar uppdaterade på 8+ platser
- ✅ Exempelindex återspeglar exakt 4 lokala exempel
- ✅ Inga dubbletter av externa länkar i tabeller
- ✅ Alla navigationsreferenser korrekta

#### Teknisk implementering
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mönster
- **Säkerhet**: Managed Identity redo, hemligheter i Key Vault
- **Övervakning**: Application Insights-integration
- **Kostnadshantering**: Token-spårning och användningsoptimering
- **Distribution**: Enkelt `azd up`-kommando för fullständig uppsättning

### [v3.6.0] - 2025-11-19

#### Större uppdatering: Container App-distributionsexempel
**Denna version introducerar omfattande, produktionsklara exempel på containerapplikationsdistribution med Azure Developer CLI (AZD), med full dokumentation och integration i inlärningsvägen.**

#### Tillagt
- **🚀 Container App-exempel**: Nya lokala exempel i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett översikt över containeriserade distributioner, snabbstart, produktion och avancerade mönster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybörjarvänligt REST API med scale-to-zero, hälsokontroller, övervakning och felsökning
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsredo multi-service-distribution (API Gateway, Product, Order, User, Notification), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blue-green/canary-distribution
- **Bästa praxis**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-vägledning för containeriserade arbetsbelastningar
- **Kodexempel**: Komplett `azure.yaml`, Bicep-mallar och flerspråkiga serviceimplementationer (Python, Node.js, C#, Go)
- **Testning & felsökning**: Slut-till-slut-testscenarier, övervakningskommandon, felsökningsvägledning

#### Ändrat
- **README.md**: Uppdaterad för att visa och länka nya container app-exempel under "Lokala exempel - Containerapplikationer"
- **examples/README.md**: Uppdaterad för att lyfta fram container app-exempel, lägga till jämförelsematriselement och uppdatera teknik-/arkitekturreferenser
- **Kursplan & studievägledning**: Uppdaterad för att referera nya container app-exempel och distributionsmönster i relevanta kapitel

#### Validerat
- ✅ Alla nya exempel kan distribueras med `azd up` och följer bästa praxis
- ✅ Dokumentationens korslänkar och navigation uppdaterade
- ✅ Exempel täcker nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Noteringar
- **Omfattning**: Endast engelskspråkig dokumentation och exempel
- **Nästa steg**: Utöka med ytterligare avancerade containermönster och CI/CD-automation i framtida versioner

### [v3.5.0] - 2025-11-19

#### Produktomprofilering: Microsoft Foundry
**Denna version implementerar en omfattande namnändring av produkten från "Microsoft Foundry" till "Microsoft Foundry" i all engelsk dokumentation för att återspegla Microsofts officiella omprofilering.**

#### Ändrat
- **🔄 Produktnamnsuppdatering**: Fullständig omprofilering från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i engelsk dokumentation i `docs/`-mappen
  - Omdöpt mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdöpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade i 7 dokumentationsfiler

- **📁 Ändringar i mappstruktur**:
  - `docs/ai-foundry/` omdöpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att återspegla ny mappstruktur
  - Navigationslänkar validerade i all dokumentation

- **📄 Filändringar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera till nytt filnamn

#### Uppdaterade filer
- **Kapitelrundokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslänkuppdateringar
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Använder redan Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitelnavigeringslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa kapitel-länkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigation, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigationslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapitelrubriker, mallsektion, community-insikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, inlärningsmål, kapitlets resurser)

#### Validerat
- ✅ Inga kvarvarande "ai-foundry"-mappsökvägsreferenser i engelska dokument
- ✅ Inga kvarvarande "Microsoft Foundry"-produktnamnsreferenser i engelska dokument
- ✅ Alla navigationslänkar funktionella med ny mappstruktur
- ✅ Fil- och mappnamnsändringar genomförda framgångsrikt
- ✅ Korsreferenser mellan kapitel validerade

#### Noteringar
- **Omfattning**: Ändringar tillämpade endast på engelsk dokumentation i `docs/`-mappen
- **Översättningar**: Översättningsmappar (`translations/`) uppdateras inte i denna version
- **Workshop**: Workshop-material (`workshop/`) uppdateras inte i denna version
- **Exempel**: Exempelfiler kan fortfarande innehålla gamla namngivningar (kommer att åtgärdas i framtida uppdatering)
- **Externa länkar**: Externa URL:er och GitHub-repositoriumreferenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala grenar eller dokumentation som refererar till den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Byt produktnamn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validera att alla interna dokumentationslänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förhandsvisning och valideringsförbättringar för infrastruktur
**Denna version introducerar omfattande stöd för den nya förhandsvisningsfunktionen i Azure Developer CLI och förbättrar användarupplevelsen i workshopen.**

#### Tillagt
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattande täckning av den nya förhandsvisningskapaciteten för infrastruktur
  - Kommandoreferens och användningsexempel i fusklapp
  - Detaljerad integration i provisioneringsguide med användningsfall och fördelar
  - Pre-flight-check-integration för säkrare distributionsvalidering
  - Uppdateringar i komma igång-guide med säkerhetsfokuserade distributionspraxis
- **🚧 Workshopstatusbanderoll**: Professionell HTML-banderoll som indikerar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Senast uppdaterad tidsstämpel för transparens
  - Mobilanpassad design för alla enhetstyper

#### Förbättrat
- **Infrastrukturens säkerhet**: Förhandsvisningsfunktionalitet integrerad i hela distributionsdokumentationen
- **Validering före distribution**: Automatiserade skript inkluderar nu förhandsvisningstestning
- **Utvecklararbetsflöde**: Uppdaterade kommandoordningar för att inkludera förhandsvisning som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar sätts för användare angående innehållsutvecklingsstatus

#### Ändrat
- **Distributionens bästa praxis**: Förhandsvisningsförst arbetsflöde rekommenderas nu
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i inlärningsprocessen
- **Workshop-presentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättrat
- **Säkerhetsförst-ansats**: Infrastrukturändringar kan nu valideras före distribution
- **Samarbete i teamet**: Förhandsvisningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader före provisionering
- **Riskminimering**: Minskat antal distributionsfel genom förhandsvalidering

#### Teknisk implementering
- **Integration i flera dokument**: Förhandsvisningsfunktion dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel genom all dokumentation
- **Integrering av bästa praxis**: Förhandsvisning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NYA funktionsmarkeringar för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banderoll med gradientstil
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Bibehåller repositoryns trovärdighet och sätter förväntningar
- **Tidslinjetransparens**: Oktober 2025 som senaste uppdatering för ansvarstagande

### [v3.3.0] - 2025-09-24

#### Förbättrad workshop-material och interaktiv inlärningsupplevelse
**Denna version introducerar omfattande workshop-material med webbläsarbaserade interaktiva guider och strukturerade inlärningsvägar.**

#### Tillagt
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs-förhandsvisningsfunktion
- **📝 Strukturerade workshopinstruktioner**: 7-stegs guidad inlärningsväg från upptäckt till anpassning
  - 0-Introduktion: Workshopöversikt och installation
  - 1-Välj-AI-mall: Mallupptäckt och urvalsprocess
  - 2-Validera-AI-mall: Distributions- och valideringsprocedurer
  - 3-Analysera-AI-mall: Förstå mallens arkitektur
  - 4-Konfigurera-AI-mall: Konfiguration och anpassning
  - 5-Anpassa-AI-mall: Avancerade modifieringar och iterationer
  - 6-Riv ner infrastruktur: Rensning och resursförvaltning
  - 7-Avslutning: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad inlärningsupplevelse
- **🎯 Praktisk inlärningsväg**: 3-stegs metodik (Upptäckt → Distribution → Anpassning)
- **📱 GitHub Codespaces-integration**: Sömlös utvecklingsmiljöinstallation

#### Förbättrat
- **AI Workshop Lab**: Utökat med omfattande 2-3 timmars strukturerad inlärningsupplevelse
- **Workshopdokumentation**: Professionell presentation med navigation och visuella hjälpmedel
- **Inlärningsprogression**: Tydlig steg-för-steg-vägledning från mallval till produktionsdistribution
- **Utvecklarupplevelse**: Integrerade verktyg för strömlinjeformade utvecklingsarbetsflöden

#### Förbättrat
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sökfunktion, kopieringsfunktionalitet och temaväxling
- **Självstyrd inlärning**: Flexibel workshopstruktur som passar olika inlärningstakter
- **Praktisk tillämpning**: Realtidsbaserade AI-mall distributionsscenarier
- **Gemenskapsintegration**: Discord-integration för workshopstöd och samarbete

#### Workshopfunktioner
- **Inbyggd sökning**: Snabb sökning av nyckelord och lektioner
- **Kopiera kodblock**: Hover-funktion för kopiering av alla kodexempel
- **Temaväxling**: Mörkt/ljust läge för olika preferenser
- **Visuella tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt tillgång till Discord för communitystöd

### [v3.2.0] - 2025-09-17

#### Omstrukturering av navigation och kapitelbaserat inlärningssystem
**Denna version introducerar en omfattande kapitelbaserad inlärningsstruktur med förbättrad navigation genom hela repositoriet.**

#### Tillagt
- **📚 Kapitelbaserat inlärningssystem**: Omstrukturerade hela kursen till 8 progressiva inlärningskapitel
  - Kapitel 1: Grundläggande & snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-först utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kod & distribution (⭐⭐⭐ - 1-1,5 tim)
  - Kapitel 5: Multi-agent AI-lösningar (⭐⭐⭐⭐ - 2-3 tim)
  - Kapitel 6: Validering & planering före distribution (⭐⭐ - 1 tim)
  - Kapitel 7: Felsökning & debugging (⭐⭐ - 1-1,5 tim)
  - Kapitel 8: Produktions- & företagsmönster (⭐⭐⭐⭐ - 2-3 tim)
- **📚 Omfattande navigationssystem**: Konsekventa navigeringshuvuden och -fötter i all dokumentation
- **🎯 Framstegsspårning**: Checklista för kursavslut och inlärningsverifiering
- **🗺️ Vägledning för inlärningsväg**: Tydliga startpunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigation**: Relaterade kapitel och förkunskaper tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärplattform med kapitelbaserad organisation
- **Dokumentationsnavigation**: Varje sida inkluderar nu kapitelkontext och progressionsvägledning
- **Mallorganisation**: Exempel och mallar kartlagda till lämpliga inlärningskapitel

- **Resursintegration**: Fuskblad, vanliga frågor och studievägledningar kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labbar kopplade till flera kapitelmål för lärande

#### Ändrat
- **Lärandeprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Flyttat konfigurationsguiden till Kapitel 3 för bättre undervisningsflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll under hela inlärningsresan
- **Produktionsinnehåll**: Avancerade mönster samlade i Kapitel 8 för företagsanvändare

#### Förbättrat
- **Användarupplevelse**: Klara navigationsbrödsmulor och indikatorer för kapitelprogression
- **Tillgänglighet**: Konsekventa navigationsmönster för enklare kursnavigering
- **Professionell presentation**: Universitetslik kursstruktur lämplig för akademisk och företagsutbildning
- **Inlärningseffektivitet**: Minskat tidsåtgång för att hitta relevant innehåll genom förbättrad organisering

#### Teknisk implementering
- **Navigeringsrubriker**: Standardiserad kapitelnavigering i över 40 dokumentationsfiler
- **Footer-navigering**: Konsekvent vägledning för progression och indikatorer för kapitelavslutning
- **Korslänkning**: Omfattande internt länk system som kopplar samman relaterade koncept
- **Kapitelmappning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättring av studievägledning
- **📚 Omfattande lärandemål**: Omstrukturerad studievägledning för anpassning till 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel inkluderar specifika lärandemål och praktiska övningar
- **📋 Progressionsspårning**: Veckoschema för lärande med mätbara resultat och avklarandelistor
- **❓ Bedömningsfrågor**: Kunskapskontrollfrågor för varje kapitel med professionella mål
- **🛠️ Praktiska övningar**: Praktiska aktiviteter med verkliga driftsättningsscenarier och felsökning
- **📊 Kompetensprogression**: Tydlig utveckling från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och system för erkännande i gemenskapen
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors lärandeplan med milstolpevalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar multi-agent lösningen för detaljhandel med bättre agentnamn och förstärkt dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatt "Cora agent" med "Customer agent" i hela detaljhandelsmultiagentlösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterad all dokumentation, ARM-mallar och kodexempel för att använda konsekvent namn "Customer agent"
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsekvens**: Säkerställt att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM-mallpaket**: Uppdaterat retail-multiagent-arm-template med Customer agent-referenser
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med uppdaterade agentnamn
- **Kodexempel**: Pythonklasser och implementeringsexempel använder nu CustomerAgent-namn
- **Miljövariabler**: Uppdaterat alla distributionsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrat
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Lärandematerial**: Mer intuitiva agentnamn för utbildningssyften
- **Mallens användarvänlighet**: Förenklad förståelse av agentfunktioner och distributionsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med CustomerAgent-referenser
- Ersatt CoraAgent-klasser med CustomerAgent i Pythonexempel
- Modifierade ARM-mallens JSON-konfigurationer för att använda agenttypen "customer"
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_*-mönster
- Uppfräschade alla distributionskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - Fokus på AI-utvecklare och Microsoft Foundry-integration
**Denna version transformerar arkivet till en heltäckande AI-fokuserad lärresurs med Microsoft Foundry-integration.**

#### Tillagt
- **🤖 AI-först inlärningsväg**: Komplett omstrukturering prioriterande AI-utvecklare och ingenjörer
- **Microsoft Foundry Integrationsguide**: Omfattande dokumentation för att koppla AZD med Microsoft Foundry-tjänster
- **Mönster för AI-modellsdistribution**: Detaljerad guide för val av modeller, konfiguration och produktionsdistributionsstrategier
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-distribuerbara lösningar
- **Produktionspraxis för AI**: Företagsklara mönster för skalning, övervakning och säkerhet av AI-arbetsbelastningar
- **AI-specifik felsökningsguide**: Omfattande felsökning för Microsoft Foundry-modeller, kognitiva tjänster och AI-distributionsproblem
- **AI-mallgalleri**: Utvald samling Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska laborationer och referensmaterial

#### Förbättrat
- **README-struktur**: AI-utvecklarfokuserad med 45% community-intressedata från Microsoft Foundry Discord
- **Inlärningsvägar**: Dedikerad AI-utvecklares resa tillsammans med traditionella vägar för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Community-integration**: Förbättrat Discord-stöd med AI-specifika kanaler och diskussioner

#### Säkerhet & produktion
- **Mönster för hanterad identitet**: AI-specifik autentisering och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-region deployment**: Strategier för global AI-applikationsdistribution
- **Prestandaövervakning**: AI-specifika mätvärden och Application Insights-integration

#### Dokumentationskvalitet
- **Linjär kursstruktur**: Logisk progression från nybörjare till avancerade AI-distributionsmönster
- **Verifierade URL:er**: Alla externa arkivlänkar är verifierade och tillgängliga
- **Fullständig referens**: Alla interna dokumentationslänkar är validerade och funktionella
- **Produktionsberedda**: Företagsdistributionsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Omstrukturering av arkiv och professionell förbättring
**Denna version representerar en betydande omarbetning av arkivets struktur och innehållspresentation.**

#### Tillagt
- **Strukturerat lärandearkitektur**: Alla dokumentationssidor inkluderar nu introduktion, lärandemål och inlärningsresultat
- **Navigationssystem**: Tillagt länkar för föregående/nästa lektion i hela dokumentationen för guidad inlärningsprogression
- **Studievägledning**: Omfattande study-guide.md med lärandemål, övningar och bedömningsmaterial
- **Professionell presentation**: Alla emojiikoner borttagna för förbättrad tillgänglighet och proffsigt utseende
- **Förbättrad innehållsstruktur**: Förbättrad organisering och flöde för lärandematerial

#### Ändrat
- **Dokumentationsformat**: Standardiserat all dokumentation med konsekvent lärandefokuserad struktur
- **Navigationsflöde**: Implementerat logisk progression genom allt lärandematerial
- **Innehållspresentation**: Borttagit dekorativa element till förmån för tydlig, professionell formatering
- **Länkstruktur**: Uppdaterat alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrat
- **Tillgänglighet**: Borttagit beroenden av emoji för bättre kompatibilitet med skärmläsare
- **Professionellt utseende**: Ren, akademisk stil lämplig för företagsutbildning
- **Inlärningserfarenhet**: Strukturerat tillvägagångssätt med klara mål och resultat för varje lektion
- **Innehållsorganisering**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första version - Omfattande AZD-lärandearkiv

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett introduktionsguide-serie
  - Omfattande dokumentation för distribution och provisioning
  - Detaljerade felsökningsresurser och debugguider
  - Verktyg och procedurer för validering innan driftsättning

- **Introduktionsmodul**
  - AZD-grunder: kärnkoncept och terminologi
  - Installationsguide: plattformsspecifika installationsanvisningar
  - Konfigurationsguide: miljöinställning och autentisering
  - Första projekthandledning: steg-för-steg praktisk inlärning

- **Distributions- och provisioneringsmodul**
  - Distributionsguide: komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som kod med Bicep
  - Best practices för produktionsdistributioner
  - Mönster för multi-tjänstarkitektur

- **Modul för validering före driftsättning**
  - Kapacitetsplanering: validering av tillgängliga Azure-resurser
  - SKU-val: omfattande vägledning för servicenivåer
  - Pre-flight-kontroller: automatiserade valideringsskript (PowerShell och Bash)
  - Kostnadsuppskattning och budgetverktyg

- **Felsökningsmodul**
  - Vanliga problem: ofta förekommande problem och lösningar
  - Debugguide: systematiska felsökningsmetoder
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resurser och referenser**
  - Kommandosnabbguide: snabbreferens för viktiga kommandon
  - Ordlista: omfattande terminologi- och förkortningsdefinitioner
  - FAQ: detaljerade svar på vanliga frågor
  - Externa länkar till resurser och gemenskapskopplingar

- **Exempel och mallar**
  - Exempel på enkel webbapplikation
  - Mall för distribution av statisk webbplats
  - Konfiguration för containerapplikation
  - Mönster för databasintegration
  - Exempel på mikrotjänstarkitektur
  - Implementeringar av serverlösa funktioner

#### Funktioner
- **Multi-plattformsstöd**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera kompetensnivåer**: Innehåll designat för studenter till professionella utvecklare
- **Praktiskt fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus från början**: Säkerhetsbästa praxis integrerad genom hela innehållet
- **Kostnadsoptimering**: Råd för kostnadseffektiv distribution och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg instruktioner**: Tydlig, handlingsorienterad vägledning
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Integrering av bästa praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med senaste Azure-tjänster och azd-funktioner

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### AI-plattformsutvidgning
- **Multi-modellstöd**: Integrationsmönster för Hugging Face, Azure Machine Learning och egna modeller
- **AI-agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-distributioner
- **Avancerade RAG-mönster**: Alternativ för vektordatabaser utöver Azure AI Search (Pinecone, Weaviate etc.)
- **AI-observerbarhet**: Förbättrad övervakning för modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code-tillägg**: Integrerad AZD + Microsoft Foundry utvecklarupplevelse
- **GitHub Copilot-integration**: AI-assisterad AZD-mallgenerering
- **Interaktiva tutorials**: Praktiska kodningsövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella inlärare med fokus på AI-distributioner

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Styrningsramverk**: AI-modellstyrning, efterlevnad och revisionsspår
- **Multi-Tenant AI**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-distribution**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln AI**: Mönster för multi-moln och hybriddistribution av AI-arbetsbelastningar

#### Avancerade funktioner
- **AI-pipelineautomatisering**: MLOps-integration med Azure Machine Learning-pipelines
- **Avancerad säkerhet**: Zero-trustmönster, privata slutpunkter och avancerat hot skydd
- **Prestandaoptimering**: Avancerad justering och skalningsstrategier för högt genomflöde i AI-applikationer
- **Global distribution**: Innehållsleverans- och edge-cachemönster för AI-applikationer

### Version 3.0.0 (Planerad) - Överspelad av aktuell utgåva
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande Microsoft Foundry-integration (Slutförd)
- ✅ **Interaktiva tutorials**: Praktiskt AI-workshop-labb (Slutförd)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutförd)
- ✅ **Prestandaoptimering**: AI-arbetsbelastningars justeringsstrategier (Slutförd)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Några slutförda i aktuell utgåva
- ✅ **Ytterligare exempel**: AI-fokuserade distributionsscenarier (Slutförd)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutförd)
- **Verktygsintegration**: Förbättrade guider för IDE och redigerarintegration
- ✅ **Utökad övervakning**: AI-specifika övervaknings- och larmmönster (Slutförd)

#### Fortfarande planerade för framtida version
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offline-åtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community-dashboard**: Realtidsmetrik och bidragsspårning för gemenskapen

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta arkiv, se till att ändringsloggsinträden inkluderar:

1. **Versionsnummer**: Följande semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Tillagt, Ändrat, Föråldrat, Borttaget, Fixat, Säkerhet
4. **Tydlig beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur ändringar påverkar befintliga användare

### Ändringskategorier

#### Tillagt
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller hjälpmedel

#### Ändrat
- Modifieringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Föråldrat
- Funktioner eller tillvägagångssätt som fasas ut
- Dokumentationsavsnitt planerade för borttagning
- Metoder som har bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller inaktuella tillvägagångssätt
- Redundant eller konsoliderat innehåll

#### Fixat
- Korrigeringar av fel i dokumentation eller kod
- Lösning av rapporterade problem eller fel
- Förbättringar av exakthet eller funktionalitet


#### Säkerhet
- Säkerhetsrelaterade förbättringar eller korrigeringar
- Uppdateringar av säkerhetsbästa praxis
- Åtgärd av säkerhetssårbarheter

### Riktlinjer för semantisk versionering

#### Huvudversion (X.0.0)
- Stora förändringar som kräver användaråtgärd
- Betydande omstrukturering av innehåll eller organisation
- Förändringar som ändrar den grundläggande metoden eller tillvägagångssättet

#### Mindre version (X.Y.0)
- Nya funktioner eller tillägg av innehåll
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Gemenskapens feedback och förslag

Vi uppmuntrar aktivt gemenskapens feedback för att förbättra denna lärresurs:

### Hur man lämnar feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Discord Discussions**: Dela idéer och engagera dig med Microsoft Foundry-gemenskapen
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community Forums**: Deltag i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI-innehållets noggrannhet**: Korrigeringar av AI-tjänsteintegration och distribution
- **Inlärningsupplevelse**: Förslag för förbättrad AI-utvecklarinlärning
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika inlärningsbehov
- **AI-verktygsintegration**: Förslag för bättre AI-utvecklingsarbetsflödesintegration
- **Produktion AI-mönster**: Förfrågningar om AI-distributionsmönster för företag

### Svarsåtagande
- **Problembesvarande**: Inom 48 timmar för rapporterade problem
- **Funktionsförfrågningar**: Utvärdering inom en vecka
- **Gemenskapsbidrag**: Granskning inom en vecka
- **Säkerhetsfrågor**: Omedelbar prioritet med snabb hantering

## Underhållsschema

### Regelbundna uppdateringar
- **Månadsvisa genomgångar**: Innehållsnoggrannhet och länkvalidering
- **Kvartalsvisa uppdateringar**: Stora tillägg och förbättringar av innehåll
- **Halvåriga genomgångar**: omfattande omstrukturering och förbättringar
- **Årliga releaser**: Stora versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetskontroll
- **Automatiserade tester**: Regelbunden validering av kodexempel och länkar
- **Integrering av gemenskapsfeedback**: Regelbunden införlivning av användarförslag
- **Teknologiuppdateringar**: Anpassning till senaste Azure-tjänster och azd-releaser
- **Tillgänglighetsgranskningar**: Regelbunden granskning för inkluderande designprinciper

## Versionssupportpolicy

### Aktuell versionssupport
- **Senaste huvudversionen**: Full support med regelbundna uppdateringar
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader
- **Äldre versioner**: Endast gemenskapssupport, inga officiella uppdateringar

### Migreringsvägledning
När huvudversioner släpps erbjuder vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsnoteringar**: Detaljer om brytande förändringar
- **Verktygsstöd**: Skript eller verktyg för att underlätta migrering
- **Gemenskapssupport**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående lektion**: [Study Guide](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Main README](README.md)

**Håll dig uppdaterad**: Bevaka detta arkiv för aviseringar om nya releaser och viktiga uppdateringar av lärmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->