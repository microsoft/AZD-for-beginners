# Changelog - AZD For Beginners

## Introduktion

Denne changelog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger principperne for semantisk versionsstyring og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne changelog vil du:
- Holde dig informeret om nye funktioner og tilføjet indhold
- Forstå forbedringer foretaget i eksisterende dokumentation
- Spore fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsudbytte

Efter at have gennemgået changelog-posterne vil du kunne:
- Identificere nyt indhold og ressourcer tilgængelige for læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringssti baseret på det mest aktuelle materiale
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.19.1] - 2026-03-27

#### Afklaring af begynder-onboarding, validering af opsætning & oprydning af endelige AZD-kommandoer
**Denne version følger op på AZD 1.23-valideringsgennemgangen med et begynderfokuseret dokumentationspas: den præciserer AZD-først autentificeringsvejledning, tilføjer lokale valideringsscripts til opsætning, verificerer nøglekommandoer mod den live AZD CLI, og fjerner de sidste forældede engelsksprogede kommando-referencer uden for changeloggen.**

#### Tilføjet
- **🧪 Begynder-valideringsscripts til opsætning** med `validate-setup.ps1` og `validate-setup.sh` så lærende kan bekræfte krævede værktøjer før start af Kapitel 1
- **✅ Indledende opsætningsvaliderings-trin** i roden README og Kapitel 1 README så manglende forudsætninger fanges inden `azd up`

#### Ændret
- **🔐 Begynder-autentificeringsvejledning** behandler nu konsekvent `azd auth login` som den primære vej for AZD-workflows, med `az login` nævnt som valgfri medmindre Azure CLI-kommandoer bruges direkte
- **📚 Kapitel 1 onboarding-flow** henviser nu lærende til at validere deres lokale opsætning før installation, autentificering og første implementeringstrin
- **🛠️ Validator-meddelelser** adskiller nu tydeligt blokerende krav fra valgfrie Azure CLI-advarsler for den AZD-only begyndersti
- **📖 Konfigurations-, fejlsøgnings- og eksempeldokumenter** skelner nu mellem påkrævet AZD-autentificering og valgfri Azure CLI-login hvor begge tidligere blev præsenteret uden kontekst

#### Rettet
- **📋 Resterende engelsksprogede kommando-referencer** opdateret til aktuelle AZD-former, inklusiv `azd config show` i hurtigreferencen og `azd monitor --overview` hvor Azure Portal-overbliksguidance var tiltænkt
- **🧭 Begynderpåstande i Kapitel 1** blødt op for at undgå at love fejlfrie eller tilbageførende handlinger på tværs af alle skabeloner og Azure-ressourcer
- **🔎 Live CLI-validering** bekræftede nuværende support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, og `azd down --force --purge`

#### Filer opdateret
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

#### AZD 1.23.12 Validering, Workshop-miljø-udvidelse & AI-modelopdatering
**Denne version udfører en dokumentationsvalideringsgennemgang mod `azd` `1.23.12`, opdaterer forældede AZD-kommandoeksempler, opdaterer AI-modelvejledningen til nuværende standarder, og udvider workshop-instruktionerne ud over GitHub Codespaces til også at understøtte dev-containere og lokale kloner.**

#### Tilføjet
- **✅ Valideringsnoter på tværs af kernekapitler og workshop-dokumenter** for at gøre den testede AZD-baseline eksplicit for lærende, der bruger nyere eller ældre CLI-builds
- **⏱️ Vejledning om implementeringstimeout** for langvarige AI-app-implementeringer ved brug af `azd deploy --timeout 1800`
- **🔎 Trin til inspektion af udvidelser** med `azd extension show azure.ai.agents` i AI-workflow-dokumenter
- **🌐 Bredere vejledning om workshop-miljøer** der dækker GitHub Codespaces, dev-containere og lokale kloner med MkDocs

#### Ændret
- **📚 Kapitel-intro README'er** bemærker nu konsekvent validering mod `azd 1.23.12` på tværs af foundation-, configuration-, infrastructure-, multi-agent-, pre-deployment-, troubleshooting- og production-sektioner
- **🛠️ AZD-kommando-referencer** opdateret til aktuelle former på tværs af dokumenterne:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` afhængigt af kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` hvor Application Insights-overblik er tiltænkt
- **🧪 Provision preview-eksempler** forenklet til nu understøttet brug såsom `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop-flow** opdateret så lærende kan gennemføre labs i Codespaces, en dev-container eller en lokal klon i stedet for at antage Codespaces-only udførelse
- **🔐 Autentificeringsvejledning** foretrækker nu `azd auth login` til AZD-workflows, med `az login` positioneret som valgfri når Azure CLI-kommandoer bruges direkte

#### Rettet
- **🪟 Windows-installationskommandoer** normaliseret til nuværende `winget` pakkecasings i installationsvejledningen
- **🐧 Linux-installationsvejledning** rettet for at undgå ikke-understøttede distro-specifikke `azd` pakkehåndteringsinstruktioner og i stedet henvise til release-artifakter hvor relevant
- **📦 AI-modeleksempler** opdateret fra ældre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nuværende eksempler såsom `gpt-4.1-mini`, `gpt-4.1`, og `text-embedding-3-large`
- **📋 Implementerings- og diagnostiksnippets** rettet til at bruge aktuelle miljø- og statuskommandoer i logs, scripts og fejlsøgningstrin
- **⚙️ GitHub Actions-vejledning** opdateret fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkevejledning** opdateret fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI-kapitlets vejledning** forklarer nu bedre preview-sensitive `azd ai`-adfærd, lejer-specifik login, nuværende udvidelsesbrug og opdaterede anbefalinger til modelimplementering
- **🧪 Workshop-instruktioner** bruger nu mere realistiske versionseksempler og klarere miljøopsætningssprog til hands-on labs
- **📈 Produktions- og fejlsøgningsdokumenter** stemmer nu bedre overens med aktuelle overvågnings-, fallback-model- og omkostningsniveaueksempler

#### Filer opdateret
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

#### AZD AI CLI-kommandoer, indholdsvalidering & skabelonudvidelse
**Denne version tilføjer dækning af `azd ai`, `azd extension`, og `azd mcp`-kommandoer på tværs af alle AI-relaterede kapitler, retter brudte links og forældet kode i agents.md, opdaterer hurtigreferencen, og omarbejder Afsnittet Eksempel-Skabeloner med validerede beskrivelser og nye Azure AI AZD-skabeloner.**

#### Tilføjet
- **🤖 AZD AI CLI-dækning** på tværs af 7 filer (tidligere kun i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny sektion "Extensions and AI Commands" der introducerer `azd extension`, `azd ai agent init`, og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` med sammenligningstabel (skabelon vs manifest-tilgang)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underskrifterne "AZD Extensions for Foundry" og "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start viser nu både skabelon- og manifest-baserede implementeringsveje
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sektionen inkluderer nu `azd ai agent init`-mulighed
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underafsnit "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Ny sektion "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI-eksempel-skabeloner** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel, og stemmechat-support
  - **azure-search-openai-demo-java** — Java RAG chat ved brug af Langchain4J med ACA/AKS implementeringsmuligheder
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp ved brug af Azure AI Agent Service, Bing Grounding, og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG ved brug af Azure Functions + LangChain.js + Cosmos DB med Ollama lokal udviklingssupport
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med adminportal, Teams-integration, og PostgreSQL/Cosmos DB muligheder
  - **azure-ai-travel-agents** — Multi-agent MCP-orkestreringsreferanceapp med servere i .NET, Python, Java, og TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep starter-skabelon
  - **🔗 Awesome AZD AI Gallery link** — Reference til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ skabeloner)

#### Rettet
- **🔗 agents.md navigation**: Forrige/Næste-links matcher nu Kapitel 2 README-lektionsrækkefølgen (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md brudte links**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md forældet kode**: Udskiftet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-tælling**: Udskiftet grov `len//4` estimering med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standardhost ændret okt 2024)
- **contoso-chat**: Opdateret beskrivelse til at referere Azure AI Foundry + Prompty, så den matcher repoets faktiske titel og tech stack

#### Fjernet
- **ai-document-processing**: Fjernet ikke-funktionelt skabelonreferencen (repo ikke offentligt tilgængeligt som en AZD-skabelon)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nu forventet output og `azd monitor`-trinnet; Øvelse 2 inkluderer fuld `FunctionTool`-registreringskode; Øvelse 3 erstatter vag vejledning med konkrete `prepdocs.py`-kommandoer
- **📚 agents.md resources**: Opdaterede dokumentationslinks til den aktuelle Azure AI Agent Service-dokumentation og hurtigstart
- **📋 agents.md Next Steps table**: Tilføjet AI Workshop Lab-link for fuld kapiteldækning

#### Filer opdateret
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Forbedring af kursusnavigation
**Denne version forbedrer README.md-kursusnavigationen med et forbedret tabelformat.**

#### Ændret
- **Course Map Table**: Forbedret med direkte lektionslinks, varighedsestimater og kompleksitetsvurderinger
- **Folder Cleanup**: Fjernede overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Alle 21+ interne links i Course Map-tabellen verificeret

### [v3.16.0] - 2026-02-05

#### Opdatering af produktnavne
**Denne version opdaterer produktreferencer til den aktuelle Microsoft-branding.**

#### Ændret
- **Microsoft Foundry → Microsoft Foundry**: Alle referencer opdateret på tværs af ikke-oversatte filer
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret for at afspejle den aktuelle branding

#### Filer opdateret
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

#### Større repository-omstrukturering: Kapitelbaserede mappenavne
**Denne version omstrukturerer dokumentationen i dedikerede kapitelmapper for tydeligere navigation.**

#### Omdøbte mapper
Gamle mapper er blevet erstattet med kapitelnummererede mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Filmigrationer
| Fil | Fra | Til |
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

#### Tilføjet
- **📚 Kapitel-README-filer**: Oprettet README.md i hver kapitelmappe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Hurtigstart-kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Opdaterede alle interne links**: 78+ stier opdateret på tværs af alle dokumentationsfiler
- **🗺️ Hoved-README.md**: Opdateret Course Map med ny kapitelstruktur
- **📝 examples/README.md**: Opdaterede krydsreferencer til kapitelmapper

#### Fjernet
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-omstrukturering: Kapitelnavigation
**Denne version tilføjede README-filer for kapitelnavigation (afløst af v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide til AI-agenter
**Denne version tilføjer en omfattende guide til udrulning af AI-agenter med Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Fuldstændig guide, der dækker:
  - Hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
  - Tre hurtigstart-agent-skabeloner (Foundry Agents, Prompty, RAG)
  - Agent-arkitekturmønstre (enkelt agent, RAG, multi-agent)
  - Værktøjskonfiguration og tilpasning
  - Overvågning og måling
  - Omkostningshensyn og optimering
  - Almindelige fejlsøgningsscenarier
  - Tre praktiske øvelser med succeskriterier

#### Indholdsstruktur
- **Introduction**: Agentkoncepter for begyndere
- **Quick Start**: Udrul agenter med `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visuelle diagrammer af agentmønstre
- **Configuration**: Værktøjopsætning og miljøvariabler
- **Monitoring**: Integration med Application Insights
- **Exercises**: Progressiv praktisk læring (20–45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Opdatering af DevContainer-miljøet
**Denne version opdaterer konfigurationen af udviklingscontaineren med moderne værktøjer og bedre standardindstillinger for AZD-læringsoplevelsen.**

#### Ændret
- **🐳 Base Image**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste Debian-stable)
- **📛 Container Name**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 Nye Dev Container-funktioner**:
  - `azure-cli` med Bicep-support aktiveret
  - `node:20` (LTS-version til AZD-skabeloner)
  - `github-cli` til skabelonstyring
  - `docker-in-docker` til container-app-udrulninger

- **🔌 Port Forwarding**: Forkonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nye VS Code-udvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-understøttelse
  - `ms-azuretools.vscode-docker` - Docker-understøttelse
  - `ms-azuretools.vscode-bicep` - Bicep-sprogunderstøttelse
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramunderstøttelse
  - `redhat.vscode-yaml` - YAML-understøttelse (til azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-indstillinger**: Tilføjede standardindstillinger for Python-interpreter, format ved gem og trimning af mellemrum

- **📦 Opdateret requirements-dev.txt**:
  - Tilføjet MkDocs minify-plugin
  - Tilføjet pre-commit til kodekvalitet
  - Tilføjet Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-Create Command**: Verificerer nu AZD- og Azure CLI-installation ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Omskrivning af README for begyndere
**Denne version forbedrer betydeligt README.md for at være mere tilgængelig for begyndere og tilføjer vigtige ressourcer til AI-udviklere.**

#### Tilføjet
- **🆚 Azure CLI vs AZD Comparison**: Klar forklaring af, hvornår man bruger hvert værktøj med praktiske eksempler
- **🌟 Awesome AZD Links**: Direkte links til community-skabelongalleri og bidragsressourcer:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klar-til-udrulning skabeloner
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Quick Start Guide**: Forenklet 3-trins introduktion (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Klar vejledning om, hvor man skal starte baseret på udviklererfaring

#### Ændret
- **README Structure**: Omskrevet til progressiv afsløring - vigtig information først
- **Introduction Section**: Omskrevet for at forklare "The Magic of `azd up`" for helt nye brugere
- **Removed Duplicate Content**: Fjernet duplikeret fejlsøgningssektion
- **Troubleshooting Commands**: Rettede `azd logs` reference til at bruge gyldig `azd monitor --logs`

#### Rettet
- **🔐 Authentication Commands**: Tilføjede `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Invalid Command References**: Fjernet resterende `azd logs` fra README-fejlsøgningssektionen

#### Bemærkninger
- **Scope**: Ændringer anvendt på hoved-README.md og resources/cheat-sheet.md
- **Target Audience**: Forbedringer rettet mod udviklere nye i AZD

---

### [v3.10.0] - 2026-02-05

#### Opdatering af Azure Developer CLI-kommandoernes nøjagtighed
**Denne version retter ikke-eksisterende AZD-kommandoer i hele dokumentationen og sikrer, at alle kodeeksempler bruger gyldig Azure Developer CLI-syntax.**

#### Rettet
- **🔧 Non-Existent AZD Commands Removed**: Omfattende gennemgang og korrektion af ugyldige kommandoer:
  - `azd logs` (findes ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` subcommands (findes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (findes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (findes ikke) → fjernet
  - `azd provision --what-if/--rollback` flags (findes ikke) → opdateret til at bruge `--preview`
  - `azd config validate` (findes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (findes ikke) → fjernet

- **📚 Files Updated with Command Corrections**:
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

#### Ændret
- **Rollback Strategies**: Opdateret dokumentation til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Log Viewing**: Udskiftede `azd logs`-referencer med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Performance Section**: Fjernet ikke-eksisterende parallelle/incrementelle deploy-flags, og gav gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flag**: `--live`, `--logs`, `--overview`
- **Fjernede funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noter
- **Bekræftelse**: Kommandoer valideret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshopfærdiggørelse og opdatering af dokumentationskvalitet
**Denne version færdiggør de interaktive workshopmoduler, retter alle ødelagte dokumentationslinks og forbedrer den overordnede indholdskvalitet for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Nyt dokument med retningslinjer for bidrag, indeholdende:
  - Klar vejledning i, hvordan man rapporterer problemer og foreslår ændringer
  - Dokumentationsstandarder for nyt indhold
  - Retningslinjer for kodeeksempler og konventioner for commit-beskeder
  - Information om fællesskabsengagement

#### Fuldført
- **🎯 Workshopmodul 7 (Afslutning)**: Fuldt færdigt afslutningsmodul med:
  - Omfattende opsummering af workshopens resultater
  - Afsnit om nøglekoncepter der er mestret, dækker AZD, skabeloner og Microsoft Foundry
  - Anbefalinger til fortsat læringsforløb
  - Workshoppens udfordringsøvelser med sværhedsgrader
  - Links til fællesskabsfeedback og support

- **📚 Workshopmodul 3 (Dekonstruer)**: Opdaterede læringsmål med:
  - Vejledning til aktivering af GitHub Copilot med MCP-servere
  - Forståelse af AZD-skabelonens mappestruktur
  - Organisationsmønstre for infrastruktur-som-kode (Bicep)
  - Praktiske laboratorieinstruktioner

- **🔧 Workshopmodul 6 (Nedtagning)**: Færdiggjort med:
  - Ressourceoprydning og mål for omkostningsstyring
  - Brug af `azd down` til sikker deprovisionering af infrastruktur
  - Vejledning til genoprettelse af blødt slettede kognitive tjenester
  - Bonusforslag til udforskning af GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Rettelse af ødelagte links**: Løst 15+ ødelagte interne dokumentationslinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerede stier til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattede ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede stier til FAQ og fejlfindingvejledning
  - `examples/container-app/microservices/README.md`: Korrigerede stier til kursusforside og deploymentsvejledning
  - `resources/faq.md` and `resources/glossary.md`: Opdaterede AI-kapitelreferencer
  - `course-outline.md`: Rettede references til instruktørvejledning og AI-workshop-labs

- **📅 Workshopstatus-banner**: Opdateret fra "Under Construction" til aktiv workshopstatus med februar 2026-dato

- **🔗 Workshopnavigation**: Rettede ødelagte navigationslinks i workshop-README.md, der pegede på ikke-eksisterende lab-1-azd-basics-mappe

#### Ændret
- **Workshoppræsentation**: Fjernede "under construction"-advarsel, workshoppen er nu færdig og klar til brug
- **Navigationens konsistens**: Sikrede, at alle workshopmoduler har korrekt navigation mellem moduler
- **Læringssti-referencer**: Opdaterede kapitlers krydsreferencer til at bruge korrekte microsoft-foundry-stier

#### Valideret
- ✅ Alle engelske markdown-filer har gyldige interne links
- ✅ Workshopmoduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indholdet er egnet til AI-udviklere, der bruger Microsoft AZD
- ✅ Begyndervenligt sprog og struktur bevaret gennemgående
- ✅ CONTRIBUTING.md giver klar vejledning til bidragydere i fællesskabet

#### Teknisk implementering
- **Linkvalidering**: Automatiseret PowerShell-script verificerede alle .md interne links
- **Indholdsaudit**: Manuel gennemgang af workshopens komplethed og egnethed for begyndere
- **Navigationssystem**: Konsistente navigationsmønstre for kapitler og moduler anvendt

#### Noter
- **Omfang**: Ændringer anvendt kun på den engelske dokumentation
- **Oversættelser**: Oversættelsesmapper er ikke opdateret i denne version (automatisk oversættelse vil synkronisere senere)
- **Workshoppens varighed**: Den komplette workshop giver nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret dokumentation: Overvågning, sikkerhed og multi-agent-mønstre
**Denne version tilføjer omfattende A-niveau-lektioner om integration af Application Insights, autentificeringsmønstre og multi-agent-koordinering til produktionsimplementeringer.**

#### Tilføjet
- **📊 Application Insights-integrationslektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret udrulning med automatisk provisioning
  - Fuldstændige Bicep-skabeloner til Application Insights + Log Analytics
  - Fungerende Python-applikationer med tilpasset telemetri (1.200+ linjer)
  - AI/LLM-overvågningsmønstre (Microsoft Foundry Models token-/omkostningssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribueret tracing, telemetri-flow)
  - 3 praktiske øvelser (alarmer, dashboards, AI-overvågning)
  - Kusto-forespørgselseksempler og strategier til omkostningsoptimering
  - Live metrics-streaming og realtidsfejlfinding
  - 40-50 minutters læringstid med produktionsklare mønstre

- **🔐 Autentificerings- og sikkerhedsmønstre-lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (connection strings, Key Vault, managed identity)
  - Fuldstændige Bicep-infrastruktur-skabeloner til sikre udrulninger
  - Node.js-applikationskode med Azure SDK-integration
  - 3 komplette øvelser (aktivér managed identity, user-assigned identity, Key Vault-rotation)
  - Bedste praksis for sikkerhed og RBAC-konfigurationer
  - Fejlfindingsvejledning og omkostningsanalyse
  - Produktionsklare mønstre for passwordless-autentificering

- **🤖 Lektion om multi-agent-koordinationsmønstre**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmønstre (sekventielle, parallelle, hierarkiske, hændelsesdrevne, konsensus)
  - Fuldstændig orchestrator-service-implementering (Python/Flask, 1.500+ linjer)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus-integration til meddelelseskø
  - Cosmos DB-tilstandsadministration for distribuerede systemer
  - 6 Mermaid-diagrammer, der viser agentinteraktioner
  - 3 avancerede øvelser (timeout-håndtering, retry-logik, circuit breaker)
  - Omkostningsopdeling ($240-565/month) med optimeringsstrategier
  - Application Insights-integration til overvågning

#### Forbedret
- **Pre-deployment-kapitel**: Indeholder nu omfattende overvågnings- og koordineringsmønstre
- **Getting Started-kapitel**: Forbedret med professionelle autentificeringsmønstre
- **Produktionsparathed**: Fuld dækning fra sikkerhed til observabilitet
- **Kursusoversigt**: Opdateret til at referere nye lektioner i kapitlerne 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og overvågning gennem hele kurset
- **Dokumentationskvalitet**: Konsistente A-niveau-standarder (95-97%) på tværs af nye lektioner
- **Produktionsmønstre**: Fuldstændig end-to-end-dækning for enterprise-udrulninger

#### Forbedret
- **Udvikleroplevelse**: Klar vej fra udvikling til produktionsovervågning
- **Sikkerhedsstandarder**: Professionelle mønstre for autentificering og secrets-håndtering
- **Observabilitet**: Fuldstændig Application Insights-integration med AZD
- **AI-workloads**: Specialiseret overvågning til Microsoft Foundry Models og multi-agent-systemer

#### Valideret
- ✅ Alle lektioner inkluderer komplet fungerende kode (ikke uddrag)
- ✅ Mermaid-diagrammer til visuel læring (19 i alt på tværs af 3 lektioner)
- ✅ Praktiske øvelser med verifikationstrin (9 i alt)
- ✅ Produktionsklare Bicep-skabeloner deployerbare via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlfindingsvejledninger og bedste praksis
- ✅ Viden-checkpoints med verifikationskommandoer

#### Dokumentationsbedømmelsesresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsvejledning
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent-arkitekturer
- **Overordnet nyt indhold**: - Konsistente højkvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribueret tracing
- **Autentificering**: Managed Identity + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvågning**: Live metrics + Kusto-forespørgsler + alarmer + dashboards
- **Omkostningsstyring**: Sampling-strategier, opbevaringspolitikker, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer af dokumentationskvalitet og nyt Microsoft Foundry Models-eksempel
**Denne version forbedrer dokumentationskvaliteten i hele lageret og tilføjer et komplet Microsoft Foundry Models-udrulningseksempel med gpt-4.1 chatgrænseflade.**

#### Tilføjet
- **🤖 Microsoft Foundry Models Chat-eksempel**: Komplet gpt-4.1-udrulning med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplet Microsoft Foundry Models-infrastruktur (gpt-4.1-modeludrulning)
  - Python kommandolinje-chatgrænseflade med samtalehistorik
  - Key Vault-integration til sikker opbevaring af API-nøgler
  - Sporing af tokenbrug og omkostningsestimering
  - Ratebegrænsning og fejlhåndtering
  - Omfattende README med 35-45 minutters udrulningsvejledning
  - 11 produktionsklare filer (Bicep-skabeloner, Python-app, konfiguration)
- **📚 Dokumentationsøvelser**: Tilføjede praktiske øvelser til konfigurationsvejledningen:
  - Øvelse 1: Multi-miljøkonfiguration (15 minutter)
  - Øvelse 2: Øvelse i håndtering af secrets (10 minutter)
  - Klare succeskriterier og verifikationstrin
- **✅ Udrulningsverifikation**: Tilføjede verifikationssektion til udrulningsvejledningen:
  - Sundhedstjekprocedurer
  - Tjekliste for succeskriterier
  - Forventede output for alle udrulningskommandoer
  - Hurtig reference til fejlfinding

#### Forbedret
- **examples/README.md**: Opdateret til A-niveau kvalitet (93%):
  - Tilføjede azure-openai-chat til alle relevante sektioner
  - Opdaterede antallet af lokale eksempler fra 3 til 4
  - Tilføjede til tabellen AI-applikationseksempler
  - Integreret i Quick Start for mellembrugere
  - Tilføjede til afsnittet Microsoft Foundry-skabeloner
  - Opdaterede sammenligningsmatrixen og afsnit om teknologifund
- **Dokumentationskvalitet**: Forbedret B+ (87%) → A- (92%) på tværs af docs-mappen:
  - Tilføjede forventede output til kritiske kommandoeksempler
  - Indarbejdede verifikationstrin for konfigurationsændringer
  - Forbedret praktisk læring med hands-on øvelser

#### Ændret
- **Læringsprogression**: Bedre integration af AI-eksempler for mellembrugere
- **Dokumentationsstruktur**: Mere handlingsorienterede øvelser med klare resultater
- **Verifikationsproces**: Ekspl implicitte succeskriterier føjet til nøglearbejdsgange

#### Forbedret
- **Udvikleroplevelse**: Microsoft Foundry Models-udrulning tager nu 35-45 minutter (vs. 60-90 for komplekse alternativer)
- **Omkostningstransparens**: Klare omkostningsestimat ($50-200/month) for Microsoft Foundry Models-eksemplet
- **Læringssti**: AI-udviklere har et klart indgangspunkt med azure-openai-chat
- **Dokumentationsstandarder**: Konsistente forventede output og verifikationstrin

#### Valideret
- ✅ Microsoft Foundry Models-eksempel fuldt funktionsdygtigt med `azd up`
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte
- ✅ README-instruktioner matcher den faktiske udrulningsoplevelse
- ✅ Dokumentationslinks opdateret på 8+ steder
- ✅ Eksempelindeks afspejler nøjagtigt 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabellerne
- ✅ Alle navigationsreferencer korrekte

#### Teknisk implementering
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhed**: Managed Identity klar, secrets i Key Vault
- **Overvågning**: Application Insights-integration
- **Omkostningsstyring**: Token-sporing og optimering af brug
- **Udrulning**: Enkel `azd up`-kommando for komplet opsætning

### [v3.6.0] - 2025-11-19

#### Stor opdatering: Container App-udrulningseksempler
**Denne version introducerer omfattende, produktionsklare eksempler på udrulning af containerapplikationer ved brug af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsstien.**

#### Tilføjet
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Mastervejledning](examples/container-app/README.md): Komplet oversigt over containeriserede udrulninger, hurtigstart, produktion og avancerede mønstre
  - [Simpelt Flask API](../../examples/container-app/simple-flask-api): Begyndervenligt REST-API med scale-to-zero, health-prober, overvågning og fejlfinding
  - [Microservices-arkitektur](../../examples/container-app/microservices): Produktionsklar multi-service-udrulning (API Gateway, Product, Order, User, Notification), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret tracing, blue-green/canary-udrulning
- **Bedste praksis**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD-vejledning for containeriserede arbejdsbelastninger
- **Kodeeksempler**: Fuldstændig `azure.yaml`, Bicep-skabeloner og flersprogede serviceimplementeringer (Python, Node.js, C#, Go)
- **Test & fejlfinding**: End-to-end testscenarier, overvågningskommandoer, fejlfindingvejledning

#### Ændret
- **README.md**: Opdateret til at fremhæve og linke nye container-app-eksempler under "Lokale eksempler - Containerapplikationer"
- **examples/README.md**: Opdateret til at fremhæve container-app-eksempler, tilføje sammenligningsmatrix-indgange og opdatere teknologi-/arkitekturhenvisninger
- **Course Outline & Study Guide**: Opdateret til at referere til nye container-app-eksempler og udrulningsmønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan implementeres med `azd up` og følger bedste praksis
- ✅ Dokumentationens krydsreferencer og navigation opdateret
- ✅ Eksempler dækker fra begynder- til avancerede scenarier, inklusive produktions-mikrotjenester

#### Noter
- **Omfang**: Kun engelsk dokumentation og eksempler
- **Næste skridt**: Udvide med yderligere avancerede container-mønstre og CI/CD-automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produktomdøbning: Microsoft Foundry
**Denne version implementerer en omfattende produktnavneændring fra "Microsoft Foundry" til "Microsoft Foundry" på tværs af al engelsk dokumentation, hvilket afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Produktnavneopdatering**: Fuldstændig ombrandning fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdateret alle referencer i den engelske dokumentation i `docs/`-mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - I alt: 23 indholdsreferencer opdateret på tværs af 7 dokumentationsfiler

- **📁 Mappeændringer**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret for at afspejle den nye mappestruktur
  - Navigationslinks valideret i hele dokumentationen

- **📄 Filomdøbninger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til det nye filnavn

#### Opdaterede filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslinkopdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnehenvisninger opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede bruger Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreference-links opdateret
  - `docs/getting-started/first-project.md` - 2 kapitel-navigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 næste kapitel-links opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteltitler, skabelonsektion, community-indsigter)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitelressourcer)

#### Valideret
- ✅ Ingen resterende "ai-foundry" mappe-referencer i de engelske dokumenter
- ✅ Ingen resterende "Microsoft Foundry" produktnavnereferencer i de engelske dokumenter
- ✅ Alle navigationslinks fungerer med den nye mappestruktur
- ✅ Omdøbninger af filer og mapper gennemført med succes
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Omfang**: Ændringer anvendt kun i den engelske dokumentation i `docs/`-mappen
- **Oversættelser**: Oversættelsesmapperne (`translations/`) er ikke opdateret i denne version
- **Workshop**: Workshop-materiale (`workshop/`) er ikke opdateret i denne version
- **Eksempler**: Eksempelfiler kan stadig referere til legacy-navngivning (vil blive håndteret i en fremtidig opdatering)
- **Eksterne links**: Eksterne URL'er og GitHub-referencer forbliver uændrede

#### Migreringsvejledning for bidragydere
Hvis du har lokale branches eller dokumentation, der refererer til den gamle struktur:
1. Opdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider, at alle interne dokumentationslinks stadig fungerer

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur-preview og valideringsforbedringer
**Denne version introducerer omfattende støtte til den nye Azure Developer CLI preview-funktion og forbedrer workshopbrugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattende dækning af den nye infrastruktur-preview-funktionalitet
  - Kommando-reference og brugseksempler i jukselisten
  - Detaljeret integration i provisioningsguiden med anvendelsestilfælde og fordele
  - Forhåndstjek-integration for sikrere implementeringsvalidering
  - Opdateringer i kom godt i gang-guiden med sikkerheds-først implementeringspraksis
- **🚧 Workshop Status Banner**: Professionelt HTML-banner, der angiver workshop-udviklingsstatus
  - Gradientdesign med byggeindikatorer for klar kommunikation til brugerne
  - Sidst opdateret-tidsstempel for gennemsigtighed
  - Mobilresponsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktursikkerhed**: Preview-funktionalitet integreret i hele implementeringsdokumentationen
- **Forudimplementeringsvalidering**: Automatiske scripts inkluderer nu infrastruktur-preview-test
- **Udviklerworkflow**: Opdaterede kommando-sekvenser for at inkludere preview som bedste praksis
- **Workshopoplevelse**: Klare forventninger sat for brugere omkring indholdets udviklingsstatus

#### Ændret
- **Bedste praksis for implementering**: Preview-først workflow anbefales nu som tilgang
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshoppræsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerhed-først tilgang**: Infrastrukturændringer kan nu valideres før implementering
- **Team-samarbejde**: Preview-resultater kan deles til review og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisioning
- **Risikoreduktion**: Færre implementeringsfejl gennem forudgående validering

#### Teknisk implementering
- **Multi-dokumentintegration**: Preview-funktion dokumenteret i 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentationen
- **Integrering af bedste praksis**: Preview inkluderet i validerings-workflows og scripts
- **Visuelle indikatorer**: Klare NYE funktionsmarkeringer for bedre opdagelighed

#### Workshop-infrastruktur
- **Statuskommunikation**: Professionel HTML-banner med gradientstyling
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel præsentation**: Opretholder repositoryets troværdighed samtidig med at den sætter forventninger
- **Tidslinjegennemsigtighed**: Sidst opdateret-tidsstempel (oktober 2025) for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede workshopmaterialer og interaktiv læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive guider og strukturerede læringsforløb.**

#### Tilføjet
- **🎥 Interaktiv workshopguide**: Browser-baseret workshopoplevelse med MkDocs preview-funktionalitet
- **📝 Strukturerede workshopinstruktioner**: 7-trins vejledt læringssti fra opdagelse til tilpasning
  - 0-Introduction: Workshopoversigt og opsætning
  - 1-Select-AI-Template: Skabelonopdagelse og udvælgelsesproces
  - 2-Validate-AI-Template: Implementerings- og valideringsprocedurer
  - 3-Deconstruct-AI-Template: Forståelse af skabelonarkitektur
  - 4-Configure-AI-Template: Konfiguration og tilpasning
  - 5-Customize-AI-Template: Avancerede ændringer og iterationer
  - 6-Teardown-Infrastructure: Oprydning og ressourcehåndtering
  - 7-Wrap-up: Opsummering og næste skridt
- **🛠️ Workshopværktøj**: MkDocs-konfiguration med Material-tema for forbedret læringsoplevelse
- **🎯 Praktisk læringssti**: 3-trins metodologi (Opdagelse → Implementering → Tilpasning)
- **📱 GitHub Codespaces-integration**: Problemfri opsætning af udviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Udvidet med en omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trinvis vejledning fra skabelonvalg til produktionsimplementering
- **Udvikleroplevelse**: Integrerede værktøjer til strømlinede udviklingsworkflows

#### Forbedret
- **Tilgængelighed**: Browserbaseret interface med søgning, kopi-funktionalitet og temaomskifter
- **Selvstyret læring**: Fleksibel workshopstruktur, der tilpasser sig forskellige lærehastigheder
- **Praktisk anvendelse**: Virkelighedstro AI-skabelonimplementeringsscenarier
- **Fællesskabsintegration**: Discord-integration for workshopstøtte og samarbejde

#### Workshopfunktioner
- **Indbygget søgning**: Hurtig søgning efter nøgleord og lektioner
- **Kopiér kodeblokke**: Hover-for-at-kopiere-funktionalitet for alle kodeeksempler
- **Temaomskifter**: Understøttelse af mørk/lys tilstand efter præference
- **Visuelle ressourcer**: Skærmbilleder og diagrammer for bedre forståelse
- **Hjælpeintegration**: Direkte Discord-adgang til fællesskabsstøtte

### [v3.2.0] - 2025-09-17

#### Større navigationsomstrukturering og kapitelbaseret læringssystem
**Denne version introducerer en omfattende kapitelbaseret læringsstruktur med forbedret navigation gennem hele repositoryet.**

#### Tilføjet
- **📚 Kapitelbaseret læringssystem**: Omstruktureret hele kurset i 8 progressive læringskapitler
  - Kapitel 1: Grundlag & Hurtigstart (⭐ - 30-45 min)
  - Kapitel 2: AI-først udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentificering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & implementering (⭐⭐⭐ - 1-1.5 timer)
  - Kapitel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Forudimplementeringsvalidering & planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & debugging (⭐⭐ - 1-1.5 timer)
  - Kapitel 8: Produktion & virksomhedsmønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigationssystem**: Konsistente navigationsoverskrifter og footers på tværs af al dokumentation
- **🎯 Fremdriftssporing**: Kursusfærdiggørelses-tjekliste og læringsverifikationssystem
- **🗺️ Læringssti vejledning**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference-navigation**: Relaterede kapitler og forudsætninger tydeligt forbundet

#### Forbedret
- **README-struktur**: Omdannet til en struktureret læringsplatform med kapitelbaseret organisation
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelkontekst og progression
- **Skabelonorganisation**: Eksempler og skabeloner kortlagt til passende læringskapitler
- **Ressourceintegration**: Jukselister, FAQ'er og studievejledninger forbundet til relevante kapitler
- **Workshopintegration**: Hands-on labs kortlagt til flere kapitel-læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibelt kapitelbaseret læring
- **Konfigurationsplacering**: Repositioneret konfigurationsguiden som Kapitel 3 for bedre læringsflow
- **AI-indholdsintegration**: Bedre integration af AI-specifikt indhold gennem læringsrejsen
- **Produktionsindhold**: Avancerede mønstre konsolideret i Kapitel 8 for erhvervsbrugere

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og kapitelprogressionsindikatorer
- **Tilgængelighed**: Konsistente navigationsmønstre for nemmere kursusgennemgang
- **Professionel præsentation**: Universitets-lignende kursusstruktur egnet til akademisk og virksomhedstræning
- **Læringseffektivitet**: Kortere tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk implementering
- **Navigationsoverskrifter**: Standardiseret kapitel-navigation i 40+ dokumentationsfiler
- **Footer-navigation**: Konsistent progression og kapitelafslutningsindikatorer
- **Krydslinking**: Omfattende internt linkssystem, der forbinder relaterede koncepter
- **Kapitelkortlægning**: Skabeloner og eksempler klart tilknyttet læringsmål

#### Forbedring af studievejledning
- **📚 Omfattende læringsmål**: Omstruktureret studievejledning for at tilpasse den 8-kapitelsystem
- **🎯 Kapitelbaseret vurdering**: Hvert kapitel indeholder specifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ugentlig læringsplan med målbare resultater og tjeklister
- **❓ Vurderingsspørgsmål**: Videnvalideringsspørgsmål for hvert kapitel med professionelle resultater
- **🛠️ Praktiske øvelser**: Hands-on aktiviteter med reelle implementeringsscenarier og fejlfinding
- **📊 Færdighedsprogression**: Klar fremgang fra grundlæggende koncepter til virksomhedsorienterede mønstre med karriereudviklingsfokus
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og community-anerkendelsessystem
- **⏱️ Tidsstyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede multi-agent AI-løsninger
**Denne version forbedrer multi-agent retail-løsningen med bedre agent-navngivning og forbedret dokumentation.**

#### Ændret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Customer agent" i hele retail multi-agent-løsningen for klarere forståelse
- **Agentarkitektur**: Opdateret al dokumentation, ARM-skabeloner og kodeeksempler til at bruge konsekvent "Customer agent"-navngivning
- **Konfigurationseksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Dokumentationskonsistens**: Sikret, at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM Template Package**: Opdateret retail-multiagent-arm-template med Customer agent-referencer
- **Architecture Diagrams**: Opdaterede Mermaid-diagrammer med opdateret agentnavngivning
- **Code Examples**: Python-klasser og implementeringseksempler bruger nu CustomerAgent-navngivning
- **Environment Variables**: Opdateret alle deploymentscripts til at bruge CUSTOMER_AGENT_NAME-konventioner

#### Improved
- **Developer Experience**: Klarere agentroller og ansvarsfordeling i dokumentationen
- **Production Readiness**: Bedre tilpasning til virksomhedsnavngivningskonventioner
- **Learning Materials**: Mere intuitiv agentnavngivning til undervisningsformål
- **Template Usability**: Forenklet forståelse af agentfunktioner og udrulningsmønstre

#### Technical Details
- Opdaterede Mermaid-arkitekturdiagrammer med CustomerAgent-referencer
- Erstatter CoraAgent-klassenavne med CustomerAgent i Python-eksempler
- Ændrede ARM-template JSON-konfigurationer til at bruge "customer" agenttype
- Opdaterede miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opdaterede alle deploymentskommandoer og containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Denne version transformerer repository'et til en omfattende AI-fokuseret læringsressource med Microsoft Foundry-integration.**

#### Added
- **🤖 AI-First Learning Path**: Fuld omstrukturering med prioritet til AI-udviklere og ingeniører
- **Microsoft Foundry Integration Guide**: Omfattende dokumentation til at forbinde AZD med Microsoft Foundry-tjenester
- **AI Model Deployment Patterns**: Detaljeret vejledning om valg af modeller, konfiguration og strategier for produktionsudrulning
- **AI Workshop Lab**: 2-3 timers praktisk workshop til at konvertere AI-applikationer til AZD-udrulningsklare løsninger
- **Production AI Best Practices**: Enterprise-klare mønstre til skalering, overvågning og sikring af AI-workloads
- **AI-Specific Troubleshooting Guide**: Omfattende fejlsøgningsvejledning for Microsoft Foundry Models, Cognitive Services og AI-udrulningsproblemer
- **AI Template Gallery**: Udvalgt samling af Microsoft Foundry-templates med kompleksitetsvurderinger
- **Workshop Materials**: Fuld workshopstruktur med praktiske labs og referencemateriale

#### Enhanced
- **README Structure**: Fokuseret på AI-udviklere med 45% community-interesse-data fra Microsoft Foundry Discord
- **Learning Paths**: En dedikeret AI-udviklerrejse side om side med traditionelle spor for studerende og DevOps-ingeniører
- **Template Recommendations**: Udvalgte AI-templates inkl. azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord-fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specifikke autentifikations- og sikkerhedskonfigurationer
- **Cost Optimization**: Sporing af tokenbrug og budgetkontroller for AI-workloads
- **Multi-Region Deployment**: Strategier for global udrulning af AI-applikationer
- **Performance Monitoring**: AI-specifikke målinger og Application Insights-integration

#### Documentation Quality
- **Linear Course Structure**: Logisk progression fra begynder til avancerede AI-udrulningsmønstre
- **Validated URLs**: Alle eksterne repository-links verificerede og tilgængelige
- **Complete Reference**: Alle interne dokumentationslinks validerede og funktionelle
- **Production Ready**: Enterprise-udrulningsmønstre med eksempler fra den virkelige verden

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Denne version repræsenterer en betydelig overhaling af repository-strukturen og indholdspræsentationen.**

#### Added
- **Structured Learning Framework**: Alle dokumentationssider indeholder nu Introduktion, Læringsmål og Læringsudbytte sektioner
- **Navigation System**: Tilføjede Forrige/Næste-lektion-links gennem hele dokumentationen for styret læringsprogression
- **Study Guide**: Omfattende study-guide.md med læringsmål, øvelser og vurderingsmaterialer
- **Professional Presentation**: Fjernede alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Enhanced Content Structure**: Forbedret organisering og flow af læringsmaterialer

#### Changed
- **Documentation Format**: Standardiserede al dokumentation med konsekvent læringsfokuseret struktur
- **Navigation Flow**: Implementerede logisk progression gennem alt læringsmateriale
- **Content Presentation**: Fjernede dekorative elementer til fordel for klart, professionelt format
- **Link Structure**: Opdaterede alle interne links for at understøtte det nye navigationssystem

#### Improved
- **Accessibility**: Fjernede emoji-afhængigheder for bedre kompatibilitet med skærmlæsere
- **Professional Appearance**: Rent, akademisk præsenteret layout egnet til virksomhedslæring
- **Learning Experience**: Struktureret tilgang med klare mål og udbytte for hver lektion
- **Content Organization**: Bedre logisk flow og sammenhæng mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Fuld "getting-started"-guideserie
  - Omfattende dokumentation for udrulning og provisioning
  - Detaljerede fejlsøgningsressourcer og debug-vejledninger
  - Forud-udrulningsvalideringsværktøjer og procedurer

- **Getting Started Module**
  - AZD Basics: Kernekoncepter og terminologi
  - Installation Guide: Platforms-specifikke installationsinstruktioner
  - Configuration Guide: Miljøopsætning og autentifikation
  - First Project Tutorial: Trin-for-trin praktisk læring

- **Deployment and Provisioning Module**
  - Deployment Guide: Fuld workflow-dokumentation
  - Provisioning Guide: Infrastructure as Code med Bicep
  - Bedste praksis for produktionsudrulninger
  - Multi-service arkitekturmønstre

- **Pre-deployment Validation Module**
  - Capacity Planning: Validering af Azure-ressource tilgængelighed
  - SKU Selection: Omfattende vejledning om serviceniveauer
  - Pre-flight Checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Værktøjer til omkostningsestimering og budgetplanlægning

- **Troubleshooting Module**
  - Common Issues: Ofte forekommende problemer og løsninger
  - Debugging Guide: Systematiske fejlsøgningsmetodikker
  - Avancerede diagnostiske teknikker og værktøjer
  - Ydelsesovervågning og optimering

- **Resources and References**
  - Command Cheat Sheet: Hurtig reference for væsentlige kommandoer
  - Glossary: Omfattende terminologi- og forkortelsesforklaringer
  - FAQ: Detaljerede svar på ofte stillede spørgsmål
  - Eksterne ressource-links og fællesskabsforbindelser

- **Examples and Templates**
  - Simpelt webapplikationseksempel
  - Skabelon til udrulning af statisk webside
  - Containerapplikationskonfiguration
  - Databasintegrationsmønstre
  - Microservices-arkitektur-eksempler
  - Serverless-funktionsimplementeringer

#### Features
- **Multi-Platform Support**: Installations- og konfigurationsvejledninger for Windows, macOS og Linux
- **Multiple Skill Levels**: Indhold designet til studerende og professionelle udviklere
- **Practical Focus**: Praktisk fokus med håndgribelige eksempler og scenarier fra virkeligheden
- **Comprehensive Coverage**: Fra grundlæggende koncepter til avancerede enterprise-mønstre
- **Security-First Approach**: Sikkerhedsbest practices integreret gennem hele materialet
- **Cost Optimization**: Vejledning til omkostningseffektive udrulninger og ressourcehåndtering

#### Documentation Quality
- **Detailed Code Examples**: Praktiske, testede kodeeksempler
- **Step-by-Step Instructions**: Klare, handlingsorienterede instruktioner
- **Comprehensive Error Handling**: Fejlhåndtering og fejlsøgningsvejledninger for almindelige problemer
- **Best Practices Integration**: Branche-standarder og anbefalinger
- **Version Compatibility**: Opdateret med de nyeste Azure-tjenester og azd-funktioner

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og tilpassede modeller
- **AI Agent Frameworks**: Templates til LangChain, Semantic Kernel og AutoGen-udrulninger
- **Advanced RAG Patterns**: Vektor-databasevalg ud over Azure AI Search (Pinecone, Weaviate osv.)
- **AI Observability**: Forbedret overvågning af modelpræstation, tokenbrug og svarenes kvalitet

#### Developer Experience
- **VS Code Extension**: Integreret AZD + Microsoft Foundry udviklingsoplevelse
- **GitHub Copilot Integration**: AI-assisteret AZD-templategenerering
- **Interactive Tutorials**: Praktiske kodningsøvelser med automatisk validering for AI-scenarier
- **Video Content**: Supplerende videotutorials til visuelle lærende med fokus på AI-udrulninger

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI-modelgovernance, compliance og revisionsspor
- **Multi-Tenant AI**: Mønstre til at betjene flere kunder med isolerede AI-tjenester
- **Edge AI Deployment**: Integration med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud og hybride udrulningsmønstre for AI-workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning-pipelines
- **Advanced Security**: Zero-trust-mønstre, private endpoints og avanceret trusselbeskyttelse
- **Performance Optimization**: Avanceret tuning og skaleringstrategier for høj-throughput AI-applikationer
- **Global Distribution**: Indholdslevering og edge-caching-mønstre for AI-applikationer

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Omfattende Microsoft Foundry-integration (Fuldført)
- ✅ **Interactive Tutorials**: Praktisk AI-workshop lab (Fuldført)
- ✅ **Advanced Security Module**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Performance Optimization**: AI-workload-tuningstrategier (Fuldført)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-fokuserede udrulningsscenarier (Fuldført)
- ✅ **Extended FAQ**: AI-specifikke spørgsmål og fejlsøgning (Fuldført)
- **Tool Integration**: Forbedrede IDE- og editorintegrationsvejledninger
- ✅ **Monitoring Expansion**: AI-specifikke overvågnings- og alarmeringsmønstre (Fuldført)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsivt design til mobil læring
- **Offline Access**: Downloadbare dokumentationspakker
- **Enhanced IDE Integration**: VS Code-udvidelse til AZD + AI-workflows
- **Community Dashboard**: Realtids fællesskabsmålinger og bidragssporing

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Følg semantisk versionering (major.minor.patch)
2. **Date**: Udgivelses- eller opdateringsdato i YYYY-MM-DD-format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Kortfattet beskrivelse af hvad der ændrede sig
5. **Impact Assessment**: Hvordan ændringer påvirker eksisterende brugere

### Change Categories

#### Added
- Nye funktioner, dokumentationsafsnit eller funktionaliteter
- Nye eksempler, templates eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Changed
- Modifikationer af eksisterende funktionalitet eller dokumentation
- Opdateringer for at forbedre klarhed eller nøjagtighed
- Omstrukturering af indhold eller organisering

#### Deprecated
- Funktioner eller tilgange, der udfases
- Dokumentationsafsnit planlagt til fjernelse
- Metoder, der har bedre alternativer

#### Removed
- Funktioner, dokumentation eller eksempler, der ikke længere er relevante
- Forældet information eller udfasede tilgange
- Redundant eller konsolideret indhold

#### Fixed
- Rettelser af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet

#### Security
- Sikkerhedsrelaterede forbedringer eller rettelser
- Opdateringer til sikkerhedsbest practices
- Løsning af sikkerhedssårbarheder

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Ændringer, der bryder bagudkompatibilitet og kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisering
- Ændringer, der ændrer den grundlæggende tilgang eller metodologi

#### Minor Version (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer, der bevarer bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch Version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer af eksisterende indhold
- Afklaringer og små forbedringer

## Community Feedback and Suggestions

Vi opfordrer aktivt til feedback fra fællesskabet for at forbedre denne læringsressource:

### How to Provide Feedback
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke problemer er velkomne)
- **Discord Discussions**: Del idéer og engager dig med Microsoft Foundry-fællesskabet
- **Pull Requests**: Bidrag direkte forbedringer til indhold, især AI-templates og vejledninger
- **Microsoft Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI-diskussioner
- **Community Forums**: Deltag i bredere Azure-udviklerdiskussioner

### Feedback Categories
- **AI Content Accuracy**: Rettelser til AI-tjenesteintegration og udrulningsinformation
- **Learning Experience**: Forslag til forbedret læringsflow for AI-udviklere
- **Missing AI Content**: Anmodninger om yderligere AI-templates, mønstre eller eksempler
- **Accessibility**: Forbedringer til forskellige læringsbehov
- **AI Tool Integration**: Forslag til bedre integration af AI-udviklingsworkflows
- **Production AI Patterns**: Forespørgsler om enterprise AI-udrulningsmønstre

### Response Commitment
- **Issue Response**: Inden for 48 timer for rapporterede problemer
- **Feature Requests**: Evaluering inden for en uge
- **Community Contributions**: Gennemgang inden for en uge
- **Security Issues**: Øjeblikkelig prioritet med hurtet responstid

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Indholdsnøjagtighed og linkvalidering
- **Quarterly Updates**: Større indholdsudvidelser og forbedringer
- **Semi-Annual Reviews**: Omfattende omstrukturering og forbedring
- **Annual Releases**: Store versionsopdateringer med betydelige forbedringer

### Monitoring and Quality Assurance
- **Automated Testing**: Regelmæssig validering af kodeeksempler og links
- **Community Feedback Integration**: Regelmæssig indarbejdelse af brugerforslag
- **Technology Updates**: Tilpasning til de nyeste Azure-tjenester og azd-udgivelser
- **Accessibility Audits**: Regelmæssig gennemgang for inklusivt designprincipper

## Version Support Policy

### Aktuel versionssupport
- **Nyeste hovedversion**: Fuld support med regelmæssige opdateringer
- **Tidligere hovedversion**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder
- **Ældre versioner**: Kun community-support, ingen officielle opdateringer

### Migreringsvejledning
Når hovedversioner udgives, leverer vi:
- **Migreringsvejledninger**: Trin-for-trin instruktioner til overgangen
- **Kompatibilitetsnoter**: Detaljer om ændringer, der bryder kompatibiliteten
- **Værktøjsstøtte**: Scripts eller værktøjer til at hjælpe med migreringen
- **Community-support**: Dedikerede fora til spørgsmål om migrering

---

**Navigation**
- **Forrige lektion**: [Studieguide](resources/study-guide.md)
- **Næste lektion**: Gå tilbage til [Hoved-README](README.md)

**Hold dig opdateret**: Hold øje med dette repository for meddelelser om nye udgivelser og vigtige opdateringer af læringsmaterialerne.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets originalsprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->