<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9736db53ea878e07688670ebcc8906bc",
  "translation_date": "2025-09-12T21:03:52+00:00",
  "source_file": "changelog.md",
  "language_code": "da"
}
-->
# Ændringslog - AZD For Begyndere

## Introduktion

Denne ændringslog dokumenterer alle væsentlige ændringer, opdateringer og forbedringer i AZD For Begyndere-repositoriet. Vi følger principperne for semantisk versionering og opretholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Holde dig opdateret om nye funktioner og tilføjelser af indhold
- Forstå forbedringer af eksisterende dokumentation
- Følge fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslogens indhold vil du kunne:
- Identificere nyt indhold og ressourcer til læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringssti baseret på de mest aktuelle materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.0.0] - 2025-09-12

#### Større ændringer - Fokus på AI-udviklere og integration med Azure AI Foundry
**Denne version omdanner repositoriet til en omfattende AI-fokuseret læringsressource med integration af Azure AI Foundry.**

#### Tilføjet
- **🤖 AI-Første Læringssti**: Komplet omstrukturering med prioritering af AI-udviklere og ingeniører
- **Azure AI Foundry Integrationsguide**: Omfattende dokumentation for at forbinde AZD med Azure AI Foundry-tjenester
- **AI Model Implementeringsmønstre**: Detaljeret guide om modelvalg, konfiguration og produktionsimplementeringsstrategier
- **AI Workshop Lab**: 2-3 timers praktisk workshop til konvertering af AI-applikationer til AZD-implementerbare løsninger
- **Best Practices for AI i Produktion**: Enterprise-klare mønstre for skalering, overvågning og sikring af AI-arbejdsbelastninger
- **AI-Specifik Fejlfindingsguide**: Omfattende fejlfindingsressourcer for Azure OpenAI, Cognitive Services og AI-implementeringsproblemer
- **AI Template Gallery**: Udvalgt samling af Azure AI Foundry-skabeloner med kompleksitetsvurderinger
- **Workshopmaterialer**: Komplet workshopstruktur med praktiske øvelser og referencematerialer

#### Forbedret
- **README-struktur**: Fokus på AI-udviklere med 45% community-interesse data fra Azure AI Foundry Discord
- **Læringsstier**: Dedikeret AI-udviklerrejse sammen med traditionelle stier for studerende og DevOps-ingeniører
- **Skabelonanbefalinger**: Udvalgte AI-skabeloner, herunder azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord-community support med AI-specifikke kanaler og diskussioner

#### Fokus på sikkerhed og produktion
- **Mønstre for Managed Identity**: AI-specifikke autentifikations- og sikkerhedskonfigurationer
- **Omkostningsoptimering**: Sporing af tokenforbrug og budgetkontroller for AI-arbejdsbelastninger
- **Multi-region Implementering**: Strategier for global implementering af AI-applikationer
- **Performance Overvågning**: AI-specifikke metrikker og integration med Application Insights

#### Dokumentationskvalitet
- **Lineær Kursusstruktur**: Logisk progression fra begynder til avancerede AI-implementeringsmønstre
- **Validerede URL'er**: Alle eksterne repositorielinks verificeret og tilgængelige
- **Komplet Reference**: Alle interne dokumentationslinks valideret og funktionelle
- **Produktionsklar**: Enterprise-implementeringsmønstre med eksempler fra den virkelige verden

### [v2.0.0] - 2025-09-09

#### Større ændringer - Omstrukturering af repositoriet og professionel forbedring
**Denne version repræsenterer en betydelig revision af repositoriets struktur og præsentation af indhold.**

#### Tilføjet
- **Struktureret Læringsramme**: Alle dokumentationssider inkluderer nu sektioner for Introduktion, Læringsmål og Læringsresultater
- **Navigationssystem**: Tilføjet links til forrige/næste lektion gennem hele dokumentationen for guidet læringsprogression
- **Studieguide**: Omfattende study-guide.md med læringsmål, øvelser og vurderingsmaterialer
- **Professionel Præsentation**: Fjernet alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Forbedret Indholdsstruktur**: Forbedret organisering og flow af læringsmaterialer

#### Ændret
- **Dokumentationsformat**: Standardiseret al dokumentation med en konsekvent læringsfokuseret struktur
- **Navigationsflow**: Implementeret logisk progression gennem alle læringsmaterialer
- **Indholdspræsentation**: Fjernet dekorative elementer til fordel for klar og professionel formatering
- **Linkstruktur**: Opdateret alle interne links for at understøtte det nye navigationssystem

#### Forbedret
- **Tilgængelighed**: Fjernet afhængighed af emoji for bedre skærmlæserkompatibilitet
- **Professionelt Udseende**: Rent, akademisk stil egnet til enterprise-læring
- **Læringsoplevelse**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Indholdsorganisering**: Bedre logisk flow og forbindelse mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Første Udgivelse - Omfattende AZD Læringsrepository

#### Tilføjet
- **Kerne Dokumentationsstruktur**
  - Komplet serie af kom-i-gang guides
  - Omfattende dokumentation for implementering og klargøring
  - Detaljerede fejlfindingsressourcer og fejlsøgningsguider
  - Værktøjer og procedurer til validering før implementering

- **Kom-i-gang Modul**
  - AZD Basics: Kernekoncepter og terminologi
  - Installationsguide: Platform-specifikke opsætningsinstruktioner
  - Konfigurationsguide: Miljøopsætning og autentifikation
  - Første Projekt Tutorial: Trin-for-trin praktisk læring

- **Implementerings- og Klargøringsmodul**
  - Implementeringsguide: Komplet workflow-dokumentation
  - Klargøringsguide: Infrastruktur som kode med Bicep
  - Best practices for produktionsimplementeringer
  - Multi-service arkitekturmønstre

- **Valideringsmodul før Implementering**
  - Kapacitetsplanlægning: Validering af Azure-ressource tilgængelighed
  - SKU-valg: Omfattende vejledning om servicelag
  - Pre-flight Checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Omkostningsestimering og budgetplanlægningsværktøjer

- **Fejlfindingsmodul**
  - Almindelige Problemer: Hyppigt forekommende problemer og løsninger
  - Fejlsøgningsguide: Systematiske fejlfindingsmetoder
  - Avancerede diagnostiske teknikker og værktøjer
  - Performance overvågning og optimering

- **Ressourcer og Referencer**
  - Kommando Cheat Sheet: Hurtig reference til essentielle kommandoer
  - Ordliste: Omfattende terminologi og akronymdefinitioner
  - FAQ: Detaljerede svar på almindelige spørgsmål
  - Eksterne ressourcelinks og community-forbindelser

- **Eksempler og Skabeloner**
  - Simpel Webapplikation eksempel
  - Skabelon til implementering af statisk hjemmeside
  - Konfiguration af containerapplikation
  - Databaseintegrationsmønstre
  - Eksempler på mikroservices arkitektur
  - Implementeringer af serverløse funktioner

#### Funktioner
- **Multi-platform Support**: Installations- og konfigurationsguider til Windows, macOS og Linux
- **Flere Færdighedsniveauer**: Indhold designet til studerende og professionelle udviklere
- **Praktisk Fokus**: Praktiske eksempler og scenarier fra den virkelige verden
- **Omfattende Dækning**: Fra grundlæggende koncepter til avancerede enterprise-mønstre
- **Sikkerhedsførst Tilgang**: Sikkerhedsbest practices integreret gennem hele
- **Omkostningsoptimering**: Vejledning til omkostningseffektive implementeringer og ressourcehåndtering

#### Dokumentationskvalitet
- **Detaljerede Kodeeksempler**: Praktiske, testede kodeeksempler
- **Trin-for-trin Instruktioner**: Klar, handlingsorienteret vejledning
- **Omfattende Fejlhåndtering**: Fejlfindingsressourcer til almindelige problemer
- **Best Practices Integration**: Industriens standarder og anbefalinger
- **Versionskompatibilitet**: Opdateret med de nyeste Azure-tjenester og azd-funktioner

## Planlagte Fremtidige Forbedringer

### Version 3.1.0 (Planlagt)
#### Udvidelse af AI-platform
- **Multi-model Support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og brugerdefinerede modeller
- **AI Agent Frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen implementeringer
- **Avancerede RAG-mønstre**: Vektordatabase muligheder ud over Azure AI Search (Pinecone, Weaviate osv.)
- **AI Observability**: Forbedret overvågning af modelperformance, tokenforbrug og svarkvalitet

#### Udvikleroplevelse
- **VS Code Udvidelse**: Integreret AZD + AI Foundry udviklingsoplevelse
- **GitHub Copilot Integration**: AI-assisteret AZD skabelongenerering
- **Interaktive Tutorials**: Praktiske kodningsøvelser med automatiseret validering for AI-scenarier
- **Videomateriale**: Supplerende videotutorials for visuelle lærere med fokus på AI-implementeringer

### Version 4.0.0 (Planlagt)
#### Enterprise AI-mønstre
- **Governance Framework**: AI-model governance, compliance og revisionsspor
- **Multi-Tenant AI**: Mønstre til betjening af flere kunder med isolerede AI-tjenester
- **Edge AI Implementering**: Integration med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud og hybrid implementeringsmønstre for AI-arbejdsbelastninger

#### Avancerede Funktioner
- **AI Pipeline Automation**: MLOps integration med Azure Machine Learning pipelines
- **Avanceret Sikkerhed**: Zero-trust mønstre, private endpoints og avanceret trusselsbeskyttelse
- **Performance Optimering**: Avanceret tuning og skalering for høj-gennemstrømnings AI-applikationer
- **Global Distribution**: Indholdslevering og edge caching mønstre for AI-applikationer

### Version 3.0.0 (Planlagt) - Erstattet af Nuværende Udgivelse
#### Foreslåede Tilføjelser - Nu Implementeret i v3.0.0
- ✅ **AI-Fokuseret Indhold**: Omfattende Azure AI Foundry integration (Fuldført)
- ✅ **Interaktive Tutorials**: Praktisk AI workshop lab (Fuldført)
- ✅ **Avanceret Sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Performance Optimering**: Tuningstrategier for AI-arbejdsbelastninger (Fuldført)

### Version 2.1.0 (Planlagt) - Delvist Implementeret i v3.0.0
#### Mindre Forbedringer - Nogle Fuldført i Nuværende Udgivelse
- ✅ **Yderligere Eksempler**: AI-fokuserede implementeringsscenarier (Fuldført)
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfindingsressourcer (Fuldført)
- **Værktøjsintegration**: Forbedrede IDE- og editorintegrationsguider
- ✅ **Udvidet Overvågning**: AI-specifikke overvågnings- og alarmeringsmønstre (Fuldført)

#### Stadig Planlagt til Fremtidig Udgivelse
- **Mobilvenlig Dokumentation**: Responsivt design til mobil læring
- **Offline Adgang**: Downloadbare dokumentationspakker
- **Forbedret IDE Integration**: VS Code udvidelse til AZD + AI workflows
- **Community Dashboard**: Realtids community-metrikker og bidragsregistrering

## Bidrag til Ændringsloggen

### Rapportering af Ændringer
Når du bidrager til dette repository, skal du sikre, at ændringslogens indhold inkluderer:

1. **Versionsnummer**: Følger semantisk versionering (major.minor.patch)
2. **Dato**: Udgivelses- eller opdateringsdato i YYYY-MM-DD format
3. **Kategori**: Tilføjet, Ændret, Udfaset, Fjernet, Rettet, Sikkerhed
4. **Klar Beskrivelse**: Kortfattet beskrivelse af hvad der er ændret
5. **Vurdering af Indvirkning**: Hvordan ændringer påvirker eksisterende brugere

### Ændringskategorier

#### Tilføjet
- Nye funktioner, dokumentationssektioner eller kapaciteter
- Nye eksempler, skabeloner eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Ændret
- Modifikationer af eksisterende funktionalitet eller dokumentation
- Opdateringer for at forbedre klarhed eller nøjagtighed
- Omstrukturering af indhold eller organisering

#### Udfaset
- Funktioner eller tilgange der udfases
- Dokumentationssektioner planlagt til fjernelse
- Metoder der har bedre alternativer

#### Fjernet
- Funktioner, dokumentation eller eksempler der ikke længere er relevante
- Forældet information eller udfasede tilgange
- Redundant eller konsolideret indhold

#### Rettet
- Korrektioner af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet

#### Sikkerhed
- Sikkerhedsrelaterede forbedringer eller rettelser
- Opdateringer til sikkerhedsbest practices
- Løsning af sikkerhedssårbarheder

### Retningslinjer for Semantisk Versionering

#### Major Version (X.0.0)
- Brud på bagudkompatibilitet der kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisering
- Ændringer der ændrer den fundamentale tilgang eller metode

#### Minor Version (X.Y.0)
- Nye funktioner eller tilføjelser af indhold
- Forbedringer der opretholder bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch Version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer af eksisterende indhold
- Klargøringer og små forbedringer

## Community Feedback og Forslag

Vi opfordrer aktivt til community-feedback for at forbedre denne læringsressource:

### Sådan Giver Du Feedback
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke emner er velkomne)
- **Discord Diskussioner**: Del idéer og engager dig med Azure AI Foundry-communityet
- **Pull Requests**: Bidrag direkte med forbedringer af indhold, især AI-skabeloner og guider
- **Azure AI Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI diskussioner
- **Community Forums**: Deltag i bredere Azure-udviklerdiskussioner

### Feedbackkategorier
- **AI Indholds Nøjagtighed**: Korrektioner af AI-tjenesteintegration og implementeringsinformation
- **Læringsoplevelse**: Forslag til forbedret læringsflow for AI-udviklere
- **Manglende AI Indhold**: Anmodninger om yderligere AI-skabeloner, mønstre eller eksempler
- **Tilgængelighed**: Forbedringer for forskellige læringsbehov
- **AI Værktøjsintegration**: Forslag til bedre AI-udviklingsworkflow integration
- **Produktions AI Mønstre**: Anmodninger om enterprise AI-implementeringsmønstre

### Responsforpligtelse
- **Issue Respons**: Inden for 48 timer for rapporterede problemer
- **Feature Requests**: Evaluering inden for en uge
- **Community Bidrag**: Gennemgang inden for en uge
- **Sikkerhedsproblemer**: Høj prioritet med hurtig respons

## Vedligeholdelsesplan

### Regelmæssige Opdateringer
- **Månedlige Gennemgange**: Indholds nøjagtighed og linkvalidering
- **Kvartalsvise Opdateringer**: Større tilføjelser og forbedringer af indhold
- **Halvårlige Gennemgange**: Omfattende omstrukturering og forbedring
- **Årlige Udgivelser**: Større versionopdateringer med betydelige forbedringer

### Overvågning og Kvalitet
- **Seneste hovedversion**: Fuld support med regelmæssige opdateringer  
- **Forrige hovedversion**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder  
- **Ældre versioner**: Kun fællesskabsstøtte, ingen officielle opdateringer  

### Vejledning til migration  
Når hovedversioner udgives, tilbyder vi:  
- **Migrationsvejledninger**: Trin-for-trin instruktioner til overgang  
- **Kompatibilitetsnoter**: Detaljer om ændringer, der kan bryde funktionalitet  
- **Værktøjsstøtte**: Scripts eller værktøjer til at hjælpe med migration  
- **Fællesskabsstøtte**: Dedikerede fora til spørgsmål om migration  

---

**Navigation**  
- **Forrige lektion**: [Studievejledning](resources/study-guide.md)  
- **Næste lektion**: Gå tilbage til [Hoved README](README.md)  

**Hold dig opdateret**: Følg dette repository for notifikationer om nye udgivelser og vigtige opdateringer af læringsmaterialerne.  

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.