# Ändringslogg - AZD For Beginners

## Introduktion

Denna ändringslogg dokumenterar alla betydande ändringar, uppdateringar och förbättringar i AZD For Beginners-förvaret. Vi följer principer för semantisk versionering och upprätthåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Inlärningsmål

Genom att gå igenom denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillagda innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av läromaterialet över tid

## Lärandemål

Efter att ha granskat ändringsloggsposter kommer du att kunna:
- Identifiera nytt innehåll och resurser som finns tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din lärväg baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Denna version följer upp AZD 1.23-valideringsgranskningen med en dokumentationsgenomgång fokuserad på nybörjare: den förtydligar AZD-först-autentiseringsvägledning, lägger till lokala setup-valideringsskript, verifierar nyckelkommandon mot den faktiska AZD-CLI:n och tar bort de sista föråldrade engelskspråkiga kommando-referenserna utanför ändringsloggen.**

#### Lagt till
- **🧪 Valideringsskript för nybörjare** med `validate-setup.ps1` och `validate-setup.sh` så att elever kan bekräfta att nödvändiga verktyg finns innan kapitel 1 börjar
- **✅ Inledande valideringssteg för setup** i root-README och Kapitel 1 README så att saknade förutsättningar fångas innan `azd up`

#### Ändrat
- **🔐 Autentiseringsvägledning för nybörjare** behandlar nu konsekvent `azd auth login` som den primära vägen för AZD-arbetsflöden, med `az login` utpekat som valfritt om Azure CLI-kommandon används direkt
- **📚 Onboardingflödet i Kapitel 1** pekar nu användare att validera sin lokala setup innan installation, autentisering och första driftsättningssteg
- **🛠️ Validator-meddelanden** separerar nu tydligt blockerande krav från valfria Azure CLI-varningar för den AZD-endast nybörjarvägen
- **📖 Konfigurations-, felsöknings- och exempel-dokument** skiljer nu mellan krävd AZD-autentisering och valfri Azure CLI-inloggning där båda tidigare presenterades utan kontext

#### Åtgärdat
- **📋 Återstående engelskspråkiga kommando-referenser** uppdaterade till nuvarande AZD-former, inklusive `azd config show` i fusklappen och `azd monitor --overview` där vägledning om Azure Portal-översikt var avsedd
- **🧭 Nybörjarpåståenden i Kapitel 1** mildrades för att undvika att lova garanterat felfritt beteende eller rollback över alla mallar och Azure-resurser
- **🔎 Live-CLI-validering** bekräftade nuvarande stöd för `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, och `azd down --force --purge`

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

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**Denna version utför en dokumentationsvalideringsgenomgång mot `azd` `1.23.12`, uppdaterar föråldrade AZD-kommandoexempel, uppdaterar AI-modellvägledningen till nuvarande standarder och breddar workshop-instruktionerna bortom GitHub Codespaces för att även stödja dev containers och lokala kloner.**

#### Lagt till
- **✅ Valideringsanteckningar över kärnkapitel och workshop-dokument** för att göra den testade AZD-baslinjen tydlig för elever som använder nyare eller äldre CLI-byggnader
- **⏱️ Vägledning om driftsättningstid** för långkörande AI-appdriftsättningar med `azd deploy --timeout 1800`
- **🔎 Steg för inspektion av extension** med `azd extension show azure.ai.agents` i AI-arbetsflödesdokument
- **🌐 Bredare vägledning för workshop-miljöer** som täcker GitHub Codespaces, dev containers och lokala kloner med MkDocs

#### Ändrat
- **📚 Kapitelintro-READMEs** noterar nu konsekvent validering mot `azd 1.23.12` över foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting och production-sektioner
- **🛠️ AZD-kommando-referenser** uppdaterade till nuvarande former över dokumenten:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` beroende på kontext
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` där Application Insights-översikt är avsedd
- **🧪 Exempel för provision-preview** förenklade till nu understödda användningar såsom `azd provision --preview` och `azd provision --preview -e production`
- **🧭 Workshopflöde** uppdaterat så att deltagare kan slutföra labbarna i Codespaces, en dev container eller en lokal klon istället för att anta Codespaces-endast körning
- **🔐 Autentiseringsvägledning** föredrar nu `azd auth login` för AZD-arbetsflöden, med `az login` positionerat som valfritt när Azure CLI-kommandon används direkt

#### Åtgärdat
- **🪟 Windows-installationskommandon** normaliserades till aktuell `winget`-paketcasing i installationsguiden
- **🐧 Linux-installationsvägledning** korrigerades för att undvika ej stödjade distro-specifika `azd` paketinstruktioner och pekar istället på release-artifakter där det är lämpligt
- **📦 AI-modexempel** uppdaterades från äldre standarder som `gpt-35-turbo` och `text-embedding-ada-002` till nuvarande exempel såsom `gpt-4.1-mini`, `gpt-4.1`, och `text-embedding-3-large`
- **📋 Utdrag för driftsättning och diagnostik** korrigerades för att använda nuvarande miljö- och statuskommandon i loggar, skript och felsökningssteg
- **⚙️ GitHub Actions-vägledning** uppdaterades från `Azure/setup-azd@v1.0.0` till `Azure/setup-azd@v2`
- **🤖 MCP/Copilot-samtyckesvägledning** uppdaterades från `azd mcp consent` till `azd copilot consent list`

#### Förbättrat
- **🧠 AI-kapitelvägledning** förklarar nu bättre preview-känsligt `azd ai`-beteende, tenant-specifik inloggning, nuvarande extension-användning och uppdaterade rekommendationer för modellutplacering
- **🧪 Workshop-instruktioner** använder nu mer realistiska versionsexempel och tydligare språk för miljösetup i praktiska labbar
- **📈 Produktions- och felsökningsdokument** stämmer nu bättre överens med aktuell övervakning, fallback-modell och kostnadsnivåexempel

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

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Denna version lägger till `azd ai`, `azd extension` och `azd mcp` kommandotäckning över alla AI-relaterade kapitel, åtgärdar brutna länkar och föråldrad kod i agents.md, uppdaterar fusklappen och gör om avsnittet Exempelmallar med validerade beskrivningar och nya Azure AI AZD-mallar.**

#### Lagt till
- **🤖 Täckning för AZD AI CLI** över 7 filer (tidigare endast i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny sektion "Extensions and AI Commands" som introducerar `azd extension`, `azd ai agent init`, och `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med jämförelsetabell (mall vs manifest-ansats)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Undersektionerna "AZD Extensions for Foundry" och "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start visar nu både mall- och manifest-baserade driftsättningsvägar
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sektionen inkluderar nu `azd ai agent init`-alternativ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Undersektionen "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Ny sektion "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp`, och `azd infra generate`
- **📦 Nya AZD AI-exempelmallar** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chatt med Blazor WebAssembly, Semantic Kernel och röstchattstöd
  - **azure-search-openai-demo-java** — Java RAG-chatt med Langchain4J med ACA/AKS driftsättningsalternativ
  - **contoso-creative-writer** — Multi-agent kreativ skrivapp som använder Azure AI Agent Service, Bing Grounding och Prompty
  - **serverless-chat-langchainjs** — Serverless RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama-stöd för lokal utveckling
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med administrationsportal, Teams-integration och PostgreSQL/Cosmos DB-alternativ
  - **azure-ai-travel-agents** — Multi-agent MCP-orkestreringsreferensapp med servrar i .NET, Python, Java, och TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep-startmall
  - **🔗 Awesome AZD AI Gallery link** — Referens till [awesome-azd AI-galleri](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallar)

#### Åtgärdat
- **🔗 agents.md-navigering**: Previous/Next-länkar matchar nu Kapitel 2 README-lektionsordning (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md brutna länkar**: `production-ai-practices.md` korrigerad till `../chapter-08-production/production-ai-practices.md` (3 förekomster)
- **📦 agents.md föråldrad kod**: Ersatte `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ogiltigt API**: Flyttade `max_tokens` från `create_agent()` till `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-räkning**: Ersatte grov `len//4`-uppskattning med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Korrigerade tjänster från "Cognitive Search + App Service" till "Azure AI Search + Azure Container Apps" (standardvärd ändrades okt 2024)
- **contoso-chat**: Uppdaterade beskrivningen för att referera till Azure AI Foundry + Prompty, i linje med repots faktiska titel och teknikstack

#### Borttaget
- **ai-document-processing**: Tog bort icke-fungerande mallreferens (repo inte offentligt tillgängligt som en AZD-mall)

#### Förbättrat
- **📝 agents.md övningar**: Övning 1 visar nu förväntad utdata och steget `azd monitor`; Övning 2 innehåller fullständig `FunctionTool`-registreringskod; Övning 3 ersätter vag vägledning med konkreta `prepdocs.py`-kommandon
- **📚 agents.md resurser**: Uppdaterade dokumentlänkar till aktuella Azure AI Agent Service-dokument och snabbstart
- **📋 agents.md Nästa steg-tabell**: Lade till länk till AI Workshop Lab för fullständig kapiteltäckning

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

#### Förbättring av kursnavigering
**Denna version förbättrar kapitelnavigeringen i README.md med ett förbättrat tabellformat.**

#### Ändrat
- **Kurskartstabell**: Förbättrad med direkta lektionslänkar, tidsuppskattningar och komplexitetsbetyg
- **Mappstädning**: Tog bort redundanta gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Länkvalidering**: Alla 21+ interna länkar i Kurskartstabellen verifierade

### [v3.16.0] - 2026-02-05

#### Produktnamnsuppdateringar
**Denna version uppdaterar produktreferenser till nuvarande Microsoft-varumärke.**

#### Ändrat
- **Microsoft Foundry → Microsoft Foundry**: Alla referenser uppdaterade i icke-översättningsfiler
- **Azure AI Agent Service → Foundry Agents**: Servicenamn uppdaterat för att återspegla aktuell varumärkesprofil

#### Uppdaterade filer
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Större omstrukturering av repo: Kapitelbaserade mappnamn
**Denna version omstrukturerar dokumentationen till dedikerade kapitelmappar för tydligare navigering.**

#### Mappändringar
Gamla mappar har ersatts med kapitelnumrerade mappar:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Fillflyttningar
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

#### Tillagt
- **📚 Kapitel-README-filer**: Skapade README.md i varje kapitelmapp med:
  - Lärandemål och varaktighet
  - Lektionstabell med beskrivningar
  - Snabbstartskommandon
  - Navigering till andra kapitel

#### Ändrat
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i alla dokumentfiler
- **🗺️ Huvud-README.md**: Uppdaterade Kurskarta med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Borttaget
- Gammal mappstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositorieomstrukturering: Kapitelnavigering
**Denna version lade till README-filer för kapitelnavigering (ersattes av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide för AI-agenter
**Denna version lägger till en omfattande guide för att distribuera AI-agenter med Azure Developer CLI.**

#### Tillagt
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chattbotar
  - Tre snabbstartsagentmallar (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmönster (enkel agent, RAG, multi-agent)
  - Konfiguration och anpassning av verktyg
  - Övervakning och mätning
  - Kostnadsöverväganden och optimering
  - Vanliga felsökningsscenarier
  - Tre praktiska övningar med framgångskriterier

#### Innehållsstruktur
- **Introduktion**: Agentkoncept för nybörjare
- **Snabbstart**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmönster**: Visuella diagram av agentmönster
- **Konfiguration**: Verktygsinställning och miljövariabler
- **Övervakning**: Integration med Application Insights
- **Övningar**: Progressivt praktiskt lärande (20–45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### Uppdatering av DevContainer-miljön
**Denna version uppdaterar utvecklingscontainerkonfigurationen med moderna verktyg och bättre standardinställningar för AZD-inlärningsupplevelsen.**

#### Ändrat
- **🐳 Basimage**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (senaste Debian-stabila)
- **📛 Containernamn**: Omdöpt från "Python 3" till "AZD for Beginners" för tydlighet

#### Tillagt
- **🔧 Nya Dev Container-funktioner**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för distribution av containerappar

- **🔌 Portvidarebefordran**: Förkonfigurerade portar för vanlig utveckling:
  - 8000 (MkDocs-förhandsvisning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code-tillägg**:
  - `ms-python.vscode-pylance` - Förbättrad Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-stöd
  - `ms-azuretools.vscode-docker` - Docker-stöd
  - `ms-azuretools.vscode-bicep` - Bicep-språkstöd
  - `ms-azure-devtools.azure-resource-groups` - Azure-resurshantering
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-lintning
  - `bierner.markdown-mermaid` - Mermaid-diagramstöd
  - `redhat.vscode-yaml` - YAML-stöd (för azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-inställningar**: Lagt till standardinställningar för Python-tolk, formatera vid sparande och borttagning av blanksteg

- **📦 Uppdaterade requirements-dev.txt**:
  - Lagt till MkDocs minify-plugin
  - Lagt till pre-commit för kodkvalitet
  - Lagt till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fixat
- **Post-create-kommando**: Verifierar nu AZD och Azure CLI-installation vid containerstart

---

### [v3.11.0] - 2026-02-05

#### README-översyn för nybörjare
**Denna version förbättrar README.md avsevärt för att vara mer tillgänglig för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Tillagt
- **🆚 Azure CLI vs AZD-jämförelse**: Klar förklaring om när man ska använda varje verktyg med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direkta länkar till communitymallsgalleri och bidragsresurser:
  - [Fantastiskt AZD-galleri](https://azure.github.io/awesome-azd/) - 200+ färdiga att distribuera mallar
  - [Skicka in en mall](https://github.com/Azure/awesome-azd/issues) - Communitybidrag
- **🎯 Snabbstartsguide**: Förenklad 3-stegs introduktionssektion (Installera → Logga in → Distribuera)
- **📊 Navigeringstabell baserad på erfarenhet**: Tydlig vägledning om var man ska börja baserat på utvecklarens erfarenhet

#### Ändrat
- **README-struktur**: Omdisponerad för successivt avslöjande - viktig information först
- **Introduktionssektion**: Omskriven för att förklara "The Magic of `azd up`" för fullständiga nybörjare
- **Borttaget duplicerat innehåll**: Tog bort duplicerad felsökningssektion
- **Felsökningskommandon**: Fixade referensen `azd logs` till att använda giltigt `azd monitor --logs`

#### Fixat
- **🔐 Autentiseringskommandon**: Lagt till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga kommando-referenser**: Tog bort återstående `azd logs` från README:s felsökningssektion

#### Anteckningar
- **Omfattning**: Ändringar tillämpade på huvud-README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringarna riktade specifikt till utvecklare nya till AZD

---

### [v3.10.0] - 2026-02-05

#### Uppdatering av korrektheten i Azure Developer CLI-kommandon
**Denna version korrigerar icke-existerande AZD-kommandon i dokumentationen och säkerställer att alla kodexempel använder giltig Azure Developer CLI-syntax.**

#### Fixat
- **🔧 Icke-existerande AZD-kommandon borttagna**: Omfattande granskning och korrigering av ogiltiga kommandon:
  - `azd logs` (existerar inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` underkommandon (existerar inte) → ersatta med `azd show` och Azure CLI
  - `azd infra import/export/validate` (existerar inte) → borttagna eller ersatta med giltiga alternativ
  - flaggorna `azd deploy --rollback/--incremental/--parallel/--detect-changes` (existerar inte) → borttagna
  - flaggorna `azd provision --what-if/--rollback` (existerar inte) → uppdaterade för att använda `--preview`
  - `azd config validate` (existerar inte) → ersatt med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (existerar inte) → borttagna

- **📚 Filer uppdaterade med kommando-korrigeringar**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Changed hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Ändrat
- **Rollback-strategier**: Uppdaterade dokumentationen för att använda Git-baserad rollback (AZD har ingen inbyggd rollback)
- **Loggvisning**: Ersatte `azd logs`-referenser med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektionen**: Tog bort icke-existerande parallella/incrementella distributionsflaggor, gav giltiga alternativ

#### Tekniska detaljer
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Anteckningar
- **Verifiering**: Kommandon validerade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Slutförande av workshop och uppdatering av dokumentationskvalitet
**Denna version slutför de interaktiva workshopmodulerna, åtgärdar alla brutna dokumentationslänkar och förbättrar den övergripande innehållskvaliteten för AI-utvecklare som använder Microsoft AZD.**

#### Lagt till
- **📝 CONTRIBUTING.md**: Nyt dokument med bidragsriktlinjer med:
  - Tydliga instruktioner för att rapportera problem och föreslå ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och konventioner för commit-meddelanden
  - Information om community-engagemang

#### Slutfört
- **🎯 Workshop Module 7 (Wrap-up)**: Fullständigt slutförd avslutningsmodul med:
  - Omfattande sammanfattning av workshopens prestationer
  - Avsnitt om huvudkoncept som täcker AZD, templates och Microsoft Foundry
  - Rekommendationer för fortsatt läranderesa
  - Workshoputmaningar med svårighetsgrader
  - Länkar för community-feedback och support

- **📚 Workshop Module 3 (Deconstruct)**: Uppdaterade lärandemål med:
  - Vägledning för aktivering av GitHub Copilot med MCP-servrar
  - Förståelse av AZD template-mappstruktur
  - Organisationsmönster för infrastruktursom-kod (Bicep)
  - Praktiska labbinstruktioner

- **🔧 Workshop Module 6 (Teardown)**: Slutförd med:
  - Målsättningar för resurserensning och kostnadshantering
  - `azd down` användning för säker avveckling av infrastruktur
  - Vägledning för återställning av mjukborttagna kognitiva tjänster
  - Bonusutforskningsuppgifter för GitHub Copilot och Azure Portal

#### Åtgärdat
- **🔗 Åtgärdade brutna länkar**: Åtgärdade 15+ brutna interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerade sökvägar till ai-model-deployment.md och production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fixade sökvägar till FAQ och felsökningsguide
  - `examples/container-app/microservices/README.md`: Korrigerade sökvägar till course home och deployment guide
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade AI-kapitelsreferenser
  - `course-outline.md`: Fixade referenser till instructor guide och AI workshop lab

- **📅 Workshopstatusbanner**: Uppdaterad från "Under Construction" till aktiv workshopstatus med februari 2026-datum

- **🔗 Workshopnavigering**: Åtgärdade brutna navigationslänkar i workshop README.md som pekade på den icke-existerande mappen lab-1-azd-basics

#### Ändrat
- **Workshoppresentation**: Tog bort varningen "under construction", workshopen är nu komplett och redo att användas
- **Navigationskonsekvens**: Säkerställde att alla workshopmoduler har korrekt navigering mellan moduler
- **Referenser i lärvägen**: Uppdaterade kapitelkorsreferenser för att använda korrekta microsoft-foundry-sökvägar

#### Validerat
- ✅ Alla engelska markdownfiler har giltiga interna länkar
- ✅ Workshopmoduler 0-7 är kompletta med lärandemål
- ✅ Navigering mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehållna genomgående
- ✅ CONTRIBUTING.md ger tydlig vägledning för community-bidragsgivare

#### Teknisk implementering
- **Länkvalidering**: Automatiskt PowerShell-skript verifierade alla .md interna länkar
- **Innehållsgranskning**: Manuell granskning av workshopens fullständighet och lämplighet för nybörjare
- **Navigationssystem**: Konsekventa navigationsmönster mellan kapitel och moduler tillämpade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast på engelskspråkig dokumentation
- **Översättningar**: Översättningsmappar uppdaterades inte i denna version (automatisk översättning synkroniseras senare)
- **Workshopens varaktighet**: Kompletta workshopen erbjuder nu 3-4 timmars praktiskt lärande

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, säkerhet och multi-agent-mönster
**Denna version lägger till omfattande A-gradsläxor om Application Insights-integration, autentiseringsmönster och multi-agent-koordinering för produktionsdistributioner.**

#### Lagt till
- **📊 Application Insights Integration Lesson**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad distribution med automatisk provisioning
  - Kompletta Bicep-mallar för Application Insights + Log Analytics
  - Fungerande Python-applikationer med anpassad telemetri (1,200+ lines)
  - AI/LLM-övervakningsmönster (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriflöde)
  - 3 praktiska övningar (larm, dashboards, AI-övervakning)
  - Kusto-frågeexempel och strategier för kostnadsoptimering
  - Live metrikströmning och felsökning i realtid
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (connection strings, Key Vault, managed identity)
  - Kompletta Bicep-infrastrukturmallar för säkra distributioner
  - Node.js-applikationskod med Azure SDK-integration
  - 3 kompletta övningar (enable managed identity, user-assigned identity, Key Vault rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara lösenordsfria autentiseringsmönster

- **🤖 Multi-Agent Coordination Patterns Lesson**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmönster (sequential, parallel, hierarchical, event-driven, consensus)
  - Komplett orchestrator-tjänstimplementering (Python/Flask, 1,500+ lines)
  - 3 specialiserade agentimplementationer (Research, Writer, Editor)
  - Service Bus-integration för meddelandeköning
  - Cosmos DB state management för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logic, circuit breaker)
  - Kostnadsuppdelning ($240-565/month) med optimeringsstrategier
  - Application Insights-integration för övervakning

#### Förbättrat
- **Pre-deployment Chapter**: Inkluderar nu omfattande övervakning och koordinationsmönster
- **Getting Started Chapter**: Förbättrad med professionella autentiseringsmönster
- **Produktionsberedskap**: Full täckning från säkerhet till observerbarhet
- **Kursöversikt**: Uppdaterad för att referera de nya lektionerna i Chapter 3 och 6

#### Ändrat
- **Lärprogression**: Bättre integration av säkerhet och övervakning genom kursen
- **Dokumentationskvalitet**: Konsekventa A-gradstandarder (95-97%) över nya lektioner
- **Produktionsmönster**: Fulländad end-to-end täckning för företagsdistributioner

#### Förbättrad
- **Utvecklarupplevelse**: Tydlig bana från utveckling till produktionsövervakning
- **Säkerhetsstandarder**: Professionella mönster för autentisering och hemlighetshantering
- **Observerbarhet**: Komplett Application Insights-integration med AZD
- **AI-arbetslaster**: Specialiserad övervakning för Microsoft Foundry Models och multi-agent-system

#### Validerat
- ✅ Alla lektioner inkluderar komplett fungerande kod (inte utdrag)
- ✅ Mermaid-diagram för visuellt lärande (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsklara Bicep-mallar distribuerbara via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Resultat av dokumentationsgradering
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agent-arkitekturer
- **Övergripande nytt innehåll**: - Konsekventa högkvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Autentisering**: Managed Identity + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Övervakning**: Live-metrik + Kusto-frågor + larm + dashboards
- **Kostnadshantering**: Samplingstrategier, retention policies, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättringar av dokumentationskvalitet och nytt Microsoft Foundry Models-exempel
**Denna version förbättrar dokumentationskvaliteten i hela arkivet och lägger till ett komplett Microsoft Foundry Models-distributionsexempel med gpt-4.1 chattgränssnitt.**

#### Lagt till
- **🤖 Microsoft Foundry Models Chat Example**: Komplett gpt-4.1-distribution med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 model deployment)
  - Python kommandorads-chattgränssnitt med konversationshistorik
  - Key Vault-integration för säker lagring av API-nycklar
  - Tokenanvändningsspårning och kostnadsuppskattning
  - Rate limiting och felhantering
  - Omfattande README med 35-45 minute deployment guide
  - 11 produktionsfärdiga filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lagt till praktiska övningar i konfigurationsguiden:
  - Övning 1: Konfiguration för flera miljöer (15 minuter)
  - Övning 2: Övning i hantering av hemligheter (10 minuter)
  - Tydliga framgångskriterier och verifieringssteg
- **✅ Distributionsverifiering**: Lagt till verifieringssektion i distributionsguiden:
  - Hälsokontrollprocedurer
  - Checklista för framgångskriterier
  - Förväntade utdata för alla distributionskommandon
  - Snabbreferens för felsökning

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-gradskvalitet (93%):
  - Lagt till azure-openai-chat i alla relevanta sektioner
  - Uppdaterat antal lokala exempel från 3 till 4
  - Lagt till i tabellen för AI-applikationsexempel
  - Integrerat i Quick Start för intermediära användare
  - Lagt till i Microsoft Foundry Templates-sektionen
  - Uppdaterat jämförelsematrisen och teknologifinderavsnitten
- **Dokumentationskvalitet**: Förbättrad från B+ (87%) → A- (92%) i docs-mappen:
  - Lagt till förväntade utdata för kritiska kommandosexempel
  - Inkluderat verifieringssteg för konfigurationsändringar
  - Förbättrat praktiskt lärande med handgripliga övningar

#### Ändrat
- **Lärprogression**: Bättre integration av AI-exempel för intermediära elever
- **Dokumentationsstruktur**: Mer handlingsbara övningar med tydliga resultat
- **Verifieringsprocess**: Explicit framgångskriterier tillagda i nyckelarbetsflöden

#### Förbättrad
- **Utvecklarupplevelse**: Microsoft Foundry Models-distributionen tar nu 35-45 minuter (jmf 60-90 för komplexa alternativ)
- **Kostnadstransparens**: Tydliga kostnadsuppskattningar ($50-200/month) för Microsoft Foundry Models-exemplet
- **Lärväg**: AI-utvecklare har en tydlig ingång med azure-openai-chat
- **Dokumentationsstandarder**: Konsekventa förväntade utdata och verifieringssteg

#### Validerat
- ✅ Microsoft Foundry Models-exempel fullt fungerande med `azd up`
- ✅ Alla 11 implementationsfiler syntaktiskt korrekta
- ✅ README-instruktioner matchar faktisk distributionsupplevelse
- ✅ Dokumentationslänkar uppdaterade på 8+ platser
- ✅ Examples-indexet speglar korrekt 4 lokala exempel
- ✅ Inga dubbletter av externa länkar i tabeller
- ✅ Alla navigationsreferenser korrekta

#### Teknisk implementering
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mönster
- **Säkerhet**: Managed Identity redo, hemligheter i Key Vault
- **Övervakning**: Application Insights-integration
- **Kostnadshantering**: Tokenspårning och optimering av användning
- **Distribution**: Enkelt `azd up`-kommando för komplett setup

### [v3.6.0] - 2025-11-19

#### Större uppdatering: Exempel på distribution av Container App
**Denna version introducerar omfattande, produktionsklara exempel för distribution av containerapplikationer med Azure Developer CLI (AZD), med full dokumentation och integration i lärvägen.**

#### Lagt till
- **🚀 Container App Examples**: Nya lokala exempel i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett översikt av containeriserade distributioner, snabbstart, produktion och avancerade mönster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybörjarvänligt REST API med scale-to-zero, hälsokontroller, övervakning och felsökning
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsklar fler-tjänstdistribution (API Gateway, Product, Order, User, Notification), asynkron meddelandehantering, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blue-green/canary-distribution
- **Bästa praxis**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-riktlinjer för containeriserade arbetslaster
- **Kodexempel**: Komplett `azure.yaml`, Bicep-mallar och flerspråkliga tjänsteimplementationer (Python, Node.js, C#, Go)
- **Testning & felsökning**: End-to-end-testscenarier, övervakningskommandon, felsökningsvägledningar

#### Ändrat
- **README.md**: Uppdaterad för att visa och länka nya container-appsexempel under "Lokala exempel - Container Applications"
- **examples/README.md**: Uppdaterad för att framhäva container-appsexempel, lägga till poster i jämförelsematrisen och uppdatera teknik-/arkitekturreferenser
- **Course Outline & Study Guide**: Uppdaterad för att hänvisa till nya container-appsexempel och distribueringsmönster i berörda kapitel

#### Validerat
- ✅ Alla nya exempel kan driftsättas med `azd up` och följer bästa praxis
- ✅ Dokumentationens korslänkar och navigering uppdaterade
- ✅ Exemplen täcker nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Anteckningar
- **Omfattning**: Endast engelskspråkig dokumentation och exempel
- **Nästa steg**: Utöka med ytterligare avancerade containermönster och CI/CD-automation i kommande utgåvor

### [v3.5.0] - 2025-11-19

#### Produktomprofilering: Microsoft Foundry
**Denna version genomför en omfattande namnändring av produkten från "Microsoft Foundry" till "Microsoft Foundry" i all engelskspråkig dokumentation, i enlighet med Microsofts officiella omprofilering.**

#### Ändrat
- **🔄 Uppdatering av produktnamn**: Komplett omprofilering från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i den engelska dokumentationen i mappen `docs/`
  - Omdöpt mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdöpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade i 7 dokumentationsfiler

- **📁 Ändringar i mappstruktur**:
  - `docs/ai-foundry/` omdöpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att återspegla den nya mappstrukturen
  - Navigationslänkar validerade i hela dokumentationen

- **📄 Filnamnsändringar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att peka på det nya filnamnet

#### Uppdaterade filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslänkar uppdaterade
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Använder redan Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitelnavigeringslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa-kapitel-länkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigering, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigationslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapiteltitlar, mallsektion, communityinsikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitelsresurser)

#### Validerat
- ✅ Inga återstående "ai-foundry" mappsökvägsreferenser i de engelska dokumenten
- ✅ Inga kvarvarande referenser till produktnamnet "Microsoft Foundry" i de engelska dokumenten
- ✅ Alla navigationslänkar fungerar med den nya mappstrukturen
- ✅ Fil- och mappomdöpningar genomförda framgångsrikt
- ✅ Korsreferenser mellan kapitel validerade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast på engelskspråkig dokumentation i mappen `docs/`
- **Översättningar**: Översättningsmappar (`translations/`) uppdaterades inte i denna version
- **Workshop**: Workshopmaterial (`workshop/`) uppdaterades inte i denna version
- **Exempel**: Exempelfiler kan fortfarande referera till legacy-namn (åtgärdas i framtida uppdatering)
- **Externa länkar**: Externa URL:er och GitHub-referenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Ifall du har lokala grenar eller dokumentation som refererar den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ersätt produktnamnet: "Microsoft Foundry" → "Microsoft Foundry"
4. Validera att alla interna dokumentationslänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förhandsgranskning av infrastruktur och valideringsförbättringar
**Denna version introducerar omfattande stöd för den nya förhandsgranskningsfunktionen i Azure Developer CLI och förbättrar användarupplevelsen för workshopdeltagare.**

#### Lagt till
- **🧪 Dokumentation för azd provision --preview-funktionen**: Omfattande täckning av den nya förhandsgranskningsmöjligheten för infrastruktur
  - Kommandoreferens och användningsexempel i fuskblad
  - Detaljerad integration i provisionsguiden med användningsfall och fördelar
  - Förhandskontrollsintegration för säkrare driftsättningsvalidering
  - Uppdateringar i introduktionsguiden med säkerhetsfokuserade driftsättningsrutiner
- **🚧 Workshop-statusbanner**: Professionell HTML-banner som indikerar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Senast uppdaterad-tidsstämpel för transparens
  - Mobilresponsiv design för alla enhetstyper

#### Förbättrat
- **Infrastrukturssäkerhet**: Förhandsgranskningsfunktionalitet integrerad i hela driftsättningsdokumentationen
- **Förvalidering före driftsättning**: Automatiserade skript inkluderar nu test för infrastrukturförhandsgranskning
- **Utvecklarflöde**: Uppdaterade kommando-sekvenser som inkluderar förhandsgranskning som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar för användare om innehållets utvecklingsstatus

#### Ändrat
- **Driftsättningsbästa praxis**: Förhandsgransknings-först arbetsflöde rekommenderas nu
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i lärandeprocessen
- **Workshoppresentation**: Professionell statuskommunikation med klar utvecklingstidslinje

#### Förbättrad
- **Säkerhetsförst-ansats**: Infrastrukturändringar kan nu valideras innan driftsättning
- **Team-samarbete**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader före provisionering
- **Riskminimering**: Minskade driftsättningsfel genom förhandsvalidering

#### Teknisk implementering
- **Multidokumentintegration**: Förhandsgranskningsfunktionen dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel i hela dokumentationen
- **Bästa praxis-integration**: Förhandsgranskning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NY funktion-markeringar för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientstil
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Bibehåller repo:tillit samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Senast uppdaterad oktober 2025-tidsstämpel för ansvarsskyldighet

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktivt lärande
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärvägar.**

#### Lagt till
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs-förhandsgranskning
- **📝 Strukturerade workshopinstruktioner**: 7-stegs guidad lärväg från upptäckt till anpassning
  - 0-Introduktion: Workshopöversikt och uppstart
  - 1-Välj-AI-mall: Mallupptäckt och urvalsprocess
  - 2-Validera-AI-mall: Driftsättning och valideringsprocedurer
  - 3-Dekonstruera-AI-mall: Förstå mallens arkitektur
  - 4-Konfigurera-AI-mall: Konfiguration och anpassning
  - 5-Anpassa-AI-mall: Avancerade modifieringar och iterationer
  - 6-Riv-ned-infrastruktur: Rensning och resursförvaltning
  - 7-Avslut: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad lärupplevelse
- **🎯 Praktisk lärväg**: 3-stegs metodik (Upptäckt → Driftsättning → Anpassning)
- **📱 GitHub Codespaces-integration**: Sömlös setup av utvecklingsmiljö

#### Förbättrat
- **AI Workshop-labb**: Utökad med en omfattande 2-3 timmars strukturerad lärupplevelse
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Lärprogression**: Tydlig steg-för-steg-vägledning från val av mall till produktionsdriftsättning
- **Utvecklarupplevelse**: Integrerade verktyg för strömlinjeformade utvecklingsarbetsflöden

#### Förbättrad
- **Tillgänglighet**: Webbgränssnitt med sök, kopiera-funktionalitet och temaväxling
- **Självstyrt lärande**: Flexibel workshopstruktur som rymmer olika inlärningshastigheter
- **Praktisk tillämpning**: Verkliga AI-mallimplementeringar
- **Community-integration**: Discord-integration för workshopsupport och samarbete

#### Workshopfunktioner
- **Inbyggd sökfunktion**: Snabb sökning av nyckelord och lektioner
- **Kopiera kodblock**: Hover-to-copy-funktionalitet för alla kodexempel
- **Temaväxling**: Stöd för mörkt/ljust läge efter preferens
- **Visuella tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt åtkomst till Discord för communitysupport

### [v3.2.0] - 2025-09-17

#### Storskalig navigeringsomstrukturering och kapitelbaserat lärsystem
**Denna version introducerar en omfattande kapitelbaserad lärstruktur med förbättrad navigering i hela repositoryt.**

#### Lagt till
- **📚 Kapitelbaserat lärsystem**: Omstrukturerade hela kursen i 8 progressiva lärkapitel
  - Kapitel 1: Grund & Kom igång (⭐ - 30-45 min)
  - Kapitel 2: AI-först utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kod & driftsättning (⭐⭐⭐ - 1-1.5 timmar)
  - Kapitel 5: Multi-agent AI-lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Förvalidering & planering före driftsättning (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & debugging (⭐⭐ - 1-1.5 timmar)
  - Kapitel 8: Produktions- & företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigationssystem**: Konsekventa navigationshuvuden och -fötter i hela dokumentationen
- **🎯 Framstegsspårning**: Kursavslutningschecklista och verifieringssystem för lärande
- **🗺️ Vägledning för lärväg**: Tydliga startpunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskaper tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelsammanhang och progression
- **Mallorganisation**: Exempel och mallar kartlagda till lämpliga kapitel
- **Resursintegration**: Fuskblad, vanliga frågor och studiehandledningar kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labb kopplade till flera kapitelmål

#### Ändrat
- **Lärprogression**: Flytt från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Konfigurationsguiden omplacerad till Kapitel 3 för bättre inlärningsflöde
- **AI-innehålls-integration**: Bättre integration av AI-specifikt innehåll genom hela lärresan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättrad
- **Användarupplevelse**: Tydliga navigationsbrödsmulor och indikatorer för kapitelsprogression
- **Tillgänglighet**: Konsekventa navigationsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetslik struktur lämplig för akademisk och företagsutbildning
- **Inlärningseffektivitet**: Minskat tidsbehov för att hitta relevant innehåll genom förbättrad organisation

#### Teknisk implementering
- **Navigationshuvuden**: Standardiserad kapitelnavigering i över 40 dokumentationsfiler
- **Foter-navigering**: Konsekvent guidning för progression och indikatorer för kapitelavslut
- **Korslänkning**: Omfattande intern länkning som kopplar relaterade begrepp
- **Kapitelkartläggning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättring av studiehandledning
- **📚 Omfattande lärandemål**: Studiehandledningen omstrukturerad för att följa det 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel innehåller specifika lärandemål och praktiska övningar
- **📋 Framstegsspårning**: Veckoplanering med mätbara resultat och avcheckningslistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska övningar**: Hands-on-aktiviteter med verkliga driftsättningsscenarier och felsökning
- **📊 Kompetensprogression**: Klar avancering från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och communityerkännande
- **⏱️ Tidsplanering**: Strukturerad 10-veckors läroplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade multi-agent AI-lösningar
**Denna version förbättrar multi-agent-lösningen för detaljhandel med tydligare agentnamn och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent-terminologi**: "Cora agent" ersatt med "Customer agent" i hela detaljhandelslösningen för multi-agenter för tydligare förståelse
- **Agentarkitektur**: Uppdaterade all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Customer agent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsekvens**: Säkrat att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM Template Package**: Uppdaterad retail-multiagent-arm-template med referenser till Customer-agenten
- **Architecture Diagrams**: Uppdaterade Mermaid-diagram med uppdaterad agentnamngivning
- **Code Examples**: Python-klasser och implementationsexempel använder nu CustomerAgent-namn
- **Environment Variables**: Uppdaterade alla deploy-skript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrat
- **Developer Experience**: Tydligare agentroller och ansvar i dokumentationen
- **Production Readiness**: Bättre anpassning till företagsnamngivningskonventioner
- **Learning Materials**: Mer intuitiv agentnamngivning för utbildningssyften
- **Template Usability**: Förenklad förståelse av agentfunktioner och deploy-mönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med CustomerAgent-referenser
- Ersatte CoraAgent-klassnamn med CustomerAgent i Python-exempel
- Modifierade ARM-template JSON-konfigurationer för att använda "customer" agenttyp
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Uppfräschade alla deploy-kommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - Fokus på AI-utvecklare och Microsoft Foundry-integration
**Denna version förvandlar arkivet till en omfattande AI-inriktad lärresurs med Microsoft Foundry-integration.**

#### Lagt till
- **🤖 AI-First Learning Path**: Fullständig omstrukturering med prioritet för AI-utvecklare och ingenjörer
- **Microsoft Foundry Integration Guide**: Omfattande dokumentation för att koppla AZD till Microsoft Foundry-tjänster
- **AI Model Deployment Patterns**: Detaljerad guide som täcker modellval, konfiguration och produktionsdeploystrategier
- **AI Workshop Lab**: 2–3 timmars praktiskt workshop för att konvertera AI-applikationer till AZD-deployerbara lösningar
- **Production AI Best Practices**: Företagsklara mönster för skalning, övervakning och säkring av AI-workloads
- **AI-Specific Troubleshooting Guide**: Omfattande felsökningsguide för Microsoft Foundry-modeller, Cognitive Services och AI-deployproblem
- **AI Template Gallery**: Utvald samling Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshop Materials**: Komplett workshopstruktur med praktiska labb och referensmaterial

#### Förbättrat
- **README Structure**: AI-utvecklarfokuserad med 45% communityintresse-data från Microsoft Foundry Discord
- **Learning Paths**: Dedikerad AI-utvecklarresa tillsammans med traditionella vägar för studenter och DevOps-ingenjörer
- **Template Recommendations**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Community Integration**: Förbättrat Discord-communitystöd med AI-specifika kanaler och diskussioner

#### Säkerhet & produktionsfokus
- **Managed Identity Patterns**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Cost Optimization**: Spårning av tokenanvändning och budgetkontroller för AI-workloads
- **Multi-Region Deployment**: Strategier för global distribution av AI-applikationer
- **Performance Monitoring**: AI-specifika mätvärden och Application Insights-integration

#### Dokumentationskvalitet
- **Linear Course Structure**: Logisk progression från nybörjare till avancerade AI-deploymönster
- **Validated URLs**: Alla externa repository-länkar verifierade och tillgängliga
- **Complete Reference**: Alla interna dokumentationslänkar validerade och funktionella
- **Production Ready**: Företagsdeploymönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Omstrukturering av repository och professionell förbättring
**Denna version representerar en betydande översyn av repository-strukturen och innehållspresentationen.**

#### Lagt till
- **Structured Learning Framework**: Alla dokumentationssidor inkluderar nu Avsnitt för Introduktion, Lärandemål och Lärandets resultat
- **Navigation System**: Lade till Previous/Next-lesson-länkar genom hela dokumentationen för guidad lärandeprogression
- **Study Guide**: Omfattande study-guide.md med lärandemål, övningar och bedömningsmaterial
- **Professional Presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och ett mer professionellt utseende
- **Enhanced Content Structure**: Förbättrad organisering och flöde av lärmaterial

#### Ändrat
- **Documentation Format**: Standardiserade all dokumentation med konsekvent lärandefokuserad struktur
- **Navigation Flow**: Implementerat logisk progression genom allt lärmaterial
- **Content Presentation**: Tog bort dekorativa element till förmån för tydlig, professionell formatering
- **Link Structure**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrat
- **Accessibility**: Tog bort emoji-beroenden för bättre skärmläsarkompatibilitet
- **Professional Appearance**: Ren, akademisk stil lämplig för företagsutbildning
- **Learning Experience**: Strukturerad metod med tydliga mål och utfall för varje lektion
- **Content Organization**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första utgåvan - Omfattande AZD-lärrepository

#### Lagt till
- **Core Documentation Structure**
  - Komplett serie med getting-started-guider
  - Omfattande dokumentation för deployment och provisioning
  - Detaljerade felsökningsresurser och debug-guider
  - Verktyg och procedurer för förvalidering före deployment

- **Getting Started Module**
  - AZD Basics: Kärnkoncept och terminologi
  - Installation Guide: Plattformsspecifika installationsinstruktioner
  - Configuration Guide: Miljöinställning och autentisering
  - First Project Tutorial: Steg-för-steg praktisk introduktion

- **Deployment and Provisioning Module**
  - Deployment Guide: Komplett arbetsflödesdokumentation
  - Provisioning Guide: Infrastructure as Code med Bicep
  - Bästa praxis för produktionsdeployments
  - Multi-service-arkitekturmönster

- **Pre-deployment Validation Module**
  - Capacity Planning: Validering av Azure-resursers tillgänglighet
  - SKU Selection: Omfattande vägledning för servicetierval
  - Pre-flight Checks: Automatiserade valideringsskript (PowerShell och Bash)
  - Kostnadsestimering och budgetplaneringsverktyg

- **Troubleshooting Module**
  - Common Issues: Vanliga problem och lösningar
  - Debugging Guide: Systematiska felsökningsmetodiker
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resources and References**
  - Command Cheat Sheet: Snabbreferens för viktiga kommandon
  - Glossary: Omfattande terminologi- och förkortningslista
  - FAQ: Utförliga svar på vanliga frågor
  - Externa resurslänkar och community-kopplingar

- **Examples and Templates**
  - Enkelt webbapplikationsexempel
  - Template för statisk webbplatsdeploy
  - Containerapplikationskonfiguration
  - Databasintegrationsmönster
  - Mikrotjänstarkitektur-exempel
  - Serverless-funktionsimplementationer

#### Funktioner
- **Multi-Platform Support**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Multiple Skill Levels**: Innehåll utformat för studenter till professionella utvecklare
- **Practical Focus**: Hands-on-exempel och verklighetstrogna scenarier
- **Comprehensive Coverage**: Från grundläggande koncept till avancerade företagsmönster
- **Security-First Approach**: Säkerhetsbästa praxis integrerad genom hela materialet
- **Cost Optimization**: Riktlinjer för kostnadseffektiva deployment- och resursstrategier

#### Dokumentationskvalitet
- **Detailed Code Examples**: Praktiska, testade kodexempel
- **Step-by-Step Instructions**: Tydlig, handlingsbar vägledning
- **Comprehensive Error Handling**: Felsökning för vanliga problem
- **Best Practices Integration**: Branschstandarder och rekommendationer
- **Version Compatibility**: Uppdaterad med de senaste Azure-tjänsterna och azd-funktionerna

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### AI-plattformsutvidgning
- **Multi-Model Support**: Integrationsmönster för Hugging Face, Azure Machine Learning och egna modeller
- **AI Agent Frameworks**: Mallar för LangChain, Semantic Kernel och AutoGen-deployments
- **Advanced RAG Patterns**: Vektor-databasalternativ utöver Azure AI Search (Pinecone, Weaviate, osv.)
- **AI Observability**: Förbättrad övervakning för modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Extension**: Integrerad AZD + Microsoft Foundry-utvecklingsupplevelse
- **GitHub Copilot Integration**: AI-assisterad AZD-mallgenerering
- **Interactive Tutorials**: Praktiska kodövningar med automatisk validering för AI-scenarier
- **Video Content**: Kompletterande videotutorials för visuella inlärare med fokus på AI-deployments

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Governance Framework**: AI-modellstyrning, efterlevnad och revisionsspår
- **Multi-Tenant AI**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI Deployment**: Integration med Azure IoT Edge och containerinstanser
- **Hybrid Cloud AI**: Multi-cloud och hybrid-deploymönster för AI-workloads

#### Avancerade funktioner
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning-pipelines
- **Advanced Security**: Zero-trust-mönster, privata endpoints och avancerat hot-skydd
- **Performance Optimization**: Avancerad tuning och skalningsstrategier för hög-throughput AI-applikationer
- **Global Distribution**: Innehållsleverans och edge-caching-mönster för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av nuvarande utgåva
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-Focused Content**: Omfattande Microsoft Foundry-integration (Slutförd)
- ✅ **Interactive Tutorials**: Praktiskt AI-workshoplab (Slutförd)
- ✅ **Advanced Security Module**: AI-specifika säkerhetsmönster (Slutförd)
- ✅ **Performance Optimization**: Tuningstrategier för AI-workloads (Slutförd)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Några slutförda i nuvarande release
- ✅ **Additional Examples**: AI-inriktade deploymentscenarier (Slutförd)
- ✅ **Extended FAQ**: AI-specifika frågor och felsökning (Slutförd)
- **Tool Integration**: Förbättrade IDE- och editorintegrationsguider
- ✅ **Monitoring Expansion**: AI-specifik övervakning och larmmönster (Slutförd)

#### Fortfarande planerat för framtida release
- **Mobile-Friendly Documentation**: Responsiv design för mobilinlärning
- **Offline Access**: Nedladdningsbara dokumentationspaket
- **Enhanced IDE Integration**: VS Code-extension för AZD + AI-arbetsflöden
- **Community Dashboard**: Realtids community-mätningar och bidragsuppföljning

## Att bidra till förändringsloggen

### Rapportera ändringar
När du bidrar till det här repositoryt, se till att changelog-poster innehåller:

1. **Version Number**: Följ semantisk versionering (major.minor.patch)
2. **Date**: Release- eller uppdateringsdatum i YYYY-MM-DD-format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Kortfattad beskrivning av vad som ändrats
5. **Impact Assessment**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Lagt till
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller verktyg

#### Ändrat
- Modifieringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Föråldrat
- Funktioner eller tillvägagångssätt som fasas ut
- Dokumentavsnitt planerade för borttagning
- Metoder som har bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller utfasade tillvägagångssätt
- Redundanta eller konsoliderade innehåll

#### Fixed
- Korrigeringar av fel i dokumentation eller kod
- Åtgärdande av rapporterade problem eller buggar
- Förbättringar av noggrannhet eller funktionalitet

#### Security
- Säkerhetsrelaterade förbättringar eller fixar
- Uppdateringar till säkerhetsbästa praxis
- Åtgärdande av sårbarheter

### Riktlinjer för semantisk versionering

#### Major Version (X.0.0)
- Brytande förändringar som kräver åtgärd från användaren
- Betydande omstrukturering av innehåll eller organisation
- Ändringar som ändrar den grundläggande metoden eller metodologin

#### Minor Version (X.Y.0)
- Nya funktioner eller innehållstillägg
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patch Version (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Communityfeedback och förslag

Vi uppmuntrar aktivt communityfeedback för att förbättra denna lärresurs:

### Hur man lämnar feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika frågor välkomna)
- **Discord Discussions**: Dela idéer och engagera dig med Microsoft Foundry-communityn
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community Forums**: Deltag i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI Content Accuracy**: Korrigeringar av AI-tjänsteintegration och deployinformation
- **Learning Experience**: Förslag för förbättrad AI-utvecklarkurs
- **Missing AI Content**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Accessibility**: Förbättringar för olika inlärningsbehov
- **AI Tool Integration**: Förslag för bättre AI-utvecklingsarbetsflödesintegration
- **Production AI Patterns**: Förfrågningar om företags-AI-deploymönster

### Åtagande för svar
- **Issue Response**: Inom 48 timmar för rapporterade problem
- **Feature Requests**: Utvärdering inom en vecka
- **Community Contributions**: Granskning inom en vecka
- **Security Issues**: Omedelbar prioritet med förtur vid svar

## Underhållsschema

### Regelbundna uppdateringar
- **Monthly Reviews**: Innehållsnoggrannhet och länkvalidering
- **Quarterly Updates**: Större innehållstillägg och förbättringar
- **Semi-Annual Reviews**: Omfattande omstrukturering och förbättringar
- **Annual Releases**: Stora versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetskontroll
- **Automated Testing**: Regelbunden validering av kodexempel och länkar
- **Community Feedback Integration**: Regelbunden införlivning av användarförslag
- **Technology Updates**: Anpassning till senaste Azure-tjänster och azd-utgåvor
- **Accessibility Audits**: Regelgranskning för inkluderande designprinciper

## Versionssupportpolicy

### Aktuell versionssupport
- **Senaste huvudversionen**: Fullt stöd med regelbundna uppdateringar
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska fixar under 12 månader
- **Äldre versioner**: Endast communitystöd, inga officiella uppdateringar

### Migreringsvägledning
När större versioner släpps tillhandahåller vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för migreringen
- **Kompatibilitetsanteckningar**: Detaljer om brytande ändringar
- **Verktygsstöd**: Skript eller verktyg för att hjälpa till med migreringen
- **Communitystöd**: Dedikerade forum för frågor om migrering

---

**Navigering**
- **Föregående lektion**: [Studieguide](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Huvud-README](README.md)

**Håll dig uppdaterad**: Övervaka detta repository för aviseringar om nya utgåvor och viktiga uppdateringar av undervisningsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->