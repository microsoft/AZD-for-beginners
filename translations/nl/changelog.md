# Wijzigingslogboek - AZD voor Beginners

## Inleiding

Dit wijzigingslogboek documenteert alle noemenswaardige wijzigingen, updates en verbeteringen aan de AZD voor Beginners repository. We volgen principes van semantische versiebeheer en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, zul je:
- Op de hoogte blijven van nieuwe functies en toegevoegde inhoud
- Begrijpen welke verbeteringen zijn aangebracht aan bestaande documentatie
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het lesmateriaal in de loop van de tijd volgen

## Leerresultaten

Na het bekijken van de wijzigingen, zul je in staat zijn om:
- Nieuwe inhoud en beschikbare leermaterialen te identificeren
- Te begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leerpad te plannen op basis van het meest actuele materiaal
- Feedback en suggesties te leveren voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.19.1] - 2026-03-27

#### Verduidelijking onboarding voor beginners, validatie van installatie & laatste opruiming van AZD-commando's
**Deze versie bouwt voort op de AZD 1.23 validatie-sweep met een documentatiepass gericht op beginners: het verduidelijkt AZD-eerste authenticatieadvies, voegt lokale setup-validatiescripts toe, verifieert belangrijke commando's tegen de live AZD CLI, en verwijdert de laatste verouderde engelstalige commandoverwijzingen buiten het wijzigingslogboek.**

#### Toegevoegd
- **🧪 Validatiescripts voor beginnersinstelling** met `validate-setup.ps1` en `validate-setup.sh` zodat leerlingen de vereiste tools kunnen bevestigen voordat ze aan Hoofdstuk 1 beginnen
- **✅ Voorafgaande validatiestappen voor installatie** in de root README en Hoofdstuk 1 README zodat ontbrekende vereisten worden opgespoord vóór `azd up`

#### Gewijzigd
- **🔐 Authenticatieadvies voor beginners** behandelt nu consequent `azd auth login` als het primaire pad voor AZD-workflows, waarbij `az login` wordt genoemd als optioneel tenzij Azure CLI-commando's direct worden gebruikt
- **📚 Onboarding-flow van Hoofdstuk 1** verwijst nu naar het valideren van de lokale setup vóór installatie, authenticatie en de eerste implementatiestappen
- **🛠️ Validator-berichten** scheiden nu duidelijk blokkerende vereisten van optionele Azure CLI-waarschuwingen voor het alleen-AZD beginnerspad
- **📖 Configuratie-, probleemoplossings- en voorbeelddocumenten** maken nu onderscheid tussen vereiste AZD-authenticatie en optionele Azure CLI-aanmelding waar beide eerder zonder context werden gepresenteerd

#### Opgelost
- **📋 Overgebleven engelstalige commandoverwijzingen** bijgewerkt naar actuele AZD-vormen, inclusief `azd config show` in de spiekbrief en `azd monitor --overview` waar Azure Portal overview-richtlijnen werden bedoeld
- **🧭 Claims voor beginners in Hoofdstuk 1** afgezwakt om het overbeloven van gegarandeerd foutloos gedrag of rollback over alle sjablonen en Azure-resources te vermijden
- **🔎 Live CLI-validatie** bevestigde huidige ondersteuning voor `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, en `azd down --force --purge`

#### Bijgewerkte bestanden
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

#### AZD 1.23.12 validatie, uitbreiding workshopomgeving & AI-modelvernieuwing
**Deze versie voert een documentatievalidatie uit tegen `azd` `1.23.12`, werkt verouderde AZD-commandovoorbeelden bij, vernieuwt AI-modelrichtlijnen naar huidige defaults en breidt de workshopinstructies uit voorbij GitHub Codespaces naar ook dev-containers en lokale clones.**

#### Toegevoegd
- **✅ Validatie-opmerkingen in kernhoofdstukken en workshopdocs** om de geteste AZD-basislijn expliciet te maken voor leerlingen die nieuwere of oudere CLI-builds gebruiken
- **⏱️ Richtlijnen voor deployment-timeouts** voor langlopende AI-app-implementaties met `azd deploy --timeout 1800`
- **🔎 Stappen voor extensie-inspectie** met `azd extension show azure.ai.agents` in AI-workflowdocumentatie
- **🌐 Breder workshopomgevingadvies** dat GitHub Codespaces, dev-containers en lokale clones met MkDocs omvat

#### Gewijzigd
- **📚 Intro-README's van hoofdstukken** vermelden nu consequent validatie tegen `azd 1.23.12` in foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting en production secties
- **🛠️ AZD-commandoverwijzingen** bijgewerkt naar huidige vormen in de docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` of `azd env get-value(s)` afhankelijk van de context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` waar een Application Insights overview bedoeld is
- **🧪 Voorbeeldsen provision preview** vereenvoudigd naar huidige ondersteunde gebruik zoals `azd provision --preview` en `azd provision --preview -e production`
- **🧭 Workshopflow** bijgewerkt zodat leerlingen de labs kunnen voltooien in Codespaces, een dev-container of een lokale clone in plaats van aan te nemen dat alleen Codespaces wordt gebruikt
- **🔐 Authenticatieadvies** geeft nu de voorkeur aan `azd auth login` voor AZD-workflows, met `az login` gepositioneerd als optioneel wanneer Azure CLI-commando's direct worden gebruikt

#### Opgelost
- **🪟 Windows-installatiecommando's** genormaliseerd naar de huidige `winget` pakket-casing in de installatiegids
- **🐧 Linux-installatieadvies** gecorrigeerd om niet-ondersteunde distro-specifieke `azd` package manager-instructies te vermijden en in plaats daarvan naar release-assets te verwijzen waar passend
- **📦 AI-modelvoorbeelden** vernieuwd van oudere defaults zoals `gpt-35-turbo` en `text-embedding-ada-002` naar actuele voorbeelden zoals `gpt-4.1-mini`, `gpt-4.1`, en `text-embedding-3-large`
- **📋 Deployment- en diagnostieksnippets** gecorrigeerd om huidige environment- en statuscommando's in logs, scripts en probleemoplossingsstappen te gebruiken
- **⚙️ GitHub Actions-richtlijnen** bijgewerkt van `Azure/setup-azd@v1.0.0` naar `Azure/setup-azd@v2`
- **🤖 MCP/Copilot toestemmingsadvies** bijgewerkt van `azd mcp consent` naar `azd copilot consent list`

#### Verbeterd
- **🧠 AI-hoofdstukrichtlijnen** leggen nu beter uit hoe preview-gevoelig `azd ai`-gedrag is, tenant-specifieke aanmelding, huidig gebruik van extensies en bijgewerkte model-implementatieaanbevelingen
- **🧪 Workshopinstructies** gebruiken nu realistischere versievoorbeelden en duidelijkere taal voor het opzetten van de omgeving voor hands-on labs
- **📈 Productie- en probleemoplossingsdocs** sluiten nu beter aan op huidige monitoring-, fallback-model- en kostenlaagvoorbeelden

#### Bijgewerkte bestanden
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

#### AZD AI CLI-commando's, contentvalidatie & sjabloonuitbreiding
**Deze versie voegt dekking toe voor `azd ai`, `azd extension` en `azd mcp` commando's in alle AI-gerelateerde hoofdstukken, repareert gebroken links en verouderde code in agents.md, werkt de spiekbrief bij en herwerkt de sectie Voorbeeldsjablonen met gevalideerde beschrijvingen en nieuwe Azure AI AZD-sjablonen.**

#### Toegevoegd
- **🤖 AZD AI CLI-dekking** in 7 bestanden (voorheen alleen in Hoofdstuk 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nieuwe sectie "Extensies en AI-commando's" die `azd extension`, `azd ai agent init` en `azd mcp` introduceert
  - `docs/chapter-02-ai-development/agents.md` — Optie 4: `azd ai agent init` met vergelijkingstabel (template- versus manifest-aanpak)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecties "AZD-extensies voor Foundry" en "Agent-Eerst Implementatie"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start toont nu zowel template- als manifest-gebaseerde implementatiepaden
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sectie bevat nu ook de optie `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsectie "AZD AI-extensiecommando's voor diagnostiek"
  - `resources/cheat-sheet.md` — Nieuwe sectie "AI & Extensies Commando's" met `azd extension`, `azd ai agent init`, `azd mcp`, en `azd infra generate`
- **📦 Nieuwe AZD AI-voorbeeldsjablonen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat met Blazor WebAssembly, Semantic Kernel en spraakchat-ondersteuning
  - **azure-search-openai-demo-java** — Java RAG-chat met Langchain4J met ACA/AKS-implementatie-opties
  - **contoso-creative-writer** — Multi-agent creatieve schrijfapp met Azure AI Agent Service, Bing Grounding en Prompty
  - **serverless-chat-langchainjs** — Serverless RAG met Azure Functions + LangChain.js + Cosmos DB en Ollama lokale ontwikkelondersteuning
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator met admin-portal, Teams-integratie en PostgreSQL/Cosmos DB-opties
  - **azure-ai-travel-agents** — Multi-agent MCP-orchestratie referentie-app met servers in .NET, Python, Java en TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastructuur Bicep starter-sjabloon
  - **🔗 Awesome AZD AI-galerij link** — Verwijzing naar de [awesome-azd AI-galerij](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Opgelost
- **🔗 agents.md navigatie**: Vorige/Volgende-links komen nu overeen met de lesvolgorde uit de Hoofdstuk 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md gebroken links**: `production-ai-practices.md` gecorrigeerd naar `../chapter-08-production/production-ai-practices.md` (3 voorkomens)
- **📦 agents.md verouderde code**: `opencensus` vervangen door `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ongeldige API**: `max_tokens` verplaatst van `create_agent()` naar `create_run()` als `max_completion_tokens`
- **🔢 agents.md token telling**: Rough `len//4` schatting vervangen door `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Services gecorrigeerd van "Cognitive Search + App Service" naar "Azure AI Search + Azure Container Apps" (standaard host gewijzigd in okt 2024)
- **contoso-chat**: Beschrijving bijgewerkt om te verwijzen naar Azure AI Foundry + Prompty, overeenkomend met de eigenlijke titel en tech stack van de repo

#### Verwijderd
- **ai-document-processing**: Niet-functionele sjabloonverwijzing verwijderd (repo niet publiek toegankelijk als een AZD-sjabloon)

#### Verbeterd
- **📝 agents.md oefeningen**: Oefening 1 toont nu de verwachte output en de `azd monitor` stap; Oefening 2 bevat volledige `FunctionTool` registratiecode; Oefening 3 vervangt vage aanwijzingen door concrete `prepdocs.py` commando's
- **📚 agents.md resources**: Bijgewerkte documentatielinks naar de huidige Azure AI Agent Service-documentatie en quickstart
- **📋 agents.md Next Steps table**: AI Workshop Lab-link toegevoegd voor volledige hoofdstukdekking

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
**Deze versie verbetert de hoofdstuknavigatie van README.md met een verbeterd tabelopmaak.**

#### Gewijzigd
- **Cursuskaarttabel**: Verbeterd met directe leslinks, geschatte duur en complexiteitsbeoordelingen
- **Mapopschoning**: Verwijderde overbodige oude mappen (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidatie**: Alle 21+ interne links in de Cursuskaarttabel geverifieerd

### [v3.16.0] - 2026-02-05

#### Productnaamupdates
**Deze versie werkt productverwijzingen bij naar de huidige Microsoft-branding.**

#### Gewijzigd
- **Microsoft Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt in niet-vertalingsbestanden
- **Azure AI Agent Service → Foundry Agents**: Servicenaam bijgewerkt om de huidige branding weer te geven

#### Bestanden bijgewerkt
- `README.md` - Hoofdpagina van de cursus
- `changelog.md` - Versiegeschiedenis
- `course-outline.md` - Cursusstructuur
- `docs/chapter-02-ai-development/agents.md` - Gids voor AI-agents
- `examples/README.md` - Voorbeelden documentatie
- `workshop/README.md` - Landingspagina van de workshop
- `workshop/docs/index.md` - Workshopindex
- `workshop/docs/instructions/*.md` - Alle instructiebestanden van de workshop

---

### [v3.15.0] - 2026-02-05

#### Grote repositoryherstructurering: hoofdstuk-gebaseerde mapnamen
**Deze versie herstructureert de documentatie in speciale hoofdstukmappen voor duidelijkere navigatie.**

#### Mapnaamwijzigingen
Oude mappen zijn vervangen door hoofdstuk-genummerde mappen:
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
  - Lesentabel met beschrijvingen
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

#### Nieuwe AI-agentsgids
**Deze versie voegt een uitgebreide gids toe voor het implementeren van AI-agents met de Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids met:
  - Wat AI-agents zijn en hoe ze verschillen van chatbots
  - Drie snelstartagent-sjablonen (Foundry Agents, Prompty, RAG)
  - Architectuurpatronen voor agents (enkele agent, RAG, multi-agent)
  - Toolconfiguratie en maatwerk
  - Monitoring en het bijhouden van statistieken
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende probleemoplossingsscenario's
  - Drie hands-on oefeningen met succescriteria

#### Inhoudsstructuur
- **Introductie**: Agentconcepten voor beginners
- **Snelstart**: Implementeer agents met `azd init --template get-started-with-ai-agents`
- **Architectuurpatronen**: Visuele diagrammen van agentpatronen
- **Configuratie**: Toolconfiguratie en omgevingsvariabelen
- **Monitoring**: Integratie met Application Insights
- **Oefeningen**: Progressief hands-on leren (20-45 minuten elk)

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
  - `node:20` (LTS-versie voor AZD-sjablonen)
  - `github-cli` voor sjabloonbeheer
  - `docker-in-docker` voor container-app-implementaties

- **🔌 Poortdoorsturing**: Vooraf geconfigureerde poorten voor veelvoorkomende ontwikkeling:
  - 8000 (MkDocs-voorvertoning)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nieuwe VS Code-extensies**:
  - `ms-python.vscode-pylance` - Verbeterde Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Ondersteuning voor Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-ondersteuning
  - `ms-azuretools.vscode-bicep` - Bicep-taalondersteuning
  - `ms-azure-devtools.azure-resource-groups` - Beheer van Azure-resources
  - `yzhang.markdown-all-in-one` - Markdown-bewerking
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramondersteuning
  - `redhat.vscode-yaml` - YAML-ondersteuning (voor azure.yaml)
  - `eamodio.gitlens` - Git-visualisatie
  - `mhutchie.git-graph` - Git-geschiedenis

- **⚙️ VS Code-instellingen**: Standaardinstellingen toegevoegd voor Python-interpreter, automatisch formatteren bij opslaan en het verwijderen van overtollige witruimte

- **📦 Bijgewerkte requirements-dev.txt**:
  - MkDocs-minify-plugin toegevoegd
  - pre-commit toegevoegd voor codekwaliteit
  - Azure SDK-pakketten toegevoegd (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create-opdracht**: Verifieert nu de installatie van AZD en Azure CLI bij het starten van de container

---

### [v3.11.0] - 2026-02-05

#### Beginnersvriendelijke README-herziening
**Deze versie verbetert README.md aanzienlijk om toegankelijker te zijn voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Azure CLI versus AZD Vergelijking**: Duidelijke uitleg wanneer je elk hulpprogramma moet gebruiken met praktische voorbeelden
- **🌟 Geweldige AZD-links**: Directe links naar de community-sjabloongalerij en bijdragebronnen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ kant-en-klare sjablonen voor implementatie
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Communitybijdrage
- **🎯 Snelstartgids**: Vereenvoudigde 3-stappen introductie (Installeren → Inloggen → Implementeren)
- **📊 Ervaringsgebaseerde navigatietabel**: Duidelijke begeleiding waar te beginnen op basis van ontwikkelaarservaring

#### Gewijzigd
- **README-structuur**: Herschikt voor stapsgewijze toelichting - kerninformatie eerst
- **Inleidingssectie**: Herschreven om "The Magic of `azd up`" uit te leggen voor absolute beginners
- **Dubbele inhoud verwijderd**: Dubbele probleemoplossingssectie verwijderd
- **Probleemoplossingsopdrachten**: `azd logs` verwijzing gecorrigeerd naar geldig `azd monitor --logs`

#### Opgelost
- **🔐 Authenticatieopdrachten**: `azd auth login` en `azd auth logout` toegevoegd aan cheat-sheet.md
- **Ongeldige opdrachtverwijzingen**: Resterende `azd logs` verwijderd uit de README-probleemoplossingssectie

#### Opmerkingen
- **Omvang**: Wijzigingen toegepast op hoofd-README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen specifiek gericht op ontwikkelaars nieuw met AZD

---

### [v3.10.0] - 2026-02-05

#### Update nauwkeurigheid Azure Developer CLI-opdrachten
**Deze versie corrigeert niet-bestaande AZD-opdrachten door de documentatie, zodat alle codevoorbeelden geldige Azure Developer CLI-syntaxis gebruiken.**

#### Opgelost
- **🔧 Niet-bestaande AZD-opdrachten verwijderd**: Uitgebreide controle en correctie van ongeldige opdrachten:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI-alternatieven
  - `azd service` subcommands (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` flags (bestaan niet) → bijgewerkt naar gebruik van `--preview`
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bestanden bijgewerkt met opdrachtcorrecties**:
  - `resources/cheat-sheet.md`: Grote revisie van opdrachtreferentie
  - `docs/deployment/deployment-guide.md`: Rollback- en implementatiestrategieën gecorrigeerd
  - `docs/troubleshooting/debugging.md`: Loganalyzesecties gecorrigeerd
  - `docs/troubleshooting/common-issues.md`: Troubleshooting-opdrachten bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-debuggedeelte gecorrigeerd
  - `docs/getting-started/azd-basics.md`: Monitoring-opdrachten gecorrigeerd
  - `docs/getting-started/first-project.md`: Monitoring- en debuggingvoorbeelden bijgewerkt
  - `docs/getting-started/installation.md`: Help- en versievoorbeelden gecorrigeerd
  - `docs/pre-deployment/application-insights.md`: Logweergave-opdrachten gecorrigeerd
  - `docs/pre-deployment/coordination-patterns.md`: Agent-debugopdrachten gecorrigeerd

#### Gewijzigd
- **Rollbackstrategieën**: Documentatie bijgewerkt om Git-gebaseerde rollback te gebruiken (AZD heeft geen native rollback)
- **Logweergave**: `azd logs` verwijzingen vervangen door `azd monitor --logs`, `azd monitor --live` en Azure CLI-opdrachten
- **Prestatiegedeelte**: Niet-bestaande parallelle/incrementiële implementatieflags verwijderd, geldige alternatieven aangeboden

#### Technische details
- **Geldige AZD-commando's**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor vlaggen**: `--live`, `--logs`, `--overview`
- **Verwijderde functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opmerkingen
- **Verificatie**: Commando's gevalideerd tegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Voltooiing van workshop en update van documentatiekwaliteit
**Deze versie voltooit de interactieve workshopmodules, repareert alle gebroken documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuw document met richtlijnen voor bijdragen met:
  - Duidelijke instructies voor het melden van problemen en het voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commitberichten
  - Informatie over communitybetrokkenheid

#### Voltooid
- **🎯 Workshop Module 7 (Wrap-up)**: Volledig voltooid afrondingsmodule met:
  - Uitgebreide samenvatting van workshopprestaties
  - Sectie met belangrijke beheerde concepten over AZD, templates en Microsoft Foundry
  - Aanbevelingen voor voortzetting van het leertraject
  - Workshop-uitdagingsoefeningen met moeilijkheidsbeoordelingen
  - Links voor communityfeedback en ondersteuning

- **📚 Workshop Module 3 (Deconstruct)**: Bijgewerkte leerdoelen met:
  - GitHub Copilot met MCP-servers activatie-instructies
  - Inzicht in AZD template mapstructuur
  - Organisatiepatronen voor Infrastructure-as-Code (Bicep)
  - Hands-on labinstructies

- **🔧 Workshop Module 6 (Teardown)**: Voltooid met:
  - Doelstellingen voor het opruimen van resources en kostenbeheer
  - Gebruik van `azd down` voor veilige deprovisioning van infrastructuur
  - Gids voor herstel van soft-deleted cognitive services
  - Bonusverkenningsprompten voor GitHub Copilot en Azure Portal

#### Opgelost
- **🔗 Opgeloste gebroken links**: 15+ gebroken interne documentatielinks opgelost:
  - `docs/ai-foundry/ai-model-deployment.md`: Paden naar microsoft-foundry-integration.md gecorrigeerd
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md en production-ai-practices.md paden gecorrigeerd
  - `docs/getting-started/first-project.md`: Niet-bestaande cicd-integration.md vervangen door deployment-guide.md
  - `examples/retail-scenario.md`: FAQ- en probleemoplossingsgids-paden gecorrigeerd
  - `examples/container-app/microservices/README.md`: Course home- en deployment guide-paden gecorrigeerd
  - `resources/faq.md` en `resources/glossary.md`: AI-hoofdstukverwijzingen bijgewerkt
  - `course-outline.md`: Instructor guide- en AI workshop lab-verwijzingen gecorrigeerd

- **📅 Workshop Status Banner**: Bijgewerkt van "Under Construction" naar actieve workshopstatus met datum februari 2026

- **🔗 Workshop Navigation**: Gebroken navigatielinks in workshop README.md hersteld die verwezen naar de niet-bestaande map lab-1-azd-basics

#### Gewijzigd
- **Workshop Presentatie**: Verwijderd "under construction" waarschuwing, workshop is nu voltooid en klaar voor gebruik
- **Navigatieconsistentie**: Zorgen dat alle workshopmodules juiste inter-module navigatie hebben
- **Verwijzingen in het leerpad**: Hoofdstuk kruisverwijzingen bijgewerkt om de juiste microsoft-foundry-paden te gebruiken

#### Gevalideerd
- ✅ Alle Engelse markdown-bestanden hebben geldige interne links
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules functioneert correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Taal en structuur blijven beginner-vriendelijk
- ✅ CONTRIBUTING.md biedt duidelijke richtlijnen voor communitybijdragers

#### Technische implementatie
- **Link Validatie**: Geautomatiseerd PowerShell-script heeft alle .md interne links geverifieerd
- **Content Audit**: Handmatige controle van workshopvolledigheid en geschiktheid voor beginners
- **Navigatiesysteem**: Consistente hoofdstuk- en module-navigatiepatronen toegepast

#### Opmerkingen
- **Reikwijdte**: Wijzigingen alleen toegepast op Engelse documentatie
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (geautomatiseerde vertaling wordt later gesynchroniseerd)
- **Duur van workshop**: Volledige workshop biedt nu 3-4 uur hands-on leren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde documentatie: monitoring, beveiliging en multi-agentpatronen
**Deze versie voegt uitgebreide A-grade lessen toe over Application Insights-integratie, authenticatiepatronen en multi-agentcoördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-georiënteerde uitrol met automatische provisioning
  - Volledige Bicep-templates voor Application Insights + Log Analytics
  - Werkende Python-applicaties met aangepaste telemetrie (1,200+ lines)
  - AI/LLM-monitoringpatronen (Microsoft Foundry Models token/kostentracking)
  - 6 Mermaid-diagrammen (architectuur, gedistribueerde tracing, telemetrieflow)
  - 3 hands-on oefeningen (waarschuwingen, dashboards, AI-monitoring)
  - Kusto-queryvoorbeelden en kostenoptimalisatiestrategieën
  - Live metrics-streaming en realtime debugging
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Volledige Bicep-infrastructuurtemplates voor veilige uitrol
  - Node.js applicatiecode met Azure SDK-integratie
  - 3 volledige oefeningen (managed identity inschakelen, user-assigned identity, Key Vault-rotatie)
  - Best practices voor beveiliging en RBAC-configuraties
  - Probleemoplossingsgids en kostenanalyse
  - Productieklare wachtwoordloze authenticatiepatronen

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, event-driven, consensus)
  - Volledige orchestrator-service-implementatie (Python/Flask, 1,500+ lines)
  - 3 gespecialiseerde agentimplementaties (Research, Writer, Editor)
  - Service Bus-integratie voor message queuing
  - Cosmos DB state management voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 geavanceerde oefeningen (timeout handling, retry logic, circuit breaker)
  - Kostenoverzicht ($240-565/month) met optimalisatiestrategieën
  - Application Insights-integratie voor monitoring

#### Uitgebreid
- **Pre-deployment Hoofdstuk**: Bevat nu uitgebreide monitoring- en coördinatiepatronen
- **Getting Started Hoofdstuk**: Uitgebreid met professionele authenticatiepatronen
- **Productieklaarheid**: Volledige dekking van beveiliging tot observeerbaarheid
- **Cursusoverzicht**: Bijgewerkt met verwijzingen naar nieuwe lessen in Hoofdstukken 3 en 6

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring door de cursus heen
- **Documentatiekwaliteit**: Consistente A-grade standaarden (95-97%) voor nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor enterprise-implementaties

#### Verbeterd
- **Developer Experience**: Duidelijk pad van ontwikkeling naar productiemonitoring
- **Beveiligingsnormen**: Professionele patronen voor authenticatie en geheimbeheer
- **Observeerbaarheid**: Volledige Application Insights-integratie met AZD
- **AI Workloads**: Gespecialiseerde monitoring voor Microsoft Foundry Models en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen fragmenten)
- ✅ Mermaid-diagrammen voor visueel leren (19 in totaal over 3 lessen)
- ✅ Hands-on oefeningen met verificatiestappen (9 in totaal)
- ✅ Productieklare Bicep-templates inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Probleemoplossingsgidsen en best practices
- ✅ Kenniscontroles met verificatieopdrachten

#### Documentatiebeoordelingsresultaten
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringgids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agentarchitecturen
- **Algemene nieuwe inhoud**: - Consistente hoge kwaliteitsstandaarden

#### Technische implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + gedistribueerde tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live metrics + Kusto-queries + alerts + dashboards
- **Kostenbeheer**: Samplingstrategieën, retentiebeleid, budgetcontroles

### [v3.7.0] - 2025-11-19

#### Verbeteringen in documentatiekwaliteit en nieuw Microsoft Foundry Models-voorbeeld
**Deze versie verbetert de documentatiekwaliteit in de hele repository en voegt een volledig voorbeeld toe voor het inzetten van Microsoft Foundry Models met een gpt-4.1 chatinterface.**

#### Toegevoegd
- **🤖 Microsoft Foundry Models Chat Example**: Volledige gpt-4.1-implementatie met werkende uitvoering in `examples/azure-openai-chat/`:
  - Volledige Microsoft Foundry Models-infrastructuur (gpt-4.1 model-implementatie)
  - Python command-line chatinterface met conversatiegeschiedenis
  - Key Vault-integratie voor veilige opslag van API-sleutels
  - Tracking van tokengebruik en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiehandleiding
  - 11 productieklare bestanden (Bicep-templates, Python-app, configuratie)
- **📚 Documentatieoefeningen**: Hands-on praktijkoefeningen toegevoegd aan de configuratiegids:
  - Oefening 1: Multi-environment configuratie (15 minuten)
  - Oefening 2: Geheimbeheer oefening (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Deploy-verificatie**: Verificatiesectie toegevoegd aan deployment guide:
  - Health check-procedures
  - Checklist met succescriteria
  - Verwachte outputs voor alle deployment-opdrachten
  - Snelreferentie voor probleemoplossing

#### Uitgebreid
- **examples/README.md**: Bijgewerkt naar A-grade kwaliteit (93%):
  - azure-openai-chat toegevoegd aan alle relevante secties
  - Aantal lokale voorbeelden bijgewerkt van 3 naar 4
  - Toegevoegd aan de AI Application Examples-tabel
  - Geïntegreerd in Quick Start voor intermediate gebruikers
  - Toegevoegd aan Microsoft Foundry Templates-sectie
  - Vergelijkingsmatrix en technologiezoeksecties bijgewerkt
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) over docs-map:
  - Verwachte outputs toegevoegd aan kritieke commandovoorbeelden
  - Verificatiestappen opgenomen voor configuratiewijzigingen
  - Verbeterde hands-on leermogelijkheden met praktische oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor intermediate learners
- **Documentatiestructuur**: Meer actiegerichte oefeningen met duidelijke uitkomsten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Developer Experience**: Microsoft Foundry Models-implementatie duurt nu 35-45 minuten (tegenover 60-90 voor complexere alternatieven)
- **Kostentransparantie**: Duidelijke kostenramingen ($50-200/month) voor het Microsoft Foundry Models-voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben een duidelijk instappunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte outputs en verificatiestappen

#### Gevalideerd
- ✅ Microsoft Foundry Models-voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden zijn syntactisch correct
- ✅ README-instructies komen overeen met daadwerkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op 8+ locaties
- ✅ Voorbeeldenindex weerspiegelt nauwkeurig 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatieverwijzingen correct

#### Technische implementatie
- **Microsoft Foundry Models Architectuur**: gpt-4.1 + Key Vault + Container Apps-patroon
- **Beveiliging**: Managed Identity klaar, geheimen in Key Vault
- **Monitoring**: Application Insights-integratie
- **Kostenbeheer**: Tokentracking en gebruiksoptimalisatie
- **Deploy**: Enkele `azd up`-opdracht voor volledige setup

### [v3.6.0] - 2025-11-19

#### Grote update: Container App deployment-voorbeelden
**Deze versie introduceert uitgebreide, productieklare voorbeelden voor de uitrol van containerapplicaties met behulp van Azure Developer CLI (AZD), met volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App Examples**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Volledig overzicht van containerized deployments, quick start, productie en geavanceerde patronen
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginnersvriendelijke REST API met scale-to-zero, health probes, monitoring en probleemoplossing
  - [Microservices Architecture](../../examples/container-app/microservices): Productieklare multi-service uitrol (API Gateway, Product, Order, User, Notification), asynchrone messaging, Service Bus, Cosmos DB, Azure SQL, gedistribueerde tracing, blue-green/canary deployment
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD-richtlijnen voor containerworkloads
- **Codevoorbeelden**: Volledige `azure.yaml`, Bicep-templates en meertalige service-implementaties (Python, Node.js, C#, Go)
- **Testen & Probleemoplossing**: End-to-end tests, monitoring-opdrachten, probleemoplossingsgids

#### Gewijzigd
- **
- **README.md**: Bijgewerkt om nieuwe containerapp-voorbeelden weer te geven en te linken onder "Local Examples - Container Applications"
- **examples/README.md**: Bijgewerkt om containerapp-voorbeelden uit te lichten, vergelijkingsmatrixvermeldingen toe te voegen en technologie-/architectuurverwijzingen bij te werken
- **Course Outline & Study Guide**: Bijgewerkt om naar nieuwe containerapp-voorbeelden en implementatiepatronen te verwijzen in relevante hoofdstukken

#### Validated
- ✅ Alle nieuwe voorbeelden inzetbaar met `azd up` en volgen de beste praktijken
- ✅ Documentatie kruisverwijzingen en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken scenario's van beginner tot gevorderd, inclusief productie-microservices

#### Notes
- **Scope**: Alleen Engelse documentatie en voorbeelden
- **Next Steps**: Uitbreiden met aanvullende geavanceerde containerpatronen en CI/CD-automatisering in toekomstige releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Deze versie voert een uitgebreide productnaamswijziging uit van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, ter weerspiegeling van Microsofts officiële rebranding.**

#### Changed
- **🔄 Product Name Update**: Volledige rebranding van "Microsoft Foundry" naar "Microsoft Foundry"
  - Bijgewerkt alle verwijzingen in de Engelse documentatie in de map `docs/`
  - Hernoemde map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Hernoemd bestand: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsverwijzingen bijgewerkt in 7 documentbestanden

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen bijgewerkt om de nieuwe mapstructuur weer te geven
  - Navigatielinks gevalideerd in de volledige documentatie

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links bijgewerkt om naar de nieuwe bestandsnaam te verwijzen

#### Updated Files
- **Chapter Documentation** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielinkwijzigingen
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamverwijzingen bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Gebruikt al Microsoft Foundry (van eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen bijgewerkt (overzicht, communityfeedback, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingslinks bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 volgende hoofdstuklinks bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Course Structure Files** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursusoverzicht, hoofdstuktitels, sjabloonsectie, communityinzichten)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukbronnen)

#### Validated
- ✅ Geen resterende "ai-foundry" map padverwijzingen in de Engelse docs
- ✅ Geen resterende "Microsoft Foundry" productnaamverwijzingen in de Engelse docs
- ✅ Alle navigatielinks functioneel met de nieuwe mapstructuur
- ✅ Bestands- en maphernoemingen succesvol voltooid
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Notes
- **Scope**: Wijzigingen toegepast op Engelse documentatie in de map `docs/` alleen
- **Translations**: Vertaalmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmaterialen (`workshop/`) niet bijgewerkt in deze versie
- **Examples**: Voorbeeldbestanden kunnen nog legacy-namen bevatten (wordt in een toekomstige update aangepakt)
- **External Links**: Externe URL's en GitHub-referenties blijven ongewijzigd

#### Migration Guide for Contributors
Als je lokale branches of documentatie hebt die naar de oude structuur verwijzen:
1. Werk mapverwijzingen bij: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Werk bestandsverwijzingen bij: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Valideer dat alle interne documentatielinks nog steeds werken

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe Azure Developer CLI preview-functie en verbetert de workshopgebruikerservaring.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Uitgebreide dekking van de nieuwe infrastructuur-previewfunctionaliteit
  - Commanreferentie en gebruiksvoorbeelden in het cheat sheet
  - Gedetailleerde integratie in de provisioninggids met use-cases en voordelen
  - Pre-flight check-integratie voor veiligere implementatievalidatie
  - Getting-started gidsupdates met safety-first implementatiepraktijken
- **🚧 Workshop Status Banner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Gradientontwerp met constructie-indicatoren voor duidelijke communicatie naar gebruikers
  - Laatst bijgewerkte tijdstempel voor transparantie
  - Mobiel-responsief ontwerp voor alle apparaattype

#### Enhanced
- **Infrastructure Safety**: Preview-functionaliteit geïntegreerd doorheen de implementatiedocumentatie
- **Pre-deployment Validation**: Geautomatiseerde scripts bevatten nu infrastructuur-previewtesten
- **Developer Workflow**: Bijgewerkte commandoreeksen om preview als beste praktijk op te nemen
- **Workshop Experience**: Duidelijke verwachtingen gecommuniceerd aan gebruikers over de inhoudsontwikkelingsstatus

#### Changed
- **Deployment Best Practices**: Preview-first workflow nu aanbevolen aanpak
- **Documentation Flow**: Infrastructuurvalidatie verplaatst naar een vroeger stadium in het leerproces
- **Workshop Presentation**: Professionele statuscommunicatie met duidelijk ontwikkelingsschema

#### Improved
- **Safety-First Approach**: Infrastructuurwijzigingen kunnen nu gevalideerd worden vóór implementatie
- **Team Collaboration**: Preview-resultaten kunnen gedeeld worden voor review en goedkeuring
- **Cost Awareness**: Beter inzicht in resourcekosten vóór provisioning
- **Risk Mitigation**: Minder implementatiefouten door voorafgaande validatie

#### Technical Implementation
- **Multi-document Integration**: Preview-functie gedocumenteerd in 4 kernbestanden
- **Command Patterns**: Consistente syntaxis en voorbeelden in de hele documentatie
- **Best Practice Integration**: Preview opgenomen in validatieworkflows en scripts
- **Visual Indicators**: Duidelijke NIEUW-functiemarkeringen voor vindbaarheid

#### Workshop Infrastructure
- **Status Communication**: Professionele HTML-banner met gradient-styling
- **User Experience**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professional Presentation**: Behoudt de geloofwaardigheid van de repository terwijl verwachtingen worden gezet
- **Timeline Transparency**: Oktober 2025 laatst bijgewerkte tijdstempel voor verantwoording

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve gidsen en gestructureerde leerroutes.**

#### Added
- **🎥 Interactive Workshop Guide**: Browsergebaseerde workshopervaring met MkDocs-previewfunctionaliteit
- **📝 Structured Workshop Instructions**: 7-staps begeleide leerroute van ontdekking tot aanpassing
  - 0-Introduction: Workshopoverzicht en setup
  - 1-Select-AI-Template: Sjabloonontdekking en selectieproces
  - 2-Validate-AI-Template: Implementatie- en validatieprocedures
  - 3-Deconstruct-AI-Template: Begrijpen van sjabloonarchitectuur
  - 4-Configure-AI-Template: Configuratie en aanpassing
  - 5-Customize-AI-Template: Geavanceerde aanpassingen en iteraties
  - 6-Teardown-Infrastructure: Opruimen en resourcebeheer
  - 7-Wrap-up: Samenvatting en volgende stappen
- **🛠️ Workshop Tooling**: MkDocs-configuratie met Material-thema voor verbeterde leerervaring
- **🎯 Hands-On Learning Path**: 3-stappenmethodologie (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Naadloze ontwikkelomgevingsetup

#### Enhanced
- **AI Workshop Lab**: Uitgebreid met een uitgebreide 2-3 uur durende gestructureerde leerervaring
- **Workshop Documentation**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Learning Progression**: Duidelijke stapsgewijze begeleiding van sjabloonselectie tot productie-implementatie
- **Developer Experience**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Improved
- **Accessibility**: Browsergebaseerde interface met zoek-, kopieerfunctionaliteit en thema-toggle
- **Self-Paced Learning**: Flexibele workshopstructuur die verschillende leertempo's ondersteunt
- **Practical Application**: Praktijkgerichte AI-sjabloonimplementatiescenario's
- **Community Integration**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshop Features
- **Built-in Search**: Snelle zoekopdrachten naar trefwoorden en lessen
- **Copy Code Blocks**: Hover-to-copy functionaliteit voor alle codevoorbeelden
- **Theme Toggle**: Donker/licht modusondersteuning voor verschillende voorkeuren
- **Visual Assets**: Screenshots en diagrammen voor verbeterd begrip
- **Help Integration**: Directe Discord-toegang voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Deze versie introduceert een uitgebreid hoofdstukgebaseerd leersysteem met verbeterde navigatie door de hele repository.**

#### Added
- **📚 Chapter-Based Learning System**: De hele cursus hergestructureerd in 8 progressieve leerhoofdstukken
  - Chapter 1: Fundament & Quick Start (⭐ - 30-45 minuten)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 uur)
  - Chapter 3: Configuratie & Authenticatie (⭐⭐ - 45-60 minuten)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 uur)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 uur)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 uur)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 uur)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Comprehensive Navigation System**: Consistente navigatieheaders en voetteksten in de volledige documentatie
- **🎯 Progress Tracking**: Cursusvoltooiingschecklist en leerverificatiesysteem
- **🗺️ Learning Path Guidance**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Cross-Reference Navigation**: Gerelateerde hoofdstukken en vereisten duidelijk gekoppeld

#### Enhanced
- **README Structure**: Getransformeerd naar een gestructureerd leerplatform met hoofdstukgebaseerde organisatie
- **Documentation Navigation**: Elke pagina bevat nu hoofdstukcontext en voortgangsaanwijzingen
- **Template Organization**: Voorbeelden en sjablonen toegewezen aan juiste leerhoofdstukken
- **Resource Integration**: Cheat sheets, FAQ's en studiegidsen gekoppeld aan relevante hoofdstukken
- **Workshop Integration**: Hands-on labs gekoppeld aan meerdere hoofdstukleerdoelen

#### Changed
- **Learning Progression**: Verplaatst van lineaire documentatie naar flexibele hoofdstukgebaseerde leerstructuur
- **Configuration Placement**: Configuratiegids verplaatst naar Hoofdstuk 3 voor betere leerstroom
- **AI Content Integration**: Betere integratie van AI-specifieke inhoud doorheen de leerreis
- **Production Content**: Geavanceerde patronen geconsolideerd in Hoofdstuk 8 voor enterprise-lerenden

#### Improved
- **User Experience**: Duidelijke navigatiecrumbs en voortgangsindicatoren per hoofdstuk
- **Accessibility**: Consistente navigatiepatronen voor eenvoudiger cursusdoorloop
- **Professional Presentation**: Universitair-achtige cursusstructuur geschikt voor academische en corporate training
- **Learning Efficiency**: Minder tijd nodig om relevante inhoud te vinden door verbeterde organisatie

#### Technical Implementation
- **Navigation Headers**: Gestandaardiseerde hoofdstuknavigatie in meer dan 40 documentbestanden
- **Footer Navigation**: Consistente voortgangsaanwijzingen en hoofdstukvoltooiingsindicatoren
- **Cross-Linking**: Uitgebreid intern linksysteem dat verwante concepten verbindt
- **Chapter Mapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Studiegids herwerkt om aan te sluiten op het 8-hoofdstukssysteem
- **🎯 Chapter-Based Assessment**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Progress Tracking**: Wekelijks leerschema met meetbare resultaten en voltooiingschecklists
- **❓ Assessment Questions**: Kennisvalidatievragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Practical Exercises**: Hands-on activiteiten met echte implementatiescenario's en foutopsporing
- **📊 Skill Progression**: Duidelijke voortgang van basisconcepten naar enterprisepatronen met focus op loopbaanontwikkeling
- **🎓 Certification Framework**: Professionele ontwikkelingsresultaten en communityerkenning
- **⏱️ Timeline Management**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Deze versie verbetert de multi-agent retailoplossing met betere agentbenamingen en verbeterde documentatie.**

#### Changed
- **Multi-Agent Terminology**: "Cora agent" vervangen door "Customer agent" in de retail multi-agentoplossing voor duidelijkere begrip
- **Agent Architecture**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt om consistente "Customer agent" benaming te gebruiken
- **Configuration Examples**: Gemoderniseerde agentconfiguratiepatronen met bijgewerkte naamgevingsconventies
- **Documentation Consistency**: Zorg ervoor dat alle verwijzingen professionele, beschrijvende agentnamen gebruiken

#### Enhanced
- **ARM Template Package**: Bijgewerkt retail-multiagent-arm-template met Customer-agent verwijzingen
- **Architecture Diagrams**: Vernieuwde Mermaid-diagrammen met bijgewerkte agentnaamgeving
- **Code Examples**: Python-klassen en implementatievoorbeelden gebruiken nu CustomerAgent-naamgeving
- **Environment Variables**: Alle deployment-scripts bijgewerkt om CUSTOMER_AGENT_NAME-conventies te gebruiken

#### Verbeterd
- **Developer Experience**: Duidelijkere agentrollen en verantwoordelijkheden in de documentatie
- **Production Readiness**: Betere afstemming op ondernemingsnaamgevingsconventies
- **Learning Materials**: Intuïtiever agentnamen voor educatieve doeleinden
- **Template Usability**: Vereenvoudigd begrip van agentfuncties en implementatiepatronen

#### Technische details
- Bijgewerkte Mermaid-architectuurdiagrammen met verwijzingen naar CustomerAgent
- Vervangen CoraAgent-klassenamen door CustomerAgent in Python-voorbeelden
- Aangepaste ARM-template JSON-configuraties om het agenttype "customer" te gebruiken
- Bijgewerkte omgevingsvariabelen van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Vernieuwde alle deployment-commando's en containerconfiguraties

### [v3.0.0] - 2025-09-12

#### Belangrijke wijzigingen - AI-ontwikkelaarsfocus en Microsoft Foundry-integratie
**Deze versie transformeert de repository in een uitgebreide, op AI gerichte leerbron met Microsoft Foundry-integratie.**

#### Toegevoegd
- **🤖 AI-First Learning Path**: Volledige herstructurering met prioriteit voor AI-ontwikkelaars en engineers
- **Microsoft Foundry Integration Guide**: Uitgebreide documentatie voor het verbinden van AZD met Microsoft Foundry-services
- **AI Model Deployment Patterns**: Gedetailleerde gids over modelkeuze, configuratie en strategieën voor productie-implementatie
- **AI Workshop Lab**: 2-3 uur durende hands-on workshop voor het omzetten van AI-toepassingen naar oplossingen die met AZD kunnen worden uitgerold
- **Production AI Best Practices**: Enterprise-klare patronen voor schaling, monitoring en beveiliging van AI-workloads
- **AI-Specific Troubleshooting Guide**: Uitgebreide probleemoplossing voor Microsoft Foundry-modellen, Cognitive Services en AI-deploymentsproblemen
- **AI Template Gallery**: Geselecteerde verzameling Microsoft Foundry-templates met complexiteitsbeoordelingen
- **Workshop Materials**: Volledige workshopstructuur met hands-on labs en referentiemateriaal

#### Verbeterd
- **README Structure**: Gericht op AI-ontwikkelaars met 45% community-interessegegevens uit de Microsoft Foundry Discord
- **Learning Paths**: Toegewijde AI-ontwikkelaarsreis naast traditionele paden voor studenten en DevOps-engineers
- **Template Recommendations**: Uitgelichte AI-templates inclusief azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community Integration**: Verbeterde Discord-communityondersteuning met AI-specifieke kanalen en discussies

#### Beveiliging & Productiefocus
- **Managed Identity Patterns**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Cost Optimization**: Volgen van tokengebruik en budgetcontroles voor AI-workloads
- **Multi-Region Deployment**: Strategieën voor wereldwijde implementatie van AI-applicaties
- **Performance Monitoring**: AI-specifieke metrics en integratie met Application Insights

#### Documentatiekwaliteit
- **Linear Course Structure**: Logische opbouw van beginner tot geavanceerde AI-implementatiepatronen
- **Validated URLs**: Alle externe repositorylinks geverifieerd en toegankelijk
- **Complete Reference**: Alle interne documentatielinks geverifieerd en functioneel
- **Production Ready**: Enterprise-implementatiepatronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Belangrijke wijzigingen - Herstructurering van repository en professionele verbetering
**Deze versie vertegenwoordigt een ingrijpende herziening van de repositorystructuur en de presentatie van de inhoud.**

#### Toegevoegd
- **Structured Learning Framework**: Alle documentatiepagina's bevatten nu secties Introductie, Leerdoelen en Leerresultaten
- **Navigation System**: Vorige/Volgende-leslinks toegevoegd door alle documentatie voor begeleide leerprogressie
- **Study Guide**: Uitgebreide study-guide.md met leerdoelen, oefenopdrachten en beoordelingsmateriaal
- **Professional Presentation**: Alle emoji-iconen verwijderd voor verbeterde toegankelijkheid en een professionelere uitstraling
- **Enhanced Content Structure**: Verbeterde organisatie en samenhang van leermaterialen

#### Gewijzigd
- **Documentation Format**: Alle documentatie gestandaardiseerd met een consistente, op leren gerichte structuur
- **Navigation Flow**: Logische voortgang door alle leermaterialen geïmplementeerd
- **Content Presentation**: Decoratieve elementen verwijderd ten gunste van duidelijke, professionele opmaak
- **Link Structure**: Alle interne links bijgewerkt om het nieuwe navigatiesysteem te ondersteunen

#### Verbeterd
- **Accessibility**: Emoji-afhankelijkheden verwijderd voor betere compatibiliteit met screenreaders
- **Professional Appearance**: Schone, academische presentatie geschikt voor ondernemingsleren
- **Learning Experience**: Gestructureerde aanpak met duidelijke doelen en uitkomsten voor elke les
- **Content Organization**: Betere logische opbouw en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Initiële release - Uitgebreide AZD-leerrepository

#### Toegevoegd
- **Kernstructuur van de documentatie**
  - Volledige getting-started gidsreeks
  - Uitgebreide deployment- en provisioningdocumentatie
  - Gedetailleerde probleemoplossingsbronnen en debuggidsen
  - Pre-deployment validatietools en procedures

- **Aan de slag-module**
  - AZD Basics: Kernconcepten en terminologie
  - Installatiehandleiding: Platform-specifieke installatie-instructies
  - Configuratiehandleiding: Omgevingsinstelling en authenticatie
  - Eerste projecttutorial: Stapsgewijze hands-on leren

- **Deployment- en provisioningmodule**
  - Deployment Guide: Volledige workflowdocumentatie
  - Provisioning Guide: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Multi-service architectuurpatronen

- **Pre-deployment validatiemodule**
  - Capacity Planning: Validatie van Azure-resourcebeschikbaarheid
  - SKU Selection: Uitgebreide richtlijnen voor servicetier-selectie
  - Pre-flight Checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Hulpmiddelen voor kostenraming en budgetplanning

- **Probleemoplossingsmodule**
  - Common Issues: Vaak voorkomende problemen en oplossingen
  - Debugging Guide: Systematische probleemoplossingsmethodologieën
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Hulpbronnen en referenties**
  - Command Cheat Sheet: Snelreferentie voor essentiële commando's
  - Glossary: Uitgebreide termenlijst en acroniemdefinities
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Links naar externe bronnen en communityverbindingen

- **Voorbeelden en sjablonen**
  - Eenvoudig webapplicatievoorbeeld
  - Template voor het uitrollen van een statische website
  - Containerapplicatieconfiguratie
  - Patronen voor database-integratie
  - Voorbeelden van microservices-architectuur
  - Serverless-functie-implementaties

#### Kenmerken
- **Multi-Platform Support**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Multiple Skill Levels**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Practical Focus**: Hands-on voorbeelden en praktijkvoorbeelden
- **Comprehensive Coverage**: Van basisconcepten tot geavanceerde enterprisepatronen
- **Security-First Approach**: Beveiligingsbest practices geïntegreerd door het hele project
- **Cost Optimization**: Richtlijnen voor kosteneffectieve deployments en resourcebeheer

#### Documentatiekwaliteit
- **Detailed Code Examples**: Praktische, geteste codevoorbeelden
- **Step-by-Step Instructions**: Duidelijke, uitvoerbare instructies
- **Comprehensive Error Handling**: Probleemoplossing voor veelvoorkomende problemen
- **Best Practices Integration**: Industriestandaarden en aanbevelingen
- **Version Compatibility**: Up-to-date met de nieuwste Azure-diensten en azd-functionaliteit

## Geplande toekomstige verbeteringen

### Versie 3.1.0 (Gepland)
#### Uitbreiding AI-platform
- **Multi-Model Support**: Integratiepatronen voor Hugging Face, Azure Machine Learning en custom modellen
- **AI Agent Frameworks**: Templates voor LangChain-, Semantic Kernel- en AutoGen-deployments
- **Advanced RAG Patterns**: Vector-databaseopties buiten Azure AI Search (Pinecone, Weaviate, enz.)
- **AI Observability**: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Ontwikkelaarservaring
- **VS Code Extension**: Geïntegreerde ontwikkelervaring voor AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-ondersteunde generatie van AZD-templates
- **Interactive Tutorials**: Hands-on codeeroefeningen met geautomatiseerde validatie voor AI-scenario's
- **Video Content**: Aanvullende video-tutorials voor visuele leerlingen gericht op AI-deployments

### Versie 4.0.0 (Gepland)
#### Enterprise AI-patronen
- **Governance Framework**: AI-modelgovernance, compliance en auditlogs
- **Multi-Tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-services
- **Edge AI Deployment**: Integratie met Azure IoT Edge en containerinstances
- **Hybrid Cloud AI**: Multi-cloud- en hybride-implementatiepatronen voor AI-workloads

#### Geavanceerde functionaliteiten
- **AI Pipeline Automation**: MLOps-integratie met Azure Machine Learning-pijplijnen
- **Advanced Security**: Zero-trust-patronen, private endpoints en geavanceerde bedreigingsbeveiliging
- **Performance Optimization**: Geavanceerde tuning- en schalingsstrategieën voor AI-applicaties met hoge doorvoer
- **Global Distribution**: Contentdelivery- en edge-cachingpatronen voor AI-applicaties

### Versie 3.0.0 (Gepland) - Vervangen door huidige release
#### Voorgestelde toevoegingen - Nu geïmplementeerd in v3.0.0
- ✅ **AI-Focused Content**: Uitgebreide Microsoft Foundry-integratie (Voltooid)
- ✅ **Interactive Tutorials**: Hands-on AI-workshoplab (Voltooid)
- ✅ **Advanced Security Module**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Performance Optimization**: AI-workloadtuningstrategieën (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Sommige voltooid in de huidige release
- ✅ **Additional Examples**: AI-gerichte deploymentscenario's (Voltooid)
- ✅ **Extended FAQ**: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Tool Integration**: Verbeterde IDE- en editorintegratiehandleidingen
- ✅ **Monitoring Expansion**: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Nog gepland voor een toekomstige release
- **Mobile-Friendly Documentation**: Responsief ontwerp voor mobiel leren
- **Offline Access**: Downloadbare documentatiepakketten
- **Enhanced IDE Integration**: VS Code-extensie voor AZD + AI-workflows
- **Community Dashboard**: Realtime communitystatistieken en bijdrage-tracking

## Bijdragen aan de changelog

### Wijzigingen melden
Wanneer je bijdraagt aan deze repository, zorg er dan voor dat changelogvermeldingen het volgende bevatten:

1. **Versienummer**: Volg semantische versiebeheer (major.minor.patch)
2. **Datum**: Releasedatum of updatedatum in YYYY-MM-DD-formaat
3. **Categorie**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Duidelijke beschrijving**: Bondige beschrijving van wat er is veranderd
5. **Effectbeoordeling**: Hoe wijzigingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatieonderdelen of mogelijkheden
- Nieuwe voorbeelden, templates of leermaterialen
- Extra tools, scripts of hulpprogramma's

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates om duidelijkheid of nauwkeurigheid te verbeteren
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties gepland voor verwijdering
- Methoden waarvoor betere alternatieven bestaan

#### Verwijderd
- Functies, documentatie of voorbeelden die niet meer relevant zijn
- Verouderde informatie of uitgefaseerde benaderingen
- Redundante of geconsolideerde inhoud

#### Opgelost
- Correcties van fouten in documentatie of code
- Oplossing van gerapporteerde problemen
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Beveiliging
- Verbeteringen of fixes gerelateerd aan beveiliging
- Updates van beveiligingsbest practices
- Oplossing van beveiligingskwetsbaarheden

### Richtlijnen voor semantische versiebeheer

#### Major-versie (X.0.0)
- Brekende veranderingen die gebruikersactie vereisen
- Aanzienlijke herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie veranderen

#### Minor-versie (X.Y.0)
- Nieuwe functies of inhoudstoevoegingen
- Verbeteringen die achterwaartse compatibiliteit behouden
- Aanvullende voorbeelden, tools of bronnen

#### Patch-versie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Communityfeedback en suggesties

We moedigen actief feedback van de community aan om deze leerbron te verbeteren:

### Hoe feedback te geven
- **GitHub Issues**: Problemen melden of verbeteringen voorstellen (AI-specifieke issues welkom)
- **Discord Discussions**: Ideeën delen en deelnemen aan de Microsoft Foundry-community
- **Pull Requests**: Draag directe verbeteringen aan de inhoud bij, vooral AI-templates en handleidingen
- **Microsoft Foundry Discord**: Neem deel aan het #Azure-kanaal voor AZD + AI-discussies
- **Community Forums**: Neem deel aan bredere Azure-ontwikkelaarsdiscussies

### Feedbackcategorieën
- **AI Content Accuracy**: Correcties voor AI-serviceintegratie en deploymentinformatie
- **Learning Experience**: Suggesties voor een verbeterde leerstroom voor AI-ontwikkelaars
- **Missing AI Content**: Verzoeken om extra AI-templates, patronen of voorbeelden
- **Accessibility**: Verbeteringen voor diverse leerbehoeften
- **AI Tool Integration**: Suggesties voor betere integratie van AI-ontwikkelworkflows
- **Production AI Patterns**: Verzoeken om enterprise AI-implementatiepatronen

### Reactietermijnen
- **Issue Response**: Binnen 48 uur voor gerapporteerde problemen
- **Feature Requests**: Evaluatie binnen een week
- **Community Contributions**: Review binnen een week
- **Security Issues**: Directe prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige updates
- **Monthly Reviews**: Controle van inhoudsnauwkeurigheid en linkvalidatie
- **Quarterly Updates**: Grote inhoudstoegangen en verbeteringen
- **Semi-Annual Reviews**: Omvattende herstructurering en verbeteringen
- **Annual Releases**: Jaarlijkse releases met belangrijke updates en verbeteringen

### Monitoring en kwaliteitsborging
- **Automated Testing**: Regelmatige validatie van codevoorbeelden en links
- **Community Feedback Integration**: Regelmatige opname van gebruikerssuggesties
- **Technology Updates**: Afstemming op de nieuwste Azure-diensten en azd-releases
- **Accessibility Audits**: Regelmatige controle voor inclusieve ontwerpprincipes

## Versieondersteuningsbeleid

### Huidige versieondersteuning
- **Laatste grote versie**: Volledige ondersteuning met regelmatige updates
- **Vorige grote versie**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Verouderde versies**: Alleen community-ondersteuning, geen officiële updates

### Migratierichtlijnen
Wanneer grote versies worden uitgebracht, bieden we:
- **Migratiehandleidingen**: Stap-voor-stap instructies voor de overgang
- **Compatibiliteitsnotities**: Details over brekende wijzigingen
- **Toolondersteuning**: Scripts of hulpmiddelen om bij migratie te helpen
- **Community-ondersteuning**: Specifieke forums voor migratievragen

---

**Navigatie**
- **Vorige les**: [Studiegids](resources/study-guide.md)
- **Volgende les**: Terug naar [Hoofd-README](README.md)

**Blijf op de hoogte**: Houd deze repository in de gaten voor meldingen over nieuwe releases en belangrijke updates van het leermateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->