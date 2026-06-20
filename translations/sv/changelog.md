# Ändringslogg - AZD för nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande ändringar, uppdateringar och förbättringar i AZD For Beginners-förvaret. Vi följer semantiska versionsprinciper och underhåller denna logg för att hjälpa användare förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av läromaterialet över tid

## Läranderesultat

Efter att ha gått igenom ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser som finns tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din inlärningsväg baserat på det mest aktuella materialet
- Bidra med återkoppling och förslag för framtida förbättringar

## Versionshistorik

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Denna version åtgärdar de återstående mellanliggande luckorna som identifierades av azd-coverage-analysen: hur man skapar och publicerar sin egen mall, reproducerbara dev-container/Codespaces-miljöer, Pulumi-infrastrukturleverantören, en Azure DevOps CI/CD-genomgång, service-principal-autentisering, vägledning för värdval (AKS/Spring Apps), `azd restore`/`azd package`-förklaringar, hook-felhantering och team-/delade-miljöprinciper.**

#### Lagt till
- **🧱 Ny kapitel 4-lektion** `docs/chapter-04-infrastructure/custom-templates.md` — skapande av din egen azd-mall: nödvändig struktur (`azure.yaml`, `infra/`, `src/`), fältet `metadata.template`, parameterisering av infrastrukturen med `uniqueString()` resurstoken och taggen `azd-env-name`, testning lokalt med `azd init --template <local-path>`, publicering till GitHub och inskickning till Awesome AZD-galleriet
- **📦 Ny kapitel 1-lektion** `docs/chapter-01-foundation/dev-containers.md` — reproducerbara azd-miljöer med Dev Containers och GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` som använder den officiella `ghcr.io/azure/azure-dev/azd`-feature:n, språk-specifika features, `docker-in-docker` för container-hosts, och `azd auth login --use-device-code` för fjärrinloggning
- **🧩 Pulumi med azd** avsnitt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-mappstruktur, stacks mappade till azd-miljöer, obligatoriska outputs/taggning, och samma `azd up` / `azd down`-arbetsflöde
- **🎯 Vägledning för värdval** i `docs/chapter-04-infrastructure/provisioning.md` — en nybörjarvänlig jämförelse av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` och `springapp`, med råd om när man ska välja AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD-genomgång** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection med workload identity federation (OIDC), den genererade `azure-dev.yml`, och inställning av variable-groups
- **🔑 Service Principals (Pattern 4)** tillagt i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, icke-interaktiv `azd auth login` med client secret vs. federerade/OIDC-referenser, när man ska använda dem och säker lagring av autentiseringsuppgifter
- **🪝 Hook-felhantering** underavsnitt i `docs/chapter-04-infrastructure/deployment-guide.md` — avslutningskoder och `set -e`, `continueOnError`, testa hooks isolerat med `azd hooks run`, OS-specifika skal och `--debug`
- **👥 Team / delade miljöer** avsnitt i `docs/chapter-03-configuration/configuration.md` — vad som lever i `.azure/`, vad som bör läggas i gitignore, per-utvecklare-miljöer, `azd env list`/`select`, och hur man tillhandahåller miljövärden i CI/CD
- **🧰 `azd restore` och utökade `azd package`-förklaringar** i `resources/cheat-sheet.md` — återställa beroenden och bygga ett deploybart artefakt utan att faktiskt distribuera

#### Ändrat
- **🧭 Kapitel 4 lektionsöversikt** uppdaterad för att inkludera den nya lektionen "Skapa din egen mall" (Lektion 3)
- **🧭 Kapitel 1 lektionsöversikt** uppdaterad för att inkludera den nya lektionen "Dev Containers & Codespaces" (Lektion 5); navigationsfötter kopplade mellan `bring-your-own-app.md` och `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Denna version åtgärdar de största luckorna för en komplett nybörjarguide genom att lägga till två nya handgripliga lektioner (en deploybar multi-agent-genomgång och att lägga till azd i en befintlig app), en nybörjarvänlig introduktion till hooks, ett Terraform-med-azd-avsnitt, en steg-för-steg GitHub Actions-pipelinegenomgång, en förklaring av de nya preview-tilläggen och en explicit checklista för verifiering av distribution.**

#### Lagt till
- **🤝 Ny kapitel 5-lektion** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en helt handgriplig, deploybar två-agenters genomgång (orchestrator + specialists) som använder en riktig mall (`contoso-creative-writer`), täcker när man ska använda multi-agent, `azd up`-arbetsflödet, förståelse för de distribuerade resurserna, spårning mellan agenter, anpassning och städning
- **📦 Ny kapitel 1-lektion** `docs/chapter-01-foundation/bring-your-own-app.md` — hur man lägger till azd i ett befintligt projekt med `azd init` ("use code in the current directory"), förstå `azure.yaml` och `infra/`, `azd infra generate`, host-detektion och distribution med `azd up`
- **🌐 Terraform med azd** avsnitt tillagt i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform`-konfiguration, `.tf`-mappstruktur, obligatoriska `AZURE_*`-outputs och `azd-env-name`-taggning, och samma `azd up` / `azd down`-arbetsflöde (åtgärdar gap: tidigare nämnd Terraform-stöd visades inte)
- **⚙️ Steg-för-steg GitHub Actions-genomgång** i `docs/chapter-08-production/production-ai-practices.md` — från GitHub-repo till automatiska distributioner: `azd pipeline config`, OIDC-federerade referenser (inga lagrade hemligheter), den genererade `azure-dev.yml`, och vägledning kring secrets vs variables
- **🪝 Nybörjarintroduktion "New to hooks?"** i `docs/chapter-04-infrastructure/deployment-guide.md` — vad en hook är, en hook-stadie-tabell, en minimal första hook, och köra hooks manuellt med `azd hooks run`
- **✅ "Verify Your Deployment"-checklista** tillagd i Steg 5 i `docs/chapter-01-foundation/first-project.md` — röktest, kontroll av hälso-endpoint och explicita framgångskriterier
- **🧩 Förklaring av nya preview-tillägg** `azure.ai.skills` och `azure.ai.connections` (vad de är och när man kan använda dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ändrat
- **🧭 Kapitel 5 lektionsöversikt** korrigerad: `multi-agent-basics.md` är nu Lektion 1 (den enda helt handgripliga lektionen), med ärlig märkning att Lektion 2 finns i Kapitel 6 och att Retail-scenariot är en arkitekturblueprint, inte en en-kommando-mall
- **🧭 Kapitel 1 lektionsöversikt** inkluderar nu den nya lektionen "Ta med din egen app" (Lektion 4)
- **🔗 Navigationsfötter** uppdaterade: `first-project.md` länkar nu vidare till `bring-your-own-app.md`

#### Åtgärdat
- **🧱 Stängde den "påstådda men saknade" Terraform-luckan** — kursen refererade tidigare Terraform-stöd utan att visa det
- **🔀 Rättade vilseledande kapitel 5-korslänkar** som antydde att en fullständig multi-agent-implementation fanns när det endast var en arkitekturblueprint

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

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Denna version validerar kursen mot `azd` `1.25.6` (juni 2026) och `azure.ai.agents` `0.1.40-preview`-tillägget, utökar AI-vägledningen från "scaffold an agent" till den kompletta agentlivscykeln (test → utvärdera → optimera → inspektera → ta bort), exponerar de nya preview-tilläggen `azure.ai.skills` och `azure.ai.connections`, och noterar ".NET Aspire" → "Aspire" produktrebrandingen.**

#### Lagt till
- **🔁 Full täckning av agentens livscykel** för nybörjare och AI-ingenjörer i dokumentationen:
  - `docs/chapter-01-foundation/azd-basics.md` — livscykeltabell (scaffold → test → measure → improve → inspect → clean up) tillagd i Extensions and AI Commands-avsnittet
  - `docs/chapter-08-production/production-ai-practices.md` — nytt avsnitt "Managing the Agent Lifecycle" som täcker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, och `delete --force`
  - `resources/cheat-sheet.md` — utökade AI Agent Commands med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, och `delete --force`
- **🧩 Nya preview-tillägg dokumenterade:** `azure.ai.skills` (återanvändbara agent-skills) och `azure.ai.connections` (Foundry-anslutningar) tillagda i tilläggstabellen och fusklappen
- **⏱️ Riktlinjer för svarstider** — `azd ai agent invoke`-exempel noterar nu att den skriver ut total latens och time-to-first-byte
- **📌 Versionsbanner** i root-README:n som pekar lärande till `azd version` och `azd upgrade`

#### Ändrat
- **✅ Valideringsbaslinje uppdaterad** från `azd 1.23.12` (mars 2026) till `azd 1.25.6` (juni 2026) i alla kapitel-README:er och workshop-dokumentationen
- **🤖 Kapitel 2-tilläggsnotis** uppdaterad från `azure.ai.agents` `0.1.18-preview` till `0.1.40-preview`
- **🧪 Workshop-valideringsexempel** (`azd version`-utdata) uppdaterad till `1.25.6`
- **🧭 README "What's New in azd Today"** uppdaterad för att lyfta fram end-to-end agentlivscykeln, nya AI-tillägg och senaste kvalitetsförbättringar (`azd init` idempotens, `azd auth login` rensning av inaktuella token, `azd tool` första-körningsprompt)
- **📖 Kapitel 2 agents.md (Option 4)** pekar nu lärande till post-deploy livscykelkommandon istället för att stoppa vid `azd up`

#### Fixat
- **🏷️ Produktnamn** — lade till en notis om Aspire-rebrand (".NET Aspire" heter nu helt enkelt "Aspire"); azd:s Aspire-stöd är oförändrat
- **🔎 Live release-validering** bekräftad mot Azure Developer CLI releasefeed: stabil CLI `1.25.6` (2026-06-12) och `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
#### Förtydligande för nybörjaronboarding, validering av uppsättning & slutlig städning av AZD-kommandon
**Den här versionen följer upp valideringsgenomsökningen för AZD 1.23 med en dokumentationsgenomgång med fokus på nybörjare: den förtydligar AZD-först autentiseringsvägledning, lägger till lokala skript för validering av uppsättningen, verifierar nyckelkommandon mot den live AZD CLI:n och tar bort de sista inaktuella engelskspråkiga kommandoreferenserna utanför ändringsloggen.**

#### Lagt till
- **🧪 Valideringsskript för nybörjare** med `validate-setup.ps1` och `validate-setup.sh` så att deltagare kan bekräfta att nödvändiga verktyg finns innan de börjar Kapitel 1
- **✅ Förhandsvalideringssteg för uppsättning** i root README och Kapitel 1 README så att saknade förutsättningar fångas innan `azd up`

#### Ändrat
- **🔐 Autentiseringsvägledning för nybörjare** behandlar nu konsekvent `azd auth login` som huvudvägen för AZD-arbetsflöden, där `az login` anges som valfritt om inte Azure CLI-kommandon används direkt
- **📚 Kapitel 1:s onboardingflöde** uppmanar nu deltagarna att validera sin lokala uppsättning innan installation, autentisering och första deploy-steg
- **🛠️ Validator-meddelanden** separerar nu tydligt blockerande krav från valfria Azure CLI-varningar för AZD-endast nybörjarväg
- **📖 Konfigurations-, felsöknings- och exempel-dokument** skiljer nu mellan krävd AZD-autentisering och valfri Azure CLI-inloggning där båda tidigare presenterades utan kontext

#### Åtgärdat
- **📋 Återstående kommandoreferenser från engelskkällan** uppdaterade till aktuella AZD-former, inklusive `azd config show` i fusklappen och `azd monitor --overview` där översiktlig vägledning från Azure-portalen var avsedd
- **🧭 Nybörjarpåståenden i Kapitel 1** tonades ner för att undvika att lova garanterat felfritt eller återställningsbeteende över alla mallar och Azure-resurser
- **🔎 Live CLI-validering** bekräftade nuvarande stöd för `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` och `azd down --force --purge`

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

#### Validering av AZD 1.23.12, utökning av workshop-miljöer & uppdatering av AI-modeller
**Den här versionen genomför en dokumentationsvalidering mot `azd` `1.23.12`, uppdaterar föråldrade AZD-kommandoexempel, uppdaterar AI-modellvägledning till nuvarande standarder och breddar workshopinstruktionerna bortom GitHub Codespaces för att också stödja dev-containers och lokala kloner.**

#### Lagt till
- **✅ Valideringsanteckningar i kärnkapitel och workshop-dokument** för att göra den testade AZD-baslinjen tydlig för deltagare som använder nyare eller äldre CLI-builds
- **⏱️ Råd om timeout för distribution** för långkörande AI-app-distributioner med `azd deploy --timeout 1800`
- **🔎 Steg för att inspektera extensioner** med `azd extension show azure.ai.agents` i AI-arbetsflödesdokumenten
- **🌐 Bredare vägledning för workshopmiljöer** som täcker GitHub Codespaces, dev-containers och lokala kloner med MkDocs

#### Ändrat
- **📚 Kapitelintro-READMEs** nämner nu konsekvent validering mot `azd 1.23.12` över foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting och production-avsnitten
- **🛠️ AZD-kommandoreferenser** uppdaterade till aktuella former i dokumenten:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview is intended
- **🧪 Exempel på provision-preview** förenklade till nu supportad användning såsom `azd provision --preview` och `azd provision --preview -e production`
- **🧭 Workshopflödet** uppdaterades så att deltagare kan genomföra labben i Codespaces, en dev-container eller en lokal klon istället för att anta att endast Codespaces används
- **🔐 Autentiseringsvägledning** föredrar nu `azd auth login` för AZD-arbetsflöden, medan `az login` anges som valfritt när Azure CLI-kommandon används direkt

#### Åtgärdat
- **🪟 Windows-installationskommandon** normaliserades till aktuell `winget`-paketcasing i installationsguiden
- **🐧 Linux-installationsvägledning** korrigerades för att undvika icke-stödda distribution-specifika `azd` paketmanagerinstruktioner och istället peka på release-artifakter där det är lämpligt
- **📦 Exempel på AI-modeller** uppdaterades från äldre standarder som `gpt-35-turbo` och `text-embedding-ada-002` till nuvarande exempel såsom `gpt-4.1-mini`, `gpt-4.1` och `text-embedding-3-large`
- **📋 Utsnitt för distribution och diagnostik** korrigerades för att använda aktuella miljö- och statuskommandon i loggar, skript och felsökningssteg
- **⚙️ GitHub Actions-vägledning** uppdaterades från `Azure/setup-azd@v1.0.0` till `Azure/setup-azd@v2`
- **🤖 MCP/Copilot-samtyckesvägledning** uppdaterades från `azd mcp consent` till `azd copilot consent list`

#### Förbättrat
- **🧠 Vägledning i AI-kapitlet** förklarar nu bättre preview-känsligt `azd ai`-beteende, hyresspecifik inloggning, aktuell användning av extensioner och uppdaterade rekommendationer för modellutplacering
- **🧪 Workshopinstruktioner** använder nu mer realistiska versionsexempel och tydligare språk för miljöuppsättning för praktiska labbar
- **📈 Produktions- och felsökningsdokument** är nu bättre anpassade till aktuell övervakning, fallback-modeller och exempel på kostnadsnivåer

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
**Den här versionen lägger till täckning för kommandon `azd ai`, `azd extension` och `azd mcp` i alla AI-relaterade kapitel, åtgärdar brutna länkar och föråldrad kod i agents.md, uppdaterar fusklappen och gör en genomgripande översyn av avsnittet Example Templates med validerade beskrivningar och nya Azure AI AZD-mallar.**

#### Lagt till
- **🤖 Täckning för AZD AI CLI** över 7 filer (tidigare endast i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nytt avsnitt "Extensions and AI Commands" som introducerar `azd extension`, `azd ai agent init` och `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med jämförelsetabell (mall vs manifest-ansats)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underavsnitten "AZD Extensions for Foundry" och "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start visar nu både mall- och manifestbaserade deploy-vägar
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sektionen inkluderar nu alternativet `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underavsnittet "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nytt avsnitt "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` och `azd infra generate`
- **📦 Nya AZD AI-exempelmallar** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chatt med Blazor WebAssembly, Semantic Kernel och stöd för röstchatt
  - **azure-search-openai-demo-java** — Java RAG-chatt som använder Langchain4J med ACA/AKS-distributionsalternativ
  - **contoso-creative-writer** — Multi-agent kreativt skrivverktyg som använder Azure AI Agent Service, Bing Grounding och Prompty
  - **serverless-chat-langchainjs** — Serverless RAG som använder Azure Functions + LangChain.js + Cosmos DB med Ollama-stöd för lokal utveckling
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med adminportal, Teams-integration och PostgreSQL/Cosmos DB-alternativ
  - **azure-ai-travel-agents** — Multi-agent MCP-orchestreringsreferensapp med servrar i .NET, Python, Java och TypeScript
  - **azd-ai-starter** — Minimal Bicep-startermall för Azure AI-infrastruktur
  - **🔗 Länk till Awesome AZD AI-galleri** — Referens till [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallar)

#### Åtgärdat
- **🔗 agents.md-navigering**: Previous/Next-länkar matchar nu Kapitel 2 README-lektionernas ordning (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md brutna länkar**: `production-ai-practices.md` korrigerades till `../chapter-08-production/production-ai-practices.md` (3 förekomster)
- **📦 agents.md föråldrad kod**: Ersatte `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ogiltigt API**: Flyttade `max_tokens` från `create_agent()` till `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenräkning**: Ersatte grov `len//4`-uppskattning med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Korrigerade tjänster från "Cognitive Search + App Service" till "Azure AI Search + Azure Container Apps" (standardhost ändrad okt 2024)
- **contoso-chat**: Uppdaterade beskrivningen för att hänvisa till Azure AI Foundry + Prompty, i enlighet med repoets verkliga titel och teknikstack

#### Borttaget
- **ai-document-processing**: Tog bort icke-fungerande mallreferens (repo ej offentligt tillgängligt som en AZD-mall)

#### Förbättrat
- **📝 exercises i agents.md**: Övning 1 visar nu förväntad utdata och `azd monitor`-steg; Övning 2 inkluderar full registreringskod för `FunctionTool`; Övning 3 ersätter vag vägledning med konkreta `prepdocs.py`-kommandon
- **📚 agents.md-resurser**: Uppdaterade dokumentationslänkar till aktuella Azure AI Agent Service-dokument och quickstart
- **📋 agents.md Next Steps-tabell**: Lagt till AI Workshop Lab-länk för komplett kapitelöversikt

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
#### Course Navigation Enhancement
**Denna version förbättrar README.md-kapitelnavigeringen med ett förbättrat tabellformat.**

#### Changed
- **Course Map Table**: Förbättrad med direkta lektionslänkar, uppskattningar av varaktighet och komplexitetsbetyg
- **Folder Cleanup**: Tog bort redundanta gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Alla 21+ interna länkar i Course Map-tabellen verifierade

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Denna version uppdaterar produktreferenser till nuvarande Microsoft-branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: Alla referenser uppdaterade i icke-översatta filer
- **Azure AI Agent Service → Foundry Agents**: Servicenamnet uppdaterat för att återspegla aktuell branding

#### Files Updated
- `README.md` - Huvudsida för kursen
- `changelog.md` - Versionshistoria
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Guide för AI-agenter
- `examples/README.md` - Exempeldokumentation
- `workshop/README.md` - Workshop-översikt
- `workshop/docs/index.md` - Workshop-index
- `workshop/docs/instructions/*.md` - Alla workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Denna version omstrukturerar dokumentationen till dedikerade kapitelmappar för tydligare navigering.**

#### Folder Renames
Gamla mappar har ersatts med kapitelnumererade mappar:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 Kapitel-README-filer**: Skapade README.md i varje kapitelmapp med:
  - Lärandemål och varaktighet
  - Lektionstabell med beskrivningar
  - Snabbstartskommandon
  - Navigering till andra kapitel

#### Changed
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i alla dokumentationsfiler
- **🗺️ Huvud-README.md**: Uppdaterade Course Map med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Removed
- Gamla mappstrukturen borttagen (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Denna version lade till kapitelnavigerings-README-filer (ersatt av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Denna version lägger till en omfattande guide för att distribuera AI-agenter med Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chattbotar
  - Tre snabbstartsmallar för agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmönster (enskild agent, RAG, multi-agent)
  - Konfiguration och anpassning av verktyg
  - Övervakning och mätspårning
  - Kostnadsöverväganden och optimering
  - Vanliga felsökningsscenarier
  - Tre praktiska övningar med framgångskriterier

#### Content Structure
- **Introduction**: Agentkoncept för nybörjare
- **Quick Start**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visuella diagram över agentmönster
- **Configuration**: Verktygsinställning och miljövariabler
- **Monitoring**: Integration med Application Insights
- **Exercises**: Progressiva praktiska övningar (20–45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Denna version uppdaterar konfigurationen för utvecklingscontainern med moderna verktyg och bättre standardinställningar för AZD-lärandeupplevelsen.**

#### Changed
- **🐳 Base Image**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (senaste Debian-stabila)
- **📛 Containernamn**: Bytte namn från "Python 3" till "AZD for Beginners" för tydlighet

#### Added
- **🔧 Nya Dev Container-funktioner**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för distribution av containerappar

- **🔌 Port Forwarding**: Förkonfigurerade portar för vanlig utveckling:
  - 8000 (MkDocs-förhandsvisning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code-tillägg**:
  - `ms-python.vscode-pylance` - Förbättrad Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Stöd för Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-stöd
  - `ms-azuretools.vscode-bicep` - Bicep-språkstöd
  - `ms-azure-devtools.azure-resource-groups` - Hantering av Azure-resurser
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-lintning
  - `bierner.markdown-mermaid` - Stöd för Mermaid-diagram
  - `redhat.vscode-yaml` - YAML-stöd (för azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code Settings**: Lade till standardinställningar för Python-tolk, formatering vid sparande och borttagning av onödig vitrymd

- **📦 Uppdaterade requirements-dev.txt**:
  - Lagt till MkDocs minify-plugin
  - Lagt till pre-commit för kodkvalitet
  - Lagt till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Verifierar nu AZD- och Azure CLI-installation vid containerstart

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Denna version förbättrar README.md avsevärt för att vara mer tillgänglig för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Added
- **🆚 Azure CLI vs AZD-jämförelse**: Tydlig förklaring av när man ska använda vilket verktyg med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direkta länkar till communityns mallgalleri och bidragsresurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ färdiga att distribuera mallar
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Communitybidrag
- **🎯 Snabbstartsguide**: Förenklad 3-stegs introduktion (Installera → Logga in → Distribuera)
- **📊 Navigering baserat på erfarenhet**: Tydlig vägledning om var man ska börja baserat på utvecklarens erfarenhet

#### Changed
- **README-struktur**: Omsorterad för progressiv avslöjning - viktig information först
- **Introduktionssektion**: Omskriven för att förklara "The Magic of `azd up`" för fullständiga nybörjare
- **Borttaget duplicerat innehåll**: Eliminering av duplicerat felsökningsavsnitt
- **Felsökningskommandon**: Rättade referenser från `azd logs` till giltigt `azd monitor --logs`

#### Fixed
- **🔐 Autentiseringskommandon**: Lade till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga kommando-referenser**: Tog bort kvarvarande `azd logs` från READMEs felsökningssektion

#### Notes
- **Omfattning**: Ändringar tillämpade på huvud-README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringar riktade specifikt till utvecklare nya till AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Denna version korrigerar icke-existerande AZD-kommandon i dokumentationen och säkerställer att alla kodexempel använder giltig Azure Developer CLI-syntax.**

#### Fixed
- **🔧 Icke-existerande AZD-kommandon borttagna**: Omfattande genomgång och korrigering av ogiltiga kommandon:
  - `azd logs` (finns inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` underkommandon (finns inte) → ersatt med `azd show` och Azure CLI
  - `azd infra import/export/validate` (finns inte) → borttaget eller ersatt med giltiga alternativ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flaggor (finns inte) → borttagna
  - `azd provision --what-if/--rollback` flaggor (finns inte) → uppdaterade för att använda `--preview`
  - `azd config validate` (finns inte) → ersatt med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finns inte) → borttagna

- **📚 Filer uppdaterade med kommando-korrigeringar**:
  - `resources/cheat-sheet.md`: Större översyn av kommandoöversikten
  - `docs/deployment/deployment-guide.md`: Fixade rollback- och distributionsstrategier
  - `docs/troubleshooting/debugging.md`: Rättade avsnitt om logganalys
  - `docs/troubleshooting/common-issues.md`: Uppdaterade felsökningskommandon
  - `docs/troubleshooting/ai-troubleshooting.md`: Rättade AZD-debuggsektionen
  - `docs/getting-started/azd-basics.md`: Korrigerade övervakningskommandon
  - `docs/getting-started/first-project.md`: Uppdaterade övervaknings- och debugexempel
  - `docs/getting-started/installation.md`: Rättade hjälp- och versionsexempel
  - `docs/pre-deployment/application-insights.md`: Korrigerade kommandon för loggvisning
  - `docs/pre-deployment/coordination-patterns.md`: Rättade agentdebuggkommandon

- **📝 Versionsreferens uppdaterad**: 
  - `docs/getting-started/installation.md`: Ändrade hårdkodad `1.5.0`-version till generisk `1.x.x` med länk till releaser

#### Changed
- **Rollback-strategier**: Uppdaterad dokumentation för att använda Git-baserad rollback (AZD har ingen inbyggd rollback)
- **Loggvisning**: Ersatte `azd logs`-referenser med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektion**: Tog bort icke-existerande parallel/incremental-distributionsflaggor och gav giltiga alternativ

#### Technical Details
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verifiering**: Kommandon validerade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**Denna version slutför de interaktiva workshopmodulerna, fixar alla brutna dokumentationslänkar och förbättrar det övergripande innehållets kvalitet för AI-utvecklare som använder Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: Ny dokument med bidragsriktlinjer som innehåller:
  - Tydliga instruktioner för att rapportera problem och föreslå ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och konventioner för commit-meddelanden
  - Information om communityengagemang

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Fullständigt slutförd wrap-up-modul med:
  - Omfattande sammanfattning av workshopens prestationer
  - Avsnitt om nyckelkoncept som täcker AZD, mallar och Microsoft Foundry
  - Rekommendationer för fortsatt läranderesa
  - Workshoputmaningsövningar med svårhetsbedömningar
  - Länkar för feedback och support i communityn

- **📚 Workshop Module 3 (Deconstruct)**: Uppdaterade lärandemål med:
  - GitHub Copilot med MCP-servrar aktiveringstips
  - Förståelse för AZD-mallens mappstruktur
  - Mönster för organisation av Infrastructure-as-Code (Bicep)
  - Praktiska labbinstruktioner

- **🔧 Workshop Module 6 (Teardown)**: Slutförd med:
  - Mål för resursrensning och kostnadshantering
  - `azd down`-användning för säker avprovisionering av infrastruktur
  - Råd för återställning av soft-raderade kognitiva tjänster
  - Bonusutforskningsuppmaningar för GitHub Copilot och Azure Portal

#### Fixed
- **🔗 Trasiga länkfixar**: Åtgärdade 15+ trasiga interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Rättade sökvägar för ai-model-deployment.md och production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fixade FAQ- och felsökningsguide-sökvägar
  - `examples/container-app/microservices/README.md`: Rättade kursens hemsida- och deployment-guide-sökvägar
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade AI-kapitelreferenser
  - `course-outline.md`: Fixade instruktörsguide- och AI-workshop-labbrapporter

- **📅 Workshop Status Banner**: Uppdaterad från "Under Construction" till aktiv workshopstatus med februari 2026-datum

- **🔗 Workshop Navigation**: Fixade trasiga navigeringslänkar i workshop README.md som pekade på icke-existerande lab-1-azd-basics-mapp

#### Changed
- **Workshop Presentation**: Tog bort varning om "under construction", workshopen är nu komplett och redo att användas
- **Navigation Consistency**: Säkerställde att alla workshopmoduler har korrekt inter-modulnavigering
- **Learning Path References**: Uppdaterade kapitelsreferenser för att använda korrekta microsoft-foundry-sökvägar

#### Validated
- ✅ Alla engelska markdown-filer har giltiga interna länkar
- ✅ Workshopmoduler 0-7 är kompletta med lärandemål
- ✅ Navigering mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehållna genomgående
- ✅ CONTRIBUTING.md ger tydlig vägledning för communitybidragsgivare

#### Technical Implementation
- **Link Validation**: Automatiskt PowerShell-skript verifierade alla .md-interna länkar
- **Content Audit**: Manuell granskning av workshopens fullständighet och nybörjarvänlighet
- **Navigation System**: Konsekventa kapitel- och modulnavigeringsmönster tillämpade

#### Notes
- **Scope**: Ändringar tillämpade endast på engelsk dokumentation
- **Translations**: Översättningsmappar uppdaterades inte i denna version (automatisk översättning kommer att synkroniseras senare)
- **Workshop Duration**: Komplett workshop erbjuder nu 3–4 timmars praktiskt lärande

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, säkerhet och multi-agentmönster
**Denna version lägger till omfattande A-nivålektioner om Application Insights-integration, autentiseringsmönster och multi-agentkoordinering för produktionsdistributioner.**

#### Added
- **📊 Application Insights Integration Lesson**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad distribution med automatisk provisionering
  - Kompletta Bicep-mallar för Application Insights + Log Analytics
  - Fungerande Python-applikationer med anpassad telemetri (1,200+ rader)
  - AI/LLM-övervakningsmönster (Microsoft Foundry Models token-/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetri-flöde)
  - 3 praktiska övningar (larm, dashboards, AI-övervakning)
  - Kusto-frågeexempel och strategier för kostnadsoptimering
  - Live-metrikströmning och realtidsfelsökning
  - 40–50 minuters inlärningstid med produktionsklara mönster

- **🔐 Authentication & Security Patterns Lesson**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (anslutningssträngar, Key Vault, hanterad identitet)
  - Kompletta Bicep-infrastrukturmallar för säkra distributioner
  - Node.js-applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera hanterad identitet, användartilldelad identitet, Key Vault-rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara lösenordsfria autentiseringsmönster

- **🤖 Multi-Agent Coordination Patterns Lesson**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmönster (sekventiell, parallell, hierarkisk, händelsestyrd, konsensus)
  - Komplett orkestrator-tjänstimplementation (Python/Flask, 1,500+ rader)
  - 3 specialiserade agentimplementationer (Research, Writer, Editor)
  - Service Bus-integration för meddelandeköning
  - Cosmos DB-tillståndshantering för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logik, circuit breaker)
  - Kostnadsuppdelning ($240–565/månad) med optimeringsstrategier
  - Application Insights-integration för övervakning

#### Enhanced
- **Pre-deployment Chapter**: Inkluderar nu omfattande övervaknings- och koordineringsmönster
- **Getting Started Chapter**: Förbättrad med professionella autentiseringsmönster
- **Production Readiness**: Full täckning från säkerhet till observerbarhet
- **Course Outline**: Uppdaterad för att referera till nya lektioner i kapitel 3 och 6

#### Changed
- **Learning Progression**: Bättre integration av säkerhet och övervakning genom kursen
- **Documentation Quality**: Konsekventa A-nivåstandarder (95–97%) över nya lektioner
- **Production Patterns**: Fullständig end-to-end-täckning för företagsdistributioner

#### Improved
- **Developer Experience**: Tydlig väg från utveckling till produktionsövervakning
- **Security Standards**: Professionella mönster för autentisering och hantering av hemligheter
- **Observability**: Full Application Insights-integration med AZD
- **AI Workloads**: Specialiserad övervakning för Microsoft Foundry Models och multi-agent-system

#### Validated
- ✅ Alla lektioner innehåller komplett fungerande kod (inte endast utdrag)
- ✅ Mermaid-diagram för visuellt lärande (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsklara Bicep-mallar som kan distribueras via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifikationskommandon

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agentarkitekturer
- **Overall New Content**: - Konsekvent högkvalitativa standarder

#### Technical Implementation
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Authentication**: Hanterad identitet + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Monitoring**: Live-metrik + Kusto-frågor + larm + dashboards
- **Cost Management**: Sampling-strategier, retention-policyer, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättrad dokumentationskvalitet och nytt Microsoft Foundry Models-exempel
**Denna version förbättrar dokumentationskvaliteten i hela arkivet och lägger till ett komplett Microsoft Foundry Models-distributionsexempel med gpt-4.1 chattgränssnitt.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Komplett gpt-4.1-distribution med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 modelldeployment)
  - Python-kommandoradschatt med samtalshistorik
  - Key Vault-integration för säker lagring av API-nycklar
  - Tokenanvändningsspårning och kostnadsestimering
  - Rate limiting och felhantering
  - Omfattande README med 35–45 minuters distributionsguide
  - 11 produktionsklara filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lade till praktiska övningar i konfigurationsguiden:
  - Övning 1: Konfiguration för flera miljöer (15 minuter)
  - Övning 2: Övning i hantering av hemligheter (10 minuter)
  - Tydliga framgångskriterier och verifieringssteg
- **✅ Distribution Verification**: Lade till verifieringssektion i distributionsguiden:
  - Hälsokontrollprocedurer
  - Checklista för framgångskriterier
  - Förväntade utdata för alla distributionskommandon
  - Snabbreferens för felsökning

#### Enhanced
- **examples/README.md**: Uppdaterad till A-nivåkvalitet (93%):
  - Lade till azure-openai-chat i alla relevanta avsnitt
  - Uppdaterade antal lokala exempel från 3 till 4
  - Lades till i tabellen för AI-applikationsexempel
  - Integrerad i Quick Start för medelavancerade användare
  - Lades till i Microsoft Foundry Templates-sektionen
  - Uppdaterade jämförelsematris- och teknikfyndavsnitt
- **Documentation Quality**: Förbättrad B+ (87%) → A- (92%) i docs-mappen:
  - Lade till förväntade utdata för kritiska kommandexempel
  - Inkluderade verifieringssteg för konfigurationsändringar
  - Förbättrat praktiskt lärande med nyttiga övningar

#### Changed
- **Learning Progression**: Bättre integration av AI-exempel för medelavancerade inlärare
- **Documentation Structure**: Mer handlingsbara övningar med tydliga utfall
- **Verification Process**: Tydliga framgångskriterier tillagda i nyckelarbetsflöden

#### Improved
- **Developer Experience**: Microsoft Foundry Models-distribution tar nu 35–45 minuter (vs 60–90 för komplexa alternativ)
- **Cost Transparency**: Klara kostnadsuppskattningar ($50–200/månad) för Microsoft Foundry Models-exemplet
- **Learning Path**: AI-utvecklare har tydlig ingångspunkt med azure-openai-chat
- **Documentation Standards**: Konsekventa förväntade utdata och verifieringssteg

#### Validated
- ✅ Microsoft Foundry Models-exempel fullt funktionellt med `azd up`
- ✅ Alla 11 implementationsfiler syntaktiskt korrekta
- ✅ README-instruktioner matchar faktisk distributionsupplevelse
- ✅ Dokumentationslänkar uppdaterade på 8+ platser
- ✅ Exempelsindex återspeglar korrekt 4 lokala exempel
- ✅ Inga duplicerade externa länkar i tabeller
- ✅ Alla navigeringsreferenser korrekta

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps-mönster
- **Security**: Managed Identity redo, hemligheter i Key Vault
- **Monitoring**: Application Insights-integration
- **Cost Management**: Tokenspårning och användningsoptimering
- **Deployment**: Enkelt `azd up`-kommando för komplett uppsättning

### [v3.6.0] - 2025-11-19

#### Större uppdatering: Container App-distributionsexempel
**Denna version introducerar omfattande, produktionsklara containerapplikationsdistributions-exempel med Azure Developer CLI (AZD), med full dokumentation och integration i lärandespåret.**

#### Added
- **🚀 Container App Examples**: Nya lokala exempel i `examples/container-app/`:
  - [Huvudguide](examples/container-app/README.md): Komplett översikt över containeriserade distributioner, snabbstart, produktion och avancerade mönster
  - [Enkel Flask-API](../../examples/container-app/simple-flask-api): Nybörjarvänligt REST-API med scale-to-zero, hälsokontroller, övervakning och felsökning
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices): Produktionsklart flertjänstdistributionsmönster (API Gateway, Product, Order, User, Notification), asynkron meddelandehantering, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blue-green/canary-distribution
- **Best Practices**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-vägledning för containeriserade arbetsbelastningar
- **Code Samples**: Komplett `azure.yaml`, Bicep-mallar och flerspråkiga serviceimplementationer (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end-testscenarier, övervakningskommandon, felsökningsvägledning

#### Changed
- **README.md**: Uppdaterad för att lyfta fram och länka till nya containerappsexempel under "Local Examples - Container Applications"
- **examples/README.md**: Uppdaterad för att framhäva containerappsexemplen, lägga till jämförelsematrisposter och uppdatera teknik-/arkitekturreferenser
- **Course Outline & Study Guide**: Uppdaterad för att referera till nya containerappsexempel och distributionsmönster i relevanta kapitel

#### Validated
- ✅ Alla nya exempel kan distribueras med `azd up` och följer bästa praxis
- ✅ Dokumentationskorslänkar och navigering uppdaterade
- ✅ Exemplen täcker nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Notes
- **Scope**: Endast engelsk dokumentation och exempel
- **Next Steps**: Utöka med ytterligare avancerade container-mönster och CI/CD-automation i framtida releaser

### [v3.5.0] - 2025-11-19

#### Produktomprofilering: Microsoft Foundry
**Denna version genomför en omfattande namnändring av produkten från "Microsoft Foundry" till "Microsoft Foundry" i hela den engelska dokumentationen, vilket speglar Microsofts officiella omprofilering.**

#### Changed
- **🔄 Produktnamnsuppdatering**: Fullständig omprofilering från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i den engelska dokumentationen i `docs/`-mappen
  - Omdöpt mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdöpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade över 7 dokumentfiler

- **📁 Mappstrukturändringar**:
  - `docs/ai-foundry/` omdöpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att återspegla den nya mappstrukturen
  - Navigationslänkar validerade i hela dokumentationen

- **📄 Filändringar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera till det nya filnamnet

#### Uppdaterade filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslänkar uppdaterade
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Använder redan Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitelnavigationslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa kapitellänkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigation, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigationslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapitelrubriker, mallavsnitt, communityinsikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitlets resurser)

#### Validerat
- ✅ Inga återstående "ai-foundry" mappsökvägsreferenser i de engelska dokumenten
- ✅ Inga återstående produktnamnsreferenser "Microsoft Foundry" i de engelska dokumenten
- ✅ Alla navigationslänkar fungerar med den nya mappstrukturen
- ✅ Fils- och mappnamnändringar genomförda framgångsrikt
- ✅ Korsreferenser mellan kapitel validerade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast på den engelska dokumentationen i `docs/`-mappen
- **Översättningar**: Översättningsmappar (`translations/`) uppdaterades inte i denna version
- **Workshop**: Workshopmaterial (`workshop/`) uppdaterades inte i denna version
- **Exempel**: Exempelfiler kan fortfarande referera till äldre namngivning (åtgärdas i framtida uppdatering)
- **Externa länkar**: Externa URL:er och GitHub-förrådsreferenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala brancher eller dokumentation som refererar den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Byt ut produktnamn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validera att alla interna dokumentlänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förbättrade förhandsgransknings- och valideringsfunktioner för infrastruktur
**Denna version introducerar omfattande stöd för den nya förhandsgranskningsfunktionen i Azure Developer CLI och förbättrar workshop-upplevelsen för användare.**

#### Lagt till
- **🧪 azd provision --preview Feature Documentation**: Omfattande täckning av den nya förhandsgranskningsfunktionen för infrastruktur
  - Kommandoreferens och exempel på användning i fusklapp
  - Detaljerad integration i provisioneringsguiden med användningsfall och fördelar
  - Pre-flight-kontrollintegration för säkrare validering av driftsättning
  - Uppdateringar i kom-igång-guiden med säkerhetsorienterade driftsättningsrutiner
- **🚧 Workshop Status Banner**: Professionell HTML-banner som indikerar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Senast uppdaterad-tidsstämpel för transparens
  - Mobilanpassad design för alla enhetstyper

#### Förbättrat
- **Infrastrukturens säkerhet**: Förhandsgranskningsfunktionalitet integrerad i hela driftsättningsdokumentationen
- **Förvalidering innan driftsättning**: Automatiserade skript inkluderar nu testning av infrastrukturförhandsgranskning
- **Utvecklarflöde**: Uppdaterade kommandosekvenser för att inkludera förhandsgranskning som bästa praxis
- **Workshop-upplevelse**: Tydliga förväntningar för användare gällande innehållets utvecklingsstatus

#### Ändrat
- **Driftsättningsriktlinjer**: Förhandsgranskningsförst-arbetsflöde rekommenderas nu som standard
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i inlärningsprocessen
- **Workshop-presentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättringar
- **Säkerhetsförst-ansats**: Infrastrukturförändringar kan nu valideras innan driftsättning
- **Teamsamarbete**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader innan provisionering
- **Riskminimering**: Minskade driftsättningsfel genom förhandsvalidering

#### Teknisk implementering
- **Multidokumentintegration**: Förhandsgranskningsfunktionen dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel genom hela dokumentationen
- **Bästa praxis-integration**: Förhandsgranskning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NY funktion-markeringar för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientstil
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Bibehåller repoets trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Oktober 2025 senast uppdaterad-tidsstämpel för ansvarstagande

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktivt lärande
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärandestigar.**

#### Lagt till
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs-förhandsgranskningsmöjlighet
- **📝 Strukturerade workshopinstruktioner**: 7-stegs vägledd lärandestig från upptäckt till anpassning
  - 0-Introduction: Workshopöversikt och installation
  - 1-Select-AI-Template: Mallupptäckt och urvalsprocess
  - 2-Validate-AI-Template: Driftsättning och valideringsprocedurer
  - 3-Deconstruct-AI-Template: Förstå mallens arkitektur
  - 4-Configure-AI-Template: Konfiguration och anpassning
  - 5-Customize-AI-Template: Avancerade modifieringar och iterationer
  - 6-Teardown-Infrastructure: Rensning och resurshantering
  - 7-Wrap-up: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad lärandeupplevelse
- **🎯 Praktisk lärandestig**: 3-stegs metodik (Upptäckt → Driftsättning → Anpassning)
- **📱 GitHub Codespaces Integration**: Sömlös utvecklingsmiljöuppsättning

#### Förbättrat
- **AI Workshop Lab**: Utökad med en omfattande 2–3 timmars strukturerad lärandeupplevelse
- **Workshopdokumentation**: Professionell presentation med navigation och visuella hjälpmedel
- **Lärandeprogression**: Tydlig steg-för-steg-vägledning från mallval till produktionsdriftsättning
- **Utvecklarupplevelse**: Integrerade verktyg för effektivare utvecklingsflöden

#### Förbättringar
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sök, kopiera-funktionalitet och temaväxling
- **Självstyrt lärande**: Flexibel workshopstruktur som passar olika inlärningstakt
- **Praktisk tillämpning**: Verkliga AI-mall-driftsättningsscenarier
- **Community-integration**: Discord-integration för workshopstöd och samarbete

#### Workshopfunktioner
- **Inbyggd sökfunktion**: Snabb sökning efter nyckelord och lektioner
- **Kopiera kodblock**: Hover-för-kopiera-funktionalitet för alla kodexempel
- **Temaväxling**: Stöd för mörkt/ljust läge efter preferens
- **Visuella tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt åtkomst till Discord för communitystöd

### [v3.2.0] - 2025-09-17

#### Omfattande navigeringsomstrukturering och kapitelbaserat lärandesystem
**Denna version inför ett heltäckande kapitelbaserat lärandesystem med förbättrad navigering i hela repot.**

#### Lagt till
- **📚 Kapitelbaserat lärandesystem**: Omstrukturerade hela kursen i 8 progressiva lärandekapitlen
  - Kapitel 1: Grund & Snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-först utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastructure as Code & Driftsättning (⭐⭐⭐ - 1-1.5 timmar)
  - Kapitel 5: Multi-Agent AI-lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Förvalidering & Planering före driftsättning (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1-1.5 timmar)
  - Kapitel 8: Produktion & Företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigationssystem**: Konsekventa navigeringshuvuden och -fötter i hela dokumentationen
- **🎯 Progresstracking**: Kursavslutschecklista och system för inlärningsverifiering
- **🗺️ Vägledning i lärandestigen**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskaper tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärandeplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelsammanhang och progression
- **Mallorganisation**: Exempel och mallar kartlagda till lämpliga lärandekapitlen
- **Resursintegration**: Fusklappar, FAQ och studieguides kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labbar mappade till flera kapitelmål

#### Ändrat
- **Lärandeprogression**: Flytt från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Flyttade konfigurationsguiden till Kapitel 3 för bättre lärandeflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela lärandevägen
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättringar
- **Användarupplevelse**: Tydliga navigeringsbrödsmulor och kapitelprogressindikatorer
- **Tillgänglighet**: Konsekventa navigationsmönster för enklare kursnavigering
- **Professionell presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Lärandeeffektivitet**: Kortare tid att hitta relevant innehåll genom förbättrad organisation

#### Teknisk implementering
- **Navigeringshuvuden**: Standardiserad kapitelnavigation över 40+ dokumentfiler
- **Footer-navigering**: Konsekvent progression och kapitelavslutsindikatorer
- **Korslänkning**: Omfattande interna länksystem som kopplar relaterade begrepp
- **Kapitelmappning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättring av studiehandledning
- **📚 Omfattande lärandemål**: Omstrukturerad studiehandledning för att stämma överens med 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel innehåller specifika lärandemål och praktiska övningar
- **📋 Progresstracking**: Veckoschema med mätbara resultat och avslutschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella utfall
- **🛠️ Praktiska övningar**: Hands-on aktiviteter med verkliga driftsättningsscenarier och felsökning
- **📊 Kompetensprogression**: Tydlig avancering från grundläggande koncept till företagsmönster med karriärfokus
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och communityerkännande
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors plan med milstolpevalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar retail multi-agent-lösningen med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatte "Cora agent" med "Customer agent" i hela retail multi-agent-lösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterade all dokumentation, ARM templates, och kodexempel för att använda konsekvent "Customer agent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsistens**: Säkerställde att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM Template Package**: Uppdaterad retail-multiagent-arm-template med Customer agent-referenser
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med ny agentnamngivning
- **Kodexempel**: Python-klasser och implementations exempel använder nu CustomerAgent-namn
- **Miljövariabler**: Uppdaterade alla deploy-skript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättringar
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsmognad**: Bättre anpassning till företagsnamngivningskonventioner
- **Lärmaterial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallens användbarhet**: Förenklad förståelse av agentfunktioner och driftsättningsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med CustomerAgent-referenser
- Ersatte CoraAgent klassnamn med CustomerAgent i Python-exempel
- Modifierade ARM template JSON-konfigurationer för att använda "customer" agent-typ
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_*-mönster
- Uppdaterade alla driftsättningskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - AI-utvecklarfokus och Microsoft Foundry-integration
**Denna version transformerar repot till en omfattande AI-inriktad läranderesurs med Microsoft Foundry-integration.**

#### Lagt till
- **🤖 AI-först lärandestig**: Komplett omstrukturering med fokus på AI-utvecklare och ingenjörer
- **Microsoft Foundry Integration Guide**: Omfattande dokumentation för att koppla AZD till Microsoft Foundry-tjänster
- **AI-modellsdriftsättningsmönster**: Detaljerad guide som täcker modellval, konfiguration och produktionsdriftsättningsstrategier
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-distribuerbara lösningar
- **Production AI Best Practices**: Företagsberedda mönster för skalning, övervakning och säkring av AI-arbetsbelastningar
- **AI-Specific Troubleshooting Guide**: Omfattande felsökning för Microsoft Foundry-modeller, Cognitive Services och AI-distributionsproblem
- **AI Template Gallery**: Utvald samling Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshop Materials**: Komplett workshopstruktur med praktiska labb och referensmaterial

#### Förbättrat
- **README Structure**: Inriktat på AI-utvecklare med 45% communityintressedata från Microsoft Foundry Discord
- **Learning Paths**: Dedikerad AI-utvecklarresa tillsammans med traditionella vägar för studenter och DevOps-ingenjörer
- **Template Recommendations**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat, och openai-chat-app-quickstart
- **Community Integration**: Förbättrat Discord-communitystöd med AI-specifika kanaler och diskussioner

#### Säkerhet & Produktionsfokus
- **Managed Identity Patterns**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Cost Optimization**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-Region Deployment**: Strategier för global distribution av AI-applikationer
- **Performance Monitoring**: AI-specifika mätvärden och integration med Application Insights

#### Dokumentationskvalitet
- **Linear Course Structure**: Logisk progression från nybörjare till avancerade AI-distributionsmönster
- **Validated URLs**: Alla externa repositorieslänkar verifierade och tillgängliga
- **Complete Reference**: Alla interna dokumentationslänkar validerade och funktionella
- **Production Ready**: Företagsanpassade distributionsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Omstrukturering av repository och professionell förbättring
**Denna version representerar en betydande översyn av repository-strukturen och innehållspresentationen.**

#### Lagt till
- **Structured Learning Framework**: Alla dokumentationssidor innehåller nu sektionerna Introduction, Learning Goals och Learning Outcomes
- **Navigation System**: Lagt till Previous/Next-lektionlänkar genom hela dokumentationen för vägledd inlärningsprogression
- **Study Guide**: Omfattande study-guide.md med inlärningsmål, övningsuppgifter och bedömningsmaterial
- **Professional Presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och professionellt utseende
- **Enhanced Content Structure**: Förbättrad organisering och flöde av utbildningsmaterial

#### Ändrat
- **Documentation Format**: Standardiserade all dokumentation med konsekvent inlärningsfokuserad struktur
- **Navigation Flow**: Implementerat logisk progression genom allt utbildningsmaterial
- **Content Presentation**: Tog bort dekorativa element till förmån för klar, professionell formatering
- **Link Structure**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrat
- **Accessibility**: Tog bort emoji-beroenden för bättre kompatibilitet med skärmläsare
- **Professional Appearance**: Ren, akademisk stil som passar företagsutbildning
- **Learning Experience**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Content Organization**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första utgåvan - Omfattande AZD-inlärningsrepository

#### Lagt till
- **Core Documentation Structure**
  - Komplett serie med getting-started-guider
  - Omfattande dokumentation för distribution och provisioning
  - Detaljerade felsökningsresurser och debug-guider
  - Verktyg och procedurer för fördriftsvalidering

- **Getting Started Module**
  - AZD Basics: Kärnkoncept och terminologi
  - Installation Guide: Plattformspecifika installationsinstruktioner
  - Configuration Guide: Miljöinställning och autentisering
  - First Project Tutorial: Steg-för-steg praktisk inlärning

- **Deployment and Provisioning Module**
  - Deployment Guide: Fullständig arbetsflödesdokumentation
  - Provisioning Guide: Infrastructure as Code med Bicep
  - Bästa praxis för produktionsdistributioner
  - Mönster för multi-service-arkitektur

- **Pre-deployment Validation Module**
  - Capacity Planning: Validering av Azure-resursers tillgänglighet
  - SKU Selection: Omfattande vägledning för servicetier
  - Pre-flight Checks: Automatiserade valideringsskript (PowerShell och Bash)
  - Kostnadsestimering och budgetplaneringsverktyg

- **Troubleshooting Module**
  - Common Issues: Vanliga problem och lösningar
  - Debugging Guide: Systematiska felsökningsmetodiker
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resources and References**
  - Command Cheat Sheet: Snabbreferens för viktiga kommandon
  - Glossary: Utförlig terminologi- och akronymdefinition
  - FAQ: Utförliga svar på vanliga frågor
  - Externa resurslänkar och community-anslutningar

- **Examples and Templates**
  - Exempel på enkel webbapplikation
  - Mall för distribution av statisk webbplats
  - Konfiguration för containerapplikation
  - Mönster för databasintegration
  - Exempel på mikrotjänstarkitektur
  - Implementationer av serverlösa funktioner

#### Funktioner
- **Multi-Platform Support**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Multiple Skill Levels**: Innehåll utformat för studenter till professionella utvecklare
- **Practical Focus**: Praktiska exempel och verkliga scenarier
- **Comprehensive Coverage**: Från grundläggande koncept till avancerade företagsmönster
- **Security-First Approach**: Säkerhetsbästa praxis integrerad genomgående
- **Cost Optimization**: Vägledning för kostnadseffektiva distributioner och resursförvaltning

#### Dokumentationskvalitet
- **Detailed Code Examples**: Praktiska, testade kodexempel
- **Step-by-Step Instructions**: Klara, handlingsbara instruktioner
- **Comprehensive Error Handling**: Felsökning för vanliga problem
- **Best Practices Integration**: Branschstandarder och rekommendationer
- **Version Compatibility**: Uppdaterad med senaste Azure-tjänster och azd-funktioner

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### AI-plattformsutvidgning
- **Multi-Model Support**: Integrationsmönster för Hugging Face, Azure Machine Learning och egna modeller
- **AI Agent Frameworks**: Mallar för LangChain, Semantic Kernel och AutoGen-distributioner
- **Advanced RAG Patterns**: Vektor databasalternativ bortom Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Förbättrad övervakning för modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Extension**: Integrerad AZD + Microsoft Foundry-utvecklingsupplevelse
- **GitHub Copilot Integration**: AI-assisterad generering av AZD-mallar
- **Interactive Tutorials**: Praktiska kodningsövningar med automatiserad validering för AI-scenarier
- **Video Content**: Kompletterande videotutorials för visuella inlärare med fokus på AI-distributioner

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Governance Framework**: AI-modellstyrning, efterlevnad och revisionsspår
- **Multi-Tenant AI**: Mönster för att tjänstegöra flera kunder med isolerade AI-tjänster
- **Edge AI Deployment**: Integration med Azure IoT Edge och containerinstanser
- **Hybrid Cloud AI**: Multi-cloud och hybrid distributionsmönster för AI-arbetsbelastningar

#### Avancerade funktioner
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning-pipelines
- **Advanced Security**: Nolltillit-mönster, privata endpoints och avancerat skydd mot hot
- **Performance Optimization**: Avancerad tuning och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global Distribution**: Innehållsleverans och kantcachning för AI-applikationer

### Version 3.0.0 (Planerad) - Överskuggad av aktuell utgåva
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-Focused Content**: Omfattande Microsoft Foundry-integration (Slutförd)
- ✅ **Interactive Tutorials**: Praktiskt AI-workshoplabb (Slutförd)
- ✅ **Advanced Security Module**: AI-specifika säkerhetsmönster (Slutförd)
- ✅ **Performance Optimization**: Tuningstrategier för AI-arbetsbelastningar (Slutförd)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Några slutförda i aktuell utgåva
- ✅ **Additional Examples**: AI-inriktade distributionsscenarier (Slutförd)
- ✅ **Extended FAQ**: AI-specifika frågor och felsökning (Slutförd)
- **Tool Integration**: Förbättrade riktlinjer för IDE- och redaktörsintegration
- ✅ **Monitoring Expansion**: AI-specifika övervaknings- och larmmönster (Slutförd)

#### Fortfarande planerade för framtida utgåva
- **Mobile-Friendly Documentation**: Responsiv design för mobil inlärning
- **Offline Access**: Nedladdningsbara dokumentationspaket
- **Enhanced IDE Integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community Dashboard**: Realtidscommunity-metrik och bidragsspårning

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta repository, säkerställ att ändringsloggsposter innehåller:

1. **Version Number**: Följ semantic versioning (major.minor.patch)
2. **Date**: Utgivnings- eller uppdateringsdatum i formatet YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Kortfattad beskrivning av vad som ändrats
5. **Impact Assessment**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Added
- Nya funktioner, dokumentationssektioner eller kapabiliteter
- Nya exempel, mallar eller inlärningsresurser
- Ytterligare verktyg, skript eller verktygslådor

#### Changed
- Ändringar i befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Deprecated
- Funktioner eller tillvägagångssätt som fasas ut
- Dokumentationssektioner planerade för borttagning
- Metoder som har bättre alternativ

#### Removed
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller utfasade tillvägagångssätt
- Redundant eller konsoliderat innehåll

#### Fixed
- Korrigeringar av fel i dokumentation eller kod
- Åtgärdande av rapporterade problem eller buggar
- Förbättringar av noggrannhet eller funktionalitet

#### Security
- Säkerhetsrelaterade förbättringar eller fixar
- Uppdateringar av säkerhetsbästa praxis
- Åtgärdande av säkerhetssårbarheter

### Riktlinjer för semantisk versionering

#### Major Version (X.0.0)
- Avbrytande ändringar som kräver åtgärd från användaren
- Betydande omstrukturering av innehåll eller organisation
- Ändringar som förändrar den grundläggande metoden eller metodologin

#### Minor Version (X.Y.0)
- Nya funktioner eller innehållstillägg
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patch Version (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Communityåterkoppling och förslag

Vi uppmuntrar aktivt communityåterkoppling för att förbättra denna inlärningsresurs:

### Hur man lämnar feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika frågor välkomna)
- **Discord Discussions**: Dela idéer och engagera dig med Microsoft Foundry-communityt
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community Forums**: Delta i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI Content Accuracy**: Korrigeringar av AI-tjänsteintegration och distributionsinformation
- **Learning Experience**: Förslag för förbättrat AI-utvecklarinlärningsflöde
- **Missing AI Content**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Accessibility**: Förbättringar för olika inlärningsbehov
- **AI Tool Integration**: Förslag för bättre integration av AI-utvecklingsarbetsflöden
- **Production AI Patterns**: Förfrågningar om företagsanpassade AI-distributionsmönster

### Åtagande för svar
- **Issue Response**: Inom 48 timmar för rapporterade problem
- **Feature Requests**: Utvärdering inom en vecka
- **Community Contributions**: Granskning inom en vecka
- **Security Issues**: Omedelbar prioritet med påskyndat svar

## Underhållsschema

### Regelbundna uppdateringar
- **Monthly Reviews**: Innehållsnoggrannhet och länkvalidering
- **Quarterly Updates**: Stora innehållstillägg och förbättringar
- **Semi-Annual Reviews**: Omfattande omstrukturering och förbättringar
- **Annual Releases**: Stora versionuppdateringar med betydande förbättringar

### Övervakning och kvalitetssäkring
- **Automated Testing**: Regelbunden validering av kodexempel och länkar
- **Community Feedback Integration**: Regelbunden införlivning av användarförslag
- **Technology Updates**: Anpassning till senaste Azure-tjänster och azd-utgåvor
- **Accessibility Audits**: Regelbunden granskning för inkluderande designprinciper

## Versionsstödpolicy

### Nuvarande versionsstöd
- **Latest Major Version**: Fullt stöd med regelbundna uppdateringar
- **Previous Major Version**: Säkerhetsuppdateringar och kritiska fixar i 12 månader
- **Legacy Versions**: Endast communitystöd, inga officiella uppdateringar

### Migreringsvägledning
När major-versioner släpps tillhandahåller vi:
- **Migration Guides**: Steg-för-steg-övergångsinstruktioner
- **Compatibility Notes**: Detaljer om avbrytande ändringar
- **Tool Support**: Skript eller verktyg för att underlätta migrering
- **Community Support**: Dedikerade forum för migrationsfrågor

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Återgå till [Main README](README.md)

**Stay Updated**: Följ detta repository för aviseringar om nya utgåvor och viktiga uppdateringar av utbildningsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->