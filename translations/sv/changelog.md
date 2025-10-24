<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:26:42+00:00",
  "source_file": "changelog.md",
  "language_code": "sv"
}
-->
# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande förändringar, uppdateringar och förbättringar i AZD För Nybörjare-repositoriet. Vi följer principerna för semantisk versionering och upprätthåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versionerna.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa upp buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av utbildningsmaterial över tid

## Läranderesultat

Efter att ha granskat ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din lärandebana baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.4.0] - 2025-10-24

#### Förhandsgranskning av infrastruktur och valideringsförbättringar
**Denna version introducerar omfattande stöd för den nya Azure Developer CLI-förhandsgranskningsfunktionen och förbättrar workshopupplevelsen för användare.**

#### Tillagt
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattande täckning av den nya förhandsgranskningsfunktionen för infrastruktur
  - Kommandoreferens och användningsexempel i fusklapp
  - Detaljerad integration i provisioneringsguiden med användningsfall och fördelar
  - Integrering av förkontroll för säkrare distributionsvalidering
  - Uppdateringar i kom igång-guiden med säkerhetsfokuserade distributionsmetoder
- **🚧 Workshopstatusbanner**: Professionell HTML-banner som indikerar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig kommunikation till användare
  - Senast uppdaterad tidsstämpel för transparens
  - Mobilanpassad design för alla enhetstyper

#### Förbättrat
- **Infrastruktursäkerhet**: Förhandsgranskningsfunktion integrerad i hela distributionsdokumentationen
- **Validering före distribution**: Automatiserade skript inkluderar nu testning av infrastrukturförhandsgranskning
- **Utvecklararbetsflöde**: Uppdaterade kommandosekvenser för att inkludera förhandsgranskning som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar för användare om innehållets utvecklingsstatus

#### Ändrat
- **Bästa praxis för distribution**: Förhandsgranskningsbaserat arbetsflöde rekommenderas nu som tillvägagångssätt
- **Dokumentationsflöde**: Validering av infrastruktur flyttad tidigare i lärandeprocessen
- **Workshoppresentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättrat
- **Säkerhetsfokuserad metod**: Infrastrukturändringar kan nu valideras före distribution
- **Teamarbete**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader före provisionering
- **Riskminskning**: Minskade distributionsfel genom avancerad validering

#### Teknisk implementering
- **Integration i flera dokument**: Förhandsgranskningsfunktionen dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel i hela dokumentationen
- **Bästa praxis-integration**: Förhandsgranskning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NYA funktionsmarkeringar för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientdesign
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Upprätthåller repositoryns trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Senast uppdaterad tidsstämpel för oktober 2025 för ansvarighet

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktiv lärandeupplevelse
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärandebanor.**

#### Tillagt
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs förhandsgranskningsfunktion
- **📝 Strukturerade workshopinstruktioner**: 7-stegs guidad lärandebana från upptäckt till anpassning
  - 0-Introduktion: Workshopöversikt och installation
  - 1-Välj-AI-Mall: Process för att upptäcka och välja mall
  - 2-Validera-AI-Mall: Distributions- och valideringsprocedurer
  - 3-Dekonstruera-AI-Mall: Förståelse för mallarkitektur
  - 4-Konfigurera-AI-Mall: Konfiguration och anpassning
  - 5-Anpassa-AI-Mall: Avancerade modifieringar och iterationer
  - 6-Riv-Infrastruktur: Rensning och resursförvaltning
  - 7-Sammanfattning: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad lärandeupplevelse
- **🎯 Praktisk lärandebana**: 3-stegs metodik (Upptäckt → Distribution → Anpassning)
- **📱 GitHub Codespaces-integration**: Sömlös utvecklingsmiljöinstallation

#### Förbättrat
- **AI Workshop Lab**: Utökad med omfattande 2-3 timmars strukturerad lärandeupplevelse
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Lärandeprogression**: Tydlig steg-för-steg vägledning från mallval till produktionsdistribution
- **Utvecklarupplevelse**: Integrerade verktyg för strömlinjeformade utvecklingsarbetsflöden

#### Förbättrat
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sökfunktion, kopieringsfunktion och temaväxling
- **Självstyrt lärande**: Flexibel workshopstruktur som passar olika lärandehastigheter
- **Praktisk tillämpning**: Scenarier för verklig AI-malldistribution
- **Gemenskapsintegration**: Discord-integration för workshopsupport och samarbete

#### Workshopfunktioner
- **Inbyggd sökning**: Snabb nyckelords- och lektionsupptäckt
- **Kopiera kodblock**: Hover-funktion för att kopiera alla kodexempel
- **Temaväxling**: Stöd för mörkt/ljust läge för olika preferenser
- **Visuella tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt Discord-åtkomst för gemenskapsstöd

### [v3.2.0] - 2025-09-17

#### Omfattande navigeringsomstrukturering och kapitelbaserat lärandesystem
**Denna version introducerar ett omfattande kapitelbaserat lärandesystem med förbättrad navigering i hela repositoriet.**

#### Tillagt
- **📚 Kapitelbaserat lärandesystem**: Omstrukturerade hela kursen till 8 progressiva lärandekapitel
  - Kapitel 1: Grundläggande & Snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-Driven Utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kod & Distribution (⭐⭐⭐ - 1-1,5 timmar)
  - Kapitel 5: Multi-Agent AI-Lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Validering & Planering före distribution (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1-1,5 timmar)
  - Kapitel 8: Produktion & Företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigeringssystem**: Konsekventa navigeringshuvuden och sidfötter i all dokumentation
- **🎯 Progressionsspårning**: Kursavslutningschecklista och system för lärandeverifiering
- **🗺️ Vägledning för lärandebana**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förutsättningar tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärandeplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelkontext och vägledning för progression
- **Mallorganisation**: Exempel och mallar kartlagda till lämpliga lärandekapitel
- **Resursintegration**: Fusklappar, FAQ och studieguides kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labb kopplade till flera kapitelmål

#### Ändrat
- **Lärandeprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Omplacerad konfigurationsguide som Kapitel 3 för bättre lärandeflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela läranderesan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättrat
- **Användarupplevelse**: Tydliga navigeringsbrödsmulor och kapitelprogressionsindikatorer
- **Tillgänglighet**: Konsekventa navigeringsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Lärandeeffektivitet**: Minskad tid för att hitta relevant innehåll genom förbättrad organisation

#### Teknisk implementering
- **Navigeringshuvuden**: Standardiserad kapitelnavigation i över 40 dokumentationsfiler
- **Sidfotsnavigation**: Konsekvent vägledning för progression och kapitelavslutningsindikatorer
- **Korslänkning**: Omfattande internt länksystem som kopplar relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättring av studieguiden
- **📚 Omfattande lärandemål**: Omstrukturerad studieguiden för att anpassas till 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel inkluderar specifika lärandemål och praktiska övningar
- **📋 Progressionsspårning**: Veckovis lärandeschema med mätbara resultat och avslutningschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska övningar**: Praktiska aktiviteter med verkliga distributionsscenarier och felsökning
- **📊 Kompetensutveckling**: Tydlig utveckling från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och gemenskapsigenkänningssystem
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors lärandeplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar den multi-agent detaljhandelslösningen med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatt "Cora agent" med "Kundagent" i hela detaljhandelslösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterat all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Kundagent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsekvens**: Säkerställt att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM-mallpaket**: Uppdaterat detaljhandel-multiagent-arm-template med Kundagent-referenser
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med förbättrad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu KundAgent-namngivning
- **Miljövariabler**: Uppdaterat alla distributionsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrat
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Lärandematerial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallanvändbarhet**: Förenklad förståelse av agentfunktioner och distributionsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med KundAgent-referenser
- Ersatte CoraAgent-klassenamn med KundAgent i Python-exempel
- Modifierade ARM-mallkonfigurationer för att använda "kund"-agenttyp
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Förnyade alla distributionskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - Fokus på AI-utvecklare och integration med Azure AI Foundry
**Denna version omvandlar repositoriet till en omfattande AI-fokuserad läranderesurs med integration av Azure AI Foundry.**

#### Tillagt
- **🤖 AI-Driven Lärandebana**: Komplett omstrukturering med prioritering av AI-utvecklare och ingenjörer
- **Azure AI Foundry Integrationsguide**: Omfattande dokumentation för att ansluta AZD med Azure AI Foundry-tjänster
- **Distributionsmönster för AI-modeller**: Detaljerad guide som täcker modellval, konfiguration och strategier för produktionsdistribution
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-distribuerbara lösningar
- **Bästa praxis för AI-produktion**: Företagsklara mönster för skalning, övervakning och säkerhet för AI-arbetsbelastningar
- **Felsökningsguide för AI**: Omfattande felsökning för Azure OpenAI, Cognitive Services och AI-distributionsproblem
- **AI-mallgalleri**: Utvald samling av Azure AI Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska labb och referensmaterial

#### Förbättrat
- **README-struktur**: AI-utvecklarfokuserad med 45% gemenskapsintresse från Azure AI Foundry Discord
- **Lärandebanor**: Dedikerad AI-utvecklarresa tillsammans med traditionella banor för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Gemenskapsintegration**: Förbättrat Discord-gemenskapsstöd med AI-specifika kanaler och diskussioner

#### Säkerhet & Produktionsfokus
- **Mönster för hanterad identitet**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-region distribution**: Strategier för global distribution av AI-applikationer
- **Prestandaövervakning**: AI-specifika mätvärden och integration med Application Insights

#### Dokumentationskvalitet
- **Linjär kursstruktur**: Logisk progression från nybörjare till avancerade AI-distributionsmönster
- **Validerade URL:er**: Alla externa repository-länkar verifierade och tillgängliga
- **Komplett referens**: Alla interna dokumentationslänkar validerade och funktionella
- **Produktionsklar**: Företagsdistributionsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Omstrukturering av repository och professionell förbättring
**Denna version representerar en betydande översyn
- **Dokumentationsformat**: Standardiserade all dokumentation med en konsekvent lärande-fokuserad struktur
- **Navigationsflöde**: Implementerade logisk progression genom allt utbildningsmaterial
- **Innehållspresentation**: Tog bort dekorativa element till förmån för tydlig, professionell formatering
- **Länkstruktur**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrat
- **Tillgänglighet**: Tog bort beroendet av emojis för bättre kompatibilitet med skärmläsare
- **Professionellt utseende**: Ren, akademisk stil som passar för företagsutbildning
- **Lärandeupplevelse**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första utgåvan - Omfattande AZD-lärandearkiv

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett serie med introduktionsguider
  - Omfattande dokumentation för distribution och provisionering
  - Detaljerade felsökningsresurser och guider för debugging
  - Verktyg och procedurer för validering före distribution

- **Introduktionsmodul**
  - AZD-grunder: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställningar och autentisering
  - Första projektet: Steg-för-steg praktisk inlärning

- **Distributions- och provisioneringsmodul**
  - Distributionsguide: Komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som kod med Bicep
  - Bästa praxis för produktionsdistributioner
  - Arkitekturmönster för flera tjänster

- **Valideringsmodul före distribution**
  - Kapacitetsplanering: Validering av Azure-resurstillgänglighet
  - Val av SKU: Omfattande vägledning för tjänstenivåer
  - Kontroll före start: Automatiserade valideringsskript (PowerShell och Bash)
  - Verktyg för kostnadsberäkning och budgetplanering

- **Felsökningsmodul**
  - Vanliga problem: Vanligt förekommande problem och lösningar
  - Felsökningsguide: Systematiska felsökningsmetoder
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resurser och referenser**
  - Kommandosnabbguide: Snabbreferens för viktiga kommandon
  - Ordlista: Omfattande definitioner av terminologi och akronymer
  - FAQ: Detaljerade svar på vanliga frågor
  - Länkar till externa resurser och community-anslutningar

- **Exempel och mallar**
  - Exempel på enkel webbapplikation
  - Mall för distribution av statisk webbplats
  - Konfiguration av containerapplikation
  - Databasintegrationsmönster
  - Exempel på mikrotjänstarkitektur
  - Implementeringar av serverlösa funktioner

#### Funktioner
- **Stöd för flera plattformar**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera kompetensnivåer**: Innehåll utformat för studenter till professionella utvecklare
- **Praktisk fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus**: Säkerhetsbästa praxis integrerat genomgående
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva distributioner och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg-instruktioner**: Tydlig, handlingsbar vägledning
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Integration av bästa praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med de senaste Azure-tjänsterna och azd-funktionerna

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### Utökning av AI-plattform
- **Stöd för flera modeller**: Integrationsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **AI-agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-distributioner
- **Avancerade RAG-mönster**: Alternativ för vektordatabaser utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observabilitet**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Extension**: Integrerad AZD + AI Foundry-utvecklingsupplevelse
- **GitHub Copilot Integration**: AI-assisterad AZD-mallgenerering
- **Interaktiva handledningar**: Praktiska kodövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella inlärare med fokus på AI-distributioner

### Version 4.0.0 (Planerad)
#### Företagsmönster för AI
- **Styrningsramverk**: Styrning av AI-modeller, efterlevnad och granskningsspår
- **AI för flera kunder**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-distribution**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln-AI**: Mönster för multi-moln och hybriddistributioner för AI-arbetsbelastningar

#### Avancerade funktioner
- **Automatisering av AI-pipelines**: MLOps-integration med Azure Machine Learning-pipelines
- **Avancerad säkerhet**: Zero-trust-mönster, privata slutpunkter och avancerat hot-skydd
- **Prestandaoptimering**: Avancerade inställningar och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global distribution**: Mönster för innehållsleverans och edge-caching för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av nuvarande utgåva
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande integration av Azure AI Foundry (Slutfört)
- ✅ **Interaktiva handledningar**: Praktisk AI-workshop (Slutfört)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutfört)
- ✅ **Prestandaoptimering**: Inställningsstrategier för AI-arbetsbelastningar (Slutfört)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Vissa slutförda i nuvarande utgåva
- ✅ **Ytterligare exempel**: AI-fokuserade distributionsscenarier (Slutfört)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutfört)
- **Verktygsintegration**: Förbättrade guider för IDE och editorintegration
- ✅ **Utökad övervakning**: AI-specifika mönster för övervakning och varningar (Slutfört)

#### Fortfarande planerat för framtida utgåva
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community Dashboard**: Realtidsstatistik och spårning av community-bidrag

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta arkiv, se till att ändringsloggsposter inkluderar:

1. **Versionsnummer**: Enligt semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet YYYY-MM-DD
3. **Kategori**: Tillagt, Ändrat, Avvecklat, Borttaget, Fixat, Säkerhet
4. **Tydlig beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Tillagt
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller utbildningsresurser
- Ytterligare verktyg, skript eller hjälpmedel

#### Ändrat
- Modifieringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Avvecklat
- Funktioner eller tillvägagångssätt som fasas ut
- Dokumentationsavsnitt som planeras att tas bort
- Metoder som har bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller avvecklade tillvägagångssätt
- Redundant eller konsoliderat innehåll

#### Fixat
- Korrigeringar av fel i dokumentation eller kod
- Lösning av rapporterade problem eller fel
- Förbättringar av noggrannhet eller funktionalitet

#### Säkerhet
- Säkerhetsrelaterade förbättringar eller korrigeringar
- Uppdateringar av säkerhetsbästa praxis
- Lösning av säkerhetsproblem

### Riktlinjer för semantisk versionering

#### Huvudversion (X.0.0)
- Större förändringar som kräver användaråtgärder
- Betydande omstrukturering av innehåll eller organisation
- Förändringar som ändrar det grundläggande tillvägagångssättet eller metodiken

#### Mindre version (X.Y.0)
- Nya funktioner eller innehållstillägg
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Bugfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Community-feedback och förslag

Vi uppmuntrar aktivt community-feedback för att förbättra denna läranderesurs:

### Hur man ger feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Diskussioner på Discord**: Dela idéer och engagera dig med Azure AI Foundry-communityn
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen för diskussioner om AZD + AI
- **Community-forum**: Delta i bredare diskussioner för Azure-utvecklare

### Feedbackkategorier
- **Noggrannhet i AI-innehåll**: Korrigeringar av information om AI-tjänsteintegration och distribution
- **Lärandeupplevelse**: Förslag för förbättrat AI-utvecklarlärande
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika lärandebehov
- **Integration av AI-verktyg**: Förslag för bättre arbetsflödesintegration för AI-utveckling
- **Produktionsmönster för AI**: Förfrågningar om företagsmönster för AI-distribution

### Åtagande för svar
- **Svar på problem**: Inom 48 timmar för rapporterade problem
- **Förfrågningar om funktioner**: Utvärdering inom en vecka
- **Community-bidrag**: Granskning inom en vecka
- **Säkerhetsproblem**: Omedelbar prioritet med snabb respons

## Underhållsschema

### Regelbundna uppdateringar
- **Månadsgranskningar**: Noggrannhet i innehåll och validering av länkar
- **Kvartalsuppdateringar**: Större innehållstillägg och förbättringar
- **Halvårsgranskningar**: Omfattande omstrukturering och förbättring
- **Årliga utgåvor**: Större versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetssäkring
- **Automatiserad testning**: Regelbunden validering av kodexempel och länkar
- **Integration av community-feedback**: Regelbunden inkorporering av användarförslag
- **Teknikuppdateringar**: Anpassning till de senaste Azure-tjänsterna och azd-utgåvorna
- **Tillgänglighetsgranskningar**: Regelbunden översyn för inkluderande designprinciper

## Versionssupportpolicy

### Stöd för nuvarande version
- **Senaste huvudversionen**: Fullt stöd med regelbundna uppdateringar
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader
- **Legacy-versioner**: Endast community-stöd, inga officiella uppdateringar

### Migreringsvägledning
När huvudversioner släpps tillhandahåller vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsanteckningar**: Detaljer om större förändringar
- **Verktygsstöd**: Skript eller hjälpmedel för att underlätta migrering
- **Community-stöd**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående lektion**: [Studieguide](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Huvud README](README.md)

**Håll dig uppdaterad**: Följ detta arkiv för notiser om nya utgåvor och viktiga uppdateringar av utbildningsmaterialet.

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.