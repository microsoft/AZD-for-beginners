# Studieguide - Omfattende læringsmål

**Navigering i læringsstien**
- **📚 Kursoversikt**: [AZD for nybegynnere](../README.md)
- **📖 Start læringen**: [Kapittel 1: Grunnlag & Hurtigstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: [Kursfullføring](../README.md#-course-completion--certification)

## Introduksjon

Denne omfattende studieguiden gir strukturerte læringsmål, nøkkelkonsepter, praktiske øvelser og vurderingsmateriale for å hjelpe deg med å mestre Azure Developer CLI (azd). Bruk denne guiden til å spore fremgangen din og sikre at du har dekket alle essensielle emner.

## Læringsmål

Ved å fullføre denne studieguiden vil du:
- Mestre alle grunnleggende og avanserte konsepter i Azure Developer CLI
- Utvikle praktiske ferdigheter i å distribuere og administrere Azure-applikasjoner
- Bygge selvtillit i feilsøking og optimalisering av distribusjoner
- Forstå produksjonsklare distribusjonspraksiser og sikkerhetsvurderinger

## Læringsresultater

Etter å ha fullført alle seksjoner i denne studieguiden, vil du kunne:
- Designe, distribuere og administrere komplette applikasjonsarkitekturer ved hjelp av azd
- Implementere omfattende overvåking, sikkerhet og kostnadsoptimaliseringsstrategier
- Feilsøke komplekse distribusjonsproblemer selvstendig
- Lage tilpassede maler og bidra til azd-samfunnet

## 8-kapitlers læringsstruktur

### Kapittel 1: Grunnlag & Hurtigstart (Uke 1)
**Varighet**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå kjernekonsepter og terminologi i Azure Developer CLI
- Installere og konfigurere AZD på din utviklingsplattform
- Distribuere din første applikasjon ved hjelp av en eksisterende mal
- Navigere effektivt i AZD-kommandolinjegrensesnittet

#### Nøkkelkonsepter å mestre
- AZD-prosjektstruktur og komponenter (azure.yaml, infra/, src/)
- Malbaserte distribusjonsarbeidsflyter
- Grunnleggende miljøkonfigurasjon
- Administrasjon av ressursgrupper og abonnementer

#### Praktiske øvelser
1. **Installasjonsverifisering**: Installer AZD og verifiser med `azd version`
2. **Første distribusjon**: Distribuer todo-nodejs-mongo-malen vellykket
3. **Miljøoppsett**: Konfigurer dine første miljøvariabler
4. **Ressursutforskning**: Naviger distribuerte ressurser i Azure Portal

#### Vurderingsspørsmål
- Hva er kjernekomponentene i et AZD-prosjekt?
- Hvordan initialiserer du et nytt prosjekt fra en mal?
- Hva er forskjellen mellom `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapittel 2: AI-først utvikling (Uke 2)
**Varighet**: 1-2 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbeidsflyter
- Distribuere og konfigurere AI-drevne applikasjoner
- Forstå implementeringsmønstre for RAG (Retrieval-Augmented Generation)
- Administrere AI-modelldistribusjoner og skalering

#### Nøkkelkonsepter å mestre
- Integrasjon av Azure OpenAI-tjenester og API-administrasjon
- Konfigurasjon av AI-søk og vektorindeksering
- Strategier for modelldistribusjon og kapasitetsplanlegging
- Overvåking og ytelsesoptimalisering av AI-applikasjoner

#### Praktiske øvelser
1. **AI-chat-distribusjon**: Distribuer azure-search-openai-demo-malen
2. **RAG-implementering**: Konfigurer dokumentindeksering og gjenfinning
3. **Modellkonfigurasjon**: Sett opp flere AI-modeller med ulike formål
4. **AI-overvåking**: Implementer Application Insights for AI-arbeidsbelastninger

#### Vurderingsspørsmål
- Hvordan konfigurerer du Azure OpenAI-tjenester i en AZD-mal?
- Hva er nøkkelkomponentene i en RAG-arkitektur?
- Hvordan administrerer du AI-modellkapasitet og skalering?
- Hvilke overvåkingsmetrikker er viktige for AI-applikasjoner?

---

### Kapittel 3: Konfigurasjon & Autentisering (Uke 3)
**Varighet**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre strategier for miljøkonfigurasjon og administrasjon
- Implementere sikre autentiseringsmønstre og administrert identitet
- Organisere ressurser med riktige navnekonvensjoner
- Konfigurere distribusjoner for flere miljøer (dev, staging, prod)

#### Nøkkelkonsepter å mestre
- Miljøhierarki og konfigurasjonsprioritet
- Administrert identitet og tjenesteprinsippautentisering
- Integrasjon av Key Vault for hemmelighetsadministrasjon
- Miljøspesifikk parameteradministrasjon

#### Praktiske øvelser
1. **Oppsett for flere miljøer**: Konfigurer dev-, staging- og prod-miljøer
2. **Sikkerhetskonfigurasjon**: Implementer autentisering med administrert identitet
3. **Hemmelighetsadministrasjon**: Integrer Azure Key Vault for sensitiv data
4. **Parameteradministrasjon**: Lag miljøspesifikke konfigurasjoner

#### Vurderingsspørsmål
- Hvordan konfigurerer du ulike miljøer med AZD?
- Hva er fordelene med å bruke administrert identitet fremfor tjenesteprinsipper?
- Hvordan administrerer du applikasjonshemmeligheter sikkert?
- Hva er konfigurasjonshierarkiet i AZD?

---

### Kapittel 4: Infrastruktur som kode & Distribusjon (Uke 4-5)
**Varighet**: 1-1,5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Lage og tilpasse Bicep-infrastrukturmaler
- Implementere avanserte distribusjonsmønstre og arbeidsflyter
- Forstå strategier for ressursprovisjonering
- Designe skalerbare arkitekturer med flere tjenester

- Distribuere containeriserte applikasjoner ved hjelp av Azure Container Apps og AZD

#### Nøkkelkonsepter å mestre
- Struktur og beste praksis for Bicep-maler
- Ressursavhengigheter og distribusjonsrekkefølge
- Parameterfiler og malmodularitet
- Tilpassede hooks og distribusjonsautomatisering
- Distribusjonsmønstre for containerapper (hurtigstart, produksjon, mikrotjenester)

#### Praktiske øvelser
1. **Opprettelse av tilpasset mal**: Bygg en applikasjonsmal med flere tjenester
2. **Bicep-mestring**: Lag modulære, gjenbrukbare infrastrukturkomponenter
3. **Distribusjonsautomatisering**: Implementer pre/post distribusjonshooks
4. **Arkitekturdesign**: Distribuer komplekse mikrotjenestearkitekturer
5. **Distribusjon av containerapper**: Distribuer [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) eksempler ved hjelp av AZD

#### Vurderingsspørsmål
- Hvordan lager du tilpassede Bicep-maler for AZD?
- Hva er beste praksis for organisering av infrastrukturkode?
- Hvordan håndterer du ressursavhengigheter i maler?
- Hvilke distribusjonsmønstre støtter oppdateringer uten nedetid?

---

### Kapittel 5: AI-løsninger med flere agenter (Uke 6-7)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere AI-arkitekturer med flere agenter
- Orkestrere agentkoordinering og kommunikasjon
- Distribuere produksjonsklare AI-løsninger med overvåking
- Forstå spesialisering av agenter og arbeidsflytmønstre
- Integrere containeriserte mikrotjenester som en del av løsninger med flere agenter

#### Nøkkelkonsepter å mestre
- Mønstre og designprinsipper for arkitekturer med flere agenter
- Kommunikasjonsprotokoller og dataflyt mellom agenter
- Lastbalansering og skaleringsstrategier for AI-agenter
- Produksjonsovervåking for systemer med flere agenter
- Tjeneste-til-tjeneste-kommunikasjon i containeriserte miljøer

#### Praktiske øvelser
1. **Distribusjon av detaljhandelsløsning**: Distribuer det komplette detaljhandelscenarioet med flere agenter
2. **Tilpasning av agenter**: Modifiser oppførselen til kunde- og lageragenter
3. **Skalering av arkitektur**: Implementer lastbalansering og autoskalering
4. **Produksjonsovervåking**: Sett opp omfattende overvåking og varsling
5. **Integrasjon av mikrotjenester**: Utvid [Microservices Architecture](../../../examples/container-app/microservices) eksempelet for å støtte arbeidsflyter med flere agenter

#### Vurderingsspørsmål
- Hvordan designer du effektive kommunikasjonsmønstre for flere agenter?
- Hva er nøkkelbetraktninger for skalering av AI-agentarbeidsbelastninger?
- Hvordan overvåker og feilsøker du AI-systemer med flere agenter?
- Hvilke produksjonsmønstre sikrer pålitelighet for AI-agenter?

---

### Kapittel 6: Validering & Planlegging før distribusjon (Uke 8)
**Varighet**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utføre omfattende kapasitetsplanlegging og ressursvalidering
- Velge optimale Azure SKUs for kostnadseffektivitet
- Implementere automatiserte pre-flight-sjekker og validering
- Planlegge distribusjoner med kostnadsoptimaliseringsstrategier

#### Nøkkelkonsepter å mestre
- Azure ressurskvoter og kapasitetsbegrensninger
- Kriterier for SKU-valg og kostnadsoptimalisering
- Automatiserte valideringsskript og testing
- Distribusjonsplanlegging og risikovurdering

#### Praktiske øvelser
1. **Kapasitetsanalyse**: Analyser ressurskravene for applikasjonene dine
2. **SKU-optimalisering**: Sammenlign og velg kostnadseffektive tjenestenivåer
3. **Valideringsautomatisering**: Implementer pre-distribusjonssjekk-skript
4. **Kostnadsplanlegging**: Lag kostnadsestimater og budsjetter for distribusjon

#### Vurderingsspørsmål
- Hvordan validerer du Azure-kapasitet før distribusjon?
- Hvilke faktorer påvirker beslutninger om SKU-valg?
- Hvordan automatiserer du validering før distribusjon?
- Hvilke strategier hjelper med å optimalisere distribusjonskostnader?

---

### Kapittel 7: Feilsøking & Debugging (Uke 9)
**Varighet**: 1-1,5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utvikle systematiske feilsøkingsmetoder for AZD-distribusjoner
- Løse vanlige distribusjons- og konfigurasjonsproblemer
- Debugge AI-spesifikke problemer og ytelsesutfordringer
- Implementere overvåking og varsling for proaktiv problemidentifikasjon

#### Nøkkelkonsepter å mestre
- Diagnoseteknikker og loggstrategier
- Vanlige feilmønstre og deres løsninger
- Ytelsesovervåking og optimalisering
- Respons på hendelser og gjenopprettingsprosedyrer

#### Praktiske øvelser
1. **Diagnostiske ferdigheter**: Øv med bevisst ødelagte distribusjoner
2. **Logganalyse**: Bruk Azure Monitor og Application Insights effektivt
3. **Ytelsesjustering**: Optimaliser applikasjoner med lav ytelse
4. **Gjenopprettingsprosedyrer**: Implementer backup og katastrofegjenoppretting

#### Vurderingsspørsmål
- Hva er de vanligste feilene i AZD-distribusjoner?
- Hvordan feilsøker du autentiserings- og tillatelsesproblemer?
- Hvilke overvåkingsstrategier hjelper med å forhindre produksjonsproblemer?
- Hvordan optimaliserer du applikasjonsytelse i Azure?

---

### Kapittel 8: Produksjon & Enterprise-mønstre (Uke 10-11)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere distribusjonsstrategier på enterprise-nivå
- Designe sikkerhetsmønstre og samsvarsrammeverk
- Etablere overvåking, styring og kostnadsadministrasjon
- Lage skalerbare CI/CD-pipelines med AZD-integrasjon
- Anvende beste praksis for produksjonsdistribusjon av containerapper (sikkerhet, overvåking, kostnad, CI/CD)

#### Nøkkelkonsepter å mestre
- Sikkerhets- og samsvarskrav på enterprise-nivå
- Styringsrammeverk og policyimplementering
- Avansert overvåking og kostnadsadministrasjon
- CI/CD-integrasjon og automatiserte distribusjonspipelines
- Blue-green og kanaridistribusjonsstrategier for containeriserte arbeidsbelastninger

#### Praktiske øvelser
1. **Enterprise-sikkerhet**: Implementer omfattende sikkerhetsmønstre
2. **Styringsrammeverk**: Sett opp Azure Policy og ressursadministrasjon
3. **Avansert overvåking**: Lag dashboards og automatisert varsling
4. **CI/CD-integrasjon**: Bygg automatiserte distribusjonspipelines
5. **Produksjonscontainerapper**: Anvend sikkerhet, overvåking og kostnadsoptimalisering på [Microservices Architecture](../../../examples/container-app/microservices) eksempelet

#### Vurderingsspørsmål
- Hvordan implementerer du enterprise-sikkerhet i AZD-distribusjoner?
- Hvilke styringsmønstre sikrer samsvar og kostnadskontroll?
- Hvordan designer du skalerbar overvåking for produksjonssystemer?
- Hvilke CI/CD-mønstre fungerer best med AZD-arbeidsflyter?

#### Læringsmål
- Forstå grunnleggende konsepter og kjerneprinsipper i Azure Developer CLI
- Installere og konfigurere azd på ditt utviklingsmiljø
- Fullføre din første distribusjon ved hjelp av en eksisterende mal
- Navigere i azd-prosjektstrukturen og forstå nøkkelkomponenter

#### Nøkkelkonsepter å mestre
- Maler, miljøer og tjenester
- azure.yaml-konfigurasjonsstruktur
- Grunnleggende azd-kommandoer (init, up, down, deploy)
- Prinsipper for infrastruktur som kode
- Azure-autentisering og autorisasjon

#### Praktiske øvelser

**Øvelse 1.1: Installasjon og oppsett**
```bash
# Fullfør disse oppgavene:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første distribusjon**
```bash
# Distribuer en enkel webapplikasjon:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Øvelse 1.3: Analyse av prosjektstruktur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Selv-vurderingsspørsmål
1. Hva er de tre kjernekonseptene i azd-arkitektur?
2. Hva er formålet med azure.yaml-filen?
3. Hvordan hjelper miljøer med å administrere ulike distribusjonsmål?
4. Hvilke autentiseringsmetoder kan brukes med azd?
5. Hva skjer når du kjører `azd up` for første gang?

---

## Fremdriftssporing og vurderingsrammeverk
```bash
# Opprett og konfigurer flere miljøer:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Øvelse 2.2: Avansert konfigurasjon**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Øvelse 2.3: Sikkerhetskonfigurasjon**
```bash
# Implementer beste praksis for sikkerhet:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selv-vurderingsspørsmål
1. Hvordan håndterer azd miljøvariabelprioritet?
2. Hva er distribusjonshooks, og når bør du bruke dem?
3. Hvordan konfigurerer du ulike SKUs for ulike miljøer?
4. Hva er sikkerhetsimplikasjonene av ulike autentiseringsmetoder?
5. Hvordan administrerer du hemmeligheter og sensitiv konfigurasjonsdata?

### Modul 3: Distribusjon og Provisjonering (Uke 4)

#### Læringsmål
- Mestre distribusjonsarbeidsflyter og beste praksis
- Forstå infrastruktur som kode med Bicep-maler
- Implementere komplekse arkitekturer med flere tjenester
- Optimalisere distribusjonsytelse og pålitelighet

#### Nøkkelkonsepter å mestre
- Struktur og moduler i Bicep-maler
- Ressursavhengigheter og rekkefølge
- Distribusjonsstrategier (blue-green, rullerende oppdateringer)
- Distribusjoner på tvers av regioner
- Databasemigrasjoner og databehandling

#### Praktiske øvelser

**Øvelse 3.1: Tilpasset infrastruktur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse
5. Hva bør vurderes ved distribusjoner i flere regioner?

### Modul 4: Validering før distribusjon (Uke 5)

#### Læringsmål
- Utføre omfattende kontroller før distribusjon
- Mestre kapasitetsplanlegging og ressursvalidering
- Forstå valg av SKU og kostnadsoptimalisering
- Bygge automatiserte valideringspipelines

#### Viktige konsepter å mestre
- Kvoter og begrensninger for Azure-ressurser
- Kriterier for valg av SKU og kostnadskonsekvenser
- Automatiserte valideringsskript og verktøy
- Metoder for kapasitetsplanlegging
- Ytelsestesting og optimalisering

#### Øvelser

**Øvelse 4.1: Kapasitetsplanlegging**  
```bash
# Implementer kapasitetsvalidering:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Øvelse 4.2: Validering før distribusjon**  
```powershell
# Bygg omfattende valideringspipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Øvelse 4.3: SKU-optimalisering**  
```bash
# Optimaliser tjenestekonfigurasjoner:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Selvstendige vurderingsspørsmål
1. Hvilke faktorer bør påvirke beslutninger om valg av SKU?
2. Hvordan validerer du tilgjengeligheten av Azure-ressurser før distribusjon?
3. Hva er de viktigste komponentene i et system for validering før distribusjon?
4. Hvordan estimerer og kontrollerer du distribusjonskostnader?
5. Hvilken overvåking er essensiell for kapasitetsplanlegging?

### Modul 5: Feilsøking og debugging (Uke 6)

#### Læringsmål
- Mestre systematiske feilsøkingsmetoder
- Utvikle ekspertise i debugging av komplekse distribusjonsproblemer
- Implementere omfattende overvåking og varsling
- Bygge prosedyrer for hendelseshåndtering og gjenoppretting

#### Viktige konsepter å mestre
- Vanlige mønstre for distribusjonsfeil
- Logganalyse og korrelasjonsteknikker
- Ytelsesovervåking og optimalisering
- Oppdagelse og respons på sikkerhetshendelser
- Katastrofegjenoppretting og forretningskontinuitet

#### Øvelser

**Øvelse 5.1: Feilsøkingsscenarier**  
```bash
# Øv på å løse vanlige problemer:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Øvelse 5.2: Implementering av overvåking**  
```bash
# Sett opp omfattende overvåking:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Øvelse 5.3: Hendelseshåndtering**  
```bash
# Bygg prosedyrer for hendelsesrespons:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Selvstendige vurderingsspørsmål
1. Hva er den systematiske tilnærmingen til feilsøking av azd-distribusjoner?
2. Hvordan korrelerer du logger på tvers av flere tjenester og ressurser?
3. Hvilke overvåkingsmetrikker er mest kritiske for tidlig problemoppdagelse?
4. Hvordan implementerer du effektive prosedyrer for katastrofegjenoppretting?
5. Hva er de viktigste komponentene i en plan for hendelseshåndtering?

### Modul 6: Avanserte emner og beste praksis (Uke 7-8)

#### Læringsmål
- Implementere distribusjonsmønstre på bedriftsnivå
- Mestre CI/CD-integrasjon og automatisering
- Utvikle tilpassede maler og bidra til fellesskapet
- Forstå avanserte sikkerhets- og samsvarskrav

#### Viktige konsepter å mestre
- Integrasjonsmønstre for CI/CD-pipelines
- Utvikling og distribusjon av tilpassede maler
- Styring og samsvar på bedriftsnivå
- Avanserte nettverks- og sikkerhetskonfigurasjoner
- Ytelsesoptimalisering og kostnadsstyring

#### Øvelser

**Øvelse 6.1: CI/CD-integrasjon**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Øvelse 6.2: Utvikling av tilpassede maler**  
```bash
# Opprett og publiser egendefinerte maler:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Øvelse 6.3: Implementering på bedriftsnivå**  
```bash
# Implementer funksjoner på bedriftsnivå:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Selvstendige vurderingsspørsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbeidsflyter?
2. Hva er de viktigste hensynene ved utvikling av tilpassede maler?
3. Hvordan implementerer du styring og samsvar i azd-distribusjoner?
4. Hva er beste praksis for distribusjoner i stor skala?
5. Hvordan bidrar du effektivt til azd-fellesskapet?

## Praktiske prosjekter

### Prosjekt 1: Personlig porteføljenettsted
**Kompleksitet**: Nybegynner  
**Varighet**: 1-2 uker  

Bygg og distribuer et personlig porteføljenettsted ved hjelp av:
- Statisk nettstedhosting på Azure Storage
- Konfigurasjon av egendefinert domene
- CDN-integrasjon for global ytelse
- Automatisert distribusjonspipeline

**Leveranser**:
- Fungerende nettsted distribuert på Azure
- Tilpasset azd-mal for porteføljedistribusjoner
- Dokumentasjon av distribusjonsprosessen
- Anbefalinger for kostnadsanalyse og optimalisering

### Prosjekt 2: Oppgavehåndteringsapplikasjon
**Kompleksitet**: Middels  
**Varighet**: 2-3 uker  

Lag en fullstack oppgavehåndteringsapplikasjon med:
- React frontend distribuert til App Service
- Node.js API-backend med autentisering
- PostgreSQL-database med migreringer
- Overvåking med Application Insights

**Leveranser**:
- Komplett applikasjon med brukergodkjenning
- Databaseskjema og migreringsskript
- Overvåkingsdashbord og varslingsregler
- Distribusjonskonfigurasjon for flere miljøer

### Prosjekt 3: E-handelsplattform med mikrotjenester
**Kompleksitet**: Avansert  
**Varighet**: 4-6 uker  

Design og implementer en e-handelsplattform basert på mikrotjenester:
- Flere API-tjenester (katalog, bestillinger, betalinger, brukere)
- Integrasjon av meldingskø med Service Bus
- Redis-cache for ytelsesoptimalisering
- Omfattende logging og overvåking

**Referanseeksempel**: Se [Mikrotjenestearkitektur](../../../examples/container-app/microservices) for en produksjonsklar mal og distribusjonsveiledning

**Leveranser**:
- Komplett mikrotjenestearkitektur
- Mønstre for kommunikasjon mellom tjenester
- Ytelsestesting og optimalisering
- Produksjonsklar sikkerhetsimplementering

## Vurdering og sertifisering

### Kunnskapstester

Fullfør disse vurderingene etter hver modul:

**Modul 1 Vurdering**: Grunnleggende konsepter og installasjon
- Flervalgsspørsmål om kjernekonsepter
- Praktiske installasjons- og konfigurasjonsoppgaver
- Enkel distribusjonsøvelse

**Modul 2 Vurdering**: Konfigurasjon og miljøer
- Scenarier for miljøhåndtering
- Øvelser i feilsøking av konfigurasjon
- Implementering av sikkerhetskonfigurasjon

**Modul 3 Vurdering**: Distribusjon og klargjøring
- Utfordringer i infrastrukturdesign
- Scenarier for distribusjon av flere tjenester
- Øvelser i ytelsesoptimalisering

**Modul 4 Vurdering**: Validering før distribusjon
- Casestudier i kapasitetsplanlegging
- Scenarier for kostnadsoptimalisering
- Implementering av valideringspipelines

**Modul 5 Vurdering**: Feilsøking og debugging
- Øvelser i problemdiagnostisering
- Oppgaver for implementering av overvåking
- Simuleringer av hendelseshåndtering

**Modul 6 Vurdering**: Avanserte emner
- Design av CI/CD-pipelines
- Utvikling av tilpassede maler
- Scenarier for bedriftsarkitektur

### Avsluttende prosjekt

Design og implementer en komplett løsning som demonstrerer mestring av alle konsepter:

**Krav**:
- Flerlags applikasjonsarkitektur
- Flere distribusjonsmiljøer
- Omfattende overvåking og varsling
- Implementering av sikkerhet og samsvar
- Kostnadsoptimalisering og ytelsestilpasning
- Komplett dokumentasjon og driftsmanualer

**Evalueringskriterier**:
- Teknisk implementeringskvalitet
- Dokumentasjonsfullstendighet
- Overholdelse av sikkerhet og beste praksis
- Ytelses- og kostnadsoptimalisering
- Effektivitet i feilsøking og overvåking

## Studieressurser og referanser

### Offisiell dokumentasjon
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Dokumentasjon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fellesskapsressurser
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organisasjon](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Øvingsmiljøer
- [Azure Gratis Konto](https://azure.microsoft.com/free/)
- [Azure DevOps Gratis Nivå](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Tilleggsverktøy
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Anbefalinger for studieplan

### Fulltidsstudier (8 uker)
- **Uke 1-2**: Modul 1-2 (Kom i gang, Konfigurasjon)
- **Uke 3-4**: Modul 3-4 (Distribusjon, Validering før distribusjon)
- **Uke 5-6**: Modul 5-6 (Feilsøking, Avanserte emner)
- **Uke 7-8**: Praktiske prosjekter og avsluttende vurdering

### Deltidsstudier (16 uker)
- **Uke 1-4**: Modul 1 (Kom i gang)
- **Uke 5-7**: Modul 2 (Konfigurasjon og miljøer)
- **Uke 8-10**: Modul 3 (Distribusjon og klargjøring)
- **Uke 11-12**: Modul 4 (Validering før distribusjon)
- **Uke 13-14**: Modul 5 (Feilsøking og debugging)
- **Uke 15-16**: Modul 6 (Avanserte emner og vurdering)

---

## Fremdriftssporing og vurderingsrammeverk

### Kapittel fullføringssjekkliste

Spor fremdriften din gjennom hvert kapittel med disse målbare resultatene:

#### 📚 Kapittel 1: Grunnlag & Hurtigstart
- [ ] **Installasjon fullført**: AZD installert og verifisert på plattformen din
- [ ] **Første distribusjon**: Vellykket distribusjon av todo-nodejs-mongo-mal
- [ ] **Miljøoppsett**: Konfigurert første miljøvariabler
- [ ] **Ressursnavigering**: Utforsket distribuerte ressurser i Azure-portalen
- [ ] **Kommandoferdighet**: Komfortabel med grunnleggende AZD-kommandoer

#### 🤖 Kapittel 2: AI-First Utvikling  
- [ ] **Distribusjon av AI-mal**: Vellykket distribusjon av azure-search-openai-demo
- [ ] **RAG-implementering**: Konfigurert dokumentindeksering og gjenfinning
- [ ] **Modellkonfigurasjon**: Satt opp flere AI-modeller med ulike formål
- [ ] **AI-overvåking**: Implementert Application Insights for AI-arbeidsbelastninger
- [ ] **Ytelsesoptimalisering**: Justert AI-applikasjonens ytelse

#### ⚙️ Kapittel 3: Konfigurasjon & Autentisering
- [ ] **Oppsett av flere miljøer**: Konfigurert utvikling, staging og produksjonsmiljøer
- [ ] **Sikkerhetsimplementering**: Satt opp administrert identitetsautentisering
- [ ] **Håndtering av hemmeligheter**: Integrert Azure Key Vault for sensitiv data
- [ ] **Parameterhåndtering**: Opprettet miljøspesifikke konfigurasjoner
- [ ] **Autentiseringsferdighet**: Implementert sikre tilgangsmønstre

#### 🏗️ Kapittel 4: Infrastruktur som kode & Distribusjon
- [ ] **Opprettelse av tilpasset mal**: Bygget en mal for applikasjoner med flere tjenester
- [ ] **Bicep-ferdighet**: Opprettet modulære, gjenbrukbare infrastrukturkomponenter
- [ ] **Distribusjonsautomatisering**: Implementert før/etter distribusjonshooks
- [ ] **Arkitekturdesign**: Distribuert kompleks mikrotjenestearkitektur
- [ ] **Maloptimalisering**: Optimalisert maler for ytelse og kostnad

#### 🎯 Kapittel 5: Multi-Agent AI-løsninger
- [ ] **Distribusjon av detaljhandelsløsning**: Distribuert komplett multi-agent detaljhandelsscenario
- [ ] **Tilpasning av agenter**: Endret atferd for kunde- og lageragenter
- [ ] **Skalering av arkitektur**: Implementert lastbalansering og autoskalering
- [ ] **Produksjonsovervåking**: Satt opp omfattende overvåking og varsling
- [ ] **Ytelsesjustering**: Optimalisert ytelsen til multi-agent systemet

#### 🔍 Kapittel 6: Validering & Planlegging før distribusjon
- [ ] **Kapasitetsanalyse**: Analysert ressursbehov for applikasjoner
- [ ] **SKU-optimalisering**: Valgt kostnadseffektive tjenestenivåer
- [ ] **Automatisering av validering**: Implementert skript for kontroller før distribusjon
- [ ] **Kostnadsplanlegging**: Opprettet kostnadsestimater og budsjetter for distribusjon
- [ ] **Risikovurdering**: Identifisert og redusert distribusjonsrisikoer

#### 🚨 Kapittel 7: Feilsøking & Debugging
- [ ] **Diagnostiske ferdigheter**: Vellykket feilsøkt med vilje ødelagte distribusjoner
- [ ] **Logganalyse**: Brukt Azure Monitor og Application Insights effektivt
- [ ] **Ytelsesjustering**: Optimalisert tregt presterende applikasjoner
- [ ] **Gjenopprettingsprosedyrer**: Implementert backup og katastrofegjenoppretting
- [ ] **Overvåkingsoppsett**: Opprettet proaktiv overvåking og varsling

#### 🏢 Kapittel 8: Produksjon & Bedriftsmønstre
- [ ] **Sikkerhet på bedriftsnivå**: Implementert omfattende sikkerhetsmønstre
- [ ] **Styringsrammeverk**: Satt opp Azure Policy og ressursstyring
- [ ] **Avansert overvåking**: Opprettet dashbord og automatisert varsling
- [ ] **CI/CD-integrasjon**: Bygget automatiserte distribusjonspipelines
- [ ] **Samsvarsimplementering**: Oppfylt krav til samsvar på bedriftsnivå

### Læringsplan og milepæler

#### Uke 1-2: Bygge grunnlag
- **Milepæl**: Distribuer første AI-applikasjon ved hjelp av AZD
- **Validering**: Fungerende applikasjon tilgjengelig via offentlig URL
- **Ferdigheter**: Grunnleggende AZD-arbeidsflyter og AI-tjenesteintegrasjon

#### Uke 3-4: Mestre konfigurasjon
- **Milepæl**: Distribusjon til flere miljøer med sikker autentisering
- **Validering**: Samme applikasjon distribuert til utvikling/staging/produksjon
- **Ferdigheter**: Miljøhåndtering og sikkerhetsimplementering

#### Uke 5-6: Infrastrukturkompetanse
- **Milepæl**: Tilpasset mal for kompleks applikasjon med flere tjenester
- **Validering**: Gjenbrukbar mal distribuert av et annet teammedlem
- **Ferdigheter**: Bicep-ferdighet og infrastrukturautomatisering

#### Uke 7-8: Avansert AI-implementering
- **Milepæl**: Produksjonsklar multi-agent AI-løsning
- **Validering**: System som håndterer reell belastning med overvåking
- **Ferdigheter**: Orkestrering av multi-agenter og ytelsesoptimalisering

#### Uke 9-10: Produksjonsklarhet
- **Milepæl**: Distribusjon på bedriftsnivå med full samsvar
- **Validering**: Består sikkerhetsgjennomgang og kostnadsoptimaliseringsrevisjon
- **Ferdigheter**: Styring, overvåking og CI/CD-integrasjon

### Vurdering og sertifisering

#### Metoder for kunnskapsvalider
5. **Fellesskapsbidrag**: Del maler eller forbedringer

#### Resultater for profesjonell utvikling
- **Porteføljeprosjekter**: 8 produksjonsklare distribusjoner
- **Tekniske ferdigheter**: Bransjestandard AZD- og AI-distribusjonsekspertise
- **Problemløsningsevner**: Selvstendig feilsøking og optimalisering
- **Fellesskapsanerkjennelse**: Aktiv deltakelse i Azure-utviklerfellesskapet
- **Karriereutvikling**: Ferdigheter direkte anvendelige for sky- og AI-roller

#### Suksessmålinger
- **Distribusjonssuksessrate**: >95% vellykkede distribusjoner
- **Feilsøkingstid**: <30 minutter for vanlige problemer
- **Ytelsesoptimalisering**: Påvisbare forbedringer i kostnad og ytelse
- **Sikkerhetssamsvar**: Alle distribusjoner oppfyller bedriftens sikkerhetsstandarder
- **Kunnskapsoverføring**: Evne til å veilede andre utviklere

### Kontinuerlig læring og fellesskapsengasjement

#### Hold deg oppdatert
- **Azure-oppdateringer**: Følg utgivelsesnotater for Azure Developer CLI
- **Fellesskapsarrangementer**: Delta på Azure- og AI-utviklerarrangementer
- **Dokumentasjon**: Bidra til fellesskapsdokumentasjon og eksempler
- **Tilbakemeldingssløyfe**: Gi tilbakemelding på kursinnhold og Azure-tjenester

#### Karriereutvikling
- **Profesjonelt nettverk**: Knytt kontakter med Azure- og AI-eksperter
- **Foredragsmuligheter**: Presenter lærdom på konferanser eller meetups
- **Åpen kildekode-bidrag**: Bidra til AZD-maler og verktøy
- **Mentorskap**: Veilede andre utviklere i deres AZD-læringsreise

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../README.md)
- **📖 Start læringen**: [Kapittel 1: Grunnlag & Hurtigstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: Følg din utvikling gjennom det omfattende 8-kapittels læringssystemet
- **🤝 Fellesskap**: [Azure Discord](https://discord.gg/microsoft-azure) for støtte og diskusjon

**Fremdriftssporing for studier**: Bruk denne strukturerte veiledningen for å mestre Azure Developer CLI gjennom progressiv, praktisk læring med målbare resultater og fordeler for profesjonell utvikling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->