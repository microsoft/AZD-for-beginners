# Studiemateriale - Omfattende læringsmål

**Navigation i læringsforløbet**
- **📚 Kursusforside**: [AZD For Beginners](../README.md)
- **📖 Begynd at lære**: [Kapitel 1: Grundlag & Hurtig start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremgangssporing**: [Kursusfærdiggørelse](../README.md#-course-completion--certification)

## Introduktion

Dette omfattende studiemateriale giver strukturerede læringsmål, nøglebegreber, praksisøvelser og vurderingsmaterialer, der hjælper dig med at mestre Azure Developer CLI (azd). Brug denne guide til at spore dine fremskridt og sikre, at du har dækket alle væsentlige emner.

## Læringsmål

Ved at gennemføre dette studiemateriale vil du:
- Mestre alle grundlæggende og avancerede koncepter i Azure Developer CLI
- Udvikle praktiske færdigheder i udrulning og håndtering af Azure-applikationer
- Opbygge selvsikkerhed i fejlfinding og optimering af udrulninger
- Forstå praksisser for produktionsklar udrulning og sikkerhedsovervejelser

## Læringsudbytte

Efter at have gennemført alle sektioner i dette studiemateriale vil du kunne:
- Designe, udrulle og administrere komplette applikationsarkitekturer ved hjælp af azd
- Implementere omfattende overvågnings-, sikkerheds- og omkostningsoptimeringsstrategier
- Selvstændigt fejlfinde komplekse udrulningsproblemer
- Oprette brugerdefinerede skabeloner og bidrage til azd-fællesskabet

## 8-kapitel læringsstruktur

### Kapitel 1: Grundlag & Hurtig start (Uge 1)
**Varighed**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå Azure Developer CLI’s kernbegreber og terminologi
- Installere og konfigurere AZD på din udviklingsplatform med succes
- Udrulle din første applikation ved hjælp af en eksisterende skabelon
- Navigere effektivt i AZD kommandolinjegrænsefladen

#### Nøglebegreber at mestre
- AZD projektstruktur og komponenter (azure.yaml, infra/, src/)
- Skabelonbaserede udrulningsarbejdsgange
- Grundlæggende miljøkonfiguration
- Håndtering af ressourcegrupper og abonnementer

#### Praksisøvelser
1. **Installationsverifikation**: Installer AZD og verificer med `azd version`
2. **Første udrulning**: Udrul todo-nodejs-mongo-skabelonen med succes
3. **Miljøopsætning**: Konfigurer dine første miljøvariable
4. **Resurseudforskning**: Naviger i udrullede ressourcer i Azure Portal

#### Vurderingsspørgsmål
- Hvad er de centrale komponenter i et AZD-projekt?
- Hvordan initialiserer du et nyt projekt fra en skabelon?
- Hvad er forskellen mellem `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapitel 2: AI-First Udvikling (Uge 2)
**Varighed**: 1-2 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbejdsgange
- Udrulle og konfigurere AI-drevne applikationer
- Forstå RAG (Retrieval-Augmented Generation) implementeringsmønstre
- Administrere AI-modeludrulninger og skalering

#### Nøglebegreber at mestre
- Microsoft Foundry Models serviceintegration og API-administration
- AI Search-konfiguration og vektorindeksering
- Modeludrulningsstrategier og kapacitetsplanlægning
- AI applikationsovervågning og performanceoptimering

#### Praksisøvelser
1. **AI Chat-udrulning**: Udrul azure-search-openai-demo-skabelonen
2. **RAG-implementering**: Konfigurer dokumentindeksering og hentning
3. **Modelkonfiguration**: Opsæt flere AI-modeller med forskellige formål
4. **AI-overvågning**: Implementer Application Insights til AI-arbejdsbelastninger

#### Vurderingsspørgsmål
- Hvordan konfigurerer du Microsoft Foundry Models tjenester i en AZD-skabelon?
- Hvad er nøglekomponenterne i en RAG-arkitektur?
- Hvordan håndterer du kapacitet og skalering af AI-modeller?
- Hvilke overvågningsmetrikker er vigtige for AI-applikationer?

---

### Kapitel 3: Konfiguration & Autentificering (Uge 3)
**Varighed**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre strategier for miljøkonfiguration og -styring
- Implementere sikre autentificeringsmønstre og managed identity
- Organisere ressourcer med korrekte navngivningskonventioner
- Konfigurere udrulninger med flere miljøer (dev, staging, produktion)

#### Nøglebegreber at mestre
- Miljøhierarki og konfigurationsprioritet
- Managed identity og service principal autentificering
- Key Vault integration til hemmelighedshåndtering
- Miljøspecifik parameterstyring

#### Praksisøvelser
1. **Multi-miljøopsætning**: Konfigurer dev, staging og produktion miljøer
2. **Sikkerhedskonfiguration**: Implementer managed identity autentificering
3. **Håndtering af hemmeligheder**: Integrer Azure Key Vault til følsomme data
4. **Parametermanagement**: Opret miljøspecifikke konfigurationer

#### Vurderingsspørgsmål
- Hvordan konfigurerer du forskellige miljøer med AZD?
- Hvad er fordelene ved at bruge managed identity fremfor service principals?
- Hvordan håndterer du applikationshemmeligheder sikkert?
- Hvad er konfigurationshierarkiet i AZD?

---

### Kapitel 4: Infrastruktur som kode & udrulning (Uge 4-5)
**Varighed**: 1-1.5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Oprette og tilpasse Bicep infrastruktuurskabeloner
- Implementere avancerede udrulningsmønstre og arbejdsgange
- Forstå strategier for ressourceprovisionering
- Designe skalerbare multi-service arkitekturer

- Udrulle containeriserede applikationer ved hjælp af Azure Container Apps og AZD


#### Nøglebegreber at mestre
- Bicep-skabelonstruktur og bedste praksis
- Ressourceafhængigheder og udrulningsrækkefølge
- Parameterfiler og skabelonmodularitet
- Tilpassede hooks og udrulningsautomatisering
- Udrulningsmønstre for container apps (hurtig start, produktion, mikrotjenester)

#### Praksisøvelser
1. **Oprettelse af brugerdefineret skabelon**: Byg en multi-service applikationsskabelon
2. **Bicep-mesterskab**: Skab modulære, genanvendelige infrastrukturelementer
3. **Automatisering af udrulning**: Implementer pre/post udrulningshooks
4. **Arkitekturdesign**: Udrul kompleks mikrotjenestearkitektur
5. **Container app udrulning**: Udrul eksemplerne [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) ved hjælp af AZD

#### Vurderingsspørgsmål
- Hvordan opretter man brugerdefinerede Bicep-skabeloner til AZD?
- Hvad er bedste praksis for organisering af infrastrukturkode?
- Hvordan håndterer man ressourceafhængigheder i skabeloner?
- Hvilke udrulningsmønstre understøtter opdateringer uden nedetid?

---

### Kapitel 5: Multi-Agent AI-løsninger (Uge 6-7)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agentkoordination og kommunikation
- Udrulle produktionsklare AI-løsninger med overvågning
- Forstå agent-specialisering og arbejdsgangsmønstre
- Integrere containeriserede mikrotjenester som del af multi-agent løsninger

#### Nøglebegreber at mestre
- Multi-agent arkitekturmønstre og designprincipper
- Agent-kommunikationsprotokoller og dataflow
- Load balancing og skaleringsstrategier for AI-agenter
- Produktionsovervågning for multi-agent systemer
- Service-til-service kommunikation i containeriserede miljøer

#### Praksisøvelser
1. **Gennemgang af retail-arkitektur**: Analysér retail blueprint og identificer hvilke applikationskomponenter der skal implementeres før udrulning
2. **Agenttilpasning**: Ændr Customer og Inventory agenters adfærd
3. **Arkitekturskalering**: Implementer load balancing og autoskalering
4. **Produktionsovervågning**: Opsæt omfattende overvågning og alarmering
5. **Mikrotjenesteintegration**: Udvid eksemplet [Microservices Architecture](../../../examples/container-app/microservices) til at understøtte agentbaserede arbejdsgange

#### Vurderingsspørgsmål
- Hvordan designer man effektive multi-agent kommunikationsmønstre?
- Hvad er nøgleovervejelser ved skalering af AI-agent arbejdsbelastninger?
- Hvordan overvåger og fejlfinder man multi-agent AI-systemer?
- Hvilke produktionsmønstre sikrer pålidelighed for AI-agenter?

---

### Kapitel 6: Validering & Planlægning før udrulning (Uge 8)
**Varighed**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udfør omfattende kapacitetsplanlægning og ressourcevalidering
- Vælg optimale Azure SKU'er for omkostningseffektivitet
- Implementer automatiserede pre-flight checks og validering
- Planlæg udrulninger med omkostningsoptimeringsstrategier

#### Nøglebegreber at mestre
- Azure ressourcekvoter og kapacitetsbegrænsninger
- SKU-udvælgelseskriterier og omkostningsoptimering
- Automatiserede valideringsscripts og testning
- Planlægning af udrulning og risikovurdering

#### Praksisøvelser
1. **Kapacitetsanalyse**: Analyser ressourcebehov for dine applikationer
2. **SKU-optimering**: Sammenlign og vælg omkostningseffektive servicelag
3. **Automatisering af validering**: Implementer pre-udrulningskontrolscripts
4. **Omkostningsplanlægning**: Opret udrulningsomkostningsestimater og budgetter

#### Vurderingsspørgsmål
- Hvordan validerer du Azure-kapacitet før udrulning?
- Hvilke faktorer påvirker SKU-valgsbeslutninger?
- Hvordan automatiserer du pre-udrulningsvalidering?
- Hvilke strategier hjælper med at optimere udrulningsomkostninger?

---

### Kapitel 7: Fejlfinding & Debugging (Uge 9)
**Varighed**: 1-1.5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udvikle systematiske debugging-metoder for AZD-udrulninger
- Løse almindelige udrulnings- og konfigurationsproblemer
- Debugge AI-specifikke problemer og performance-udfordringer
- Implementere overvågning og alarmering for proaktiv problemopdagelse

#### Nøglebegreber at mestre
- Diagnostiske teknikker og logningsstrategier
- Almindelige fejlmønstre og deres løsninger
- Performanceovervågning og optimering
- Incident response og genopretningsprocedurer

#### Praksisøvelser
1. **Diagnostiske færdigheder**: Øv dig med bevidst fejlbehæftede udrulninger
2. **Loganalyse**: Brug Azure Monitor og Application Insights effektivt
3. **Performanceoptimering**: Optimer langsomt kørende applikationer
4. **Genopretningsprocedurer**: Implementer backup og disaster recovery

#### Vurderingsspørgsmål
- Hvad er de mest almindelige fejl i AZD-udrulninger?
- Hvordan debugges autentificerings- og tilladelsesproblemer?
- Hvilke overvågningsstrategier hjælper med at forhindre problemer i produktion?
- Hvordan optimerer man applikationsperformance i Azure?

---

### Kapitel 8: Produktions- & enterprise-mønstre (Uge 10-11)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere enterprise-grade udrulningsstrategier
- Designe sikkerhedsmønstre og compliance-rammer
- Etablere overvågning, styring og omkostningsstyring
- Oprette skalerbare CI/CD-pipelines med AZD-integration
- Anvende bedste praksis for produktionsudrulninger af container apps (sikkerhed, overvågning, omkostninger, CI/CD)

#### Nøglebegreber at mestre
- Enterprise sikkerheds- og compliance-krav
- Styringsrammer og implementering af politikker
- Avanceret overvågning og omkostningsstyring
- CI/CD-integration og automatiserede deployments-pipelines
- Blue-green og canary udrulningsstrategier for containeriserede workloads

#### Praksisøvelser
1. **Enterprise sikkerhed**: Implementer omfattende sikkerhedsmønstre
2. **Styringsrammeværk**: Opsæt Azure Policy og ressourcestyring
3. **Avanceret overvågning**: Opret dashboards og automatiseret alarmering
4. **CI/CD integration**: Byg automatiserede deployments-pipelines
5. **Produktions Container Apps**: Anvend sikkerhed, overvågning og omkostningsoptimering til [Microservices-arkitekturen](../../../examples/container-app/microservices) eksemplet

#### Vurderingsspørgsmål
- Hvordan implementerer du virksomhedssikkerhed i AZD-udrulninger?
- Hvilke styringsmønstre sikrer overholdelse og omkostningskontrol?
- Hvordan designer du skalerbar overvågning til produktionssystemer?
- Hvilke CI/CD-mønstre fungerer bedst med AZD-arbejdsgange?

#### Læringsmål
- Forstå Azure Developer CLI grundlæggende og kernekoncepter
- Installer og konfigurer azd succesfuldt i dit udviklingsmiljø
- Gennemfør din første udrulning ved hjælp af en eksisterende skabelon
- Naviger i azd projektstrukturen og forstå nøglekomponenter

#### Centrale koncepter at mestre
- Skabeloner, miljøer og services
- azure.yaml konfigurationsstruktur
- Grundlæggende azd kommandoer (init, up, down, deploy)
- Infrastruktur som kode principper
- Azure autentificering og autorisation

#### Øvelser

**Øvelse 1.1: Installation og opsætning**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første udrulning**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Øvelse 1.3: Projektstruktur analyse**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Selv-vurderingsspørgsmål
1. Hvad er de tre kernekoncepter i azd arkitekturen?
2. Hvad er formålet med azure.yaml filen?
3. Hvordan hjælper miljøer med at styre forskellige udrulningsmål?
4. Hvilke autentificeringsmetoder kan bruges med azd?
5. Hvad sker der, når du kører `azd up` for første gang?

---

## Fremskridts- og vurderingsramme
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Øvelse 2.2: Avanceret konfiguration**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Øvelse 2.3: Sikkerhedskonfiguration**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selv-vurderingsspørgsmål
1. Hvordan håndterer azd miljøvariablernes prioritet?
2. Hvad er udrulningshooks, og hvornår bør de bruges?
3. Hvordan konfigurerer du forskellige SKU'er til forskellige miljøer?
4. Hvad er sikkerhedsmæssige konsekvenser af forskellige autentificeringsmetoder?
5. Hvordan håndterer du hemmeligheder og følsomme konfigurationsdata?

### Modul 3: Udrulning og provisioning (Uge 4)

#### Læringsmål
- Mestre udrulningsarbejdsgange og bedste praksis
- Forstå Infrastruktur som kode med Bicep skabeloner
- Implementer komplekse multi-service arkitekturer
- Optimer udrulningsydelse og pålidelighed

#### Centrale koncepter at mestre
- Bicep skabelonstruktur og moduler
- Ressourceafhængigheder og rækkefølge
- Udrulningsstrategier (blue-green, rullende opdateringer)
- Multi-region udrulninger
- Database-migrationer og datastyring

#### Øvelser

**Øvelse 3.1: Tilpasset infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Multi-service applikation**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Øvelse 3.3: Databaseintegration**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selv-vurderingsspørgsmål
1. Hvad er fordelene ved at bruge Bicep frem for ARM skabeloner?
2. Hvordan håndterer du database-migrationer i azd udrulninger?
3. Hvilke strategier findes for udrulninger uden nedetid?
4. Hvordan håndterer du afhængigheder mellem services?
5. Hvilke overvejelser gør du for multi-region udrulninger?

### Modul 4: Forud-udrulningsvalidering (Uge 5)

#### Læringsmål
- Implementer omfattende præ-udrulningskontroller
- Mestre kapacitetsplanlægning og ressourcvalidering
- Forstå SKU-valg og omkostningsoptimering
- Opbyg automatiserede valideringspipelines

#### Nøglebegreber at mestre
- Azure-ressourcekvoter og -grænser
- Kriterier for SKU-valg og omkostningsimplikationer
- Automatiserede valideringsscripts og værktøjer
- Metoder til kapacitetsplanlægning
- Ydelsestest og optimering

#### Øvelser

**Øvelse 4.1: Kapacitetsplanlægning**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Øvelse 4.2: Pre-flight Validering**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Øvelse 4.3: SKU-optimering**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selv-vurderingsspørgsmål
1. Hvilke faktorer bør påvirke SKU-valgsbeslutninger?
2. Hvordan validerer du Azure-ressource tilgængelighed før udrulning?
3. Hvad er nøglekomponenterne i et pre-flight tjeksystem?
4. Hvordan estimerer og kontrollerer du udrulningsomkostninger?
5. Hvilken overvågning er væsentlig for kapacitetsplanlægning?

### Modul 5: Fejlfinding og debugging (Uge 6)

#### Læringsmål
- Mestre systematiske fejlfindingmetoder
- Udvikle ekspertise i debugging af komplekse udrulningsproblemer
- Implementer omfattende overvågning og alarmering
- Opbyg hændelsesrespons- og genopretningsprocedurer

#### Nøglebegreber at mestre
- Almindelige fejlundertrykningsmønstre ved udrulning
- Loganalyse og korrelationsmetoder
- Ydelsesovervågning og optimering
- Sikkerhedshændelsesdetektion og respons
- Katastrofe-genopretning og forretningskontinuitet

#### Øvelser

**Øvelse 5.1: Fejlfinding-scenarier**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Øvelse 5.2: Overvågningsimplementering**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Øvelse 5.3: Hændelsesrespons**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Selv-vurderingsspørgsmål
1. Hvad er den systematiske tilgang til fejlfinding i azd-udrulninger?
2. Hvordan korrelerer du logs på tværs af flere tjenester og ressourcer?
3. Hvilke overvågningsmålinger er mest kritiske for tidlig problemopdagelse?
4. Hvordan implementerer du effektive katastrofe-genopretningsprocedurer?
5. Hvad er nøglekomponenterne i en hændelsesresponsplan?

### Modul 6: Avancerede emner og bedste praksis (Uge 7-8)

#### Læringsmål
- Implementer enterprise-grade udrulningsmønstre
- Mestre CI/CD-integration og automation
- Udvikle tilpassede skabeloner og bidrage til fællesskabet
- Forstå avancerede sikkerheds- og compliance-krav

#### Nøglebegreber at mestre
- CI/CD-pipeline integrationsmønstre
- Tilpasset skabelonudvikling og distribution
- Enterprise governance og compliance
- Avancerede netværks- og sikkerhedskonfigurationer
- Ydelsesoptimering og omkostningsstyring

#### Øvelser

**Øvelse 6.1: CI/CD-integration**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Øvelse 6.2: Tilpasset skabelonudvikling**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Enterprise-implementering**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selv-vurderingsspørgsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbejdsgange?
2. Hvad er nøgleovervejelser ved tilpasset skabelonudvikling?
3. Hvordan implementerer du governance og compliance i azd-udrulninger?
4. Hvad er bedste praksis for enterprise-skala udrulninger?
5. Hvordan bidrager du effektivt til azd-fællesskabet?

## Praktiske projekter

### Projekt 1: Personlig porteføljewebsted
**Kompleksitet**: Begynder  
**Varighed**: 1-2 uger

Byg og udrul et personligt porteføljewebsted ved brug af:
- Statisk webhosting på Azure Storage
- Tilpasning af domæne
- CDN-integration for global ydelse
- Automatiseret udrulningspipeline

**Leverancer**:
- Fungerende websted udrullet på Azure
- Tilpasset azd-skabelon til porteføljeudrulninger
- Dokumentation af udrulningsproces
- Omkostningsanalyse og optimeringsanbefalinger

### Projekt 2: Opgavestyringsapplikation
**Kompleksitet**: Mellemtrin  
**Varighed**: 2-3 uger

Skab en full-stack opgavestyringsapplikation med:
- React frontend udrullet til App Service
- Node.js API-backend med autentificering
- PostgreSQL database med migrationer
- Application Insights overvågning

**Leverancer**:
- Komplett applikation med brugergodkendelse
- Databaseskema og migrationsscripts
- Overvågningsdashboard og alarmeringsregler
- Multi-miljø udrulningskonfiguration

### Projekt 3: Microservices e-handelsplatform
**Kompleksitet**: Avanceret  
**Varighed**: 4-6 uger

Design og implementer en microservices-baseret e-handelsplatform:
- Flere API-tjenester (katalog, ordrer, betalinger, brugere)
- Meddelelseskøintegration med Service Bus
- Redis-cache for ydelsesoptimering
- Omfattende logging og overvågning

**Referenceeksempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) for en to-tjeneste læringseksempel og udrulningsguide. Køer, persistence, autentificering, betalingsbehandling og produktionsstyrkelse er separat projektarbejde.

**Leverancer**:
- Komplett microservices arkitektur
- Kommunikationsmønstre mellem tjenester
- Ydelsestest og optimering
- Produktionsklar sikkerhedsimplementering

## Vurdering og certificering

### Vidensprøver

Gennemfør disse vurderinger efter hvert modul:

**Modul 1 Vurdering**: Grundlæggende koncepter og installation
- Multiple choice spørgsmål om kernekoncepter
- Praktiske installations- og konfigurationsopgaver
- Simpel udrulningsøvelse

**Modul 2 Vurdering**: Konfiguration og miljøer
- Miljøstyringsscenarier
- Fejlfinding af konfiguration
- Implementering af sikkerhedskonfiguration

**Modul 3 Vurdering**: Udrulning og provisioning
- Infrastrukturdesignudfordringer
- Multi-service udrulningsscenarier
- Ydelsesoptimeringsøvelser

**Modul 4 Vurdering**: Præ-udrulningsvalidering
- Kapacitetsplanlægnings-case studier
- Omkostningsoptimeringsscenarier
- Implementering af valideringspipeline

**Modul 5 Vurdering**: Fejlfinding og debugging
- Problemdiagnoseøvelser
- Overvågningsimplementeringsopgaver
- Hændelsesrespons simulationer

**Modul 6 Vurdering**: Avancerede emner
- Design af CI/CD-pipeline
- Udvikling af tilpassede skabeloner
- Enterprise-arkitektur scenarier

### Endeligt hovedprojekt

Design og implementer en komplet løsning, der demonstrerer mestring af alle koncepter:

**Krav**:
- Multi-tier applikationsarkitektur
- Flere udrulningsmiljøer
- Omfattende overvågning og alarmering
- Implementering af sikkerhed og compliance
- Omkostningsoptimering og ydelsestuning
- Fuld dokumentation og runbooks

**Evalueringskriterier**:
- Kvalitet af teknisk implementering
- Dokumentationskomplethed
- Overholdelse af sikkerhed og bedste praksis
- Ydelse og omkostningsoptimering
- Effektivitet i fejlfinding og overvågning

## Studie materialer og referencer

### Officiel dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
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

## Studieplan anbefalinger

### Fuldtidsstudie (8 uger)
- **Uger 1-2**: Moduler 1-2 (Kom godt i gang, Konfiguration)
- **Uger 3-4**: Moduler 3-4 (Udrulning, Præ-udrulning)
- **Uger 5-6**: Moduler 5-6 (Fejlfinding, Avancerede emner)
- **Uger 7-8**: Praktiske projekter og afsluttende vurdering

### Deltidsstudie (16 uger)
- **Uger 1-4**: Modul 1 (Kom godt i gang)
- **Uger 5-7**: Modul 2 (Konfiguration og miljøer)
- **Uger 8-10**: Modul 3 (Udrulning og provisioning)
- **Uger 11-12**: Modul 4 (Præ-udrulningsvalidering)
- **Uger 13-14**: Modul 5 (Fejlfinding og debugging)
- **Uger 15-16**: Modul 6 (Avancerede emner og vurdering)

---

## Fremdriftssporing og vurderingsramme

### Tjekliste for kapitelfuldførelse

Spor din fremdrift gennem hvert kapitel med disse målbare resultater:

#### 📚 Kapitel 1: Fundament & Hurtig start
- [ ] **Installation udført**: AZD installeret og bekræftet på din platform
- [ ] **Første udrulning**: Succesfuldt udrullet todo-nodejs-mongo skabelon
- [ ] **Miljøopsætning**: Konfigurerede første miljøvariabler
- [ ] **Ressourcenavigation**: Udforskede udrullede ressourcer i Azure Portal
- [ ] **Kommando-mestri**: Fortrolig med grundlæggende AZD-kommandoer

#### 🤖 Kapitel 2: AI-Første udvikling  
- [ ] **AI-skabelonudrulning**: Succesfuldt udrullet azure-search-openai-demo
- [ ] **RAG-implementering**: Konfigurerede dokumentindeksering og -retrieval
- [ ] **Modelkonfiguration**: Opsat flere AI-modeller med forskellige formål
- [ ] **AI-overvågning**: Implementerede Application Insights til AI-arbejdsbelastninger
- [ ] **Ydelsesoptimering**: Tunet AI-applikationsydelse

#### ⚙️ Kapitel 3: Konfiguration & Autentificering
- [ ] **Multi-miljøopsætning**: Konfigurerede dev-, staging- og prod-miljøer
- [ ] **Sikkerhedsimplementering**: Opsatte managed identity autentificering
- [ ] **Secrets Management**: Integrerede Azure Key Vault til følsomme data
- [ ] **Parameterstyring**: Oprettede miljøspecifikke konfigurationer
- [ ] **Autentificeringsmestring**: Implementerede sikre adgangsmønstre

#### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
- [ ] **Tilpasset skabelonskabning**: Byggede en multi-service applikationsskabelon
- [ ] **Bicep-mestring**: Oprettede modulære, genanvendelige infrastrukturkomponenter
- [ ] **Udrulningsautomatisering**: Implementerede pre/post udrulningshooks
- [ ] **Arkitekturdesign**: Udrullede kompleks microservices arkitektur
- [ ] **Skabelonoptimering**: Optimerede skabeloner for ydelse og omkostning

#### 🎯 Kapitel 5: Multi-Agent AI-løsninger
- [ ] **Retail arkitekturgennemgang**: Identificerede manglende applikationskomponenter og planlagde deres implementering og validering
- [ ] **Agenttilpasning**: Ændrede Customer og Inventory agentadfærd
- [ ] **Arkitektur skalering**: Implementerede load balancing og autoskalering
- [ ] **Produktionsovervågning**: Opsatte omfattende overvågning og alarmering
- [ ] **Ydelsestuning**: Optimerede multi-agent systemets ydelse

#### 🔍 Kapitel 6: Præ-udrulningsvalidering & Planlægning
- [ ] **Kapacitetsanalyse**: Analyserede ressourcekrav for applikationer
- [ ] **SKU-optimering**: Valgte omkostningseffektive servicelag
- [ ] **Valideringsautomatisering**: Implementerede pre-udrulnings tjek-scripts
- [ ] **Omkostningsplanlægning**: Oprettede omkostningsestimater og budgetter for udrulning
- [ ] **Risikoevaluering**: Identificerede og afbødte udrulningsrisici

#### 🚨 Kapitel 7: Fejlfinding & Debugging
- [ ] **Diagnostiske færdigheder**: Succesfuldt debugget bevidst fejlslagne udrulninger
- [ ] **Loganalyse**: Brugte Azure Monitor og Application Insights effektivt
- [ ] **Ydelsestuning**: Optimerede langsomt kørende applikationer
- [ ] **Genopretningsprocedurer**: Implementerede backup og katastrofegenopretning
- [ ] **Overvågningsopsætning**: Oprettede proaktiv overvågning og alarmering

#### 🏢 Kapitel 8: Produktions- & Enterprise-mønstre
- [ ] **Enterprise sikkerhed**: Implementerede omfattende sikkerhedsmønstre
- [ ] **Governance-ramme**: Opsatte Azure Policy og ressourceadministration
- [ ] **Avanceret overvågning**: Oprettede dashboards og automatiseret alarmering
- [ ] **CI/CD-integration**: Byggede automatiserede udrulningspipelines
- [ ] **Compliance-implementering**: Opfyldte enterprise compliance-krav

### Læringsplan og milepæle

#### Uge 1-2: Fundamentopbygning
- **Milepæl**: Udrul første AI-applikation vha. AZD
- **Validering**: Fungerende applikation tilgængelig via offentlig URL
- **Færdigheder**: Grundlæggende AZD-arbejdsgange og AI-serviceintegration

#### Uge 3-4: Konfigurationsmestring
- **Milepæl**: Multi-miljø udrulning med sikker autentificering
- **Validering**: Samme applikation udrullet til dev/staging/prod
- **Færdigheder**: Miljøstyring og sikkerhedsimplementering

#### Uge 5-6: Infrastruktur-ekspertise
- **Milepæl**: Tilpasset skabelon til kompleks multi-service applikation
- **Validering**: Genanvendelig skabelon udrullet af anden teammedlem
- **Færdigheder**: Bicep-mestring og infrastrukturautomatisering

#### Uge 7-8: Avanceret AI-implementering
- **Milepæl**: Produktionsklar multi-agent AI-løsning
- **Validering**: System håndterer reelt belastning med overvågning
- **Færdigheder**: Multi-agent orkestrering og ydelsesoptimering

#### Uge 9-10: Produktionsparathed
- **Milepæl**: Enterprise-grade udrulning med fuld compliance
- **Validering**: Består sikkerhedsgennemgang og omkostningsoptimeringsrevision
- **Færdigheder**: Governance, overvågning og CI/CD-integration

### Vurdering og certificering

#### Vidensvalideringsmetoder
1. **Praktiske udrulninger**: Fungerende applikationer for hvert kapitel
2. **Kodegennemgange**: Vurdering af skabelon- og konfigurationskvalitet
3. **Problemløsning**: Fejlfinding-scenarier og løsninger
4. **Peer Teaching**: Forklar koncepter for andre lærende
5. **Fællesskabsbidrag**: Del skabeloner eller forbedringer

#### Professionelle udviklingsresultater
- **Porteføljeprojekter**: Læringsudarbejdninger og arkitekturopgaver; produktionsparathed kræver separat implementering og gennemgang
- **Tekniske færdigheder**: Industri-standard AZD og AI udrulningsekspertise
- **Problemløsningsevner**: Selvstændig fejlfinding og optimering
- **Fællesskabsanerkendelse**: Aktiv deltagelse i Azure udviklerfællesskabet
- **Karrierefremgang**: Færdigheder direkte anvendelige til cloud- og AI-roller

#### Succesmålinger
- **Implementeringssuccesrate**: >95% succesfulde implementeringer
- **Fejlfindingstid**: <30 minutter for almindelige problemer
- **Ydelsesoptimering**: Påviselige forbedringer i omkostninger og ydelse
- **Sikkerhedsgennemgang**: Dokumentér kontrolforanstaltninger og resterende huller i forhold til din organisations krav; gennemførelse af kurset garanterer ikke overholdelse
- **Vidensoverførsel**: Evne til at vejlede andre udviklere

### Kontinuerlig læring og fællesskabsengagement

#### Hold dig opdateret
- **Azure-opdateringer**: Følg udgivelsesnoterne for Azure Developer CLI
- **Fællesskabsbegivenheder**: Deltag i Azure- og AI-udviklerbegivenheder
- **Dokumentation**: Bidrag til fællesskabets dokumentation og eksempler
- **Feedback-loop**: Giv feedback på kursusindhold og Azure-tjenester

#### Karriereudvikling
- **Professionelt netværk**: Forbind med Azure- og AI-eksperter
- **Taler-muligheder**: Præsenter læring på konferencer eller meetups
- **Bidrag til open source**: Bidrag til AZD-skabeloner og værktøjer
- **Mentorskab**: Vejled andre udviklere i deres AZD-læringsrejse

---

**Kapitelnavigation:**
- **📚 Kursusstart**: [AZD For Begyndere](../README.md)
- **📖 Begynd at lære**: [Kapitel 1: Basis & Hurtigstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremgangsovervågning**: Følg din progression gennem det omfattende 8-kapitlers læringssystem
- **🤝 Fællesskab**: [Azure Discord](https://discord.gg/microsoft-azure) for support og diskussion

**Studieprogressionsovervågning**: Brug denne strukturerede guide til at mestre Azure Developer CLI gennem progressiv, praktisk læring med målbare resultater og fordele for professionel udvikling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->