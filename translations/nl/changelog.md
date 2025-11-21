<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-21T16:16:28+00:00",
  "source_file": "changelog.md",
  "language_code": "nl"
}
-->
# Changelog - AZD Voor Beginners

## Introductie

Deze changelog documenteert alle belangrijke wijzigingen, updates en verbeteringen aan de AZD Voor Beginners-repository. We volgen de principes van semantische versiebeheer en houden dit logboek bij om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door deze changelog te bekijken, kun je:
- Op de hoogte blijven van nieuwe functies en toevoegingen aan de inhoud
- Begrijpen welke verbeteringen zijn aangebracht aan bestaande documentatie
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het leermateriaal door de tijd heen volgen

## Leerresultaten

Na het bekijken van de changelog-items kun je:
- Nieuwe inhoud en beschikbare leermiddelen identificeren
- Begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leerpad plannen op basis van het meest actuele materiaal
- Feedback en suggesties geven voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.8.0] - 2025-11-19

#### Geavanceerde Documentatie: Monitoring, Beveiliging en Multi-Agent Patronen
**Deze versie voegt uitgebreide A-klasse lessen toe over Application Insights-integratie, authenticatiepatronen en multi-agent coördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Les over Application Insights-integratie**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gerichte implementatie met automatische provisioning
  - Volledige Bicep-sjablonen voor Application Insights + Log Analytics
  - Werkende Python-applicaties met aangepaste telemetrie (1.200+ regels)
  - AI/LLM-monitoringpatronen (Azure OpenAI token-/kostenregistratie)
  - 6 Mermaid-diagrammen (architectuur, gedistribueerde tracing, telemetriestroom)
  - 3 praktische oefeningen (alerts, dashboards, AI-monitoring)
  - Kusto-queryvoorbeelden en kostenoptimalisatiestrategieën
  - Live metrics streaming en real-time debugging
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Les over Authenticatie- en Beveiligingspatronen**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Volledige Bicep-infrastructuursjablonen voor veilige implementaties
  - Node.js-applicatiecode met Azure SDK-integratie
  - 3 volledige oefeningen (managed identity inschakelen, user-assigned identity, Key Vault-rotatie)
  - Beveiligingsbest practices en RBAC-configuraties
  - Probleemoplossingsgids en kostenanalyse
  - Productieklare wachtwoordloze authenticatiepatronen

- **🤖 Les over Multi-Agent Coördinatiepatronen**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, event-driven, consensus)
  - Volledige implementatie van orchestrator-service (Python/Flask, 1.500+ regels)
  - 3 gespecialiseerde agent-implementaties (Research, Writer, Editor)
  - Service Bus-integratie voor berichtwachtrijen
  - Cosmos DB-statusbeheer voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 geavanceerde oefeningen (timeout handling, retry logic, circuit breaker)
  - Kostenoverzicht ($240-565/maand) met optimalisatiestrategieën
  - Application Insights-integratie voor monitoring

#### Verbeterd
- **Hoofdstuk Pre-deployment**: Nu inclusief uitgebreide monitoring- en coördinatiepatronen
- **Hoofdstuk Getting Started**: Verbeterd met professionele authenticatiepatronen
- **Productieklaar**: Volledige dekking van beveiliging tot observability
- **Cursusoverzicht**: Bijgewerkt om nieuwe lessen in hoofdstukken 3 en 6 te refereren

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring door de hele cursus
- **Documentatiekwaliteit**: Consistente A-klasse standaarden (95-97%) in nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor bedrijfsimplementaties

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijk pad van ontwikkeling naar productiemonitoring
- **Beveiligingsstandaarden**: Professionele patronen voor authenticatie en geheimenbeheer
- **Observability**: Volledige Application Insights-integratie met AZD
- **AI Workloads**: Gespecialiseerde monitoring voor Azure OpenAI en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen snippets)
- ✅ Mermaid-diagrammen voor visueel leren (19 totaal in 3 lessen)
- ✅ Praktische oefeningen met verificatiestappen (9 totaal)
- ✅ Productieklare Bicep-sjablonen implementeerbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Probleemoplossingsgidsen en best practices
- ✅ Kennischeckpoints met verificatiecommando's

#### Documentatiebeoordelingsresultaten
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringgids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agent architecturen
- **Nieuwe inhoud in het algemeen**: - Consistente hoge kwaliteitsstandaarden

#### Technische Implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + gedistribueerde tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live metrics + Kusto-queries + alerts + dashboards
- **Kostenbeheer**: Samplingstrategieën, retentiebeleid, budgetcontrole

### [v3.7.0] - 2025-11-19

#### Verbeteringen in Documentatiekwaliteit en Nieuw Azure OpenAI Voorbeeld
**Deze versie verbetert de documentatiekwaliteit in de hele repository en voegt een volledig Azure OpenAI-implementatievoorbeeld toe met GPT-4 chatinterface.**

#### Toegevoegd
- **🤖 Azure OpenAI Chat Voorbeeld**: Volledige GPT-4 implementatie met werkende uitvoering in `examples/azure-openai-chat/`:
  - Complete Azure OpenAI-infrastructuur (GPT-4 modelimplementatie)
  - Python command-line chatinterface met gespreksgeschiedenis
  - Key Vault-integratie voor veilige opslag van API-sleutels
  - Tokengebruikregistratie en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiegids
  - 11 productieklare bestanden (Bicep-sjablonen, Python-app, configuratie)
- **📚 Documentatieoefeningen**: Praktische oefeningen toegevoegd aan configuratiegids:
  - Oefening 1: Multi-omgeving configuratie (15 minuten)
  - Oefening 2: Geheimenbeheer praktijk (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Implementatieverificatie**: Verificatiesectie toegevoegd aan implementatiegids:
  - Gezondheidscontroleprocedures
  - Checklist succescriteria
  - Verwachte outputs voor alle implementatiecommando's
  - Snelle referentie voor probleemoplossing

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-klasse kwaliteit (93%):
  - Azure-openai-chat toegevoegd aan alle relevante secties
  - Lokale voorbeeldtelling bijgewerkt van 3 naar 4
  - Toegevoegd aan AI Application Examples tabel
  - Geïntegreerd in Quick Start voor Intermediate Users
  - Toegevoegd aan Azure AI Foundry Templates sectie
  - Vergelijkingsmatrix en technologiezoeksecties bijgewerkt
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) in de hele docs-map:
  - Verwachte outputs toegevoegd aan kritieke commando-voorbeelden
  - Verificatiestappen opgenomen voor configuratiewijzigingen
  - Praktisch leren verbeterd met praktische oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor intermediate learners
- **Documentatiestructuur**: Meer actiegerichte oefeningen met duidelijke resultaten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ontwikkelaarservaring**: Azure OpenAI-implementatie duurt nu 35-45 minuten (vs 60-90 voor complexe alternatieven)
- **Kostenoverzicht**: Duidelijke kostenramingen ($50-200/maand) voor Azure OpenAI-voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben een duidelijk startpunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte outputs en verificatiestappen

#### Gevalideerd
- ✅ Azure OpenAI-voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met de werkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op 8+ locaties
- ✅ Voorbeeldenindex weerspiegelt nauwkeurig 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatiereferenties correct

#### Technische Implementatie
- **Azure OpenAI Architectuur**: GPT-4 + Key Vault + Container Apps patroon
- **Beveiliging**: Managed Identity klaar, geheimen in Key Vault
- **Monitoring**: Application Insights-integratie
- **Kostenbeheer**: Tokenregistratie en gebruiksoptimalisatie
- **Implementatie**: Eén `azd up` commando voor volledige setup

### [v3.6.0] - 2025-11-19

#### Grote Update: Container App Implementatievoorbeelden
**Deze versie introduceert uitgebreide, productieklare containerapplicatie-implementatievoorbeelden met Azure Developer CLI (AZD), inclusief volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App Voorbeelden**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Compleet overzicht van containerized implementaties, quick start, productie en geavanceerde patronen
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api): Beginnersvriendelijke REST API met scale-to-zero, health probes, monitoring en probleemoplossing
  - [Microservices Architectuur](../../examples/container-app/microservices): Productieklare multi-service implementatie (API Gateway, Product, Order, User, Notification), asynchrone berichten, Service Bus, Cosmos DB, Azure SQL, gedistribueerde tracing, blue-green/canary implementatie
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD-richtlijnen voor containerized workloads
- **Codevoorbeelden**: Volledige `azure.yaml`, Bicep-sjablonen en meertalige service-implementaties (Python, Node.js, C#, Go)
- **Testen & Probleemoplossing**: End-to-end testscenario's, monitoringcommando's, probleemoplossingsrichtlijnen

#### Gewijzigd
- **README.md**: Bijgewerkt om nieuwe containerapp-voorbeelden te vermelden en te linken onder "Lokale Voorbeelden - Container Applicaties"
- **examples/README.md**: Bijgewerkt om containerapp-voorbeelden te benadrukken, vergelijkingsmatrix-items toe te voegen en technologie-/architectuurreferenties bij te werken
- **Cursusoverzicht & Studiegids**: Bijgewerkt om nieuwe containerapp-voorbeelden en implementatiepatronen in relevante hoofdstukken te refereren

#### Gevalideerd
- ✅ Alle nieuwe voorbeelden implementeerbaar met `azd up` en volgen best practices
- ✅ Documentatie cross-links en navigatie bijgewerkt
- ✅ Voorbeelden dekken beginners- tot geavanceerde scenario's, inclusief productie-microservices

#### Notities
- **Scope**: Engelse documentatie en voorbeelden alleen
- **Volgende stappen**: Uitbreiden met aanvullende geavanceerde containerpatronen en CI/CD-automatisering in toekomstige releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Deze versie implementeert een uitgebreide productnaamwijziging van "Azure AI Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, in lijn met de officiële rebranding van Microsoft.**

#### Gewijzigd
- **🔄 Productnaamupdate**: Volledige rebranding van "Azure AI Foundry" naar "Microsoft Foundry"
  - Alle referenties bijgewerkt in Engelse documentatie in de `docs/` map
  - Map hernoemd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestand hernoemd: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsreferenties bijgewerkt in 7 documentatiebestanden

- **📁 Mapstructuurwijzigingen**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen bijgewerkt om nieuwe mapstructuur te reflecteren
  - Navigatielinks gevalideerd in alle documentatie

- **📄 Bestandshernoemingen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links bijgewerkt om nieuwe bestandsnaam te refereren

#### Bijgewerkte bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielinkupdates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamreferenties bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Al gebruikmakend van Microsoft Foundry (van eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenties bijgewerkt (overzicht, community feedback, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingslinks bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 volgende hoofdstuklinks bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenties bijgewerkt (navigatie, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Cursusstructuurbestanden** (2 bestanden):
  - `README.md` - 17 referenties bijgewerkt (cursusoverzicht, hoofdstuktitels, templates-sectie, community-inzichten)
  - `course-outline.md` - 14 referenties bijgewerkt (overzicht, leerdoelen, hoofdstukbronnen)

#### Gevalideerd
- ✅ Geen resterende "ai-foundry" map padreferenties in Engelse docs
- ✅ Geen resterende "Azure AI Foundry" productnaamreferenties in Engelse docs
- ✅ Alle navigatielinks functioneel met nieuwe mapstructuur
- ✅ Bestand- en maphernoemingen succesvol afgerond
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Notities
- **Scope**: Wijzigingen toegepast op Engelse documentatie in de `docs/` map alleen
- **Vertalingen**: Vertalingsmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmaterialen (`workshop/`) zijn in deze versie niet bijgewerkt
- **Voorbeelden**: Voorbeeldbestanden kunnen nog steeds verwijzen naar oude naamgeving (wordt aangepakt in een toekomstige update)
- **Externe Links**: Externe URL's en verwijzingen naar GitHub-repository's blijven ongewijzigd

#### Migratiehandleiding voor bijdragers
Als je lokale branches of documentatie hebt die verwijzen naar de oude structuur:
1. Werk mapverwijzingen bij: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Werk bestandsverwijzingen bij: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Azure AI Foundry" → "Microsoft Foundry"
4. Controleer of alle interne documentatielinks nog steeds werken

---

### [v3.4.0] - 2025-10-24

#### Voorbeeld van infrastructuur en verbeteringen in validatie
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe Azure Developer CLI-previewfunctie en verbetert de workshopgebruikerservaring.**

#### Toegevoegd
- **🧪 azd provision --preview Functiedocumentatie**: Uitgebreide dekking van de nieuwe infrastructuur-previewmogelijkheid
  - Commandoreferentie en gebruiksvoorbeelden in een spiekbriefje
  - Gedetailleerde integratie in de provisioning-gids met use cases en voordelen
  - Integratie van pre-flight checks voor veiligere implementatievalidatie
  - Updates in de startersgids met een focus op veilige implementatiepraktijken
- **🚧 Workshopstatusbanner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Ontwerp met kleurverloop en bouwindicatoren voor duidelijke communicatie
  - Laatst bijgewerkt tijdstempel voor transparantie
  - Mobiel responsief ontwerp voor alle apparaattypen

#### Verbeterd
- **Infrastructuurveiligheid**: Previewfunctionaliteit geïntegreerd in de hele implementatiedocumentatie
- **Pre-implementatievalidatie**: Geautomatiseerde scripts bevatten nu tests voor infrastructuur-preview
- **Ontwikkelaarsworkflow**: Bijgewerkte commandoreeksen met preview als beste praktijk
- **Workshopervaring**: Duidelijke verwachtingen voor gebruikers over de ontwikkelingsstatus van de inhoud

#### Gewijzigd
- **Beste implementatiepraktijken**: Workflow met preview als aanbevolen aanpak
- **Documentatiestroom**: Validatie van infrastructuur eerder in het leerproces geplaatst
- **Workshoppresentatie**: Professionele statuscommunicatie met duidelijke ontwikkelingsplanning

#### Verbeterd
- **Veiligheidsgerichte aanpak**: Infrastructuurwijzigingen kunnen nu worden gevalideerd vóór implementatie
- **Teamwork**: Previewresultaten kunnen worden gedeeld voor beoordeling en goedkeuring
- **Kostenbewustzijn**: Beter inzicht in resourcekosten vóór provisioning
- **Risicobeperking**: Verminderde implementatiefouten door voorafgaande validatie

#### Technische implementatie
- **Integratie in meerdere documenten**: Previewfunctie gedocumenteerd in 4 belangrijke bestanden
- **Commandopatronen**: Consistente syntaxis en voorbeelden in de hele documentatie
- **Integratie van beste praktijken**: Preview opgenomen in validatieworkflows en scripts
- **Visuele indicatoren**: Duidelijke markeringen van NIEUWE functies voor betere vindbaarheid

#### Workshopinfrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met kleurverloopstijl
- **Gebruikerservaring**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professionele presentatie**: Behoudt de geloofwaardigheid van de repository terwijl verwachtingen worden gesteld
- **Tijdlijntransparantie**: Laatst bijgewerkt tijdstempel van oktober 2025 voor verantwoording

### [v3.3.0] - 2025-09-24

#### Verbeterde workshopmaterialen en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve gidsen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve workshopgids**: Browsergebaseerde workshopervaring met MkDocs-previewmogelijkheid
- **📝 Gestructureerde workshopinstructies**: 7-staps geleid leerpad van ontdekking tot maatwerk
  - 0-Introductie: Overzicht en setup van de workshop
  - 1-Selecteer-AI-Sjabloon: Proces van sjabloonontdekking en selectie
  - 2-Valideer-AI-Sjabloon: Implementatie- en validatieprocedures
  - 3-Deconstrueer-AI-Sjabloon: Begrip van sjabloonarchitectuur
  - 4-Configureer-AI-Sjabloon: Configuratie en aanpassing
  - 5-Personaliseer-AI-Sjabloon: Geavanceerde aanpassingen en iteraties
  - 6-Opruimen-Infrastructuur: Opruimen en resourcebeheer
  - 7-Afsluiting: Samenvatting en volgende stappen
- **🛠️ Workshoptools**: MkDocs-configuratie met Material-thema voor verbeterde leerervaring
- **🎯 Praktisch leerpad**: 3-stapsmethodologie (Ontdekking → Implementatie → Aanpassing)
- **📱 GitHub Codespaces-integratie**: Naadloze setup van ontwikkelomgevingen

#### Verbeterd
- **AI Workshop Lab**: Uitgebreid met een gestructureerde leerervaring van 2-3 uur
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van sjabloonselectie tot productie-implementatie
- **Ontwikkelaarservaring**: Geïntegreerde tools voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browsergebaseerde interface met zoek-, kopieerfunctionaliteit en thema-toggle
- **Zelfstandig leren**: Flexibele workshopstructuur die verschillende leertempo's ondersteunt
- **Praktische toepassing**: Realistische scenario's voor AI-sjabloonimplementatie
- **Community-integratie**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshopkenmerken
- **Ingebouwde zoekfunctie**: Snel trefwoorden en lessen vinden
- **Codeblokken kopiëren**: Hover-to-copy functionaliteit voor alle codevoorbeelden
- **Thema-toggle**: Ondersteuning voor donker/licht modus voor verschillende voorkeuren
- **Visuele hulpmiddelen**: Screenshots en diagrammen voor beter begrip
- **Hulpintegratie**: Directe toegang tot Discord voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Grote navigatieherstructurering en hoofdstukgebaseerd leersysteem
**Deze versie introduceert een uitgebreid hoofdstukgebaseerd leerstructuur met verbeterde navigatie door de hele repository.**

#### Toegevoegd
- **📚 Hoofdstukgebaseerd leersysteem**: Hele cursus hergestructureerd in 8 progressieve leerhoofdstukken
  - Hoofdstuk 1: Basis & Snelstart (⭐ - 30-45 min)
  - Hoofdstuk 2: AI-First Ontwikkeling (⭐⭐ - 1-2 uur)
  - Hoofdstuk 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Hoofdstuk 4: Infrastructuur als Code & Implementatie (⭐⭐⭐ - 1-1,5 uur)
  - Hoofdstuk 5: Multi-Agent AI Oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Hoofdstuk 6: Pre-Implementatievalidatie & Planning (⭐⭐ - 1 uur)
  - Hoofdstuk 7: Probleemoplossing & Debugging (⭐⭐ - 1-1,5 uur)
  - Hoofdstuk 8: Productie & Enterprise Patronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten in alle documentatie
- **🎯 Voortgangstracking**: Checklist voor cursusvoltooiing en leerverificatiesysteem
- **🗺️ Leerpadenbegeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingsnavigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gelinkt

#### Verbeterd
- **README-structuur**: Getransformeerd in een gestructureerd leerplatform met hoofdstukgebaseerde organisatie
- **Documentatienavigatie**: Elke pagina bevat nu hoofdstukcontext en voortgangsbegeleiding
- **Sjabloonorganisatie**: Voorbeelden en sjablonen gekoppeld aan relevante leerhoofdstukken
- **Resource-integratie**: Spiekbriefjes, FAQ's en studiegidsen verbonden met relevante hoofdstukken
- **Workshopintegratie**: Hands-on labs gekoppeld aan meerdere leerdoelen van hoofdstukken

#### Gewijzigd
- **Leerprogressie**: Overgestapt van lineaire documentatie naar flexibel hoofdstukgebaseerd leren
- **Configuratieplaatsing**: Configuratiegids verplaatst naar Hoofdstuk 3 voor betere leerstroom
- **AI-inhoudsintegratie**: Betere integratie van AI-specifieke inhoud door de hele leerreis
- **Productie-inhoud**: Geavanceerde patronen geconsolideerd in Hoofdstuk 8 voor enterprise-lerenden

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiebroodkruimels en hoofdstukvoortgangsindicatoren
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudigere cursusverkenning
- **Professionele presentatie**: Universiteitsstijl cursusstructuur geschikt voor academische en zakelijke training
- **Leerefficiëntie**: Verminderde tijd om relevante inhoud te vinden door verbeterde organisatie

#### Technische implementatie
- **Navigatiekoppen**: Gestandaardiseerde hoofdstuknavigatie in meer dan 40 documentatiebestanden
- **Voettekstnavigatie**: Consistente voortgangsbegeleiding en hoofdstukvoltooiingsindicatoren
- **Kruisverwijzingen**: Uitgebreid intern linkensysteem dat gerelateerde concepten verbindt
- **Hoofdstukmapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Studiegidsverbetering
- **📚 Uitgebreide leerdoelen**: Studiegids hergestructureerd om aan te sluiten bij het 8-hoofdstukkensysteem
- **🎯 Hoofdstukgebaseerde beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangstracking**: Wekelijks leerschema met meetbare resultaten en voltooiingschecklists
- **❓ Beoordelingsvragen**: Kennisvalidatievragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met echte implementatiescenario's en probleemoplossing
- **📊 Vaardigheidsprogressie**: Duidelijke vooruitgang van basisconcepten naar enterprise-patronen met focus op loopbaanontwikkeling
- **🎓 Certificeringskader**: Professionele ontwikkelingsresultaten en erkenning binnen de community
- **⏱️ Tijdlijnbeheer**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 2025-09-17

#### Verbeterde Multi-Agent AI Oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentbenamingen en verbeterde documentatie.**

#### Gewijzigd
- **Multi-Agent Terminologie**: "Cora agent" vervangen door "Customer agent" in de retail multi-agent oplossing voor meer duidelijkheid
- **Agentarchitectuur**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt met consistente "Customer agent"-benaming
- **Configuratievoorbeelden**: Gemoderniseerde agentconfiguratiepatronen met bijgewerkte naamgevingsconventies
- **Documentatieconsistentie**: Alle verwijzingen maken gebruik van professionele, beschrijvende agentnamen

#### Verbeterd
- **ARM-sjabloonpakket**: Bijgewerkt retail-multiagent-arm-template met Customer agent-verwijzingen
- **Architectuurdiagrammen**: Vernieuwde Mermaid-diagrammen met bijgewerkte agentbenamingen
- **Codevoorbeelden**: Python-klassen en implementatievoorbeelden gebruiken nu CustomerAgent-benaming
- **Omgevingsvariabelen**: Alle implementatiescripts bijgewerkt naar CUSTOMER_AGENT_NAME-conventies

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijkere agentrollen en verantwoordelijkheden in documentatie
- **Productiegereedheid**: Betere afstemming met enterprise naamgevingsconventies
- **Leermaterialen**: Intuïtievere agentbenamingen voor educatieve doeleinden
- **Sjabloongebruik**: Vereenvoudigd begrip van agentfuncties en implementatiepatronen

#### Technische details
- Bijgewerkte Mermaid-architectuurdiagrammen met CustomerAgent-verwijzingen
- CoraAgent-klassenamen vervangen door CustomerAgent in Python-voorbeelden
- ARM-sjabloon JSON-configuraties aangepast naar "customer" agenttype
- Omgevingsvariabelen gewijzigd van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle implementatiecommando's en containerconfiguraties vernieuwd

### [v3.0.0] - 2025-09-12

#### Grote wijzigingen - AI-ontwikkelaarsfocus en Azure AI Foundry-integratie
**Deze versie transformeert de repository in een uitgebreide AI-georiënteerde leerbron met Azure AI Foundry-integratie.**

#### Toegevoegd
- **🤖 AI-First Leerpad**: Complete herstructurering met prioriteit voor AI-ontwikkelaars en ingenieurs
- **Azure AI Foundry Integratiegids**: Uitgebreide documentatie voor het verbinden van AZD met Azure AI Foundry-services
- **AI Model Implementatiepatronen**: Gedetailleerde gids over modelselectie, configuratie en productie-implementatiestrategieën
- **AI Workshop Lab**: Hands-on workshop van 2-3 uur voor het omzetten van AI-toepassingen naar AZD-implementeerbare oplossingen
- **Productie AI Beste Praktijken**: Enterprise-ready patronen voor het schalen, monitoren en beveiligen van AI-workloads
- **AI-Specifieke Probleemoplossingsgids**: Uitgebreide probleemoplossing voor Azure OpenAI, Cognitive Services en AI-implementatieproblemen
- **AI Sjabloongalerij**: Uitgelichte collectie van Azure AI Foundry-sjablonen met complexiteitsbeoordelingen
- **Workshopmaterialen**: Complete workshopstructuur met hands-on labs en referentiematerialen

#### Verbeterd
- **README-structuur**: Gericht op AI-ontwikkelaars met 45% community-interessegegevens van Azure AI Foundry Discord
- **Leerpaden**: Toegewijd AI-ontwikkelaarsleerpad naast traditionele paden voor studenten en DevOps-ingenieurs
- **Sjabloonaanbevelingen**: Uitgelichte AI-sjablonen zoals azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community-integratie**: Verbeterde Discord-communityondersteuning met AI-specifieke kanalen en discussies

#### Veiligheid & Productiefocus
- **Beheerde Identiteitspatronen**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Kostenoptimalisatie**: Tokengebruikstracking en budgetcontroles voor AI-workloads
- **Multi-Region Implementatie**: Strategieën voor wereldwijde AI-toepassingsimplementatie
- **Prestatiemonitoring**: AI-specifieke statistieken en integratie met Application Insights

#### Documentatiekwaliteit
- **Lineaire cursusstructuur**: Logische progressie van beginner tot geavanceerde AI-implementatiepatronen
- **Gevalideerde URL's**: Alle externe repository-links geverifieerd en toegankelijk
- **Volledige referentie**: Alle interne documentatielinks gevalideerd en functioneel
- **Productiegereed**: Enterprise-implementatiepatronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Grote wijzigingen - Herstructurering van de repository en professionele verbetering
**Deze versie vertegenwoordigt een significante revisie van de repositorystructuur en inhoudspresentatie.**

#### Toegevoegd
- **Gestructureerd leerraamwerk**: Alle documentatiepagina's bevatten nu secties voor Introductie, Leerdoelen en Leerresultaten
- **Navigatiesysteem**: Toegevoegd Vorige/Volgende leslinks in alle documentatie voor begeleide leerprogressie
- **Studiegids**: Uitgebreide studiegids.md met leerdoelen, oefenopdrachten en beoordelingsmaterialen
- **Professionele presentatie**: Alle emoji-iconen verwijderd voor verbeterde toegankelijkheid en professionele uitstraling
- **Verbeterde inhoudsstructuur**: Betere organisatie en stroom van leermaterialen

#### Gewijzigd
- **Documentatieformaat**: Alle documentatie gestandaardiseerd met een consistente leergerichte structuur
- **Navigatiestroom**: Logische progressie geïmplementeerd door alle leermaterialen
- **Inhoudspresentatie**: Decoratieve elementen verwijderd ten gunste van een duidelijke, professionele opmaak
- **Linkstructuur**: Alle interne links bijgewerkt om het nieuwe navigatiesysteem te ondersteunen

#### Verbeterd
- **Toegankelijkheid**: Afhankelijkheid van emoji's verwijderd voor betere compatibiliteit met schermlezers
- **Professionele uitstraling**: Schone, academische stijl geschikt voor leren in een zakelijke omgeving
- **Leerervaring**: Gestructureerde aanpak met duidelijke doelen en resultaten voor elke les
- **Inhoudsorganisatie**: Betere logische volgorde en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Eerste release - Uitgebreide AZD-leerrepository

#### Toegevoegd
- **Kernstructuur documentatie**
  - Complete reeks handleidingen voor beginners
  - Uitgebreide documentatie over implementatie en provisioning
  - Gedetailleerde bronnen voor probleemoplossing en foutopsporing
  - Tools en procedures voor validatie vóór implementatie

- **Module voor beginners**
  - AZD-basisprincipes: Kernconcepten en terminologie
  - Installatiehandleiding: Platformspecifieke installatie-instructies
  - Configuratiehandleiding: Omgevingsinstellingen en authenticatie
  - Eerste project-tutorial: Stapsgewijs hands-on leren

- **Module implementatie en provisioning**
  - Implementatiehandleiding: Complete workflowdocumentatie
  - Provisioninghandleiding: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Patronen voor architectuur met meerdere services

- **Module validatie vóór implementatie**
  - Capaciteitsplanning: Validatie van beschikbaarheid van Azure-resources
  - SKU-selectie: Uitgebreide richtlijnen voor servicetiers
  - Pre-flight checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Tools voor kostenraming en budgetplanning

- **Module probleemoplossing**
  - Veelvoorkomende problemen: Veelvoorkomende problemen en oplossingen
  - Foutopsporingshandleiding: Systematische methodologieën voor probleemoplossing
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Bronnen en referenties**
  - Command Cheat Sheet: Snelle referentie voor essentiële commando's
  - Woordenlijst: Uitgebreide definities van terminologie en acroniemen
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Links naar externe bronnen en communityverbindingen

- **Voorbeelden en sjablonen**
  - Voorbeeld van een eenvoudige webapplicatie
  - Sjabloon voor implementatie van een statische website
  - Configuratie van containerapplicaties
  - Patronen voor database-integratie
  - Voorbeelden van microservices-architectuur
  - Implementaties van serverloze functies

#### Functies
- **Multi-platform ondersteuning**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Meerdere vaardigheidsniveaus**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Praktische focus**: Hands-on voorbeelden en scenario's uit de praktijk
- **Uitgebreide dekking**: Van basisconcepten tot geavanceerde zakelijke patronen
- **Security-First aanpak**: Beveiligingsbest practices geïntegreerd in de hele inhoud
- **Kostenoptimalisatie**: Richtlijnen voor kosteneffectieve implementaties en resourcebeheer

#### Documentatiekwaliteit
- **Gedetailleerde codevoorbeelden**: Praktische, geteste codevoorbeelden
- **Stapsgewijze instructies**: Duidelijke, uitvoerbare richtlijnen
- **Uitgebreide foutafhandeling**: Probleemoplossing voor veelvoorkomende problemen
- **Integratie van best practices**: Industriestandaarden en aanbevelingen
- **Versiecompatibiliteit**: Up-to-date met de nieuwste Azure-services en azd-functies

## Geplande toekomstige verbeteringen

### Versie 3.1.0 (Gepland)
#### Uitbreiding AI-platform
- **Ondersteuning voor meerdere modellen**: Integratiepatronen voor Hugging Face, Azure Machine Learning en aangepaste modellen
- **AI-agentframeworks**: Sjablonen voor LangChain-, Semantic Kernel- en AutoGen-implementaties
- **Geavanceerde RAG-patronen**: Vector database-opties naast Azure AI Search (Pinecone, Weaviate, enz.)
- **AI-observatie**: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Ontwikkelaarservaring
- **VS Code-extensie**: Geïntegreerde AZD + AI Foundry ontwikkelervaring
- **GitHub Copilot-integratie**: AI-ondersteunde AZD-sjabloongeneratie
- **Interactieve tutorials**: Hands-on codeeroefeningen met geautomatiseerde validatie voor AI-scenario's
- **Videocontent**: Aanvullende videotutorials voor visuele leerlingen met focus op AI-implementaties

### Versie 4.0.0 (Gepland)
#### Zakelijke AI-patronen
- **Governance-framework**: AI-modelbeheer, naleving en audit trails
- **Multi-tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-services
- **Edge AI-implementatie**: Integratie met Azure IoT Edge en containerinstanties
- **Hybride cloud-AI**: Multi-cloud en hybride implementatiepatronen voor AI-workloads

#### Geavanceerde functies
- **Automatisering AI-pijplijn**: MLOps-integratie met Azure Machine Learning-pijplijnen
- **Geavanceerde beveiliging**: Zero-trust patronen, private endpoints en geavanceerde dreigingsbescherming
- **Prestatieoptimalisatie**: Geavanceerde afstemming en schaalstrategieën voor AI-toepassingen met hoge doorvoer
- **Wereldwijde distributie**: Content delivery en edge caching-patronen voor AI-toepassingen

### Versie 3.0.0 (Gepland) - Vervangen door huidige release
#### Voorgestelde toevoegingen - Nu geïmplementeerd in v3.0.0
- ✅ **AI-gerichte inhoud**: Uitgebreide integratie van Azure AI Foundry (Voltooid)
- ✅ **Interactieve tutorials**: Hands-on AI-workshoplab (Voltooid)
- ✅ **Geavanceerde beveiligingsmodule**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Prestatieoptimalisatie**: Afstemmingsstrategieën voor AI-workloads (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Sommige voltooid in huidige release
- ✅ **Aanvullende voorbeelden**: AI-gerichte implementatiescenario's (Voltooid)
- ✅ **Uitgebreide FAQ**: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Toolintegratie**: Verbeterde IDE- en editorintegratiehandleidingen
- ✅ **Monitoringuitbreiding**: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Nog gepland voor toekomstige release
- **Mobielvriendelijke documentatie**: Responsief ontwerp voor mobiel leren
- **Offline toegang**: Downloadbare documentatiepakketten
- **Verbeterde IDE-integratie**: VS Code-extensie voor AZD + AI-workflows
- **Communitydashboard**: Realtime communitystatistieken en bijdrage-tracking

## Bijdragen aan de changelog

### Wijzigingen rapporteren
Bij het bijdragen aan deze repository, zorg ervoor dat changelog-items bevatten:

1. **Versienummer**: Volgens semantische versiebeheer (major.minor.patch)
2. **Datum**: Releasedatum of update in YYYY-MM-DD-formaat
3. **Categorie**: Toegevoegd, Gewijzigd, Verouderd, Verwijderd, Opgelost, Beveiliging
4. **Duidelijke beschrijving**: Bondige beschrijving van wat is gewijzigd
5. **Impactanalyse**: Hoe wijzigingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leermiddelen
- Extra tools, scripts of hulpprogramma's

#### Gewijzigd
- Aanpassingen aan bestaande functionaliteit of documentatie
- Updates om duidelijkheid of nauwkeurigheid te verbeteren
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties die gepland zijn voor verwijdering
- Methoden waarvoor betere alternatieven bestaan

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of uitgefaseerde benaderingen
- Overbodige of samengevoegde inhoud

#### Opgelost
- Correcties van fouten in documentatie of code
- Oplossing van gerapporteerde problemen of fouten
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Beveiliging
- Beveiligingsgerelateerde verbeteringen of oplossingen
- Updates van beveiligingsbest practices
- Oplossing van beveiligingskwetsbaarheden

### Richtlijnen voor semantische versiebeheer

#### Hoofdversie (X.0.0)
- Brekende wijzigingen die gebruikersactie vereisen
- Significante herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie veranderen

#### Kleine versie (X.Y.0)
- Nieuwe functies of inhoudstoevoegingen
- Verbeteringen die achterwaarts compatibel blijven
- Extra voorbeelden, tools of bronnen

#### Patchversie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Feedback en suggesties van de community

We moedigen actief feedback van de community aan om deze leerbron te verbeteren:

### Hoe feedback te geven
- **GitHub Issues**: Meld problemen of stel verbeteringen voor (AI-specifieke problemen welkom)
- **Discord-discussies**: Deel ideeën en ga in gesprek met de Azure AI Foundry-community
- **Pull Requests**: Draag direct verbeteringen bij aan inhoud, vooral AI-sjablonen en handleidingen
- **Azure AI Foundry Discord**: Neem deel aan het #Azure-kanaal voor AZD + AI-discussies
- **Communityforums**: Neem deel aan bredere Azure-ontwikkelaarsdiscussies

### Feedbackcategorieën
- **Nauwkeurigheid AI-inhoud**: Correcties aan AI-service-integratie en implementatie-informatie
- **Leerervaring**: Suggesties voor verbeterde AI-ontwikkelaarsleerflow
- **Ontbrekende AI-inhoud**: Verzoeken om extra AI-sjablonen, patronen of voorbeelden
- **Toegankelijkheid**: Verbeteringen voor diverse leerbehoeften
- **AI-toolintegratie**: Suggesties voor betere AI-ontwikkelworkflow-integratie
- **Productie-AI-patronen**: Verzoeken om zakelijke AI-implementatiepatronen

### Reactiebelofte
- **Reactie op problemen**: Binnen 48 uur voor gerapporteerde problemen
- **Functieaanvragen**: Evaluatie binnen een week
- **Communitybijdragen**: Beoordeling binnen een week
- **Beveiligingsproblemen**: Directe prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige updates
- **Maandelijkse beoordelingen**: Nauwkeurigheid van inhoud en linkvalidatie
- **Kwartaalupdates**: Grote toevoegingen en verbeteringen aan inhoud
- **Halfjaarlijkse beoordelingen**: Uitgebreide herstructurering en verbetering
- **Jaarlijkse releases**: Grote versie-updates met significante verbeteringen

### Monitoring en kwaliteitsborging
- **Geautomatiseerde tests**: Regelmatige validatie van codevoorbeelden en links
- **Integratie van communityfeedback**: Regelmatige opname van gebruikerssuggesties
- **Technologie-updates**: Afstemming op de nieuwste Azure-services en azd-releases
- **Toegankelijkheidsaudits**: Regelmatige beoordeling van inclusieve ontwerpprincipes

## Beleid voor versieondersteuning

### Ondersteuning huidige versie
- **Laatste hoofdversie**: Volledige ondersteuning met regelmatige updates
- **Vorige hoofdversie**: Beveiligingsupdates en kritieke oplossingen gedurende 12 maanden
- **Legacy-versies**: Alleen communityondersteuning, geen officiële updates

### Migratierichtlijnen
Bij het uitbrengen van hoofdversies bieden we:
- **Migratiehandleidingen**: Stapsgewijze overgangsinstructies
- **Compatibiliteitsnotities**: Details over brekende wijzigingen
- **Toolondersteuning**: Scripts of hulpprogramma's om te helpen bij migratie
- **Communityondersteuning**: Toegewijde forums voor migratievragen

---

**Navigatie**
- **Vorige les**: [Studiegids](resources/study-guide.md)
- **Volgende les**: Keer terug naar [Hoofd README](README.md)

**Blijf op de hoogte**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates van het leermateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->