# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD for begyndere](../README.md)
- **🚆 Installation Issues**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Introduction

Denne omfattende FAQ giver svar på de mest almindelige spørgsmål om Azure Developer CLI (azd) og Azure-implementeringer. Find hurtige løsninger på almindelige problemer, forstå bedste fremgangsmåder, og få afklaring på azd-koncept og arbejdsprocesser.

## Learning Goals

Ved at gennemgå denne FAQ vil du:
- Finde hurtige svar på almindelige spørgsmål og problemer med Azure Developer CLI
- Forstå nøglebegreber og terminologi gennem et praktisk Q&A-format
- Få adgang til fejlfinding for hyppige problemer og fejlsituationer
- Lære bedste praksis gennem ofte stillede spørgsmål om optimering
- Opdage avancerede funktioner og muligheder gennem ekspertspørgsmål
- Henvise til vejledning om omkostninger, sikkerhed og implementeringsstrategi effektivt

## Learning Outcomes

Ved regelmæssig reference til denne FAQ vil du være i stand til at:
- Løse almindelige Azure Developer CLI-problemer selvstændigt ved hjælp af de angivne løsninger
- Tage informerede beslutninger om implementeringsstrategier og konfigurationer
- Forstå sammenhængen mellem azd og andre Azure-værktøjer og -tjenester
- Anvende bedste praksis baseret på fællesskabserfaring og ekspertanbefalinger
- Fejlsøge autentificering, implementering og konfigurationsproblemer effektivt
- Optimere omkostninger og ydeevne ved hjælp af FAQ-indsigter og anbefalinger

## Table of Contents

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) er et udviklercentreret kommandolinjeværktøj, der forkorter den tid, det tager at få din applikation fra det lokale udviklingsmiljø til Azure. Det leverer bedste praksis via skabeloner og hjælper med hele implementeringslivscyklussen.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Generelt værktøj til administration af Azure-ressourcer
- **azd**: Udviklerfokuseret værktøj til applikationsimplementeringsarbejdsgange
- azd bruger Azure CLI internt, men tilbyder højere abstraktioner for almindelige udviklerscenarier
- azd inkluderer skabeloner, miljøstyring og automatisering af implementeringer

### Q: Do I need Azure CLI installed to use azd?
**A**: Ja, azd kræver Azure CLI til autentificering og nogle operationer. Installer Azure CLI først, og installer derefter azd.

### Q: What programming languages does azd support?
**A**: azd er sprogagnostisk. Det fungerer med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statisk websites
- Containeriserede applikationer

### Q: Can I use azd with existing projects?
**A**: Ja! Du kan enten:
1. Brug `azd init` for at tilføje azd-konfiguration til eksisterende projekter
2. Tilpasse eksisterende projekter til at matche azd-skabelonstrukturen
3. Oprette brugerdefinerede skabeloner baseret på din eksisterende arkitektur

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Brug `azd auth login`, som vil åbne et browservindue til Azure-autentificering. Til CI/CD-scenarier skal du bruge tjenesteprincipaler eller managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Ja. Brug `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` for at specificere, hvilken subscription der skal bruges for hvert miljø.

### Q: What permissions do I need to deploy with azd?
**A**: Typisk har du brug for:
- **Contributor**-rolle på resource group eller subscription
- **User Access Administrator** hvis du implementerer ressourcer, der kræver rolle-tildelinger
- Specifikke tilladelser varierer efter skabelon og de ressourcer, der implementeres

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolut! azd er designet til CI/CD-integration. Brug tjenesteprincipaler til autentificering og indstil miljøvariabler til konfiguration.

### Q: How do I handle authentication in GitHub Actions?
**A**: Brug Azure Login-handlingen med tjenesteprincipal-legitimationsoplysninger:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Officielle skabeloner: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Fællesskabsskabeloner: Søg på GitHub efter "azd-template"
- Brug `azd template list` for at gennemse tilgængelige skabeloner

### Q: How do I create a custom template?
**A**: 
1. Start med en eksisterende skabelonstruktur
2. Ændr `azure.yaml`, infrastrukturfiler og applikationskode
3. Test grundigt med `azd up`
4. Publicer til GitHub med passende tags

### Q: Can I use azd without a template?
**A**: Ja, brug `azd init` i et eksisterende projekt for at skabe de nødvendige konfigurationsfiler. Du skal manuelt konfigurere `azure.yaml` og infrastrukturfilerne.

### Q: What's the difference between official and community templates?
**A**: 
- **Official templates**: Vedligeholdes af Microsoft, opdateres regelmæssigt, omfattende dokumentation
- **Community templates**: Oprettet af udviklere, kan have specialiserede brugssager, varierende kvalitet og vedligeholdelse

### Q: How do I update a template in my project?
**A**: Skabeloner opdateres ikke automatisk. Du kan:
1. Manuel sammenligne og flette ændringer fra kildeskabelonen
2. Starte forfra med `azd init` ved brug af den opdaterede skabelon
3. Cherry-picke specifikke forbedringer fra opdaterede skabeloner

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd kan implementere enhver Azure-tjeneste gennem Bicep/ARM-skabeloner, herunder:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netværk, sikkerhed og overvågningsressourcer

### Q: Can I deploy to multiple regions?
**A**: Ja, konfigurer flere regioner i dine Bicep-skabeloner og indstil location-parameteren passende for hvert miljø.

### Q: How do I handle database schema migrations?
**A**: Brug deploymentshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Ja, brug `azd provision` for kun at implementere infrastrukturkomponenterne defineret i dine skabeloner.

### Q: How do I deploy to existing Azure resources?
**A**: Dette er komplekst og ikke direkte understøttet. Du kan:
1. Importere eksisterende ressourcer i dine Bicep-skabeloner
2. Bruge referencer til eksisterende ressourcer i skabeloner
3. Ændre skabeloner til betinget at oprette eller referere til ressourcer

### Q: Can I use Terraform instead of Bicep?
**A**: I øjeblikket understøtter azd primært Bicep/ARM-skabeloner. Terraform-understøttelse er ikke officielt tilgængelig, selvom fællesskabsløsninger kan eksistere.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Opret separate miljøer med `azd env new <environment-name>` og konfigurer forskellige indstillinger for hver:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: I `.azure`-mappen i dit projektbibliotek. Hvert miljø har sin egen mappe med konfigurationsfiler.

### Q: How do I set environment-specific configuration?
**A**: Brug `azd env set` til at konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: `.azure`-mappen indeholder følsomme oplysninger og bør ikke committes til versionskontrol. I stedet:
1. Dokumenter nødvendige miljøvariabler
2. Brug deploymentsscripts til at konfigurere miljøer
3. Brug Azure Key Vault til følsom konfiguration

### Q: How do I override template defaults?
**A**: Indstil miljøvariabler, der svarer til skabelonparametrene:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Almindelige årsager:
1. **Autentificeringsproblemer**: Kør `azd auth login`
2. **Utilstrækkelige rettigheder**: Tjek dine Azure-rolle-tildelinger
3. **Navnekonflikter for ressourcer**: Skift AZURE_ENV_NAME
4. **Kvote-/kapacitetsproblemer**: Tjek regional tilgængelighed
5. **Skabelonfejl**: Valider Bicep-skabeloner

### Q: How do I debug deployment failures?
**A**: 
1. Brug `azd deploy --debug` for detaljeret output
2. Tjek implementeringshistorikken i Azure-portalen
3. Gennemse Activity Log i Azure-portalen
4. Brug `azd show` for at vise den aktuelle miljøstatus

### Q: Why are my environment variables not working?
**A**: Tjek:
1. Variabelnavne matcher skabelonparametrene nøjagtigt
2. Værdier er korrekt citeret, hvis de indeholder mellemrum
3. Miljøet er valgt: `azd env select <environment>`
4. Variabler er sat i det korrekte miljø

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Dette fjerner alle ressourcer og miljøkonfiguration.

### Q: Why is my application not accessible after deployment?
**A**: Tjek:
1. Implementeringen blev gennemført korrekt
2. Applikationen kører (tjek logs i Azure-portalen)
3. Netværkssikkerhedsgrupper tillader trafik
4. DNS/custom domæner er konfigureret korrekt

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Omkostninger afhænger af:
- Azure-tjenester der implementeres
- Valgte service tiers/SKUs
- Regionale prisforskelle
- Brugsmønstre

Brug [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) til estimater.

### Q: How do I control costs in azd deployments?
**A**: 
1. Brug lavere tier-SKUs til udviklingsmiljøer
2. Opsæt Azure-budgetter og advarsler
3. Brug `azd down` til at fjerne ressourcer, når de ikke er nødvendige
4. Vælg passende regioner (omkostninger varierer efter lokation)
5. Brug Azure Cost Management-værktøjer

### Q: Are there free tier options for azd templates?
**A**: Mange Azure-tjenester tilbyder gratis niveauer:
- App Service: Gratis niveau tilgængeligt
- Azure Functions: 1M gratis udførsler/måned
- Cosmos DB: Gratis niveau med 400 RU/s
- Application Insights: Første 5GB/måned gratis

Konfigurer skabeloner til at bruge gratis niveauer, hvor det er muligt.

### Q: How do I estimate costs before deployment?
**A**: 
1. Gennemgå skabelonens `main.bicep` for at se, hvilke ressourcer der oprettes
2. Brug Azure Pricing Calculator med specifikke SKUs
3. Implementer først i et udviklingsmiljø for at overvåge faktiske omkostninger
4. Brug Azure Cost Management til detaljeret omkostningsanalyse

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Hold applikationskode adskilt fra infrastrukturen
2. Brug meningsfulde servicenavne i `azure.yaml`
3. Implementer korrekt fejlhåndtering i build-scripts
4. Brug miljøspecifik konfiguration
5. Inkluder omfattende dokumentation

### Q: How should I organize multiple services in azd?
**A**: Brug den anbefalede struktur:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **Nej!** `.azure`-mappen indeholder følsomme oplysninger. Tilføj den til `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Brug Azure Key Vault til hemmeligheder
2. Referer Key Vault-hemmeligheder i applikationskonfiguration
3. Commit aldrig hemmeligheder til versionskontrol
4. Brug managed identities til service-til-service-autentificering

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Brug separate miljøer for hver fase (dev/staging/prod)
2. Implementer automatiserede tests før implementering
3. Brug tjenesteprincipaler til autentificering
4. Gem følsom konfiguration i pipeline-secrets/variabler
5. Implementer godkendelses-gates til produktion

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Ja, gennem deploymentshooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Brug azd-kommandoer i eksisterende pipelinescripts
2. Standardiser på azd-skabeloner på tværs af teams
3. Integrer med eksisterende overvågning og alarmering
4. Brug azd's JSON-output til pipelineintegration

### Q: Can I use azd with Azure DevOps?
**A**: Ja, azd fungerer med ethvert CI/CD-system. Opret Azure DevOps-pipelines, der bruger azd-kommandoer.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd-værktøj**: Bidrag til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Skabeloner**: Opret skabeloner i overensstemmelse med [skabelonretningslinjerne](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentation**: Bidrag til dokumentationen på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Hvad er køreplanen for azd?
**A**: Se den [officielle køreplan](https://github.com/Azure/azure-dev/projects) for planlagte funktioner og forbedringer.

### Q: Hvordan migrerer jeg fra andre udrulningsværktøjer til azd?
**A**: 
1. Analyser den nuværende udrulningsarkitektur
2. Opret tilsvarende Bicep-skabeloner
3. Konfigurer `azure.yaml` så det matcher de nuværende tjenester
4. Test grundigt i udviklingsmiljøet
5. Migrer miljøer gradvist

---

## Har du stadig spørgsmål?

### **Søg først**
- Se den [officielle dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Søg i [GitHub issues](https://github.com/Azure/azure-dev/issues) efter lignende problemer

### **Få hjælp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Fællesskabsstøtte
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørgsmål
- [Azure Discord](https://discord.gg/azure) - Fællesskabschat i realtid

### **Rapportér problemer**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fejlrapporter og funktionsforespørgsler
- Inkluder relevante logfiler, fejlmeddelelser og trin til reproduktion

### **Lær mere**
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected-rammeværk](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Denne FAQ opdateres regelmæssigt. Sidst opdateret: 9. september 2025*

---

**Navigation**
- **Forrige lektion**: [Glossary](glossary.md)
- **Næste lektion**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel, menneskelig oversættelse. Vi kan ikke holdes ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->