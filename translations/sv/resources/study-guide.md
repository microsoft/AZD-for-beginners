# Studievägledning - Omfattande lärandemål

**Navigering inom lärandespåret**
- **📚 Kursstart**: [AZD För nybörjare](../README.md)
- **📖 Börja lära dig**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsuppföljning**: [Kursavslut](../README.md#-course-completion--certification)

## Introduktion

Denna omfattande studievägledning ger strukturerade lärandemål, nyckelkoncept, övningsuppgifter och bedömningsmaterial för att hjälpa dig bemästra Azure Developer CLI (azd). Använd denna guide för att följa din progression och säkerställa att du täckt alla väsentliga ämnen.

## Lärandemål

Genom att slutföra denna studievägledning kommer du att:
- Bemästra alla grundläggande och avancerade koncept inom Azure Developer CLI
- Utveckla praktiska färdigheter i att distribuera och hantera Azure-applikationer
- Bygga självförtroende i felsökning och optimering av distributioner
- Förstå produktionsklara implementeringsmetoder och säkerhetssynpunkter

## Läranderesultat

Efter att ha slutfört alla avsnitt i denna studieguide kommer du att kunna:
- Designa, distribuera och hantera kompletta applikationsarkitekturer med azd
- Implementera omfattande övervakning, säkerhet och kostnadsoptimeringsstrategier
- Felsöka komplexa distributionsproblem självständigt
- Skapa anpassade mallar och bidra till azd-communityn

## Lernstruktur med 8 kapitel

### Kapitel 1: Grundläggande & Snabbstart (Vecka 1)
**Varaktighet**: 30-45 minuter | **Komplexitet**: ⭐

#### Lärandemål
- Förstå kärnkoncept och terminologi för Azure Developer CLI
- Installera och konfigurera AZD framgångsrikt på din utvecklingsplattform
- Distribuera din första applikation med en befintlig mall
- Navigera effektivt i AZD:s kommandoradsgränssnitt

#### Nyckelkoncept att behärska
- AZD-projektstruktur och komponenter (azure.yaml, infra/, src/)
- Mallbaserade distributionsarbetsflöden
- Grundläggande miljökonfiguration
- Hantering av resursgrupper och prenumerationer

#### Praktiska övningar
1. **Installationsverifiering**: Installera AZD och verifiera med `azd version`
2. **Första distribution**: Distribuera todo-nodejs-mongo-mallen framgångsrikt
3. **Miljöinställningar**: Konfigurera dina första miljövariabler
4. **Resursutforskning**: Navigera bland distribuerade resurser i Azure-portalen

#### Bedömningsfrågor
- Vilka är kärnkomponenterna i ett AZD-projekt?
- Hur initierar man ett nytt projekt från en mall?
- Vad är skillnaden mellan `azd up` och `azd deploy`?
- Hur hanterar man flera miljöer med AZD?

---

### Kapitel 2: AI-Först-utveckling (Vecka 2)
**Varaktighet**: 1-2 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Integrera Microsoft Foundry-tjänster med AZD-arbetsflöden
- Distribuera och konfigurera AI-drivna applikationer
- Förstå implementeringsmönster för RAG (Retrieval-Augmented Generation)
- Hantera AI-modellsdistributioner och skalning

#### Nyckelkoncept att behärska
- Microsoft Foundry Models serviceintegration och API-hantering
- AI-sökning och vektorindexering
- Strategier för modellsdistribution och kapacitetsplanering
- AI-applikationsövervakning och prestandaoptimering

#### Praktiska övningar
1. **AI-chattdistribution**: Distribuera azure-search-openai-demo-mallen
2. **RAG-implementering**: Konfigurera dokumentindexering och återvinning
3. **Modellkonfiguration**: Sätt upp flera AI-modeller för olika ändamål
4. **AI-övervakning**: Implementera Application Insights för AI-arbetsbelastningar

#### Bedömningsfrågor
- Hur konfigurerar du Microsoft Foundry Models tjänster i en AZD-mall?
- Vilka är nyckelkomponenterna i en RAG-arkitektur?
- Hur hanterar du kapacitet och skalning för AI-modeller?
- Vilka övervakningsmått är viktiga för AI-applikationer?

---

### Kapitel 3: Konfiguration & Autentisering (Vecka 3)
**Varaktighet**: 45-60 minuter | **Komplexitet**: ⭐⭐

#### Lärandemål
- Bemästra strategier för miljökonfiguration och -hantering
- Implementera säkra autentiseringsmönster och hanterad identitet
- Organisera resurser med korrekta namngivningskonventioner
- Konfigurera distribuerade miljöer (dev, staging, prod)

#### Nyckelkoncept att behärska
- Miljörangordning och konfigurationsprioritering
- Hanterad identitet och serviceprincipal-autentisering
- Key Vault-integration för hemlighetshantering
- Miljöspecifik parameterhantering

#### Praktiska övningar
1. **Multi-miljöinställning**: Konfigurera dev-, staging- och prod-miljöer
2. **Säkerhetskonfiguration**: Implementera hanterad identitetsautentisering
3. **Hemlighetshantering**: Integrera Azure Key Vault för känsliga data
4. **Parameterhantering**: Skapa miljöspecifika konfigurationer

#### Bedömningsfrågor
- Hur konfigurerar du olika miljöer med AZD?
- Vilka är fördelarna med att använda hanterad identitet jämfört med serviceprincipaler?
- Hur hanterar du applikationshemligheter säkert?
- Vad är konfigurationshierarkin i AZD?

---

### Kapitel 4: Infrastruktur som kod & distribution (Vecka 4-5)
**Varaktighet**: 1-1,5 timmar | **Komplexitet**: ⭐⭐⭐

#### Lärandemål
- Skapa och anpassa Bicep-infrastrukturmallar
- Implementera avancerade distributionsmönster och arbetsflöden
- Förstå strategier för resursprovisionering
- Designa skalbara arkitekturer med flera tjänster

- Distribuera containeriserade applikationer med Azure Container Apps och AZD


#### Nyckelkoncept att behärska
- Bicep-mallstruktur och bästa praxis
- Resursberoenden och distributionsordning
- Parameterfiler och mallmodularitet
- Anpassade krokar och distributionsautomatisering
- Mönster för containerappdistribution (snabbstart, produktion, mikrotjänster)

#### Praktiska övningar
1. **Skapande av anpassad mall**: Bygg en mall för en applikation med flera tjänster
2. **Bicepmästerskap**: Skapa modulära, återanvändbara infrastrukturskomponenter
3. **Distributionsautomatisering**: Implementera före- och efter-distributionskrokar
4. **Arkitekturdesign**: Distribuera komplex mikrotjänstarkitektur
5. **Containerappdistribution**: Distribuera exemplen [Simple Flask API](../../../examples/container-app/simple-flask-api) och [Microservices Architecture](../../../examples/container-app/microservices) med AZD

#### Bedömningsfrågor
- Hur skapar du anpassade Bicep-mallar för AZD?
- Vilka är bästa praxis för att organisera infrastrukturskod?
- Hur hanterar du resursberoenden i mallar?
- Vilka distributionsmönster stödjer uppdateringar utan driftstopp?

---

### Kapitel 5: Multi-Agent AI-lösningar (Vecka 6-7)
**Varaktighet**: 2-3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Designa och implementera multi-agent AI-arkitekturer
- Orkestrera agentkoordinering och kommunikation
- Distribuera produktionsklara AI-lösningar med övervakning
- Förstå agentspecialisering och arbetsflödesmönster
- Integrera containeriserade mikrotjänster som en del av multi-agentlösningar

#### Nyckelkoncept att behärska
- Multi-agentarkitekturens mönster och designprinciper
- Agentkommunikationsprotokoll och dataflöde
- Lastbalanserings- och skalningsstrategier för AI-agenter
- Produktionsövervakning av multi-agent-system
- Tjänst-till-tjänst-kommunikation i containeriserade miljöer

#### Praktiska övningar
1. **Granskning av retailarkitektur**: Analysera retailblueprinten och identifiera vilka applikationskomponenter som måste implementeras innan distribution
2. **Agentanpassning**: Modifiera kund- och inventarie-agenters beteenden
3. **Arkitekturskalning**: Implementera lastbalansering och autoskalning
4. **Produktionsövervakning**: Sätt upp omfattande övervakning och larm
5. **Mikrotjänstintegration**: Utöka exemplet [Microservices Architecture](../../../examples/container-app/microservices) för att stödja agentbaserade arbetsflöden

#### Bedömningsfrågor
- Hur designar du effektiva kommunikationsmönster för multi-agenter?
- Vilka är de viktigaste övervägandena för att skala AI-agenters arbetsbelastning?
- Hur övervakar och felsöker du multi-agent AI-system?
- Vilka produktionsmönster säkerställer tillförlitlighet för AI-agenter?

---

### Kapitel 6: Validering & Planering före distribution (Vecka 8)
**Varaktighet**: 1 timme | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utför omfattande kapacitetsplanering och resursvalidering
- Välj optimala Azure SKU:er för kostnadseffektivitet
- Implementera automatiserade förkontroller och validering
- Planera distributioner med kostnadsoptimeringsstrategier

#### Nyckelkoncept att behärska
- Azure resurskvoter och kapacitetsbegränsningar
- Kriterier för val av SKU och kostnadsoptimering
- Automatiserade valideringsskript och testning
- Distributionsplanering och riskbedömning

#### Praktiska övningar
1. **Kapasitetsanalys**: Analysera resurskrav för dina applikationer
2. **SKU-optimering**: Jämför och välj kostnadseffektiva tjänstenivåer
3. **Valideringsautomation**: Implementera fördistributionskontrollskript
4. **Kostnadsplanering**: Skapa kostnadsberäkningar och budgetar för distribution

#### Bedömningsfrågor
- Hur validerar du Azure-kapacitet före distribution?
- Vilka faktorer påverkar beslut om val av SKU?
- Hur automatiserar du validering före distribution?
- Vilka strategier hjälper till att optimera distributionskostnader?

---

### Kapitel 7: Felsökning & Debugging (Vecka 9)
**Varaktighet**: 1-1,5 timmar | **Komplexitet**: ⭐⭐

#### Lärandemål
- Utveckla systematiska felsökningsmetoder för AZD-distributioner
- Lös vanliga distributions- och konfigurationsproblem
- Debugga AI-specifika problem och prestandafrågor
- Implementera övervakning och larm för proaktiv problemdetektion

#### Nyckelkoncept att behärska
- Diagnostiska tekniker och loggningsstrategier
- Vanliga felmönster och deras lösningar
- Prestandaövervakning och optimering
- Incidenthantering och återställningsprocedurer

#### Praktiska övningar
1. **Diagnostiska färdigheter**: Öva med avsiktligt felaktiga distributioner
2. **Logganalys**: Använd Azure Monitor och Application Insights effektivt
3. **Prestandajustering**: Optimera långsamt presterande applikationer
4. **Återställningsprocedurer**: Implementera backup och katastrofåterställning

#### Bedömningsfrågor
- Vilka är de vanligaste felen vid AZD-distribution?
- Hur debuggar du autentiserings- och behörighetsproblem?
- Vilka övervakningsstrategier hjälper till att förebygga produktionsproblem?
- Hur optimerar du applikationsprestanda i Azure?

---

### Kapitel 8: Produktions- & Företagsmönster (Vecka 10-11)
**Varaktighet**: 2-3 timmar | **Komplexitet**: ⭐⭐⭐⭐

#### Lärandemål
- Implementera företagsklassade distributionsstrategier
- Designa säkerhetsmönster och efterlevnadsramverk
- Etablera övervakning, styrning och kostnadshantering
- Skapa skalbara CI/CD-pipelines med AZD-integration
- Tillämpa bästa praxis för produktionsdistributioner av containerappar (säkerhet, övervakning, kostnad, CI/CD)

#### Nyckelkoncept att behärska
- Företagssäkerhet och efterlevnadskrav
- Styrningsramverk och policyimplementering
- Avancerad övervakning och kostnadshantering
- CI/CD-integration och automatiserade distributionspipelines
- Blue-green- och canary-distributionsstrategier för containeriserade arbetsbelastningar

#### Praktiska övningar
1. **Företagssäkerhet**: Implementera omfattande säkerhetsmönster
2. **Styrningsramverk**: Sätt upp Azure Policy och resursstyrning
3. **Avancerad övervakning**: Skapa instrumentpaneler och automatiserad larmhantering
4. **CI/CD-integration**: Bygg automatiserade distributionspipelines
5. **Produktion Container Appar**: Tillämpa säkerhet, övervakning och kostnadsoptimering på [Microservices Architecture](../../../examples/container-app/microservices)-exemplet

#### Bedömningsfrågor
- Hur implementerar du företagsäkerhet i AZD-distributioner?
- Vilka styrningsmönster säkerställer efterlevnad och kostnadskontroll?
- Hur designar du skalbar övervakning för produktionssystem?
- Vilka CI/CD-mönster fungerar bäst med AZD-arbetsflöden?

#### Lärandemål
- Förstå Azure Developer CLI-grunder och kärnkoncept
- Installera och konfigurera azd framgångsrikt i din utvecklingsmiljö
- Slutför din första distribution med en befintlig mall
- Navigera i azd-projektstrukturen och förstå nyckelkomponenter

#### Nyckelbegrepp att behärska
- Mallar, miljöer och tjänster
- azure.yaml-konfigurationsstruktur
- Grundläggande azd-kommandon (init, up, down, deploy)
- Principer för Infrastructure as Code
- Azure autentisering och auktorisering

#### Praktiska övningar

**Övning 1.1: Installation och Setup**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Övning 1.2: Första distributionen**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Övning 1.3: Analys av projektstruktur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Självbedömningsfrågor
1. Vilka är de tre kärnkoncepten inom azd-arkitektur?
2. Vad är syftet med azure.yaml-filen?
3. Hur hjälper miljöer till att hantera olika distributionsmål?
4. Vilka autentiseringsmetoder kan användas med azd?
5. Vad händer när du kör `azd up` för första gången?

---

## Framstegsspårning och bedömningsramverk
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Övning 2.2: Avancerad konfiguration**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Övning 2.3: Säkerhetskonfiguration**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Självbedömningsfrågor
1. Hur hanterar azd prioritet för miljövariabler?
2. Vad är distributionshakar och när ska du använda dem?
3. Hur konfigurerar du olika SKUs för olika miljöer?
4. Vilka är säkerhetsimplikationerna av olika autentiseringsmetoder?
5. Hur hanterar du hemligheter och känsliga konfigurationsdata?

### Modul 3: Distribution och Provisionering (Vecka 4)

#### Lärandemål
- Bemästra distributionsarbetsflöden och bästa praxis
- Förstå Infrastructure as Code med Bicep-mallar
- Implementera komplexa multi-tjänst-arkitekturer
- Optimera distributionsprestanda och tillförlitlighet

#### Nyckelbegrepp att behärska
- Bicep-mallstruktur och moduler
- Resursberoenden och ordning
- Distributionsstrategier (blue-green, rolling updates)
- Multi-region distributioner
- Databas-migrationer och datastyrning

#### Praktiska övningar

**Övning 3.1: Anpassad infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Övning 3.2: Multi-tjänst applikation**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Övning 3.3: Databasintegration**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Självbedömningsfrågor
1. Vilka är fördelarna med att använda Bicep jämfört med ARM-mallar?
2. Hur hanterar du databas-migrationer i azd-distributioner?
3. Vilka strategier finns för noll-nedtid-distributioner?
4. Hur hanterar du beroenden mellan tjänster?
5. Vilka är övervägandena för multi-region distributioner?

### Modul 4: Fördistribution Validering (Vecka 5)

#### Lärandemål
- Genomför omfattande kontroller före distribution
- Bli expert på kapacitetsplanering och resursvalidering
- Förstå val av SKU och kostnadsoptimering
- Bygg automatiserade valideringspipelines

#### Nyckelkoncept att bemästra
- Azure-resurskvoter och begränsningar
- Kriterier för val av SKU och kostnadseffekter
- Automatiserade valideringsskript och verktyg
- Metoder för kapacitetsplanering
- Prestandatestning och optimering

#### Övningar

**Övning 4.1: Kapacitetsplanering**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Övning 4.2: Förhandsvalidering**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Övning 4.3: SKU-optimering**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Självbedömningsfrågor
1. Vilka faktorer bör påverka beslut om val av SKU?
2. Hur validerar du tillgänglighet av Azure-resurser före distribution?
3. Vilka är de viktigaste komponenterna i ett system för förhandskontroller?
4. Hur uppskattar och kontrollerar du distributionskostnader?
5. Vilken övervakning är avgörande för kapacitetsplanering?

### Modul 5: Felsökning och Debugging (Vecka 6)

#### Lärandemål
- Bemästra systematiska felsökningsmetoder
- Utveckla expertis i debugging av komplexa distributionsproblem
- Implementera omfattande övervakning och larmhantering
- Bygg processer för incidenthantering och återställning

#### Nyckelkoncept att bemästra
- Vanliga felmönster vid distribution
- Logganalys och korrelationstekniker
- Prestandaövervakning och optimering
- Säkerhetsincidentdetektion och respons
- Katastrofåterställning och kontinuitet i verksamheten

#### Övningar

**Övning 5.1: Felsökningsscenarier**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Övning 5.2: Implementering av övervakning**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Övning 5.3: Incidenthantering**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Självbedömningsfrågor
1. Vad är den systematiska metoden för felsökning av azd-distributioner?
2. Hur korrelerar du loggar från flera tjänster och resurser?
3. Vilka övervakningsmått är mest kritiska för tidig problemupptäckt?
4. Hur implementerar du effektiva katastrofåterställningsrutiner?
5. Vilka är de viktigaste komponenterna i en plan för incidenthantering?

### Modul 6: Avancerade ämnen och bästa praxis (Vecka 7-8)

#### Lärandemål
- Implementera distributionsmönster av företagsklass
- Bemästra CI/CD-integration och automatisering
- Utveckla egna mallar och bidra till communityn
- Förstå avancerade säkerhets- och efterlevnadskrav

#### Nyckelkoncept att bemästra
- Mönster för CI/CD-pipelineintegration
- Utveckling och distribution av egna mallar
- Företagsstyrning och efterlevnad
- Avancerade nätverks- och säkerhetskonfigurationer
- Prestandaoptimering och kostnadshantering

#### Övningar

**Övning 6.1: CI/CD-integration**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Övning 6.2: Egen mallutveckling**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Övning 6.3: Företagsimplementering**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Självbedömningsfrågor
1. Hur integrerar du azd i befintliga CI/CD-arbetsflöden?
2. Vilka är de viktigaste övervägandena vid utveckling av egna mallar?
3. Hur implementerar du styrning och efterlevnad i azd-distributioner?
4. Vilka är bästa praxis för distribution i företagsstor skala?
5. Hur bidrar du effektivt till azd-communityn?

## Praktiska projekt

### Projekt 1: Personlig portföljwebbplats
**Komplexitet**: Nybörjare  
**Tidsåtgång**: 1-2 veckor

Bygg och distribuera en personlig portföljwebbplats med:
- Statisk webbplatsvärd på Azure Storage
- Anpassad domänkonfiguration
- CDN-integration för global prestanda
- Automatiserad distributionspipeline

**Resultat**:
- Fungerande webbplats distribuerad på Azure
- Anpassad azd-mall för portföljdistributioner
- Dokumentation av distributionsprocessen
- Kostnadsanalys och optimeringsrekommendationer

### Projekt 2: Uppgiftshanteringsapplikation
**Komplexitet**: Mellannivå  
**Tidsåtgång**: 2-3 veckor

Skapa en fullstack-uppgiftshanteringsapplikation med:
- React-frontend distribuerad till App Service
- Node.js API-backend med autentisering
- PostgreSQL-databas med migrationer
- Application Insights-övervakning

**Resultat**:
- Komplett applikation med användarautentisering
- Databasschema och migrationsskript
- Övervakningsinstrumentpaneler och larmregler
- Konfiguration för distribution i flera miljöer

### Projekt 3: Microservices e-handelsplattform
**Komplexitet**: Avancerad  
**Tidsåtgång**: 4-6 veckor

Designa och implementera en microservices-baserad e-handelsplattform:
- Flera API-tjänster (katalog, order, betalningar, användare)
- Meddelandeköintegration med Service Bus
- Redis-cache för prestandaoptimering
- Omfattande loggning och övervakning

**Referensexempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) för ett tvåtjänsters lärandeprov och distributionsguide. Köer, persistens, autentisering, betalningshantering och produktionsförberedelse är separata projektarbeten.

**Resultat**:
- Komplett microservices-arkitektur
- Kommunikationsmönster mellan tjänster
- Prestandatestning och optimering
- Produktsäkert säkerhetsgenomförande

## Bedömning och certifiering

### Kunskapskontroller

Genomför dessa bedömningar efter varje modul:

**Modul 1 Bedömning**: Grundläggande koncept och installation
- Flervalfrågor om kärnkoncept
- Praktiska uppgifter kring installation och konfiguration
- Enkel distributionsövning

**Modul 2 Bedömning**: Konfiguration och miljöer
- Scenarier för miljöhantering
- Felsökningsövningar för konfiguration
- Säkerhetskonfigurationsimplementation

**Modul 3 Bedömning**: Distribution och tillhandahållande
- Utmaningar inom infrastrukturell design
- Scenarier för multifunktionell distribution
- Prestandaoptimeringsövningar

**Modul 4 Bedömning**: Validering före distribution
- Fallstudier i kapacitetsplanering
- Scenarier för kostnadsoptimering
- Implementering av valideringspipeline

**Modul 5 Bedömning**: Felsökning och debugging
- Diagnostikövningar
- Uppgifter för implementering av övervakning
- Simuleringar av incidenthantering

**Modul 6 Bedömning**: Avancerade ämnen
- Design av CI/CD-pipeline
- Utveckling av egna mallar
- Scenarier för företagsarkitektur

### Avslutande examensprojekt

Designa och implementera en komplett lösning som visar behärskning av alla koncept:

**Krav**:
- Applikationsarkitektur i flera lager
- Flera distributionsmiljöer
- Omfattande övervakning och larmsystem
- Säkerhets- och efterlevnadsgenomförande
- Kostnadsoptimering och prestandajustering
- Komplett dokumentation och driftböcker

**Utvärderingskriterier**:
- Tekniskt genomförandekvalitet
- Komplett dokumentation
- Säkerhets- och bästa praxis-efterlevnad
- Prestanda- och kostnadsoptimering
- Effektivitet i felsökning och övervakning

## Studieressurser och referenser

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

## Rekommenderat studieschema

### Heltidsstudier (8 veckor)
- **Vecka 1-2**: Modul 1-2 (Kom igång, Konfiguration)
- **Vecka 3-4**: Modul 3-4 (Distribution, Förhandsvalidering)
- **Vecka 5-6**: Modul 5-6 (Felsökning, Avancerade ämnen)
- **Vecka 7-8**: Praktiska projekt och slutbedömning

### Deltidsstudier (16 veckor)
- **Vecka 1-4**: Modul 1 (Kom igång)
- **Vecka 5-7**: Modul 2 (Konfiguration och miljöer)
- **Vecka 8-10**: Modul 3 (Distribution och tillhandahållande)
- **Vecka 11-12**: Modul 4 (Förhandsvalidering)
- **Vecka 13-14**: Modul 5 (Felsökning och debugging)
- **Vecka 15-16**: Modul 6 (Avancerade ämnen och bedömning)

---

## Ramverk för framstegsuppföljning och bedömning

### Checklista för kapitelavslut

Följ din framgång genom varje kapitel med dessa mätbara resultat:

#### 📚 Kapitel 1: Grundläggande & Snabbstart
- [ ] **Installation slutförd**: AZD installerat och verifierat på din plattform
- [ ] **Första distributionen**: Lyckats distribuera todo-nodejs-mongo-mallen
- [ ] **Miljöinställning**: Konfigurerade första miljövariabler
- [ ] **Resursnavigering**: Utforskade distribuerade resurser i Azure Portal
- [ ] **Kommandomästare**: Bekväm med grundläggande AZD-kommandon

#### 🤖 Kapitel 2: AI-First Utveckling  
- [ ] **AI-malldistribution**: Distribuerade azure-search-openai-demo framgångsrikt
- [ ] **RAG-implementering**: Konfigurerade dokumentindeksering och hämtning
- [ ] **Modellkonfiguration**: Satte upp flera AI-modeller med olika syften
- [ ] **AI-övervakning**: Implementerade Application Insights för AI-arbetsbelastningar
- [ ] **Prestandaoptimering**: Finjusterade AI-applikationens prestanda

#### ⚙️ Kapitel 3: Konfiguration & Autentisering
- [ ] **Multi-miljöuppsättning**: Konfigurerade utvecklings-, staging- och produktionsmiljöer
- [ ] **Säkerhetsimplementering**: Satte upp autentisering med hanterad identitet
- [ ] **Hantering av hemligheter**: Integrerade Azure Key Vault för känslig data
- [ ] **Parameterhantering**: Skapade miljöspecifik konfiguration
- [ ] **Autentiseringsmästerskap**: Implementerade säkra åtkomstmönster

#### 🏗️ Kapitel 4: Infrastruktur som kod & Distribution
- [ ] **Skapande av egen mall**: Byggde en mall för multikomponentapplikation
- [ ] **Bicep-mästerskap**: Skapade modulära, återanvändbara infrastrukturkomponenter
- [ ] **Automatisering av distribution**: Implementerade för- och efterdistribution-hooks
- [ ] **Arkitekturdesign**: Distribuerade komplex mikrotjänstarkitektur
- [ ] **Malloptimering**: Optimerade mallar för prestanda och kostnad

#### 🎯 Kapitel 5: Multi-Agent AI-lösningar
- [ ] **Översyn av retailarkitektur**: Identifierade saknade applikationskomponenter och planerade deras implementering och validering
- [ ] **Agentanpassning**: Modifierade kund- och lageragenters beteenden
- [ ] **Arkitekturskalning**: Implementerade lastbalansering och autoskalning
- [ ] **Produktionsövervakning**: Sätt upp omfattande övervakning och larmhantering
- [ ] **Prestandaoptimering**: Optimerade prestanda i multi-agent-system

#### 🔍 Kapitel 6: Validering & planering före distribution
- [ ] **Kapacitetsanalys**: Analyserade resursbehov för applikationer
- [ ] **SKU-optimering**: Valde kostnadseffektiva tjänstenivåer
- [ ] **Automatiserad validering**: Implementerade pre-deployment kontrollskript
- [ ] **Kostnadsplanering**: Skapade uppskattningar och budgetar för distribution
- [ ] **Riskbedömning**: Identifierade och mildrade distributionsrisker

#### 🚨 Kapitel 7: Felsökning & Debugging
- [ ] **Diagnostiska färdigheter**: Debuggade med framgång avsiktligt felaktiga distributioner
- [ ] **Logganalys**: Använde Azure Monitor och Application Insights effektivt
- [ ] **Prestandaoptimering**: Optimerade långsamma applikationer
- [ ] **Återställningsrutiner**: Implementerade backup och katastrofåterställning
- [ ] **Övervakningsuppsättning**: Skapade proaktiv övervakning och larm

#### 🏢 Kapitel 8: Produktions- & företagsmönster
- [ ] **Företagssäkerhet**: Implementerade omfattande säkerhetsmönster
- [ ] **Styrningsramverk**: Satt upp Azure Policy och resursförvaltning
- [ ] **Avancerad övervakning**: Skapade dashboards och automatiserad larmhantering
- [ ] **CI/CD-integration**: Byggde automatiserade distributionspipelines
- [ ] **Efterlevnadsimplementering**: Uppfyllde företagskrav på efterlevnad

### Lärotid och milstolpar

#### Vecka 1-2: Grunder
- **Milstolpe**: Distribuera första AI-applikationen med AZD
- **Validering**: Fungerande applikation åtkomlig via offentlig URL
- **Färdigheter**: Grundläggande AZD-arbetsflöden och AI-tjänsteintegration

#### Vecka 3-4: Konfigurationsbehärskning
- **Milstolpe**: Distribution i flera miljöer med säker autentisering
- **Validering**: Samma applikation distribuerad till dev/staging/prod
- **Färdigheter**: Miljöhantering och säkerhetsimplementering

#### Vecka 5-6: Infrastrukturkompetens
- **Milstolpe**: Egen mall för komplex multikomponentapplikation
- **Validering**: Återanvändbar mall distribuerad av annan teammedlem
- **Färdigheter**: Bicep-behärskning och infrastrukturautomatisering

#### Vecka 7-8: Avancerad AI-implementering
- **Milstolpe**: Produktionsklar multi-agent AI-lösning
- **Validering**: Systemet hanterar verklig belastning med övervakning
- **Färdigheter**: Multi-agent orkestrering och prestandaoptimering

#### Vecka 9-10: Produktionsberedskap
- **Milstolpe**: Företagsklassdistribution med full efterlevnad
- **Validering**: Klarar säkerhetsgranskning och kostnadsoptimeringsrevision
- **Färdigheter**: Styrning, övervakning och CI/CD-integration

### Bedömning och certifiering

#### Metoder för kunskapsvalidering
1. **Praktiska distributioner**: Fungerande applikationer för varje kapitel
2. **Kodgranskningar**: Bedömning av mallar och konfigurationskvalitet
3. **Problemlösning**: Felsökningsscenarier och lösningar
4. **Kamratundervisning**: Förklara koncept för andra inlärare
5. **Communitybidrag**: Dela mallar eller förbättringar

#### Utfall för professionell utveckling
- **Portföljprojekt**: Inlärningsdistributioner och arkitekturomgångar; produktionsberedskap kräver separat implementering och granskning
- **Tekniska färdigheter**: Branschstandard AZD och AI-distributionskompetens
- **Problemlösningsförmåga**: Självständig felsökning och optimering
- **Communityerkännande**: Aktivt deltagande i Azure-utvecklarsamhället
- **Karriärutveckling**: Färdigheter direkt tillämpliga för moln- och AI-roller

#### Framgångsmått
- **Implementeringsframgång**: >95% lyckade implementeringar
- **Felsökningstid**: <30 minuter för vanliga problem
- **Prestandaoptimering**: Påvisbara förbättringar i kostnad och prestanda
- **Säkerhetsgranskning**: Dokumentera kontroller och kvarvarande luckor mot organisationens krav; kursavslut innebär ej certifiering av efterlevnad
- **Kunskapsöverföring**: Förmåga att handleda andra utvecklare

### Kontinuerligt lärande och samhällsengagemang

#### Håll dig uppdaterad
- **Azure-uppdateringar**: Följ releasenoter för Azure Developer CLI
- **Samhällsevenemang**: Delta i Azure- och AI-utvecklarevenemang
- **Dokumentation**: Bidra till community-dokumentation och exempel
- **Feedback-loop**: Ge feedback på kursinnehåll och Azure-tjänster

#### Karriärutveckling
- **Professionellt nätverk**: Koppla upp dig med Azure- och AI-experter
- **Talartillfällen**: Presentera lärdomar på konferenser eller meetups
- **Open Source-bidrag**: Bidra till AZD-mallar och verktyg
- **Mentorskap**: Vägled andra utvecklare i deras AZD-läranderesa

---

**Kapitelnavigation:**
- **📚 Kursstart**: [AZD för nybörjare](../README.md)
- **📖 Börja lära**: [Kapitel 1: Grund och snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsspårning**: Följ din utveckling genom det omfattande 8-kapitelssystemet
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) för stöd och diskussion

**Studieframstegsspårning**: Använd denna strukturerade guide för att behärska Azure Developer CLI genom progressivt, praktiskt lärande med mätbara resultat och professionella utvecklingsfördelar.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->