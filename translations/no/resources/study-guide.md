# Studieguide - Omfattende Læringsmål

**Navigering i Læringsstien**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Start Å Lære**: [Kapittel 1: Grunnlag & Rask Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: [Kursfullføring](../README.md#-course-completion--certification)

## Introduksjon

Denne omfattende studieguider gir strukturerte læringsmål, viktige konsepter, øvelser og vurderingsmateriale for å hjelpe deg med å mestre Azure Developer CLI (azd). Bruk denne guiden for å spore fremgangen din og sikre at du har dekket alle viktige emner.

## Læringsmål

Ved å fullføre denne studieguider vil du:
- Mestre alle grunnleggende og avanserte konsepter i Azure Developer CLI
- Utvikle praktiske ferdigheter i å distribuere og administrere Azure-applikasjoner
- Bygge selvtillit i å feilsøke og optimalisere distribusjoner
- Forstå produksjonsklare distribusjonspraksiser og sikkerhetshensyn

## Læringsresultater

Etter å ha fullført alle seksjoner i denne studieguider, vil du kunne:
- Designe, distribuere og administrere komplette applikasjonsarkitekturer ved bruk av azd
- Implementere omfattende overvåking, sikkerhets- og kostnadsoptimaliseringsstrategier
- Feilsøke komplekse distribusjonsproblemer på egen hånd
- Lage tilpassede maler og bidra til azd-fellesskapet

## 8-Kapittlers læringsstruktur

### Kapittel 1: Grunnlag & Rask Start (Uke 1)
**Varighet**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå kjernebegreper og terminologi i Azure Developer CLI
- Lykkes med å installere og konfigurere AZD på din utviklingsplattform
- Distribuere din første applikasjon ved bruk av en eksisterende mal
- Navigere effektivt i AZD kommandolinjegrensesnitt

#### Nøkkelkonsepter å mestre
- AZD prosjektstruktur og komponenter (azure.yaml, infra/, src/)
- Malbaserte distribusjonsarbeidsflyter
- Miljøkonfigurasjonsgrunnlag
- Ressursgruppe og abonnementshåndtering

#### Praktiske øvelser
1. **Installering Verifisering**: Installer AZD og verifiser med `azd version`
2. **Første Distribusjon**: Distribuer todo-nodejs-mongo malen vellykket
3. **Miljøoppsett**: Konfigurer dine første miljøvariabler
4. **Ressursutforskning**: Naviger distribuerte ressurser i Azure-portalen

#### Vurderingsspørsmål
- Hva er kjernekonponentene i et AZD-prosjekt?
- Hvordan initialiserer du et nytt prosjekt fra en mal?
- Hva er forskjellen mellom `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapittel 2: AI-First Utvikling (Uke 2)
**Varighet**: 1-2 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbeidsflyter
- Distribuere og konfigurere AI-drevne applikasjoner
- Forstå implementasjonsmønstre for RAG (Retrieval-Augmented Generation)
- Administrere AI-modell distribusjoner og skalering

#### Nøkkelkonsepter å mestre
- Microsoft Foundry Models tjenesteintegrasjon og API-administrasjon
- AI Search-konfigurasjon og vektorindeksering
- Modell distribusjonsstrategier og kapasetsplanlegging
- AI-applikasjonsovervåking og ytelsesoptimalisering

#### Praktiske øvelser
1. **AI Chat Distribusjon**: Distribuer azure-search-openai-demo malen
2. **RAG Implementasjon**: Konfigurer dokumentindeksering og gjenfinning
3. **Modellkonfigurasjon**: Sett opp flere AI-modeller med ulike formål
4. **AI Overvåking**: Implementer Application Insights for AI arbeidslaster

#### Vurderingsspørsmål
- Hvordan konfigurerer du Microsoft Foundry Models tjenester i en AZD-mal?
- Hva er de viktigste komponentene i en RAG-arkitektur?
- Hvordan administrerer du kapasitet og skalering for AI-modeller?
- Hvilke overvåkingsmetrikker er viktige for AI-applikasjoner?

---

### Kapittel 3: Konfigurasjon & Autentisering (Uke 3)
**Varighet**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre miljøkonfigurasjon og administrasjonsstrategier
- Implementere sikre autentiseringsmønstre og administrert identitet
- Organisere ressurser med riktige navnekonvensjoner
- Konfigurere distribusjoner for flere miljøer (dev, staging, prod)

#### Nøkkelkonsepter å mestre
- Miljøhierarki og konfigurasjonspresedens
- Administrert identitet og service-prinsipp autentisering
- Key Vault-integrasjon for hemmelighetshåndtering
- Miljøspesifikk parameterhåndtering

#### Praktiske øvelser
1. **Multi-miljøoppsett**: Konfigurer dev, staging og prod miljøer
2. **Sikkerhetskonfigurasjon**: Implementer administrert identitet autentisering
3. **Hemmelighetshåndtering**: Integrer Azure Key Vault for sensitive data
4. **Parameteradministrasjon**: Lag konfigurasjoner for hvert miljø

#### Vurderingsspørsmål
- Hvordan konfigurerer du forskjellige miljøer med AZD?
- Hva er fordelene med å bruke administrert identitet fremfor service-principals?
- Hvordan håndterer du applikasjonshemmeligheter sikkert?
- Hva er konfigurasjonshierarkiet i AZD?

---

### Kapittel 4: Infrastruktur som kode & Distribusjon (Uke 4-5)
**Varighet**: 1-1.5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Lage og tilpasse Bicep-infrastrukturmaler
- Implementere avanserte distribusjonsmønstre og arbeidsflyter
- Forstå ressursprovisjoneringsstrategier
- Designe skalerbare multi-tjeneste arkitekturer

- Distribuere containeriserte applikasjoner ved bruk av Azure Container Apps og AZD


#### Nøkkelkonsepter å mestre
- Bicep-malstruktur og beste praksis
- Ressursavhengigheter og distribusjonsrekkefølge
- Parameterfiler og malmodularitet
- Tilpassede kroker og distribusjonsautomatisering
- Distribusjonsmønstre for container-apper (rask start, produksjon, mikrotjenester)

#### Praktiske øvelser
1. **Tilpasset malopprettelse**: Bygg en mal for en multi-tjeneste applikasjon
2. **Bicep-mestrering**: Lag modulære, gjenbrukbare infrastrukturbestanddeler
3. **Distribusjonsautomatisering**: Implementer pre/post distribusjonskroker
4. **Arkitekturdesign**: Distribuer kompleks mikrotjenestearkitektur
5. **Container App Distribusjon**: Distribuer eksemplene [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) ved bruk av AZD

#### Vurderingsspørsmål
- Hvordan lager du tilpassede Bicep-maler for AZD?
- Hva er beste praksis for organisering av infrastrukturkode?
- Hvordan håndterer du ressursavhengigheter i maler?
- Hvilke distribusjonsmønstre støtter null nedetid ved oppdateringer?

---

### Kapittel 5: Multi-Agent AI-Løsninger (Uke 6-7)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agent-koordinasjon og kommunikasjon
- Distribuere produksjonsklare AI-løsninger med overvåking
- Forstå agent-spesialisering og arbeidsflytmønstre
- Integrere containeriserte mikrotjenester som del av multi-agent løsninger

#### Nøkkelkonsepter å mestre
- Multi-agent arkitekturmønstre og designprinsipper
- Agentkommunikasjonsprotokoller og dataflyt
- Lastbalansering og skaleringsstrategier for AI-agenter
- Produksjonsovervåking for multi-agent systemer
- Tjeneste-til-tjeneste kommunikasjon i containeriserte miljøer

#### Praktiske øvelser
1. **Retail Arkitekturgjennomgang**: Analyser retail-malens blueprint og identifiser hvilke applikasjonskomponenter som må implementeres før distribusjon
2. **Agent-tilpasning**: Endre atferden til Customer og Inventory-agentene
3. **Arkitektur Skalering**: Implementer lastbalansering og auto-skalering
4. **Produksjonsovervåking**: Sett opp omfattende overvåking og varsling
5. **Mikrotjenesteintegrasjon**: Utvid [Microservices Architecture](../../../examples/container-app/microservices) eksemplet for å støtte agent-baserte arbeidsflyter

#### Vurderingsspørsmål
- Hvordan designer du effektive multi-agent kommunikasjonsmønstre?
- Hva er nøkkelhensyn for skalering av AI-agent arbeidsmengder?
- Hvordan overvåker og feilsøker du multi-agent AI-systemer?
- Hvilke produksjonsmønstre sikrer pålitelighet for AI-agenter?

---

### Kapittel 6: Validering & Planlegging Før Distribusjon (Uke 8)
**Varighet**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utføre omfattende kapasitetsplanlegging og ressursvalidering
- Velge optimale Azure SKUer for kostnadseffektivitet
- Implementere automatiserte pre-flight sjekker og validering
- Planlegge distribusjoner med kostnadsoptimaliseringsstrategier

#### Nøkkelkonsepter å mestre
- Azure ressurskvoter og kapasitetsbegrensninger
- Viktige kriterier for SKU-valg og kostnadsoptimalisering
- Automatiserte valideringsskript og testing
- Distribusjonsplanlegging og risikovurdering

#### Praktiske øvelser
1. **Kapasitetsanalyse**: Analyser ressurskrav for applikasjonene dine
2. **SKU-optimalisering**: Sammenlign og velg kostnadseffektive tjenestenivåer
3. **Valideringsautomatisering**: Implementer pre-distribusjons sjekkskript
4. **Kostnadsplanlegging**: Lag anslag og budsjetter for distribusjonskostnader

#### Vurderingsspørsmål
- Hvordan validerer du Azure-kapasitet før distribusjon?
- Hvilke faktorer påvirker SKU-valg?
- Hvordan automatiserer du pre-distribusjonsvalidering?
- Hvilke strategier hjelper med å optimalisere distribusjonskostnader?

---

### Kapittel 7: Feilsøking & Debugging (Uke 9)
**Varighet**: 1-1.5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utvikle systematiske feilsøkingsmetoder for AZD-distribusjoner
- Løse vanlige distribusjons- og konfigurasjonsproblemer
- Feilsøke AI-spesifikke problemer og ytelsesutfordringer
- Implementere overvåking og varsling for proaktiv feildeteksjon

#### Nøkkelkonsepter å mestre
- Diagnostikkteknikker og loggføringsstrategier
- Vanlige feil mønstre og deres løsninger
- Ytelsesovervåking og optimalisering
- Hendelsesrespons og gjenopprettingsprosedyrer

#### Praktiske øvelser
1. **Diagnostiske ferdigheter**: Øv på bevisst ødelagte distribusjoner
2. **Logganalyse**: Bruk Azure Monitor og Application Insights effektivt
3. **Ytelsesjustering**: Optimaliser tregt ytende applikasjoner
4. **Gjenopprettingsprosedyrer**: Implementer backup og katastrofegjenoppretting

#### Vurderingsspørsmål
- Hva er de vanligste feilene ved AZD-distribusjon?
- Hvordan feilsøker du autentiserings- og tillatelsesproblemer?
- Hvilke overvåkingsstrategier hjelper med å forhindre produksjonsproblemer?
- Hvordan optimaliserer du applikasjonsytelse i Azure?

---

### Kapittel 8: Produksjon & Enterprise Mønstre (Uke 10-11)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere distribusjonstrategier for enterprise-nivå
- Designe sikkerhetsmønstre og samsvarsrammeverk
- Etablere overvåking, styring og kostnadshåndtering
- Lage skalerbare CI/CD pipelines med AZD-integrasjon
- Anvende beste praksis for produksjonsdistribusjon av container-apper (sikkerhet, overvåking, kostnader, CI/CD)

#### Nøkkelkonsepter å mestre
- Enterprise sikkerhet og samsvarskrav
- Styringsrammeverk og policyimplementering
- Avansert overvåking og kostnadshåndtering
- CI/CD-integrasjon og automatiserte distribusjonspipelines
- Blue-green og canary distribusjonstrategier for containeriserte arbeidslaster

#### Praktiske øvelser
1. **Enterprise Sikkerhet**: Implementer omfattende sikkerhetsmønstre
2. **Styringsrammeverk**: Sett opp Azure Policy og ressursadministrasjon
3. **Avansert Overvåking**: Lag dashboards og automatisert varslingssystem
4. **CI/CD Integrasjon**: Bygg automatiserte distribusjonspipelines
5. **Produksjons Container-apper**: Bruk sikkerhet, overvåking og kostnadsoptimalisering på [Mikrotjenestearkitektur](../../../examples/container-app/microservices) eksemplet

#### Vurderingsspørsmål
- Hvordan implementerer du bedriftsikkerhet i AZD-distribusjoner?
- Hvilke styringsmønstre sikrer overholdelse og kostnadskontroll?
- Hvordan designer du skalerbar overvåking for produksjonssystemer?
- Hvilke CI/CD-mønstre fungerer best med AZD-arbeidsflyter?

#### Læringsmål
- Forstå Azure Developer CLI-grunnleggende og kjernebegreper
- Installere og konfigurere azd på utviklingsmiljøet ditt med suksess
- Fullføre din første distribusjon ved bruk av en eksisterende mal
- Navigere i azd-prosjektstrukturen og forstå nøkkelkomponenter

#### Nøkkelbegreper å mestre
- Maler, miljøer og tjenester
- azure.yaml konfigurasjonsstruktur
- Grunnleggende azd-kommandoer (init, up, down, deploy)
- Infrastruktur som kode-prinsipper
- Azure autentisering og autorisasjon

#### Øvelser

**Øvelse 1.1: Installasjon og Oppsett**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første Distribusjon**
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

#### Egenvurderingsspørsmål
1. Hva er de tre kjernebegrepene i azd-arkitektur?
2. Hva er hensikten med azure.yaml-filen?
3. Hvordan hjelper miljøer med å administrere forskjellige distribusjonsmål?
4. Hvilke autentiseringsmetoder kan brukes med azd?
5. Hva skjer når du kjører `azd up` for første gang?

---

## Fremdriftssporing og vurderingsrammeverk
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

#### Egenvurderingsspørsmål
1. Hvordan håndterer azd prioritering av miljøvariabler?
2. Hva er distribusjonshooks og når bør du bruke dem?
3. Hvordan konfigurerer du forskjellige SKUer for ulike miljøer?
4. Hva er sikkerhetsimplikasjonene ved forskjellige autentiseringsmetoder?
5. Hvordan håndterer du hemmeligheter og sensitiv konfigurasjonsdata?

### Modul 3: Distribusjon og provisjonering (Uke 4)

#### Læringsmål
- Mestre distribusjonsarbeidsflyter og beste praksiser
- Forstå Infrastruktur som kode med Bicep-maler
- Implementere komplekse multi-tjenestearkitekturer
- Optimalisere distribusjonens ytelse og pålitelighet

#### Nøkkelbegreper å mestre
- Bicep-malstruktur og moduler
- Ressursavhengigheter og rekkefølge
- Distribusjonsstrategier (blå-grønn, rullende oppdateringer)
- Distribusjoner over flere regioner
- Database-migrasjoner og datahåndtering

#### Øvelser

**Øvelse 3.1: Tilpasset Infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Multi-tjenesteapplikasjon**
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
2. Hvordan håndterer du database-migrasjoner i azd-distribusjoner?
3. Hvilke strategier finnes for distribusjoner uten nedetid?
4. Hvordan håndterer du avhengigheter mellom tjenester?
5. Hva bør tas i betraktning ved distribusjoner over flere regioner?

### Modul 4: Validering før distribusjon (Uke 5)

#### Læringsmål
- Implementer omfattende forhåndssjekker før distribusjon
- Mestre kapasitetsplanlegging og ressursvalidering
- Forstå SKU-valg og kostnadsoptimalisering
- Bygg automatiserte valideringspipeliner

#### Nøkkelkonsepter å mestre
- Azure-ressurskvoter og grenser
- Kriterier for valg av SKU og kostnadsmessige konsekvenser
- Automatiserte valideringsskript og verktøy
- Metodologier for kapasitetsplanlegging
- Ytelsestesting og optimalisering

#### Øvelser

**Øvelse 4.1: Kapasitetsplanlegging**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Øvelse 4.2: Forhåndsvalidering**
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

#### Selv-evalueringsspørsmål
1. Hvilke faktorer bør påvirke beslutninger om valg av SKU?
2. Hvordan validerer du tilgjengeligheten av Azure-ressurser før distribusjon?
3. Hva er hovedkomponentene i et forhåndssjekksystem?
4. Hvordan estimerer og kontrollerer du distribusjonskostnader?
5. Hvilken overvåking er essensiell for kapasitetsplanlegging?

### Modul 5: Feilsøking og debugging (Uke 6)

#### Læringsmål
- Mestre systematiske feilsøkingsmetoder
- Utvikle ekspertise i debugging av komplekse distribusjonsproblemer
- Implementere omfattende overvåking og varsling
- Bygge prosedyrer for hendelseshåndtering og gjenoppretting

#### Nøkkelkonsepter å mestre
- Vanlige mønstre for distribusjonsfeil
- Logganalyse og korrelasjonsteknikker
- Ytelsesovervåking og optimalisering
- Oppdagelse og respons på sikkerhetshendelser
- Katastrofegjenoppretting og forretningskontinuitet

#### Øvelser

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

#### Selv-evalueringsspørsmål
1. Hva er den systematiske tilnærmingen til feilsøking av azd-distribusjoner?
2. Hvordan korrelerer du logger på tvers av flere tjenester og ressurser?
3. Hvilke overvåkingsmetrikker er mest kritiske for tidlig problemoppdagelse?
4. Hvordan implementerer du effektive prosedyrer for katastrofegjenoppretting?
5. Hva er hovedkomponentene i en hendelseshåndteringsplan?

### Modul 6: Avanserte temaer og beste praksis (Uke 7-8)

#### Læringsmål
- Implementere distribusjonsmønstre på bedriftsnivå
- Mestre CI/CD-integrasjon og automatisering
- Utvikle tilpassede maler og bidra til fellesskapet
- Forstå avanserte sikkerhets- og samsvarskrav

#### Nøkkelkonsepter å mestre
- CI/CD pipeline-integrasjonsmønstre
- Utvikling og distribusjon av tilpassede maler
- Bedriftsstyring og samsvar
- Avanserte nettverks- og sikkerhetskonfigurasjoner
- Ytelsesoptimalisering og kostnadsstyring

#### Øvelser

**Øvelse 6.1: CI/CD-integrasjon**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Øvelse 6.2: Tilpasset malutvikling**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Bedriftsimplementering**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selv-evalueringsspørsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbeidsflyter?
2. Hva er viktige hensyn ved utvikling av tilpassede maler?
3. Hvordan implementerer du styring og samsvar i azd-distribusjoner?
4. Hva er beste praksis for distribusjoner i bedriftsstørrelse?
5. Hvordan kan du bidra effektivt til azd-fellesskapet?

## Praktiske prosjekter

### Prosjekt 1: Personlig porteføljenettside
**Kompleksitet**: Nybegynner  
**Varighet**: 1-2 uker

Bygg og distribuer en personlig porteføljenettside ved hjelp av:
- Statisk nettside-hosting med Azure Storage
- Tilpasset domene-konfigurasjon
- CDN-integrasjon for global ytelse
- Automatisert distribusjonspipeline

**Leveranser**:
- Velfungerende nettside distribuert på Azure
- Tilpasset azd-mal for porteføljedistribusjoner
- Dokumentasjon av distribusjonsprosessen
- Kostnadsanalyse og optimaliseringsanbefalinger

### Prosjekt 2: Oppgaveadministrasjonsapplikasjon
**Kompleksitet**: Middels  
**Varighet**: 2-3 uker

Lag en fullstack oppgaveadministrasjonsapplikasjon med:
- React frontend distribuert til App Service
- Node.js API-backend med autentisering
- PostgreSQL database med migrasjoner
- Application Insights-overvåking

**Leveranser**:
- Fullstendig applikasjon med brukerpålogging
- Databaseskjema og migrasjonsskript
- Overvåkingsdashbord og varselsregler
- Distribusjonskonfigurasjon for flere miljøer

### Prosjekt 3: Mikrotjeneste-basert e-handelsplattform
**Kompleksitet**: Avansert  
**Varighet**: 4-6 uker

Design og implementer en mikrotjenestebasert e-handelsplattform:
- Flere API-tjenester (katalog, ordrer, betalinger, brukere)
- Meldingskøintegrasjon med Service Bus
- Redis-cache for ytelsesoptimalisering
- Omfattende logging og overvåking

**Referanseksempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) for en læringsprøve med to tjenester og distribusjonsguide. Køer, persistens, autentisering, betalingsbehandling og produksjonshardening er egne prosjektoppgaver.

**Leveranser**:
- Fullstendig mikrotjenestearkitektur
- Kommunikasjonsmønstre mellom tjenester
- Ytelsestesting og optimalisering
- Produksjonsklar sikkerhetsimplementering

## Vurdering og sertifisering

### Kunnskapskontroller

Fullfør disse vurderingene etter hver modul:

**Modul 1-vurdering**: Grunnleggende konsepter og installasjon
- Flervalgsoppgaver om kjernebegreper
- Praktiske installasjons- og konfigurasjonsoppgaver
- Enkel distribusjonsøvelse

**Modul 2-vurdering**: Konfigurasjon og miljøer
- Scenarioer for miljøhåndtering
- Feilsøkingsøvelser innen konfigurasjon
- Implementering av sikkerhetskonfigurasjon

**Modul 3-vurdering**: Distribusjon og provisjonering
- Utfordringer ved infrastrukturdesign
- Scenarioer for distribusjon av flere tjenester
- Øvelser i ytelsesoptimalisering

**Modul 4-vurdering**: Forhåndsvalidering før distribusjon
- Case-studier for kapasitetsplanlegging
- Scenarioer for kostnadsoptimalisering
- Implementering av valideringspipeline

**Modul 5-vurdering**: Feilsøking og debugging
- Øvelser i feildiagnose
- Oppgaver for implementering av overvåking
- Simuleringer av hendelseshåndtering

**Modul 6-vurdering**: Avanserte temaer
- Design av CI/CD-pipeline
- Utvikling av tilpassede maler
- Scenarioer for bedriftsarkitektur

### Avsluttende hovedprosjekt

Design og implementer en komplett løsning som demonstrerer mestring av alle konsepter:

**Krav**:
- Flerlags applikasjonsarkitektur
- Flere distribusjonsmiljøer
- Omfattende overvåking og varsling
- Implementering av sikkerhet og samsvar
- Kostnadsoptimalisering og ytelsestuning
- Fullstendig dokumentasjon og driftsrutiner

**Evalueringskriterier**:
- Kvalitet på teknisk implementering
- Dokumentasjonens fullstendighet
- Overholdelse av sikkerhet og beste praksis
- Ytelse og kostnadsoptimalisering
- Effektivitet i feilsøking og overvåking

## Studieressurser og referanser

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

### Ekstra verktøy
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Studieplananbefalinger

### Heltidsstudium (8 uker)
- **Uker 1-2**: Modul 1-2 (Kom i gang, konfigurasjon)
- **Uker 3-4**: Modul 3-4 (Distribusjon, forhåndsvalidering)
- **Uker 5-6**: Modul 5-6 (Feilsøking, avanserte temaer)
- **Uker 7-8**: Praktiske prosjekter og avsluttende vurdering

### Deltidsstudium (16 uker)
- **Uker 1-4**: Modul 1 (Kom i gang)
- **Uker 5-7**: Modul 2 (Konfigurasjon og miljøer)
- **Uker 8-10**: Modul 3 (Distribusjon og provisjonering)
- **Uker 11-12**: Modul 4 (Forhåndsvalidering)
- **Uker 13-14**: Modul 5 (Feilsøking og debugging)
- **Uker 15-16**: Modul 6 (Avanserte temaer og vurdering)

---

## Fremdriftssporing og vurderingsrammeverk

### Avkrysningsliste for kapittelfullføring

Følg fremdriften din gjennom hvert kapittel med disse målbare resultatene:

#### 📚 Kapittel 1: Grunnlag og hurtigstart
- [ ] **Installasjon fullført**: AZD installert og verifisert på din plattform
- [ ] **Første distribusjon**: Lyktes med distribusjon av todo-nodejs-mongo-mal
- [ ] **Miljøoppsett**: Konfigurert første miljøvariabler
- [ ] **Ressursnavigasjon**: Utforsket distribuerte ressurser i Azure-portalen
- [ ] **Kommandomesterskap**: Komfortabel med grunnleggende AZD-kommandoer

#### 🤖 Kapittel 2: AI-Først-utvikling  
- [ ] **AI-maldistrubusjon**: Distribuerte azure-search-openai-demo vellykket
- [ ] **RAG-implementering**: Konfigurerte dokumentindeksering og søk
- [ ] **Modellkonfigurasjon**: Satt opp flere AI-modeller med ulike formål
- [ ] **AI-overvåking**: Implementerte Application Insights for AI-arbeidsbelastninger
- [ ] **Ytelsesoptimalisering**: Tunet AI-applikasjonens ytelse

#### ⚙️ Kapittel 3: Konfigurasjon og autentisering
- [ ] **Multi-miljøoppsett**: Konfigurert dev-, staging- og produksjonsmiljøer
- [ ] **Sikkerhetsimplementering**: Satt opp autentisering med administrert identitet
- [ ] **Håndtering av hemmeligheter**: Integrert Azure Key Vault for sensitiv data
- [ ] **Parameterhåndtering**: Opprettet miljøspesifikke konfigurasjoner
- [ ] **Mesterskap i autentisering**: Implementert sikre tilgangsmønstre

#### 🏗️ Kapittel 4: Infrastruktur som kode og distribusjon
- [ ] **Tilpasset malopprettelse**: Bygget en mal for fler-tjeneste applikasjon
- [ ] **Bicep-mesterskap**: Opprettet modulære, gjenbrukbare infrastrukturkomponenter
- [ ] **Distribusjonsautomatisering**: Implementerte forhånds- og etterdistribusjons-hooks
- [ ] **Arkitekturdesign**: Distribuert kompleks mikrotjenestearkitektur
- [ ] **Maloptimalisering**: Optimaliserte maler for ytelse og kostnad

#### 🎯 Kapittel 5: Multi-agent AI-løsninger
- [ ] **Varehandelarkitekturgjennomgang**: Identifiserte manglende applikasjonskomponenter og planla implementering og validering
- [ ] **Agenttilpasning**: Endret atferd for kunde- og lageragenter
- [ ] **Arkitektur skalering**: Implementerte lastbalansering og automatisk skalering
- [ ] **Produksjonsovervåking**: Satt opp omfattende overvåking og varsling
- [ ] **Ytelsestuning**: Optimaliserte ytelsen til multi-agent systemet

#### 🔍 Kapittel 6: Forhåndsvalidering og planlegging før distribusjon
- [ ] **Kapasitetsanalyse**: Analyserte ressursbehov for applikasjoner
- [ ] **SKU-optimalisering**: Valgte kostnadseffektive servicelag
- [ ] **Valideringsautomatisering**: Implementerte skript for forhåndssjekk før distribusjon
- [ ] **Kostnadsplanlegging**: Laget estimater og budsjetter for distribusjonskostnader
- [ ] **Risikovurdering**: Identifiserte og reduserte distribusjonsrisikoer

#### 🚨 Kapittel 7: Feilsøking og debugging
- [ ] **Diagnostiske ferdigheter**: Lyktes med debugging av tilsiktet feilaktige distribusjoner
- [ ] **Logganalyse**: Brukte Azure Monitor og Application Insights effektivt
- [ ] **Ytelsestuning**: Optimaliserte applikasjoner med lav ytelse
- [ ] **Gjenopprettingsprosedyrer**: Implementerte backup og katastrofegjenoppretting
- [ ] **Overvåkingsoppsett**: Opprettet proaktiv overvåking og varsling

#### 🏢 Kapittel 8: Produksjons- og bedriftsmønstre
- [ ] **Bedriftssikkerhet**: Implementerte omfattende sikkerhetsmønstre
- [ ] **Styringsrammeverk**: Satt opp Azure Policy og ressursadministrasjon
- [ ] **Avansert overvåking**: Opprettet dashbord og automatisert varsling
- [ ] **CI/CD-integrasjon**: Bygget automatiserte distribusjonspipeliner
- [ ] **Samsvarsimplementering**: Oppnådd samsvarskrav for bedrifter

### Læringsplan og milepæler

#### Uke 1-2: Grunnlagsbygging
- **Milepæl**: Distribuer første AI-applikasjon med AZD
- **Validering**: Funksjonell applikasjon tilgjengelig via offentlig URL
- **Ferdigheter**: Grunnleggende AZD-arbeidsflyter og AI-tjenesteintegrasjon

#### Uke 3-4: Konfigurasjonsmestring
- **Milepæl**: Distribusjon til flere miljøer med sikker autentisering
- **Validering**: Samme applikasjon distribuert til dev/staging/prod
- **Ferdigheter**: Miljøhåndtering og sikkerhetsimplementering

#### Uke 5-6: Infrastrukturkompetanse
- **Milepæl**: Tilpasset mal for kompleks fler-tjeneste applikasjon
- **Validering**: Gjenbrukbar mal distribuert av et annet teammedlem
- **Ferdigheter**: Bicep-mesterskap og infrastrukturautomatisering

#### Uke 7-8: Avansert AI-implementering
- **Milepæl**: Produksjonsklar multi-agent AI-løsning
- **Validering**: System som håndterer reell belastning med overvåking
- **Ferdigheter**: Orkestrering av multi-agent systemer og ytelsesoptimalisering

#### Uke 9-10: Produksjonsberedskap
- **Milepæl**: Distribusjon på bedriftsnivå med full samsvar
- **Validering**: Bestått sikkerhetsgjennomgang og kostnadsoptimaliseringsrevisjon
- **Ferdigheter**: Styring, overvåking og CI/CD-integrasjon

### Vurdering og sertifisering

#### Metoder for kunnskapsvalidering
1. **Praktiske distribusjoner**: Funksjonelle applikasjoner for hvert kapittel
2. **Kodegjennomganger**: Vurdering av mal- og konfigurasjonskvalitet
3. **Problemløsning**: Feilsøkingsscenarioer og løsninger
4. **Peer Teaching**: Forklare konsepter til andre studenter
5. **Fellesskapsbidrag**: Deling av maler eller forbedringer

#### Resultater innen faglig utvikling
- **Porteføljeprosjekter**: Læringsdistribusjoner og arkitekturoppgaver; produksjonsberedskap krever egen implementering og gjennomgang
- **Tekniske ferdigheter**: Bransjestandard AZD og AI-distribusjonsekspertise
- **Problemløsningsevner**: Selvstendig feilsøking og optimalisering
- **Fellesskapsanerkjennelse**: Aktiv deltakelse i Azure-utviklerfellesskapet
- **Karriereutvikling**: Ferdigheter direkte anvendelige i sky- og AI-roller

#### Suksessmål
- **UtplasseringssuKsessrate**: >95 % vellykkede utplasseringer
- **Feilsøkingstid**: <30 minutter for vanlige problemer
- **Ytelsesoptimalisering**: Påviselige forbedringer i kostnad og ytelse
- **Sikkerhetsgjennomgang**: Dokumenter kontroller og gjenværende gap mot organisasjonens krav; kursfullføring sertifiserer ikke samsvar
- **Kunnskapsoverføring**: Evne til å veilede andre utviklere

### Kontinuerlig læring og samfunnsengasjement

#### Hold deg oppdatert
- **Azure-oppdateringer**: Følg Azure Developer CLI-utgivelsesnotater
- **Samfunnsarrangementer**: Delta på Azure- og AI-utviklerarrangementer
- **Dokumentasjon**: Bidra til dokumentasjon og eksempler i fellesskapet
- **Tilbakemeldingssløyfe**: Gi tilbakemelding på kursinnhold og Azure-tjenester

#### Karriereutvikling
- **Profesjonelt nettverk**: Knytt kontakter med Azure- og AI-eksperter
- **Tale muligheter**: Presenter læringer på konferanser eller møter
- **Bidrag til åpen kildekode**: Bidra til AZD-maler og verktøy
- **Mentoring**: Veilede andre utviklere i deres AZD-læringsreise

---

**Kapittelnavigasjon:**
- **📚 Kurs hjem**: [AZD For Beginners](../README.md)
- **📖 Start læring**: [Kapittel 1: Grunnlag & Rask start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: Følg din fremgang gjennom det omfattende 8-kapitlers læringssystemet
- **🤝 Fellesskap**: [Azure Discord](https://discord.gg/microsoft-azure) for støtte og diskusjon

**Studieprogresjonssporing**: Bruk denne strukturerte veiledningen for å mestre Azure Developer CLI gjennom progressiv, praktisk læring med målbare resultater og fordeler for profesjonell utvikling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->