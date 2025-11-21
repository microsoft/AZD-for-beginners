<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-21T08:08:57+00:00",
  "source_file": "changelog.md",
  "language_code": "sv"
}
-->
# Ändringslogg - AZD För Nybörjare

## Introduktion

Denna ändringslogg dokumenterar alla betydande förändringar, uppdateringar och förbättringar i AZD För Nybörjare-repositoryn. Vi följer principerna för semantisk versionering och upprätthåller denna logg för att hjälpa användare att förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du:
- Hålla dig informerad om nya funktioner och tillägg av innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Följa upp buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av lärandematerialet över tid

## Läranderesultat

Efter att ha granskat ändringsloggens poster kommer du att kunna:
- Identifiera nytt innehåll och resurser tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din lärandebana baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.8.0] - 2025-11-19

#### Avancerad Dokumentation: Övervakning, Säkerhet och Multi-Agent Mönster
**Denna version lägger till omfattande A-klass lektioner om integration med Application Insights, autentiseringsmönster och samordning av flera agenter för produktionsimplementeringar.**

#### Tillagt
- **📊 Lektion om Application Insights Integration**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad implementering med automatisk provisionering
  - Kompletta Bicep-mallar för Application Insights + Log Analytics
  - Fungerande Python-applikationer med anpassad telemetri (1 200+ rader)
  - AI/LLM-övervakningsmönster (Azure OpenAI token/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriflöde)
  - 3 praktiska övningar (varningar, dashboards, AI-övervakning)
  - Kusto-queryexempel och kostnadsoptimeringsstrategier
  - Live-metrikströmning och felsökning i realtid
  - 40-50 minuters lärandetid med produktionsklara mönster

- **🔐 Lektion om Autentisering & Säkerhetsmönster**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (anslutningssträngar, Key Vault, hanterad identitet)
  - Kompletta Bicep-infrastrukturmallar för säkra implementeringar
  - Node.js-applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera hanterad identitet, användarassocierad identitet, Key Vault-rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara autentiseringsmönster utan lösenord

- **🤖 Lektion om Multi-Agent Samordningsmönster**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 samordningsmönster (sekventiell, parallell, hierarkisk, händelsedriven, konsensus)
  - Komplett implementering av orkestratortjänst (Python/Flask, 1 500+ rader)
  - 3 specialiserade agentimplementeringar (Forskning, Skribent, Redaktör)
  - Service Bus-integration för meddelandeköer
  - Cosmos DB-statushantering för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, återförsökslogik, kretsbrytare)
  - Kostnadsöversikt ($240-565/månad) med optimeringsstrategier
  - Application Insights-integration för övervakning

#### Förbättrat
- **Kapitel om Förimplementering**: Inkluderar nu omfattande övervaknings- och samordningsmönster
- **Kapitel om Komma Igång**: Förbättrat med professionella autentiseringsmönster
- **Produktionsberedskap**: Komplett täckning från säkerhet till observabilitet
- **Kursöversikt**: Uppdaterad för att referera till nya lektioner i kapitel 3 och 6

#### Ändrat
- **Lärandeprogression**: Bättre integration av säkerhet och övervakning genom hela kursen
- **Dokumentationskvalitet**: Konsekvent A-klass standard (95-97%) över nya lektioner
- **Produktionsmönster**: Komplett täckning från början till slut för företagsimplementeringar

#### Förbättrat
- **Utvecklarupplevelse**: Tydlig väg från utveckling till produktionsövervakning
- **Säkerhetsstandarder**: Professionella mönster för autentisering och hantering av hemligheter
- **Observabilitet**: Komplett Application Insights-integration med AZD
- **AI-arbetsbelastningar**: Specialiserad övervakning för Azure OpenAI och multi-agent system

#### Validerat
- ✅ Alla lektioner inkluderar komplett fungerande kod (inte bara kodsnuttar)
- ✅ Mermaid-diagram för visuell inlärning (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsklara Bicep-mallar implementerbara via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Dokumentationsgradering
- **docs/pre-deployment/application-insights.md**: - Omfattande övervakningsguide
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agent arkitekturer
- **Övergripande nytt innehåll**: - Konsekvent högkvalitativ standard

#### Teknisk Implementering
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Autentisering**: Hanterad identitet + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Övervakning**: Live-metrik + Kusto-queries + varningar + dashboards
- **Kostnadshantering**: Samplingsstrategier, retentionpolicyer, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättringar av Dokumentationskvalitet och Nytt Azure OpenAI Exempel
**Denna version förbättrar dokumentationskvaliteten över hela repositoryn och lägger till ett komplett Azure OpenAI-implementeringsexempel med GPT-4 chattgränssnitt.**

#### Tillagt
- **🤖 Azure OpenAI Chatt Exempel**: Komplett GPT-4 implementering med fungerande implementation i `examples/azure-openai-chat/`:
  - Komplett Azure OpenAI-infrastruktur (GPT-4 modellimplementering)
  - Python-kommandoradsgränssnitt med konversationshistorik
  - Key Vault-integration för säker API-nyckellagring
  - Tokenanvändningsspårning och kostnadsberäkning
  - Hastighetsbegränsning och felhantering
  - Omfattande README med 35-45 minuters implementeringsguide
  - 11 produktionsklara filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lagt till praktiska övningar i konfigurationsguiden:
  - Övning 1: Konfiguration för flera miljöer (15 minuter)
  - Övning 2: Praktik för hantering av hemligheter (10 minuter)
  - Tydliga framgångskriterier och verifieringssteg
- **✅ Implementeringsverifiering**: Lagt till verifieringssektion i implementeringsguiden:
  - Hälsokontrollprocedurer
  - Framgångskriterier-checklista
  - Förväntade utdata för alla implementeringskommandon
  - Snabbreferens för felsökning

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-klass kvalitet (93%):
  - Lagt till azure-openai-chat i alla relevanta sektioner
  - Uppdaterat lokalt exempelantal från 3 till 4
  - Lagt till i tabellen för AI-applikationsexempel
  - Integrerat i Snabbstart för Mellanliggande Användare
  - Lagt till i sektionen för Microsoft Foundry Mallar
  - Uppdaterat jämförelsematris och teknologifindingssektioner
- **Dokumentationskvalitet**: Förbättrad från B+ (87%) → A- (92%) över docs-mappen:
  - Lagt till förväntade utdata till kritiska kommandon
  - Inkluderat verifieringssteg för konfigurationsändringar
  - Förbättrat praktiskt lärande med praktiska övningar

#### Ändrat
- **Lärandeprogression**: Bättre integration av AI-exempel för mellanliggande användare
- **Dokumentationsstruktur**: Mer handlingsbara övningar med tydliga resultat
- **Verifieringsprocess**: Tydliga framgångskriterier tillagda till nyckelarbetsflöden

#### Förbättrat
- **Utvecklarupplevelse**: Azure OpenAI-implementering tar nu 35-45 minuter (jämfört med 60-90 för komplexa alternativ)
- **Kostnadstransparens**: Tydliga kostnadsberäkningar ($50-200/månad) för Azure OpenAI-exempel
- **Lärandebana**: AI-utvecklare har en tydlig startpunkt med azure-openai-chat
- **Dokumentationsstandarder**: Konsekventa förväntade utdata och verifieringssteg

#### Validerat
- ✅ Azure OpenAI-exempel fullt fungerande med `azd up`
- ✅ Alla 11 implementeringsfiler syntaktiskt korrekta
- ✅ README-instruktioner matchar faktisk implementeringsupplevelse
- ✅ Dokumentationslänkar uppdaterade över 8+ platser
- ✅ Exempelindex reflekterar korrekt 4 lokala exempel
- ✅ Inga duplicerade externa länkar i tabeller
- ✅ Alla navigeringsreferenser korrekta

#### Teknisk Implementering
- **Azure OpenAI Arkitektur**: GPT-4 + Key Vault + Container Apps-mönster
- **Säkerhet**: Hanterad identitet redo, hemligheter i Key Vault
- **Övervakning**: Application Insights-integration
- **Kostnadshantering**: Token-spårning och användningsoptimering
- **Implementering**: Enkelt `azd up`-kommando för komplett setup

### [v3.6.0] - 2025-11-19

#### Större Uppdatering: Exempel på Container App Implementeringar
**Denna version introducerar omfattande, produktionsklara exempel på containerapplikationsimplementeringar med Azure Developer CLI (AZD), med full dokumentation och integration i lärandebanan.**

#### Tillagt
- **🚀 Exempel på Container Apps**: Nya lokala exempel i `examples/container-app/`:
  - [Huvudguide](examples/container-app/README.md): Komplett översikt över containeriserade implementeringar, snabbstart, produktion och avancerade mönster
  - [Enkel Flask API](../../examples/container-app/simple-flask-api): Nybörjarvänlig REST API med scale-to-zero, hälsoprober, övervakning och felsökning
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices): Produktionsklar multi-tjänst implementering (API Gateway, Produkt, Order, Användare, Notifiering), asynkron meddelandehantering, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blå-grön/canary implementering
- **Bästa Praxis**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-vägledning för containeriserade arbetsbelastningar
- **Kodexempel**: Komplett `azure.yaml`, Bicep-mallar och flerspråkiga tjänsteimplementeringar (Python, Node.js, C#, Go)
- **Testning & Felsökning**: End-to-end testscenarier, övervakningskommandon, felsökningsvägledning

#### Ändrat
- **README.md**: Uppdaterad för att lyfta fram och länka nya containerapp-exempel under "Lokala Exempel - Containerapplikationer"
- **examples/README.md**: Uppdaterad för att lyfta fram containerapp-exempel, lägga till jämförelsematrisposter och uppdatera teknologireferenser
- **Kursöversikt & Studievägledning**: Uppdaterad för att referera till nya containerapp-exempel och implementeringsmönster i relevanta kapitel

#### Validerat
- ✅ Alla nya exempel implementerbara med `azd up` och följer bästa praxis
- ✅ Dokumentationskorslänkar och navigering uppdaterade
- ✅ Exempel täcker nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Noteringar
- **Omfattning**: Endast engelsk dokumentation och exempel
- **Nästa Steg**: Utöka med ytterligare avancerade containermönster och CI/CD-automation i framtida versioner

### [v3.5.0] - 2025-11-19

#### Produktomprofilering: Microsoft Foundry
**Denna version implementerar en omfattande produktnamnsändring från "Azure AI Foundry" till "Microsoft Foundry" över all engelsk dokumentation, i linje med Microsofts officiella omprofilering.**

#### Ändrat
- **🔄 Produktnamnsuppdatering**: Komplett omprofilering från "Azure AI Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser över engelsk dokumentation i `docs/`-mappen
  - Bytt namn på mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bytt namn på fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade över 7 dokumentationsfiler

- **📁 Mappstrukturändringar**:
  - `docs/ai-foundry/` bytt namn till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att reflektera ny mappstruktur
  - Navigeringslänkar validerade över all dokumentation

- **📄 Filnamnsändringar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera till nytt filnamn

#### Uppdaterade Filer
- **Kapitel Dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeringslänkar uppdaterade
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Redan använder Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, community feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitel navigeringslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 nästa kapitel länkar uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigering, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigeringslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigeringslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapitelrubriker, mallsektion, community-insikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitelresurser)

#### Validerat
- ✅ Noll kvarvarande "ai-foundry" mappvägsreferenser i engelsk dokumentation
- ✅ Noll kvarvarande "Azure AI Foundry" produktnamnsreferenser i engelsk dokumentation
- ✅ Alla navigeringslänkar fungerar med ny mappstruktur
- ✅ Fil- och mappnamnsändringar genomförda framgångsrikt
- ✅ Korsreferenser mellan kapitel validerade

#### Noteringar
- **Omfattning**: Ändringar tillämpade på engelsk dokumentation i `docs/`-mappen endast
- **Översättningar**: Översättningsmappar (`translations/`) inte uppdaterade i denna version
- **Workshop**: Workshopmaterial (`workshop/`) har inte uppdaterats i denna version
- **Exempel**: Exempelfiler kan fortfarande referera till äldre namnkonventioner (kommer att åtgärdas i framtida uppdatering)
- **Externa länkar**: Externa URL:er och GitHub-referenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala grenar eller dokumentation som refererar till den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ersätt produktnamn: "Azure AI Foundry" → "Microsoft Foundry"
4. Kontrollera att alla interna dokumentationslänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förhandsgranskning av infrastruktur och förbättringar av validering
**Denna version introducerar omfattande stöd för den nya Azure Developer CLI-förhandsgranskningsfunktionen och förbättrar workshopupplevelsen.**

#### Nytt
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattande täckning av den nya förhandsgranskningsfunktionen för infrastruktur
  - Kommandoreferens och användningsexempel i fusklapp
  - Detaljerad integration i provisioneringsguiden med användningsfall och fördelar
  - Integrering av förkontroll för säkrare validering av distribution
  - Uppdateringar i kom-igång-guiden med säkerhetsfokuserade distributionsmetoder
- **🚧 Workshopstatusbanner**: Professionell HTML-banner som indikerar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig kommunikation till användare
  - Senast uppdaterad tidsstämpel för transparens
  - Mobilanpassad design för alla enhetstyper

#### Förbättrat
- **Infrastruktursäkerhet**: Förhandsgranskningsfunktion integrerad i hela dokumentationen för distribution
- **Validering före distribution**: Automatiserade skript inkluderar nu tester för förhandsgranskning av infrastruktur
- **Utvecklararbetsflöde**: Uppdaterade kommandosekvenser för att inkludera förhandsgranskning som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar för användare om innehållets utvecklingsstatus

#### Ändrat
- **Bästa praxis för distribution**: Förhandsgranskningsfokuserat arbetsflöde rekommenderas nu som tillvägagångssätt
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i inlärningsprocessen
- **Workshoppresentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättrat
- **Säkerhetsfokuserad metod**: Infrastrukturändringar kan nu valideras innan distribution
- **Teamarbete**: Förhandsgranskningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader innan provisionering
- **Riskminskning**: Minskade distributionsfel genom avancerad validering

#### Teknisk implementering
- **Integration i flera dokument**: Förhandsgranskningsfunktionen dokumenterad i fyra nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel i hela dokumentationen
- **Bästa praxis**: Förhandsgranskning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NYA funktionsmarkeringar för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientdesign
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Bibehåller repositoryns trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Senast uppdaterad tidsstämpel oktober 2025 för ansvarsskyldighet

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktiv inlärningsupplevelse
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade inlärningsvägar.**

#### Nytt
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs förhandsgranskningsfunktion
- **📝 Strukturerade workshopinstruktioner**: 7-stegs guidad inlärningsväg från upptäckt till anpassning
  - 0-Introduktion: Workshopöversikt och installation
  - 1-Välj-AI-Mall: Process för att upptäcka och välja mallar
  - 2-Validera-AI-Mall: Distributions- och valideringsprocedurer
  - 3-Analysera-AI-Mall: Förståelse för mallens arkitektur
  - 4-Konfigurera-AI-Mall: Konfiguration och anpassning
  - 5-Anpassa-AI-Mall: Avancerade modifieringar och iterationer
  - 6-Rensa-Infrastruktur: Städning och resursförvaltning
  - 7-Sammanfattning: Summering och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad inlärningsupplevelse
- **🎯 Praktisk inlärningsväg**: 3-stegs metodik (Upptäckt → Distribution → Anpassning)
- **📱 GitHub Codespaces Integration**: Sömlös utvecklingsmiljöinstallation

#### Förbättrat
- **AI Workshop Lab**: Utökad med en omfattande 2-3 timmars strukturerad inlärningsupplevelse
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Inlärningsprogression**: Tydlig steg-för-steg vägledning från mallval till produktionsdistribution
- **Utvecklarupplevelse**: Integrerade verktyg för strömlinjeformade utvecklingsarbetsflöden

#### Förbättrat
- **Tillgänglighet**: Webbläsarbaserat gränssnitt med sökfunktion, kopieringsfunktion och temaväxling
- **Självstyrd inlärning**: Flexibel workshopstruktur som passar olika inlärningshastigheter
- **Praktisk tillämpning**: Scenarier för verklig AI-malldistribution
- **Communityintegration**: Discord-integration för workshopsupport och samarbete

#### Workshopfunktioner
- **Inbyggd sökning**: Snabb nyckelords- och lektionsupptäckt
- **Kopiera kodblock**: Hover-funktion för att kopiera alla kodexempel
- **Temaväxling**: Stöd för mörkt/ljust läge för olika preferenser
- **Visuella tillgångar**: Skärmdumpar och diagram för förbättrad förståelse
- **Hjälpintegration**: Direkt Discord-åtkomst för communitysupport

### [v3.2.0] - 2025-09-17

#### Omfattande navigeringsomstrukturering och kapitelbaserat inlärningssystem
**Denna version introducerar ett omfattande kapitelbaserat inlärningssystem med förbättrad navigering i hela repositoryn.**

#### Nytt
- **📚 Kapitelbaserat inlärningssystem**: Omstrukturerade hela kursen till 8 progressiva inlärningskapitel
  - Kapitel 1: Grundläggande & Snabbstart (⭐ - 30-45 min)
  - Kapitel 2: AI-Driven Utveckling (⭐⭐ - 1-2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kod & Distribution (⭐⭐⭐ - 1-1,5 timmar)
  - Kapitel 5: Multi-Agent AI-Lösningar (⭐⭐⭐⭐ - 2-3 timmar)
  - Kapitel 6: Validering & Planering före distribution (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1-1,5 timmar)
  - Kapitel 8: Produktion & Företagsmönster (⭐⭐⭐⭐ - 2-3 timmar)
- **📚 Omfattande navigeringssystem**: Konsekventa navigeringshuvuden och sidfötter i all dokumentation
- **🎯 Progressionsspårning**: Kursavslutningschecklista och verifieringssystem för inlärning
- **🗺️ Vägledning för inlärningsvägar**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskapskrav tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad inlärningsplattform med kapitelbaserad organisation
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelkontext och progressionsvägledning
- **Mallorganisation**: Exempel och mallar kopplade till relevanta inlärningskapitel
- **Resursintegration**: Fusklappar, FAQ och studiematerial kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labbar kopplade till flera kapitelmål

#### Ändrat
- **Inlärningsprogression**: Flyttat från linjär dokumentation till flexibel kapitelbaserad inlärning
- **Konfigurationsplacering**: Omplacerad konfigurationsguide som Kapitel 3 för bättre inlärningsflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela inlärningsresan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsanvändare

#### Förbättrat
- **Användarupplevelse**: Tydliga navigeringsbrödsmulor och kapitelprogressionsindikatorer
- **Tillgänglighet**: Konsekventa navigeringsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Inlärningseffektivitet**: Minskad tid för att hitta relevant innehåll genom förbättrad organisation

#### Teknisk implementering
- **Navigeringshuvuden**: Standardiserad kapitelbaserad navigering i över 40 dokumentationsfiler
- **Sidfotsnavigering**: Konsekvent progressionsvägledning och kapitelavslutningsindikatorer
- **Korslänkning**: Omfattande internt länksystem som kopplar relaterade koncept
- **Kapitelmappning**: Mallar och exempel tydligt kopplade till inlärningsmål

#### Förbättring av studiematerial
- **📚 Omfattande inlärningsmål**: Omstrukturerat studiematerial för att alignera med 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel inkluderar specifika inlärningsmål och praktiska övningar
- **📋 Progressionsspårning**: Veckovis inlärningsschema med mätbara resultat och avslutningschecklistor
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska övningar**: Hands-on aktiviteter med verkliga distributionsscenarier och felsökning
- **📊 Kompetensutveckling**: Tydlig utveckling från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och communityerkännandesystem
- **⏱️ Tidsplanering**: Strukturerad 10-veckors inlärningsplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade Multi-Agent AI-lösningar
**Denna version förbättrar den multi-agent lösningen för detaljhandel med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-Agent Terminologi**: Ersatte "Cora agent" med "Kundagent" i hela detaljhandelslösningen för multi-agent för tydligare förståelse
- **Agentarkitektur**: Uppdaterade all dokumentation, ARM-mallar och kodexempel för att använda konsekvent "Kundagent"-namngivning
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namnkonventioner
- **Dokumentationskonsekvens**: Säkerställde att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM-mallpaket**: Uppdaterade detaljhandel-multiagent-arm-mall med Kundagent-referenser
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med uppdaterad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu KundAgent-namngivning
- **Miljövariabler**: Uppdaterade alla distributionsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrat
- **Utvecklarupplevelse**: Tydligare agentroller och ansvar i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Inlärningsmaterial**: Mer intuitiv agentnamngivning för utbildningsändamål
- **Mallanvändbarhet**: Förenklad förståelse av agentfunktioner och distributionsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med KundAgent-referenser
- Ersatte CoraAgent klassnamn med KundAgent i Python-exempel
- Modifierade ARM-mallkonfigurationer för att använda "kund"-agenttyp
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Uppdaterade alla distributionskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora förändringar - Fokus på AI-utvecklare och integration med Azure AI Foundry
**Denna version omvandlar repositoryn till en omfattande AI-fokuserad inlärningsresurs med integration av Azure AI Foundry.**

#### Nytt
- **🤖 AI-Fokuserad inlärningsväg**: Komplett omstrukturering med prioritering av AI-utvecklare och ingenjörer
- **Azure AI Foundry Integrationsguide**: Omfattande dokumentation för att ansluta AZD med Azure AI Foundry-tjänster
- **Mönster för AI-modelldistribution**: Detaljerad guide som täcker modellval, konfiguration och strategier för produktionsdistribution
- **AI Workshop Lab**: 2-3 timmars praktisk workshop för att konvertera AI-applikationer till AZD-distribuerbara lösningar
- **Bästa praxis för AI-produktion**: Företagsklara mönster för skalning, övervakning och säkerhet för AI-arbetsbelastningar
- **AI-specifik felsökningsguide**: Omfattande felsökning för Azure OpenAI, Cognitive Services och AI-distributionsproblem
- **AI-mallgalleri**: Utvald samling av Azure AI Foundry-mallar med komplexitetsbetyg
- **Workshopmaterial**: Komplett workshopstruktur med praktiska labbar och referensmaterial

#### Förbättrat
- **README-struktur**: AI-utvecklarfokuserad med 45% communityintressedata från Azure AI Foundry Discord
- **Inlärningsvägar**: Dedikerad AI-utvecklarresa tillsammans med traditionella vägar för studenter och DevOps-ingenjörer
- **Mallrekommendationer**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat och openai-chat-app-quickstart
- **Communityintegration**: Förbättrad Discord-communitysupport med AI-specifika kanaler och diskussioner

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
**Denna version representerar en betydande översyn av repositoryns struktur och innehållspresentation.**

#### Nytt
- **Strukturerat inlärningsramverk**: Alla dokumentationssidor inkluderar nu avsnitten
- **Innehållspresentation**: Borttagna dekorativa element till förmån för tydlig och professionell formatering
- **Länkstruktur**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättringar
- **Tillgänglighet**: Borttagna beroenden av emojis för bättre kompatibilitet med skärmläsare
- **Professionellt Utseende**: Ren, akademisk stil som passar för företagsinlärning
- **Inlärningsupplevelse**: Strukturerad metod med tydliga mål och resultat för varje lektion
- **Innehållsorganisation**: Bättre logisk flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Första Utgåvan - Omfattande AZD-inlärningsresurs

#### Tillagt
- **Kärndokumentationsstruktur**
  - Komplett serie med guider för att komma igång
  - Omfattande dokumentation för distribution och provisionering
  - Detaljerade resurser för felsökning och felsökningsguider
  - Verktyg och procedurer för validering före distribution

- **Modul för att Komma Igång**
  - AZD-grunder: Kärnkoncept och terminologi
  - Installationsguide: Plattformsspecifika installationsinstruktioner
  - Konfigurationsguide: Miljöinställning och autentisering
  - Första projektet: Praktisk steg-för-steg-inlärning

- **Modul för Distribution och Provisionering**
  - Distributionsguide: Komplett arbetsflödesdokumentation
  - Provisioneringsguide: Infrastruktur som kod med Bicep
  - Bästa praxis för produktionsdistributioner
  - Mönster för arkitektur med flera tjänster

- **Modul för Validering före Distribution**
  - Kapacitetsplanering: Validering av Azure-resurstillgänglighet
  - Val av SKU: Omfattande vägledning för tjänstenivåer
  - Kontroll före start: Automatiserade valideringsskript (PowerShell och Bash)
  - Verktyg för kostnadsberäkning och budgetplanering

- **Felsökningsmodul**
  - Vanliga problem: Vanligt förekommande problem och lösningar
  - Felsökningsguide: Systematiska felsökningsmetoder
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resurser och Referenser**
  - Kommandosnabbguide: Snabbreferens för viktiga kommandon
  - Ordlista: Omfattande terminologi och förkortningsdefinitioner
  - FAQ: Detaljerade svar på vanliga frågor
  - Länkar till externa resurser och gemenskapsanslutningar

- **Exempel och Mallar**
  - Exempel på enkel webbapplikation
  - Mall för distribution av statisk webbplats
  - Konfiguration av containerapplikation
  - Mönster för databasintegration
  - Exempel på mikrotjänstarkitektur
  - Implementeringar av serverlösa funktioner

#### Funktioner
- **Stöd för flera plattformar**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Flera färdighetsnivåer**: Innehåll utformat för studenter och professionella utvecklare
- **Praktisk Fokus**: Praktiska exempel och verkliga scenarier
- **Omfattande Täckning**: Från grundläggande koncept till avancerade företagsmönster
- **Säkerhetsfokus**: Säkerhetsbästa praxis integrerade genomgående
- **Kostnadsoptimering**: Vägledning för kostnadseffektiva distributioner och resursförvaltning

#### Dokumentationskvalitet
- **Detaljerade Kodexempel**: Praktiska, testade kodexempel
- **Steg-för-steg-instruktioner**: Tydlig, handlingsbar vägledning
- **Omfattande Felhantering**: Felsökning för vanliga problem
- **Integration av Bästa Praxis**: Branschstandarder och rekommendationer
- **Versionskompatibilitet**: Uppdaterad med de senaste Azure-tjänsterna och azd-funktionerna

## Planerade Framtida Förbättringar

### Version 3.1.0 (Planerad)
#### Utökning av AI-plattform
- **Stöd för flera modeller**: Integrationsmönster för Hugging Face, Azure Machine Learning och anpassade modeller
- **AI-agentramverk**: Mallar för LangChain, Semantic Kernel och AutoGen-distributioner
- **Avancerade RAG-mönster**: Alternativ för vektordatabaser utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-övervakning**: Förbättrad övervakning av modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code-tillägg**: Integrerad AZD + AI Foundry-utvecklingsupplevelse
- **GitHub Copilot-integration**: AI-assisterad AZD-mallgenerering
- **Interaktiva handledningar**: Praktiska kodövningar med automatiserad validering för AI-scenarier
- **Videoinnehåll**: Kompletterande videotutorials för visuella inlärare med fokus på AI-distributioner

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Styrningsramverk**: Styrning av AI-modeller, efterlevnad och granskningsspår
- **AI för flera hyresgäster**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI-distribution**: Integration med Azure IoT Edge och containerinstanser
- **Hybridmoln-AI**: Mönster för distribution i flera moln och hybridmiljöer för AI-arbetsbelastningar

#### Avancerade Funktioner
- **Automatisering av AI-pipelines**: MLOps-integration med Azure Machine Learning-pipelines
- **Avancerad Säkerhet**: Zero-trust-mönster, privata slutpunkter och avancerat hotsskydd
- **Prestandaoptimering**: Avancerade inställningar och skalningsstrategier för AI-applikationer med hög genomströmning
- **Global Distribution**: Mönster för innehållsleverans och edge-caching för AI-applikationer

### Version 3.0.0 (Planerad) - Ersatt av Nuvarande Utgåva
#### Föreslagna Tillägg - Nu Implementerade i v3.0.0
- ✅ **AI-fokuserat Innehåll**: Omfattande integration av Azure AI Foundry (Slutfört)
- ✅ **Interaktiva Handledningar**: Praktisk AI-workshop (Slutfört)
- ✅ **Avancerad Säkerhetsmodul**: AI-specifika säkerhetsmönster (Slutfört)
- ✅ **Prestandaoptimering**: Strategier för AI-arbetsbelastningar (Slutfört)

### Version 2.1.0 (Planerad) - Delvis Implementerad i v3.0.0
#### Mindre Förbättringar - Några Slutförda i Nuvarande Utgåva
- ✅ **Ytterligare Exempel**: AI-fokuserade distributionsscenarier (Slutfört)
- ✅ **Utökad FAQ**: AI-specifika frågor och felsökning (Slutfört)
- **Verktygsintegration**: Förbättrade guider för IDE- och redigeringsintegration
- ✅ **Utökad Övervakning**: AI-specifika mönster för övervakning och varningar (Slutfört)

#### Fortfarande Planerade för Framtida Utgåva
- **Mobilvänlig Dokumentation**: Responsiv design för mobilt lärande
- **Offlineåtkomst**: Nedladdningsbara dokumentationspaket
- **Förbättrad IDE-integration**: VS Code-tillägg för AZD + AI-arbetsflöden
- **Gemenskapsdashboard**: Realtidsstatistik och spårning av bidrag från gemenskapen

## Bidra till Ändringsloggen

### Rapportera Ändringar
När du bidrar till detta arkiv, se till att ändringsloggsposter inkluderar:

1. **Versionsnummer**: Följande semantisk versionering (major.minor.patch)
2. **Datum**: Utgivnings- eller uppdateringsdatum i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Tillagt, Ändrat, Avvecklat, Borttaget, Fixat, Säkerhet
4. **Tydlig Beskrivning**: Kortfattad beskrivning av vad som ändrats
5. **Påverkansbedömning**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Tillagt
- Nya funktioner, dokumentationsavsnitt eller kapaciteter
- Nya exempel, mallar eller inlärningsresurser
- Ytterligare verktyg, skript eller hjälpmedel

#### Ändrat
- Modifieringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Avvecklat
- Funktioner eller metoder som håller på att fasas ut
- Dokumentationsavsnitt som planeras att tas bort
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

### Riktlinjer för Semantisk Versionering

#### Huvudversion (X.0.0)
- Brytande ändringar som kräver användaråtgärder
- Betydande omstrukturering av innehåll eller organisation
- Ändringar som förändrar den grundläggande metoden eller metodologin

#### Mindre Version (X.Y.0)
- Nya funktioner eller innehållstillägg
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patchversion (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Gemenskapsfeedback och Förslag

Vi uppmuntrar aktivt gemenskapsfeedback för att förbättra denna inlärningsresurs:

### Hur man Lämnar Feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Discord-diskussioner**: Dela idéer och engagera dig med Azure AI Foundry-gemenskapen
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Gemenskapsforum**: Delta i bredare diskussioner för Azure-utvecklare

### Feedbackkategorier
- **AI-innehållsnoggrannhet**: Korrigeringar av information om AI-tjänsteintegration och distribution
- **Inlärningsupplevelse**: Förslag för förbättrad AI-utvecklarinlärning
- **Saknat AI-innehåll**: Förfrågningar om ytterligare AI-mallar, mönster eller exempel
- **Tillgänglighet**: Förbättringar för olika inlärningsbehov
- **AI-verktygsintegration**: Förslag för bättre arbetsflödesintegration för AI-utveckling
- **Produktions-AI-mönster**: Förfrågningar om företags-AI-distributionsmönster

### Åtagande om Svar
- **Svar på Problem**: Inom 48 timmar för rapporterade problem
- **Funktionsförfrågningar**: Utvärdering inom en vecka
- **Gemenskapsbidrag**: Granskning inom en vecka
- **Säkerhetsproblem**: Omedelbar prioritet med snabb respons

## Underhållsschema

### Regelbundna Uppdateringar
- **Månadsgranskningar**: Noggrannhet i innehåll och länkvalidering
- **Kvartalsuppdateringar**: Större innehållstillägg och förbättringar
- **Halvårsgranskningar**: Omfattande omstrukturering och förbättring
- **Årliga Utgåvor**: Större versionsuppdateringar med betydande förbättringar

### Övervakning och Kvalitetssäkring
- **Automatiserade Tester**: Regelbunden validering av kodexempel och länkar
- **Integration av Gemenskapsfeedback**: Regelbunden inkorporering av användarförslag
- **Teknikuppdateringar**: Anpassning till de senaste Azure-tjänsterna och azd-utgåvorna
- **Tillgänglighetsrevisioner**: Regelbunden granskning för inkluderande designprinciper

## Versionsstödsprincip

### Stöd för Nuvarande Version
- **Senaste Huvudversionen**: Fullt stöd med regelbundna uppdateringar
- **Föregående Huvudversion**: Säkerhetsuppdateringar och kritiska korrigeringar i 12 månader
- **Äldre Versioner**: Endast gemenskapsstöd, inga officiella uppdateringar

### Migreringsvägledning
När huvudversioner släpps, tillhandahåller vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsanteckningar**: Detaljer om brytande ändringar
- **Verktygsstöd**: Skript eller hjälpmedel för att underlätta migrering
- **Gemenskapsstöd**: Dedikerade forum för migreringsfrågor

---

**Navigering**
- **Föregående Lektion**: [Studieguide](resources/study-guide.md)
- **Nästa Lektion**: Återgå till [Huvud-README](README.md)

**Håll dig Uppdaterad**: Följ detta arkiv för notifikationer om nya utgåvor och viktiga uppdateringar av inlärningsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->