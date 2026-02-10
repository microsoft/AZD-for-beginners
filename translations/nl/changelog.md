# Wijzigingen - AZD For Beginners

## Inleiding

Dit wijzigingslogboek documenteert alle belangrijke wijzigingen, updates en verbeteringen aan de AZD For Beginners-repository. We volgen principes van semantische versiebeheer en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, zul je:
- Op de hoogte blijven van nieuwe functies en toegevoegde inhoud
- Begrijpen welke verbeteringen aan bestaande documentatie zijn aangebracht
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het lesmateriaal in de loop van de tijd volgen

## Leeruitkomsten

Na het bekijken van de items in het wijzigingslogboek kun je:
- Nieuwe inhoud en beschikbare bronnen voor leren identificeren
- Begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leertraject plannen op basis van het meest actuele materiaal
- Feedback en suggesties bijdragen voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.17.0] - 2026-02-05

#### Verbetering cursusnavigatie
**Deze versie verbetert de hoofdstuknavigatie in README.md met een verbeterd tabelformaat.**

#### Gewijzigd
- **Cursuskaarttabel**: Verbeterd met directe leslinks, tijdsinschattingen en complexiteitsbeoordelingen
- **Opruimen van mappen**: Redundante oude mappen verwijderd (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidatie**: Alle 21+ interne links in de Cursuskaarttabel geverifieerd

### [v3.16.0] - 2026-02-05

#### Productnaamupdates
**Deze versie werkt productverwijzingen bij naar de huidige Microsoft-branding.**

#### Gewijzigd
- **Azure AI Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt in niet-vertaalde bestanden
- **Azure AI Agent Service → Foundry Agents**: Servicenaam bijgewerkt om de huidige branding te weerspiegelen

#### Bestanden bijgewerkt
- `README.md` - Hoofdlandingspagina van de cursus
- `changelog.md` - Versiegeschiedenis
- `course-outline.md` - Cursusstructuur
- `docs/chapter-02-ai-development/agents.md` - Gids voor AI-agents
- `examples/README.md` - Voorbeelddocumentatie
- `workshop/README.md` - Workshop landingspagina
- `workshop/docs/index.md` - Workshop-index
- `workshop/docs/instructions/*.md` - Alle workshop instructiebestanden

---

### [v3.15.0] - 2026-02-05

#### Grote repositoryherstructurering: hoofdstuk-gebaseerde mapnamen
**Deze versie herstructureert de documentatie in toegewijde hoofdstukmappen voor duidelijkere navigatie.**

#### Mapnamen hernoemd
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
- **📚 Chapter README files**: README.md aangemaakt in elke hoofdstukmap met:
  - Leerdoelen en duur
  - Lessentabel met beschrijvingen
  - Quick start-commando's
  - Navigatie naar andere hoofdstukken

#### Gewijzigd
- **🔗 Alle interne links bijgewerkt**: 78+ paden bijgewerkt in alle documentatiebestanden
- **🗺️ Main README.md**: Cursuskaart bijgewerkt met de nieuwe hoofdstukstructuur
- **📝 examples/README.md**: Kruisverwijzingen naar hoofdstukmappen bijgewerkt

#### Verwijderd
- Oude mappenstructuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositoryherstructurering: hoofdstuknavigatie
**Deze versie voegde README-bestanden voor hoofdstuknavigatie toe (vervangen door v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nieuwe gids voor AI-agents
**Deze versie voegt een uitgebreide gids toe voor het uitrollen van AI-agents met de Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids die omvat:
  - Wat AI-agents zijn en hoe ze verschillen van chatbots
  - Drie quick-start agent-sjablonen (Foundry Agents, Prompty, RAG)
  - Agent-architectuurpatronen (single agent, RAG, multi-agent)
  - Toolconfiguratie en aanpassing
  - Monitoring en metricstracking
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende probleemoplossingsscenario's
  - Drie hands-on oefeningen met succescriteria

#### Inhoudsstructuur
- **Introductie**: Agentconcepten voor beginners
- **Snelstart**: Deploy agents met `azd init --template get-started-with-ai-agents`
- **Architectuurpatronen**: Visuele diagrammen van agentpatronen
- **Configuratie**: Toolsetup en omgevingsvariabelen
- **Monitoring**: Integratie met Application Insights
- **Oefeningen**: Progressieve hands-on leeractiviteiten (20–45 minuten elk)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-omgevingsupdate
**Deze versie werkt de configuratie van de ontwikkelcontainer bij met moderne tools en betere standaardinstellingen voor de AZD-leerervaring.**

#### Gewijzigd
- **🐳 Base Image**: Bijgewerkt van `python:3.12-bullseye` naar `python:3.12-bookworm` (laatste Debian stable)
- **📛 Container Name**: Hernoemd van "Python 3" naar "AZD for Beginners" voor duidelijkheid

#### Toegevoegd
- **🔧 Nieuwe Dev Container-functies**:
  - `azure-cli` met Bicep-ondersteuning ingeschakeld
  - `node:20` (LTS-versie voor AZD-sjablonen)
  - `github-cli` voor sjabloonbeheer
  - `docker-in-docker` voor containerapp-implementaties

- **🔌 Poortdoorsturing**: Vooraf geconfigureerde poorten voor veel gebruikte development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

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

- **⚙️ VS Code-instellingen**: Standaardinstellingen toegevoegd voor Python-interpreter, format on save en whitespace-trimming

- **📦 Bijgewerkte requirements-dev.txt**:
  - MkDocs minify-plugin toegevoegd
  - pre-commit toegevoegd voor codekwaliteit
  - Azure SDK-pakketten toegevoegd (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create Command**: Verifieert nu AZD- en Azure CLI-installatie bij het starten van de container

---

### [v3.11.0] - 2026-02-05

#### Beginnersvriendelijke README-herziening
**Deze versie verbetert README.md aanzienlijk om toegankelijker te zijn voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Vergelijking Azure CLI vs AZD**: Duidelijke uitleg wanneer je welke tool moet gebruiken met praktische voorbeelden
- **🌟 Awesome AZD Links**: Directe links naar de community template gallery en bijdragebronnen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ kant-en-klare deploy-sjablonen
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Communitybijdrage
- **🎯 Snelstartgids**: Vereenvoudigde 3-stappen sectie om snel te beginnen (Install → Login → Deploy)
- **📊 Navigatietabel op basis van ervaring**: Duidelijke begeleiding over waar te beginnen op basis van ontwikkelaarservaring

#### Gewijzigd
- **README-structuur**: Hernoemd voor progressieve onthulling - belangrijkste informatie eerst
- **Introductiesectie**: Herschreven om "The Magic of `azd up`" uit te leggen voor absolute beginners
- **Dubbele inhoud verwijderd**: Dubbele troubleshooting-sectie geëlimineerd
- **Troubleshooting-commando's**: `azd logs` verwijzing aangepast naar geldig `azd monitor --logs`

#### Opgelost
- **🔐 Authenticatiecommando's**: `azd auth login` en `azd auth logout` toegevoegd aan cheat-sheet.md
- **Ongeldige commandoverwijzingen**: Overgebleven `azd logs` uit de README troubleshooting-sectie verwijderd

#### Notities
- **Scope**: Wijzigingen toegepast op hoofd-README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen specifiek gericht op ontwikkelaars die nieuw zijn met AZD

---

### [v3.10.0] - 2026-02-05

#### Update nauwkeurigheid van Azure Developer CLI-commando's
**Deze versie corrigeert niet-bestaande AZD-commando's in de documentatie, zodat alle codevoorbeelden geldige Azure Developer CLI-syntax gebruiken.**

#### Opgelost
- **🔧 Niet-bestaande AZD-commando's verwijderd**: Uitgebreide controle en correctie van ongeldige commando's:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI-alternatieven
  - `azd service` subcommands (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` flags (bestaan niet) → bijgewerkt naar gebruik van `--preview`
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bestanden bijgewerkt met correcties van commando's**:
  - `resources/cheat-sheet.md`: Grote revisie van commando-referentie
  - `docs/deployment/deployment-guide.md`: Rollback- en implementatiestrategieën gecorrigeerd
  - `docs/troubleshooting/debugging.md`: Loganalyse-secties gecorrigeerd
  - `docs/troubleshooting/common-issues.md`: Troubleshooting-commando's bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD-debuggingsectie gecorrigeerd
  - `docs/getting-started/azd-basics.md`: Monitoring-commando's gecorrigeerd
  - `docs/getting-started/first-project.md`: Monitoring- en debuggingvoorbeelden bijgewerkt
  - `docs/getting-started/installation.md`: Help- en versieversies voorbeelden gecorrigeerd
  - `docs/pre-deployment/application-insights.md`: Logweergave-commando's gecorrigeerd
  - `docs/pre-deployment/coordination-patterns.md`: Agent-debuggingcommando's gecorrigeerd

- **📝 Versieverwijzing bijgewerkt**: 
  - `docs/getting-started/installation.md`: Hardgecodeerde `1.5.0` versie vervangen door generieke `1.x.x` met link naar releases

#### Gewijzigd
- **Rollback-strategieën**: Documentatie bijgewerkt om Git-gebaseerde rollback te gebruiken (AZD heeft geen native rollback)
- **Logweergave**: `azd logs` verwijzingen vervangen door `azd monitor --logs`, `azd monitor --live` en Azure CLI-commando's
- **Performance-sectie**: Niet-bestaande parallelle/incremental deploy-flags verwijderd, en geldige alternatieven gegeven

#### Technische details
- **Geldige AZD-commando's**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor-vlaggen**: `--live`, `--logs`, `--overview`
- **Verwijderde functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opmerkingen
- **Verificatie**: Commando's gevalideerd tegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Voltooiing van workshop en update van documentatiekwaliteit
**Deze versie voltooit de interactieve workshopmodules, repareert alle gebroken documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuw document met bijdrage-richtlijnen met:
  - Duidelijke instructies voor het melden van problemen en het voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commit-berichten
  - Informatie over communitybetrokkenheid

#### Voltooid
- **🎯 Workshopmodule 7 (Afronding)**: Volledig afgeronde afrondingsmodule met:
  - Uitgebreide samenvatting van workshopresultaten
  - Sectie met belangrijkste beheerde concepten over AZD, templates en AI Foundry
  - Aanbevelingen voor het vervolg van de leerreis
  - Workshop-uitdagingsoefeningen met moeilijkheidsgraderingen
  - Communityfeedback- en ondersteuningslinks

- **📚 Workshopmodule 3 (Deconstruct)**: Bijgewerkte leerdoelen met:
  - Instructies voor het activeren van GitHub Copilot met MCP-servers
  - Begrip van AZD-template mapstructuur
  - Organisatiepatronen voor Infrastructure-as-Code (Bicep)
  - Hands-on labinstructies

- **🔧 Workshopmodule 6 (Teardown)**: Voltooid met:
  - Doelstellingen voor resource cleanup en kostenbeheer
  - Gebruik van `azd down` voor veilige deprovisioning van infrastructuur
  - Richtlijnen voor herstel van soft-deleted cognitive services
  - Bonusverkenningsopdrachten voor GitHub Copilot en Azure Portal

#### Opgelost
- **🔗 Reparatie van gebroken links**: 15+ gebroken interne documentatielinks opgelost:
  - `docs/ai-foundry/ai-model-deployment.md`: Paden naar microsoft-foundry-integration.md gerepareerd
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md en production-ai-practices.md paden gecorrigeerd
  - `docs/getting-started/first-project.md`: Niet-bestaande cicd-integration.md vervangen door deployment-guide.md
  - `examples/retail-scenario.md`: FAQ- en troubleshooting-gids paden gerepareerd
  - `examples/container-app/microservices/README.md`: Course home- en deployment guide-paden gecorrigeerd
  - `resources/faq.md` en `resources/glossary.md`: AI-hoofdstukverwijzingen bijgewerkt
  - `course-outline.md`: Instructor guide- en AI-workshoplabverwijzingen gecorrigeerd

- **📅 Workshop statusbanner**: Bijgewerkt van "Onder constructie" naar actieve workshopstatus met februari 2026 datum

- **🔗 Workshopnavigatie**: Gebroken navigatielinks in workshop README.md die verwezen naar de niet-bestaande map lab-1-azd-basics gerepareerd

#### Gewijzigd
- **Workshoppresentatie**: Waarschuwing "onder constructie" verwijderd; de workshop is nu compleet en klaar voor gebruik
- **Navigatieconsistentie**: Zorgen dat alle workshopmodules juiste inter-module navigatie hebben
- **Leerpadverwijzingen**: Hoofdstukcross-referenties bijgewerkt naar correcte microsoft-foundry-paden

#### Gevalideerd
- ✅ Alle Engelse markdown-bestanden hebben geldige interne links
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules functioneert correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Beginnersvriendelijke taal en structuur behouden
- ✅ CONTRIBUTING.md biedt duidelijke richtlijnen voor communitybijdragers

#### Technische implementatie
- **Linkvalidatie**: Geautomatiseerd PowerShell-script heeft alle .md interne links geverifieerd
- **Inhoudsaudit**: Handmatige beoordeling van workshopvolledigheid en geschiktheid voor beginners
- **Navigatiesysteem**: Consistente hoofdstuk- en module-navigatiepatronen toegepast

#### Opmerkingen
- **Omvang**: Wijzigingen toegepast op Engelse documentatie alleen
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (geautomatiseerde vertaling wordt later gesynchroniseerd)
- **Duur van de workshop**: Volledige workshop biedt nu 3-4 uur hands-on leren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde documentatie: monitoring, beveiliging en multi-agentpatronen
**Deze versie voegt uitgebreide A-grade lessen toe over Application Insights-integratie, authenticatiepatronen en multi-agent coördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Application Insights-integratieles**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gefocuste implementatie met automatische provisioning
  - Complete Bicep-templates voor Application Insights + Log Analytics
  - Werkende Python-toepassingen met aangepaste telemetrie (1.200+ regels)
  - AI/LLM-monitoringpatronen (Azure OpenAI token-/kostentracking)
  - 6 Mermaid-diagrammen (architectuur, distributed tracing, telemetriestroom)
  - 3 hands-on oefeningen (alerts, dashboards, AI-monitoring)
  - Kusto-queryvoorbeelden en kostenoptimalisatiestrategieën
  - Live metrics-streaming en realtime debugging
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Authenticatie- & beveiligingspatronenles**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Complete Bicep-infrastructuurtemplates voor veilige implementaties
  - Node.js-applicatiecode met Azure SDK-integratie
  - 3 complete oefeningen (managed identity inschakelen, user-assigned identity, Key Vault-rotatie)
  - Beste beveiligingspraktijken en RBAC-configuraties
  - Troubleshooting-gids en kostenanalyse
  - Productierijpe passwordless authenticatiepatronen

- **🤖 Multi-agent coördinatiepatronenles**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, event-driven, consensus)
  - Complete orchestrator-service-implementatie (Python/Flask, 1.500+ regels)
  - 3 gespecialiseerde agentimplementaties (Research, Writer, Editor)
  - Service Bus-integratie voor message queuing
  - Cosmos DB state-management voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 geavanceerde oefeningen (timeout-handling, retry-logic, circuit breaker)
  - Kostenoverzicht ($240-565/month) met optimalisatiestrategieën
  - Application Insights-integratie voor monitoring

#### Verbeterd
- **Pre-deployment-hoofdstuk**: Bevat nu uitgebreide monitoring- en coördinatiepatronen
- **Getting Started-hoofdstuk**: Uitgebreid met professionele authenticatiepatronen
- **Productierijpheid**: Volledige dekking van beveiliging tot observeerbaarheid
- **Cursusoverzicht**: Bijgewerkt om naar nieuwe lessen in hoofdstukken 3 en 6 te verwijzen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring door de cursus heen
- **Documentatiekwaliteit**: Consistente A-grade standaarden (95-97%) over nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor enterprise-implementaties

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijk pad van ontwikkeling naar productie-monitoring
- **Beveiligingsstandaarden**: Professionele patronen voor authenticatie en geheimbeheer
- **Observeerbaarheid**: Complete Application Insights-integratie met AZD
- **AI-werklasten**: Gespecialiseerde monitoring voor Azure OpenAI en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen fragmenten)
- ✅ Mermaid-diagrammen voor visueel leren (19 in totaal over 3 lessen)
- ✅ Hands-on oefeningen met verificatiestappen (9 in totaal)
- ✅ Productierijpe Bicep-templates inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Troubleshooting-gidss en best practices
- ✅ Kenniscontroles met verificatiecommando's

#### Documentatie-beoordelingsresultaten
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringgids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agentarchitecturen
- **Algemene nieuwe inhoud**: - Consistente hoge kwaliteitsstandaarden

#### Technische implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + distributed tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live metrics + Kusto-queries + alerts + dashboards
- **Kostenbeheer**: Samplingstrategieën, retentiebeleid, budgetcontroles

### [v3.7.0] - 2025-11-19

#### Verbeteringen in documentatiekwaliteit en nieuw Azure OpenAI-voorbeeld
**Deze versie verbetert de documentatiekwaliteit in het hele repository en voegt een compleet Azure OpenAI-implementatievoorbeeld toe met GPT-4 chatinterface.**

#### Toegevoegd
- **🤖 Azure OpenAI Chat-voorbeeld**: Complete GPT-4-implementatie met werkende uitvoering in `examples/azure-openai-chat/`:
  - Complete Azure OpenAI-infrastructuur (GPT-4 model-implementatie)
  - Python command-line chatinterface met conversatiegeschiedenis
  - Key Vault-integratie voor veilige opslag van API-sleutels
  - Tracking van tokengebruik en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiehandleiding
  - 11 productieklare bestanden (Bicep-templates, Python-app, configuratie)
- **📚 Documentatieoefeningen**: Hands-on praktijkoefeningen toegevoegd aan configuratiegids:
  - Oefening 1: Multi-environment configuratie (15 minuten)
  - Oefening 2: Oefening voor geheimbeheer (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Implementatieverificatie**: Verificatiesectie toegevoegd aan deployment guide:
  - Healthcheck-procedures
  - Checklist met succescriteria
  - Verwachte outputs voor alle implementatiecommando's
  - Snelle referentie voor troubleshooting

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-grade kwaliteit (93%):
  - azure-openai-chat toegevoegd aan alle relevante secties
  - Aantal lokale voorbeelden bijgewerkt van 3 naar 4
  - Toegevoegd aan tabel met AI-applicatievoorbeelden
  - Geïntegreerd in Quick Start voor gevorderde gebruikers
  - Toegevoegd aan Microsoft Foundry Templates-sectie
  - Vergelijkingsmatrix en technologievondstsecties bijgewerkt
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) in docs-map:
  - Verwachte outputs toegevoegd aan kritieke commandovoorbeelden
  - Verificatiestappen opgenomen voor configuratiewijzigingen
  - Hands-on leren verbeterd met praktische oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor gevorderde gebruikers
- **Documentatiestructuur**: Actievere oefeningen met duidelijke uitkomsten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ontwikkelaarservaring**: Azure OpenAI-implementatie duurt nu 35-45 minuten (vs 60-90 voor complexere alternatieven)
- **Kostentransparantie**: Duidelijke kostenramingen ($50-200/month) voor Azure OpenAI-voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben een duidelijke instap met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte outputs en verificatiestappen

#### Gevalideerd
- ✅ Azure OpenAI-voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met daadwerkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op 8+ locaties
- ✅ Voorbeeldenindex weerspiegelt correct 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatieverwijzingen correct

#### Technische implementatie
- **Azure OpenAI-architectuur**: GPT-4 + Key Vault + Container Apps-patroon
- **Beveiliging**: Managed Identity gereed, geheimen in Key Vault
- **Monitoring**: Application Insights-integratie
- **Kostenbeheer**: Tokentracking en gebruiksoptimalisatie
- **Implementatie**: Enkele `azd up`-opdracht voor volledige setup

### [v3.6.0] - 2025-11-19

#### Grote update: Container App-implementatievoorbeelden
**Deze versie introduceert uitgebreide, productieklare voorbeelden voor containerapp-implementaties met Azure Developer CLI (AZD), inclusief volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App-voorbeelden**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Volledig overzicht van gecontaineriseerde implementaties, quick start, productie en geavanceerde patronen
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginnersvriendelijke REST API met scale-to-zero, health probes, monitoring en troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Productieklare multi-service implementatie (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Beste praktijken**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD-richtlijnen voor gecontaineriseerde workloads
- **Codevoorbeelden**: Complete `azure.yaml`, Bicep-templates en meertalige service-implementaties (Python, Node.js, C#, Go)
- **Testen & Troubleshooting**: End-to-end testscripts, monitoringcommando's, troubleshooting-richtlijnen

#### Gewijzigd
- **README.md**: Bijgewerkt om nieuwe container app-voorbeelden te tonen en te linken onder "Local Examples - Container Applications"
- **examples/README.md**: Bijgewerkt om container app-voorbeelden te benadrukken, vergelijkingsmatrixitems toe te voegen en technologie-/architectuurverwijzingen bij te werken
- **Cursusoverzicht & Studiegids**: Bijgewerkt om te verwijzen naar nieuwe container-app voorbeelden en implementatiepatronen in relevante hoofdstukken

#### Geverifieerd
- ✅ Alle nieuwe voorbeelden inzetbaar met `azd up` en volgen beste praktijken
- ✅ Documentatie-kruisverwijzingen en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken beginner- tot gevorderde scenario's, inclusief productie-microservices

#### Opmerkingen
- **Reikwijdte**: Alleen Engelse documentatie en voorbeelden
- **Volgende stappen**: Uitbreiden met extra geavanceerde containerpatronen en CI/CD-automatisering in toekomstige releases

### [v3.5.0] - 2025-11-19

#### Productrebranding: Microsoft Foundry
**Deze versie voert een volledige productnaamswijziging door van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, ter weerspiegeling van Microsofts officiële rebranding.**

#### Gewijzigd
- **🔄 Productnaamupdate**: Volledige rebranding van "Microsoft Foundry" naar "Microsoft Foundry"
  - Alle verwijzingen in de Engelse documentatie in de `docs/` map bijgewerkt
  - Map hernoemd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestand hernoemd: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsverwijzingen bijgewerkt in 7 documentatiebestanden

- **📁 Wijzigingen in mappenstructuur**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen bijgewerkt om de nieuwe mappenstructuur weer te geven
  - Navigatielinks gevalideerd in alle documentatie

- **📄 Bestandsnamen gewijzigd**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links bijgewerkt om naar de nieuwe bestandsnaam te verwijzen

#### Bijgewerkte bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielinks bijgewerkt
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 verwijzingen naar productnaam bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Gebruikt al Microsoft Foundry (van eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen bijgewerkt (overzicht, feedback van de community, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingen bijgewerkt
  - `docs/getting-started/first-project.md` - 2 links voor hoofdstuknavigatie bijgewerkt
  - `docs/getting-started/installation.md` - 2 links naar volgende hoofdstukken bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Cursusstructuurbestanden** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursusoverzicht, hoofdstuktitels, sjabloonsectie, inzichten van de community)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukbronnen)

#### Geverifieerd
- ✅ Geen resterende "ai-foundry" map-padverwijzingen in de Engelse docs
- ✅ Geen resterende "Microsoft Foundry" productnaamverwijzingen in de Engelse docs
- ✅ Alle navigatielinks functioneel met de nieuwe mappenstructuur
- ✅ Bestands- en maphernoemingen succesvol voltooid
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Opmerkingen
- **Reikwijdte**: Wijzigingen toegepast op Engelse documentatie in de `docs/` map alleen
- **Vertalingen**: Vertaalmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmaterialen (`workshop/`) niet bijgewerkt in deze versie
- **Voorbeelden**: Voorbeeldbestanden verwijzen mogelijk nog naar legacy-naamgeving (aan te pakken in een toekomstige update)
- **Externe links**: Externe URL's en GitHub-repositoryverwijzingen blijven ongewijzigd

#### Migratiehandleiding voor bijdragers
Als je lokale branches of documentatie hebt die naar de oude structuur verwijzen:
1. Werk mapverwijzingen bij: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Werk bestandsverwijzingen bij: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Valideer dat alle interne documentatielinks nog steeds werken

---

### [v3.4.0] - 2025-10-24

#### Infrastructuur-preview en validatieverbeteringen
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe previewfunctie van de Azure Developer CLI en verbetert de gebruikerservaring van de workshop.**

#### Toegevoegd
- **🧪 azd provision --preview Functiedocumentatie**: Uitgebreide dekking van de nieuwe infrastructuur-previewfunctionaliteit
  - Commandooverzicht en gebruiksvoorbeelden in de cheat sheet
  - Gedetailleerde integratie in de provisioninggids met gebruiksscenario's en voordelen
  - Pre-flight-checkintegratie voor veiligere implementatievalidatie
  - Updates van de startgids met veiligheid-voorop implementatiepraktijken
- **🚧 Workshopstatusbanner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Gradientontwerp met constructie-indicatoren voor duidelijke gebruikerscommunicatie
  - Laatst bijgewerkt-tijdstempel voor transparantie
  - Mobiel-responsief ontwerp voor alle apparaattypen

#### Verbeterd
- **Infrastructuurveiligheid**: Preview-functionaliteit geïntegreerd in de gehele implementatiedocumentatie
- **Pre-deploymentvalidatie**: Geautomatiseerde scripts bevatten nu infrastructuur-previewtests
- **Developerworkflow**: Bijgewerkte commando-sequenties om preview op te nemen als beste praktijk
- **Workshopervaring**: Duidelijke verwachtingen gecommuniceerd aan gebruikers over de contentontwikkelingsstatus

#### Gewijzigd
- **Deployment-beste praktijken**: Preview-first workflow nu aanbevolen aanpak
- **Documentatiestroom**: Infrastructuurvalidatie naar een eerder punt in het leerproces verplaatst
- **Workshoppresentatie**: Professionele statuscommunicatie met duidelijke ontwikkeltijdlijn

#### Verbeterd
- **Veiligheid-vooropbenadering**: Infrastructuurwijzigingen kunnen nu worden gevalideerd vóór implementatie
- **Teamsamenwerking**: Previewresultaten kunnen worden gedeeld voor review en goedkeuring
- **Kostenbewustzijn**: Beter inzicht in resourcekosten vóór provisioning
- **Risicobeperking**: Minder implementatiefouten door voorafgaande validatie

#### Technische implementatie
- **Multi-documentintegratie**: Previewfunctie gedocumenteerd in 4 belangrijke bestanden
- **Commando-patronen**: Consistente syntaxis en voorbeelden door de documentatie heen
- **Integratie van beste praktijken**: Preview opgenomen in validatieworkflows en scripts
- **Visuele indicatoren**: Duidelijke NIEUW-functiemarkeringen voor vindbaarheid

#### Workshopinfrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met gradient-styling
- **Gebruikerservaring**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professionele presentatie**: Behoudt de geloofwaardigheid van de repository terwijl verwachtingen worden geschetst
- **Tijdlijntransparantie**: Oktober 2025 laatst bijgewerkt-tijdstempel voor verantwoording

### [v3.3.0] - 2025-09-24

#### Verbeterde workshopmaterialen en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve gidsen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve workshopgids**: Browsergebaseerde workshopervaring met MkDocs-previewfunctionaliteit
- **📝 Gestructureerde workshopinstructies**: 7-stappen begeleid leertraject van ontdekking tot aanpassing
  - 0-Introduction: Overzicht van de workshop en installatie
  - 1-Select-AI-Template: Sjabloonontdekking en selectieproces
  - 2-Validate-AI-Template: Implementatie- en validatieprocedures
  - 3-Deconstruct-AI-Template: Begrip van sjabloonarchitectuur
  - 4-Configure-AI-Template: Configuratie en aanpassing
  - 5-Customize-AI-Template: Geavanceerde aanpassingen en iteraties
  - 6-Teardown-Infrastructure: Opruimen en resourcebeheer
  - 7-Wrap-up: Samenvatting en volgende stappen
- **🛠️ Workshoptooling**: MkDocs-configuratie met Material-theme voor een verbeterde leerervaring
- **🎯 Hands-on leerpad**: 3-stappenmethodologie (Ontdekking → Implementatie → Aanpassing)
- **📱 GitHub Codespaces-integratie**: Naadloze setup van ontwikkelomgeving

#### Verbeterd
- **AI Workshop Lab**: Uitgebreid met een uitgebreide 2-3 uur durende gestructureerde leerervaring
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van sjabloonselectie tot productie-implementatie
- **Ontwikkelaarservaring**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browsergebaseerde interface met zoekfunctie, kopieerfunctionaliteit en themawisselaar
- **Zelfgestuurd leren**: Flexibele workshopstructuur die verschillende leersnelheden ondersteunt
- **Praktische toepassing**: Reële AI-sjabloon-implementatiescenario's
- **Community-integratie**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshopfuncties
- **Ingebouwde zoekfunctie**: Snelle zoekopdracht op trefwoorden en lessen
- **Kopieer codeblokken**: Hover-naar-kopiëren-functionaliteit voor alle codevoorbeelden
- **Thema-omschakeling**: Ondersteuning voor donker/licht modus voor verschillende voorkeuren
- **Visuele assets**: Screenshots en diagrammen voor beter begrip
- **Hulpintegratie**: Directe Discord-toegang voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Belangrijke navigatieherschikking en hoofdstukgebaseerd leersysteem
**Deze versie introduceert een uitgebreid hoofdstukgebaseerd leerstructuur met verbeterde navigatie door de gehele repository.**

#### Toegevoegd
- **📚 Hoofdstukgebaseerd leersysteem**: Volledige cursus hergestructureerd in 8 progressieve leerhoofdstukken
  - Hoofdstuk 1: Basis & Snelstart (⭐ - 30-45 min)
  - Hoofdstuk 2: AI-first ontwikkeling (⭐⭐ - 1-2 uur)
  - Hoofdstuk 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Hoofdstuk 4: Infrastructure as Code & Implementatie (⭐⭐⭐ - 1-1.5 uur)
  - Hoofdstuk 5: Multi-agent AI-oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Hoofdstuk 6: Pre-deploymentvalidatie & Planning (⭐⭐ - 1 uur)
  - Hoofdstuk 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 uur)
  - Hoofdstuk 8: Productie- & Enterprisepatronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten door alle documentatie
- **🎯 Voortgangsbewaking**: Checklist voor cursusvoltooiing en leerverificatiesysteem
- **🗺️ Leerpadbegeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingsnavigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gekoppeld

#### Verbeterd
- **README-structuur**: Getransformeerd naar een gestructureerd leerplatform met hoofdstukgebaseerde organisatie
- **Documentatienavigatie**: Elke pagina bevat nu hoofdstukcontext en voortgangsbegeleiding
- **Sjabloonorganisatie**: Voorbeelden en sjablonen gekoppeld aan de juiste leerhoofdstukken
- **Bronintegratie**: Cheat sheets, FAQ's en studiegidsen gekoppeld aan relevante hoofdstukken
- **Workshopintegratie**: Hands-on labs gekoppeld aan meerdere leerdoelen per hoofdstuk

#### Gewijzigd
- **Leerprogressie**: Verplaatst van lineaire documentatie naar flexibel hoofdstukgebaseerd leren
- **Plaatsing van configuratie**: Configuratiegids herplaatst als Hoofdstuk 3 voor betere leerstroom
- **Integratie van AI-inhoud**: Betere integratie van AI-specifieke inhoud doorheen het leertraject
- **Productie-inhoud**: Geavanceerde patronen geconsolideerd in Hoofdstuk 8 voor enterprise-leerlingen

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiecrumbs en voortgangsindicatoren per hoofdstuk
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudiger doorlopen van de cursus
- **Professionele presentatie**: Universiteitsachtige cursusstructuur geschikt voor academische en bedrijfsopleidingen
- **Leerefficiëntie**: Minder tijd om relevante inhoud te vinden dankzij verbeterde organisatie

#### Technische implementatie
- **Navigatiekoppen**: Gestandaardiseerde hoofdstuknavigatie over 40+ documentatiebestanden
- **Voeternavigatie**: Consistente voortgangsbegeleiding en indicatoren voor hoofdstukvoltooiing
- **Kruislinking**: Uitgebreid intern linkingsysteem dat gerelateerde concepten verbindt
- **Hoofdstukmapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Studiegidsverbetering
- **📚 Uitgebreide leerdoelen**: Studiegids hergestructureerd om overeen te komen met het 8-hoofdstukssysteem
- **🎯 Hoofdstukgebaseerde beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangsbewaking**: Wekelijks leerschema met meetbare resultaten en voltooiingschecklists
- **❓ Beoordelingsvragen**: Kennisvalidatievragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met echte implementatiescenario's en probleemoplossing
- **📊 Vaardigheidsprogressie**: Duidelijke voortgang van basisconcepten naar enterprisepatronen met focus op loopbaanontwikkeling
- **🎓 Certificeringskader**: Professionele ontwikkelingsresultaten en systeem voor communityerkenning
- **⏱️ Tijdlijnbeheer**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 2025-09-17

#### Verbeterde multi-agent AI-oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentnaamgeving en verbeterde documentatie.**

#### Gewijzigd
- **Multi-agentterminologie**: "Cora agent" vervangen door "Customer agent" in de hele retail multi-agentoplossing voor beter begrip
- **Agentarchitectuur**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt om consistente "Customer agent"-benaming te gebruiken
- **Configuratievoorbeelden**: Gemoderniseerde agentconfiguratiepatronen met bijgewerkte naamgevingsconventies
- **Documentatieconsistentie**: Gezorgd dat alle verwijzingen professionele, beschrijvende agentnamen gebruiken

#### Verbeterd
- **ARM-sjabloonpakket**: retail-multiagent-arm-template bijgewerkt met "Customer agent"-referenties
- **Architectuurdiagrammen**: Vernieuwde Mermaid-diagrammen met bijgewerkte agentnaamgeving
- **Codevoorbeelden**: Python-klassen en implementatievoorbeelden gebruiken nu CustomerAgent-naamgeving
- **Omgevingsvariabelen**: Alle deploymentscripts bijgewerkt om CUSTOMER_AGENT_NAME-conventies te gebruiken

#### Verbeterd
- **Developer Experience**: Duidelijkere agentrollen en verantwoordelijkheden in de documentatie
- **Production Readiness**: Betere afstemming op enterprise-naamgevingsconventies
- **Learning Materials**: Meer intuïtieve agentnaamgeving voor educatieve doeleinden
- **Template Usability**: Vereenvoudigd begrip van agentfuncties en implementatiepatronen

#### Technische details
- Bijgewerkte Mermaid-architectuurdiagrammen met CustomerAgent-referenties
- CoraAgent-klassenamen vervangen door CustomerAgent in Python-voorbeelden
- ARM-sjabloon JSON-configuraties gewijzigd om het agenttype "customer" te gebruiken
- Omgevingsvariabelen bijgewerkt van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle deploymentcommando's en containerconfiguraties ververst

### [v3.0.0] - 2025-09-12

#### Belangrijke wijzigingen - Focus op AI-ontwikkelaars en Microsoft Foundry-integratie
**Deze versie transformeert de repository in een uitgebreide, op AI gerichte leerbron met Microsoft Foundry-integratie.**

#### Toegevoegd
- **🤖 AI-First Learning Path**: Volledige herstructurering met prioriteit voor AI-ontwikkelaars en -ingenieurs
- **Microsoft Foundry Integration Guide**: Uitgebreide documentatie voor het koppelen van AZD aan Microsoft Foundry-services
- **AI Model Deployment Patterns**: Gedetailleerde gids over modelselectie, configuratie en strategieën voor productie-implementatie
- **AI Workshop Lab**: 2-3 uur hands-on workshop voor het omzetten van AI-toepassingen naar oplossingen die met AZD kunnen worden uitgerold
- **Production AI Best Practices**: Enterprise-klare patronen voor schalen, monitoren en beveiligen van AI-workloads
- **AI-Specific Troubleshooting Guide**: Uitgebreide probleemoplossing voor Azure OpenAI, Cognitive Services en AI-implementatieproblemen
- **AI Template Gallery**: Uitgelichte verzameling Microsoft Foundry-sjablonen met complexiteitsbeoordelingen
- **Workshop Materials**: Volledige workshopstructuur met hands-on labs en referentiematerialen

#### Verbeterd
- **README Structure**: Gericht op AI-ontwikkelaars met 45% community-interessegegevens van de Microsoft Foundry Discord
- **Learning Paths**: Toegewijde AI-ontwikkelaarsreis naast traditionele trajecten voor studenten en DevOps-ingenieurs
- **Template Recommendations**: Uitgelichte AI-sjablonen inclusief azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community Integration**: Verbeterde Discord-communityondersteuning met AI-specifieke kanalen en discussies

#### Beveiliging & Productiefocus
- **Managed Identity Patterns**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Cost Optimization**: Volgen van tokengebruik en budgetcontroles voor AI-workloads
- **Multi-Region Deployment**: Strategieën voor wereldwijde implementatie van AI-toepassingen
- **Performance Monitoring**: AI-specifieke metrics en integratie met Application Insights

#### Documentatiekwaliteit
- **Linear Course Structure**: Logische voortgang van beginner tot geavanceerde AI-implementatiepatronen
- **Validated URLs**: Alle externe repositorylinks geverifieerd en toegankelijk
- **Complete Reference**: Alle interne documentatielinks gevalideerd en functioneel
- **Production Ready**: Enterprise-implementatiepatronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Belangrijke wijzigingen - Herstructurering van repository en professionele verbeteringen
**Deze versie vertegenwoordigt een ingrijpende revisie van de repository-structuur en de presentatie van de inhoud.**

#### Toegevoegd
- **Structured Learning Framework**: Alle documentatiepagina's bevatten nu secties Introductie, Leerdoelen en Leerresultaten
- **Navigation System**: Vorige/Volgende-leslinks toegevoegd door de hele documentatie voor begeleide leerprogressie
- **Study Guide**: Uitgebreide study-guide.md met leerdoelen, oefenopdrachten en beoordelingsmaterialen
- **Professional Presentation**: Alle emoji-pictogrammen verwijderd voor verbeterde toegankelijkheid en een professionele uitstraling
- **Enhanced Content Structure**: Verbeterde organisatie en stroom van leermaterialen

#### Gewijzigd
- **Documentation Format**: Alle documentatie gestandaardiseerd met een consistente leergerichte structuur
- **Navigation Flow**: Logische voortgang door alle leermaterialen geïmplementeerd
- **Content Presentation**: Decoratieve elementen verwijderd ten gunste van duidelijke, professionele opmaak
- **Link Structure**: Alle interne links bijgewerkt om het nieuwe navigatiesysteem te ondersteunen

#### Verbeterd
- **Accessibility**: Emoji-afhankelijkheden verwijderd voor betere compatibiliteit met schermlezers
- **Professional Appearance**: Schone, academische presentatie geschikt voor enterprise-leren
- **Learning Experience**: Gestructureerde aanpak met duidelijke doelen en uitkomsten voor elke les
- **Content Organization**: Betere logische stroom en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Initiële release - Uitgebreide AZD-leerrepository

#### Toegevoegd
- **Core Documentation Structure**
  - Volledige getting-started gidsserie
  - Uitgebreide documentatie over deployment en provisioning
  - Gedetailleerde probleemoplossingsbronnen en debuggidsen
  - Pre-deployment validatiehulpmiddelen en procedures

- **Getting Started Module**
  - AZD Basics: Kernconcepten en terminologie
  - Installation Guide: Platformspecifieke installatie-instructies
  - Configuration Guide: Omgevingsconfiguratie en authenticatie
  - First Project Tutorial: Stapsgewijze hands-on leerervaring

- **Deployment and Provisioning Module**
  - Deployment Guide: Volledige workflowdocumentatie
  - Provisioning Guide: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Multi-service architectuurpatronen

- **Pre-deployment Validation Module**
  - Capacity Planning: Validatie van beschikbaarheid van Azure-resources
  - SKU Selection: Uitgebreide richtlijnen voor servicetiers
  - Pre-flight Checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Kostenschatting en budgetplanningshulpmiddelen

- **Troubleshooting Module**
  - Common Issues: Veelvoorkomende problemen en oplossingen
  - Debugging Guide: Systematische probleemoplossingsmethodologieën
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Resources and References**
  - Command Cheat Sheet: Snelle referentie voor essentiële commando's
  - Glossary: Uitgebreide terminologie- en acroniemdefinities
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Externe bronnenlinks en communityverbindingen

- **Examples and Templates**
  - Voorbeeld van een eenvoudige webapplicatie
  - Implementatiesjabloon voor statische website
  - Configuratie van containerapplicatie
  - Patronen voor database-integratie
  - Voorbeelden van microservices-architectuur
  - Implementaties van serverless-functies

#### Kenmerken
- **Multi-Platform Support**: Installatie- en configuratiegidsen voor Windows, macOS en Linux
- **Multiple Skill Levels**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Practical Focus**: Hands-on voorbeelden en scenario's uit de praktijk
- **Comprehensive Coverage**: Van basisconcepten tot geavanceerde enterprise-patronen
- **Security-First Approach**: Beveiligingsbest practices geïntegreerd door de hele inhoud
- **Cost Optimization**: Richtlijnen voor kosteneffectieve implementaties en resourcebeheer

#### Documentatiekwaliteit
- **Detailed Code Examples**: Praktische, geteste codevoorbeelden
- **Step-by-Step Instructions**: Duidelijke, uitvoerbare instructies
- **Comprehensive Error Handling**: Probleemoplossing voor veelvoorkomende problemen
- **Best Practices Integration**: Industriestandaarden en aanbevelingen
- **Version Compatibility**: Up-to-date met de nieuwste Azure-services en azd-functies

## Geplande toekomstige verbeteringen

### Versie 3.1.0 (Gepland)
#### AI-platformuitbreiding
- **Multi-Model Support**: Integratiepatronen voor Hugging Face, Azure Machine Learning en aangepaste modellen
- **AI Agent Frameworks**: Sjablonen voor LangChain-, Semantic Kernel- en AutoGen-implementaties
- **Advanced RAG Patterns**: Vector-database-opties voorbij Azure AI Search (Pinecone, Weaviate, enz.)
- **AI Observability**: Verbeterde monitoring voor modelprestaties, tokengebruik en antwoordkwaliteit

#### Ontwikkelaarservaring
- **VS Code Extension**: Geïntegreerde AZD + AI Foundry ontwikkelervaring
- **GitHub Copilot Integration**: AI-ondersteunde AZD-sjabloongeneratie
- **Interactive Tutorials**: Hands-on codeeropdrachten met geautomatiseerde validatie voor AI-scenario's
- **Video Content**: Aanvullende videotutorials voor visuele leerlingen met focus op AI-implementaties

### Versie 4.0.0 (Gepland)
#### Enterprise AI-patronen
- **Governance Framework**: AI-modelgovernance, compliance en audittrajecten
- **Multi-Tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-diensten
- **Edge AI Deployment**: Integratie met Azure IoT Edge en containerinstances
- **Hybrid Cloud AI**: Multi-cloud- en hybride implementatiepatronen voor AI-workloads

#### Geavanceerde functies
- **AI Pipeline Automation**: MLOps-integratie met Azure Machine Learning-pijplijnen
- **Advanced Security**: Zero-trust-patronen, private endpoints en geavanceerde bedreigingsbescherming
- **Performance Optimization**: Geavanceerde afstemmings- en schaalstrategieën voor AI-toepassingen met hoge doorvoer
- **Global Distribution**: Content delivery- en edge-cachingpatronen voor AI-toepassingen

### Versie 3.0.0 (Gepland) - Overtroffen door huidige release
#### Voorgestelde toevoegingen - Nu geïmplementeerd in v3.0.0
- ✅ **AI-Focused Content**: Uitgebreide Microsoft Foundry-integratie (Voltooid)
- ✅ **Interactive Tutorials**: Hands-on AI-workshoplab (Voltooid)
- ✅ **Advanced Security Module**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Performance Optimization**: Afstemmingsstrategieën voor AI-workloads (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Sommige voltooid in de huidige release
- ✅ **Additional Examples**: AI-gerichte implementatiescenario's (Voltooid)
- ✅ **Extended FAQ**: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Tool Integration**: Verbeterde IDE- en editorintegratiegidsen
- ✅ **Monitoring Expansion**: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Nog gepland voor toekomstige release
- **Mobile-Friendly Documentation**: Responsief ontwerp voor mobiel leren
- **Offline Access**: Downloadbare documentatiepakketten
- **Enhanced IDE Integration**: VS Code-extensie voor AZD + AI-workflows
- **Community Dashboard**: Realtime communitymetriek en bijdrage-tracking

## Bijdragen aan de changelog

### Wijzigingen melden
Wanneer je bijdraagt aan deze repository, zorg er dan voor dat changelog-items het volgende bevatten:

1. **Version Number**: Volgend op semantische versievoering (major.minor.patch)
2. **Date**: Release- of update-datum in YYYY-MM-DD-indeling
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Bondige beschrijving van wat er is veranderd
5. **Impact Assessment**: Hoe veranderingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leermaterialen
- Extra tools, scripts of hulpprogramma's

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates om duidelijkheid of nauwkeurigheid te verbeteren
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties gepland voor verwijdering
- Methoden die betere alternatieven hebben

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of uitgefaseerde benaderingen
- Redundante of samengevoegde inhoud

#### Opgelost
- Correcties van fouten in documentatie of code
- Oplossing van gemelde problemen of issues
- Verbeteringen aan nauwkeurigheid of functionaliteit

#### Beveiliging
- Beveiligingsgerelateerde verbeteringen of fixes
- Updates van beveiligingsbest practices
- Oplossing van beveiligingslekken

### Richtlijnen voor semantische versievoering

#### Major-versie (X.0.0)
- Brekende wijzigingen die gebruikersactie vereisen
- Ingrijpende herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie wijzigen

#### Minor-versie (X.Y.0)
- Nieuwe functies of inhoudelijke toevoegingen
- Verbeteringen die achterwaartse compatibiliteit behouden
- Extra voorbeelden, tools of middelen

#### Patch-versie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Communityfeedback en suggesties

We moedigen actief feedback uit de community aan om deze leerbron te verbeteren:

### Hoe feedback te geven
- **GitHub Issues**: Meld problemen of stel verbeteringen voor (AI-specifieke issues welkom)
- **Discord Discussions**: Deel ideeën en ga in gesprek met de Microsoft Foundry-community
- **Pull Requests**: Draag directe verbeteringen aan de inhoud bij, vooral AI-sjablonen en gidsen
- **Microsoft Foundry Discord**: Neem deel aan het #Azure-kanaal voor AZD + AI-discussies
- **Community Forums**: Neem deel aan bredere Azure-ontwikkelaarsdiscussies

### Feedbackcategorieën
- **AI Content Accuracy**: Correcties aan AI-service-integratie en implementatie-informatie
- **Learning Experience**: Suggesties voor een verbeterde leerflow voor AI-ontwikkelaars
- **Missing AI Content**: Verzoeken om extra AI-sjablonen, patronen of voorbeelden
- **Accessibility**: Verbeteringen voor diverse leerbehoeften
- **AI Tool Integration**: Suggesties voor betere integratie van AI-ontwikkelworkflows
- **Production AI Patterns**: Verzoeken voor enterprise AI-implementatiepatronen

### Reactieverplichting
- **Issue Response**: Binnen 48 uur voor gerapporteerde problemen
- **Feature Requests**: Evaluatie binnen een week
- **Community Contributions**: Review binnen een week
- **Security Issues**: Directe prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige updates
- **Monthly Reviews**: Inhoudsnauwkeurigheid en linkvalidatie
- **Quarterly Updates**: Belangrijke inhoudelijke toevoegingen en verbeteringen
- **Semi-Annual Reviews**: Omvattende herstructurering en verbetering
- **Annual Releases**: Grote versie-updates met significante verbeteringen

### Monitoring en kwaliteitswaarborging
- **Automated Testing**: Regelmatige validatie van codevoorbeelden en links
- **Community Feedback Integration**: Regelmatige opname van gebruikerssuggesties
- **Technology Updates**: Afstemming op de nieuwste Azure-services en azd-releases
- **Accessibility Audits**: Regelmatige beoordeling op inclusieve ontwerprincipes

## Versieondersteuningsbeleid

### Huidige versie-ondersteuning
- **Latest Major Version**: Volledige ondersteuning met regelmatige updates
- **Previous Major Version**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Legacy Versions**: Alleen communityondersteuning, geen officiële updates

### Migratiehandleiding
Wanneer grote versies worden uitgebracht, bieden we:
- **Migratiegidsen**: Stapsgewijze instructies voor de overgang
- **Compatibiliteitsnotities**: Details over brekende wijzigingen
- **Ondersteuning voor tools**: Scripts of hulpprogramma's om bij de migratie te helpen
- **Ondersteuning vanuit de community**: Toegewijde forums voor vragen over migratie

---

**Navigatie**
- **Vorige les**: [Studiegids](resources/study-guide.md)
- **Volgende les**: Terug naar [Hoofd-README](README.md)

**Blijf op de hoogte**: Houd deze repository in de gaten voor meldingen over nieuwe releases en belangrijke updates van het lesmateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->