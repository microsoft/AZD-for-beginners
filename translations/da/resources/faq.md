# Ofte Stillede Spørgsmål (FAQ)

**Få Hjælp efter Kapitel**
- **📚 Kursus Hjem**: [AZD For Beginners](../README.md)
- **🚆 Installationsproblemer**: [Kapitel 1: Installation & Opsætning](../docs/chapter-01-foundation/installation.md)
- **🤖 AI-spørgsmål**: [Kapitel 2: AI-First Udvikling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Fejlfinding**: [Kapitel 7: Fejlfinding & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denne omfattende FAQ giver svar på de mest almindelige spørgsmål om Azure Developer CLI (azd) og Azure-implementeringer. Find hurtige løsninger på typiske problemer, forstå bedste praksis, og få afklaring på azd-koncepter og arbejdsprocesser.

## Læringsmål

Ved at gennemgå denne FAQ vil du:
- Finde hurtige svar på almindelige Azure Developer CLI spørgsmål og problemer
- Forstå nøglebegreber og terminologi gennem praktisk Q&A-format
- Få adgang til fejlfinding for hyppige problemer og fejlsituationer
- Lære bedste praksis via ofte stillede spørgsmål om optimering
- Opdage avancerede funktioner og muligheder gennem ekspertspørgsmål
- Effektivt referere til vejledning om omkostninger, sikkerhed og implementeringsstrategi

## Læringsresultater

Ved regelmæssig brug af denne FAQ vil du kunne:
- Selvstændigt løse almindelige Azure Developer CLI-problemer med de givne løsninger
- Træffe informerede beslutninger om implementeringsstrategier og konfigurationer
- Forstå forholdet mellem azd og andre Azure-værktøjer og -tjenester
- Anvende bedste praksis baseret på fællesskabserfaring og ekspertanbefalinger
- Effektivt fejlfinde autentificerings-, implementerings- og konfigurationsproblemer
- Optimere omkostninger og ydeevne ved brug af FAQ-indsigter og anbefalinger

## Indholdsfortegnelse

- [Kom godt i gang](#getting-started)
- [Autentificering & Adgang](#authentication--access)
- [Skabeloner & Projekter](#templates--projects)
- [Implementering & Infrastruktur](#deployment--infrastructure)
- [Konfiguration & Miljøer](#configuration--environments)
- [Fejlfinding](#troubleshooting)
- [Omkostninger & Fakturering](#cost--billing)
- [Bedste Praksis](#best-practices)
- [Avancerede Emner](#advanced-topics)

---

## Kom godt i gang

### Q: Hvad er Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) er et udviklercentreret kommandolinjeværktøj, der forkorter tiden det tager at få din applikation fra lokal udviklingsmiljø til Azure. Det leverer bedste praksis gennem skabeloner og hjælper med hele implementeringslivscyklussen.

### Q: Hvordan adskiller azd sig fra Azure CLI?
**A**: 
- **Azure CLI**: Generelt værktøj til styring af Azure-ressourcer
- **azd**: Udviklerfokuseret værktøj til applikationsimplementerings-arbejdsprocesser
- azd har sin egen autentifikations- og implementeringsworkflow; Azure CLI er et separat, supplerende værktøj
- azd inkluderer skabeloner, miljøstyring og implementeringsautomatisering

### Q: Skal jeg have Azure CLI installeret for at bruge azd?
**A**: Ikke til den kerne AZD-arbejdsproces. Autentificer med `azd auth login`. Installer Azure CLI separat, når en skabelon-hook eller en øvelse eksplicit kører `az`-kommandoer.

### Q: Hvilke programmeringssprog understøtter azd?
**A**: azd er sproguniversel. Det fungerer med:
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

---

## Autentificering & Adgang

### Q: Hvordan autentificerer jeg med Azure ved brug af azd?
**A**: Brug `azd auth login` som åbner et browservindue til Azure-autentificering. Til CI/CD-scenarier brug serviceprincipaler eller styrede identiteter.

### Q: Kan jeg bruge azd med flere Azure-abonnementer?
**A**: Ja. Brug `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` til at angive hvilket abonnement der skal bruges for hvert miljø.

### Q: Hvilke rettigheder skal jeg have for at implementere med azd?
**A**: Typisk har du brug for:
- **Contributor**-rollen på ressourcegruppen eller abonnementet
- **User Access Administrator**, hvis du implementerer ressourcer der kræver rolle-tildelinger
- Specifikke tilladelser varierer efter skabelon og de ressourcer der implementeres

### Q: Kan jeg bruge azd i CI/CD-pipelines?
**A**: Absolut! azd er designet til CI/CD-integration. Brug serviceprincipaler til autentificering og sæt miljøvariabler til konfiguration.

### Q: Hvordan håndterer jeg autentificering i GitHub Actions?
**A**: Foretræk workload identity federation (OIDC), konfigureret med `azd pipeline config`. Den genererede workflow installerer AZD og autentificerer AZD direkte med en fødereret identitet. En `azure/login`-trin alene etablerer ikke en AZD-login. Et logintrin inden for et eksisterende job er:
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

Provisionér eller implementér efter login med det tilsigtede AZD-miljø, abonnement og placering konfigureret. Identity's fødererede legitimationsoplysninger skal have tillid til workflowens repository/ref eller GitHub-miljø, og dets Azure-roller skal tillade de forespurgte operationer.

---

## Skabeloner & Projekter

### Q: Hvor kan jeg finde azd-skabeloner?
**A**: 
- Officielle og fællesskabsskabeloner: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Fællesskabsskabeloner: GitHub-søgning på "azd-template"
- Brug `azd template list` til at gennemse tilgængelige skabeloner

### Q: Hvordan opretter jeg en brugerdefineret skabelon?
**A**: 
1. Start med en eksisterende skabelonstruktur
2. Rediger `azure.yaml`, infrastrukturfiler og applikationskode
3. Test grundigt med `azd up`
4. Publicer til GitHub med passende tags

### Q: Kan jeg bruge azd uden en skabelon?
**A**: Ja, brug `azd init` i et eksisterende projekt for at oprette nødvendige konfigurationsfiler. Du skal manuelt konfigurere `azure.yaml` og infrastrukturfiler.

### Q: Hvad er forskellen på officielle og fællesskabsskabeloner?
**A**: 
- **Officielle skabeloner**: Vedligeholdt af Microsoft, regelmæssigt opdateret, omfattende dokumentation
- **Fællesskabsskabeloner**: Oprettet af udviklere, kan have specialiserede anvendelser, varieret kvalitet og vedligeholdelse

### Q: Hvordan opdaterer jeg en skabelon i mit projekt?
**A**: Skabeloner opdateres ikke automatisk. Du kan:
1. Manuelt sammenligne og flette ændringer fra kildeskabelonen
2. Starte forfra med `azd init` ved brug af den opdaterede skabelon
3. Plukke specifikke forbedringer fra opdaterede skabeloner

---

## Implementering & Infrastruktur

### Q: Hvilke Azure-tjenester kan azd implementere?
**A**: azd kan implementere enhver Azure-tjeneste via Bicep/ARM-skabeloner, herunder:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netværks-, sikkerheds- og overvågningsressourcer

### Q: Kan jeg implementere til flere regioner?
**A**: Ja, konfigurer flere regioner i dine Bicep-skabeloner, og sæt locationsparameteren passende for hvert miljø.

### Q: Hvordan håndterer jeg database-skema-migrationer?
**A**: Brug implementeringshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Kan jeg kun implementere infrastructure uden applikationer?
**A**: Ja, brug `azd provision` til kun at implementere infrastrukturkomponenterne defineret i dine skabeloner.

### Q: Hvordan implementerer jeg til eksisterende Azure-ressourcer?
**A**: Ja, når skabelonen understøtter det. Referer eksisterende ressourcer med Biceps `existing`-erklæringer eller skabelonens dokumenterede eksisterende-ressourceparametre, og kortlæg applikationstjenester til deres tilsigtede mål. Dette importerer ikke ejerskab og opretter ikke automatisk manglende tilladelser. Gennemgå skabelonen før implementering.

### Q: Kan jeg bruge Terraform i stedet for Bicep?
**A**: Ja. AZD understøtter både Terraform og Bicep. Vælg en Terraform-baseret skabelon eller konfigurer `infra.provider: terraform` i `azure.yaml` med passende Terraform-filer og state/backend-konfiguration. Se [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

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
**A**: I `.azure`-mappen inden for din projektmappe. Hvert miljø har sin egen mappe med konfigurationsfiler.

### Q: Hvordan sætter jeg miljøspecifik konfiguration?
**A**: Brug `azd env set` til at konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Kan jeg dele miljøkonfigurationer blandt teammedlemmer?
**A**: `.azure`-mappen indeholder følsomme oplysninger og bør ikke committes til versionskontrol. I stedet:
1. Dokumenter nødvendige miljøvariabler
2. Brug implementeringsscripts til at opsætte miljøer
3. Brug Azure Key Vault til følsom konfiguration

### Q: Hvordan tilsidesætter jeg skabelonens standardværdier?
**A**: Sæt miljøvariabler der svarer til skabelonparametre:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Kun de variabler, som skabelonen bruger, påvirker implementeringen. `SKU_NAME` ovenfor er et eksempel på brugerdefineret input, ikke en universel AZD-indstilling.

---

## Fejlfinding

### Q: Hvorfor fejler `azd up`?
**A**: Almindelige årsager:
1. **Autentificeringsproblemer**: Kør `azd auth login`
2. **Utilstrækkelige tilladelser**: Tjek dine Azure-rolle-tildelinger
3. **Ressourcenavnesammenstød**: Gennemgå den konfliktende ressource og skabelonens navneinput; opret et separat miljø med `azd env new` når isolation er nødvendig
4. **Kvote-/kapacitetsproblemer**: Tjek regional tilgængelighed
5. **Skabelonfejl**: Valider Bicep-skabeloner

### Q: Hvordan debugger jeg implementeringsfejl?
**A**: 
1. Brug `azd deploy --debug` for detaljeret output
2. Tjek implementeringshistorik i Azure-portalen
3. Gennemgå Aktivitetslog i Azure-portalen
4. Brug `azd show` til at vise aktuel miljøstatus

### Q: Hvorfor virker mine miljøvariabler ikke?
**A**: Tjek:
1. Variabelnavne matcher skabelonparametre præcist
2. Værdier er korrekt citerede, hvis de indeholder mellemrum
3. Miljøet er valgt: `azd env select <environment>`
4. Variablerne er sat i det korrekte miljø

### Q: Hvordan rydder jeg op efter mislykkede implementeringer?
**A**: 
```bash
azd down
```
Gennemgå først det valgte miljø og sletningsbekræftelse. Dette sletter implementerede Azure-ressourcer, ikke den lokale `.azure` miljøkonfiguration. `--purge` anmoder desuden om permanent sletning af understøttede soft-slettede ressourcer og kan blive blokeret af beholdelses-/rensningsbeskyttelse; det er ikke et rutinemæssigt genoprettelsestrin.

### Q: Hvorfor er min applikation ikke tilgængelig efter implementering?
**A**: Tjek:
1. Implementeringen er gennemført succesfuldt
2. Applikationen kører (tjek logs i Azure-portalen)
3. Netværkssikkerhedsgrupper tillader trafik
4. DNS/custom domains er konfigureret korrekt

---

## Omkostninger & Fakturering

### Q: Hvor meget vil azd-implementeringer koste?
**A**: Omkostninger afhænger af:
- Azure-tjenester der implementeres
- Valgte service-tier/SKU’er
- Regionale prisforskelle
- Brugenmønstre

Brug [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) til estimater.

### Q: Hvordan styrer jeg omkostninger i azd-implementeringer?
**A**: 
1. Brug lavere tier-SKU’er til udviklingsmiljøer
2. Opret Azure-budgetter og advarsler
3. Brug `azd down` til at fjerne ressourcer når de ikke er nødvendige
4. Vælg passende regioner (omkostninger varierer efter placering)
5. Brug Azure Cost Management-værktøjer

### Q: Findes der gratis tiers for azd-skabeloner?
**A**: Nogle tjenester har gratis SKU’er eller månedlige kreditter, afhængig af berettigelse, hostingplan, region og abonnement. Disse gør ikke en hel skabelon gratis: databaser, søgning, netværk, registry, telemetri og modelinferens kan påføre gebyrer selvstændigt. Tjek [Azure free services list](https://azure.microsoft.com/free/) og aktuel pris for hver ressource før implementering.

### Q: Hvordan estimerer jeg omkostninger før implementering?
**A**: 
1. Gennemgå skabelonens `main.bicep` for at se hvilke ressourcer der oprettes
2. Brug Azure Pricing Calculator med specifikke SKU’er
3. Implementér først i et udviklingsmiljø for at overvåge faktiske omkostninger
4. Brug Azure Cost Management til detaljeret omkostningsanalyse

---

## Bedste Praksis

### Q: Hvad er bedste praksis for azd projektstruktur?
**A**: 
1. Hold applikationskode adskilt fra infrastruktur
2. Brug meningsfulde tjenestenavne i `azure.yaml`
3. Implementer korrekt fejlhåndtering i build-scripts
4. Brug miljøspecifik konfiguration
5. Inkluder omfattende dokumentation

### Q: Hvordan organiserer jeg flere tjenester i azd?
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

### Q: Skal jeg committe `.azure`-mappen til versionskontrol?
**A**: **Nej!** Mappen `.azure` indeholder følsomme oplysninger. Tilføj den til `.gitignore`:
```gitignore
.azure/
```

### Q: Hvordan håndterer jeg hemmeligheder og følsom konfiguration?
**A**: 
1. Brug Azure Key Vault til hemmeligheder
2. Referer Key Vault-hemmeligheder i applikationskonfigurationen
3. Upload aldrig hemmeligheder til versionskontrol
4. Brug administrerede identiteter til service-til-service autentificering

### Q: Hvad er den anbefalede tilgang for CI/CD med azd?
**A**: 
1. Brug separate miljøer for hvert trin (dev/staging/prod)
2. Implementer automatiseret test før udrulning
3. Brug serviceprincipaler til autentificering
4. Opbevar følsom konfiguration i pipeline hemmeligheder/variabler
5. Implementer godkendelsesporte for produktionsudrulninger

---

## Avancerede Emner

### Q: Kan jeg udvide azd med brugerdefineret funktionalitet?
**A**: Ja, gennem udrulnings-hooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Hvordan integrerer jeg azd med eksisterende DevOps-processer?
**A**: 
1. Brug azd-kommandoer i eksisterende pipeline scripts
2. Standardiser på azd-skabeloner på tværs af teams
3. Integrer med eksisterende overvågning og alarmering
4. Brug azd's JSON-output til pipeline-integration

### Q: Kan jeg bruge azd med Azure DevOps?
**A**: Ja, azd fungerer med alle CI/CD-systemer. Opret Azure DevOps pipelines, der bruger azd-kommandoer.

### Q: Hvordan bidrager jeg til azd eller opretter fællesskabsskabeloner?
**A**: 
1. **azd-værktøj**: Bidrag til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Skabeloner**: Følg instruktionsguiden for [Awesome AZD-galleri bidrag](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentation**: Bidrag til docs hos [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Hvad er køreplanen for azd?
**A**: Se den [officielle køreplan](https://github.com/Azure/azure-dev/projects) for planlagte funktioner og forbedringer.

### Q: Hvordan migrerer jeg fra andre udrulningsværktøjer til azd?
**A**: 
1. Analyser den nuværende udrulningsarkitektur
2. Opret tilsvarende Bicep-skabeloner
3. Konfigurer `azure.yaml` til at matche nuværende services
4. Test grundigt i udviklingsmiljøet
5. Migrer miljøer gradvist

---

## Har du stadig spørgsmål?

### **Søg først**
- Tjek den [officielle dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Søg i [GitHub issues](https://github.com/Azure/azure-dev/issues) efter lignende problemer

### **Få hjælp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Fællesskabsstøtte
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørgsmål
- [Azure Discord](https://discord.gg/azure) - Fællesskabschat i realtid

### **Rapportér problemer**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fejlrapporter og funktionsanmodninger
- Inkluder relevante logs, fejlmeddelelser og trin til reproduktion

### **Lær mere**
- [Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Teknisk vejledning gennemgået: 4. november 2026. Cloud-tilgængelighed og priser skal kontrolleres for dit abonnement og din region.*

---

**Navigation**
- **Forrige lektion**: [Glossar](glossary.md)
- **Næste lektion**: [Studieguide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->