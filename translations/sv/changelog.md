# Ändringslogg - AZD för nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla viktiga förändringar, uppdateringar och förbättringar i AZD For Beginners-repositoriet. Vi följer principer för semantisk versionering och upprätthåller denna logg för att hjälpa användare förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa buggfixar och korrigeringar för att säkerställa noggrannhet
- Följ utvecklingen av läromaterialen över tid

## Läranderesultat

Efter att ha granskat poster i ändringsloggen kommer du att kunna:
- Identifiera nytt innehåll och resurser tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din inlärningsväg baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.24.0]- 2026-11-04

#### Åtgärdat
- Reparar navigering för engelska kursen, flyttade sidvägar, saknade ankare och inaktuella externa referenser, inklusive Kapitel 2:s länk till produktionsguiden för AI.
- Granskade aktuell vägledning mot publicerade AZD 1.37.2, agenter 1.0.0-beta.23 och utvärderingar 1.0.0-beta.2. Dokumenterade det separata `azd ai eval` arbetsflödet och migrering av optimeringskonfiguration.
- Korrigerade icke-stödda CLI-flaggor, autentiseringsavgränsningar, vägledning för miljö/hemligheter i klartext, uppdateringar i infrastruktur, modellkonfiguration och destruktiva återställningsexempel.
- Uppdaterade workshoppen mot aktuellt AI Agents-exempel, inklusive faktiska hookar, konfigurationsinmatningar, utvärderingstest, red-teaming ingångspunkter och observabilitet.
- Korrigerade exempelimplementeringspåståenden och reparerade tillhörande applikations-/infrastruktur-/konfigurationsproblem. Materialet för detaljhandelsarkitektur är uttryckligen åtskilt från en komplett fungerande applikation.
- Återställde CodeQL språkmatrisen, valde stöd för Node.js 24 för utvecklingscontainern och gjorde så att uppställningsvalidatorer rapporterar misslyckade versionskommandon.

#### Tillagt
- En engelskspråkig offline-länk/ankar-kontrollant, regressions tester och ett dokumentationsarbetsflöde som också bygger workshoppen i strikt läge. Genererade översättningar och översatta bilder är uteslutna.

#### Valideringsomfattning
- Kontroll av källa, syntax, konfiguration, lokalt beteende och nätverkslänkar fastställer inte live-barhet för Azure-distribution, kvot, RBAC, regional tillgänglighet av modeller, fakturering, säkerhetsöverensstämmelse eller produktionsberedskap.
- Äldre poster nedan är historiska register, inte aktuella kommandon eller release-instruktioner.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Uppdatering: Aktuell Versionsstatus
**Denna version validerar om kursen mot `azd` `1.27.1` (juli 2026, senaste stabila release) och det aktuella preview AI agent-tillägget `azure.ai.agents` `1.0.0-beta.5`, vilket gör att varje "validerad mot"-banner är uppdaterad efter releaserna 1.26.0, 1.27.0 och 1.27.1.**

#### Ändringar
- **✅ Valideringsbaslinje uppdaterad** från `azd 1.25.6` (juni 2026) till `azd 1.27.1` (juli 2026) över root README, alla kapitel-README:er, Kapitel 1 dev-container lektion (inklusive exemplen med låst version), Kapitel 4 lektionen för anpassade mallar, Kapitel 5 lektionen för multi-agent, och workshopdokumenationen
- **🤖 Kapitel 2 baslinje uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.27.1` över `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, och `microsoft-foundry-integration.md`; valideringsnotiserna ändrade till 2026-07-13
- **🧩 AI agent-tillägget höjt** från `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` till aktuell `1.0.0-beta.5` release i Kapitel 2 README och `agents.md`
- **🧪 Workshop valideringsexempel** (`azd version` output) uppdaterat till `1.27.1`

#### Noteringar om relevanta azd releaser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-stöd för Azure Functions på Flex Consumption, `azd config sub-filter` per-tenant abonnemangsfilter, självständiga tilläggspaket (`azd x pack --bundle`), och `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellera Azure AI Foundry-projekt/agent direkt i `azure.yaml` (init utan Bicep/Terraform), stöd för container distribution för App Service (`host: appservice` + `language: docker`), direkt `-s/--source` för `azd extension` kommandon, och `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flagga för `azd extension install`, utfasade modeller exkluderade från katalog-/kvotmotiveringar som standard, och flera buggfixar

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

#### Nybörjar-fyllnad #2: Mallskapande, Dev Containers, Pulumi, Azure DevOps, Service Principals och mer
**Denna version åtgärdar kvarvarande mellanliggande luckor från azd-coverage analysen: hur man skapar och publicerar egna mallar, reproducerbara dev-container/Codespaces miljöer, Pulumi som infrastrukturleverantör, en genomgång av Azure DevOps CI/CD, autentisering med service-principals, vägledning för värdval (AKS/Spring Apps), `azd restore`/`azd package` förklaringar, felhantering i hookar, och team-/gemensamma miljöpraktiker.**

#### Tillagt
- **🧱 Ny lektion i Kapitel 4** `docs/chapter-04-infrastructure/custom-templates.md` — skapa din egen azd-mall: nödvändig struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template` fältet, parameterisering av infrastruktur med `uniqueString()` resurstoken och `azd-env-name` taggen, lokal testning med `azd init --template <local-path>`, publicering till GitHub och inlämning till Awesome AZD-galleriet
- **📦 Ny lektion i Kapitel 1** `docs/chapter-01-foundation/dev-containers.md` — reproducerbara azd miljöer med Dev Containers och GitHub Codespaces: ett minimalt `.devcontainer/devcontainer.json` med officiella `ghcr.io/azure/azure-dev/azd` funktionen, språksspecifika funktioner, `docker-in-docker` för containervärdar, och `azd auth login --use-device-code` för fjärrinloggning
- **🧩 Pulumi med azd** avsnitt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-mappstruktur, stackar mappade till azd-miljöer, nödvändiga output/taggning, och identiskt `azd up` / `azd down` arbetsflöde
- **🎯 Vägledning för värdval** i `docs/chapter-04-infrastructure/provisioning.md` — en nybörjarvänlig jämförelse av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` och `springapp`, med vägledning om när man ska välja AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD genomgång** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, tjänstekoppling med workload identity federation (OIDC), den genererade `azure-dev.yml`, och variabelgruppsinställning
- **🔑 Service Principals (Mönster 4)** tillagt i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, icke-interaktiv `azd auth login` med klienthemlighet vs federerade/OIDC-referenser, när man ska använda, och säker förvaring av referenser
- **🪝 Felhantering i hookar** delsektion i `docs/chapter-04-infrastructure/deployment-guide.md` — exitkoder och `set -e`, `continueOnError`, testning av hookar isolerat med `azd hooks run`, OS-specifika skal, och `--debug`
- **👥 Team- / delade miljöer** avsnitt i `docs/chapter-03-configuration/configuration.md` — vad som hör hemma i `.azure/`, vad som ska gitignoreras, per-utvecklare miljöer, `azd env list`/`select`, och att tillhandahålla miljövärden i CI/CD
- **🧰 `azd restore` och utökade `azd package`** förklaringar i `resources/cheat-sheet.md` — återställa beroenden och bygga ett distribuerbart artefakt utan att distribuera

#### Ändringar
- **🧭 Kapitel 4 lektionstabell** uppdaterad för att inkludera nya lektionen "Skapa din egen mall" (Lektion 3)
- **🧭 Kapitel 1 lektionstabell** uppdaterad för att inkludera nya lektionen "Dev Containers & Codespaces" (Lektion 5); navigationsfötter kopplade mellan `bring-your-own-app.md` och `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Nybörjarfyllnad: Praktisk multi-agent lektion, "Bring Your Own App," Terraform och CI/CD-genomgång
**Den här versionen stänger de största luckorna för en komplett nybörjarguide genom att lägga till två nya praktiska lektioner (en deployerbar multi-agent genomgång och tillägg av azd i en befintlig app), en nybörjarvänlig introduktion till hookar, ett Terraform-med-azd avsnitt, en steg-för-steg genomgång av GitHub Actions pipeline, en förklaring av de nya preview-tilläggen, och en explicit checklista för verifiering av distribution.**

#### Tillagt
- **🤝 Ny lektion i Kapitel 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en helt praktisk, deployerbar två-agent genomgång (orkestrator + specialister) med en riktig mall (`contoso-creative-writer`), som täcker när man ska använda multi-agent, `azd up` arbetsflödet, förstå de distribuerade resurserna, spårning över agenter, anpassning och städning
- **📦 Ny lektion i Kapitel 1** `docs/chapter-01-foundation/bring-your-own-app.md` — hur man lägger till azd i ett redan existerande projekt med `azd init` ("använd kod i aktuell katalog"), förstå `azure.yaml` och `infra/`, `azd infra generate`, värdupptäckt och distribution med `azd up`
- **🌐 Terraform med azd** avsnitt tillagt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguration, `.tf` mappstruktur, nödvändiga `AZURE_*` outputs och `azd-env-name` tagging, och identiskt `azd up` / `azd down` arbetsflöde (stänger luckan där Terraform-stöd hävdades men endast Bicep visades)
- **⚙️ Steg-för-steg GitHub Actions genomgång** i `docs/chapter-08-production/production-ai-practices.md` — från GitHub repo till automatiserade deploymenter: `azd pipeline config`, OIDC federerade referenser (inga sparade hemligheter), den genererade `azure-dev.yml`, och hemligheter-vs-variabler vägledning
- **🪝 Nybörjarintroduktion "Ny till hookar?"** i `docs/chapter-04-infrastructure/deployment-guide.md` — vad en hook är, en hook-fasutabell, en minimal första hook, och köra hookar manuellt med `azd hooks run`
- **✅ "Verifiera din deployment" checklista** tillagd i steg 5 av `docs/chapter-01-foundation/first-project.md` — röktest, hälsokontroll på endpoint och explicita framgångskriterier
- **🧩 Förklaring av nya preview-tillägg** `azure.ai.skills` och `azure.ai.connections` (vad de är och när man ska använda dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ändrat
- **🧭 Kapitel 5 lektionstabell** korrigerad: `multi-agent-basics.md` är nu Lektion 1 (den enda helt praktiska lektionen), med ärlig märkning att Lektion 2 finns i Kapitel 6 och Retail-scenariot är en arkitektur-blåkopiering, inte en enkommando-mall
- **🧭 Kapitel 1 lektionstabell** inkluderar nu nya lektionen "Bring Your Own App" (Lektion 4)
- **🔗 Navigationsfötter** uppdaterade: `first-project.md` länkar nu framåt till `bring-your-own-app.md`

#### Åtgärdat
- **🧱 Stängde "hävdad men saknad" Terraform-lucka** — kursen refererade tidigare till Terraform-stöd utan att visa det
- **🔀 Korrigerade vilseledande kapitel 5 korslänkar** som antydde att en fullständig multi-agent-implementation fanns när det endast var en arkitektur-blåkopiering

#### Uppdaterade filer
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nytt)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nytt)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Denna version validerar om kursen mot `azd` `1.25.6` (juni 2026) och `azure.ai.agents` `0.1.40-preview`-förlängningen, utökar AI-vägledning från "stöd för en agent" till hela agentlivscykeln (testa → utvärdera → optimera → inspektera → ta bort), exponerar de nya `azure.ai.skills` och `azure.ai.connections` förhandsvisningsförlängningarna, och noterar produktrebranden från ".NET Aspire" till "Aspire".**

#### Tillagt
- **🔁 Full agentlivscykeltäckning** för nybörjare och AI-ingenjörer över dokumentationen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livscykeltabell (stöd → testa → mät → förbättra → inspektera → städa upp) tillagd i avsnittet Förlängningar och AI-kommandon
  - `docs/chapter-08-production/production-ai-practices.md` — Nytt avsnitt "Hantera agentlivscykeln" som täcker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, och `delete --force`
  - `resources/cheat-sheet.md` — Utökade AI-agentkommandon med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, och `delete --force`
- **🧩 Nya förhandsvisningsförlängningar** dokumenterade: `azure.ai.skills` (återanvändbara agentfärdigheter) och `azure.ai.connections` (Foundry-anslutningar) tillagda i förlängningstabellen och fusklapp
- **⏱️ Vägledning för svarstider** — `azd ai agent invoke`-exempel visar nu total latens och tid-till-första-byte
- **📌 Versionsbanner** i root-README som pekar läsare till `azd version` och `azd upgrade`

#### Ändrat
- **✅ Valideringsbaslinje uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.25.6` (juni 2026) i alla kapitels README-filer och workshop-dokument
- **🤖 Kapitel 2 förlängningsnot** uppdaterad från `azure.ai.agents` `0.1.18-preview` till `0.1.40-preview`
- **🧪 Workshop-valideringsexempel** (`azd version` utdata) uppdaterad till `1.25.6`
- **🧭 README "Vad är nytt i azd idag"** uppdaterad för att framhäva den kompletta agentlivscykeln, nya AI-förlängningar, och senaste kvalitetsförbättringarna (`azd init` idempotens, `azd auth login` rensning av föråldrade token, `azd tool` första-kör-prompt)
- **📖 Kapitel 2 agents.md (Alternativ 4)** pekar nu läsare till efter-distributionslivscykelkommandon istället för att stanna vid `azd up`

#### Fixat
- **🏷️ Produktnamn** — tillagt en Aspire-rebranding-notis (".NET Aspire" heter nu helt enkelt "Aspire"); azd:s stöd för Aspire är oförändrat
- **🔎 Live release-validering** bekräftad mot Azure Developer CLI:s releaselista: stabil CLI `1.25.6` (2026-06-12) och `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Nybörjaronboardingförtydligande, setup-validering & slutlig AZD-kommandostädning
**Denna version följer upp AZD 1.23-valideringsgenomgången med ett dokumentationspass för nybörjare: den förtydligar AZD-först autentiseringsvägledning, lägger till lokala valideringsskript för setup, verifierar nyckelkommandon mot live AZD CLI, och tar bort de sista föråldrade engelskspråkiga kommandoreferenserna utanför ändringsloggen.**

#### Tillagt
- **🧪 Nybörjarvalideringsskript för setup** med `validate-setup.ps1` och `validate-setup.sh` så att läsare kan bekräfta nödvändiga verktyg innan de startar Kapitel 1
- **✅ Upfront valideringssteg för setup** i root-README och Kapitel 1 README så att saknade förutsättningar fångas innan `azd up`

#### Ändrat
- **🔐 Nybörjarautentiseringsvägledning** behandlar nu konsekvent `azd auth login` som huvudväg för AZD-arbetsflöden, medan `az login` anges som valfritt om inte Azure CLI-kommandon används direkt
- **📚 Kapitel 1 onboarding-flöde** pekar nu läsare att validera sin lokala setup innan installations-, autentiserings- och första distributionssteg
- **🛠️ Validator-meddelanden** skiljer nu tydligt mellan blockerande krav och valfria Azure CLI-varningar för AZD-ensam-nybörjarvägen
- **📖 Konfigurations-, felsöknings- och exempel-dokument** skiljer nu mellan obligatorisk AZD-autentisering och valfri Azure CLI-inloggning där båda tidigare presenterades utan kontext

#### Fixat
- **📋 Kvarvarande engelska kommando-referenser** uppdaterade till nuvarande AZD-former, inklusive `azd config show` i fusklappen och `azd monitor --overview` där Azure Portal-översiktsvägledning var avsedd
- **🧭 Nybörjarskiften i Kapitel 1** mildrade för att undvika överlöften om garanterad felfri eller rollback-beteende över alla mallar och Azure-resurser
- **🔎 Live CLI-validering** bekräftade nuvarande stöd för `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, och `azd down --force --purge`

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

#### AZD 1.23.12 validering, workshopmiljöutvidgning & AI-modelluppdatering
**Denna version utför en dokumentationsvalideringsgenomgång mot `azd` `1.23.12`, uppdaterar utdaterade AZD-kommandosexempel, uppdaterar AI-modellvägledning till aktuella standarder, och breddar workshop-instruktionerna bortom GitHub Codespaces till att även stödja dev-containrar och lokala kloner.**

#### Tillagt
- **✅ Valideringsanteckningar över kärnkapitel och workshop-dokument** för att göra den testade AZD-baslinjen tydlig för läsare som använder nyare eller äldre CLI-byggnader
- **⏱️ Vägledning för distributionstidsgräns** för långvariga AI-appdistributioner med `azd deploy --timeout 1800`
- **🔎 Steg för förlängningsinspektion** med `azd extension show azure.ai.agents` i AI-arbetsflödesdokument
- **🌐 Bredare workshop-miljövågledning** som täcker GitHub Codespaces, dev-containrar och lokala kloner med MkDocs

#### Ändrat
- **📚 Kapitelintroduktions-README-filer** noterar nu konsekvent validering mot `azd 1.23.12` över grundläggande, konfigurations-, infrastruktur-, multi-agent-, fördistribution-, felsöknings- och produktionsavsnitt
- **🛠️ AZD-kommandoreferenser** uppdaterade till aktuella former i dokumentation:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` beroende på sammanhang
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` där Application Insights-översikt avses
- **🧪 Exempel på förhandsvisning av provisionering** förenklade till nuvarande stödja användning som `azd provision --preview` och `azd provision --preview -e production`
- **🧭 Workshop-flöde** uppdaterat så att läsare kan genomföra labbar i Codespaces, en dev-container eller en lokal klon istället för att anta endast Codespaces-exekvering
- **🔐 Autentiseringsvägledning** föredrar nu `azd auth login` för AZD-arbetsflöden, med `az login` positionerat som valfritt när Azure CLI-kommandon används direkt

#### Fixat
- **🪟 Windows-installationskommandon** normaliserade till aktuell `winget` paketnamn i installationsguiden
- **🐧 Linux installationsvägledning** rättad för att undvika icke-stödja distributionsspecifika `azd` paketchefsinstruktioner och istället peka på releaser vid behov
- **📦 AI-modelexempel** uppdaterade från äldre standarder som `gpt-35-turbo` och `text-embedding-ada-002` till aktuella exempel som `gpt-4.1-mini`, `gpt-4.1` och `text-embedding-3-large`
- **📋 Snippets för distribution och diagnos** korrigerade för att använda aktuella miljö- och statuskommandon i loggar, skript och felsökningssteg
- **⚙️ GitHub Actions-vägledning** uppdaterad från `Azure/setup-azd@v1.0.0` till `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtyckesvägledning** uppdaterad från `azd mcp consent` till `azd copilot consent list`

#### Förbättrat
- **🧠 AI-kapitlets vägledning** förklarar nu bättre förhandsvisningskänsligt `azd ai` beteende, hyresgästspecifik inloggning, aktuell förlängningsanvändning, och uppdaterade modellutplaceringsrekommendationer
- **🧪 Workshop-instruktioner** använder nu mer realistiska versionsexempel och tydligare språk för miljösetup i praktiska labbar
- **📈 Produktions- och felsökningsdokument** är nu bättre anpassade till nuvarande övervakning, reservmodell och kostnadsnivåsexempel

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

#### AZD AI CLI-kommandon, innehållsvalidering & mallutvidgning
**Denna version lägger till täckning för kommandon `azd ai`, `azd extension` och `azd mcp` över alla AI-relaterade kapitel, åtgärdar trasiga länkar och föråldrad kod i agents.md, uppdaterar fusklappen, och gör en fullständig översyn av avsnittet Exempelmallar med validerade beskrivningar och nya Azure AI AZD-mallar.**

#### Tillagt
- **🤖 AZD AI CLI-täckning** över 7 filer (tidigare endast i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nytt avsnitt "Förlängningar och AI-kommandon" som introducerar `azd extension`, `azd ai agent init` och `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med jämförelsetabell (mall vs manifest-ansats)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underrubrikerna "AZD Extensions for Foundry" och "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Snabbinstruktion visar nu både mall- och manifestbaserade distributionsvägar
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Avsnittet Distribuera inkluderar nu `azd ai agent init` alternativet
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underrubrik "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nytt avsnitt "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` och `azd infra generate`
- **📦 Nya AZD AI exempelmallar** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chatt med Blazor WebAssembly, Semantic Kernel och stöd för röstchatt
  - **azure-search-openai-demo-java** — Java RAG-chatt som använder Langchain4J med ACA/AKS-distributionsalternativ
  - **contoso-creative-writer** — Kreativ skrivapp med flera agenter som använder Azure AI Agent Service, Bing Grounding och Prompty
  - **serverless-chat-langchainjs** — Serverless RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokalt utvecklingsstöd
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med adminportal, Teams-integration och alternativ för PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referensapp för Multi-agent MCP-samordning med servrar i .NET, Python, Java och TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep-startmall
  - **🔗 Awesome AZD AI Gallery link** — Referens till [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallar)

#### Fixat
- **🔗 agents.md navigation**: Föregående/Nästa-länkar matchar nu kapitlet 2 README-lektionsordning (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md trasiga länkar**: `production-ai-practices.md` korrigerades till `../chapter-08-production/production-ai-practices.md` (3 förekomster)
- **📦 agents.md föråldrad kod**: Ersatte `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ogiltigt API**: Flyttade `max_tokens` från `create_agent()` till `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenräkning**: Ersatte grov `len//4` uppskattning med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Korrigerade tjänster från "Cognitive Search + App Service" till "Azure AI Search + Azure Container Apps" (standardvärd ändrad okt 2024)
- **contoso-chat**: Uppdaterad beskrivning för att referera till Azure AI Foundry + Prompty, som matchar repots faktiska titel och tekniska stack

#### Tagits bort
- **ai-document-processing**: Borttagen icke-fungerande mallreferens (repo inte offentligt tillgängligt som AZD-mall)

#### Förbättrat
- **📝 agents.md övningar**: Övning 1 visar nu förväntad utdata och `azd monitor` steg; Övning 2 inkluderar fullständigt `FunctionTool` registreringskod; Övning 3 ersätter otydlig vägledning med konkreta `prepdocs.py` kommandon
- **📚 agents.md resurser**: Uppdaterade dokumentationslänkar till aktuella Azure AI Agent Service-dokument och snabbstart
- **📋 agents.md Nästa steg-tabell**: Lagt till AI Workshop Lab-länk för komplett kapitelöversikt

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

#### Förbättrad navigering i kursen
**Denna version förbättrar README.md kapitelnavigering med ett utökat tabellformat.**

#### Ändringar
- **Kurskarta-tabell**: Förbättrad med direkta lektionslänkar, tidsuppskattningar och komplexitetsbedömningar
- **Mapprensning**: Borttagna överflödiga gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Länkkontroll**: Alla 21+ interna länkar i kurskartans tabell verifierade

### [v3.16.0] - 2026-02-05

#### Produktnamnsuppdateringar
**Denna version uppdaterar produktreferenser för nuvarande Microsoft-varumärke.**

#### Ändringar
- **Microsoft Foundry → Microsoft Foundry**: Alla referenser uppdaterade i ej-översatta filer
- **Azure AI Agent Service → Foundry Agents**: Tjänstnamn uppdaterat för att spegla aktuell varumärkesprofil

#### Uppdaterade filer
- `README.md` - Huvudsida för kursens start
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Guide för AI-agenter
- `examples/README.md` - Dokumentation för exempel
- `workshop/README.md` - Workshop-översikt
- `workshop/docs/index.md` - Workshop-index
- `workshop/docs/instructions/*.md` - Alla workshopsinstruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Omstrukturering av repo: Kapitelnamn på mappar
**Denna version omstrukturerar dokumentationen till dedikerade kapitelmappar för tydligare navigering.**

#### Mappnamnsändringar
Gamla mappar har ersatts med kapitelnumrerade mappar:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lagt till ny: `docs/chapter-05-multi-agent/`

#### Filflyttningar
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
| Alla pre-deployment-filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alla felsökningsfiler | troubleshooting/ | chapter-07-troubleshooting/ |

#### Tillagt
- **📚 Kapitel README-filer**: Skapade README.md i varje kapitelmapp med:
  - Inlärningsmål och tidsåtgång
  - Lektionstabell med beskrivningar
  - Snabbstartskommandon
  - Navigering till andra kapitel

#### Ändrat
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i alla dokumentationsfiler
- **🗺️ Huvud-README.md**: Uppdaterade Kurskarta med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Borttaget
- Gammal mappstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering av repo: Kapitelnavigering
**Denna version lade till navigerings-README-filer per kapitel (ersatt av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide för AI-agenter
**Denna version lägger till en omfattande guide för att distribuera AI-agenter med Azure Developer CLI.**

#### Tillagt
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chattbotar
  - Tre snabbstartsmallar för agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmönster (enkel agent, RAG, multi-agent)
  - Verktygskonfiguration och anpassning
  - Övervakning och mätspårning
  - Kostnadsaspekter och optimering
  - Vanliga felsökningsscenarion
  - Tre praktiska övningar med framgångskriterier

#### Innehållsstruktur
- **Introduktion**: Agentkoncept för nybörjare
- **Snabbstart**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmönster**: Visuella diagram över agentmönster
- **Konfiguration**: Verktygsinställningar och miljövariabler
- **Övervakning**: Integration med Application Insights
- **Övningar**: Progressivt praktiskt lärande (20-45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### Uppdatering av DevContainer-miljö
**Denna version uppdaterar utvecklingscontainerns konfiguration med moderna verktyg och bättre standardinställningar för AZD-inlärning.**

#### Ändrat
- **🐳 Basbild**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (senaste Debian stable)
- **📛 Container-namn**: Omdöpt från "Python 3" till "AZD for Beginners" för tydlighetens skull

#### Tillagt
- **🔧 Nya funktioner i Dev Container**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för containerapp-distributioner

- **🔌 Portvidarebefordran**: Förinställda portar för vanlig utveckling:
  - 8000 (MkDocs förhandsgranskning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code-tillägg**:
  - `ms-python.vscode-pylance` - Utökad Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-stöd
  - `ms-azuretools.vscode-docker` - Docker-stöd
  - `ms-azuretools.vscode-bicep` - Bicep-språkstöd
  - `ms-azure-devtools.azure-resource-groups` - Hantering av Azure-resurser
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-lintning
  - `bierner.markdown-mermaid` - Mermaid-diagramstöd
  - `redhat.vscode-yaml` - YAML-stöd (för azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-inställningar**: Tillagda standardinställningar för Python-tolk, formatering vid spara och borttagning av blanksteg

- **📦 Uppdaterade requirements-dev.txt**:
  - Lagt till MkDocs minify-plugin
  - Lagt till pre-commit för kodkvalitet
  - Lagt till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fixat
- **Post-Create-kommandot**: Verifierar nu AZD- och Azure CLI-installation vid containerstart

---

### [v3.11.0] - 2026-02-05

#### Nybörjarvänlig README-översyn
**Denna version förbättrar README.md avsevärt för att vara mer tillgängligt för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Tillagt
- **🆚 Azure CLI vs AZD Jämförelse**: Tydlig förklaring när man ska använda respektive verktyg med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direktlänkar till community-mallgalleri och bidragsresurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ färdiga att distribuera mallar
  - [Skicka in en mall](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Snabbstartsguide**: Förenklat 3-stegs avsnitt för att komma igång (Installera → Logga in → Distribuera)
- **📊 Erfarenhetsbaserad navigeringstabell**: Tydlig vägledning om var man ska börja baserat på utvecklarens erfarenhet

#### Ändrat
- **README-struktur**: Omlagd för progressiv öppning - nyckelinformation först
- **Introduktionsavsnitt**: Omskrivet för att förklara "Magin med `azd up`" för totala nybörjare
- **Dubblettinnehåll borttaget**: Tog bort duplicerat felsökningsavsnitt
- **Felsökningskommandon**: Fixade `azd logs` referens för att använda giltig `azd monitor --logs`

#### Fixat
- **🔐 Autentiseringskommandon**: Lagt till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga kommando-referenser**: Tog bort kvarvarande `azd logs` från README felsökningsavsnitt

#### Noteringar
- **Omfång**: Ändringar tillämpade på huvud-README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringar särskilt riktade till utvecklare nya på AZD

---

### [v3.10.0] - 2026-02-05

#### Uppdatering av Azure Developer CLI-kommandon
**Denna version korrigerar icke-existerande AZD-kommandon i hela dokumentationen, och säkerställer att alla kodexempel använder giltig Azure Developer CLI-syntax.**

#### Fixat
- **🔧 Icke-existerande AZD-kommandon borttagna**: Omfattande revision och korrigering av ogiltiga kommandon:
  - `azd logs` (finns inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` underkommandon (finns inte) → ersatt med `azd show` och Azure CLI
  - `azd infra import/export/validate` (finns inte) → borttagna eller ersatta med giltiga alternativ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flaggor (finns inte) → borttagna
  - `azd provision --what-if/--rollback` flaggor (finns inte) → uppdaterade till att använda `--preview`
  - `azd config validate` (finns inte) → ersatta med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finns inte) → borttagna

- **📚 Uppdaterade filer med kommando-korrigeringar**:
  - `resources/cheat-sheet.md`: Storskalig överarbetning av kommandoreferens
  - `docs/deployment/deployment-guide.md`: Fixade rollback- och distributionsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerade logganalysavsnitt
  - `docs/troubleshooting/common-issues.md`: Uppdaterade felsökningskommandon
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixade AZD-felsökningsavsnitt
  - `docs/getting-started/azd-basics.md`: Korrigerade övervakningskommandon
  - `docs/getting-started/first-project.md`: Uppdaterade exempel för övervakning och felsökning
  - `docs/getting-started/installation.md`: Fixade exempel för hjälp och version
  - `docs/pre-deployment/application-insights.md`: Korrigerade kommandon för loggvisning
  - `docs/pre-deployment/coordination-patterns.md`: Fixade felsökningskommandon för agenten

- **📝 Uppdaterad versionsreferens**: 
  - `docs/getting-started/installation.md`: Ändrade hårdkodad `1.5.0` version till generisk `1.x.x` med länk till releaser

#### Ändrat
- **Rollback-strategier**: Uppdaterad dokumentation för att använda Git-baserad rollback (AZD saknar inbyggd rollback)
- **Loggvisning**: Ersatte `azd logs` referenser med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektion**: Tog bort icke-existerande flaggor för parallell/incrementell driftsättning, gav giltiga alternativ

#### Tekniska detaljer
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noteringar
- **Verifiering**: Kommandon validerade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Slutförande av workshop och uppdatering av dokumentationskvalitet
**Den här versionen slutför de interaktiva workshopmodulerna, åtgärdar alla trasiga dokumentationslänkar och förbättrar den övergripande innehållskvaliteten för AI-utvecklare som använder Microsoft AZD.**

#### Tillagt
- **📝 CONTRIBUTING.md**: Nytt bidragsriktlinjedokument med:
  - Tydliga instruktioner för felrapportering och förslag på ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och commit-meddelanden
  - Information om community-engagemang

#### Slutfört
- **🎯 Workshop Modul 7 (Avslutning)**: Fullständigt slutförd avslutningsmodul med:
  - Omfattande sammanfattning av workshopprestationer
  - Sektion om behärskade nyckelkoncept för AZD, mallar och Microsoft Foundry
  - Rekommendationer för fortsatt läranderesa
  - Workshoputmaningar med svårighetsgrad
  - Länkar för community-feedback och support

- **📚 Workshop Modul 3 (Nedbrytning)**: Uppdaterade lärandemål med:
  - GitHub Copilot med MCP-serveraktivering
  - Förståelse av AZD-mallars mappstruktur
  - Mönster för infrastruktur-som-kod (Bicep)
  - Instruktioner för praktiska labbar

- **🔧 Workshop Modul 6 (Nedmontering)**: Slutförd med:
  - Resursrensning och kostnadshanteringsmål
  - Användning av `azd down` för säker infrastrukturavveckling
  - Riktlinjer för återställning av mjuk-borttagna kognitiva tjänster
  - Bonusuppdrag för utforskning av GitHub Copilot och Azure Portal

#### Fixat
- **🔗 Fixade trasiga länkar**: Åtgärdade över 15 trasiga interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerade sökvägar till ai-model-deployment.md och production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fixade sökvägar för FAQ och felsökningsguide
  - `examples/container-app/microservices/README.md`: Korrigerade kursstart och deployment-guide sökvägar
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade AI-kapitelreferenser
  - `course-outline.md`: Fixade instruktörsguide och AI workshop-labbrapporter

- **📅 Workshopstatus-banner**: Uppdaterad från "Under Construction" till aktiv workshopstatus med februari 2026-datum

- **🔗 Workshopnavigering**: Fixade trasiga navigationslänkar i workshop README.md pekande till icke-existerande lab-1-azd-basics mapp

#### Ändrat
- **Workshoppresentation**: Tog bort "under construction"-varning, workshopen är nu komplett och redo att användas
- **Navigeringskonsistens**: Säkerställde att alla workshopmoduler har korrekt inter-modulnavigering
- **Lärandestigsreferenser**: Uppdaterade kapitelcrossreferenser till korrekta microsoft-foundry-sökvägar

#### Validerat
- ✅ Alla engelska markdownfiler har giltiga interna länkar
- ✅ Workshopmoduler 0-7 är kompletta med lärandemål
- ✅ Navigering mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehålls genomgående
- ✅ CONTRIBUTING.md ger tydlig vägledning till communitybidragsgivare

#### Teknisk implementation
- **Länkvalidering**: Automatisk PowerShell-script verifierade alla .md interna länkar
- **Innehållsgranskning**: Manuell granskning av workshopens fullständighet och nybörjarvänlighet
- **Navigationssystem**: Konsekventa navigeringsmönster för kapitel och moduler tillämpade

#### Noteringar
- **Omfattning**: Ändringar applicerade endast på engelskspråkig dokumentation
- **Översättningar**: Översättningsmappar uppdateras inte i denna version (automatisk översättning kommer senare)
- **Workshoplängd**: Komplett workshop erbjuder nu 3-4 timmars praktiskt lärande

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, säkerhet och mönster för multi-agent
**Den här versionen lägger till omfattande A-klass lektioner om Application Insights-integration, autentiseringsmönster och multi-agent samordning för produktionssättningar.**

#### Tillagt
- **📊 Lektion om Application Insights-integration**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad driftsättning med automatisk provisionering
  - Kompletta Bicep-mallar för Application Insights + Log Analytics
  - Fungerande Python-applikationer med anpassad telemetri (över 1 200 rader)
  - AI/LLM-övervakningsmönster (Microsoft Foundry Models token/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriflöde)
  - 3 praktiska övningar (varningar, dashboards, AI-övervakning)
  - Kusto-frågeexempel och kostnadsoptimeringsstrategier
  - Live-mätningströmning och realtidsfelsökning
  - 40-50 minuters inlärningstid med produktionsklara mönster

- **🔐 Lektion om autentisering och säkerhetsmönster**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (anslutningssträngar, Key Vault, hanterad identitet)
  - Kompletta Bicep-infrastrukturmallar för säkra driftsättningar
  - Node.js applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera hanterad identitet, användar-tilldelad identitet, Key Vault rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara lösenordslösa autentiseringsmönster

- **🤖 Lektion om multi-agent samordningsmönster**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 samordningsmönster (sekventiell, parallell, hierarkisk, händelsedriven, konsensus)
  - Komplett orkestratorimplementation (Python/Flask, över 1500 rader)
  - 3 specialiserade agentimplementationer (Forskning, Författare, Redaktör)
  - Service Bus-integration för meddelandeköer
  - Cosmos DB-statushantering för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logik, kretsbrytare)
  - Kostnadsuppdelning ($240-565/månad) med optimeringsstrategier
  - Application Insights-integration för övervakning

#### Förbättrat
- **Fördriftskapitel**: Inkluderar nu omfattande övervaknings- och samordningsmönster
- **Kom igång-kapitel**: Förbättrat med professionella autentiseringsmönster
- **Produktionsberedskap**: Komplett täckning från säkerhet till observerbarhet
- **Kursöversikt**: Uppdaterad med hänvisningar till nya lektioner i kapitel 3 och 6

#### Ändrat
- **Lärandeprogression**: Bättre integration av säkerhet och övervakning genom hela kursen
- **Dokumentationskvalitet**: Konsekventa A-klass standarder (95-97%) i nya lektioner
- **Produktionsmönster**: Komplett end-to-end täckning för företagsdriftsättningar

#### Förbättrad
- **Utvecklarupplevelse**: Tydlig väg från utveckling till produktionsövervakning
- **Säkerhetsstandarder**: Professionella mönster för autentisering och hantering av hemligheter
- **Observerbarhet**: Komplett Application Insights integration med AZD
- **AI Arbetslaster**: Specialiserad övervakning för Microsoft Foundry Models och multi-agent system

#### Validerat
- ✅ Alla lektioner inkluderar komplett fungerande kod (inte bara utdrag)
- ✅ Mermaid-diagram för visuell inlärning (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsklara Bicep-mallar driftsättbara via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Resultat av dokumentationsgradering
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerad multi-agentarkitektur
- **Övergripande nytt innehåll**: - Konsekvent högkvalitativ standard

#### Teknisk implementation
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Autentisering**: Hanterad identitet + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Övervakning**: Live-mätningar + Kusto-frågor + varningar + dashboards
- **Kostnadshantering**: Sampling, retention policies, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättrad dokumentationskvalitet och nytt exempel på Microsoft Foundry Models
**Den här versionen förbättrar dokumentationskvaliteten i hela arkivet och lägger till ett komplett exempel för produktsättning av Microsoft Foundry Models med gpt-4.1 chattgränssnitt.**

#### Tillagt
- **🤖 Microsoft Foundry Models chatt-exempel**: Komplett gpt-4.1 driftsättning med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 modellimplementering)
  - Python kommandorads-chattgränssnitt med konversationshistorik
  - Key Vault-integration för säker API-nyckellagring
  - Tokenanvändningsspårning och kostnadsuppskattning
  - Hastighetsbegränsning och felhantering
  - Omfattande README med 35-45 minuters driftsättningsguide
  - 11 produktionsklara filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Tillagda praktiska övningar till konfigurationsguide:
  - Övning 1: Multi-miljökonfiguration (15 minuter)
  - Övning 2: Hantering av hemligheter (10 minuter)
  - Tydliga framgångskriterier och verifieringssteg
- **✅ Driftsättningsverifiering**: Tillagd verifieringssektion i driftsättningsguide:
  - Hälsokontrollprocedurer
  - Framgångskriterielista
  - Förväntade resultat för alla driftsättningskommandon
  - Felsökningssnabbreferens

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-klass kvalitet (93%):
  - Tillagd azure-openai-chat till alla relevanta sektioner
  - Uppdaterat antal lokala exempel från 3 till 4
  - Tillagd i AI-applikationsexempel-tabellen
  - Integrerad i Quick Start för mellannivåanvändare
  - Tillagd i Microsoft Foundry Templates-sektionen
  - Uppdaterade jämförelsematriser och teknikavsnitt
- **Dokumentationskvalitet**: Förbättrad från B+ (87%) → A- (92%) i docs-mappen:
  - Tillagda förväntade resultat i kritiska kommandoexempel
  - Inkluderade verifieringssteg för konfigurationsändringar
  - Förbättrad praktisk inlärning med övningar

#### Ändrat
- **Lärandeprogression**: Bättre integration av AI-exempel för mellannivåanvändare
- **Dokumentationsstruktur**: Mer handlingsorienterade övningar med tydliga resultat
- **Verifieringsprocess**: Tydliga framgångskriterier tillagda i nyckelflöden

#### Förbättrat
- **Utvecklarupplevelse**: Microsoft Foundry Models driftsättning tar nu 35-45 minuter (jämfört med 60-90 för komplexa alternativ)
- **Kostnadstransparens**: Tydliga kostnadsuppskattningar ($50-200/månad) för Microsoft Foundry Models-exemplet
- **Lärandestig**: AI-utvecklare har tydlig ingångspunkt med azure-openai-chat
- **Dokumentationsstandarder**: Konsekventa förväntade resultat och verifieringssteg

#### Validerat
- ✅ Microsoft Foundry Models-exempel fullt fungerande med `azd up`
- ✅ Alla 11 implementationsfiler är syntaktiskt korrekta
- ✅ README-instruktioner stämmer överens med verklig driftsättningsupplevelse
- ✅ Dokumentationslänkar uppdaterade på över 8 platser
- ✅ Exempelindex korrekt återspeglar 4 lokala exempel
- ✅ Inga dubblettlänkar i externa tabeller
- ✅ Alla navigationsreferenser är korrekta

#### Teknisk implementation
- **Microsoft Foundry Models Arkitektur**: gpt-4.1 + Key Vault + Container Apps-mönster
- **Säkerhet**: Hanterad identitet klar, hemligheter i Key Vault
- **Övervakning**: Application Insights-integration
- **Kostnadshantering**: Token-spårning och optimering
- **Driftsättning**: Ett enda `azd up` kommando för komplett setup

### [v3.6.0] - 2025-11-19

#### Större uppdatering: Exempel för Container App-driftsättning
**Den här versionen introducerar omfattande, produktionsklara exempel för containerapplikationsdriftsättningar med Azure Developer CLI (AZD), med full dokumentation och integration i lärandestigen.**

#### Tillagt
- **🚀 Exempel på Container App**: Nya lokala exempel i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett översikt över containeriserade distributioner, snabbstart, produktion och avancerade mönster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybörjarvänligt REST API med skalning till noll, hälsokontroller, övervakning och felsökning
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsklart flertjänstdistribution (API Gateway, Produkt, Order, Användare, Notifiering), asynkron meddelandehantering, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blå-grön/canary-distribution
- **Best Practices**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-vägledning för containeriserade arbetsbelastningar
- **Code Samples**: Kompletta `azure.yaml`, Bicep-mallar och fler-språkliga tjänsteimplementationer (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testscenarier, övervakningskommandon, felsökningsvägledning

#### Changed
- **README.md**: Uppdaterad för att presentera och länka nya containerappsexempel under "Local Examples - Container Applications"
- **examples/README.md**: Uppdaterad för att lyfta fram containerappsexempel, lägga till jämförelsematrisposter och uppdatera teknik-/arkitekturreferenser
- **Course Outline & Study Guide**: Uppdaterad för att referera till nya containerappsexempel och distributionsmönster i relevanta kapitel

#### Validated
- ✅ Alla nya exempel kan distribueras med `azd up` och följer bästa praxis
- ✅ Dokumentations korslänkar och navigation uppdaterade
- ✅ Exempel täcker från nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Notes
- **Scope**: Endast engelsk dokumentation och exempel
- **Next Steps**: Utöka med fler avancerade containermönster och CI/CD-automation i framtida versioner

### [v3.5.0] - 2025-11-19

#### Produktomprofilering: Microsoft Foundry
**Denna version implementerar en omfattande produktnamnsändring från "Microsoft Foundry" till "Microsoft Foundry" i all engelsk dokumentation för att återspegla Microsofts officiella omprofilering.**

#### Changed
- **🔄 Produktnamn Uppdatering**: Komplett omprofilering från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i all engelsk dokumentation i `docs/` mapp
  - Omdöpt mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdöpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade i 7 dokumentationsfiler

- **📁 Mappstrukturändringar**:
  - `docs/ai-foundry/` omdöpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att spegla ny mappstruktur
  - Navigationslänkar validerade i all dokumentation

- **📄 Omdöpning av filer**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera till nya filnamnet

#### Uppdaterade Filer
- **Kapitel Dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslänk-uppdateringar
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Använder redan Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitel navigationslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa kapitel-länkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigation, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigationslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapitelrubriker, mallar, community-insikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitelresurser)

#### Validerat
- ✅ Inga kvarvarande "ai-foundry" mappreferenser i engelska dokumenten
- ✅ Inga kvarvarande "Microsoft Foundry" produktnamnsreferenser i engelska dokumenten
- ✅ Alla navigationslänkar fungerar med ny mappstruktur
- ✅ Omdöpning av filer och mappar genomförda framgångsrikt
- ✅ Korsreferenser mellan kapitel verifierade

#### Noteringar
- **Omfattning**: Ändringar applicerade på engelsk dokumentation i `docs/` mapp endast
- **Översättningar**: Översättningsmappar (`translations/`) uppdateras inte i denna version
- **Workshop**: Workshopmaterial (`workshop/`) uppdateras inte i denna version
- **Exempel**: Exempelfiler kan fortfarande innehålla äldre namngivning (åtgärdas i framtida uppdatering)
- **Externa Länkar**: Externa URL:er och GitHub-referenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala grenar eller dokumentation som refererar till den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Byt ut produktnamn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validera att alla interna dokumentationslänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Infrastrukturförhandsgranskning och valideringsförbättringar
**Denna version introducerar omfattande stöd för nya Azure Developer CLI-förhandsgranskningsfunktionen och förbättrar användarupplevelsen i workshoppen.**

#### Added
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattande täckning av nya förhandsgranskningsförmågan för infrastruktur
  - Kommandoreferens och användningsexempel i fusklapp
  - Detaljerad integrering i provisionsguide med användningsfall och fördelar
  - Förhandskontroll-integration för säkrare distributionsvalidering
  - Uppdateringar i startguiden med säkerhetsfokus vid distribution
- **🚧 Workshop Status Banner**: Professionell HTML-banner som visar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Senast uppdaterad tidsstämpel för transparens
  - Mobilresponsiv design för alla enhetstyper

#### Enhanced
- **Infrastruktur Säkerhet**: Förhandsgranskningsfunktion integrerad genomgående i deploymentsdokumentationen
- **Förvalidering**: Automatiserade skript inkluderar nu förhandsgranskningsprovning
- **Utvecklarflöde**: Uppdaterade kommando-sekvenser inkluderar förhandsgranskning som bästa praxis
- **Workshop Upplevelse**: Tydliga förväntningar för användare om innehållets utvecklingsstatus

#### Changed
- **Distribuerings Bästa Praxis**: Förhandsgransknings-först arbetsflöde rekommenderas nu
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i inlärningsprocessen
- **Workshop Presentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Improved
- **Säkerhetsfokus**: Infrastrukturändringar kan nu valideras innan distribution
- **Team-samarbete**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader före provisionssteg
- **Riskreducering**: Minskade distributionsfel genom avancerad validering

#### Teknisk Implementering
- **Integrering i flera dokument**: Förhandsgranskningsfunktion dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel genom dokumentationen
- **Bästa Praxis-Integrering**: Förhandsgranskning inkluderad i valideringsarbetsflöden och skript
- **Visuella Indikatorer**: Tydliga NYA funktionsmarkeringar för upptäckbarhet

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientstyling
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell Presentation**: Behåller repositoryts trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Oktober 2025 som senaste uppdaterad tidsstämpel för ansvarstagande

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktiv inlärningsupplevelse
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärandestigar.**

#### Added
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs-förhandsgranskningsfunktion
- **📝 Strukturerade workshopinstruktioner**: 7-stegs guidad lärandestig från upptäckt till anpassning
  - 0-Introduktion: Workshopöversikt och installation
  - 1-Välj-AI-Mall: Mallupptäckt och urvalsprocess
  - 2-Validera-AI-Mall: Distributions- och valideringsprocedurer
  - 3-Dekonstruera-AI-Mall: Förstå mallarkitektur
  - 4-Konfigurera-AI-Mall: Konfiguration och anpassning
  - 5-Anpassa-AI-Mall: Avancerade modifieringar och iterationer
  - 6-Riv-Ner-Infrastruktur: Rensning och resursförvaltning
  - 7-Avslut: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad inlärningsupplevelse
- **🎯 Praktisk lärandestig**: 3-stegs metodologi (Upptäckt → Distribution → Anpassning)
- **📱 GitHub Codespaces-integration**: Sömlös utvecklingsmiljöuppsättning

#### Enhanced
- **AI Workshop Lab**: Utökad med omfattande 2-3 timmars strukturerad inlärningsupplevelse
- **Workshopdokumentation**: Professionell presentation med navigation och visuella hjälpmedel
- **Lärandeprogression**: Tydlig steg-för-steg vägledning från mallval till produktionsdistribution
- **Utvecklarupplevelse**: Integrerade verktyg för strömlinjeformade utvecklingsarbetsflöden

#### Improved
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sökfunktion, kopieringsfunktion och temanval
- **Självstyrd Inlärning**: Flexibel workshopstruktur som anpassar sig efter olika inlärningstakter
- **Praktisk tillämpning**: Verkliga AI-mall-distributionsscenarier
- **Community Integration**: Discord-integration för workshopstöd och samarbete

#### Workshopfunktioner
- **Inbyggd sökfunktion**: Snabb sökning efter nyckelord och lektioner
- **Kopiera kodblock**: Hover-till-kopiering-funktion för alla kodexempel
- **Temaomkopplare**: Stöd för mörkt/ljust läge för olika preferenser
- **Visuella tillgångar**: Skärmbilder och diagram för ökad förståelse
- **Hjälpintegration**: Direktåtkomst till Discord för samhällsstöd

### [v3.2.0] - 2025-09-17

#### Stor navigeringsomstrukturering och kapitelbaserat inlärningssystem
**Denna version introducerar en omfattande kapitelbaserad lärandestruktur med förbättrad navigation genom hela förvaret.**

#### Added
- **📚 Kapitelbaserat inlärningssystem**: Omstrukturerade hela kursen i 8 progressiva lärandekapitel
  - Kapitel 1: Grund och snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-First utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration och autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kod & distribution (⭐⭐⭐ - 1-1,5 timmar)
  - Kapitel 5: Multi-Agent AI-lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Förhandsvalidering och planering (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning och debugging (⭐⭐ - 1-1,5 timmar)
  - Kapitel 8: Produktions- och företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigationssystem**: Konsekventa navigeringshuvuden och fötter i all dokumentation
- **🎯 Framstegsspårning**: Kursavslutningschecklista och lärandeverifieringssystem
- **🗺️ Lärandestigsvägledning**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigation**: Relaterade kapitel och förutsättningar tydligt länkade

#### Enhanced
- **README-struktur**: Omvandlad till en strukturerad lärandeplattform med kapitelbaserad organisation
- **Dokumentationsnavigation**: Varje sida inkluderar nu kapitelkontext och progression
- **Mallorganisation**: Exempel och mallar kopplade till lämpliga lärandekapitel
- **Resursintegrering**: Fusklappar, FAQ och studievägledningar kopplade till relevanta kapitel
- **Workshopintegrering**: Praktiska labs kopplade till flera kapitelmål

#### Changed
- **Lärandeprogression**: Flytt från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Konfigurationsguide omplacerad till kapitel 3 för bättre inlärningsflöde
- **AI Innehållsintegration**: Bättre integration av AI-specifikt innehåll i hela lärandeprocessen
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i kapitel 8 för företagsanvändare

#### Improved
- **Användarupplevelse**: Tydliga navigationsmargar och kapitelprogressionsindikatorer
- **Tillgänglighet**: Konsekventa navigationsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetsstilad kursstruktur lämplig för akademisk och företagsutbildning
- **Lärandeeffektivitet**: Minskad tid att hitta relevant innehåll genom förbättrad organisation

#### Teknisk Implementering
- **Navigationshuvuden**: Standardiserad kapitelnavigation i över 40 dokumentationsfiler
- **Fotnavigering**: Konsekvent progressionsvägledning och kapitelavslutsindikatorer
- **Korslänkning**: Omfattande intern länkstruktur som kopplar samman relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättrad studieguide
- **📚 Omfattande lärandemål**: Omstrukturerad studieguide för att matcha 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel innehåller specifika lärandemål och praktiska övningar
- **📋 Framstegsspårning**: Veckoschema med mätbara resultat och avslutschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella utfall
- **🛠️ Praktiska övningar**: Praktiska aktiviteter med verkliga distributionsscenarier och felsökning
- **📊 Kompetensprogression**: Tydlig utveckling från grundläggande till företagsmönster med karriärfokus
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och community-erkännandesystem
- **⏱️ Tidsplanering**: Strukturerad 10-veckors lärandeplan med milstolpesvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar den multi-agent detaljhandelslösningen med bättre agentnamngivning och förbättrad dokumentation.**

#### Changed
- **Multi-agentterminologi**: Ersatte "Cora agent" med "Kundagent" i hela detaljhandelslösningen med flera agenter för tydligare förståelse
- **Agentarkitektur**: Uppdaterade all dokumentation, ARM-mallar och kodexempel för att använda konsekvent namngivning "Kundagent"
- **Konfigurations exempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsekvens**: Säkerställde att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrad
- **ARM Mallpaket**: Uppdaterade retail-multiagent-arm-template med Kundagent-referenser
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med uppdaterad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu CustomerAgent-namn
- **Miljövariabler**: Uppdaterade alla driftsättningsskript till CUSTOMER_AGENT_NAME-konventioner

#### Förbättrad
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamnkonventioner
- **Lärmaterials**: Mer intuitiv agentnamngivning för utbildningssyften
- **Mallens användbarhet**: Förenklad förståelse av agentfunktioner och driftsättningsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med CustomerAgent-referenser
- Ersatte CoraAgent-klassnamn med CustomerAgent i Python-exempel
- Modifierade ARM-mallens JSON-konfigurationer för att använda agenttypen "customer"
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_*-mönster
- Uppdaterade alla driftsättningskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - Fokus på AI-utvecklare och Microsoft Foundry-integrering
**Denna version omvandlar arkivet till en omfattande AI-fokuserad läranderesurs med Microsoft Foundry-integrering.**

#### Tillagt
- **🤖 AI-först inlärningsväg**: Komplett omstrukturering med prioritet för AI-utvecklare och ingenjörer
- **Microsoft Foundry-integreringsguide**: Omfattande dokumentation för att koppla AZD till Microsoft Foundry-tjänster
- **AI-modellsdriftsättningsmönster**: Detaljerad guide med modellval, konfiguration och produktionsdriftsättningsstrategier
- **AI-workshop-labb**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-driftsättbara lösningar
- **Produktions-ABP för AI**: Företagsklara mönster för skalning, övervakning och säkerställande av AI-arbetsbelastningar
- **AI-specifik felsökningsguide**: Utförlig felsökning för Microsoft Foundry-modeller, Cognitive Services och AI-driftsättningsproblem
- **AI Mallgalleri**: Utvald samling Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshop-material**: Komplett workshopstruktur med praktiska labb och referensmaterial

#### Förbättrad
- **README-struktur**: AI-utvecklarfokus med 45 % communityintressedata från Microsoft Foundry Discord
- **Lärvägar**: Dedikerad AI-utvecklarresa bredvid traditionella vägar för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Community-integrering**: Förbättrat Discord-community-stöd med AI-specifika kanaler och diskussioner

#### Säkerhet och produktionsfokus
- **Managed Identity-mönster**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-region-driftsättning**: Strategier för global AI-applikationsdriftsättning
- **Prestandaövervakning**: AI-specifika mätvärden och Application Insights-integration

#### Dokumentationskvalitet
- **Linjär kursstruktur**: Logisk progression från nybörjare till avancerade AI-driftsättningsmönster
- **Validerade URL:er**: Alla externa arkivlänkar verifierade och åtkomliga
- **Fullständig referens**: Alla interna dokumentationslänkar validerade och fungerande
- **Produktionsredo**: Företagsdriftsättningsmönster med verklighetsbaserade exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Arkivomstrukturering och professionell förbättring
**Denna version representerar en betydande översyn av arkivets struktur och innehållspresentation.**

#### Tillagt
- **Strukturerad utbildningsram**: Alla dokumentationssidor innehåller nu Introduktion, Lärandemål och Resultatavsnitt
- **Navigationssystem**: Tillagda länkar för Föregående/Nästa lektion i all dokumentation för styrd lärandeprogression
- **Studiehandledning**: Omfattande study-guide.md med inlärningsmål, praktikövningar och bedömningsmaterial
- **Professionell presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och professionellt utseende
- **Förbättrad innehållsstruktur**: Bättre organisation och flöde i lärmaterialet

#### Ändrat
- **Dokumentationsformat**: Standardiserade all dokumentation med konsekvent lärandefokuserad struktur
- **Navigationsflöde**: Implementerad logisk progression genom alla lärmaterial
- **Innehållspresentation**: Tog bort dekorativa element till förmån för klar, professionell formatering
- **Länkstruktur**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrad
- **Tillgänglighet**: Tog bort emoji-beroenden för bättre skärmläsarkompatibilitet
- **Professionellt utseende**: Ren, akademisk presentation lämplig för företagsutbildning
- **Lärandeupplevelse**: Strukturerat angreppssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första releasen - Omfattande AZD lärarkiv

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett serie med kom-igång-guider
  - Omfattande dokumentation för driftsättning och tillhandahållande
  - Detaljerade felsökningsresurser och debugguider
  - Verktyg och procedurer för validering före driftsättning

- **Kom-igång-modul**
  - AZD Grunder: Kärnbegrepp och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöuppsättning och autentisering
  - Första projekthandledning: Steg-för-steg praktisk inlärning

- **Driftsättnings- och tillhandahållandemodul**
  - Driftsättningsguide: Komplett arbetsflödesdokumentation
  - Tillhandahållandeguide: Infrastruktur som kod med Bicep
  - Bästa praxis för produktionsdriftsättningar
  - Arkitekturmönster med flera tjänster

- **Pre-flight valideringsmodul**
  - Kapacitetsplanering: Validering av Azure-resurstillgänglighet
  - SKU-val: Omfattande vägledning för servicenivåer
  - Pre-flight-kontroller: Automatiserade valideringsskript (PowerShell och Bash)
  - Kostnadsuppskattning och budgetverktyg

- **Felsökningsmodul**
  - Vanliga problem: Vanligt förekommande problem och lösningar
  - Debuggningguide: Systematiska felsökningsmetoder
  - Avancerade diagnostikstekniker och verktyg
  - Prestandaövervakning och optimering

- **Resurser och referenser**
  - Kommandocheatsheet: Snabbreferens för viktiga kommandon
  - Ordlista: Omfattande terminologi- och akronymdefinitioner
  - FAQ: Utförliga svar på vanliga frågor
  - Externa resurslänkar och community-anslutningar

- **Exempel och mallar**
  - Enkel webbapplikation exempel
  - Mall för driftsättning av statisk webbplats
  - Konfiguration för containerapplikation
  - Databasintegrationsmönster
  - Exempel på mikrotjänstarkitektur
  - Serverlösa funktionsimplementeringar

#### Funktioner
- **Multiplattformsstöd**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera färdighetsnivåer**: Innehåll utformat för studenter till professionella utvecklare
- **Praktiskt fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsförst-ansats**: Säkerhetsbästa praxis integrerad genomgående
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva driftsättningar och resurshantering

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodexempel
- **Instruktioner steg för steg**: Klara, handlingsbara anvisningar
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Bästa praxis-integration**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med senaste Azure-tjänster och azd-funktioner

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### AI Plattformsexpansion
- **Multimodellstöd**: Integreringsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **AI Agent-ramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-driftsättningar
- **Avancerade RAG-mönster**: Vektor databasalternativ bortom Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observabilitet**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code-extension**: Integrerad AZD + Microsoft Foundry-utvecklarupplevelse
- **GitHub Copilot-integrering**: AI-assisterad AZD-malldesign
- **Interaktiva handledningar**: Praktiska kodningsövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella inlärare med fokus på AI-driftsättning

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Styrningsramverk**: AI-modellstyrning, regelefterlevnad och revisionsspår
- **Multi-tenant AI**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-driftsättning**: Integrering med Azure IoT Edge och containerinstanser
- **Hybrid Cloud AI**: Multi-cloud och hybrid driftsättningsmönster för AI-arbetsbelastningar

#### Avancerade funktioner
- **AI-pipelineautomatisering**: MLOps-integrering med Azure Machine Learning-pipelines
- **Avancerad säkerhet**: Zero-trust-mönster, privata slutpunkter och avancerat hot skydd
- **Prestandaoptimering**: Avancerade justerings- och skalningsstrategier för höggenomströmmande AI-applikationer
- **Global distribution**: Innehållsleverans och edge-caching-mönster för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av nuvarande version
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande Microsoft Foundry-integrering (Slutförd)
- ✅ **Interaktiva handledningar**: Praktiskt AI-workshop-labb (Slutförd)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutförd)
- ✅ **Prestandaoptimering**: AI-arbetsbelastningsjusteringsstrategier (Slutförd)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Några slutförda i nuvarande version
- ✅ **Ytterligare exempel**: AI-fokuserade driftsättningsscenarier (Slutförd)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutförd)
- **Verktygsintegrering**: Förbättrade IDE- och redigerarintegreringsguider
- ✅ **Utökad övervakning**: AI-specifika övervaknings- och larmmönster (Slutförd)

#### Fortfarande planerad för framtida release
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integrering**: VS Code-extension för AZD + AI-arbetsflöden
- **Community-instrumentpanel**: Realtidscommunitystatistik och bidragsspårning

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta arkiv, vänligen se till att ändringsposter inkluderar:

1. **Versionsnummer**: Följ semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Tillagt, Ändrat, Utfasat, Borttaget, Fixat, Säkerhet
4. **Tydlig beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Tillagt
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller verktyg

#### Ändrat
- Ändringar i befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Utfasat
- Funktioner eller metoder som fasas ut
- Dokumentationsavsnitt planerade för borttagning
- Metoder med bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Gammal information eller utfasade tillvägagångssätt
- Redundant eller konsoliderat innehåll

#### Fixat
- Korrigeringar av fel i dokumentation eller kod
- Lösning av rapporterade problem
- Förbättringar av noggrannhet eller funktionalitet

#### Säkerhet
- Säkerhetsrelaterade förbättringar eller korrigeringar
- Uppdateringar av säkerhetsbästa praxis
- Åtgärder av säkerhetssårbarheter

### Riktlinjer för semantisk versionering

#### Större version (X.0.0)
- Genombrottsförändringar som kräver åtgärd av användare
- Betydande omstrukturering av innehåll eller organisation
- Ändringar som ändrar grundläggande tillvägagångssätt eller metodologi

#### Mindre version (X.Y.0)
- Nya funktioner eller innehållstillägg
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Feedback och förslag från communityn

Vi uppmuntrar aktivt till feedback från communityn för att förbättra denna lärresurs:

### Hur man lämnar feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika frågor välkomnas)
- **Discord-diskussioner**: Dela idéer och engagera dig med Microsoft Foundry-communityn
- **Pull-förfrågningar**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community-forum**: Delta i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI-innehållsnoggrannhet**: Korrigeringar av AI-tjänsteintegrering och driftsättningsinformation
- **Lärandeupplevelse**: Förslag för förbättrad AI-utvecklarinlärning
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika inlärningsbehov
- **AI-verktygsintegrering**: Förslag för bättre AI-utvecklingsarbetsflödesintegrering
- **Produktions-AI-mönster**: Företags-AI-driftsättningsmönsterförfrågningar

### Svarsåtagande
- **Issue-svar**: Inom 48 timmar för rapporterade problem
- **Funktionsförfrågningar**: Utvärdering inom en vecka
- **Community-bidrag**: Granskning inom en vecka
- **Säkerhetsfrågor**: Omedelbar prioritet med skyndsam respons

## Underhållsschema

### Regelbundna uppdateringar
- **Månadsvisa granskningar**: Innehållsnoggrannhet och länkvalidering
- **Kvartalsvisa uppdateringar**: Stora innehållstillägg och förbättringar
- **Halvårsvisa granskningar**: Omfattande omstrukturering och förbättring
- **Årliga releaser**: Stora versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetssäkring
- **Automatiserad testning**: Regelbunden validering av kodexempel och länkar
- **Integration av community-feedback**: Regelbunden införlivning av användarförslag
- **Teknologiuppdateringar**: Anpassning till senaste Azure-tjänsterna och azd-utgåvor
- **Tillgänglighetsgranskningar**: Regelbunden genomgång av inkluderande designprinciper

## Policyn för versionsstöd

### Stöd för aktuell version
- **Senaste huvudversionen**: Fullt stöd med regelbundna uppdateringar
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader
- **Äldre versioner**: Endast community-stöd, inga officiella uppdateringar

### Migreringsanvisningar
När huvudversioner släpps erbjuder vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsnoter**: Detaljer om inkompatibla förändringar
- **Verkstöd**: Skript eller verktyg som hjälper vid migrering
- **Community-stöd**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående lektion**: [Studiehandledning](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Huvud-README](README.md)

**Håll dig uppdaterad**: Bevaka detta repository för notifikationer om nya utgåvor och viktiga uppdateringar av läromaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->