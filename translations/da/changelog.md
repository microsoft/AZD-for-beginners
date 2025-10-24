<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:28:35+00:00",
  "source_file": "changelog.md",
  "language_code": "da"
}
-->
# Ændringslog - AZD For Begyndere

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Begyndere-repositoriet. Vi følger principperne for semantisk versionering og opretholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versionerne.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Holde dig informeret om nye funktioner og tilføjelser af indhold
- Forstå forbedringer af eksisterende dokumentation
- Følge fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslogens poster vil du kunne:
- Identificere nyt indhold og ressourcer til læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringsvej baseret på de nyeste materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.4.0] - 24. oktober 2025

#### Forbedringer af Infrastruktur Preview og Validering
**Denne version introducerer omfattende support til den nye Azure Developer CLI preview-funktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattende dækning af den nye infrastruktur-preview funktion
  - Kommando-reference og eksempler i cheat sheet
  - Detaljeret integration i provisioneringsguiden med brugsscenarier og fordele
  - Integration af pre-flight check for sikrere validering af deployment
  - Opdateringer i kom-i-gang-guiden med sikkerhedsorienterede deployment-praksisser
- **🚧 Workshop Status Banner**: Professionelt HTML-banner, der angiver workshop-udviklingsstatus
  - Gradientdesign med konstruktionsindikatorer for tydelig kommunikation til brugerne
  - Sidst opdateret tidsstempel for gennemsigtighed
  - Mobilresponsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktursikkerhed**: Preview-funktionalitet integreret i hele deployment-dokumentationen
- **Pre-deployment Validering**: Automatiserede scripts inkluderer nu infrastruktur-preview test
- **Udviklerarbejdsgang**: Opdaterede kommandosekvenser til at inkludere preview som bedste praksis
- **Workshopoplevelse**: Klare forventninger til brugerne om indholdsudviklingsstatus

#### Ændret
- **Deployment Bedste Praksisser**: Preview-først arbejdsgang anbefales nu som tilgang
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshoppræsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerhedsorienteret tilgang**: Infrastrukturændringer kan nu valideres før deployment
- **Teamarbejde**: Preview-resultater kan deles til gennemgang og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisionering
- **Risikoafhjælpning**: Reducerede fejl i deployment gennem avanceret validering

#### Teknisk Implementering
- **Integration på tværs af dokumenter**: Preview-funktion dokumenteret på tværs af 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentationen
- **Bedste praksis integration**: Preview inkluderet i valideringsarbejdsgange og scripts
- **Visuelle indikatorer**: Klare NYE funktionsmarkeringer for bedre synlighed

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionelt HTML-banner med gradient-styling
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel Præsentation**: Opretholder repositoriets troværdighed og sætter forventninger
- **Tidslinjegennemsigtighed**: Oktober 2025 sidst opdateret tidsstempel for ansvarlighed

### [v3.3.0] - 24. september 2025

#### Forbedrede Workshopmaterialer og Interaktiv Læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive guider og strukturerede læringsveje.**

#### Tilføjet
- **🎥 Interaktiv Workshop Guide**: Browserbaseret workshopoplevelse med MkDocs preview-funktion
- **📝 Strukturerede Workshopinstruktioner**: 7-trins guidet læringsvej fra opdagelse til tilpasning
  - 0-Introduktion: Workshopoversigt og opsætning
  - 1-Vælg-AI-Skabelon: Skabelonopdagelse og udvælgelsesproces
  - 2-Valider-AI-Skabelon: Deployment og valideringsprocedurer
  - 3-Deconstruer-AI-Skabelon: Forståelse af skabelonarkitektur
  - 4-Konfigurer-AI-Skabelon: Konfiguration og tilpasning
  - 5-Tilpas-AI-Skabelon: Avancerede ændringer og iterationer
  - 6-Nedtagning-Infrastruktur: Oprydning og ressourcehåndtering
  - 7-Afslutning: Opsummering og næste skridt
- **🛠️ Workshopværktøjer**: MkDocs-konfiguration med Material-tema for forbedret læringsoplevelse
- **🎯 Praktisk Læringsvej**: 3-trins metode (Opdagelse → Deployment → Tilpasning)
- **📱 GitHub Codespaces Integration**: Problemfri opsætning af udviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Udvidet med en omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsdeployment
- **Udvikleroplevelse**: Integrerede værktøjer for strømlinede udviklingsarbejdsgange

#### Forbedret
- **Tilgængelighed**: Browserbaseret interface med søgefunktion, kopieringsfunktionalitet og temaindstillinger
- **Selvstyret Læring**: Fleksibel workshopstruktur tilpasset forskellige læringshastigheder
- **Praktisk Anvendelse**: Virkelighedsnære AI-skabelon-deployment-scenarier
- **Fællesskabsintegration**: Discord-integration for workshopstøtte og samarbejde

#### Workshopfunktioner
- **Indbygget Søgning**: Hurtig søgning efter nøgleord og lektioner
- **Kopier Kodeblokke**: Hover-til-kopi funktionalitet for alle kodeeksempler
- **Temaindstillinger**: Understøttelse af mørk/lys tilstand for forskellige præferencer
- **Visuelle Elementer**: Skærmbilleder og diagrammer for bedre forståelse
- **Hjælpeintegration**: Direkte adgang til Discord for fællesskabsstøtte

### [v3.2.0] - 17. september 2025

#### Større Navigation Omstrukturering og Kapitelbaseret Læringssystem
**Denne version introducerer en omfattende kapitelbaseret læringsstruktur med forbedret navigation i hele repositoriet.**

#### Tilføjet
- **📚 Kapitelbaseret Læringssystem**: Omstruktureret hele kurset i 8 progressive læringskapitler
  - Kapitel 1: Grundlag & Kom i gang (⭐ - 30-45 min)
  - Kapitel 2: AI-Først Udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentifikation (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & Deployment (⭐⭐⭐ - 1-1,5 timer)
  - Kapitel 5: Multi-Agent AI Løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Pre-Deployment Validering & Planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1,5 timer)
  - Kapitel 8: Produktion & Enterprise Mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende Navigationssystem**: Konsistente navigationsoverskrifter og -fødder på tværs af al dokumentation
- **🎯 Progressionssporing**: Kursusafslutningscheckliste og læringsverifikationssystem
- **🗺️ Læringsvejledning**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreferencer i navigationen**: Relaterede kapitler og forudsætninger tydeligt linket

#### Forbedret
- **README-struktur**: Omformet til en struktureret læringsplatform med kapitelbaseret organisering
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelkontekst og progressionsvejledning
- **Skabelonorganisation**: Eksempler og skabeloner kortlagt til relevante læringskapitler
- **Ressourceintegration**: Cheat sheets, FAQ'er og studievejledninger forbundet med relevante kapitler
- **Workshopintegration**: Praktiske laboratorier kortlagt til flere kapitel-læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibel kapitelbaseret læring
- **Konfigurationsplacering**: Omplaceret konfigurationsguide som Kapitel 3 for bedre læringsflow
- **AI-indholdsintegration**: Bedre integration af AI-specifikt indhold i hele læringsrejsen
- **Produktionsindhold**: Avancerede mønstre konsolideret i Kapitel 8 for enterprise-lærere

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og kapitelprogressionsindikatorer
- **Tilgængelighed**: Konsistente navigationsmønstre for lettere kursusgennemgang
- **Professionel Præsentation**: Universitetslignende kursusstruktur egnet til akademisk og erhvervstræning
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk Implementering
- **Navigationsoverskrifter**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Fodernavigation**: Konsistent progressionsvejledning og kapitelafslutningsindikatorer
- **Krydslinking**: Omfattende internt linkingsystem, der forbinder relaterede koncepter
- **Kapitelkortlægning**: Skabeloner og eksempler tydeligt forbundet med læringsmål

#### Forbedring af Studievejledning
- **📚 Omfattende Læringsmål**: Omstruktureret studievejledning til at passe med 8-kapitel systemet
- **🎯 Kapitelbaseret Vurdering**: Hvert kapitel inkluderer specifikke læringsmål og praktiske øvelser
- **📋 Progressionssporing**: Ugentlig læringsplan med målbare resultater og afslutningschecklister
- **❓ Vurderingsspørgsmål**: Videnvalideringsspørgsmål for hvert kapitel med professionelle resultater
- **🛠️ Praktiske Øvelser**: Hands-on aktiviteter med reelle deployment-scenarier og fejlfinding
- **📊 Færdighedsprogression**: Klar fremgang fra grundlæggende koncepter til enterprise-mønstre med fokus på karriereudvikling
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og fællesskabsanerkendelse
- **⏱️ Tidslinjestyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 17. september 2025

#### Forbedrede Multi-Agent AI Løsninger
**Denne version forbedrer multi-agent retail-løsningen med bedre agentnavngivning og forbedret dokumentation.**

#### Ændret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Customer agent" i hele retail multi-agent løsningen for klarere forståelse
- **Agentarkitektur**: Opdateret al dokumentation, ARM-skabeloner og kodeeksempler til at bruge konsistent "Customer agent"-navngivning
- **Konfigurationseksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navnekonventioner
- **Dokumentationskonsistens**: Sikret, at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM Template Package**: Opdateret retail-multiagent-arm-template med Customer agent-referencer
- **Arkitekturdiagrammer**: Opdaterede Mermaid-diagrammer med opdateret agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruger nu CustomerAgent-navngivning
- **Miljøvariabler**: Opdateret alle deployment-scripts til at bruge CUSTOMER_AGENT_NAME-konventioner

#### Forbedret
- **Udvikleroplevelse**: Klarere agentroller og ansvar i dokumentationen
- **Produktionsklarhed**: Bedre tilpasning til enterprise-navngivningskonventioner
- **Læringsmaterialer**: Mere intuitiv agentnavngivning til uddannelsesformål
- **Skabelonbrugervenlighed**: Forenklet forståelse af agentfunktioner og deployment-mønstre

#### Tekniske Detaljer
- Opdaterede Mermaid-arkitekturdiagrammer med CustomerAgent-referencer
- Erstattet CoraAgent-klassenavne med CustomerAgent i Python-eksempler
- Ændret ARM-skabelon JSON-konfigurationer til at bruge "customer" agenttype
- Opdateret miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opfrisket alle deployment-kommandoer og containerkonfigurationer

### [v3.0.0] - 12. september 2025

#### Større Ændringer - Fokus på AI-udviklere og Azure AI Foundry Integration
**Denne version omdanner repositoriet til en omfattende AI-fokuseret læringsressource med Azure AI Foundry integration.**

#### Tilføjet
- **🤖 AI-Først Læringsvej**: Komplet omstrukturering med prioritering af AI-udviklere og ingeniører
- **Azure AI Foundry Integrationsguide**: Omfattende dokumentation for at forbinde AZD med Azure AI Foundry-tjenester
- **AI Model Deployment Mønstre**: Detaljeret guide om modelvalg, konfiguration og produktionsdeployment-strategier
- **AI Workshop Lab**: 2-3 timers hands-on workshop til konvertering af AI-applikationer til AZD-deployable løsninger
- **Produktions AI Bedste Praksisser**: Enterprise-klare mønstre til skalering, overvågning og sikring af AI-arbejdsbelastninger
- **AI-Specifik Fejlfinding Guide**: Omfattende fejlfinding for Azure OpenAI, Cognitive Services og AI-deployment problemer
- **AI Template Gallery**: Udvalgt samling af Azure AI Foundry-skabeloner med kompleksitetsvurderinger
- **Workshopmaterialer**: Komplet workshopstruktur med hands-on laboratorier og referencematerialer

#### Forbedret
- **README Struktur**: AI-udviklerfokuseret med 45% fællesskabsinteressedata fra Azure AI Foundry Discord
- **Læringsveje**: Dedikeret AI-udviklerrejse sammen med traditionelle veje for studerende og DevOps-ingeniører
- **Skabelonanbefalinger**: Udvalgte AI-skabeloner inklusive azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Fællesskabsintegration**: Forbedret Discord-fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Sikkerhed & Produktionsfokus
- **Managed Identity Mønstre**: AI-specifikke autentifikations- og sikkerhedskonfigurationer
- **Omkostningsoptimering**: Tokenbrugssporing og budgetkontroller for AI-arbejdsbelastninger
- **Multi-Region Deployment**: Strategier for global deployment af AI-applikationer
- **Performance Overvågning**: AI-specifikke metrikker og Application Insights integration

#### Dokumentationskvalitet
- **Lineær Kursusstruktur**: Logisk progression fra begynder til avancerede AI-deployment mønstre
- **Validerede URL'er**: Alle eksterne repositorielinks verificeret og tilgængelige
- **Komplet Reference**: Alle interne dokumentationslinks valideret og funktionelle
- **Produktionsklar**: Enterprise-deployment mønstre med virkelige eksempler

### [v2.0.0] - 9. september 2025

#### Større Ændringer - Repositorieomstrukturering og Professionel Forbedring
**Denne version repræsenterer en betydelig revision af repositoriets struktur og indholdspræsentation.**

#### Tilføjet
- **Struktureret Læringsramme**: Alle dokumentationssider inkluderer nu Introduktion, Læringsmål og Læringsresultater sektioner
- **Navigationssystem**: Tilføjet Forrige/Næste lektion-links i hele dokumentationen for guid
- **Dokumentationsformat**: Standardiseret al dokumentation med en ensartet læringsfokuseret struktur  
- **Navigationsflow**: Implementeret logisk progression gennem alle læringsmaterialer  
- **Indholdspræsentation**: Fjernet dekorative elementer til fordel for klar og professionel formatering  
- **Linkstruktur**: Opdateret alle interne links for at understøtte det nye navigationssystem  

#### Forbedret  
- **Tilgængelighed**: Fjernet afhængighed af emojis for bedre skærmlæserkompatibilitet  
- **Professionelt udseende**: Ren, akademisk stil, der passer til læring i erhvervslivet  
- **Læringsoplevelse**: Struktureret tilgang med klare mål og resultater for hver lektion  
- **Indholdsorganisation**: Bedre logisk flow og forbindelse mellem relaterede emner  

### [v1.0.0] - 2025-09-09  

#### Første udgivelse - Omfattende AZD læringsrepository  

#### Tilføjet  
- **Kerne-dokumentationsstruktur**  
  - Komplet serie af introduktionsvejledninger  
  - Omfattende dokumentation om udrulning og klargøring  
  - Detaljerede ressourcer til fejlfinding og fejlretning  
  - Værktøjer og procedurer til validering før udrulning  

- **Introduktionsmodul**  
  - AZD-grundlæggende: Kernekoncepter og terminologi  
  - Installationsvejledning: Platformsspecifikke opsætningsinstruktioner  
  - Konfigurationsvejledning: Miljøopsætning og autentificering  
  - Første projekt-tutorial: Trin-for-trin praktisk læring  

- **Udrulnings- og klargøringsmodul**  
  - Udrulningsvejledning: Komplet workflow-dokumentation  
  - Klargøringsvejledning: Infrastruktur som kode med Bicep  
  - Bedste praksis for produktionsudrulninger  
  - Mønstre for multi-service arkitektur  

- **Valideringsmodul før udrulning**  
  - Kapacitetsplanlægning: Validering af Azure-ressourcetilgængelighed  
  - SKU-valg: Omfattende vejledning om servicelag  
  - Pre-flight checks: Automatiserede valideringsscripts (PowerShell og Bash)  
  - Værktøjer til omkostningsestimering og budgetplanlægning  

- **Fejlfindingsmodul**  
  - Almindelige problemer: Hyppigt forekommende problemer og løsninger  
  - Fejlretningsvejledning: Systematiske metoder til fejlfinding  
  - Avancerede diagnostiske teknikker og værktøjer  
  - Overvågning og optimering af ydeevne  

- **Ressourcer og referencer**  
  - Kommando-cheat sheet: Hurtig reference til essentielle kommandoer  
  - Ordliste: Omfattende terminologi og akronymdefinitioner  
  - FAQ: Detaljerede svar på almindelige spørgsmål  
  - Eksterne ressourcelinks og forbindelser til fællesskabet  

- **Eksempler og skabeloner**  
  - Eksempel på simpel webapplikation  
  - Skabelon til udrulning af statisk hjemmeside  
  - Konfiguration af containerapplikation  
  - Mønstre for databaseintegration  
  - Eksempler på mikroservices arkitektur  
  - Implementeringer af serverløse funktioner  

#### Funktioner  
- **Multi-platform support**: Installations- og konfigurationsvejledninger til Windows, macOS og Linux  
- **Flere færdighedsniveauer**: Indhold designet til både studerende og professionelle udviklere  
- **Praktisk fokus**: Praktiske eksempler og scenarier fra den virkelige verden  
- **Omfattende dækning**: Fra grundlæggende koncepter til avancerede erhvervsmønstre  
- **Sikkerhed først**: Bedste praksis for sikkerhed integreret gennem hele dokumentationen  
- **Omkostningsoptimering**: Vejledning til omkostningseffektive udrulninger og ressourcehåndtering  

#### Dokumentationskvalitet  
- **Detaljerede kodeeksempler**: Praktiske, testede kodeeksempler  
- **Trin-for-trin instruktioner**: Klar, handlingsorienteret vejledning  
- **Omfattende fejlhåndtering**: Fejlfinding af almindelige problemer  
- **Integration af bedste praksis**: Industriens standarder og anbefalinger  
- **Versionskompatibilitet**: Opdateret med de nyeste Azure-tjenester og azd-funktioner  

## Planlagte fremtidige forbedringer  

### Version 3.1.0 (Planlagt)  
#### Udvidelse af AI-platform  
- **Multi-model support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og brugerdefinerede modeller  
- **AI-agent frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen udrulninger  
- **Avancerede RAG-mønstre**: Muligheder for vektordatabaser ud over Azure AI Search (Pinecone, Weaviate osv.)  
- **AI-overvågning**: Forbedret overvågning af modelydelse, tokenforbrug og svarkvalitet  

#### Udvikleroplevelse  
- **VS Code Extension**: Integreret AZD + AI Foundry udviklingsoplevelse  
- **GitHub Copilot Integration**: AI-assisteret AZD skabelongenerering  
- **Interaktive tutorials**: Praktiske kodningsøvelser med automatiseret validering for AI-scenarier  
- **Videomateriale**: Supplerende videotutorials for visuelle lærere med fokus på AI-udrulninger  

### Version 4.0.0 (Planlagt)  
#### Erhvervsmønstre for AI  
- **Governance Framework**: Styring af AI-modeller, overholdelse og revisionsspor  
- **Multi-tenant AI**: Mønstre til betjening af flere kunder med isolerede AI-tjenester  
- **Edge AI-udrulning**: Integration med Azure IoT Edge og containerinstanser  
- **Hybrid Cloud AI**: Multi-cloud og hybride udrulningsmønstre for AI-arbejdsbelastninger  

#### Avancerede funktioner  
- **Automatisering af AI-pipelines**: MLOps-integration med Azure Machine Learning-pipelines  
- **Avanceret sikkerhed**: Zero-trust mønstre, private endpoints og avanceret trusselsbeskyttelse  
- **Ydelsesoptimering**: Avancerede tuning- og skaleringsstrategier for AI-applikationer med høj gennemstrømning  
- **Global distribution**: Mønstre for indholdslevering og edge-caching til AI-applikationer  

### Version 3.0.0 (Planlagt) - Erstattet af nuværende udgivelse  
#### Foreslåede tilføjelser - Nu implementeret i v3.0.0  
- ✅ **AI-fokuseret indhold**: Omfattende Azure AI Foundry integration (Fuldført)  
- ✅ **Interaktive tutorials**: Praktisk AI-workshop-lab (Fuldført)  
- ✅ **Avanceret sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldført)  
- ✅ **Ydelsesoptimering**: Tuningstrategier for AI-arbejdsbelastninger (Fuldført)  

### Version 2.1.0 (Planlagt) - Delvist implementeret i v3.0.0  
#### Mindre forbedringer - Nogle fuldført i nuværende udgivelse  
- ✅ **Yderligere eksempler**: AI-fokuserede udrulningsscenarier (Fuldført)  
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldført)  
- **Værktøjsintegration**: Forbedrede IDE- og editorintegrationsvejledninger  
- ✅ **Udvidet overvågning**: AI-specifikke overvågnings- og alarmeringsmønstre (Fuldført)  

#### Stadig planlagt til fremtidige udgivelser  
- **Mobilvenlig dokumentation**: Responsivt design til mobil læring  
- **Offline adgang**: Downloadbare dokumentationspakker  
- **Forbedret IDE-integration**: VS Code-udvidelse til AZD + AI workflows  
- **Fællesskabsdashboard**: Realtidsmetrics og sporing af bidrag fra fællesskabet  

## Bidrag til changelog  

### Rapportering af ændringer  
Når du bidrager til dette repository, skal changelog-poster inkludere:  

1. **Versionsnummer**: Efter semantisk versionering (major.minor.patch)  
2. **Dato**: Udgivelses- eller opdateringsdato i formatet YYYY-MM-DD  
3. **Kategori**: Tilføjet, Ændret, Udfaset, Fjernet, Rettet, Sikkerhed  
4. **Klar beskrivelse**: Kort beskrivelse af, hvad der er ændret  
5. **Vurdering af påvirkning**: Hvordan ændringer påvirker eksisterende brugere  

### Ændringskategorier  

#### Tilføjet  
- Nye funktioner, dokumentationssektioner eller kapaciteter  
- Nye eksempler, skabeloner eller læringsressourcer  
- Yderligere værktøjer, scripts eller hjælpeprogrammer  

#### Ændret  
- Ændringer i eksisterende funktionalitet eller dokumentation  
- Opdateringer for at forbedre klarhed eller nøjagtighed  
- Omstrukturering af indhold eller organisation  

#### Udfaset  
- Funktioner eller tilgange, der er ved at blive udfaset  
- Dokumentationssektioner planlagt til fjernelse  
- Metoder, der har bedre alternativer  

#### Fjernet  
- Funktioner, dokumentation eller eksempler, der ikke længere er relevante  
- Forældet information eller udfasede tilgange  
- Overflødigt eller konsolideret indhold  

#### Rettet  
- Rettelser af fejl i dokumentation eller kode  
- Løsning af rapporterede problemer eller fejl  
- Forbedringer af nøjagtighed eller funktionalitet  

#### Sikkerhed  
- Sikkerhedsrelaterede forbedringer eller rettelser  
- Opdateringer til bedste praksis for sikkerhed  
- Løsning af sikkerhedssårbarheder  

### Retningslinjer for semantisk versionering  

#### Major Version (X.0.0)  
- Brud på kompatibilitet, der kræver brugerhandling  
- Betydelig omstrukturering af indhold eller organisation  
- Ændringer, der ændrer den grundlæggende tilgang eller metode  

#### Minor Version (X.Y.0)  
- Nye funktioner eller indholdsudvidelser  
- Forbedringer, der opretholder bagudkompatibilitet  
- Yderligere eksempler, værktøjer eller ressourcer  

#### Patch Version (X.Y.Z)  
- Fejlrettelser og korrektioner  
- Mindre forbedringer af eksisterende indhold  
- Præciseringer og små forbedringer  

## Feedback og forslag fra fællesskabet  

Vi opfordrer aktivt til feedback fra fællesskabet for at forbedre denne læringsressource:  

### Sådan giver du feedback  
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke problemer er velkomne)  
- **Discord-diskussioner**: Del idéer og engager dig med Azure AI Foundry-fællesskabet  
- **Pull Requests**: Bidrag direkte med forbedringer til indhold, især AI-skabeloner og vejledninger  
- **Azure AI Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI-diskussioner  
- **Fællesskabsfora**: Deltag i bredere diskussioner blandt Azure-udviklere  

### Feedbackkategorier  
- **AI-indholds nøjagtighed**: Rettelser til AI-tjenesteintegration og udrulningsinformation  
- **Læringsoplevelse**: Forslag til forbedret AI-udviklerlæringsflow  
- **Manglende AI-indhold**: Anmodninger om yderligere AI-skabeloner, mønstre eller eksempler  
- **Tilgængelighed**: Forbedringer for forskellige læringsbehov  
- **AI-værktøjsintegration**: Forslag til bedre AI-udviklingsworkflow-integration  
- **Produktionsmønstre for AI**: Anmodninger om erhvervsmæssige AI-udrulningsmønstre  

### Forpligtelse til at svare  
- **Svar på problemer**: Inden for 48 timer for rapporterede problemer  
- **Funktionsanmodninger**: Evaluering inden for en uge  
- **Bidrag fra fællesskabet**: Gennemgang inden for en uge  
- **Sikkerhedsproblemer**: Højeste prioritet med hurtig respons  

## Vedligeholdelsesplan  

### Regelmæssige opdateringer  
- **Månedlige gennemgange**: Nøjagtighed af indhold og validering af links  
- **Kvartalsvise opdateringer**: Større indholdstilføjelser og forbedringer  
- **Halvårlige gennemgange**: Omfattende omstrukturering og forbedring  
- **Årlige udgivelser**: Større versionsopdateringer med betydelige forbedringer  

### Overvågning og kvalitetssikring  
- **Automatiseret test**: Regelmæssig validering af kodeeksempler og links  
- **Integration af fællesskabsfeedback**: Regelmæssig inkorporering af brugerforslag  
- **Teknologiske opdateringer**: Tilpasning til de nyeste Azure-tjenester og azd-udgivelser  
- **Tilgængelighedsaudits**: Regelmæssig gennemgang for inkluderende designprincipper  

## Versionsstøttepolitik  

### Aktuel versionsstøtte  
- **Seneste hovedversion**: Fuld støtte med regelmæssige opdateringer  
- **Forrige hovedversion**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder  
- **Ældre versioner**: Kun fællesskabsstøtte, ingen officielle opdateringer  

### Vejledning til migration  
Når hovedversioner udgives, tilbyder vi:  
- **Migrationsvejledninger**: Trin-for-trin overgangsinstruktioner  
- **Kompatibilitetsnoter**: Detaljer om brud på kompatibilitet  
- **Værktøjsstøtte**: Scripts eller hjælpeprogrammer til at hjælpe med migration  
- **Fællesskabsstøtte**: Dedikerede fora til migrationsspørgsmål  

---

**Navigation**  
- **Forrige lektion**: [Studievejledning](resources/study-guide.md)  
- **Næste lektion**: Gå tilbage til [Hoved README](README.md)  

**Hold dig opdateret**: Følg dette repository for notifikationer om nye udgivelser og vigtige opdateringer af læringsmaterialet.  

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.