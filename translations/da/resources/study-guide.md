# Studievejledning - Omfattende læringsmål

**Navigering i læringsforløb**
- **📚 Kursusforside**: [AZD For Beginners](../README.md)
- **📖 Start læring**: [Kapitel 1: Grundlag & Hurtig start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremskridtssporing**: [Kursusfuldførelse](../README.md#-course-completion--certification)

## Introduktion

Denne omfattende studievejledning giver strukturerede læringsmål, nøglebegreber, praktiske øvelser og vurderingsmaterialer for at hjælpe dig med at mestre Azure Developer CLI (azd). Brug denne vejledning til at følge dit fremskridt og sikre, at du har dækket alle væsentlige emner.

## Læringsmål

Ved at gennemføre denne studievejledning vil du:
- Mestre alle grundlæggende og avancerede koncepter om Azure Developer CLI
- Udvikle praktiske færdigheder i at implementere og administrere Azure-applikationer
- Opbygge tillid til fejlfinding og optimering af implementeringer
- Forstå produktionsklare implementeringsmetoder og sikkerhedsovervejelser

## Læringsresultater

Efter at have gennemført alle afsnit i denne studievejledning vil du kunne:
- Designe, implementere og administrere komplette applikationsarkitekturer ved hjælp af azd
- Implementere omfattende overvågnings-, sikkerheds- og omkostningsoptimeringsstrategier
- Selvstændigt fejlsøge komplekse implementeringsproblemer
- Oprette brugerdefinerede skabeloner og bidrage til azd-fællesskabet

## 8-kapitel læringsstruktur

### Kapitel 1: Grundlag & Hurtig start (Uge 1)
**Varighed**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå kernekoncepterne og terminologien i Azure Developer CLI
- Installere og konfigurere AZD succesfuldt på din udviklingsplatform
- Implementere din første applikation ved brug af en eksisterende skabelon
- Navigere effektivt i AZD's kommandolinjegrænseflade

#### Nøglebegreber at mestre
- AZD projektstruktur og komponenter (azure.yaml, infra/, src/)
- Skabelonbaserede implementeringsarbejdsgange
- Grundlæggende miljøkonfiguration
- Ressourcegruppe- og abonnementshåndtering

#### Praktiske øvelser
1. **Installationsverifikation**: Installer AZD og verificer med `azd version`
2. **Første implementering**: Implementer todo-nodejs-mongo-skabelonen succesfuldt
3. **Miljøopsætning**: Konfigurer dine første miljøvariabler
4. **Ressourceundersøgelse**: Naviger i implementerede ressourcer i Azure-portalen

#### Vurderingsspørgsmål
- Hvad er kernekomponenterne i et AZD-projekt?
- Hvordan initialiserer du et nyt projekt ud fra en skabelon?
- Hvad er forskellen mellem `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapitel 2: AI-første udvikling (Uge 2)
**Varighed**: 4-5 timer inkl. workshop | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbejdsgange
- Brug GA `microsoft.foundry`-pakken med AZD 1.37.0+ for udvikling med hostet agent
- Implementere og konfigurere AI-drevne applikationer
- Forstå implementeringsmønstre for RAG (Retrieval-Augmented Generation)
- Administrere AI-modelimplementeringer og skaleringsstrategier

#### Nøglebegreber at mestre
- Microsoft Foundry Models service integration og API-administration
- AI Search-konfiguration og vektorindeksering
- Strategier for modelimplementering og kapacitetsplanlægning
- AI-applikationsovervågning og performanceoptimering
- Lokal Agent Inspector versus cloud logs, kildekodeimplementering og evalueringsressourcer i versionkontrol

#### Praktiske øvelser
1. **AI Chat Implementering**: Implementer azure-search-openai-demo-skabelonen
2. **RAG-implementering**: Konfigurer dokumentindeksering og hentning
3. **Modelkonfiguration**: Opsæt flere AI-modeller med forskellige formål
4. **AI-overvågning**: Implementer Application Insights til AI-arbejdsbelastninger
5. **GA Hosted Agent**: Følg [hosted-agent gennemgangen](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); sammenlign lokale og cloud-svar, gennemgå et evalueringsresultat, og verificer oprydningsejerskab

#### Vurderingsspørgsmål
- Hvordan konfigurerer du Microsoft Foundry Models-tjenester i en AZD-skabelon?
- Hvad er nøglekomponenterne i en RAG-arkitektur?
- Hvordan administrerer du AI-modelkapacitet og skalering?
- Hvilke overvågningsmålinger er vigtige for AI-applikationer?
- Hvilke udvidelser indgår i `microsoft.foundry`, og hvorfor installeres evalueringer separat?
- Hvorfor medfører lokale agenttests stadig omkostninger for Azure-modeller?
- Hvad efterlader `azd down`, når du genbruger et eksisterende Foundry-projekt?

---

### Kapitel 3: Konfiguration & Godkendelse (Uge 3)
**Varighed**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre miljøkonfigurations- og administrationsstrategier
- Implementere sikre godkendelsesmønstre og managed identity
- Organisere ressourcer med passende navngivningskonventioner
- Konfigurere multi-miljøimplementeringer (dev, staging, prod)

#### Nøglebegreber at mestre
- Miljøhierarki og konfigurationsprioritet
- Managed identity og service principal godkendelse
- Key Vault-integration til hemmelighedshåndtering
- Miljøspecifik parametrehåndtering

#### Praktiske øvelser
1. **Multi-miljøopsætning**: Konfigurer dev-, staging- og prod-miljøer
2. **Sikkerhedskonfiguration**: Implementer managed identity-godkendelse
3. **Hemmelighedshåndtering**: Integrer Azure Key Vault for følsomme data
4. **Parameterhåndtering**: Opret miljøspecifikke konfigurationer

#### Vurderingsspørgsmål
- Hvordan konfigurerer du forskellige miljøer med AZD?
- Hvad er fordelene ved at bruge managed identity fremfor service principals?
- Hvordan håndterer du sikkert applikationshemmeligheder?
- Hvad er konfigurationshierarkiet i AZD?

---

### Kapitel 4: Infrastruktur som kode & implementering (Uge 4-5)
**Varighed**: 1-1,5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Oprette og tilpasse Bicep infrastrukturskabeloner
- Implementere avancerede implementeringsmønstre og workflows
- Forstå ressourcetildelingsstrategier
- Designe skalerbare multi-service arkitekturer

- Implementere containeriserede applikationer ved hjælp af Azure Container Apps og AZD


#### Nøglebegreber at mestre
- Bicep skabelonstruktur og bedste praksis
- Ressourceafhængigheder og implementeringsrækkefølge
- Parameterfiler og skabelonmodularitet
- Brugerdefinerede hooks og implementeringsautomatisering
- Container app-implementeringsmønstre (hurtig start, produktion, mikrotjenester)

#### Praktiske øvelser
1. **Brugerdefineret skabelonoprettelse**: Byg en multi-service applikationsskabelon
2. **Bicep-mesterskab**: Opret modulære, genanvendelige infrastrukturelementer
3. **Implementeringsautomatisering**: Implementer pre/post implementeringshooks
4. **Arkitekturdesign**: Implementer kompleks mikrotjenestearkitektur
5. **Container App-implementering**: Implementer eksemplerne [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) med AZD

#### Vurderingsspørgsmål
- Hvordan opretter du brugerdefinerede Bicep-skabeloner til AZD?
- Hvad er bedste praksis for organisering af infrastrukturskode?
- Hvordan håndterer du ressourcers afhængigheder i skabeloner?
- Hvilke implementeringsmønstre understøtter opdateringer uden nedetid?

---

### Kapitel 5: Multi-agent AI-løsninger (Uge 6-7)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agentkoordinering og kommunikation
- Implementere produktionsklare AI-løsninger med overvågning
- Forstå agentspecialisering og workflow-mønstre
- Integrere containeriserede mikrotjenester som del af multi-agent løsninger

#### Nøglebegreber at mestre
- Multi-agent arkitektur mønstre og designprincipper
- Agentkommunikationsprotokoller og datatrafik
- Load balancing og skaleringsstrategier for AI-agenter
- Produktionsovervågning for multi-agent systemer
- Service-til-service kommunikation i containeriserede miljøer

#### Praktiske øvelser
1. **Detailarkitekturgennemgang**: Analyser retail blueprint og identificér hvilke applikationskomponenter der skal implementeres før deployment
2. **Agenttilpasning**: Ændr Customer- og Inventory-agenters adfærd
3. **Arkitekturskalering**: Implementer load balancing og autoskalering
4. **Produktionsovervågning**: Opsæt omfattende overvågning og alarmfunktioner
5. **Mikrotjenesteintegration**: Udvid [Microservices Architecture](../../../examples/container-app/microservices) eksemplet til at understøtte agentbaserede workflows

#### Vurderingsspørgsmål
- Hvordan designer du effektive multi-agent kommunikationsmønstre?
- Hvad er nøgleovervejelser for skalering af AI-agent arbejdsbelastninger?
- Hvordan overvåger og fejlsøger du multi-agent AI-systemer?
- Hvilke produktionsmønstre sikrer pålidelighed for AI-agenter?

---

### Kapitel 6: Validering & Planlægning før implementering (Uge 8)
**Varighed**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udfør omfattende kapacitetsplanlægning og ressourcevalidering
- Vælg optimale Azure SKU'er for omkostningseffektivitet
- Implementer automatiske pre-flight checks og validering
- Planlæg implementeringer med omkostningsoptimeringsstrategier

#### Nøglebegreber at mestre
- Azure ressourcekvoter og kapacitetsbegrænsninger
- SKU-udvælgelseskriterier og omkostningsoptimering
- Automatiserede valideringsscripts og testning
- Implementeringsplanlægning og risikovurdering

#### Praktiske øvelser
1. **Kapacitetsanalyse**: Analyser ressourcekrav til dine applikationer
2. **SKU-optimering**: Sammenlign og vælg omkostningseffektive servicelag
3. **Valideringsautomatisering**: Implementer pre-deployment tjekscripts
4. **Omkostningsplanlægning**: Opret estimater og budgetter for implementeringsomkostninger

#### Vurderingsspørgsmål
- Hvordan validerer du Azure-kapacitet før implementering?
- Hvilke faktorer påvirker SKU-udvælgelsesbeslutninger?
- Hvordan automatiserer du pre-deployment validering?
- Hvilke strategier hjælper med at optimere implementeringsomkostninger?

---

### Kapitel 7: Fejlfinding & Debugging (Uge 9)
**Varighed**: 1-1,5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udvikle systematiske debuggingmetoder til AZD-implementeringer
- Løse almindelige implementerings- og konfigurationsproblemer
- Debugge AI-specifikke problemer og performanceudfordringer
- Implementere overvågning og alarmering for proaktiv fejldetektion

#### Nøglebegreber at mestre
- Diagnostiske teknikker og logningsstrategier
- Almindelige fejlpatterns og deres løsninger
- Performanceovervågning og optimering
- Beredskabs- og genopretningsprocedurer

#### Praktiske øvelser
1. **Diagnostiske færdigheder**: Øv dig på bevidst fejlbehæftede implementeringer
2. **Loganalyse**: Brug Azure Monitor og Application Insights effektivt
3. **Performanceoptimering**: Optimer langsomt kørende applikationer
4. **Genopretningsprocedurer**: Implementer backup og katastrofegenoprettelse

#### Vurderingsspørgsmål
- Hvad er de mest almindelige AZD-implementeringsfejl?
- Hvordan debugger du godkendelses- og tilladelsesproblemer?
- Hvilke overvågningsstrategier hjælper med at forhindre produktionsproblemer?
- Hvordan optimerer du applikationsperformance i Azure?

---

### Kapitel 8: Produktions- & Enterprise-mønstre (Uge 10-11)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere enterprise-grade implementeringsstrategier
- Designe sikkerhedsmønstre og compliance-rammer
- Etablere overvågning, governance og omkostningsstyring
- Oprette skalerbare CI/CD pipelines med AZD-integration
- Anvende bedste praksis for produktionscontainerapp-implementeringer (sikkerhed, overvågning, omkostninger, CI/CD)

#### Nøglebegreber at mestre
- Enterprise sikkerheds- og compliancekrav
- Governance-rammer og implementering af politikker
- Avanceret overvågning og omkostningsstyring
- CI/CD-integration og automatiserede implementeringspipelines
- Blue-green og canary deployment-strategier for containeriserede arbejdsbelastninger

#### Praktiske øvelser
1. **Enterprise-sikkerhed**: Implementer omfattende sikkerhedsmønstre
2. **Governance-rammeværk**: Opsæt Azure Policy og ressourceadministration
3. **Avanceret overvågning**: Opret dashboards og automatiseret alarmering
4. **CI/CD-integration**: Byg automatiserede implementeringspipelines
5. **Produktionscontainerapps**: Anvend sikkerhed, overvågning og omkostningsoptimering på [Microservices Architecture](../../../examples/container-app/microservices) eksemplet

#### Vurderingsspørgsmål
- Hvordan implementerer du enterprise-sikkerhed i AZD-implementeringer?
- Hvilke governance-mønstre sikrer compliance og omkostningskontrol?
- Hvordan designer du skalerbar overvågning for produktionssystemer?
- Hvilke CI/CD-mønstre fungerer bedst med AZD-arbejdsgange?

#### Læringsmål
- Forstå Azure Developer CLI grundlæggende og kernekoncepter
- Installere og konfigurere azd på dit udviklingsmiljø med succes
- Gennemføre din første implementering med en eksisterende skabelon
- Navigere i azd-projektstrukturen og forstå nøglekomponenter

#### Nøglebegreber at mestre
- Skabeloner, miljøer og tjenester
- azure.yaml konfigurationsstruktur
- Grundlæggende azd-kommandoer (init, up, down, deploy)
- Principper for Infrastruktur som kode
- Azure-godkendelse og -autorisation

#### Praktiske øvelser

**Øvelse 1.1: Installation og opsætning**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første implementering**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
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

#### Selv-vurderingsspørgsmål
1. Hvad er de tre kernekoncepter i azd-arkitekturen?
2. Hvad er formålet med azure.yaml-filen?
3. Hvordan hjælper miljøer med at administrere forskellige implementeringsmål?
4. Hvilke godkendelsesmetoder kan bruges med azd?
5. Hvad sker der, når du kører `azd up` første gang?

---

## Fremskridtssporing og vurderingsramme
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
1. Hvordan håndterer azd prioritering af miljøvariabler?
2. Hvad er implementeringshooks, og hvornår bør du bruge dem?
3. Hvordan konfigurerer du forskellige SKU'er til forskellige miljøer?
4. Hvad er sikkerhedsmæssige konsekvenser af forskellige godkendelsesmetoder?
5. Hvordan håndterer du hemmeligheder og følsomme konfigurationsdata?

### Modul 3: Implementering og tildeling (Uge 4)

#### Læringsmål
- Mestre implementeringsarbejdsgange og bedste praksis
- Forstå infrastruktur som kode med Bicep-skabeloner
- Implementere komplekse multi-service arkitekturer
- Optimere implementeringsperformance og pålidelighed

#### Nøglebegreber at mestre
- Bicep skabelonstruktur og moduler
- Ressourceafhængigheder og rækkefølge
- Implementeringsstrategier (blue-green, rolling updates)
- Multi-region implementeringer
- Database-migrationer og datastyring

#### Praktiske øvelser

**Øvelse 3.1: Tilpasset Infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Multi-Service Applikation**
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
1. Hvad er fordelene ved at bruge Bicep fremfor ARM-skabeloner?
2. Hvordan håndterer du database-migrationer i azd-udrulninger?
3. Hvilke strategier findes der for udrulninger uden nedetid?
4. Hvordan styrer du afhængigheder mellem tjenester?
5. Hvad er overvejelserne ved udrulninger på tværs af flere regioner?

### Modul 4: Forudgående Validering (Uge 5)

#### Læringsmål
- Implementere omfattende forudgående tjek før udrulning
- Mestre kapacitetsplanlægning og ressourcetjek
- Forstå valg af SKU og omkostningsoptimering
- Bygge automatiserede validerings-pipelines

#### Centrale Begreber at Mestre
- Azure resource kvoter og begrænsninger
- Kriterier for valg af SKU og omkostningskonsekvenser
- Automatiserede valideringsscripts og værktøjer
- Metoder til kapacitetsplanlægning
- Performance-test og optimering

#### Øvelsesopgaver

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

**Øvelse 4.3: SKU Optimering**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selv-vurderingsspørgsmål
1. Hvilke faktorer bør påvirke beslutninger ved valg af SKU?
2. Hvordan validerer du Azure-ressourcers tilgængelighed før udrulning?
3. Hvad er de centrale komponenter i et pre-flight tjek system?
4. Hvordan estimerer og kontrollerer du udrulningsomkostninger?
5. Hvilken overvågning er essentiel for kapacitetsplanlægning?

### Modul 5: Fejlfinding og Debugging (Uge 6)

#### Læringsmål
- Mestre systematiske metoder til fejlfinding
- Udvikle ekspertise i debugging af komplekse udrulningsproblemer
- Implementere omfattende overvågning og alarmering
- Bygge procedurer for hændelsesrespons og genopretning

#### Centrale Begreber at Mestre
- Almindelige fejludrulningsmønstre
- Loganalyse og korrelationsmetoder
- Performance-overvågning og optimering
- Sikkerhedshændelsesdetektion og respons
- Katastrofegenopretning og forretningskontinuitet

#### Øvelsesopgaver

**Øvelse 5.1: Fejlfinding Scenarier**
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
4. Hvordan implementerer du effektive katastrofe-gendannelsesprocedurer?
5. Hvad er nøglekomponenterne i en hændelsesresponsplan?

### Modul 6: Avancerede Emner og Bedste Praksis (Uge 7-8)

#### Læringsmål
- Implementere enterprise-grade udrulningsmønstre
- Mestre CI/CD-integration og automatisering
- Udvikle tilpassede skabeloner og bidrage til community
- Forstå avancerede sikkerheds- og compliance krav

#### Centrale Begreber at Mestre
- CI/CD pipeline integrationsmønstre
- Tilpasset skabelonudvikling og distribution
- Enterprise governance og compliance
- Avancerede netværks- og sikkerhedskonfigurationer
- Performanceoptimering og omkostningsstyring

#### Øvelsesopgaver

**Øvelse 6.1: CI/CD Integration**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Øvelse 6.2: Tilpasset Skabelonudvikling**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Enterprise Implementering**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selv-vurderingsspørgsmål
1. Hvordan integrerer du azd i eksisterende CI/CD workflows?
2. Hvad er nøgleovervejelser ved udvikling af tilpassede skabeloner?
3. Hvordan implementerer du governance og compliance i azd-udrulninger?
4. Hvad er bedste praksis for enterprise-skala udrulninger?
5. Hvordan bidrager du effektivt til azd-community?

## Praktiske Projekter

### Projekt 1: Personlig Portfolio Hjemmeside
**Kompleksitet**: Begynder  
**Varighed**: 1-2 uger

Byg og udrul en personlig portfolio hjemmeside med:
- Statisk hjemmeside-hosting på Azure Storage
- Tilpasning af domænekonfiguration
- CDN-integration for global ydeevne
- Automatiseret udrulningspipeline

**Leverancer**:
- Fungerende hjemmeside udrullet på Azure
- Tilpasset azd-skabelon til portfolio-udrulninger
- Dokumentation af udrulningsprocessen
- Omkostningsanalyse og optimeringsanbefalinger

### Projekt 2: Opgavestyringsapplikation
**Kompleksitet**: Mellem  
**Varighed**: 2-3 uger

Opret en full-stack opgavestyringsapplikation med:
- React frontend udrullet på App Service
- Node.js API backend med autentifikation
- PostgreSQL database med migrationer
- Application Insights overvågning

**Leverancer**:
- Fuldt færdig applikation med brugerautentifikation
- Databaseskema og migrationsscripts
- Overvågningsdashboard og alarmregler
- Konfiguration til multi-miljø udrulning

### Projekt 3: Microservices E-handelsplatform
**Kompleksitet**: Avanceret  
**Varighed**: 4-6 uger

Design og implementer en microservices-baseret e-handelsplatform:
- Flere API-tjenester (katalog, ordrer, betalinger, brugere)
- Message queue integration med Service Bus
- Redis cache for ydeevneoptimering
- Omfattende logning og overvågning

**Referenceeksempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) for et læringseksempel med to tjenester og udrulningsvejledning. Køer, persistens, autentifikation, betalingsbehandling og produktionstilpasning er separate projektarbejder.

**Leverancer**:
- Fuldstændig microservices arkitektur
- Kommunikationsmønstre mellem tjenester
- Performance test og optimering
- Produktionsklar sikkerhedsimplementering

## Vurdering og Certificering

### Videnstjek

Gennemfør disse vurderinger efter hvert modul:

**Modul 1 Vurdering**: Grundlæggende koncepter og installation
- Multiple choice spørgsmål om kernekoncepter
- Praktiske installations- og konfigurationsopgaver
- Simpel udrulningsøvelse

**Modul 2 Vurdering**: Konfiguration og miljøer
- Scenarier for miljøstyring
- Fejlsøgningsøvelser for konfiguration
- Implementering af sikkerhedskonfiguration

**Modul 3 Vurdering**: Udrulning og provisionering
- Udfordringer i infrastrukturdesign
- Scenarier for multi-service udrulning
- Performanceoptimeringsøvelser

**Modul 4 Vurdering**: Forudgående validering
- Case-studier for kapacitetsplanlægning
- Scenarier for omkostningsoptimering
- Implementering af valideringspipelines

**Modul 5 Vurdering**: Fejlfinding og debugging
- Problemdiagnoseøvelser
- Overvågningsimplementeringsopgaver
- Simulationer af hændelsesrespons

**Modul 6 Vurdering**: Avancerede emner
- Design af CI/CD pipelines
- Udvikling af tilpassede skabeloner
- Scenarier for enterprise arkitektur

### Finale Capstone Projekt

Design og implementer en komplet løsning, der demonstrerer mestring af alle koncepter:

**Krav**:
- Multi-tier applikationsarkitektur
- Flere udrulningsmiljøer
- Omfattende overvågning og alarmering
- Implementering af sikkerhed og compliance
- Omkostningsoptimering og performance tuning
- Kompletdokumentation og driftsvejledninger

**Evalueringskriterier**:
- Teknisk implementeringskvalitet
- Dokumentationsfuldstændighed
- Overholdelse af sikkerhed og bedste praksis
- Performance- og omkostningsoptimering
- Fejlfinding og overvågnings effektivitet

## Studie Ressourcer og Referencer

### Officiel Dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Ressourcer
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organisation](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Øvelsesmiljøer
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Yderligere Værktøjer
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Studieplan Anbefalinger

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
- **Uger 13-14**: Modul 5 (Fejlfinding og debugging)
- **Uger 15-16**: Modul 6 (Avancerede emner og vurdering)

---

## Fremdriftssporing og Vurderingsramme

### Tjekliste for Kapitelgennemførelse

Følg din fremgang gennem hvert kapitel med disse målbare resultater:

#### 📚 Kapitel 1: Grundlag & Hurtigstart
- [ ] **Installation Fuldført**: AZD installeret og verificeret på din platform
- [ ] **Første Udrulning**: Skabelonen todo-nodejs-mongo udrullet med succes
- [ ] **Miljøopsætning**: Konfigurerede de første miljøvariabler
- [ ] **Ressourcenavigation**: Udforskede udrullede ressourcer i Azure Portal
- [ ] **Kommandomestre**: Behersker grundlæggende AZD kommandoer

#### 🤖 Kapitel 2: AI-første Udvikling  
- [ ] **AI Skabelon Udrulning**: azure-search-openai-demo udrullet med succes
- [ ] **RAG Implementering**: Konfigurerede dokumentindeksering og hentning
- [ ] **Modelkonfiguration**: Opsatte flere AI-modeller med forskellige formål
- [ ] **AI Overvågning**: Implementerede Application Insights til AI-arbejdsbelastninger
- [ ] **Performanceoptimering**: Optimerede AI-applikationens ydeevne

#### ⚙️ Kapitel 3: Konfiguration & Autentifikation
- [ ] **Multi-miljøopsætning**: Konfigurerede dev, staging og prod miljøer
- [ ] **Sikkerhedsimplementering**: Opsatte managed identity autentifikation
- [ ] **Secrets Management**: Integrerede Azure Key Vault til følsomme data
- [ ] **Parameterstyring**: Oprettede miljøspecifikke konfigurationer
- [ ] **Autentifikationsbeherskelse**: Implementerede sikre adgangsmønstre

#### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
- [ ] **Tilpasset Skabelonskabelse**: Byggede en multi-service applikationsskabelon
- [ ] **Bicep Beherskelse**: Skabte modulære, genanvendelige infrastrukturkomponenter
- [ ] **Automatiseret Udrulning**: Implementerede pre/post udrulningshooks
- [ ] **Arkitekturdesign**: Udrullede kompleks microservices arkitektur
- [ ] **Skabelonsoptimering**: Optimerede skabeloner for ydeevne og omkostninger

#### 🎯 Kapitel 5: Multi-Agent AI Løsninger
- [ ] **Retail Arkitektur Gennemgang**: Identificerede manglende applikationskomponenter og planlagde deres implementering og validering
- [ ] **Agenttilpasning**: Ændrede Customer og Inventory agentopførsler
- [ ] **Arkitekturskalering**: Implementerede load balancing og autoskalering
- [ ] **Produktionsovervågning**: Opsatte omfattende overvågning og alarmering
- [ ] **Performance Tuning**: Optimerede multi-agent systemets ydeevne

#### 🔍 Kapitel 6: Forudgående Validering & Planlægning
- [ ] **Kapacitetsanalyse**: Analyserede ressourcebehov for applikationer
- [ ] **SKU Optimering**: Valgte omkostningseffektive servicelag
- [ ] **Valideringsautomatisering**: Implementerede pre-udrulnings tjekscripts
- [ ] **Omkostningsplanlægning**: Lavede estimater og budgetter for udrulningsomkostninger
- [ ] **Risikovurdering**: Identificerede og afbødede udrulningsrisici

#### 🚨 Kapitel 7: Fejlfinding & Debugging
- [ ] **Diagnostiske færdigheder**: Debuggede bevidst fejlbehæftede udrulninger
- [ ] **Loganalyse**: Brugte Azure Monitor og Application Insights effektivt
- [ ] **Performanceoptimering**: Optimerede langsomt ydende applikationer
- [ ] **Genopretningsprocedurer**: Implementerede backup og katastrofegenopretning
- [ ] **Overvågningsopsætning**: Oprettede proaktiv overvågning og alarmering

#### 🏢 Kapitel 8: Produktion & Enterprise Mønstre
- [ ] **Enterprise Sikkerhed**: Implementerede omfattende sikkerhedsmønstre
- [ ] **Governance Rammeværk**: Opsatte Azure Policy og ressourcestyring
- [ ] **Avanceret Overvågning**: Oprettede dashboards og automatiseret alarmering
- [ ] **CI/CD Integration**: Byggede automatiserede udrulningspipelines
- [ ] **Compliance Implementering**: Opfyldte enterprise compliance krav

### Lærings Tidslinje og Milepæle

#### Uge 1-2: Grundlæggende Fundament
- **Milepæl**: Udrul første AI-applikation ved brug af AZD
- **Validering**: Fungerende applikation tilgængelig via offentlig URL
- **Færdigheder**: Grundlæggende AZD workflows og AI service integration

#### Uge 3-4: Konfigurationsbeherskelse
- **Milepæl**: Multi-miljø udrulning med sikker autentifikation
- **Validering**: Samme applikation udrullet til dev/staging/prod
- **Færdigheder**: Miljøstyring og sikkerhedsimplementering

#### Uge 5-6: Infrastruktur Ekspertise
- **Milepæl**: Tilpasset skabelon for kompleks multi-service applikation
- **Validering**: Genanvendelig skabelon udrullet af et andet teammedlem
- **Færdigheder**: Bicep beherskelse og infrastrukturautomatisering

#### Uge 7-8: Avanceret AI Implementering
- **Milepæl**: Produktionsklar multi-agent AI-løsning
- **Validering**: System håndterer reel belastning med overvågning
- **Færdigheder**: Multi-agent orkestrering og performanceoptimering

#### Uge 9-10: Produktionsparathed
- **Milepæl**: Enterprise-grade udrulning med fuld compliance
- **Validering**: Godkendes ved sikkerhedsrevision og omkostningsoptimeringsaudit
- **Færdigheder**: Governance, overvågning og CI/CD-integration

### Vurdering og Certificering

#### Metoder Til Videnvalidering
1. **Praktiske implementeringer**: Arbejdende applikationer for hvert kapitel
2. **Kodegennemgange**: Skabelon- og konfigurationskvalitetsvurdering
3. **Problemløsning**: Fejlfinding scenarier og løsninger
4. **Peer-undervisning**: Forklar koncepter til andre lærende
5. **Samfundsbidrag**: Del skabeloner eller forbedringer

#### Professionelle udviklingsresultater
- **Porteføljeprojekter**: Læringsimplementeringer og arkitekturopgaver; produktionsklarhed kræver separat implementering og gennemgang
- **Tekniske færdigheder**: Branchestandard AZD og AI implementeringsekspertise
- **Problemløsningsevner**: Selvstændig fejlfinding og optimering
- **Samfundsgenkendelse**: Aktiv deltagelse i Azure-udviklersamfundet
- **Karrierefremme**: Færdigheder direkte anvendelige til cloud- og AI-roller

#### Succeskriterier
- **Implementeringssuccesrate**: >95% succesfulde implementeringer
- **Fejlfindingstid**: <30 minutter for almindelige problemer
- **Ydelsesoptimering**: Dokumenterede forbedringer inden for omkostninger og ydeevne
- **Sikkerhedsgennemgang**: Dokumenter kontroller og resterende huller i forhold til din organisations krav; gennemførelse af kurset certificerer ikke overholdelse
- **Vidensdeling**: Evne til at vejlede andre udviklere

### Kontinuerlig læring og samfundsengagement

#### Hold dig opdateret
- **Azure-opdateringer**: Følg Azure Developer CLI udgivelsesnoter
- **Samfundsbegivenheder**: Deltag i Azure- og AI-udviklerevents
- **Dokumentation**: Bidrag til fællesskabsdokumentation og eksempler
- **Feedback-løkke**: Giv feedback på kursusindhold og Azure-tjenester

#### Karriereudvikling
- **Professionelt netværk**: Forbind med Azure- og AI-eksperter
- **Talermuligheder**: Præsenter læring ved konferencer eller meetups
- **Open source-bidrag**: Bidrag til AZD-skabeloner og værktøjer
- **Mentorskab**: Vejled andre udviklere i deres AZD-læringsrejse

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../README.md)
- **📖 Begynd at lære**: [Kapitel 1: Fundament & Hurtig start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremskridtssporing**: Følg din fremgang gennem det omfattende 8-kapitel læringssystem
- **🤝 Fællesskab**: [Azure Discord](https://discord.gg/microsoft-azure) til support og diskussion

**Studie fremskridtssporing**: Brug denne strukturerede guide til at mestre Azure Developer CLI gennem progressiv, praktisk læring med målbare resultater og professionelle udviklingsfordele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->