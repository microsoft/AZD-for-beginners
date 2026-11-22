# Ofte Stillede Spørgsmål (FAQ)

**Få hjælp efter kapitel**
- **📚 Kursus Forside**: [AZD For Beginners](../README.md)
- **🚆 Installationsproblemer**: [Kapitel 1: Installation & Opsætning](../docs/chapter-01-foundation/installation.md)
- **🤖 AI Spørgsmål**: [Kapitel 2: AI-Første Udvikling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Fejlfinding**: [Kapitel 7: Fejlfinding & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denne omfattende FAQ giver svar på de mest almindelige spørgsmål om Azure Developer CLI (azd) og Azure-udrulninger. Find hurtige løsninger på almindelige problemer, forstå bedste praksis, og få afklaring om azd-koncept og arbejdsgange.

## Læringsmål

Når du gennemgår denne FAQ, vil du:
- Finde hurtige svar på ofte stillede spørgsmål og problemstillinger om Azure Developer CLI
- Forstå nøglebegreber og terminologi gennem praktisk Q&A-format
- Få adgang til fejlfinding for hyppige problemer og fejlscenarier
- Lære bedste praksis gennem almindeligt stillede optimeringsspørgsmål
- Opdage avancerede funktioner og muligheder gennem ekspertniveau-spørgsmål
- Effekivt henvise til vejledning om omkostninger, sikkerhed og udrulningsstrategi

## Læringsresultater

Ved regelmæssigt at henvise til denne FAQ vil du kunne:
- Selvstændigt løse almindelige Azure Developer CLI-problemer ved brug af de angivne løsninger
- Træffe velinformerede beslutninger om udrulningsstrategier og konfigurationer
- Forstå sammenhængen mellem azd og andre Azure-værktøjer og -tjenester
- Anvende bedste praksis baseret på fællesskabserfaring og ekspertanbefalinger
- Effektivt fejlsøge autentificerings-, udrulnings- og konfigurationsproblemer
- Optimere omkostninger og ydeevne ved hjælp af FAQ-indblik og anbefalinger

## Indholdsfortegnelse

- [Kom i gang](#getting-started)
- [Autentificering & Adgang](#authentication--access)
- [Skabeloner & Projekter](#templates--projects)
- [Udrulning & Infrastruktur](#deployment--infrastructure)
- [Konfiguration & Miljøer](#configuration--environments)
- [Fejlfinding](#troubleshooting)
- [Omkostninger & Fakturering](#cost--billing)
- [Bedste Praksis](#best-practices)
- [Avancerede Emner](#advanced-topics)

---

## Kom i gang

### Q: Hvad er Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) er et udviklercentreret kommandolinjeværktøj, der fremskynder den tid, det tager at få din applikation fra den lokale udviklingsmiljø til Azure. Det leverer bedste praksis via skabeloner og hjælper med hele udrulningslivscyklussen.

### Q: Hvordan adskiller azd sig fra Azure CLI?
**A**: 
- **Azure CLI**: Generelt værktøj til at administrere Azure-ressourcer
- **azd**: Udviklerfokuseret værktøj til applikationsudrulningsarbejdsgange
- azd har sin egen autentificerings- og udrulningsarbejdsgang; Azure CLI er et separat, supplerende værktøj
- azd inkluderer skabeloner, miljøstyring og udrulningsautomatisering

### Q: Skal jeg have Azure CLI installeret for at bruge azd?
**A**: Ikke til den grundlæggende AZD-arbejdsgang. Autentificer med `azd auth login`. Installer Azure CLI separat, når en skabelon-hook eller en øvelse eksplicit kører `az`-kommandoer.

### Q: Hvilke programmeringssprog understøtter azd?
**A**: azd er sprogunafhængig. Det fungerer med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statisk websites
- Containeriserede applikationer

### Q: Kan jeg bruge azd med eksisterende projekter?
**A**: Ja! Du kan enten:
1. Bruge `azd init` til at tilføje azd-konfiguration til eksisterende projekter
2. Tilpasse eksisterende projekter til at matche azd-skabelonstrukturen
3. Oprette brugerdefinerede skabeloner baseret på din eksisterende arkitektur

### Q: Hvad ændrede sig med Foundry-udvidelsens generelle tilgængelighed?
**A**: `microsoft.foundry`-pakken nåede version 1.0 og GA den 5. november 2026. Med AZD 1.37.0+ brug `azd ext install microsoft.foundry` til at installere syv kerneudvidelser for agenter, forbindelser, inspektør, projekter, rutiner, færdigheder og værktøjskasser. Det er ikke et nyt kommando-navneområde, og dets komponenter versionsstyres uafhængigt. Evalueringer, datasæt, finjustering og brugerdefinerede modeller installeres separat; valgfrie preview-funktioner bliver ikke GA bare fordi pakken er GA.

Gennemgangen af [hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) bruger Python 3.13+ og nuværende uv. `azd ai agent run` åbner Agent Inspector lokalt, men modelkald bruger stadig Azure og medfører gebyrer. Code-mode `azd deploy` uploader kildekode til en fjernbygning uden at kræve en lokal containerbygning.

### Q: Fjerner `azd down` en hosted agent fra et eksisterende Foundry-projekt?
**A**: Ikke for den genbrugte projektsti beskrevet i hosted-agent quickstart: den efterlader projektet, hosted agenten og andre ressourcer intakte. Fjern uønskede ressourcer separat uden at slette delte ressourcer. Hvis miljøet har oprettet et nyt Foundry-projekt, sletter `azd down` dets ressourcegruppe og alt i den. Gennemgå [vejledning til oprydning](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) og slettebekræftelser før bekræftelse.

---

## Godkendelse & Adgang

### Q: Hvordan godkender jeg med Azure ved hjælp af azd?
**A**: Brug `azd auth login`, som åbner et browservindue til Azure-godkendelse. Til CI/CD-scenarier anvendes service principals eller managed identities.

### Q: Kan jeg bruge azd med flere Azure-abonnementer?
**A**: Ja. Brug `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` til at angive hvilket abonnement, der skal bruges for hvert miljø.

### Q: Hvilke tilladelser har jeg brug for til deployment med azd?
**A**: Typisk skal du have:
- **Contributor**-rollen på ressourcegruppen eller abonnementet
- **User Access Administrator** hvis du deployer ressourcer, der kræver rolle-tildelinger
- Specifikke tilladelser varierer efter skabelon og de ressourcer, der deployeres

### Q: Kan jeg bruge azd i CI/CD pipelines?
**A**: Absolut! azd er designet til CI/CD-integration. Brug service principals til godkendelse og sæt miljøvariabler for konfiguration.

### Q: Hvordan håndterer jeg godkendelse i GitHub Actions?
**A**: Foretræk workload identity federation (OIDC), konfigureret med `azd pipeline config`. Det genererede workflow installerer AZD og godkender AZD direkte med en fødereret identitet. Et `azure/login`-trin alene etablerer ikke en AZD-login. Et login-trin i en eksisterende job er:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provisions- eller deployment efter login med det tilsigtede AZD-miljø, abonnement og lokation konfigureret. Identitetens fødererede legitimationsoplysninger skal stole på workflowets repository/ref eller GitHub-miljø, og dens Azure-roller skal tillade de anmodede operationer.

---

## Skabeloner & Projekter

### Q: Hvor kan jeg finde azd-skabeloner?
**A**: 
- Officielle og fællesskabsskabeloner: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Fællesskabsskabeloner: GitHub-søgning efter "azd-template"
- Brug `azd template list` til at gennemse tilgængelige skabeloner

### Q: Hvordan opretter jeg en brugerdefineret skabelon?
**A**: 
1. Start med en eksisterende skabelonstruktur
2. Rediger `azure.yaml`, infrastrukturfiler og applikationskode
3. Test grundigt med `azd up`
4. Publicer til GitHub med passende tags

### Q: Kan jeg bruge azd uden en skabelon?
**A**: Ja, brug `azd init` i et eksisterende projekt for at oprette de nødvendige konfigurationsfiler. Du skal manuelt konfigurere `azure.yaml` og infrastrukturfiler.

### Q: Hvad er forskellen på officielle og fællesskabsskabeloner?
**A**: 
- **Officielle skabeloner**: Vedligeholdt af Microsoft, regelmæssigt opdateret, omfattende dokumentation
- **Fællesskabsskabeloner**: Oprettet af udviklere, kan have specialiserede anvendelsestilfælde, varierende kvalitet og vedligeholdelse

### Q: Hvordan opdaterer jeg en skabelon i mit projekt?
**A**: Skabeloner opdateres ikke automatisk. Du kan:
1. Manuel sammenligne og fusionere ændringer fra den oprindelige skabelon
2. Starte forfra med `azd init` ved brug af den opdaterede skabelon
3. Udvælge specifikke forbedringer fra opdaterede skabeloner

---

## Deployment & Infrastruktur

### Q: Hvilke Azure-tjenester kan azd deploye?
**A**: azd kan deploye enhver Azure-tjeneste gennem Bicep/ARM-skabeloner, inklusive:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netværks-, sikkerheds- og overvågningsressourcer

### Q: Kan jeg deploye til flere regioner?
**A**: Ja, konfigurer flere regioner i dine Bicep-skabeloner og sæt lokationsparametret passende for hvert miljø.

### Q: Hvordan håndterer jeg database-skema-migrationer?
**A**: Brug deployment hooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Kan jeg kun deploye infrastrukturen uden applikationer?
**A**: Ja, brug `azd provision` til kun at deploye infrastrukturopbygningen defineret i dine skabeloner.

### Q: Hvordan deployer jeg til eksisterende Azure-ressourcer?
**A**: Ja, hvis skabelonen understøtter det. Referer til eksisterende ressourcer med Biceps `existing`-deklarationer eller skabelonens dokumenterede eksisterende ressource-parametre, og kortlæg applikationstjenester til de tilsigtede mål. Dette importerer ikke ejerskab eller skaber automatisk manglende tilladelser. Gennemgå skabelonen før deployment.

### Q: Kan jeg bruge Terraform i stedet for Bicep?
**A**: Ja. AZD understøtter Terraform såvel som Bicep. Vælg en Terraform-baseret skabelon eller konfigurer `infra.provider: terraform` i `azure.yaml`, med passende Terraform-filer og state/backend-konfiguration. Se [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguration & Miljøer

### Q: Hvordan håndterer jeg forskellige miljøer (dev, staging, prod)?
**A**: Opret separate miljøer med `azd env new <environment-name>` og konfigurer forskellige indstillinger for hvert:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Hvor gemmes miljøkonfigurationer?
**A**: I `.azure`-mappen i din projektmappe. Hvert miljø har sin egen mappe med konfigurationsfiler.

### Q: Hvordan sætter jeg miljøspecifik konfiguration?
**A**: Brug `azd env set` til at konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Kan jeg dele miljøkonfigurationer blandt teammedlemmer?
**A**: `.azure`-mappen indeholder følsomme oplysninger og bør ikke committes til versionskontrol. I stedet:
1. Dokumenter påkrævede miljøvariabler
2. Brug deploymentscripts til at sætte miljøer op
3. Brug Azure Key Vault til følsom konfiguration

### Q: Hvordan tilsidesætter jeg skabelonstandarder?
**A**: Sæt miljøvariabler, som svarer til skabelonparametre:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Kun variabler, som forbruges af skabelonen, påvirker deployment. `SKU_NAME` ovenfor er et eksempel på brugerdefineret input, ikke en universel AZD-indstilling.

---

## Fejlfinding

### Q: Hvorfor fejler `azd up`?
**A**: Almindelige årsager:
1. **Godkendelsesproblemer**: Kør `azd auth login`
2. **Utilstrækkelige tilladelser**: Tjek dine Azure-rolle-tildelinger
3. **Ressourcenavnekonflikter**: Gennemgå den konfliktende ressource og skabelonens navngivningsinput; opret et separat miljø med `azd env new` ved behov for isolation
4. **Kvote-/kapacitetsproblemer**: Tjek regional tilgængelighed
5. **Skabelonfejl**: Valider Bicep-skabeloner

### Q: Hvordan debugger jeg deploymentsfejl?
**A**: 
1. Brug `azd deploy --debug` for detaljeret output
2. Tjek Azure-portals deploymentshistorik
3. Gennemgå aktivitetloggen i Azure-portalen
4. Brug `azd show` til at vise aktuelt miljøstatus

### Q: Hvorfor virker mine miljøvariabler ikke?
**A**: Tjek:
1. Variabelnavne matcher skabelonparametre præcist
2. Værdier er korrekt citeret, hvis de indeholder mellemrum
3. Miljøet er valgt: `azd env select <environment>`
4. Variabler er sat i det korrekte miljø

### Q: Hvordan rydder jeg op efter mislykkede deployments?
**A**: 
```bash
azd down
```
Gennemgå først valgte miljø og slettebekræftelse. Dette sletter provisionerede Azure-ressourcer, ikke lokale `.azure` miljøkonfigurationer. `--purge` anmoder desuden om permanent sletning af understøttede blødslettede ressourcer og kan blokeres af opbevarings-/rensningsbeskyttelse; det er ikke et rutinemæssigt recovery-trin.

### Q: Hvorfor er min applikation ikke tilgængelig efter deployment?
**A**: Tjek:
1. Deployment er gennemført succesfuldt
2. Applikationen kører (tjek logs i Azure-portalen)
3. Netværkssikkerhedsgrupper tillader trafik
4. DNS/brugertilpassede domæner er konfigureret korrekt

---

## Omkostninger & Fakturering

### Q: Hvor meget vil azd deployments koste?
**A**: Omkostninger afhænger af:
- Azure-tjenester, der deployeres
- Valgte servicelag/SKU’er
- Regionale prisforskelle
- Brugsmønstre

Brug [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) til estimater.

### Q: Hvordan kontrollerer jeg omkostninger i azd deployments?
**A**: 
1. Brug lavere tier-SKU’er til udviklingsmiljøer
2. Opret Azure-budgetter og -alarmer
3. Brug `azd down` til at fjerne ressourcer, når de ikke er nødvendige
4. Vælg passende regioner (omkostninger varierer efter lokation)
5. Brug Azure Cost Management-værktøjer

### S: Findes der gratis planer for azd skabeloner?
**S**: Nogle tjenester har gratis SKU'er eller månedlige tilskud, afhængig af berettigelse, hostingplan, region og abonnementbegrænsninger. Dette gør ikke en hel skabelon gratis: databaser, søgning, netværk, registre, telemetri og modelinference kan pålægge gebyrer uafhængigt. Tjek [Azure gratis tjenester liste](https://azure.microsoft.com/free/) og aktuel prisfastsættelse for hver ressource før udrulning.

### S: Hvordan estimerer jeg omkostninger før udrulning?
**S**: 
1. Gennemgå skabelonens `main.bicep` for at se hvilke ressourcer der oprettes
2. Brug Azure Prisberegner med specifikke SKU'er
3. Udrul først til et udviklingsmiljø for at overvåge faktiske omkostninger
4. Brug Azure Omkostningsstyring til detaljeret omkostningsanalyse

---

## Bedste Praksis

### S: Hvad er bedste praksis for azd projektstruktur?
**S**: 
1. Hold applikationskode adskilt fra infrastruktur
2. Brug meningsfulde tjenestenavne i `azure.yaml`
3. Implementer korrekt fejlhåndtering i build scripts
4. Brug miljøspecifik konfiguration
5. Inkluder omfattende dokumentation

### S: Hvordan skal jeg organisere flere tjenester i azd?
**S**: Brug den anbefalede struktur:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### S: Skal jeg committe `.azure` mappen til versionskontrol?
**S**: **Nej!** `.azure` mappen indeholder følsomme oplysninger. Tilføj den til `.gitignore`:
```gitignore
.azure/
```

### S: Hvordan håndterer jeg hemmeligheder og følsom konfiguration?
**S**: 
1. Brug Azure Key Vault til hemmeligheder
2. Referer Key Vault hemmeligheder i applikationskonfigurationen
3. Committ aldrig hemmeligheder til versionskontrol
4. Brug administrerede identiteter til tjeneste-til-tjeneste godkendelse

### S: Hvad er den anbefalede tilgang til CI/CD med azd?
**S**: 
1. Brug separate miljøer for hver fase (dev/staging/prod)
2. Implementer automatiserede tests før udrulning
3. Brug tjenesteprincipaler til godkendelse
4. Gem følsom konfiguration i pipeline hemmeligheder/variabler
5. Implementer godkendelsesporte for produktionsudrulninger

---

## Avancerede Emner

### S: Kan jeg udvide azd med brugerdefineret funktionalitet?
**S**: Ja, gennem udrulningskroge i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Hvordan integrerer jeg azd med eksisterende DevOps-processer?
**S**: 
1. Brug azd kommandoer i eksisterende pipeline scripts
2. Standardiser azd skabeloner på tværs af teams
3. Integrer med eksisterende overvågning og alarmering
4. Brug azd's JSON output til pipeline integration

### S: Kan jeg bruge azd med Azure DevOps?
**S**: Ja, azd fungerer med ethvert CI/CD system. Opret Azure DevOps pipelines, der bruger azd kommandoer.

### S: Hvordan bidrager jeg til azd eller opretter community skabeloner?
**S**: 
1. **azd værktøj**: Bidrag til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Skabeloner**: Følg [Awesome AZD galleri bidragsinstruktioner](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentation**: Bidrag til docs på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### S: Hvad er roadmap for azd?
**S**: Tjek den [officielle roadmap](https://github.com/Azure/azure-dev/projects) for planlagte funktioner og forbedringer.

### S: Hvordan migrerer jeg fra andre udrulningsværktøjer til azd?
**S**: 
1. Analyser nuværende udrulningsarkitektur
2. Opret tilsvarende Bicep-skabeloner
3. Konfigurer `azure.yaml` til at matche nuværende tjenester
4. Test grundigt i udviklingsmiljø
5. Migrer miljøer gradvist

---

## Har du stadig spørgsmål?

### **Søg først**
- Tjek [den officielle dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Søg i [GitHub issues](https://github.com/Azure/azure-dev/issues) efter lignende problemer

### **Få hjælp**
- [GitHub Diskussioner](https://github.com/Azure/azure-dev/discussions) - Fællesskabsstøtte
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørgsmål
- [Azure Discord](https://discord.gg/azure) - Realtids fællesskab chat

### **Rapporter problemer**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fejlrapporter og funktionsønsker
- Inkluder relevante logfiler, fejlkoder og reproduktionsskridt

### **Lær mere**
- [Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Teknisk vejledning gennemgået: 4. november 2026. Cloud-tilgængelighed og prisfastsættelse skal tjekkes for dit abonnement og region.*

---

**Navigation**
- **Forrige lektion**: [Glossar](glossary.md)
- **Næste lektion**: [Studieguide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->