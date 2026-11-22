# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla anmärkningsvärda ändringar, uppdateringar och förbättringar i AZD För Nybörjare-repositoriet. Vi följer principer för semantisk versionering och underhåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att gå igenom denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och innehållstillägg
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av lärmaterialet över tid

## Läranderesultat

Efter att ha granskat ändringsloggsposter kommer du att kunna:
- Identifiera nytt innehåll och resurser tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din lärväg baserat på det mest aktuella materialet
- Bidra med feedback och förslag till framtida förbättringar

## Versionshistorik

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry-tillägget 1.0 är nu allmänt tillgängligt

Paketet `microsoft.foundry` 1.0 är **live och allmänt tillgängligt**, som meddelades den [5 november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kursen lär nu ut det släppta GA-arbetsflödet, inte en kommande release. Kom igång med AZD **1.37.0 eller senare** och `azd ext install microsoft.foundry`.

#### Tillgängligt i denna kursuppdatering
- Den engelska vägledningen använder GA-paketet som standardinstallationsväg och förklarar dess sju oberoende versionerade kärnförlängningar.
- En [hosted-agent genomgång](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) täcker den upstream Python Agent Framework Responses API-exemplet, aktuell uv, Python 3.13+, val av nya/existerande projekt, modellåteranvändning och granskning av `azure.yaml`.
- Arbetsflödet från lokal till moln täcker Agent Inspector-testning, Azure-stödda modellanropkostnader, fjärrkodbyggen, distribuerad anropning, molnspårning, förhandsgranskning av distribution, loggar och diagnostik.
- Separat utvärderingsvägledning täcker generering och granskning av dataset/bedömningskriterier, konfiguration av namngiven utvärdering, registrering av tillgångar och inspektion av resultat. Äldre utvärderings-/optimeringsinstruktioner finns kvar som migrationshistorik, inte som nuvarande releasebaslinje.
- Foundry CI/CD-vägledning inkluderar installation av runner-förlängning, autentiserad distribution, utvärderingstillgångar/-åtkomst och en uttrycklig kvalitetsgrind.
- Rensningsvägledning skiljer på nyskapade och återanvända Foundry-projekt. Workshoppen länkar till den separata GA-övningen utan att ersätta dess exempelspecifika tester.
- Kursnavigering, lärandemål, installationsförutsättningar, fusklapp, vanliga frågor och studieguide återspeglar GA-arbetsflödet. Genererade översättningar redigeras inte manuellt.

#### Granskningsomfång
- Grundat på GA-meddelandet, länkad Microsoft Learn-vägledning och den upstream-exempelkonfigurationen. Ingen live Azure-provisionering, distribution, modellanrop eller utvärdering utfördes.
- Paketets GA innebär inte GA för varje valfri funktion, oberoende förlängning eller SDK, och certifierar inte exemplen för produktion.

### [v3.24.0]- 2026-11-04

#### Åtgärdat
- Åtgärdade engelsk kursnavigering, flyttade sidosökvägar, saknade ankare och föråldrade externa referenser, inklusive länken i Kapitel 2 till produktions-AI-guiden.
- Granskade aktuell vägledning mot publicerad AZD 1.37.2, agents 1.0.0-beta.23 och evaluations 1.0.0-beta.2. Dokumenterade det separata `azd ai eval` arbetsflödet och optimeringskonfigurationsmigrering.
- Korrigerade ej stödjade CLI-flaggar, autentiseringsgränser, tydlig vägledning för miljö/sekretess i klartext, infrastrukturuppdateringar, modellkonfiguration och destruktiva återställningsexempel.
- Uppdaterade workshoppen mot aktuell AI Agents-exempel, inklusive faktiska krokar, konfigurationsinmatningar, utvärderingstester, red teaming-ingångspunkter och observabilitet.
- Korrigerade exempelimplementeringspåståenden och åtgärdade relaterade applikations-/infrastruktur-/konfigurationsproblem. Material om detaljhandelsarkitektur skiljer sig uttryckligen från en komplett fungerande applikation.
- Återställde CodeQL-språkmatrix, valde stödd Node.js 24 för dev-containern och gjorde setup-validatorer som rapporterar misslyckade versionskommandon.

#### Tillagt
- Enbart engelska offline-länk-/ankarkontroll, regressionstester och ett dokumentationsarbetsflöde som också bygger workshoppen i strikt läge. Genererade översättningar och översatta bilder undantas.

#### Valideringsomfång
- Källkod, syntax, konfiguration, lokalt beteende och nätverkslänkkontroller fastställer inte live Azure-distribuerbarhet, kvoter, RBAC, regional modelltillgänglighet, fakturering, säkerhetsöverensstämmelse eller produktionsberedskap.
- Äldre poster nedan är historiska register, inte aktuella kommando- eller releaseinstruktioner.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Uppdatering: Versionsaktuellt
**Denna version validerar om kursen mot `azd` `1.27.1` (juli 2026, senaste stabila releasen) och aktuell preview AI agent-förlängning `azure.ai.agents` `1.0.0-beta.5`, och uppdaterar alla "validerad mot"-baner efter releaserna 1.26.0, 1.27.0 och 1.27.1.**

#### Ändrat
- **✅ Valideringsbaslinje uppdaterad** från `azd 1.25.6` (juni 2026) till `azd 1.27.1` (juli 2026) i root README, alla kapitel README, Kapitel 1 dev-container-lektion (inklusive anknutna versionsexempel), Kapitel 4 anpassade mallar-lektion, Kapitel 5 multi-agent-lektion och workshopdokumentation
- **🤖 Kapitel 2 baslinje uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.27.1` över `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` och `microsoft-foundry-integration.md`; valideringsnoteringens datum uppdaterat till 2026-07-13
- **🧩 AI agent-förlängning uppgraderad** från `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` till nuvarande `1.0.0-beta.5` release i Kapitel 2 README och `agents.md`
- **🧪 Workshop valideringsexempel** (`azd version` output) uppdaterat till `1.27.1`

#### Noteringar om relevanta azd-releaser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-stöd för Azure Functions på Flex Consumption, `azd config sub-filter` per-tenant abonnemangsfilter, självständiga förlängningspaket (`azd x pack --bundle`) och `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellera Azure AI Foundry-projekt/agenter direkt i `azure.yaml` (Bicep-lös/Terraform-lös init), container-distributionsstöd för App Service (`host: appservice` + `language: docker`), direkt `-s/--source` för `azd extension` kommandon, och `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flagga för `azd extension install`, deprecated modeller exkluderade från katalog-/kvotpromptar som standard, och flera buggfixar

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

#### Nybörjargap #2: Mallskapande, Dev-containrar, Pulumi, Azure DevOps, Service Principals och Mer
**Denna version stänger de kvarvarande intermediära luckorna som visats av azd-coverage-analysen: hur man skapar och publicerar sin egen mall, reproducerbara dev-container/Codespaces-miljöer, Pulumi-infrastrukturprovider, en genomgång av Azure DevOps CI/CD, service-principal autentisering, värdvalsrekommendationer (AKS/Spring Apps), förklaringar för `azd restore`/`azd package`, felhantering av krokar och team-/delade miljöpraktiker.**

#### Tillagt
- **🧱 Ny Kapitel 4-lektion** `docs/chapter-04-infrastructure/custom-templates.md` — skapande av egen azd-mall: nödvändig struktur (`azure.yaml`, `infra/`, `src/`), fältet `metadata.template`, parameterisering av infrastruktur med `uniqueString()` resurssymbol och `azd-env-name` tagg, lokal testning med `azd init --template <local-path>`, publicering till GitHub och inskickande till Awesome AZD-galleriet
- **📦 Ny Kapitel 1-lektion** `docs/chapter-01-foundation/dev-containers.md` — reproducerbara azd-miljöer med Dev Containers och GitHub Codespaces: ett minimalt `.devcontainer/devcontainer.json` som använder officiella `ghcr.io/azure/azure-dev/azd`-funktionen, språk-specifika funktioner, `docker-in-docker` för containervärdar och `azd auth login --use-device-code` för fjärrinloggning
- **🧩 Pulumi med azd** avsnitt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mappstruktur, stackar kopplade till azd-miljöer, nödvändiga outputs/taggning och identiskt `azd up` / `azd down` arbetsflöde
- **🎯 Värdvalsrekommendationer** i `docs/chapter-04-infrastructure/provisioning.md` — en nybörjarvänlig jämförelse av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` och `springapp`, med rekommendationer om när man ska välja AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD-genomgång** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, tjänsteanslutning med workload identity federation (OIDC), genererad `azure-dev.yml` och setup av variabelgrupper
- **🔑 Service Principals (Mönster 4)** tillagt i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, icke-interaktiv `azd auth login` med klienthemlighet kontra federerade/OIDC-referenser, när man ska använda, och säker lagring av referenser
- **🪝 Felhantering av krokar** avsnitt i `docs/chapter-04-infrastructure/deployment-guide.md` — avslutningskoder och `set -e`, `continueOnError`, testning av krokar isolerat med `azd hooks run`, OS-specifika skal och `--debug`
- **👥 Team-/delade miljöer** avsnitt i `docs/chapter-03-configuration/configuration.md` — vad som finns i `.azure/`, vad som ska gitignoras, utvecklarespecifika miljöer, `azd env list`/`select` och att tillhandahålla miljövärden i CI/CD
- **🧰 `azd restore` och utökade `azd package`** förklaringar i `resources/cheat-sheet.md` — återställande av beroenden och byggande av en distribuerbar artefakt utan distribution

#### Ändrat
- **🧭 Kapitel 4 lektionsbord** uppdaterat för att inkludera nya lektionen "Skapa din egen mall" (Lektion 3)
- **🧭 Kapitel 1 lektionsbord** uppdaterat för att inkludera nya lektionen "Dev Containers & Codespaces" (Lektion 5); navigeringsfotter kopplade mellan `bring-your-own-app.md` och `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Nybörjargap: Praktisk Multi-Agent lektion, "Bring Your Own App", Terraform och CI/CD-genomgång
**Denna version stänger de största luckorna för en komplett nybörjarguide genom att lägga till två nya praktiska lektioner (en distribuerbar multi-agent genomgång och att lägga till azd i en befintlig app), en nybörjarvänlig introduktion till krokar, ett Terraform-med-azd avsnitt, en steg-för-steg-genomgång av GitHub Actions-pipeline, en förklaring av de nya preview-förlängningarna och en uttrycklig checklista för verifiering av distribution.**

#### Tillagt
- **🤝 Ny Kapitel 5 lektion** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fullständigt praktisk, distribuerbar två-agent genomgång (orchestrator + specialister) med en riktig mall (`contoso-creative-writer`), som täcker när man ska använda multi-agent, `azd up` arbetsflödet, förståelse för distribuerade resurser, spårning över agenter, anpassning och rensning
- **📦 Ny Kapitel 1 lektion** `docs/chapter-01-foundation/bring-your-own-app.md` — hur man lägger till azd i ett befintligt projekt med `azd init` ("använd kod i den aktuella katalogen"), förstå `azure.yaml` och `infra/`, `azd infra generate`, värdidentifiering och distribution med `azd up`
- **🌐 Terraform med azd** avsnitt tillagt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguration, `.tf` mappstruktur, nödvändiga `AZURE_*` outputs och `azd-env-name` tagging, och identiskt `azd up` / `azd down` arbetsflöde (stänger luckan där Terraform-stöd utlovades men bara Bicep visades)
- **⚙️ Steg-för-steg genomgång av GitHub Actions** i `docs/chapter-08-production/production-ai-practices.md` — från GitHub-repo till automatiserade deploys: `azd pipeline config`, OIDC-federerade autentiseringsuppgifter (inga lagrade hemligheter), den genererade `azure-dev.yml` och vägledning för hemligheter kontra variabler
- **🪝 Nybörjarguide "Ny på hooks?"** i `docs/chapter-04-infrastructure/deployment-guide.md` — vad en hook är, en hook-scenariotabell, en minimal första hook och att köra hooks manuellt med `azd hooks run`
- **✅ "Verifiera din distribution" checklist** tillagd i steg 5 av `docs/chapter-01-foundation/first-project.md` — röktest, hälsokontroll av endpoint och tydliga framgångskriterier
- **🧩 Förklaring för nya förhandsgransknings-tillägg** `azure.ai.skills` och `azure.ai.connections` (vad de är och när man ska använda dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ändring
- **🧭 Kapiteltabell för kapitel 5** korrigerad: `multi-agent-basics.md` är nu lektion 1 (den enda helt praktiska lektionen), med ärlig märkning att lektion 2 finns i kapitel 6 och Retail-scenariot är en arkitekturritning, inte en mall med ett kommando
- **🧭 Kapiteltabell för kapitel 1** inkluderar nu den nya lektionen "Ta med din egen app" (lektion 4)
- **🔗 Navigeringsfotnoter** uppdaterade: `first-project.md` länkar nu framåt till `bring-your-own-app.md`

#### Fixat
- **🧱 Stängd "påstådd men saknad" Terraform-brist** — kursen hänvisade tidigare till Terraform-stöd utan att visa det
- **🔀 Korrigerade missvisande korslänkar i kapitel 5** som antydde att en full multi-agent-implementering fanns när det bara handlade om en arkitekturritning

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

#### AZD 1.25.6 Uppdatering, Full Agent Livscykel-kommandon & Aspire Ombeteckning
**Den här versionen validerar kursen mot `azd` `1.25.6` (juni 2026) och `azure.ai.agents` `0.1.40-preview`-tillägget, utökar AI-vägledningen från "skapa en agent" till hela agentens livscykel (testa → utvärdera → optimera → inspektera → ta bort), lyfter fram nya `azure.ai.skills` och `azure.ai.connections` förhandsgransknings-tillägg och noterar ombeteckningen från ".NET Aspire" till "Aspire".**

#### Tillagt
- **🔁 Full täckning av agentens livscykel** för nybörjare och AI-ingenjörer i dokumentationen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livscykeltabell (skapa → testa → mäta → förbättra → inspektera → städa upp) tillagd i Extensions and AI Commands-sektionen
  - `docs/chapter-08-production/production-ai-practices.md` — Ny sektion "Hantera agentens livscykel" som täcker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` och `delete --force`
  - `resources/cheat-sheet.md` — Utökade AI Agent Commands med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` och `delete --force`
- **🧩 Nya förhandsgransknings-tillägg** dokumenterade: `azure.ai.skills` (återanvändbara agents-färdigheter) och `azure.ai.connections` (Foundry-anslutningar) tillagda i tilläggstabellen och fusklappen
- **⏱️ Guidning för responstider** — `azd ai agent invoke`-exempel visar nu total latens och tid till första byte
- **📌 Versionsbanner** i roten av README som pekar användare till `azd version` och `azd upgrade`

#### Ändrat
- **✅ Valideringsbaseline uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.25.6` (juni 2026) i alla kapitelens README och workshop-dokument
- **🤖 Kapitel 2 tilläggsnotering** uppdaterad från `azure.ai.agents` `0.1.18-preview` till `0.1.40-preview`
- **🧪 Workshop-valideringsexempel** (`azd version`-utdata) uppdaterat till `1.25.6`
- **🧭 README "What's New in azd Today"** uppdaterad för att framhäva agentens livscykel, nya AI-tillägg och nyliga livskvalitetsförbättringar (`azd init` idempotens, `azd auth login` borttagning av gamla token, `azd tool` första körnings-prompt)
- **📖 Kapitel 2 agents.md (Alternativ 4)** pekar nu användare till efter-deploy-livscykel-kommandon istället för att sluta vid `azd up`

#### Fixat
- **🏷️ Produktnamn** — tillagd Aspire-ombeteckningsnotering (".NET Aspire" heter nu bara "Aspire"); azds Aspire-stöd är oförändrat
- **🔎 Live release-validering** bekräftad mot Azure Developer CLI release-flöde: stabil CLI `1.25.6` (2026-06-12) och `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Förtydligande för nybörjare, validering av setup & slutlig städning av AZD-kommandon
**Den här versionen följer upp AZD 1.23 valideringsomgång med en dokumentationspassage fokuserad på nybörjare: den förtydligar AZD-först autentiseringsvägledningen, lägger till lokala setup-valideringsskript, verifierar nyckelkommandon mot live AZD CLI och tar bort de sista föråldrade engelskspråkiga kommando-referenserna utanför ändringsloggen.**

#### Tillagt
- **🧪 Nybörjarvalideringsskript för setup** med `validate-setup.ps1` och `validate-setup.sh` så att användare kan kontrollera nödvändiga verktyg innan kapitel 1 startar
- **✅ Inledande valideringssteg för setup** i roten av README och kapitel 1 README så att saknade förutsättningar upptäcks innan `azd up`

#### Ändrat
- **🔐 Nybörjarautentiseringsvägledning** behandlar nu konsekvent `azd auth login` som primär väg för AZD-arbetsflöden, med `az login` utpekad som tillval om inte Azure CLI-kommandon används direkt
- **📚 Kapitel 1 onboarding-flöde** pekar nu användare att validera lokala setupen innan installation, autentisering och första deploy-steg
- **🛠️ Validerings-meddelanden** separerar nu tydligt blockerande krav från valfria Azure CLI-varningar för AZD-enda nybörjarspåret
- **📖 Konfigurations-, felsöknings- och exempel-dokument** skiljer nu på nödvändig AZD-autentisering och valfri Azure CLI-inloggning där båda tidigare presenterades utan kontext

#### Fixat
- **📋 Kvarvarande engelskspråkiga kommando-referenser** uppdaterade till aktuella AZD-former, inklusive `azd config show` i fusklappen och `azd monitor --overview` där Azure Portal-översiktsvägledning var avsedd
- **🧭 Nybörjarlöften i kapitel 1** mildrade för att undvika överlöften om garanterat fel-fria eller återställningsfria beteenden över alla mallar och Azure-resurser
- **🔎 Live CLI-validering** bekräftade aktuell support för `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` och `azd down --force --purge`

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

#### AZD 1.23.12 Validering, Workshop-miljöutvidgning & AI Modelluppdatering
**Den här versionen utför en dokumentationsvalidering mot `azd` `1.23.12`, uppdaterar föråldrade AZD-kommandoexempel, uppdaterar AI-modellvägledningen till aktuella standarder och breddar workshop-instruktionerna utöver GitHub Codespaces för att även stödja dev containers och lokala kloner.**

#### Tillagt
- **✅ Valideringsnoteringar i alla kärnkapitel och workshop-dokument** för att göra testad AZD-baseline tydlig för användare av nyare eller äldre CLI-versioner
- **⏱️ Vägledning för deployment timeouts** för långvariga AI-apps-deploys med `azd deploy --timeout 1800`
- **🔎 Steg för tilläggsinspektion** med `azd extension show azure.ai.agents` i AI-arbetsflödesdokument
- **🌐 Bredare workshop-miljövägledning** som täcker GitHub Codespaces, dev containers och lokala kloner med MkDocs

#### Ändrat
- **📚 Kapitel-intro-README** noterar nu konsekvent validering mot `azd 1.23.12` i grundläggande, konfigurations-, infrastruktur-, multi-agent-, fördistribution-, felsöknings- och produktionsavsnitt
- **🛠️ AZD-kommandoreferenser** uppdaterade till aktuella former i dokumentationen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` beroende på kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` där Application Insights-översikt är avsedd
- **🧪 Provision-förhandsgranskningsexempel** förenklade till nuvarande stöd för t.ex. `azd provision --preview` och `azd provision --preview -e production`
- **🧭 Workshop-flöde** uppdaterat så användare kan göra labbar i Codespaces, en dev container eller en lokal klon istället för att anta exekvering enbart i Codespaces
- **🔐 Autentiseringsvägledning** föredrar nu `azd auth login` för AZD-arbetsflöden, med `az login` som tillval när Azure CLI-kommandon används direkt

#### Fixat
- **🪟 Windows-installationskommandon** normaliserade till aktuell `winget` paketcasing i installationsguiden
- **🐧 Linux-installationsguidning** korrigerad för att undvika ej stödjda distributionsspecifika `azd` paketmanager-instruktioner och istället peka på releaser där lämpligt
- **📦 AI-modellsexempel** uppdaterade från äldre standarder som `gpt-35-turbo` och `text-embedding-ada-002` till aktuella exempel som `gpt-4.1-mini`, `gpt-4.1` och `text-embedding-3-large`
- **📋 Deployment- och felsökningskodsnuttar** korrigerade till att använda aktuella miljö- och statuskommandon i loggar, skript och felsökningssteg
- **⚙️ GitHub Actions-vägledning** uppdaterad från `Azure/setup-azd@v1.0.0` till `Azure/setup-azd@v2`
- **🤖 MCP/Copilot-samtyckesvägledning** uppdaterad från `azd mcp consent` till `azd copilot consent list`

#### Förbättrat
- **🧠 AI-kapitlets vägledning** förklarar nu bättre förhandsgranskningskänsligt `azd ai`-beteende, hyresgästanpassad inloggning, aktuellt tilläggsbruk och uppdaterade modell-deployrekommendationer
- **🧪 Workshop-instruktioner** använder nu mer realistiska versionsexempel och tydligare språk för miljösetup vid praktiska labbar
- **📈 Produktions- och felsökningsdokument** är nu bättre anpassade till aktuella övervaknings-, fallback-modell- och kostnadsnivåexempel

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
**Denna version lägger till `azd ai`, `azd extension` och `azd mcp` kommandotäckning över alla AI-relaterade kapitel, åtgärdar trasiga länkar och föråldrad kod i agents.md, uppdaterar fusklappen och genomgår en översyn av avsnittet Exempelmallar med validerade beskrivningar och nya Azure AI AZD-mallar.**

#### Tillagt
- **🤖 AZD AI CLI-täckning** över 7 filer (tidigare endast i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nytt avsnitt "Extensions and AI Commands" som introducerar `azd extension`, `azd ai agent init` och `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med jämförelsetabell (mall kontra manifestmetod)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Avsnitten "AZD Extensions for Foundry" och "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Snabbstart visar nu både mall- och manifestbaserade distributionsvägar
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distributionsavsnittet inkluderar nu alternativet `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underdelen "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nytt avsnitt "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` och `azd infra generate`
- **📦 Nya AZD AI-exempelmallar** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chatt med Blazor WebAssembly, Semantic Kernel och röstchattstöd
  - **azure-search-openai-demo-java** — Java RAG-chatt som använder Langchain4J med ACA/AKS-distributionsalternativ
  - **contoso-creative-writer** — Kreativ skrivapp med flera agenter som använder Azure AI Agent Service, Bing Grounding och Prompty
  - **serverless-chat-langchainjs** — Serverless RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokal utvecklingssupport
  - **chat-with-your-data-solution-accelerator** — Företagsaccelerator för RAG med administrationsportal, Teams-integration och PostgreSQL/Cosmos DB-alternativ
  - **azure-ai-travel-agents** — Referensapp för multiservice MCP-orkestrering med servrar i .NET, Python, Java och TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep-startmall
  - **🔗 Awesome AZD AI Gallery link** — Referens till [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallar)

#### Fikserat
- **🔗 agents.md-navigation**: Föregående/Nästa länkar matchar nu kapitel 2 README-lektionernas ordning (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md trasiga länkar**: `production-ai-practices.md` rättats till `../chapter-08-production/production-ai-practices.md` (3 förekomster)
- **📦 agents.md föråldrad kod**: Ersatte `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ogiltig API**: Flyttade `max_tokens` från `create_agent()` till `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenräkning**: Ersatte grov `len//4` uppskattning med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rättade tjänster från "Cognitive Search + App Service" till "Azure AI Search + Azure Container Apps" (standardvärd ändrad okt 2024)
- **contoso-chat**: Uppdaterad beskrivning för att referera till Azure AI Foundry + Prompty, i överensstämmelse med repoets faktiska titel och teknologier

#### Borttaget
- **ai-document-processing**: Tog bort icke-fungerande mallreferens (repo är inte offentligt tillgängligt som AZD-mall)

#### Förbättrat
- **📝 agents.md övningar**: Övning 1 visar nu förväntat resultat och `azd monitor` steg; Övning 2 inkluderar komplett `FunctionTool` registreringskod; Övning 3 ersätter vag vägledning med konkreta `prepdocs.py` kommandon
- **📚 agents.md resurser**: Uppdaterade dokumentationslänkar till aktuella Azure AI Agent Service-dokument och snabbstart
- **📋 agents.md Nästa Steg-tabell**: Lade till AI Workshop Lab-länk för komplett kapitelöversikt

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
**Denna version förbättrar README.md-kapitelnavigering med en förbättrad tabellformat.**

#### Ändrat
- **Kurskarta-tabell**: Förbättrad med direkta lektionslänkar, tidsuppskattningar och komplexitetsvärderingar
- **Mappstädning**: Tog bort överflödiga gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Länkvalidering**: Alla 21+ interna länkar i Kurskarttabellen verifierade

### [v3.16.0] - 2026-02-05

#### Produktnamnsuppdateringar
**Denna version uppdaterar produktreferenser till nuvarande Microsoft-varumärke.**

#### Ändrat
- **Microsoft Foundry → Microsoft Foundry**: Alla referenser uppdaterade över icke-översättningsfiler
- **Azure AI Agent Service → Foundry Agents**: Tjänstens namn uppdaterad för att återspegla nuvarande varumärke

#### Uppdaterade filer
- `README.md` - Huvudsidan för kursen
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Guide för AI-agenter
- `examples/README.md` - Dokumentation för exempel
- `workshop/README.md` - Workshop-landsida
- `workshop/docs/index.md` - Workshop-index
- `workshop/docs/instructions/*.md` - Alla workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Större omstrukturering av repo: Kapitelbaserade mappnamn
**Denna version omstrukturerar dokumentationen i dedikerade kapitelmappar för tydligare navigering.**

#### Mappnamnsändringar
Gamla mappar ersatta med kapitelnummer-mappnamn:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lade till ny: `docs/chapter-05-multi-agent/`

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
| Alla pre-deploymentsfiler | pre-deployment/ | chapter-06-pre-deployment/ |
| Alla felsökningsfiler | troubleshooting/ | chapter-07-troubleshooting/ |

#### Tillagt
- **📚 Kapitel-README-filer**: Skapade README.md i varje kapitelmapp med:
  - Lärandemål och duration
  - Lektionstabell med beskrivningar
  - Snabbstartskommandon
  - Navigering till andra kapitel

#### Ändrat
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i alla dokumentationsfiler
- **🗺️ Huvud-README.md**: Uppdaterad Kurskarta med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Borttaget
- Gammal mappstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering av repo: Kapitelnavigering
**Denna version lade till kapitelnavigerings-README-filer (ersattes av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide för AI-agenter
**Denna version lägger till en omfattande guide för distribution av AI-agenter med Azure Developer CLI.**

#### Tillagt
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chattbottar
  - Tre snabbstartsgensor för agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitekturens mönster (enkel agent, RAG, multi-agent)
  - Verktygskonfiguration och anpassning
  - Övervakning och måttspårning
  - Kostnadsaspekter och optimering
  - Vanliga felsökningsscenarier
  - Tre praktiska övningar med framgångskriterier

#### Innehållsstruktur
- **Introduktion**: Agentkoncept för nybörjare
- **Snabbstart**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmönster**: Visuella diagram av agentmönster
- **Konfiguration**: Verktygsuppsättning och miljövariabler
- **Övervakning**: Integration med Application Insights
- **Övningar**: Progressiv praktisk inlärning (20-45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### Uppdatering av DevContainer-miljö
**Denna version uppdaterar utvecklingscontainerns konfiguration med moderna verktyg och bättre standardinställningar för AZD-inlärningsupplevelsen.**

#### Ändrat
- **🐳 Basbild**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (nyaste Debian stabil)
- **📛 Container-namn**: Omdöpt från "Python 3" till "AZD för nybörjare" för tydlighet

#### Tillagt
- **🔧 Nya Dev Container-funktioner**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för containerappdistributioner

- **🔌 Portvidarebefordran**: Förkonfigurerade portar för vanlig utveckling:
  - 8000 (MkDocs-förhandsgranskning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code Extensions**:
  - `ms-python.vscode-pylance` - Förbättrad Python IntelliSense
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

- **⚙️ VS Code-inställningar**: Lade till standardinställningar för Python-tolk, formatering vid sparande och borttagning av blanksteg

- **📦 Uppdaterade requirements-dev.txt**:
  - Lade till MkDocs minify-plugin
  - Lade till pre-commit för kodkvalitet
  - Lade till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fikserat
- **Post-Create-kommando**: Verifierar nu installation av AZD och Azure CLI vid containerstart

---

### [v3.11.0] - 2026-02-05

#### Nybörjarvänlig README-översyn
**Denna version förbättrar README.md avsevärt för att bli mer tillgänglig för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Tillagt
- **🆚 Azure CLI vs AZD-jämförelse**: Tydlig förklaring när varje verktyg ska användas med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direkta länkar till community-mallgalleri och bidragsresurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ färdiga att distribuera mallar
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Communitybidrag
- **🎯 Snabbstartsguide**: Förenklat 3-stegs startavsnitt (Installera → Logga in → Distribuera)
- **📊 Erfarnebaserad navigeringstabell**: Tydlig vägledning om var man ska börja baserat på utvecklarerfarenhet

#### Ändrat
- **README-struktur**: Omdisponerad för progressiv information - viktig information först
- **Introduktionsavsnitt**: Omskrivet för att förklara "Magin med `azd up`" för nybörjare
- **Borttagen duplicerad innehåll**: Tog bort dubblerat felsökningsavsnitt
- **Felsökningskommandon**: Fixade `azd logs`-referens för att använda giltig `azd monitor --logs`

#### Fixat
- **🔐 Autentiseringskommandon**: Lade till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga kommandoreferenser**: Tog bort kvarvarande `azd logs` från felsökningssektionen i README

#### Anteckningar
- **Omfattning**: Ändringar tillämpade på huvudsakliga README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringar riktade specifikt till utvecklare nya inom AZD

---

### [v3.10.0] - 2026-02-05

#### Uppdatering av korrekthet för Azure Developer CLI-kommandon
**Denna version korrigerar icke-existerande AZD-kommandon i hela dokumentationen och säkerställer att alla kodexempel använder giltig syntax för Azure Developer CLI.**

#### Fixat
- **🔧 Icke-existerande AZD-kommandon borttagna**: Omfattande granskning och korrigering av ogiltiga kommandon:
  - `azd logs` (existerar inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` underkommandon (existerar inte) → ersatt med `azd show` och Azure CLI
  - `azd infra import/export/validate` (existerar inte) → borttagen eller ersatt med giltiga alternativ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flaggor (existerar inte) → borttagna
  - `azd provision --what-if/--rollback` flaggor (existerar inte) → uppdaterad för att använda `--preview`
  - `azd config validate` (existerar inte) → ersatt med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existerar inte) → borttagna

- **📚 Filer uppdaterade med kommando-korrigeringar**:
  - `resources/cheat-sheet.md`: Större översyn av kommando-referens
  - `docs/deployment/deployment-guide.md`: Fixade rollback- och driftsättningsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerade logganalyser
  - `docs/troubleshooting/common-issues.md`: Uppdaterade felsökningskommandon
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixade AZD-felsökningssektion
  - `docs/getting-started/azd-basics.md`: Korrigerade övervakningskommandon
  - `docs/getting-started/first-project.md`: Uppdaterade övervaknings- och felsöknings-exempel
  - `docs/getting-started/installation.md`: Fixade hjälp- och versions-exempel
  - `docs/pre-deployment/application-insights.md`: Korrigerade kommandon för loggvisning
  - `docs/pre-deployment/coordination-patterns.md`: Fixade agent-felsökningskommandon

- **📝 Versionsreferens uppdaterad**: 
  - `docs/getting-started/installation.md`: Ändrade hårdkodad `1.5.0`-version till generisk `1.x.x` med länk till releaser

#### Ändrat
- **Rollback-strategier**: Uppdaterad dokumentation för att använda Git-baserad rollback (AZD saknar inbyggd rollback)
- **Loggvisning**: Ersatte `azd logs`-referenser med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektion**: Tog bort icke-existerande parallella/incrementella driftsättningsflaggor, tillhandahöll giltiga alternativ

#### Tekniska detaljer
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Anteckningar
- **Verifiering**: Kommandon validerade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Avslutning av workshop och uppdatering av dokumentationskvalitet
**Denna version slutför de interaktiva workshopmodulerna, fixar alla brutna dokumentationslänkar och förbättrar den övergripande innehållskvaliteten för AI-utvecklare som använder Microsoft AZD.**

#### Tillagt
- **📝 CONTRIBUTING.md**: Ny dokument för bidragsriktlinjer med:
  - Klara instruktioner för att rapportera problem och föreslå ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och commit-meddelanden
  - Information om community-engagemang

#### Avslutat
- **🎯 Workshop Modul 7 (Avslutning)**: Fullständigt slutförd avslutningsmodul med:
  - Omfattande sammanfattning av workshop-prestationer
  - Nyckelkonceptavsnitt om AZD, mallar och Microsoft Foundry
  - Rekommendationer för fortsatt lärande
  - Workshop-utmaningsövningar med svårighetsgrader
  - Community-återkoppling och supportlänkar

- **📚 Workshop Modul 3 (Nedbrytning)**: Uppdaterade lärandemål med:
  - GitHub Copilot med MCP-servrar aktiveringsvägledning
  - Förståelse för AZD-mallarnas mappstruktur
  - Infrastruktur-som-kod (Bicep) organisationsmönster
  - Praktiska labbinstruktioner

- **🔧 Workshop Modul 6 (Nedmontering)**: Slutförd med:
  - Resursrensning och kostnadshantering
  - Användning av `azd down` för säker nedmontering av infrastruktur
  - Vägleder återställning av mjukt borttagna kognitiva tjänster
  - Bonus-utforskningsuppmaningar för GitHub Copilot och Azure Portal

#### Fixat
- **🔗 Fix av brutna länkar**: Löste över 15 brutna interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerade sökvägar till ai-model-deployment.md och production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fixade FAQ och felsökningsguide-sökvägar
  - `examples/container-app/microservices/README.md`: Korrigerade kurshem och deploy-guide-sökvägar
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade AI-kapitelreferenser
  - `course-outline.md`: Fixade instruktörsguide och AI-workshop laboratorio-referenser

- **📅 Workshop-statusbanner**: Uppdaterad från "Under Construction" till aktiv workshop-status med datum februari 2026

- **🔗 Workshop-navigering**: Fixade brutna navigationslänkar i workshop README.md som pekade på icke-existerande lab-1-azd-basics-mapp

#### Ändrat
- **Workshop-presentation**: Tog bort varning om "under konstruktion", workshopen är nu komplett och redo för användning
- **Navigeringskonsistens**: Säkerställde korrekt inter-modulnavigering i alla workshopmoduler
- **Lärandestigreferenser**: Uppdaterade kapitelcrossreferenser för att använda korrekta microsoft-foundry-sökvägar

#### Validerat
- ✅ Alla engelska markdown-filer har giltiga interna länkar
- ✅ Workshop-moduler 0-7 är kompletta med lärandemål
- ✅ Navigeringen mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehållna genomgående
- ✅ CONTRIBUTING.md ger tydliga riktlinjer för community-bidragare

#### Teknisk implementation
- **Länkkontroll**: Automatiserat PowerShell-skript verifierade alla .md-internlänkar
- **Innehållsgranskning**: Manuell genomgång av workshopens fullständighet och nybörjarvänlighet
- **Navigeringssystem**: Konsekventa navigeringsmönster för kapitel och moduler tillämpade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast på engelsk dokumentation
- **Översättningar**: Översättningsmappar har inte uppdaterats i denna version (automatiserad översättning synkas senare)
- **Workshoplängd**: Komplett workshop ger nu 3-4 timmars praktisk inlärning

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, säkerhet och multi-agentmönster
**Denna version lägger till omfattande A-klasslektioner om Application Insights-integration, autentiseringsmönster och multi-agent-koordinering för produktionsdriftsättningar.**

#### Tillagt
- **📊 Application Insights-integration lektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad driftsättning med automatisk provisionering
  - Kompletta Bicep-mallar för Application Insights + Log Analytics
  - Funktionella Python-applikationer med anpassad telemetri (över 1 200 rader)
  - AI/LLM-övervakningsmönster (Microsoft Foundry Models token/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriström)
  - 3 praktiska övningar (larm, dashboards, AI-övervakning)
  - Kusto-frågeexempel och kostnadsoptimeringsstrategier
  - Live-metrikströmmning och verklig felsökning
  - 40–50 minuters inlärningstid med produktionsanpassade mönster

- **🔐 Autentisering & säkerhetsmönster lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (anslutningssträngar, Key Vault, hanterad identitet)
  - Kompletta Bicep-infrastrukturmallar för säkra driftsättningar
  - Node.js applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera hanterad identitet, användartilldelad identitet, Key Vault-rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionssäkra mönster för lösenordslös autentisering

- **🤖 Multi-agent koordinationsmönster lektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmönster (sekventiell, parallell, hierarkisk, händelsestyrd, konsensus)
  - Komplett implementering av orkestratörtjänst (Python/Flask, över 1 500 rader)
  - 3 specialiserade agentimplementeringar (Research, Writer, Editor)
  - Service Bus-integration för meddelandeköning
  - Cosmos DB tillståndshantering för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logik, kretsbrytare)
  - Kostnadsuppdelning (240–565 USD/månad) med optimeringsstrategier
  - Application Insights-integration för övervakning

#### Förbättrat
- **Förhandsdriftsättningskapitel**: Inkluderar nu omfattande övervaknings- och koordinationsmönster
- **Kom igång-kapitel**: Förbättrat med professionella autentiseringsmönster
- **Produktionsberedskap**: Fullständig täckning från säkerhet till observerbarhet
- **Kursöversikt**: Uppdaterad för att referera till nya lektioner i kapitel 3 och 6

#### Ändrat
- **Lärandeprogression**: Bättre integration av säkerhet och övervakning genom hela kursen
- **Dokumentationskvalitet**: Konsekventa A-klass-standarder (95-97 %) i nya lektioner
- **Produktionsmönster**: Komplett end-to-end-täckning för företagsdriftsättningar

#### Förbättrat
- **Utvecklarupplevelse**: Klar väg från utveckling till produktionsövervakning
- **Säkerhetsstandarder**: Professionella mönster för autentisering och hantering av hemligheter
- **Observerbarhet**: Komplett Application Insights-integration med AZD
- **AI-arbetsbelastningar**: Specialiserad övervakning för Microsoft Foundry Models och multi-agent-system

#### Validerat
- ✅ Alla lektioner innehåller komplett fungerande kod (inte fragment)
- ✅ Mermaid-diagram för visuellt lärande (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsfärdiga Bicep-mallar som kan driftsättas via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Dokumentationsbetyg
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agent-arkitekturer
- **Totalt nytt innehåll**: - Konsekvent högkvalitativa standarder

#### Teknisk implementation
- **Application Insights**: Log Analytics + egen telemetri + distribuerad spårning
- **Autentisering**: Hanterad identitet + Key Vault + RBAC-mönster
- **Multi-agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Övervakning**: Live-metriker + Kusto-frågor + larm + dashboards
- **Kostnadshantering**: Utvalsstrategier, lagringspolicyer, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättringar av dokumentationskvalitet och nytt exempel på Microsoft Foundry Models
**Denna version förbättrar dokumentationskvaliteten över hela förvaret och lägger till ett komplett exempel på Microsoft Foundry Models driftsättning med gpt-4.1 chattgränssnitt.**

#### Tillagt
- **🤖 Microsoft Foundry Models chatt-exempel**: Komplett gpt-4.1 driftsättning med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 modell driftsättning)
  - Python kommandorads-chattgränssnitt med konversationshistorik
  - Key Vault-integration för säker API-nyckelhantering
  - Tokenanvändningsspårning och kostnadsuppskattning
  - Rate limiting och felhantering
  - Omfattande README med 35-45 minuters driftsättningsguide
  - 11 produktionsfärdiga filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lade till praktiska övningar i konfigurationsguiden:
  - Övning 1: Multi-miljö konfiguration (15 minuter)
  - Övning 2: Övning i hemlighetshantering (10 minuter)
  - Klara framgångskriterier och verifieringssteg
- **✅ Driftsättningsverifiering**: Lade till verifieringssektion i driftsättningsguiden:
  - Hälsokontroller
  - Framgångskriterielista
  - Förväntade utdata för alla driftsättningskommandon
  - Felsökningssnabbreferens

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-klass kvalitet (93 %):
  - Lade till azure-openai-chat i alla relevanta avsnitt
  - Uppdaterade antal lokala exempel från 3 till 4
  - Lade till i tabellen AI Application Examples
  - Integrerat i Quick Start för medelavancerade användare
  - Lade till i avsnittet Microsoft Foundry Templates
  - Uppdaterade jämförelsematris och teknikfinnavsnitt
- **Dokumentationskvalitet**: Förbättrad B+ (87%) → A- (92%) över docs-mappen:
  - Lade till förväntade utdata för kritiska kommandoexempel
  - Inkluderade verifieringssteg för konfigurationsändringar
  - Förstärkt praktiskt lärande med övningar

#### Ändrat
- **Lärandeprogression**: Bättre integration av AI-exempel för mellannivåelever
- **Dokumentationsstruktur**: Mer handlingsbara övningar med tydliga resultat
- **Verifieringsprocess**: Tydliga framgångskriterier tillagda i nyckelarbetsflöden

#### Förbättrat
- **Utvecklarupplevelse**: Utrullning av Microsoft Foundry Models tar nu 35-45 minuter (vs 60-90 för komplexa alternativ)
- **Kostnadstransparens**: Klara kostnadsestimat ($50-200/månad) för Microsoft Foundry Models-exemplet
- **Lärandeväg**: AI-utvecklare har tydlig startpunkt med azure-openai-chat
- **Dokumentationsstandarder**: Konsekventa förväntade utdata och verifieringssteg

#### Validerat
- ✅ Microsoft Foundry Models-exempel fullständigt funktionellt med `azd up`
- ✅ Alla 11 implementationsfiler syntaktiskt korrekta
- ✅ README-instruktioner stämmer överens med faktisk driftsättningserfarenhet
- ✅ Dokumentationslänkar uppdaterade på 8+ platser
- ✅ Exempelindex exakt återger 4 lokala exempel
- ✅ Inga dubbletter av externa länkar i tabeller
- ✅ Alla navigeringsreferenser korrekta

#### Teknisk Implementering
- **Microsoft Foundry Models-Arkitektur**: gpt-4.1 + Key Vault + Container Apps-mönster
- **Säkerhet**: Managed Identity redo, hemligheter i Key Vault
- **Övervakning**: Application Insights-integration
- **Kostnadshantering**: Token-uppföljning och användningsoptimering
- **Driftsättning**: Enkel `azd up`-kommando för komplett konfiguration

### [v3.6.0] - 2025-11-19

#### Större Uppdatering: Exempel på driftsättning av Container App
**Denna version introducerar omfattande, produktionsklara exempel för containerapplikationsdriftsättning med Azure Developer CLI (AZD), komplett dokumentation och integrering i lärandevägen.**

#### Tillagt
- **🚀 Container App Exempel**: Nya lokala exempel i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett översikt av containeriserade driftsättningar, snabbstart, produktion och avancerade mönster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybörjarvänlig REST-API med scale-to-zero, hälsoprov, övervakning och felsökning
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsklar multi-tjänst driftsättning (API Gateway, Product, Order, User, Notification), asynkron meddelandehantering, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blue-green/canary deployment
- **Bästa Praxis**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-guidning för containeriserade arbetsbelastningar
- **Kodexempel**: Kompletta `azure.yaml`, Bicep-mallar och tjänstimplementationer i flera språk (Python, Node.js, C#, Go)
- **Testning & Felsökning**: Slut-till-slut-testscenarier, övervakningskommandon, felsökningsvägledning

#### Ändrat
- **README.md**: Uppdaterad för att presentera och länka nya containerappsexempel under "Lokala Exempel - Containerapplikationer"
- **examples/README.md**: Uppdaterad för att lyfta fram containerappsexempel, lägga till jämförelsematris-poster och uppdatera teknik-/arkitekturreferenser
- **Kursöversikt & Studievägledning**: Uppdaterad för att referera nya containerappsexempel och driftsättningsmönster i relevanta kapitel

#### Validerat
- ✅ Alla nya exempel kan driftsättas med `azd up` och följer bästa praxis
- ✅ Dokumentations korslänkar och navigation uppdaterade
- ✅ Exempel täcker scenarier från nybörjare till avancerad, inklusive produktionsmikrotjänster

#### Noteringar
- **Omfattning**: Endast engelsk dokumentation och exempel
- **Nästa Steg**: Utöka med fler avancerade containermönster och CI/CD-automatisering i framtida versioner

### [v3.5.0] - 2025-11-19

#### Produktombeteckning: Microsoft Foundry
**Denna version genomför en omfattande namnändring av produkten från "Microsoft Foundry" till "Microsoft Foundry" i all engelsk dokumentation, vilket speglar Microsofts officiella ombeteckning.**

#### Ändrat
- **🔄 Produktnamnsuppdatering**: Fullständig ombeteckning från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i engelsk dokumentation i `docs/`-mappen
  - Omdöpt mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdöpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade i 7 dokumentationsfiler

- **📁 Mappstrukturändringar**:
  - `docs/ai-foundry/` döpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att spegla nya mappstrukturen
  - Navigeringslänkar validerade i all dokumentation

- **📄 Filomdöpningar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera nya filnamn

#### Uppdaterade filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeringslänkuppdateringar
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Använder redan Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitelnavigeringslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa kapitel-länkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigation, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigeringslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigeringslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapiteltitlar, mallavsnitt, community-insikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitelresurser)

#### Validerat
- ✅ Inga kvarvarande "ai-foundry"-mappvägsreferenser i engelska docs
- ✅ Inga kvarvarande produktnamnsreferenser "Microsoft Foundry" i engelska docs
- ✅ Alla navigeringslänkar fungerar med den nya mappstrukturen
- ✅ Fil- och mappomdöpningar genomförda framgångsrikt
- ✅ Korsreferenser mellan kapitel validerade

#### Noteringar
- **Omfattning**: Ändringar tillämpade endast på engelsk dokumentation i `docs/`-mappen
- **Översättningar**: Översättningsmappar (`translations/`) uppdateras inte i denna version
- **Workshop**: Workshopmaterial (`workshop/`) ej uppdaterade i denna version
- **Exempel**: Exempelfiler kan fortfarande referera till äldre namngivning (kommer åtgärdas i framtida uppdatering)
- **Externa länkar**: Externa URL:er och GitHub-repositorie-referenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala grenar eller dokumentation som refererar den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ersätt produktnamn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validera att alla interna dokumentationslänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förhandsgranskning av infrastruktur och förbättrad validering
**Denna version introducerar omfattande stöd för den nya förhandsgranskningsfunktionen i Azure Developer CLI och förbättrar användarupplevelsen för workshopdeltagare.**

#### Tillagt
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattande täckning av ny infrastrukturförhandsgranskningsfunktion
  - Kommando-referens och användningsexempel i fuskblad
  - Detaljerad integrering i provisionsguiden med användningsfall och fördelar
  - Pre-flight-check-integrering för säkrare validering av driftsättningen
  - Uppdateringar i Kom Igång-guiden med säkerhetsfokuserade driftsättningspraxis
- **🚧 Workshop Status Banner**: Professionell HTML-banner som visar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Senaste uppdaterings-tidsstämpel för transparens
  - Mobilanpassad design för alla enhetstyper

#### Förbättrat
- **Infrastrukturssäkerhet**: Förhandsgranskningsfunktion integrerad i hela driftsättningsdokumentationen
- **Pre-driftsättningsvalidering**: Automatiserade skript inkluderar nu test av infrastrukturförhandsgranskning
- **Utvecklararbetsflöde**: Uppdaterade kommando-sekvenser som inkluderar förhandsgranskning som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar för användare om innehållets utvecklingsstatus

#### Ändrat
- **Driftsättningsbästa praxis**: Preview-först arbetsflöde nu rekommenderat tillvägagångssätt
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i lärandeprocessen
- **Workshoppresentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättrat
- **Säkerhetsfokus**: Infrastrukturförändringar kan nu valideras före driftsättning
- **Samarbete i team**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader före provisionering
- **Riskminimering**: Minskade driftsättningsfel genom förhandsvalidering

#### Teknisk Implementering
- **Integration i flera dokument**: Förhandsgranskningsfunktion dokumenterad över 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel i hela dokumentationen
- **Bästa praxis-integration**: Förhandsgranskning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NYA funktionsmarkeringar för upptäckbarhet

#### Workshop-infrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradient-stil
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Bibehåller repo:trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Oktober 2025 senast uppdaterad-tidsstämpel för ansvarstagande

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktivt lärande
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärandevägar.**

#### Tillagt
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs preview-funktion
- **📝 Strukturerade workshop-instruktioner**: 7-stegs guidad lärandeväg från upptäckt till anpassning
  - 0-Introduktion: Workshop-översikt och installation
  - 1-Välj-AI-mall: Mallupptäckt och valprocess
  - 2-Validera-AI-mall: Driftsättning och valideringsprocedurer
  - 3-Dekonstruera-AI-mall: Förstå mallens arkitektur
  - 4-Konfigurera-AI-mall: Konfiguration och anpassning
  - 5-Anpassa-AI-mall: Avancerade modifieringar och iterationer
  - 6-Nedmontera-infrastruktur: Rensning och resursförvaltning
  - 7-Avslut: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad lärandeupplevelse
- **🎯 Praktisk lärandeväg**: 3-stegs metodologi (Upptäckt → Driftsättning → Anpassning)
- **📱 GitHub Codespaces-integration**: Sömlös utvecklingsmiljöuppsättning

#### Förbättrat
- **AI Workshop Lab**: Utökad med omfattande 2-3 timmars strukturerad lärandeupplevelse
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Lärandeprogression**: Tydliga steg-för-steg-instruktioner från mallval till produktionsdriftsättning
- **Utvecklarupplevelse**: Integrerade verktyg för effektiva utvecklingsarbetsflöden

#### Förbättrat
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sökfunktion, kopieringsfunktionalitet och temabyte
- **Självstyrt lärande**: Flexibel workshopstruktur som passar olika lärandehastigheter
- **Praktisk tillämpning**: Verkliga AI-mall-driftsättningsscenarier
- **Communityintegration**: Discordintegration för workshopsupport och samarbete

#### Workshopfunktioner
- **Inbyggd sökfunktion**: Snabb sökning av nyckelord och lektioner
- **Kopiera kodblock**: Hover-to-copy-funktion för alla kodexempel
- **Temabyte**: Mörkt/ljust läge stöd för olika preferenser
- **Visuella tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt Discord-åtkomst för community-support

### [v3.2.0] - 2025-09-17

#### Större navigeringsomstrukturering och kapitelbaserat lärandesystem
**Denna version introducerar en omfattande kapitelbaserad lärandestruktur med förbättrad navigation genom hela repot.**

#### Tillagt
- **📚 Kapitelbaserat lärandesystem**: Omstrukturerade hela kursen till 8 progressiva lärandekapitel
  - Kapitel 1: Grundläggande & Snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-Först Utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som Kod & Driftsättning (⭐⭐⭐ - 1-1.5 timmar)
  - Kapitel 5: Multi-Agent AI-lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Förvalidering & Planering (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1-1.5 timmar)
  - Kapitel 8: Produktions- & Företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigationssystem**: Konsekventa navigeringshuvuden och fötter i all dokumentation
- **🎯 Framstegsspårning**: Kursavslutschecklista och lärandeverifieringssystem
- **🗺️ Lärandevägledning**: Tydliga inträdespunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigation**: Relaterade kapitel och förkunskaper tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlat till en strukturerad lärandeplattform med kapitelbaserad organisation
- **Dokumentationsnavigation**: Varje sida inkluderar nu kapitelkontext och progressionsvägledning
- **Mallorganisation**: Exempel och mallar kartlagda till lämpliga lärandekapitel
- **Resursintegration**: Fuskblad, FAQs och studievägledningar kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labb kopplade till flera lärandemål i kapitel

#### Ändrat
- **Lärandeprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Omplacerat konfigurationsguiden som Kapitel 3 för bättre inlärningsflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela läranderesan
- **Produktioninnehåll**: Avancerade mönster sammanställda i Kapitel 8 för företagsinriktade studenter

#### Förbättrat
- **Användarupplevelse**: Tydlig navigeringsbrödsmulor och kapitelprogressionsindikatorer
- **Tillgänglighet**: Konsekventa navigeringsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Lärandeeffektivitet**: Minskat tid för att hitta relevant innehåll genom förbättrad organisation

#### Teknisk implementering
- **Navigeringshuvuden**: Standardiserad kapitelnavigering över 40+ dokumentationsfiler
- **Sidfotsnavigering**: Konsekvent vägledning för progression och kapitelavslutsindikatorer
- **Korskopplingar**: Omfattande internt länkande system kopplar samman relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättring av studieguiden
- **📚 Omfattande lärandemål**: Omskriven studieguiden för att alignera med 8-kapitelsystem
- **🎯 Kapitelbaserad bedömning**: Varje kapitel inkluderar specifika lärandemål och praktiska övningar
- **📋 Framstegsuppföljning**: Veckovis lärandeschema med mätbara resultat och avslutningschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska övningar**: Praktiska aktiviteter med verkliga driftsättningsscenarier och felsökning
- **📊 Kompetensutveckling**: Tydlig framåtskridning från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och community-erkännandesystem
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors lärandeplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar multi-agent detaljhandelslösningen med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatt "Cora agent" med "Customer agent" i hela detaljhandels multi-agent lösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterat all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Customer agent"-namn
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namnkonventioner
- **Dokumentationskonsistens**: Säkerställt att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM Mallpaket**: Uppdaterat retail-multiagent-arm-template med referenser till Customer agent
- **Arkitekturscheman**: Uppdaterade Mermaid-diagram med uppdaterad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu CustomerAgent-namn
- **Miljövariabler**: Uppdaterade alla driftsättningsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrat
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Lärmaterial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallanvändbarhet**: Förenklad förståelse av agentfunktioner och driftsättningsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturscheman med CustomerAgent-referenser
- Ersatte CoraAgent-klassnamn med CustomerAgent i Python-exempel
- Modifierade ARM-mallens JSON-konfigurationer för att använda "customer" agent-typ
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Uppdaterade alla driftsättningskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - AI-utvecklarfokus och Microsoft Foundry-integration
**Denna version förvandlar arkivet till en komplett AI-fokuserad läranderesurs med Microsoft Foundry-integration.**

#### Tillagt
- **🤖 AI-Första Lärandestigen**: Komplett omstrukturering som prioriterar AI-utvecklare och ingenjörer
- **Microsoft Foundry Integrationsguide**: Omfattande dokumentation för koppling av AZD med Microsoft Foundry-tjänster
- **AI Modell Driftsättningsmönster**: Detaljerad guide som täcker modellval, konfiguration och produktionsstrategier
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för omvandling av AI-applikationer till AZD-driftsättningslösningar
- **AI Produktionsbästa Praxis**: Företagsklara mönster för skalning, övervakning och säkerställande av AI-arbetsbelastningar
- **AI-Specifik Felsökningsguide**: Omfattande felsökning för Microsoft Foundry-modeller, Cognitive Services och AI-driftsättningsproblem
- **AI Mallgalleri**: Utvalda Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshop-material**: Komplett workshopstruktur med praktiska labbar och referensmaterial

#### Förbättrat
- **README Struktur**: AI-utvecklarfokuserad med 45% communityintresse-data från Microsoft Foundry Discord
- **Lärandestigar**: Dedikerad AI-utvecklarresa parallellt med traditionella vägar för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Communityintegration**: Förbättrat Discord-communitystöd med AI-specifika kanaler och diskussioner

#### Säkerhet & Produktionsfokus
- **Hantera Identitetsmönster**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Övervakning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-region Driftsättning**: Strategier för global AI-applikationsdriftsättning
- **Prestandaövervakning**: AI-specifika mått och Application Insights-integration

#### Dokumentationskvalitet
- **Linjär Kursstruktur**: Logisk progression från nybörjare till avancerade AI-driftsättningsmönster
- **Validerade URL:er**: Alla externa arkivlänkar verifierade och tillgängliga
- **Fullständig Referens**: Alla interna dokumentationslänkar validerade och fungerande
- **Produktionsklara**: Företagsdriftsättningsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Arkivomstrukturering och professionell förbättring
**Denna version representerar en betydande omarbetning av arkivets struktur och innehållspresentation.**

#### Tillagt
- **Strukturerat Läranderamverk**: Alla dokumentationssidor inkluderar nu Introduktion, Lärandemål och Läranderesultat
- **Navigationssystem**: Tillagd Föregående/Nästa lektion-länkar i all dokumentation för vägledd lärandeprogression
- **Studieguid**: Omfattande study-guide.md med lärandemål, övningar och bedömningsmaterial
- **Professionell Presentation**: Borttagna alla emoji-ikoner för förbättrad tillgänglighet och professionellt utseende
- **Förbättrad Innehållsstruktur**: Förbättrad organisation och flöde av lärmaterial

#### Ändrat
- **Dokumentationsformat**: Standardiserade all dokumentation med konsekvent lärandefokuserad struktur
- **Navigationsflöde**: Implementerad logisk progression genom allt lärandeinnehåll
- **Innehållspresentation**: Borttagna dekorativa element till förmån för klar, professionell formatering
- **Länkstruktur**: Uppdaterat alla interna länkar för att stödja nytt navigationssystem

#### Förbättrat
- **Tillgänglighet**: Borttagna emoji-beroenden för bättre skärmläsarkompatibilitet
- **Professionellt utseende**: Ren, akademisk stil presentation lämplig för företagsinlärning
- **Lärandeupplevelse**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första släpp - Omfattande AZD-lärararkiv

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett guide för att komma igång-serie
  - Omfattande dokumentation för driftsättning och provisioning
  - Detaljerade felsökningsresurser och debugguider
  - Verktyg och procedurer för validering före driftsättning

- **Kom igång-modul**
  - AZD-grunder: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställning och autentisering
  - Första projekt tutorial: Steg-för-steg praktisk inlärning

- **Driftsättnings- och provisioneringsmodul**
  - Driftsättningsguide: Komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som kod med Bicep
  - Bästa praxis för produktionsdriftsättningar
  - Multi-tjänst arkitekturmönster

- **Validering före driftsättningsmodul**
  - Kapacitetsplanering: Validering av Azure-resurstillgänglighet
  - SKU-val: Omfattande vägledning för servicenivåer
  - Pre-flight kontroller: Automatiska valideringsskript (PowerShell och Bash)
  - Kostnadsuppskattning och budgetplaneringsverktyg

- **Felsökningsmodul**
  - Vanliga problem: Vanligt förekommande problem och lösningar
  - Debuggguide: Systematiska felsökningsmetoder
  - Avancerade diagnostiktekniker och verktyg
  - Prestandaövervakning och optimering

- **Resurser och referenser**
  - Kommandocheatsheet: Snabbreferens för väsentliga kommandon
  - Ordlista: Omfattande terminologi- och akronymdefinitioner
  - FAQ: Detaljerade svar på vanliga frågor
  - Externa resurser och communitykopplingar

- **Exempel och mallar**
  - Enkelt webbapplikationsexempel
  - Mall för statisk webbplatsdriftsättning
  - Containerapplikationskonfiguration
  - Databasintegrationsmönster
  - Exempel på mikroservicesarkitektur
  - Serverless funktionsimplementeringar

#### Funktioner
- **Multi-plattformsstöd**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera kompetensnivåer**: Innehåll designat för studenter till professionella utvecklare
- **Praktiskt fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus**: Säkerhetsbästa praxis integrerad genomgående
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva driftsättningar och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg instruktioner**: Klara, handlingsbara vägledningar
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Integrering av bästa praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med senaste Azure-tjänster och azd-funktioner

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### AI-Plattsformsutvidgning
- **Multi-modellstöd**: Integrationsmönster för Hugging Face, Azure Machine Learning och egna modeller
- **AI Agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-driftsättningar
- **Avancerade RAG-mönster**: Vektor databasalternativ utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observabilitet**: Förbättrad övervakning för modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Tillägg**: Integrerad AZD + Microsoft Foundry-utvecklarupplevelse
- **GitHub Copilot Integration**: AI-assisterad AZD-mallgenerering
- **Interaktiva handledningar**: Praktiska kodövningar med automatisk validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella lärande med fokus på AI-driftsättningar

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Styrningsramverk**: AI-modellstyrning, regelefterlevnad och revisionsspår
- **Multi-tenant AI**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-driftsättning**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln AI**: Multi-moln och hybriddriftsättningsmönster för AI-arbetsbelastningar

#### Avancerade funktioner
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning pipelines
- **Avancerad säkerhet**: Zero-trust-mönster, privata endpoints och avancerat skydd mot hot
- **Prestandaoptimering**: Avancerade finjusterings- och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global distribution**: Innehållsleverans och edge-cachningsmönster för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av aktuell release
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande Microsoft Foundry-integration (Slutförd)
- ✅ **Interaktiva handledningar**: Praktisk AI-workshop lab (Slutförd)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutförd)
- ✅ **Prestandaoptimering**: AI-arbetsbelastningsjusteringsstrategier (Slutförd)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Vissa slutförda i aktuell release
- ✅ **Ytterligare exempel**: AI-fokuserade driftsättningsscenarier (Slutförd)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutförd)
- **Verktygsintegration**: Förbättrade IDE- och editorintegrationsguider
- ✅ **Övervakningsexpansion**: AI-specifika övervaknings- och varningsmönster (Slutförd)

#### Fortfarande planerad för framtida release
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community Dashboard**: Realtidscommunity-mått och bidragsspårning

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta arkiv, vänligen säkerställ att ändringsloggsinträden inkluderar:

1. **Versionsnummer**: Följande semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet YYYY-MM-DD
3. **Kategori**: Tillagt, Ändrat, Föråldrat, Borttaget, Fixat, Säkerhet
4. **Tydlig beskrivning**: Koncis beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Tillagt
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller hjälpmedel

#### Ändrat
- Ändringar i befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omsorg av innehållsstruktur eller organisation

#### Föråldrat
- Funktioner eller metoder som fasas ut
- Dokumentationssektioner schemalagda för borttagning
- Metoder som har bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller metoder
- Redundant eller sammanförd innehåll

#### Fixat
- Rättningar av fel i dokumentation eller kod
- Lösningar på rapporterade problem eller buggar
- Förbättringar i noggrannhet eller funktionalitet

#### Säkerhet
- Säkerhetsrelaterade förbättringar eller fixar
- Uppdateringar av säkerhetsbästa praxis
- Åtgärder av säkerhetshål

### Riktlinjer för semantisk versionering

#### Stor version (X.0.0)
- Brytande förändringar som kräver användaråtgärd
- Betydande omstrukturering av innehåll eller organisation
- Förändringar som ändrar den grundläggande metoden eller tillvägagångssättet

#### Mindre version (X.Y.0)
- Nya funktioner eller tillägg av innehåll
- Förbättringar som upprätthåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Gemenskapsfeedback och förslag

Vi uppmuntrar aktivt gemenskapsfeedback för att förbättra denna lärresurs:

### Hur du lämnar feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Discord Discussions**: Dela idéer och engagera dig med Microsoft Foundry-gemenskapen
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community Forums**: Delta i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI-innehållnoggrannhet**: Korrigeringar av AI-tjänsteintegration och distributionsinformation
- **Lärandeupplevelse**: Förslag för förbättrat AI-utvecklarflöde
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika lärandebehov
- **AI-verktygsintegration**: Förslag för bättre integrering i AI-utvecklingsflöden
- **ProduktionsAI-mönster**: Företagsförfrågningar om AI-distributionsmönster

### Åtagande för svar
- **Problembesvarande**: Inom 48 timmar för rapporterade problem
- **Funktionsförfrågningar**: Utvärdering inom en vecka
- **Gemenskapsbidrag**: Granskning inom en vecka
- **Säkerhetsproblem**: Omedelbar prioritet med snabb hantering

## Underhållsschema

### Regelbundna uppdateringar
- **Månadsvisa genomgångar**: Innehållsnoggrannhet och länkvalidering
- **Kvartalsvisa uppdateringar**: Större innehållstillägg och förbättringar
- **Halvårsvisa genomgångar**: Omfattande omstrukturering och förbättringar
- **Årliga releaser**: Stora versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetssäkring
- **Automatiserade tester**: Regelbunden validering av kodexempel och länkar
- **Integrering av gemenskapsfeedback**: Regelbunden införlivning av användarförslag
- **Teknikuppdateringar**: Anpassning till senaste Azure-tjänsterna och azd-releaser
- **Tillgänglighetsgranskningar**: Regelbunden översyn av inkluderande designprinciper

## Supportpolicy för versioner

### Support för aktuell version
- **Senaste stora versionen**: Full support med regelbundna uppdateringar
- **Föregående stora version**: Säkerhetsuppdateringar och kritiska fixar i 12 månader
- **Äldre versioner**: Endast gemenskapsstöd, inga officiella uppdateringar

### Migreringsvägledning
När stora versioner släpps tillhandahåller vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsanteckningar**: Information om brytande förändringar
- **Verktygsstöd**: Script eller verktyg som assisterar migrering
- **Gemenskapsstöd**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående lektion**: [Studieguide](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Huvud-README](README.md)

**Håll dig uppdaterad**: Bevaka detta arkiv för notifikationer om nya releaser och viktiga uppdateringar av lärmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->