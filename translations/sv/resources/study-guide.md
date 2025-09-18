<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T23:20:21+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sv"
}
-->
# Studievägledning - Omfattande lärandemål

**Navigering i lärandebanan**
- **📚 Kurshem**: [AZD För Nybörjare](../README.md)
- **📖 Börja Lära**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsspårning**: [Kursavslutning](../README.md#-course-completion--certification)

## Introduktion

Denna omfattande studievägledning ger strukturerade lärandemål, nyckelkoncept, praktiska övningar och bedömningsmaterial för att hjälpa dig att bemästra Azure Developer CLI (azd). Använd denna guide för att följa din utveckling och säkerställa att du täckt alla viktiga ämnen.

## Lärandemål

Genom att slutföra denna studievägledning kommer du att:
- Bemästra alla grundläggande och avancerade koncept inom Azure Developer CLI
- Utveckla praktiska färdigheter i att distribuera och hantera Azure-applikationer
- Bygga självförtroende i felsökning och optimering av distributioner
- Förstå produktionsklara distributionsmetoder och säkerhetsöverväganden

## Läranderesultat

Efter att ha slutfört alla avsnitt i denna studievägledning kommer du att kunna:
- Designa, distribuera och hantera kompletta applikationsarkitekturer med azd
- Implementera omfattande övervakning, säkerhet och kostnadsoptimeringsstrategier
- Felsöka komplexa distributionsproblem självständigt
- Skapa anpassade mallar och bidra till azd-communityn

## 8-kapitels lärandestruktur

### Kapitel 1: Grundläggande & Snabbstart (Vecka 1)
**Varaktighet**: 30-45 minuter | **Komplexitet**: ⭐

#### Lärandemål
- Förstå grundläggande koncept och terminologi för Azure Developer CLI
- Installera och konfigurera AZD på din utvecklingsplattform
- Distribuera din första applikation med en befintlig mall
- Navigera effektivt i AZD:s kommandoradsgränssnitt

#### Nyckelkoncept att bemästra
- AZD-projektstruktur och komponenter (azure.yaml, infra/, src/)
- Mallbaserade distributionsarbetsflöden
- Grundläggande miljökonfiguration
- Hantering av resursgrupper och prenumerationer

#### Praktiska övningar
1. **Installationsverifiering**: Installera AZD och verifiera med `azd version`
2. **Första distributionen**: Distribuera todo-nodejs-mongo-mallen framgångsrikt
3. **Miljöinställning**: Konfigurera dina första miljövariabler
4. **Resursutforskning**: Navigera distribuerade resurser i Azure Portal

#### Bedömningsfrågor
- Vilka är kärnkomponenterna i ett AZD-projekt?
- Hur initierar du ett nytt projekt från en mall?
- Vad är skillnaden mellan `azd up` och `azd deploy`?
- Hur hanterar du flera miljöer med AZD?

---

### Kapitel 2: AI-Driven Utveckling (Vecka 2)
**Varaktighet**: 1-2 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Integrera Azure AI Foundry-tjänster med AZD-arbetsflöden
- Distribuera och konfigurera AI-drivna applikationer
- Förstå implementeringsmönster för RAG (Retrieval-Augmented Generation)
- Hantera AI-modelldistributioner och skalning

#### Nyckelkoncept att bemästra
- Integration av Azure OpenAI-tjänster och API-hantering
- Konfiguration av AI-sökning och vektorindexering
- Strategier för modelldistribution och kapacitetsplanering
- Övervakning och prestandaoptimering för AI-applikationer

#### Praktiska övningar
1. **AI-chattdistribution**: Distribuera azure-search-openai-demo-mallen
2. **RAG-implementering**: Konfigurera dokumentindexering och hämtning
3. **Modellkonfiguration**: Ställ in flera AI-modeller med olika syften
4. **AI-övervakning**: Implementera Application Insights för AI-arbetsbelastningar

#### Bedömningsfrågor
- Hur konfigurerar du Azure OpenAI-tjänster i en AZD-mall?
- Vilka är nyckelkomponenterna i en RAG-arkitektur?
- Hur hanterar du kapacitet och skalning för AI-modeller?
- Vilka övervakningsmetrikar är viktiga för AI-applikationer?

---

### Kapitel 3: Konfiguration & Autentisering (Vecka 3)
**Varaktighet**: 45-60 minuter | **Komplexitet**: ⭐⭐

#### Lärandemål
- Bemästra strategier för miljökonfiguration och hantering
- Implementera säkra autentiseringsmönster och hanterad identitet
- Organisera resurser med lämpliga namngivningskonventioner
- Konfigurera distributioner för flera miljöer (dev, staging, prod)

#### Nyckelkoncept att bemästra
- Miljöhierarki och konfigurationsprioritet
- Hanterad identitet och autentisering med tjänsteprinciper
- Integration av Key Vault för hantering av hemligheter
- Miljöspecifik parameterhantering

#### Praktiska övningar
1. **Inställning för flera miljöer**: Konfigurera dev-, staging- och prod-miljöer
2. **Säkerhetskonfiguration**: Implementera autentisering med hanterad identitet
3. **Hantering av hemligheter**: Integrera Azure Key Vault för känslig data
4. **Parameterhantering**: Skapa miljöspecifika konfigurationer

#### Bedömningsfrågor
- Hur konfigurerar du olika miljöer med AZD?
- Vilka är fördelarna med att använda hanterad identitet jämfört med tjänsteprinciper?
- Hur hanterar du applikationshemligheter på ett säkert sätt?
- Vad är konfigurationshierarkin i AZD?

---

### Kapitel 4: Infrastruktur som Kod & Distribution (Vecka 4-5)
**Varaktighet**: 1-1,5 timmar | **Komplexitet**: ⭐⭐⭐

#### Lärandemål
- Skapa och anpassa Bicep-infrastrukturmallar
- Implementera avancerade distributionsmönster och arbetsflöden
- Förstå strategier för resursförsörjning
- Designa skalbara arkitekturer för flera tjänster

#### Nyckelkoncept att bemästra
- Struktur och bästa praxis för Bicep-mallar
- Resursberoenden och distributionsordning
- Parameterfiler och mallmodularitet
- Anpassade hooks och automatisering av distributioner

#### Praktiska övningar
1. **Skapande av anpassad mall**: Bygg en applikationsmall för flera tjänster
2. **Bicep-färdigheter**: Skapa modulära, återanvändbara infrastrukturkomponenter
3. **Automatisering av distribution**: Implementera pre/post-distributionshooks
4. **Arkitekturdesign**: Distribuera komplexa mikrotjänstarkitekturer

#### Bedömningsfrågor
- Hur skapar du anpassade Bicep-mallar för AZD?
- Vilka är bästa praxis för att organisera infrastrukturkod?
- Hur hanterar du resursberoenden i mallar?
- Vilka distributionsmönster stödjer uppdateringar utan driftstopp?

---

### Kapitel 5: AI-lösningar med Flera Agenter (Vecka 6-7)
**Varaktighet**: 2-3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Designa och implementera AI-arkitekturer med flera agenter
- Orkestrera samordning och kommunikation mellan agenter
- Distribuera produktionsklara AI-lösningar med övervakning
- Förstå specialisering av agenter och arbetsflödesmönster

#### Nyckelkoncept att bemästra
- Mönster och designprinciper för arkitekturer med flera agenter
- Kommunikationsprotokoll och dataflöde mellan agenter
- Lastbalansering och skalningsstrategier för AI-agenter
- Produktionsövervakning för system med flera agenter

#### Praktiska övningar
1. **Detaljhandelslösning**: Distribuera det kompletta detaljhandelsscenariot med flera agenter
2. **Anpassning av agenter**: Modifiera beteenden för kund- och lageragenter
3. **Skalning av arkitektur**: Implementera lastbalansering och autoskalning
4. **Produktionsövervakning**: Ställ in omfattande övervakning och varningar

#### Bedömningsfrågor
- Hur designar du effektiva kommunikationsmönster för flera agenter?
- Vilka är de viktigaste övervägandena för att skala AI-agenters arbetsbelastningar?
- Hur övervakar och felsöker du AI-system med flera agenter?
- Vilka produktionsmönster säkerställer tillförlitlighet för AI-agenter?

---

### Kapitel 6: Validering & Planering före Distribution (Vecka 8)
**Varaktighet**: 1 timme | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utföra omfattande kapacitetsplanering och resursvalidering
- Välja optimala Azure-SKU:er för kostnadseffektivitet
- Implementera automatiserade förkontroller och validering
- Planera distributioner med kostnadsoptimeringsstrategier

#### Nyckelkoncept att bemästra
- Azure-resurskvoter och kapacitetsbegränsningar
- Kriterier för SKU-val och kostnadsoptimering
- Automatiserade valideringsskript och testning
- Distributionsplanering och riskbedömning

#### Praktiska övningar
1. **Kapacitetsanalys**: Analysera resurskrav för dina applikationer
2. **SKU-optimering**: Jämför och välj kostnadseffektiva tjänstenivåer
3. **Automatisering av validering**: Implementera förkontrollsskript
4. **Kostnadsplanering**: Skapa kostnadsberäkningar och budgetar för distribution

#### Bedömningsfrågor
- Hur validerar du Azure-kapacitet före distribution?
- Vilka faktorer påverkar beslut om SKU-val?
- Hur automatiserar du validering före distribution?
- Vilka strategier hjälper till att optimera distributionskostnader?
2. Hur validerar du tillgängligheten av Azure-resurser innan distribution?  
3. Vilka är de viktigaste komponenterna i ett system för förkontroll?  
4. Hur uppskattar och kontrollerar du distributionskostnader?  
5. Vilken övervakning är viktig för kapacitetsplanering?

### Modul 5: Felsökning och Debugging (Vecka 6)

#### Lärandemål
- Behärska systematiska felsökningsmetoder  
- Utveckla expertis i att debugga komplexa distributionsproblem  
- Implementera omfattande övervakning och larm  
- Skapa rutiner för incidenthantering och återställning  

#### Viktiga koncept att bemästra
- Vanliga mönster för distributionsfel  
- Logganalys och korrelationstekniker  
- Prestandaövervakning och optimering  
- Upptäckt och hantering av säkerhetsincidenter  
- Katastrofåterställning och affärskontinuitet  

#### Praktiska övningar

**Övning 5.1: Felsökningsscenarier**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Övning 5.2: Implementering av övervakning**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Övning 5.3: Incidenthantering**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Självbedömningsfrågor
1. Vad är det systematiska tillvägagångssättet för felsökning av azd-distributioner?  
2. Hur korrelerar du loggar över flera tjänster och resurser?  
3. Vilka övervakningsmetrikar är mest kritiska för tidig problemupptäckt?  
4. Hur implementerar du effektiva rutiner för katastrofåterställning?  
5. Vilka är de viktigaste komponenterna i en incidenthanteringsplan?  

### Modul 6: Avancerade ämnen och bästa praxis (Vecka 7-8)

#### Lärandemål
- Implementera distributionsmönster på företagsnivå  
- Behärska CI/CD-integration och automatisering  
- Utveckla anpassade mallar och bidra till communityn  
- Förstå avancerade säkerhets- och efterlevnadskrav  

#### Viktiga koncept att bemästra
- Integrationsmönster för CI/CD-pipelines  
- Utveckling och distribution av anpassade mallar  
- Företagsstyrning och efterlevnad  
- Avancerade nätverks- och säkerhetskonfigurationer  
- Prestandaoptimering och kostnadshantering  

#### Praktiska övningar

**Övning 6.1: CI/CD-integration**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Övning 6.2: Utveckling av anpassade mallar**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Övning 6.3: Implementering på företagsnivå**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Självbedömningsfrågor
1. Hur integrerar du azd i befintliga CI/CD-arbetsflöden?  
2. Vilka är de viktigaste övervägandena vid utveckling av anpassade mallar?  
3. Hur implementerar du styrning och efterlevnad i azd-distributioner?  
4. Vilka är bästa praxis för distributioner i företagsmiljö?  
5. Hur bidrar du effektivt till azd-communityn?  

## Praktiska projekt

### Projekt 1: Personlig portföljwebbplats  
**Komplexitet**: Nybörjare  
**Varaktighet**: 1-2 veckor  

Bygg och distribuera en personlig portföljwebbplats med:  
- Statisk webbhotell på Azure Storage  
- Konfiguration av anpassad domän  
- CDN-integration för global prestanda  
- Automatiserad distributionspipeline  

**Leveranser**:  
- Fungerande webbplats distribuerad på Azure  
- Anpassad azd-mall för portföljdistributioner  
- Dokumentation av distributionsprocessen  
- Kostnadsanalys och optimeringsrekommendationer  

### Projekt 2: Uppgiftshanteringsapplikation  
**Komplexitet**: Medel  
**Varaktighet**: 2-3 veckor  

Skapa en fullstack-uppgiftshanteringsapplikation med:  
- React-frontend distribuerad till App Service  
- Node.js API-backend med autentisering  
- PostgreSQL-databas med migreringar  
- Application Insights-övervakning  

**Leveranser**:  
- Komplett applikation med användarautentisering  
- Databasschema och migreringsskript  
- Övervakningspaneler och larmregler  
- Konfiguration för distribution i flera miljöer  

### Projekt 3: E-handelsplattform med mikrotjänster  
**Komplexitet**: Avancerad  
**Varaktighet**: 4-6 veckor  

Designa och implementera en e-handelsplattform baserad på mikrotjänster:  
- Flera API-tjänster (katalog, beställningar, betalningar, användare)  
- Meddelandeköintegration med Service Bus  
- Redis-cache för prestandaoptimering  
- Omfattande loggning och övervakning  

**Leveranser**:  
- Komplett mikrotjänstarkitektur  
- Kommunikationsmönster mellan tjänster  
- Prestandatestning och optimering  
- Produktionsklar säkerhetsimplementering  

## Bedömning och certifiering

### Kunskapskontroller

Slutför dessa bedömningar efter varje modul:

**Modul 1 Bedömning**: Grundläggande koncept och installation  
- Flervalsfrågor om kärnkoncept  
- Praktiska installations- och konfigurationsuppgifter  
- Enkel distributionsövning  

**Modul 2 Bedömning**: Konfiguration och miljöer  
- Scenarier för miljöhantering  
- Övningar för felsökning av konfigurationer  
- Implementering av säkerhetskonfigurationer  

**Modul 3 Bedömning**: Distribution och provisionering  
- Utmaningar i infrastrukturdesign  
- Scenarier för distribution av flera tjänster  
- Övningar för prestandaoptimering  

**Modul 4 Bedömning**: Validering före distribution  
- Fallstudier för kapacitetsplanering  
- Scenarier för kostnadsoptimering  
- Implementering av valideringspipelines  

**Modul 5 Bedömning**: Felsökning och debugging  
- Övningar för problemdiagnos  
- Uppgifter för implementering av övervakning  
- Simuleringar av incidenthantering  

**Modul 6 Bedömning**: Avancerade ämnen  
- Design av CI/CD-pipelines  
- Utveckling av anpassade mallar  
- Scenarier för företagsarkitektur  

### Slutprojekt

Designa och implementera en komplett lösning som demonstrerar behärskning av alla koncept:

**Krav**:  
- Flerlagerapplikationsarkitektur  
- Flera distributionsmiljöer  
- Omfattande övervakning och larm  
- Implementering av säkerhet och efterlevnad  
- Kostnadsoptimering och prestandajustering  
- Komplett dokumentation och driftmanualer  

**Bedömningskriterier**:  
- Teknisk implementeringskvalitet  
- Dokumentationsfullständighet  
- Efterlevnad av säkerhet och bästa praxis  
- Prestanda- och kostnadsoptimering  
- Effektivitet i felsökning och övervakning  

## Studieresurser och referenser

### Officiell dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community-resurser
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisation](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Praktiska miljöer
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Ytterligare verktyg
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Rekommendationer för studietid

### Heltidsstudier (8 veckor)
- **Vecka 1-2**: Moduler 1-2 (Kom igång, Konfiguration)  
- **Vecka 3-4**: Moduler 3-4 (Distribution, Validering före distribution)  
- **Vecka 5-6**: Moduler 5-6 (Felsökning, Avancerade ämnen)  
- **Vecka 7-8**: Praktiska projekt och slutbedömning  

### Deltidsstudier (16 veckor)
- **Vecka 1-4**: Modul 1 (Kom igång)  
- **Vecka 5-7**: Modul 2 (Konfiguration och miljöer)  
- **Vecka 8-10**: Modul 3 (Distribution och provisionering)  
- **Vecka 11-12**: Modul 4 (Validering före distribution)  
- **Vecka 13-14**: Modul 5 (Felsökning och debugging)  
- **Vecka 15-16**: Modul 6 (Avancerade ämnen och bedömning)  

---

## Framstegsspårning och bedömningsramverk

### Kapitelavslutningschecklista

Följ din framsteg genom varje kapitel med dessa mätbara resultat:

#### 📚 Kapitel 1: Grundläggande & Snabbstart  
- [ ] **Installation klar**: AZD installerat och verifierat på din plattform  
- [ ] **Första distributionen**: Lyckad distribution av todo-nodejs-mongo-mallen  
- [ ] **Miljöinställning**: Konfigurerade första miljövariabler  
- [ ] **Resursnavigering**: Utforskade distribuerade resurser i Azure Portal  
- [ ] **Kommandokunskap**: Bekväm med grundläggande AZD-kommandon  

#### 🤖 Kapitel 2: AI-Driven Utveckling  
- [ ] **AI-malldistribution**: Lyckad distribution av azure-search-openai-demo  
- [ ] **RAG-implementering**: Konfigurerade dokumentindexering och hämtning  
- [ ] **Modellkonfiguration**: Ställde in flera AI-modeller med olika syften  
- [ ] **AI-övervakning**: Implementerade Application Insights för AI-arbetsbelastningar  
- [ ] **Prestandaoptimering**: Justerade AI-applikationens prestanda  

#### ⚙️ Kapitel 3: Konfiguration & Autentisering  
- [ ] **Multi-miljöinställning**: Konfigurerade utvecklings-, test- och produktionsmiljöer  
- [ ] **Säkerhetsimplementering**: Ställde in autentisering med hanterad identitet  
- [ ] **Hantering av hemligheter**: Integrerade Azure Key Vault för känslig data  
- [ ] **Parameterhantering**: Skapade miljöspecifika konfigurationer  
- [ ] **Autentiseringskunskap**: Implementerade säkra åtkomstmönster  

#### 🏗️ Kapitel 4: Infrastruktur som kod & Distribution  
- [ ] **Skapande av anpassad mall**: Byggde en mall för applikation med flera tjänster  
- [ ] **Bicep-kunskap**: Skapade modulära, återanvändbara infrastrukturkomponenter  
- [ ] **Distributionsautomatisering**: Implementerade pre/post-distributionshooks  
- [ ] **Arkitekturdesign**: Distribuerade komplex mikrotjänstarkitektur  
- [ ] **Malloptimering**: Optimerade mallar för prestanda och kostnad  

#### 🎯 Kapitel 5: Multi-Agent AI-lösningar  
- [ ] **Detaljhandelslösning**: Distribuerade komplett multi-agent detaljhandelsscenario  
- [ ] **Agentanpassning**: Modifierade beteenden för kund- och lageragenter  
- [ ] **Skalning av arkitektur**: Implementerade lastbalansering och autoskalning  
- [ ] **Produktionsövervakning**: Ställde in omfattande övervakning och larm  
- [ ] **Prestandajustering**: Optimerade prestanda för multi-agent-system  

#### 🔍 Kapitel 6: Validering före distribution & Planering  
- [ ] **Kapacitetsanalys**: Analyserade resurskrav för applikationer  
- [ ] **SKU-optimering**: Valde kostnadseffektiva tjänstenivåer  
- [ ] **Automatisering av validering**: Implementerade skript för förkontroll  
- [ ] **Kostnadsplanering**: Skapade kostnadsuppskattningar och budgetar  
- [ ] **Riskbedömning**: Identifierade och minimerade distributionsrisker  

#### 🚨 Kapitel 7: Felsökning & Debugging  
- [ ] **Diagnostiska färdigheter**: Lyckades debugga avsiktligt trasiga distributioner  
- [ ] **Logganalys**: Använde Azure Monitor och Application Insights effektivt  
- [ ] **Prestandajustering**: Optimerade långsamma applikationer  
- [ ] **Återställningsrutiner**: Implementerade backup och katastrofåterställning  
- [ ] **Övervakningsinställning**: Skapade proaktiv övervakning och larm  

#### 🏢 Kapitel 8: Produktion & Företagsmönster  
- [ ] **Företagssäkerhet**: Implementerade omfattande säkerhetsmönster  
- [ ] **Styrningsramverk**: Ställde in Azure Policy och resursstyrning  
- [ ] **Avancerad övervakning**: Skapade paneler och automatiserade larm  
- [ ] **CI/CD-integration**: Byggde automatiserade distributionspipelines  
- [ ] **Efterlevnadsimplementering**: Uppfyllde företagskrav för efterlevnad  

### Lärandemilstolpar

#### Vecka 1-2: Grundläggande kunskaper  
- **Milstolpe**: Distribuera första AI-applikationen med AZD  
- **Validering**: Fungerande applikation tillgänglig via offentlig URL  
- **Färdigheter**: Grundläggande AZD-arbetsflöden och AI-tjänsteintegration  

#### Vecka 3-4: Konfigurationskunskap  
- **Milstolpe**: Multi-miljödistribution med säker autentisering  
- **Validering**: Samma applikation distribuerad till utveckling/test/produktion  
- **Färdigheter**: Miljöhantering och säkerhetsimplementering  

#### Vecka 5-6: Infrastrukturkunskap  
- **Milstolpe**: Anpassad mall för komplex applikation med flera tjänster  
- **Validering**: Återanvändbar mall distribuerad av en annan teammedlem  
- **Färdigheter**: Bicep-kunskap och infrastrukturautomatisering  

#### Vecka 7-8: Avancerad AI-implementering  
- **Milstolpe**: Produktionsklar multi-agent AI-lösning  
- **Validering**: System som hanterar verklig belastning med övervakning  
- **Färdigheter**: Multi-agent orkestrering och prestandaoptimering  

#### Vecka 9-10: Produktionsberedskap  
- **Milstolpe**: Företagsdistribution med full efterlevnad  
- **Validering**: Godkänd säkerhetsgranskning och kostnadsoptimeringsrevision  
- **Färdigheter**: Styrning, övervakning och CI/CD-integration  

### Bedömning och certifiering

#### Metoder för kunskapsvalidering  
1. **Praktiska distributioner**: Fungerande applikationer för varje kapitel  
2. **Kodgranskningar**: Bedömning av mall- och konfigurationskvalitet  
3. **Problemlösning**: Felsökningsscenarier och lösningar  
4. **Peer-lärande**: Förklara koncept för andra deltagare  
5. **Community-bidrag**: Dela mallar eller förbättringar  

#### Professionella utvecklingsresultat  
- **Portföljprojekt**: 8 produktionsklara distributioner  
- **Tekniska färdigheter**: Branschstandard för AZD och AI-distribution  
- **Problemlösningsförmåga**: Självständig felsökning och optimering  
- **Community-erkännande**: Aktivt deltagande i Azure-utvecklarcommunityn  
- **Karriärutveckling**: Färdigheter direkt tillämpbara på moln- och AI-roller  

#### Framgångsmått  
- **Distributionsframgång**: >95% lyckade distributioner  
- **Felsökningstid**: <30 minuter för vanliga problem  
- **Prestandaoptimering**: Påvisbara förbättringar i kostnad och prestanda  
- **Säkerhetsefterlevnad**: Alla distributioner uppfyller företagsstandarder  
- **Kunskapsöverföring**: Förmåga att handleda andra utvecklare  

### Kontinuerligt lärande och community-engagemang

#### Håll dig uppdaterad  
- **Azure-uppdateringar**: Följ release notes för Azure Developer CLI  
- **Community-evenemang**: Delta i Azure- och AI
- **Dokumentation**: Bidra till gemenskapsdokumentation och exempel  
- **Feedbackloop**: Ge feedback på kursinnehåll och Azure-tjänster  

#### Karriärutveckling  
- **Professionellt nätverk**: Anslut till Azure- och AI-experter  
- **Talarmöjligheter**: Presentera lärdomar på konferenser eller träffar  
- **Bidrag till öppen källkod**: Bidra till AZD-mallar och verktyg  
- **Mentorskap**: Vägled andra utvecklare i deras AZD-lärande  

---

**Kapitelnavigation:**  
- **📚 Kursens startsida**: [AZD För Nybörjare](../README.md)  
- **📖 Börja lära dig**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Framstegsspårning**: Följ din utveckling genom det omfattande 8-kapitels lärsystemet  
- **🤝 Gemenskap**: [Azure Discord](https://discord.gg/microsoft-azure) för stöd och diskussion  

**Studieframstegsspårning**: Använd denna strukturerade guide för att bemästra Azure Developer CLI genom progressivt, praktiskt lärande med mätbara resultat och fördelar för professionell utveckling.  

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell human översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som kan uppstå vid användning av denna översättning.