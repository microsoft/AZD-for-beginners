# Studievägledning - Omfattande lärandemål

**Navigering i lärandestigen**
- **📚 Kursens startsida**: [AZD För nybörjare](../README.md)
- **📖 Börja lära dig**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsuppföljning**: [Kursavslutning](../README.md#-course-completion--certification)

## Introduktion

Denna omfattande studievägledning erbjuder strukturerade lärandemål, nyckelkoncept, övningsuppgifter och bedömningsmaterial för att hjälpa dig bemästra Azure Developer CLI (azd). Använd denna guide för att följa din utveckling och säkerställa att du täckt alla viktiga ämnen.

## Lärandemål

Genom att slutföra denna studievägledning kommer du att:
- Bemästra alla grundläggande och avancerade koncept för Azure Developer CLI
- Utveckla praktiska färdigheter i att distribuera och hantera Azure-applikationer
- Bygga förtroende för felsökning och optimering av distributioner
- Förstå produktionsklara distributionsrutiner och säkerhetsaspekter

## Läranderesultat

Efter att ha slutfört alla avsnitt i denna studievägledning kommer du kunna:
- Designa, distribuera och hantera kompletta applikationsarkitekturer med azd
- Implementera omfattande övervakning, säkerhet och kostnadsoptimeringsstrategier
- Felsöka komplexa distributionsproblem självständigt
- Skapa anpassade mallar och bidra till azd-communityn

## 8-Kapitels lärandesstruktur

### Kapitel 1: Grundläggande & Snabbstart (Vecka 1)
**Varaktighet**: 30-45 minuter | **Svårighetsgrad**: ⭐

#### Lärandemål
- Förstå kärnkoncept och terminologi i Azure Developer CLI
- Installera och konfigurera AZD framgångsrikt på din utvecklingsplattform
- Distribuera din första applikation med en befintlig mall
- Navigera AZD-kommandoradsgränssnittet effektivt

#### Nyckelkoncept att bemästra
- AZD-projektstruktur och komponenter (azure.yaml, infra/, src/)
- Mallbaserade distributionsarbetsflöden
- Grundläggande miljökonfiguration
- Hantering av resursgrupp och prenumeration

#### Praktiska övningar
1. **Installationsverifiering**: Installera AZD och verifiera med `azd version`
2. **Första distributionen**: Distribuera lyckosamt todo-nodejs-mongo-mallen
3. **Miljöuppsättning**: Konfigurera dina första miljövariabler
4. **Resursexploration**: Navigera i distribuerade resurser i Azure Portal

#### Bedömningsfrågor
- Vilka är kärnkomponenterna i ett AZD-projekt?
- Hur initialiserar du ett nytt projekt från en mall?
- Vad är skillnaden mellan `azd up` och `azd deploy`?
- Hur hanterar du flera miljöer med AZD?

---

### Kapitel 2: AI-First Development (Vecka 2)
**Varaktighet**: 4-5 timmar inklusive workshop | **Svårighetsgrad**: ⭐⭐

#### Lärandemål
- Integrera Microsoft Foundry-tjänster med AZD arbetsflöden
- Använda GA `microsoft.foundry` paketet med AZD 1.37.0+ för utveckling med hostad agent
- Distribuera och konfigurera AI-drivna applikationer
- Förstå RAG (Retrieval-Augmented Generation) implementeringsmönster
- Hantera AI-modellsdistributioner och skalning

#### Nyckelkoncept att bemästra
- Microsoft Foundry Models serviceintegration och API-hantering
- AI Search-konfiguration och vektorindexering
- Strategier för modelldistribution och kapacitetsplanering
- AI-applikationsövervakning och prestandaoptimering
- Lokal Agent Inspector jämfört med molnspår, källkoddistribution och utvärderingsresurser i versionshantering

#### Praktiska övningar
1. **AI Chat-distribution**: Distribuera azure-search-openai-demo-mallen
2. **RAG-implementering**: Konfigurera dokumentindexering och hämtning
3. **Modellkonfiguration**: Ställ in flera AI-modeller med olika syften
4. **AI-övervakning**: Implementera Application Insights för AI-arbetsbelastningar
5. **GA Hostad Agent**: Följ [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); jämför lokala och molnsvar, granska ett utvärderingsresultat och verifiera ägarskap av rensning

#### Bedömningsfrågor
- Hur konfigurerar du Microsoft Foundry Models-tjänster i en AZD-mall?
- Vilka är nyckelkomponenterna i en RAG-arkitektur?
- Hur hanterar du AI-modellernas kapacitet och skalning?
- Vilka övervakningsmått är viktiga för AI-applikationer?
- Vilka tillägg ingår i `microsoft.foundry`, och varför installeras utvärderingar separat?
- Varför genererar lokala agenttester fortfarande kostnader för Azure-modeller?
- Vad lämnar `azd down` kvar när du återanvänder ett befintligt Foundry-projekt?

---

### Kapitel 3: Konfiguration & Autentisering (Vecka 3)
**Varaktighet**: 45-60 minuter | **Svårighetsgrad**: ⭐⭐

#### Lärandemål
- Bemästra miljökonfiguration och hanteringsstrategier
- Implementera säkra autentiseringsmönster och hanterad identitet
- Organisera resurser med korrekta namngivningskonventioner
- Konfigurera multi-miljödistributioner (dev, staging, prod)

#### Nyckelkoncept att bemästra
- Miljöhierarki och konfigurationsprioritering
- Hanterad identitet och autentisering med service principals
- Key Vault-integrering för helhetshantering av secrets
- Parameterhantering specifik för miljö

#### Praktiska övningar
1. **Multi-miljöuppsättning**: Konfigurera dev, staging och prod-miljöer
2. **Säkerhetskonfiguration**: Implementera autentisering med hanterad identitet
3. **Secrets-hantering**: Integrera Azure Key Vault för känsliga data
4. **Parameterhantering**: Skapa miljöspecifika konfigurationer

#### Bedömningsfrågor
- Hur konfigurerar du olika miljöer med AZD?
- Vilka är fördelarna med hanterad identitet jämfört med service principals?
- Hur hanterar du applikationshemligheter säkert?
- Vad är konfigurationshierarkin i AZD?

---

### Kapitel 4: Infrastruktur som kod & distribution (Vecka 4-5)
**Varaktighet**: 1-1,5 timmar | **Svårighetsgrad**: ⭐⭐⭐

#### Lärandemål
- Skapa och anpassa Bicep-infrastrukturmallar
- Implementera avancerade distributionsmönster och arbetsflöden
- Förstå resurstilldelningsstrategier
- Designa skalbara multi-tjänstarkitekturer

- Distribuera containeriserade applikationer med Azure Container Apps och AZD


#### Nyckelkoncept att bemästra
- Struktur för Bicep-mallar och bästa praxis
- Resursberoenden och distributionsordning
- Parameterfiler och mallmodularitet
- Anpassade hooks och distributionsautomatisering
- Distributionsmönster för containerappar (snabbstart, produktion, mikrotjänster)

#### Praktiska övningar
1. **Egen mallskapande**: Bygg en applikationsmall för flera tjänster
2. **Bicep-mästerskap**: Skapa modulära, återanvändbara komponenter för infrastruktur
3. **Distributionsautomatisering**: Implementera pre/post-distributionshooks
4. **Arkitekturdesign**: Distribuera komplex mikrotjänstarkitektur
5. **Container-App-distribution**: Distribuera exemplen [Simple Flask API](../../../examples/container-app/simple-flask-api) och [Microservices Architecture](../../../examples/container-app/microservices) med AZD

#### Bedömningsfrågor
- Hur skapar du anpassade Bicep-mallar för AZD?
- Vilka är bästa praxis för att organisera infrastrukturkod?
- Hur hanterar du resursberoenden i mallar?
- Vilka distributionsmönster stöder uppdateringar utan driftstopp?

---

### Kapitel 5: Multi-Agent AI-lösningar (Vecka 6-7)
**Varaktighet**: 2-3 timmar | **Svårighetsgrad**: ⭐⭐⭐⭐

#### Lärandemål
- Designa och implementera multi-agent AI-arkitekturer
- Orkestrera agentkoordination och kommunikation
- Distribuera produktionsklara AI-lösningar med övervakning
- Förstå agent-specialisering och arbetsflödesmönster
- Integrera containeriserade mikrotjänster som del av multi-agentlösningar

#### Nyckelkoncept att bemästra
- Multi-agentarkitekturmönster och designprinciper
- Agentkommunikationsprotokoll och dataflöde
- Lastbalansering och skalningsstrategier för AI-agenter
- Produktionsövervakning för multi-agent-system
- Service-till-service-kommunikation i containeriserade miljöer

#### Praktiska övningar
1. **Granskning av detaljhandelsarkitektur**: Analysera detaljhandelsblåtrycket och identifiera vilka applikationskomponenter som måste implementeras före distribution
2. **Agentanpassning**: Modifiera beteende för Customer- och Inventory-agenter
3. **Arkitekturskalning**: Implementera lastbalansering och automatisk skalning
4. **Produktionsövervakning**: Ställ in omfattande övervakning och aviseringar
5. **Mikrotjänsteintegration**: Utöka exemplet [Microservices Architecture](../../../examples/container-app/microservices) för att stödja agentbaserade arbetsflöden

#### Bedömningsfrågor
- Hur designar du effektiva kommunikationsmönster för multi-agenter?
- Vilka är nyckelöverväganden för skalning av AI-agentarbetsbelastningar?
- Hur övervakar och felsöker du multi-agent AI-system?
- Vilka produktionsmönster säkerställer tillförlitlighet för AI-agenter?

---

### Kapitel 6: Validering och planering före distribution (Vecka 8)
**Varaktighet**: 1 timme | **Svårighetsgrad**: ⭐⭐

#### Lärandemål
- Utför omfattande kapacitetsplanering och resursvalidering
- Välj optimala Azure SKU:er för kostnadseffektivitet
- Implementera automatiserade förhandskontroller och valideringar
- Planera distributioner med kostnadsoptimeringsstrategier

#### Nyckelkoncept att bemästra
- Azure-resurskvoter och kapacitetsbegränsningar
- Kriterier för SKU-val och kostnadsoptimering
- Automatiserade valideringsskript och tester
- Distributionsplanering och riskbedömning

#### Praktiska övningar
1. **Kapacitetsanalys**: Analysera resursbehov för dina applikationer
2. **SKU-optimering**: Jämför och välj kostnadseffektiva servicetyper
3. **Automatisering av validering**: Implementera förhandskontrollskript för distribution
4. **Kostnadsplanering**: Skapa kostnadsberäkningar och budgetar för distribution

#### Bedömningsfrågor
- Hur validerar du Azure-kapacitet före distribution?
- Vilka faktorer påverkar beslut om SKU-val?
- Hur automatiserar du validering före distribution?
- Vilka strategier hjälper till att optimera distributionskostnader?

---

### Kapitel 7: Felsökning & Debugging (Vecka 9)
**Varaktighet**: 1-1,5 timmar | **Svårighetsgrad**: ⭐⭐

#### Lärandemål
- Utveckla systematiska felsökningsmetoder för AZD-distributioner
- Lös vanliga distributions- och konfigurationsproblem
- Debugga AI-specifika problem och prestandafrågor
- Implementera övervakning och avisering för proaktiv felupptäckt

#### Nyckelkoncept att bemästra
- Diagnostiktekniker och loggningsstrategier
- Vanliga felmönster och deras lösningar
- Prestandaövervakning och optimering
- Incidentrespons och återhämtningsrutiner

#### Praktiska övningar
1. **Diagnostiska färdigheter**: Öva med avsiktligt trasiga distributioner
2. **Logganalys**: Använd Azure Monitor och Application Insights effektivt
3. **Prestandatuning**: Optimera långsamt presterande applikationer
4. **Återhämtningsrutiner**: Implementera backup och katastrofåterställning

#### Bedömningsfrågor
- Vilka är de vanligaste misslyckandena vid AZD-distribution?
- Hur felsöker du autentiserings- och behörighetsproblem?
- Vilka övervakningsstrategier hjälper till att förhindra problem i produktion?
- Hur optimerar du applikationsprestanda i Azure?

---

### Kapitel 8: Produktions- & företagsmönster (Vecka 10-11)
**Varaktighet**: 2-3 timmar | **Svårighetsgrad**: ⭐⭐⭐⭐

#### Lärandemål
- Implementera företagsklassade distributionsstrategier
- Designa säkerhetsmönster och efterlevnadsramverk
- Etablera övervakning, styrning och kostnadshantering
- Skapa skalbara CI/CD-pipelines med AZD-integration
- Tillämpa bästa praxis för produktion av container-appdistributions (säkerhet, övervakning, kostnad, CI/CD)

#### Nyckelkoncept att bemästra
- Företagssäkerhets- och efterlevnadskrav
- Styrningsramverk och policyimplementering
- Avancerad övervakning och kostnadshantering
- CI/CD-integration och automatiserade distributionspipelines
- Blue-green- och canary-distributionsstrategier för containeriserade arbetsbelastningar

#### Praktiska övningar
1. **Företagssäkerhet**: Implementera omfattande säkerhetsmönster
2. **Styrningsramverk**: Sätt upp Azure Policy och resursstyrning
3. **Avancerad övervakning**: Skapa dashboards och automatiserade aviseringar
4. **CI/CD-integration**: Bygg automatiserade distributionspipelines
5. **Produktionscontainerappar**: Tillämpa säkerhet, övervakning och kostnadsoptimering på [Microservices Architecture](../../../examples/container-app/microservices)-exemplet

#### Bedömningsfrågor
- Hur implementerar du företagsäkerhet i AZD-distributioner?
- Vilka styrningsmönster säkerställer efterlevnad och kostnadskontroll?
- Hur designar du skalbar övervakning för produktionssystem?
- Vilka CI/CD-mönster fungerar bäst med AZD-arbetsflöden?

#### Lärandemål
- Förstå grunderna och kärnbegreppen i Azure Developer CLI
- Installera och konfigurera azd framgångsrikt i din utvecklingsmiljö
- Genomföra din första distribution med en befintlig mall
- Navigera i azd-projektstrukturen och förstå nyckelkomponenter

#### Nyckelbegrepp att bemästra
- Mallar, miljöer och tjänster
- azure.yaml konfigurationsstruktur
- Grundläggande azd-kommandon (init, up, down, deploy)
- Infrastruktur som kod-principer
- Azure-autentisering och auktorisering

#### Övningar

**Övning 1.1: Installation och uppsättning**
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
1. Vilka är de tre kärnbegreppen i azd-arkitekturen?
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
1. Hur hanterar azd prioritering av miljövariabler?
2. Vad är distributionskrokar och när bör du använda dem?
3. Hur konfigurerar du olika SKU:er för olika miljöer?
4. Vilka säkerhetskonsekvenser har olika autentiseringsmetoder?
5. Hur hanterar du hemligheter och känslig konfigurationsdata?

### Modul 3: Distribution och provisionering (Vecka 4)

#### Lärandemål
- Bemästra distributionsarbetsflöden och bästa praxis
- Förstå Infrastruktur som kod med Bicep-mallar
- Implementera komplexa multi-tjänstarkitekturer
- Optimera distributionsprestanda och tillförlitlighet

#### Nyckelbegrepp att bemästra
- Bicep-mallstruktur och moduler
- Resursberoenden och ordning
- Distributionsstrategier (blå-grön, successiva uppdateringar)
- Multi-regiondistributioner
- Databasmigrationer och datahantering

#### Övningar

**Övning 3.1: Anpassad Infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Övning 3.2: Multi-tjänstapplikation**
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

#### Självutvärderingsfrågor
1. Vilka är fördelarna med att använda Bicep jämfört med ARM-mallar?
2. Hur hanterar du databas-migrationer i azd-distributioner?
3. Vilka strategier finns för distributioner utan driftstopp?
4. Hur hanterar du beroenden mellan tjänster?
5. Vilka överväganden finns för multi-regiondistributioner?

### Modul 4: Validering före distribution (Vecka 5)

#### Lärandemål
- Implementera omfattande kontroller före distribution
- Bemästra kapacitetsplanering och resursvalidering
- Förstå SKU-val och kostnadsoptimering
- Bygg automatiserade valideringspipelines

#### Nyckelkoncept att bemästra
- Begränsningar och kvoter för Azure-resurser
- Kriterier för val av SKU och kostnadseffekter
- Automatiserade valideringsskript och verktyg
- Metoder för kapacitetsplanering
- Prestandatest och optimering

#### Praktiska övningar

**Övning 4.1: Kapacitetsplanering**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Övning 4.2: Pre-flight validering**
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

#### Självutvärderingsfrågor
1. Vilka faktorer bör påverka beslut om SKU-val?
2. Hur validerar du tillgång på Azure-resurser innan distribution?
3. Vilka är huvudkomponenterna i ett pre-flight kontrollsystem?
4. Hur uppskattar och kontrollerar du distributionskostnader?
5. Vilken övervakning är avgörande för kapacitetsplanering?

### Modul 5: Felsökning och Debugging (Vecka 6)

#### Lärandemål
- Bemästra systematiska felsökningsmetoder
- Utveckla expertis i debug av komplexa distributionsproblem
- Implementera omfattande övervakning och larm
- Bygg procedurer för incidenthantering och återställning

#### Nyckelkoncept att bemästra
- Vanliga mönster för distributionsfel
- Tekniker för logganalys och korrelation
- Prestandaövervakning och optimering
- Säkerhetsincidentdetektion och åtgärd
- Katastrofåterställning och kontinuitet för verksamheten

#### Praktiska övningar

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

#### Självutvärderingsfrågor
1. Vad är den systematiska metoden för felsökning av azd-distributioner?
2. Hur korrelerar du loggar över flera tjänster och resurser?
3. Vilka övervakningsmått är mest kritiska för tidig problemupptäckt?
4. Hur implementerar du effektiva katastroförebyggande procedurer?
5. Vilka är nyckelkomponenterna i en incidenthanteringsplan?

### Modul 6: Avancerade ämnen och bästa praxis (Vecka 7-8)

#### Lärandemål
- Implementera företagsklassade distributionsmönster
- Bemästra CI/CD-integration och automation
- Utveckla anpassade mallar och bidra till communityn
- Förstå avancerade säkerhets- och efterlevnadskrav

#### Nyckelkoncept att bemästra
- Mönster för CI/CD-pipelineintegration
- Utveckling och distribution av anpassade mallar
- Företagsstyrning och efterlevnad
- Avancerade nätverks- och säkerhetskonfigurationer
- Prestandaoptimering och kostnadshantering

#### Praktiska övningar

**Övning 6.1: CI/CD-integration**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Övning 6.2: Utveckling av anpassad mall**
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

#### Självutvärderingsfrågor
1. Hur integrerar du azd i befintliga CI/CD-flöden?
2. Vilka är viktiga överväganden för utveckling av anpassade mallar?
3. Hur implementerar du styrning och efterlevnad i azd-distributioner?
4. Vilka är bästa praxis för företagsstorskaliga distributioner?
5. Hur bidrar du effektivt till azd-communityn?

## Praktiska projekt

### Projekt 1: Personlig portföljsajt
**Komplexitet**: Nybörjare  
**Varaktighet**: 1-2 veckor

Bygg och distribuera en personlig portföljsajt med:
- Statisk webbplatsvärd på Azure Storage
- Anpassad domänkonfiguration
- CDN-integration för global prestanda
- Automatiserad distributionspipeline

**Leveranser**:
- Fungerande webbplats distribuerad på Azure
- Anpassad azd-mall för portföljdistributioner
- Dokumentation av distributionsprocessen
- Kostnadsanalys och optimeringsrekommendationer

### Projekt 2: Uppgiftshanteringsapplikation
**Komplexitet**: Mellanliggande  
**Varaktighet**: 2-3 veckor

Skapa en fullstack-uppgiftshanteringsapplikation med:
- React frontend distribuerad till App Service
- Node.js API-backend med autentisering
- PostgreSQL-databas med migrationer
- Application Insights-övervakning

**Leveranser**:
- Komplett applikation med användarautentisering
- Databasschema och migrationsskript
- Övervakningsinstrumentpaneler och larmregler
- Konfiguration för distribution i flera miljöer

### Projekt 3: Mikrotjänstbaserad e-handelsplattform
**Komplexitet**: Avancerad  
**Varaktighet**: 4-6 veckor

Designa och implementera en mikrotjänstbaserad e-handelsplattform:
- Flera API-tjänster (katalog, order, betalningar, användare)
- Meddelandeköintegration med Service Bus
- Redis-cache för prestandaoptimering
- Omfattande loggning och övervakning

**Referensexempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) för ett exempel med två tjänster, lärandeexempel och distributionsguide. Köer, persistens, autentisering, betalningshantering och produktionsanpassning är separata projekt.

**Leveranser**:
- Komplett mikrotjänstarkitektur
- Kommunikationsmönster mellan tjänster
- Prestandatest och optimering
- Produktionsfärdig säkerhetsimplementering

## Bedömning och certifiering

### Kunskapskontroller

Slutför dessa bedömningar efter varje modul:

**Modul 1 Bedömning**: Grundläggande koncept och installation
- Flervalsfrågor om centrala begrepp
- Praktiska installations- och konfigurationsuppgifter
- Enkel distributionsövning

**Modul 2 Bedömning**: Konfiguration och miljöer
- Scenarier för miljöhantering
- Felsökningsövningar för konfiguration
- Implementering av säkerhetskonfiguration

**Modul 3 Bedömning**: Distribution och provisionering
- Utmaningar i infrastrukturdesign
- Scenarier för multi-tjänstdistribution
- Övningar i prestandaoptimering

**Modul 4 Bedömning**: Validering före distribution
- Fallstudier för kapacitetsplanering
- Scenarier för kostnadsoptimering
- Implementering av valideringspipeline

**Modul 5 Bedömning**: Felsökning och debugging
- Diagnostiska övningar
- Uppgifter för implementering av övervakning
- Simuleringar av incidenthantering

**Modul 6 Bedömning**: Avancerade ämnen
- Design av CI/CD-pipeline
- Utveckling av anpassade mallar
- Scenarier för företagsarkitektur

### Slutligt större projekt

Designa och implementera en komplett lösning som visar behärskning av alla koncept:

**Krav**:
- Flerlagers applikationsarkitektur
- Flera distributionsmiljöer
- Omfattande övervakning och larm
- Implementering av säkerhet och efterlevnad
- Kostnadsoptimering och prestandajustering
- Komplett dokumentation och körböcker

**Utvärderingskriterier**:
- Teknisk implementeringskvalitet
- Dokumentationskomplettering
- Efterlevnad av säkerhet och bästa praxis
- Prestanda och kostnadsoptimering
- Effektivitet vid felsökning och övervakning

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

## Rekommenderat studietempo

### Heltidsstudier (8 veckor)
- **Vecka 1-2**: Modulerna 1-2 (Kom igång, Konfiguration)
- **Vecka 3-4**: Modulerna 3-4 (Distribution, Pre-distribution)
- **Vecka 5-6**: Modulerna 5-6 (Felsökning, Avancerade ämnen)
- **Vecka 7-8**: Praktiska projekt och slutlig bedömning

### Deltidsstudier (16 veckor)
- **Vecka 1-4**: Modul 1 (Kom igång)
- **Vecka 5-7**: Modul 2 (Konfiguration och miljöer)
- **Vecka 8-10**: Modul 3 (Distribution och provisionering)
- **Vecka 11-12**: Modul 4 (Validering före distribution)
- **Vecka 13-14**: Modul 5 (Felsökning och debugging)
- **Vecka 15-16**: Modul 6 (Avancerade ämnen och bedömning)

---

## Framstegsspårning och bedömningsramverk

### Checklista för kapitelavslutning

Följ din progression genom varje kapitel med dessa mätbara resultat:

#### 📚 Kapitel 1: Grund och snabbstart
- [ ] **Installation klar**: AZD installerad och verifierad på din plattform
- [ ] **Första distribution**: Lyckad distribution av todo-nodejs-mongo-mallen
- [ ] **Miljöinställning**: Första miljövariablerna konfigurerade
- [ ] **Resursnavigering**: Utforskade distribuerade resurser i Azure-portalen
- [ ] **Kommandomästerskap**: Bekväm med grundläggande AZD-kommandon

#### 🤖 Kapitel 2: AI-fokuserad utveckling  
- [ ] **AI-malldistribution**: Lyckades distribuera azure-search-openai-demo
- [ ] **RAG-implementering**: Konfigurerade dokumentindexering och hämtning
- [ ] **Modellkonfiguration**: Upprättade flera AI-modeller med olika syften
- [ ] **AI-övervakning**: Implementerade Application Insights för AI-arbetsbelastningar
- [ ] **Prestandaoptimering**: Justerade AI-applikationens prestanda

#### ⚙️ Kapitel 3: Konfiguration & Autentisering
- [ ] **Multi-miljöinställning**: Konfigurerade dev-, staging- och produktionsmiljöer
- [ ] **Säkerhetsimplementering**: Upprättade hanterad identitetsautentisering
- [ ] **Hantering av hemligheter**: Integrerade Azure Key Vault för känsliga data
- [ ] **Parameterhantering**: Skapade miljöspecifika konfigurationer
- [ ] **Autentiseringsbehärskning**: Implementerade säkra åtkomstmönster

#### 🏗️ Kapitel 4: Infrastruktur som kod & Distribution
- [ ] **Skapande av anpassad mall**: Byggde en mall för multi-tjänstapplikation
- [ ] **Bicep-behärskning**: Skapade modulära, återanvändbara infrastrukturskomponenter
- [ ] **Distributionsautomation**: Implementerade före- och efter-distributionshakar
- [ ] **Arkitekturdesign**: Distribuerade komplex mikrotjänstarkitektur
- [ ] **Malloptimering**: Optimerade mallar för prestanda och kostnad

#### 🎯 Kapitel 5: Multi-agent AI-lösningar
- [ ] **Översyn av detaljhandelns arkitektur**: Identifierade saknade applikationskomponenter och planerade deras implementering och validering
- [ ] **Agentanpassning**: Modifierade beteenden för kund- och lageragenter
- [ ] **Arkitekturskalning**: Implementerade lastbalansering och automatisk skalning
- [ ] **Produktionsövervakning**: Upprättade omfattande övervakning och larm
- [ ] **Prestandajustering**: Optimerade multi-agent systemets prestanda

#### 🔍 Kapitel 6: Validering & planering före distribution
- [ ] **Kapacitetanalys**: Analyserade resursbehov för applikationer
- [ ] **SKU-optimering**: Valde kostnadseffektiva tjänstenivåer
- [ ] **Valideringsautomation**: Implementerade skript för kontroller före distribution
- [ ] **Kostnadsplanering**: Skapade kostnadsuppskattningar och budgetar för distribution
- [ ] **Riskbedömning**: Identifierade och mildrade distributionsrisker

#### 🚨 Kapitel 7: Felsökning & Debugging
- [ ] **Diagnostiska färdigheter**: Lyckades debugga avsiktligt bristfälliga distributioner
- [ ] **Logganalys**: Använde Azure Monitor och Application Insights effektivt
- [ ] **Prestandajustering**: Optimerade applikationer med låg prestanda
- [ ] **Återställningsprocedurer**: Implementerade backup och katastrofåterställning
- [ ] **Övervakningskonfiguration**: Skapade proaktiv övervakning och larm

#### 🏢 Kapitel 8: Produktions- & företagsmönster
- [ ] **Företagssäkerhet**: Implementerade omfattande säkerhetsmönster
- [ ] **Styrningsramverk**: Upprättade Azure Policy och resursförvaltning
- [ ] **Avancerad övervakning**: Skapade instrumentpaneler och automatiserade larm
- [ ] **CI/CD-integration**: Byggde automatiserade distributionspipelines
- [ ] **Efterlevnadsimplementering**: Uppfyllde företagskrav för efterlevnad

### Lärandeschema och milstolpar

#### Vecka 1-2: Grundläggande byggande
- **Milstolpe**: Distribuera första AI-applikationen med AZD
- **Validering**: Fungerande applikation tillgänglig via publik URL
- **Färdigheter**: Grundläggande AZD-arbetsflöden och AI-tjänsteintegration

#### Vecka 3-4: Konfigurationsbehärskning
- **Milstolpe**: Multi-miljödistribution med säker autentisering
- **Validering**: Samma applikation distribuerad till dev/staging/prod
- **Färdigheter**: Miljöhantering och säkerhetsimplementering

#### Vecka 5-6: Infrastrukturkompetens
- **Milstolpe**: Anpassad mall för komplex multi-tjänstapplikation
- **Validering**: Återanvändbar mall distribuerad av annan teammedlem
- **Färdigheter**: Bicep-behärskning och infrastrukturautomation

#### Vecka 7-8: Avancerad AI-implementering
- **Milstolpe**: Produktionsfärdig multi-agent AI-lösning
- **Validering**: System hanterar verklig belastning med övervakning
- **Färdigheter**: Multi-agent orkestrering och prestandaoptimering

#### Vecka 9-10: Produktionsberedskap
- **Milstolpe**: Företagsklassad distribution med full efterlevnad
- **Validering**: Klarar säkerhetsgranskning och kostnadsoptimeringsrevision
- **Färdigheter**: Styrning, övervakning och CI/CD-integration

### Bedömning och certifiering

#### Metoder för kunskapsvalidering
1. **Praktiska distributioner**: Fungerande applikationer för varje kapitel
2. **Kodgranskningar**: Mall och konfigurationskvalitetsbedömning
3. **Problemlösning**: Felsökningsscenarier och lösningar
4. **Kamratundervisning**: Förklara koncept för andra elever
5. **Gemenskapsbidrag**: Dela mallar eller förbättringar

#### Professionella utvecklingsresultat
- **Portföljprojekt**: Lära sig distributioner och arkitekturövningar; produktionsberedskap kräver separat implementering och granskning
- **Tekniska färdigheter**: Branschstandard för AZD och AI-distributionsexpertis
- **Problemlösningsförmåga**: Självständig felsökning och optimering
- **Gemenskapsigenkänning**: Aktivt deltagande i Azure utvecklargemenskap
- **Karriärsutveckling**: Färdigheter direkt tillämpbara på moln- och AI-roller

#### Framgångsmått
- **Distributionsframgång**: >95 % lyckade distributioner
- **Felsökningstid**: <30 minuter för vanliga problem
- **Prestandaoptimering**: Påvisbara förbättringar i kostnad och prestanda
- **Säkerhetsgranskning**: Dokumentera kontroller och återstående luckor enligt din organisations krav; kursavslut certifierar inte efterlevnad
- **Kunskapsöverföring**: Förmåga att handleda andra utvecklare

### Kontinuerligt lärande och gemenskapsengagemang

#### Håll dig aktuell
- **Azure-uppdateringar**: Följ utgivningsanteckningar för Azure Developer CLI
- **Gemenskapsevenemang**: Delta i Azure- och AI-utvecklarevenemang
- **Dokumentation**: Bidra till gemenskapsdokumentation och exempel
- **Feedbackloop**: Ge återkoppling på kursinnehåll och Azure-tjänster

#### Karriärutveckling
- **Professionellt nätverk**: Anslut till Azure- och AI-experter
- **Talartillfällen**: Presentera lärdomar på konferenser eller meetups
- **Open Source-bidrag**: Bidra till AZD-mallar och verktyg
- **Mentorskap**: Vägleda andra utvecklare i deras AZD-lärande

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För nybörjare](../README.md)
- **📖 Börja lära dig**: [Kapitel 1: Grund & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Framstegsuppföljning**: Följ din utveckling genom det omfattande 8-kapitels lärsystemet
- **🤝 Gemenskap**: [Azure Discord](https://discord.gg/microsoft-azure) för support och diskussion

**Studieframstegsuppföljning**: Använd denna strukturerade guide för att behärska Azure Developer CLI genom progressivt, praktiskt lärande med mätbara resultat och professionella utvecklingsfördelar.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->