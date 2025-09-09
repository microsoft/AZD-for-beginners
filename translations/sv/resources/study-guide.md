<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:18:26+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sv"
}
-->
# Studieguide - AZD för Nybörjare

## Introduktion

Denna omfattande studieguide erbjuder strukturerade lärandemål, nyckelkoncept, övningar och bedömningsmaterial för att hjälpa dig att bemästra Azure Developer CLI (azd). Använd guiden för att följa din utveckling och säkerställa att du täcker alla viktiga ämnen.

## Lärandemål

Genom att slutföra denna studieguide kommer du att:
- Bemästra alla grundläggande och avancerade koncept inom Azure Developer CLI
- Utveckla praktiska färdigheter i att distribuera och hantera Azure-applikationer
- Bygga självförtroende i felsökning och optimering av distributioner
- Förstå produktionsklara distributionsmetoder och säkerhetsaspekter

## Läranderesultat

Efter att ha slutfört alla avsnitt i denna studieguide kommer du att kunna:
- Designa, distribuera och hantera kompletta applikationsarkitekturer med azd
- Implementera omfattande övervakning, säkerhet och kostnadsoptimeringsstrategier
- Felsöka komplexa distributionsproblem självständigt
- Skapa anpassade mallar och bidra till azd-communityn

## Kursstruktur

### Modul 1: Komma igång (Vecka 1-2)

#### Lärandemål
- Förstå grunderna och kärnkoncepten i Azure Developer CLI
- Installera och konfigurera azd i din utvecklingsmiljö
- Slutföra din första distribution med en befintlig mall
- Navigera i azd-projektstrukturen och förstå nyckelkomponenter

#### Nyckelkoncept att bemästra
- Mallar, miljöer och tjänster
- azure.yaml-konfigurationsstruktur
- Grundläggande azd-kommandon (init, up, down, deploy)
- Principer för Infrastructure as Code
- Azure-autentisering och auktorisering

#### Övningar

**Övning 1.1: Installation och inställning**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Övning 1.2: Första distributionen**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
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
1. Vilka är de tre kärnkoncepten i azd-arkitekturen?
2. Vad är syftet med azure.yaml-filen?
3. Hur hjälper miljöer till att hantera olika distributionsmål?
4. Vilka autentiseringsmetoder kan användas med azd?
5. Vad händer när du kör `azd up` för första gången?

### Modul 2: Konfiguration och Miljöer (Vecka 3)

#### Lärandemål
- Bemästra hantering och konfiguration av miljöer
- Förstå avancerade azure.yaml-konfigurationer
- Implementera miljöspecifika inställningar och variabler
- Konfigurera autentisering för olika scenarier

#### Nyckelkoncept att bemästra
- Miljöhierarki och variabelprioritet
- Tjänstekonfiguration och parametrar
- Hooks och livscykelhändelser
- Autentiseringsmetoder (användare, service principal, managed identity)
- Hantering av konfigurationsfiler

#### Övningar

**Övning 2.1: Multi-miljöinställning**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Övning 2.2: Avancerad konfiguration**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Övning 2.3: Säkerhetskonfiguration**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Självbedömningsfrågor
1. Hur hanterar azd variabelprioritet i miljöer?
2. Vad är distributionshooks och när bör de användas?
3. Hur konfigurerar du olika SKUs för olika miljöer?
4. Vilka säkerhetsimplikationer har olika autentiseringsmetoder?
5. Hur hanterar du hemligheter och känslig konfigurationsdata?

### Modul 3: Distribution och Provisionering (Vecka 4)

#### Lärandemål
- Bemästra distributionsarbetsflöden och bästa praxis
- Förstå Infrastructure as Code med Bicep-mallar
- Implementera komplexa multi-tjänstarkitekturer
- Optimera distributionsprestanda och tillförlitlighet

#### Nyckelkoncept att bemästra
- Bicep-mallstruktur och moduler
- Resursberoenden och ordning
- Distributionsstrategier (blue-green, rolling updates)
- Multi-region distributioner
- Databas-migreringar och datahantering

#### Övningar

**Övning 3.1: Anpassad infrastruktur**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Övning 3.2: Multi-tjänstapplikation**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Övning 3.3: Databasintegration**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Självbedömningsfrågor
1. Vilka är fördelarna med att använda Bicep istället för ARM-mallar?
2. Hur hanterar du databas-migreringar i azd-distributioner?
3. Vilka strategier finns för noll-downtime distributioner?
4. Hur hanterar du beroenden mellan tjänster?
5. Vilka överväganden finns för multi-region distributioner?

### Modul 4: Validering före distribution (Vecka 5)

#### Lärandemål
- Implementera omfattande kontroller före distribution
- Bemästra kapacitetsplanering och resursvalidering
- Förstå SKU-val och kostnadsoptimering
- Bygga automatiserade valideringspipelines

#### Nyckelkoncept att bemästra
- Azure-resurskvoter och gränser
- SKU-valskriterier och kostnadsimplikationer
- Automatiserade valideringsskript och verktyg
- Metoder för kapacitetsplanering
- Prestandatestning och optimering

#### Övningar

**Övning 4.1: Kapacitetsplanering**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Övning 4.2: Validering före flygning**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Övning 4.3: SKU-optimering**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Självbedömningsfrågor
1. Vilka faktorer bör påverka SKU-val?
2. Hur validerar du Azure-resursers tillgänglighet före distribution?
3. Vilka är de viktigaste komponenterna i ett system för validering före flygning?
4. Hur uppskattar och kontrollerar du distributionskostnader?
5. Vilken övervakning är viktig för kapacitetsplanering?

### Modul 5: Felsökning och Debugging (Vecka 6)

#### Lärandemål
- Bemästra systematiska felsökningsmetoder
- Utveckla expertis i att debugga komplexa distributionsproblem
- Implementera omfattande övervakning och larm
- Bygga incidenthantering och återhämtningsprocedurer

#### Nyckelkoncept att bemästra
- Vanliga mönster för distributionsfel
- Logganalys och korrelationstekniker
- Prestandaövervakning och optimering
- Säkerhetsincidentdetektering och respons
- Katastrofåterhämtning och kontinuitet

#### Övningar

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
3. Vilka övervakningsmetrik är mest kritiska för tidig problemupptäckt?
4. Hur implementerar du effektiva katastrofåterhämtningsprocedurer?
5. Vilka är de viktigaste komponenterna i en incidenthanteringsplan?

### Modul 6: Avancerade ämnen och bästa praxis (Vecka 7-8)

#### Lärandemål
- Implementera distributionsmönster på företagsnivå
- Bemästra CI/CD-integration och automatisering
- Utveckla anpassade mallar och bidra till communityn
- Förstå avancerade säkerhets- och efterlevnadskrav

#### Nyckelkoncept att bemästra
- CI/CD-pipelineintegrationsmönster
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
2. Vilka är de viktigaste övervägandena för utveckling av anpassade mallar?
3. Hur implementerar du styrning och efterlevnad i azd-distributioner?
4. Vilka är bästa praxis för distributioner i företagsstorlek?
5. Hur bidrar du effektivt till azd-communityn?

## Praktiska Projekt

### Projekt 1: Personlig Portföljwebbplats  
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
**Komplexitet**: Mellanliggande  
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
- Multi-miljö distributionskonfiguration  

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

## Bedömning och Certifiering

### Kunskapskontroller

Slutför dessa bedömningar efter varje modul:

**Modul 1 Bedömning**: Grundläggande koncept och installation  
- Flervalsfrågor om kärnkoncept  
- Praktiska installations- och konfigurationsuppgifter  
- Enkel distributionsövning  

**Modul 2 Bedömning**: Konfiguration och miljöer  
- Scenarier för miljöhantering  
- Övningar i konfigurationfelsökning  
- Implementering av säkerhetskonfiguration  

**Modul 3 Bedömning**: Distribution och provisionering  
- Utmaningar i infrastrukturdesign  
- Scenarier för multi-tjänstdistribution  
- Övningar i prestandaoptimering  

**Modul 4 Bedömning**: Validering före distribution  
- Fallstudier i kapacitetsplanering  
- Scenarier för kostnadsoptimering  
- Implementering av valideringspipeline  

**Modul 5 Bedömning**: Felsökning och debugging  
- Övningar i problemdiagnos  
- Uppgifter för implementering av övervakning  
- Simuleringar av incidenthantering  

**Modul 6 Bedömning**: Avancerade ämnen  
- Design av CI/CD-pipeline  
- Utveckling av anpassade mallar  
- Scenarier för företagsarkitektur  

### Slutprojekt

Designa och implementera en komplett lösning som demonstrerar att du behärskar alla koncept:

**Krav**:
- Multi-tier applikationsarkitektur  
- Flera distributionsmiljöer  
- Omfattande övervakning och larm  
- Implementering av säkerhet och efterlevnad  
- Kostnadsoptimering och prestandajustering  
- Komplett dokumentation och runbooks  

**Bedömningskriterier**:
- Kvalitet på teknisk implementering  
- Fullständighet i dokumentation  
- Efterlevnad av säkerhet och bästa praxis  
- Effektivitet i prestanda och kostnadsoptimering  
- Felsökning och övervakningseffektivitet  

## Studieresurser och Referenser

### Officiell Dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)  

### Communityresurser
- [AZD Mallgalleri](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisation](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Praktiska Miljöer
- [Azure Gratis Konto](https://azure.microsoft.com/free/)  
- [Azure DevOps Gratisnivå](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Ytterligare Verktyg
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Rekommendationer för Studietid

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

### Självstudier
- Slutför varje modul i din egen takt  
- Lägg extra tid på utmanande koncept  
- Upprepa övningar tills du uppnår mästerskap  
- Delta i communitydiskussioner och ställ frågor  

## Framgångstips

### Effektiva Lärandestrategier
1. **Öva Regelbundet**: Distribuera applikationer ofta för att bygga upp vana  
2. **Experimentera Fritt**: Använd utvecklingsmiljöer för att testa nya konfigurationer  
3. **Dokumentera Din Lärandeprocess**: Anteckna lösningar på problem du stöter på  
4. **Gå med i Communityn**: Delta i diskussioner och bidra till projekt  
5. **Håll Dig Uppdaterad**: Följ Azure-uppdateringar och nya azd-funktioner  

### Vanliga Fallgropar att Undvika
1. **Hoppa Över Förkunskaper**: Se till att du har rätt grundkunskaper  
2. **Stressa Genom Koncept**: Ta dig tid att förstå grunderna ordentligt  
3. **Ignorera Säkerhet**: Implementera alltid säkerhetsbästa praxis från början  
4. **Testa Inte Tillräckligt**: Testa distributioner i flera miljöer  
5. **Undvika Dokumentation**: Bra dokumentation är avgörande för underhåll  

### Bygga Praktisk Erfarenhet
1. **Börja Smått**: Börja med enkla applikationer och öka gradvis komplexiteten  
2. **Lär Dig av Misslyckanden**: Använd felsökningsövningar som lärandemöjligheter  
3. **Bidra till öppen källkod**: Dela dina mallar och lösningar med communityn  
4. **Lär ut till andra**: Att förklara koncept för andra stärker din egen förståelse  
5. **Var nyfiken**: Utforska kontinuerligt nya Azure-tjänster och integrationsmönster  

---

**Navigering**  
- **Föregående lektion**: [FAQ](faq.md)  
- **Nästa lektion**: [Changelog](../changelog.md)  

**Spårning av studieframsteg**: Använd denna guide för att följa din inlärningsresa och säkerställa en heltäckande förståelse av alla Azure Developer CLI-koncept och metoder.  

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.