# Ændringslog - AZD For Beginners

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger principperne for semantisk versionsstyring og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Blive informeret om nye funktioner og tilføjelser af indhold
- Forstå forbedringer foretaget i eksisterende dokumentation
- Spore fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslogindlæg vil du kunne:
- Identificere nyt indhold og ressourcer tilgængelige for læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringsvej baseret på de mest aktuelle materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**This version improves README.md chapter navigation with an enhanced table format.**

#### Ændret
- **Course Map Table**: Forbedret med direkte lektionslinks, estimeret varighed og kompleksitetsvurderinger
- **Folder Cleanup**: Fjernede redundante gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Alle 21+ interne links i Course Map-tabellen verificeret

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**This version updates product references to current Microsoft branding.**

#### Ændret
- **Azure AI Foundry → Microsoft Foundry**: Alle referencer opdateret på tværs af ikke-oversættelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret for at afspejle den aktuelle branding

#### Files Updated
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

#### Major Repository Restructuring: Chapter-Based Folder Names
**This version restructures the documentation into dedicated chapter folders for clearer navigation.**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
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
- **📚 Chapter README files**: Oprettede README.md i hver kapmapppe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Hurtigstart-kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Updated all internal links**: 78+ paths updated across all documentation files
- **🗺️ Main README.md**: Opdateret Course Map med ny kapitelsstruktur
- **📝 examples/README.md**: Opdaterede krydsreferencer til kapmmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**This version added chapter navigation README files (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**This version adds a comprehensive guide for deploying AI agents with Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Fuld guide der dækker:
  - Hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
  - Tre quick-start agent-skabeloner (Foundry Agents, Prompty, RAG)
  - Agent-arkitekturmønstre (enkelt agent, RAG, multi-agent)
  - Konfiguration af værktøjer og tilpasning
  - Overvågning og metrikksporing
  - Omkostningsovervejelser og optimering
  - Almindelige fejlsøgningsscenarier
  - Tre praktiske øvelser med succeskriterier

#### Indholdsstruktur
- **Introduction**: Agentkoncepter for begyndere
- **Quick Start**: Deploy agenter med `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visuelle diagrammer af agentmønstre
- **Configuration**: Værktøjsopsætning og miljøvariabler
- **Monitoring**: Integration med Application Insights
- **Exercises**: Progressive praktiske øvelser (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**This version updates the development container configuration with modern tools and better defaults for the AZD learning experience.**

#### Ændret
- **🐳 Base Image**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste stabile Debian)
- **📛 Container Name**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 New Dev Container Features**:
  - `azure-cli` med Bicep-support aktiveret
  - `node:20` (LTS-version til AZD-skabeloner)
  - `github-cli` til skabelonstyring
  - `docker-in-docker` til container app-udrulninger

- **🔌 Port Forwarding**: Forkonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramunderstøttelse
  - `redhat.vscode-yaml` - YAML-understøttelse (til azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code Settings**: Tilføjede standardindstillinger for Python-tolker, format ved gem, og trimming af mellemrum

- **📦 Updated requirements-dev.txt**:
  - Tilføjede MkDocs minify-plugin
  - Tilføjede pre-commit til kodekvalitet
  - Tilføjede Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-Create Command**: Verificerer nu AZD og Azure CLI installation ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**This version significantly improves the README.md to be more accessible for beginners and adds essential resources for AI developers.**

#### Tilføjet
- **🆚 Azure CLI vs AZD Comparison**: Klar forklaring af, hvornår man bruger hvert værktøj med praktiske eksempler
- **🌟 Awesome AZD Links**: Direkte links til community skabelongalleri og bidragsressourcer:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klar-til-udrulning skabeloner
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Quick Start Guide**: Forenklet 3-trins introduktion (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Klar vejledning om, hvor man skal starte baseret på udviklererfaring

#### Ændret
- **README Structure**: Omdisponeret for progressiv opdagelse - nøgleinformation først
- **Introduction Section**: Omskrevet for at forklare "The Magic of `azd up`" for helt nye brugere
- **Removed Duplicate Content**: Fjernede duplikeret fejlsøgningssektion
- **Troubleshooting Commands**: Rettede `azd logs` reference til at bruge gyldig `azd monitor --logs`

#### Rettet
- **🔐 Authentication Commands**: Tilføjede `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Invalid Command References**: Fjernede resterende `azd logs` fra README troubleshooting-sektionen

#### Noter
- **Scope**: Ændringer anvendt på main README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer specifikt rettet mod udviklere, der er nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**This version corrects non-existent AZD commands throughout the documentation, ensuring all code examples use valid Azure Developer CLI syntax.**

#### Rettet
- **🔧 Non-Existent AZD Commands Removed**: Omfattende audit og korrektion af ugyldige kommandoer:
  - `azd logs` (eksisterer ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` subcommands (eksisterer ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (eksisterer ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (eksisterer ikke) → fjernet
  - `azd provision --what-if/--rollback` flags (eksisterer ikke) → opdateret til at bruge `--preview`
  - `azd config validate` (eksisterer ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eksisterer ikke) → fjernet

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Stor overhaling af kommandooversigten
  - `docs/deployment/deployment-guide.md`: Rettede rollback- og udrulningsstrategier
  - `docs/troubleshooting/debugging.md`: Rettede loganalyse-sektioner
  - `docs/troubleshooting/common-issues.md`: Opdaterede fejlsøgningskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettede AZD-debugging-sektion
  - `docs/getting-started/azd-basics.md`: Rettede overvågningskommandoer
  - `docs/getting-started/first-project.md`: Opdaterede overvågnings- og fejlsøgningseksempler
  - `docs/getting-started/installation.md`: Rettede help- og versionseksempler
  - `docs/pre-deployment/application-insights.md`: Rettede kommandoer til visning af logs
  - `docs/pre-deployment/coordination-patterns.md`: Rettede agent-fejlsøgningskommandoer

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Ændrede hårdkodet `1.5.0` version til generisk `1.x.x` med link til releases

#### Ændret
- **Rollback Strategies**: Opdateret dokumentation til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Log Viewing**: Erstattede `azd logs` referencer med `azd monitor --logs`, `azd monitor --live`, og Azure CLI-kommandoer
- **Performance Section**: Fjernede ikke-eksisterende parallelle/incrementelle udrulningsflags, og gav gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flag**: `--live`, `--logs`, `--overview`
- **Fjernede funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verifikation**: Kommandoer valideret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshopfærdiggørelse og opdatering af dokumentationskvalitet
**Denne version fuldfører de interaktive workshopmoduler, retter alle ødelagte dokumentationslinks og forbedrer den overordnede indholdskvalitet for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Nyt bidragsretningslinjedokument med:
  - Klare instruktioner til indrapportering af problemer og forslag til ændringer
  - Dokumentationsstandarder for nyt indhold
  - Retningslinjer for kodeeksempler og konventioner for commit-beskeder
  - Information om fællesskabsengagement

#### Fuldført
- **🎯 Workshopmodul 7 (Afrunding)**: Fuldstændigt fuldført afrundingsmodul med:
  - Omfattende oversigt over workshopens resultater
  - Afsnit om nøglekoncepter der er mestret, dækkende AZD, skabeloner og AI Foundry
  - Anbefalinger til fortsættelse af læringsrejsen
  - Workshop-udfordringsøvelser med sværhedsgrader
  - Fællesskabsfeedback og supportlinks

- **📚 Workshopmodul 3 (Nedbryd)**: Opdaterede læringsmål med:
  - Vejledning til aktivering af GitHub Copilot med MCP-servere
  - Forståelse af AZD-skabeloners mappestruktur
  - Organiseringsmønstre for Infrastructure-as-Code (Bicep)
  - Praktiske labinstruktioner

- **🔧 Workshopmodul 6 (Nedtagning)**: Fuldført med:
  - Mål for oprydning af ressourcer og omkostningsstyring
  - brug af `azd down` til sikker deprovisionering af infrastruktur
  - Vejledning til gendannelse af soft-slettede kognitive tjenester
  - Bonus-udforskningsemner for GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Broken Link Fixes**: Resolved 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerede stier til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Udskiftede ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede stier til FAQ og vejledning til fejlfinding
  - `examples/container-app/microservices/README.md`: Korrigerede stier til kursusforside og deploymentsvejledning
  - `resources/faq.md` and `resources/glossary.md`: Opdaterede AI chapter references
  - `course-outline.md`: Rettede referencer til instruktørvejledning og AI-workshop-lab references

- **📅 Workshop Status Banner**: Opdateret fra "Under Construction" til aktiv workshopstatus med February 2026 date

- **🔗 Workshop Navigation**: Rettede ødelagte navigationslinks i workshop README.md, som pegede på ikke-eksisterende mappe lab-1-azd-basics

#### Ændret
- **Workshop Presentation**: Fjernede advarslen "under construction", workshoppen er nu færdig og klar til brug
- **Navigation Consistency**: Sikrede, at alle workshopmoduler har korrekt inter-modul navigation
- **Learning Path References**: Opdaterede kapitlers krydsreferencer til at bruge de korrekte microsoft-foundry-stier

#### Valideret
- ✅ Alle engelske markdown-filer har gyldige interne links
- ✅ Workshopmoduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indholdet er egnet til AI-udviklere, der bruger Microsoft AZD
- ✅ Begynder-venligt sprog og struktur er opretholdt gennemgående
- ✅ CONTRIBUTING.md giver klare retningslinjer til bidragydere i fællesskabet

#### Teknisk implementering
- **Link Validation**: Automatiseret PowerShell-script verificerede alle .md interne links
- **Content Audit**: Manuel gennemgang af workshop-komplethed og egnethed for begyndere
- **Navigation System**: Konsistente kapitel- og modulnavigationsmønstre anvendt

#### Notes
- **Scope**: Ændringer anvendt kun på engelsk dokumentation
- **Translations**: Oversættelsesmapper blev ikke opdateret i denne version (automatisk oversættelse synkroniseres senere)
- **Workshop Duration**: Den komplette workshop giver nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret dokumentation: Overvågning, sikkerhed og multi-agent-mønstre
**Denne version tilføjer omfattende lektioner i topklasse om Application Insights-integration, autentificeringsmønstre og multi-agent-koordinering til produktionsdeployeringer.**

#### Tilføjet
- **📊 Application Insights Integration Lesson**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret udrulning med automatisk provisionering
  - Færdige Bicep-skabeloner til Application Insights + Log Analytics
  - Fungerende Python-applikationer med brugerdefineret telemetri (1,200+ lines)
  - AI/LLM-overvågningsmønstre (Azure OpenAI token/cost tracking)
  - 6 Mermaid-diagrammer (arkitektur, distribueret tracing, telemetri flow)
  - 3 praktiske øvelser (alarmer, dashboards, AI-overvågning)
  - Kusto query-eksempler og strategier for omkostningsoptimering
  - Live metrics streaming og realtidsdebugging
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (connection strings, Key Vault, managed identity)
  - Færdige Bicep-infrastrukturskabeloner til sikre udrulninger
  - Node.js-applikationskode med Azure SDK-integration
  - 3 komplette øvelser (aktiver managed identity, user-assigned identity, Key Vault rotation)
  - Sikkerhedspraksis og RBAC-konfigurationer
  - Fejlsøgningsvejledning og omkostningsanalyse
  - Produktionsklare uden adgangskode-autentificeringsmønstre

- **🤖 Multi-Agent Coordination Patterns Lesson**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmønstre (sekventiel, parallel, hierarkisk, hændelsesdrevet, konsensus)
  - Færdig orkestrator-serviceimplementering (Python/Flask, 1,500+ lines)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus-integration til beskedkøning
  - Cosmos DB-tilstandsadministration for distribuerede systemer
  - 6 Mermaid-diagrammer der viser agentinteraktioner
  - 3 avancerede øvelser (timeout handling, retry logic, circuit breaker)
  - Omkostningsopdeling ($240-565/month) med optimeringsstrategier
  - Application Insights-integration til overvågning

#### Forbedret
- **Pre-deployment Chapter**: Indeholder nu omfattende overvågnings- og koordineringsmønstre
- **Getting Started Chapter**: Forbedret med professionelle autentificeringsmønstre
- **Production Readiness**: Fuld dækning fra sikkerhed til observerbarhed
- **Course Outline**: Opdateret til at referere til nye lektioner i Chapters 3 og 6

#### Ændret
- **Learning Progression**: Bedre integration af sikkerhed og overvågning gennem hele kurset
- **Documentation Quality**: Konsistente A-niveau-standarder (95-97%) på tværs af de nye lektioner
- **Production Patterns**: Fuldført ende-til-ende dækning for enterprise-udrulninger

#### Forbedret
- **Developer Experience**: Klar vej fra udvikling til produktionsovervågning
- **Security Standards**: Professionelle mønstre for autentificering og hemmelighedsstyring
- **Observability**: Fuld Application Insights-integration med AZD
- **AI Workloads**: Specialiseret overvågning for Azure OpenAI og multi-agent-systemer

#### Valideret
- ✅ Alle lektioner inkluderer komplet fungerende kode (ikke snippets)
- ✅ Mermaid-diagrammer til visuel læring (19 total across 3 lessons)
- ✅ Praktiske øvelser med verifikationstrin (9 total)
- ✅ Produktionsklare Bicep-skabeloner deployerbare via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlsøgningsvejledninger og bedste praksis
- ✅ Videnstjekpunkter med verifikationskommandoer

#### Dokumentationsbedømmelsesresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsvejledning
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent-arkitekturer
- **Overall New Content**: - Konsistente højkvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + brugerdefineret telemetri + distribueret tracing
- **Authentication**: Managed Identity + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Forbedringer af dokumentationskvalitet og nyt Azure OpenAI-eksempel
**Denne version forbedrer dokumentationskvaliteten på tværs af repoen og tilføjer et komplet Azure OpenAI-udrulningseksempel med GPT-4 chatinterface.**

#### Tilføjet
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Azure OpenAI infrastructure (GPT-4 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Added hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Added verification section to deployment guide:
  - Health check procedures
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### Forbedret
- **examples/README.md**: Updated to A-grade quality (93%):
  - Added azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Ændret
- **Learning Progression**: Bedre integration af AI-eksempler for intermediate learners
- **Documentation Structure**: Mere handlingsorienterede øvelser med klare resultater
- **Verification Process**: Ekspllicitte succes-kriterier tilføjet til nøglearbejdsgange

#### Forbedret
- **Developer Experience**: Azure OpenAI-udrulning tager nu 35-45 minutter (vs 60-90 for komplekse alternativer)
- **Cost Transparency**: Klare omkostningsestimater ($50-200/month) for Azure OpenAI-eksemplet
- **Learning Path**: AI-udviklere har klart indgangspunkt med azure-openai-chat
- **Documentation Standards**: Konsistente forventede outputs og verifikationstrin

#### Valideret
- ✅ Azure OpenAI-eksempel fuldt funktionelt med `azd up`
- ✅ Alle 11 implementationsfiler syntaktisk korrekte
- ✅ README-instruktioner matcher faktisk udrulningsoplevelse
- ✅ Dokumentationslinks opdateret på 8+ steder
- ✅ Eksempelinndekset afspejler nøjagtigt 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabeller
- ✅ Alle navigationsreferencer korrekte

#### Teknisk implementering
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps mønster
- **Security**: Managed Identity klar, hemmeligheder i Key Vault
- **Monitoring**: Application Insights-integration
- **Cost Management**: Token tracking og brugseffektivisering
- **Deployment**: Single `azd up`-kommando for komplet setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Denne version introducerer omfattende, produktionsklare containerapplikations-udrulningseksempler ved brug af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsforløbet.**

#### Tilføjet
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Ændret
- **README.md**: Updated to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Updated to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Kursusoversigt & Studieguide**: Opdateret til at henvise til nye containerapp-eksempler og udrulningsmønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan udrulles med `azd up` og følger bedste praksis
- ✅ Dokumentationskrydsreferencer og navigation opdateret
- ✅ Eksempler dækker fra begynder- til avancerede scenarier, inklusive produktionsmikrotjenester

#### Noter
- **Omfang**: Kun engelsksproget dokumentation og eksempler
- **Næste skridt**: Udvid med yderligere avancerede containermønstre og CI/CD-automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produktommærkning: Microsoft Foundry
**Denne version implementerer en omfattende produktnavneændring fra "Microsoft Foundry" til "Microsoft Foundry" i al engelsksproget dokumentation, hvilket afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Produktnavneopdatering**: Fuld ommærkning fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdaterede alle referencer i den engelsksprogede dokumentation i `docs/`-mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - I alt: 23 indholdsreferencer opdateret på tværs af 7 dokumentationsfiler

- **📁 Ændringer i mappestrukturen**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret for at afspejle den nye mappestruktur
  - Navigationslinks valideret på tværs af al dokumentation

- **📄 Filomdøbninger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til det nye filnavn

#### Opdaterede filer
- **Kapiteldokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslinkopdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencer til produktnavnet opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruger allerede Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, feedback fra fællesskabet, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreferencelinks opdateret
  - `docs/getting-started/first-project.md` - 2 kapitelnavigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 næste kapitellinks opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord-fællesskab)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteltitler, skabelonsektion, indsigt fra fællesskabet)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitlets ressourcer)

#### Valideret
- ✅ Ingen resterende "ai-foundry" mappestireferencer i den engelsksprogede dokumentation
- ✅ Ingen resterende "Microsoft Foundry" produktnavnsreferencer i den engelsksprogede dokumentation
- ✅ Alle navigationslinks fungerer med den nye mappestruktur
- ✅ Fil- og mappenavne omdøbt med succes
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Omfang**: Ændringer anvendt kun på engelsksproget dokumentation i `docs/`-mappen
- **Oversættelser**: Oversættelsesmapperne (`translations/`) blev ikke opdateret i denne version
- **Workshop**: Workshop-materialer (`workshop/`) blev ikke opdateret i denne version
- **Eksempler**: Eksempelfiler kan stadig referere til ældre navngivning (vil blive håndteret i en fremtidig opdatering)
- **Eksterne links**: Eksterne URL'er og GitHub-repositoriumreferencer forbliver uændrede

#### Migreringsvejledning for bidragydere
Hvis du har lokale grene eller dokumentation, der refererer til den gamle struktur:
1. Opdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider, at alle interne dokumentationslinks stadig fungerer

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur-preview og valideringsforbedringer
**Denne version introducerer omfattende understøttelse af den nye Azure Developer CLI-previewfunktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview funktionsdokumentation**: Omfattende dækning af den nye infrastruktur-previewfunktionalitet
  - Kommandoreference og brugseksempler i hurtigreferencen
  - Detaljeret integration i provisionsvejledningen med brugstilfælde og fordele
  - Pre-flight-tjekintegration for sikrere udrulningsvalidering
  - Opdateringer i kom-i-gang-guiden med sikkerhed-først udrulningspraksis
- **🚧 Workshopstatus-banner**: Professionelt HTML-banner, der angiver workshopudviklingsstatus
  - Gradientdesign med byggeindikatorer for klar kommunikation til brugeren
  - Sidst opdateret-tidsstempel for gennemsigtighed
  - Mobilresponsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktursikkerhed**: Preview-funktionalitet integreret i hele udrulningsdokumentationen
- **Præ-udrulningsvalidering**: Automatiserede scripts inkluderer nu infrastruktur-previewtest
- **Udviklerworkflow**: Opdaterede kommando-sekvenser for at inkludere preview som bedste praksis
- **Workshopoplevelse**: Klare forventninger sat for brugere om indholdets udviklingsstatus

#### Ændret
- **Udrulningsbedste praksis**: Preview-først-arbejdsgang anbefales nu som tilgang
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshoppræsentation**: Professionel statuskommunikation med tydelig udviklingstidslinje

#### Forbedret
- **Sikkerhed-først-tilgang**: Infrastrukturændringer kan nu valideres før udrulning
- **Teamsamarbejde**: Preview-resultater kan deles til gennemgang og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisionering
- **Risikoreduktion**: Færre udrulningsfejl gennem forudgående validering

#### Teknisk implementering
- **Multi-dokumentintegration**: Preview-funktion dokumenteret i 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentationen
- **Integrering af bedste praksis**: Preview inkluderet i valideringsarbejdsgange og scripts
- **Visuelle indikatorer**: Tydelige NY-funktionsmarkeringer for synlighed

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionelt HTML-banner med gradientstyling
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel præsentation**: Opretholder repository-troværdighed samtidig med at forventninger sættes
- **Tidslinjegennemsigtighed**: Oktober 2025 sidst opdateret-tidsstempel for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede workshopmaterialer og interaktiv læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive guider og strukturerede læringsforløb.**

#### Tilføjet
- **🎥 Interaktiv workshopguide**: Browserbaseret workshopoplevelse med MkDocs-previewfunktionalitet
- **📝 Strukturerede workshopinstruktioner**: 7-trins vejledt læringsforløb fra opdagelse til tilpasning
  - 0-Introduktion: Workshopoversigt og opsætning
  - 1-Vælg-AI-skabelon: Skabelonopdagelse og valgproces
  - 2-Validér-AI-skabelon: Udrulnings- og valideringsprocedurer
  - 3-Dekonstruer-AI-skabelon: Forståelse af skabelonarkitektur
  - 4-Konfigurer-AI-skabelon: Konfiguration og tilpasning
  - 5-Tilpas-AI-skabelon: Avancerede ændringer og iterationer
  - 6-Nedtag-infrastruktur: Oprydning og ressourcestyring
  - 7-Afslutning: Resumé og næste skridt
- **🛠️ Workshopværktøjer**: MkDocs-konfiguration med Material-tema for forbedret læringsoplevelse
- **🎯 Praktisk læringssti**: 3-trins metode (Opdagelse → Udrulning → Tilpasning)
- **📱 GitHub Codespaces-integration**: Problemfri opsætning af udviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Udvidet med omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsudrulning
- **Udvikleroplevelse**: Integrerede værktøjer for strømlinede udviklingsarbejdsgange

#### Forbedret
- **Tilgængelighed**: Browserbaseret interface med søgning, kopi-funktionalitet og temaomskifter
- **Selvstyret læring**: Fleksibel workshopstruktur, der tilpasser sig forskellige læringshastigheder
- **Praktisk anvendelse**: Virkelighedsnære AI-skabelonudrulningssituationer
- **Fællesskabsintegration**: Discord-integration til workshopstøtte og samarbejde

#### Workshopfunktioner
- **Indbygget søgning**: Hurtig søgning efter nøgleord og lektioner
- **Kopiér kodeblokke**: Hover-for-at-kopiere-funktionalitet for alle kodeeksempler
- **Temaomskifter**: Understøttelse af mørk/lys tilstand efter præference
- **Visuelle ressourcer**: Skærmbilleder og diagrammer for bedre forståelse
- **Hjælpeintegration**: Direkte Discord-adgang til fællesskabsstøtte

### [v3.2.0] - 2025-09-17

#### Stor navigationomstrukturering og kapitelfokuseret læringssystem
**Denne version introducerer en omfattende kapitelfokuseret læringsstruktur med forbedret navigation gennem hele arkivet.**

#### Tilføjet
- **📚 Kapitelbaseret læringssystem**: Omstruktureret hele kurset til 8 progressive læringskapitler
  - Kapitel 1: Fundament & Hurtigstart (⭐ - 30-45 min)
  - Kapitel 2: AI-førstudvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentificering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & Udrulning (⭐⭐⭐ - 1-1,5 timer)
  - Kapitel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Præ-udrulningsvalidering & Planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1,5 timer)
  - Kapitel 8: Produktions- & Enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigationssystem**: Konsistente navigationsoverskrifter og -fod på tværs af al dokumentation
- **🎯 Fremskridtsopsporing**: Tjekliste for kursusafslutning og læringsverificeringssystem
- **🗺️ Vejledning til læringssti**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference-navigation**: Relaterede kapitler og forudsætninger tydeligt forbundet

#### Forbedret
- **README-struktur**: Omformet til en struktureret læringsplatform med kapitelbaseret organisering
- **Dokumentationsnavigation**: Hver side indeholder nu kapitelkontekst og vejledning om progression
- **Skabelonorganisation**: Eksempler og skabeloner matchet til relevante læringskapitler
- **Ressourceintegration**: Hurtigreferencer, FAQ og studieguider forbundet til relevante kapitler
- **Workshopintegration**: Hands-on labs tilknyttet flere kapitlers læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibel kapitelbaseret læring
- **Placering af konfiguration**: Konfigurationsvejledningen genplaceret som Kapitel 3 for bedre læringsflow
- **Integrering af AI-indhold**: Bedre integration af AI-specifikt indhold gennem hele læringsforløbet
- **Produktionsindhold**: Avancerede mønstre samlet i Kapitel 8 for enterprise-lærende

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og indikatorer for kapitelprogression
- **Tilgængelighed**: Konsistente navigationsmønstre for nemmere gennemgang af kurset
- **Professionel præsentation**: Universitetsagtig kursusstruktur egnet til akademisk og virksomhedstræning
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk implementering
- **Navigationsoverskrifter**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Footer-navigation**: Konsistent vejledning om progression og indikatorer for kapitelafslutning
- **Krydslinking**: Omfattende internt linkningssystem, der forbinder relaterede koncepter
- **Kapitelkortlægning**: Skabeloner og eksempler tydeligt knyttet til læringsmål

#### Forbedring af studieguide
- **📚 Omfattende læringsmål**: Studieguiden omstruktureret for at stemme overens med 8-kapitelsystemet
- **🎯 Kapitelbaseret vurdering**: Hvert kapitel indeholder specifikke læringsmål og praktiske øvelser
- **📋 Fremskridtssporing**: Ugentlig læringsplan med målbare resultater og tjeklister for gennemførelse
- **❓ Vurderingsspørgsmål**: Spørgsmål til vidensvalidering for hvert kapitel med professionelle resultater
- **🛠️ Praktiske øvelser**: Hands-on aktiviteter med rigtige udrulningsscenarier og fejlfinding
- **📊 Færdighedsprogression**: Klar fremgang fra grundlæggende koncepter til enterprise-mønstre med fokus på karriereudvikling
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og fællesskabsanerkendelsessystem
- **⏱️ Tidslinjestyring**: Struktureret 10-ugers læringsplan med validering af milepæle

### [v3.1.0] - 2025-09-17

#### Forbedrede multi-agent AI-løsninger
**Denne version forbedrer den multi-agent detailhandelsløsning med bedre agentnavngivning og forbedret dokumentation.**

#### Ændret
- **Multi-agent terminologi**: Erstattede "Cora agent" med "Customer agent" i hele detail-multi-agent-løsningen for bedre forståelse
- **Agentarkitektur**: Opdaterede al dokumentation, ARM-skabeloner og kodeeksempler til at bruge konsekvent "Customer agent"-navngivning
- **Konfigurationseksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Dokumentationskonsistens**: Sikrede at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM-skabelonpakke**: Opdateret retail-multiagent-arm-template med Customer agent-referencer
- **Arkitekturdiagrammer**: Opdaterede Mermaid-diagrammer med opdateret agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruger nu CustomerAgent-navngivning
- **Miljøvariabler**: Opdaterede alle udrulningsscripts til at bruge CUSTOMER_AGENT_NAME-konventionerne

#### Forbedret
- **Developer Experience**: Klarere agentroller og ansvarsområder i dokumentationen
- **Production Readiness**: Bedre tilpasning til virksomhedsnavngivningskonventioner
- **Learning Materials**: Mere intuitiv agentnavngivning til uddannelsesformål
- **Template Usability**: Forenklet forståelse af agentfunktioner og udrulningsmønstre

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Fuldstændig omlægning med prioritet for AI-udviklere og ingeniører
- **Microsoft Foundry Integration Guide**: Omfattende dokumentation til forbindelse mellem AZD og Microsoft Foundry-tjenester
- **AI Model Deployment Patterns**: Detaljeret vejledning om valg af modeller, konfiguration og produktionsudrulningsstrategier
- **AI Workshop Lab**: 2-3 timers praktisk workshop til konvertering af AI-applikationer til AZD-udrulningsklare løsninger
- **Production AI Best Practices**: Virksomhedsklare mønstre til skalering, overvågning og sikring af AI-workloads
- **AI-Specific Troubleshooting Guide**: Omfattende fejlfinding for Azure OpenAI, Cognitive Services og AI-udrulningsproblemer
- **AI Template Gallery**: Udvalgt samling af Microsoft Foundry-skabeloner med kompleksitetsvurderinger
- **Workshop Materials**: Fuldstændig workshopsstruktur med hands-on labs og referencematerialer

#### Enhanced
- **README Structure**: AI-udviklerfokuseret med 45% community-interesse data fra Microsoft Foundry Discord
- **Learning Paths**: Dedikeret AI-udviklerrejse ved siden af traditionelle spor for studerende og DevOps-ingeniører
- **Template Recommendations**: Fremhævede AI-skabeloner inklusive azure-search-openai-demo, contoso-chat, og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord-fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specifikke autentificerings- og sikkerhedskonfigurationer
- **Cost Optimization**: Sporing af token-forbrug og budgetkontroller for AI-workloads
- **Multi-Region Deployment**: Strategier til global udrulning af AI-applikationer
- **Performance Monitoring**: AI-specifikke målepunkter og integration med Application Insights

#### Documentation Quality
- **Linear Course Structure**: Logisk progression fra begynder til avancerede AI-udrulningsmønstre
- **Validated URLs**: Alle eksterne repository-links verificeret og tilgængelige
- **Complete Reference**: Alle interne dokumentationslinks valideret og funktionelle
- **Production Ready**: Virksomhedsklare udrulningsmønstre med virkelige eksempler

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Alle dokumentationssider indeholder nu Introduction, Learning Goals og Learning Outcomes sektioner
- **Navigation System**: Tilføjede Previous/Next-lesson links gennem alle dokumentationer for guidet læringsprogression
- **Study Guide**: Omfattende study-guide.md med læringsmål, praksisøvelser og vurderingsmaterialer
- **Professional Presentation**: Fjernet alle emoji-ikoner for forbedret tilgængelighed og professionelle fremtoning
- **Enhanced Content Structure**: Forbedret organisering og flow af læringsmaterialer

#### Changed
- **Documentation Format**: Standardiseret al dokumentation med konsekvent læringsfokuseret struktur
- **Navigation Flow**: Implementeret logisk progression gennem alle læringsmaterialer
- **Content Presentation**: Fjernet dekorative elementer til fordel for klar, professionel formatering
- **Link Structure**: Opdateret alle interne links for at understøtte nyt navigationssystem

#### Improved
- **Accessibility**: Fjernet emoji-afhængigheder for bedre skærmlæserkompatibilitet
- **Professional Appearance**: Ren, akademisk stil egnet til virksomhedslæring
- **Learning Experience**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Content Organization**: Bedre logisk flow og forbindelse mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installation and configuration guides for Windows, macOS, and Linux
- **Multiple Skill Levels**: Content designed for students through professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices integrated throughout
- **Cost Optimization**: Guidance for cost-effective deployments and resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common issues
- **Best Practices Integration**: Industry standards and recommendations
- **Version Compatibility**: Up-to-date with latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers with isolated AI services
- **Edge AI Deployment**: Integration with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery and edge caching patterns for AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions are released, we provide:
- **Migreringsvejledninger**: Trin-for-trin instruktioner til migreringen
- **Kompatibilitetsnoter**: Detaljer om inkompatible ændringer
- **Værktøjsunderstøttelse**: Skripter eller værktøjer til at hjælpe med migreringen
- **Fællesskabsstøtte**: Dedikerede fora til spørgsmål om migrering

---

**Navigation**
- **Forrige lektion**: [Studieguide](resources/study-guide.md)
- **Næste lektion**: Tilbage til [Hoved-README](README.md)

**Hold dig opdateret**: Hold øje med dette repository for underretninger om nye udgivelser og vigtige opdateringer af læringsmaterialerne.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->