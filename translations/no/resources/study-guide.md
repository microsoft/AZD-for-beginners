# Studi Guide - Omfattende Læringsmål

**Navigering av Læringsvei**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Start Læringen**: [Kapittel 1: Grunnlag & Rask Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: [Kursfullføring](../README.md#-course-completion--certification)

## Introduksjon

Denne omfattende studieguiden gir strukturerte læringsmål, nøkkelkonsepter, øvelser og vurderingsmateriale for å hjelpe deg med å mestre Azure Developer CLI (azd). Bruk denne guiden for å spore fremdriften din og sikre at du har dekket alle viktige emner.

## Læringsmål

Ved å fullføre denne studieguiden vil du:
- Mestre alle grunnleggende og avanserte konsepter i Azure Developer CLI
- Utvikle praktiske ferdigheter i utrulling og administrasjon av Azure-applikasjoner
- Bygge tillit til feilsøking og optimalisering av utrullinger
- Forstå produksjonsklare utrullingspraksiser og sikkerhetshensyn

## Læringsutbytte

Etter å ha fullført alle seksjoner i denne studieguiden, vil du kunne:
- Designe, implementere og administrere fullstendige applikasjonsarkitekturer ved bruk av azd
- Implementere omfattende overvåknings-, sikkerhets- og kostnadsoptimaliseringsstrategier
- Feilsøke komplekse utrullingsproblemer selvstendig
- Lage tilpassede maler og bidra til azd-samfunnet

## 8-Kapittels Læringsstruktur

### Kapittel 1: Grunnlag & Rask Start (Uke 1)
**Varighet**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå kjernebegreper og terminologi for Azure Developer CLI
- Installere og konfigurere AZD på utviklingsplattformen din med suksess
- Rulle ut din første applikasjon ved bruk av en eksisterende mal
- Navigere i AZD kommandolinjegrensesnitt effektivt

#### Nøkkelkonsepter å mestre
- AZD prosjektstruktur og komponenter (azure.yaml, infra/, src/)
- Malbaserte utrullingsarbeidsflyter
- Grunnleggende om miljøkonfigurasjon
- Ressursgruppe- og abonnementshåndtering

#### Praktiske øvelser
1. **Installajsonverifisering**: Installer AZD og verifiser med `azd version`
2. **Første utrulling**: Rull ut todo-nodejs-mongo malen med suksess
3. **Miljøoppsett**: Konfigurer dine første miljøvariabler
4. **Ressursutforskning**: Naviger distribuerte ressurser i Azure-portalen

#### Vurderingsspørsmål
- Hva er kjernekomponentene i et AZD-prosjekt?
- Hvordan initialiserer du et nytt prosjekt fra en mal?
- Hva er forskjellen mellom `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapittel 2: AI-Først Utvikling (Uke 2)
**Varighet**: 4-5 timer inkludert workshop | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbeidsflyter
- Bruke GA `microsoft.foundry`-pakken med AZD 1.37.0+ for utvikling med hostet agent
- Rulle ut og konfigurere AI-drevne applikasjoner
- Forstå RAG (Retrieval-Augmented Generation)-implementeringsmønstre
- Administrere AI-modellutrullinger og skalerbarhet

#### Nøkkelkonsepter å mestre
- Integrasjon av Microsoft Foundry Models-tjeneste og API-håndtering
- AI-søk-konfigurasjon og vektorindeksering
- Modellutrullingsstrategier og kapasitetsplanlegging
- Overvåking og ytelsesoptimalisering for AI-applikasjoner
- Lokal Agent Inspector vs. skysporinger, kildekodeutrulling og evalueringsressurser i versjonskontroll

#### Praktiske øvelser
1. **AI Chat Utrulling**: Rull ut azure-search-openai-demo malen
2. **RAG Implementering**: Konfigurer dokumentindeksering og innhenting
3. **Modellkonfigurasjon**: Sett opp flere AI-modeller med forskjellige formål
4. **AI Overvåking**: Implementer Application Insights for AI arbeidsbelastninger
5. **GA Hostet Agent**: Følg [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); sammenlign lokale og sky-responser, gå gjennom et evalueringsresultat, og verifiser oppryddingseierskap

#### Vurderingsspørsmål
- Hvordan konfigurerer du Microsoft Foundry Models-tjenester i en AZD-mal?
- Hva er nøkkelkomponentene i en RAG-arkitektur?
- Hvordan administrerer du kapasitet og skalering for AI-modeller?
- Hvilke overvåkingsmetrikker er viktige for AI-applikasjoner?
- Hvilke utvidelser er inkludert i `microsoft.foundry`, og hvorfor installeres evalueringer separat?
- Hvorfor påløper det fortsatt Azure-modellkostnader ved lokale agenttester?
- Hva etterlater `azd down` når du gjenbruker et eksisterende Foundry-prosjekt?

---

### Kapittel 3: Konfigurasjon & Autentisering (Uke 3)
**Varighet**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre miljøkonfigurasjon og administrasjonsstrategier
- Implementere sikre autentiseringsmønstre og administrert identitet
- Organisere ressurser med riktige navnekonvensjoner
- Konfigurere utrullinger med flere miljøer (dev, staging, prod)

#### Nøkkelkonsepter å mestre
- Miljøhierarki og konfigurasjonspreferanse
- Administrert identitet og service principal-autentisering
- Key Vault-integrasjon for hemmelighetshåndtering
- Miljøspesifikk parameterhåndtering

#### Praktiske øvelser
1. **Multi-miljø Oppsett**: Konfigurer dev-, staging- og prod-miljøer
2. **Sikkerhetskonfigurasjon**: Implementer autentisering med administrert identitet
3. **Håndtering av hemmeligheter**: Integrer Azure Key Vault for sensitiv data
4. **Parameterhåndtering**: Lag miljøspesifikke konfigurasjoner

#### Vurderingsspørsmål
- Hvordan konfigurerer du ulike miljøer med AZD?
- Hva er fordelene ved å bruke administrert identitet fremfor service principals?
- Hvordan håndterer du applikasjonhemmeligheter sikkert?
- Hva er konfigurasjonshierarkiet i AZD?

---

### Kapittel 4: Infrastruktur som Kode & Utrulling (Uke 4-5)
**Varighet**: 1-1.5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Lage og tilpasse Bicep-infrastrukturmaler
- Implementere avanserte utrullingsmønstre og arbeidsflyter
- Forstå ressurs-utrullingsstrategier
- Designe skalerbare multi-tjenestearkitekturer

- Rulle ut containeriserte applikasjoner ved hjelp av Azure Container Apps og AZD


#### Nøkkelkonsepter å mestre
- Bicep-malstruktur og beste praksis
- Ressursavhengigheter og utrullingsrekkefølge
- Parameterfiler og malmodularitet
- Tilpassede kroker og utrullingsautomatisering
- Utrullingsmønstre for containerapper (rask start, produksjon, mikrotjenester)

#### Praktiske øvelser
1. **Lage Tilpasset Mal**: Bygg en mal for en multi-tjeneste applikasjon
2. **Bicep Mestring**: Lag modulære, gjenbrukbare infrastrukturkomponenter
3. **Automatisering av Utrulling**: Implementer pre/post-utrullingskroker
4. **Arkitekturdesign**: Rull ut kompleks mikrotjenestearkitektur
5. **Containerapp-Utrulling**: Rull ut eksemplene [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) med AZD

#### Vurderingsspørsmål
- Hvordan lager du tilpassede Bicep-maler for AZD?
- Hva er beste praksis for organisering av infrastrukturkode?
- Hvordan håndterer du ressursavhengigheter i maler?
- Hvilke utrullingsmønstre støtter null nedetid ved oppdateringer?

---

### Kapittel 5: Multi-Agent AI-løsninger (Uke 6-7)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agentkoordinasjon og kommunikasjon
- Rulle ut produksjonsklare AI-løsninger med overvåking
- Forstå agentspesialisering og arbeidsflytmønstre
- Integrere containeriserte mikrotjenester som del av multi-agent-løsninger

#### Nøkkelkonsepter å mestre
- Multi-agent arkitekturmønstre og designprinsipper
- Agent-kommunikasjonsprotokoller og dataflyt
- Lastbalanserings- og skaleringsstrategier for AI-agenter
- Produksjonsovervåking for multi-agent systemer
- Tjeneste-til-tjeneste kommunikasjon i containeriserte miljøer

#### Praktiske øvelser
1. **Retail Arkitekturgjennomgang**: Analyser retail-blåkopien og identifiser hvilke applikasjonskomponenter som må implementeres før utrulling
2. **Agenttilpasning**: Modifiser atferden til Customer- og Inventory-agenter
3. **Arkitektur-skalaering**: Implementer lastbalansering og automatisk skalering
4. **Produksjonsovervåking**: Sett opp omfattende overvåking og varsling
5. **Mikrotjenesteintegrasjon**: Utvid [Microservices Architecture](../../../examples/container-app/microservices)-eksempelet for å støtte agentbaserte arbeidsflyter

#### Vurderingsspørsmål
- Hvordan designer du effektive kommunikasjonsmønstre for multi-agent?
- Hva er viktige hensyn for skalering av AI-agent arbeidsbelastninger?
- Hvordan overvåker og feilsøker du multi-agent AI-systemer?
- Hvilke produksjonsmønstre sikrer pålitelighet for AI-agenter?

---

### Kapittel 6: Forutrullingsvalidering & Planlegging (Uke 8)
**Varighet**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utføre omfattende kapasitetsplanlegging og ressursvalidering
- Velge optimale Azure SKUer for kostnadseffektivitet
- Implementere automatiserte sjekker og validering før utrulling
- Planlegge utrullinger med kostnadsoptimaliseringsstrategier

#### Nøkkelkonsepter å mestre
- Azure ressurskvoter og kapasitetsbegrensninger
- SKU-valgskriterier og kostnadsoptimalisering
- Automatiserte valideringsskript og testing
- Utrullingsplanlegging og risikovurdering

#### Praktiske øvelser
1. **Kapasitetsanalyse**: Analyser ressurskrav for applikasjonene dine
2. **SKU-Optimalisering**: Sammenlign og velg kostnadseffektive tjenestelag
3. **Valideringsautomatisering**: Implementer sjekk-skript før utrulling
4. **Kostnadsplanlegging**: Lag kostnadsanslag og budsjetter for utrulling

#### Vurderingsspørsmål
- Hvordan validerer du Azure-kapasitet før utrulling?
- Hvilke faktorer påvirker SKU-valgsbeslutninger?
- Hvordan automatiserer du forutrullingsvalidering?
- Hvilke strategier hjelper med å optimalisere utrullingskostnader?

---

### Kapittel 7: Feilsøking & Debugging (Uke 9)
**Varighet**: 1-1.5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utvikle systematiske debugging-tilnærminger for AZD-utrullinger
- Løse vanlige utrullings- og konfigurasjonsproblemer
- Feilsøke AI-spesifikke problemer og ytelsesutfordringer
- Implementere overvåking og varsling for proaktiv feildeteksjon

#### Nøkkelkonsepter å mestre
- Diagnoseteknikker og loggstrategier
- Vanlige feilmønstre og løsningene deres
- Ytelsesovervåking og optimalisering
- Hendelsesrespons og gjenopprettingsprosedyrer

#### Praktiske øvelser
1. **Diagnostiske ferdigheter**: Øv på med vilje ødelagte utrullinger
2. **Logganalyse**: Bruk Azure Monitor og Application Insights effektivt
3. **Ytelsesjustering**: Optimaliser langsomt fungerende applikasjoner
4. **Gjenopprettingsprosedyrer**: Implementer backup og katastrofegjenoppretting

#### Vurderingsspørsmål
- Hva er de vanligste feilene ved AZD-utrullinger?
- Hvordan feilsøker du autentiserings- og tillatelsesproblemer?
- Hvilke overvåkingsstrategier hjelper med å forhindre produksjonsproblemer?
- Hvordan optimaliserer du applikasjonsytelse i Azure?

---

### Kapittel 8: Produksjon & Enterprise Mønstre (Uke 10-11)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere enterprise-grade utrullingsstrategier
- Designe sikkerhetsmønstre og samsvarsrammeverk
- Etablere overvåking, styring og kostnadskontroll
- Lage skalerbare CI/CD-pipelines med AZD-integrasjon
- Anvende beste praksis for produksjonsutrulling av containerapper (sikkerhet, overvåking, kostnad, CI/CD)

#### Nøkkelkonsepter å mestre
- Enterprise sikkerhet og samsvarskrav
- Styringsrammeverk og policy-implementering
- Avansert overvåking og kostnadshåndtering
- CI/CD-integrasjon og automatiserte utrullingspipelines
- Blue-green og canary distribusjonsstrategier for container-baserte arbeidsbelastninger

#### Praktiske øvelser
1. **Enterprise Sikkerhet**: Implementer omfattende sikkerhetsmønstre
2. **Styringsrammeverk**: Sett opp Azure Policy og ressursstyring
3. **Avansert Overvåking**: Lag dashbord og automatisert varsling
4. **CI/CD Integrasjon**: Bygg automatiserte utrullingspipelines
5. **Produksjons Containerapper**: Anvend sikkerhet, overvåking og kostnadsoptimalisering på [Microservices Architecture](../../../examples/container-app/microservices) eksempelet

#### Vurderingsspørsmål
- Hvordan implementerer du enterprise-sikkerhet i AZD-utrullinger?
- Hvilke styringsmønstre sikrer samsvar og kostnadskontroll?
- Hvordan designer du skalerbar overvåking for produksjonssystemer?
- Hvilke CI/CD-mønstre fungerer best med AZD-arbeidsflyter?

#### Læringsmål
- Forstå Azure Developer CLI grunnprinsipper og kjernebegreper
- Installere og konfigurere azd på utviklingsmiljøet ditt med suksess
- Fullføre din første utrulling med en eksisterende mal
- Navigere azd prosjektstruktur og forstå nøkkelkomponenter

#### Nøkkelkonsepter å mestre
- Maler, miljøer og tjenester
- azure.yaml konfigurasjonsstruktur
- Grunnleggende azd-kommandoer (init, up, down, deploy)
- Prinsipper for infrastruktur som kode
- Azure autentisering og autorisasjon

#### Praktiske øvelser

**Øvelse 1.1: Installering og oppsett**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første Utrulling**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Øvelse 1.3: Analyse av Prosjektstruktur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Selv-vurderingsspørsmål
1. Hva er de tre kjernebegrepene i azd-arkitekturen?
2. Hva er formålet med azure.yaml filen?
3. Hvordan hjelper miljøer med å administrere forskjellige utrullingsmål?
4. Hvilke autentiseringsmetoder kan brukes med azd?
5. Hva skjer når du kjører `azd up` for første gang?

---

## Fremdriftssporing og Vurderingsrammeverk
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Øvelse 2.2: Avansert Konfigurasjon**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Øvelse 2.3: Sikkerhetskonfigurasjon**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selv-vurderingsspørsmål
1. Hvordan håndterer azd miljøvariabel-preferanser?
2. Hva er utrullingskroker og når bør du bruke dem?
3. Hvordan konfigurerer du forskjellige SKUer for ulike miljøer?
4. Hva er sikkerhetsimplikasjonene av ulike autentiseringsmetoder?
5. Hvordan håndterer du hemmeligheter og sensitiv konfigurasjonsdata?

### Modul 3: Utrulling og Tilrettelegging (Uke 4)

#### Læringsmål
- Mestre utrullingsarbeidsflyter og beste praksiser
- Forstå Infrastruktur som kode ved hjelp av Bicep-maler
- Implementere komplekse multi-tjenestearkitekturer
- Optimalisere utrullingsytelse og pålitelighet

#### Nøkkelkonsepter å mestre
- Bicep-malstruktur og moduler
- Ressursavhengigheter og rekkefølge
- Utrullingsstrategier (blue-green, rullende oppdateringer)
- Multi-region utrullinger
- Database-migrasjoner og datastyring

#### Praktiske øvelser

**Øvelse 3.1: Tilpasset infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Multi-tjeneste applikasjon**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Øvelse 3.3: Databaseintegrasjon**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Egenvurderingsspørsmål
1. Hva er fordelene med å bruke Bicep fremfor ARM-maler?
2. Hvordan håndterer du databasemigrasjoner i azd-distribusjoner?
3. Hvilke strategier eksisterer for distribusjoner uten nedetid?
4. Hvordan håndterer du avhengigheter mellom tjenester?
5. Hva er hensynene ved distribusjoner på tvers av regioner?

### Modul 4: Validering før distribusjon (Uke 5)

#### Læringsmål
- Implementere omfattende sjekker før distribusjon
- Mestre kapasitetsplanlegging og ressursvalidering
- Forstå valg av SKU og kostnadsoptimalisering
- Bygge automatiserte valideringspipelines

#### Viktige konsepter å mestre
- Azure ressurskvoter og begrensninger
- Kriterier for valg av SKU og kostnadspåvirkninger
- Automatiserte valideringsskript og verktøy
- Metodikker for kapasitetsplanlegging
- Ytelsestesting og optimalisering

#### Praktiske øvelser

**Øvelse 4.1: Kapasitetsplanlegging**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Øvelse 4.2: Pre-flight validering**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Øvelse 4.3: SKU-optimalisering**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Egenvurderingsspørsmål
1. Hvilke faktorer bør påvirke beslutninger om valg av SKU?
2. Hvordan validerer du tilgjengelighet av Azure-ressurser før distribusjon?
3. Hva er nøkkelkomponentene i et pre-flight-sjekksystem?
4. Hvordan estimerer og kontrollerer du distribusjonskostnader?
5. Hva slags overvåking er essensiell for kapasitetsplanlegging?

### Modul 5: Feilsøking og debugging (Uke 6)

#### Læringsmål
- Mestre systematiske feilsøkingsmetodikker
- Utvikle ekspertise i debugging av komplekse distribusjonsproblemer
- Implementere omfattende overvåking og varsling
- Bygge prosedyrer for hendelseshåndtering og gjenoppretting

#### Viktige konsepter å mestre
- Vanlige feilmønstre ved distribusjonsfeil
- Teknikker for logganalyse og korrelasjon
- Ytelsesovervåking og optimalisering
- Oppdagelse og respons på sikkerhetshendelser
- Katastrofegjenoppretting og forretningskontinuitet

#### Praktiske øvelser

**Øvelse 5.1: Feilsøkingsscenarioer**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Øvelse 5.2: Implementering av overvåking**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Øvelse 5.3: Hendelseshåndtering**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Egenvurderingsspørsmål
1. Hva er den systematiske tilnærmingen til feilsøking av azd-distribusjoner?
2. Hvordan korrelerer du logger på tvers av flere tjenester og ressurser?
3. Hvilke monitoreringsmetrikker er mest kritiske for tidlig problemoppdagelse?
4. Hvordan implementerer du effektive prosedyrer for katastrofegjenoppretting?
5. Hva er nøkkelkomponentene i en plan for hendelseshåndtering?

### Modul 6: Avanserte emner og beste praksiser (Uke 7-8)

#### Læringsmål
- Implementere distribusjonsmønstre på bedriftsnivå
- Mestre CI/CD-integrasjon og automatisering
- Utvikle tilpassede maler og bidra til fellesskapet
- Forstå avanserte sikkerhets- og samsvarskrav

#### Viktige konsepter å mestre
- Mønstre for integrasjon av CI/CD-pipelines
- Utvikling og distribusjon av tilpassede maler
- Bedriftsstyring og samsvar
- Avanserte nettverks- og sikkerhetskonfigurasjoner
- Ytelsesoptimalisering og kostnadsstyring

#### Praktiske øvelser

**Øvelse 6.1: CI/CD-integrasjon**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Øvelse 6.2: Utvikling av tilpasset mal**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Bedriftimplementering**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Egenvurderingsspørsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbeidsflyter?
2. Hva er nøkkelhensyn ved utvikling av tilpassede maler?
3. Hvordan implementerer du styring og samsvar i azd-distribusjoner?
4. Hva er beste praksis for distribusjoner i bedriftsstørrelse?
5. Hvordan bidrar du effektivt til azd-fellesskapet?

## Praktiske prosjekter

### Prosjekt 1: Personlig porteføljenettside
**Kompleksitet**: Nybegynner  
**Varighet**: 1-2 uker

Bygg og distribuer en personlig porteføljenettside med:
- Statisk netthosting på Azure Storage
- Tilpasset domenekonfigurasjon
- CDN-integrasjon for global ytelse
- Automatisert distribusjonspipeline

**Leveranser**:
- Funksjonell nettside distribuert på Azure
- Tilpasset azd-mal for porteføljedistribusjoner
- Dokumentasjon av distribusjonsprosess
- Kostnadsanalyse og optimaliseringsforslag

### Prosjekt 2: Oppgavehåndteringsapplikasjon
**Kompleksitet**: Middels  
**Varighet**: 2-3 uker

Lag en full-stack oppgavehåndteringsapplikasjon med:
- React frontend distribuert til App Service
- Node.js API backend med autentisering
- PostgreSQL database med migrasjoner
- Application Insights overvåking

**Leveranser**:
- Fullstendig applikasjon med brukergodkjenning
- Databaseskjema og migrasjonsskript
- Overvåkingsdashboards og varslingsregler
- Konfigurasjon for distribusjon i flere miljøer

### Prosjekt 3: Mikrotjeneste e-handelsplattform
**Kompleksitet**: Avansert  
**Varighet**: 4-6 uker

Design og implementer en mikrotjenestebasert e-handelsplattform:
- Flere API-tjenester (katalog, ordre, betaling, brukere)
- Integrasjon av meldingskø med Service Bus
- Redis-cache for ytelsesoptimalisering
- Omfattende logging og overvåking

**Referanseeksempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) for en læregjennomgang med to tjenester og distribusjonsguide. Kataloger, persistens, autentisering, betaling og produksjonsmodning er separate prosjektoppgaver.

**Leveranser**:
- Komplett mikrotjenestearkitektur
- Kommunikasjonsmønstre mellom tjenester
- Ytelsestesting og optimalisering
- Produksjonsklar sikkerhetsimplementering

## Vurdering og sertifisering

### Kunnskapstester

Fullfør disse vurderingene etter hver modul:

**Modul 1 Vurdering**: Grunnleggende konsepter og installasjon
- Flervalgsspørsmål om kjernebegreper
- Praktiske oppgaver for installasjon og konfigurasjon
- Enkel distribusjonsøvelse

**Modul 2 Vurdering**: Konfigurasjon og miljøer
- Scenarier for miljøhåndtering
- Feilsøkingsøvelser for konfigurasjon
- Implementering av sikkerhetskonfigurasjon

**Modul 3 Vurdering**: Distribusjon og provisjonering
- Infrastrukturdesignutfordringer
- Distribusjonsscenarier for flere tjenester
- Øvelser for ytelsesoptimalisering

**Modul 4 Vurdering**: Validering før distribusjon
- Case-studier for kapasitetsplanlegging
- Scenarier for kostnadsoptimalisering
- Implementering av valideringspipeline

**Modul 5 Vurdering**: Feilsøking og debugging
- Problemdiagnoseøvelser
- Oppgaver for implementering av overvåking
- Simuleringer av hendelseshåndtering

**Modul 6 Vurdering**: Avanserte emner
- Design av CI/CD-pipeline
- Utvikling av tilpassede maler
- Scenarier for bedriftsarkitektur

### Sluttprosjekt

Design og implementer en komplett løsning som demonstrerer mestring av alle konsepter:

**Krav**:
- Applikasjonsarkitektur med flere lag
- Flere distribusjonsmiljøer
- Omfattende overvåking og varsling
- Implementering av sikkerhet og samsvar
- Kostnadsoptimalisering og ytelsestuning
- Fullstendig dokumentasjon og driftsmanualer

**Evalueringskriterier**:
- Kvalitet på teknisk implementering
- Fullstendighet i dokumentasjon
- Overholdelse av sikkerhet og beste praksis
- Ytelses- og kostnadsoptimalisering
- Effektivitet i feilsøking og overvåking

## Studie- og referanseressurser

### Offisiell dokumentasjon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fellesskapsressurser
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Øvingsmiljøer
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Tilleggsverktøy
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Anbefalt studietidsplan

### Fulltidstudier (8 uker)
- **Uke 1-2**: Modul 1-2 (Kom i gang, Konfigurasjon)
- **Uke 3-4**: Modul 3-4 (Distribusjon, Validering før distribusjon)
- **Uke 5-6**: Modul 5-6 (Feilsøking, Avanserte emner)
- **Uke 7-8**: Praktiske prosjekter og sluttevaluering

### Deltidstudier (16 uker)
- **Uke 1-4**: Modul 1 (Kom i gang)
- **Uke 5-7**: Modul 2 (Konfigurasjon og miljøer)
- **Uke 8-10**: Modul 3 (Distribusjon og provisjonering)
- **Uke 11-12**: Modul 4 (Validering før distribusjon)
- **Uke 13-14**: Modul 5 (Feilsøking og debugging)
- **Uke 15-16**: Modul 6 (Avanserte emner og vurdering)

---

## Fremdriftssporing og vurderingsrammeverk

### Sjekkliste for fullføring av kapitler

Spor fremdriften din gjennom hvert kapittel med disse målbare resultatene:

#### 📚 Kapittel 1: Grunnlag & Rask start
- [ ] **Installasjon fullført**: AZD installert og verifisert på plattformen din
- [ ] **Første distribusjon**: Vellykket distribusjon av todo-nodejs-mongo-mal
- [ ] **Miljøoppsett**: Konfigurert første miljøvariabler
- [ ] **Ressursnavigasjon**: Utforsket distribuerte ressurser i Azure-portalen
- [ ] **Kommandomestring**: Komfortabel med grunnleggende AZD-kommandoer

#### 🤖 Kapittel 2: AI-først utvikling  
- [ ] **AI-mal distribusjon**: Vellykket distribusjon av azure-search-openai-demo
- [ ] **RAG-implementering**: Konfigurert dokumentindeksering og henting
- [ ] **Modellkonfigurasjon**: Satt opp flere AI-modeller med ulike formål
- [ ] **AI-overvåking**: Implementert Application Insights for AI-arbeidsbelastninger
- [ ] **Ytelsesoptimalisering**: Tunt AI-applikasjonen for bedre ytelse

#### ⚙️ Kapittel 3: Konfigurasjon & Autentisering
- [ ] **Multi-miljø oppsett**: Konfigurert utviklings-, staging- og produksjonsmiljøer
- [ ] **Sikkerhetsimplementering**: Satt opp administrert identitet for autentisering
- [ ] **Håndtering av hemmeligheter**: Integrert Azure Key Vault for sensitive data
- [ ] **Parameterhåndtering**: Opprettet miljøspesifikke konfigurasjoner
- [ ] **Autentiseringsmestring**: Implementert sikre tilgangsmønstre

#### 🏗️ Kapittel 4: Infrastruktur som kode & distribusjon
- [ ] **Tilpasset mal-opprettelse**: Bygget en mal for multi-tjeneste applikasjon
- [ ] **Bicep-mestring**: Laget modulære, gjenbrukbare infrastrukturelementer
- [ ] **Distribusjonsautomatisering**: Implementert forhånds- og etterheng
- [ ] **Arkitekturdesign**: Distribuert kompleks mikrotjenestearkitektur
- [ ] **Maloptimalisering**: Optimaliserte maler for ytelse og kostnad

#### 🎯 Kapittel 5: Multi-agent AI-løsninger
- [ ] **Retail arkitekturoversikt**: Identifisert manglende applikasjonskomponenter og planlagt implementering og validering
- [ ] **Agenttilpasning**: Endret kunde- og lageragenters atferd
- [ ] **Arkitekturskalering**: Implementert lastbalansering og autoskalering
- [ ] **Produksjonsovervåking**: Satt opp omfattende overvåking og varsling
- [ ] **Ytelsestuning**: Optimalisert multi-agent systemytelse

#### 🔍 Kapittel 6: Validering & planlegging før distribusjon
- [ ] **Kapasitetsanalyse**: Analysert ressursbehov for applikasjoner
- [ ] **SKU-optimalisering**: Valgt kostnadseffektive servicelag
- [ ] **Automatisering av validering**: Implementert sjekkskript før distribusjon
- [ ] **Kostnadsplanlegging**: Laget kostnadsestimater og budsjetter for distribusjon
- [ ] **Risikovurdering**: Identifisert og mitigert distribusjonsrisikoer

#### 🚨 Kapittel 7: Feilsøking & debugging
- [ ] **Diagnostiske ferdigheter**: Vellykket debugget med hensikt ødelagte distribusjoner
- [ ] **Logganalyse**: Brukt Azure Monitor og Application Insights effektivt
- [ ] **Ytelsestuning**: Optimalisert sakte apper
- [ ] **Gjenopprettingsprosedyrer**: Implementert backup og katastrofegjenoppretting
- [ ] **Overvåkingsoppsett**: Opprettet proaktiv overvåking og varsling

#### 🏢 Kapittel 8: Produksjon- & bedriftsmønstre
- [ ] **Bedriftssikkerhet**: Implementert omfattende sikkerhetsmønstre
- [ ] **Styringsrammeverk**: Satt opp Azure Policy og ressursstyring
- [ ] **Avansert overvåking**: Opprettet dashboards og automatisert varsling
- [ ] **CI/CD integrasjon**: Bygget automatiserte distribusjonspipelines
- [ ] **Samsvarsimplementering**: Oppfyller bedriftskrav til samsvar

### Læringstidslinje og milepæler

#### Uke 1-2: Grunnleggende bygging
- **Milepæl**: Distribuer første AI-applikasjon med AZD
- **Validering**: Velfungerende applikasjon tilgjengelig via offentlig URL
- **Ferdigheter**: Grunnleggende AZD-arbeidsflyter og AI-tjenesteintegrasjon

#### Uke 3-4: Mestring av konfigurasjon
- **Milepæl**: Distribusjon i flere miljøer med sikker autentisering
- **Validering**: Samme applikasjon distribuert til dev/staging/prod
- **Ferdigheter**: Miljøhåndtering og sikkerhetsimplementering

#### Uke 5-6: Infrastrukturkompetanse
- **Milepæl**: Tilpasset mal for kompleks multi-tjeneste applikasjon
- **Validering**: Gjenbrukbar mal distribuert av annet teammedlem
- **Ferdigheter**: Bicep-mestring og infrastrukturautomatisering

#### Uke 7-8: Avansert AI-implementering
- **Milepæl**: Produksjonsklar multi-agent AI-løsning
- **Validering**: System håndterer reell belastning med overvåking
- **Ferdigheter**: Orkestrering av multi-agent og ytelsesoptimalisering

#### Uke 9-10: Produksjonsberedskap
- **Milepæl**: Distribusjon på bedriftsnivå med full samsvar
- **Validering**: Består sikkerhetsgjennomgang og kostnadsoptimalisering
- **Ferdigheter**: Styring, overvåking og CI/CD-integrasjon

### Vurdering og sertifisering

#### Metoder for kunnskapsvalidering
1. **Praktiske distribusjoner**: Arbeidende applikasjoner for hvert kapittel
2. **Kodegjennomganger**: Mal- og konfigurasjonsvurdering
3. **Problemløsning**: Feilsøking scenarier og løsninger
4. **Kollegial undervisning**: Forklar konsepter til andre lærende
5. **Fellesskapsbidrag**: Del maler eller forbedringer

#### Profesjonelle utviklingsresultater
- **Porteføljeprosjekter**: Læringsdistribusjoner og arkitekturoppgaver; produksjonsberedskap krever separat implementering og gjennomgang
- **Tekniske ferdigheter**: Bransjestandard AZD og AI-distribusjonskompetanse
- **Problemløsningsevner**: Selvstendig feilsøking og optimalisering
- **Fellesskapsanerkjennelse**: Aktiv deltakelse i Azure-utviklerfellesskapet
- **Karriereutvikling**: Ferdigheter direkte anvendelige i sky- og AI-roller

#### Suksessmål
- **Distribusjonssuksessrate**: >95 % vellykkede distribusjoner
- **Feilsøkings tid**: <30 minutter for vanlige problemer
- **Ytelsesoptimalisering**: Påviselige forbedringer i kostnad og ytelse
- **Sikkerhetsgjennomgang**: Dokumenter kontroller og gjenværende gap mot organisasjonens krav; gjennomføring av kurset sertifiserer ikke samsvar
- **Kunnskapsoverføring**: Evne til å veilede andre utviklere

### Kontinuerlig læring og fellesskapsengasjement

#### Hold deg oppdatert
- **Azure-oppdateringer**: Følg Azure Developer CLI-utgivelsesnotater
- **Fellesskapsarrangementer**: Delta i Azure- og AI-utviklerarrangementer
- **Dokumentasjon**: Bidra til fellesskapsdokumentasjon og eksempler
- **Tilbakemeldingssløyfe**: Gi tilbakemelding om kursinnhold og Azure-tjenester

#### Karriereutvikling
- **Profesjonelt nettverk**: Knytt kontakt med Azure- og AI-eksperter
- **Taleranstillinger**: Presenter læring på konferanser eller treff
- **Open Source-bidrag**: Bidra til AZD-maler og verktøy
- **Mentorskap**: Veiled andre utviklere i deres AZD-læringsreise

---

**Kapittelnavigering:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Start Læringen**: [Kapittel 1: Grunnlag & Rask start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: Spor din fremgang gjennom det omfattende 8-kapittel læringssystemet
- **🤝 Fellesskap**: [Azure Discord](https://discord.gg/microsoft-azure) for støtte og diskusjon

**Studiefremdriftssporing**: Bruk denne strukturerte veiledningen for å mestre Azure Developer CLI gjennom progresiv, praktisk læring med målbare resultater og fordeler for profesjonell utvikling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->