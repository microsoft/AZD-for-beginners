# Studieguide - Omfattende Læringsmål

**Navigering i Læringsstien**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Start Læring**: [Kapitel 1: Grundlag & Hurtig Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Spor Fremskridt**: [Kursusafslutning](../README.md#-course-completion--certification)

## Introduktion

Denne omfattende studieguide giver strukturerede læringsmål, nøglekoncepter, praktiske øvelser og vurderingsmaterialer for at hjælpe dig med at mestre Azure Developer CLI (azd). Brug denne guide til at spore din fremgang og sikre, at du har dækket alle væsentlige emner.

## Læringsmål

Ved at gennemføre denne studieguide vil du:
- Mestre alle grundlæggende og avancerede koncepter i Azure Developer CLI
- Udvikle praktiske færdigheder i at implementere og administrere Azure-applikationer
- Opbygge selvtillid i fejlfinding og optimering af implementeringer
- Forstå produktionsklare implementeringspraksisser og sikkerhedsovervejelser

## Læringsresultater

Efter at have gennemført alle sektioner i denne studieguide vil du være i stand til at:
- Designe, implementere og administrere komplette applikationsarkitekturer ved hjælp af azd
- Implementere omfattende overvågnings-, sikkerheds- og omkostningsoptimeringsstrategier
- Fejlsøge komplekse implementeringsproblemer selvstændigt
- Oprette brugerdefinerede skabeloner og bidrage til azd-fællesskabet

## 8-Kapitlers Læringsstruktur

### Kapitel 1: Grundlag & Hurtig Start (Uge 1)
**Varighed**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå kernekoncepter og terminologi i Azure Developer CLI
- Installere og konfigurere AZD på din udviklingsplatform
- Implementere din første applikation ved hjælp af en eksisterende skabelon
- Navigere effektivt i AZD's kommandolinjegrænseflade

#### Nøglekoncepter at Mestre
- AZD-projektstruktur og komponenter (azure.yaml, infra/, src/)
- Skabelonbaserede implementeringsarbejdsgange
- Grundlæggende miljøkonfiguration
- Administration af ressourcegrupper og abonnementer

#### Praktiske Øvelser
1. **Installationsverifikation**: Installer AZD og verificer med `azd version`
2. **Første Implementering**: Implementer todo-nodejs-mongo-skabelonen med succes
3. **Miljøopsætning**: Konfigurer dine første miljøvariabler
4. **Ressourceudforskning**: Naviger i implementerede ressourcer i Azure-portalen

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
- Implementere og konfigurere AI-drevne applikationer
- Forstå RAG (Retrieval-Augmented Generation) implementeringsmønstre
- Administrere AI-modellers implementering og skalering

#### Nøglekoncepter at Mestre
- Integration af Azure OpenAI-tjenester og API-administration
- Konfiguration af AI-søgning og vektorindeksering
- Strategier for modelimplementering og kapacitetsplanlægning
- Overvågning og optimering af AI-applikationers ydeevne

#### Praktiske Øvelser
1. **AI Chat Implementering**: Implementer azure-search-openai-demo-skabelonen
2. **RAG Implementering**: Konfigurer dokumentindeksering og hentning
3. **Modelkonfiguration**: Opsæt flere AI-modeller med forskellige formål
4. **AI Overvågning**: Implementer Application Insights til AI-arbejdsbelastninger

#### Vurderingsspørgsmål
- Hvordan konfigurerer du Azure OpenAI-tjenester i en AZD-skabelon?
- Hvad er de vigtigste komponenter i en RAG-arkitektur?
- Hvordan administrerer du AI-modellers kapacitet og skalering?
- Hvilke overvågningsmålinger er vigtige for AI-applikationer?

---

### Kapitel 3: Konfiguration & Godkendelse (Uge 3)
**Varighed**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre strategier for miljøkonfiguration og -administration
- Implementere sikre godkendelsesmønstre og administrerede identiteter
- Organisere ressourcer med korrekte navngivningskonventioner
- Konfigurere implementeringer på tværs af flere miljøer (dev, staging, prod)

#### Nøglekoncepter at Mestre
- Miljøhierarki og konfigurationspræcedens
- Administrerede identiteter og serviceprincipal-godkendelse
- Integration af Key Vault til hemmelighedshåndtering
- Miljøspecifik parameteradministration

#### Praktiske Øvelser
1. **Opsætning af Flere Miljøer**: Konfigurer dev-, staging- og prod-miljøer
2. **Sikkerhedskonfiguration**: Implementer administreret identitetsgodkendelse
3. **Hemmelighedshåndtering**: Integrer Azure Key Vault til følsomme data
4. **Parameteradministration**: Opret miljøspecifikke konfigurationer

#### Vurderingsspørgsmål
- Hvordan konfigurerer du forskellige miljøer med AZD?
- Hvad er fordelene ved at bruge administrerede identiteter frem for serviceprincipaler?
- Hvordan håndterer du applikationshemmeligheder sikkert?
- Hvad er konfigurationshierarkiet i AZD?

---

### Kapitel 4: Infrastruktur som Kode & Implementering (Uge 4-5)
**Varighed**: 1-1,5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Oprette og tilpasse Bicep-infrastrukturskabeloner
- Implementere avancerede implementeringsmønstre og arbejdsgange
- Forstå strategier for ressourceklargøring
- Designe skalerbare arkitekturer med flere tjenester

- Implementere containeriserede applikationer ved hjælp af Azure Container Apps og AZD

#### Nøglekoncepter at Mestre
- Bicep-skabelonstruktur og bedste praksis
- Ressourceafhængigheder og implementeringsrækkefølge
- Parameterfiler og skabelonmodularitet
- Brugerdefinerede hooks og implementeringsautomatisering
- Implementeringsmønstre for containerapps (hurtig start, produktion, mikrotjenester)

#### Praktiske Øvelser
1. **Oprettelse af Brugerdefineret Skabelon**: Byg en applikationsskabelon med flere tjenester
2. **Bicep Mestring**: Opret modulære, genanvendelige infrastrukturkomponenter
3. **Automatisering af Implementering**: Implementer pre/post implementeringshooks
4. **Arkitekturdesign**: Implementer komplekse mikrotjenestearkitekturer
5. **Container App Implementering**: Implementer [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) eksempler ved hjælp af AZD

#### Vurderingsspørgsmål
- Hvordan opretter du brugerdefinerede Bicep-skabeloner til AZD?
- Hvad er bedste praksis for organisering af infrastrukturkode?
- Hvordan håndterer du ressourceafhængigheder i skabeloner?
- Hvilke implementeringsmønstre understøtter opdateringer uden nedetid?

---

### Kapitel 5: Multi-Agent AI Løsninger (Uge 6-7)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agentkoordinering og kommunikation
- Implementere produktionsklare AI-løsninger med overvågning
- Forstå agent-specialisering og arbejdsgangsmønstre
- Integrere containeriserede mikrotjenester som en del af multi-agent løsninger

#### Nøglekoncepter at Mestre
- Mønstre og designprincipper for multi-agent arkitektur
- Kommunikationsprotokoller og dataflow mellem agenter
- Load balancing og skaleringsstrategier for AI-agenter
- Produktionsovervågning for multi-agent systemer
- Service-til-service kommunikation i containeriserede miljøer

#### Praktiske Øvelser
1. **Implementering af Detailhandelsløsning**: Implementer det komplette multi-agent detailhandelscenario
2. **Agenttilpasning**: Tilpas adfærden for kunde- og lageragenter
3. **Skalering af Arkitektur**: Implementer load balancing og auto-skalering
4. **Produktionsovervågning**: Opsæt omfattende overvågning og alarmer
5. **Integration af Mikrotjenester**: Udvid [Microservices Architecture](../../../examples/container-app/microservices) eksemplet til at understøtte agentbaserede arbejdsgange

#### Vurderingsspørgsmål
- Hvordan designer du effektive kommunikationsmønstre for multi-agenter?
- Hvad er de vigtigste overvejelser for skalering af AI-agent arbejdsbelastninger?
- Hvordan overvåger og fejlretter du multi-agent AI-systemer?
- Hvilke produktionsmønstre sikrer pålidelighed for AI-agenter?

---

### Kapitel 6: Validering & Planlægning Før Implementering (Uge 8)
**Varighed**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udføre omfattende kapacitetsplanlægning og ressourcevalidering
- Vælge optimale Azure SKUs for omkostningseffektivitet
- Implementere automatiserede pre-flight checks og validering
- Planlægge implementeringer med omkostningsoptimeringsstrategier

#### Nøglekoncepter at Mestre
- Azure ressourcekvoter og kapacitetsbegrænsninger
- Kriterier for SKU-valg og omkostningsoptimering
- Automatiserede valideringsscripts og test
- Implementeringsplanlægning og risikovurdering

#### Praktiske Øvelser
1. **Kapacitetsanalyse**: Analyser ressourcekravene for dine applikationer
2. **SKU Optimering**: Sammenlign og vælg omkostningseffektive servicelag
3. **Automatisering af Validering**: Implementer pre-deployment check scripts
4. **Omkostningsplanlægning**: Opret implementeringsomkostningsestimater og budgetter

#### Vurderingsspørgsmål
- Hvordan validerer du Azure-kapacitet før implementering?
- Hvilke faktorer påvirker beslutninger om SKU-valg?
- Hvordan automatiserer du pre-deployment validering?
- Hvilke strategier hjælper med at optimere implementeringsomkostninger?

---

### Kapitel 7: Fejlfinding & Debugging (Uge 9)
**Varighed**: 1-1,5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udvikle systematiske debugging-tilgange til AZD-implementeringer
- Løse almindelige implementerings- og konfigurationsproblemer
- Debugge AI-specifikke problemer og ydeevneproblemer
- Implementere overvågning og alarmering for proaktiv problemregistrering

#### Nøglekoncepter at Mestre
- Diagnoseteknikker og logningsstrategier
- Almindelige fejlmønstre og deres løsninger
- Ydeevneovervågning og optimering
- Incidenthåndtering og genopretningsprocedurer

#### Praktiske Øvelser
1. **Diagnostiske Færdigheder**: Øv dig med intentionelt ødelagte implementeringer
2. **Loganalyse**: Brug Azure Monitor og Application Insights effektivt
3. **Ydeevneoptimering**: Optimer langsomme applikationer
4. **Genopretningsprocedurer**: Implementer backup og katastrofegenopretning

#### Vurderingsspørgsmål
- Hvad er de mest almindelige AZD-implementeringsfejl?
- Hvordan debugger du godkendelses- og tilladelsesproblemer?
- Hvilke overvågningsstrategier hjælper med at forhindre produktionsproblemer?
- Hvordan optimerer du applikationsydelse i Azure?

---

### Kapitel 8: Produktions- & Enterprise Mønstre (Uge 10-11)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere virksomhedsklare implementeringsstrategier
- Designe sikkerhedsmønstre og overholdelsesrammer
- Etablere overvågning, governance og omkostningsstyring
- Oprette skalerbare CI/CD-pipelines med AZD-integration
- Anvende bedste praksis for produktionsimplementering af containerapps (sikkerhed, overvågning, omkostninger, CI/CD)

#### Nøglekoncepter at Mestre
- Sikkerheds- og overholdelseskrav på virksomhedsniveau
- Governance-rammer og politikimplementering
- Avanceret overvågning og omkostningsstyring
- CI/CD-integration og automatiserede implementeringspipelines
- Blue-green og canary implementeringsstrategier for containeriserede arbejdsbelastninger

#### Praktiske Øvelser
1. **Enterprise Sikkerhed**: Implementer omfattende sikkerhedsmønstre
2. **Governance Ramme**: Opsæt Azure Policy og ressourceadministration
3. **Avanceret Overvågning**: Opret dashboards og automatiserede alarmer
4. **CI/CD Integration**: Byg automatiserede implementeringspipelines
5. **Produktionscontainerapps**: Anvend sikkerhed, overvågning og omkostningsoptimering på [Microservices Architecture](../../../examples/container-app/microservices) eksemplet

#### Vurderingsspørgsmål
- Hvordan implementerer du virksomhedssikkerhed i AZD-implementeringer?
- Hvilke governance-mønstre sikrer overholdelse og omkostningskontrol?
- Hvordan designer du skalerbar overvågning for produktionssystemer?
- Hvilke CI/CD-mønstre fungerer bedst med AZD-arbejdsgange?

#### Læringsmål
- Forstå grundlæggende koncepter og kerneprincipper i Azure Developer CLI
- Installere og konfigurere azd i dit udviklingsmiljø
- Fuldføre din første implementering ved hjælp af en eksisterende skabelon
- Navigere i azd-projektstrukturen og forstå nøglekomponenter

#### Nøglekoncepter at Mestre
- Skabeloner, miljøer og tjenester
- azure.yaml konfigurationsstruktur
- Grundlæggende azd-kommandoer (init, up, down, deploy)
- Principper for Infrastruktur som Kode
- Azure-godkendelse og -autorisation

#### Praktiske Øvelser

**Øvelse 1.1: Installation og Opsætning**
```bash
# Fuldfør disse opgaver:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første Implementering**
```bash
# Udrul en simpel webapplikation:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Øvelse 1.3: Analyse af Projektstruktur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Selvstændige Vurderingsspørgsmål
1. Hvad er de tre kernekoncepter i azd-arkitekturen?
2. Hvad er formålet med azure.yaml-filen?
3. Hvordan hjælper miljøer med at administrere forskellige implementeringsmål?
4. Hvilke godkendelsesmetoder kan bruges med azd?
5. Hvad sker der, når du kører `azd up` for første gang?

---

## Fremskridtssporing og Vurderingsramme
```bash
# Opret og konfigurer flere miljøer:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Øvelse 2.2: Avanceret Konfiguration**
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

#### Selvstændige Vurderingsspørgsmål
1. Hvordan håndterer azd miljøvariabel-præcedens?
2. Hvad er implementeringshooks, og hvornår skal du bruge dem?
3. Hvordan konfigurerer du forskellige SKUs til forskellige miljøer?
4. Hvad er sikkerhedsimplikationerne ved forskellige godkendelsesmetoder?
5. Hvordan administrerer du hemmeligheder og følsomme konfigurationsdata?

### Modul 3: Implementering og Klargøring (Uge 4)

#### Læringsmål
- Mestre implementeringsarbejdsgange og bedste praksis
- Forstå Infrastruktur som Kode med Bicep-skabeloner
- Implementere komplekse arkitekturer med flere tjenester
- Optimere implementeringsydelse og pålidelighed

#### Nøglekoncepter at Mestre
- Bicep-skabelonstruktur og moduler
- Ressourceafhængigheder og rækkefølge
- Implementeringsstrategier (blue-green, rullende opdateringer)
- Implementeringer på tværs af flere regioner
- Database-migrationer og datastyring

#### Praktiske Øvelser

**Øvelse 3.1:
5. Hvad skal man overveje ved implementering i flere regioner?

### Modul 4: Validering før implementering (Uge 5)

#### Læringsmål
- Udfør omfattende kontrol før implementering
- Mestre kapacitetsplanlægning og ressourcevalidering
- Forstå valg af SKU og omkostningsoptimering
- Byg automatiserede valideringspipelines

#### Centrale begreber at mestre
- Azure ressourcekvoter og grænser
- Kriterier for valg af SKU og omkostningsimplikationer
- Automatiserede valideringsscripts og værktøjer
- Metoder til kapacitetsplanlægning
- Ydelsestest og optimering

#### Øvelser

**Øvelse 4.1: Kapacitetsplanlægning**  
```bash
# Implementer kapacitetsvalidering:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Øvelse 4.2: Pre-flight validering**  
```powershell
# Byg omfattende valideringspipeline:
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
  

#### Selv-evalueringsspørgsmål
1. Hvilke faktorer bør påvirke beslutninger om valg af SKU?
2. Hvordan validerer du tilgængeligheden af Azure-ressourcer før implementering?
3. Hvad er de vigtigste komponenter i et pre-flight check-system?
4. Hvordan estimerer og kontrollerer du implementeringsomkostninger?
5. Hvilken overvågning er essentiel for kapacitetsplanlægning?

### Modul 5: Fejlfinding og debugging (Uge 6)

#### Læringsmål
- Mestre systematiske metoder til fejlfinding
- Udvikle ekspertise i debugging af komplekse implementeringsproblemer
- Implementere omfattende overvågning og alarmering
- Byg procedurer for hændelsesrespons og genopretning

#### Centrale begreber at mestre
- Almindelige mønstre for implementeringsfejl
- Loganalyse og korrelationsteknikker
- Ydelsesovervågning og optimering
- Detektion og respons på sikkerhedshændelser
- Katastrofeberedskab og forretningskontinuitet

#### Øvelser

**Øvelse 5.1: Fejlfinding scenarier**  
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
# Byg procedurer for hændelsesrespons:
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
- Implementere implementeringsmønstre i virksomhedsklasse
- Mestre CI/CD-integration og automatisering
- Udvikle brugerdefinerede skabeloner og bidrage til fællesskabet
- Forstå avancerede sikkerheds- og overholdelseskrav

#### Centrale begreber at mestre
- CI/CD-pipeline integrationsmønstre
- Udvikling og distribution af brugerdefinerede skabeloner
- Virksomhedsstyring og overholdelse
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
# Opret og offentliggør brugerdefinerede skabeloner:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Øvelse 6.3: Implementering i virksomheder**  
```bash
# Implementer funktioner i virksomhedsklasse:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Selv-evalueringsspørgsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbejdsgange?
2. Hvad er de vigtigste overvejelser ved udvikling af brugerdefinerede skabeloner?
3. Hvordan implementerer du styring og overholdelse i azd-implementeringer?
4. Hvad er bedste praksis for implementeringer i virksomhedsskala?
5. Hvordan bidrager du effektivt til azd-fællesskabet?

## Praktiske projekter

### Projekt 1: Personlig porteføljehjemmeside
**Kompleksitet**: Begynder  
**Varighed**: 1-2 uger  

Byg og implementer en personlig porteføljehjemmeside ved hjælp af:
- Statisk hjemmesidehosting på Azure Storage
- Konfiguration af brugerdefineret domæne
- CDN-integration for global ydeevne
- Automatiseret implementeringspipeline

**Leverancer**:
- Fungerende hjemmeside implementeret på Azure
- Brugerdefineret azd-skabelon til porteføljeimplementeringer
- Dokumentation af implementeringsprocessen
- Analyse og anbefalinger til omkostningsoptimering

### Projekt 2: Opgavestyringsapplikation
**Kompleksitet**: Mellem  
**Varighed**: 2-3 uger  

Opret en fuld-stack opgavestyringsapplikation med:
- React frontend implementeret på App Service
- Node.js API backend med autentificering
- PostgreSQL-database med migrationer
- Application Insights-overvågning

**Leverancer**:
- Komplet applikation med brugerautentificering
- Databaseskema og migrationsscripts
- Overvågningsdashboard og alarmeringsregler
- Konfiguration til implementering i flere miljøer

### Projekt 3: E-handelsplatform med mikrotjenester
**Kompleksitet**: Avanceret  
**Varighed**: 4-6 uger  

Design og implementer en e-handelsplatform baseret på mikrotjenester:
- Flere API-tjenester (katalog, ordrer, betalinger, brugere)
- Integrering af meddelelseskø med Service Bus
- Redis-cache til ydeevneoptimering
- Omfattende logning og overvågning

**Referenceeksempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) for en produktionsklar skabelon og implementeringsvejledning

**Leverancer**:
- Komplet mikrotjenestearkitektur
- Mønstre for kommunikation mellem tjenester
- Ydelsestest og optimering
- Produktionsklar sikkerhedsimplementering

## Evaluering og certificering

### Vidensprøver

Fuldfør disse evalueringer efter hvert modul:

**Modul 1 Evaluering**: Grundlæggende begreber og installation
- Multiple choice-spørgsmål om kernebegreber
- Praktiske installations- og konfigurationsopgaver
- Enkel implementeringsøvelse

**Modul 2 Evaluering**: Konfiguration og miljøer
- Scenarier for miljøstyring
- Øvelser i fejlfinding af konfiguration
- Implementering af sikkerhedskonfiguration

**Modul 3 Evaluering**: Implementering og klargøring
- Udfordringer i infrastrukturdesign
- Scenarier for implementering af flere tjenester
- Øvelser i ydelsesoptimering

**Modul 4 Evaluering**: Validering før implementering
- Case-studier i kapacitetsplanlægning
- Scenarier for omkostningsoptimering
- Implementering af valideringspipeline

**Modul 5 Evaluering**: Fejlfinding og debugging
- Øvelser i problemdiagnose
- Opgaver i implementering af overvågning
- Simulationer af hændelsesrespons

**Modul 6 Evaluering**: Avancerede emner
- Design af CI/CD-pipeline
- Udvikling af brugerdefinerede skabeloner
- Scenarier for virksomhedens arkitektur

### Afsluttende projekt

Design og implementer en komplet løsning, der demonstrerer mestring af alle begreber:

**Krav**:
- Flerlags applikationsarkitektur
- Flere implementeringsmiljøer
- Omfattende overvågning og alarmering
- Implementering af sikkerhed og overholdelse
- Omkostningsoptimering og ydelsestuning
- Komplet dokumentation og runbooks

**Evalueringskriterier**:
- Teknisk implementeringskvalitet
- Dokumentationens fuldstændighed
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

## Studieplan anbefalinger

### Fuldtidsstudie (8 uger)
- **Uger 1-2**: Moduler 1-2 (Kom godt i gang, Konfiguration)
- **Uger 3-4**: Moduler 3-4 (Implementering, Validering før implementering)
- **Uger 5-6**: Moduler 5-6 (Fejlfinding, Avancerede emner)
- **Uger 7-8**: Praktiske projekter og afsluttende evaluering

### Deltidsstudie (16 uger)
- **Uger 1-4**: Modul 1 (Kom godt i gang)
- **Uger 5-7**: Modul 2 (Konfiguration og miljøer)
- **Uger 8-10**: Modul 3 (Implementering og klargøring)
- **Uger 11-12**: Modul 4 (Validering før implementering)
- **Uger 13-14**: Modul 5 (Fejlfinding og debugging)
- **Uger 15-16**: Modul 6 (Avancerede emner og evaluering)

---

## Fremdriftssporing og evalueringsramme

### Kapitelafslutnings-tjekliste

Følg din fremdrift gennem hvert kapitel med disse målbare resultater:

#### 📚 Kapitel 1: Grundlag & Hurtig start
- [ ] **Installation fuldført**: AZD installeret og verificeret på din platform
- [ ] **Første implementering**: Succesfuldt implementeret todo-nodejs-mongo skabelon
- [ ] **Miljøopsætning**: Konfigureret første miljøvariabler
- [ ] **Ressourcenavigation**: Udforsket implementerede ressourcer i Azure Portal
- [ ] **Kommando-mestring**: Fortrolig med grundlæggende AZD-kommandoer

#### 🤖 Kapitel 2: AI-First udvikling  
- [ ] **AI-skabelon implementering**: Succesfuldt implementeret azure-search-openai-demo
- [ ] **RAG-implementering**: Konfigureret dokumentindeksering og -hentning
- [ ] **Modelkonfiguration**: Opsat flere AI-modeller med forskellige formål
- [ ] **AI-overvågning**: Implementeret Application Insights til AI-arbejdsbelastninger
- [ ] **Ydelsesoptimering**: Justeret AI-applikationens ydeevne

#### ⚙️ Kapitel 3: Konfiguration & Autentificering
- [ ] **Opsætning af flere miljøer**: Konfigureret dev-, staging- og prod-miljøer
- [ ] **Sikkerhedsimplementering**: Opsat administreret identitetsautentificering
- [ ] **Håndtering af hemmeligheder**: Integreret Azure Key Vault til følsomme data
- [ ] **Parameterstyring**: Oprettet miljøspecifikke konfigurationer
- [ ] **Autentificeringsmestring**: Implementeret sikre adgangsmønstre

#### 🏗️ Kapitel 4: Infrastruktur som kode & Implementering
- [ ] **Oprettelse af brugerdefineret skabelon**: Bygget en multi-service applikationsskabelon
- [ ] **Bicep-mestring**: Oprettet modulære, genanvendelige infrastrukturkomponenter
- [ ] **Automatisering af implementering**: Implementeret pre/post implementeringshooks
- [ ] **Arkitekturdesign**: Implementeret kompleks mikrotjenestearkitektur
- [ ] **Skabelonoptimering**: Optimeret skabeloner for ydeevne og omkostninger

#### 🎯 Kapitel 5: Multi-agent AI-løsninger
- [ ] **Implementering af detailhandelsløsning**: Implementeret komplet multi-agent detailhandelscenario
- [ ] **Tilpasning af agenter**: Ændret adfærd for kunde- og lageragenter
- [ ] **Skalering af arkitektur**: Implementeret load balancing og auto-skalering
- [ ] **Overvågning i produktion**: Opsat omfattende overvågning og alarmering
- [ ] **Ydelsestuning**: Optimeret multi-agent systemets ydeevne

#### 🔍 Kapitel 6: Validering & Planlægning før implementering
- [ ] **Kapacitetsanalyse**: Analyseret ressourcekrav for applikationer
- [ ] **SKU-optimering**: Valgt omkostningseffektive servicelag
- [ ] **Automatisering af validering**: Implementeret scripts til kontrol før implementering
- [ ] **Omkostningsplanlægning**: Oprettet estimater og budgetter for implementeringsomkostninger
- [ ] **Risikovurdering**: Identificeret og afbødet implementeringsrisici

#### 🚨 Kapitel 7: Fejlfinding & Debugging
- [ ] **Diagnostiske færdigheder**: Succesfuldt debugget intentionelt ødelagte implementeringer
- [ ] **Loganalyse**: Effektivt brugt Azure Monitor og Application Insights
- [ ] **Ydelsestuning**: Optimeret langsomme applikationer
- [ ] **Genopretningsprocedurer**: Implementeret backup og katastrofeberedskab
- [ ] **Opsætning af overvågning**: Oprettet proaktiv overvågning og alarmering

#### 🏢 Kapitel 8: Produktion & Virksomhedsmønstre
- [ ] **Virksomhedssikkerhed**: Implementeret omfattende sikkerhedsmønstre
- [ ] **Styringsramme**: Opsat Azure Policy og ressourcehåndtering
- [ ] **Avanceret overvågning**: Oprettet dashboards og automatiseret alarmering
- [ ] **CI/CD-integration**: Bygget automatiserede implementeringspipelines
- [ ] **Overholdelsesimplementering**: Opfyldt krav til virksomhedsoverholdelse

### Læringstidslinje og milepæle

#### Uge 1-2: Grundlæggende opbygning
- **Milepæl**: Implementer første AI-applikation med AZD
- **Validering**: Fungerende applikation tilgængelig via offentlig URL
- **Færdigheder**: Grundlæggende AZD-arbejdsgange og AI-tjenesteintegration

#### Uge 3-4: Mestring af konfiguration
- **Milepæl**: Implementering i flere miljøer med sikker autentificering
- **Validering**: Samme applikation implementeret i dev/staging/prod
- **Færdigheder**: Miljøstyring og sikkerhedsimplementering

#### Uge 5-6: Infrastruktur-ekspertise
- **Milepæl**: Brugerdefineret skabelon til kompleks multi-service applikation
- **Validering**: Genanvendelig skabelon implementeret af et andet teammedlem
- **Færdigheder**: Bicep-mestring og infrastrukturautomatisering

#### Uge 7-8: Avanceret AI-implementering
- **Milepæl**: Produktionsklar multi-agent AI-løsning
- **Validering**: System håndterer real-world belastning med overvågning
- **Færdigheder**: Multi-agent orkestrering og ydelsesoptimering

#### Uge 9-10: Produktionsparathed
- **Milepæl**: Implementering i virksomhedsklasse med fuld overholdelse
- **Validering**: Består sikkerhedsrevision og omkostningsoptimeringsaudit
- **Færdigheder**: Styring, overvågning og CI/CD-integration

### Evaluering og certificering

#### Metoder til vidensvalidering
1. **Praktiske implementeringer**: Fungerende applikationer for hvert kapitel
2. **Kodegennemgange**: Kvalitetsvurdering af skabeloner og konfigurationer
3. **Problemløsning**: Fejlfinding af scenar
5. **Fællesskabsbidrag**: Del skabeloner eller forbedringer

#### Professionelle Udviklingsresultater
- **Portfolio Projekter**: 8 produktionsklare implementeringer
- **Tekniske Færdigheder**: Branche-standard AZD og AI-implementeringsekspertise
- **Problemløsningsevner**: Selvstændig fejlfinding og optimering
- **Fællesskabsanerkendelse**: Aktiv deltagelse i Azure-udviklerfællesskabet
- **Karrierefremgang**: Færdigheder direkte anvendelige til cloud- og AI-roller

#### Succeskriterier
- **Implementeringssuccesrate**: >95% succesfulde implementeringer
- **Fejlfindingstid**: <30 minutter for almindelige problemer
- **Ydelsesoptimering**: Påviselige forbedringer i omkostninger og ydeevne
- **Sikkerhedsoverholdelse**: Alle implementeringer opfylder virksomhedens sikkerhedsstandarder
- **Vidensdeling**: Evne til at vejlede andre udviklere

### Kontinuerlig Læring og Fællesskabsengagement

#### Hold dig opdateret
- **Azure Opdateringer**: Følg Azure Developer CLI udgivelsesnoter
- **Fællesskabsbegivenheder**: Deltag i Azure- og AI-udviklerbegivenheder
- **Dokumentation**: Bidrag til fællesskabsdokumentation og eksempler
- **Feedbacksløjfe**: Giv feedback på kursusindhold og Azure-tjenester

#### Karriereudvikling
- **Professionelt Netværk**: Forbind med Azure- og AI-eksperter
- **Taler Muligheder**: Præsentér læringer på konferencer eller meetups
- **Open Source Bidrag**: Bidrag til AZD-skabeloner og værktøjer
- **Mentorskab**: Vejled andre udviklere i deres AZD-læringsrejse

---

**Kapitel Navigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Start Læring**: [Kapitel 1: Grundlag & Hurtig Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremskridtssporing**: Følg din udvikling gennem det omfattende 8-kapitlers læringssystem
- **🤝 Fællesskab**: [Azure Discord](https://discord.gg/microsoft-azure) for support og diskussion

**Studie Fremskridtssporing**: Brug denne strukturerede guide til at mestre Azure Developer CLI gennem progressiv, praktisk læring med målbare resultater og professionelle udviklingsfordele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->