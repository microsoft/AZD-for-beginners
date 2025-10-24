<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:35:55+00:00",
  "source_file": "changelog.md",
  "language_code": "nl"
}
-->
# Wijzigingslogboek - AZD Voor Beginners

## Introductie

Dit wijzigingslogboek documenteert alle belangrijke wijzigingen, updates en verbeteringen aan de AZD Voor Beginners-repository. We volgen de principes van semantische versiebeheer en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, kun je:
- Op de hoogte blijven van nieuwe functies en toevoegingen aan de inhoud
- Begrijpen welke verbeteringen zijn aangebracht in bestaande documentatie
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het leermateriaal door de tijd heen volgen

## Leerresultaten

Na het bekijken van de vermeldingen in het wijzigingslogboek kun je:
- Nieuwe inhoud en beschikbare leermiddelen identificeren
- Begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leerpad plannen op basis van het meest actuele materiaal
- Feedback en suggesties geven voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.4.0] - 24-10-2025

#### Verbeteringen in infrastructuurvoorvertoning en validatie
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe previewfunctie van Azure Developer CLI en verbetert de gebruikerservaring van workshops.**

#### Toegevoegd
- **🧪 azd provision --preview Functiedocumentatie**: Uitgebreide dekking van de nieuwe infrastructuurvoorvertoningsfunctie
  - Commandoreferentie en gebruiksvoorbeelden in de spiekbrief
  - Gedetailleerde integratie in de provisioning-gids met gebruiksscenario's en voordelen
  - Integratie van pre-flight checks voor veiligere implementatievalidatie
  - Updates van de startersgids met een 'veiligheid eerst'-benadering voor implementatie
- **🚧 Workshopstatusbanner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Ontwerp met kleurverloop en constructie-indicatoren voor duidelijke communicatie naar gebruikers
  - Laatst bijgewerkte tijdstempel voor transparantie
  - Mobiel responsief ontwerp voor alle apparaattypen

#### Verbeterd
- **Infrastructuurveiligheid**: Previewfunctionaliteit geïntegreerd in de gehele implementatiedocumentatie
- **Validatie vóór implementatie**: Geautomatiseerde scripts bevatten nu tests voor infrastructuurvoorvertoning
- **Ontwikkelaarsworkflow**: Bijgewerkte commandoreeksen om preview op te nemen als beste praktijk
- **Workshopervaring**: Duidelijke verwachtingen voor gebruikers over de ontwikkelingsstatus van de inhoud

#### Gewijzigd
- **Beste praktijken voor implementatie**: Workflow met preview als aanbevolen aanpak
- **Documentatiestroom**: Validatie van infrastructuur eerder in het leerproces geplaatst
- **Workshoppresentatie**: Professionele statuscommunicatie met duidelijke ontwikkelingsplanning

#### Verbeterd
- **Veiligheid eerst-benadering**: Infrastructuurwijzigingen kunnen nu worden gevalideerd vóór implementatie
- **Teamwerk**: Previewresultaten kunnen worden gedeeld voor beoordeling en goedkeuring
- **Kostenbewustzijn**: Betere inzicht in resourcekosten vóór provisioning
- **Risicobeperking**: Verminderde implementatiefouten door voorafgaande validatie

#### Technische implementatie
- **Integratie van meerdere documenten**: Previewfunctie gedocumenteerd in 4 belangrijke bestanden
- **Commandopatronen**: Consistente syntaxis en voorbeelden in de hele documentatie
- **Integratie van beste praktijken**: Preview opgenomen in validatieworkflows en scripts
- **Visuele indicatoren**: Duidelijke markeringen van NIEUWE functies voor vindbaarheid

#### Workshopinfrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met kleurverloop
- **Gebruikerservaring**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professionele presentatie**: Behoudt de geloofwaardigheid van de repository en stelt verwachtingen
- **Transparantie in planning**: Laatst bijgewerkte tijdstempel van oktober 2025 voor verantwoording

### [v3.3.0] - 24-09-2025

#### Verbeterde workshopmaterialen en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve gidsen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve workshopgids**: Browsergebaseerde workshopervaring met MkDocs-previewfunctionaliteit
- **📝 Gestructureerde workshopinstructies**: 7-stappen begeleid leerpad van ontdekking tot aanpassing
  - 0-Introductie: Overzicht en installatie van de workshop
  - 1-Selecteer-AI-Sjabloon: Proces van sjabloonontdekking en selectie
  - 2-Valideer-AI-Sjabloon: Procedures voor implementatie en validatie
  - 3-Deconstrueer-AI-Sjabloon: Begrip van sjabloonarchitectuur
  - 4-Configureer-AI-Sjabloon: Configuratie en aanpassing
  - 5-Personaliseer-AI-Sjabloon: Geavanceerde wijzigingen en iteraties
  - 6-Infrastructuur opruimen: Opschoning en resourcebeheer
  - 7-Samenvatting: Samenvatting en volgende stappen
- **🛠️ Workshoptools**: MkDocs-configuratie met Material-thema voor verbeterde leerervaring
- **🎯 Praktisch leerpad**: 3-stappenmethodologie (Ontdekking → Implementatie → Aanpassing)
- **📱 GitHub Codespaces-integratie**: Naadloze ontwikkelomgeving

#### Verbeterd
- **AI Workshop Lab**: Uitgebreid met een gestructureerde leerervaring van 2-3 uur
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van sjabloonselectie tot productie-implementatie
- **Ontwikkelaarservaring**: Geïntegreerde tools voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browsergebaseerde interface met zoekfunctie, kopieerfunctionaliteit en thema-instellingen
- **Zelfgestuurd leren**: Flexibele workshopstructuur die verschillende leertempo's ondersteunt
- **Praktische toepassing**: Realistische scenario's voor AI-sjabloonimplementatie
- **Community-integratie**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshopkenmerken
- **Ingebouwde zoekfunctie**: Snelle ontdekking van trefwoorden en lessen
- **Codeblokken kopiëren**: Hover-to-copy functionaliteit voor alle codevoorbeelden
- **Thema-instellingen**: Ondersteuning voor donkere/lichte modus naar voorkeur
- **Visuele hulpmiddelen**: Screenshots en diagrammen voor beter begrip
- **Hulpintegratie**: Directe toegang tot Discord voor communityondersteuning

### [v3.2.0] - 17-09-2025

#### Grote herstructurering van navigatie en hoofdstukgebaseerd leersysteem
**Deze versie introduceert een uitgebreid hoofdstukgebaseerd leerstructuur met verbeterde navigatie door de hele repository.**

#### Toegevoegd
- **📚 Hoofdstukgebaseerd leersysteem**: Herstructurering van de hele cursus in 8 progressieve leerhoofdstukken
  - Hoofdstuk 1: Basis & Snelstart (⭐ - 30-45 min)
  - Hoofdstuk 2: AI-First Ontwikkeling (⭐⭐ - 1-2 uur)
  - Hoofdstuk 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Hoofdstuk 4: Infrastructuur als Code & Implementatie (⭐⭐⭐ - 1-1,5 uur)
  - Hoofdstuk 5: Multi-Agent AI-oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Hoofdstuk 6: Validatie & Planning vóór implementatie (⭐⭐ - 1 uur)
  - Hoofdstuk 7: Probleemoplossing & Debugging (⭐⭐ - 1-1,5 uur)
  - Hoofdstuk 8: Productie & Enterprise-patronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten in alle documentatie
- **🎯 Voortgangscontrole**: Checklist voor cursusvoltooiing en systeem voor leerverificatie
- **🗺️ Leerpadenbegeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzing navigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gelinkt

#### Verbeterd
- **README-structuur**: Getransformeerd tot een gestructureerd leerplatform met hoofdstukgebaseerde organisatie
- **Documentatienavigatie**: Elke pagina bevat nu hoofdstukcontext en voortgangsbegeleiding
- **Sjabloonorganisatie**: Voorbeelden en sjablonen gekoppeld aan relevante leerhoofdstukken
- **Resource-integratie**: Spiekbriefjes, FAQ's en studiegidsen verbonden met relevante hoofdstukken
- **Workshopintegratie**: Hands-on labs gekoppeld aan meerdere leerdoelen van hoofdstukken

#### Gewijzigd
- **Leerprogressie**: Overgang van lineaire documentatie naar flexibel hoofdstukgebaseerd leren
- **Configuratieplaatsing**: Configuratiegids verplaatst naar hoofdstuk 3 voor betere leerstroom
- **AI-inhoudintegratie**: Betere integratie van AI-specifieke inhoud door de hele leerreis
- **Productie-inhoud**: Geavanceerde patronen geconsolideerd in hoofdstuk 8 voor zakelijke gebruikers

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiebroodkruimels en hoofdstukvoortgangsindicatoren
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudigere cursusverkenning
- **Professionele presentatie**: Universiteitsstijl cursusstructuur geschikt voor academische en zakelijke training
- **Leerefficiëntie**: Verminderde tijd om relevante inhoud te vinden door verbeterde organisatie

#### Technische implementatie
- **Navigatiekoppen**: Gestandaardiseerde hoofdstuknavigatie in meer dan 40 documentatiebestanden
- **Voetnavigatie**: Consistente voortgangsbegeleiding en hoofdstukvoltooiingsindicatoren
- **Kruisverwijzingen**: Uitgebreid intern linkensysteem dat gerelateerde concepten verbindt
- **Hoofdstukmapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Verbetering van studiegids
- **📚 Uitgebreide leerdoelen**: Studiegids herstructureerd om te aligneren met het 8-hoofdstukkensysteem
- **🎯 Hoofdstukgebaseerde beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangscontrole**: Wekelijks leerschema met meetbare resultaten en voltooiingschecklists
- **❓ Beoordelingsvragen**: Kennisvalidatievragen voor elk hoofdstuk met professionele resultaten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met echte implementatiescenario's en probleemoplossing
- **📊 Vaardigheidsprogressie**: Duidelijke vooruitgang van basisconcepten naar zakelijke patronen met focus op loopbaanontwikkeling
- **🎓 Certificeringskader**: Professionele ontwikkelingsresultaten en community-erkenningssysteem
- **⏱️ Tijdlijnbeheer**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 17-09-2025

#### Verbeterde Multi-Agent AI-oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentbenamingen en verbeterde documentatie.**

#### Gewijzigd
- **Multi-Agent Terminologie**: "Cora agent" vervangen door "Customer agent" in de retail multi-agent oplossing voor meer duidelijkheid
- **Agentarchitectuur**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt met consistente "Customer agent"-benaming
- **Configuratievoorbeelden**: Gemoderniseerde configuratiepatronen voor agents met bijgewerkte naamgevingsconventies
- **Documentatieconsistentie**: Alle verwijzingen gebruiken nu professionele, beschrijvende agentnamen

#### Verbeterd
- **ARM-sjabloonpakket**: Retail-multiagent-arm-template bijgewerkt met Customer agent-verwijzingen
- **Architectuurdiagrammen**: Vernieuwde Mermaid-diagrammen met bijgewerkte agentbenamingen
- **Codevoorbeelden**: Python-klassen en implementatievoorbeelden gebruiken nu CustomerAgent-benaming
- **Omgevingsvariabelen**: Alle implementatiescripts bijgewerkt naar CUSTOMER_AGENT_NAME-conventies

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijkere rollen en verantwoordelijkheden van agents in documentatie
- **Productiegereedheid**: Betere afstemming met zakelijke naamgevingsconventies
- **Leermaterialen**: Intuïtievere agentbenaming voor educatieve doeleinden
- **Sjabloongebruik**: Vereenvoudigd begrip van agentfuncties en implementatiepatronen

#### Technische details
- Mermaid-architectuurdiagrammen bijgewerkt met CustomerAgent-verwijzingen
- CoraAgent-klassenamen vervangen door CustomerAgent in Python-voorbeelden
- ARM-sjabloon JSON-configuraties aangepast naar "customer" agenttype
- Omgevingsvariabelen gewijzigd van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle implementatiecommando's en containerconfiguraties vernieuwd

### [v3.0.0] - 12-09-2025

#### Grote wijzigingen - Focus op AI-ontwikkelaars en integratie van Azure AI Foundry
**Deze versie transformeert de repository tot een uitgebreide AI-georiënteerde leerbron met integratie van Azure AI Foundry.**

#### Toegevoegd
- **🤖 AI-First Leerpad**: Volledige herstructurering met prioriteit voor AI-ontwikkelaars en ingenieurs
- **Azure AI Foundry Integratiegids**: Uitgebreide documentatie voor het verbinden van AZD met Azure AI Foundry-services
- **AI Model Implementatiepatronen**: Gedetailleerde gids over modelselectie, configuratie en productie-implementatiestrategieën
- **AI Workshop Lab**: Hands-on workshop van 2-3 uur voor het omzetten van AI-applicaties naar AZD-implementatieoplossingen
- **Beste praktijken voor productie-AI**: Zakelijke patronen voor schaalvergroting, monitoring en beveiliging van AI-werklasten
- **AI-specifieke probleemoplossingsgids**: Uitgebreide probleemoplossing voor Azure OpenAI, Cognitive Services en AI-implementatieproblemen
- **AI Sjabloongalerij**: Uitgelichte collectie van Azure AI Foundry-sjablonen met complexiteitsbeoordelingen
- **Workshopmaterialen**: Volledige workshopstructuur met hands-on labs en referentiematerialen

#### Verbeterd
- **README-structuur**: Gericht op AI-ontwikkelaars met 45% community-interessegegevens van Azure AI Foundry Discord
- **Leerpaden**: Toegewijd leerpad voor AI-ontwikkelaars naast traditionele paden voor studenten en DevOps-ingenieurs
- **Sjabloonaanbevelingen**: Uitgelichte AI-sjablonen zoals azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community-integratie**: Verbeterde ondersteuning van de Discord-community met AI-specifieke kanalen en discussies

#### Focus op beveiliging en productie
- **Patronen voor beheerde identiteit**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Kostenoptimalisatie**: Tokengebruik bijhouden en budgetbeheer voor AI-werklasten
- **Multi-regio implementatie**: Strategieën voor wereldwijde AI-applicatie-implementatie
- **Prestatiemonitoring**: AI-specifieke statistieken en integratie van Application Insights

#### Documentatiekwaliteit
- **Lineaire cursusstructuur**: Logische voortgang van beginner tot geavanceerde AI-implementatiepatronen
- **Gevalideerde URL's**: Alle externe repository-links gecontroleerd en toegankelijk
- **Volledige referentie**: Alle interne documentatielinks gevalideerd en functioneel
- **Productiegereed**: Zakelijke implementatiepatronen met praktijkvoorbeelden

### [v2.0.0] - 09-09-2025

#### Grote wijzigingen - Herstructurering van repository en professionele verbetering
**Deze versie vertegenwoordigt een significante revisie van de repositorystructuur en presentatie van inhoud.**

#### Toegevoegd
- **Gestructureerd leerframework**: Alle documentatiepagina's bevatten nu secties Introductie, Leerdoelen en Leerresultaten
- **Navigatiesysteem**: Toegevoegd Vorige/Volgende leslinks in alle documentatie voor begeleide leerprogressie
- **Studiegids**: Uitgebreide study-guide.md met leerdoelen, praktijkoefeningen en beoordelingsmaterialen
- **Professionele presentatie**: Alle emoji-iconen verwijderd voor verbeterde toegankelijkheid en professionele uitstraling
- **Verbeterde inhoudsstructuur**: Verbeterde organisatie en stroom van leermaterialen

#### Gewijzigd
- **Documentatieformaat**: Alle documentatie gestandaardiseerd met een consistente leergerichte structuur
- **Navigatiestroom**: Logische voortgang geïmplementeerd door alle leermaterialen
- **Inhoudspresentatie**: Decoratieve elementen verwijderd ten gunste van duidelijke, professionele opmaak
- **Linkstructuur**: Alle interne links bijgewerkt om het nieuwe navigatiesysteem te ondersteunen

#### Verbeterd
- **Toegankelijkheid**: Emoji-afhankelijkheden verwijderd voor betere compatibiliteit met schermlezers
- **Professionele uitstraling**: Schone, academische stijl geschikt voor leren in een zakelijke omgeving
- **Leerervaring**: Gestructureerde aanpak met duidelijke doelen en resultaten voor elke les
- **Inhoudsorganisatie**: Betere logische stroom en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Eerste release - Uitgebreide AZD-leerrepository

#### Toegevoegd
- **Kernstructuur documentatie**
  - Complete reeks handleidingen voor beginners
  - Uitgebreide documentatie over implementatie en provisioning
  - Gedetailleerde bronnen voor probleemoplossing en debugging
  - Tools en procedures voor validatie vóór implementatie

- **Module voor beginners**
  - AZD Basisprincipes: Kernconcepten en terminologie
  - Installatiehandleiding: Platformspecifieke installatie-instructies
  - Configuratiehandleiding: Omgevingsinstellingen en authenticatie
  - Eerste projecttutorial: Stapsgewijze praktische leerervaring

- **Module voor implementatie en provisioning**
  - Implementatiehandleiding: Complete workflowdocumentatie
  - Provisioninghandleiding: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Architectuurpatronen voor meerdere services

- **Module voor validatie vóór implementatie**
  - Capaciteitsplanning: Validatie van beschikbaarheid van Azure-resources
  - SKU-selectie: Uitgebreide richtlijnen voor servicetiers
  - Pre-flight checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Tools voor kostenraming en budgetplanning

- **Module voor probleemoplossing**
  - Veelvoorkomende problemen: Vaak voorkomende problemen en oplossingen
  - Debugginghandleiding: Systematische methodologieën voor probleemoplossing
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Bronnen en referenties**
  - Command Cheat Sheet: Snelle referentie voor essentiële commando's
  - Woordenlijst: Uitgebreide definities van terminologie en acroniemen
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Links naar externe bronnen en communityverbindingen

- **Voorbeelden en sjablonen**
  - Voorbeeld van eenvoudige webapplicatie
  - Sjabloon voor implementatie van statische website
  - Configuratie van containerapplicatie
  - Patronen voor database-integratie
  - Voorbeelden van microservicesarchitectuur
  - Implementaties van serverloze functies

#### Functies
- **Ondersteuning voor meerdere platforms**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Meerdere vaardigheidsniveaus**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Praktische focus**: Praktische voorbeelden en scenario's uit de echte wereld
- **Uitgebreide dekking**: Van basisconcepten tot geavanceerde zakelijke patronen
- **Security-First aanpak**: Beveiligingsbest practices geïntegreerd in de hele documentatie
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
- **Geavanceerde RAG-patronen**: Vector database-opties buiten Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observatie**: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Ontwikkelaarservaring
- **VS Code-extensie**: Geïntegreerde AZD + AI Foundry ontwikkelervaring
- **GitHub Copilot-integratie**: AI-ondersteunde AZD-sjabloongeneratie
- **Interactieve tutorials**: Praktische programmeeroefeningen met geautomatiseerde validatie voor AI-scenario's
- **Videocontent**: Aanvullende videotutorials voor visuele leerlingen gericht op AI-implementaties

### Versie 4.0.0 (Gepland)
#### Zakelijke AI-patronen
- **Governanceframework**: Governance, compliance en audit trails voor AI-modellen
- **Multi-tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-services
- **Edge AI-implementatie**: Integratie met Azure IoT Edge en containerinstanties
- **Hybride cloud AI**: Multi-cloud en hybride implementatiepatronen voor AI-workloads

#### Geavanceerde functies
- **Automatisering van AI-pipelines**: MLOps-integratie met Azure Machine Learning-pipelines
- **Geavanceerde beveiliging**: Zero-trust patronen, private endpoints en geavanceerde dreigingsbescherming
- **Prestatieoptimalisatie**: Geavanceerde afstemming en schaalstrategieën voor AI-applicaties met hoge doorvoer
- **Globale distributie**: Patronen voor contentlevering en edge-caching voor AI-applicaties

### Versie 3.0.0 (Gepland) - Vervangen door huidige release
#### Voorgestelde toevoegingen - Nu geïmplementeerd in v3.0.0
- ✅ **AI-gerichte inhoud**: Uitgebreide integratie van Azure AI Foundry (Voltooid)
- ✅ **Interactieve tutorials**: Praktische AI-workshoplab (Voltooid)
- ✅ **Geavanceerde beveiligingsmodule**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Prestatieoptimalisatie**: Afstemmingsstrategieën voor AI-workloads (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Sommige voltooid in huidige release
- ✅ **Extra voorbeelden**: AI-gerichte implementatiescenario's (Voltooid)
- ✅ **Uitgebreide FAQ**: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Toolintegratie**: Verbeterde IDE- en editorintegratiehandleidingen
- ✅ **Monitoringuitbreiding**: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Nog gepland voor toekomstige release
- **Mobielvriendelijke documentatie**: Responsief ontwerp voor mobiel leren
- **Offline toegang**: Downloadbare documentatiepakketten
- **Verbeterde IDE-integratie**: VS Code-extensie voor AZD + AI-workflows
- **Communitydashboard**: Real-time communitystatistieken en bijdrage-tracking

## Bijdragen aan de changelog

### Wijzigingen rapporteren
Bij het bijdragen aan deze repository, zorg ervoor dat changelog-items bevatten:

1. **Versienummer**: Volgens semantische versiebeheer (major.minor.patch)
2. **Datum**: Releasedatum of update in YYYY-MM-DD formaat
3. **Categorie**: Toegevoegd, Gewijzigd, Verouderd, Verwijderd, Hersteld, Beveiliging
4. **Duidelijke beschrijving**: Bondige beschrijving van wat er is veranderd
5. **Impactanalyse**: Hoe wijzigingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leermiddelen
- Extra tools, scripts of hulpprogramma's

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates om duidelijkheid of nauwkeurigheid te verbeteren
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties die gepland zijn voor verwijdering
- Methoden met betere alternatieven

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of uitgefaseerde benaderingen
- Overbodige of samengevoegde inhoud

#### Hersteld
- Correcties van fouten in documentatie of code
- Oplossing van gerapporteerde problemen of fouten
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Beveiliging
- Beveiligingsgerelateerde verbeteringen of fixes
- Updates van beveiligingsbest practices
- Oplossing van beveiligingskwetsbaarheden

### Richtlijnen voor semantische versiebeheer

#### Hoofdversie (X.0.0)
- Brekende wijzigingen die gebruikersactie vereisen
- Significante herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie veranderen

#### Kleine versie (X.Y.0)
- Nieuwe functies of inhoudsaanvullingen
- Verbeteringen die achterwaartse compatibiliteit behouden
- Extra voorbeelden, tools of bronnen

#### Patchversie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Communityfeedback en suggesties

We moedigen actief communityfeedback aan om deze leerbron te verbeteren:

### Hoe feedback te geven
- **GitHub Issues**: Problemen melden of verbeteringen voorstellen (AI-specifieke problemen welkom)
- **Discord-discussies**: Ideeën delen en deelnemen aan de Azure AI Foundry-community
- **Pull Requests**: Directe verbeteringen bijdragen aan inhoud, vooral AI-sjablonen en handleidingen
- **Azure AI Foundry Discord**: Deelname aan #Azure-kanaal voor AZD + AI-discussies
- **Communityforums**: Deelname aan bredere discussies onder Azure-ontwikkelaars

### Feedbackcategorieën
- **Nauwkeurigheid van AI-inhoud**: Correcties voor integratie en implementatie van AI-services
- **Leerervaring**: Suggesties voor verbeterde leerflow voor AI-ontwikkelaars
- **Ontbrekende AI-inhoud**: Verzoeken om extra AI-sjablonen, patronen of voorbeelden
- **Toegankelijkheid**: Verbeteringen voor diverse leerbehoeften
- **Integratie van AI-tools**: Suggesties voor betere integratie van AI-ontwikkelworkflows
- **Patronen voor productie-AI**: Verzoeken om zakelijke AI-implementatiepatronen

### Reactieverbintenis
- **Reactie op problemen**: Binnen 48 uur voor gerapporteerde problemen
- **Functieaanvragen**: Evaluatie binnen een week
- **Communitybijdragen**: Beoordeling binnen een week
- **Beveiligingsproblemen**: Directe prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige updates
- **Maandelijkse beoordelingen**: Nauwkeurigheid van inhoud en validatie van links
- **Kwartaalupdates**: Belangrijke inhoudsaanvullingen en verbeteringen
- **Halfjaarlijkse beoordelingen**: Uitgebreide herstructurering en verbetering
- **Jaarlijkse releases**: Hoofdversie-updates met significante verbeteringen

### Monitoring en kwaliteitsborging
- **Geautomatiseerde tests**: Regelmatige validatie van codevoorbeelden en links
- **Integratie van communityfeedback**: Regelmatige opname van gebruikerssuggesties
- **Technologie-updates**: Afstemming met de nieuwste Azure-services en azd-releases
- **Toegankelijkheidsaudits**: Regelmatige beoordeling van inclusieve ontwerpprincipes

## Beleidsregels voor versieondersteuning

### Ondersteuning van huidige versie
- **Laatste hoofdversie**: Volledige ondersteuning met regelmatige updates
- **Vorige hoofdversie**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Legacy-versies**: Alleen communityondersteuning, geen officiële updates

### Migratierichtlijnen
Wanneer hoofdversies worden uitgebracht, bieden we:
- **Migratiehandleidingen**: Stapsgewijze overgangsinstructies
- **Compatibiliteitsnotities**: Details over brekende wijzigingen
- **Toolondersteuning**: Scripts of hulpprogramma's om te helpen bij migratie
- **Communityondersteuning**: Toegewijde forums voor migratievragen

---

**Navigatie**
- **Vorige les**: [Studiegids](resources/study-guide.md)
- **Volgende les**: Terug naar [Hoofd README](README.md)

**Blijf op de hoogte**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates van de leermaterialen.

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.