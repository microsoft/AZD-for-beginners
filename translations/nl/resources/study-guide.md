# Studiehandleiding - Uitgebreide Leerdoelen

**Navigatie van het Leertraject**
- **📚 Cursusstartpagina**: [AZD Voor Beginners](../README.md)
- **📖 Begin met Leren**: [Hoofdstuk 1: Basis & Snelle Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Voortgang Bijhouden**: [Cursusafronding](../README.md#-course-completion--certification)

## Introductie

Deze uitgebreide studiehandleiding biedt gestructureerde leerdoelen, kernconcepten, oefeningsoefeningen en beoordelingsmaterialen om je te helpen Azure Developer CLI (azd) te beheersen. Gebruik deze gids om je voortgang bij te houden en ervoor te zorgen dat je alle essentiële onderwerpen hebt behandeld.

## Leerdoelen

Door deze studiehandleiding te voltooien, zul je:
- Alle fundamentele en gevorderde concepten van Azure Developer CLI beheersen
- Praktische vaardigheden ontwikkelen in het implementeren en beheren van Azure-toepassingen
- Vertrouwen opbouwen in het oplossen van problemen en optimaliseren van implementaties
- Productieklaar implementatiepraktijken en beveiligingsoverwegingen begrijpen

## Leerresultaten

Na voltooiing van alle onderdelen van deze studiehandleiding, zul je in staat zijn om:
- Volledige applicatie-architecturen ontwerpen, implementeren en beheren met azd
- Uitgebreide strategieën voor monitoring, beveiliging en kostenoptimalisatie implementeren
- Complexe implementatieproblemen zelfstandig oplossen
- Aangepaste sjablonen maken en bijdragen aan de azd-community

## Leerstructuur van 8 Hoofdstukken

### Hoofdstuk 1: Basis & Snelle Start (Week 1)
**Duur**: 30-45 minuten | **Complexiteit**: ⭐

#### Leerdoelen
- Basisconcepten en terminologie van Azure Developer CLI begrijpen
- AZD succesvol installeren en configureren op je ontwikkelplatform
- Je eerste applicatie implementeren met een bestaande sjabloon
- Effectief navigeren in de AZD commandoregelinterface

#### Kernconcepten om te Beheersen
- AZD projectstructuur en componenten (azure.yaml, infra/, src/)
- Sjabloon-gebaseerde implementatieworkflows
- Basisprincipes van omgevingsconfiguratie
- Beheer van resourcegroepen en abonnementen

#### Praktische Oefeningen
1. **Installatie Verificatie**: Installeer AZD en verifieer met `azd version`
2. **Eerste Implementatie**: Implementeer de todo-nodejs-mongo sjabloon succesvol
3. **Omgevingsinstelling**: Configureer je eerste omgevingsvariabelen
4. **Resource Verkenning**: Navigeer door geïmplementeerde resources in Azure Portal

#### Beoordelingsvragen
- Wat zijn de kerncomponenten van een AZD-project?
- Hoe initialiseert je een nieuw project vanuit een sjabloon?
- Wat is het verschil tussen `azd up` en `azd deploy`?
- Hoe beheer je meerdere omgevingen met AZD?

---

### Hoofdstuk 2: AI-First Ontwikkeling (Week 2)
**Duur**: 4-5 uur inclusief workshop | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Microsoft Foundry-services integreren met AZD-workflows
- Gebruik de GA `microsoft.foundry` bundel met AZD 1.37.0+ voor hosted-agent ontwikkeling
- AI-aangedreven applicaties implementeren en configureren
- RAG (Retrieval-Augmented Generation) implementatiepatronen begrijpen
- AI model deployments en schaling beheren

#### Kernconcepten om te Beheersen
- Integratie van Microsoft Foundry Models-service en API-beheer
- AI Search configuratie en vectorindexering
- Modelimplementatiestrategieën en capaciteitsplanning
- Monitoring van AI-toepassingen en prestatieoptimalisatie
- Local Agent Inspector versus cloud-traces, broncode-implementatie en evaluatiematerialen in versiebeheer

#### Praktische Oefeningen
1. **AI Chat Implementatie**: Implementeer de azure-search-openai-demo sjabloon
2. **RAG Implementatie**: Configureer documentindexering en ophalen
3. **Modelconfiguratie**: Zet meerdere AI-modellen op met verschillende doeleinden
4. **AI Monitoring**: Implementeer Application Insights voor AI-werkbelasting
5. **GA Hosted Agent**: Volg de [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); vergelijk lokale en cloud-antwoorden, bekijk een evaluatieresultaat en verifieer schoonmaakrechten

#### Beoordelingsvragen
- Hoe configureer je Microsoft Foundry Models-services in een AZD-sjabloon?
- Wat zijn de belangrijkste componenten van een RAG-architectuur?
- Hoe beheer je capaciteit en schaling van AI-modellen?
- Welke monitoringmetrieken zijn belangrijk voor AI-toepassingen?
- Welke extensies zijn inbegrepen in `microsoft.foundry` en waarom worden evaluaties apart geïnstalleerd?
- Waarom brengen lokale agenttests nog steeds Azure modelkosten met zich mee?
- Wat laat `azd down` achter wanneer je een bestaande Foundry-project hergebruikt?

---

### Hoofdstuk 3: Configuratie & Authenticatie (Week 3)
**Duur**: 45-60 minuten | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Beheers omgevingsconfiguratie en -beheerstrategieën
- Implementeer veilige authenticatiepatronen en managed identity
- Organiseer resources met correcte naamgevingsconventies
- Configureer implementaties voor meerdere omgevingen (dev, staging, prod)

#### Kernconcepten om te Beheersen
- Omgevingshiërarchie en configuratievoorrang
- Managed identity en service principal authenticatie
- Key Vault-integratie voor secretsbeheer
- Omgevingsspecifiek parametermanagement

#### Praktische Oefeningen
1. **Multi-Omgeving Setup**: Configureer dev-, staging- en prod-omgevingen
2. **Beveiligingsconfiguratie**: Implementeer managed identity authenticatie
3. **Secrets Management**: Integreer Azure Key Vault voor gevoelige data
4. **Parametermanagement**: Maak omgevingsspecifieke configuraties

#### Beoordelingsvragen
- Hoe configureer je verschillende omgevingen met AZD?
- Wat zijn de voordelen van het gebruik van managed identity ten opzichte van service principals?
- Hoe beheer je applicatiegeheimen veilig?
- Wat is de configuratiehiërarchie in AZD?

---

### Hoofdstuk 4: Infrastructure as Code & Implementatie (Week 4-5)
**Duur**: 1-1,5 uur | **Complexiteit**: ⭐⭐⭐

#### Leerdoelen
- Maak en pas Bicep infrastructuursjablonen aan
- Implementeer geavanceerde implementatiepatronen en workflows
- Begrijp resource provisioning strategieën
- Ontwerp schaalbare multi-service architecturen

- Implementeer containerized applicaties met Azure Container Apps en AZD


#### Kernconcepten om te Beheersen
- Bicep sjabloonstructuur en best practices
- Resource afhankelijkheden en implementatievolgorde
- Parameterbestanden en modulariteit van sjablonen
- Aangepaste hooks en implementatie-automatisering
- Implementatiepatronen voor containerapps (snelle start, productie, microservices)

#### Praktische Oefeningen
1. **Aangepaste Sjablooncreatie**: Bouw een multi-service applicatiesjabloon
2. **Bicep Beheersing**: Maak modulaire, herbruikbare infrastructuurcomponenten
3. **Automatisering Implementatie**: Implementeer pre/post implementatie hooks
4. **Architectuurontwerp**: Implementeer complexe microservices architectuur
5. **Container App Implementatie**: Implementeer de [Simple Flask API](../../../examples/container-app/simple-flask-api) en [Microservices Architecture](../../../examples/container-app/microservices) voorbeelden met AZD

#### Beoordelingsvragen
- Hoe maak je aangepaste Bicep-sjablonen voor AZD?
- Wat zijn de beste praktijken voor het organiseren van infrastructuurcode?
- Hoe ga je om met resource-afhankelijkheden in sjablonen?
- Welke implementatiepatronen ondersteunen zero-downtime updates?

---

### Hoofdstuk 5: Multi-Agent AI Oplossingen (Week 6-7)
**Duur**: 2-3 uren | **Complexiteit**: ⭐⭐⭐⭐

#### Leerdoelen
- Ontwerp en implementatie van multi-agent AI-architecturen
- Orkestreer agentcoördinatie en communicatie
- Implementeer productieklaar AI-oplossingen met monitoring
- Begrijp agent-specialisatie en workflowpatronen
- Integreer containerized microservices als onderdeel van multi-agent oplossingen

#### Kernconcepten om te Beheersen
- Multi-agent architectuurpatronen en ontwerpprincipes
- Agentcommunicatieprotocollen en datastromen
- Load balancing en schaalstrategieën voor AI-agents
- Productiemonitoring voor multi-agent systemen
- Service-to-service communicatie in containerized omgevingen

#### Praktische Oefeningen
1. **Retail Architectuur Review**: Analyseer het retail blueprint en identificeer welke applicatiecomponenten moeten worden geïmplementeerd vóór implementatie
2. **Agent Aanpassing**: Pas het gedrag van Customer- en Inventory-agent aan
3. **Architectuur Schalen**: Implementeer load balancing en auto-scaling
4. **Productiemonitoring**: Stel uitgebreide monitoring en waarschuwingen in
5. **Microservices Integratie**: Breid het [Microservices Architecture](../../../examples/container-app/microservices) voorbeeld uit om agentgebaseerde workflows te ondersteunen

#### Beoordelingsvragen
- Hoe ontwerp je effectieve multi-agent communicatiepatronen?
- Wat zijn belangrijke overwegingen voor het schalen van AI-agent workloads?
- Hoe monitor en debug je multi-agent AI-systemen?
- Welke productiepatronen garanderen betrouwbaarheid voor AI-agents?

---

### Hoofdstuk 6: Validatie & Planning voor Implementatie (Week 8)
**Duur**: 1 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Voer uitgebreide capaciteitsplanning en resourcevalidatie uit
- Selecteer optimale Azure SKU's voor kosteneffectiviteit
- Implementeer geautomatiseerde pre-flight controles en validatie
- Plan implementaties met kostenoptimalisatiestrategieën

#### Kernconcepten om te Beheersen
- Azure resourcequota's en capaciteitslimieten
- Criteria voor SKU-selectie en kostenoptimalisatie
- Geautomatiseerde validatiescripts en testen
- Implementatieplanning en risicobeoordeling

#### Praktische Oefeningen
1. **Capaciteitsanalyse**: Analyseer resourcebehoeften voor je applicaties
2. **SKU-optimalisatie**: Vergelijk en selecteer kosteneffectieve servicetiers
3. **Validatie-automatisering**: Implementeer pre-implementatie controlescripts
4. **Kostenplanning**: Maak kostenramingen en budgetten voor implementaties

#### Beoordelingsvragen
- Hoe valideer je Azure-capaciteit vóór implementatie?
- Welke factoren beïnvloeden SKU-selectiebeslissingen?
- Hoe automatiseer je validatie vóór implementatie?
- Welke strategieën helpen bij het optimaliseren van implementatiekosten?

---

### Hoofdstuk 7: Probleemoplossing & Debugging (Week 9)
**Duur**: 1-1,5 uur | **Complexiteit**: ⭐⭐

#### Leerdoelen
- Ontwikkel systematische debugmethoden voor AZD-implementaties
- Los veelvoorkomende implementatie- en configuratieproblemen op
- Debug AI-specifieke problemen en prestatieproblemen
- Implementeer monitoring en waarschuwingen voor proactieve probleemdetectie

#### Kernconcepten om te Beheersen
- Diagnostische technieken en logstrategieën
- Veelvoorkomende foutpatronen en hun oplossingen
- Prestatiemonitoring en optimalisatie
- Incidentrespons en herstelprocedures

#### Praktische Oefeningen
1. **Diagnosevaardigheden**: Oefen met opzettelijk gebroken implementaties
2. **Loganalyse**: Gebruik Azure Monitor en Application Insights effectief
3. **Prestatie-optimalisatie**: Optimaliseer langzaam presterende applicaties
4. **Herstelprocedures**: Implementeer back-up en rampenherstel

#### Beoordelingsvragen
- Wat zijn de meest voorkomende AZD-implementatiefouten?
- Hoe debug je authenticatie- en permissieproblemen?
- Welke monitoringstrategieën helpen productieproblemen te voorkomen?
- Hoe optimaliseer je applicatieprestaties in Azure?

---

### Hoofdstuk 8: Productie- & Enterprisepatronen (Week 10-11)
**Duur**: 2-3 uren | **Complexiteit**: ⭐⭐⭐⭐

#### Leerdoelen
- Implementeer enterprise-grade implementatiestrategieën
- Ontwerp beveiligingspatronen en compliance-kaders
- Stel monitoring, governance en kostenbeheer in
- Creëer schaalbare CI/CD pipelines met AZD-integratie
- Pas best practices toe voor productie-containerapp-implementaties (beveiliging, monitoring, kosten, CI/CD)

#### Kernconcepten om te Beheersen
- Enterprise-beveiligings- en compliancevereisten
- Governance-kaders en beleidsimplementatie
- Geavanceerde monitoring en kostenbeheer
- CI/CD-integratie en geautomatiseerde implementatiepipelines
- Blue-green en canary implementatiestrategieën voor containerized workloads

#### Praktische Oefeningen
1. **Enterprise Beveiliging**: Implementeer uitgebreide beveiligingspatronen
2. **Governance Kader**: Stel Azure Policy en resourcebeheer in
3. **Geavanceerde Monitoring**: Maak dashboards en geautomatiseerde waarschuwingen
4. **CI/CD Integratie**: Bouw geautomatiseerde implementatiepipelines
5. **Productiecontainerapps**: Pas beveiliging, monitoring en kostenoptimalisatie toe op het [Microservices Architecture](../../../examples/container-app/microservices) voorbeeld

#### Beoordelingsvragen
- Hoe implementeer je enterprise-beveiliging in AZD-implementaties?
- Welke governancepatronen zorgen voor compliance en kostenbeheersing?
- Hoe ontwerp je schaalbare monitoring voor productiesystemen?
- Welke CI/CD-patronen werken het beste met AZD-workflows?

#### Leerdoelen
- Begrijp Azure Developer CLI fundamenten en kernconcepten
- Installeer en configureer azd succesvol op je ontwikkelomgeving
- Voltooi je eerste implementatie met een bestaande sjabloon
- Navigeer door de azd projectstructuur en begrijp kerncomponenten

#### Kernconcepten om te Beheersen
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
1. Hoe gaat azd om met de voorrang van omgevingsvariabelen?
2. Wat zijn implementatiehooks en wanneer gebruik je ze?
3. Hoe configureer je verschillende SKU's voor verschillende omgevingen?
4. Wat zijn de beveiligingsimplicaties van verschillende authenticatiemethoden?
5. Hoe beheer je geheimen en gevoelige configuratiegegevens?

### Module 3: Implementatie en Provisioning (Week 4)

#### Leerdoelen
- Beheers implementatieworkflows en best practices
- Begrijp Infrastructure as Code met Bicep-sjablonen
- Implementeer complexe multi-service architecturen
- Optimaliseer implementatieprestaties en betrouwbaarheid

#### Kernconcepten om te Beheersen
- Bicep-sjabloonstructuur en modules
- Resource-afhankelijkheden en volgordebepaling
- Implementatiestrategieën (blue-green, rolling updates)
- Multi-regio implementaties
- Database-migraties en databeheer

#### Oefeningen

**Oefening 3.1: Aangepaste infrastructuur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Oefening 3.2: Multi-service applicatie**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Oefening 3.3: Database-integratie**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Zelfbeoordelingsvragen
1. Wat zijn de voordelen van het gebruik van Bicep boven ARM-templates?
2. Hoe ga je om met databasemigraties bij azd-implementaties?
3. Welke strategieën bestaan er voor zero-downtime deployments?
4. Hoe beheer je afhankelijkheden tussen diensten?
5. Wat zijn de overwegingen voor implementaties over meerdere regio's?

### Module 4: Validatie vóór implementatie (Week 5)

#### Leerdoelen
- Uitvoeren van uitgebreide controles vóór implementatie
- Beheersen van capaciteitsplanning en resourcevalidatie
- Begrijpen van SKU-selectie en kostenoptimalisatie
- Bouwen van geautomatiseerde validatiepipelines

#### Belangrijke concepten om te beheersen
- Azure resource quota's en limieten
- SKU-selectiecriteria en kostenimplicaties
- Geautomatiseerde validatiescripts en tools
- Methodologieën voor capaciteitsplanning
- Prestatie testen en optimalisatie

#### Praktijkopdrachten

**Oefening 4.1: Capaciteitsplanning**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Oefening 4.2: Voorafgaande validatie**
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
1. Welke factoren zouden SKU-selectiebeslissingen moeten beïnvloeden?
2. Hoe valideer je de beschikbaarheid van Azure-resources vóór implementatie?
3. Wat zijn de belangrijkste componenten van een pre-flight check-systeem?
4. Hoe schat en beheers je implementatiekosten?
5. Welke monitoring is essentieel voor capaciteitsplanning?

### Module 5: Probleemoplossing en debugging (Week 6)

#### Leerdoelen
- Beheersen van systematische probleemoplossingsmethoden
- Expertise ontwikkelen in het debuggen van complexe implementatieproblemen
- Uitvoeren van uitgebreide monitoring en waarschuwingen
- Bouwen van incidentresponse- en herstelprocedures

#### Belangrijke concepten om te beheersen
- Veelvoorkomende faalpatronen bij implementaties
- Technieken voor loganalyse en correlatie
- Performance monitoring en optimalisatie
- Detectie en respons bij beveiligingsincidenten
- Rampenherstel en bedrijfscontinuïteit

#### Praktijkopdrachten

**Oefening 5.1: Probleemoplossingsscenario's**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Oefening 5.2: Monitoring implementatie**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Oefening 5.3: Incidentrespons**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Zelfbeoordelingsvragen
1. Wat is de systematische aanpak voor het oplossen van problemen bij azd-implementaties?
2. Hoe correleer je logs over meerdere diensten en resources?
3. Welke monitoringmetrics zijn het belangrijkst voor vroege probleemdetectie?
4. Hoe implementeer je effectieve procedures voor rampenherstel?
5. Wat zijn de belangrijkste componenten van een incidentresponsplan?

### Module 6: Geavanceerde onderwerpen en best practices (Week 7-8)

#### Leerdoelen
- Implementeer enterprise-grade implementatiepatronen
- Beheers CI/CD-integratie en automatisering
- Ontwikkel aangepaste templates en draag bij aan de community
- Begrijp geavanceerde beveiligings- en complianceregels

#### Belangrijke concepten om te beheersen
- CI/CD-pijplijnintegratiepatronen
- Ontwikkeling en distributie van aangepaste templates
- Enterprise governance en compliance
- Geavanceerde netwerk- en beveiligingsconfiguraties
- Prestatieoptimalisatie en kostenbeheer

#### Praktijkopdrachten

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
2. Wat zijn de belangrijkste overwegingen bij het ontwikkelen van aangepaste templates?
3. Hoe implementeer je governance en compliance in azd-implementaties?
4. Wat zijn de beste praktijken voor implementaties op ondernemingsniveau?
5. Hoe draag je effectief bij aan de azd-community?

## Praktische projecten

### Project 1: Persoonlijke portfolio-website
**Complexiteit**: Beginner  
**Duur**: 1-2 weken

Bouw en implementeer een persoonlijke portfolio-website met:
- Statistische website-hosting op Azure Storage
- Configuratie van een aangepast domein
- CDN-integratie voor globale prestaties
- Geautomatiseerde implementatiepijplijn

**Opleveringen**:
- Werkende website geïmplementeerd op Azure
- Aangepaste azd-template voor portfolio-implementaties
- Documentatie van het implementatieproces
- Kostenanalyse en aanbevelingen voor optimalisatie

### Project 2: Taakbeheerapplicatie
**Complexiteit**: Gevorderd  
**Duur**: 2-3 weken

Maak een full-stack taakbeheerapplicatie met:
- React frontend geïmplementeerd op App Service
- Node.js API-backend met authenticatie
- PostgreSQL database met migraties
- Application Insights monitoring

**Opleveringen**:
- Volledige applicatie met gebruikersauthenticatie
- Database-schema en migratiescripts
- Monitoringdashboards en waarschuwingen
- Implementatieconfiguratie voor meerdere omgevingen

### Project 3: Microservices E-commerce platform
**Complexiteit**: Geavanceerd  
**Duur**: 4-6 weken

Ontwerp en implementeer een microservices-gebaseerd e-commerce platform:
- Meerdere API-diensten (catalogus, bestellingen, betalingen, gebruikers)
- Integratie van berichtwachtrij met Service Bus
- Redis cache voor prestatieoptimalisatie
- Uitgebreide logging en monitoring

**Voorbeeldreferentie**: Zie [Microservices Architecture](../../../examples/container-app/microservices) voor een leervoorbeeld met twee diensten en implementatiehandleiding. Wachtrijen, persistentie, authenticatie, betalingsverwerking en productiehardening zijn aparte projecttaken.

**Opleveringen**:
- Volledige microservices-architectuur
- Communicatiepatronen tussen diensten
- Prestatie testen en optimalisatie
- Productieklaar beveiligingsimplementatie

## Beoordeling en certificering

### Kenniscontroles

Voltooi deze beoordelingen na elke module:

**Module 1 Beoordeling**: Basisconcepten en installatie
- Meerkeuzevragen over kernconcepten
- Praktische installatie- en configuratietaken
- Eenvoudige implementatieoefening

**Module 2 Beoordeling**: Configuratie en omgevingen
- Scenario’s voor omgevingsbeheer
- Oefeningen voor probleemoplossing in configuratie
- Implementatie van beveiligingsconfiguratie

**Module 3 Beoordeling**: Implementatie en provisioning
- Uitdagingen in infrastructuurontwerp
- Scenario’s voor multi-service implementatie
- Oefeningen voor prestatieoptimalisatie

**Module 4 Beoordeling**: Validatie vóór implementatie
- Casestudies over capaciteitsplanning
- Scenario’s voor kostenoptimalisatie
- Implementatie van validatiepijplijnen

**Module 5 Beoordeling**: Probleemoplossing en debugging
- Oefeningen in probleemdiagnose
- Taken voor monitoringimplementatie
- Simulaties van incidentrespons

**Module 6 Beoordeling**: Geavanceerde onderwerpen
- Ontwerp van CI/CD-pijplijnen
- Ontwikkeling van aangepaste templates
- Scenario’s enterprise-architectuur

### Eindproject

Ontwerp en implementeer een complete oplossing die beheersing van alle concepten aantoont:

**Vereisten**:
- Multi-tier applicatiearchitectuur
- Meerdere implementatieomgevingen
- Uitgebreide monitoring en waarschuwingen
- Implementatie van beveiliging en compliance
- Kostenoptimalisatie en prestatieafstemming
- Volledige documentatie en runbooks

**Evaluatiecriteria**:
- Kwaliteit van technische implementatie
- Volledigheid van documentatie
- Naleving van beveiliging en beste praktijken
- Prestatie- en kostenoptimalisatie
- Effectiviteit van probleemoplossing en monitoring

## Studiebronnen en referenties

### Officiële documentatie
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Communitybronnen
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Oefenomgevingen
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Aanvullende tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Studieplanningsaanbevelingen

### Voltijdstudie (8 weken)
- **Weken 1-2**: Modules 1-2 (Aan de slag, Configuratie)
- **Weken 3-4**: Modules 3-4 (Implementatie, Voorafgaande validatie)
- **Weken 5-6**: Modules 5-6 (Probleemoplossing, Geavanceerde onderwerpen)
- **Weken 7-8**: Praktische projecten en eindbeoordeling

### Deeltijdstudie (16 weken)
- **Weken 1-4**: Module 1 (Aan de slag)
- **Weken 5-7**: Module 2 (Configuratie en omgevingen)
- **Weken 8-10**: Module 3 (Implementatie en provisioning)
- **Weken 11-12**: Module 4 (Validatie vóór implementatie)
- **Weken 13-14**: Module 5 (Probleemoplossing en debugging)
- **Weken 15-16**: Module 6 (Geavanceerde onderwerpen en beoordeling)

---

## Voortgangsregistratie en beoordelingskader

### Checklist hoofdstukafwerking

Volg je voortgang per hoofdstuk met deze meetbare resultaten:

#### 📚 Hoofdstuk 1: Basis & snelle start
- [ ] **Installatie voltooid**: AZD geïnstalleerd en gecontroleerd op jouw platform
- [ ] **Eerste implementatie**: Template todo-nodejs-mongo succesvol geïmplementeerd
- [ ] **Omgevingsconfiguratie**: Eerste omgevingsvariabelen geconfigureerd
- [ ] **Resource navigatie**: Verkenning van geïmplementeerde resources in Azure Portal
- [ ] **Beheersing commando's**: Vertrouwd met basis AZD-commando's

#### 🤖 Hoofdstuk 2: AI-first ontwikkeling  
- [ ] **AI-template implementatie**: Azure-search-openai-demo succesvol geïmplementeerd
- [ ] **RAG-implementatie**: Document indexering en ophalen geconfigureerd
- [ ] **Modelconfiguratie**: Meerdere AI-modellen opgezet voor verschillende doeleinden
- [ ] **AI-monitoring**: Application Insights geïmplementeerd voor AI workloads
- [ ] **Prestatieoptimalisatie**: AI-applicatieprestaties geoptimaliseerd

#### ⚙️ Hoofdstuk 3: Configuratie & authenticatie
- [ ] **Multi-omgeving opzet**: Dev, staging en prod omgevingen geconfigureerd
- [ ] **Beveiligingsimplementatie**: Beheerde identiteit authenticatie opgezet
- [ ] **Geheimenbeheer**: Integratie van Azure Key Vault voor gevoelige data
- [ ] **Parameterbeheer**: Omgevingsspecifieke configuraties gemaakt
- [ ] **Authenticatiemeester**: Veilige toegangs­patronen geïmplementeerd

#### 🏗️ Hoofdstuk 4: Infrastructure as Code & implementatie
- [ ] **Creatie aangepaste templates**: Template voor multi-service applicatie gebouwd
- [ ] **Bicep-meesterschap**: Modulaire, herbruikbare infrastructuurcomponenten gemaakt
- [ ] **Automatisering implementatie**: Pre/post implementatie hooks geïmplementeerd
- [ ] **Architectuurontwerp**: Complexe microservices architectuur geïmplementeerd
- [ ] **Template-optimalisatie**: Templates geoptimaliseerd voor prestaties en kosten

#### 🎯 Hoofdstuk 5: Multi-agent AI-oplossingen
- [ ] **Retail architectuuranalyse**: Ontbrekende applicatiecomponenten geïdentificeerd en planning voor implementatie en validatie gemaakt
- [ ] **Agentaanpassing**: Gedrag van Customer- en Inventory-agent aangepast
- [ ] **Architectuurschaling**: Load balancing en autoscaling geïmplementeerd
- [ ] **Productiemonitoring**: Uitgebreide monitoring en waarschuwingen opgezet
- [ ] **Prestatieafstemming**: Prestaties van multi-agent systeem geoptimaliseerd

#### 🔍 Hoofdstuk 6: Validatie en planning vóór implementatie
- [ ] **Capaciteitsanalyse**: Brongegevens voor applicatievereisten geanalyseerd
- [ ] **SKU-optimalisatie**: Kosteneffectieve serviceniveaus geselecteerd
- [ ] **Validatie-automatisering**: Voorafgaande controlescripts geïmplementeerd
- [ ] **Kostenplanning**: Implementatiekostenramingen en budgetten gemaakt
- [ ] **Risicobeoordeling**: Implementatierisico's geïdentificeerd en gemitigeerd

#### 🚨 Hoofdstuk 7: Probleemoplossing & debugging
- [ ] **Diagnostische vaardigheden**: Met succes opzettelijk kapotte implementaties gedebugd
- [ ] **Loganalyse**: Effectief gebruik gemaakt van Azure Monitor en Application Insights
- [ ] **Prestatieafstemming**: Trage applicaties geoptimaliseerd
- [ ] **Herstelprocedures**: Backup- en rampenherstelprocessen geïmplementeerd
- [ ] **Monitoringopzet**: Proactieve monitoring en waarschuwingen gemaakt

#### 🏢 Hoofdstuk 8: Productie- & enterprise-patronen
- [ ] **Enterprisebeveiliging**: Uitgebreide beveiligingspatronen geïmplementeerd
- [ ] **Governancekader**: Azure Policy en resourcebeheer opgezet
- [ ] **Geavanceerde monitoring**: Dashboards en geautomatiseerde waarschuwingen gemaakt
- [ ] **CI/CD-integratie**: Geautomatiseerde implementatiepijplijnen gebouwd
- [ ] **Complianceimplementatie**: Voldoet aan enterprise-complianceregels

### Leertijdlijn en mijlpalen

#### Week 1-2: Fundament leggen
- **Mijlpaal**: Eerste AI-applicatie geïmplementeerd met AZD
- **Validatie**: Werkende applicatie toegankelijk via publieke URL
- **Vaardigheden**: Basis AZD-workflows en AI-service-integratie

#### Week 3-4: Beheersing van configuratie
- **Mijlpaal**: Multi-omgeving implementatie met veilige authenticatie
- **Validatie**: Zelfde applicatie geïmplementeerd in dev/staging/prod
- **Vaardigheden**: Omgevingsbeheer en beveiligingsimplementatie

#### Week 5-6: Expertise in infrastructuur
- **Mijlpaal**: Aangepaste template voor complexe multi-service applicatie
- **Validatie**: Herbruikbare template geïmplementeerd door een teamlid
- **Vaardigheden**: Bicep-meesterschap en infrastructuurautomatisering

#### Week 7-8: Geavanceerde AI-implementatie
- **Mijlpaal**: Productieklaar multi-agent AI-oplossing
- **Validatie**: Systeem verwerkt echte werklast met monitoring
- **Vaardigheden**: Orkestratie van multi-agent systemen en prestatieoptimalisatie

#### Week 9-10: Productieklaar maken
- **Mijlpaal**: Implementatie op ondernemingsniveau met volledige compliance
- **Validatie**: Behaald veiligheidsbeoordeling en audit kostenoptimalisatie
- **Vaardigheden**: Governance, monitoring en CI/CD-integratie

### Beoordeling en certificering

#### Methoden voor kennisvalidatie
1. **Praktische Implementaties**: Werkende applicaties voor elk hoofdstuk
2. **Code Reviews**: Template- en configuratiekwaliteitsbeoordeling
3. **Probleemoplossing**: Storingsscenario's en oplossingen
4. **Peer Teaching**: Leg concepten uit aan andere leerlingen
5. **Communitybijdrage**: Deel templates of verbeteringen

#### Resultaten voor Professionele Ontwikkeling
- **Portfolio Projecten**: Leerimplementaties en architectuuroefeningen; productierijpheid vereist aparte implementatie en beoordeling
- **Technische Vaardigheden**: Industrie-standaard AZD- en AI-implementatie-expertise
- **Probleemoplossend Vermogen**: Onafhankelijke storingsdiagnose en optimalisatie
- **Erkenning in de Community**: Actieve deelname aan de Azure ontwikkelaarscommunity
- **Carrièrevooruitgang**: Vaardigheden direct toepasbaar voor cloud- en AI-functies

#### Succesindicatoren
- **Implementatiesuccespercentage**: >95% succesvolle implementaties
- **Oplostijd Storingen**: <30 minuten voor veelvoorkomende problemen
- **Prestatieoptimalisatie**: Aantoonbare verbeteringen in kosten en prestaties
- **Beveiligingsbeoordeling**: Documenteer controles en resterende lacunes tegen de vereisten van uw organisatie; cursusafsluiting certificeert geen naleving
- **Kennisoverdracht**: Vermogen om andere ontwikkelaars te begeleiden

### Voortdurend Leren en Communitybetrokkenheid

#### Blijf Actueel
- **Azure Updates**: Volg de release-opmerkingen van Azure Developer CLI
- **Community Evenementen**: Neem deel aan Azure- en AI-ontwikkelaarsbijeenkomsten
- **Documentatie**: Draag bij aan communitydocumentatie en voorbeelden
- **Feedbackcyclus**: Geef feedback over cursusinhoud en Azure-diensten

#### Loopbaanontwikkeling
- **Professioneel Netwerk**: Verbind met Azure- en AI-experts
- **Spreekmogelijkheden**: Presenteer inzichten op conferenties of bijeenkomsten
- **Open Source Bijdrage**: Draag bij aan AZD-templates en tools
- **Mentorschap**: Begeleid andere ontwikkelaars in hun AZD-leertraject

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../README.md)
- **📖 Begin met Leren**: [Hoofdstuk 1: Basis & Snelle Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Voortgangsbewaking**: Volg je voortgang door het uitgebreide 8-hoofdstukken leertraject
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) voor ondersteuning en discussie

**Studie Voortgangsbewaking**: Gebruik deze gestructureerde gids om Azure Developer CLI te beheersen via progressief, praktisch leren met meetbare resultaten en voordelen voor professionele ontwikkeling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->