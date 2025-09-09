<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:26:48+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "nl"
}
-->
# Studiegids - AZD Voor Beginners

## Introductie

Deze uitgebreide studiegids biedt gestructureerde leerdoelen, kernconcepten, oefenopdrachten en beoordelingsmateriaal om je te helpen Azure Developer CLI (azd) onder de knie te krijgen. Gebruik deze gids om je voortgang bij te houden en ervoor te zorgen dat je alle essentiële onderwerpen hebt behandeld.

## Leerdoelen

Door deze studiegids te voltooien, zul je:
- Alle fundamentele en geavanceerde concepten van Azure Developer CLI beheersen
- Praktische vaardigheden ontwikkelen in het implementeren en beheren van Azure-applicaties
- Vertrouwen opbouwen in het oplossen van problemen en optimaliseren van implementaties
- Productieklaar implementatiepraktijken en beveiligingsoverwegingen begrijpen

## Leerresultaten

Na het voltooien van alle secties van deze studiegids, zul je in staat zijn om:
- Complete applicatiearchitecturen te ontwerpen, implementeren en beheren met azd
- Uitgebreide monitoring-, beveiligings- en kostenoptimalisatiestrategieën te implementeren
- Complexe implementatieproblemen zelfstandig op te lossen
- Aangepaste sjablonen te maken en bij te dragen aan de azd-community

## Cursusstructuur

### Module 1: Aan de Slag (Week 1-2)

#### Leerdoelen
- Begrijp de basisprincipes en kernconcepten van Azure Developer CLI
- Installeer en configureer azd succesvol in je ontwikkelomgeving
- Voltooi je eerste implementatie met een bestaande sjabloon
- Navigeer door de azd-projectstructuur en begrijp de belangrijkste componenten

#### Kernconcepten om te beheersen
- Sjablonen, omgevingen en services
- azure.yaml configuratiestructuur
- Basis azd-commando's (init, up, down, deploy)
- Principes van Infrastructure as Code
- Azure-authenticatie en -autorisatie

#### Oefenopdrachten

**Oefening 1.1: Installatie en Setup**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Oefening 1.2: Eerste Implementatie**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Oefening 1.3: Analyse van Projectstructuur**  
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
5. Wat gebeurt er wanneer je `azd up` voor de eerste keer uitvoert?

### Module 2: Configuratie en Omgevingen (Week 3)

#### Leerdoelen
- Beheers het beheer en de configuratie van omgevingen
- Begrijp geavanceerde azure.yaml-configuraties
- Implementeer omgevingsspecifieke instellingen en variabelen
- Configureer authenticatie voor verschillende scenario's

#### Kernconcepten om te beheersen
- Omgevinghiërarchie en variabele prioriteit
- Serviceconfiguratie en parameters
- Hooks en levenscyclusgebeurtenissen
- Authenticatiemethoden (gebruiker, service-principal, managed identity)
- Beheer van configuratiebestanden

#### Oefenopdrachten

**Oefening 2.1: Multi-Omgeving Setup**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Oefening 2.2: Geavanceerde Configuratie**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Oefening 2.3: Beveiligingsconfiguratie**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Zelfbeoordelingsvragen
1. Hoe gaat azd om met variabele prioriteit in omgevingen?
2. Wat zijn implementatiehooks en wanneer moet je ze gebruiken?
3. Hoe configureer je verschillende SKUs voor verschillende omgevingen?
4. Wat zijn de beveiligingsimplicaties van verschillende authenticatiemethoden?
5. Hoe beheer je geheimen en gevoelige configuratiegegevens?

### Module 3: Implementatie en Voorziening (Week 4)

#### Leerdoelen
- Beheers implementatieworkflows en best practices
- Begrijp Infrastructure as Code met Bicep-sjablonen
- Implementeer complexe multi-service architecturen
- Optimaliseer implementatieprestaties en betrouwbaarheid

#### Kernconcepten om te beheersen
- Structuur en modules van Bicep-sjablonen
- Resource-afhankelijkheden en volgorde
- Implementatiestrategieën (blue-green, rolling updates)
- Multi-regio implementaties
- Database-migraties en gegevensbeheer

#### Oefenopdrachten

**Oefening 3.1: Aangepaste Infrastructuur**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Oefening 3.2: Multi-Service Applicatie**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Oefening 3.3: Database-integratie**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Zelfbeoordelingsvragen
1. Wat zijn de voordelen van het gebruik van Bicep boven ARM-sjablonen?
2. Hoe ga je om met database-migraties in azd-implementaties?
3. Welke strategieën bestaan er voor implementaties zonder downtime?
4. Hoe beheer je afhankelijkheden tussen services?
5. Wat zijn de overwegingen voor multi-regio implementaties?

### Module 4: Validatie Voor Implementatie (Week 5)

#### Leerdoelen
- Implementeer uitgebreide controles vóór implementatie
- Beheers capaciteitsplanning en resourcevalidatie
- Begrijp SKU-selectie en kostenoptimalisatie
- Bouw geautomatiseerde validatiepijplijnen

#### Kernconcepten om te beheersen
- Azure resource quota's en limieten
- Criteria voor SKU-selectie en kostenimplicaties
- Geautomatiseerde validatiescripts en tools
- Methodologieën voor capaciteitsplanning
- Prestatie testen en optimalisatie

#### Oefenopdrachten

**Oefening 4.1: Capaciteitsplanning**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Oefening 4.2: Pre-flight Validatie**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Oefening 4.3: SKU Optimalisatie**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Zelfbeoordelingsvragen
1. Welke factoren moeten SKU-selectiebeslissingen beïnvloeden?
2. Hoe valideer je de beschikbaarheid van Azure-resources vóór implementatie?
3. Wat zijn de belangrijkste componenten van een pre-flight checksysteem?
4. Hoe schat en controleer je implementatiekosten?
5. Welke monitoring is essentieel voor capaciteitsplanning?

### Module 5: Problemen Oplossen en Debuggen (Week 6)

#### Leerdoelen
- Beheers systematische probleemoplossingsmethodologieën
- Ontwikkel expertise in het debuggen van complexe implementatieproblemen
- Implementeer uitgebreide monitoring en waarschuwingen
- Bouw procedures voor incidentrespons en herstel

#### Kernconcepten om te beheersen
- Veelvoorkomende implementatiefoutpatronen
- Loganalyse en correlatietechnieken
- Prestatiemonitoring en optimalisatie
- Detectie en respons op beveiligingsincidenten
- Herstel na rampen en bedrijfscontinuïteit

#### Oefenopdrachten

**Oefening 5.1: Probleemoplossingsscenario's**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Oefening 5.2: Monitoring Implementatie**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Oefening 5.3: Incidentrespons**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Zelfbeoordelingsvragen
1. Wat is de systematische aanpak voor het oplossen van azd-implementatieproblemen?
2. Hoe correleer je logs tussen meerdere services en resources?
3. Welke monitoringstatistieken zijn het meest cruciaal voor vroege probleemdetectie?
4. Hoe implementeer je effectieve herstelprocedures na rampen?
5. Wat zijn de belangrijkste componenten van een incidentresponsplan?

### Module 6: Geavanceerde Onderwerpen en Best Practices (Week 7-8)

#### Leerdoelen
- Implementeer implementatiepatronen van ondernemingsniveau
- Beheers CI/CD-integratie en automatisering
- Ontwikkel aangepaste sjablonen en draag bij aan de community
- Begrijp geavanceerde beveiligings- en nalevingsvereisten

#### Kernconcepten om te beheersen
- CI/CD-pijplijnintegratiepatronen
- Ontwikkeling en distributie van aangepaste sjablonen
- Governance en naleving op ondernemingsniveau
- Geavanceerde netwerken en beveiligingsconfiguraties
- Prestatieoptimalisatie en kostenbeheer

#### Oefenopdrachten

**Oefening 6.1: CI/CD Integratie**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Oefening 6.2: Ontwikkeling van Aangepaste Sjablonen**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Oefening 6.3: Implementatie op Ondernemingsniveau**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Zelfbeoordelingsvragen
1. Hoe integreer je azd in bestaande CI/CD-workflows?
2. Wat zijn de belangrijkste overwegingen voor de ontwikkeling van aangepaste sjablonen?
3. Hoe implementeer je governance en naleving in azd-implementaties?
4. Wat zijn de best practices voor implementaties op ondernemingsschaal?
5. Hoe draag je effectief bij aan de azd-community?

## Praktische Projecten

### Project 1: Persoonlijke Portfolio Website
**Complexiteit**: Beginner  
**Duur**: 1-2 weken

Bouw en implementeer een persoonlijke portfolio website met:
- Hosting van statische websites op Azure Storage
- Configuratie van een aangepast domein
- CDN-integratie voor wereldwijde prestaties
- Geautomatiseerde implementatiepijplijn

**Op te leveren**:
- Werkende website geïmplementeerd op Azure
- Aangepaste azd-sjabloon voor portfolio-implementaties
- Documentatie van het implementatieproces
- Kostenanalyse en optimalisatieaanbevelingen

### Project 2: Taakbeheer Applicatie
**Complexiteit**: Gemiddeld  
**Duur**: 2-3 weken

Maak een full-stack taakbeheer applicatie met:
- React frontend geïmplementeerd op App Service
- Node.js API backend met authenticatie
- PostgreSQL database met migraties
- Application Insights monitoring

**Op te leveren**:
- Complete applicatie met gebruikersauthenticatie
- Databaseschema en migratiescripts
- Monitoring dashboards en waarschuwingsregels
- Multi-omgeving implementatieconfiguratie

### Project 3: Microservices E-commerce Platform
**Complexiteit**: Geavanceerd  
**Duur**: 4-6 weken

Ontwerp en implementeer een microservices-gebaseerd e-commerce platform:
- Meerdere API-services (catalogus, bestellingen, betalingen, gebruikers)
- Integratie van berichtenwachtrij met Service Bus
- Redis-cache voor prestatieoptimalisatie
- Uitgebreide logging en monitoring

**Op te leveren**:
- Complete microservices-architectuur
- Inter-service communicatiepatronen
- Prestatie testen en optimalisatie
- Productieklaar beveiligingsimplementatie

## Beoordeling en Certificering

### Kennischecks

Voltooi deze beoordelingen na elke module:

**Module 1 Beoordeling**: Basisconcepten en installatie  
- Meerkeuzevragen over kernconcepten  
- Praktische installatie- en configuratietaken  
- Eenvoudige implementatieoefening  

**Module 2 Beoordeling**: Configuratie en omgevingen  
- Scenario's voor omgevingsbeheer  
- Oefeningen voor het oplossen van configuratieproblemen  
- Implementatie van beveiligingsconfiguratie  

**Module 3 Beoordeling**: Implementatie en voorziening  
- Uitdagingen in infrastructuurontwerp  
- Scenario's voor multi-service implementatie  
- Oefeningen voor prestatieoptimalisatie  

**Module 4 Beoordeling**: Validatie vóór implementatie  
- Casestudy's voor capaciteitsplanning  
- Scenario's voor kostenoptimalisatie  
- Implementatie van validatiepijplijnen  

**Module 5 Beoordeling**: Problemen oplossen en debuggen  
- Oefeningen voor probleemdiagnose  
- Taken voor monitoringimplementatie  
- Simulaties voor incidentrespons  

**Module 6 Beoordeling**: Geavanceerde onderwerpen  
- Ontwerp van CI/CD-pijplijnen  
- Ontwikkeling van aangepaste sjablonen  
- Scenario's voor ondernemingsarchitectuur  

### Eindproject

Ontwerp en implementeer een complete oplossing die alle concepten demonstreert:

**Vereisten**:
- Multi-tier applicatiearchitectuur  
- Meerdere implementatieomgevingen  
- Uitgebreide monitoring en waarschuwingen  
- Implementatie van beveiliging en naleving  
- Kostenoptimalisatie en prestatie tuning  
- Complete documentatie en runbooks  

**Evaluatiecriteria**:
- Technische implementatiekwaliteit  
- Documentatie volledigheid  
- Naleving van beveiliging en best practices  
- Prestatie- en kostenoptimalisatie  
- Effectiviteit van probleemoplossing en monitoring  

## Studieresources en Referenties

### Officiële Documentatie
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community Resources
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisatie](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Oefenomgevingen
- [Azure Gratis Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Gratis Niveau](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Extra Tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Aanbevolen Studieplanning

### Fulltime Studie (8 weken)
- **Week 1-2**: Modules 1-2 (Aan de Slag, Configuratie)  
- **Week 3-4**: Modules 3-4 (Implementatie, Validatie)  
- **Week 5-6**: Modules 5-6 (Problemen oplossen, Geavanceerde Onderwerpen)  
- **Week 7-8**: Praktische Projecten en Eindbeoordeling  

### Parttime Studie (16 weken)
- **Week 1-4**: Module 1 (Aan de Slag)  
- **Week 5-7**: Module 2 (Configuratie en Omgevingen)  
- **Week 8-10**: Module 3 (Implementatie en Voorziening)  
- **Week 11-12**: Module 4 (Validatie vóór Implementatie)  
- **Week 13-14**: Module 5 (Problemen oplossen en Debuggen)  
- **Week 15-16**: Module 6 (Geavanceerde Onderwerpen en Beoordeling)  

### Zelfstudie
- Voltooi elke module in je eigen tempo  
- Besteed extra tijd aan uitdagende concepten  
- Herhaal oefeningen totdat je ze beheerst  
- Neem deel aan communitydiscussies en stel vragen  

## Tips voor Succes

### Effectieve Leerstrategieën
1. **Oefen Regelmatig**: Implementeer applicaties vaak om geheugen op te bouwen  
2. **Experimenteer Zonder Angst**: Gebruik ontwikkelomgevingen om nieuwe configuraties uit te proberen  
3. **Documenteer Je Leerproces**: Houd aantekeningen bij over oplossingen voor problemen die je tegenkomt  
4. **Word Lid van de Community**: Neem deel aan discussies en draag bij aan projecten  
5. **Blijf Actueel**: Volg Azure-updates en nieuwe azd-functies  

### Veelvoorkomende Valkuilen om te Vermijden
1. **Overslaan van Basiskennis**: Zorg ervoor dat je een goede basis hebt  
2. **Te Snel Door Concepten Gaan**: Neem de tijd om de basisprincipes grondig te begrijpen  
3. **Beveiliging Negeren**: Implementeer altijd beveiligingsbest practices vanaf het begin  
4. **Niet Grondig Testen**: Test implementaties in meerdere omgevingen  
5. **Documentatie Vermijden**: Goede documentatie is essentieel voor onderhoud  

### Praktische Ervaring Opbouwen
1. **Begin Klein**: Start met eenvoudige applicaties en verhoog geleidelijk de complexiteit  
2. **Leer van Fouten**: Gebruik probleemoplossingsoefeningen als leermogelijkheden  
3. **Draag bij aan Open Source**: Deel je templates en oplossingen met de gemeenschap  
4. **Leer anderen**: Het uitleggen van concepten aan anderen versterkt je eigen begrip  
5. **Blijf nieuwsgierig**: Blijf nieuwe Azure-diensten en integratiepatronen verkennen  

---

**Navigatie**  
- **Vorige les**: [FAQ](faq.md)  
- **Volgende les**: [Changelog](../changelog.md)  

**Studievoortgang bijhouden**: Gebruik deze gids om je leertraject te volgen en ervoor te zorgen dat je alle concepten en praktijken van Azure Developer CLI volledig beheerst.  

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.