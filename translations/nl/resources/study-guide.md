# Studiegids - Uitgebreide Leerdoelen

**Navigatie van het leerpad**
- **📚 Cursus Startpagina**: [AZD For Beginners](../README.md)
- **📖 Begin met leren**: [Hoofdstuk 1: Basis & Snelstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Voortgang bijhouden**: [Cursusvoltooiing](../README.md#-course-completion--certification)

## Inleiding

Deze uitgebreide studiegids biedt gestructureerde leerdoelen, kernconcepten, oefenopdrachten en toetsmateriaal om je te helpen de Azure Developer CLI (azd) te beheersen. Gebruik deze gids om je voortgang bij te houden en ervoor te zorgen dat je alle essentiële onderwerpen hebt behandeld.

## Leerdoelen

Door deze studiegids te voltooien zul je:
- Alle fundamentele en gevorderde concepten van Azure Developer CLI beheersen
- Praktische vaardigheden ontwikkelen in het implementeren en beheren van Azure-toepassingen
- Vertrouwen opbouwen in het oplossen van problemen en het optimaliseren van implementaties
- Productieklare deployment-praktijken en beveiligingsoverwegingen begrijpen

## Leerresultaten

Na het voltooien van alle secties van deze studiegids kun je:
- Volledige applicatiearchitecturen ontwerpen, implementeren en beheren met azd
- Uitgebreide monitoring-, beveiligings- en kostenoptimalisatiestrategieën implementeren
- Complexe implementatieproblemen zelfstandig oplossen
- Aangepaste templates maken en bijdragen aan de azd-community

## Leerstructuur met 8 hoofdstukken

### Hoofdstuk 1: Basis & Snelstart (Week 1)
**Duur**: 30-45 minuten | **Complexiteit**: ⭐

#### Leerdoelen
- Begrijp de kernconcepten en terminologie van Azure Developer CLI
- Installeer en configureer succesvol AZD op je ontwikkelplatform
- Zet je eerste applicatie uit met een bestaande template
- Navigeer effectief in de AZD-commandoregelinterface

#### Belangrijke concepten om te beheersen
- AZD-projectstructuur en componenten (azure.yaml, infra/, src/)
- Template-gebaseerde deployment-werkstromen
- Basisprincipes van omgevingsconfiguratie
- Beheer van resourcegroepen en abonnementen

#### Praktische oefeningen
1. **Installatieverificatie**: Installeer AZD en verifieer met `azd version`
2. **Eerste deployment**: Rol de todo-nodejs-mongo-template succesvol uit
3. **Omgeving instellen**: Configureer je eerste omgevingsvariabelen
4. **Resource verkenning**: Verken gedeploide resources in de Azure Portal

#### Toetsvragen
- Wat zijn de kerncomponenten van een AZD-project?
- Hoe initialiseert u een nieuw project vanuit een template?
- Wat is het verschil tussen `azd up` en `azd deploy`?
- Hoe beheert u meerdere omgevingen met AZD?

---

### Hoofdstuk 2: AI-First Ontwikkeling (Week 2)
**Duur**: 1-2 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Integreer Microsoft Foundry-services met AZD-werkstromen
- Implementeer en configureer AI-aangedreven applicaties
- Begrijp RAG (Retrieval-Augmented Generation) implementatiepatronen
- Beheer AI-modelimplementaties en -schaalbaarheid

#### Belangrijke concepten om te beheersen
- Integratie van Microsoft Foundry Models-service en API-beheer
- AI Search-configuratie en vectorindexering
- Modelimplementatiestrategieën en capaciteitsplanning
- Monitoring en prestatie-optimalisatie van AI-toepassingen

#### Praktische oefeningen
1. **AI-chat implementatie**: Rol de azure-search-openai-demo-template uit
2. **RAG-implementatie**: Configureer documentindexering en retrieval
3. **Modelconfiguratie**: Stel meerdere AI-modellen in met verschillende doeleinden
4. **AI-monitoring**: Implementeer Application Insights voor AI-workloads

#### Toetsvragen
- Hoe configureer je Microsoft Foundry Models-services in een AZD-template?
- Wat zijn de belangrijkste componenten van een RAG-architectuur?
- Hoe beheer je modelcapaciteit en schaalbaarheid?
- Welke monitoringstatistieken zijn belangrijk voor AI-toepassingen?

---

### Hoofdstuk 3: Configuratie & Authenticatie (Week 3)
**Duur**: 45-60 minuten | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Beheers strategieën voor omgevingsconfiguratie en -beheer
- Implementeer veilige authenticatiepatronen en managed identity
- Organiseer resources met juiste naamgevingsconventies
- Configureer multi-omgeving deployments (dev, staging, prod)

#### Belangrijke concepten om te beheersen
- Omgevinghiërarchie en configuratievoorrang
- Managed identity en service principal-authenticatie
- Key Vault-integratie voor geheimenbeheer
- Omgevingsspecifieke parameterbeheer

#### Praktische oefeningen
1. **Multi-omgeving setup**: Configureer dev-, staging- en prod-omgevingen
2. **Beveiligingsconfiguratie**: Implementeer managed identity-authenticatie
3. **Geheimenbeheer**: Integreer Azure Key Vault voor gevoelige gegevens
4. **Parameterbeheer**: Maak omgevingsspecifieke configuraties

#### Toetsvragen
- Hoe configureer je verschillende omgevingen met AZD?
- Wat zijn de voordelen van managed identity ten opzichte van service principals?
- Hoe beheer je applicatiegeheimen veilig?
- Wat is de configuratiehiërarchie in AZD?

---

### Hoofdstuk 4: Infrastructure as Code & Deployment (Week 4-5)
**Duur**: 1-1.5 uur | **Complexiteit**: ⭐⭐⭐

#### Leerdoelen
- Maak en pas Bicep-infrastructuurtemplates aan
- Implementeer geavanceerde deployment-patronen en werkstromen
- Begrijp strategieën voor resourceprovisioning
- Ontwerp schaalbare multi-service architecturen

- Roll out containerized applicaties met Azure Container Apps en AZD


#### Belangrijke concepten om te beheersen
- Bicep-template-structuur en best practices
- Resource-afhankelijkheden en deployment-volgorde
- Parameterbestanden en template-modulariteit
- Aangepaste hooks en deployment-automatisering
- Deployment-patronen voor Container Apps (quick start, productie, microservices)

#### Praktische oefeningen
1. **Aangepaste template maken**: Bouw een multi-service applicatie-template
2. **Bicep-beheersing**: Maak modulaire, herbruikbare infrastructuurcomponenten
3. **Deployment-automatisering**: Implementeer pre/post deployment hooks
4. **Architectuurontwerp**: Rol een complexe microservices-architectuur uit
5. **Container App Deployment**: Rol de [Simple Flask API](../../../examples/container-app/simple-flask-api) en [Microservices Architecture](../../../examples/container-app/microservices) voorbeelden uit met AZD

#### Toetsvragen
- Hoe maak je aangepaste Bicep-templates voor AZD?
- Wat zijn de best practices voor het organiseren van infrastructuurcode?
- Hoe ga je om met resource-afhankelijkheden in templates?
- Welke deployment-patronen ondersteunen zero-downtime-updates?

---

### Hoofdstuk 5: Multi-Agent AI-oplossingen (Week 6-7)
**Duur**: 2-3 uur | **Complexiteit**: ⭐⭐⭐⭐

#### Leerdoelen
- Ontwerp en implementeer multi-agent AI-architecturen
- Orkestreer agentcoördinatie en communicatie
- Rol productieklare AI-oplossingen uit met monitoring
- Begrijp agent-specialisatie en workflowpatronen
- Integreer containerized microservices als onderdeel van multi-agent oplossingen

#### Belangrijke concepten om te beheersen
- Multi-agent architectuurpatronen en ontwerprincipes
- Agentcommunicatieprotocollen en datastromen
- Load balancing en schaalstrategieën voor AI-agents
- Productiemonitoring voor multi-agent systemen
- Service-naar-service communicatie in containerized omgevingen

#### Praktische oefeningen
1. **Retail-oplossing uitrollen**: Rol het volledige multi-agent retailscenario uit
2. **Agentaanpassing**: Wijzig het gedrag van Customer- en Inventory-agents
3. **Architectuur-schaalbaarheid**: Implementeer load balancing en autoscaling
4. **Productiemonitoring**: Stel uitgebreide monitoring en alerting in
5. **Microservices-integratie**: Breid het [Microservices Architecture](../../../examples/container-app/microservices) voorbeeld uit om agentgebaseerde workflows te ondersteunen

#### Toetsvragen
- Hoe ontwerp je effectieve multi-agent communicatiepatronen?
- Wat zijn de belangrijkste overwegingen bij het schalen van AI-agent workloads?
- Hoe monitor en debug je multi-agent AI-systemen?
- Welke productiemethoden zorgen voor betrouwbaarheid van AI-agents?

---

### Hoofdstuk 6: Pre-Deployment Validatie & Planning (Week 8)
**Duur**: 1 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Voer uitgebreide capaciteitsplanning en resourcevalidatie uit
- Selecteer optimale Azure SKUs voor kosteneffectiviteit
- Implementeer geautomatiseerde pre-flight checks en validatie
- Plan deployments met kostenoptimalisatiestrategieën

#### Belangrijke concepten om te beheersen
- Azure resourcequota's en capaciteitslimieten
- SKU-selectiecriteria en kostenoptimalisatie
- Geautomatiseerde validatiescripts en testen
- Deploymentplanning en risicoanalyse

#### Praktische oefeningen
1. **Capaciteitsanalyse**: Analyseer resourcevereisten voor je applicaties
2. **SKU-optimalisatie**: Vergelijk en selecteer kosteneffectieve servicetiers
3. **Validatie-automatisering**: Implementeer pre-deployment check-scripts
4. **Kostenplanning**: Maak schattingen van deploymentkosten en budgetten

#### Toetsvragen
- Hoe valideer je Azure-capaciteit vóór deployment?
- Welke factoren beïnvloeden SKU-selectiebeslissingen?
- Hoe automatiseer je pre-deployment validatie?
- Welke strategieën helpen bij het optimaliseren van deploymentkosten?

---

### Hoofdstuk 7: Troubleshooting & Debugging (Week 9)
**Duur**: 1-1.5 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Ontwikkel systematische debug-aanpakken voor AZD-deployments
- Los veelvoorkomende deployment- en configuratieproblemen op
- Debug AI-specifieke problemen en prestatieproblemen
- Implementeer monitoring en alerting voor proactieve probleemdetectie

#### Belangrijke concepten om te beheersen
- Diagnostische technieken en loggingstrategieën
- Veelvoorkomende foutpatronen en hun oplossingen
- Prestatiemonitoring en optimalisatie
- Incidentrespons en herstelprocedures

#### Praktische oefeningen
1. **Diagnostische vaardigheden**: Oefen met opzettelijk kapotte deployments
2. **Loganalyse**: Gebruik Azure Monitor en Application Insights effectief
3. **Prestatieafstemming**: Optimaliseer traag presterende applicaties
4. **Herstelprocedures**: Implementeer backup- en disaster recovery

#### Toetsvragen
- Wat zijn de meest voorkomende AZD-deploymentfouten?
- Hoe debug je authenticatie- en permissieproblemen?
- Welke monitoringstrategieën helpen productproblemen te voorkomen?
- Hoe optimaliseer je applicatieprestaties in Azure?

---

### Hoofdstuk 8: Productie- & Enterprise-patronen (Week 10-11)
**Duur**: 2-3 uur | **Complexiteit**: ⭐⭐⭐⭐

#### Leerdoelen
- Implementeer enterprise-grade deployment-strategieën
- Ontwerp beveiligingspatronen en compliancekaders
- Stel monitoring, governance en kostenbeheer in
- Creëer schaalbare CI/CD-pijplijnen met AZD-integratie
- Pas best practices toe voor productie-Container App-deployments (beveiliging, monitoring, kosten, CI/CD)

#### Belangrijke concepten om te beheersen
- Enterprise-beveiliging en compliancevereisten
- Governance-kaders en beleidimplementatie
- Geavanceerde monitoring en kostenbeheer
- CI/CD-integratie en geautomatiseerde deployment-pijplijnen
- Blue-green en canary deployment-strategieën voor containerized workloads

#### Praktische oefeningen
1. **Enterprise-beveiliging**: Implementeer uitgebreide beveiligingspatronen
2. **Governance-kader**: Stel Azure Policy en resourcebeheer in
3. **Geavanceerde monitoring**: Maak dashboards en geautomatiseerde alerting
4. **CI/CD-integratie**: Bouw geautomatiseerde deployment-pijplijnen
5. **Productie Container Apps**: Pas beveiliging, monitoring en kostenoptimalisatie toe op het [Microservices Architecture](../../../examples/container-app/microservices) voorbeeld

#### Toetsvragen
- Hoe implementeer je enterprise-beveiliging in AZD-deployments?
- Welke governancepatronen zorgen voor compliance en kostenbeheersing?
- Hoe ontwerp je schaalbare monitoring voor productiesystemen?
- Welke CI/CD-patronen werken het beste met AZD-werkstromen?

#### Leerdoelen
- Begrijp de fundamenten en kernconcepten van Azure Developer CLI
- Installeer en configureer succesvol azd op je ontwikkelomgeving
- Voltooi je eerste deployment met een bestaande template
- Navigeer door de azd-projectstructuur en begrijp de belangrijkste componenten

#### Belangrijke concepten om te beheersen
- Templates, omgevingen en services
- azure.yaml configuratiestructuur
- Basis azd-commando's (init, up, down, deploy)
- Infrastructure as Code-principes
- Azure-authenticatie en autorisatie

#### Oefenopdrachten

**Oefening 1.1: Installatie en Setup**
```bash
# Voltooi deze taken:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Oefening 1.2: Eerste Deployment**
```bash
# Rol een eenvoudige webapplicatie uit:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Oefening 1.3: Projectstructuuranalyse**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Zelfbeoordelingsvragen
1. Wat zijn de drie kernconcepten van azd-architectuur?
2. Wat is het doel van het azure.yaml-bestand?
3. Hoe helpen omgevingen bij het beheren van verschillende deploymentdoelen?
4. Welke authenticatiemethoden kunnen met azd worden gebruikt?
5. Wat gebeurt er wanneer je `azd up` voor het eerst uitvoert?

---

## Voortgangsregistratie en beoordelingskader
```bash
# Maak en configureer meerdere omgevingen:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Oefening 2.2: Geavanceerde configuratie**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Oefening 2.3: Beveiligingsconfiguratie**
```bash
# Implementeer de beste beveiligingspraktijken:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Zelfbeoordelingsvragen
1. Hoe gaat azd om met de voorrang van omgevingsvariabelen?
2. Wat zijn deployment hooks en wanneer zou je ze gebruiken?
3. Hoe configureer je verschillende SKUs voor verschillende omgevingen?
4. Wat zijn de beveiligingsimplicaties van verschillende authenticatiemethoden?
5. Hoe beheer je geheimen en gevoelige configuratiegegevens?

### Module 3: Deployment en Provisioning (Week 4)

#### Leerdoelen
- Beheers deployment-werkstromen en best practices
- Begrijp Infrastructure as Code met Bicep-templates
- Implementeer complexe multi-service architecturen
- Optimaliseer deploymentprestaties en betrouwbaarheid

#### Belangrijke concepten om te beheersen
- Bicep-template-structuur en modules
- Resource-afhankelijkheden en volgorde
- Deployment-strategieën (blue-green, rolling updates)
- Multi-region deployments
- Database-migraties en databeheer

#### Oefenopdrachten

**Oefening 3.1: Aangepaste infrastructuur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Oefening 3.2: Multi-service applicatie**
```bash
# Implementeer een microservices-architectuur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Oefening 3.3: Database-integratie**
```bash
# Implementeer patronen voor database-implementatie:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Zelfbeoordelingsvragen
1. Wat zijn de voordelen van het gebruik van Bicep ten opzichte van ARM-templates?
2. Hoe ga je om met databasemigraties in azd-deployments?
3. Welke strategieën bestaan er voor zero-downtime deployments?
4. Hoe beheer je afhankelijkheden tussen services?
5. Wat zijn de overwegingen voor multi-region deployments?

### Module 4: Pre-Deployment Validatie (Week 5)

#### Leerdoelen
- Implementeer uitgebreide controles voorafgaand aan de uitrol
- Beheers capaciteitsplanning en resource-validatie
- Begrijp SKU-selectie en kostenoptimalisatie
- Bouw geautomatiseerde validatiepijplijnen

#### Belangrijke concepten om te beheersen
- Azure resourcequota's en limieten
- Criteria voor SKU-selectie en kostenimplicaties
- Geautomatiseerde validatiescripts en -tools
- Methodologieën voor capaciteitsplanning
- Prestatie-testen en optimalisatie

#### Praktijkoefeningen

**Oefening 4.1: Capaciteitsplanning**
```bash
# Implementeer capaciteitsvalidatie:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Oefening 4.2: Pre-flightvalidatie**
```powershell
# Bouw een uitgebreide validatiepijplijn:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Oefening 4.3: SKU-optimalisatie**
```bash
# Optimaliseer serviceconfiguraties:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Zelfbeoordelingsvragen
1. Welke factoren moeten een rol spelen bij het kiezen van een SKU?
2. Hoe valideer je de beschikbaarheid van Azure-resources vóór uitrol?
3. Wat zijn de belangrijkste componenten van een pre-flight check-systeem?
4. Hoe schat en beheers je de uitrolkosten?
5. Welke monitoring is essentieel voor capaciteitsplanning?

### Module 5: Probleemoplossing en Debugging (Week 6)

#### Leerdoelen
- Beheers systematische methodologieën voor probleemoplossing
- Ontwikkel expertise in het debuggen van complexe uitrolproblemen
- Implementeer uitgebreide monitoring en waarschuwingen
- Bouw procedures voor incidentrespons en herstel

#### Belangrijke concepten om te beheersen
- Veelvoorkomende faalpatronen bij uitrol
- Loganalyse en correlatietechnieken
- Prestatiemonitoring en optimalisatie
- Detectie en respons op beveiligingsincidenten
- Rampenherstel en bedrijfscontinuïteit

#### Praktijkoefeningen

**Oefening 5.1: Probleemoplossingsscenario's**
```bash
# Oefen met het oplossen van veelvoorkomende problemen:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Oefening 5.2: Monitoring-implementatie**
```bash
# Stel uitgebreide monitoring in:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Oefening 5.3: Incidentrespons**
```bash
# Ontwikkel procedures voor incidentrespons:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Zelfbeoordelingsvragen
1. Wat is de systematische aanpak voor het oplossen van problemen bij azd-deployments?
2. Hoe correleer je logs over meerdere diensten en resources?
3. Welke monitoringmetrics zijn het belangrijkst voor vroege probleemdetectie?
4. Hoe implementeer je effectieve procedures voor rampenherstel?
5. Wat zijn de belangrijkste componenten van een incidentresponsplan?

### Module 6: Geavanceerde onderwerpen en beste praktijken (Week 7-8)

#### Leerdoelen
- Implementeer enterprise-grade uitrolpatronen
- Beheers CI/CD-integratie en automatisering
- Ontwikkel aangepaste templates en draag bij aan de community
- Begrijp geavanceerde beveiligings- en nalevingsvereisten

#### Belangrijke concepten om te beheersen
- Integratiepatronen voor CI/CD-pijplijnen
- Ontwikkeling en distributie van aangepaste templates
- Enterprise governance en naleving
- Geavanceerde netwerk- en beveiligingsconfiguraties
- Prestatieoptimalisatie en kostenbeheer

#### Praktijkoefeningen

**Oefening 6.1: CI/CD-integratie**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Oefening 6.2: Ontwikkeling van aangepaste templates**
```bash
# Maak aangepaste sjablonen aan en publiceer ze:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Oefening 6.3: Enterprise-implementatie**
```bash
# Implementeer functies voor ondernemingen:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Zelfbeoordelingsvragen
1. Hoe integreer je azd in bestaande CI/CD-workflows?
2. Wat zijn de belangrijkste aandachtspunten bij het ontwikkelen van aangepaste templates?
3. Hoe implementeer je governance en naleving in azd-deployments?
4. Wat zijn de beste praktijken voor uitrol op ondernemingsschaal?
5. Hoe draag je effectief bij aan de azd-community?

## Praktische projecten

### Project 1: Persoonlijke portfoliowebsite
**Complexiteit**: Beginner  
**Duur**: 1-2 weken

Bouw en implementeer een persoonlijke portfoliowebsite met:
- Statische website-hosting op Azure Storage
- Configuratie van een aangepast domein
- CDN-integratie voor wereldwijde prestaties
- Geautomatiseerde deployment-pijplijn

**Op te leveren**:
- Werkende website uitgerold op Azure
- Aangepast azd-template voor portfolio-uitrols
- Documentatie van het uitrolproces
- Kostenanalyse en aanbevelingen voor optimalisatie

### Project 2: Taakbeheerapplicatie
**Complexiteit**: Gemiddeld  
**Duur**: 2-3 weken

Maak een full-stack taakbeheertoepassing met:
- React-frontend uitgerold naar App Service
- Node.js API-backend met authenticatie
- PostgreSQL-database met migraties
- Application Insights-monitoring

**Op te leveren**:
- Complete applicatie met gebruikersauthenticatie
- Databaseschema en migratiescripts
- Monitoringdashboards en waarschuwingsregels
- Deploy-configuratie voor meerdere omgevingen

### Project 3: Microservices e-commerceplatform
**Complexiteit**: Geavanceerd  
**Duur**: 4-6 weken

Ontwerp en implementeer een op microservices gebaseerd e-commerceplatform:
- Meerdere API-diensten (catalogus, bestellingen, betalingen, gebruikers)
- Berichtenwachtrij-integratie met Service Bus
- Redis-cache voor prestatieoptimalisatie
- Uitgebreide logging en monitoring

**Referentievoorbeeld**: Zie [Microservices-architectuur](../../../examples/container-app/microservices) voor een productieklare template en implementatiegids

**Op te leveren**:
- Volledige microservices-architectuur
- Patronen voor communicatie tussen services
- Prestatie-testen en optimalisatie
- Productieklaar beveiligingsimplementatie

## Beoordeling en certificering

### Kenniscontroles

Voltooi deze beoordelingen na elke module:

**Module 1 Beoordeling**: Basisconcepten en installatie
- Meerkeuzevragen over kernconcepten
- Praktische installatie- en configuratietaken
- Eenvoudige uitroloefening

**Module 2 Beoordeling**: Configuratie en omgevingen
- Scenario's voor omgevingsbeheer
- Oefeningen voor configuratieprobleemoplossing
- Implementatie van beveiligingsconfiguratie

**Module 3 Beoordeling**: Uitrol en provisioning
- Uitdagingen op het gebied van infrastructuurontwerp
- Scenario's voor multi-service-uitrol
- Oefeningen voor prestatieoptimalisatie

**Module 4 Beoordeling**: Voorafgaande validatie
- Case studies voor capaciteitsplanning
- Scenario's voor kostenoptimalisatie
- Implementatie van validatiepijplijnen

**Module 5 Beoordeling**: Probleemoplossing en debugging
- Oefeningen voor probleemdiagnose
- Taken voor implementatie van monitoring
- Simulaties van incidentrespons

**Module 6 Beoordeling**: Geavanceerde onderwerpen
- Ontwerp van CI/CD-pijplijnen
- Ontwikkeling van aangepaste templates
- Enterprise-architectuurscenario's

### Eindopdracht

Ontwerp en implementeer een complete oplossing die beheersing van alle concepten aantoonbaar maakt:

**Vereisten**:
- Meerlaagse applicatiearchitectuur
- Meerdere uitrolomgevingen
- Uitgebreide monitoring en waarschuwingssystemen
- Implementatie van beveiliging en naleving
- Kostenoptimalisatie en prestatieafstemming
- Volledige documentatie en runbooks

**Evaluatiecriteria**:
- Kwaliteit van de technische implementatie
- Volledigheid van de documentatie
- Naleving van beveiligings- en beste praktijken
- Prestatie- en kostenoptimalisatie
- Effectiviteit van probleemoplossing en monitoring

## Studiebronnen en referenties

### Officiële documentatie
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep-documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Communitybronnen
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub-organisatie](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub-repository](https://github.com/Azure/azure-dev)

### Praktijkomgevingen
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Aanvullende tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Aanbevolen studieschema

### Voltijdstudie (8 weken)
- **Weken 1-2**: Modules 1-2 (Aan de slag, Configuratie)
- **Weken 3-4**: Modules 3-4 (Uitrol, Voorafgaande validatie)
- **Weken 5-6**: Modules 5-6 (Probleemoplossing, Geavanceerde onderwerpen)
- **Weken 7-8**: Praktische projecten en eindbeoordeling

### Deeltijdstudie (16 weken)
- **Weken 1-4**: Module 1 (Aan de slag)
- **Weken 5-7**: Module 2 (Configuratie en omgevingen)
- **Weken 8-10**: Module 3 (Uitrol en provisioning)
- **Weken 11-12**: Module 4 (Voorafgaande validatie)
- **Weken 13-14**: Module 5 (Probleemoplossing en debugging)
- **Weken 15-16**: Module 6 (Geavanceerde onderwerpen en beoordeling)

---

## Voortgangsregistratie en beoordelingskader

### Checklist voor hoofdstukvoltooiing

Volg je voortgang door elk hoofdstuk met deze meetbare uitkomsten:

#### 📚 Hoofdstuk 1: Basis & Aan de slag
- [ ] **Installatie voltooid**: AZD geïnstalleerd en geverifieerd op je platform
- [ ] **Eerste implementatie**: Succesvol het todo-nodejs-mongo-template uitgerold
- [ ] **Omgeving ingesteld**: Eerste omgevingsvariabelen geconfigureerd
- [ ] **Resources verkend**: Uitgerolde resources in de Azure Portal bekeken
- [ ] **Beheersing van commando's**: Vertrouwd met basis AZD-commando's

#### 🤖 Hoofdstuk 2: AI-first ontwikkeling  
- [ ] **AI-templateimplementatie**: Succesvol azure-search-openai-demo uitgerold
- [ ] **RAG-implementatie**: Documentindexering en -opvraging geconfigureerd
- [ ] **Modelconfiguratie**: Meerdere AI-modellen opgezet voor verschillende doeleinden
- [ ] **AI-monitoring**: Application Insights geïmplementeerd voor AI-workloads
- [ ] **Prestatieoptimalisatie**: AI-applicatieprestaties afgesteld

#### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
- [ ] **Multi-omgeving ingesteld**: dev-, staging- en prod-omgevingen geconfigureerd
- [ ] **Beveiligingsimplementatie**: Managed identity-authenticatie ingesteld
- [ ] **Geheimenbeheer**: Azure Key Vault geïntegreerd voor gevoelige gegevens
- [ ] **Parameterbeheer**: Omgeving-specifieke configuraties gemaakt
- [ ] **Authenticatiebeheersing**: Veilige toegangsarchitecturen geïmplementeerd

#### 🏗️ Hoofdstuk 4: Infrastructure as Code & Uitrol
- [ ] **Aangepaste templatecreatie**: Een multi-service applicatemplate gemaakt
- [ ] **Bicep-beheersing**: Modulaire, herbruikbare infrastructuurcomponenten aangemaakt
- [ ] **Automatisering van uitrol**: Pre- en post-deploy hooks geïmplementeerd
- [ ] **Architectuurontwerp**: Complexe microservices-architectuur uitgerold
- [ ] **Templateoptimalisatie**: Templates geoptimaliseerd voor prestaties en kosten

#### 🎯 Hoofdstuk 5: Multi-agent AI-oplossingen
- [ ] **Retailoplossing implementatie**: Compleet multi-agent retailscenario uitgerold
- [ ] **Agentaanpassing**: Gedrag van Customer- en Inventory-agent aangepast
- [ ] **Architectuurschaling**: Load balancing en auto-scaling geïmplementeerd
- [ ] **Productiemonitoring**: Uitgebreide monitoring en waarschuwingen ingesteld
- [ ] **Prestatieafstemming**: Multi-agent systeemprestaties geoptimaliseerd

#### 🔍 Hoofdstuk 6: Voorafgaande validatie & planning
- [ ] **Capaciteitsanalyse**: Resourcevereisten voor applicaties geanalyseerd
- [ ] **SKU-optimalisatie**: Kosteneffectieve servicetiers geselecteerd
- [ ] **Validatie-automatisering**: Pre-deployment controlscripts geïmplementeerd
- [ ] **Kostenplanning**: Schattingen van uitrolkosten en budgetten gemaakt
- [ ] **Risicobeoordeling**: Uitrolrisico's geïdentificeerd en gemitigeerd

#### 🚨 Hoofdstuk 7: Probleemoplossing & Debugging
- [ ] **Diagnostische vaardigheden**: Succesvol debuggen van opzettelijk kapotte uitrols
- [ ] **Loganalyse**: Azure Monitor en Application Insights effectief gebruikt
- [ ] **Prestatieafstemming**: Trage applicaties geoptimaliseerd
- [ ] **Herstelprocedures**: Back-up en rampenherstel geïmplementeerd
- [ ] **Monitoringconfiguratie**: Proactieve monitoring en waarschuwingen ingericht

#### 🏢 Hoofdstuk 8: Productie- en enterprisepatronen
- [ ] **Enterprise-beveiliging**: Uitgebreide beveiligingspatronen geïmplementeerd
- [ ] **Governancekader**: Azure Policy en resourcebeheer opgezet
- [ ] **Geavanceerde monitoring**: Dashboards en geautomatiseerde waarschuwingen aangemaakt
- [ ] **CI/CD-integratie**: Geautomatiseerde uitrolpijplijnen opgebouwd
- [ ] **Nalevingsimplementatie**: Voldoet aan enterprise-compliancevereisten

### Leerplanning en mijlpalen

#### Week 1-2: Basis opbouwen
- **Mijlpaal**: Eerste AI-applicatie uitrollen met AZD
- **Validatie**: Werkende applicatie toegankelijk via publieke URL
- **Vaardigheden**: Basis AZD-workflows en integratie van AI-diensten

#### Week 3-4: Configuratiebeheersing
- **Mijlpaal**: Multi-omgevinguitrol met veilige authenticatie
- **Validatie**: Dezelfde applicatie uitgerold naar dev/staging/prod
- **Vaardigheden**: Omgevingsbeheer en beveiligingsimplementatie

#### Week 5-6: Infrastructuurexpertise
- **Mijlpaal**: Aangepaste template voor complexe multi-serviceapplicatie
- **Validatie**: Herbruikbare template uitgerold door een ander teamlid
- **Vaardigheden**: Bicep-beheersing en infrastructuurautomatisering

#### Week 7-8: Geavanceerde AI-implementatie
- **Mijlpaal**: Productieklaar multi-agent AI-oplossing
- **Validatie**: Systeem verwerkt real-world load met monitoring
- **Vaardigheden**: Multi-agent orkestratie en prestatieoptimalisatie

#### Week 9-10: Productieklaarheid
- **Mijlpaal**: Deploy op enterprise-niveau met volledige naleving
- **Validatie**: Geslaagd voor security review en kostenoptimalisatie-audit
- **Vaardigheden**: Governance, monitoring en CI/CD-integratie

### Beoordeling en certificering

#### Methoden voor kennisvalidatie
1. **Praktische uitrol**: Werkende applicaties voor elk hoofdstuk
2. **Code-reviews**: Beoordeling van template- en configuratiekwaliteit
3. **Probleemoplossing**: Scenario's voor probleemoplossing en oplossingen
4. **Peer-onderwijs**: Verklaar concepten aan medeleerlingen
5. **Bijdrage aan community**: Deel templates of verbeteringen

#### Professionele ontwikkelingsuitkomsten
- **Portfolioprojecten**: 8 productieklare implementaties
- **Technische vaardigheden**: AZD- en AI-implementatie-expertise volgens industriestandaarden
- **Probleemoplossend vermogen**: Onafhankelijke foutopsporing en optimalisatie
- **Communityerkenning**: Actieve deelname aan de Azure-ontwikkelaarscommunity
- **Carrière-ontwikkeling**: Vaardigheden direct toepasbaar op cloud- en AI-rollen

#### Succesindicatoren
- **Implementatiesuccespercentage**: >95% succesvolle implementaties
- **Tijd voor probleemoplossing**: <30 minuten voor veelvoorkomende problemen
- **Prestatieoptimalisatie**: Aantoonbare verbeteringen in kosten en prestaties
- **Naleving van beveiligingsnormen**: Alle implementaties voldoen aan bedrijfsbeveiligingsnormen
- **Kennisoverdracht**: Vermogen om andere ontwikkelaars te begeleiden

### Voortdurend leren en communitybetrokkenheid

#### Blijf op de hoogte
- **Azure-updates**: Volg de release-opmerkingen van de Azure Developer CLI
- **Community-evenementen**: Neem deel aan evenementen voor Azure- en AI-ontwikkelaars
- **Documentatie**: Draag bij aan documentatie en voorbeelden in de community
- **Feedbackcyclus**: Geef feedback op cursusinhoud en Azure-diensten

#### Carrièreontwikkeling
- **Professioneel netwerk**: Leg contact met Azure- en AI-experts
- **Spreekmogelijkheden**: Presenteer je inzichten op conferenties of meetups
- **Open source-bijdrage**: Draag bij aan AZD-sjablonen en -tools
- **Mentorschap**: Begeleid andere ontwikkelaars in hun AZD-leertraject

---

**Hoofdstuknavigatie:**
- **📚 Cursusstartpagina**: [AZD voor beginners](../README.md)
- **📖 Begin met leren**: [Hoofdstuk 1: Basis & Snelstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Voortgang bijhouden**: Volg je voortgang door het uitgebreide leersysteem van 8 hoofdstukken
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) voor ondersteuning en discussie

**Studievoortgang bijhouden**: Gebruik deze gestructureerde gids om de Azure Developer CLI te beheersen door stapsgewijs, praktisch te leren met meetbare resultaten en voordelen voor professionele ontwikkeling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->