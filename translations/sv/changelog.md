<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7651a7fb2b5e367812bf01aa209a3612",
  "translation_date": "2025-09-24T21:20:10+00:00",
  "source_file": "changelog.md",
  "language_code": "sv"
}
-->
# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande förändringar, uppdateringar och förbättringar i AZD För Nybörjare-repositoriet. Vi följer principerna för semantisk versionering och upprätthåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa upp buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av utbildningsmaterial över tid

## Läranderesultat

Efter att ha granskat ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser för lärande
- Förstå vilka sektioner som har uppdaterats eller förbättrats
- Planera din lärandebana baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.3.0] - 2025-09-24

#### Förbättrade Workshopmaterial och Interaktiv Lärandeupplevelse
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärandebanor.**

#### Tillagt
- **🎥 Interaktiv Workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs förhandsgranskningsfunktion
- **📝 Strukturerade Workshopinstruktioner**: 7-stegs guidad lärandebana från upptäckt till anpassning
  - 0-Introduktion: Workshopöversikt och installation
  - 1-Välj-AI-Mall: Process för att upptäcka och välja mall
  - 2-Validera-AI-Mall: Implementerings- och valideringsprocedurer
  - 3-Analysera-AI-Mall: Förståelse för mallens arkitektur
  - 4-Konfigurera-AI-Mall: Konfiguration och anpassning
  - 5-Anpassa-AI-Mall: Avancerade modifieringar och iterationer
  - 6-Rensa-Infrastruktur: Städning och resursförvaltning
  - 7-Sammanfattning: Summering och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad lärandeupplevelse
- **🎯 Praktisk Lärandebana**: 3-stegs metodik (Upptäckt → Implementering → Anpassning)
- **📱 GitHub Codespaces Integration**: Smidig inställning av utvecklingsmiljö

#### Förbättrat
- **AI Workshop Lab**: Utökad med en omfattande 2-3 timmars strukturerad lärandeupplevelse
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Lärandeprogression**: Tydlig steg-för-steg vägledning från mallval till produktionsimplementering
- **Utvecklarupplevelse**: Integrerade verktyg för strömlinjeformade arbetsflöden

#### Förbättringar
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sökfunktion, kopieringsfunktion och temaväxling
- **Självstyrt Lärande**: Flexibel workshopstruktur som passar olika lärandehastigheter
- **Praktisk Tillämpning**: Scenarier för implementering av AI-mallar i verkliga situationer
- **Community Integration**: Discord-integration för workshopstöd och samarbete

#### Workshopfunktioner
- **Inbyggd Sökfunktion**: Snabb sökning efter nyckelord och lektioner
- **Kopiera Kodblock**: Hover-funktion för att kopiera alla kodexempel
- **Temaväxling**: Stöd för mörkt/ljust läge för olika preferenser
- **Visuella Tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt åtkomst till Discord för communitystöd

### [v3.2.0] - 2025-09-17

#### Omfattande Navigationsomstrukturering och Kapitelbaserat Lärandesystem
**Denna version introducerar ett kapitelbaserat lärandesystem med förbättrad navigering genom hela repositoriet.**

#### Tillagt
- **📚 Kapitelbaserat Lärandesystem**: Omstrukturerade hela kursen till 8 progressiva lärandekapitel
  - Kapitel 1: Grundläggande & Snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-Driven Utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som Kod & Implementering (⭐⭐⭐ - 1-1,5 timmar)
  - Kapitel 5: Multi-Agent AI-Lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Validering & Planering före Implementering (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1-1,5 timmar)
  - Kapitel 8: Produktions- & Företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande Navigationssystem**: Konsistenta navigationshuvuden och sidfötter i all dokumentation
- **🎯 Progressionsspårning**: Kursavslutningschecklista och verifieringssystem för lärande
- **🗺️ Vägledning för Lärandebanor**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskapskrav tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärandeplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar kapitelkontext och vägledning för progression
- **Mallorganisation**: Exempel och mallar kopplade till relevanta lärandekapitel
- **Resursintegration**: Fusklappar, FAQ och studiematerial kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labbar kopplade till flera kapitelmål

#### Ändrat
- **Lärandeprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Omplacerat konfigurationsguiden som Kapitel 3 för bättre lärandeflöde
- **AI-Innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela läranderesan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättringar
- **Användarupplevelse**: Tydliga navigationsbrödsmulor och kapitelprogressionsindikatorer
- **Tillgänglighet**: Konsistenta navigationsmönster för enklare kursgenomgång
- **Professionell Presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Lärandeeffektivitet**: Minskad tid för att hitta relevant innehåll genom förbättrad organisation

#### Teknisk Implementering
- **Navigationshuvuden**: Standardiserad kapitelbaserad navigering över 40+ dokumentationsfiler
- **Sidfotsnavigering**: Konsistent vägledning för progression och kapitelavslutningsindikatorer
- **Korslänkning**: Omfattande intern länkstruktur som kopplar relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt associerade med lärandemål

#### Förbättring av Studiematerial
- **📚 Omfattande Lärandemål**: Omstrukturerad studievägledning för att matcha det 8-kapitelbaserade systemet
- **🎯 Kapitelbaserad Bedömning**: Varje kapitel inkluderar specifika lärandemål och praktiska övningar
- **📋 Progressionsspårning**: Veckovis lärandeplan med mätbara resultat och avslutningschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska Övningar**: Hands-on aktiviteter med verkliga implementeringsscenarier och felsökning
- **📊 Kompetensutveckling**: Tydlig progression från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och community-erkännandesystem
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors lärandeplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-Lösningar
**Denna version förbättrar den multi-agent lösningen för detaljhandel med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatt "Cora agent" med "Kundagent" i hela multi-agent lösningen för detaljhandel för tydligare förståelse
- **Agentarkitektur**: Uppdaterat all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Kundagent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsistens**: Säkerställt att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM Mallpaket**: Uppdaterat retail-multiagent-arm-template med Kundagent-referenser
- **Arkitekturdiagram**: Förnyade Mermaid-diagram med uppdaterad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu KundAgent-namngivning
- **Miljövariabler**: Uppdaterat alla implementeringsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättringar
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Lärandematerial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallanvändbarhet**: Förenklad förståelse av agentfunktioner och implementeringsmönster

#### Tekniska Detaljer
- Uppdaterade Mermaid-arkitekturdiagram med KundAgent-referenser
- Ersatte CoraAgent klassnamn med KundAgent i Python-exempel
- Modifierade ARM-mallkonfigurationer för att använda "kund"-agenttyp
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Förnyade alla implementeringskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora Förändringar - Fokus på AI-utvecklare och Integration med Azure AI Foundry
**Denna version omvandlar repositoriet till en omfattande AI-fokuserad läranderesurs med integration med Azure AI Foundry.**

#### Tillagt
- **🤖 AI-Driven Lärandebana**: Komplett omstrukturering med prioritering av AI-utvecklare och ingenjörer
- **Azure AI Foundry Integrationsguide**: Omfattande dokumentation för att ansluta AZD med Azure AI Foundry-tjänster
- **Implementeringsmönster för AI-modeller**: Detaljerad guide som täcker modellval, konfiguration och produktionsimplementeringsstrategier
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-implementerbara lösningar
- **Bästa Praxis för AI i Produktion**: Företagsklara mönster för skalning, övervakning och säkerhet av AI-arbetsbelastningar
- **Felsökningsguide för AI**: Omfattande felsökning för Azure OpenAI, Cognitive Services och AI-implementeringsproblem
- **AI Mallgalleri**: Utvald samling av Azure AI Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska labbar och referensmaterial

#### Förbättrat
- **README-struktur**: AI-utvecklarfokuserad med 45% communityintresse från Azure AI Foundry Discord
- **Lärandebanor**: Dedikerad AI-utvecklarresa tillsammans med traditionella banor för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Community Integration**: Förbättrat Discord-communitystöd med AI-specifika kanaler och diskussioner

#### Säkerhet & Produktionsfokus
- **Mönster för Hanterad Identitet**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-Region Implementering**: Strategier för global implementering av AI-applikationer
- **Prestandaövervakning**: AI-specifika mätvärden och integration med Application Insights

#### Dokumentationskvalitet
- **Linjär Kursstruktur**: Logisk progression från nybörjare till avancerade AI-implementeringsmönster
- **Validerade URL:er**: Alla externa repositorielänkar verifierade och tillgängliga
- **Komplett Referens**: Alla interna dokumentationslänkar validerade och funktionella
- **Produktionsklar**: Företagsimplementeringsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora Förändringar - Omstrukturering av Repositoriet och Professionell Förbättring
**Denna version representerar en betydande översyn av repositoriets struktur och innehållspresentation.**

#### Tillagt
- **Strukturerat Läranderamverk**: Alla dokumentationssidor inkluderar nu Introduktion, Lärandemål och Läranderesultat-sektioner
- **Navigationssystem**: Lagt till Föregående/Nästa lektionslänkar i all dokumentation för guidad lärandeprogression
- **Studiematerial**: Omfattande study-guide.md med lärandemål, praktiska övningar och bedömningsmaterial
- **Professionell Presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och professionellt utseende
- **Förbättrad Innehållsstruktur**: Förbättrad organisation och flöde av lärandematerial

#### Ändrat
- **Dokumentationsformat**: Standardiserat all dokumentation med konsekvent lärandefokuserad struktur
- **Navigationsflöde**: Implementerat logisk progression genom allt lärandematerial
- **Innehållspresentation**: Tog bort dekorativa element till förmån för tydlig, professionell formatering
- **Länkstruktur**: Uppdaterat alla interna länkar för att stödja det nya navigationssystemet

#### Förbättringar
- **Tillgänglighet**: Tog bort beroenden av emojis för bättre kompatibilitet med skärmläsare
- **Professionellt Utseende**: Rent, akademiskt stilutseende lämpligt för företagsutbildning
- **Lärandeupplevelse**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första Utgåvan - Omfattande AZD Läranderepository

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett kom-igång-guide-serie
  - Omfattande dokumentation för implementering och provisionering
  - Detaljerade felsökningsresurser och felsökningsguider
  - Verktyg och procedurer för validering före implementering

- **Kom-igång-modul**
  - AZD Grunder: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställning och autentisering
  - Första Projekt Tutorial: Steg-för-steg praktiskt lärande

- **Implementerings- och Provisioneringsmodul**
  - Implementeringsguide: Komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som Kod med Bicep
  - Bästa praxis för produktionsimplementeringar
  - Mönster för multi-tjänstarkitektur

- **Valideringsmodul före Implementering**
  - Kapacitetsplanering: Validering av Azure-resurstillgänglighet
  - SKU-Urval: Omfattande vägledning för tjänstenivåer
  - Förkontroller: Automatiserade valideringsskript (PowerShell och Bash)
  - Verktyg för kostnadsberäkning och budgetplanering

- **Felsökningsmodul**
  - Vanliga Problem: Vanligt förekommande problem och lösningar
 
  - Exempel på mikrotjänstarkitektur
  - Implementeringar av serverlösa funktioner

#### Funktioner
- **Stöd för flera plattformar**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Olika kunskapsnivåer**: Innehåll utformat för studenter och professionella utvecklare
- **Praktisk fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus**: Säkerhetsbästa praxis integrerat genom hela materialet
- **Kostnadsoptimering**: Råd för kostnadseffektiva driftsättningar och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg-instruktioner**: Tydliga och handlingsbara riktlinjer
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Integrering av bästa praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med de senaste Azure-tjänsterna och azd-funktionerna

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### Utökning av AI-plattform
- **Stöd för flera modeller**: Integrationsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **AI-agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-driftsättningar
- **Avancerade RAG-mönster**: Alternativ för vektordatabaser utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observabilitet**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Extension**: Integrerad AZD + AI Foundry-utvecklingsupplevelse
- **GitHub Copilot Integration**: AI-assisterad generering av AZD-mallar
- **Interaktiva handledningar**: Praktiska kodövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella inlärare med fokus på AI-driftsättningar

### Version 4.0.0 (Planerad)
#### Företagsmönster för AI
- **Styrningsramverk**: Styrning av AI-modeller, efterlevnad och revisionsspår
- **AI för flera kunder**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-driftsättning**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln-AI**: Mönster för driftsättning av AI-arbetsbelastningar i flera moln och hybridmiljöer

#### Avancerade funktioner
- **Automatisering av AI-pipelines**: MLOps-integration med Azure Machine Learning-pipelines
- **Avancerad säkerhet**: Zero-trust-mönster, privata slutpunkter och avancerat hotsskydd
- **Prestandaoptimering**: Avancerade inställningar och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global distribution**: Mönster för innehållsleverans och edge-caching för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av nuvarande version
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande integration med Azure AI Foundry (Slutfört)
- ✅ **Interaktiva handledningar**: Praktiska AI-workshop-labbar (Slutfört)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutfört)
- ✅ **Prestandaoptimering**: Inställningsstrategier för AI-arbetsbelastningar (Slutfört)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Vissa slutförda i nuvarande version
- ✅ **Ytterligare exempel**: AI-fokuserade driftsättningsscenarier (Slutfört)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutfört)
- **Verktygsintegration**: Förbättrade guider för IDE- och editorintegration
- ✅ **Utökad övervakning**: AI-specifika mönster för övervakning och varningar (Slutfört)

#### Fortfarande planerade för framtida versioner
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community Dashboard**: Realtidsstatistik och spårning av bidrag från communityn

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta repository, se till att ändringsloggar innehåller:

1. **Versionsnummer**: Enligt semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet YYYY-MM-DD
3. **Kategori**: Lagt till, Ändrat, Avvecklat, Borttaget, Fixat, Säkerhet
4. **Tydlig beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Lagt till
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller hjälpmedel

#### Ändrat
- Modifieringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Avvecklat
- Funktioner eller metoder som håller på att fasas ut
- Dokumentationsavsnitt som planeras tas bort
- Metoder som har bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller avvecklade metoder
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
- Förändringar som ändrar den grundläggande metodiken

#### Mindre version (X.Y.0)
- Nya funktioner eller tillägg av innehåll
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Bugfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Community-feedback och förslag

Vi uppmuntrar aktivt community-feedback för att förbättra denna lärresurs:

### Hur man ger feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika frågor välkomnas)
- **Discord-diskussioner**: Dela idéer och engagera dig med Azure AI Foundry-communityn
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community-forum**: Delta i bredare diskussioner för Azure-utvecklare

### Feedbackkategorier
- **Noggrannhet i AI-innehåll**: Korrigeringar av information om AI-tjänsteintegration och driftsättning
- **Lärandeupplevelse**: Förslag för förbättrad AI-utvecklarlärande
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika lärbehov
- **Integration av AI-verktyg**: Förslag för bättre arbetsflödesintegration för AI-utveckling
- **Produktionsmönster för AI**: Förfrågningar om företagsmönster för AI-driftsättning

### Åtagande för svar
- **Svar på problem**: Inom 48 timmar för rapporterade problem
- **Funktionsförfrågningar**: Utvärdering inom en vecka
- **Community-bidrag**: Granskning inom en vecka
- **Säkerhetsproblem**: Omedelbar prioritet med snabb respons

## Underhållsschema

### Regelbundna uppdateringar
- **Månadsgranskningar**: Kontroll av innehållsnoggrannhet och länkar
- **Kvartalsuppdateringar**: Större tillägg och förbättringar av innehåll
- **Halvårsgranskningar**: Omfattande omstrukturering och förbättringar
- **Årliga utgåvor**: Större versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetssäkring
- **Automatiserad testning**: Regelbunden validering av kodexempel och länkar
- **Integration av community-feedback**: Regelbunden inkorporering av användarförslag
- **Teknikuppdateringar**: Anpassning till de senaste Azure-tjänsterna och azd-versionerna
- **Tillgänglighetsgranskningar**: Regelbunden översyn för inkluderande designprinciper

## Versionssupportpolicy

### Support för nuvarande version
- **Senaste huvudversionen**: Fullt stöd med regelbundna uppdateringar
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader
- **Legacy-versioner**: Endast community-stöd, inga officiella uppdateringar

### Migreringsvägledning
När huvudversioner släpps tillhandahåller vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsanteckningar**: Detaljer om brytande förändringar
- **Verktygsstöd**: Skript eller hjälpmedel för att underlätta migrering
- **Community-stöd**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående lektion**: [Studieguide](resources/study-guide.md)
- **Nästa lektion**: Återgå till [Huvud-README](README.md)

**Håll dig uppdaterad**: Följ detta repository för notiser om nya versioner och viktiga uppdateringar av lärmaterialet.

---

