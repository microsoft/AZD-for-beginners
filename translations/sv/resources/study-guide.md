# Studievägledning - Omfattande Lärandemål

**Navigering i Lärandebanan**
- **📚 Kurshem**: [AZD För Nybörjare](../README.md)
- **📖 Börja Lära**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsspårning**: [Kursavslutning](../README.md#-course-completion--certification)

## Introduktion

Denna omfattande studievägledning ger strukturerade lärandemål, nyckelkoncept, praktiska övningar och bedömningsmaterial för att hjälpa dig att bemästra Azure Developer CLI (azd). Använd denna guide för att spåra dina framsteg och säkerställa att du täcker alla viktiga ämnen.

## Lärandemål

Genom att slutföra denna studievägledning kommer du att:
- Bemästra alla grundläggande och avancerade koncept inom Azure Developer CLI
- Utveckla praktiska färdigheter i att distribuera och hantera Azure-applikationer
- Bygga självförtroende i felsökning och optimering av distributioner
- Förstå produktionsklara distributionsmetoder och säkerhetsöverväganden

## Läranderesultat

Efter att ha slutfört alla avsnitt i denna studievägledning kommer du att kunna:
- Designa, distribuera och hantera kompletta applikationsarkitekturer med azd
- Implementera omfattande strategier för övervakning, säkerhet och kostnadsoptimering
- Felsöka komplexa distributionsproblem självständigt
- Skapa anpassade mallar och bidra till azd-communityn

## 8-Kapitels Lärandestruktur

### Kapitel 1: Grundläggande & Snabbstart (Vecka 1)
**Varaktighet**: 30-45 minuter | **Komplexitet**: ⭐

#### Lärandemål
- Förstå kärnkoncept och terminologi för Azure Developer CLI
- Installera och konfigurera AZD framgångsrikt på din utvecklingsplattform
- Distribuera din första applikation med hjälp av en befintlig mall
- Navigera effektivt i AZD:s kommandoradsgränssnitt

#### Nyckelkoncept att Bemästra
- AZD-projektstruktur och komponenter (azure.yaml, infra/, src/)
- Mallbaserade distributionsarbetsflöden
- Grundläggande miljökonfiguration
- Hantering av resursgrupper och prenumerationer

#### Praktiska Övningar
1. **Installationsverifiering**: Installera AZD och verifiera med `azd version`
2. **Första Distributionen**: Distribuera todo-nodejs-mongo-mallen framgångsrikt
3. **Miljöinställning**: Konfigurera dina första miljövariabler
4. **Resursutforskning**: Navigera distribuerade resurser i Azure-portalen

#### Bedömningsfrågor
- Vilka är kärnkomponenterna i ett AZD-projekt?
- Hur initierar du ett nytt projekt från en mall?
- Vad är skillnaden mellan `azd up` och `azd deploy`?
- Hur hanterar du flera miljöer med AZD?

---

### Kapitel 2: AI-Driven Utveckling (Vecka 2)
**Varaktighet**: 1-2 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Integrera Microsoft Foundry-tjänster med AZD-arbetsflöden
- Distribuera och konfigurera AI-drivna applikationer
- Förstå RAG (Retrieval-Augmented Generation) implementeringsmönster
- Hantera AI-modellens distributioner och skalning

#### Nyckelkoncept att Bemästra
- Integration av Azure OpenAI-tjänster och API-hantering
- Konfiguration av AI-sökning och vektorindexering
- Strategier för modellens distribution och kapacitetsplanering
- Övervakning och prestandaoptimering av AI-applikationer

#### Praktiska Övningar
1. **AI-Chattdistribution**: Distribuera azure-search-openai-demo-mallen
2. **RAG-Implementering**: Konfigurera dokumentindexering och hämtning
3. **Modellkonfiguration**: Ställ in flera AI-modeller med olika syften
4. **AI-Övervakning**: Implementera Application Insights för AI-arbetsbelastningar

#### Bedömningsfrågor
- Hur konfigurerar du Azure OpenAI-tjänster i en AZD-mall?
- Vilka är nyckelkomponenterna i en RAG-arkitektur?
- Hur hanterar du AI-modellens kapacitet och skalning?
- Vilka övervakningsmått är viktiga för AI-applikationer?

---

### Kapitel 3: Konfiguration & Autentisering (Vecka 3)
**Varaktighet**: 45-60 minuter | **Komplexitet**: ⭐⭐

#### Lärandemål
- Bemästra strategier för miljökonfiguration och hantering
- Implementera säkra autentiseringsmönster och hanterad identitet
- Organisera resurser med korrekta namngivningskonventioner
- Konfigurera distributioner för flera miljöer (dev, staging, prod)

#### Nyckelkoncept att Bemästra
- Miljöhierarki och konfigurationsprioritet
- Hanterad identitet och autentisering med tjänstens huvudnamn
- Integration av Key Vault för hantering av hemligheter
- Miljöspecifik parameterhantering

#### Praktiska Övningar
1. **Inställning för Flera Miljöer**: Konfigurera dev-, staging- och prod-miljöer
2. **Säkerhetskonfiguration**: Implementera autentisering med hanterad identitet
3. **Hantera Hemligheter**: Integrera Azure Key Vault för känslig data
4. **Parameterhantering**: Skapa miljöspecifika konfigurationer

#### Bedömningsfrågor
- Hur konfigurerar du olika miljöer med AZD?
- Vilka är fördelarna med att använda hanterad identitet över tjänstens huvudnamn?
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

- Distribuera containeriserade applikationer med Azure Container Apps och AZD

#### Nyckelkoncept att Bemästra
- Bicep-mallstruktur och bästa praxis
- Resursberoenden och distributionsordning
- Parameterfiler och mallmodularitet
- Anpassade hooks och distributionsautomatisering
- Distributionsmönster för containerapplikationer (snabbstart, produktion, mikrotjänster)

#### Praktiska Övningar
1. **Skapa Anpassad Mall**: Bygg en applikationsmall för flera tjänster
2. **Bicep-Mästerskap**: Skapa modulära, återanvändbara infrastrukturkomponenter
3. **Automatisering av Distribution**: Implementera pre/post-distributionshooks
4. **Arkitekturdesign**: Distribuera komplex mikrotjänstarkitektur
5. **Containerapplikationsdistribution**: Distribuera [Simple Flask API](../../../examples/container-app/simple-flask-api) och [Microservices Architecture](../../../examples/container-app/microservices) exempel med AZD

#### Bedömningsfrågor
- Hur skapar du anpassade Bicep-mallar för AZD?
- Vilka är bästa praxis för att organisera infrastrukturkod?
- Hur hanterar du resursberoenden i mallar?
- Vilka distributionsmönster stöder uppdateringar utan driftstopp?

---

### Kapitel 5: AI-Lösningar med Flera Agenter (Vecka 6-7)
**Varaktighet**: 2-3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Designa och implementera AI-arkitekturer med flera agenter
- Orkestrera agentkoordinering och kommunikation
- Distribuera produktionsklara AI-lösningar med övervakning
- Förstå agenters specialisering och arbetsflödesmönster
- Integrera containeriserade mikrotjänster som en del av lösningar med flera agenter

#### Nyckelkoncept att Bemästra
- Arkitekturmönster och designprinciper för flera agenter
- Kommunikationsprotokoll och dataflöde mellan agenter
- Lastbalansering och skalningsstrategier för AI-agenter
- Produktionsövervakning för system med flera agenter
- Kommunikation mellan tjänster i containeriserade miljöer

#### Praktiska Övningar
1. **Detaljhandelslösning**: Distribuera komplett detaljhandelscenario med flera agenter
2. **Agentanpassning**: Modifiera kund- och lageragenters beteenden
3. **Arkitekturskalning**: Implementera lastbalansering och autoskalning
4. **Produktionsövervakning**: Ställ in omfattande övervakning och varningar
5. **Integration av Mikrotjänster**: Utöka [Microservices Architecture](../../../examples/container-app/microservices) exemplet för att stödja arbetsflöden med flera agenter

#### Bedömningsfrågor
- Hur designar du effektiva kommunikationsmönster för flera agenter?
- Vilka är de viktigaste övervägandena för att skala AI-agenters arbetsbelastningar?
- Hur övervakar och felsöker du AI-system med flera agenter?
- Vilka produktionsmönster säkerställer tillförlitlighet för AI-agenter?

---

### Kapitel 6: Förvalidering & Planering av Distribution (Vecka 8)
**Varaktighet**: 1 timme | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utföra omfattande kapacitetsplanering och resursvalidering
- Välja optimala Azure-SKU:er för kostnadseffektivitet
- Implementera automatiserade förkontroller och validering
- Planera distributioner med kostnadsoptimeringsstrategier

#### Nyckelkoncept att Bemästra
- Azure-resurskvoter och kapacitetsbegränsningar
- Kriterier för SKU-val och kostnadsoptimering
- Automatiserade valideringsskript och testning
- Distributionsplanering och riskbedömning

#### Praktiska Övningar
1. **Kapacitetsanalys**: Analysera resurskrav för dina applikationer
2. **SKU-optimering**: Jämför och välj kostnadseffektiva tjänstenivåer
3. **Automatiserad Validering**: Implementera fördistributionskontrollskript
4. **Kostnadsplanering**: Skapa kostnadsuppskattningar och budgetar för distribution

#### Bedömningsfrågor
- Hur validerar du Azure-kapacitet före distribution?
- Vilka faktorer påverkar beslut om SKU-val?
- Hur automatiserar du förvalidering av distribution?
- Vilka strategier hjälper till att optimera distributionskostnader?

---

### Kapitel 7: Felsökning & Debugging (Vecka 9)
**Varaktighet**: 1-1,5 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utveckla systematiska felsökningsmetoder för AZD-distributioner
- Lösa vanliga distributions- och konfigurationsproblem
- Debugga AI-specifika problem och prestandafrågor
- Implementera övervakning och varningar för proaktiv problemupptäckt

#### Nyckelkoncept att Bemästra
- Diagnostiska tekniker och loggningsstrategier
- Vanliga felmönster och deras lösningar
- Prestandaövervakning och optimering
- Incidenthantering och återställningsprocedurer

#### Praktiska Övningar
1. **Diagnostiska Färdigheter**: Öva med avsiktligt trasiga distributioner
2. **Logganalys**: Använd Azure Monitor och Application Insights effektivt
3. **Prestandaoptimering**: Optimera långsamma applikationer
4. **Återställningsprocedurer**: Implementera backup och katastrofåterställning

#### Bedömningsfrågor
- Vilka är de vanligaste AZD-distributionsfelen?
- Hur felsöker du autentiserings- och behörighetsproblem?
- Vilka övervakningsstrategier hjälper till att förhindra produktionsproblem?
- Hur optimerar du applikationsprestanda i Azure?

---

### Kapitel 8: Produktions- & Företagsmönster (Vecka 10-11)
**Varaktighet**: 2-3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Implementera distributionsstrategier på företagsnivå
- Designa säkerhetsmönster och efterlevnadsramverk
- Etablera övervakning, styrning och kostnadshantering
- Skapa skalbara CI/CD-pipelines med AZD-integration
- Tillämpa bästa praxis för produktionsdistribution av containerapplikationer (säkerhet, övervakning, kostnad, CI/CD)

#### Nyckelkoncept att Bemästra
- Säkerhets- och efterlevnadskrav på företagsnivå
- Styrningsramverk och policyimplementering
- Avancerad övervakning och kostnadshantering
- CI/CD-integration och automatiserade distributionspipelines
- Blue-green och canary-distributionsstrategier för containeriserade arbetsbelastningar

#### Praktiska Övningar
1. **Företagssäkerhet**: Implementera omfattande säkerhetsmönster
2. **Styrningsramverk**: Ställ in Azure Policy och resursstyrning
3. **Avancerad Övervakning**: Skapa dashboards och automatiserade varningar
4. **CI/CD-Integration**: Bygg automatiserade distributionspipelines
5. **Produktionscontainerapplikationer**: Tillämpa säkerhet, övervakning och kostnadsoptimering på [Microservices Architecture](../../../examples/container-app/microservices) exemplet

#### Bedömningsfrågor
- Hur implementerar du företagssäkerhet i AZD-distributioner?
- Vilka styrningsmönster säkerställer efterlevnad och kostnadskontroll?
- Hur designar du skalbar övervakning för produktionssystem?
- Vilka CI/CD-mönster fungerar bäst med AZD-arbetsflöden?

#### Lärandemål
- Förstå grunderna och kärnkoncepten i Azure Developer CLI
- Installera och konfigurera azd framgångsrikt i din utvecklingsmiljö
- Slutföra din första distribution med hjälp av en befintlig mall
- Navigera i azd-projektstrukturen och förstå nyckelkomponenter

#### Nyckelkoncept att Bemästra
- Mallar, miljöer och tjänster
- azure.yaml-konfigurationsstruktur
- Grundläggande azd-kommandon (init, up, down, deploy)
- Principer för Infrastruktur som Kod
- Azure-autentisering och -auktorisering

#### Praktiska Övningar

**Övning 1.1: Installation och Inställning**
```bash
# Slutför dessa uppgifter:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Övning 1.2: Första Distributionen**
```bash
# Distribuera en enkel webbapplikation:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Övning 1.3: Analys av Projektstruktur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Självbedömningsfrågor
1. Vilka är de tre kärnkoncepten i azd-arkitekturen?
2. Vad är syftet med azure.yaml-filen?
3. Hur hjälper miljöer till att hantera olika distributionsmål?
4. Vilka autentiseringsmetoder kan användas med azd?
5. Vad händer när du kör `azd up` för första gången?

---

## Framstegsspårning och Bedömningsramverk
```bash
# Skapa och konfigurera flera miljöer:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Övning 2.2: Avancerad Konfiguration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Övning 2.3: Säkerhetskonfiguration**
```bash
# Implementera bästa praxis för säkerhet:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Självbedömningsfrågor
1. Hur hanterar azd prioritet för miljövariabler?
2. Vad är distributionshooks och när bör du använda dem?
3. Hur konfigurerar du olika SKU:er för olika miljöer?
4. Vilka säkerhetsimplikationer har olika autentiseringsmetoder?
5. Hur hanterar du hemligheter och känslig konfigurationsdata?

### Modul 3: Distribution och Försörjning (Vecka 4)

#### Lärandemål
- Bemästra distributionsarbetsflöden och bästa praxis
- Förstå Infrastruktur som Kod med Bicep-mallar
- Implementera komplexa arkitekturer för flera tjänster
- Optimera distributionsprestanda och tillförlitlighet

#### Nyckelkoncept att Bemästra
- Bicep-mallstruktur och moduler
- Resursberoenden och ordning
- Distributionsstrategier (blue-green, rullande uppdateringar)
- Distributioner i flera regioner
- Databasmigreringar och datahantering

#### Praktiska Övningar

**Övning 3.1: Anpassad Infrastruktur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Övning 3.2: Applikation med Flera Tjänster**
```bash
# Distribuera en mikrotjänstarkitektur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Övning 3.3: Databasintegration**

5. Vilka överväganden finns för distributioner i flera regioner?

### Modul 4: Validering före distribution (Vecka 5)

#### Lärandemål
- Utföra omfattande kontroller före distribution
- Bemästra kapacitetsplanering och resursvalidering
- Förstå SKU-val och kostnadsoptimering
- Bygga automatiserade valideringspipelines

#### Viktiga koncept att bemästra
- Azure-resurskvoter och gränser
- Kriterier för SKU-val och kostnadseffekter
- Automatiserade valideringsskript och verktyg
- Metoder för kapacitetsplanering
- Prestandatestning och optimering

#### Övningar

**Övning 4.1: Kapacitetsplanering**
```bash
# Implementera kapacitetsvalidering:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Övning 4.2: Validering före start**
```powershell
# Bygg en omfattande valideringspipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Övning 4.3: SKU-optimering**
```bash
# Optimera tjänstkonfigurationer:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Självbedömningsfrågor
1. Vilka faktorer bör påverka beslut om SKU-val?
2. Hur validerar du tillgängligheten av Azure-resurser före distribution?
3. Vilka är de viktigaste komponenterna i ett system för kontroll före start?
4. Hur uppskattar och kontrollerar du distributionskostnader?
5. Vilken övervakning är avgörande för kapacitetsplanering?

### Modul 5: Felsökning och debugging (Vecka 6)

#### Lärandemål
- Bemästra systematiska felsökningsmetoder
- Utveckla expertis i att debugga komplexa distributionsproblem
- Implementera omfattande övervakning och larm
- Bygga incidenthantering och återställningsprocedurer

#### Viktiga koncept att bemästra
- Vanliga mönster för distributionsfel
- Logganalys och korrelationstekniker
- Prestandaövervakning och optimering
- Upptäckt och hantering av säkerhetsincidenter
- Katastrofåterställning och affärskontinuitet

#### Övningar

**Övning 5.1: Felsökningsscenarier**
```bash
# Öva på att lösa vanliga problem:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Övning 5.2: Implementering av övervakning**
```bash
# Ställ in omfattande övervakning:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Övning 5.3: Incidenthantering**
```bash
# Bygg incidenthanteringsprocedurer:
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
4. Hur implementerar du effektiva katastrofåterställningsprocedurer?
5. Vilka är de viktigaste komponenterna i en incidenthanteringsplan?

### Modul 6: Avancerade ämnen och bästa praxis (Vecka 7-8)

#### Lärandemål
- Implementera distributionsmönster på företagsnivå
- Bemästra CI/CD-integration och automatisering
- Utveckla anpassade mallar och bidra till communityn
- Förstå avancerade säkerhets- och efterlevnadskrav

#### Viktiga koncept att bemästra
- Integrationsmönster för CI/CD-pipelines
- Utveckling och distribution av anpassade mallar
- Företagsstyrning och efterlevnad
- Avancerade nätverks- och säkerhetskonfigurationer
- Prestandaoptimering och kostnadshantering

#### Övningar

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
# Skapa och publicera anpassade mallar:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Övning 6.3: Implementering på företagsnivå**
```bash
# Implementera företagsklassade funktioner:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Självbedömningsfrågor
1. Hur integrerar du azd i befintliga CI/CD-arbetsflöden?
2. Vilka är de viktigaste övervägandena för utveckling av anpassade mallar?
3. Hur implementerar du styrning och efterlevnad i azd-distributioner?
4. Vilka är bästa praxis för distributioner i företagsmiljöer?
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
- React frontend distribuerad till App Service
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
- Integrering av meddelandekö med Service Bus
- Redis-cache för prestandaoptimering
- Omfattande loggning och övervakning

**Referensexempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) för en produktionsklar mall och distributionsguide

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
- Övningar i att felsöka konfigurationer
- Implementering av säkerhetskonfigurationer

**Modul 3 Bedömning**: Distribution och provisionering
- Utmaningar i infrastrukturdesign
- Scenarier för distribution av flera tjänster
- Övningar i prestandaoptimering

**Modul 4 Bedömning**: Validering före distribution
- Fallstudier i kapacitetsplanering
- Scenarier för kostnadsoptimering
- Implementering av valideringspipelines

**Modul 5 Bedömning**: Felsökning och debugging
- Övningar i problemdiagnos
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
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-resurser
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
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
- **Vecka 1-2**: Modul 1-2 (Komma igång, Konfiguration)
- **Vecka 3-4**: Modul 3-4 (Distribution, Validering före distribution)
- **Vecka 5-6**: Modul 5-6 (Felsökning, Avancerade ämnen)
- **Vecka 7-8**: Praktiska projekt och slutbedömning

### Deltidsstudier (16 veckor)
- **Vecka 1-4**: Modul 1 (Komma igång)
- **Vecka 5-7**: Modul 2 (Konfiguration och miljöer)
- **Vecka 8-10**: Modul 3 (Distribution och provisionering)
- **Vecka 11-12**: Modul 4 (Validering före distribution)
- **Vecka 13-14**: Modul 5 (Felsökning och debugging)
- **Vecka 15-16**: Modul 6 (Avancerade ämnen och bedömning)

---

## Framstegsspårning och bedömningsramverk

### Kapitelavslutningschecklista

Spåra din framgång genom varje kapitel med dessa mätbara resultat:

#### 📚 Kapitel 1: Grundläggande & Snabbstart
- [ ] **Installation klar**: AZD installerat och verifierat på din plattform
- [ ] **Första distributionen**: Lyckad distribution av todo-nodejs-mongo-mallen
- [ ] **Miljöinställning**: Konfigurerade första miljövariabler
- [ ] **Resursnavigering**: Utforskade distribuerade resurser i Azure Portal
- [ ] **Kommandokunskap**: Bekväm med grundläggande AZD-kommandon

#### 🤖 Kapitel 2: AI-först utveckling  
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
- [ ] **Skapande av anpassad mall**: Byggde en applikationsmall för flera tjänster
- [ ] **Bicep-kunskap**: Skapade modulära, återanvändbara infrastrukturkomponenter
- [ ] **Automatisering av distribution**: Implementerade pre/post-distributionshooks
- [ ] **Arkitekturdesign**: Distribuerade komplex mikrotjänstarkitektur
- [ ] **Malloptimering**: Optimerade mallar för prestanda och kostnad

#### 🎯 Kapitel 5: Multi-agent AI-lösningar
- [ ] **Distribution av detaljhandelslösning**: Distribuerade komplett multi-agent detaljhandelsscenario
- [ ] **Agentanpassning**: Modifierade beteenden för kund- och lageragenter
- [ ] **Skalning av arkitektur**: Implementerade lastbalansering och autoskalning
- [ ] **Produktionsövervakning**: Ställde in omfattande övervakning och larm
- [ ] **Prestandajustering**: Optimerade prestanda för multi-agent-system

#### 🔍 Kapitel 6: Validering före distribution & Planering
- [ ] **Kapacitetsanalys**: Analyserade resurskrav för applikationer
- [ ] **SKU-optimering**: Valde kostnadseffektiva tjänstenivåer
- [ ] **Automatisering av validering**: Implementerade skript för kontroller före distribution
- [ ] **Kostnadsplanering**: Skapade kostnadsuppskattningar och budgetar för distribution
- [ ] **Riskbedömning**: Identifierade och minimerade distributionsrisker

#### 🚨 Kapitel 7: Felsökning & Debugging
- [ ] **Diagnostiska färdigheter**: Lyckades debugga avsiktligt trasiga distributioner
- [ ] **Logganalys**: Använde Azure Monitor och Application Insights effektivt
- [ ] **Prestandajustering**: Optimerade långsamma applikationer
- [ ] **Återställningsprocedurer**: Implementerade backup och katastrofåterställning
- [ ] **Övervakningsinställning**: Skapade proaktiv övervakning och larm

#### 🏢 Kapitel 8: Produktion & Företagsmönster
- [ ] **Företagssäkerhet**: Implementerade omfattande säkerhetsmönster
- [ ] **Styrningsramverk**: Ställde in Azure Policy och resursstyrning
- [ ] **Avancerad övervakning**: Skapade paneler och automatiserade larm
- [ ] **CI/CD-integration**: Byggde automatiserade distributionspipelines
- [ ] **Efterlevnadsimplementering**: Uppfyllde företagskrav på efterlevnad

### Lärandets tidslinje och milstolpar

#### Vecka 1-2: Grundläggande byggstenar
- **Milstolpe**: Distribuera första AI-applikationen med AZD
- **Validering**: Fungerande applikation tillgänglig via offentlig URL
- **Färdigheter**: Grundläggande AZD-arbetsflöden och AI-tjänsteintegration

#### Vecka 3-4: Bemästra konfiguration
- **Milstolpe**: Distribution i flera miljöer med säker autentisering
- **Validering**: Samma applikation distribuerad till utveckling/test/produktion
- **Färdigheter**: Miljöhantering och säkerhetsimplementering

#### Vecka 5-6: Infrastrukturkunskap
- **Milstolpe**: Anpassad mall för komplex applikation med flera tjänster
- **Validering**: Återanvändbar mall distribuerad av en annan teammedlem
- **Färdigheter**: Bicep-kunskap och automatisering av infrastruktur

#### Vecka 7-8: Avancerad AI-implementering
- **Milstolpe**: Produktionsklar multi-agent AI-lösning
- **Validering**: System som hanterar verklig belastning med övervakning
- **Färdigheter**: Multi-agent orkestrering och prestandaoptimering

#### Vecka 9-10: Produktionsberedskap
- **Milstolpe**: Företagsklassad distribution med full efterlevnad
- **Validering**: Godkänd säkerhetsgranskning och kostnadsoptimeringsrevision
- **Färdigheter**: Styrning, övervakning och CI/CD-integration

### Bedömning och certifiering

#### Metoder för kunskapsvalidering
1. **Praktiska distributioner**: Fungerande applikationer för varje kapitel
2. **Kodgranskningar**: Bedömning av mall- och konfigurationskvalitet
3. **Problemlösning**: Felsökningsscenarier och lösningar
4. **Peer-undervisning**: Förklara koncept för andra elever
5. **Gemenskapsbidrag**: Dela mallar eller förbättringar

#### Professionella utvecklingsresultat
- **Portföljprojekt**: 8 produktionsklara implementationer
- **Tekniska färdigheter**: Branschstandard inom AZD och AI-implementering
- **Problemlösningsförmåga**: Självständig felsökning och optimering
- **Gemenskapsigenkänning**: Aktivt deltagande i Azure-utvecklargemenskapen
- **Karriärutveckling**: Färdigheter direkt tillämpbara på moln- och AI-roller

#### Framgångsmått
- **Implementeringsframgång**: >95% lyckade implementationer
- **Felsökningstid**: <30 minuter för vanliga problem
- **Prestandaoptimering**: Påvisbara förbättringar i kostnad och prestanda
- **Säkerhetsöverensstämmelse**: Alla implementationer uppfyller företags säkerhetsstandarder
- **Kunskapsöverföring**: Förmåga att handleda andra utvecklare

### Kontinuerligt lärande och engagemang i gemenskapen

#### Håll dig uppdaterad
- **Azure-uppdateringar**: Följ release notes för Azure Developer CLI
- **Gemenskapsevenemang**: Delta i Azure- och AI-utvecklarevenemang
- **Dokumentation**: Bidra till gemenskapsdokumentation och exempel
- **Feedbackloop**: Ge feedback på kursinnehåll och Azure-tjänster

#### Karriärutveckling
- **Professionellt nätverk**: Anslut med experter inom Azure och AI
- **Föreläsningsmöjligheter**: Presentera lärdomar på konferenser eller meetups
- **Öppen källkod-bidrag**: Bidra till AZD-mallar och verktyg
- **Mentorskap**: Vägled andra utvecklare i deras AZD-läranderesa

---

**Kapitelöversikt:**
- **📚 Kurshem**: [AZD För Nybörjare](../README.md)
- **📖 Börja Lära**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsspårning**: Följ din utveckling genom det omfattande 8-kapitels inlärningssystemet
- **🤝 Gemenskap**: [Azure Discord](https://discord.gg/microsoft-azure) för support och diskussion

**Studieframstegsspårning**: Använd denna strukturerade guide för att bemästra Azure Developer CLI genom progressivt, praktiskt lärande med mätbara resultat och professionella utvecklingsfördelar.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->