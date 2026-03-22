# Ändringslogg - AZD For Beginners

## Introduktion

Denna ändringslogg dokumenterar alla betydande ändringar, uppdateringar och förbättringar i AZD For Beginners-repositoriet. Vi följer principer för semantisk versionering och underhåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och innehållstillägg
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av lärmaterialet över tid

## Inlärningsresultat

Efter att ha granskat changelog-poster kommer du att kunna:
- Identifiera nytt innehåll och resurser som finns tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din inlärningsväg baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.18.0] - 2026-03-16

#### AZD AI CLI-kommandon, innehållsvalidering och mallutvidgning
**Denna version lägger till `azd ai`, `azd extension` och `azd mcp` kommandoomfång i alla AI-relaterade kapitel, åtgärdar brutna länkar och föråldrad kod i agents.md, uppdaterar snabbreferensen och renoverar avsnittet Exempelmallar med validerade beskrivningar och nya Azure AI AZD-mallar.**

#### Tillagt
- **🤖 Täckning för AZD AI CLI** i 7 filer (tidigare endast i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny sektion "Tillägg och AI-kommandon" som introducerar `azd extension`, `azd ai agent init` och `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med jämförelsetabell (mall vs manifest-ansats)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underrubrikerna "AZD-tillägg för Foundry" och "Agent-först-distribution"
  - `docs/chapter-05-multi-agent/README.md` — Snabbstart visar nu både mall- och manifestbaserade distributionsvägar
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distribueringsavsnittet inkluderar nu alternativet `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underrubrik "AZD AI-tilläggskommandon för diagnostik"
  - `resources/cheat-sheet.md` — Ny sektion "AI- och tilläggskommandon" med `azd extension`, `azd ai agent init`, `azd mcp` och `azd infra generate`
- **📦 Nya AZD AI-exempelmallar** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chatt med Blazor WebAssembly, Semantic Kernel och stöd för röstchatt
  - **azure-search-openai-demo-java** — Java RAG-chatt som använder Langchain4J med ACA/AKS-distributionsalternativ
  - **contoso-creative-writer** — Multi-agent kreativ skrivapplikation som använder Azure AI Agent Service, Bing Grounding och Prompty
  - **serverless-chat-langchainjs** — Serverless RAG som använder Azure Functions + LangChain.js + Cosmos DB med lokalt utvecklingsstöd för Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med adminportal, Teams-integration och PostgreSQL/Cosmos DB-alternativ
  - **azure-ai-travel-agents** — Multi-agent MCP-orkestreringsreferensapp med servrar i .NET, Python, Java och TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep-startmall
  - **🔗 Länk till Awesome AZD AI-galleri** — Referens till [awesome-azd AI-galleri](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallar)

#### Åtgärdat
- **🔗 agents.md-navigering**: Föregående/Nästa-länkar matchar nu Kapitel 2 README-lektionsordning (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md brutna länkar**: `production-ai-practices.md` korrigerades till `../chapter-08-production/production-ai-practices.md` (3 förekomster)
- **📦 agents.md föråldrad kod**: Ersatte `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ogiltigt API**: Flyttade `max_tokens` från `create_agent()` till `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenräkning**: Ersatte grov uppskattning `len//4` med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Korrigerade tjänster från "Cognitive Search + App Service" till "Azure AI Search + Azure Container Apps" (standardvärd ändrades okt 2024)
- **contoso-chat**: Uppdaterad beskrivning för att referera till Azure AI Foundry + Prompty, vilket matchar repots faktiska titel och teknikstack

#### Borttaget
- **ai-document-processing**: Tog bort icke-fungerande mallreferens (repo inte offentligt tillgängligt som en AZD-mall)

#### Förbättrat
- **📝 agents.md övningar**: Övning 1 visar nu förväntad utdata och `azd monitor`-steg; Övning 2 inkluderar full registreringskod för `FunctionTool`; Övning 3 ersätter vag vägledning med konkreta `prepdocs.py`-kommandon
- **📚 agents.md resurser**: Uppdaterade dokumentationslänkar till aktuella Azure AI Agent Service-dokument och snabbstart
- **📋 agents.md Nästa steg-tabell**: Lade till AI Workshop Lab-länk för komplett kapiteltäckning

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
**Denna version förbättrar README.md kapitelnavigeringen med ett förbättrat tabellformat.**

#### Ändrat
- **Kurskarta-tabell**: Förbättrad med direkta lektionslänkar, tidsuppskattningar och komplexitetsbetyg
- **Mappstädning**: Tog bort redundanta gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Länkvalidering**: Alla 21+ interna länkar i Kurskarta-tabellen verifierade

### [v3.16.0] - 2026-02-05

#### Uppdateringar av produktnamn
**Denna version uppdaterar produktreferenser till aktuell Microsoft-varumärkning.**

#### Ändrat
- **Microsoft Foundry → Microsoft Foundry**: Alla referenser uppdaterade i icke-översättningsfiler
- **Azure AI Agent Service → Foundry Agents**: Tjänstens namn uppdaterat för att återspegla aktuell varumärkesprofil

#### Uppdaterade filer
- `README.md` - Huvudsaklig kurslandningssida
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-agenter guide
- `examples/README.md` - Exempeldokumentation
- `workshop/README.md` - Workshoplandningssida
- `workshop/docs/index.md` - Workshopindex
- `workshop/docs/instructions/*.md` - Alla workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Större omstrukturering av repot: Kapitelbaserade mappnamn
**Denna version omstrukturerar dokumentationen till dedikerade kapitelmappar för tydligare navigering.**

#### Mappnamnsändringar
Gamla mappar har ersatts med kapitelnumrerade mappar:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Filmigrationer
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
  - Lärandemål och tidsåtgång
  - Lektionenstabell med beskrivningar
  - Snabbstartskommandon
  - Navigation till andra kapitel

#### Ändrat
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i hela dokumentationen
- **🗺️ Huvud-README.md**: Uppdaterade Kurskarta med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Borttaget
- Gammal mappstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositorieomstrukturering: Kapitelnavigering
**Denna version lade till kapitelnavigerings-README-filer (överskuggad av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide för AI-agenter
**Denna version lägger till en omfattande guide för att distribuera AI-agenter med Azure Developer CLI.**

#### Tillagt
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chatbots
  - Tre snabbstartsmallar för agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmönster (enkel agent, RAG, multi-agent)
  - Konfiguration och anpassning av verktyg
  - Övervakning och metricsspårning
  - Kostnadsöverväganden och optimering
  - Vanliga felsökningsscenarier
  - Tre praktiska övningar med framgångskriterier

#### Innehållsstruktur
- **Introduktion**: Agentkoncept för nybörjare
- **Snabbstart**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmönster**: Visuella diagram av agentmönster
- **Konfiguration**: Verktygsuppsättning och miljövariabler
- **Övervakning**: Integration med Application Insights
- **Övningar**: Progressiva praktiska läraktiviteter (20–45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### Uppdatering av DevContainer-miljö
**Denna version uppdaterar utvecklingscontainerkonfigurationen med moderna verktyg och bättre standardinställningar för AZD-inlärningsupplevelsen.**

#### Ändrat
- **🐳 Basbild**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (senaste Debian stable)
- **📛 Container-namn**: Omdöpt från "Python 3" till "AZD for Beginners" för tydlighet

#### Tillagt
- **🔧 Nya Dev Container-funktioner**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för distributioner av container-appar

- **🔌 Portvidarebefordran**: Förkonfigurerade portar för vanlig utveckling:
  - 8000 (MkDocs-förhandsvisning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code-tillägg**:
  - `ms-python.vscode-pylance` - Förbättrad Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Stöd för Azure Functions
  - `ms-azuretools.vscode-docker` - Stöd för Docker
  - `ms-azuretools.vscode-bicep` - Stöd för Bicep-språket
  - `ms-azure-devtools.azure-resource-groups` - Azure-resurshantering
  - `yzhang.markdown-all-in-one` - Redigering av Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown-lintning
  - `bierner.markdown-mermaid` - Stöd för Mermaid-diagram
  - `redhat.vscode-yaml` - Stöd för YAML (för azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-inställningar**: Lade till standardinställningar för Python-tolk, formatering vid sparande och trimning av blanksteg

- **📦 Uppdaterad requirements-dev.txt**:
  - Lade till MkDocs minify-plugin
  - Lade till pre-commit för kodkvalitet
  - Lade till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create-kommando**: Verifierar nu AZD och Azure CLI-installation vid containerstart

---

### [v3.11.0] - 2026-02-05

#### README-översyn för nybörjare
**Denna version förbättrar README.md avsevärt för att vara mer tillgänglig för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Added
- **🆚 Azure CLI vs AZD-jämförelse**: Tydlig förklaring av när man ska använda varje verktyg med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direkta länkar till communityns mallgalleri och resurser för bidrag:
  - [Fantastiskt AZD-galleri](https://azure.github.io/awesome-azd/) - 200+ färdiga mallar för distribution
  - [Skicka in en mall](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Snabbstartsguide**: Förenklad 3-stegs introduktion (Installera → Logga in → Distribuera)
- **📊 Erfarenhetsbaserad navigeringstabell**: Tydlig vägledning om var man ska börja baserat på utvecklarens erfarenhet

#### Changed
- **README-struktur**: Omdisponerad för progressiv avslöjning - viktig information först
- **Introduktionsavsnitt**: Omskrivet för att förklara "The Magic of `azd up`" för helt nya användare
- **Borttaget duplicerat innehåll**: Tog bort dubbla felsökningsavsnittet
- **Felsökningskommandon**: Fixade referensen `azd logs` till att använda giltiga `azd monitor --logs`

#### Fixed
- **🔐 Autentiseringskommandon**: Lade till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga kommando-referenser**: Tog bort kvarvarande `azd logs` från README:s felsökningsavsnitt

#### Notes
- **Omfattning**: Ändringar tillämpade på huvud-README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringar riktade särskilt till utvecklare som är nya till AZD

---

### [v3.10.0] - 2026-02-05

#### Uppdatering av Azure Developer CLI-kommandonas noggrannhet
**Denna version korrigerar icke-existerande AZD-kommandon i dokumentationen och säkerställer att alla kodexempel använder giltig Azure Developer CLI-syntax.**

#### Fixed
- **🔧 Ogiltiga AZD-kommandon borttagna**: Omfattande granskning och korrigering av ogiltiga kommandon:
  - `azd logs` (finns inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` underkommandon (finns inte) → ersatta med `azd show` och Azure CLI
  - `azd infra import/export/validate` (finns inte) → borttaget eller ersatt med giltiga alternativ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flaggor (finns inte) → borttagna
  - `azd provision --what-if/--rollback` flaggor (finns inte) → uppdaterade för att använda `--preview`
  - `azd config validate` (finns inte) → ersatt med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finns inte) → borttagna

- **📚 Filer uppdaterade med kommando-korrigeringar**:
  - `resources/cheat-sheet.md`: Stor översyn av kommando-referens
  - `docs/deployment/deployment-guide.md`: Fixade rollback- och distributionsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerade avsnitt om logganalys
  - `docs/troubleshooting/common-issues.md`: Uppdaterade felsökningskommandon
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixade AZD-debuggingavsnittet
  - `docs/getting-started/azd-basics.md`: Korrigerade övervakningskommandon
  - `docs/getting-started/first-project.md`: Uppdaterade övervaknings- och felsökningsexempel
  - `docs/getting-started/installation.md`: Fixade hjälp- och versionsexempel
  - `docs/pre-deployment/application-insights.md`: Korrigerade kommandon för visning av loggar
  - `docs/pre-deployment/coordination-patterns.md`: Fixade agent-debuggingkommandon

- **📝 Versionsreferens uppdaterad**: 
  - `docs/getting-started/installation.md`: Ändrade hårdkodad version `1.5.0` till generisk `1.x.x` med länk till releaser

#### Changed
- **Rollback-strategier**: Uppdaterad dokumentation för att använda Git-baserad rollback (AZD har ingen inbyggd rollback)
- **Loggvisning**: Ersatte `azd logs`-referenser med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektion**: Tog bort icke-existerande parallella/incrementella distributionsflaggor och gav giltiga alternativ

#### Technical Details
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verifiering**: Kommandon validerade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshopens slutförande och uppdatering av dokumentationskvalitet
**Denna version slutför de interaktiva workshopmodulerna, åtgärdar brutna dokumentationslänkar och förbättrar det övergripande innehållet för AI-utvecklare som använder Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: Nytt dokument med riktlinjer för bidrag som innehåller:
  - Tydliga instruktioner för att rapportera problem och föreslå ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och konventioner för commit-meddelanden
  - Information om community-engagemang

#### Completed
- **🎯 Workshopmodul 7 (Avslutning)**: Fullt slutförd avslutningsmodul med:
  - Omfattande sammanfattning av workshopens resultat
  - Avsnitt över nyckelbegrepp som täcker AZD, mallar och Microsoft Foundry
  - Rekommendationer för fortsatt inlärningsresa
  - Workshop-övningar med svårighetsgrader
  - Länkar för community-feedback och support

- **📚 Workshopmodul 3 (Deconstruct)**: Uppdaterade lärandemål med:
  - Vägledning för aktivering av GitHub Copilot med MCP-servrar
  - Förståelse för AZD-mallars mappstruktur
  - Organisationsmönster för Infrastructure-as-Code (Bicep)
  - Hands-on-labinstruktioner

- **🔧 Workshopmodul 6 (Teardown)**: Slutförd med:
  - Mål för resursrengöring och kostnadshantering
  - `azd down` användning för säker nedmontering av infrastruktur
  - Vägledning för återställning av mjukborttagna kognitiva tjänster
  - Bonusutforskningstips för GitHub Copilot och Azure Portal

#### Fixed
- **🔗 Länkfel åtgärdade**: Löste 15+ brutna interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerade ai-model-deployment.md och production-ai-practices.md-sökvägar
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fixade FAQ- och felsökningsguide-sökvägar
  - `examples/container-app/microservices/README.md`: Korrigerade kurshemmets och distributionsguidens sökvägar
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade AI-avsnittsreferenser
  - `course-outline.md`: Fixade instructor guide- och AI-workshop-labbsökvägar

- **📅 Workshop-statusbanderoll**: Uppdaterad från "Under Construction" till aktiv workshopstatus med februari 2026-datum

- **🔗 Workshopnavigation**: Fixade brutna navigeringslänkar i workshop README.md som pekade på icke-existerande lab-1-azd-basics-mapp

#### Changed
- **Workshoppresentation**: Tog bort varning om "under uppbyggnad", workshopen är nu komplett och redo att användas
- **Navigeringskonsistens**: Säkerställde att alla workshopmoduler har korrekt inter-modulnavigation
- **Referenser för lärväg**: Uppdaterade kapitelskorsreferenser för att använda korrekta microsoft-foundry-sökvägar

#### Validated
- ✅ Alla engelska markdown-filer har giltiga interna länkar
- ✅ Workshopmoduler 0-7 är kompletta med lärandemål
- ✅ Navigation mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehålles genomgående
- ✅ CONTRIBUTING.md ger tydlig vägledning för community-bidragsgivare

#### Technical Implementation
- **Länkvalidering**: Automatiskt PowerShell-skript verifierade alla .md interna länkar
- **Innehållsgranskning**: Manuellt granskning av workshopens fullständighet och nybörjarvänlighet
- **Navigationssystem**: Konsekventa kapitel- och modulnavigationsmönster tillämpade

#### Notes
- **Omfattning**: Ändringar tillämpade endast på engelsk dokumentation
- **Översättningar**: Översättningsmappar uppdaterades inte i denna version (automatisk översättning kommer att synkroniseras senare)
- **Workshopens längd**: Komplett workshop erbjuder nu 3–4 timmars praktisk inlärning

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, säkerhet och multi-agentmönster
**Denna version lägger till omfattande A-nivålektioner om Application Insights-integrering, autentiseringsmönster och multi-agentkoordination för produktionsdistributioner.**

#### Added
- **📊 Lektion om Application Insights-integration**: i `docs/pre-deployment/application-insights.md`:
  - AZD-inriktad distribution med automatisk provisionering
  - Fullständiga Bicep-mallar för Application Insights + Log Analytics
  - Fungerande Python-applikationer med anpassad telemetri (1,200+ rader)
  - AI/LLM-övervakningsmönster (Microsoft Foundry-modellers token-/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriflöde)
  - 3 praktiska övningar (larm, dashboards, AI-övervakning)
  - Kusto-frågeexempel och kostnadsoptimeringsstrategier
  - Live-metrikströmning och realtidsfelsökning
  - 40–50 minuters inlärningstid med produktionsklara mönster

- **🔐 Lektion om autentiserings- och säkerhetsmönster**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (connection strings, Key Vault, managed identity)
  - Fullständiga Bicep-infrastrukturmallar för säkra distributioner
  - Node.js-applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera managed identity, user-assigned identity, Key Vault-rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara lösenordslösa autentiseringsmönster

- **🤖 Lektion om multi-agentkoordineringsmönster**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmönster (sekventiell, parallell, hierarkisk, händelsestyrd, konsensus)
  - Fullständig orchestrator-tjänsteimplementation (Python/Flask, 1,500+ rader)
  - 3 specialiserade agentimplementationer (Forsknings-, Författar- och Redigeringsagenter)
  - Service Bus-integration för meddelandeköning
  - Cosmos DB-tillståndshantering för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logik, kretsbrytare)
  - Kostnadsuppdelning ($240-565/month) med optimeringsstrategier
  - Application Insights-integrering för övervakning

#### Enhanced
- **Pre-deployment-kapitlet**: Inkluderar nu omfattande övervaknings- och koordineringsmönster
- **Getting Started-kapitlet**: Förbättrat med professionella autentiseringsmönster
- **Produktionsberedskap**: Fullständig täckning från säkerhet till observerbarhet
- **Kursöversikt**: Uppdaterad för att referera nya lektioner i Kapitel 3 och 6

#### Changed
- **Lärandeprogression**: Bättre integrering av säkerhet och övervakning genom kursen
- **Dokumentationskvalitet**: Konsekventa A-nivåstandarder (95–97%) över nya lektioner
- **Produktionsmönster**: Fullständig end-to-end-täckning för företagsdistributioner

#### Improved
- **Developer Experience**: Klar väg från utveckling till produktion och övervakning
- **Security Standards**: Professionella mönster för autentisering och hantering av hemligheter
- **Observability**: Fullständig Application Insights-integration med AZD
- **AI Workloads**: Specialiserad övervakning för Microsoft Foundry Models och multi-agent-system

#### Validerat
- ✅ Alla lektioner innehåller komplett fungerande kod (inte utdrag)
- ✅ Mermaid-diagram för visuellt lärande (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsfärdiga Bicep-mallar som kan driftsättas via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Dokumentationsgraderingsresultat
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agent-arkitekturer
- **Overall New Content**: - Konsekventa högkvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Authentication**: Managed Identity + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Monitoring**: Live-metriker + Kusto-frågor + aviseringar + dashboards
- **Cost Management**: Samplingstrategier, behållningspolicyer, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättringar av dokumentationskvalitet och nytt exempel på Microsoft Foundry Models
**Denna version förbättrar dokumentationskvaliteten i hela repositoriet och lägger till ett komplett distributions-exempel för Microsoft Foundry Models med gpt-4.1 chattgränssnitt.**

#### Lagt till
- **🤖 Microsoft Foundry Models Chat Example**: Komplett gpt-4.1-distribution med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 modellutplacering)
  - Python kommandorads-chattgränssnitt med konversationshistorik
  - Key Vault-integration för säker lagring av API-nyckel
  - Spårning av tokenanvändning och kostnadsuppskattning
  - Hastighetsbegränsning och felhantering
  - Omfattande README med 35–45 minuters driftsättningsguide
  - 11 produktionsfärdiga filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lade till praktiska övningar i konfigurationsguiden:
  - Övning 1: Multi-miljökonfiguration (15 minuter)
  - Övning 2: Övning i hemlighetshantering (10 minuter)
  - Tydliga framgångskriterier och verifieringssteg
- **✅ Distribueringsverifiering**: Lagt till verifieringssektion i distributionsguiden:
  - Hälsokontrollprocedurer
  - Checklista för framgångskriterier
  - Förväntade utdata för alla driftsättningskommandon
  - Snabbreferens för felsökning

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-nivå (93%):
  - Lagt till azure-openai-chat i alla relevanta avsnitt
  - Uppdaterat antal lokala exempel från 3 till 4
  - Lagt till i tabellen för AI-applikationsexempel
  - Integrerat i Quick Start för mellannivåanvändare
  - Lagt till i avsnittet Microsoft Foundry Templates
  - Uppdaterade jämförelsematrisen och teknikrelaterade avsnitt
- **Dokumentationskvalitet**: Förbättrad B+ (87%) → A- (92%) över docs-mappen:
  - La till förväntade utdata till kritiska kommandoexempel
  - Inkluderade verifieringssteg för konfigurationsändringar
  - Förbättrat praktiskt lärande med praktiska övningar

#### Ändrat
- **Learning Progression**: Bättre integration av AI-exempel för mellannivålärande
- **Documentation Structure**: Mer handlingsbara övningar med tydliga resultat
- **Verification Process**: Tydliga framgångskriterier lades till i viktiga arbetsflöden

#### Förbättrat
- **Developer Experience**: Distribution av Microsoft Foundry Models tar nu 35–45 minuter (jämfört med 60–90 för mer komplexa alternativ)
- **Cost Transparency**: Tydliga kostnadsuppskattningar ($50-200/month) för Microsoft Foundry Models-exemplet
- **Learning Path**: AI-utvecklare har en tydlig ingång med azure-openai-chat
- **Documentation Standards**: Konsekventa förväntade utdata och verifieringssteg

#### Validerat
- ✅ Microsoft Foundry Models-exempel fullt funktionellt med `azd up`
- ✅ Alla 11 implementationsfiler syntaktiskt korrekta
- ✅ README-instruktioner matchar den faktiska driftsättningsupplevelsen
- ✅ Dokumentationslänkar uppdaterade på 8+ platser
- ✅ Exempelindex återspeglar korrekt 4 lokala exempel
- ✅ Inga duplicerade externa länkar i tabeller
- ✅ Alla navigationsreferenser korrekta

#### Teknisk implementering
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps-mönster
- **Security**: Förberett för Managed Identity, hemligheter i Key Vault
- **Monitoring**: Application Insights-integrering
- **Cost Management**: Tokenspårning och användningsoptimering
- **Deployment**: Enkelt `azd up`-kommando för komplett uppsättning

### [v3.6.0] - 2025-11-19

#### Större uppdatering: Exempel på distribution av Container Apps
**Denna version introducerar omfattande, produktionsfärdiga exempel på distribution av containerapplikationer med Azure Developer CLI (AZD), med full dokumentation och integration i lärandespåret.**

#### Lagt till
- **🚀 Container App Examples**: Nya lokala exempel i `examples/container-app/`:
  - [Huvudguide](examples/container-app/README.md): Komplett översikt av containeriserade distributioner, snabbstart, produktion och avancerade mönster
  - [Enkel Flask-API](../../examples/container-app/simple-flask-api): Nybörjarvänligt REST-API med scale-to-zero, health probes, övervakning och felsökning
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices): Produktionsklart multiservice-distributionsscenario (API Gateway, Product, Order, User, Notification), asynkron meddelandehantering, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blue-green/canary-distribution
- **Bästa praxis**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-riktlinjer för containeriserade arbetsbelastningar
- **Kodexempel**: Komplett `azure.yaml`, Bicep-mallar och flerspråkiga serviceimplementationer (Python, Node.js, C#, Go)
- **Testning & Felsökning**: End-to-end-testscenarier, övervakningskommandon, felsökningsvägledning

#### Ändrat
- **README.md**: Uppdaterad för att presentera och länka nya container-apps-exempel under "Local Examples - Container Applications"
- **examples/README.md**: Uppdaterad för att lyfta fram container-app-exempel, lägga till poster i jämförelsematrisen och uppdatera teknik-/arkitekturreferenser
- **Course Outline & Study Guide**: Uppdaterad för att hänvisa till nya container-app-exempel och distributionsmönster i relevanta kapitel

#### Validerat
- ✅ Alla nya exempel kan driftsättas med `azd up` och följer bästa praxis
- ✅ Dokumentationskorslänkar och navigering uppdaterade
- ✅ Exemplen täcker nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Anteckningar
- **Scope**: Endast engelsk dokumentation och exempel
- **Next Steps**: Expandera med ytterligare avancerade container-mönster och CI/CD-automation i framtida releaser

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denna version genomför en omfattande namnändring av produkten från "Microsoft Foundry" till "Microsoft Foundry" i hela den engelska dokumentationen, vilket återspeglar Microsofts officiella omprofilering.**

#### Ändrat
- **🔄 Produktnamnsuppdatering**: Fullständig omprofilering från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i den engelska dokumentationen i `docs/`-mappen
  - Mapp omdöpt: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fil omdöpt: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade i 7 dokumentationsfiler

- **📁 Ändringar i mappstruktur**:
  - `docs/ai-foundry/` omdöpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att återspegla den nya mappstrukturen
  - Navigationslänkar validerade i hela dokumentationen

- **📄 Filnamnsändringar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera till det nya filnamnet

#### Uppdaterade filer
- **Kapitelldokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslänkar uppdaterade
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Redan använder Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitelnavigeringslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa kapitel-länkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigering, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigeringslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigeringslänk uppdaterad

- **Filer för kursstruktur** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapiteltitlar, mallavsnitt, communityinsikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitelresurser)

#### Validerat
- ✅ Inga kvarvarande "ai-foundry"-mappreferenser i engelska docs
- ✅ Inga kvarvarande "Microsoft Foundry" produktnamnsreferenser i engelska docs
- ✅ Alla navigationslänkar fungerar med den nya mappstrukturen
- ✅ Fil- och mappnamnändringar slutförda
- ✅ Korsreferenser mellan kapitel validerade

#### Anteckningar
- **Scope**: Ändringar tillämpade endast på engelsk dokumentation i `docs/`-mappen
- **Translations**: Översättningsmappar (`translations/`) inte uppdaterade i denna version
- **Workshop**: Workshopen (`workshop/`) inte uppdaterad i denna version
- **Examples**: Exempelfiler kan fortfarande referera till äldre namngivning (kommer att åtgärdas i framtida uppdatering)
- **External Links**: Externa URL:er och GitHub-referenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala brancher eller dokumentation som refererar till den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Byt ut produktnamnet: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifiera att alla interna dokumentationslänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förhandsgranskning av infrastruktur och valideringsförbättringar
**Denna version introducerar omfattande stöd för den nya förhandsgranskningsfunktionen i Azure Developer CLI och förbättrar workshop-användarupplevelsen.**

#### Lagt till
- **🧪 azd provision --preview funktionsdokumentation**: Omfattande beskrivning av den nya förhandsgranskningsmöjligheten för infrastruktur
  - Kommandoreferens och användningsexempel i fusklapp
  - Detaljerad integration i provisioning-guiden med användningsfall och fördelar
  - Förhandskontroll-integration för säkrare driftsättningsvalidering
  - Uppdateringar i introduktionsguiden med säkerhetsförst-driftsättningsrutiner
- **🚧 Workshopstatusbanderoll**: Professionell HTML-banner som indikerar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Senast uppdaterad-tidsstämpel för transparens
  - Mobilresponsiv design för alla enhetstyper

#### Förbättrat
- **Infrastrukturssäkerhet**: Förhandsgranskningsfunktionalitet integrerad i hela driftsättningsdokumentationen
- **Förhandsvalidering före driftsättning**: Automatiserade skript inkluderar nu infrastrukturförhandsgransknings-testning
- **Utvecklararbetsflöde**: Uppdaterade kommandosekvenser för att inkludera preview som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar för användare angående innehållets utvecklingsstatus

#### Ändrat
- **Driftsättningspraxis**: Preview-first-arbetsflöde nu rekommenderad metod
- **Dokumentationsflöde**: Infrastruktursvalidering flyttad tidigare i inlärningsprocessen
- **Workshoppresentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättrat
- **Säkerhets-först-ansats**: Infrastruktursändringar kan nu valideras innan driftsättning
- **Team-samarbete**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader innan provisioning
- **Riskminimering**: Minskade driftsättningsfel genom avancerad validering

#### Teknisk implementering
- **Flerdokumentintegration**: Preview-funktionen dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel i hela dokumentationen
- **Bästa praxis-integration**: Preview inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydlig NY funktion-markering för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientstil
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Upprätthåller repositoryns trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Senast uppdaterad i oktober 2025 för ansvarsskyldighet

### [v3.3.0] - 2025-09-24

#### Förbättrat workshopmaterial och interaktiv lärandeupplevelse
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärandespår.**

#### Lagt till
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs-förhandsgranskningsfunktion
- **📝 Strukturerade workshopinstruktioner**: 7-stegs vägledd inlärningsväg från upptäckt till anpassning
  - 0-Introduction: Översikt över workshopen och uppsättning
  - 1-Select-AI-Template: Mallupptäckt och urvalsprocess
  - 2-Validate-AI-Template: Driftsättnings- och valideringsprocedurer
  - 3-Deconstruct-AI-Template: Förståelse av mallens arkitektur
  - 4-Configure-AI-Template: Konfiguration och anpassning
  - 5-Customize-AI-Template: Avancerade modifieringar och iterationer
  - 6-Teardown-Infrastructure: Rensning och resursförvaltning
  - 7-Wrap-up: Sammanfattning och nästa steg
- **🛠️ Workshop Tooling**: MkDocs-konfiguration med Material-tema för förbättrad inlärningsupplevelse
- **🎯 Praktisk inlärningsväg**: 3-stegs metodik (Upptäckt → Driftsättning → Anpassning)
- **📱 GitHub Codespaces Integration**: Sömlös uppsättning av utvecklingsmiljö

#### Förbättrad
- **AI Workshop Lab**: Utökad med en omfattande strukturerad inlärningsupplevelse på 2–3 timmar
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Inlärningsprogression**: Tydlig steg-för-steg vägledning från mallval till produktsättning
- **Utvecklarupplevelse**: Integrerade verktyg för effektivare utvecklingsarbetsflöden

#### Förbättrad
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sök, kopieringsfunktion och temaväxling
- **Självstyrd inlärning**: Flexibel workshopstruktur som rymmer olika inlärningstakter
- **Praktisk tillämpning**: Verkliga scenarier för driftsättning av AI-mallar
- **Communityintegration**: Discord-integration för workshopstöd och samarbete

#### Workshopfunktioner
- **Inbyggd sökning**: Snabb sökning efter nyckelord och lektioner
- **Kopiera kodblock**: Hover-to-copy-funktionalitet för alla kodexempel
- **Temaväxling**: Stöd för mörkt/ljust läge efter preferens
- **Visuella tillgångar**: Skärmdumpar och diagram för bättre förståelse
- **Hjälpintegration**: Direkt tillgång till Discord för communitystöd

### [v3.2.0] - 2025-09-17

#### Större omstrukturering av navigeringen och kapitelbaserat inlärningssystem
**Denna version introducerar en omfattande kapitelbaserad inlärningsstruktur med förbättrad navigering i hela arkivet.**

#### Lagt till
- **📚 Kapitelbaserat inlärningssystem**: Omstrukturerade hela kursen till 8 progressiva inlärningskapitel
  - Kapitel 1: Grundläggande & Kom igång (⭐ - 30-45 min)
  - Kapitel 2: AI-First-utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastructure as Code & Driftsättning (⭐⭐⭐ - 1-1.5 timmar)
  - Kapitel 5: Multi-agent AI-lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Validering & planering före driftsättning (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & debugga (⭐⭐ - 1-1.5 timmar)
  - Kapitel 8: Produktions- & företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigationssystem**: Konsekventa navigeringshuvuden och sidfötter över all dokumentation
- **🎯 Framstegsspårning**: Avcheckningslista för kursavslut och system för verifiering av inlärning
- **🗺️ Vägledning för inlärningsväg**: Tydliga startpunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskapskrav tydligt länkade

#### Förbättrad
- **README-struktur**: Omvandlad till en strukturerad inlärningsplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelkontext och vägledning för progression
- **Mallorganisation**: Exempel och mallar kopplade till lämpliga inlärningskapitel
- **Resursintegration**: Fusklistor, FAQ och studieguides länkade till relevanta kapitel
- **Workshopintegration**: Praktiska labb kopplade till flera kapitelmål

#### Ändrat
- **Inlärningsprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Ompositionerad konfigurationsguide som Kapitel 3 för bättre lärflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela inlärningsresan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättrad
- **Användarupplevelse**: Tydliga navigationsbrödsmulor och indikatorer för kapitelprogression
- **Tillgänglighet**: Konsekventa navigeringsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Inlärningseffektivitet**: Kortare tid att hitta relevant innehåll genom förbättrad organisering

#### Teknisk implementering
- **Navigeringshuvuden**: Standardiserad kapitelnavigering över 40+ dokumentationsfiler
- **Sidfotsnavigering**: Konsekvent vägledning för progression och indikatorer för slutförda kapitel
- **Korslänkning**: Omfattande internt länkning som kopplar relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt associerade med inlärningsmål

#### Förbättring av studieguide
- **📚 Omfattande inlärningsmål**: Omstrukturerad studieguide för att alignera med 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel innehåller specifika inlärningsmål och praktiska övningar
- **📋 Framstegsspårning**: Veckovis inlärningsschema med mätbara resultat och avcheckningslistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella utfall
- **🛠️ Praktiska övningar**: Praktiska aktiviteter med riktiga driftsättningsscenarier och felsökning
- **📊 Kompetensprogression**: Tydlig utveckling från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och communityerkännanden
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors inlärningsplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar detaljhandelslösningen med flera agenter genom bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent-terminologi**: Ersatte "Cora agent" med "Customer agent" i hela retail multi-agent-lösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterade all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Customer agent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsekvens**: Säkerställde att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrad
- **ARM-mallspaket**: Uppdaterade retail-multiagent-arm-template med Customer agent-referenser
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med ny agentnamngivning
- **Kodexempel**: Python-klasser och implementationsexempel använder nu CustomerAgent-namngivning
- **Miljövariabler**: Uppdaterade alla driftsättningsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrad
- **Utvecklarupplevelse**: Klarare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre överensstämmelse med företagsnamngivningskonventioner
- **Inlärningsmaterial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallens användbarhet**: Förenklad förståelse av agentfunktioner och driftsättningsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med CustomerAgent-referenser
- Ersatte CoraAgent-klasser med CustomerAgent i Python-exempel
- Modifierade ARM-mallarnas JSON-konfigurationer för att använda "customer"-agenttyp
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_*-mönster
- Uppdaterade alla driftsättningskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - AI-utvecklarfokus och Microsoft Foundry-integration
**Denna version förvandlar arkivet till en omfattande AI-inriktad lärresurs med Microsoft Foundry-integration.**

#### Lagt till
- **🤖 AI-First Learning Path**: Fullständig omstrukturering med prioritet för AI-utvecklare och ingenjörer
- **Microsoft Foundry Integration Guide**: Utförlig dokumentation för att ansluta AZD med Microsoft Foundry-tjänster
- **Mönster för driftsättning av AI-modeller**: Detaljerad guide som täcker val av modell, konfiguration och strategier för produktionsdriftsättning
- **AI Workshop Lab**: 2–3 timmars praktiskt workshop för att konvertera AI-applikationer till AZD-driftsättningsbara lösningar
- **Bästa praxis för AI i produktion**: Företagsklarade mönster för skalning, övervakning och säkerhet för AI-arbetslaster
- **AI-specifik felsökningsguide**: Omfattande felsökning för Microsoft Foundry Models, Cognitive Services och AI-driftsättningsproblem
- **AI-mallsgalleri**: Utvald samling Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska labb och referensmaterial

#### Förbättrad
- **README-struktur**: AI-utvecklarfokuserad med 45% community-intressedata från Microsoft Foundry Discord
- **Inlärningsvägar**: Avsedd AI-utvecklarresa parallellt med traditionella vägar för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat, och openai-chat-app-quickstart
- **Communityintegration**: Förbättrat Discord-communitystöd med AI-specifika kanaler och diskussioner

#### Säkerhet & produktionsfokus
- **Managed Identity-mönster**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetslaster
- **Multi-regiondriftsättning**: Strategier för global distribution av AI-applikationer
- **Prestandaövervakning**: AI-specifika mätvärden och Application Insights-integrering

#### Dokumentationskvalitet
- **Linjerad kursstruktur**: Logisk progression från nybörjare till avancerade AI-driftsättningsmönster
- **Validerade URL:er**: Alla externa arkivlänkar verifierade och åtkomliga
- **Fullständig referens**: Alla interna dokumentationslänkar validerade och fungerande
- **Produktionsklar**: Företagsdriftsättningsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Omstrukturering av arkivet och professionell förbättring
**Denna version representerar en betydande översyn av arkivets struktur och innehållspresentation.**

#### Lagt till
- **Strukturerat inlärningsramverk**: Alla dokumentationssidor innehåller nu Introduktion, Inlärningsmål och Inlärningsresultat-sektioner
- **Navigationssystem**: Lagt till Föregående/Nästa-lektionlänkar genom all dokumentation för vägledd inlärningsprogression
- **Studieguide**: Omfattande study-guide.md med inlärningsmål, övningsuppgifter och bedömningsmaterial
- **Professionell presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och professionellt utseende
- **Förbättrad innehållsstruktur**: Förbättrad organisation och flöde i inlärningsmaterialet

#### Ändrat
- **Dokumentationsformat**: Standardiserade all dokumentation med konsekvent inlärningsfokuserad struktur
- **Navigationsflöde**: Implementerade logisk progression genom allt inlärningsmaterial
- **Innehållspresentation**: Tog bort dekorativa element till förmån för tydlig, professionell formatering
- **Länkstruktur**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrad
- **Tillgänglighet**: Tog bort beroenden av emojis för bättre skärmläsarkompatibilitet
- **Professionellt utseende**: Rent, akademiskt stilupplägg lämpligt för företagsutbildning
- **Inlärningsupplevelse**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första utgåvan - Omfattande AZD-lärarkiv

#### Lagt till
- **Kärndokumentationsstruktur**
  - Komplett getting-started guide-serie
  - Omfattande dokumentation för driftsättning och provisioning
  - Detaljerade felsökningsresurser och felsökningsguider
  - Verktyg och procedurer för validering före driftsättning

- **Komma igång-modul**
  - AZD Basics: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställning och autentisering
  - Första projekt-tutorial: Steg-för-steg praktisk inlärning

- **Driftsättnings- och provisioningmodul**
  - Driftsättningsguide: Komplett arbetsflödesdokumentation
  - Provisioningguide: Infrastructure as Code med Bicep
  - Bästa praxis för produktionsdriftsättningar
  - Mönster för arkitektur med flera tjänster

- **Modul för validering före driftsättning**
  - Kapacitetsplanering: Validering av Azure-resursers tillgänglighet
  - SKU-val: Utförlig vägledning för servicetier
  - Pre-flight-kontroller: Automatiserade valideringsskript (PowerShell och Bash)
  - Kostnadsuppskattning och budgetplaneringsverktyg

- **Felsökningsmodul**
  - Vanliga problem: Ofta förekommande problem och lösningar
  - Felsökningsguide: Systematiska felsökningsmetodiker
  - Avancerade diagnostikmetoder och verktyg
  - Prestandaövervakning och optimering

- **Resurser och referenser**
  - Kommandocheatsheet: Snabbreferens för väsentliga kommandon
  - Ordlista: Omfattande terminologi- och förkortningsdefinitioner
  - FAQ: Utförliga svar på vanliga frågor
  - Externa resurslänkar och communitykopplingar

- **Exempel och mallar**
  - Enkelt webbapplikationsexempel
  - Mall för distributionsmall för statisk webbplats
  - Konfiguration för containerapplikation
  - Mönster för databasintegration
  - Exempel på mikrotjänstarkitektur
  - Implementationer av serverlösa funktioner

#### Funktioner
- **Flerplattformssupport**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera färdighetsnivåer**: Innehåll utformat för studenter till professionella utvecklare
- **Praktiskt fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsförst-tillvägagångssätt**: Säkerhetsbästa praxis integrerade genomgående
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva driftsättningar och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodprov
- **Steg-för-steg-instruktioner**: Tydlig, handlingsbar vägledning
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Integrering av bästa praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med senaste Azure-tjänsterna och azd-funktioner

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### Utvidgning av AI-plattformen
- **Stöd för flera modeller**: Integrationsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **AI-agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-utrullningar
- **Avancerade RAG-mönster**: Vektordatabasalternativ utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observabilitet**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code-tillägg**: Integrerad AZD + Microsoft Foundry-utvecklarupplevelse
- **GitHub Copilot-integration**: AI-assisterad AZD-mallgenerering
- **Interaktiva handledningar**: Praktiska kodningsövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videoguider för visuella inlärare med fokus på AI-utrullningar

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Styrningsramverk**: AI-modellstyrning, efterlevnad och revisionsspår
- **Multi-tenant AI**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-utrullning**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln-AI**: Multi-cloud- och hybridutrullningsmönster för AI-arbetsbelastningar

#### Avancerade funktioner
- **AI-pipeline-automation**: MLOps-integration med Azure Machine Learning-pipelines
- **Avancerad säkerhet**: Zero-trust-mönster, privata endpoints och avancerat skydd mot hot
- **Prestandaoptimering**: Avancerade inställnings- och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global distribution**: Innehållsleverans- och edge-caching-mönster för AI-applikationer

### Version 3.0.0 (Planerad) - Överträffad av nuvarande version
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande Microsoft Foundry-integration (Slutfört)
- ✅ **Interaktiva handledningar**: Praktiskt AI-workshop-labb (Slutfört)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutfört)
- ✅ **Prestandaoptimering**: Strategier för justering av AI-arbetsbelastningar (Slutfört)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Några slutförda i nuvarande release
- ✅ **Ytterligare exempel**: AI-fokuserade distributionsscenarier (Slutfört)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutfört)
- **Verktygsintegration**: Förbättrade guider för IDE- och editorintegration
- ✅ **Utökad övervakning**: AI-specifika mönster för övervakning och avisering (Slutfört)

#### Fortfarande planerat för framtida release
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integrering**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community-instrumentpanel**: Realtidsmått för community och spårning av bidrag

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta repository, vänligen se till att ändringsloggsposter inkluderar:

1. **Versionsnummer**: Följ semantisk versionering (major.minor.patch)
2. **Datum**: Release- eller uppdateringsdatum i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Tydlig beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur förändringarna påverkar befintliga användare

### Ändringskategorier

#### Added
- Nya funktioner, dokumentationsavsnitt eller möjligheter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller hjälpmedel

#### Changed
- Ändringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Deprecated
- Funktioner eller tillvägagångssätt som fasas ut
- Dokumentationsavsnitt som planeras tas bort
- Metoder som har bättre alternativ

#### Removed
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller föråldrade tillvägagångssätt
- Redundant eller konsoliderat innehåll

#### Fixed
- Korrigeringar av fel i dokumentation eller kod
- Lösning av rapporterade problem eller buggar
- Förbättringar av noggrannhet eller funktionalitet

#### Security
- Säkerhetsrelaterade förbättringar eller åtgärder
- Uppdateringar av säkerhetsbästa praxis
- Åtgärd av säkerhetssårbarheter

### Riktlinjer för semantisk versionering

#### Huvudversion (X.0.0)
- Brytande ändringar som kräver åtgärd från användaren
- Betydande omstrukturering av innehåll eller organisation
- Ändringar som ändrar den grundläggande metoden eller tillvägagångssättet

#### Mindre version (X.Y.0)
- Nya funktioner eller tillägg av innehåll
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patch-version (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Communityfeedback och förslag

Vi uppmuntrar aktivt communityfeedback för att förbättra denna lärresurs:

### Hur du ger feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Discord Discussions**: Dela idéer och engagera dig i Microsoft Foundry-communityt
- **Pull Requests**: Bidra med direkta förbättringar av innehållet, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för diskussioner om AZD + AI
- **Community Forums**: Delta i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI-innehållets noggrannhet**: Korrigeringar av information om AI-tjänsteintegration och distribution
- **Inlärningsupplevelse**: Förslag för förbättrat lärflöde för AI-utvecklare
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika inlärningsbehov
- **AI-verktygsintegration**: Förslag för bättre integration av AI-utvecklingsarbetsflöden
- **Produktions-AI-mönster**: Förfrågningar om företagsmönster för AI-utrullning

### Svarsåtagande
- **Svar på ärenden**: Inom 48 timmar för rapporterade problem
- **Funktionsförfrågningar**: Utvärdering inom en vecka
- **Communitybidrag**: Granskning inom en vecka
- **Säkerhetsärenden**: Omedelbar prioritet med snabbt svar

## Underhållsschema

### Regelbundna uppdateringar
- **Månadsöversyner**: Innehållets noggrannhet och länkvalidering
- **Kvartalsvisa uppdateringar**: Stora innehållstillägg och förbättringar
- **Halvårsöversyner**: Omfattande omstrukturering och förbättringar
- **Årliga releaser**: Stora versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetskontroll
- **Automatiserade tester**: Regelbunden validering av kodexempel och länkar
- **Integrering av communityfeedback**: Regelbunden införlivning av användarförslag
- **Teknikuppdateringar**: Anpassning till de senaste Azure-tjänsterna och azd-releaserna
- **Tillgänglighetsgranskningar**: Regelbunden översyn för inkluderande designprinciper

## Policy för versionsstöd

### Support för nuvarande version
- **Senaste huvudversionen**: Fullt stöd med regelbundna uppdateringar
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska fixar i 12 månader
- **Äldre versioner**: Endast community-stöd, inga officiella uppdateringar

### Migreringsvägledning
När större versioner släpps tillhandahåller vi:
- **Migrationsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsanteckningar**: Detaljer om brytande ändringar
- **Verktygsstöd**: Skript eller verktyg för att underlätta migrering
- **Communitystöd**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående lektion**: [Studieguide](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Huvud-README](README.md)

**Håll dig uppdaterad**: Bevaka detta repository för aviseringar om nya releaser och viktiga uppdateringar av läromaterialen.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter att vara korrekta, observera att automatiska översättningar kan innehålla fel eller felaktigheter. Originaldokumentet på dess ursprungliga språk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->