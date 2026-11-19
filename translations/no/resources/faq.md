# Ofte stilte spørsmål (FAQ)

**Få hjelp per kapittel**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **🚆 Installasjonsproblemer**: [Kapittel 1: Installasjon & Oppsett](../docs/chapter-01-foundation/installation.md)
- **🤖 AI-spørsmål**: [Kapittel 2: AI-Først Utvikling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Feilsøking**: [Kapittel 7: Feilsøking & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduksjon

Denne omfattende FAQ-en gir svar på de mest vanlige spørsmålene om Azure Developer CLI (azd) og Azure-distribusjoner. Finn raske løsninger på vanlige problemer, forstå beste praksis, og få avklaringer på azd-konsepter og arbeidsflyter.

## Læringsmål

Ved å lese denne FAQ-en vil du:
- Finne raske svar på vanlige spørsmål og problemer med Azure Developer CLI
- Forstå sentrale konsepter og terminologi gjennom praktisk spørsmål-og-svar format
- Få tilgang til feilsøkingsløsninger for hyppige problemer og feilsituasjoner
- Lære beste praksis gjennom ofte stilte spørsmål om optimalisering
- Oppdage avanserte funksjoner og muligheter gjennom ekspertnivå spørsmål
- Effektivt referere til veiledning om kostnader, sikkerhet, og distribusjonsstrategi

## Læringsutbytte

Ved jevnlig å referere til denne FAQ-en vil du kunne:
- Løse vanlige problemer med Azure Developer CLI selvstendig ved hjelp av de oppgitte løsningene
- Ta informerte beslutninger om distribusjonsstrategier og konfigurasjoner
- Forstå forholdet mellom azd og andre Azure-verktøy og tjenester
- Anvende beste praksis basert på fellesskapets erfaring og anbefalinger fra eksperter
- Feilsøke autentisering, distribusjon og konfigurasjonsproblemer effektivt
- Optimalisere kostnader og ytelse ved hjelp av innsikt og anbefalinger fra FAQ-en

## Innholdsfortegnelse

- [Komme i gang](#getting-started)
- [Autentisering & Tilgang](#authentication--access)
- [Maler & Prosjekter](#templates--projects)
- [Distribusjon & Infrastruktur](#deployment--infrastructure)
- [Konfigurasjon & Miljøer](#configuration--environments)
- [Feilsøking](#troubleshooting)
- [Kostnad & Fakturering](#cost--billing)
- [Beste praksis](#best-practices)
- [Avanserte emner](#advanced-topics)

---

## Komme i gang

### Q: Hva er Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) er et utviklerorientert kommandolinjeverktøy som akselererer tiden det tar for deg å få applikasjonen din fra lokal utviklingsmiljø til Azure. Det tilbyr beste praksis gjennom maler og hjelper med hele distribusjonslivssyklusen.

### Q: Hvordan skiller azd seg fra Azure CLI?
**A**: 
- **Azure CLI**: Generelt verktøy for å administrere Azure-ressurser
- **azd**: Utviklerfokusert verktøy for applikasjonsdistribusjonsarbeidsflyter
- azd har egen autentiserings- og distribusjonsarbeidsflyt; Azure CLI er et separat, komplementært verktøy
- azd inkluderer maler, miljøadministrasjon og distribusjonsautomatisering

### Q: Må jeg ha Azure CLI installert for å bruke azd?
**A**: Ikke for kjernen i AZD-arbeidsflyten. Autentiser med `azd auth login`. Installer Azure CLI separat når en mal-krok eller en øvelse eksplisitt kjører `az`-kommandoer.

### Q: Hvilke programmeringsspråk støtter azd?
**A**: azd er språk-agnostisk. Det fungerer med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statisk nettsider
- Containeriserte applikasjoner

### Q: Kan jeg bruke azd med eksisterende prosjekter?
**A**: Ja! Du kan enten:
1. Bruke `azd init` for å legge til azd-konfigurasjon i eksisterende prosjekter
2. Tilpasse eksisterende prosjekter for å matche azd-malstrukturen
3. Lage egendefinerte maler basert på din eksisterende arkitektur

### Q: Hva endret seg med tilgjengeligheten av Foundry-utvidelsen?
**A**: `microsoft.foundry`-pakken nådde versjon 1.0 og GA den 5. november 2026. Med AZD 1.37.0+ bruk `azd ext install microsoft.foundry` for å installere syv kjerneudvidelser for agenter, tilkoblinger, inspector, prosjekter, rutiner, ferdigheter og verktøykasser. Det er ikke et nytt kommando-navneområde, og komponentene versjoneres uavhengig. Evalueringer, datasett, finjustering og egendefinerte modeller installeres separat; valgfrie forhåndsvisningsfunksjoner blir ikke GA bare fordi pakken er GA.

Gjennomgangen av [hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) bruker Python 3.13+ og gjeldende uv. `azd ai agent run` åpner Agent Inspector lokalt, men modellkall bruker fortsatt Azure og medfører kostnader. Kode-modus `azd deploy` laster opp kildekode for en ekstern bygging uten å kreve lokal containerbygging.

### Q: Fjerner `azd down` en hosted agent fra et eksisterende Foundry-prosjekt?
**A**: Ikke for gjenbruksprosjektbanen beskrevet i hosted-agent hurtigstart: den lar prosjektet, hosted agenten og andre ressurser være intakt. Fjern uønskede ressurser separat uten å slette delte ressurser. Hvis miljøet opprettet et nytt Foundry-prosjekt, sletter `azd down` dets ressursgruppe og alt i den. Gå gjennom [oppryddingsveiledningen](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) og slettingsmeldinger før du bekrefter.

---

## Autentisering og tilgang

### Q: Hvordan autentiserer jeg mot Azure ved bruk av azd?
**A**: Bruk `azd auth login` som åpner et nettleservindu for Azure-autentisering. For CI/CD-scenarier bruker du tjenesteprinsipper eller administrerte identiteter.

### Q: Kan jeg bruke azd med flere Azure-abonnementer?
**A**: Ja. Bruk `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` for å spesifisere hvilket abonnement som skal brukes for hvert miljø.

### Q: Hvilke tillatelser trenger jeg for å deployere med azd?
**A**: Vanligvis trenger du:
- **Bidragsyter**-rollen på ressursgruppen eller abonnementet
- **Brukertilgangsadministrator** hvis du deployerer ressurser som krever rolle-tilordninger
- Spesifikke tillatelser varierer etter mal og ressurser som deployeres

### Q: Kan jeg bruke azd i CI/CD-pipelines?
**A**: Absolutt! azd er laget for integrasjon med CI/CD. Bruk tjenesteprinsipper for autentisering og sett miljøvariabler for konfigurasjon.

### Q: Hvordan håndterer jeg autentisering i GitHub Actions?
**A**: Foretrekk arbeidsbelastningsidentitetsfederasjon (OIDC), konfigurert med `azd pipeline config`. Den genererte workflowen installerer AZD og autentiserer AZD direkte med en føderert identitet. En enkel `azure/login`-steg etablerer ikke AZD-innlogging. En innloggingssteg i en eksisterende jobb er:
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

Provisioner eller deployer etter innlogging, med det tiltenkte AZD-miljøet, abonnementet og lokasjonen konfigurert. Identitetens fødererte legitimasjon må stole på arbeidsflytens repo/referanse eller GitHub-miljø, og Azure-rollene dens må tillate de forespurte operasjonene.

---

## Maler og prosjekter

### Q: Hvor finner jeg azd-maler?
**A**: 
- Offisielle og community-maler: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community-maler: GitHub-søk etter "azd-template"
- Bruk `azd template list` for å bla gjennom tilgjengelige maler

### Q: Hvordan lager jeg en egendefinert mal?
**A**: 
1. Start med en eksisterende malstruktur
2. Endre `azure.yaml`, infrastrukturfiler og applikasjonskode
3. Test grundig med `azd up`
4. Publiser til GitHub med passende merkelapper

### Q: Kan jeg bruke azd uten en mal?
**A**: Ja, bruk `azd init` i et eksisterende prosjekt for å opprette nødvendige konfigurasjonsfiler. Du må manuelt konfigurere `azure.yaml` og infrastrukturfiler.

### Q: Hva er forskjellen på offisielle og community-maler?
**A**: 
- **Offisielle maler**: Vedlikeholdt av Microsoft, regelmessig oppdatert, omfattende dokumentasjon
- **Fellesskapsmaler**: Opprettet av utviklere, kan ha spesialiserte bruksområder, varierende kvalitet og vedlikehold

### Sp: Hvordan oppdaterer jeg en mal i prosjektet mitt?
**Sv**: Maler oppdateres ikke automatisk. Du kan:
1. Manuelt sammenligne og slå sammen endringer fra kildemalen
2. Starte på nytt med `azd init` ved å bruke den oppdaterte malen
3. Velge ut spesifikke forbedringer fra oppdaterte maler

---

## Distribusjon & Infrastruktur

### Sp: Hvilke Azure-tjenester kan azd distribuere?
**Sv**: azd kan distribuere alle Azure-tjenester gjennom Bicep/ARM-maler, inkludert:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Lagring, Key Vault, Application Insights
- Nettverks-, sikkerhets- og overvåkingsressurser

### Sp: Kan jeg distribuere til flere regioner?
**Sv**: Ja, konfigurer flere regioner i Bicep-malene dine og angi lokasjonsparameteren riktig for hvert miljø.

### Sp: Hvordan håndterer jeg databaseskjema-migrasjoner?
**Sv**: Bruk distribusjonshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Sp: Kan jeg distribuere kun infrastruktur uten applikasjoner?
**Sv**: Ja, bruk `azd provision` for kun å distribuere infrastrukturkomponentene som er definert i malene dine.

### Sp: Hvordan distribuerer jeg til eksisterende Azure-ressurser?
**Sv**: Ja, hvis malen støtter det. Referer eksisterende ressurser med Biceps `existing`-deklarasjoner eller malens dokumenterte eksisterende ressursparametere, og tilordne applikasjonstjenester til deres tiltenkte mål. Dette importerer ikke eierskap eller oppretter automatisk manglende tillatelser. Gå gjennom malen før distribusjon.

### Sp: Kan jeg bruke Terraform i stedet for Bicep?
**Sv**: Ja. AZD støtter Terraform så vel som Bicep. Velg en Terraform-basert mal eller konfigurer `infra.provider: terraform` i `azure.yaml`, med passende Terraform-filer og state/backend-konfigurasjon. Se [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasjon & Miljøer

### Sp: Hvordan håndterer jeg forskjellige miljøer (dev, staging, prod)?
**Sv**: Opprett separate miljøer med `azd env new <environment-name>` og konfigurer ulike innstillinger for hvert:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Sp: Hvor lagres miljøkonfigurasjoner?
**Sv**: I `.azure`-mappen innenfor prosjektkatalogen din. Hvert miljø har sin egen mappe med konfigurasjonsfiler.

### Sp: Hvordan setter jeg miljøspesifikk konfigurasjon?
**Sv**: Bruk `azd env set` for å konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Sp: Kan jeg dele miljøkonfigurasjoner mellom teammedlemmer?
**Sv**: `.azure`-mappen inneholder sensitiv informasjon og skal ikke sjekkes inn i versjonskontroll. I stedet:
1. Dokumenter nødvendige miljøvariabler
2. Bruk distribusjonsskript for å sette opp miljøer
3. Bruk Azure Key Vault for sensitiv konfigurasjon

### Sp: Hvordan overstyrer jeg malens standardinnstillinger?
**Sv**: Sett miljøvariabler som samsvarer med malparametere:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Kun variabler brukt av malen påvirker distribusjonen. `SKU_NAME` ovenfor er et eksempel på egendefinert input, ikke en universell AZD-innstilling.

---

## Feilsøking

### Sp: Hvorfor feiler `azd up`?
**Sv**: Vanlige årsaker:
1. **Autentiseringsproblemer**: Kjør `azd auth login`
2. **Utilstrekkelige tillatelser**: Sjekk dine rolleoppgaver i Azure
3. **Navnekonflikter på ressurser**: Gjennomgå den konflikterende ressursen og malens navneinnspill; opprett et eget miljø med `azd env new` når isolasjon er nødvendig
4. **Kvote-/kapasitetsproblemer**: Sjekk regional tilgjengelighet
5. **Malfeil**: Valider Bicep-maler

### Q: Hvordan feilsøker jeg distribusjonsfeil?
**A**: 
1. Bruk `azd deploy --debug` for detaljert utdata
2. Sjekk distribusjonshistorikk i Azure-portalen
3. Se gjennom aktivitetsloggen i Azure-portalen
4. Bruk `azd show` for å vise gjeldende miljøstatus

### Q: Hvorfor fungerer ikke miljøvariablene mine?
**A**: Sjekk:
1. At variabelnavnene samsvarer nøyaktig med malparametrene
2. At verdiene er riktig sitert hvis de inneholder mellomrom
3. At miljø er valgt: `azd env select <environment>`
4. At variablene er satt i riktig miljø

### Q: Hvordan rydder jeg opp i mislykkede distribusjoner?
**A**: 
```bash
azd down
```
Gå gjennom det valgte miljøet og slettingsbekreftelsen først. Dette sletter provisjonerte Azure-ressurser, ikke den lokale `.azure` miljøkonfigurasjonen. `--purge` ber i tillegg om permanent sletting av støttede myk-slettede ressurser og kan blokkeres av beholdnings-/rensebeskyttelse; det er ikke et rutinemessig gjenopprettingssteg.

### Q: Hvorfor er ikke applikasjonen min tilgjengelig etter distribusjon?
**A**: Sjekk:
1. At distribusjonen fullførte uten feil
2. At applikasjonen kjører (sjekk logger i Azure-portalen)
3. At nettverkssikkerhetsgrupper tillater trafikk
4. At DNS/egendefinerte domener er konfigurert riktig

---

## Kostnader og fakturering

### Q: Hvor mye vil azd-distribusjoner koste?
**A**: Kostnadene avhenger av:
- Azure-tjenester som distribueres
- Valgte tjenestenivåer/SKU-er
- Regionale prisforskjeller
- Bruksmønstre

Bruk [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) for estimater.

### Q: Hvordan kan jeg kontrollere kostnader i azd-distribusjoner?
**A**: 
1. Bruk SKU-er med lavere nivå for utviklingsmiljøer
2. Sett opp Azure budsjetter og varsler
3. Bruk `azd down` for å fjerne ressurser når de ikke trengs
4. Velg passende regioner (kostnader varierer etter lokasjon)
5. Bruk Azure Cost Management-verktøy

### Sp: Finnes det gratisnivå-alternativer for azd-maler?
**Sv**: Noen tjenester har gratis SKU-er eller månedlige tilskudd, avhengig av kvalifisering, hostingplan, region og abonnementgrenser. Disse gjør ikke hele malen gratis: databaser, søk, nettverk, register, telemetri og modellinferenz kan påføre kostnader uavhengig. Sjekk [Azure gratis tjenester liste](https://azure.microsoft.com/free/) og gjeldende priser for hver ressurs før distribusjon.

### Sp: Hvordan estimerer jeg kostnader før distribusjon?
**Sv**: 
1. Gå gjennom malens `main.bicep` for å se hvilke ressurser som opprettes
2. Bruk Azure Pricing Calculator med spesifikke SKU-er
3. Distribuer først til et utviklingsmiljø for å overvåke faktiske kostnader
4. Bruk Azure Cost Management for detaljert kostnadsanalyse

---

## Beste praksis

### Sp: Hva er beste praksis for azd-prosjektstruktur?
**Sv**: 
1. Hold applikasjonskode separat fra infrastruktur
2. Bruk meningsfulle tjenestenavn i `azure.yaml`
3. Implementer korrekt feilhåndtering i byggeskript
4. Bruk miljøspesifikk konfigurasjon
5. Inkluder omfattende dokumentasjon

### Sp: Hvordan bør jeg organisere flere tjenester i azd?
**Sv**: Bruk den anbefalte strukturen:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Sp: Bør jeg sjekke inn `.azure`-mappen i versjonskontroll?
**Sv**: **Nei!** `.azure`-mappen inneholder sensitiv informasjon. Legg den til i `.gitignore`:
```gitignore
.azure/
```

### Sp: Hvordan håndterer jeg hemmeligheter og sensitiv konfigurasjon?
**Sv**: 
1. Bruk Azure Key Vault for hemmeligheter
2. Referer til Key Vault-hemmeligheter i applikasjonskonfigurasjon
3. Sjekk aldri inn hemmeligheter i versjonskontroll
4. Bruk administrerte identiteter for tjeneste-til-tjeneste-autentisering

### Sp: Hva er anbefalt tilnærming for CI/CD med azd?
**Sv**: 
1. Bruk separate miljøer for hver fase (dev/staging/prod)
2. Implementer automatisert testing før distribusjon
3. Bruk tjenesteprinsipper for autentisering
4. Lagre sensitiv konfigurasjon i pipeline-hemmligheter/variabler
5. Implementer godkjenningsporter for produksjonsdistribusjoner

---

## Avanserte emner

### Sp: Kan jeg utvide azd med tilpasset funksjonalitet?
**Sv**: Ja, gjennom distribusjonshooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Sp: Hvordan integrerer jeg azd med eksisterende DevOps-prosesser?
**Sv**: 
1. Bruk azd-kommandoer i eksisterende pipelineskript
2. Standardiser på azd-maler på tvers av team
3. Integrer med eksisterende overvåking og varsling
4. Bruk azd sin JSON-utdata for pipeline-integrasjon

### Sp: Kan jeg bruke azd med Azure DevOps?
**Sv**: Ja, azd fungerer med alle CI/CD-systemer. Lag Azure DevOps-pipelines som bruker azd-kommandoer.

### Sp: Hvordan bidrar jeg til azd eller lager maler fra fellesskapet?
**Sv**: 
1. **azd verktøy**: Bidra til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Maler**: Følg [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentasjon**: Bidra til dokumentasjon på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Sp: Hva er veikartet for azd?
**Sv**: Sjekk [offisielt veikart](https://github.com/Azure/azure-dev/projects) for planlagte funksjoner og forbedringer.

### Sp: Hvordan migrerer jeg fra andre distribusjonsverktøy til azd?
**Sv**: 
1. Analyser nåværende distribusjonsarkitektur
2. Opprett tilsvarende Bicep-maler
3. Konfigurer `azure.yaml` for å matche nåværende tjenester
4. Test grundig i utviklingsmiljø
5. Migrer miljøer gradvis

---

## Har du fortsatt spørsmål?

### **Søk først**
- Sjekk [offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Søk på [GitHub issues](https://github.com/Azure/azure-dev/issues) for lignende problemer

### **Få hjelp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Fellesskapsstøtte
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørsmål
- [Azure Discord](https://discord.gg/azure) - Fellesskapschat i sanntid

### **Rapporter problemer**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Feilmeldinger og funksjonsforespørsler
- Inkluder relevante logger, feilmeldinger og trinn for å reprodusere

### **Lær mer**
- [Azure Developer CLI dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Teknisk veiledning gjennomgått: 4. november 2026. Tilgjengelighet og priser i skyen må sjekkes for ditt abonnement og region.*

---

**Navigasjon**
- **Forrige leksjon**: [Glossar](glossary.md)
- **Neste leksjon**: [Studieveiledning](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->