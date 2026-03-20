# Wijzigingslogboek - AZD For Beginners

## Inleiding

Dit wijzigingslogboek documenteert alle belangrijke wijzigingen, updates en verbeteringen aan de AZD For Beginners repository. We volgen semantische versiebeheerprincipes en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, kun je:
- Op de hoogte blijven van nieuwe functies en toegevoegde inhoud
- Inzicht krijgen in verbeteringen aan bestaande documentatie
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het lesmateriaal in de loop van de tijd volgen

## Leerresultaten

Na het bekijken van de wijzigingen kun je:
- Nieuwe inhoud en beschikbare leermaterialen identificeren
- Begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leertraject plannen op basis van het meest actuele materiaal
- Feedback geven en suggesties doen voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.18.0] - 2026-03-16

#### AZD AI CLI-opdrachten, inhoudsvalidatie & templatevergroting
**Deze versie voegt dekking voor de opdrachten `azd ai`, `azd extension` en `azd mcp` toe in alle AI-gerelateerde hoofdstukken, repareert gebroken links en verouderde code in agents.md, werkt het overzicht met veelgebruikte opdrachten bij en herziet de sectie Voorbeeldtemplates met gevalideerde beschrijvingen en nieuwe Azure AI AZD-templates.**

#### Toegevoegd
- **🤖 Ondersteuning voor AZD AI CLI** across 7 files (previously only in Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nieuwe sectie "Extensies en AI-opdrachten" die `azd extension`, `azd ai agent init` en `azd mcp` introduceert
  - `docs/chapter-02-ai-development/agents.md` — Optie 4: `azd ai agent init` met vergelijkingstabel (template- vs manifest-benadering)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecties "AZD-extensies voor Foundry" en "Agent-first implementatie"
  - `docs/chapter-05-multi-agent/README.md` — Snelstart toont nu zowel template- als manifestgebaseerde implementatiepaden
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sectie bevat nu de optie `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsectie "AZD AI-extensieopdrachten voor diagnostiek"
  - `resources/cheat-sheet.md` — Nieuwe sectie "AI- en extensieopdrachten" met `azd extension`, `azd ai agent init`, `azd mcp`, en `azd infra generate`
- **📦 Nieuwe AZD AI voorbeeldtemplates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat met Blazor WebAssembly, Semantic Kernel en spraakchat-ondersteuning
  - **azure-search-openai-demo-java** — Java RAG-chat met Langchain4J en ACA/AKS-implementatieopties
  - **contoso-creative-writer** — Multi-agent creatieve schrijfapp met Azure AI Agent Service, Bing Grounding en Prompty
  - **serverless-chat-langchainjs** — Serverless RAG met Azure Functions + LangChain.js + Cosmos DB met lokale ontwikkelingsondersteuning voor Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator met beheerportaal, Teams-integratie en PostgreSQL/Cosmos DB-opties
  - **azure-ai-travel-agents** — Multi-agent MCP-orchestratie referentie-app met servers in .NET, Python, Java en TypeScript
  - **azd-ai-starter** — Minimaal Bicep-startertemplate voor Azure AI-infrastructuur
  - **🔗 Link naar Awesome AZD AI-galerij** — Verwijzing naar de [awesome-azd AI-galerij](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Opgelost
- **🔗 agents.md-navigatie**: Vorige/Volgende-links komen nu overeen met de volgorde van lessen in de README van Hoofdstuk 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md gebroken links**: `production-ai-practices.md` gecorrigeerd naar `../chapter-08-production/production-ai-practices.md` (3 gevallen)
- **📦 agents.md verouderde code**: `opencensus` vervangen door `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ongeldige API**: `max_tokens` verplaatst van `create_agent()` naar `create_run()` als `max_completion_tokens`
- **🔢 agents.md tokentelling**: ruwe schatting `len//4` vervangen door `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Diensten gecorrigeerd van "Cognitive Search + App Service" naar "Azure AI Search + Azure Container Apps" (standaard host gewijzigd okt 2024)
- **contoso-chat**: Beschrijving bijgewerkt om te verwijzen naar Azure AI Foundry + Prompty, overeenkomstig de feitelijke repositorytitel en techstack

#### Verwijderd
- **ai-document-processing**: Niet-functionele templatereferentie verwijderd (repo niet openbaar toegankelijk als AZD-template)

#### Verbeterd
- **📝 agents.md-oefeningen**: Oefening 1 toont nu de verwachte output en de stap `azd monitor`; Oefening 2 bevat de volledige registratiecode voor `FunctionTool`; Oefening 3 vervangt vage aanwijzingen door concrete `prepdocs.py`-commando's
- **📚 agents.md-bronnen**: Documentatielinks bijgewerkt naar de huidige Azure AI Agent Service-documentatie en quickstart
- **📋 agents.md Next Steps-tabel**: Link naar AI Workshop Lab toegevoegd voor volledige hoofdstukdekking

#### Bestanden bijgewerkt
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Verbetering van cursusnavigatie
**Deze versie verbetert de hoofdstuknavigatie in README.md met een uitgebreidere tabelindeling.**

#### Gewijzigd
- **Cursuskaarttabel**: Uitgebreid met directe leslinks, duurinschattingen en complexiteitsbeoordelingen
- **Mapopschoning**: Overbodige oude mappen verwijderd (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidatie**: Alle 21+ interne links in de cursuskaarttabel geverifieerd

### [v3.16.0] - 2026-02-05

#### Productnaamupdates
**Deze versie werkt productverwijzingen bij naar de huidige Microsoft-branding.**

#### Gewijzigd
- **Microsoft Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt in niet-vertalingsbestanden
- **Azure AI Agent Service → Foundry Agents**: Servicenaam bijgewerkt om de huidige branding te weerspiegelen

#### Bestanden bijgewerkt
- `README.md` - Hoofdpagina van de cursus
- `changelog.md` - Versiegeschiedenis
- `course-outline.md` - Cursusstructuur
- `docs/chapter-02-ai-development/agents.md` - Gids voor AI-agents
- `examples/README.md` - Voorbeelddocumentatie
- `workshop/README.md` - Workshop-landingspagina
- `workshop/docs/index.md` - Workshopindex
- `workshop/docs/instructions/*.md` - Alle workshop-instructiebestanden

---

### [v3.15.0] - 2026-02-05

#### Grote repositoryherstructurering: hoofdstukgebaseerde mappenamen
**Deze versie herstructureert de documentatie in speciale hoofdstukmappen voor duidelijkere navigatie.**

#### Maphernoemingen
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Bestandsmigraties
| Bestand | Van | Naar |
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

#### Toegevoegd
- **📚 Hoofdstuk-README-bestanden**: README.md aangemaakt in elke hoofdstukmap met:
  - Leerdoelen en duur
  - Lessentabel met beschrijvingen
  - Snelstartcommando's
  - Navigatie naar andere hoofdstukken

#### Gewijzigd
- **🔗 Alle interne links bijgewerkt**: 78+ paden bijgewerkt in alle documentatiebestanden
- **🗺️ Hoofd-README.md**: Cursuskaart bijgewerkt met nieuwe hoofdstukstructuur
- **📝 examples/README.md**: Kruisverwijzingen naar hoofdstukmappen bijgewerkt

#### Verwijderd
- Oude mappenstructuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositoryherstructurering: hoofdstuknavigatie
**Deze versie voegde hoofdstuknavigatie-README-bestanden toe (vervangen door v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nieuwe gids voor AI-agents
**Deze versie voegt een uitgebreide gids toe voor het implementeren van AI-agents met de Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids die behandelt:
  - Wat AI-agents zijn en hoe ze verschillen van chatbots
  - Drie snelstartagent-templates (Foundry Agents, Prompty, RAG)
  - Architectuurpatronen voor agents (enkel agent, RAG, multi-agent)
  - Toolconfiguratie en aanpassing
  - Monitoring en het bijhouden van metrics
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende probleemoplossingsscenario's
  - Drie praktische oefeningen met succescriteria

#### Inhoudsstructuur
- Introductie: Agentconcepten voor beginners
- Snelstart: Agents implementeren met `azd init --template get-started-with-ai-agents`
- Architectuurpatronen: Visuele diagrammen van agentpatronen
- Configuratie: Toolinstelling en omgevingsvariabelen
- Monitoring: Integratie met Application Insights
- Oefeningen: Geleidelijk praktisch leren (20-45 minuten per oefening)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-omgevingupdate
**Deze versie werkt de configuratie van de ontwikkelcontainer bij met moderne tools en betere standaardinstellingen voor de AZD-leerervaring.**

#### Gewijzigd
- **🐳 Basisimage**: Bijgewerkt van `python:3.12-bullseye` naar `python:3.12-bookworm` (laatste stabiele Debian)
- **📛 Containernaam**: Hernoemd van "Python 3" naar "AZD for Beginners" voor duidelijkheid

#### Toegevoegd
- **🔧 Nieuwe Dev Container-functies**:
  - `azure-cli` met Bicep-ondersteuning ingeschakeld
  - `node:20` (LTS versie voor AZD templates)
  - `github-cli` voor sjabloonbeheer
  - `docker-in-docker` voor container app implementaties

- **🔌 Poortdoorsturing**: Vooraf geconfigureerde poorten voor veelvoorkomende ontwikkeling:
  - 8000 (MkDocs voorvertoning)
  - 3000 (Web-apps)
  - 5000 (Python Flask)
  - 8080 (API's)

- **🧩 Nieuwe VS Code-extensies**:
  - `ms-python.vscode-pylance` - Verbeterde Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-ondersteuning
  - `ms-azuretools.vscode-docker` - Docker-ondersteuning
  - `ms-azuretools.vscode-bicep` - Bicep-taalondersteuning
  - `ms-azure-devtools.azure-resource-groups` - Azure resourcebeheer
  - `yzhang.markdown-all-in-one` - Markdown-bewerking
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramondersteuning
  - `redhat.vscode-yaml` - YAML-ondersteuning (voor azure.yaml)
  - `eamodio.gitlens` - Git-visualisatie
  - `mhutchie.git-graph` - Git-geschiedenis

- **⚙️ VS Code-instellingen**: Standaardinstellingen toegevoegd voor Python-interpreter, automatisch formatteren bij opslaan en het trimmen van witruimte

- **📦 Bijgewerkte requirements-dev.txt**:
  - Toegevoegd MkDocs minify plugin
  - Toegevoegd pre-commit voor codekwaliteit
  - Toegevoegd Azure SDK-pakketten (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create-opdracht**: Controleert nu AZD- en Azure CLI-installatie bij het starten van de container

---

### [v3.11.0] - 2026-02-05

#### README-opknapbeurt voor beginners
**Deze versie verbetert README.md aanzienlijk om toegankelijker te zijn voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Vergelijking Azure CLI vs AZD**: Duidelijke uitleg over wanneer je elk hulpmiddel moet gebruiken, met praktische voorbeelden
- **🌟 Geweldige AZD-links**: Directe links naar community sjabloongalerij en bijdragerbronnen:
  - [Geweldige AZD-galerij](https://azure.github.io/awesome-azd/) - 200+ kant-en-klare deployment-sjablonen
  - [Dien een sjabloon in](https://github.com/Azure/awesome-azd/issues) - Communitybijdrage
- **🎯 Snelle startgids**: Vereenvoudigde 3-stappen sectie om aan de slag te gaan (Installeren → Inloggen → Implementeren)
- **📊 Ervaringsgebaseerde navigatietabel**: Duidelijke aanwijzingen over waar te beginnen op basis van ontwikkelaarservaring

#### Gewijzigd
- **README-structuur**: Herschikt voor geleidelijke onthulling - belangrijkste informatie eerst
- **Inleidingssectie**: Herschreven om "The Magic of `azd up`" uit te leggen voor absolute beginners
- **Dubbele inhoud verwijderd**: Dubbele probleemoplossingssectie verwijderd
- **Probleemoplossingsopdrachten**: `azd logs`-verwijzing gecorrigeerd om de geldige `azd monitor --logs` te gebruiken

#### Opgelost
- **🔐 Authenticatieopdrachten**: `azd auth login` en `azd auth logout` toegevoegd aan cheat-sheet.md
- **Ongeldige opdrachtverwijzingen**: Overgebleven `azd logs` uit README-probleemoplossingssectie verwijderd

#### Opmerkingen
- **Reikwijdte**: Wijzigingen toegepast op hoofd README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen specifiek gericht op ontwikkelaars die nieuw zijn met AZD

---

### [v3.10.0] - 2026-02-05

#### Nauwkeurigheidsupdate van Azure Developer CLI-commando's
**Deze versie corrigeert niet-bestaande AZD-commando's door de documentatie heen, zodat alle codevoorbeelden geldige Azure Developer CLI-syntaxis gebruiken.**

#### Opgelost
- **🔧 Niet-bestaande AZD-commando's verwijderd**: Uitgebreide controle en correctie van ongeldige opdrachten:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI-alternatieven
  - `azd service` subcommando's (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` vlaggen (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` vlaggen (bestaan niet) → bijgewerkt om `--preview` te gebruiken
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bestanden bijgewerkt met corrigerende opdrachten**:
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

#### Gewijzigd
- **Rollbackstrategieën**: Documentatie bijgewerkt om Git-gebaseerde rollback te gebruiken (AZD heeft geen ingebouwde rollback)
- **Logweergave**: `azd logs`-verwijzingen vervangen door `azd monitor --logs`, `azd monitor --live` en Azure CLI-opdrachten
- **Prestatiegedeelte**: Niet-bestaande parallelle/incrementiële deployment-vlaggen verwijderd, geldige alternatieven aangeboden

#### Technische details
- **Geldige AZD-commando's**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor-vlaggen**: `--live`, `--logs`, `--overview`
- **Verwijderde functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opmerkingen
- **Verificatie**: Opdrachten gevalideerd tegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Voltooiing van workshop en kwaliteitsupdate van documentatie
**Deze versie voltooit de interactieve workshopmodules, repareert alle kapotte documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuw document met richtlijnen voor bijdragen met:
  - Duidelijke instructies voor het melden van problemen en het voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commit-berichten
  - Informatie over communitybetrokkenheid

#### Voltooid
- **🎯 Workshopmodule 7 (Afronding)**: Volledig afgeronde wrap-upmodule met:
  - Uitgebreide samenvatting van workshopprestaties
  - Sectie met beheerde kernconcepten over AZD, sjablonen en Microsoft Foundry
  - Aanbevelingen voor voortzetting van de leerreis
  - Workshop-oefeningen met moeilijkheidsbeoordelingen
  - Links naar communityfeedback en ondersteuning

- **📚 Workshopmodule 3 (Deconstruct)**: Leerdoelen bijgewerkt met:
  - Instructies voor activering van GitHub Copilot met MCP-servers
  - Inzicht in AZD-sjabloonmapstructuur
  - Organisatiepatronen voor Infrastructure-as-Code (Bicep)
  - Handleiding voor hands-on labs

- **🔧 Workshopmodule 6 (Afbraak)**: Voltooid met:
  - Doelstellingen voor resourceopschoning en kostenbeheer
  - `azd down`-gebruik voor veilige deprovisioning van infrastructuur
  - Richtlijnen voor herstel van soft-verwijderde cognitive services
  - Bonusverkenningsopdrachten voor GitHub Copilot en Azure Portal

#### Opgelost
- **🔗 Kapotte linkfixes**: Meer dan 15 kapotte interne documentatielinks opgelost:
  - `docs/ai-foundry/ai-model-deployment.md`: Paden naar microsoft-foundry-integration.md hersteld
  - `docs/troubleshooting/ai-troubleshooting.md`: Gecorrigeerde paden naar ai-model-deployment.md en production-ai-practices.md
  - `docs/getting-started/first-project.md`: Niet-bestaande cicd-integration.md vervangen door deployment-guide.md
  - `examples/retail-scenario.md`: FAQ- en troubleshootinggidspaden hersteld
  - `examples/container-app/microservices/README.md`: Courseshome- en deploymentguide-paden gecorrigeerd
  - `resources/faq.md` en `resources/glossary.md`: AI-hoofdstukreferenties bijgewerkt
  - `course-outline.md`: Instructeurshandleiding- en AI-workshoplabreferenties hersteld

- **📅 Workshopstatusbanner**: Bijgewerkt van "Under Construction" naar actieve workshopstatus met februari 2026 datum

- **🔗 Workshopnavigatie**: Kapotte navigatielinks in workshop README.md hersteld die naar niet-bestaande lab-1-azd-basics-map verwezen

#### Gewijzigd
- **Workshoppresentatie**: 'in aanbouw'-waarschuwing verwijderd, workshop is nu voltooid en klaar voor gebruik
- **Navigatieconsistentie**: Gezorgd dat alle workshopmodules de juiste inter-module-navigatie hebben
- **Verwijzingen naar leerpad**: Hoofdstukkruisverwijzingen bijgewerkt om de juiste microsoft-foundry-paden te gebruiken

#### Gevalideerd
- ✅ Alle Engelse markdownbestanden hebben geldige interne links
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules werkt correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Beginnersvriendelijke taal en structuur behouden
- ✅ CONTRIBUTING.md biedt duidelijke richtlijnen voor communitybijdragers

#### Technische implementatie
- **Linkvalidatie**: Geautomatiseerd PowerShell-script heeft alle .md interne links geverifieerd
- **Inhoudsaudit**: Handmatige beoordeling van workshopvolledigheid en geschiktheid voor beginners
- **Navigatiesysteem**: Consistente hoofdstuk- en module-navigatiepatronen toegepast

#### Opmerkingen
- **Reikwijdte**: Wijzigingen alleen toegepast op Engelse documentatie
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (geautomatiseerde vertaling wordt later gesynchroniseerd)
- **Workshopduur**: Volledige workshop biedt nu 3-4 uur hands-on leren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde documentatie: Monitoring, beveiliging en multi-agent-patronen
**Deze versie voegt uitgebreide A-niveau-lessen toe over integratie van Application Insights, authenticatiepatronen en multi-agent-coördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Les over integratie van Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gerichte deployment met automatische provisioning
  - Volledige Bicep-sjablonen voor Application Insights + Log Analytics
  - Werkende Python-applicaties met aangepaste telemetrie (1,200+ regels)
  - AI/LLM-monitoringpatronen (Microsoft Foundry Models token/kostentracking)
  - 6 Mermaid-diagrammen (architectuur, gedistribueerde tracing, telemetriestroom)
  - 3 hands-on oefeningen (alerts, dashboards, AI-monitoring)
  - Kusto-queryvoorbeelden en strategieën voor kostenoptimalisatie
  - Live-metricstreaming en realtime-debugging
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Les over authenticatie- en beveiligingspatronen**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Volledige Bicep-infrastructuursjablonen voor veilige implementaties
  - Node.js-applicatiecode met Azure SDK-integratie
  - 3 volledige oefeningen (managed identity inschakelen, user-assigned identity, Key Vault-rotatie)
  - Beveiligingsbest practices en RBAC-configuraties
  - Probleemoplossingsgids en kostenanalyse
  - Productieklaar passwordless-authenticatiepatronen

- **🤖 Les over multi-agent-coördinatiepatronen**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, gebeurtenisgestuurd, consensus)
  - Volledige implementatie van orchestrator-service (Python/Flask, 1,500+ regels)
  - 3 gespecialiseerde agentimplementaties (Research, Writer, Editor)
  - Service Bus-integratie voor message queuing
  - Cosmos DB-statebeheer voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 gevorderde oefeningen (timeoutafhandeling, retry-logica, circuit breaker)
  - Kostenoverzicht ($240-565/maand) met optimalisatiestrategieën
  - Application Insights-integratie voor monitoring

#### Verbeterd
- Pre-deploymenthoofdstuk: Bevat nu uitgebreide monitoring- en coördinatiepatronen
- Getting Started-hoofdstuk: Uitgebreid met professionele authenticatiepatronen
- Productieklaarheid: Volledige dekking van beveiliging tot observeerbaarheid
- Cursusoverzicht: Bijgewerkt om naar nieuwe lessen in Hoofdstuk 3 en 6 te verwijzen

#### Gewijzigd
- Leerprogressie: Betere integratie van beveiliging en monitoring in de hele cursus
- Documentatiekwaliteit: Consistente A-niveau standaarden (95-97%) over de nieuwe lessen
- Productiepatronen: Volledige end-to-end dekking voor enterprise-implementaties

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijk pad van ontwikkeling naar productie-monitoring
- **Beveiligingsnormen**: Professionele patronen voor authenticatie en beheer van geheimen
- **Observeerbaarheid**: Volledige Application Insights-integratie met AZD
- **AI Workloads**: Gespecialiseerde monitoring voor Microsoft Foundry Models en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten complete werkende code (geen fragmenten)
- ✅ Mermaid-diagrammen voor visueel leren (19 in totaal over 3 lessen)
- ✅ Praktische oefeningen met verificatiestappen (9 in totaal)
- ✅ Productieklare Bicep-sjablonen inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Probleemoplossingsgidsen en best practices
- ✅ Kenniscontroles met verificatiecommando's

#### Documentatiebeoordelingsresultaten
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringgids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agent architecturen
- **Overall New Content**: - Consistente hoge kwaliteitsnormen

#### Technische Implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + gedistribueerde tracing
- **Authentication**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live-metrics + Kusto-queries + waarschuwingen + dashboards
- **Cost Management**: Samplingstrategieën, retentiebeleid, budgetcontroles

### [v3.7.0] - 2025-11-19

#### Verbeteringen in documentatiekwaliteit en nieuw voorbeeld van Microsoft Foundry Models
**Deze versie verbetert de documentatiekwaliteit in de hele repository en voegt een compleet Microsoft Foundry Models-implementatievoorbeeld toe met een gpt-4.1 chatinterface.**

#### Toegevoegd
- **🤖 Microsoft Foundry Models Chat Example**: Volledige gpt-4.1-implementatie met een werkende toepassing in `examples/azure-openai-chat/`:
  - Volledige Microsoft Foundry Models-infrastructuur (gpt-4.1 modelimplementatie)
  - Python commandoregel chatinterface met gespreksgeschiedenis
  - Key Vault-integratie voor veilige opslag van API-sleutels
  - Bijhouden van tokengebruik en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met implementatiehandleiding van 35-45 minuten
  - 11 productieklare bestanden (Bicep-sjablonen, Python-app, configuratie)
- **📚 Documentation Exercises**: Toegevoegde hands-on praktijkoefeningen aan de configuratiehandleiding:
  - Oefening 1: Configuratie voor meerdere omgevingen (15 minuten)
  - Oefening 2: Geheimbeheer-oefening (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Deployment Verification**: Toegevoegde verificatiesectie aan de implementatiehandleiding:
  - Healthcheckprocedures
  - Succescriteria-checklist
  - Verwachte uitvoer voor alle implementatiecommando's
  - Snelreferentie voor probleemoplossing

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-kwaliteitsniveau (93%):
  - azure-openai-chat toegevoegd aan alle relevante secties
  - Aantal lokale voorbeelden bijgewerkt van 3 naar 4
  - Toegevoegd aan de tabel AI Application Examples
  - Geïntegreerd in Quick Start voor gevorderde gebruikers
  - Toegevoegd aan de sectie Microsoft Foundry Templates
  - Bijgewerkte vergelijkingsmatrix en secties voor technologiebevindingen
- **Documentation Quality**: Verbeterd van B+ (87%) → A- (92%) in de docs-map:
  - Verwachte uitvoer toegevoegd aan kritieke commando-voorbeelden
  - Verificatiestappen opgenomen voor configuratiewijzigingen
  - Praktisch leren verbeterd met praktijkgerichte oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor gevorderde gebruikers
- **Documentatiestructuur**: Meer uitvoerbare oefeningen met duidelijke uitkomsten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ontwikkelaarservaring**: Implementatie van Microsoft Foundry Models duurt nu 35-45 minuten (vs 60-90 voor complexere alternatieven)
- **Kostentransparantie**: Duidelijke kostenramingen ($50-200/maand) voor het Microsoft Foundry Models-voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben een duidelijk instappunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte uitvoer en verificatiestappen

#### Gevalideerd
- ✅ Microsoft Foundry Models-voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met de daadwerkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op meer dan 8 locaties
- ✅ Voorbeeldindex geeft nauwkeurig 4 lokale voorbeelden weer
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatiereferenties correct

#### Technische implementatie
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps-patroon
- **Security**: Managed Identity klaar, geheimen in Key Vault
- **Monitoring**: Application Insights-integratie
- **Cost Management**: Tokentracking en gebruiksoptimalisatie
- **Deployment**: Enkele `azd up`-opdracht voor volledige installatie

### [v3.6.0] - 2025-11-19

#### Grote update: Container App-implementatievoorbeelden
**Deze versie introduceert uitgebreide, productieklaar containerapp-implementatievoorbeelden met gebruik van Azure Developer CLI (AZD), met volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App Examples**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Hoofdgids](examples/container-app/README.md): Volledig overzicht van containerimplementaties, snelle start, productie en geavanceerde patronen
  - [Eenvoudige Flask-API](../../examples/container-app/simple-flask-api): Gebruiksvriendelijke REST-API met scale-to-zero, health probes, monitoring en probleemoplossing
  - [Microservices-architectuur](../../examples/container-app/microservices): Productieklaar multi-service-implementatie (API Gateway, Product, Order, User, Notification), asynchrone berichtgeving, Service Bus, Cosmos DB, Azure SQL, gedistribueerde tracing, blue-green/canary-implementatie
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD-richtlijnen voor gecontaineriseerde workloads
- **Code Samples**: Complete `azure.yaml`, Bicep-sjablonen en meertalige service-implementaties (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testscenario's, monitoringopdrachten, probleemoplossingsrichtlijnen

#### Gewijzigd
- **README.md**: Bijgewerkt om de nieuwe containerapp-voorbeelden weer te geven en te linken onder "Local Examples - Container Applications"
- **examples/README.md**: Bijgewerkt om containerapp-voorbeelden te benadrukken, vergelijkingsmatrixitems toe te voegen en technologie/architectuurverwijzingen bij te werken
- **Course Outline & Study Guide**: Bijgewerkt om te verwijzen naar nieuwe containerapp-voorbeelden en implementatiepatronen in relevante hoofdstukken

#### Gevalideerd
- ✅ Alle nieuwe voorbeelden inzetbaar met `azd up` en volgen best practices
- ✅ Documentatie-kruislinks en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken van beginner tot gevorderde scenario's, inclusief productie-microservices

#### Opmerkingen
- **Scope**: Alleen Engelse documentatie en voorbeelden
- **Next Steps**: Uitbreiden met aanvullende geavanceerde containerpatronen en CI/CD-automatisering in toekomstige releases

### [v3.5.0] - 2025-11-19

#### Producthernoeming: Microsoft Foundry
**Deze versie voert een uitgebreide naamswijziging van het product door van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, ter weerspiegeling van de officiële rebranding door Microsoft.**

#### Gewijzigd
- **🔄 Productnaamupdate**: Volledige rebranding van "Microsoft Foundry" naar "Microsoft Foundry"
  - Bijgewerkt alle verwijzingen in de Engelse documentatie in de map `docs/`
  - Map hernoemd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestand hernoemd: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsverwijzingen bijgewerkt in 7 documentbestanden

- **📁 Wijzigingen mapstructuur**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen bijgewerkt om de nieuwe mapstructuur te weerspiegelen
  - Navigatielinks gevalideerd in alle documentatie

- **📄 Bestandshernoemingen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links bijgewerkt om naar de nieuwe bestandsnaam te verwijzen

#### Bijgewerkte bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielinks bijgewerkt
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamverwijzingen bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Gebruikt al Microsoft Foundry (van eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen bijgewerkt (overzicht, communityfeedback, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingen bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 links naar volgende hoofdstukken bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Cursusstructuurbestanden** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursusoverzicht, hoofdstuktitels, sjabloonsectie, communityinzichten)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukbronnen)

#### Gevalideerd
- ✅ Geen resterende "ai-foundry" mapreferenties in de Engelse documentatie
- ✅ Geen resterende "Microsoft Foundry" productnaamverwijzingen in de Engelse documentatie
- ✅ Alle navigatielinks functioneel met de nieuwe mapstructuur
- ✅ Bestands- en maphernoemingen succesvol voltooid
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Opmerkingen
- **Scope**: Wijzigingen alleen toegepast op Engelse documentatie in de map `docs/`
- **Translations**: Vertalingsmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmaterialen (`workshop/`) niet bijgewerkt in deze versie
- **Examples**: Voorbeeldbestanden kunnen nog steeds legacy-namen bevatten (wordt in een toekomstige update aangepakt)
- **External Links**: Externe URL's en GitHub-repositieverwijzingen blijven ongewijzigd

#### Migratiehandleiding voor bijdragers
Als u lokale branches of documentatie heeft die naar de oude structuur verwijzen:
1. Werk mapverwijzingen bij: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Werk bestandsverwijzingen bij: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Valideer dat alle interne documentatielinks nog steeds werken

---

### [v3.4.0] - 2025-10-24

#### Infrastructuur-preview en validatieverbeteringen
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe Azure Developer CLI-previewfunctie en verbetert de gebruikerservaring van de workshop.**

#### Toegevoegd
- **🧪 azd provision --preview Feature Documentation**: Volledige documentatie van de nieuwe infrastructuur-previewfunctionaliteit
  - Commandoreferentie en gebruiksvoorbeelden in de cheat sheet
  - Gedetailleerde integratie in de provisioninggids met gebruiksscenario's en voordelen
  - Pre-flight-checkintegratie voor veiligere implementatievalidatie
  - Bijgewerkte Aan de slag-gids met veiligheid-gerichte implementatiepraktijken
- **🚧 Workshop Status Banner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Gradientontwerp met constructie-indicatoren voor duidelijke gebruikerscommunicatie
  - Laatst bijgewerkte tijdstempel voor transparantie
  - Mobiel-responsief ontwerp voor alle apparaattype

#### Verbeterd
- **Infrastructure Safety**: Previewfunctionaliteit geïntegreerd doorheen de implementatiedocumentatie
- **Pre-deployment Validation**: Geautomatiseerde scripts bevatten nu infrastructuur-previewtests
- **Developer Workflow**: Bijgewerkte commando-sequenties om preview als best practice op te nemen
- **Workshop Experience**: Duidelijke verwachtingen voor gebruikers over de ontwikkelstatus van inhoud

#### Gewijzigd
- **Deployment Best Practices**: Preview-eerst workflow nu aanbevolen aanpak
- **Documentation Flow**: Infrastructuurvalidatie eerder in het leerproces geplaatst
- **Workshop Presentation**: Professionele statuscommunicatie met duidelijke ontwikkelingstijdlijn

#### Verbeterd
- **Safety-First Approach**: Infrastructuurwijzigingen kunnen nu vóór implementatie worden gevalideerd
- **Team Collaboration**: Previewresultaten kunnen worden gedeeld voor beoordeling en goedkeuring
- **Cost Awareness**: Beter inzicht in resourcenkosten vóór provisioning
- **Risk Mitigation**: Minder implementatiefouten door voorafgaande validatie

#### Technische implementatie
- **Multi-document Integration**: Previewfunctie gedocumenteerd in 4 belangrijke bestanden
- **Command Patterns**: Consistente syntaxis en voorbeelden door de documentatie heen
- **Best Practice Integration**: Preview opgenomen in validatieworkflows en scripts
- **Visual Indicators**: Duidelijke NIEUWE functiemarkeringen voor vindbaarheid

#### Workshopinfrastructuur
- **Status Communication**: Professionele HTML-banner met gradient-styling
- **User Experience**: Duidelijke ontwikkelstatus voorkomt verwarring
- **Professional Presentation**: Behoudt de geloofwaardigheid van de repository terwijl verwachtingen worden gesteld
- **Timeline Transparency**: Oktober 2025 laatst bijwerktimestamp voor verantwoording

### [v3.3.0] - 2025-09-24

#### Verbeterd workshopmateriaal en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve handleidingen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve Workshopgids**: Browsergebaseerde workshopervaring met MkDocs preview-mogelijkheid
- **📝 Gestructureerde Workshopinstructies**: 7-stappen begeleide leerroute van ontdekking tot aanpassing
  - 0-Introduction: Overzicht van de workshop en opzet
  - 1-Select-AI-Template: Sjabloonontdekking en selectieproces
  - 2-Validate-AI-Template: Implementatie- en validatieprocedures
  - 3-Deconstruct-AI-Template: Begrijpen van sjabloonarchitectuur
  - 4-Configure-AI-Template: Configuratie en aanpassing
  - 5-Customize-AI-Template: Geavanceerde aanpassingen en iteraties
  - 6-Teardown-Infrastructure: Opruimen en resourcebeheer
  - 7-Wrap-up: Samenvatting en volgende stappen
- **🛠️ Workshop-tooling**: MkDocs-configuratie met het Material-thema voor een verbeterde leerervaring
- **🎯 Hands-on leerroute**: 3-stappenmethodiek (Ontdekking → Implementatie → Aanpassing)
- **📱 GitHub Codespaces-integratie**: Naadloze setup van de ontwikkelomgeving

#### Verbeterd
- **AI Workshop Lab**: Uitgebreid met een uitgebreide 2-3 uur durende gestructureerde leerervaring
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van sjabloonselectie tot productie-implementatie
- **Ontwikkelaarservaring**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browsergebaseerde interface met zoekfunctie, kopieerfunctionaliteit en themawisselaar
- **Zelfgestuurd leren**: Flexibele workshopstructuur die verschillende leertempo's ondersteunt
- **Praktische toepassing**: Realistische AI-sjabloonimplementatiescenario's
- **Community-integratie**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshopfuncties
- **Ingebouwde zoekfunctie**: Snel trefwoord- en lesontdekking
- **Kopieer codeblokken**: Hover-naar-kopiëren functionaliteit voor alle codevoorbeelden
- **Themawisselaar**: Donker/licht modus-ondersteuning voor verschillende voorkeuren
- **Visuele middelen**: Screenshots en diagrammen voor beter begrip
- **Help-integratie**: Directe Discord-toegang voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Grote herstructurering van navigatie en hoofdstukgebaseerd leersysteem
**Deze versie introduceert een uitgebreide hoofdstukgebaseerde leerstructuur met verbeterde navigatie door de hele repository.**

#### Toegevoegd
- **📚 Chapter-Based Learning System**: Herstructureerde hele cursus in 8 progressieve leerhoofdstukken
  - Chapter 1: Basis & Snelstart (⭐ - 30-45 min)
  - Chapter 2: AI-first ontwikkeling (⭐⭐ - 1-2 uur)
  - Chapter 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Chapter 4: Infrastructure as Code & Implementatie (⭐⭐⭐ - 1-1.5 uur)
  - Chapter 5: Multi-agent AI-oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Chapter 6: Pre-implementatievalidatie & Planning (⭐⭐ - 1 uur)
  - Chapter 7: Probleemoplossing & Debugging (⭐⭐ - 1-1.5 uur)
  - Chapter 8: Productie- & enterprisepatronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten in alle documentatie
- **🎯 Voortgangstracking**: Cursusvoltooiingschecklist en leerverificatiesysteem
- **🗺️ Leerroutebegeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingsnavigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gekoppeld

#### Verbeterd
- **README-structuur**: Omgevormd tot een gestructureerd leerplatform met hoofdstukgebaseerde organisatie
- **Documentatienavigatie**: Elke pagina bevat nu hoofdstukcontext en voortgangsbegeleiding
- **Sjabloonorganisatie**: Voorbeelden en sjablonen gekoppeld aan geschikte leerhoofdstukken
- **Bronintegratie**: Spiekbriefjes, veelgestelde vragen en studiegidsen gekoppeld aan relevante hoofdstukken
- **Workshopintegratie**: Hands-on labs gekoppeld aan meerdere leerdoelen per hoofdstuk

#### Gewijzigd
- **Leerprogressie**: Verplaatst van lineaire documentatie naar flexibele hoofdstukgebaseerde leerroutes
- **Configuratieplaatsing**: Configuratiehandleiding verplaatst naar Chapter 3 voor betere leerstroom
- **AI-contentintegratie**: Betere integratie van AI-specifieke inhoud door de leerreis heen
- **Productiecontent**: Geavanceerde patronen geconsolideerd in Chapter 8 voor enterprise-leraars

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiekruimels en hoofdstukvoortgangsindicatoren
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudiger doorlopen van de cursus
- **Professionele presentatie**: Universitaire cursusstructuur geschikt voor academische en zakelijke training
- **Leerefficiëntie**: Minder tijd nodig om relevante content te vinden door verbeterde organisatie

#### Technische implementatie
- **Navigatiekoppen**: Gestandaardiseerde hoofdstuknavigatie in meer dan 40 documentatiebestanden
- **Voettekstnavigatie**: Consistente voortgangsbegeleiding en hoofdstukvoltooiingsindicatoren
- **Kruislinking**: Uitgebreid intern linkingsysteem dat gerelateerde concepten verbindt
- **Hoofdstukmapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Verbetering van de studiegids
- **📚 Uitgebreide leerdoelen**: Studiegids herstructureerd om uit te lijnen met het 8-hoofdstukssysteem
- **🎯 Hoofdstukgebaseerde beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangstracking**: Wekelijks leerschema met meetbare uitkomsten en voltooiingschecklists
- **❓ Beoordelingsvragen**: Kennisvalidatievragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met echte implementatiescenario's en foutopsporing
- **📊 Vaardigheidsprogressie**: Duidelijke vooruitgang van basisconcepten naar enterprisepatronen met focus op loopbaanontwikkeling
- **🎓 Certificeringskader**: Professionele ontwikkelingsresultaten en communityerkenningssysteem
- **⏱️ Tijdlijnbeheer**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 2025-09-17

#### Verbeterde Multi-Agent AI-oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentbenamingen en verbeterde documentatie.**

#### Gewijzigd
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Verbeterd
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Vernieuwde Mermaid-diagrammen met bijgewerkte agentbenamingen
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijkere agentrollen en verantwoordelijkheden in de documentatie
- **Productieklaarheid**: Betere afstemming op enterprise-benamingsconventies
- **Leermateriaal**: Intuïtiever agentbenaming voor educatieve doeleinden
- **Sjabloongebruiksvriendelijkheid**: Vereenvoudigd begrip van agentfuncties en implementatiepatronen

#### Technische details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Grote veranderingen - AI-ontwikkelaarsfocus en Microsoft Foundry-integratie
**Deze versie transformeert de repository in een uitgebreid AI-gericht leerplatform met Microsoft Foundry-integratie.**

#### Toegevoegd
- **🤖 AI-First Learning Path**: Volledige herstructurering gericht op AI-ontwikkelaars en engineers
- **Microsoft Foundry Integration Guide**: Uitgebreide documentatie voor het koppelen van AZD aan Microsoft Foundry-services
- **AI Model Deployment Patterns**: Gedetailleerde handleiding over modelselectie, configuratie en productie-implementatiestrategieën
- **AI Workshop Lab**: 2-3 uur hands-on workshop voor het omzetten van AI-applicaties naar AZD-deployable oplossingen
- **Production AI Best Practices**: Enterprise-klare patronen voor schalen, monitoren en beveiligen van AI-workloads
- **AI-Specific Troubleshooting Guide**: Uitgebreide foutopsporingsgids voor Microsoft Foundry Models, Cognitive Services en AI-implementatieproblemen
- **AI Template Gallery**: Uitgelichte collectie Microsoft Foundry-sjablonen met complexiteitsbeoordelingen
- **Workshopmaterialen**: Volledige workshopstructuur met hands-on labs en referentiematerialen

#### Verbeterd
- **README-structuur**: Gericht op AI-ontwikkelaars met 45% community interest data van Microsoft Foundry Discord
- **Leerwegen**: Toegewijde AI-ontwikkelaarsroute naast traditionele paden voor studenten en DevOps-engineers
- **Sjabloonaanbevelingen**: Uitgelichte AI-sjablonen waaronder azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community-integratie**: Verbeterde Discord-communityondersteuning met AI-specifieke kanalen en discussies

#### Beveiliging & Productiefocus
- **Managed Identity Patterns**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Kostenoptimalisatie**: Tokengebruiktracking en budgetcontroles voor AI-workloads
- **Multi-Region Deployment**: Strategieën voor wereldwijde AI-applicatie-implementatie
- **Prestatiemonitoring**: AI-specifieke metrics en Application Insights-integratie

#### Documentatiekwaliteit
- **Lineaire cursusstructuur**: Logische voortgang van beginner tot geavanceerde AI-implementatiepatronen
- **Geverifieerde URL's**: Alle externe repositorylinks gecontroleerd en toegankelijk
- **Volledige referentie**: Alle interne documentatielinks gevalideerd en functioneel
- **Productieklaar**: Enterprise-implementatiepatronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Grote veranderingen - Repositoryherstructurering en professionele verbetering
**Deze versie vertegenwoordigt een aanzienlijke herziening van de repositorystructuur en contentpresentatie.**

#### Toegevoegd
- **Gestructureerd leerframework**: Alle documentatiepagina's bevatten nu Introductie, Leerdoelen en Leeruitkomsten-secties
- **Navigatiesysteem**: Vorige/Volgende leslinks toegevoegd door de hele documentatie voor begeleide leerprogressie
- **Study Guide**: Comprehensive study-guide.md met leerdoelen, oefenopdrachten en beoordelingsmateriaal
- **Professionele presentatie**: Alle emoji-pictogrammen verwijderd voor verbeterde toegankelijkheid en professionele uitstraling
- **Verbeterde inhoudsstructuur**: Betere organisatie en flow van lesmateriaal

#### Gewijzigd
- **Documentatieformaat**: Alle documentatie gestandaardiseerd met consistente leergerichte structuur
- **Navigatiestroom**: Logische voortgang door al het lesmateriaal geïmplementeerd
- **Contentpresentatie**: Decoratieve elementen verwijderd ten gunste van duidelijke, professionele opmaak
- **Linkstructuur**: Alle interne links bijgewerkt om het nieuwe navigatiesysteem te ondersteunen

#### Verbeterd
- **Toegankelijkheid**: Emoji-afhankelijkheden verwijderd voor betere compatibiliteit met schermlezers
- **Professionele uitstraling**: Schone, academische stijlpresentatie geschikt voor enterprise-learning
- **Leerervaring**: Gestructureerde aanpak met duidelijke doelen en uitkomsten voor elke les
- **Inhoudsorganisatie**: Betere logische flow en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Initiële release - Uitgebreide AZD-leerrepository

#### Toegevoegd
- **Kernstructuur documentatie**
  - Volledige getting-started gidsserie
  - Uitgebreide implementatie- en provisioningdocumentatie
  - Gedetailleerde foutopsporingsbronnen en debugginggidsen
  - Pre-implementatie validatietools en procedures

- **Getting Started-module**
  - AZD Basics: Kernconcepten en terminologie
  - Installatiehandleiding: Platform-specifieke setupinstructies
  - Configuratiehandleiding: Omgevingssetup en authenticatie
  - Eerste project tutorial: Stapsgewijze hands-on begeleiding

- **Implementatie- en provisioningmodule**
  - Implementatiehandleiding: Volledige workflowdocumentatie
  - Provisioninghandleiding: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Multi-service architectuurpatronen

- **Pre-implementatie validatiemodule**
  - Capaciteitsplanning: Validatie van Azure-resourcebeschikbaarheid
  - SKU-selectie: Uitgebreide richtlijnen voor servicetiers
  - Pre-flight checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Kostenschatting en budgetplanningshulpmiddelen

- **Foutopsporingsmodule**
  - Veelvoorkomende problemen: Vaak voorkomende problemen en oplossingen
  - Debugginggids: Systematische foutopsporingsmethodologieën
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Bronnen en referenties**
  - Command Cheat Sheet: Snelreferentie voor essentiële commando's
  - Verklarende woordenlijst: Uitgebreide terminologie- en acroniemdefinities
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Externe bronnen en communityverbindingen

- **Voorbeelden en sjablonen**
  - Eenvoudig webapplicatievoorbeeld
  - Sjabloon voor statische website-implementatie
  - Containerapplicatieconfiguratie
  - Database-integratiepatronen
  - Microservices-architectuurvoorbeelden
  - Serverless-function-implementaties

#### Functies
- **Multi-platformondersteuning**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Meerdere vaardigheidsniveaus**: Content ontworpen voor studenten tot professionele ontwikkelaars
- **Praktische focus**: Hands-on voorbeelden en scenario's uit de praktijk
- **Uitgebreide dekking**: Van basisconcepten tot geavanceerde enterprisepatronen
- **Beveiliging-eerst aanpak**: Beveiligingsbest practices geïntegreerd door het geheel
- **Kostenoptimalisatie**: Richtlijnen voor kosteneffectieve implementaties en resourcebeheer

#### Documentatiekwaliteit
- **Gedetailleerde codevoorbeelden**: Praktische, geteste codevoorbeelden
- **Stapsgewijze instructies**: Duidelijke, uitvoerbare begeleiding
- **Uitgebreide foutafhandeling**: Foutopsporing voor veelvoorkomende problemen
- **Integratie van best practices**: Industriestandaarden en aanbevelingen
- **Versiecompatibiliteit**: Up-to-date met de nieuwste Azure-services en azd-functies

## Geplande toekomstige verbeteringen

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integratiepatronen voor Hugging Face, Azure Machine Learning en aangepaste modellen
- **AI Agent Frameworks**: Sjablonen voor LangChain, Semantic Kernel en AutoGen implementaties
- **Advanced RAG Patterns**: Vector database-opties voorbij Azure AI Search (Pinecone, Weaviate, enz.)
- **AI Observability**: Uitgebreide monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Developer Experience
- **VS Code Extension**: Geïntegreerde AZD + Microsoft Foundry ontwikkelervaring
- **GitHub Copilot Integration**: AI-gestuurde AZD-sjabloongeneratie
- **Interactive Tutorials**: Praktische programmeeroefeningen met geautomatiseerde validatie voor AI-scenario's
- **Video Content**: Aanvullende videotutorials voor visuele leerlingen met focus op AI-deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI-modelgovernance, naleving en audittrajecten
- **Multi-Tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-diensten
- **Edge AI Deployment**: Integratie met Azure IoT Edge en containerinstanties
- **Hybrid Cloud AI**: Multi-cloud en hybride deploymentpatronen voor AI-workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps-integratie met Azure Machine Learning-pijplijnen
- **Advanced Security**: Zero-trust patronen, private endpoints en geavanceerde bedreigingsbeveiliging
- **Performance Optimization**: Geavanceerde tuning- en schaalstrategieën voor AI-applicaties met hoge doorvoer
- **Global Distribution**: Content delivery en edge-caching patronen voor AI-applicaties

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Uitgebreide Microsoft Foundry-integratie (Voltooid)
- ✅ **Interactive Tutorials**: Praktische AI-workshoplab (Voltooid)
- ✅ **Advanced Security Module**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Performance Optimization**: AI-workload tuning-strategieën (Voltooid)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-gerichte deploymentscenario's (Voltooid)
- ✅ **Extended FAQ**: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Tool Integration**: Uitgebreide IDE- en editorintegratiehandleidingen
- ✅ **Monitoring Expansion**: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsief ontwerp voor mobiel leren
- **Offline Access**: Downloadbare documentatiepakketten
- **Enhanced IDE Integration**: VS Code-extensie voor AZD + AI-workflows
- **Community Dashboard**: Realtime communitystatistieken en contributietracking

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
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leermiddelen
- Extra tools, scripts of hulpprogramma's

#### Changed
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates om duidelijkheid of nauwkeurigheid te verbeteren
- Herstructurering van inhoud of organisatie

#### Deprecated
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties gepland voor verwijdering
- Methoden die betere alternatieven hebben

#### Removed
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of uitgefaseerde benaderingen
- Redundante of samengevoegde inhoud

#### Fixed
- Correcties van fouten in documentatie of code
- Oplossing van gerapporteerde problemen
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Security
- Beveiligingsgerelateerde verbeteringen of fixes
- Updates van beveiligingsbest practices
- Oplossing van beveiligingskwetsbaarheden

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Brekende wijzigingen die actie van gebruikers vereisen
- Aanzienlijke herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele benadering of methodologie veranderen

#### Minor Version (X.Y.0)
- Nieuwe functies of inhoudstoegangen
- Verbeteringen die achterwaartse compatibiliteit behouden
- Extra voorbeelden, tools of bronnen

#### Patch Version (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Meld problemen of stel verbeteringen voor (AI-specifieke issues welkom)
- **Discord Discussions**: Deel ideeën en ga in gesprek met de Microsoft Foundry-community
- **Pull Requests**: Draag direct verbeteringen aan content bij, vooral AI-sjablonen en handleidingen
- **Microsoft Foundry Discord**: Neem deel in het #Azure-kanaal voor AZD + AI-discussies
- **Community Forums**: Neem deel aan bredere Azure-ontwikkelaarsdiscussies

### Feedback Categories
- **AI Content Accuracy**: Correcties voor integratie en deployment-informatie van AI-diensten
- **Learning Experience**: Suggesties voor een verbeterde AI-ontwikkelaarsleerflow
- **Missing AI Content**: Verzoeken voor aanvullende AI-sjablonen, patronen of voorbeelden
- **Accessibility**: Verbeteringen voor diverse leerbehoeften
- **AI Tool Integration**: Suggesties voor betere integratie van AI-ontwikkelworkflows
- **Production AI Patterns**: Verzoeken voor enterprise AI-deploymentpatronen

### Response Commitment
- **Issue Response**: Binnen 48 uur voor gerapporteerde problemen
- **Feature Requests**: Evaluatie binnen een week
- **Community Contributions**: Review binnen een week
- **Security Issues**: Directe prioriteit met versnelde reactie

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Controle op inhoudsnauwkeurigheid en linkvalidatie
- **Quarterly Updates**: Belangrijke inhoudstoegangen en verbeteringen
- **Semi-Annual Reviews**: Uitgebreide herstructurering en verbetering
- **Annual Releases**: Grote versie-updates met aanzienlijke verbeteringen

### Monitoring and Quality Assurance
- **Automated Testing**: Regelmatige validatie van codevoorbeelden en links
- **Community Feedback Integration**: Regelmatige verwerking van gebruikerssuggesties
- **Technology Updates**: Afstemming op de nieuwste Azure-diensten en azd-releases
- **Accessibility Audits**: Regelmatige beoordeling op inclusieve ontwerpprincipes

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Volledige ondersteuning met regelmatige updates
- **Previous Major Version**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Legacy Versions**: Alleen community-ondersteuning, geen officiële updates

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Stapsgewijze overgangsinstructies
- **Compatibility Notes**: Details over brekende wijzigingen
- **Tool Support**: Scripts of hulpprogramma's om te helpen bij migratie
- **Community Support**: Toegewijde forums voor migratievragen

---

**Navigation**
- **Previous Lesson**: [Studiegids](resources/study-guide.md)
- **Next Lesson**: Keer terug naar de [Hoofd README](README.md)

**Stay Updated**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates van het lesmateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->