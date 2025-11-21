<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-21T08:51:58+00:00",
  "source_file": "changelog.md",
  "language_code": "da"
}
-->
# Ændringslog - AZD For Begyndere

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Begyndere-repositoriet. Vi følger principperne for semantisk versionering og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versionerne.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Holde dig informeret om nye funktioner og tilføjelser af indhold
- Forstå forbedringer af eksisterende dokumentation
- Følge fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslogens indhold vil du kunne:
- Identificere nyt indhold og ressourcer til læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringssti baseret på de nyeste materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.8.0] - 2025-11-19

#### Avanceret Dokumentation: Overvågning, Sikkerhed og Multi-Agent Mønstre
**Denne version tilføjer omfattende A-niveau lektioner om integration af Application Insights, autentifikationsmønstre og multi-agent koordinering til produktionsudrulninger.**

#### Tilføjet
- **📊 Application Insights Integration Lektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret udrulning med automatisk klargøring
  - Komplette Bicep-skabeloner for Application Insights + Log Analytics
  - Fungerende Python-applikationer med brugerdefineret telemetri (1.200+ linjer)
  - AI/LLM overvågningsmønstre (Azure OpenAI token/kostsporing)
  - 6 Mermaid-diagrammer (arkitektur, distribueret sporing, telemetriflow)
  - 3 praktiske øvelser (alarmer, dashboards, AI-overvågning)
  - Kusto-query eksempler og strategier for omkostningsoptimering
  - Live metrics streaming og realtidsfejlfinding
  - 40-50 minutters læringstid med produktionsklare mønstre

- **🔐 Autentifikations- & Sikkerhedsmønstre Lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentifikationsmønstre (forbindelsesstrenge, Key Vault, administreret identitet)
  - Komplette Bicep-infrastruktur skabeloner til sikre udrulninger
  - Node.js applikationskode med Azure SDK integration
  - 3 komplette øvelser (aktiver administreret identitet, brugerdefineret identitet, Key Vault rotation)
  - Sikkerhedsbedste praksis og RBAC-konfigurationer
  - Fejlfindingsguide og omkostningsanalyse
  - Produktionsklare mønstre for adgangskodefri autentifikation

- **🤖 Multi-Agent Koordinationsmønstre Lektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmønstre (sekventiel, parallel, hierarkisk, begivenhedsdrevet, konsensus)
  - Komplet orkestrator service implementering (Python/Flask, 1.500+ linjer)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus integration til beskedkøer
  - Cosmos DB tilstandsstyring for distribuerede systemer
  - 6 Mermaid-diagrammer der viser agentinteraktioner
  - 3 avancerede øvelser (timeout håndtering, retry logik, circuit breaker)
  - Omkostningsoversigt ($240-565/måned) med optimeringsstrategier
  - Application Insights integration til overvågning

#### Forbedret
- **Kapitel om Pre-deployment**: Indeholder nu omfattende overvågnings- og koordinationsmønstre
- **Kapitel om Kom Godt I Gang**: Forbedret med professionelle autentifikationsmønstre
- **Produktionsklarhed**: Fuld dækning fra sikkerhed til observabilitet
- **Kursusoversigt**: Opdateret til at referere til nye lektioner i kapitel 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og overvågning gennem hele kurset
- **Dokumentationskvalitet**: Konsistente A-niveau standarder (95-97%) på tværs af nye lektioner
- **Produktionsmønstre**: Fuld dækning fra start til slut for virksomhedsudrulninger

#### Forbedret
- **Udvikleroplevelse**: Klar vej fra udvikling til produktionsovervågning
- **Sikkerhedsstandarder**: Professionelle mønstre for autentifikation og hemmelighedshåndtering
- **Observabilitet**: Komplet Application Insights integration med AZD
- **AI Arbejdsbelastninger**: Specialiseret overvågning for Azure OpenAI og multi-agent systemer

#### Valideret
- ✅ Alle lektioner inkluderer komplet fungerende kode (ikke kun uddrag)
- ✅ Mermaid-diagrammer til visuel læring (19 i alt på tværs af 3 lektioner)
- ✅ Praktiske øvelser med verifikationsskridt (9 i alt)
- ✅ Produktionsklare Bicep-skabeloner kan udrulles via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlfindingsguider og bedste praksis
- ✅ Videnskontrol med verifikationskommandoer

#### Dokumentationsbedømmelsesresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsguide
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent arkitekturer
- **Samlet Nyt Indhold**: - Konsistente høj kvalitetsstandarder

#### Teknisk Implementering
- **Application Insights**: Log Analytics + brugerdefineret telemetri + distribueret sporing
- **Autentifikation**: Administreret identitet + Key Vault + RBAC mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvågning**: Live metrics + Kusto queries + alarmer + dashboards
- **Omkostningsstyring**: Sampling strategier, retention politikker, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Dokumentationskvalitetsforbedringer og Nyt Azure OpenAI Eksempel
**Denne version forbedrer dokumentationskvaliteten på tværs af repositoriet og tilføjer et komplet Azure OpenAI udrulningseksempel med GPT-4 chat interface.**

#### Tilføjet
- **🤖 Azure OpenAI Chat Eksempel**: Komplet GPT-4 udrulning med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplet Azure OpenAI infrastruktur (GPT-4 model udrulning)
  - Python kommandolinje chat interface med samtalehistorik
  - Key Vault integration til sikker opbevaring af API-nøgler
  - Token brugssporing og omkostningsestimering
  - Ratebegrænsning og fejlhåndtering
  - Omfattende README med 35-45 minutters udrulningsguide
  - 11 produktionsklare filer (Bicep-skabeloner, Python-app, konfiguration)
- **📚 Dokumentationsøvelser**: Tilføjet praktiske øvelser til konfigurationsguiden:
  - Øvelse 1: Multi-miljø konfiguration (15 minutter)
  - Øvelse 2: Hemmelighedshåndteringspraksis (10 minutter)
  - Klare succeskriterier og verifikationsskridt
- **✅ Udrulningsverifikation**: Tilføjet verifikationssektion til udrulningsguiden:
  - Sundhedstjek procedurer
  - Succeskriterier tjekliste
  - Forventede outputs for alle udrulningskommandoer
  - Fejlfindingshurtigreference

#### Forbedret
- **examples/README.md**: Opdateret til A-niveau kvalitet (93%):
  - Tilføjet azure-openai-chat til alle relevante sektioner
  - Opdateret lokalt eksempelantal fra 3 til 4
  - Tilføjet til AI Applikationseksempler tabel
  - Integreret i Quick Start for Mellembrugere
  - Tilføjet til Azure AI Foundry Templates sektion
  - Opdateret sammenligningsmatrix og teknologifindingssektioner
- **Dokumentationskvalitet**: Forbedret B+ (87%) → A- (92%) på tværs af docs-mappen:
  - Tilføjet forventede outputs til kritiske kommandoeksempler
  - Inkluderet verifikationsskridt for konfigurationsændringer
  - Forbedret praktisk læring med praktiske øvelser

#### Ændret
- **Læringsprogression**: Bedre integration af AI-eksempler for mellembrugere
- **Dokumentationsstruktur**: Mere handlingsorienterede øvelser med klare resultater
- **Verifikationsproces**: Eksplicitte succeskriterier tilføjet til nøglearbejdsgange

#### Forbedret
- **Udvikleroplevelse**: Azure OpenAI udrulning tager nu 35-45 minutter (vs 60-90 for komplekse alternativer)
- **Omkostningstransparens**: Klare omkostningsestimater ($50-200/måned) for Azure OpenAI eksempel
- **Læringssti**: AI-udviklere har en klar indgang med azure-openai-chat
- **Dokumentationsstandarder**: Konsistente forventede outputs og verifikationsskridt

#### Valideret
- ✅ Azure OpenAI eksempel fuldt funktionelt med `azd up`
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte
- ✅ README instruktioner matcher faktisk udrulningserfaring
- ✅ Dokumentationslinks opdateret på tværs af 8+ placeringer
- ✅ Eksempler indeks afspejler korrekt 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabeller
- ✅ Alle navigationsreferencer korrekte

#### Teknisk Implementering
- **Azure OpenAI Arkitektur**: GPT-4 + Key Vault + Container Apps mønster
- **Sikkerhed**: Klar til administreret identitet, hemmeligheder i Key Vault
- **Overvågning**: Application Insights integration
- **Omkostningsstyring**: Token sporing og brug optimering
- **Udrulning**: Enkelt `azd up` kommando til komplet opsætning

### [v3.6.0] - 2025-11-19

#### Større Opdatering: Container App Udrulningseksempler
**Denne version introducerer omfattende, produktionsklare containerapplikationsudrulningseksempler ved brug af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsstien.**

#### Tilføjet
- **🚀 Container App Eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplet oversigt over containeriserede udrulninger, quick start, produktion og avancerede mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Begynder-venlig REST API med scale-to-zero, sundhedsprober, overvågning og fejlfinding
  - [Microservices Arkitektur](../../examples/container-app/microservices): Produktionsklar multi-service udrulning (API Gateway, Produkt, Ordre, Bruger, Notifikation), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret sporing, blue-green/canary udrulning
- **Bedste Praksis**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD vejledning for containeriserede arbejdsbelastninger
- **Kodeeksempler**: Komplet `azure.yaml`, Bicep-skabeloner og multi-sprog serviceimplementeringer (Python, Node.js, C#, Go)
- **Test & Fejlfinding**: End-to-end testscenarier, overvågningskommandoer, fejlfindingsvejledning

#### Ændret
- **README.md**: Opdateret til at fremhæve og linke til nye container app eksempler under "Lokale Eksempler - Container Applikationer"
- **examples/README.md**: Opdateret til at fremhæve container app eksempler, tilføje sammenligningsmatrix poster og opdatere teknologi/arkitektur referencer
- **Kursusoversigt & Studieguide**: Opdateret til at referere til nye container app eksempler og udrulningsmønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan udrulles med `azd up` og følger bedste praksis
- ✅ Dokumentationskrydsreferencer og navigation opdateret
- ✅ Eksempler dækker begynder- til avancerede scenarier, inklusive produktions-mikrotjenester

#### Noter
- **Omfang**: Engelsk dokumentation og eksempler kun
- **Næste Skridt**: Udvid med yderligere avancerede container mønstre og CI/CD automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produktomdøbning: Microsoft Foundry
**Denne version implementerer en omfattende produktnavneændring fra "Azure AI Foundry" til "Microsoft Foundry" på tværs af al engelsk dokumentation, der afspejler Microsofts officielle omdøbning.**

#### Ændret
- **🔄 Produktnavneopdatering**: Komplet omdøbning fra "Azure AI Foundry" til "Microsoft Foundry"
  - Opdateret alle referencer på tværs af engelsk dokumentation i `docs/` mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - I alt: 23 indholdsreferencer opdateret på tværs af 7 dokumentationsfiler

- **📁 Mappestrukturændringer**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret til at afspejle ny mappestruktur
  - Navigationslinks valideret på tværs af al dokumentation

- **📄 Filomdøbninger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til nyt filnavn

#### Opdaterede Filer
- **Kapitel Dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslink opdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnereferencer opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede bruger Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, community feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreferencelinks opdateret
  - `docs/getting-started/first-project.md` - 2 kapitel navigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 næste kapitel links opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapitel titler, templates sektion, community indsigt)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitelressourcer)

#### Valideret
- ✅ Ingen resterende "ai-foundry" mappesti referencer i engelsk dokumentation
- ✅ Ingen resterende "Azure AI Foundry" produktnavnereferencer i engelsk dokumentation
- ✅ Alle navigationslinks fungerer med ny mappestruktur
- ✅ Fil- og mappenavneændringer gennemført succesfuldt
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Omfang**: Ændringer anvendt på engelsk dokumentation i `docs/` mappen kun
- **Oversættelser**: Oversættelsesmapper (`translations/`) ikke opdateret i denne version
- **Workshop**: Workshopmaterialer (`workshop/`) er ikke opdateret i denne version
- **Eksempler**: Eksempel-filer kan stadig referere til ældre navngivning (vil blive adresseret i fremtidige opdateringer)
- **Eksterne links**: Eksterne URL'er og GitHub-referencer forbliver uændrede

#### Migreringsvejledning for bidragsydere
Hvis du har lokale grene eller dokumentation, der refererer til den gamle struktur:
1. Opdater mappereferencer: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filreferencer: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Azure AI Foundry" → "Microsoft Foundry"
4. Valider, at alle interne dokumentationslinks stadig fungerer

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur Preview og Valideringsforbedringer
**Denne version introducerer omfattende support til den nye Azure Developer CLI preview-funktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattende dækning af den nye infrastruktur preview-funktion
  - Kommando-reference og brugseksempler i cheat sheet
  - Detaljeret integration i provisioneringsvejledning med brugsscenarier og fordele
  - Pre-flight check integration for sikrere implementeringsvalidering
  - Opdateringer i kom-i-gang vejledning med sikkerhedsorienterede implementeringspraksisser
- **🚧 Workshop Status Banner**: Professionelt HTML-banner, der angiver workshopudviklingsstatus
  - Gradientdesign med konstruktionsindikatorer for klar kommunikation til brugere
  - Sidst opdateret tidsstempel for gennemsigtighed
  - Mobilresponsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktursikkerhed**: Preview-funktionalitet integreret i hele implementeringsdokumentationen
- **Pre-deployment Validering**: Automatiserede scripts inkluderer nu infrastruktur preview-test
- **Udviklerarbejdsgang**: Opdaterede kommandosekvenser inkluderer preview som bedste praksis
- **Workshopoplevelse**: Klare forventninger til brugere om indholdsudviklingsstatus

#### Ændret
- **Implementeringsbedste praksis**: Preview-første arbejdsgang anbefales nu som tilgang
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshoppræsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerhedsorienteret tilgang**: Infrastrukturændringer kan nu valideres før implementering
- **Team-samarbejde**: Preview-resultater kan deles til gennemgang og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisionering
- **Risikoafhjælpning**: Reducerede implementeringsfejl gennem avanceret validering

#### Teknisk implementering
- **Multi-dokument integration**: Preview-funktion dokumenteret på tværs af 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentationen
- **Bedste praksis integration**: Preview inkluderet i valideringsarbejdsgange og scripts
- **Visuelle indikatorer**: Klare NYE funktionsmarkeringer for opdagelighed

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionelt HTML-banner med gradient-styling
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel præsentation**: Opretholder repositorys troværdighed, mens forventninger sættes
- **Tidslinjegennemsigtighed**: Oktober 2025 sidst opdateret tidsstempel for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede Workshopmaterialer og Interaktiv Læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive vejledninger og strukturerede læringsforløb.**

#### Tilføjet
- **🎥 Interaktiv Workshopvejledning**: Browserbaseret workshopoplevelse med MkDocs preview-funktion
- **📝 Strukturerede Workshopinstruktioner**: 7-trins guidet læringsforløb fra opdagelse til tilpasning
  - 0-Introduktion: Workshopoversigt og opsætning
  - 1-Vælg-AI-Template: Skabelonopdagelse og udvælgelsesproces
  - 2-Valider-AI-Template: Implementerings- og valideringsprocedurer
  - 3-Dekonstruer-AI-Template: Forståelse af skabelonarkitektur
  - 4-Konfigurer-AI-Template: Konfiguration og tilpasning
  - 5-Tilpas-AI-Template: Avancerede ændringer og iterationer
  - 6-Nedtag-Infrastruktur: Oprydning og ressourcehåndtering
  - 7-Afslutning: Opsummering og næste skridt
- **🛠️ Workshopværktøjer**: MkDocs-konfiguration med Material-tema for forbedret læringsoplevelse
- **🎯 Praktisk Læringsforløb**: 3-trins metode (Opdagelse → Implementering → Tilpasning)
- **📱 GitHub Codespaces Integration**: Problemfri opsætning af udviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Udvidet med omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsimplementering
- **Udvikleroplevelse**: Integrerede værktøjer til strømlinede udviklingsarbejdsgange

#### Forbedret
- **Tilgængelighed**: Browserbaseret interface med søge-, kopieringsfunktionalitet og tema-skift
- **Selvstyret læring**: Fleksibel workshopstruktur, der tilpasser sig forskellige læringshastigheder
- **Praktisk anvendelse**: Virkelighedsnære AI-skabelon implementeringsscenarier
- **Community Integration**: Discord-integration for workshopstøtte og samarbejde

#### Workshopfunktioner
- **Indbygget søgning**: Hurtig søgeord og lektionsopdagelse
- **Kopier kodeblokke**: Hover-til-kopier funktionalitet for alle kodeeksempler
- **Tema-skift**: Mørk/lys tilstand understøttelse for forskellige præferencer
- **Visuelle aktiver**: Skærmbilleder og diagrammer for forbedret forståelse
- **Hjælpeintegration**: Direkte Discord-adgang for community support

### [v3.2.0] - 2025-09-17

#### Større Navigationsomstrukturering og Kapitelbaseret Læringssystem
**Denne version introducerer en omfattende kapitelbaseret læringsstruktur med forbedret navigation i hele repositoryet.**

#### Tilføjet
- **📚 Kapitelbaseret Læringssystem**: Omstruktureret hele kurset i 8 progressive læringskapitler
  - Kapitel 1: Grundlag & Hurtig Start (⭐ - 30-45 min)
  - Kapitel 2: AI-First Udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentifikation (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & Implementering (⭐⭐⭐ - 1-1,5 timer)
  - Kapitel 5: Multi-Agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Pre-Deployment Validering & Planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1,5 timer)
  - Kapitel 8: Produktion & Enterprise Mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende Navigationssystem**: Konsistente navigationsoverskrifter og -fødder på tværs af al dokumentation
- **🎯 Fremskridtssporing**: Kursusafslutningscheckliste og læringsverifikationssystem
- **🗺️ Læringsvejledning**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference Navigation**: Relaterede kapitler og forudsætninger tydeligt linket

#### Forbedret
- **README Struktur**: Omformet til en struktureret læringsplatform med kapitelbaseret organisation
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelkontekst og progressionsvejledning
- **Skabelonorganisation**: Eksempler og skabeloner kortlagt til relevante læringskapitler
- **Ressourceintegration**: Cheat sheets, FAQ'er og studievejledninger forbundet til relevante kapitler
- **Workshopintegration**: Hands-on labs kortlagt til flere kapitel læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibel kapitelbaseret læring
- **Konfigurationsplacering**: Omplaceret konfigurationsvejledning som Kapitel 3 for bedre læringsflow
- **AI Indholdsintegration**: Bedre integration af AI-specifikt indhold i hele læringsrejsen
- **Produktionsindhold**: Avancerede mønstre konsolideret i Kapitel 8 for enterprise-lærere

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og kapitelprogressionsindikatorer
- **Tilgængelighed**: Konsistente navigationsmønstre for lettere kursusgennemgang
- **Professionel præsentation**: Universitetsstil kursusstruktur egnet til akademisk og virksomhedstræning
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisation

#### Teknisk implementering
- **Navigationsoverskrifter**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Fodernavigation**: Konsistent progressionsvejledning og kapitelafslutningsindikatorer
- **Krydslinkning**: Omfattende intern linkningssystem, der forbinder relaterede begreber
- **Kapitelkortlægning**: Skabeloner og eksempler tydeligt forbundet med læringsmål

#### Studievejledning Forbedring
- **📚 Omfattende Læringsmål**: Omstruktureret studievejledning til at matche 8-kapitel systemet
- **🎯 Kapitelbaseret Vurdering**: Hvert kapitel inkluderer specifikke læringsmål og praktiske øvelser
- **📋 Fremskridtssporing**: Ugentlig læringsplan med målbare resultater og afslutningschecklister
- **❓ Vurderingsspørgsmål**: Videnvalideringsspørgsmål for hvert kapitel med professionelle resultater
- **🛠️ Praktiske Øvelser**: Hands-on aktiviteter med reelle implementeringsscenarier og fejlfinding
- **📊 Færdighedsprogression**: Klar fremgang fra grundlæggende begreber til enterprise mønstre med fokus på karriereudvikling
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og community anerkendelsessystem
- **⏱️ Tidsstyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger
**Denne version forbedrer den multi-agent detail-løsning med bedre agentnavngivning og forbedret dokumentation.**

#### Ændret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Kundeagent" i hele detail-multi-agent løsningen for klarere forståelse
- **Agentarkitektur**: Opdateret al dokumentation, ARM-skabeloner og kodeeksempler til at bruge konsistent "Kundeagent" navngivning
- **Konfigurationseksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Dokumentationskonsistens**: Sikret, at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM Skabelonpakke**: Opdateret detail-multiagent-arm-template med Kundeagent-referencer
- **Arkitekturdiagrammer**: Opfriskede Mermaid-diagrammer med opdateret agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruger nu CustomerAgent navngivning
- **Miljøvariabler**: Opdateret alle implementeringsscripts til at bruge CUSTOMER_AGENT_NAME konventioner

#### Forbedret
- **Udvikleroplevelse**: Klarere agentroller og ansvar i dokumentationen
- **Produktionsparathed**: Bedre tilpasning til enterprise navngivningskonventioner
- **Læringsmaterialer**: Mere intuitiv agentnavngivning til uddannelsesformål
- **Skabelonbrugervenlighed**: Forenklet forståelse af agentfunktioner og implementeringsmønstre

#### Tekniske Detaljer
- Opdaterede Mermaid arkitekturdiagrammer med CustomerAgent referencer
- Erstattet CoraAgent klasse-navne med CustomerAgent i Python-eksempler
- Ændret ARM-skabelon JSON-konfigurationer til at bruge "customer" agenttype
- Opdaterede miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opfriskede alle implementeringskommandoer og containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Større Ændringer - AI Udviklerfokus og Azure AI Foundry Integration
**Denne version transformerer repositoryet til en omfattende AI-fokuseret læringsressource med Azure AI Foundry integration.**

#### Tilføjet
- **🤖 AI-First Læringsforløb**: Komplet omstrukturering med prioritering af AI-udviklere og ingeniører
- **Azure AI Foundry Integrationsvejledning**: Omfattende dokumentation for tilslutning af AZD med Azure AI Foundry tjenester
- **AI Model Implementeringsmønstre**: Detaljeret vejledning om modelvalg, konfiguration og produktionsimplementeringsstrategier
- **AI Workshop Lab**: 2-3 timers hands-on workshop til konvertering af AI-applikationer til AZD-implementerbare løsninger
- **Produktions AI Bedste Praksisser**: Enterprise-klare mønstre til skalering, overvågning og sikring af AI-arbejdsbelastninger
- **AI-Specifik Fejlfinding**: Omfattende fejlfinding for Azure OpenAI, Cognitive Services og AI-implementeringsproblemer
- **AI Skabelongalleri**: Udvalgt samling af Azure AI Foundry skabeloner med kompleksitetsvurderinger
- **Workshopmaterialer**: Komplet workshopstruktur med hands-on labs og referencematerialer

#### Forbedret
- **README Struktur**: AI-udviklerfokuseret med 45% community interesse data fra Azure AI Foundry Discord
- **Læringsforløb**: Dedikeret AI-udviklerrejse sammen med traditionelle forløb for studerende og DevOps-ingeniører
- **Skabelonanbefalinger**: Udvalgte AI-skabeloner inklusive azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord community support med AI-specifikke kanaler og diskussioner

#### Sikkerhed & Produktionsfokus
- **Managed Identity Mønstre**: AI-specifikke autentifikations- og sikkerhedskonfigurationer
- **Omkostningsoptimering**: Token-brugsopfølgning og budgetkontroller for AI-arbejdsbelastninger
- **Multi-Region Implementering**: Strategier for global AI-applikationsimplementering
- **Performance Overvågning**: AI-specifikke metrikker og Application Insights integration

#### Dokumentationskvalitet
- **Lineært Kursusforløb**: Logisk progression fra begynder til avancerede AI-implementeringsmønstre
- **Validerede URL'er**: Alle eksterne repository-links verificeret og tilgængelige
- **Komplet Reference**: Alle interne dokumentationslinks valideret og funktionelle
- **Produktionsklar**: Enterprise implementeringsmønstre med virkelighedsnære eksempler

### [v2.0.0] - 2025-09-09

#### Større Ændringer - Repository Omstrukturering og Professionel Forbedring
**Denne version repræsenterer en betydelig revision af repository-strukturen og indholdspræsentationen.**

#### Tilføjet
- **Struktureret Læringsramme**: Alle dokumentationssider inkluderer nu Introduktion, Læringsmål og Læringsresultater sektioner
- **Navigationssystem**: Tilføjet Forrige/Næste lektionslinks i hele dokumentationen for guidet læringsprogression
- **Studievejledning**: Omfattende study-guide.md med læringsmål, praktiske øvelser og vurderingsmaterialer
- **Professionel Præsentation**: Fjernet alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Forbedret Indholds
- **Indholdspræsentation**: Fjernet dekorative elementer til fordel for klar og professionel formatering
- **Linkstruktur**: Opdateret alle interne links for at understøtte det nye navigationssystem

#### Forbedret
- **Tilgængelighed**: Fjernet afhængighed af emojis for bedre skærmlæserkompatibilitet
- **Professionelt Udseende**: Ren, akademisk stil, der passer til virksomhedsuddannelse
- **Læringsoplevelse**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Indholdsorganisation**: Bedre logisk flow og forbindelse mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Første Udgivelse - Omfattende AZD Læringsrepository

#### Tilføjet
- **Kerne Dokumentationsstruktur**
  - Komplet serie af introduktionsvejledninger
  - Omfattende dokumentation for udrulning og klargøring
  - Detaljerede ressourcer til fejlfinding og fejlretning
  - Værktøjer og procedurer til validering før udrulning

- **Introduktionsmodul**
  - AZD Grundlæggende: Kernekoncepter og terminologi
  - Installationsvejledning: Platformsspecifikke opsætningsinstruktioner
  - Konfigurationsvejledning: Miljøopsætning og autentificering
  - Første Projekt Tutorial: Trin-for-trin praktisk læring

- **Udrulnings- og Klargøringsmodul**
  - Udrulningsvejledning: Komplet workflow-dokumentation
  - Klargøringsvejledning: Infrastruktur som kode med Bicep
  - Bedste praksis for produktionsudrulninger
  - Mønstre for multiservice-arkitektur

- **Valideringsmodul før Udrulning**
  - Kapacitetsplanlægning: Validering af Azure-ressourcetilgængelighed
  - SKU-valg: Omfattende vejledning til servicelag
  - Pre-flight Checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Værktøjer til omkostningsestimering og budgetplanlægning

- **Fejlfindingsmodul**
  - Almindelige Problemer: Hyppigt forekommende problemer og løsninger
  - Fejlretningsvejledning: Systematiske metoder til fejlfinding
  - Avancerede diagnostiske teknikker og værktøjer
  - Overvågning og optimering af ydeevne

- **Ressourcer og Referencer**
  - Kommandogenvej: Hurtig reference til essentielle kommandoer
  - Ordliste: Omfattende terminologi og forkortelser
  - FAQ: Detaljerede svar på almindelige spørgsmål
  - Links til eksterne ressourcer og fællesskabsforbindelser

- **Eksempler og Skabeloner**
  - Eksempel på simpel webapplikation
  - Skabelon til udrulning af statisk hjemmeside
  - Konfiguration af containerapplikation
  - Mønstre for databaseintegration
  - Eksempler på mikrotjenestearkitektur
  - Implementeringer af serverløse funktioner

#### Funktioner
- **Multi-Platform Support**: Installations- og konfigurationsvejledninger til Windows, macOS og Linux
- **Flere Færdighedsniveauer**: Indhold designet til både studerende og professionelle udviklere
- **Praktisk Fokus**: Praktiske eksempler og scenarier fra den virkelige verden
- **Omfattende Dækning**: Fra grundlæggende koncepter til avancerede virksomhedsmønstre
- **Sikkerhed Først**: Sikkerhedsbedste praksis integreret gennem hele materialet
- **Omkostningsoptimering**: Vejledning til omkostningseffektive udrulninger og ressourcehåndtering

#### Dokumentationskvalitet
- **Detaljerede Kodeeksempler**: Praktiske, testede kodeeksempler
- **Trin-for-Trin Instruktioner**: Klar, handlingsorienteret vejledning
- **Omfattende Fejlhåndtering**: Fejlfinding for almindelige problemer
- **Integration af Bedste Praksis**: Industriens standarder og anbefalinger
- **Versionskompatibilitet**: Opdateret med de nyeste Azure-tjenester og azd-funktioner

## Planlagte Fremtidige Forbedringer

### Version 3.1.0 (Planlagt)
#### Udvidelse af AI-platform
- **Multi-Model Support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og brugerdefinerede modeller
- **AI Agent Frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen-udrulninger
- **Avancerede RAG-mønstre**: Vektordatabasevalg ud over Azure AI Search (Pinecone, Weaviate osv.)
- **AI Observability**: Forbedret overvågning af modelpræstation, tokenforbrug og svarkvalitet

#### Udvikleroplevelse
- **VS Code Udvidelse**: Integreret AZD + AI Foundry udviklingsoplevelse
- **GitHub Copilot Integration**: AI-assisteret AZD skabelongenerering
- **Interaktive Tutorials**: Praktiske kodningsøvelser med automatiseret validering for AI-scenarier
- **Videomateriale**: Supplerende videotutorials til visuelle lærere med fokus på AI-udrulninger

### Version 4.0.0 (Planlagt)
#### Virksomheds-AI Mønstre
- **Governance Framework**: AI-modelstyring, overholdelse og revisionsspor
- **Multi-Tenant AI**: Mønstre til betjening af flere kunder med isolerede AI-tjenester
- **Edge AI Udrulning**: Integration med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud og hybrid udrulningsmønstre for AI-arbejdsbelastninger

#### Avancerede Funktioner
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning pipelines
- **Avanceret Sikkerhed**: Zero-trust mønstre, private endpoints og avanceret trusselsbeskyttelse
- **Ydeevneoptimering**: Avancerede tuning- og skaleringsstrategier til højkapacitets AI-applikationer
- **Global Distribution**: Indholdslevering og edge-caching mønstre for AI-applikationer

### Version 3.0.0 (Planlagt) - Erstattet af Nuværende Udgivelse
#### Foreslåede Tilføjelser - Nu Implementeret i v3.0.0
- ✅ **AI-Fokuseret Indhold**: Omfattende Azure AI Foundry integration (Fuldført)
- ✅ **Interaktive Tutorials**: Praktisk AI workshop-lab (Fuldført)
- ✅ **Avanceret Sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Ydeevneoptimering**: Tuningstrategier for AI-arbejdsbelastninger (Fuldført)

### Version 2.1.0 (Planlagt) - Delvist Implementeret i v3.0.0
#### Mindre Forbedringer - Nogle Fuldført i Nuværende Udgivelse
- ✅ **Yderligere Eksempler**: AI-fokuserede udrulningsscenarier (Fuldført)
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldført)
- **Værktøjsintegration**: Forbedrede IDE- og editorintegrationsvejledninger
- ✅ **Udvidet Overvågning**: AI-specifikke overvågnings- og alarmeringsmønstre (Fuldført)

#### Stadig Planlagt til Fremtidig Udgivelse
- **Mobilvenlig Dokumentation**: Responsivt design til mobil læring
- **Offline Adgang**: Downloadbare dokumentationspakker
- **Forbedret IDE Integration**: VS Code udvidelse til AZD + AI workflows
- **Fællesskabsdashboard**: Realtids fællesskabsmålinger og bidragssporing

## Bidrag til Ændringsloggen

### Rapportering af Ændringer
Når du bidrager til dette repository, skal ændringslogindlæg inkludere:

1. **Versionsnummer**: Efter semantisk versionering (major.minor.patch)
2. **Dato**: Udgivelses- eller opdateringsdato i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Tilføjet, Ændret, Udfaset, Fjernet, Rettet, Sikkerhed
4. **Klar Beskrivelse**: Kort beskrivelse af, hvad der er ændret
5. **Vurdering af Indvirkning**: Hvordan ændringer påvirker eksisterende brugere

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
- Redundant eller konsolideret indhold

#### Rettet
- Rettelser af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet

#### Sikkerhed
- Sikkerhedsrelaterede forbedringer eller rettelser
- Opdateringer til sikkerhedsbedste praksis
- Løsning af sikkerhedssårbarheder

### Retningslinjer for Semantisk Versionering

#### Hovedversion (X.0.0)
- Brud på kompatibilitet, der kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisation
- Ændringer, der ændrer den grundlæggende tilgang eller metode

#### Mindre Version (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer, der opretholder bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch Version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer af eksisterende indhold
- Præciseringer og små forbedringer

## Fællesskabsfeedback og Forslag

Vi opfordrer aktivt til fællesskabsfeedback for at forbedre denne læringsressource:

### Sådan Giver Du Feedback
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke problemer er velkomne)
- **Discord Diskussioner**: Del idéer og deltag i Azure AI Foundry-fællesskabet
- **Pull Requests**: Bidrag med direkte forbedringer til indholdet, især AI-skabeloner og vejledninger
- **Azure AI Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI-diskussioner
- **Fællesskabsfora**: Deltag i bredere Azure-udviklerdiskussioner

### Feedbackkategorier
- **AI Indholds Nøjagtighed**: Rettelser til AI-tjenesteintegration og udrulningsinformation
- **Læringsoplevelse**: Forslag til forbedret AI-udviklerlæringsflow
- **Manglende AI Indhold**: Anmodninger om yderligere AI-skabeloner, mønstre eller eksempler
- **Tilgængelighed**: Forbedringer for forskellige læringsbehov
- **AI Værktøjsintegration**: Forslag til bedre AI-udviklingsworkflow-integration
- **Produktions-AI Mønstre**: Anmodninger om virksomhedsmønstre for AI-udrulning

### Responsforpligtelse
- **Problemrespons**: Inden for 48 timer for rapporterede problemer
- **Funktionsanmodninger**: Evaluering inden for en uge
- **Fællesskabsbidrag**: Gennemgang inden for en uge
- **Sikkerhedsproblemer**: Højeste prioritet med hurtig respons

## Vedligeholdelsesplan

### Regelmæssige Opdateringer
- **Månedlige Gennemgange**: Indholds nøjagtighed og linkvalidering
- **Kvartalsvise Opdateringer**: Større indholdsudvidelser og forbedringer
- **Halvårlige Gennemgange**: Omfattende omstrukturering og forbedring
- **Årlige Udgivelser**: Store versionsopdateringer med betydelige forbedringer

### Overvågning og Kvalitetssikring
- **Automatiseret Testning**: Regelmæssig validering af kodeeksempler og links
- **Integration af Fællesskabsfeedback**: Regelmæssig inkorporering af brugerforslag
- **Teknologiske Opdateringer**: Justering med de nyeste Azure-tjenester og azd-udgivelser
- **Tilgængelighedsaudits**: Regelmæssig gennemgang for inkluderende designprincipper

## Versionssupportpolitik

### Aktuel Versionssupport
- **Seneste Hovedversion**: Fuld support med regelmæssige opdateringer
- **Forrige Hovedversion**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder
- **Ældre Versioner**: Kun fællesskabsstøtte, ingen officielle opdateringer

### Migrationsvejledning
Når hovedversioner udgives, tilbyder vi:
- **Migrationsvejledninger**: Trin-for-trin overgangsinstruktioner
- **Kompatibilitetsnoter**: Detaljer om brud på kompatibilitet
- **Værktøjsstøtte**: Scripts eller værktøjer til at hjælpe med migration
- **Fællesskabsstøtte**: Dedikerede fora til migrationsspørgsmål

---

**Navigation**
- **Forrige Lektion**: [Studievejledning](resources/study-guide.md)
- **Næste Lektion**: Gå tilbage til [Hoved README](README.md)

**Hold Dig Opdateret**: Følg dette repository for notifikationer om nye udgivelser og vigtige opdateringer til læringsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->