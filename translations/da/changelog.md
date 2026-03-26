# Ændringslog - AZD For Beginners

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger principperne for semantisk versionering og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Holde dig informeret om nye funktioner og indholds-tilføjelser
- Forstå forbedringer foretaget i eksisterende dokumentation
- Spore fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslog-entries vil du være i stand til at:
- Identificere nyt indhold og ressourcer tilgængelige til læring
- Forstå hvilke sektioner der er opdateret eller forbedret
- Planlægge din læringssti baseret på det mest aktuelle materiale
- Give feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Denne version tilføjer dækning af `azd ai`, `azd extension` og `azd mcp` kommandoer på tværs af alle AI-relaterede kapitler, retter ødelagte links og forældet kode i agents.md, opdaterer snydearket og gennemgår Example Templates-sektionen med validerede beskrivelser og nye Azure AI AZD-skabeloner.**

#### Tilføjet
- **🤖 AZD AI CLI-dækning** på tværs af 7 filer (tidligere kun i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny "Extensions and AI Commands" sektion, der introducerer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Valgmulighed 4: `azd ai agent init` med sammenligningstabel (template vs manifest-tilgang)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underafsnittene "AZD Extensions for Foundry" og "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start viser nu både template- og manifest-baserede deploy-stier
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sektionen inkluderer nu `azd ai agent init` mulighed
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underafsnit "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Ny "AI & Extensions Commands" sektion med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI-eksempelsskabeloner** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat med Blazor WebAssembly, Semantic Kernel og stemmechat-understøttelse
  - **azure-search-openai-demo-java** — Java RAG-chat ved hjælp af Langchain4J med ACA/AKS deploy-muligheder
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp ved brug af Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG ved brug af Azure Functions + LangChain.js + Cosmos DB med Ollama lokal udviklingsstøtte
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med admin-portal, Teams-integration og PostgreSQL/Cosmos DB-muligheder
  - **azure-ai-travel-agents** — Multi-agent MCP-orchestration referenceapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep starter-skabelon
  - **🔗 Awesome AZD AI Gallery link** — Henvisning til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ skabeloner)

#### Rettet
- **🔗 agents.md navigation**: Forrige/Næste-links matcher nu Chapter 2 README-lektionens rækkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte links**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md forældet kode**: Udskiftet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenoptælling**: Erstattet grov `len//4` estimering med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standardvært ændret okt 2024)
- **contoso-chat**: Opdateret beskrivelse til at henvise til Azure AI Foundry + Prompty, så den matcher repoets faktiske titel og tech-stack

#### Fjernet
- **ai-document-processing**: Fjernet reference til non-funktionel skabelon (repo ikke offentligt tilgængeligt som en AZD-skabelon)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nu forventet output og `azd monitor` trin; Øvelse 2 inkluderer fuld `FunctionTool` registreringskode; Øvelse 3 erstatter vag vejledning med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressourcer**: Opdaterede dokumentationslinks til aktuelle Azure AI Agent Service-dokumenter og quickstart
- **📋 agents.md Next Steps tabel**: Tilføjet AI Workshop Lab-link for komplet kapitel-dækning

#### Opdaterede filer
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
**Denne version forbedrer README.md kapitelnavigation med et forbedret tabelformat.**

#### Ændret
- **Kursuskorttabel**: Forbedret med direkte lektionslinks, varighedsestimater og kompleksitetsvurderinger
- **Mappeoprydning**: Fjernet redundante gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidering**: Alle 21+ interne links i Kursuskort-tabellen verificeret

### [v3.16.0] - 2026-02-05

#### Produktnavneopdateringer
**Denne version opdaterer produktreferencer til nuværende Microsoft-branding.**

#### Ændret
- **Microsoft Foundry → Microsoft Foundry**: Alle referencer opdateret på tværs af ikke-oversættelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret for at afspejle aktuel branding

#### Opdaterede filer
- `README.md` - Hovedkursusside
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursusstruktur
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Eksempeldokumentation
- `workshop/README.md` - Workshop-landingpage
- `workshop/docs/index.md` - Workshop-indeks
- `workshop/docs/instructions/*.md` - Alle workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor omstrukturering af repository: Kapitelbaserede mappenavne
**Denne version omstrukturerer dokumentationen i dedikerede kapitelmapper for klarere navigation.**

#### Mappenavne ændret
Gamle mapper er erstattet med kapitel-numre:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Tilføjet ny: `docs/chapter-05-multi-agent/`

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
- **📚 Kapitel README-filer**: Oprettet README.md i hver kapitelmappe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Quick start-kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Opdateret alle interne links**: 78+ stier opdateret på tværs af alle dokumentationsfiler
- **🗺️ Hoved README.md**: Opdateret Kursuskort med ny kapitelstruktur
- **📝 examples/README.md**: Opdaterede krydsreferencer til kapitelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-omstrukturering: Kapitelnavigation
**Denne version tilføjede kapitel-navigations README-filer (erstattet af v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI Agents Guide
**Denne version tilføjer en omfattende guide til deploy af AI-agenter med Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Fuld guide der dækker:
  - Hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
  - Tre quick-start agent-skabeloner (Foundry Agents, Prompty, RAG)
  - Agent-arkitekturmønstre (single agent, RAG, multi-agent)
  - Tool-konfiguration og tilpasning
  - Overvågning og metriksporing
  - Omkostningsovervejelser og optimering
  - Almindelige fejlfindingsscenarier
  - Tre praktiske øvelser med succeskriterier

#### Indholdsstruktur
- **Introduktion**: Agent-koncepter for begyndere
- **Quick Start**: Deploy agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer af agentmønstre
- **Konfiguration**: Tool-opsætning og miljøvariabler
- **Overvågning**: Application Insights-integration
- **Øvelser**: Progressiv hands-on læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-miljøopdatering
**Denne version opdaterer development container-konfigurationen med moderne værktøjer og bedre standardindstillinger for AZD-læringsoplevelsen.**

#### Ændret
- **🐳 Basebillede**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste Debian stable)
- **📛 Containernavn**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 Nye Dev Container-funktioner**:
  - `azure-cli` med Bicep-understøttelse aktiveret
  - `node:20` (LTS-version for AZD-skabeloner)
  - `github-cli` til skabelhåndtering
  - `docker-in-docker` til udrulning af container-apps

- **🔌 Portvideresendelse**: Forhåndskonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs-forhåndsvisning)
  - 3000 (Webapps)
  - 5000 (Python Flask)
  - 8080 (API'er)

- **🧩 Nye VS Code-udvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-understøttelse
  - `ms-azuretools.vscode-docker` - Docker-understøttelse
  - `ms-azuretools.vscode-bicep` - Bicep-sprogunderstøttelse
  - `ms-azure-devtools.azure-resource-groups` - Azure-ressourcestyring
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramunderstøttelse
  - `redhat.vscode-yaml` - YAML-understøttelse (til azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-indstillinger**: Tilføjede standardindstillinger for Python-tolk, formatering ved gem og trimning af mellemrum

- **📦 Opdateret requirements-dev.txt**:
  - Tilføjet MkDocs minify-plugin
  - Tilføjet pre-commit til kodekvalitet
  - Tilføjet Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-Create Command**: Verificerer nu installationen af AZD og Azure CLI ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Begynder-venlig README-omlægning
**Denne version forbedrer README.md betydeligt for at gøre den mere tilgængelig for begyndere og tilføjer essentielle ressourcer til AI-udviklere.**

#### Tilføjet
- **🆚 Azure CLI vs AZD Sammenligning**: Klar forklaring på, hvornår man skal bruge hvert værktøj med praktiske eksempler
- **🌟 Awesome AZD Links**: Direkte links til fællesskabets skabelongalleri og bidragsressourcer:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ skabeloner klar til udrulning
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Fællesskabsbidrag
- **🎯 Quick Start Guide**: Forenklet 3-trins kom-i-gang-sektion (Install → Login → Deploy)
- **📊 Erfaringsbaseret navigeringstabel**: Klar vejledning om, hvor man skal starte baseret på udviklerens erfaring

#### Ændret
- **README-struktur**: Omskrevet for progressiv afsløring - nøgleinformation først
- **Introduktionssektion**: Omskrevet for at forklare "The Magic of `azd up`" til helt nye brugere
- **Fjernet duplikeret indhold**: Eliminerede duplikeret fejlsøgningssektion
- **Fejlsøgningskommandoer**: Rettet `azd logs`-referencen til at bruge gyldig `azd monitor --logs`

#### Rettet
- **🔐 Godkendelseskommandoer**: Tilføjede `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Ugyldige kommando-referencer**: Fjernede resterende `azd logs` fra README-fejlsøgningssektionen

#### Noter
- **Scope**: Ændringer anvendt på hoved-README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer specifikt rettet mod udviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Korrektur af Azure Developer CLI-kommandoer
**Denne version retter ikke-eksisterende AZD-kommandoer i dokumentationen og sikrer, at alle kodeeksempler bruger gyldig Azure Developer CLI-syntaks.**

#### Rettet
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende gennemgang og korrektion af ugyldige kommandoer:
  - `azd logs` (findes ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` undermenuer (findes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (findes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (findes ikke) → fjernet
  - `azd provision --what-if/--rollback` flags (findes ikke) → opdateret til at bruge `--preview`
  - `azd config validate` (findes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (findes ikke) → fjernet

- **📚 Filer opdateret med kommando-korrektioner**:
  - `resources/cheat-sheet.md`: Større gennemgang af kommandooversigten
  - `docs/deployment/deployment-guide.md`: Rettede rollback- og udrulningsstrategier
  - `docs/troubleshooting/debugging.md`: Rettede loganalyse-sektioner
  - `docs/troubleshooting/common-issues.md`: Opdaterede fejlfindingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettede AZD-debugging-sektionen
  - `docs/getting-started/azd-basics.md`: Rettede overvågningskommandoer
  - `docs/getting-started/first-project.md`: Opdaterede overvågnings- og debugging-eksempler
  - `docs/getting-started/installation.md`: Rettede hjælp- og versions-eksempler
  - `docs/pre-deployment/application-insights.md`: Rettede kommandoer til logvisning
  - `docs/pre-deployment/coordination-patterns.md`: Rettede agent-debugging-kommandoer

- **📝 Versionsreference opdateret**:
  - `docs/getting-started/installation.md`: Ændrede hårdkodet `1.5.0` version til generisk `1.x.x` med link til releases

#### Ændret
- **Rollback-strategier**: Dokumentation opdateret til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Logvisning**: Udskiftede `azd logs`-referencer med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Performance-sektion**: Fjernede ikke-eksisterende parallelle/incrementelle udrulningsflags og gav gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flags**: `--live`, `--logs`, `--overview`
- **Fjernede funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noter
- **Verifikation**: Kommandoer valideret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop-færdiggørelse og dokumentationskvalitetsopdatering
**Denne version færdiggør de interaktive workshopmoduler, retter alle brudte dokumentationslinks og forbedrer den samlede indholdskvalitet for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Nyt dokument med retningslinjer for bidrag, inkl.:
  - Klare instruktioner til rapportering af problemer og forslag til ændringer
  - Dokumentationsstandarder for nyt indhold
  - Retningslinjer for kodeeksempler og commit-beskeder
  - Information om fællesskabsengagement

#### Fuldført
- **🎯 Workshop Modul 7 (Wrap-up)**: Fuldt færdigt wrap-up-modul med:
  - Omfattende resume af workshopens resultater
  - Sektion om nøglebegreber der er mestret, dækker AZD, skabeloner og Microsoft Foundry
  - Anbefalinger til fortsat læringsrejse
  - Workshop-udfordringsøvelser med sværhedsgradsvurderinger
  - Links til fællesskabsfeedback og support

- **📚 Workshop Modul 3 (Deconstruct)**: Opdaterede læringsmål med:
  - Aktiveringsvejledning for GitHub Copilot med MCP-servere
  - Forståelse af AZD-skabelonmappers struktur
  - Organiseringsmønstre for Infrastructure-as-Code (Bicep)
  - Hands-on lab-instruktioner

- **🔧 Workshop Modul 6 (Teardown)**: Fuldført med:
  - Ressourceoprydning og omkostningsstyringsmål
  - Brug af `azd down` til sikker deprovisionering af infrastruktur
  - Vejledning til genopretning af soft-slettede kognitive tjenester
  - Bonus-udforskning for GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Fejrede knækkede links**: Løst 15+ brudte interne dokumentationslinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettede ai-model-deployment.md og production-ai-practices.md stier
  - `docs/getting-started/first-project.md`: Erstattedes ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede FAQ- og fejlsøgningsguide-stier
  - `examples/container-app/microservices/README.md`: Rettede kursushjem- og udrulningsguide-stier
  - `resources/faq.md` og `resources/glossary.md`: Opdaterede AI-kapitelreferencer
  - `course-outline.md`: Rettede instruktørguide- og AI-workshop-lab-referencer

- **📅 Workshop-statusbanner**: Opdateret fra "Under Construction" til aktiv workshop-status med februar 2026-dato

- **🔗 Workshop-navigation**: Rettede brudte navigationslinks i workshop-README.md, som pegede på ikke-eksisterende lab-1-azd-basics-mappe

#### Ændret
- **Workshop-præsentation**: Fjernede "under construction"-advarsel; workshoppen er nu komplet og klar til brug
- **Navigationskonsistens**: Sikrede, at alle workshop-moduler har korrekt inter-modul navigation
- **Læreforløbsreferencer**: Opdaterede kapitelkrydsreferencer til at bruge korrekte microsoft-foundry-stier

#### Valideret
- ✅ Alle engelske markdown-filer har gyldige interne links
- ✅ Workshop-moduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indhold egner sig til AI-udviklere, der bruger Microsoft AZD
- ✅ Begynder-venligt sprog og struktur opretholdt gennemgående
- ✅ CONTRIBUTING.md giver klar vejledning til fællesskabsbidragydere

#### Teknisk implementering
- **Linkvalidering**: Automatiseret PowerShell-script verificerede alle .md interne links
- **Indholdsaudit**: Manuel gennemgang af workshop-færdiggørelse og begyndervenlighed
- **Navigationssystem**: Konsistente kapitler og modulnavigationsmønstre anvendt

#### Noter
- **Scope**: Ændringer anvendt kun på engelsk dokumentation
- **Oversættelser**: Oversættelsesmapper opdateres ikke i denne version (automatiseret oversættelse synkroniseres senere)
- **Workshop-varighed**: Færdig workshop giver nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret dokumentation: Overvågning, sikkerhed og multi-agent-mønstre
**Denne version tilføjer omfattende A-niveau lektioner om Application Insights-integration, autentificeringsmønstre og multi-agent koordinering til produktionsudrulninger.**

#### Tilføjet
- **📊 Application Insights-integrationslektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret udrulning med automatisk provisioning
  - Fuldstændige Bicep-skabeloner til Application Insights + Log Analytics
  - Arbejdende Python-applikationer med tilpasset telemetri (1.200+ linjer)
  - AI/LLM-overvågningsmønstre (Microsoft Foundry Models token-/omkostningssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribueret tracing, telemetriflow)
  - 3 hands-on øvelser (alarmer, dashboards, AI-overvågning)
  - Kusto-forespørgsel-eksempler og omkostningsoptimeringsstrategier
  - Live-metrikstreaming og realtids-debugging
  - 40-50 minutters læringstid med produktionsklare mønstre

- **🔐 Autentificerings- & sikkerhedsmønsterlektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (connection strings, Key Vault, managed identity)
  - Fuldstændige Bicep-infrastruktur-skabeloner til sikre udrulninger
  - Node.js-applikationskode med Azure SDK-integration
  - 3 komplette øvelser (aktiver managed identity, user-assigned identity, Key Vault-rotation)
  - Sikkerhedsbest-practices og RBAC-konfigurationer
  - Fejlsøgningsguide og omkostningsanalyse
  - Produktionsklare passwordless autentificeringsmønstre

- **🤖 Multi-agent koordineringsmønsterlektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmønstre (sekventiel, parallel, hierarkisk, hændelsesdrevet, konsensus)
  - Fuldstændig orchestrator-service-implementering (Python/Flask, 1.500+ linjer)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus-integration til beskedkøning
  - Cosmos DB state management for distribuerede systemer
  - 6 Mermaid-diagrammer, der viser agentinteraktioner
  - 3 avancerede øvelser (timeout-håndtering, retry-logik, circuit breaker)
  - Omkostningsopdeling ($240-565/month) med optimeringsstrategier
  - Application Insights-integration til overvågning

#### Forbedret
- **Pre-deployment-kapitel**: Indeholder nu omfattende overvågnings- og koordineringsmønstre
- **Getting Started-kapitel**: Forbedret med professionelle autentificeringsmønstre
- **Produktionsparathed**: Fuld dækning fra sikkerhed til observability
- **Kursusoversigt**: Opdateret til at henvise til nye lektioner i kapitlerne 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og overvågning gennem kurset
- **Dokumentationskvalitet**: Konsistente A-niveau standarder (95-97%) på tværs af nye lektioner
- **Produktionsmønstre**: Fuld end-to-end dækning til enterprise-udrulninger

#### Forbedret
- **Developer Experience**: Klar vej fra udvikling til overvågning i produktion
- **Security Standards**: Professionelle mønstre for autentificering og hemmelighedshåndtering
- **Observability**: Komplet Application Insights-integration med AZD
- **AI Workloads**: Specialiseret overvågning for Microsoft Foundry-modeller og multi-agent-systemer

#### Validated
- ✅ Alle lektioner indeholder komplet fungerende kode (ikke uddrag)
- ✅ Mermaid-diagrammer til visuel læring (19 i alt fordelt på 3 lektioner)
- ✅ Praktiske øvelser med verifikationstrin (9 i alt)
- ✅ Produktionsegnede Bicep-skabeloner, der kan implementeres via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlsøgningsvejledninger og bedste praksis
- ✅ Videnskontrolpunkter med verifikationskommandoer

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsvejledning
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent-arkitekturer
- **Overall New Content**: - Konsistente høje kvalitetsstandarder

#### Technical Implementation
- **Application Insights**: Log Analytics + brugerdefineret telemetri + distribueret sporing
- **Authentication**: Managed Identity + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Monitoring**: Live-metrics + Kusto-forespørgsler + alarmer + dashboards
- **Cost Management**: Sampling-strategier, opbevaringspolitikker, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Dokumentationskvalitetsforbedringer og nyt Microsoft Foundry Models-eksempel
**Denne version forbedrer dokumentationskvaliteten i hele repository'et og tilføjer et komplet Microsoft Foundry Models-implementeringseksempel med gpt-4.1 chatgrænseflade.**

#### Tilføjet
- **🤖 Microsoft Foundry Models Chat Example**: Komplet gpt-4.1-udrulning med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplet Microsoft Foundry Models-infrastruktur (gpt-4.1 modelimplementering)
  - Python-kommandolinjechatgrænseflade med samtalehistorik
  - Key Vault-integration til sikker opbevaring af API-nøgler
  - Sporing af tokenbrug og omkostningsestimering
  - Ratebegrænsning og fejlhåndtering
  - Omfattende README med 35-45 minutters udrulningsguide
  - 11 produktionsegnede filer (Bicep-skabeloner, Python-app, konfiguration)
- **📚 Documentation Exercises**: Tilføjet praktiske øvelser til konfigurationsguiden:
  - Øvelse 1: Multi-miljøkonfiguration (15 minutter)
  - Øvelse 2: Hemmelighedshåndtering (10 minutter)
  - Klare succes‑kriterier og verifikationstrin
- **✅ Deployment Verification**: Tilføjede verifikationssektion til udrulningsguiden:
  - Sundhedstjekprocedurer
  - Tjekliste over succes‑kriterier
  - Forventede output for alle udrulningskommandoer
  - Hurtig fejlsøgningsreference

#### Forbedret
- **examples/README.md**: Opdateret til A-kvalitet (93%):
  - Tilføjede azure-openai-chat til alle relevante sektioner
  - Opdaterede antallet af lokale eksempler fra 3 til 4
  - Tilføjet til tabellen AI Application Examples
  - Integreret i Quick Start for Intermediate Users
  - Tilføjet til Microsoft Foundry Templates-sektionen
  - Opdateret Comparison Matrix- og technology finding-sektioner
- **Documentation Quality**: Forbedret B+ (87%) → A- (92%) i hele docs-mappen:
  - Tilføjede forventede output til kritiske kommandoeksempler
  - Inkluderede verifikationstrin for konfigurationsændringer
  - Forbedret praktisk læring med praktiske øvelser

#### Ændret
- **Learning Progression**: Bedre integration af AI-eksempler for mellemøvede
- **Documentation Structure**: Mere handlingsorienterede øvelser med klare resultater
- **Verification Process**: Udtrykkelige succes‑kriterier tilføjet til nøglearbejdsgange

#### Forbedret
- **Developer Experience**: Microsoft Foundry Models-udrulning tager nu 35-45 minutter (vs 60-90 for komplekse alternativer)
- **Cost Transparency**: Klare omkostningsestimater ($50-200/month) for Microsoft Foundry Models-eksemplet
- **Learning Path**: AI-udviklere har et klart indgangspunkt med azure-openai-chat
- **Documentation Standards**: Konsistente forventede output og verifikationstrin

#### Valideret
- ✅ Microsoft Foundry Models-eksempel fuldt funktionelt med `azd up`
- ✅ Alle 11 implementationsfiler syntaktisk korrekte
- ✅ README-instruktioner matcher den faktiske udrulningsoplevelse
- ✅ Dokumentationslinks opdateret på 8+ steder
- ✅ Eksempelsindeks afspejler nøjagtigt 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabeller
- ✅ Alle navigationsreferencer korrekte

#### Teknisk implementering
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps-pattern
- **Security**: Managed Identity klar, secrets i Key Vault
- **Monitoring**: Application Insights-integration
- **Cost Management**: Token-sporing og optimering af brug
- **Deployment**: Enkelt `azd up`-kommando for komplet opsætning

### [v3.6.0] - 2025-11-19

#### Stor opdatering: Container App-udrulningseksempler
**Denne version introducerer omfattende, produktionsegnede containerapplikations-udrulningseksempler ved hjælp af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsforløbet.**

#### Tilføjet
- **🚀 Container App Examples**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Fuld oversigt over containeriserede udrulninger, hurtigstart, produktion og avancerede mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Begyndervenligt REST-API med scale-to-zero, helbredsprober, overvågning og fejlsøgning
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsegnede multi-service-udrulning (API Gateway, Product, Order, User, Notification), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret sporing, blue-green/canary-udrulning
- **Best Practices**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD-vejledning for containeriserede arbejdsbelastninger
- **Code Samples**: Fuldstændig `azure.yaml`, Bicep-skabeloner og flersprogede serviceimplementeringer (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testscenarier, overvågningskommandoer, fejlsøgningsvejledning

#### Ændret
- **README.md**: Opdateret for at indeholde og linke nye container-app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Opdateret for at fremhæve container-app-eksempler, tilføje poster i sammenligningsmatrixen og opdatere teknolog-/arkitekturhenvisninger
- **Course Outline & Study Guide**: Opdateret til at referere til de nye container-app-eksempler og udrulningsmønstre i de relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan implementeres med `azd up` og følger bedste praksis
- ✅ Dokumentationskrydslinks og navigation opdateret
- ✅ Eksemplerne dækker begynder- til avancerede scenarier, inklusive produktions-mikrotjenester

#### Noter
- **Scope**: Kun engelsk dokumentation og eksempler
- **Next Steps**: Udvid med yderligere avancerede container-mønstre og CI/CD-automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produktomdøbning: Microsoft Foundry
**Denne version gennemfører en omfattende produktnavneændring fra "Microsoft Foundry" til "Microsoft Foundry" i al engelsk dokumentation, hvilket afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Product Name Update**: Fuldstændig ommærkning fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdaterede alle referencer i den engelske dokumentation i `docs/`-mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - I alt: 23 indholdsreferencer opdateret på tværs af 7 dokumentationsfiler

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret for at afspejle den nye mappestruktur

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til det nye filnavn

#### Opdaterede filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 opdateringer af navigationslinks
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnereferencer opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruger allerede Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreference-links opdateret
  - `docs/getting-started/first-project.md` - 2 navigationslinks i kapitlet opdateret
  - `docs/getting-started/installation.md` - 2 'næste kapitel'-links opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteltitler, skabelonsektion, community-indsigter)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitelressourcer)

#### Valideret
- ✅ Ingen tilbageværende 'ai-foundry'-mappehenvisninger i de engelske docs
- ✅ Ingen tilbageværende 'Microsoft Foundry' produktnavnereferencer i de engelske docs
- ✅ Alle navigationslinks fungerer med den nye mappestruktur
- ✅ Fil- og mappenavne omdøbt succesfuldt
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Scope**: Ændringer anvendt kun på engelsk dokumentation i `docs/`-mappen
- **Translations**: Oversættelsesmapperne (`translations/`) ikke opdateret i denne version
- **Workshop**: Workshop-materialer (`workshop/`) ikke opdateret i denne version
- **Examples**: Eksempelfiler kan stadig referere til legacy-navngivning (vil blive adresseret i fremtidig opdatering)

#### Migreringsvejledning for bidragydere
Hvis du har lokale branches eller dokumentation, der refererer til den gamle struktur:
1. Opdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider, at alle interne dokumentationslinks stadig fungerer

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur-preview og valideringsforbedringer
**Denne version introducerer omfattende understøttelse af den nye Azure Developer CLI-previewfunktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Feature Documentation**: Omfattende dækning af den nye infrastruktur-previewfunktion
  - Kommandoreference og brugs-eksempler i snydeark
  - Detaljeret integration i provisioning-guiden med brugstilfælde og fordele
  - Pre-flight-tjek integration for sikrere udrulningsvalidering
  - Opdateringer i Kom godt i gang-guiden med sikkerhed-først udrulningspraksis
- **🚧 Workshop Status Banner**: Professionelt HTML-banner, der angiver workshop-udviklingsstatus
  - Gradientdesign med byggeindikatorer for klar brugerkommunikation
  - Sidst opdateret tidsstempel for gennemsigtighed
  - Mobilresponsivt design for alle enhedstyper

#### Forbedret
- **Infrastructure Safety**: Preview-funktionalitet integreret i hele udrulningsdokumentationen
- **Pre-deployment Validation**: Automatiske scripts inkluderer nu infrastruktur-preview-test
- **Developer Workflow**: Opdaterede kommando-sekvenser for at inkludere preview som bedste praksis
- **Workshop Experience**: Klare forventninger sat for brugere om indholdets udviklingsstatus

#### Ændret
- **Deployment Best Practices**: Preview-først workflow nu anbefalet tilgang
- **Documentation Flow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshop Presentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Safety-First Approach**: Infrastrukturændringer kan nu valideres før udrulning
- **Team Collaboration**: Preview-resultater kan deles til gennemgang og godkendelse
- **Cost Awareness**: Bedre forståelse af ressourceomkostninger før provisioning
- **Risk Mitigation**: Reduktion af udrulningsfejl gennem forudgående validering

#### Teknisk implementering
- **Multi-document Integration**: Preview-funktion dokumenteret på tværs af 4 nøglefiler
- **Command Patterns**: Konsistent syntaks og eksempler i hele dokumentationen
- **Best Practice Integration**: Preview inkluderet i valideringsarbejdsgange og scripts
- **Visual Indicators**: Tydelige NYE funktionsmarkeringer for synlighed

#### Workshop-infrastruktur
- **Status Communication**: Professionelt HTML-banner med gradient-styling
- **User Experience**: Klar udviklingsstatus forhindrer forvirring
- **Professional Presentation**: Opretholder repositoryets troværdighed samtidig med at sætte forventninger
- **Timeline Transparency**: Sidst opdateret oktober 2025-tidsstempel for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede workshopmaterialer og interaktiv læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browser-baserede interaktive guider og strukturerede læringsforløb.**

#### Tilføjet
- **🎥 Interactive Workshop Guide**: Browser-baseret workshopoplevelse med MkDocs forhåndsvisningsfunktion
- **📝 Structured Workshop Instructions**: 7-trins guidet læringsforløb fra opdagelse til tilpasning
  - 0-Introduction: Workshopoversigt og opsætning
  - 1-Select-AI-Template: Skabelonopdagelse og valgproces
  - 2-Validate-AI-Template: Udrulnings- og valideringsprocedurer
  - 3-Deconstruct-AI-Template: Forståelse af skabelonarkitektur
  - 4-Configure-AI-Template: Konfiguration og tilpasning
  - 5-Customize-AI-Template: Avancerede ændringer og iterationer
  - 6-Teardown-Infrastructure: Oprydning og ressourcestyring
  - 7-Wrap-up: Resume og næste skridt
- **🛠️ Workshop Tooling**: MkDocs-konfiguration med Material-tema for forbedret læringsoplevelse
- **🎯 Hands-On Learning Path**: 3-trins metode (Opdagelse → Udrulning → Tilpasning)
- **📱 GitHub Codespaces Integration**: Problemfri opsætning af udviklingsmiljø

#### Enhanced
- **AI Workshop Lab**: Udvidet med en omfattende 2-3 timers struktureret læringsoplevelse
- **Workshop Documentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Learning Progression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsudrulning
- **Developer Experience**: Integrerede værktøjer til strømlinede udviklingsworkflows

#### Improved
- **Accessibility**: Browserbaseret grænseflade med søgning, kopieringsfunktionalitet og temaomskifter
- **Self-Paced Learning**: Fleksibel workshopstruktur, der tilpasser forskellige læringshastigheder
- **Practical Application**: Virkelighedsnære AI-skabelon-udrulningsscenarier
- **Community Integration**: Discord-integration til workshopsupport og samarbejde

#### Workshop Features
- **Built-in Search**: Hurtig søgning efter nøgleord og lektioner
- **Copy Code Blocks**: Hover-for-at-kopiere funktionalitet for alle kodeeksempler
- **Theme Toggle**: Understøttelse af mørk/lys tilstand efter præference
- **Visual Assets**: Skærmbilleder og diagrammer for bedre forståelse
- **Help Integration**: Direkte adgang til Discord for fællesskabsstøtte

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Omstruktureret hele kurset til 8 progressive læringskapitler
  - Kapitel 1: Grundlag & Hurtigstart (⭐ - 30-45 min)
  - Kapitel 2: AI-først udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentificering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & Udrulning (⭐⭐⭐ - 1-1.5 timer)
  - Kapitel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Forudgående validering & planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1.5 timer)
  - Kapitel 8: Produktions- & Enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Comprehensive Navigation System**: Konsistente navigationsoverskrifter og footers på tværs af al dokumentation
- **🎯 Progress Tracking**: Kursusafslutnings-tjekliste og læringsverificeringssystem
- **🗺️ Learning Path Guidance**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Cross-Reference Navigation**: Relaterede kapitler og forudsætninger tydeligt linket

#### Enhanced
- **README Structure**: Omdannet til en struktureret læringsplatform med kapiteldelt organisering
- **Documentation Navigation**: Hver side indeholder nu kapitelkontekst og fremdriftsvejledning
- **Template Organization**: Eksempler og skabeloner kortlagt til passende læringskapitler
- **Resource Integration**: Cheatsheets, FAQ'er og studieguider knyttet til relevante kapitler
- **Workshop Integration**: Praktiske laboratorier kortlagt til flere kapitel-læringsmål

#### Changed
- **Learning Progression**: Flyttet fra lineær dokumentation til fleksibel kapiteldelt læring
- **Configuration Placement**: Flyttet konfigurationsvejledningen til Kapitel 3 for bedre læringsflow
- **AI Content Integration**: Bedre integration af AI-specifikt indhold gennem hele læringsrejsen
- **Production Content**: Avancerede mønstre samlet i Kapitel 8 for enterprise-lærende

#### Improved
- **User Experience**: Klare navigationsbrødkrummer og indikatorer for kapitelprogression
- **Accessibility**: Konsistente navigationsmønstre for lettere kursusgennemgang
- **Professional Presentation**: Universitetsagtig kursusstruktur egnet til akademisk og virksomhedstræning
- **Learning Efficiency**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Technical Implementation
- **Navigation Headers**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Footer Navigation**: Konsistent fremdriftsvejledning og indikatorer for kapitelafslutning
- **Cross-Linking**: Omfattende internt linksystem, der forbinder relaterede koncepter
- **Chapter Mapping**: Skabeloner og eksempler tydeligt forbundet med læringsmål

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Omstruktureret studieguide for at tilpasse sig 8-kapitelssystemet
- **🎯 Chapter-Based Assessment**: Hvert kapitel indeholder specifikke læringsmål og praktiske øvelser
- **📋 Progress Tracking**: Ugentlig læringsplan med målbare resultater og tjeklister
- **❓ Assessment Questions**: Spørgsmål til vidensvalidering for hvert kapitel med professionelle resultater
- **🛠️ Practical Exercises**: Praktiske aktiviteter med reelle udrulningsscenarier og fejlfinding
- **📊 Skill Progression**: Klar fremgang fra grundlæggende koncepter til enterprise-mønstre med fokus på karriereudvikling
- **🎓 Certification Framework**: Professionelle udviklingsresultater og fællesskabsanerkendelsessystem
- **⏱️ Timeline Management**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Erstattet "Cora agent" med "Customer agent" i hele detail-multi-agent-løsningen for klarere forståelse
- **Agent Architecture**: Opdateret al dokumentation, ARM templates og kodeeksempler til at bruge konsekvent "Customer agent"-navngivning
- **Configuration Examples**: Moderniserede agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Documentation Consistency**: Sikret at alle referencer bruger professionelle, beskrivende agentnavne

#### Enhanced
- **ARM Template Package**: Opdateret retail-multiagent-arm-template med Customer agent-referencer
- **Architecture Diagrams**: Opfriskede Mermaid-diagrammer med opdateret agentnavngivning
- **Code Examples**: Python-klasser og implementeringseksempler bruger nu CustomerAgent-navngivning
- **Environment Variables**: Opdateret alle udrulningsscripts til at bruge CUSTOMER_AGENT_NAME-konventioner

#### Improved
- **Developer Experience**: Klarere agentroller og ansvar i dokumentationen
- **Production Readiness**: Bedre tilpasning til enterprise-navngivningskonventioner
- **Learning Materials**: Mere intuitiv agentnavngivning til undervisningsformål
- **Template Usability**: Forenklet forståelse af agentfunktioner og udrulningsmønstre

#### Technical Details
- Opdaterede Mermaid-arkitekturdiagrammer med CustomerAgent-referencer
- Erstattede CoraAgent-klassenavne med CustomerAgent i Python-eksempler
- Ændrede ARM template JSON-konfigurationer til at bruge "customer"-agenttypen
- Opdaterede miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opdaterede alle udrulningskommandoer og containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Fuld omstrukturering med prioritet til AI-udviklere og ingeniører
- **Microsoft Foundry Integration Guide**: Omfattende dokumentation til at forbinde AZD med Microsoft Foundry-tjenester
- **AI Model Deployment Patterns**: Detaljeret vejledning om valg af modeller, konfiguration og strategier for produktionsudrulning
- **AI Workshop Lab**: 2-3 timers praktisk workshop til at konvertere AI-applikationer til AZD-udrulningsbare løsninger
- **Production AI Best Practices**: Enterprise-klarne mønstre til skalering, overvågning og sikring af AI-arbejdsmængder
- **AI-Specific Troubleshooting Guide**: Omfattende fejlfinding for Microsoft Foundry Models, Cognitive Services og AI-udrulningsproblemer
- **AI Template Gallery**: Fremhævet samling af Microsoft Foundry-skabeloner med kompleksitetsvurderinger
- **Workshop Materials**: Fuld workshopstruktur med praktiske laboratorier og reference-materialer

#### Enhanced
- **README Structure**: AI-udviklerfokuseret med 45% fællesskabsinteresse-data fra Microsoft Foundry Discord
- **Learning Paths**: Dedikeret AI-udviklerrejse side om side med traditionelle spor for studerende og DevOps-ingeniører
- **Template Recommendations**: Fremhævede AI-skabeloner inklusive azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord-fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specifikke autentificerings- og sikkerhedskonfigurationer
- **Cost Optimization**: Sporing af tokenforbrug og budgetkontroller for AI-arbejdsmængder
- **Multi-Region Deployment**: Strategier for global udrulning af AI-applikationer
- **Performance Monitoring**: AI-specifikke målepunkter og Application Insights-integration

#### Documentation Quality
- **Linear Course Structure**: Logisk progression fra begynder til avancerede AI-udrulningsmønstre
- **Validated URLs**: Alle eksterne repository-links verificerede og tilgængelige
- **Complete Reference**: Alle interne dokumentationslinks validerede og funktionelle
- **Production Ready**: Enterprise-udrulningsmønstre med virkelighedsnære eksempler

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Alle dokumentationssider inkluderer nu Introduktion, Læringsmål og Læringsudbytte-sektioner
- **Navigation System**: Tilføjede Forrige/Næste lektionslinks i hele dokumentationen for guidet læringsprogression
- **Study Guide**: Omfattende study-guide.md med læringsmål, øvelser og vurderingsmaterialer
- **Professional Presentation**: Fjernede alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Enhanced Content Structure**: Forbedret organisering og flow i læringsmaterialerne

#### Changed
- **Documentation Format**: Standardiseret al dokumentation med konsistent læringsfokuseret struktur
- **Navigation Flow**: Implementeret logisk progression gennem alle læringsmaterialer
- **Content Presentation**: Fjernede dekorative elementer til fordel for klar, professionel formatering
- **Link Structure**: Opdaterede alle interne links for at understøtte det nye navigationssystem

#### Improved
- **Accessibility**: Fjernede emoji-afhængigheder for bedre skærmlæserkompatibilitet
- **Professional Appearance**: Ren, akademisk stil velegnet til enterprise-læring
- **Learning Experience**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Content Organization**: Bedre logisk flow og forbindelse mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Komplet vejledningsserie til at komme i gang
  - Omfattende dokumentation om udrulning og provisioning
  - Detaljerede fejlsøgningsressourcer og debug-vejledninger
  - Værktøjer og procedurer til forudgående validering før udrulning

- **Getting Started Module**
  - AZD Basics: Kernekoncepter og terminologi
  - Installation Guide: Platformspecifikke opsætningsinstruktioner
  - Configuration Guide: Miljøopsætning og autentificering
  - First Project Tutorial: Trin-for-trin praksisbaseret læring

- **Deployment and Provisioning Module**
  - Deployment Guide: Fuld workflow-dokumentation
  - Provisioning Guide: Infrastruktur som kode med Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Validering af Azure-ressourcetilgængelighed
  - SKU Selection: Omfattende vejledning om servicelag
  - Pre-flight Checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Hyppigt forekommende problemer og løsninger
  - Debugging Guide: Systematiske fejlsøgningsmetodikker
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Hurtig reference til essentielle kommandoer
  - Glossary: Omfattende terminologi- og forkortelsesdefinitioner
  - FAQ: Detaljerede svar på almindelige spørgsmål
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installations- og konfigurationsvejledninger til Windows, macOS og Linux
- **Multiple Skill Levels**: Indhold designet til studerende og professionelle udviklere
- **Practical Focus**: Praktiske eksempler og virkelighedsnære scenarier
- **Comprehensive Coverage**: Fra grundlæggende koncepter til avancerede enterprise-mønstre
- **Security-First Approach**: Sikkerhedsbedste praksis integreret gennem hele
- **Cost Optimization**: Vejledning til omkostningseffektive udrulninger og ressourcestyring

#### Documentation Quality
- **Detailed Code Examples**: Praktiske, testede kodeeksempler
- **Step-by-Step Instructions**: Klar, handlingsorienteret vejledning
- **Comprehensive Error Handling**: Fejlfinding for almindelige problemer
- **Best Practices Integration**: Industrielle standarder og anbefalinger
- **Version Compatibility**: Opdateret med de nyeste Azure-tjenester og azd-funktioner

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Understøttelse af flere modeller**: Integrationsmønstre for Hugging Face, Azure Machine Learning og brugerdefinerede modeller
- **AI-agentrammer**: Skabeloner til LangChain, Semantic Kernel og AutoGen-udrulninger
- **Avancerede RAG-mønstre**: Vektor-databaseindstillinger ud over Azure AI Search (Pinecone, Weaviate osv.)
- **AI-observabilitet**: Forbedret overvågning af modelpræstation, tokenbrug og svarkvalitet

#### Udvikleroplevelse
- **VS Code-udvidelse**: Integreret AZD + Microsoft Foundry-udviklingsoplevelse
- **GitHub Copilot-integration**: AI-assisteret AZD-skabelongenerering
- **Interaktive vejledninger**: Praktiske kodningsøvelser med automatiseret validering for AI-scenarier
- **Videomateriale**: Supplerende videotutorials til visuelle lærende med fokus på AI-udrulninger

### Version 4.0.0 (Planlagt)
#### Virksomheds-AI-mønstre
- **Styringsramme**: AI-modelstyring, overholdelse og revisionsspor
- **Multi-tenant AI**: Mønstre til at betjene flere kunder med isolerede AI-tjenester
- **Edge AI-udrulning**: Integration med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud- og hybride udrulningsmønstre for AI-arbejdsbelastninger

#### Avancerede funktioner
- **AI-pipelineautomatisering**: MLOps-integration med Azure Machine Learning-pipelines
- **Avanceret sikkerhed**: Zero-trust-mønstre, private endepunkter og avanceret trusselsbeskyttelse
- **Ydelsesoptimering**: Avancerede tuning- og skaleringsstrategier til AI-applikationer med høj gennemstrømning
- **Global distribution**: Indholdslevering og edge-caching-mønstre for AI-applikationer

### Version 3.0.0 (Planlagt) - Erstattet af den nuværende udgivelse
#### Foreslåede tilføjelser - Nu implementeret i v3.0.0
- ✅ **AI-fokuseret indhold**: Omfattende Microsoft Foundry-integration (Fuldført)
- ✅ **Interaktive vejledninger**: Praktisk AI-workshop-laboratorium (Fuldført)
- ✅ **Avanceret sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Ydelsesoptimering**: AI-workload tuning-strategier (Fuldført)

### Version 2.1.0 (Planlagt) - Delvist implementeret i v3.0.0
#### Mindre forbedringer - Nogle gennemført i den nuværende udgivelse
- ✅ **Yderligere eksempler**: AI-fokuserede udrulningsscenarier (Fuldført)
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldført)
- **Værktøjsintegration**: Forbedrede vejledninger til IDE- og editorintegration
- ✅ **Udvidet overvågning**: AI-specifikke overvågnings- og alarmeringsmønstre (Fuldført)

#### Stadig planlagt til fremtidig udgivelse
- **Mobilvenlig dokumentation**: Responsivt design til mobil læring
- **Offlineadgang**: Downloadbare dokumentationspakker
- **Forbedret IDE-integration**: VS Code-udvidelse til AZD + AI-arbejdsgange
- **Community-dashboard**: Realtidsmålinger af fællesskabet og sporing af bidrag

## Bidrag til ændringsloggen

### Rapportering af ændringer
Når du bidrager til dette depot, skal du sikre, at ændringslog-indførslerne indeholder:

1. **Versionsnummer**: Følger semantisk versionering (major.minor.patch)
2. **Dato**: Udgivelses- eller opdateringsdato i formatet YYYY-MM-DD
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Klar beskrivelse**: Kort beskrivelse af, hvad der ændrede sig
5. **Konsekvensvurdering**: Hvordan ændringer påvirker eksisterende brugere

### Change Categories

#### Added
- Nye funktioner, dokumentationsafsnit eller kapaciteter
- Nye eksempler, skabeloner eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Changed
- Ændringer af eksisterende funktionalitet eller dokumentation
- Opdateringer for at forbedre tydelighed eller nøjagtighed
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
- Opdateringer til bedste praksis for sikkerhed
- Løsning af sikkerhedssårbarheder

### Retningslinjer for semantisk versionering

#### Hovedversion (X.0.0)
- Ændringer, der bryder kompatibilitet og kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisation
- Ændringer, der ændrer den grundlæggende tilgang eller metodologi

#### Mindreversion (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer, der bevarer bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch-version (X.Y.Z)
- Rettelser af fejl og korrektioner
- Mindre forbedringer af eksisterende indhold
- Afklaringer og små forbedringer

## Fællesskabsfeedback og forslag

Vi opfordrer aktivt til feedback fra fællesskabet for at forbedre denne læringsressource:

### Hvordan man giver feedback
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-specifikke problemer er velkomne)
- **Discord Discussions**: Del ideer og engagér dig med Microsoft Foundry-fællesskabet
- **Pull Requests**: Bidrag med direkte forbedringer af indhold, især AI-skabeloner og vejledninger
- **Microsoft Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI-diskussioner
- **Community Forums**: Deltag i bredere Azure-udviklerdiskussioner

### Feedbackkategorier
- **AI-indholdets nøjagtighed**: Rettelser af AI-tjenesteintegration og udrulningsoplysninger
- **Læringsoplevelse**: Forslag til forbedret læringsflow for AI-udviklere
- **Manglende AI-indhold**: Anmodninger om yderligere AI-skabeloner, mønstre eller eksempler
- **Tilgængelighed**: Forbedringer for forskelligartede læringsbehov
- **AI-værktøjsintegration**: Forslag til bedre integration af AI-udviklingsarbejdsgange
- **Produktions-AI-mønstre**: Forespørgsler om virksomhedsmønstre for AI-udrulning

### Reaktionsforpligtelse
- **Svar på issues**: Inden for 48 timer for rapporterede problemer
- **Forespørgsler om funktioner**: Evaluering inden for en uge
- **Fællesskabsbidrag**: Gennemgang inden for en uge
- **Sikkerhedsproblemer**: Øjeblikkelig prioritet med hurtig respons

## Vedligeholdelsesplan

### Regelmæssige opdateringer
- **Månedlige gennemgange**: Indholdsnøjagtighed og validering af links
- **Kvartalsvise opdateringer**: Større indholdsudvidelser og forbedringer
- **Halvårlige gennemgange**: Omfattende omstrukturering og forbedringer
- **Årlige udgivelser**: Hovedversionsopdateringer med betydelige forbedringer

### Overvågning og kvalitetssikring
- **Automatiseret test**: Regelmæssig validering af kodeeksempler og links
- **Integration af fællesskabsfeedback**: Regelmæssig indarbejdelse af brugernes forslag
- **Teknologiske opdateringer**: Tilpasning til de nyeste Azure-tjenester og azd-udgivelser
- **Tilgængelighedsaudits**: Regelmæssig gennemgang af principper for inklusivt design

## Politik for versionsunderstøttelse

### Support for nuværende version
- **Seneste hovedversion**: Fuld support med regelmæssige opdateringer
- **Forrige hovedversion**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder
- **Ældre versioner**: Kun fællesskabsstøtte, ingen officielle opdateringer

### Vejledning til migration
Når hovedversioner udgives, leverer vi:
- **Migreringsvejledninger**: Trin-for-trin overgangsinstruktioner
- **Kompatibilitetsnoter**: Detaljer om kompatibilitetsbrud
- **Værktøjsunderstøttelse**: Scripts eller hjælpeprogrammer til at assistere med migration
- **Fællesskabsstøtte**: Dedikerede fora til migrationsspørgsmål

---

**Navigation**
- **Forrige lektion**: [Studieguide](resources/study-guide.md)
- **Næste lektion**: Tilbage til [Hoved-README](README.md)

**Hold dig opdateret**: Følg dette repository for meddelelser om nye udgivelser og vigtige opdateringer af læringsmaterialerne.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets modersmål bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->