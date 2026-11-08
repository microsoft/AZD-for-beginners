# Studiegids - Uitgebreide Leerdoelen

**Navigatie van het Leertraject**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Begin met Leren**: [Hoofdstuk 1: Basis & Snelle Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Voortgangsbewaking**: [Cursusvoltooiing](../README.md#-course-completion--certification)

## Introductie

Deze uitgebreide studiegids biedt gestructureerde leerdoelen, kernconcepten, oefenopdrachten en beoordelingsmaterialen om je te helpen de Azure Developer CLI (azd) te beheersen. Gebruik deze gids om je voortgang bij te houden en ervoor te zorgen dat je alle essentiële onderwerpen hebt behandeld.

## Leerdoelen

Door deze studiegids te voltooien, zul je:
- Alle fundamentele en geavanceerde concepten van Azure Developer CLI beheersen
- Praktische vaardigheden ontwikkelen voor het implementeren en beheren van Azure-applicaties
- Zelfvertrouwen opbouwen in het oplossen van problemen en optimaliseren van implementaties
- Productieklare implementatiepraktijken en beveiligingsoverwegingen begrijpen

## Leerresultaten

Na het afronden van alle secties in deze studiegids, zul je in staat zijn om:
- Volledige applicatie-architecturen te ontwerpen, implementeren en beheren met azd
- Uitgebreide monitoring-, beveiligings- en kostenoptimalisatiestrategieën te implementeren
- Zelfstandig complexe implementatieproblemen op te lossen
- Aangepaste sjablonen te maken en bij te dragen aan de azd-gemeenschap

## Leerstructuur van 8 Hoofdstukken

### Hoofdstuk 1: Basis & Snelle Start (Week 1)
**Duur**: 30-45 minuten | **Complexiteit**: ⭐

#### Leerdoelen
- Azure Developer CLI kernconcepten en terminologie begrijpen
- AZD succesvol installeren en configureren op je ontwikkelplatform
- Je eerste applicatie implementeren met een bestaande sjabloon
- Effectief navigeren door de AZD command line interface

#### Sleutelconcepten om te Beheersen
- AZD projectstructuur en componenten (azure.yaml, infra/, src/)
- Sjabloon-gebaseerde implementatie workflows
- Basisprincipes van omgevingsconfiguratie
- Beheer van resourcegroepen en abonnementen

#### Praktische Oefeningen
1. **Installatie Verificatie**: Installeer AZD en verifieer met `azd version`
2. **Eerste Implementatie**: Implementeer succesvol de todo-nodejs-mongo sjabloon
3. **Omgevingsinstellingen**: Stel je eerste omgevingsvariabelen in
4. **Resource Verkenning**: Navigeer door geïmplementeerde resources in de Azure Portal

#### Beoordelingsvragen
- Wat zijn de kerncomponenten van een AZD-project?
- Hoe initialiseert u een nieuw project van een sjabloon?
- Wat is het verschil tussen `azd up` en `azd deploy`?
- Hoe beheert u meerdere omgevingen met AZD?

---

### Hoofdstuk 2: AI-Eerst Ontwikkeling (Week 2)
**Duur**: 1-2 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Microsoft Foundry diensten integreren met AZD-workflows
- Implementeren en configureren van AI-gestuurde applicaties
- RAG (Retrieval-Augmented Generation) implementatiepatronen begrijpen
- AI-model implementaties en schaalbeheer beheren

#### Sleutelconcepten om te Beheersen
- Integratie van Microsoft Foundry Models service en API-beheer
- AI Search configuratie en vectorindexering
- Implementatiestrategieën voor modellen en capaciteitsplanning
- AI applicatiemonitoring en prestatieoptimalisatie

#### Praktische Oefeningen
1. **AI Chat Implementatie**: Implementeer de azure-search-openai-demo sjabloon
2. **RAG-Implementatie**: Configureer documentindexering en -opvraging
3. **Model Configuratie**: Stel meerdere AI-modellen met verschillende doeleinden in
4. **AI Monitoring**: Implementeer Application Insights voor AI workloads

#### Beoordelingsvragen
- Hoe configureer je Microsoft Foundry Models services in een AZD-sjabloon?
- Wat zijn de kerncomponenten van een RAG-architectuur?
- Hoe beheer je AI-modelcapaciteit en schaalvergroting?
- Welke monitoringstatistieken zijn belangrijk voor AI-applicaties?

---

### Hoofdstuk 3: Configuratie & Authenticatie (Week 3)
**Duur**: 45-60 minuten | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Beheers omgevingsconfiguratie en beheerstrategieën
- Implementeer veilige authenticatiepatronen en beheerde identiteit
- Organiseer resources met juiste naamgevingsconventies
- Configureer multi-omgeving implementaties (dev, staging, prod)

#### Sleutelconcepten om te Beheersen
- Omgevingshiërarchie en configuratievoorrang
- Beheerde identiteit en service principal authenticatie
- Integratie van Key Vault voor geheimenbeheer
- Omgeving-specifiek parameterbeheer

#### Praktische Oefeningen
1. **Multi-Omgeving Setup**: Configureer dev-, staging- en prod-omgevingen
2. **Beveiligingsconfiguratie**: Implementeer beheerde identiteit authenticatie
3. **Geheimenbeheer**: Integreer Azure Key Vault voor gevoelige gegevens
4. **Parameterbeheer**: Maak omgevingsspecifieke configuraties

#### Beoordelingsvragen
- Hoe configureer je verschillende omgevingen met AZD?
- Wat zijn de voordelen van het gebruik van beheerde identiteit ten opzichte van service principals?
- Hoe beheer je applicatiegeheimen veilig?
- Wat is de configuratiehiërarchie in AZD?

---

### Hoofdstuk 4: Infrastructure as Code & Implementatie (Week 4-5)
**Duur**: 1-1,5 uur | **Complexiteit**: ⭐⭐⭐

#### Leerdoelen
- Maak en pas Bicep infrastructuresjablonen aan
- Implementeer geavanceerde implementatiepatronen en workflows
- Begrijp resource provisioning strategieën
- Ontwerp schaalbare multi-service architecturen

- Implementeer containerized applicaties met Azure Container Apps en AZD


#### Sleutelconcepten om te Beheersen
- Bicep sjabloonstructuur en best practices
- Resource afhankelijkheden en implementatievolgorde
- Parameterbestanden en sjabloonmodulariteit
- Aangepaste hooks en implementatie-automatisering
- Container app implementatiepatronen (snelle start, productie, microservices)

#### Praktische Oefeningen
1. **Aangepaste Sjablooncreatie**: Bouw een multi-service applicatiesjabloon
2. **Bicep Beheersing**: Maak modulaire, herbruikbare infrastructuurcomponenten
3. **Implementatie Automatisering**: Implementeer pre/post implementatie hooks
4. **Architectuurontwerp**: Implementeer complexe microservices architecturen
5. **Container App Implementatie**: Implementeer de [Simple Flask API](../../../examples/container-app/simple-flask-api) en [Microservices Architecture](../../../examples/container-app/microservices) voorbeelden met AZD

#### Beoordelingsvragen
- Hoe maak je aangepaste Bicep sjablonen voor AZD?
- Wat zijn de best practices voor het organiseren van infrastructuurcode?
- Hoe ga je om met resource afhankelijkheden in sjablonen?
- Welke implementatiepatronen ondersteunen zero-downtime updates?

---

### Hoofdstuk 5: Multi-Agent AI Oplossingen (Week 6-7)
**Duur**: 2-3 uur | **Complexiteit**: ⭐⭐⭐⭐

#### Leerdoelen
- Ontwerp en implementeer multi-agent AI architecturen
- Orkestreer agent coördinatie en communicatie
- Implementeer productieklare AI-oplossingen met monitoring
- Begrijp agent specialisatie en workflow patronen
- Integreer containerized microservices als onderdeel van multi-agent oplossingen

#### Sleutelconcepten om te Beheersen
- Multi-agent architectuurpatronen en ontwerpprincipes
- Agent communicatieprotocollen en datastromen
- Load balancing en schaalstrategieën voor AI-agents
- Productiemonitoring voor multi-agent systemen
- Service-naar-service communicatie in containerized omgevingen

#### Praktische Oefeningen
1. **Retail Architectuurreview**: Analyseer het retailblauwdruk en identificeer welke applicatiecomponenten moeten worden geïmplementeerd vóór de implementatie
2. **Agent Aanpassing**: Pas gedrag van Customer en Inventory agents aan
3. **Architectuur Schalen**: Implementeer load balancing en autoscaling
4. **Productiemonitoring**: Stel uitgebreide monitoring en alarmering in
5. **Microservices Integratie**: Breid het [Microservices Architecture](../../../examples/container-app/microservices) voorbeeld uit om agent-gebaseerde workflows te ondersteunen

#### Beoordelingsvragen
- Hoe ontwerp je effectieve multi-agent communicatiepatronen?
- Wat zijn de belangrijkste overwegingen voor het schalen van AI-agent workloads?
- Hoe monitor en debug je multi-agent AI-systemen?
- Welke productiepatronen zorgen voor betrouwbaarheid van AI-agents?

---

### Hoofdstuk 6: Pre-Implementatie Validatie & Planning (Week 8)
**Duur**: 1 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Voer uitgebreide capaciteitsplanning en resource-validatie uit
- Selecteer optimale Azure SKU's voor kostenbesparing
- Implementeer geautomatiseerde pre-flight controles en validatie
- Plan implementaties met kostenoptimalisatiestrategieën

#### Sleutelconcepten om te Beheersen
- Azure resourcequota’s en capaciteitsbeperkingen
- SKU-selectiecriteria en kostenoptimalisatie
- Geautomatiseerde validatiescripts en testen
- Implementatieplanning en risicobeoordeling

#### Praktische Oefeningen
1. **Capaciteitsanalyse**: Analyseer resourcevereisten voor je applicaties
2. **SKU Optimalisatie**: Vergelijk en selecteer kosteneffectieve servicetiers
3. **Validatie Automatisering**: Implementeer pre-implementatie controlescripts
4. **Kostenplanning**: Maak kostenramingen en budgetten voor implementatie

#### Beoordelingsvragen
- Hoe valideer je Azure capaciteit vóór implementatie?
- Welke factoren beïnvloeden SKU-keuzebeslissingen?
- Hoe automatiseer je pre-implementatie validatie?
- Welke strategieën helpen bij het optimaliseren van implementatiekosten?

---

### Hoofdstuk 7: Probleemoplossing & Debuggen (Week 9)
**Duur**: 1-1,5 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Ontwikkel systematische debugmethoden voor AZD-implementaties
- Los veelvoorkomende implementatie- en configuratieproblemen op
- Debug AI-specifieke problemen en prestatieproblemen
- Implementeer monitoring en alarmering voor proactieve probleemdetectie

#### Sleutelconcepten om te Beheersen
- Diagnostische technieken en logstrategieën
- Veelvoorkomende faalpatronen en hun oplossingen
- Prestatiemonitoring en optimalisatie
- Incident response en herstelprocedures

#### Praktische Oefeningen
1. **Diagnostische Vaardigheden**: Oefen met bewust kapotte implementaties
2. **Loganalyse**: Gebruik Azure Monitor en Application Insights effectief
3. **Prestatieafstemming**: Optimaliseer langzaam presterende applicaties
4. **Herstelprocedures**: Implementeer back-up en noodherstel

#### Beoordelingsvragen
- Wat zijn de meest voorkomende AZD-implementatiefouten?
- Hoe debug je authenticatie- en permissieproblemen?
- Welke monitoringstrategieën helpen productieproblemen te voorkomen?
- Hoe optimaliseer je applicatieprestaties in Azure?

---

### Hoofdstuk 8: Productie- & Enterprisepatronen (Week 10-11)
**Duur**: 2-3 uur | **Complexiteit**: ⭐⭐⭐⭐

#### Leerdoelen
- Implementeer enterprise-grade implementatiestrategieën
- Ontwerp beveiligingspatronen en compliancekaders
- Stel monitoring, governance en kostenbeheer in
- Creëer schaalbare CI/CD-pijplijnen met AZD-integratie
- Pas best practices toe voor productie-container app-implementaties (beveiliging, monitoring, kosten, CI/CD)

#### Sleutelconcepten om te Beheersen
- Enterprise beveiligings- en compliancevereisten
- Governance-kaders en beleidsimplementatie
- Geavanceerde monitoring en kostenbeheer
- CI/CD-integratie en geautomatiseerde implementatiepijplijnen
- Blue-green- en canary-implementatiestrategieën voor container workloads

#### Praktische Oefeningen
1. **Enterprise Beveiliging**: Implementeer uitgebreide beveiligingspatronen
2. **Governance Kader**: Stel Azure Policy en resourcebeheer in
3. **Geavanceerde Monitoring**: Maak dashboards en geautomatiseerde alarmering
4. **CI/CD Integratie**: Bouw geautomatiseerde implementatiepijplijnen
5. **Productie Container Apps**: Pas beveiliging, monitoring en kostenoptimalisatie toe op het [Microservices Architecture](../../../examples/container-app/microservices) voorbeeld

#### Beoordelingsvragen
- Hoe implementeer je enterprise beveiliging in AZD-implementaties?
- Welke governancepatronen zorgen voor compliance en kostenbeheersing?
- Hoe ontwerp je schaalbare monitoring voor productiesystemen?
- Welke CI/CD-patronen werken het best met AZD-workflows?

#### Leerdoelen
- Begrijp de fundamenten en kernconcepten van Azure Developer CLI
- Installeer en configureer azd succesvol in je ontwikkelomgeving
- Voltooi je eerste implementatie met een bestaande sjabloon
- Navigeer door de azd-projectstructuur en begrijp de kerncomponenten

#### Sleutelconcepten om te Beheersen
- Sjablonen, omgevingen en services
- azure.yaml configuratiestructuur
- Basis azd-commando's (init, up, down, deploy)
- Infrastructure as Code principes
- Azure authenticatie en autorisatie

#### Oefeningen

**Oefening 1.1: Installatie en Setup**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Oefening 1.2: Eerste Implementatie**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Oefening 1.3: Analyse Projectstructuur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Zelfbeoordelingsvragen
1. Wat zijn de drie kernconcepten van azd-architectuur?
2. Wat is het doel van het azure.yaml bestand?
3. Hoe helpen omgevingen bij het beheren van verschillende implementatiedoelen?
4. Welke authenticatiemethoden kunnen worden gebruikt met azd?
5. Wat gebeurt er wanneer je `azd up` voor het eerst uitvoert?

---

## Voortgangsbewaking en Beoordelingskader
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Oefening 2.2: Geavanceerde Configuratie**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Oefening 2.3: Beveiligingsconfiguratie**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Zelfbeoordelingsvragen
1. Hoe gaat azd om met omgevingsvariabelevoorrang?
2. Wat zijn implementatie hooks en wanneer moet je deze gebruiken?
3. Hoe configureer je verschillende SKU's voor verschillende omgevingen?
4. Wat zijn de beveiligingsgevolgen van verschillende authenticatiemethoden?
5. Hoe beheer je geheimen en gevoelige configuratiegegevens?

### Module 3: Implementatie en Provisioning (Week 4)

#### Leerdoelen
- Beheers implementatieworkflows en best practices
- Begrijp Infrastructure as Code met Bicep-sjablonen
- Implementeer complexe multi-service architecturen
- Optimaliseer implementatieprestaties en betrouwbaarheid

#### Sleutelconcepten om te Beheersen
- Bicep sjabloonstructuur en modules
- Resource afhankelijkheden en volgorde
- Implementatiestrategieën (blue-green, rolling updates)
- Multi-regio implementaties
- Database migraties en databeheer

#### Oefeningen

**Oefening 3.1: Aangepaste Infrastructuur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Oefening 3.2: Multi-Service Applicatie**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Oefening 3.3: Database Integratie**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Zelfbeoordelingsvragen
1. Wat zijn de voordelen van het gebruik van Bicep in plaats van ARM-sjablonen?
2. Hoe ga je om met database migraties in azd-implementaties?
3. Welke strategieën bestaan er voor zero-downtime implementaties?
4. Hoe beheer je afhankelijkheden tussen services?
5. Wat zijn de overwegingen voor multi-regio implementaties?

### Module 4: Pre-Implementatie Validatie (Week 5)

#### Leerdoelen
- Voer uitgebreide pre-deployment controles uit  
- Beheers capaciteitsplanning en resourcevalidatie  
- Begrijp SKU-selectie en kostenoptimalisatie  
- Bouw geautomatiseerde validatiepijplijnen  

#### Belangrijke concepten om te beheersen  
- Azure resourcequota's en limieten  
- Criteria voor SKU-selectie en kostenimplicaties  
- Geautomatiseerde validatiescripts en tools  
- Methodologieën voor capaciteitsplanning  
- Prestatie testen en optimalisatie  

#### Oefeningen  

**Oefening 4.1: Capaciteitsplanning**  
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Oefening 4.2: Pre-flight Validatie**  
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Oefening 4.3: SKU-optimalisatie**  
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  
#### Zelfbeoordelingsvragen  
1. Welke factoren moeten de keuzes voor SKU-selectie beïnvloeden?  
2. Hoe valideer je de beschikbaarheid van Azure-resources vóór de deployment?  
3. Wat zijn de belangrijkste componenten van een pre-flight checksysteem?  
4. Hoe schat je de kosten van deployment in en houd je ze onder controle?  
5. Welke monitoring is essentieel voor capaciteitsplanning?  

### Module 5: Probleemoplossing en Debugging (Week 6)  

#### Leerdoelen  
- Beheers systematische methodes voor probleemoplossing  
- Ontwikkel expertise in het debuggen van complexe deploymentproblemen  
- Implementeer uitgebreide monitoring en alerting  
- Bouw incident response en herstelprocedures  

#### Belangrijke concepten om te beheersen  
- Veelvoorkomende patronen van deploymentfouten  
- Loganalyse- en correlatietechnieken  
- Prestatiebewaking en optimalisatie  
- Detectie en reactie op beveiligingsincidenten  
- Disaster recovery en bedrijfscontinuïteit  

#### Oefeningen  

**Oefening 5.1: Probleemoplossingsscenario's**  
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Oefening 5.2: Implementatie van Monitoring**  
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Oefening 5.3: Incident Response**  
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  
#### Zelfbeoordelingsvragen  
1. Wat is de systematische aanpak voor het oplossen van azd deployments?  
2. Hoe correleer je logs tussen meerdere services en resources?  
3. Welke monitoringmetriek is het belangrijkst voor vroege probleemdetectie?  
4. Hoe implementeer je effectieve disaster recovery procedures?  
5. Wat zijn de belangrijkste onderdelen van een incident response plan?  

### Module 6: Gevorderde onderwerpen en best practices (Week 7-8)  

#### Leerdoelen  
- Implementeer deployementpatronen van enterprise-niveau  
- Beheers CI/CD-integratie en automatisering  
- Ontwikkel aangepaste templates en draag bij aan de community  
- Begrijp geavanceerde beveiligings- en compliancevereisten  

#### Belangrijke concepten om te beheersen  
- Integratiepatronen voor CI/CD-pijplijnen  
- Ontwikkeling en distributie van aangepaste templates  
- Governance en compliance op enterprise-niveau  
- Geavanceerde netwerk- en beveiligingsconfiguraties  
- Prestatieoptimalisatie en kostenbeheer  

#### Oefeningen  

**Oefening 6.1: CI/CD-integratie**  
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Oefening 6.2: Ontwikkeling van aangepaste templates**  
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Oefening 6.3: Enterprise-implementatie**  
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### Zelfbeoordelingsvragen  
1. Hoe integreer je azd in bestaande CI/CD-workflows?  
2. Wat zijn de belangrijkste aandachtspunten bij de ontwikkeling van aangepaste templates?  
3. Hoe implementeer je governance en compliance in azd-deployments?  
4. Wat zijn de best practices voor enterprise-scale deployments?  
5. Hoe draag je effectief bij aan de azd-community?  

## Praktische projecten  

### Project 1: Persoonlijke portfolio website  
**Complexiteit**: Beginner  
**Duur**: 1-2 weken  

Bouw en deploy een persoonlijke portfolio website met:  
- Hosting van statische website op Azure Storage  
- Configuratie van een aangepast domein  
- CDN-integratie voor wereldwijde performance  
- Geautomatiseerde deployement pijplijn  

**Op te leveren producten**:  
- Werkende website gedeployed op Azure  
- Aangepaste azd-template voor portfolio deployments  
- Documentatie van het deploymentproces  
- Kostenanalyse en optimalisatieaanbevelingen  

### Project 2: Taakbeheerapplicatie  
**Complexiteit**: Gevorderd  
**Duur**: 2-3 weken  

Maak een full-stack taakbeheerapplicatie met:  
- React frontend gedeployed naar App Service  
- Node.js API backend met authenticatie  
- PostgreSQL-database met migraties  
- Application Insights monitoring  

**Op te leveren producten**:  
- Volledige applicatie met gebruikersauthenticatie  
- Databaseschema en migratiescripts  
- Monitoring dashboards en alarmeringsregels  
- Multi-omgeving deployement configuratie  

### Project 3: Microservices E-commerce Platform  
**Complexiteit**: Geavanceerd  
**Duur**: 4-6 weken  

Ontwerp en implementeer een microservices-gebaseerd e-commerce platform:  
- Meerdere API-services (catalogus, bestellingen, betalingen, gebruikers)  
- Berichtenwachtrij-integratie met Service Bus  
- Redis-cache voor prestatieoptimalisatie  
- Uitgebreide logging en monitoring  

**Referentievoorbeeld**: Zie [Microservices Architectuur](../../../examples/container-app/microservices) voor een leerexemplaar met twee services en implementatiehandleiding. Wachtrijen, persistentie, authenticatie, betalingsverwerking en productieverharding zijn aparte projecttaken.  

**Op te leveren producten**:  
- Complete microservices-architectuur  
- Inter-service communicatiepatronen  
- Prestatie testen en optimalisatie  
- Productieklaar beveiligingsimplementatie  

## Beoordeling en certificering  

### Kenniscontroles  

Voltooi deze beoordelingen na elk module:  

**Module 1 Beoordeling**: Basisconcepten en installatie  
- Meerkeuzevragen over kernconcepten  
- Praktische installatie- en configuratietaken  
- Simpele deployment oefening  

**Module 2 Beoordeling**: Configuratie en omgevingen  
- Omgevingsbeheerscenario's  
- Oplossen van configuratieproblemen  
- Implementatie van beveiligingsconfiguratie  

**Module 3 Beoordeling**: Deployment en provisioning  
- Uitdagingen bij ontwerp van infrastructuur  
- Scenario's voor multi-service deployment  
- Oefeningen in prestatieoptimalisatie  

**Module 4 Beoordeling**: Pre-deployment validatie  
- Casestudy's voor capaciteitsplanning  
- Scenario's voor kostenoptimalisatie  
- Implementatie van validatiepijplijnen  

**Module 5 Beoordeling**: Probleemoplossing en debugging  
- Diagnosticoefeningen  
- Taken voor implementatie van monitoring  
- Simulaties van incidentrespons  

**Module 6 Beoordeling**: Gevorderde onderwerpen  
- Ontwerp van CI/CD-pijplijnen  
- Ontwikkeling van aangepaste templates  
- Scenario's voor enterprise architectuur  

### Eindproject  

Ontwerp en implementeer een complete oplossing die de beheersing van alle concepten aantoont:  

**Vereisten**:  
- Multi-tier applicatiearchitectuur  
- Meerdere deploymentomgevingen  
- Uitgebreide monitoring en alerting  
- Implementatie van beveiliging en compliance  
- Kostenoptimalisatie en performancetuning  
- Volledige documentatie en runbooks  

**Evaluatiecriteria**:  
- Technische implementatiekwaliteit  
- Compleetheid van documentatie  
- Naleving van beveiliging en best practices  
- Prestatie- en kostenoptimalisatie  
- Effectiviteit van troubleshooting en monitoring  

## Studieresources en referenties  

### Officiële documentatie  
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community resources  
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisatie](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Oefenomgevingen  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Extra tools  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Aanbevolen studieschema  

### Voltijdstudie (8 weken)  
- **Weken 1-2**: Modules 1-2 (Aan de slag, Configuratie)  
- **Weken 3-4**: Modules 3-4 (Deployment, Pre-deployment)  
- **Weken 5-6**: Modules 5-6 (Probleemoplossing, Gevorderde onderwerpen)  
- **Weken 7-8**: Praktische projecten en eindbeoordeling  

### Deeltijdstudie (16 weken)  
- **Weken 1-4**: Module 1 (Aan de slag)  
- **Weken 5-7**: Module 2 (Configuratie en Omgevingen)  
- **Weken 8-10**: Module 3 (Deployment en Provisioning)  
- **Weken 11-12**: Module 4 (Pre-deployment Validatie)  
- **Weken 13-14**: Module 5 (Probleemoplossing en Debugging)  
- **Weken 15-16**: Module 6 (Gevorderde onderwerpen en beoordeling)  

---  

## Voortgangsbewaking en beoordelingskader  

### Checklist voor hoofdstukvoltooiing  

Houd je voortgang per hoofdstuk bij met deze meetbare resultaten:  

#### 📚 Hoofdstuk 1: Fundament & Snelstart  
- [ ] **Installatie voltooid**: AZD geïnstalleerd en geverifieerd op jouw platform  
- [ ] **Eerste deployment**: Succesvol gedeployd todo-nodejs-mongo template  
- [ ] **Omgevingsconfiguratie**: Eerste omgevingsvariabelen ingesteld  
- [ ] **Resource navigatie**: Gedeployde resources verkend in Azure Portal  
- [ ] **Commandobeheersing**: Vertrouwd met basis AZD-commando's  

#### 🤖 Hoofdstuk 2: AI-First ontwikkeling  
- [ ] **AI template deployment**: azure-search-openai-demo succesvol gedeployd  
- [ ] **RAG-implementatie**: Documentindexering en -opvraging geconfigureerd  
- [ ] **Modelconfiguratie**: Meerdere AI-modellen met verschillende doeleinden ingesteld  
- [ ] **AI monitoring**: Application Insights geïmplementeerd voor AI workloads  
- [ ] **Prestatieoptimalisatie**: AI-applicatieprestaties getuned  

#### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie  
- [ ] **Multi-omgeving setup**: Dev, staging, en prod omgevingen geconfigureerd  
- [ ] **Beveiligingsimplementatie**: Managed identity authenticatie ingesteld  
- [ ] **Geheimbeheer**: Azure Key Vault geïntegreerd voor gevoelige data  
- [ ] **Parameterbeheer**: Omgevingsspecifieke configuraties opgesteld  
- [ ] **Authenticatiemeesterschap**: Veilige toegangspatronen geïmplementeerd  

#### 🏗️ Hoofdstuk 4: Infrastructure as Code & Deployment  
- [ ] **Aangepaste template creatie**: Multi-service applicatietemplate gebouwd  
- [ ] **Bicep-meesterschap**: Modulaire, herbruikbare infrastructuurcomponenten gemaakt  
- [ ] **Deployment automatisering**: Pre/post deployment hooks geïmplementeerd  
- [ ] **Architectuurontwerp**: Complexe microservicesarchitectuur gedeployd  
- [ ] **Template-optimalisatie**: Templates geoptimaliseerd voor performance en kosten  

#### 🎯 Hoofdstuk 5: Multi-Agent AI-oplossingen  
- [ ] **Retail architectuurreview**: Ontbrekende applicatiecomponenten geïdentificeerd en implementatie- en validatieplanning gemaakt  
- [ ] **Agentaanpassing**: Gedrag van Customer en Inventory agents aangepast  
- [ ] **Architectuurschaling**: Load balancing en auto-scaling geïmplementeerd  
- [ ] **Productiemonitoring**: Uitgebreide monitoring en alerting opgezet  
- [ ] **Performance tuning**: Multi-agent systeem geoptimaliseerd  

#### 🔍 Hoofdstuk 6: Pre-deployment validatie & planning  
- [ ] **Capaciteitsanalyse**: Resourcevereisten voor applicaties geanalyseerd  
- [ ] **SKU-optimalisatie**: Kosteneffectieve serviceniveaus geselecteerd  
- [ ] **Validatieautomatisering**: Pre-deployment check scripts geïmplementeerd  
- [ ] **Kostenplanning**: Schattingen en budgetten voor deploymentkosten opgesteld  
- [ ] **Risicobeoordeling**: Deploymentrisico's geïdentificeerd en gemitigeerd  

#### 🚨 Hoofdstuk 7: Probleemoplossing & Debugging  
- [ ] **Diagnostische vaardigheden**: Bewust kapotte deployments succesvol gedebugd  
- [ ] **Loganalyse**: Azure Monitor en Application Insights effectief gebruikt  
- [ ] **Prestatie tuning**: Trage applicaties geoptimaliseerd  
- [ ] **Herstelprocedures**: Backup- en disaster recovery geïmplementeerd  
- [ ] **Monitoring setup**: Proactieve monitoring en alerting aangemaakt  

#### 🏢 Hoofdstuk 8: Productie- en enterprisepatronen  
- [ ] **Enterprisebeveiliging**: Uitgebreide beveiligingspatronen geïmplementeerd  
- [ ] **Governance framework**: Azure Policy en resourcebeheer opgezet  
- [ ] **Geavanceerde monitoring**: Dashboards en geautomatiseerde alerting gemaakt  
- [ ] **CI/CD-integratie**: Geautomatiseerde deployementpijplijnen gebouwd  
- [ ] **Compliance-implementatie**: Voldaan aan enterprise compliancevereisten  

### Leertijdlijn en mijlpalen  

#### Week 1-2: Fundament leggen  
- **Mijlpaal**: Eerste AI-applicatie gedeployd met AZD  
- **Validatie**: Werkende applicatie toegankelijk via openbare URL  
- **Vaardigheden**: Basis AZD workflows en AI service-integratie  

#### Week 3-4: Configuratiemeesterschap  
- **Mijlpaal**: Multi-omgeving deployment met veilige authenticatie  
- **Validatie**: Zelfde applicatie gedeployd naar dev/staging/prod  
- **Vaardigheden**: Omgevingsbeheer en beveiligingsimplementatie  

#### Week 5-6: Infrastructuurexpertise  
- **Mijlpaal**: Aangepaste template voor complexe multi-service applicatie  
- **Validatie**: Herbruikbare template gedeployd door een andere teamlid  
- **Vaardigheden**: Bicep-meesterschap en infrastructuurautomatisering  

#### Week 7-8: Geavanceerde AI-implementatie  
- **Mijlpaal**: Productieklaar multi-agent AI-oplossing  
- **Validatie**: Systeem verwerkt echte loads met monitoring  
- **Vaardigheden**: Multi-agent orkestratie en prestatieoptimalisatie  

#### Week 9-10: Productieklaar maken  
- **Mijlpaal**: Enterprise-grade deployment met volledige compliance  
- **Validatie**: Geslaagd voor beveiligingsreview en kostenoptimalisatie-audit  
- **Vaardigheden**: Governance, monitoring en CI/CD-integratie  

### Beoordeling en certificering  

#### Methoden voor kennisvalidatie  
1. **Praktische deployments**: Werkende applicaties voor elk hoofdstuk  
2. **Code reviews**: Template- en configuratiebeoordeling  
3. **Probleemoplossing**: Scenario's en oplossingen voor troubleshooting  
4. **Peer teaching**: Leg concepts uit aan andere leerlingen  
5. **Communitybijdrage**: Deel templates of verbeteringen  

#### Professionele ontwikkelingsresultaten  
- **Portfolio projecten**: Leer deployments en architectuuroefeningen; productieklaarheid vereist aparte implementatie en beoordeling  
- **Technische vaardigheden**: Industrienorm AZD en AI deployment expertise  
- **Probleemoplossend vermogen**: Onafhankelijke troubleshooting en optimalisatie  
- **Community-recognitie**: Actieve deelname aan Azure ontwikkelaarscommunity  
- **Carrièreontwikkeling**: Vaardigheden direct toepasbaar op cloud- en AI-functies

#### Succescriteria
- **Implementatiesuccespercentage**: >95% succesvolle implementaties
- **Oplostijd Problemen**: <30 minuten voor veelvoorkomende problemen
- **Prestatieoptimalisatie**: Aantoonbare verbeteringen in kosten en prestaties
- **Beveiligingsbeoordeling**: Documenteer controles en resterende hiaten ten opzichte van de eisen van uw organisatie; het voltooien van de cursus certificeert geen naleving
- **Kennisoverdracht**: Vermogen om andere ontwikkelaars te begeleiden

### Continu leren en betrokkenheid bij de gemeenschap

#### Blijf op de hoogte
- **Azure-updates**: Volg de release-opmerkingen van Azure Developer CLI
- **Gemeenschapsevenementen**: Neem deel aan Azure- en AI-ontwikkelaarsevenementen
- **Documentatie**: Lever bijdragen aan gemeenschapsdocumentatie en voorbeelden
- **Feedbackcyclus**: Geef feedback over cursusinhoud en Azure-diensten

#### Carrièreontwikkeling
- **Professioneel netwerk**: Verbind met Azure- en AI-experts
- **Spreekgelegenheden**: Presenteer wat je hebt geleerd op conferenties of meetups
- **Open-sourcebijdrage**: Draag bij aan AZD-sjablonen en -tools
- **Mentorschap**: Begeleid andere ontwikkelaars in hun AZD-leertraject

---

**Navigatie hoofdstuk:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../README.md)
- **📖 Begin met leren**: [Hoofdstuk 1: Basis & Snel Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Voortgangsbewaking**: Volg je voortgang via het uitgebreide 8-hoofdstukken leerprogramma
- **🤝 Gemeenschap**: [Azure Discord](https://discord.gg/microsoft-azure) voor ondersteuning en discussie

**Studievoortgang bijhouden**: Gebruik deze gestructureerde gids om Azure Developer CLI beheerst te leren via progressief, praktisch leren met meetbare resultaten en voordelen voor professionele ontwikkeling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->