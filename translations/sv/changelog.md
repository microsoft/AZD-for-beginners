<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9736db53ea878e07688670ebcc8906bc",
  "translation_date": "2025-09-12T21:00:48+00:00",
  "source_file": "changelog.md",
  "language_code": "sv"
}
-->
# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande förändringar, uppdateringar och förbättringar i AZD För Nybörjare-repositoriet. Vi följer principerna för semantisk versionering och upprätthåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versionerna.

## Lärandemål

Genom att granska denna ändringslogg kommer du:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa upp buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av lärmaterialet över tid

## Läranderesultat

Efter att ha granskat ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din lärandeväg baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.0.0] - 2025-09-12

#### Stora förändringar - Fokus på AI-utvecklare och integration med Azure AI Foundry
**Denna version omvandlar repositoriet till en omfattande AI-fokuserad lärresurs med integration av Azure AI Foundry.**

#### Tillagt
- **🤖 AI-först lärandebana**: Komplett omstrukturering med prioritet på AI-utvecklare och ingenjörer
- **Guide för Azure AI Foundry-integration**: Omfattande dokumentation för att ansluta AZD med Azure AI Foundry-tjänster
- **Mönster för AI-modellimplementering**: Detaljerad guide om modellval, konfiguration och produktionsimplementeringsstrategier
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-lösningar
- **Bästa praxis för AI i produktion**: Företagsklara mönster för skalning, övervakning och säkerhet av AI-arbetsbelastningar
- **Felsökningsguide för AI**: Omfattande felsökning för Azure OpenAI, Cognitive Services och AI-implementeringsproblem
- **AI-mallgalleri**: Utvald samling av Azure AI Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska labbar och referensmaterial

#### Förbättrat
- **README-struktur**: Fokus på AI-utvecklare med 45% data om communityintresse från Azure AI Foundry Discord
- **Lärandebanor**: Dedikerad AI-utvecklarresa tillsammans med traditionella banor för studenter och DevOps-ingenjörer
- **Rekommenderade mallar**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Communityintegration**: Förbättrat stöd för Discord-communityn med AI-specifika kanaler och diskussioner

#### Säkerhet och produktionsfokus
- **Mönster för hanterad identitet**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Kostnadsoptimering**: Spårning av tokenanvändning och budgetkontroller för AI-arbetsbelastningar
- **Implementering i flera regioner**: Strategier för global implementering av AI-applikationer
- **Prestandaövervakning**: AI-specifika mätvärden och integration med Application Insights

#### Dokumentationskvalitet
- **Linjär kursstruktur**: Logisk progression från nybörjare till avancerade AI-implementeringsmönster
- **Validerade URL:er**: Alla externa länkar till repositorier verifierade och tillgängliga
- **Komplett referens**: Alla interna dokumentationslänkar validerade och funktionella
- **Redo för produktion**: Företagsimplementeringsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora förändringar - Omstrukturering av repositoriet och professionell förbättring
**Denna version representerar en betydande översyn av repositoriets struktur och innehållspresentation.**

#### Tillagt
- **Strukturerat läranderamverk**: Alla dokumentationssidor innehåller nu avsnitten Introduktion, Lärandemål och Läranderesultat
- **Navigationssystem**: Lagt till länkar till föregående/nästa lektion i hela dokumentationen för vägledd lärandeprogression
- **Studieguide**: Omfattande study-guide.md med lärandemål, övningar och bedömningsmaterial
- **Professionell presentation**: Alla emoji-ikoner borttagna för förbättrad tillgänglighet och professionellt utseende
- **Förbättrad innehållsstruktur**: Förbättrad organisation och flöde av lärmaterial

#### Ändrat
- **Dokumentationsformat**: Standardiserat all dokumentation med konsekvent lärandefokuserad struktur
- **Navigationsflöde**: Implementerat logisk progression genom allt lärmaterial
- **Innehållspresentation**: Dekorativa element borttagna till förmån för tydlig, professionell formatering
- **Länkstruktur**: Uppdaterat alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrat
- **Tillgänglighet**: Borttagna emoji-beroenden för bättre kompatibilitet med skärmläsare
- **Professionellt utseende**: Ren, akademisk stil som passar för företagslärande
- **Lärandeupplevelse**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första utgåvan - Omfattande AZD-lärresurs

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett serie med kom-igång-guider
  - Omfattande dokumentation för implementering och provisionering
  - Detaljerade felsökningsresurser och felsökningsguider
  - Verktyg och procedurer för validering före implementering

- **Kom-igång-modul**
  - AZD-grunder: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställningar och autentisering
  - Första projektet: Steg-för-steg praktisk inlärning

- **Implementerings- och provisioneringsmodul**
  - Implementeringsguide: Komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som kod med Bicep
  - Bästa praxis för produktionsimplementeringar
  - Mönster för arkitektur med flera tjänster

- **Valideringsmodul före implementering**
  - Kapacitetsplanering: Validering av tillgängliga Azure-resurser
  - Val av SKU: Omfattande vägledning för tjänstenivåer
  - Kontroll före flygning: Automatiserade valideringsskript (PowerShell och Bash)
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
  - Mall för implementering av statisk webbplats
  - Konfiguration av containerapplikation
  - Mönster för databasintegration
  - Exempel på mikrotjänstarkitektur
  - Implementeringar av serverlösa funktioner

#### Funktioner
- **Stöd för flera plattformar**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera färdighetsnivåer**: Innehåll designat för studenter till professionella utvecklare
- **Praktisk fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus**: Säkerhetsbästa praxis integrerat genomgående
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva implementeringar och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg-instruktioner**: Tydlig, handlingsbar vägledning
- **Omfattande felhantering**: Felsökning för vanliga problem
- **Integration av bästa praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med de senaste Azure-tjänsterna och azd-funktionerna

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### Utvidgning av AI-plattform
- **Stöd för flera modeller**: Integrationsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **Ramverk för AI-agenter**: Mallar för LangChain, Semantic Kernel och AutoGen-implementeringar
- **Avancerade RAG-mönster**: Alternativ för vektordatabaser utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observabilitet**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code-tillägg**: Integrerad AZD + AI Foundry-utvecklingsupplevelse
- **GitHub Copilot-integration**: AI-assisterad generering av AZD-mallar
- **Interaktiva handledningar**: Praktiska kodövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella inlärare med fokus på AI-implementeringar

### Version 4.0.0 (Planerad)
#### Företagsmönster för AI
- **Styrningsramverk**: Styrning av AI-modeller, efterlevnad och granskningsspår
- **AI för flera kunder**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **AI-implementering vid kanten**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln-AI**: Mönster för implementering av AI-arbetsbelastningar i flera moln och hybridmiljöer

#### Avancerade funktioner
- **Automatisering av AI-pipelines**: MLOps-integration med Azure Machine Learning-pipelines
- **Avancerad säkerhet**: Zero-trust-mönster, privata slutpunkter och avancerat hot-skydd
- **Prestandaoptimering**: Avancerad justering och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global distribution**: Mönster för innehållsleverans och caching vid kanten för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av nuvarande utgåva
#### Föreslagna tillägg - Nu implementerade i v3.0.0
- ✅ **AI-fokuserat innehåll**: Omfattande integration av Azure AI Foundry (Slutfört)
- ✅ **Interaktiva handledningar**: Praktisk AI-workshop-labb (Slutfört)
- ✅ **Avancerad säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutfört)
- ✅ **Prestandaoptimering**: Justeringsstrategier för AI-arbetsbelastningar (Slutfört)

### Version 2.1.0 (Planerad) - Delvis implementerad i v3.0.0
#### Mindre förbättringar - Några slutförda i nuvarande utgåva
- ✅ **Ytterligare exempel**: AI-fokuserade implementeringsscenarier (Slutfört)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutfört)
- **Verktygsintegration**: Förbättrade guider för IDE och editorintegration
- ✅ **Utökad övervakning**: AI-specifika mönster för övervakning och varningar (Slutfört)

#### Fortfarande planerade för framtida utgåva
- **Mobilvänlig dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Community-dashboard**: Realtidsstatistik för communityn och spårning av bidrag

## Bidra till ändringsloggen

### Rapportera förändringar
När du bidrar till detta repositorium, se till att ändringsloggsposter inkluderar:

1. **Versionsnummer**: Enligt semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Tillagt, Ändrat, Avvecklat, Borttaget, Fixat, Säkerhet
4. **Tydlig beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur förändringar påverkar befintliga användare

### Kategorier för förändringar

#### Tillagt
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
- Uppdateringar av säkerhetsbästa praxis
- Lösning av säkerhetsproblem

### Riktlinjer för semantisk versionering

#### Huvudversion (X.0.0)
- Förändringar som kräver användaråtgärder
- Betydande omstrukturering av innehåll eller organisation
- Förändringar som ändrar grundläggande tillvägagångssätt eller metodik

#### Mindre version (X.Y.0)
- Nya funktioner eller tillägg av innehåll
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Community-feedback och förslag

Vi uppmuntrar aktivt community-feedback för att förbättra denna lärresurs:

### Hur man ger feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Discord-diskussioner**: Dela idéer och engagera dig med Azure AI Foundry-communityn
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen för diskussioner om AZD + AI
- **Community-forum**: Delta i bredare diskussioner för Azure-utvecklare

### Kategorier för feedback
- **Noggrannhet i AI-innehåll**: Korrigeringar av information om AI-tjänstintegration och implementering
- **Lärandeupplevelse**: Förslag för förbättrad lärandeflöde för AI-utvecklare
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika lärandebehov
- **Integration av AI-verktyg**: Förslag för bättre arbetsflöde för AI-utveckling
- **Mönster för AI i produktion**: Förfrågningar om företagsmönster för AI-implementering

### Åtagande om svar
- **Svar på problem**: Inom 48 timmar för rapporterade problem
- **Förfrågningar om funktioner**: Utvärdering inom en vecka
- **Community-bidrag**: Granskning inom en vecka
- **Säkerhetsproblem**: Omedelbar prioritet
- **Senaste huvudversionen**: Fullt stöd med regelbundna uppdateringar  
- **Föregående huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader  
- **Äldre versioner**: Endast community-stöd, inga officiella uppdateringar  

### Vägledning för migrering  
När huvudversioner släpps erbjuder vi:  
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång  
- **Kompatibilitetsanteckningar**: Information om förändringar som bryter kompatibilitet  
- **Verktygsstöd**: Skript eller verktyg för att underlätta migrering  
- **Community-stöd**: Dedikerade forum för frågor kring migrering  

---

**Navigering**  
- **Föregående lektion**: [Studieguide](resources/study-guide.md)  
- **Nästa lektion**: Återgå till [Huvud-README](README.md)  

**Håll dig uppdaterad**: Följ detta repository för att få notiser om nya versioner och viktiga uppdateringar av utbildningsmaterialet.  

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.