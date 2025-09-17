<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-17T23:11:27+00:00",
  "source_file": "course-outline.md",
  "language_code": "sv"
}
-->
## 8-Kapitels Lärstruktur

### Kapitel 1: Grundläggande & Snabbstart (30-45 minuter) 🌱
**Förkunskaper**: Azure-abonnemang, grundläggande kunskaper om kommandoraden  
**Komplexitet**: ⭐

#### Vad du kommer att lära dig
- Förstå grunderna i Azure Developer CLI
- Installera AZD på din plattform  
- Din första lyckade distribution
- Kärnkoncept och terminologi

#### Lärresurser
- [AZD Grunder](docs/getting-started/azd-basics.md) - Kärnkoncept
- [Installation & Setup](docs/getting-started/installation.md) - Plattformsspecifika guider
- [Ditt första projekt](docs/getting-started/first-project.md) - Praktisk handledning
- [Kommandoreferens](resources/cheat-sheet.md) - Snabbguide

#### Praktiskt resultat
Lyckas distribuera en enkel webbapplikation till Azure med AZD

---

### Kapitel 2: AI-Driven Utveckling (1-2 timmar) 🤖
**Förkunskaper**: Kapitel 1 slutfört  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Integration av Azure AI Foundry med AZD
- Distribuera AI-drivna applikationer
- Förstå AI-tjänsters konfigurationer
- RAG (Retrieval-Augmented Generation) mönster

#### Lärresurser
- [Integration med Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI-modell distribution](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Praktisk labb
- [Azure AI Foundry Mallar](README.md#featured-azure-ai-foundry-templates)

#### Praktiskt resultat
Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

---

### Kapitel 3: Konfiguration & Autentisering (45-60 minuter) ⚙️
**Förkunskaper**: Kapitel 1 slutfört  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Miljökonfiguration och hantering
- Autentisering och säkerhetsbästa praxis
- Namngivning och organisering av resurser
- Distributioner för flera miljöer

#### Lärresurser
- [Konfigurationsguide](docs/getting-started/configuration.md) - Miljöinställningar
- Säkerhetsmönster och hanterad identitet
- Exempel på flera miljöer

#### Praktiskt resultat
Hantera flera miljöer med korrekt autentisering och säkerhet

---

### Kapitel 4: Infrastruktur som kod & Distribution (1-1,5 timmar) 🏗️
**Förkunskaper**: Kapitel 1-3 slutfört  
**Komplexitet**: ⭐⭐⭐

#### Vad du kommer att lära dig
- Avancerade distributionsmönster
- Infrastruktur som kod med Bicep
- Strategier för resursförsörjning
- Skapa anpassade mallar

#### Lärresurser
- [Distributionsguide](docs/deployment/deployment-guide.md) - Kompletta arbetsflöden
- [Resursförsörjning](docs/deployment/provisioning.md) - Hantering av resurser
- Exempel på containrar och mikrotjänster

#### Praktiskt resultat
Distribuera komplexa applikationer med flera tjänster med anpassade infrastruktursmallar

---

### Kapitel 5: AI-lösningar med flera agenter (2-3 timmar) 🤖🤖
**Förkunskaper**: Kapitel 1-2 slutfört  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du kommer att lära dig
- Arkitekturmönster för flera agenter
- Orkestrering och samordning av agenter
- Produktionsklara AI-distributioner
- Implementering av kund- och lageragenter

#### Lärresurser
- [Detaljerad lösning för detaljhandel](examples/retail-scenario.md) - Komplett implementation
- [ARM-mallpaket](../../examples/retail-multiagent-arm-template) - Enklicksdistribution
- Samordningsmönster för flera agenter

#### Praktiskt resultat
Distribuera och hantera en produktionsklar AI-lösning med flera agenter

---

### Kapitel 6: Validering & Planering före distribution (1 timme) 🔍
**Förkunskaper**: Kapitel 4 slutfört  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Kapacitetsplanering och resursvalidering
- Strategier för SKU-val
- Förkontroller och automatisering
- Kostnadsoptimeringsplanering

#### Lärresurser
- [Kapacitetsplanering](docs/pre-deployment/capacity-planning.md) - Resursvalidering
- [SKU-val](docs/pre-deployment/sku-selection.md) - Kostnadseffektiva val
- [Förkontroller](docs/pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiskt resultat
Validera och optimera distributioner innan utförande

---

### Kapitel 7: Felsökning & Debugging (1-1,5 timmar) 🔧
**Förkunskaper**: Något distributionskapitel slutfört  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning
- Prestandaoptimering

#### Lärresurser
- [Vanliga problem](docs/troubleshooting/common-issues.md) - FAQ och lösningar
- [Felsökningsguide](docs/troubleshooting/debugging.md) - Steg-för-steg-strategier
- [AI-specifik felsökning](docs/troubleshooting/ai-troubleshooting.md) - Problem med AI-tjänster

#### Praktiskt resultat
Självständigt diagnostisera och lösa vanliga distributionsproblem

---

### Kapitel 8: Produktions- & Företagsmönster (2-3 timmar) 🏢
**Förkunskaper**: Kapitel 1-4 slutfört  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du kommer att lära dig
- Strategier för produktionsdistribution
- Företagssäkerhetsmönster
- Övervakning och kostnadsoptimering
- Skalbarhet och styrning

#### Lärresurser
- [Bästa praxis för produktions-AI](docs/ai-foundry/production-ai-practices.md) - Företagsmönster
- Exempel på mikrotjänster och företag
- Ramverk för övervakning och styrning

#### Praktiskt resultat
Distribuera företagsklara applikationer med full produktionskapacitet

---

## Lärprogression och komplexitet

### Progressiv färdighetsutveckling

- **🌱 Nybörjare**: Börja med Kapitel 1 (Grundläggande) → Kapitel 2 (AI-utveckling)
- **🔧 Mellannivå**: Kapitel 3-4 (Konfiguration & Infrastruktur) → Kapitel 6 (Validering)
- **🚀 Avancerad**: Kapitel 5 (Lösningar med flera agenter) → Kapitel 7 (Felsökning)
- **🏢 Företag**: Slutför alla kapitel, fokusera på Kapitel 8 (Produktionsmönster)

### Komplexitetsindikatorer

- **⭐ Grundläggande**: Enkla koncept, guidade handledningar, 30-60 minuter
- **⭐⭐ Mellannivå**: Flera koncept, praktisk övning, 1-2 timmar  
- **⭐⭐⭐ Avancerad**: Komplexa arkitekturer, anpassade lösningar, 1-3 timmar
- **⭐⭐⭐⭐ Expert**: Produktionssystem, företagsmönster, 2-4 timmar

### Flexibla lärvägar

#### 🎯 Snabbspår för AI-utvecklare (4-6 timmar)
1. **Kapitel 1**: Grundläggande & Snabbstart (45 min)
2. **Kapitel 2**: AI-Driven Utveckling (2 timmar)  
3. **Kapitel 5**: AI-lösningar med flera agenter (3 timmar)
4. **Kapitel 8**: Bästa praxis för produktions-AI (1 timme)

#### 🛠️ Infrastruktur Specialist (5-7 timmar)
1. **Kapitel 1**: Grundläggande & Snabbstart (45 min)
2. **Kapitel 3**: Konfiguration & Autentisering (1 timme)
3. **Kapitel 4**: Infrastruktur som kod & Distribution (1,5 timmar)
4. **Kapitel 6**: Validering & Planering före distribution (1 timme)
5. **Kapitel 7**: Felsökning & Debugging (1,5 timmar)
6. **Kapitel 8**: Produktions- & Företagsmönster (2 timmar)

#### 🎓 Komplett lärresa (8-12 timmar)
Slutför alla 8 kapitel i följd med praktisk övning och validering

## Kursens slutförandestruktur

### Kunskapsvalidering
- **Kapitelkontroller**: Praktiska övningar med mätbara resultat
- **Praktisk verifiering**: Distribuera fungerande lösningar för varje kapitel
- **Progressionsspårning**: Visuella indikatorer och slutförandemärken
- **Community-validering**: Dela erfarenheter i Azure Discord-kanaler

### Bedömning av lärresultat

#### Kapitel 1-2 Slutförande (Grundläggande + AI)
- ✅ Distribuera enkel webbapplikation med AZD
- ✅ Distribuera AI-driven chattapplikation med RAG
- ✅ Förstå AZD:s kärnkoncept och AI-integration

#### Kapitel 3-4 Slutförande (Konfiguration + Infrastruktur)  
- ✅ Hantera distributioner för flera miljöer
- ✅ Skapa anpassade infrastruktursmallar med Bicep
- ✅ Implementera säkra autentiseringsmönster

#### Kapitel 5-6 Slutförande (Flera agenter + Validering)
- ✅ Distribuera komplex AI-lösning med flera agenter
- ✅ Utföra kapacitetsplanering och kostnadsoptimering
- ✅ Implementera automatiserad validering före distribution

#### Kapitel 7-8 Slutförande (Felsökning + Produktion)
- ✅ Självständigt felsöka och lösa distributionsproblem  
- ✅ Implementera företagsklassad övervakning och säkerhet
- ✅ Distribuera produktionsklara applikationer med styrning

### Certifiering och erkännande
- **Slutförandemärke**: Slutför alla 8 kapitel med praktisk validering
- **Community-erkännande**: Aktivt deltagande i Azure AI Foundry Discord
- **Professionell utveckling**: Relevanta färdigheter för AZD och AI-distribution
- **Karriärutveckling**: Företagsklara molndistributionsfärdigheter

## Innehållets relevans för moderna utvecklare

### Teknisk djup och täckning
- **Azure OpenAI Integration**: Full täckning av GPT-4o, embeddings och distributioner med flera modeller
- **AI Arkitekturmönster**: RAG-implementeringar, orkestrering av flera agenter och produktions-AI-arbetsflöden
- **Infrastruktur som kod**: Bicep-mallar, ARM-distributioner och automatiserad resursförsörjning
- **Produktionsberedskap**: Säkerhet, skalning, övervakning, kostnadsoptimering och styrning
- **Företagsmönster**: Distributioner för flera miljöer, CI/CD-integration och efterlevnadsramverk

### Praktiskt lärfokus
- **Distributionsautomatisering**: Fokus på praktiska AZD-arbetsflöden, inte teoretiska koncept
- **Verkliga scenarier**: Komplett detaljhandelslösning med kund- och lageragenter
- **Produktions-exempel**: ARM-mallpaket, en-klicksdistributioner och företagsmönster
- **Felsökningsfärdigheter**: AI-specifik debugging, diagnostik för flera tjänster och prestandaoptimering
- **Branschrelevans**: Baserat på feedback från Azure AI Foundry-communityn och företagskrav

### Community och supportintegration
- **Discord-integration**: Aktivt deltagande i Azure AI Foundry och Microsoft Azure-communityn
- **GitHub-diskussioner**: Samarbetsinlärning och problemlösning med kollegor och experter
- **Expertåtkomst**: Direkt kontakt med Microsoft-ingenjörer och AI-distributionsspecialister
- **Kontinuerliga uppdateringar**: Kursinnehåll utvecklas med Azure-plattformsuppdateringar och community-feedback
- **Karriärutveckling**: Färdigheter direkt tillämpbara för moderna moln- och AI-utvecklingsroller

### Validering av lärresultat
- **Mätbara färdigheter**: Varje kapitel innehåller praktiska distributionsövningar med verifierbara resultat
- **Portföljutveckling**: Slutför projekt som är lämpliga för professionella portföljer och jobbintervjuer
- **Branscherkännande**: Färdigheter som överensstämmer med aktuella arbetsmarknadskrav för AZD och AI-distribution
- **Professionellt nätverk**: Tillgång till Azure-utvecklarcommunityn för karriärutveckling och samarbete

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.