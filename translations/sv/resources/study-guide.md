# Studieguide - Omfattande lärandemål

**Navigering i lärvägen**
- **📚 Kurshemsida**: [AZD för nybörjare](../README.md)
- **📖 Börja lära**: [Kapitel 1: Grund & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsuppföljning**: [Kursavslutning](../README.md#-course-completion--certification)

## Inledning

Denna omfattande studieguide erbjuder strukturerade lärandemål, nyckelbegrepp, övningsuppgifter och bedömningsmaterial för att hjälpa dig bemästra Azure Developer CLI (azd). Använd denna guide för att följa din framsteg och säkerställa att du täckt alla väsentliga ämnen.

## Lärandemål

Genom att slutföra denna studieguide kommer du att:
- Behärska alla grundläggande och avancerade koncept för Azure Developer CLI
- Utveckla praktiska färdigheter i att distribuera och hantera Azure-applikationer
- Bygga självförtroende i felsökning och optimering av distributioner
- Förstå produktionsklara distributionsrutiner och säkerhetsaspekter

## Läranderesultat

Efter att ha slutfört alla avsnitt i denna studieguide kommer du att kunna:
- Designa, distribuera och hantera kompletta applikationsarkitekturer med hjälp av azd
- Implementera omfattande övervaknings-, säkerhets- och kostnadsoptimeringsstrategier
- Felsöka komplexa distributionsproblem självständigt
- Skapa egna mallar och bidra till azd-communityn

## 8-kapitel lärstruktur

### Kapitel 1: Grund & Snabbstart (Vecka 1)
**Varaktighet**: 30–45 minuter | **Komplexitet**: ⭐

#### Lärandemål
- Förstå Azure Developer CLI:s kärnkoncept och terminologi
- Installera och konfigurera AZD framgångsrikt på din utvecklingsplattform
- Distribuera din första applikation med en befintlig mall
- Navigera effektivt i AZD-kommandoradsgränssnittet

#### Viktiga begrepp att behärska
- AZD-projektstruktur och komponenter (azure.yaml, infra/, src/)
- Mallbaserade distributionsarbetsflöden
- Grundläggande miljökonfiguration
- Hantering av resursgrupper och prenumerationer

#### Praktiska övningar
1. **Verifiering av installation**: Installera AZD och verifiera med `azd version`
2. **Första distributionen**: Distribuera mallen todo-nodejs-mongo framgångsrikt
3. **Miljöinställning**: Konfigurera dina första miljövariabler
4. **Utforska resurser**: Navigera i distribuerade resurser i Azure-portalen

#### Bedömningsfrågor
- Vilka är kärnkomponenterna i ett AZD-projekt?
- Hur initierar du ett nytt projekt från en mall?
- Vad är skillnaden mellan `azd up` och `azd deploy`?
- Hur hanterar du flera miljöer med AZD?

---

### Kapitel 2: AI-First Development (Vecka 2)
**Varaktighet**: 1–2 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Integrera Microsoft Foundry-tjänster med AZD-arbetsflöden
- Distribuera och konfigurera AI-drivna applikationer
- Förstå RAG (Retrieval-Augmented Generation) implementationsmönster
- Hantera distribution och skalning av AI-modeller

#### Viktiga begrepp att behärska
- Microsoft Foundry Models-tjänsteintegration och API-hantering
- AI Search-konfiguration och vektorindexering
- Strategier för modellutplacering och kapacitetsplanering
- Övervakning av AI-applikationer och prestandaoptimering

#### Praktiska övningar
1. **AI-chattdistribution**: Distribuera mallen azure-search-openai-demo
2. **RAG-implementation**: Konfigurera dokumentindexering och hämtning
3. **Modellkonfiguration**: Ställ in flera AI-modeller för olika ändamål
4. **AI-övervakning**: Implementera Application Insights för AI-arbetsbelastningar

#### Bedömningsfrågor
- Hur konfigurerar du Microsoft Foundry Models-tjänster i en AZD-mall?
- Vilka är nyckelkomponenterna i en RAG-arkitektur?
- Hur hanterar du kapacitet och skalning för AI-modeller?
- Vilka övervakningsmått är viktiga för AI-applikationer?

---

### Kapitel 3: Configuration & Authentication (Vecka 3)
**Varaktighet**: 45–60 minuter | **Komplexitet**: ⭐⭐

#### Lärandemål
- Behärska strategier för miljökonfiguration och hantering
- Implementera säkra autentiseringsmönster och managed identity
- Organisera resurser med korrekta namngivningskonventioner
- Konfigurera multi-miljödistribueringar (dev, staging, prod)

#### Viktiga begrepp att behärska
- Miljöhierarki och konfigurationsprioritering
- Managed identity och service principal-autentisering
- Key Vault-integration för hantering av hemligheter
- Miljöspecifik parameterhantering

#### Praktiska övningar
1. **Multi-miljöinställning**: Konfigurera dev-, staging- och prod-miljöer
2. **Säkerhetskonfiguration**: Implementera autentisering med managed identity
3. **Hantering av hemligheter**: Integrera Azure Key Vault för känslig data
4. **Parameterhantering**: Skapa miljöspecifika konfigurationer

#### Bedömningsfrågor
- Hur konfigurerar du olika miljöer med AZD?
- Vilka fördelar finns med att använda managed identity jämfört med service principals?
- Hur hanterar du applikationshemligheter på ett säkert sätt?
- Vad är konfigurationshierarkin i AZD?

---

### Kapitel 4: Infrastructure as Code & Deployment (Vecka 4-5)
**Varaktighet**: 1–1.5 timmar | **Komplexitet**: ⭐⭐⭐

#### Lärandemål
- Skapa och anpassa Bicep-infrastrukturmallar
- Implementera avancerade distributionsmönster och arbetsflöden
- Förstå strategier för resursprovisionering
- Designa skalbara flertjänstarkitekturer

- Distribuera containeriserade applikationer med Azure Container Apps och AZD


#### Viktiga begrepp att behärska
- Bicep-mallstruktur och bästa praxis
- Resursberoenden och distributionsordning
- Parameterfiler och mallmodularitet
- Anpassade hooks och distributionsautomatisering
- Mönster för distribution av containerappar (snabbstart, produktion, mikrotjänster)

#### Praktiska övningar
1. **Skapa anpassad mall**: Bygg en mall för en flertjänstapplikation
2. **Bicep-mästerskap**: Skapa modulära, återanvändbara infrastrukturskomponenter
3. **Distributionsautomatisering**: Implementera pre/post-distributionshooks
4. **Arkitekturdesign**: Distribuera en komplex mikrotjänstarkitektur
5. **Containerapp-distribution**: Distribuera [Simple Flask API](../../../examples/container-app/simple-flask-api) och [Microservices Architecture](../../../examples/container-app/microservices) exemplen med AZD

#### Bedömningsfrågor
- Hur skapar du anpassade Bicep-mallar för AZD?
- Vilka är bästa metoderna för att organisera infrastrukturkod?
- Hur hanterar du resursberoenden i mallar?
- Vilka distributionsmönster stödjer uppdateringar utan driftstopp?

---

### Kapitel 5: Multi-Agent AI Solutions (Vecka 6-7)
**Varaktighet**: 2–3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Designa och implementera multi-agent AI-arkitekturer
- Orkestrera agentkoordinering och kommunikation
- Distribuera produktionsklara AI-lösningar med övervakning
- Förstå agent-specialisering och arbetsflödesmönster
- Integrera containeriserade mikrotjänster som en del av multi-agentlösningar

#### Viktiga begrepp att behärska
- Multi-agent arkitekturmönster och designprinciper
- Agentkommunikationsprotokoll och dataflöde
- Lastbalansering och skalningsstrategier för AI-agenter
- Produktionsövervakning för multi-agent-system
- Tjänst-till-tjänst-kommunikation i containeriserade miljöer

#### Praktiska övningar
1. **Retail-lösningsdistribution**: Distribuera det kompletta multi-agent retail-scenariot
2. **Agentanpassning**: Modifiera kund- och lageragentsbeteenden
3. **Arkitektonisk skalning**: Implementera lastbalansering och autoskalning
4. **Produktionövervakning**: Sätt upp omfattande övervakning och larm
5. **Mikrotjänstintegration**: Utöka [Microservices Architecture](../../../examples/container-app/microservices) exemplet för att stödja agentbaserade arbetsflöden

#### Bedömningsfrågor
- Hur designar du effektiva kommunikationsmönster för multi-agenter?
- Vilka är nyckelövervägandena för att skala AI-agentarbetsbelastningar?
- Hur övervakar och felsöker du multi-agent AI-system?
- Vilka produktionsmönster säkerställer tillförlitlighet för AI-agenter?

---

### Kapitel 6: Pre-Deployment Validation & Planning (Vecka 8)
**Varaktighet**: 1 timme | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utföra omfattande kapacitetsplanering och resursvalidering
- Välja optimala Azure-SKU:er för kostnadseffektivitet
- Implementera automatiserade pre-flight-kontroller och validering
- Planera distributioner med kostnadsoptimeringsstrategier

#### Viktiga begrepp att behärska
- Azure-resurskvoter och kapacitetsbegränsningar
- Kriterier för SKU-val och kostnadsoptimering
- Automatiserade valideringsskript och testning
- Distributionsplanering och riskbedömning

#### Praktiska övningar
1. **Kapacitetsanalys**: Analysera resursbehov för dina applikationer
2. **SKU-optimering**: Jämför och välj kostnadseffektiva tjänsteplaner
3. **Valideringsautomatisering**: Implementera pre-distributionskontrollskript
4. **Kostnadsplanering**: Skapa kostnadsberäkningar och budgetar för distribution

#### Bedömningsfrågor
- Hur validerar du Azure-kapacitet innan distribution?
- Vilka faktorer påverkar beslut om SKU-val?
- Hur automatiserar du pre-distributionsvalidering?
- Vilka strategier hjälper till att optimera distributionskostnader?

---

### Kapitel 7: Troubleshooting & Debugging (Vecka 9)
**Varaktighet**: 1–1.5 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utveckla systematiska felsökningsmetoder för AZD-distributioner
- Lösa vanliga distributions- och konfigurationsproblem
- Felsöka AI-specifika problem och prestandafrågor
- Implementera övervakning och larm för proaktiv upptäckt av problem

#### Viktiga begrepp att behärska
- Diagnostiska tekniker och loggningsstrategier
- Vanliga felmönster och deras lösningar
- Prestandaövervakning och optimering
- Incidentrespons och återställningsprocedurer

#### Praktiska övningar
1. **Diagnostiska färdigheter**: Öva med avsiktligt förstörda distributioner
2. **Logganalys**: Använd Azure Monitor och Application Insights effektivt
3. **Prestandatuning**: Optimera långsamt presterande applikationer
4. **Återställningsprocedurer**: Implementera backup och katastrofåterställning

#### Bedömningsfrågor
- Vilka är de vanligaste AZD-distributionsfelen?
- Hur felsöker du autentiserings- och behörighetsproblem?
- Vilka övervakningsstrategier hjälper till att förhindra produktionsproblem?
- Hur optimerar du applikationsprestanda i Azure?

---

### Kapitel 8: Production & Enterprise Patterns (Vecka 10-11)
**Varaktighet**: 2–3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Implementera företagsklassade distributionsstrategier
- Designa säkerhetsmönster och ramverk för efterlevnad
- Etablera övervakning, styrning och kostnadshantering
- Skapa skalbara CI/CD-pipelines med AZD-integration
- Tillämpa bästa praxis för produktion av containerappar (säkerhet, övervakning, kostnad, CI/CD)

#### Viktiga begrepp att behärska
- Företagssäkerhet och krav för efterlevnad
- Styrningsramverk och policyimplementering
- Avancerad övervakning och kostnadshantering
- CI/CD-integration och automatiserade distributionspipelines
- Blue-green och canary-distributionstrategier för containeriserade arbetsbelastningar

#### Praktiska övningar
1. **Företagssäkerhet**: Implementera omfattande säkerhetsmönster
2. **Styrningsramverk**: Sätt upp Azure Policy och resursförvaltning
3. **Avancerad övervakning**: Skapa instrumentpaneler och automatiserade larm
4. **CI/CD-integration**: Bygg automatiserade distributionspipelines
5. **Produktionscontainerappar**: Tillämpa säkerhet, övervakning och kostnadsoptimering på [Microservices Architecture](../../../examples/container-app/microservices) exemplet

#### Bedömningsfrågor
- Hur implementerar du företagsäkerhet i AZD-distributioner?
- Vilka styrningsmönster säkerställer efterlevnad och kostnadskontroll?
- Hur designar du skalbar övervakning för produktionssystem?
- Vilka CI/CD-mönster fungerar bäst med AZD-arbetsflöden?

#### Lärandemål
- Förstå Azure Developer CLI-grunder och kärnkoncept
- Installera och konfigurera azd framgångsrikt i din utvecklingsmiljö
- Slutföra din första distribution med en befintlig mall
- Navigera i azd-projektstrukturen och förstå nyckelkomponenter

#### Viktiga begrepp att behärska
- Mallar, miljöer och tjänster
- azure.yaml konfigurationsstruktur
- Grundläggande azd-kommandon (init, up, down, deploy)
- Principer för Infrastructure as Code
- Azure-autentisering och auktorisation

#### Practice Exercises

**Exercise 1.1: Installation and Setup**
```bash
# Slutför dessa uppgifter:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# Distribuera en enkel webbapplikation:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Project Structure Analysis**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Self-Assessment Questions
1. What are the three core concepts of azd architecture?
2. What is the purpose of the azure.yaml file?
3. How do environments help manage different deployment targets?
4. What authentication methods can be used with azd?
5. What happens when you run `azd up` for the first time?

---

## Framstegsuppföljning och bedömningsramverk
```bash
# Skapa och konfigurera flera miljöer:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercise 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercise 2.3: Security Configuration**
```bash
# Implementera bästa praxis för säkerhet:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Self-Assessment Questions
1. How does azd handle environment variable precedence?
2. What are deployment hooks and when should you use them?
3. How do you configure different SKUs for different environments?
4. What are the security implications of different authentication methods?
5. How do you manage secrets and sensitive configuration data?

### Modul 3: Distribution och provisionering (Vecka 4)

#### Lärandemål
- Behärska distributionsarbetsflöden och bästa praxis
- Förstå Infrastructure as Code med Bicep-mallar
- Implementera komplexa flertjänstarkitekturer
- Optimera distributionsprestanda och tillförlitlighet

#### Viktiga begrepp att behärska
- Bicep-mallstruktur och moduler
- Resursberoenden och ordning vid distribution
- Distributionsstrategier (blue-green, rolling updates)
- Distribution i flera regioner
- Databasmigrationer och datamanagement

#### Practice Exercises

**Exercise 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercise 3.2: Multi-Service Application**
```bash
# Distribuera en mikrotjänstarkitektur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# Implementera mönster för driftsättning av databaser:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Self-Assessment Questions
1. What are the advantages of using Bicep over ARM templates?
2. How do you handle database migrations in azd deployments?
3. What strategies exist for zero-downtime deployments?
4. How do you manage dependencies between services?
5. What are the considerations for multi-region deployments?

### Modul 4: Pre-Deployment Validation (Vecka 5)

#### Lärandemål
- Implementera omfattande kontroller före driftsättning
- Bemästra kapacitetsplanering och validering av resurser
- Förstå val av SKU och kostnadsoptimering
- Bygg automatiserade valideringspipelines

#### Viktiga begrepp att behärska
- Azure-resurskvoter och begränsningar
- Kriterier för val av SKU och kostnadskonsekvenser
- Automatiserade valideringsskript och verktyg
- Metodologier för kapacitetsplanering
- Prestandatestning och optimering

#### Övningsuppgifter

**Exercise 4.1: Capacity Planning**
```bash
# Implementera kapacitetsvalidering:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Bygg en omfattande valideringspipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Optimera tjänstkonfigurationer:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Självbedömningsfrågor
1. Vilka faktorer bör påverka beslut om val av SKU?
2. Hur validerar du Azure-resurstillgänglighet före driftsättning?
3. Vilka är de viktigaste komponenterna i ett system för förkontroller?
4. Hur uppskattar och kontrollerar du driftsättningskostnader?
5. Vilken övervakning är avgörande för kapacitetsplanering?

### Modul 5: Felsökning och debugging (Vecka 6)

#### Lärandemål
- Bemästra systematiska felsökningsmetodiker
- Utveckla expertis i att debugga komplexa driftsättningsproblem
- Implementera omfattande övervakning och larm
- Bygga rutiner för incidenthantering och återställning

#### Viktiga begrepp att behärska
- Vanliga mönster vid driftsättningsfel
- Logganalys och korrelationstekniker
- Prestandaövervakning och optimering
- Säkerhetsincidentdetektion och respons
- Katastrofåterställning och kontinuitet i verksamheten

#### Övningsuppgifter

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Öva på att lösa vanliga problem:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Ställ in omfattande övervakning:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Ta fram rutiner för incidenthantering:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Självbedömningsfrågor
1. Vad är det systematiska tillvägagångssättet för felsökning av azd-distributioner?
2. Hur korrelerar du loggar över flera tjänster och resurser?
3. Vilka övervakningsmått är mest kritiska för tidig problemupptäckt?
4. Hur implementerar du effektiva rutiner för katastrofåterställning?
5. Vilka är nyckelkomponenterna i en incidenthanteringsplan?

### Modul 6: Avancerade ämnen och bästa praxis (Vecka 7-8)

#### Lärandemål
- Implementera företagsklassade driftsättningsmönster
- Bemästra CI/CD-integration och automatisering
- Utveckla anpassade mallar och bidra till communityn
- Förstå avancerade säkerhets- och efterlevnadskrav

#### Viktiga begrepp att behärska
- Mönster för CI/CD-pipelineintegration
- Utveckling och distribution av anpassade mallar
- Företagsstyrning och efterlevnad
- Avancerade nätverks- och säkerhetskonfigurationer
- Prestandaoptimering och kostnadshantering

#### Övningsuppgifter

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Skapa och publicera anpassade mallar:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Implementera funktioner i företagsklass:
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
4. Vilka är bästa praxis för driftsättning i företagsomfattning?
5. Hur bidrar du effektivt till azd-communityn?

## Praktiska projekt

### Projekt 1: Personlig portföljwebbplats
**Komplexitet**: Nybörjare  
**Varaktighet**: 1–2 veckor

Bygg och driftsätt en personlig portföljwebbplats med:
- Statisk webbhosting på Azure Storage
- Konfiguration av anpassad domän
- CDN-integration för global prestanda
- Automatiserad driftsättningspipeline

**Leverabler**:
- Fungerande webbplats driftsatt på Azure
- Anpassad azd-mall för portföljdriftsättningar
- Dokumentation av driftsättningsprocessen
- Kostnadsanalys och optimeringsrekommendationer

### Projekt 2: Uppgiftshanteringsapplikation
**Komplexitet**: Medel  
**Varaktighet**: 2–3 veckor

Skapa en fullstack uppgiftshanteringsapplikation med:
- React-frontend driftsatt på App Service
- Node.js API-backend med autentisering
- PostgreSQL-databas med migrationsskript
- Application Insights-övervakning

**Leverabler**:
- Komplett applikation med användarautentisering
- Databasschema och migrationsskript
- Övervakningsinstrumentpaneler och larmregler
- Konfiguration för driftsättning i flera miljöer

### Projekt 3: Mikrotjänstbaserad e-handelsplattform
**Komplexitet**: Avancerad  
**Varaktighet**: 4–6 veckor

Designa och implementera en mikrotjänstbaserad e-handelsplattform:
- Flera API-tjänster (katalog, beställningar, betalningar, användare)
- Meddelandeköintegration med Service Bus
- Redis-cache för prestandaoptimering
- Omfattande loggning och övervakning

**Referensexempel**: Se [Mikrotjänstarkitektur](../../../examples/container-app/microservices) för en produktionsklar mall och distributionsguide

**Leverabler**:
- Komplett mikrotjänstarkitektur
- Kommunikationsmönster mellan tjänster
- Prestandatestning och optimering
- Produktionsklar säkerhetsimplementering

## Bedömning och certifiering

### Kunskapskontroller

Slutför dessa bedömningar efter varje modul:

**Modul 1 Bedömning**: Grundläggande begrepp och installation
- Flervalsfrågor om kärnbegrepp
- Praktiska installations- och konfigurationsuppgifter
- Enkel driftsättningsövning

**Modul 2 Bedömning**: Konfiguration och miljöer
- Scenarier för miljöhantering
- Felsökningsövningar för konfiguration
- Implementering av säkerhetskonfiguration

**Modul 3 Bedömning**: Driftsättning och provisionering
- Utmaningar i infrastrukturdesign
- Scenarier för driftsättning av flera tjänster
- Övningar för prestandaoptimering

**Modul 4 Bedömning**: Förvalidering före driftsättning
- Fallstudier för kapacitetsplanering
- Scenarier för kostnadsoptimering
- Implementering av valideringspipelines

**Modul 5 Bedömning**: Felsökning och debugging
- Övningar för problemdiagnos
- Uppgifter för implementering av övervakning
- Simuleringar av incidenthantering

**Modul 6 Bedömning**: Avancerade ämnen
- Design av CI/CD-pipeline
- Utveckling av anpassade mallar
- Scenarier för företagsarkitektur

### Slutprojekt (Capstone)

Designa och implementera en komplett lösning som visar behärskning av alla begrepp:

**Krav**:
- Flerlagrig applikationsarkitektur
- Flera driftsättningsmiljöer
- Omfattande övervakning och larm
- Implementering av säkerhet och efterlevnad
- Kostnadsoptimering och prestandafinjustering
- Fullständig dokumentation och runbooks

**Utvärderingskriterier**:
- Teknisk implementeringskvalitet
- Dokumentationens fullständighet
- Efterlevnad av säkerhet och bästa praxis
- Prestanda- och kostnadsoptimering
- Felsöknings- och övervakningseffektivitet

## Studieresorser och referenser

### Officiell dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-resurser
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Övningsmiljöer
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ytterligare verktyg
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Studieupplägg och rekommendationer

### Heltidsstudier (8 veckor)
- **Veckor 1-2**: Modulerna 1-2 (Komma igång, Konfiguration)
- **Veckor 3-4**: Modulerna 3-4 (Driftsättning, Förvalidering)
- **Veckor 5-6**: Modulerna 5-6 (Felsökning, Avancerade ämnen)
- **Veckor 7-8**: Praktiska projekt och slutbedömning

### Deltidsstudier (16 veckor)
- **Veckor 1-4**: Modul 1 (Komma igång)
- **Veckor 5-7**: Modul 2 (Konfiguration och miljöer)
- **Veckor 8-10**: Modul 3 (Driftsättning och provisionering)
- **Veckor 11-12**: Modul 4 (Förvalidering före driftsättning)
- **Veckor 13-14**: Modul 5 (Felsökning och debugging)
- **Veckor 15-16**: Modul 6 (Avancerade ämnen och bedömning)

---

## Framstegsspårning och bedömningsramverk

### Checklista för kapitelavslutning

Spåra dina framsteg genom varje kapitel med dessa mätbara resultat:

#### 📚 Kapitel 1: Grund & Snabbstart
- [ ] **Installation Complete**: AZD installerat och verifierat på din plattform
- [ ] **First Deployment**: Framgångsrikt driftsatt todo-nodejs-mongo-mallen
- [ ] **Environment Setup**: Konfigurerade första miljövariablerna
- [ ] **Resource Navigation**: Utforskade driftsatta resurser i Azure-portalen
- [ ] **Command Mastery**: Bekväm med grundläggande AZD-kommandon

#### 🤖 Kapitel 2: AI-First Development  
- [ ] **AI Template Deployment**: Framgångsrikt driftsatt azure-search-openai-demo
- [ ] **RAG Implementation**: Konfigurerat dokumentindexering och återvinning
- [ ] **Model Configuration**: Konfigurerat flera AI-modeller för olika syften
- [ ] **AI Monitoring**: Implementerat Application Insights för AI-workloads
- [ ] **Performance Optimization**: Finjusterat AI-applikationens prestanda

#### ⚙️ Kapitel 3: Konfiguration & Autentisering
- [ ] **Multi-Environment Setup**: Konfigurerade dev-, staging- och prod-miljöer
- [ ] **Security Implementation**: Konfigurerat managed identity-autentisering
- [ ] **Secrets Management**: Integrerat Azure Key Vault för känslig data
- [ ] **Parameter Management**: Skapat miljöspecifik konfiguration
- [ ] **Authentication Mastery**: Implementerat säkra åtkomstmönster

#### 🏗️ Kapitel 4: Infrastruktur som kod & Driftsättning
- [ ] **Custom Template Creation**: Byggt en multiservicemall för applikation
- [ ] **Bicep Mastery**: Skapat modulära, återanvändbara infrastrukturkomponenter
- [ ] **Deployment Automation**: Implementerat pre-/post-driftsättningshooks
- [ ] **Architecture Design**: Driftsatt komplex mikrotjänstarkitektur
- [ ] **Template Optimization**: Optimerat mallar för prestanda och kostnad

#### 🎯 Kapitel 5: Multi-Agent AI-lösningar
- [ ] **Retail Solution Deployment**: Driftsatt komplett multi-agent retail-scenario
- [ ] **Agent Customization**: Modifierat kund- och lageragentbeteenden
- [ ] **Architecture Scaling**: Implementerat lastbalansering och autoskalning
- [ ] **Production Monitoring**: Upprättat omfattande övervakning och larm
- [ ] **Performance Tuning**: Optimerat multi-agent systemets prestanda

#### 🔍 Kapitel 6: Förvalidering & planering före driftsättning
- [ ] **Capacity Analysis**: Analyserat resursbehov för applikationer
- [ ] **SKU Optimization**: Valt kostnadseffektiva servicetier
- [ ] **Validation Automation**: Implementerat skript för förkontroller
- [ ] **Cost Planning**: Skapat kostnadsuppskattningar och budgetar för driftsättning
- [ ] **Risk Assessment**: Identifierat och mildrat driftsättningsrisker

#### 🚨 Kapitel 7: Felsökning & Debugging
- [ ] **Diagnostic Skills**: Framgångsrikt debuggat avsiktligt brutna driftsättningar
- [ ] **Log Analysis**: Använt Azure Monitor och Application Insights effektivt
- [ ] **Performance Tuning**: Optimerat långsamma applikationer
- [ ] **Recovery Procedures**: Implementerat backup och katastrofåterställning
- [ ] **Monitoring Setup**: Skapat proaktiv övervakning och larm

#### 🏢 Kapitel 8: Produktion & Företagsmönster
- [ ] **Enterprise Security**: Implementerat omfattande säkerhetsmönster
- [ ] **Governance Framework**: Konfigurerat Azure Policy och resursstyrning
- [ ] **Advanced Monitoring**: Skapat instrumentpaneler och automatiserade larm
- [ ] **CI/CD Integration**: Byggt automatiserade driftsättningspipelines
- [ ] **Compliance Implementation**: Uppfyllt företagskrav för efterlevnad

### Studieplan och milstolpar

#### Vecka 1-2: Grundläggande byggande
- **Milstolpe**: Driftsätt första AI-applikationen med AZD
- **Validering**: Fungerande applikation tillgänglig via offentlig URL
- **Färdigheter**: Grundläggande AZD-arbetsflöden och AI-tjänsteintegration

#### Vecka 3-4: Konfigurationsbehärskning
- **Milstolpe**: Driftsättning i flera miljöer med säker autentisering
- **Validering**: Samma applikation driftsatt i dev/staging/prod
- **Färdigheter**: Miljöhantering och säkerhetsimplementering

#### Vecka 5-6: Infrastruktursexpertis
- **Milstolpe**: Anpassad mall för komplex multiserviceapplikation
- **Validering**: Återanvändbar mall driftsatt av en annan teammedlem
- **Färdigheter**: Bicep-behärskning och infrastrukturautomatisering

#### Vecka 7-8: Avancerad AI-implementering
- **Milstolpe**: Produktionsredo multi-agent AI-lösning
- **Validering**: System hanterar verklig belastning med övervakning
- **Färdigheter**: Multi-agent orkestrering och prestandaoptimering

#### Vecka 9-10: Produktionsberedskap
- **Milstolpe**: Företagsklassad driftsättning med fullständig efterlevnad
- **Validering**: Klarar säkerhetsgranskning och kostnadsoptimeringsrevision
- **Färdigheter**: Styrning, övervakning och CI/CD-integration

### Bedömning och certifiering

#### Metoder för kunskapsvalidering
1. **Praktiska driftsättningar**: Fungerande applikationer för varje kapitel
2. **Kodgranskningar**: Bedömning av mall- och konfigurationskvalitet
3. **Problemlösning**: Felsökningsscenarier och lösningar
4. **Peer Teaching**: Förklara begrepp för andra elever
5. **Community Contribution**: Dela mallar eller förbättringar

#### Professionella utvecklingsresultat
- **Portföljprojekt**: 8 produktionsklara driftsättningar
- **Tekniska färdigheter**: Branschstandardkompetens för AZD och AI-driftsättningar
- **Problemlösningsförmåga**: Självständig felsökning och optimering
- **Gemenskapsigenkänning**: Aktivt deltagande i Azure-utvecklargemenskapen
- **Karriärutveckling**: Färdigheter direkt tillämpbara på roller inom moln och AI

#### Framgångsmått
- **Driftsättningsframgång**: >95% framgångsrika driftsättningar
- **Felsökningstid**: <30 minuter för vanliga problem
- **Prestandaoptimering**: Påvisbara förbättringar i kostnad och prestanda
- **Säkerhetsöverensstämmelse**: Alla driftsättningar uppfyller företagets säkerhetsstandarder
- **Kunskapsöverföring**: Förmåga att handleda andra utvecklare

### Kontinuerligt lärande och gemenskapsengagemang

#### Håll dig uppdaterad
- **Azure-uppdateringar**: Följ Azure Developer CLI:s versionsanteckningar
- **Community-evenemang**: Delta i Azure- och AI-utvecklarevenemang
- **Dokumentation**: Bidra till communitydokumentation och exempel
- **Återkopplingsslinga**: Ge feedback på kursinnehåll och Azure-tjänster

#### Karriärutveckling
- **Professionellt nätverk**: Skapa kontakter med Azure- och AI-experter
- **Talarmöjligheter**: Presentera dina lärdomar på konferenser eller träffar
- **Open source-bidrag**: Bidra till AZD-mallar och verktyg
- **Mentorskap**: Vägled andra utvecklare i deras AZD-läranderesa

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../README.md)
- **📖 Kom igång**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsuppföljning**: Följ din progression genom det omfattande inlärningssystemet med 8 kapitel
- **🤝 Gemenskap**: [Azure Discord](https://discord.gg/microsoft-azure) för support och diskussion

**Spårning av studieframsteg**: Använd denna strukturerade guide för att bemästra Azure Developer CLI genom progressivt, praktiskt lärande med mätbara resultat och fördelar för professionell utveckling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI‑översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på originalspråket bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->