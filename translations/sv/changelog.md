<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "73f4ab6147d5fac5f8c5ad72742e8e1d",
  "translation_date": "2025-09-17T23:10:27+00:00",
  "source_file": "changelog.md",
  "language_code": "sv"
}
-->
# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande förändringar, uppdateringar och förbättringar i AZD För Nybörjare-repositoriet. Vi följer principerna för semantisk versionering och upprätthåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa upp buggfixar och korrigeringar för att säkerställa noggrannhet
- Spåra utvecklingen av utbildningsmaterial över tid

## Läranderesultat

Efter att ha granskat ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser för lärande
- Förstå vilka sektioner som har uppdaterats eller förbättrats
- Planera din lärandebana baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.2.0] - 2025-09-17

#### Större Omstrukturering av Navigering och Kapitelbaserat Lärandesystem
**Denna version introducerar en omfattande kapitelbaserad lärandestruktur med förbättrad navigering genom hela repositoriet.**

#### Tillagt
- **📚 Kapitelbaserat Lärandesystem**: Omstrukturerat hela kursen till 8 progressiva lärandekapitel
  - Kapitel 1: Grundläggande & Snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-Driven Utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som Kod & Utrullning (⭐⭐⭐ - 1-1,5 timmar)
  - Kapitel 5: Multi-Agent AI-Lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Validering & Planering före Utrullning (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1-1,5 timmar)
  - Kapitel 8: Produktion & Företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande Navigeringssystem**: Konsistenta navigeringshuvuden och sidfötter i all dokumentation
- **🎯 Framstegsspårning**: Kursavslutningschecklista och system för lärandeverifiering
- **🗺️ Vägledning för Lärandebanor**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskapskrav tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärandeplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelkontext och vägledning för progression
- **Mallorganisation**: Exempel och mallar kopplade till relevanta lärandekapitel
- **Resursintegration**: Fusklappar, FAQ och studievägledningar kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labbar kopplade till flera kapitelmål

#### Ändrat
- **Lärandeprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Omplacerat konfigurationsguiden till Kapitel 3 för bättre lärandeflöde
- **AI-Innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela läranderesan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättrad
- **Användarupplevelse**: Tydliga navigeringsbrödsmulor och kapitelprogressionsindikatorer
- **Tillgänglighet**: Konsistenta navigeringsmönster för enklare kursgenomgång
- **Professionell Presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Lärandeeffektivitet**: Minskad tid för att hitta relevant innehåll genom förbättrad organisation

#### Teknisk Implementering
- **Navigeringshuvuden**: Standardiserad kapitelbaserad navigering över 40+ dokumentationsfiler
- **Sidfotsnavigering**: Konsistent vägledning för progression och kapitelavslutningsindikatorer
- **Korslänkning**: Omfattande intern länkstruktur som kopplar relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt kopplade till lärandemål

#### Förbättring av Studievägledning
- **📚 Omfattande Lärandemål**: Omstrukturerad studievägledning för att matcha 8-kapitelssystemet
- **🎯 Kapitelbaserad Bedömning**: Varje kapitel inkluderar specifika lärandemål och praktiska övningar
- **📋 Framstegsspårning**: Veckovis lärandeplan med mätbara resultat och avslutningschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska Övningar**: Hands-on aktiviteter med verkliga utrullningsscenarier och felsökning
- **📊 Kompetensutveckling**: Tydlig progression från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och system för gemenskapsigenkänning
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors lärandeplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-Lösningar
**Denna version förbättrar den multi-agent lösningen för detaljhandel med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatt "Cora agent" med "Kundagent" i hela detaljhandelslösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterat all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Kundagent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsistens**: Säkerställt att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM Mallpaket**: Uppdaterat detaljhandel-multiagent-arm-template med Kundagent-referenser
- **Arkitekturdiagram**: Förnyade Mermaid-diagram med uppdaterad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu KundAgent-namngivning
- **Miljövariabler**: Uppdaterat alla utrullningsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrad
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Utbildningsmaterial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallanvändbarhet**: Förenklad förståelse av agentfunktioner och utrullningsmönster

#### Tekniska Detaljer
- Uppdaterade Mermaid-arkitekturdiagram med KundAgent-referenser
- Ersatte CoraAgent klassnamn med KundAgent i Python-exempel
- Modifierade ARM-mallkonfigurationer för att använda "kund"-agenttyp
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Förnyade alla utrullningskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora Förändringar - Fokus på AI-utvecklare och Integration med Azure AI Foundry
**Denna version omvandlar repositoriet till en omfattande AI-fokuserad läranderesurs med integration av Azure AI Foundry.**

#### Tillagt
- **🤖 AI-Driven Lärandebana**: Komplett omstrukturering med prioritering av AI-utvecklare och ingenjörer
- **Azure AI Foundry Integrationsguide**: Omfattande dokumentation för att ansluta AZD med Azure AI Foundry-tjänster
- **AI-Modell Utrullningsmönster**: Detaljerad guide som täcker modellval, konfiguration och produktionsutrullningsstrategier
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-utrullningsbara lösningar
- **Produktions-AI Bästa Praxis**: Företagsklara mönster för skalning, övervakning och säkerhet av AI-arbetsbelastningar
- **AI-Specifik Felsökningsguide**: Omfattande felsökning för Azure OpenAI, Cognitive Services och AI-utrullningsproblem
- **AI Mallgalleri**: Utvald samling av Azure AI Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska labbar och referensmaterial

#### Förbättrat
- **README-struktur**: AI-utvecklarfokuserad med 45% gemenskapsintresse från Azure AI Foundry Discord
- **Lärandebanor**: Dedikerad AI-utvecklarresa tillsammans med traditionella banor för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Gemenskapsintegration**: Förbättrat Discord-gemenskapssupport med AI-specifika kanaler och diskussioner

#### Säkerhet & Produktionsfokus
- **Mönster för Hanterade Identiteter**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Multi-Region Utrullning**: Strategier för global utrullning av AI-applikationer
- **Prestandaövervakning**: AI-specifika mätvärden och integration med Application Insights

#### Dokumentationskvalitet
- **Linjär Kursstruktur**: Logisk progression från nybörjare till avancerade AI-utrullningsmönster
- **Validerade URL:er**: Alla externa repositorielänkar verifierade och tillgängliga
- **Komplett Referens**: Alla interna dokumentationslänkar validerade och funktionella
- **Produktionsklar**: Företagsutrullningsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora Förändringar - Omstrukturering av Repositoriet och Professionell Förbättring
**Denna version representerar en betydande översyn av repositoriets struktur och innehållspresentation.**

#### Tillagt
- **Strukturerat Läranderamverk**: Alla dokumentationssidor inkluderar nu Introduktion, Lärandemål och Läranderesultat-sektioner
- **Navigeringssystem**: Lagt till Föregående/Nästa lektionslänkar i all dokumentation för guidad lärandeprogression
- **Studievägledning**: Omfattande study-guide.md med lärandemål, övningar och bedömningsmaterial
- **Professionell Presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och professionellt utseende
- **Förbättrad Innehållsstruktur**: Förbättrad organisation och flöde av lärandematerial

#### Ändrat
- **Dokumentationsformat**: Standardiserat all dokumentation med konsekvent lärandefokuserad struktur
- **Navigeringsflöde**: Implementerat logisk progression genom allt lärandematerial
- **Innehållspresentation**: Tog bort dekorativa element till förmån för tydlig, professionell formatering
- **Länkstruktur**: Uppdaterat alla interna länkar för att stödja nytt navigeringssystem

#### Förbättrad
- **Tillgänglighet**: Tog bort emoji-beroenden för bättre kompatibilitet med skärmläsare
- **Professionellt Utseende**: Ren, akademisk stilpresentation lämplig för företagsutbildning
- **Lärandeupplevelse**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första Utgåvan - Omfattande AZD Läranderepository

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett kom-igång-guide-serie
  - Omfattande dokumentation för utrullning och provisionering
  - Detaljerade felsökningsresurser och debugging-guider
  - Verktyg och procedurer för validering före utrullning

- **Kom-igång-modul**
  - AZD Grunder: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställning och autentisering
  - Första Projektet Tutorial: Steg-för-steg praktiskt lärande

- **Utrullning och Provisioneringsmodul**
  - Utrullningsguide: Komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som Kod med Bicep
  - Bästa praxis för produktionsutrullningar
  - Arkitekturmönster för flera tjänster

- **Valideringsmodul före Utrullning**
  - Kapacitetsplanering: Validering av Azure-resurstillgänglighet
  - SKU-Urval: Omfattande vägledning för tjänstenivåer
  - Förkontroller: Automatiserade valideringsskript (PowerShell och Bash)
  - Kostnadsberäkning och budgetplaneringsverktyg

- **Felsökningsmodul**
  - Vanliga Problem: Vanligt förekommande problem och lösningar
  - Debugging-guide: Systematiska felsökningsmetoder
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resurser och Referenser**
  - Kommandofusklapp: Snabbreferens för viktiga kommandon
  - Ordlista: Omfattande terminologi och akronymdefinitioner
  - FAQ: Detaljerade svar på vanliga frågor
  - Externa resurslänkar och gemenskapsanslutningar

- **Exempel och Mallar**
  - Exempel på enkel webbapplikation
  - Mall för statisk webbplatsutrullning
  - Konfiguration för containerapplikation
  - Databasintegrationsmönster
  - Arkitekturexempel för mikrotjänster
  - Implementeringar av serverlösa funktioner

#### Funktioner
- **Stöd för Flera Plattformar**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera Kompetensnivåer**: Innehåll designat för studenter till professionella utvecklare
- **Praktisk Fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande Täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus**: Säkerhetsbästa praxis integrerat genom hela
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva utrullningar och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade Kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg Instruktioner**: Tydlig, handlingsbar vägledning
- **Omfattande Felhantering**: Felsökning för vanliga problem
- **Integration av Bästa Praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med de senaste Azure-tjänsterna och azd-funktionerna

## Planerade Framtida Förbättringar

### Version 3.1.0 (Planerad)
#### Expansion av AI-Plattform
- **Stöd för Flera Modeller**: Integrationsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **AI-Agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-utrullningar
- **Avancerade RAG-Mönster**: Alternativ för vektordatabaser utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-Observabilitet**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Extension**: Integrerad AZD + AI Foundry utvecklingsupplevelse
- **GitHub Copilot Integration**: AI-assisterad AZD mallgenerering
- **Interaktiva Tutorials**: Praktiska kodöv
- **AI-pipelineautomatisering**: MLOps-integration med Azure Machine Learning-pipelines  
- **Avancerad säkerhet**: Zero-trust-mönster, privata slutpunkter och avancerat hot-skydd  
- **Prestandaoptimering**: Avancerade strategier för justering och skalning av AI-applikationer med hög genomströmning  
- **Global distribution**: Mönster för innehållsleverans och edge-caching för AI-applikationer  

### Version 3.0.0 (Planerad) - Ersatt av nuvarande version  
#### Föreslagna tillägg - Nu implementerade i v3.0.0  
- ✅ **AI-fokuserat innehåll**: Omfattande integration med Azure AI Foundry (Slutförd)  
- ✅ **Interaktiva handledningar**: Praktiska AI-workshop-labb (Slutförd)  
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutförd)  
- ✅ **Prestandaoptimering**: Strategier för justering av AI-arbetsbelastningar (Slutförd)  

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0  
#### Mindre förbättringar - Några slutförda i nuvarande version  
- ✅ **Ytterligare exempel**: AI-fokuserade distributionsscenarier (Slutförd)  
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutförd)  
- **Verktygsintegration**: Förbättrade guider för IDE- och editorintegration  
- ✅ **Utökad övervakning**: AI-specifika mönster för övervakning och larm (Slutförd)  

#### Fortfarande planerade för framtida versioner  
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande  
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket  
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden  
- **Community-dashboard**: Realtidsstatistik och spårning av bidrag från communityn  

## Bidra till ändringsloggen  

### Rapportera ändringar  
När du bidrar till detta repository, se till att ändringsloggsposter inkluderar:  

1. **Versionsnummer**: Enligt semantisk versionering (major.minor.patch)  
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet ÅÅÅÅ-MM-DD  
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
- Funktioner eller metoder som fasas ut  
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
- Uppdateringar av bästa praxis för säkerhet  
- Lösning av säkerhetsproblem  

### Riktlinjer för semantisk versionering  

#### Huvudversion (X.0.0)  
- Större förändringar som kräver användaråtgärder  
- Betydande omstrukturering av innehåll eller organisation  
- Ändringar som påverkar den grundläggande metodiken  

#### Mindre version (X.Y.0)  
- Nya funktioner eller tillägg av innehåll  
- Förbättringar som bibehåller bakåtkompatibilitet  
- Ytterligare exempel, verktyg eller resurser  

#### Patchversion (X.Y.Z)  
- Bugfixar och korrigeringar  
- Mindre förbättringar av befintligt innehåll  
- Förtydliganden och små justeringar  

## Community-feedback och förslag  

Vi uppmuntrar aktivt community-feedback för att förbättra denna lärresurs:  

### Hur man ger feedback  
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika frågor välkomnas)  
- **Discord-diskussioner**: Dela idéer och engagera dig med Azure AI Foundry-communityn  
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider  
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen för diskussioner om AZD + AI  
- **Community-forum**: Delta i bredare diskussioner för Azure-utvecklare  

### Feedbackkategorier  
- **Noggrannhet i AI-innehåll**: Korrigeringar av information om AI-tjänsteintegration och distribution  
- **Lärandeupplevelse**: Förslag för förbättrad AI-utvecklarlärandeprocess  
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel  
- **Tillgänglighet**: Förbättringar för olika lärandebehov  
- **Integration av AI-verktyg**: Förslag för bättre arbetsflödesintegration för AI-utveckling  
- **Produktionsmönster för AI**: Förfrågningar om företagsmönster för AI-distribution  

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
- **Årliga utgåvor**: Större versioner med betydande förbättringar  

### Övervakning och kvalitetssäkring  
- **Automatiserad testning**: Regelbunden validering av kodexempel och länkar  
- **Integration av community-feedback**: Regelbunden inkludering av användarförslag  
- **Teknikuppdateringar**: Anpassning till de senaste Azure-tjänsterna och AZD-utgåvorna  
- **Tillgänglighetsgranskningar**: Regelbunden översyn för inkluderande designprinciper  

## Versionssupportpolicy  

### Support för nuvarande version  
- **Senaste huvudversionen**: Full support med regelbundna uppdateringar  
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader  
- **Legacy-versioner**: Endast community-support, inga officiella uppdateringar  

### Migreringsvägledning  
När huvudversioner släpps tillhandahåller vi:  
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång  
- **Kompatibilitetsanteckningar**: Detaljer om brytande förändringar  
- **Verktygsstöd**: Skript eller hjälpmedel för att underlätta migrering  
- **Community-support**: Dedikerade forum för migreringsfrågor  

---

**Navigering**  
- **Föregående lektion**: [Studieguide](resources/study-guide.md)  
- **Nästa lektion**: Återgå till [Huvud-README](README.md)  

**Håll dig uppdaterad**: Följ detta repository för aviseringar om nya utgåvor och viktiga uppdateringar av lärmaterialet.  

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiska översättningar kan innehålla fel eller inexaktheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.