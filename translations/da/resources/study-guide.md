<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:19:14+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "da"
}
-->
# Studievejledning - AZD for begyndere

## Introduktion

Denne omfattende studievejledning giver strukturerede læringsmål, nøglekoncepter, øvelser og vurderingsmaterialer, der hjælper dig med at mestre Azure Developer CLI (azd). Brug denne vejledning til at følge din fremgang og sikre, at du har dækket alle essentielle emner.

## Læringsmål

Ved at gennemføre denne studievejledning vil du:
- Mestre alle grundlæggende og avancerede koncepter i Azure Developer CLI
- Udvikle praktiske færdigheder i at implementere og administrere Azure-applikationer
- Opbygge selvtillid i fejlfinding og optimering af implementeringer
- Forstå produktionsklare implementeringspraksisser og sikkerhedsovervejelser

## Læringsresultater

Efter at have gennemført alle sektioner i denne studievejledning vil du kunne:
- Designe, implementere og administrere komplette applikationsarkitekturer ved hjælp af azd
- Implementere omfattende overvågnings-, sikkerheds- og omkostningsoptimeringsstrategier
- Fejlsøge komplekse implementeringsproblemer selvstændigt
- Oprette brugerdefinerede skabeloner og bidrage til azd-fællesskabet

## Kursusstruktur

### Modul 1: Kom godt i gang (Uger 1-2)

#### Læringsmål
- Forstå grundlæggende og kernekoncepter i Azure Developer CLI
- Installere og konfigurere azd på din udviklingsmiljø
- Fuldføre din første implementering ved hjælp af en eksisterende skabelon
- Navigere i azd-projektstrukturen og forstå nøglekomponenter

#### Nøglekoncepter at mestre
- Skabeloner, miljøer og tjenester
- azure.yaml-konfigurationsstruktur
- Grundlæggende azd-kommandoer (init, up, down, deploy)
- Principper for Infrastructure as Code
- Azure-autentificering og autorisation

#### Øvelser

**Øvelse 1.1: Installation og opsætning**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første implementering**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Øvelse 1.3: Analyse af projektstruktur**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Selv-evalueringsspørgsmål
1. Hvad er de tre kernekoncepter i azd-arkitekturen?
2. Hvad er formålet med azure.yaml-filen?
3. Hvordan hjælper miljøer med at administrere forskellige implementeringsmål?
4. Hvilke autentificeringsmetoder kan bruges med azd?
5. Hvad sker der, når du kører `azd up` for første gang?

### Modul 2: Konfiguration og miljøer (Uge 3)

#### Læringsmål
- Mestre miljøstyring og konfiguration
- Forstå avancerede azure.yaml-konfigurationer
- Implementere miljøspecifikke indstillinger og variabler
- Konfigurere autentificering til forskellige scenarier

#### Nøglekoncepter at mestre
- Miljøhierarki og variabel prioritet
- Tjenestekonfiguration og parametre
- Hooks og livscyklusbegivenheder
- Autentificeringsmetoder (bruger, service principal, managed identity)
- Håndtering af konfigurationsfiler

#### Øvelser

**Øvelse 2.1: Opsætning af flere miljøer**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Øvelse 2.2: Avanceret konfiguration**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Øvelse 2.3: Sikkerhedskonfiguration**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selv-evalueringsspørgsmål
1. Hvordan håndterer azd variabel prioritet i miljøer?
2. Hvad er implementeringshooks, og hvornår skal du bruge dem?
3. Hvordan konfigurerer du forskellige SKUs til forskellige miljøer?
4. Hvad er sikkerhedsmæssige konsekvenser af forskellige autentificeringsmetoder?
5. Hvordan administrerer du hemmeligheder og følsomme konfigurationsdata?

### Modul 3: Implementering og klargøring (Uge 4)

#### Læringsmål
- Mestre implementeringsarbejdsgange og bedste praksis
- Forstå Infrastructure as Code med Bicep-skabeloner
- Implementere komplekse arkitekturer med flere tjenester
- Optimere implementeringsydelse og pålidelighed

#### Nøglekoncepter at mestre
- Bicep-skabelonstruktur og moduler
- Ressourceafhængigheder og rækkefølge
- Implementeringsstrategier (blue-green, rolling updates)
- Implementeringer på tværs af regioner
- Database-migrationer og datastyring

#### Øvelser

**Øvelse 3.1: Brugerdefineret infrastruktur**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Applikation med flere tjenester**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Øvelse 3.3: Databaseintegration**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selv-evalueringsspørgsmål
1. Hvad er fordelene ved at bruge Bicep frem for ARM-skabeloner?
2. Hvordan håndterer du database-migrationer i azd-implementeringer?
3. Hvilke strategier findes for implementering uden nedetid?
4. Hvordan administrerer du afhængigheder mellem tjenester?
5. Hvad skal overvejes ved implementeringer på tværs af regioner?

### Modul 4: Validering før implementering (Uge 5)

#### Læringsmål
- Implementere omfattende kontrol før implementering
- Mestre kapacitetsplanlægning og ressourcevalidering
- Forstå SKU-valg og omkostningsoptimering
- Bygge automatiserede valideringspipelines

#### Nøglekoncepter at mestre
- Azure ressourcekvoter og grænser
- SKU-valgkriterier og omkostningsimplikationer
- Automatiserede valideringsscripts og værktøjer
- Metoder til kapacitetsplanlægning
- Ydelsestest og optimering

#### Øvelser

**Øvelse 4.1: Kapacitetsplanlægning**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Øvelse 4.2: Validering før implementering**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Øvelse 4.3: SKU-optimering**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selv-evalueringsspørgsmål
1. Hvilke faktorer bør påvirke beslutninger om SKU-valg?
2. Hvordan validerer du Azure-ressource tilgængelighed før implementering?
3. Hvad er de vigtigste komponenter i et system til kontrol før implementering?
4. Hvordan estimerer og kontrollerer du implementeringsomkostninger?
5. Hvilken overvågning er essentiel for kapacitetsplanlægning?

### Modul 5: Fejlfinding og debugging (Uge 6)

#### Læringsmål
- Mestre systematiske metoder til fejlfinding
- Udvikle ekspertise i debugging af komplekse implementeringsproblemer
- Implementere omfattende overvågning og alarmering
- Bygge procedurer for hændelsesrespons og genopretning

#### Nøglekoncepter at mestre
- Almindelige mønstre for implementeringsfejl
- Loganalyse og korrelationsteknikker
- Ydelsesovervågning og optimering
- Sikkerhedshændelsesdetektion og respons
- Katastrofeberedskab og forretningskontinuitet

#### Øvelser

**Øvelse 5.1: Fejlfinding af scenarier**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Øvelse 5.2: Implementering af overvågning**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Øvelse 5.3: Hændelsesrespons**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Selv-evalueringsspørgsmål
1. Hvad er den systematiske tilgang til fejlfinding af azd-implementeringer?
2. Hvordan korrelerer du logs på tværs af flere tjenester og ressourcer?
3. Hvilke overvågningsmetrikker er mest kritiske for tidlig problemopdagelse?
4. Hvordan implementerer du effektive procedurer for katastrofeberedskab?
5. Hvad er de vigtigste komponenter i en hændelsesresponsplan?

### Modul 6: Avancerede emner og bedste praksis (Uge 7-8)

#### Læringsmål
- Implementere implementeringsmønstre i enterprise-klassen
- Mestre CI/CD-integration og automatisering
- Udvikle brugerdefinerede skabeloner og bidrage til fællesskabet
- Forstå avancerede sikkerheds- og compliancekrav

#### Nøglekoncepter at mestre
- CI/CD-pipeline integrationsmønstre
- Udvikling og distribution af brugerdefinerede skabeloner
- Enterprise governance og compliance
- Avancerede netværks- og sikkerhedskonfigurationer
- Ydelsesoptimering og omkostningsstyring

#### Øvelser

**Øvelse 6.1: CI/CD-integration**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Øvelse 6.2: Udvikling af brugerdefinerede skabeloner**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Implementering i enterprise-miljøer**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selv-evalueringsspørgsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbejdsgange?
2. Hvad er de vigtigste overvejelser ved udvikling af brugerdefinerede skabeloner?
3. Hvordan implementerer du governance og compliance i azd-implementeringer?
4. Hvad er bedste praksis for implementeringer i enterprise-skala?
5. Hvordan bidrager du effektivt til azd-fællesskabet?

## Praktiske projekter

### Projekt 1: Personlig porteføljehjemmeside  
**Kompleksitet**: Begynder  
**Varighed**: 1-2 uger  

Byg og implementer en personlig porteføljehjemmeside med:
- Statisk hjemmesidehosting på Azure Storage
- Konfiguration af brugerdefineret domæne
- CDN-integration for global ydeevne
- Automatiseret implementeringspipeline

**Leverancer**:
- Fungerende hjemmeside implementeret på Azure
- Brugerdefineret azd-skabelon til porteføljeimplementeringer
- Dokumentation af implementeringsprocessen
- Omkostningsanalyse og optimeringsanbefalinger

### Projekt 2: Opgavestyringsapplikation  
**Kompleksitet**: Mellem  
**Varighed**: 2-3 uger  

Opret en fuld-stack opgavestyringsapplikation med:
- React-frontend implementeret på App Service
- Node.js API-backend med autentificering
- PostgreSQL-database med migrationer
- Application Insights-overvågning

**Leverancer**:
- Komplet applikation med brugerautentificering
- Databaseskema og migrationsscripts
- Overvågningsdashboard og alarmregler
- Konfiguration af implementering i flere miljøer

### Projekt 3: E-handelsplatform med mikroservices  
**Kompleksitet**: Avanceret  
**Varighed**: 4-6 uger  

Design og implementer en e-handelsplatform baseret på mikroservices:
- Flere API-tjenester (katalog, ordrer, betalinger, brugere)
- Integration af beskedkø med Service Bus
- Redis-cache for ydeevneoptimering
- Omfattende logning og overvågning

**Leverancer**:
- Komplet mikroservicesarkitektur
- Kommunikationsmønstre mellem tjenester
- Ydelsestest og optimering
- Produktionsklar sikkerhedsimplementering

## Vurdering og certificering

### Videnskontroller

Fuldfør disse vurderinger efter hvert modul:

**Modul 1 Vurdering**: Grundlæggende koncepter og installation  
- Multiple choice-spørgsmål om kernekoncepter  
- Praktiske installations- og konfigurationsopgaver  
- Enkel implementeringsøvelse  

**Modul 2 Vurdering**: Konfiguration og miljøer  
- Scenarier for miljøstyring  
- Øvelser i fejlfinding af konfiguration  
- Implementering af sikkerhedskonfiguration  

**Modul 3 Vurdering**: Implementering og klargøring  
- Infrastrukturdesignudfordringer  
- Scenarier for implementering med flere tjenester  
- Øvelser i ydeevneoptimering  

**Modul 4 Vurdering**: Validering før implementering  
- Case-studier i kapacitetsplanlægning  
- Scenarier for omkostningsoptimering  
- Implementering af valideringspipeline  

**Modul 5 Vurdering**: Fejlfinding og debugging  
- Øvelser i problemdiagnose  
- Implementeringsopgaver for overvågning  
- Simuleringer af hændelsesrespons  

**Modul 6 Vurdering**: Avancerede emner  
- Design af CI/CD-pipeline  
- Udvikling af brugerdefinerede skabeloner  
- Scenarier for enterprise-arkitektur  

### Endeligt afslutningsprojekt

Design og implementer en komplet løsning, der demonstrerer mestring af alle koncepter:

**Krav**:
- Applikationsarkitektur med flere lag  
- Flere implementeringsmiljøer  
- Omfattende overvågning og alarmering  
- Implementering af sikkerhed og compliance  
- Omkostningsoptimering og ydeevnetuning  
- Komplet dokumentation og runbooks  

**Evalueringskriterier**:
- Teknisk implementeringskvalitet  
- Dokumentationsfuldstændighed  
- Overholdelse af sikkerhed og bedste praksis  
- Ydelse og omkostningsoptimering  
- Effektivitet i fejlfinding og overvågning  

## Studieressourcer og referencer

### Officiel dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Fællesskabsressourcer
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Øvelsesmiljøer
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Yderligere værktøjer
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Anbefalinger til studieplan

### Fuldtidsstudie (8 uger)
- **Uger 1-2**: Moduler 1-2 (Kom godt i gang, Konfiguration)  
- **Uger 3-4**: Moduler 3-4 (Implementering, Validering før implementering)  
- **Uger 5-6**: Moduler 5-6 (Fejlfinding, Avancerede emner)  
- **Uger 7-8**: Praktiske projekter og endelig vurdering  

### Deltidsstudie (16 uger)
- **Uger 1-4**: Modul 1 (Kom godt i gang)  
- **Uger 5-7**: Modul 2 (Konfiguration og miljøer)  
- **Uger 8-10**: Modul 3 (Implementering og klargøring)  
- **Uger 11-12**: Modul 4 (Validering før implementering)  
- **Uger 13-14**: Modul 5 (Fejlfinding og debugging)  
- **Uger 15-16**: Modul 6 (Avancerede emner og vurdering)  

### Selvstudie
- Fuldfør hvert modul i dit eget tempo  
- Brug ekstra tid på udfordrende koncepter  
- Gentag øvelser, indtil du opnår mestring  
- Deltag i fællesskabsdiskussioner og stil spørgsmål  

## Tips til succes

### Effektive læringsstrategier
1. **Øv regelmæssigt**: Implementer applikationer ofte for at opbygge rutine  
2. **Eksperimenter frygtløst**: Brug udviklingsmiljøer til at prøve nye konfigurationer  
3. **Dokumentér din læring**: Tag noter om løsninger på problemer, du støder på  
4. **Deltag i fællesskabet**: Vær med i diskussioner og bidrag til projekter  
5. **Hold dig opdateret**: Følg Azure-opdateringer og nye azd-funktioner  

### Almindelige faldgruber at undgå
1. **Springe forudsætninger over**: Sørg for, at du har den nødvendige grundlæggende viden  
2. **Skynde dig gennem koncepter**: Tag dig tid til at forstå fundamentet grundigt  
3. **Ignorere sikkerhed**: Implementer altid sikkerhedsbedste praksis fra starten  
4. **Undlade at teste grundigt**: Test implementeringer i flere miljøer  
5. **Undgå dokumentation**: God dokumentation er afgørende for vedligeholdelse  

### Opbygning af praktisk erfaring
1. **Start småt**: Begynd med enkle applikationer og øg gradvist kompleksiteten  
2. **Lær af fejl**: Brug fejlfinding som lær
3. **Bidrag til Open Source**: Del dine skabeloner og løsninger med fællesskabet  
4. **Lær Andre**: At forklare begreber til andre styrker din egen forståelse  
5. **Vær Nysgerrig**: Udforsk løbende nye Azure-tjenester og integrationsmønstre  

---

**Navigation**  
- **Forrige Lektion**: [FAQ](faq.md)  
- **Næste Lektion**: [Changelog](../changelog.md)  

**Sporing af Studiefremskridt**: Brug denne guide til at følge din læringsrejse og sikre en omfattende dækning af alle Azure Developer CLI-koncepter og -praksisser.  

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.