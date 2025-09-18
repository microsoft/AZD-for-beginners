<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T23:35:01+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "da"
}
-->
# Studieguide - Omfattende Læringsmål

**Navigering i Læringsstien**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Start Læring**: [Kapitel 1: Grundlag & Hurtig Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremskridtssporing**: [Kursusafslutning](../README.md#-course-completion--certification)

## Introduktion

Denne omfattende studieguide giver strukturerede læringsmål, nøglekoncepter, praktiske øvelser og vurderingsmaterialer for at hjælpe dig med at mestre Azure Developer CLI (azd). Brug denne guide til at spore din fremgang og sikre, at du har dækket alle essentielle emner.

## Læringsmål

Ved at gennemføre denne studieguide vil du:
- Mestre alle grundlæggende og avancerede koncepter i Azure Developer CLI
- Udvikle praktiske færdigheder i at implementere og administrere Azure-applikationer
- Opbygge selvtillid i fejlfinding og optimering af implementeringer
- Forstå produktionsklare implementeringspraksisser og sikkerhedsovervejelser

## Læringsresultater

Efter at have gennemført alle sektioner af denne studieguide vil du være i stand til at:
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
2. **Første Implementering**: Implementer todo-nodejs-mongo skabelon med succes
3. **Miljøopsætning**: Konfigurer dine første miljøvariabler
4. **Ressourceudforskning**: Naviger i implementerede ressourcer i Azure Portal

#### Vurderingsspørgsmål
- Hvad er de centrale komponenter i et AZD-projekt?
- Hvordan initialiserer du et nyt projekt fra en skabelon?
- Hvad er forskellen mellem `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapitel 2: AI-Først Udvikling (Uge 2)
**Varighed**: 1-2 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Azure AI Foundry-tjenester med AZD-arbejdsgange
- Implementere og konfigurere AI-drevne applikationer
- Forstå RAG (Retrieval-Augmented Generation) implementeringsmønstre
- Administrere AI-modelimplementeringer og skalering

#### Nøglekoncepter at Mestre
- Integration af Azure OpenAI-tjenester og API-administration
- Konfiguration af AI-søgning og vektorindeksering
- Strategier for modelimplementering og kapacitetsplanlægning
- Overvågning og optimering af AI-applikationer

#### Praktiske Øvelser
1. **AI Chat Implementering**: Implementer azure-search-openai-demo skabelon
2. **RAG Implementering**: Konfigurer dokumentindeksering og -hentning
3. **Modelkonfiguration**: Opsæt flere AI-modeller med forskellige formål
4. **AI Overvågning**: Implementer Application Insights for AI-arbejdsbelastninger

#### Vurderingsspørgsmål
- Hvordan konfigurerer du Azure OpenAI-tjenester i en AZD-skabelon?
- Hvad er de centrale komponenter i en RAG-arkitektur?
- Hvordan administrerer du AI-modelkapacitet og skalering?
- Hvilke overvågningsmetrikker er vigtige for AI-applikationer?

---

### Kapitel 3: Konfiguration & Autentifikation (Uge 3)
**Varighed**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre strategier for miljøkonfiguration og -administration
- Implementere sikre autentifikationsmønstre og administreret identitet
- Organisere ressourcer med korrekte navngivningskonventioner
- Konfigurere implementeringer på tværs af flere miljøer (dev, staging, prod)

#### Nøglekoncepter at Mestre
- Miljøhierarki og konfigurationspræcedens
- Administreret identitet og service principal autentifikation
- Integration af Key Vault til hemmelighedshåndtering
- Miljøspecifik parameteradministration

#### Praktiske Øvelser
1. **Opsætning af Flere Miljøer**: Konfigurer dev-, staging- og prod-miljøer
2. **Sikkerhedskonfiguration**: Implementer administreret identitet autentifikation
3. **Hemmelighedshåndtering**: Integrer Azure Key Vault til følsomme data
4. **Parameteradministration**: Opret miljøspecifikke konfigurationer

#### Vurderingsspørgsmål
- Hvordan konfigurerer du forskellige miljøer med AZD?
- Hvad er fordelene ved at bruge administreret identitet frem for service principals?
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

#### Nøglekoncepter at Mestre
- Bicep-skabelonstruktur og bedste praksis
- Ressourceafhængigheder og implementeringsrækkefølge
- Parameterfiler og skabelonmodularitet
- Brugerdefinerede hooks og implementeringsautomatisering

#### Praktiske Øvelser
1. **Oprettelse af Brugerdefineret Skabelon**: Byg en applikationsskabelon med flere tjenester
2. **Bicep Færdigheder**: Opret modulære, genanvendelige infrastrukturkomponenter
3. **Automatisering af Implementering**: Implementer pre/post implementeringshooks
4. **Arkitekturdesign**: Implementer kompleks mikroservicesarkitektur

#### Vurderingsspørgsmål
- Hvordan opretter du brugerdefinerede Bicep-skabeloner til AZD?
- Hvad er bedste praksis for organisering af infrastrukturkode?
- Hvordan håndterer du ressourceafhængigheder i skabeloner?
- Hvilke implementeringsmønstre understøtter opdateringer uden nedetid?

---

### Kapitel 5: Multi-Agent AI Løsninger (Uge 6-7)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere AI-arkitekturer med flere agenter
- Orkestrere agentkoordinering og kommunikation
- Implementere produktionsklare AI-løsninger med overvågning
- Forstå agent-specialisering og arbejdsgangsmønstre

#### Nøglekoncepter at Mestre
- Mønstre og designprincipper for multi-agent arkitektur
- Kommunikationsprotokoller og dataflow mellem agenter
- Load balancing og skalering af AI-agenter
- Produktionsovervågning for systemer med flere agenter

#### Praktiske Øvelser
1. **Implementering af Detailhandelsløsning**: Implementer det komplette multi-agent detailhandelscenario
2. **Agenttilpasning**: Modificer adfærden for Kunde- og Lageragenter
3. **Skalering af Arkitektur**: Implementer load balancing og auto-skalering
4. **Produktionsovervågning**: Opsæt omfattende overvågning og alarmering

#### Vurderingsspørgsmål
- Hvordan designer du effektive kommunikationsmønstre mellem agenter?
- Hvad er de vigtigste overvejelser for skalering af AI-agent arbejdsbelastninger?
- Hvordan overvåger og fejlsøger du systemer med flere AI-agenter?
- Hvilke produktionsmønstre sikrer pålidelighed for AI-agenter?

---

### Kapitel 6: Validering & Planlægning før Implementering (Uge 8)
**Varighed**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Udføre omfattende kapacitetsplanlægning og ressourcevalidering
- Vælge optimale Azure SKUs for omkostningseffektivitet
- Implementere automatiserede pre-flight checks og validering
- Planlægge implementeringer med omkostningsoptimeringsstrategier

#### Nøglekoncepter at Mestre
- Azure ressourcekvoter og kapacitetsbegrænsninger
- Kriterier for SKU-valg og omkostningsoptimering
- Automatiserede valideringsscripts og testning
- Implementeringsplanlægning og risikovurdering

#### Praktiske Øvelser
1. **Kapacitetsanalyse**: Analyser ressourcekrav for dine applikationer
2. **SKU Optimering**: Sammenlign og vælg omkostningseffektive servicelag
3. **Automatisering af Validering**: Implementer pre-flight valideringsscripts
4. **Omkostningsplanlægning**: Opret implementeringsomkostningsestimater og budgetter

#### Vurderingsspørgsmål
- Hvordan validerer du Azure-kapacitet før implementering?
- Hvilke faktorer påvirker beslutninger om SKU-valg?
- Hvordan automatiserer du validering før implementering?
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
- Overvågning af ydeevne og optimering
- Incidenthåndtering og genopretningsprocedurer

#### Praktiske Øvelser
1. **Diagnostiske Færdigheder**: Øv dig med intentionelt fejlbehæftede implementeringer
2. **Loganalyse**: Brug Azure Monitor og Application Insights effektivt
3. **Ydeevneoptimering**: Optimer langsomt fungerende applikationer
4. **Genopretningsprocedurer**: Implementer backup og katastrofehåndtering

#### Vurderingsspørgsmål
- Hvad er de mest almindelige AZD-implementeringsfejl?
- Hvordan debugger du autentifikations- og tilladelsesproblemer?
- Hvilke overvågningsstrategier hjælper med at forhindre produktionsproblemer?
- Hvordan optimerer du applikationsydeevne i Azure?

---

### Kapitel 8: Produktions- & Enterprise Mønstre (Uge 10-11)
**Varighed**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere implementeringsstrategier i enterprise-klassen
- Designe sikkerhedsmønstre og compliance-rammer
- Etablere overvågning, governance og omkostningsstyring
- Oprette skalerbare CI/CD-pipelines med AZD-integration

#### Nøglekoncepter at Mestre
- Enterprise-sikkerhed og compliance-krav
- Governance-rammer og politikimplementering
- Avanceret overvågning og omkostningsstyring
- CI/CD-integration og automatiserede implementeringspipelines

#### Praktiske Øvelser
1. **Enterprise Sikkerhed**: Implementer omfattende sikkerhedsmønstre
2. **Governance Ramme**: Opsæt Azure Policy og ressourceadministration
3. **Avanceret Overvågning**: Opret dashboards og automatiseret alarmering
4. **CI/CD Integration**: Byg automatiserede implementeringspipelines

#### Vurderingsspørgsmål
- Hvordan implementerer du enterprise-sikkerhed i AZD-implementeringer?
- Hvilke governance-mønstre sikrer compliance og omkostningskontrol?
- Hvordan designer du skalerbar overvågning for produktionssystemer?
- Hvilke CI/CD-mønstre fungerer bedst med AZD-arbejdsgange?
2. Hvordan validerer du tilgængeligheden af Azure-ressourcer før implementering?  
3. Hvad er de vigtigste komponenter i et pre-flight check-system?  
4. Hvordan estimerer og kontrollerer du implementeringsomkostninger?  
5. Hvilken overvågning er essentiel for kapacitetsplanlægning?

### Modul 5: Fejlfinding og Debugging (Uge 6)

#### Læringsmål
- Mestre systematiske metoder til fejlfinding  
- Udvikle ekspertise i debugging af komplekse implementeringsproblemer  
- Implementere omfattende overvågning og alarmering  
- Opbygge procedurer for hændelseshåndtering og genopretning  

#### Centrale begreber at mestre
- Almindelige mønstre for implementeringsfejl  
- Loganalyse og korrelationsteknikker  
- Overvågning af ydeevne og optimering  
- Identifikation og respons på sikkerhedshændelser  
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

**Øvelse 5.3: Hændelseshåndtering**  
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
3. Hvilke overvågningsmetrikker er mest kritiske for tidlig problemidentifikation?  
4. Hvordan implementerer du effektive procedurer for katastrofeberedskab?  
5. Hvad er de vigtigste komponenter i en hændelseshåndteringsplan?  

### Modul 6: Avancerede emner og bedste praksis (Uge 7-8)

#### Læringsmål
- Implementere implementeringsmønstre på virksomhedsniveau  
- Mestre CI/CD-integration og automatisering  
- Udvikle skræddersyede templates og bidrage til fællesskabet  
- Forstå avancerede sikkerheds- og compliancekrav  

#### Centrale begreber at mestre
- CI/CD-pipeline integrationsmønstre  
- Udvikling og distribution af skræddersyede templates  
- Virksomhedsstyring og compliance  
- Avancerede netværks- og sikkerhedskonfigurationer  
- Optimering af ydeevne og omkostningsstyring  

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

**Øvelse 6.2: Udvikling af skræddersyede templates**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Øvelse 6.3: Implementering på virksomhedsniveau**  
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
2. Hvad er de vigtigste overvejelser ved udvikling af skræddersyede templates?  
3. Hvordan implementerer du styring og compliance i azd-implementeringer?  
4. Hvad er bedste praksis for implementeringer i virksomhedsskala?  
5. Hvordan bidrager du effektivt til azd-fællesskabet?  

## Praktiske projekter

### Projekt 1: Personlig porteføljehjemmeside  
**Kompleksitet**: Begynder  
**Varighed**: 1-2 uger  

Byg og implementer en personlig porteføljehjemmeside ved hjælp af:  
- Hosting af statisk hjemmeside på Azure Storage  
- Konfiguration af eget domæne  
- CDN-integration for global ydeevne  
- Automatiseret implementeringspipeline  

**Leverancer**:  
- Fungerende hjemmeside implementeret på Azure  
- Skræddersyet azd-template til porteføljeimplementeringer  
- Dokumentation af implementeringsprocessen  
- Analyse og anbefalinger til omkostningsoptimering  

### Projekt 2: Opgavestyringsapplikation  
**Kompleksitet**: Mellem  
**Varighed**: 2-3 uger  

Opret en full-stack opgavestyringsapplikation med:  
- React-frontend implementeret på App Service  
- Node.js API-backend med autentificering  
- PostgreSQL-database med migrationer  
- Application Insights-overvågning  

**Leverancer**:  
- Komplet applikation med brugerautentificering  
- Databaseskema og migrationsscripts  
- Overvågningsdashboard og alarmeringsregler  
- Konfiguration til implementering i flere miljøer  

### Projekt 3: Microservices-baseret e-handelsplatform  
**Kompleksitet**: Avanceret  
**Varighed**: 4-6 uger  

Design og implementer en e-handelsplatform baseret på microservices:  
- Flere API-tjenester (katalog, ordrer, betalinger, brugere)  
- Integration af beskedkø med Service Bus  
- Redis-cache for ydeevneoptimering  
- Omfattende logning og overvågning  

**Leverancer**:  
- Komplet microservices-arkitektur  
- Mønstre for inter-service kommunikation  
- Ydeevnetest og optimering  
- Produktionsklar sikkerhedsimplementering  

## Evaluering og certificering

### Videnskontroller

Fuldfør disse evalueringer efter hvert modul:

**Modul 1 Evaluering**: Grundlæggende begreber og installation  
- Multiple choice-spørgsmål om kernebegreber  
- Praktiske opgaver med installation og konfiguration  
- Enkel implementeringsøvelse  

**Modul 2 Evaluering**: Konfiguration og miljøer  
- Scenarier for miljøstyring  
- Øvelser i fejlfinding af konfiguration  
- Implementering af sikkerhedskonfiguration  

**Modul 3 Evaluering**: Implementering og klargøring  
- Udfordringer i infrastrukturdesign  
- Scenarier for implementering af flere tjenester  
- Øvelser i ydeevneoptimering  

**Modul 4 Evaluering**: Validering før implementering  
- Case-studier i kapacitetsplanlægning  
- Scenarier for omkostningsoptimering  
- Implementering af valideringspipeline  

**Modul 5 Evaluering**: Fejlfinding og debugging  
- Øvelser i problemdiagnose  
- Opgaver med implementering af overvågning  
- Simulationer af hændelseshåndtering  

**Modul 6 Evaluering**: Avancerede emner  
- Design af CI/CD-pipeline  
- Udvikling af skræddersyede templates  
- Scenarier for virksomhedens arkitektur  

### Afsluttende projekt

Design og implementer en komplet løsning, der demonstrerer mestring af alle begreber:

**Krav**:  
- Multi-tier applikationsarkitektur  
- Flere implementeringsmiljøer  
- Omfattende overvågning og alarmering  
- Implementering af sikkerhed og compliance  
- Optimering af omkostninger og ydeevne  
- Komplet dokumentation og runbooks  

**Evalueringskriterier**:  
- Teknisk implementeringskvalitet  
- Dokumentationens fuldstændighed  
- Overholdelse af sikkerhed og bedste praksis  
- Optimering af ydeevne og omkostninger  
- Effektivitet i fejlfinding og overvågning  

## Studieressourcer og referencer

### Officiel dokumentation  
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)  

### Fællesskabsressourcer  
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisation](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Praktiske miljøer  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Yderligere værktøjer  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Studieplan anbefalinger

### Fuldtidsstudie (8 uger)  
- **Uge 1-2**: Moduler 1-2 (Kom godt i gang, Konfiguration)  
- **Uge 3-4**: Moduler 3-4 (Implementering, Validering før implementering)  
- **Uge 5-6**: Moduler 5-6 (Fejlfinding, Avancerede emner)  
- **Uge 7-8**: Praktiske projekter og afsluttende evaluering  

### Deltidsstudie (16 uger)  
- **Uge 1-4**: Modul 1 (Kom godt i gang)  
- **Uge 5-7**: Modul 2 (Konfiguration og miljøer)  
- **Uge 8-10**: Modul 3 (Implementering og klargøring)  
- **Uge 11-12**: Modul 4 (Validering før implementering)  
- **Uge 13-14**: Modul 5 (Fejlfinding og debugging)  
- **Uge 15-16**: Modul 6 (Avancerede emner og evaluering)  

---

## Fremdriftssporing og evalueringsramme

### Kapitelafslutningscheckliste

Følg din fremdrift gennem hvert kapitel med disse målbare resultater:

#### 📚 Kapitel 1: Fundament & Hurtig start  
- [ ] **Installation fuldført**: AZD installeret og verificeret på din platform  
- [ ] **Første implementering**: Succesfuldt implementeret todo-nodejs-mongo template  
- [ ] **Miljøopsætning**: Konfigureret første miljøvariabler  
- [ ] **Ressourcenavigation**: Udforsket implementerede ressourcer i Azure Portal  
- [ ] **Kommando-mestring**: Fortrolig med grundlæggende AZD-kommandoer  

#### 🤖 Kapitel 2: AI-først udvikling  
- [ ] **AI-template implementering**: Succesfuldt implementeret azure-search-openai-demo  
- [ ] **RAG-implementering**: Konfigureret dokumentindeksering og -hentning  
- [ ] **Modelkonfiguration**: Opsat flere AI-modeller med forskellige formål  
- [ ] **AI-overvågning**: Implementeret Application Insights for AI-arbejdsbelastninger  
- [ ] **Ydeevneoptimering**: Justeret AI-applikationens ydeevne  

#### ⚙️ Kapitel 3: Konfiguration & Autentificering  
- [ ] **Opsætning af flere miljøer**: Konfigureret dev, staging og prod miljøer  
- [ ] **Sikkerhedsimplementering**: Opsat managed identity autentificering  
- [ ] **Håndtering af hemmeligheder**: Integreret Azure Key Vault til følsomme data  
- [ ] **Parameterstyring**: Oprettet miljøspecifikke konfigurationer  
- [ ] **Autentificeringsmestring**: Implementeret sikre adgangsmønstre  

#### 🏗️ Kapitel 4: Infrastruktur som kode & implementering  
- [ ] **Oprettelse af skræddersyet template**: Bygget en multi-service applikation template  
- [ ] **Bicep-mestring**: Oprettet modulære, genanvendelige infrastrukturkomponenter  
- [ ] **Automatisering af implementering**: Implementeret pre/post implementeringshooks  
- [ ] **Arkitekturdesign**: Implementeret kompleks microservices-arkitektur  
- [ ] **Templateoptimering**: Optimeret templates for ydeevne og omkostninger  

#### 🎯 Kapitel 5: Multi-agent AI-løsninger  
- [ ] **Implementering af detailhandelsløsning**: Implementeret komplet multi-agent detailhandelscenario  
- [ ] **Agenttilpasning**: Modificeret kunde- og lageragenters adfærd  
- [ ] **Skalering af arkitektur**: Implementeret load balancing og auto-skalering  
- [ ] **Produktionsovervågning**: Opsat omfattende overvågning og alarmering  
- [ ] **Ydeevneoptimering**: Optimeret multi-agent systemets ydeevne  

#### 🔍 Kapitel 6: Validering før implementering & planlægning  
- [ ] **Kapacitetsanalyse**: Analyseret ressourcekrav for applikationer  
- [ ] **SKU-optimering**: Udvalgt omkostningseffektive servicelag  
- [ ] **Automatisering af validering**: Implementeret scripts til validering før implementering  
- [ ] **Omkostningsplanlægning**: Oprettet estimater og budgetter for implementeringsomkostninger  
- [ ] **Risikovurdering**: Identificeret og afbødet implementeringsrisici  

#### 🚨 Kapitel 7: Fejlfinding & Debugging  
- [ ] **Diagnostiske færdigheder**: Succesfuldt debugget intentionelt ødelagte implementeringer  
- [ ] **Loganalyse**: Effektivt brugt Azure Monitor og Application Insights  
- [ ] **Ydeevneoptimering**: Optimeret langsomt fungerende applikationer  
- [ ] **Genopretningsprocedurer**: Implementeret backup og katastrofeberedskab  
- [ ] **Opsætning af overvågning**: Oprettet proaktiv overvågning og alarmering  

#### 🏢 Kapitel 8: Produktion & virksomhedsmønstre  
- [ ] **Virksomhedssikkerhed**: Implementeret omfattende sikkerhedsmønstre  
- [ ] **Styringsramme**: Opsat Azure Policy og ressourcehåndtering  
- [ ] **Avanceret overvågning**: Oprettet dashboards og automatiseret alarmering  
- [ ] **CI/CD-integration**: Bygget automatiserede implementeringspipelines  
- [ ] **Compliance-implementering**: Opfyldt virksomhedens compliance-krav  

### Læringstidslinje og milepæle

#### Uge 1-2: Fundamentopbygning  
- **Milepæl**: Implementer første AI-applikation med AZD  
- **Validering**: Fungerende applikation tilgængelig via offentlig URL  
- **Færdigheder**: Grundlæggende AZD-arbejdsgange og AI-tjenesteintegration  

#### Uge 3-4: Mestring af konfiguration  
- **Milepæl**: Implementering i flere miljøer med sikker autentificering  
- **Validering**: Samme applikation implementeret i dev/staging/prod  
- **Færdigheder**: Miljøstyring og sikkerhedsimplementering  

#### Uge 5-6: Infrastruktur-ekspertise  
- **Milepæl**: Skræddersyet template til kompleks multi-service applikation  
- **Validering**: Genanvendelig template implementeret af et andet teammedlem  
- **Færdigheder**: Bicep-mestring og automatisering af infrastruktur  

#### Uge 7-8: Avanceret AI-implementering  
- **Milepæl**: Produktionsklar multi-agent AI-løsning  
- **Validering**: System håndterer real-world belastning med overvågning  
- **Færdigheder**: Multi-agent orkestrering og ydeevneoptimering  

#### Uge 9-10: Produktionsklarhed  
- **Milepæl**: Implementering på virksomhedsniveau med fuld compliance  
- **Validering**: Består sikkerhedsrevision og omkostningsoptimeringsaudit  
- **Færdigheder**: Styring, overvågning og CI/CD-integration  

### Evaluering og certificering

#### Metoder til validering af viden  
1. **Praktiske implementeringer**: Fungerende applikationer for hvert kapitel  
2. **Code Reviews**: Kvalitetsvurdering af templates og konfigurationer  
3. **Problemløsning**: Scenarier for fejlfinding og løsninger  
4. **Peer Teaching**: Forklar begreber til andre lærende  
5. **Fællesskabsbidrag**: Del templates eller forbedringer  

#### Professionelle udviklingsresultater  
- **Porteføljeprojekter**: 8 produktionsklare implementeringer  
- **Tekniske færdigheder**: Ekspertise i industristandard AZD og AI-implementering  
- **Problemløsningsfærdigheder**: Uafhængig fejlfinding og optimering  
- **Fællesskabsanerkendelse**: Aktiv deltagelse i Azure-udviklerfællesskabet  
- **Karrierefremskridt**: Færdigheder direkte anvendelige til cloud- og AI-roller  

#### Succeskriterier  
- **Implementeringssuccesrate**: >95% succesfulde implementeringer  
- **Fejlfindingstid**: <30 minutter for almindelige problemer  
- **Ydeevneoptimering**: Demonstrerbare forbedringer i omkostninger og ydeevne  
- **Sikkerhedsoverholdelse**: Alle implementeringer opfylder virksomhedens sikkerhedsstandarder  
- **Vidensoverførsel**: Evne til at vejlede andre
- **Dokumentation**: Bidrag til fællesskabets dokumentation og eksempler
- **Feedback-loop**: Giv feedback på kursusindhold og Azure-tjenester

#### Karriereudvikling
- **Professionelt netværk**: Opret forbindelse til Azure- og AI-eksperter
- **Taler muligheder**: Præsentér dine erfaringer på konferencer eller meetups
- **Bidrag til open source**: Bidrag til AZD-skabeloner og værktøjer
- **Mentorskab**: Vejled andre udviklere i deres AZD-læringsrejse

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Start læring**: [Kapitel 1: Fundament & Hurtig Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremskridtssporing**: Følg din udvikling gennem det omfattende 8-kapitlers læringssystem
- **🤝 Fællesskab**: [Azure Discord](https://discord.gg/microsoft-azure) for support og diskussion

**Studie fremskridtssporing**: Brug denne strukturerede guide til at mestre Azure Developer CLI gennem progressiv, praktisk læring med målbare resultater og fordele for din professionelle udvikling.

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.