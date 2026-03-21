# Studieguide - Omfattende læringsmål

**Navigering af læringssti**
- **📚 Kursusside**: [AZD for Begyndere](../README.md)
- **📖 Kom i gang**: [Kapitel 1: Grundlag & Kom godt i gang](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: [Kursusfuldførelse](../README.md#-course-completion--certification)

## Introduktion

Denne omfattende studieguide giver strukturerede læringsmål, nøglekoncepter, øvelser og vurderingsmateriale for at hjælpe dig med at mestre Azure Developer CLI (azd). Brug denne guide til at følge din fremdrift og sikre, at du har dækket alle væsentlige emner.

## Læringsmål

Ved at gennemføre denne studieguide vil du:
- Beherske alle grundlæggende og avancerede koncepter i Azure Developer CLI
- Udvikle praktiske færdigheder i udrulning og administration af Azure-applikationer
- Opbygge tillid til fejlfinding og optimering af udrulninger
- Forstå produktionsklare udrulningsmetoder og sikkerhedsmæssige overvejelser

## Læringsresultater

Efter at have gennemført alle sektioner i denne studieguide vil du være i stand til at:
- Designe, implementere og administrere komplette applikationsarkitekturer ved hjælp af azd
- Implementere omfattende strategier for overvågning, sikkerhed og omkostningsoptimering
- Fejlsøge komplekse udrulningsproblemer selvstændigt
- Oprette brugerdefinerede skabeloner og bidrage til azd-fællesskabet

## 8-kapitlers læringsstruktur

### Kapitel 1: Grundlag & Kom godt i gang (Uge 1)
**Varighed**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå kernekoncepter og terminologi i Azure Developer CLI
- Installere og konfigurere AZD på din udviklingsplatform med succes
- Udrulle din første applikation ved hjælp af en eksisterende skabelon
- Navigere effektivt i AZD's kommandolinjegrænseflade

#### Centrale koncepter at mestre
- AZD-projektstruktur og komponenter (azure.yaml, infra/, src/)
- Skabelonbaserede udrulningsarbejdsgange
- Grundlæggende om miljøkonfiguration
- Administration af ressourcegrupper og abonnementer

#### Praktiske øvelser
1. **Installationsverifikation**: Installer AZD og verificer med `azd version`
2. **Første udrulning**: Udrul todo-nodejs-mongo-skabelonen med succes
3. **Miljøopsætning**: Konfigurer dine første miljøvariabler
4. **Ressourceundersøgelse**: Naviger i udrullede ressourcer i Azure Portal

#### Vurderingsspørgsmål
- Hvad er de centrale komponenter i et AZD-projekt?
- Hvordan initialiserer du et nyt projekt fra en skabelon?
- Hvad er forskellen mellem `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapitel 2: AI-først udvikling (Uge 2)
**Varighed**: 1-2 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbejdsgange
- Udrulle og konfigurere AI-drevne applikationer
- Forstå RAG (Retrieval-Augmented Generation) implementeringsmønstre
- Administrere AI-modeludrulninger og skalering

#### Centrale koncepter at mestre
- Integration af Microsoft Foundry Models-tjenesten og API-styring
- Konfiguration af AI Search og vektorindeksering
- Strategier for modeludrulning og kapacitetsplanlægning
- Overvågning af AI-applikationer og performanceoptimering

#### Praktiske øvelser
1. **AI-chat udrulning**: Udrul azure-search-openai-demo-skabelonen
2. **RAG-implementering**: Konfigurer dokumentindeksering og hentning
3. **Modelkonfiguration**: Opsæt flere AI-modeller til forskellige formål
4. **AI-overvågning**: Implementer Application Insights for AI-arbejdsbelastninger

#### Vurderingsspørgsmål
- Hvordan konfigurerer du Microsoft Foundry Models-tjenester i en AZD-skabelon?
- Hvad er de centrale komponenter i en RAG-arkitektur?
- Hvordan administrerer du kapacitet og skalering af AI-modeller?
- Hvilke overvågningsmålinger er vigtige for AI-applikationer?

---

### Kapitel 3: Konfiguration & Autentificering (Uge 3)
**Varighed**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Beherske miljøkonfigurations- og administrationsstrategier
- Implementere sikre autentificeringsmønstre og managed identity
- Organisere ressourcer med korrekte navngivningskonventioner
- Konfigurere multi-miljøudrulninger (dev, staging, prod)

#### Centrale koncepter at mestre
- Miljøhierarki og konfigurationsprioritering
- Managed identity og service principal-autentificering
- Key Vault-integration til hemmelighedshåndtering
- Miljøspecifik parameterhåndtering

#### Praktiske øvelser
1. **Opsætning af flere miljøer**: Konfigurer dev-, staging- og prod-miljøer
2. **Sikkerhedskonfiguration**: Implementer managed identity-autentificering
3. **Håndtering af hemmeligheder**: Integrer Azure Key Vault til følsomme data
4. **Parameterstyring**: Opret miljøspecifikke konfigurationer

#### Vurderingsspørgsmål
- Hvordan konfigurerer du forskellige miljøer med AZD?
- Hvad er fordelene ved at bruge managed identity frem for service principals?
- Hvordan håndterer du applikationshemmeligheder sikkert?
- Hvad er konfigurationshierarkiet i AZD?

---

### Kapitel 4: Infrastruktur som kode & Udrulning (Uge 4-5)
**Varighed**: 1-1.5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Oprette og tilpasse Bicep-infrastrukturskabeloner
- Implementere avancerede udrulningsmønstre og arbejdsgange
- Forstå strategier for ressourceprovisionering
- Designe skalerbare multi-service-arkitekturer

- Udrul containeriserede applikationer ved hjælp af Azure Container Apps og AZD


#### Centrale koncepter at mestre
- Bicep-skabelonstruktur og bedste praksis
- Ressourceafhængigheder og udrulningsrækkefølge
- Parameterfiler og skabelonmodularitet
- Tilpassede hooks og automatisering af udrulning
- Udrulningsmønstre for container-apps (hurtig start, produktion, microservices)

#### Praktiske øvelser
1. **Oprettelse af brugerdefineret skabelon**: Byg en multi-service applikationsskabelon
2. **Bicep-mestring**: Opret modulære, genanvendelige infrastrukturelementer
3. **Automatisering af udrulning**: Implementer pre/post-udrulningshooks
4. **Arkitekturdesign**: Udrul kompleks microservices-arkitektur
5. **Udrulning af Container-app**: Udrul eksemplerne [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) ved hjælp af AZD

#### Vurderingsspørgsmål
- Hvordan opretter du brugerdefinerede Bicep-skabeloner til AZD?
- Hvad er de bedste praksisser for organisering af infrastrukturkode?
- Hvordan håndterer du ressourceafhængigheder i skabeloner?
- Hvilke udrulningsmønstre understøtter opdateringer uden nedetid?

---

### Kapitel 5: Multi-agent AI-løsninger (Uge 6-7)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agentkoordination og kommunikation
- Udrulle produktionsklare AI-løsninger med overvågning
- Forstå agentspecialisering og arbejdsgangsmønstre
- Integrere containeriserede microservices som en del af multi-agent-løsninger

#### Centrale koncepter at mestre
- Multi-agent mønstre og designprincipper
- Agentkommunikationsprotokoller og dataflow
- Load balancing og skaleringsstrategier for AI-agenter
- Produktionsovervågning for multi-agent-systemer
- Service-til-service kommunikation i containeriserede miljøer

#### Praktiske øvelser
1. **Udrulning af detailhandelsløsning**: Udrul det komplette multi-agent detailscenario
2. **Agenttilpasning**: Ændr Customer- og Inventory-agenters adfærd
3. **Skalering af arkitektur**: Implementer load balancing og auto-scaling
4. **Produktionsovervågning**: Opsæt omfattende overvågning og alarmering
5. **Integration af microservices**: Udvid eksemplet [Microservices Architecture](../../../examples/container-app/microservices) til at understøtte agentbaserede arbejdsgange

#### Vurderingsspørgsmål
- Hvordan designer du effektive multi-agent kommunikationsmønstre?
- Hvad er de vigtigste overvejelser for at skalere AI-agentarbejdsbelastninger?
- Hvordan overvåger og debugger du multi-agent AI-systemer?
- Hvilke produktionsmønstre sikrer pålidelighed for AI-agenter?

---

### Kapitel 6: Præ-udrulningsvalidering & planlægning (Uge 8)
**Varighed**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udføre omfattende kapacitetsplanlægning og ressourcevalidering
- Vælge optimale Azure-SKUs for omkostningseffektivitet
- Implementere automatiserede pre-flight-tjek og validering
- Planlægge udrulninger med omkostningsoptimeringsstrategier

#### Centrale koncepter at mestre
- Azure-resourceskvoter og kapacitetsbegrænsninger
- Kriterier for valg af SKU og omkostningsoptimering
- Automatiserede valideringsscripts og test
- Udrulningsplanlægning og risikovurdering

#### Praktiske øvelser
1. **Kapacitetsanalyse**: Analyser ressourcekravene til dine applikationer
2. **SKU-optimering**: Sammenlign og vælg omkostningseffektive servicelag
3. **Valideringsautomatisering**: Implementer pre-udrulnings tjek-scripts
4. **Omkostningsplanlægning**: Opret estimater og budgetter for udrulning

#### Vurderingsspørgsmål
- Hvordan validerer du Azure-kapacitet før udrulning?
- Hvilke faktorer påvirker beslutninger om valg af SKU?
- Hvordan automatiserer du pre-udrulningsvalidering?
- Hvilke strategier hjælper med at optimere udrulningsomkostninger?

---

### Kapitel 7: Fejlfinding & Debugging (Uge 9)
**Varighed**: 1-1.5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udvikle systematiske debugging-tilgange til AZD-udrulninger
- Løse almindelige udrulnings- og konfigurationsproblemer
- Debugge AI-specifikke problemer og ydelsesproblemer
- Implementere overvågning og alarmering til proaktiv fejlregistrering

#### Centrale koncepter at mestre
- Diagnoseteknikker og logstrategier
- Almindelige fejlmønstre og deres løsninger
- Performanceovervågning og optimering
- Hændelsesrespons og genopretningsprocedurer

#### Praktiske øvelser
1. **Diagnostiske færdigheder**: Træn med bevidst ødelagte udrulninger
2. **Loganalyse**: Brug Azure Monitor og Application Insights effektivt
3. **Performance-tuning**: Optimér langsomt kørende applikationer
4. **Genopretningsprocedurer**: Implementer backup og katastrofegendannelse

#### Vurderingsspørgsmål
- Hvad er de mest almindelige AZD-udrulningsfejl?
- Hvordan debugger du autentificerings- og tilladelsesproblemer?
- Hvilke overvågningsstrategier hjælper med at forhindre produktionsproblemer?
- Hvordan optimerer du applikationsydelsen i Azure?

---

### Kapitel 8: Produktions- & Enterprise-mønstre (Uge 10-11)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere enterpriseklasse udrulningsstrategier
- Designe sikkerhedsmønstre og compliance-rammeværk
- Etablere overvågning, governance og omkostningsstyring
- Oprette skalerbare CI/CD-pipelines med AZD-integration
- Anvende bedste praksis for produktionsudrulning af container-apps (sikkerhed, overvågning, omkostninger, CI/CD)

#### Centrale koncepter at mestre
- Enterprise-sikkerheds- og compliancekrav
- Governance-rammeværk og implementering af politikker
- Avanceret overvågning og omkostningsstyring
- CI/CD-integration og automatiserede udrulningspipelines
- Blue-green- og canary-udrulningsstrategier for containeriserede workloads

#### Praktiske øvelser
1. **Enterprise-sikkerhed**: Implementer omfattende sikkerhedsmønstre
2. **Governance-rammeværk**: Opsæt Azure Policy og ressourcestyring
3. **Avanceret overvågning**: Opret dashboards og automatiseret alarmering
4. **CI/CD-integration**: Byg automatiserede udrulningspipelines
5. **Produktionscontainer-apps**: Anvend sikkerhed, overvågning og omkostningsoptimering på eksemplet [Microservices Architecture](../../../examples/container-app/microservices)

#### Vurderingsspørgsmål
- Hvordan implementerer du enterprise-sikkerhed i AZD-udrulninger?
- Hvilke governance-mønstre sikrer compliance og omkostningskontrol?
- Hvordan designer du skalerbar overvågning for produktionssystemer?
- Hvilke CI/CD-mønstre fungerer bedst med AZD-arbejdsgange?

#### Læringsmål
- Forstå Azure Developer CLI-fundamenter og kernekoncepter
- Installere og konfigurere azd på dit udviklingsmiljø med succes
- Fuldføre din første udrulning ved hjælp af en eksisterende skabelon
- Navigere i azd-projektstrukturen og forstå nøglekomponenterne

#### Centrale koncepter at mestre
- Skabeloner, miljøer og services
- azure.yaml-konfigurationsstruktur
- Basale azd-kommandoer (init, up, down, deploy)
- Infrastructure as Code-principper
- Azure-autentificering og autorisation

#### Praktiske øvelser

**Øvelse 1.1: Installation og opsætning**
```bash
# Udfør disse opgaver:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første udrulning**
```bash
# Udrul en simpel webapplikation:
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
3. Hvordan hjælper miljøer med at administrere forskellige udrulningsmål?
4. Hvilke autentificeringsmetoder kan bruges med azd?
5. Hvad sker der, når du kører `azd up` første gang?

---

## Fremdriftssporing og vurderingsramme
```bash
# Opret og konfigurer flere miljøer:
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
# Implementer bedste praksis for sikkerhed:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selv-evalueringsspørgsmål
1. Hvordan håndterer azd prioritet mellem miljøvariabler?
2. Hvad er udrulningshooks, og hvornår bør du bruge dem?
3. Hvordan konfigurerer du forskellige SKUs for forskellige miljøer?
4. Hvad er sikkerhedsmæssige konsekvenser af forskellige autentificeringsmetoder?
5. Hvordan håndterer du hemmeligheder og følsomme konfigurationsdata?

### Modul 3: Udrulning og provisionering (Uge 4)

#### Læringsmål
- Beherske udrulningsarbejdsgange og bedste praksis
- Forstå Infrastructure as Code med Bicep-skabeloner
- Implementere komplekse multi-service-arkitekturer
- Optimere udrulningsydelse og pålidelighed

#### Centrale koncepter at mestre
- Bicep-skabelonstruktur og moduler
- Ressourceafhængigheder og rækkefølge
- Udrulningsstrategier (blue-green, rolling updates)
- Udrulninger på tværs af regioner
- Database-migrationer og datastyring

#### Praktiske øvelser

**Øvelse 3.1: Brugerdefineret infrastruktur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Multi-service applikation**
```bash
# Udrul en mikrotjenestearkitektur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Øvelse 3.3: Databaseintegration**
```bash
# Implementer mønstre for databaseudrulning:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selv-evalueringsspørgsmål
1. Hvad er fordelene ved at bruge Bicep frem for ARM-skabeloner?
2. Hvordan håndterer du database-migrationer i azd-udrulninger?
3. Hvilke strategier findes for udrulninger uden nedetid?
4. Hvordan administrerer du afhængigheder mellem services?
5. Hvad er overvejelserne for udrulninger på tværs af regioner?

### Modul 4: Præ-udrulningsvalidering (Uge 5)
- Implementer omfattende forudgående kontroller før udrulning
- Mestre kapacitetsplanlægning og ressourcevalidering
- Forstå valg af SKU'er og omkostningsoptimering
- Opbyg automatiserede valideringspipelines

#### Nøglekoncepter at mestre
- Azure-ressourcekvoter og begrænsninger
- Kriterier for SKU-valg og omkostningsimplikationer
- Automatiserede valideringsscripts og værktøjer
- Metodikker for kapacitetsplanlægning
- Ydelsestest og optimering

#### Praktiske øvelser

**Øvelse 4.1: Kapacitetsplanlægning**
```bash
# Implementer kapacitetsvalidering:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Øvelse 4.2: Forhåndsvalidering**
```powershell
# Opbyg en omfattende valideringspipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Øvelse 4.3: SKU-optimering**
```bash
# Optimer servicekonfigurationer:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selvvurderingsspørgsmål
1. Hvilke faktorer bør påvirke beslutningen om valg af SKU?
2. Hvordan validerer du tilgængeligheden af Azure-ressourcer før udrulning?
3. Hvad er nøglekomponenterne i et forhåndstjek-system?
4. Hvordan estimerer og kontrollerer du udrulningsomkostninger?
5. Hvilken overvågning er essentiel for kapacitetsplanlægning?

### Modul 5: Fejlfinding og fejlretning (Uge 6)

#### Læringsmål
- Mestre systematiske fejlfindingstilgange
- Udvikle ekspertise i fejlretning af komplekse udrulningsproblemer
- Implementere omfattende overvågning og alarmering
- Opbygge procedurer for hændelsesrespons og genopretning

#### Nøglekoncepter at mestre
- Almindelige fejlmønstre ved udrulning
- Loganalyse og korrelationsteknikker
- Ydelsesovervågning og optimering
- Detektion og respons på sikkerhedshændelser
- Katastrofegendannelse og forretningskontinuitet

#### Praktiske øvelser

**Øvelse 5.1: Fejlsøgningsscenarier**
```bash
# Øv dig i at løse almindelige problemer:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Øvelse 5.2: Implementering af overvågning**
```bash
# Opsæt omfattende overvågning:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Øvelse 5.3: Hændelsesrespons**
```bash
# Opbyg procedurer for hændelseshåndtering:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Selvvurderingsspørgsmål
1. Hvad er den systematiske tilgang til fejlfinding af azd-udrulninger?
2. Hvordan korrelerer du logs på tværs af flere services og ressourcer?
3. Hvilke overvågningsmålinger er mest kritiske for tidlig problemdetektion?
4. Hvordan implementerer du effektive katastrofegendannelsesprocedurer?
5. Hvad er nøglekomponenterne i en hændelsesresponsplan?

### Modul 6: Avancerede emner og bedste praksis (Uge 7-8)

#### Læringsmål
- Implementere enterprise-grade udrulningsmønstre
- Mestre CI/CD-integration og automatisering
- Udvikle brugerdefinerede skabeloner og bidrage til fællesskabet
- Forstå avancerede sikkerheds- og compliance-krav

#### Nøglekoncepter at mestre
- Integrationsmønstre for CI/CD-pipelines
- Udvikling og distribution af brugerdefinerede skabeloner
- Virksomhedsstyring og compliance
- Avancerede netværks- og sikkerhedskonfigurationer
- Ydelsesoptimering og omkostningsstyring

#### Praktiske øvelser

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
# Opret og udgiv brugerdefinerede skabeloner:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Enterprise-implementering**
```bash
# Implementer funktioner på virksomhedsniveau:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selvvurderingsspørgsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-workflows?
2. Hvad er de vigtigste overvejelser ved udvikling af brugerdefinerede skabeloner?
3. Hvordan implementerer du styring og compliance i azd-udrulninger?
4. Hvad er bedste praksis for udrulninger i virksomhedsskala?
5. Hvordan bidrager du effektivt til azd-fællesskabet?

## Praktiske projekter

### Projekt 1: Personlig porteføljehjemmeside
**Kompleksitet**: Begynder  
**Varighed**: 1-2 uger

Byg og udrul en personlig porteføljehjemmeside med:
- Statisk webhosting på Azure Storage
- Konfiguration af brugerdefineret domæne
- CDN-integration for global ydeevne
- Automatiseret udrulningspipeline

**Leverancer**:
- Fungerende website udrullet på Azure
- Brugerdefineret azd-skabelon til porteføljeudrulninger
- Dokumentation af udrulningsprocessen
- Omkostningsanalyse og optimeringsanbefalinger

### Projekt 2: Opgavestyringsapplikation
**Kompleksitet**: Mellem  
**Varighed**: 2-3 uger

Opret en full-stack opgavestyringsapplikation med:
- React-frontend udrullet til App Service
- Node.js API-backend med autentificering
- PostgreSQL-database med migrations
- Application Insights-overvågning

**Leverancer**:
- Komplet applikation med brugergodkendelse
- Databaseskema og migrationsscripts
- Overvågningsdashboard og alarmsregler
- Fler-miljø udrulningskonfiguration

### Projekt 3: Mikrotjenestebaseret e-handelsplatform
**Kompleksitet**: Avanceret  
**Varighed**: 4-6 uger

Design og implementer en mikrotjenestebaseret e-handelsplatform:
- Flere API-services (katalog, ordrer, betalinger, brugere)
- Beskedkøintegration med Service Bus
- Redis-cache til ydelsesoptimering
- Omfattende logning og overvågning

**Referenceeksempel**: Se [Mikrotjenestearkitektur](../../../examples/container-app/microservices) for en produktionsklar skabelon og udrulningsvejledning

**Leverancer**:
- Komplett mikrotjenestearkitektur
- Mønstre for kommunikation mellem tjenester
- Ydelsestest og optimering
- Produktionsklar sikkerhedsimplementering

## Vurdering og certificering

### Videnstjek

Gennemfør disse vurderinger efter hvert modul:

**Modul 1 Vurdering**: Grundlæggende koncepter og installation
- Multiple choice-spørgsmål om kernekoncepter
- Praktiske installations- og konfigurationsopgaver
- Simpel udrulningsøvelse

**Modul 2 Vurdering**: Konfiguration og miljøer
- Scenarier for miljøstyring
- Fejlsøgning af konfiguration
- Implementering af sikkerhedskonfiguration

**Modul 3 Vurdering**: Udrulning og provisionering
- Infrastrukturdesignudfordringer
- Scenarier for multi-service udrulning
- Øvelser i ydelsesoptimering

**Modul 4 Vurdering**: Forhåndsvalidering før udrulning
- Case-studier i kapacitetsplanlægning
- Scenarier for omkostningsoptimering
- Implementering af valideringspipeline

**Modul 5 Vurdering**: Fejlfinding og fejlretning
- Problemdiagnoseøvelser
- Opgaver i implementering af overvågning
- Simuleringer af hændelsesrespons

**Modul 6 Vurdering**: Avancerede emner
- Design af CI/CD-pipelines
- Udvikling af brugerdefinerede skabeloner
- Scenarier for virksomhedens arkitektur

### Afsluttende capstone-projekt

Design og implementer en komplet løsning, der demonstrerer mestring af alle koncepter:

**Krav**:
- Flerlags applikationsarkitektur
- Flere udrulningsmiljøer
- Omfattende overvågning og alarmering
- Implementering af sikkerhed og compliance
- Omkostningsoptimering og ydelsestuning
- Fuldstændig dokumentation og runbooks

**Evaluationskriterier**:
- Teknisk implementeringskvalitet
- Dokumentationens fuldstændighed
- Overholdelse af sikkerhed og bedste praksis
- Ydelse og omkostningsoptimering
- Fejlfinding og overvågnings effektivitet

## Studieressourcer og referencer

### Officiel dokumentation
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fællesskabsressourcer
- [AZD-skabelongalleri](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub-organisationen](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub-repositorium](https://github.com/Azure/azure-dev)

### Øvelsesmiljøer
- [Gratis Azure-konto](https://azure.microsoft.com/free/)
- [Azure DevOps gratis niveau](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Yderligere værktøjer
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Anbefalet studieplan

### Fuldtidsstudie (8 uger)
- **Uger 1-2**: Moduler 1-2 (Kom godt i gang, Konfiguration)
- **Uger 3-4**: Moduler 3-4 (Udrulning, Forudgående validering)
- **Uger 5-6**: Moduler 5-6 (Fejlfinding, Avancerede emner)
- **Uger 7-8**: Praktiske projekter og afsluttende vurdering

### Deltidsstudie (16 uger)
- **Uger 1-4**: Modul 1 (Kom godt i gang)
- **Uger 5-7**: Modul 2 (Konfiguration og miljøer)
- **Uger 8-10**: Modul 3 (Udrulning og provisionering)
- **Uger 11-12**: Modul 4 (Forudgående validering)
- **Uger 13-14**: Modul 5 (Fejlfinding og fejlretning)
- **Uger 15-16**: Modul 6 (Avancerede emner og vurdering)

---

## Fremskridtssporing og vurderingsramme

### Tjekliste for kapitelafslutning

#### 📚 Kapitel 1: Grundlag & Kom godt i gang
- [ ] **Installation Fuldført**: AZD installeret og verificeret på din platform
- [ ] **Første udrulning**: Succesfuldt udrullet todo-nodejs-mongo skabelon
- [ ] **Miljøopsætning**: Konfigureret de første miljøvariabler
- [ ] **Ressourcenavigation**: Udforsket udrullede ressourcer i Azure-portalen
- [ ] **Kommandomestring**: Fortrolig med grundlæggende AZD-kommandoer

#### 🤖 Kapitel 2: AI-først udvikling  
- [ ] **AI-skabelonudrulning**: Udrullet azure-search-openai-demo med succes
- [ ] **RAG-implementering**: Konfigureret dokumentindeksering og hentning
- [ ] **Modelkonfiguration**: Opsat flere AI-modeller til forskellige formål
- [ ] **AI-overvågning**: Implementeret Application Insights til AI-workloads
- [ ] **Ydelsesoptimering**: Optimeret AI-applikationens ydeevne

#### ⚙️ Kapitel 3: Konfiguration & Autentificering
- [ ] **Opsætning af flere miljøer**: Konfigureret dev, staging og prod miljøer
- [ ] **Sikkerhedsimplementering**: Opsat managed identity-autentificering
- [ ] **Håndtering af secrets**: Integreret Azure Key Vault til følsomme data
- [ ] **Parameterstyring**: Oprettet miljøspecifikke konfigurationer
- [ ] **Autentificeringsmestring**: Implementeret sikre adgangsmønstre

#### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
- [ ] **Oprettelse af brugerdefinerede skabeloner**: Opbygget en multi-service applikationsskabelon
- [ ] **Bicep-mestring**: Oprettet modulære, genanvendelige infrastrukturkomponenter
- [ ] **Udrulningsautomatisering**: Implementeret pre/post udrulningshooks
- [ ] **Arkitekturdesign**: Udrullet kompleks mikrotjenestearkitektur
- [ ] **Skabelonoptimering**: Optimeret skabeloner for ydeevne og omkostninger

#### 🎯 Kapitel 5: Multi-agent AI-løsninger
- [ ] **Udrulning af detailhandelsløsning**: Udrullet komplet multi-agent detailhandelsscenario
- [ ] **Agenttilpasning**: Tilpasset Customer og Inventory agenters adfærd
- [ ] **Arkitektur skalering**: Implementeret load balancing og autoskalering
- [ ] **Produktionsovervågning**: Opsat omfattende overvågning og alarmering
- [ ] **Ydelsestuning**: Optimeret multi-agent systems ydeevne

#### 🔍 Kapitel 6: Forudgående validering & planlægning
- [ ] **Kapacitetsanalyse**: Analyseret ressourcekrav til applikationer
- [ ] **SKU-optimering**: Valgt omkostningseffektive servicetiers
- [ ] **Valideringsautomatisering**: Implementeret pre-udrulnings tjek-scripts
- [ ] **Omkostningsplanlægning**: Oprettet estimerede udrulningsomkostninger og budgetter
- [ ] **Risikovurdering**: Identificeret og afbødet udrulningsrisici

#### 🚨 Kapitel 7: Fejlfinding & Fejlretning
- [ ] **Diagnostiske færdigheder**: Med succes fejlrettet bevidst ødelagte udrulninger
- [ ] **Loganalyse**: Brugt Azure Monitor og Application Insights effektivt
- [ ] **Ydelsestuning**: Optimeret langsomt ydende applikationer
- [ ] **Genopretningsprocedurer**: Implementeret backup og katastrofegenopretning
- [ ] **Overvågningsopsætning**: Oprettet proaktiv overvågning og alarmering

#### 🏢 Kapitel 8: Produktion & Virksomhedsmønstre
- [ ] **Virksomhedssikkerhed**: Implementeret omfattende sikkerhedsmønstre
- [ ] **Styringsramme**: Opsat Azure Policy og ressourcestyring
- [ ] **Avanceret overvågning**: Oprettet dashboards og automatiseret alarmering
- [ ] **CI/CD-integration**: Bygget automatiserede udrulningspipelines
- [ ] **Compliance-implementering**: Opfyldt virksomheders compliance-krav

### Læringstidslinje og milepæle

#### Uge 1-2: Grundopbygning
- **Milepæl**: Udrul første AI-applikation ved hjælp af AZD
- **Validering**: Fungerende applikation tilgængelig via offentlig URL
- **Færdigheder**: Grundlæggende AZD-workflows og AI-serviceintegration

#### Uge 3-4: Konfigurationsmestring
- **Milepæl**: Fler-miljøudrulning med sikker autentificering
- **Validering**: Samme applikation udrullet til dev/staging/prod
- **Færdigheder**: Miljøstyring og sikkerhedsimplementering

#### Uge 5-6: Infrastrukturkompetence
- **Milepæl**: Brugerdefineret skabelon til kompleks multi-service applikation
- **Validering**: Genanvendelig skabelon udrullet af et andet teammedlem
- **Færdigheder**: Bicep-mestring og infrastrukturautomatisering

#### Uge 7-8: Avanceret AI-implementering
- **Milepæl**: Produktionsklar multi-agent AI-løsning
- **Validering**: System håndterer reelt belastning med overvågning
- **Færdigheder**: Multi-agent orkestrering og ydelsesoptimering

#### Uge 9-10: Produktionsberedskab
- **Milepæl**: Enterprise-grade udrulning med fuld compliance
- **Validering**: Bestået sikkerhedsrevision og omkostningsoptimeringsaudit
- **Færdigheder**: Styring, overvågning og CI/CD-integration

### Vurdering og certificering

#### Metoder til validering af viden
1. **Praktiske udrulninger**: Fungerende applikationer for hvert kapitel
2. **Kodegennemgange**: Vurdering af skabelon- og konfigurationskvalitet
3. **Problemløsning**: Fejlfinding scenarier og løsninger
4. **Undervisning af medstuderende**: Forklar koncepter til andre lærende
5. **Fællesskabsbidrag**: Del skabeloner eller forbedringer

#### Professionelle udviklingsresultater
- **Porteføljeprojekter**: 8 produktionsklare implementeringer
- **Tekniske færdigheder**: Industri-standard AZD- og AI-implementeringsekspertise
- **Problemløsningsevner**: Uafhængig fejlsøgning og optimering
- **Fællesskabsanerkendelse**: Aktiv deltagelse i Azure-udviklerfællesskabet
- **Karriereudvikling**: Færdigheder direkte anvendelige i cloud- og AI-roller

#### Succeskriterier
- **Implementeringssuccesrate**: >95% succesfulde implementeringer
- **Fejlsøgningstid**: <30 minutter for almindelige problemer
- **Ydeevneoptimering**: Påviselige forbedringer i omkostninger og ydeevne
- **Sikkerhedsoverholdelse**: Alle implementeringer overholder virksomhedens sikkerhedsstandarder
- **Videnoverførsel**: Evne til at vejlede andre udviklere

### Kontinuerlig læring og fællesskabsengagement

#### Hold dig opdateret
- **Azure-opdateringer**: Følg Azure Developer CLI udgivelsesnoter
- **Fællesskabsarrangementer**: Deltag i Azure- og AI-udviklerarrangementer
- **Dokumentation**: Bidrag til fællesskabets dokumentation og eksempler
- **Feedbacksløjfe**: Giv feedback på kursusindhold og Azure-tjenester

#### Karriereudvikling
- **Professionelt netværk**: Forbind dig med Azure- og AI-eksperter
- **Muligheder for oplæg**: Præsenter dine erfaringer på konferencer eller meetups
- **Open source-bidrag**: Bidrag til AZD-skabeloner og værktøjer
- **Mentorskab**: Guide andre udviklere i deres AZD-læringsrejse

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../README.md)
- **📖 Kom i gang**: [Kapitel 1: Grundlag & Hurtig start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremgangssporing**: Spor din fremgang gennem det omfattende 8-kapitlers læringssystem
- **🤝 Fællesskab**: [Azure Discord](https://discord.gg/microsoft-azure) til support og diskussion

**Sporing af studiefremgang**: Brug denne strukturerede vejledning til at mestre Azure Developer CLI gennem progressiv, praktisk læring med målbare resultater og faglige udviklingsfordele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, bedes du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets modersmål bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->