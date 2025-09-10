<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:20:03+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "no"
}
-->
# Studieveiledning - AZD for Nybegynnere

## Introduksjon

Denne omfattende studieveiledningen gir strukturerte læringsmål, nøkkelkonsepter, praktiske øvelser og vurderingsmateriale for å hjelpe deg med å mestre Azure Developer CLI (azd). Bruk denne veiledningen til å følge med på fremgangen din og sikre at du har dekket alle essensielle emner.

## Læringsmål

Ved å fullføre denne studieveiledningen vil du:
- Mestre alle grunnleggende og avanserte konsepter i Azure Developer CLI
- Utvikle praktiske ferdigheter i å distribuere og administrere Azure-applikasjoner
- Bygge selvtillit i feilsøking og optimalisering av distribusjoner
- Forstå produksjonsklare distribusjonspraksiser og sikkerhetsvurderinger

## Læringsutbytte

Etter å ha fullført alle seksjoner i denne studieveiledningen, vil du kunne:
- Designe, distribuere og administrere komplette applikasjonsarkitekturer ved hjelp av azd
- Implementere omfattende overvåking, sikkerhet og kostnadsoptimaliseringsstrategier
- Feilsøke komplekse distribusjonsproblemer selvstendig
- Lage tilpassede maler og bidra til azd-samfunnet

## Kursstruktur

### Modul 1: Komme i gang (Uker 1-2)

#### Læringsmål
- Forstå grunnleggende konsepter og kjerneprinsipper i Azure Developer CLI
- Installere og konfigurere azd på utviklingsmiljøet ditt
- Fullføre din første distribusjon ved hjelp av en eksisterende mal
- Navigere i azd-projektstrukturen og forstå nøkkelkomponenter

#### Nøkkelkonsepter å mestre
- Maler, miljøer og tjenester
- azure.yaml-konfigurasjonsstruktur
- Grunnleggende azd-kommandoer (init, up, down, deploy)
- Prinsipper for Infrastructure as Code
- Azure-autentisering og autorisasjon

#### Praktiske øvelser

**Øvelse 1.1: Installasjon og oppsett**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Øvelse 1.2: Første distribusjon**  
```bash
# Deploy a simple web application:
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

#### Selvstendige vurderingsspørsmål
1. Hva er de tre kjernekonseptene i azd-arkitekturen?
2. Hva er formålet med azure.yaml-filen?
3. Hvordan hjelper miljøer med å administrere ulike distribusjonsmål?
4. Hvilke autentiseringsmetoder kan brukes med azd?
5. Hva skjer når du kjører `azd up` for første gang?

### Modul 2: Konfigurasjon og miljøer (Uke 3)

#### Læringsmål
- Mestre miljøadministrasjon og konfigurasjon
- Forstå avanserte azure.yaml-konfigurasjoner
- Implementere miljøspesifikke innstillinger og variabler
- Konfigurere autentisering for ulike scenarier

#### Nøkkelkonsepter å mestre
- Miljøhierarki og variabelprioritet
- Tjenestekonfigurasjon og parametere
- Hooks og livssyklus-hendelser
- Autentiseringsmetoder (bruker, tjenesteprinsipp, administrert identitet)
- Administrasjon av konfigurasjonsfiler

#### Praktiske øvelser

**Øvelse 2.1: Oppsett av flere miljøer**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selvstendige vurderingsspørsmål
1. Hvordan håndterer azd variabelprioritet i miljøer?
2. Hva er distribusjonshooks, og når bør du bruke dem?
3. Hvordan konfigurerer du ulike SKUs for forskjellige miljøer?
4. Hva er sikkerhetsimplikasjonene ved ulike autentiseringsmetoder?
5. Hvordan administrerer du hemmeligheter og sensitiv konfigurasjonsdata?

### Modul 3: Distribusjon og klargjøring (Uke 4)

#### Læringsmål
- Mestre distribusjonsarbeidsflyter og beste praksis
- Forstå Infrastructure as Code med Bicep-maler
- Implementere komplekse arkitekturer med flere tjenester
- Optimalisere distribusjonsytelse og pålitelighet

#### Nøkkelkonsepter å mestre
- Bicep-malstruktur og moduler
- Ressursavhengigheter og rekkefølge
- Distribusjonsstrategier (blue-green, rullerende oppdateringer)
- Distribusjoner på tvers av regioner
- Databasemigreringer og databehandling

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

**Øvelse 3.2: Applikasjon med flere tjenester**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Øvelse 3.3: Databaseintegrasjon**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selvstendige vurderingsspørsmål
1. Hva er fordelene med å bruke Bicep fremfor ARM-maler?
2. Hvordan håndterer du databasemigreringer i azd-distribusjoner?
3. Hvilke strategier finnes for distribusjoner uten nedetid?
4. Hvordan administrerer du avhengigheter mellom tjenester?
5. Hva må vurderes ved distribusjoner på tvers av regioner?

### Modul 4: Validering før distribusjon (Uke 5)

#### Læringsmål
- Implementere omfattende kontroller før distribusjon
- Mestre kapasitetsplanlegging og ressursvalidering
- Forstå SKU-valg og kostnadsoptimalisering
- Bygge automatiserte valideringspipelines

#### Nøkkelkonsepter å mestre
- Azure ressurskvoter og grenser
- Kriterier for SKU-valg og kostnadsimplikasjoner
- Automatiserte valideringsskript og verktøy
- Metodologier for kapasitetsplanlegging
- Ytelsestesting og optimalisering

#### Praktiske øvelser

**Øvelse 4.1: Kapasitetsplanlegging**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Øvelse 4.2: Validering før distribusjon**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Øvelse 4.3: SKU-optimalisering**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selvstendige vurderingsspørsmål
1. Hvilke faktorer bør påvirke SKU-valg?
2. Hvordan validerer du tilgjengeligheten av Azure-ressurser før distribusjon?
3. Hva er de viktigste komponentene i et system for kontroller før distribusjon?
4. Hvordan estimerer og kontrollerer du distribusjonskostnader?
5. Hvilken overvåking er essensiell for kapasitetsplanlegging?

### Modul 5: Feilsøking og debugging (Uke 6)

#### Læringsmål
- Mestre systematiske feilsøkingsmetodologier
- Utvikle ekspertise i debugging av komplekse distribusjonsproblemer
- Implementere omfattende overvåking og varsling
- Bygge prosedyrer for hendelseshåndtering og gjenoppretting

#### Nøkkelkonsepter å mestre
- Vanlige mønstre for distribusjonsfeil
- Logganalyse og korrelasjonsteknikker
- Ytelsesovervåking og optimalisering
- Sikkerhetshendelsesdeteksjon og respons
- Katastrofegjenoppretting og forretningskontinuitet

#### Praktiske øvelser

**Øvelse 5.1: Feilsøkingsscenarier**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Øvelse 5.2: Implementering av overvåking**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Øvelse 5.3: Hendelseshåndtering**  
```bash
# Build incident response procedures:
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

### Modul 6: Avanserte emner og beste praksis (Uker 7-8)

#### Læringsmål
- Implementere distribusjonsmønstre på bedriftsnivå
- Mestre CI/CD-integrasjon og automatisering
- Utvikle tilpassede maler og bidra til samfunnet
- Forstå avanserte sikkerhets- og samsvarskrav

#### Nøkkelkonsepter å mestre
- Integrasjonsmønstre for CI/CD-pipelines
- Utvikling og distribusjon av tilpassede maler
- Bedriftsstyring og samsvar
- Avanserte nettverks- og sikkerhetskonfigurasjoner
- Ytelsesoptimalisering og kostnadsstyring

#### Praktiske øvelser

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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Øvelse 6.3: Implementering på bedriftsnivå**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selvstendige vurderingsspørsmål
1. Hvordan integrerer du azd i eksisterende CI/CD-arbeidsflyter?
2. Hva er de viktigste vurderingene for utvikling av tilpassede maler?
3. Hvordan implementerer du styring og samsvar i azd-distribusjoner?
4. Hva er beste praksis for distribusjoner i stor skala?
5. Hvordan bidrar du effektivt til azd-samfunnet?

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
- Egendefinert azd-mal for porteføljedistribusjoner
- Dokumentasjon av distribusjonsprosessen
- Kostnadsanalyse og optimaliseringsanbefalinger  

### Prosjekt 2: Oppgaveadministrasjonsapplikasjon  
**Kompleksitet**: Middels  
**Varighet**: 2-3 uker  

Lag en full-stack oppgaveadministrasjonsapplikasjon med:
- React frontend distribuert til App Service
- Node.js API backend med autentisering
- PostgreSQL-database med migreringer
- Application Insights-overvåking  

**Leveranser**:
- Komplett applikasjon med brukerautentisering
- Databaseskjema og migreringsskript
- Overvåkingsdashbord og varslingsregler
- Konfigurasjon for distribusjon i flere miljøer  

### Prosjekt 3: Mikroservices-basert e-handelsplattform  
**Kompleksitet**: Avansert  
**Varighet**: 4-6 uker  

Design og implementer en mikroservices-basert e-handelsplattform:
- Flere API-tjenester (katalog, bestillinger, betalinger, brukere)
- Integrasjon av meldingskø med Service Bus
- Redis-cache for ytelsesoptimalisering
- Omfattende logging og overvåking  

**Leveranser**:
- Komplett mikroservices-arkitektur
- Kommunikasjonsmønstre mellom tjenester
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
- Scenarier for miljøadministrasjon  
- Feilsøkingsøvelser for konfigurasjon  
- Implementering av sikkerhetskonfigurasjon  

**Modul 3 Vurdering**: Distribusjon og klargjøring  
- Utfordringer i infrastrukturdesign  
- Scenarier for distribusjon med flere tjenester  
- Øvelser for ytelsesoptimalisering  

**Modul 4 Vurdering**: Validering før distribusjon  
- Case-studier for kapasitetsplanlegging  
- Scenarier for kostnadsoptimalisering  
- Implementering av valideringspipeline  

**Modul 5 Vurdering**: Feilsøking og debugging  
- Øvelser for problemdiagnose  
- Oppgaver for implementering av overvåking  
- Simuleringer for hendelseshåndtering  

**Modul 6 Vurdering**: Avanserte emner  
- Design av CI/CD-pipeline  
- Utvikling av tilpassede maler  
- Scenarier for bedriftsarkitektur  

### Avsluttende prosjekt

Design og implementer en komplett løsning som demonstrerer mestring av alle konsepter:

**Krav**:
- Applikasjonsarkitektur med flere lag  
- Distribusjon i flere miljøer  
- Omfattende overvåking og varsling  
- Implementering av sikkerhet og samsvar  
- Kostnadsoptimalisering og ytelsestuning  
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
- [Azure Arkitektursenter](https://learn.microsoft.com/en-us/azure/architecture/)  

### Samfunnsressurser
- [AZD Malgalleri](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisasjon](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Øvingsmiljøer
- [Azure Gratis Konto](https://azure.microsoft.com/free/)  
- [Azure DevOps Gratis Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Tilleggsverktøy
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Anbefalinger for studieplan

### Fulltidsstudie (8 uker)
- **Uker 1-2**: Moduler 1-2 (Komme i gang, Konfigurasjon)  
- **Uker 3-4**: Moduler 3-4 (Distribusjon, Validering før distribusjon)  
- **Uker 5-6**: Moduler 5-6 (Feilsøking, Avanserte emner)  
- **Uker 7-8**: Praktiske prosjekter og avsluttende vurdering  

### Deltidsstudie (16 uker)
- **Uker 1-4**: Modul 1 (Komme i gang)  
- **Uker 5-7**: Modul 2 (Konfigurasjon og miljøer)  
- **Uker 8-10**: Modul 3 (Distribusjon og klargjøring)  
- **Uker 11-12**: Modul 4 (Validering før distribusjon)  
- **Uker 13-14**: Modul 5 (Feilsøking og debugging)  
- **Uker 15-16**: Modul 6 (Avanserte emner og vurdering)  

### Selvstyrt studie
- Fullfør hver modul i ditt eget tempo  
- Bruk ekstra tid på utfordrende konsepter  
- Gjenta øvelser til du oppnår mestring  
- Delta i samfunnsdiskusjoner og still spørsmål  

## Suksesstips

### Effektive læringsstrategier
1. **Øv regelmessig**: Distribuer applikasjoner ofte for å bygge praktisk erfaring  
2. **Eksperimenter fryktløst**: Bruk utviklingsmiljøer til å prøve nye konfigurasjoner  
3. **Dokumenter læringen din**: Ta notater om løsninger på problemer du møter  
4. **Bli med i samfunnet**: Delta i diskusjoner og bidra til prosjekter  
5. **Hold deg oppdatert**: Følg Azure-oppdateringer og nye azd-funksjoner  

### Vanlige fallgruver å unngå
1. **Hoppe over forutsetninger**: Sørg for at du har riktig grunnleggende kunnskap  
2. **Haste gjennom konsepter**: Ta deg tid til å forstå grunnleggende grundig  
3. **Ignorere sikkerhet**: Implementer alltid sikkerhetspraksis fra starten  
4. **Unnlate å teste grundig**: Test distribusjoner i flere miljøer  
5. **Unngå dokumentasjon**: God dokumentasjon er essensielt for vedlikehold  

### Bygge praktisk erfaring
1. **Start smått
3. **Bidra til åpen kildekode**: Del dine maler og løsninger med fellesskapet  
4. **Lær bort til andre**: Å forklare konsepter til andre styrker din egen forståelse  
5. **Vær nysgjerrig**: Utforsk kontinuerlig nye Azure-tjenester og integrasjonsmønstre  

---

**Navigasjon**  
- **Forrige leksjon**: [FAQ](faq.md)  
- **Neste leksjon**: [Changelog](../changelog.md)  

**Sporing av studieprogresjon**: Bruk denne veiledningen til å følge din læringsreise og sikre omfattende dekning av alle Azure Developer CLI-konsepter og praksiser.  

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.