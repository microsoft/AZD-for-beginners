# Studieguide - Omfattende Læringsmål

**Navigasjon for Læringsvei**
- **📚 Kursoversikt**: [AZD For Beginners](../README.md)
- **📖 Start Læringen**: [Kapittel 1: Grunnlag & Rask Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: [Kursfullføring](../README.md#-course-completion--certification)

## Introduksjon

Denne omfattende studieguiden gir strukturerte læringsmål, nøkkelbegreper, praksisøvelser og vurderingsmateriell for å hjelpe deg med å mestre Azure Developer CLI (azd). Bruk denne guiden for å spore fremdriften din og sikre at du har dekket alle viktige emner.

## Læringsmål

Ved å fullføre denne studieguiden vil du:
- Mestre alle grunnleggende og avanserte konsepter av Azure Developer CLI
- Utvikle praktiske ferdigheter i distribusjon og administrasjon av Azure-applikasjoner
- Bygge selvtillit i feilsøking og optimalisering av distribusjoner
- Forstå produksjonsklare distribusjonspraksiser og sikkerhetshensyn

## Læringsutbytter

Etter å ha fullført alle seksjoner i denne studieguiden, vil du kunne:
- Designe, distribuere og administrere komplette applikasjonsarkitekturer ved hjelp av azd
- Implementere omfattende overvåkings-, sikkerhets- og kostnadsoptimaliseringsstrategier
- Feilsøke komplekse distribusjonsproblemer selvstendig
- Lage tilpassede maler og bidra til azd-fellesskapet

## 8-Kapitlers Læringsstruktur

### Kapittel 1: Grunnlag & Rask Start (Uke 1)
**Varighet**: 30-45 minutter | **Kompleksitet**: ⭐

#### Læringsmål
- Forstå Azure Developer CLI kjernebegreper og terminologi
- Installere og konfigurere AZD på din utviklingsplattform med suksess
- Distribuere din første applikasjon ved hjelp av en eksisterende mal
- Navigere effektivt i AZD kommandolinjegrensesnitt

#### Nøkkelbegreper å Mestre
- AZD prosjektstruktur og komponenter (azure.yaml, infra/, src/)
- Malbaserte distribusjonsarbeidsflyter
- Miljøkonfigurasjon grunnleggende
- Ressursgruppe- og abonnementshåndtering

#### Praktiske Øvelser
1. **Verifisering av Installasjon**: Installer AZD og verifiser med `azd version`
2. **Første Distribusjon**: Distribuer todo-nodejs-mongo malen med suksess
3. **Miljøoppsett**: Konfigurer dine første miljøvariabler
4. **Ressursutforskning**: Naviger distribuerte ressurser i Azure-portalen

#### Vurderingsspørsmål
- Hva er kjernekomponentene i et AZD-prosjekt?
- Hvordan initialiserer du et nytt prosjekt fra en mal?
- Hva er forskjellen mellom `azd up` og `azd deploy`?
- Hvordan administrerer du flere miljøer med AZD?

---

### Kapittel 2: AI-First Utvikling (Uke 2)
**Varighet**: 1-2 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Integrere Microsoft Foundry-tjenester med AZD-arbeidsflyter
- Distribuere og konfigurere AI-drevne applikasjoner
- Forstå RAG (Retrieval-Augmented Generation) implementasjonsmønstre
- Administrere AI-modell distribusjoner og skalering

#### Nøkkelbegreper å Mestre
- Microsoft Foundry Models tjenesteintegrasjon og API-administrasjon
- AI-søk konfigurasjon og vektorindeksering
- Modell distribusjonsstrategier og kapasitetsplanlegging
- AI-applikasjonsovervåking og ytelsesoptimalisering

#### Praktiske Øvelser
1. **AI Chat Distribusjon**: Distribuer azure-search-openai-demo malen
2. **RAG Implementering**: Konfigurer dokumentindeksering og gjenfinning
3. **Modellkonfigurasjon**: Sett opp flere AI-modeller med ulike formål
4. **AI Overvåking**: Implementer Application Insights for AI arbeidsmengder

#### Vurderingsspørsmål
- Hvordan konfigurerer du Microsoft Foundry Models tjenester i en AZD-mal?
- Hva er nøkkelkomponentene i en RAG-arkitektur?
- Hvordan administrerer du AI-modell kapasitet og skalering?
- Hvilke overvåkingsmetrikker er viktige for AI-applikasjoner?

---

### Kapittel 3: Konfigurasjon & Autentisering (Uke 3)
**Varighet**: 45-60 minutter | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Mestre miljøkonfigurasjon og administrasjonsstrategier
- Implementere sikre autentiseringsmønstre og administrert identitet
- Organisere ressurser med riktige navnekonvensjoner
- Konfigurere flere miljødistribusjoner (dev, staging, prod)

#### Nøkkelbegreper å Mestre
- Miljøhierarki og konfigurasjonspreferanse
- Administrert identitet og tjenesteprinsippautentisering
- Key Vault-integrasjon for hemmelighetshåndtering
- Miljøspesifikk parameterhåndtering

#### Praktiske Øvelser
1. **Oppsett for Flere Miljøer**: Konfigurer dev, staging, og prod miljøer
2. **Sikkerhetskonfigurasjon**: Implementer autentisering med administrert identitet
3. **Hemmelighetshåndtering**: Integrer Azure Key Vault for sensitiv data
4. **Parameterhåndtering**: Lag miljøspesifikke konfigurasjoner

#### Vurderingsspørsmål
- Hvordan konfigurerer du forskjellige miljøer med AZD?
- Hva er fordelene ved å bruke administrert identitet over tjenesteprinsipper?
- Hvordan håndterer du applikasjonshemmeligheter sikkert?
- Hva er konfigurasjonshierarkiet i AZD?

---

### Kapittel 4: Infrastruktur som Kode & Distribusjon (Uke 4-5)
**Varighet**: 1-1,5 timer | **Kompleksitet**: ⭐⭐⭐

#### Læringsmål
- Lage og tilpasse Bicep infrastruktursmaler
- Implementere avanserte distribusjonsmønstre og arbeidsflyter
- Forstå ressursprovisjoneringsstrategier
- Designe skalerbare arkitekturer med flere tjenester
- Distribuere containeriserte applikasjoner med Azure Container Apps og AZD

#### Nøkkelbegreper å Mestre
- Bicep-malstruktur og beste praksis
- Ressursavhengigheter og rekkefølge for distribusjon
- Parameterfiler og moduler i maler
- Tilpassede hooks og distribusjonsautomatisering
- Distribusjonsmønstre for Container App (rask start, produksjon, mikrotjenester)

#### Praktiske Øvelser
1. **Egendefinert Malopprettelse**: Bygg en mal for en fler-tjeneste applikasjon
2. **Bicep-mestring**: Lag modulære, gjenbrukbare infrastrukturelementer
3. **Distribusjonsautomatisering**: Implementer pre-/post-distribusjonshooks
4. **Arkitekturdesign**: Distribuer kompleks mikrotjenestearkitektur
5. **Container App Distribusjon**: Distribuer [Simple Flask API](../../../examples/container-app/simple-flask-api) og [Microservices Architecture](../../../examples/container-app/microservices) eksemplene med AZD

#### Vurderingsspørsmål
- Hvordan lager du egendefinerte Bicep-maler for AZD?
- Hva er beste praksis for organisering av infrastrukturkode?
- Hvordan håndterer du ressursavhengigheter i maler?
- Hvilke distribusjonsmønstre støtter oppdateringer uten nedetid?

---

### Kapittel 5: Multi-Agent AI-Løsninger (Uke 6-7)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Designe og implementere multi-agent AI-arkitekturer
- Orkestrere agentkoordinasjon og kommunikasjon
- Distribuere produksjonsklare AI-løsninger med overvåking
- Forstå agentspesialisering og arbeidsflytmønstre
- Integrere containeriserte mikrotjenester som del av multi-agent løsninger

#### Nøkkelbegreper å Mestre
- Multi-agent arkitekturmønstre og designprinsipper
- Agentkommunikasjonsprotokoller og dataflyt
- Lastbalansering og skaleringsstrategier for AI-agenter
- Produksjonsovervåking for multi-agent systemer
- Tjeneste-til-tjeneste kommunikasjon i containeriserte miljøer

#### Praktiske Øvelser
1. **Detaljhandelsløsning Distribusjon**: Distribuer det komplette multi-agent detaljhandelsscenarioet
2. **Agenttilpasning**: Endre oppførsel for Kunde- og Lageragenter
3. **Arkitektur Skalering**: Implementer lastbalansering og autoskalering
4. **Produksjonsovervåking**: Sett opp omfattende overvåking og varsling
5. **Mikrotjenesteintegrasjon**: Utvid [Microservices Architecture](../../../examples/container-app/microservices) eksempelet for å støtte agentbaserte arbeidsflyter

#### Vurderingsspørsmål
- Hvordan designer du effektive multi-agent kommunikasjonsmønstre?
- Hva er nøkkelbetraktninger for skalering av AI-agent arbeidsmengder?
- Hvordan overvåker og feilsøker du multi-agent AI-systemer?
- Hvilke produksjonsmønstre sikrer pålitelighet for AI-agenter?

---

### Kapittel 6: Validering og Planlegging Før Distribusjon (Uke 8)
**Varighet**: 1 time | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utføre omfattende kapasitetsplanlegging og ressursvalidering
- Velge optimale Azure SKU-er for kostnadseffektivitet
- Implementere automatiserte pre-flight kontroller og validering
- Planlegge distribusjoner med kostnadsoptimaliseringsstrategier

#### Nøkkelbegreper å Mestre
- Azure ressurskvoter og kapasitetsbegrensninger
- Kriterier for SKU-valg og kostnadsoptimalisering
- Automatiserte valideringsskript og testing
- Distribusjonsplanlegging og risikovurdering

#### Praktiske Øvelser
1. **Kapasitetsanalyse**: Analyser ressurskrav for dine applikasjoner
2. **SKU-optimalisering**: Sammenlign og velg kostnadseffektive tjenestenivåer
3. **Valideringsautomatisering**: Implementer skript for pre-distribusjonskontroller
4. **Kostnadsplanlegging**: Lag kostnadsoverslag og budsjetter for distribusjon

#### Vurderingsspørsmål
- Hvordan validerer du Azure-kapasitet før distribusjon?
- Hvilke faktorer påvirker SKU-valg?
- Hvordan automatiserer du pre-distribusjonsvalidering?
- Hvilke strategier hjelper til med å optimalisere distribusjonskostnader?

---

### Kapittel 7: Feilsøking & Debugging (Uke 9)
**Varighet**: 1-1,5 timer | **Kompleksitet**: ⭐⭐

#### Læringsmål
- Utvikle systematiske debugging-metoder for AZD distribusjoner
- Løse vanlige distribusjons- og konfigurasjonsproblemer
- Feilsøke AI-spesifikke problemer og ytelsesutfordringer
- Implementere overvåking og varsling for proaktiv problemoppdagelse

#### Nøkkelbegreper å Mestre
- Diagnoseteknikker og loggstrategier
- Vanlige feil mønstre og løsninger
- Ytelsesovervåking og optimalisering
- Hendelseshåndtering og gjenopprettingsprosedyrer

#### Praktiske Øvelser
1. **Diagnoseferdigheter**: Øv på bevisst ødelagte distribusjoner
2. **Logganalyse**: Bruk Azure Monitor og Application Insights effektivt
3. **Ytelsesoptimalisering**: Optimaliser applikasjoner med dårlig ytelse
4. **Gjenopprettingsprosedyrer**: Implementer backup og katastrofegjenoppretting

#### Vurderingsspørsmål
- Hva er de vanligste AZD distribusjonsfeilene?
- Hvordan feilsøker du autentiserings- og tillatelsesproblemer?
- Hvilke overvåkingsstrategier hjelper med å forhindre produksjonsproblemer?
- Hvordan optimaliserer du applikasjonsytelse i Azure?

---

### Kapittel 8: Produksjon- & Enterprise-Mønstre (Uke 10-11)
**Varighet**: 2-3 timer | **Kompleksitet**: ⭐⭐⭐⭐

#### Læringsmål
- Implementere enterprise-grad distribusjonsstrategier
- Designe sikkerhetsmønstre og samsvarsrammeverk
- Etablere overvåking, styring og kostnadskontroll
- Lage skalerbare CI/CD-pipelines med AZD-integrasjon
- Anvende beste praksis for produksjonsdistribusjoner av container-apper (sikkerhet, overvåking, kostnad, CI/CD)

#### Nøkkelbegreper å Mestre
- Enterprise sikkerhets- og samsvarskrav
- Styringsrammeverk og policyimplementering
- Avansert overvåking og kostnadsstyring
- CI/CD-integrasjon og automatiserte distribusjonspipelines
- Blue-green og kanaridistribusjonsstrategier for containeriserte arbeidsmengder

#### Praktiske Øvelser
1. **Enterprise Sikkerhet**: Implementer omfattende sikkerhetsmønstre
2. **Styringsrammeverk**: Sett opp Azure Policy og ressursadministrasjon
3. **Avansert Overvåking**: Lag dashboards og automatisert varsling
4. **CI/CD Integrasjon**: Bygg automatiserte distribusjonspipelines
5. **Produksjons Container Apper**: Anvend sikkerhet, overvåking og kostnadsoptimalisering på [Microservices Architecture](../../../examples/container-app/microservices) eksempelet

#### Vurderingsspørsmål
- Hvordan implementerer du enterprise-sikkerhet i AZD distribusjoner?
- Hvilke styringsmønstre sikrer samsvar og kostnadskontroll?
- Hvordan designer du skalerbar overvåking for produksjonssystemer?
- Hvilke CI/CD-mønstre fungerer best med AZD arbeidsflyter?

#### Læringsmål
- Forstå Azure Developer CLI grunnleggende og kjernebegreper
- Installer og konfigurer azd i ditt utviklingsmiljø med suksess
- Fullfør din første distribusjon ved å bruke en eksisterende mal
- Naviger i azd prosjektstruktur og forstå nøkkelkomponenter

#### Nøkkelbegreper å Mestre
- Maler, miljøer og tjenester
- azure.yaml konfigurasjonsstruktur
- Grunnleggende azd-kommandoer (init, up, down, deploy)
- Infrastruktur som kode-prinsipper
- Azure autentisering og autorisasjon

#### Praksisøvelser

**Øvelse 1.1: Installasjon og Oppsett**
```bash
# Fullfør disse oppgavene:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første Distribusjon**
```bash
# Distribuer en enkel nettapplikasjon:
1. Initialize project: azd init --template todo-nodejs-mongo
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
1. Hva er de tre kjernebegrepene i azd-arkitekturen?
2. Hva er hensikten med azure.yaml-filen?
3. Hvordan hjelper miljøer med å administrere forskjellige distribusjonsmål?
4. Hvilke autentiseringsmetoder kan brukes med azd?
5. Hva skjer når du kjører `azd up` for første gang?

---

## Fremdriftssporing og Vurderingsrammeverk
```bash
# Opprett og konfigurer flere miljøer:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Øvelse 2.2: Avansert Konfigurasjon**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Øvelse 2.3: Sikkerhetskonfigurasjon**
```bash
# Implementer sikkerhets beste praksis:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Egenvurderingsspørsmål
1. Hvordan håndterer azd miljøvariabelpreferanser?
2. Hva er distribusjonshooks og når bør du bruke dem?
3. Hvordan konfigurerer du forskjellige SKUer for ulike miljøer?
4. Hva er sikkerhetsimplikasjonene av ulike autentiseringsmetoder?
5. Hvordan håndterer du hemmeligheter og sensitiv konfigurasjonsdata?

### Modul 3: Distribusjon og Provisjonering (Uke 4)

#### Læringsmål
- Mestre distribusjonsarbeidsflyter og beste praksis
- Forstå Infrastruktur som kode med Bicep-maler
- Implementere komplekse fler-tjeneste arkitekturer
- Optimalisere distribusjonsytelse og pålitelighet

#### Nøkkelbegreper å Mestre
- Bicep-malstruktur og moduler
- Ressursavhengigheter og rekkefølge
- Distribusjonsstrategier (blue-green, trinnvise oppdateringer)
- Multi-region distribusjoner
- Database-migrasjoner og databehandling

#### Praksisøvelser

**Øvelse 3.1: Egendefinert Infrastruktur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Øvelse 3.2: Fler-tjeneste Applikasjon**
```bash
# Distribuer en mikrotjenestearkitektur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Øvelse 3.3: Databaseintegrasjon**
```bash
# Implementer databaseutrullingsmønstre:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Egenvurderingsspørsmål
1. Hva er fordelene ved å bruke Bicep fremfor ARM-maler?
2. Hvordan håndterer du database-migrasjoner i azd distribusjoner?
3. Hvilke strategier finnes for distribusjoner uten nedetid?
4. Hvordan håndterer du avhengigheter mellom tjenester?
5. Hva bør vurderes ved multi-region distribusjoner?

### Modul 4: Pre-Distribusjon Validering (Uke 5)

#### Læringsmål
- Utfør omfattende kontroller før distribusjon  
- Mestre kapasitetsplanlegging og ressursvalidering  
- Forstå SKU-utvelgelse og kostnadsoptimalisering  
- Bygg automatiserte valideringspipelines  

#### Nøkkelkonsepter å mestre  
- Azure-ressurskvoter og begrensninger  
- Kriterier for SKU-utvelgelse og kostnadskonsekvenser  
- Automatiserte valideringsskript og -verktøy  
- Metodikker for kapasitetsplanlegging  
- Ytelsestesting og optimalisering  

#### Øvelser  

**Øvelse 4.1: Kapasitetsplanlegging**  
```bash
# Implementer validering av kapasitet:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Øvelse 4.2: Pre-flight-validering**  
```powershell
# Bygg en omfattende valideringspipeline:
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
  
#### Selv-vurderingsspørsmål  
1. Hvilke faktorer bør påvirke beslutninger om SKU-utvelgelse?  
2. Hvordan validerer du tilgjengeligheten av Azure-ressurser før distribusjon?  
3. Hva er hovedkomponentene i et pre-flight kontrollsystem?  
4. Hvordan estimerer og kontrollerer du distribusjonskostnader?  
5. Hvilken overvåking er essensiell for kapasitetsplanlegging?  

### Modul 5: Feilsøking og debugging (Uke 6)  

#### Læringsmål  
- Mestre systematiske metodikker for feilsøking  
- Utvikle ekspertise i debugging av komplekse distribusjonsproblemer  
- Implementere omfattende overvåking og varsling  
- Bygge prosedyrer for hendelseshåndtering og gjenoppretting  

#### Nøkkelkonsepter å mestre  
- Vanlige feilmønstre ved distribusjon  
- Logganalyse og korrelasjonsteknikker  
- Overvåking av ytelse og optimalisering  
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
# Bygg prosedyrer for hendelseshåndtering:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  
#### Selv-vurderingsspørsmål  
1. Hva er den systematiske tilnærmingen til feilsøking av azd-distribusjoner?  
2. Hvordan korrelerer du logger på tvers av flere tjenester og ressurser?  
3. Hvilke overvåkingsmetrikker er mest kritiske for tidlig feiloppdagelse?  
4. Hvordan implementerer du effektive prosedyrer for katastrofegjenoppretting?  
5. Hva er hovedkomponentene i en hendelsesresponssplan?  

### Modul 6: Avanserte emner og beste praksis (Uke 7-8)  

#### Læringsmål  
- Implementere distribusjonsmønstre på bedriftsnivå  
- Mestre CI/CD-integrasjon og automatisering  
- Utvikle egendefinerte maler og bidra til fellesskapet  
- Forstå avanserte sikkerhets- og samsvarskrav  

#### Nøkkelkonsepter å mestre  
- Mønstre for CI/CD pipeline-integrasjon  
- Utvikling og distribusjon av egendefinerte maler  
- Bedriftsstyring og samsvar  
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
  
**Øvelse 6.2: Utvikling av egendefinerte maler**  
```bash
# Opprett og publiser egendefinerte maler:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Øvelse 6.3: Bedriftsimplementering**  
```bash
# Implementer funksjoner på bedriftsnivå:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### Selv-vurderingsspørsmål  
1. Hvordan integrerer du azd i eksisterende CI/CD-arbeidsflyter?  
2. Hva er viktige hensyn ved utvikling av egendefinerte maler?  
3. Hvordan implementerer du styring og samsvar i azd-distribusjoner?  
4. Hva er beste praksis for distribusjoner i bedriftsstørrelse?  
5. Hvordan bidrar du effektivt til azd-fellesskapet?  

## Praktiske prosjekter  

### Prosjekt 1: Personlig porteføljenettsted  
**Vanskelighetsgrad**: Nybegynner  
**Varighet**: 1-2 uker  

Bygg og distribuer et personlig porteføljenettsted med:  
- Statisk nettstedsvert på Azure Storage  
- Egendefinert domenekonfigurasjon  
- CDN-integrasjon for global ytelse  
- Automatisert distribusjonspipeline  

**Leveranser**:  
- Funksjonelt nettsted distribuert på Azure  
- Egendefinert azd-mal for porteføljedistribusjoner  
- Dokumentasjon av distribusjonsprosess  
- Kostnadsanalyse og optimaliseringsanbefalinger  

### Prosjekt 2: Oppgavehåndteringsapplikasjon  
**Vanskelighetsgrad**: Middels  
**Varighet**: 2-3 uker  

Lag en fullstack oppgavehåndteringsapplikasjon med:  
- React frontend distribuert til App Service  
- Node.js API backend med autentisering  
- PostgreSQL-database med migrasjoner  
- Application Insights-overvåking  

**Leveranser**:  
- Komplett applikasjon med brukergodkjenning  
- Databaseskjema og migrasjonsskript  
- Overvåkingsdashboards og varslingsregler  
- Distribusjonskonfigurasjon for flere miljøer  

### Prosjekt 3: Mikrotjeneste-ehandelsplattform  
**Vanskelighetsgrad**: Avansert  
**Varighet**: 4-6 uker  

Design og implementer en mikrotjenestebasert ehandelsplattform:  
- Flere API-tjenester (katalog, ordre, betalinger, brukere)  
- Meldingskøintegrasjon med Service Bus  
- Redis-cache for ytelsesoptimalisering  
- Omfattende logging og overvåking  

**Referanseeksempel**: Se [Microservices Architecture](../../../examples/container-app/microservices) for en produksjonsklar mal og distribusjonsveiledning  

**Leveranser**:  
- Komplett mikrotjenestearkitektur  
- Kommunikasjonsmønstre mellom tjenester  
- Ytelsestesting og optimalisering  
- Produksjonsklar sikkerhetsimplementering  

## Vurdering og sertifisering  

### Kunnskapskontroller  

Fullfør disse vurderingene etter hver modul:  

**Modul 1 Vurdering**: Grunnleggende konsepter og installasjon  
- Flervalgsspørsmål om kjernebegreper  
- Praktiske installasjons- og konfigurasjonsoppgaver  
- Enkel distribusjonsøvelse  

**Modul 2 Vurdering**: Konfigurasjon og miljøer  
- Scenarioer for miljøhåndtering  
- Feilsøkingsøvelser i konfigurasjon  
- Implementering av sikkerhetskonfigurasjon  

**Modul 3 Vurdering**: Distribusjon og provisjonering  
- Utfordringer i infrastrukturdesign  
- Scenarioer for distribusjon av flere tjenester  
- Øvelser for ytelsesoptimalisering  

**Modul 4 Vurdering**: Validering før distribusjon  
- Casestudier for kapasitetsplanlegging  
- Scenarioer for kostnadsoptimalisering  
- Implementering av valideringspipelines  

**Modul 5 Vurdering**: Feilsøking og debugging  
- Diagnoseøvelser  
- Oppgaver for implementering av overvåking  
- Simuleringer av hendelseshåndtering  

**Modul 6 Vurdering**: Avanserte emner  
- Design av CI/CD-pipelines  
- Utvikling av egendefinerte maler  
- Scenarioer for bedriftsarkitektur  

### Avsluttende hovedprosjekt  

Design og implementer en komplett løsning som demonstrerer mestring av alle konsepter:  

**Krav**:  
- Applikasjonsarkitektur med flere lag  
- Flere distribusjonsmiljøer  
- Omfattende overvåking og varsling  
- Implementering av sikkerhet og samsvar  
- Kostnadsoptimalisering og ytelsestuning  
- Fullstendig dokumentasjon og driftsmanualer  

**Evalueringskriterier**:  
- Teknisk implementasjonskvalitet  
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

## Anbefalinger for studieplan  

### Heltidsstudium (8 uker)  
- **Uke 1-2**: Modul 1-2 (Komme i gang, Konfigurasjon)  
- **Uke 3-4**: Modul 3-4 (Distribusjon, Forhåndsvalidering)  
- **Uke 5-6**: Modul 5-6 (Feilsøking, Avanserte emner)  
- **Uke 7-8**: Praktiske prosjekter og avsluttende vurdering  

### Deltidsstudium (16 uker)  
- **Uke 1-4**: Modul 1 (Komme i gang)  
- **Uke 5-7**: Modul 2 (Konfigurasjon og miljøer)  
- **Uke 8-10**: Modul 3 (Distribusjon og provisjonering)  
- **Uke 11-12**: Modul 4 (Forhåndsvalidering)  
- **Uke 13-14**: Modul 5 (Feilsøking og debugging)  
- **Uke 15-16**: Modul 6 (Avanserte emner og vurdering)  

---  

## Framdriftssporing og vurderingsrammeverk  

### Sjekkliste for kapittelgjennomføring  

Følg din progresjon gjennom hvert kapittel med disse målbare resultatene:  

#### 📚 Kapittel 1: Grunnlag og rask start  
- [ ] **Fullført installasjon**: AZD installert og verifisert på din plattform  
- [ ] **Første distribusjon**: Vel gjennomført distribusjon av todo-nodejs-mongo-mal  
- [ ] **Miljøoppsett**: Konfigurert første miljøvariabler  
- [ ] **Ressursnavigasjon**: Utforsket distribuerte ressurser i Azure Portal  
- [ ] **Kommandomestring**: Behersker grunnleggende AZD-kommandoer  

#### 🤖 Kapittel 2: AI-først utvikling  
- [ ] **AI-maldistribusjon**: Azure-search-openai-demo distribuert vellykket  
- [ ] **RAG-implementering**: Konfigurert dokumentindeksering og gjenfinning  
- [ ] **Modellkonfigurasjon**: Sat opp flere AI-modeller med forskjellige formål  
- [ ] **AI-overvåking**: Implementert Application Insights for AI-arbeidsmengder  
- [ ] **Ytelsesoptimalisering**: Optimalisert AI-applikasjonens ytelse  

#### ⚙️ Kapittel 3: Konfigurasjon og autentisering  
- [ ] **Oppsett for flere miljøer**: Konfigurert dev, staging og prod miljøer  
- [ ] **Sikkerhetsimplementering**: Sett opp Managed Identity autentisering  
- [ ] **Håndtering av hemmeligheter**: Integrert Azure Key Vault for sensitive data  
- [ ] **Parameterhåndtering**: Opprettet miljøspesifikk konfigurasjon  
- [ ] **Autentiseringsmestring**: Implementert sikre tilgangsmønstre  

#### 🏗️ Kapittel 4: Infrastruktur som kode og distribusjon  
- [ ] **Opprettelse av egendefinert mal**: Bygget mal for multi-tjeneste applikasjon  
- [ ] **Bicep-mestring**: Laget modulære, gjenbrukbare infrastrukturelementer  
- [ ] **Distribusjonsautomatisering**: Implementert pre/post distribusjons-hooks  
- [ ] **Arkitekturdesign**: Distribuert kompleks mikrotjenestearkitektur  
- [ ] **Maloptimalisering**: Optimalisert maler for ytelse og kostnad  

#### 🎯 Kapittel 5: Multi-agent AI-løsninger  
- [ ] **Distribusjon av detaljhandeløsning**: Fullført multi-agent detaljhandelsscenario  
- [ ] **Agenttilpasning**: Endret kunde- og lageragenters atferd  
- [ ] **Skalering av arkitektur**: Implementert lastbalansering og autoskalering  
- [ ] **Produksjonsovervåking**: Satt opp omfattende overvåking og varsling  
- [ ] **Ytelsestuning**: Optimalisert multi-agent systemytelse  

#### 🔍 Kapittel 6: Forhåndsvalidering og planlegging  
- [ ] **Kapasitetsanalyse**: Analysert ressurskrav for applikasjoner  
- [ ] **SKU-optimalisering**: Valgt kostnadseffektive servicelag  
- [ ] **Automatisering av validering**: Implementert sjekkskript før distribusjon  
- [ ] **Kostnadsplanlegging**: Utarbeidet estimater og budsjetter for distribusjon  
- [ ] **Risikoevaluering**: Identifisert og redusert distribusjonsrisiko  

#### 🚨 Kapittel 7: Feilsøking og debugging  
- [ ] **Diagnostiske ferdigheter**: Lyktes med å debugge bevisst feilaktige distribusjoner  
- [ ] **Logganalyse**: Brukt Azure Monitor og Application Insights effektivt  
- [ ] **Ytelsestuning**: Optimalisert tregt fungerende applikasjoner  
- [ ] **Gjenopprettingsprosedyrer**: Implementert backup og katastrofegjenoppretting  
- [ ] **Overvåkingsoppsett**: Opprettet proaktiv overvåking og varsling  

#### 🏢 Kapittel 8: Produksjons- og bedriftsmønstre  
- [ ] **Bedriftssikkerhet**: Implementert omfattende sikkerhetsmønstre  
- [ ] **Styringsrammeverk**: Satt opp Azure Policy og ressursstyring  
- [ ] **Avansert overvåking**: Opprettet dashbord og automatisert varsling  
- [ ] **CI/CD-integrasjon**: Bygget automatiserte distribusjonspipelines  
- [ ] **Samsvarsimplementering**: Oppfylt bedriftskrav til samsvar  

### Læringstidslinje og milepæler  

#### Uke 1-2: Grunnleggende bygging  
- **Milepæl**: Distribuer første AI-applikasjon med AZD  
- **Validering**: Funksjonell applikasjon tilgjengelig via offentlig URL  
- **Ferdigheter**: Grunnleggende AZD-arbeidsflyter og AI-tjenesteintegrasjon  

#### Uke 3-4: Konfigurasjonsmestring  
- **Milepæl**: Distribusjon til flere miljøer med sikker autentisering  
- **Validering**: Samme applikasjon distribuert til dev/staging/prod  
- **Ferdigheter**: Miljøhåndtering og sikkerhetsimplementering  

#### Uke 5-6: Infrastrukturkompetanse  
- **Milepæl**: Egendefinert mal for komplekse multi-tjeneste applikasjoner  
- **Validering**: Gjenbrukbar mal distribuert av et annet teammedlem  
- **Ferdigheter**: Bicep-mestring og infrastrukturautomatisering  

#### Uke 7-8: Avansert AI-implementering  
- **Milepæl**: Produksjonsklar multi-agent AI-løsning  
- **Validering**: System håndterer reell belastning med overvåking  
- **Ferdigheter**: Orkestrering av multi-agent systemer og ytelsesoptimalisering  

#### Uke 9-10: Produksjonsklarhet  
- **Milepæl**: Distribusjon på bedriftsnivå med full samsvar  
- **Validering**: Bestått sikkerhetsgjennomgang og kostnadsoptimalisering  
- **Ferdigheter**: Styring, overvåking og CI/CD-integrasjon  

### Vurdering og sertifisering  

#### Metoder for kunnskapsvalidering  
1. **Praktiske distribusjoner**: Funksjonelle applikasjoner for hvert kapittel  
2. **Kodegjennomganger**: Vurdering av maler og konfigurasjonskvalitet  
3. **Problemløsning**: Feilsøkingsscenarier og løsninger  
4. **Fagutveksling**: Forklar konsepter til andre elever  
5. **Bidrag til fellesskapet**: Del maler eller forbedringer  

#### Resultater for profesjonell utvikling
- **Porteføljeprosjekter**: 8 produksjonsklare implementeringer
- **Tekniske ferdigheter**: Bransjestandard AZD og AI implementeringsekspertise
- **Problemløsningsevner**: Selvstendig feilsøking og optimalisering
- **Annerkjennelse i fellesskapet**: Aktiv deltakelse i Azure-utviklerfellesskapet
- **Karriereutvikling**: Ferdigheter direkte anvendbare i sky- og AI-roller

#### Suksessmål
- **Implementeringssuksessrate**: >95 % vellykkede implementeringer
- **Feilsøkingstid**: <30 minutter for vanlige problemer
- **Ytelsesoptimalisering**: Målbare forbedringer i kostnad og ytelse
- **Sikkerhetsoverholdelse**: Alle implementeringer oppfyller virksomhetens sikkerhetsstandarder
- **Kunnskapsoverføring**: Evne til å veilede andre utviklere

### Kontinuerlig læring og fellesskapsengasjement

#### Hold deg oppdatert
- **Azure-oppdateringer**: Følg Azure Developer CLI-utgivelsesnotater
- **Fellesskapsarrangementer**: Delta i Azure- og AI-utviklerarrangementer
- **Dokumentasjon**: Bidra til fellesskapsdokumentasjon og eksempler
- **Tilbakemeldingssløyfe**: Gi tilbakemelding på kursinnhold og Azure-tjenester

#### Karriereutvikling
- **Profesjonelt nettverk**: Knytt kontakt med eksperter innen Azure og AI
- **Foredragsmuligheter**: Presenter læring på konferanser eller treff
- **Bidrag til åpen kildekode**: Bidra til AZD-maler og verktøy
- **Mentorskap**: Veilede andre utviklere i deres AZD-læringsreise

---

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../README.md)
- **📖 Start læring**: [Kapittel 1: Grunnlag og hurtigstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fremdriftssporing**: Spor fremgangen din gjennom det omfattende 8-kapitlers læringssystemet
- **🤝 Fellesskap**: [Azure Discord](https://discord.gg/microsoft-azure) for støtte og diskusjon

**Studiefremdriftssporing**: Bruk denne strukturerte guiden for å mestre Azure Developer CLI gjennom progressiv, praktisk læring med målbare resultater og fordeler for profesjonell utvikling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved bruk av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som følge av bruken av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->