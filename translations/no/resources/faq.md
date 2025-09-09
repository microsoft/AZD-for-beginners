<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T22:37:40+00:00",
  "source_file": "resources/faq.md",
  "language_code": "no"
}
-->
# Ofte stilte spørsmål (FAQ)

## Introduksjon

Denne omfattende FAQ-en gir svar på de vanligste spørsmålene om Azure Developer CLI (azd) og Azure-deployeringer. Finn raske løsninger på vanlige problemer, forstå beste praksis, og få klarhet i azd-konsepter og arbeidsflyter.

## Læringsmål

Ved å gjennomgå denne FAQ-en vil du:
- Finne raske svar på vanlige spørsmål og problemer knyttet til Azure Developer CLI
- Forstå nøkkelkonsepter og terminologi gjennom en praktisk Q&A-format
- Få tilgang til feilsøkingsløsninger for hyppige problemer og feilmeldinger
- Lære beste praksis gjennom ofte stilte spørsmål om optimalisering
- Oppdage avanserte funksjoner og muligheter gjennom ekspertspørsmål
- Effektivt referere til veiledning om kostnader, sikkerhet og deployeringsstrategier

## Læringsutbytte

Med regelmessig referanse til denne FAQ-en vil du kunne:
- Løse vanlige problemer med Azure Developer CLI selvstendig ved hjelp av de oppgitte løsningene
- Ta informerte beslutninger om deployeringsstrategier og konfigurasjoner
- Forstå forholdet mellom azd og andre Azure-verktøy og -tjenester
- Anvende beste praksis basert på erfaringer fra fellesskapet og ekspertanbefalinger
- Feilsøke autentisering, deployering og konfigurasjonsproblemer effektivt
- Optimalisere kostnader og ytelse ved hjelp av innsikt og anbefalinger fra FAQ-en

## Innholdsfortegnelse

- [Kom i gang](../../../resources)
- [Autentisering og tilgang](../../../resources)
- [Maler og prosjekter](../../../resources)
- [Deployering og infrastruktur](../../../resources)
- [Konfigurasjon og miljøer](../../../resources)
- [Feilsøking](../../../resources)
- [Kostnader og fakturering](../../../resources)
- [Beste praksis](../../../resources)
- [Avanserte emner](../../../resources)

---

## Kom i gang

### Spørsmål: Hva er Azure Developer CLI (azd)?
**Svar**: Azure Developer CLI (azd) er et utviklerfokusert kommandolinjeverktøy som akselererer tiden det tar å få applikasjonen din fra lokal utviklingsmiljø til Azure. Det gir beste praksis gjennom maler og hjelper med hele deployeringslivssyklusen.

### Spørsmål: Hvordan skiller azd seg fra Azure CLI?
**Svar**: 
- **Azure CLI**: Et generelt verktøy for administrasjon av Azure-ressurser
- **azd**: Et utviklerfokusert verktøy for applikasjonsdeployering
- azd bruker Azure CLI internt, men gir høyere nivå abstraksjoner for vanlige utviklingsscenarier
- azd inkluderer maler, miljøadministrasjon og automatisering av deployering

### Spørsmål: Må jeg ha Azure CLI installert for å bruke azd?
**Svar**: Ja, azd krever Azure CLI for autentisering og enkelte operasjoner. Installer Azure CLI først, deretter azd.

### Spørsmål: Hvilke programmeringsspråk støtter azd?
**Svar**: azd er språkagnostisk. Det fungerer med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statiske nettsider
- Container-applikasjoner

### Spørsmål: Kan jeg bruke azd med eksisterende prosjekter?
**Svar**: Ja! Du kan enten:
1. Bruke `azd init` for å legge til azd-konfigurasjon i eksisterende prosjekter
2. Tilpasse eksisterende prosjekter til å matche azd-malstrukturen
3. Lage egne maler basert på din eksisterende arkitektur

---

## Autentisering og tilgang

### Spørsmål: Hvordan autentiserer jeg med Azure ved hjelp av azd?
**Svar**: Bruk `azd auth login`, som åpner et nettleservindu for Azure-autentisering. For CI/CD-scenarier, bruk tjenesteprinsipper eller administrerte identiteter.

### Spørsmål: Kan jeg bruke azd med flere Azure-abonnementer?
**Svar**: Ja. Bruk `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` for å spesifisere hvilket abonnement som skal brukes for hvert miljø.

### Spørsmål: Hvilke tillatelser trenger jeg for å deployere med azd?
**Svar**: Vanligvis trenger du:
- **Contributor**-rollen på ressursgruppen eller abonnementet
- **User Access Administrator** hvis du deployerer ressurser som krever rolleoppgaver
- Spesifikke tillatelser varierer avhengig av mal og ressurser som deployeres

### Spørsmål: Kan jeg bruke azd i CI/CD-pipelines?
**Svar**: Absolutt! azd er designet for CI/CD-integrasjon. Bruk tjenesteprinsipper for autentisering og sett miljøvariabler for konfigurasjon.

### Spørsmål: Hvordan håndterer jeg autentisering i GitHub Actions?
**Svar**: Bruk Azure Login-action med tjenesteprinsipp-legitimasjon:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Maler og prosjekter

### Spørsmål: Hvor finner jeg azd-maler?
**Svar**: 
- Offisielle maler: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Fellesskapsmaler: Søk på GitHub etter "azd-template"
- Bruk `azd template list` for å bla gjennom tilgjengelige maler

### Spørsmål: Hvordan lager jeg en egen mal?
**Svar**: 
1. Start med en eksisterende malstruktur
2. Endre `azure.yaml`, infrastrukturfiler og applikasjonskode
3. Test grundig med `azd up`
4. Publiser til GitHub med passende tagger

### Spørsmål: Kan jeg bruke azd uten en mal?
**Svar**: Ja, bruk `azd init` i et eksisterende prosjekt for å lage nødvendige konfigurasjonsfiler. Du må manuelt konfigurere `azure.yaml` og infrastrukturfiler.

### Spørsmål: Hva er forskjellen mellom offisielle og fellesskapsmaler?
**Svar**: 
- **Offisielle maler**: Vedlikeholdt av Microsoft, regelmessig oppdatert, omfattende dokumentasjon
- **Fellesskapsmaler**: Laget av utviklere, kan ha spesialiserte bruksområder, varierende kvalitet og vedlikehold

### Spørsmål: Hvordan oppdaterer jeg en mal i prosjektet mitt?
**Svar**: Maler oppdateres ikke automatisk. Du kan:
1. Manuelt sammenligne og slå sammen endringer fra kilde-malen
2. Starte på nytt med `azd init` ved bruk av den oppdaterte malen
3. Plukke spesifikke forbedringer fra oppdaterte maler

---

## Deployering og infrastruktur

### Spørsmål: Hvilke Azure-tjenester kan azd deployere?
**Svar**: azd kan deployere alle Azure-tjenester gjennom Bicep/ARM-maler, inkludert:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Lagring, Key Vault, Application Insights
- Nettverk, sikkerhet og overvåkingsressurser

### Spørsmål: Kan jeg deployere til flere regioner?
**Svar**: Ja, konfigurer flere regioner i Bicep-malene dine og sett lokasjonsparameteren riktig for hvert miljø.

### Spørsmål: Hvordan håndterer jeg database-skjemaendringer?
**Svar**: Bruk deployeringshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Spørsmål: Kan jeg kun deployere infrastruktur uten applikasjoner?
**Svar**: Ja, bruk `azd provision` for å kun deployere infrastrukturkomponentene definert i malene dine.

### Spørsmål: Hvordan deployerer jeg til eksisterende Azure-ressurser?
**Svar**: Dette er komplekst og ikke direkte støttet. Du kan:
1. Importere eksisterende ressurser inn i Bicep-malene dine
2. Bruke referanser til eksisterende ressurser i malene
3. Endre malene for betinget opprettelse eller referanse til ressurser

### Spørsmål: Kan jeg bruke Terraform i stedet for Bicep?
**Svar**: For øyeblikket støtter azd primært Bicep/ARM-maler. Terraform-støtte er ikke offisielt tilgjengelig, men fellesskapsløsninger kan eksistere.

---

## Konfigurasjon og miljøer

### Spørsmål: Hvordan administrerer jeg forskjellige miljøer (dev, staging, prod)?
**Svar**: Opprett separate miljøer med `azd env new <environment-name>` og konfigurer ulike innstillinger for hvert:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Spørsmål: Hvor lagres miljøkonfigurasjoner?
**Svar**: I `.azure`-mappen i prosjektkatalogen din. Hvert miljø har sin egen mappe med konfigurasjonsfiler.

### Spørsmål: Hvordan setter jeg miljøspesifikke konfigurasjoner?
**Svar**: Bruk `azd env set` for å konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Spørsmål: Kan jeg dele miljøkonfigurasjoner med teammedlemmer?
**Svar**: `.azure`-mappen inneholder sensitiv informasjon og bør ikke legges til versjonskontroll. I stedet:
1. Dokumenter nødvendige miljøvariabler
2. Bruk deployeringsskript for å sette opp miljøer
3. Bruk Azure Key Vault for sensitiv konfigurasjon

### Spørsmål: Hvordan overstyrer jeg standardinnstillinger i maler?
**Svar**: Sett miljøvariabler som samsvarer med malparametere:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Feilsøking

### Spørsmål: Hvorfor feiler `azd up`?
**Svar**: Vanlige årsaker:
1. **Autentiseringsproblemer**: Kjør `azd auth login`
2. **Manglende tillatelser**: Sjekk Azure-rolleoppgaver
3. **Navnekonflikter for ressurser**: Endre AZURE_ENV_NAME
4. **Kvoter/kapasitetsproblemer**: Sjekk regional tilgjengelighet
5. **Malfeil**: Valider Bicep-maler

### Spørsmål: Hvordan feilsøker jeg deployeringsfeil?
**Svar**: 
1. Bruk `azd deploy --debug` for detaljert output
2. Sjekk deployeringshistorikk i Azure-portalen
3. Gå gjennom aktivitetsloggen i Azure-portalen
4. Bruk `azd show` for å vise gjeldende miljøstatus

### Spørsmål: Hvorfor fungerer ikke miljøvariablene mine?
**Svar**: Sjekk:
1. Variabelnavn samsvarer nøyaktig med malparametere
2. Verdier er riktig sitert hvis de inneholder mellomrom
3. Miljøet er valgt: `azd env select <environment>`
4. Variabler er satt i riktig miljø

### Spørsmål: Hvordan rydder jeg opp etter mislykkede deployeringer?
**Svar**: 
```bash
azd down --force --purge
```
Dette fjerner alle ressurser og miljøkonfigurasjoner.

### Spørsmål: Hvorfor er applikasjonen min ikke tilgjengelig etter deployering?
**Svar**: Sjekk:
1. Deployeringen ble fullført uten feil
2. Applikasjonen kjører (sjekk logger i Azure-portalen)
3. Nettverkssikkerhetsgrupper tillater trafikk
4. DNS/egendefinerte domener er riktig konfigurert

---

## Kostnader og fakturering

### Spørsmål: Hvor mye vil azd-deployeringer koste?
**Svar**: Kostnadene avhenger av:
- Azure-tjenestene som deployeres
- Tjenestenivåer/SKU-er som velges
- Regionale prisforskjeller
- Bruksmønstre

Bruk [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) for estimater.

### Spørsmål: Hvordan kontrollerer jeg kostnader i azd-deployeringer?
**Svar**: 
1. Bruk lavere nivå SKU-er for utviklingsmiljøer
2. Sett opp Azure-budsjetter og varsler
3. Bruk `azd down` for å fjerne ressurser når de ikke trengs
4. Velg passende regioner (kostnader varierer etter lokasjon)
5. Bruk Azure Cost Management-verktøy

### Spørsmål: Finnes det gratisalternativer for azd-maler?
**Svar**: Mange Azure-tjenester tilbyr gratisnivåer:
- App Service: Gratisnivå tilgjengelig
- Azure Functions: 1M gratis kjøringer per måned
- Cosmos DB: Gratisnivå med 400 RU/s
- Application Insights: Første 5GB/måned gratis

Konfigurer maler til å bruke gratisnivåer der det er tilgjengelig.

### Spørsmål: Hvordan estimerer jeg kostnader før deployering?
**Svar**: 
1. Gå gjennom malens `main.bicep` for å se hvilke ressurser som opprettes
2. Bruk Azure Pricing Calculator med spesifikke SKU-er
3. Deploy til et utviklingsmiljø først for å overvåke faktiske kostnader
4. Bruk Azure Cost Management for detaljert kostnadsanalyse

---

## Beste praksis

### Spørsmål: Hva er beste praksis for azd-prosjektstruktur?
**Svar**: 
1. Hold applikasjonskode adskilt fra infrastruktur
2. Bruk meningsfulle tjenestenavn i `azure.yaml`
3. Implementer riktig feilhåndtering i byggeskript
4. Bruk miljøspesifikke konfigurasjoner
5. Inkluder omfattende dokumentasjon

### Spørsmål: Hvordan bør jeg organisere flere tjenester i azd?
**Svar**: Bruk den anbefalte strukturen:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Spørsmål: Bør jeg legge `.azure`-mappen til versjonskontroll?
**Svar**: **Nei!** `.azure`-mappen inneholder sensitiv informasjon. Legg den til `.gitignore`:
```gitignore
.azure/
```

### Spørsmål: Hvordan håndterer jeg hemmeligheter og sensitiv konfigurasjon?
**Svar**: 
1. Bruk Azure Key Vault for hemmeligheter
2. Referer til Key Vault-hemmeligheter i applikasjonskonfigurasjon
3. Aldri legg hemmeligheter til versjonskontroll
4. Bruk administrerte identiteter for tjeneste-til-tjeneste-autentisering

### Spørsmål: Hva er den anbefalte tilnærmingen for CI/CD med azd?
**Svar**: 
1. Bruk separate miljøer for hver fase (dev/staging/prod)
2. Implementer automatisert testing før deployering
3. Bruk tjenesteprinsipper for autentisering
4. Lagre sensitiv konfigurasjon i pipeline-hemmeligheter/variabler
5. Implementer godkjenningsporter for produksjonsdeployeringer

---

## Avanserte emner

### Spørsmål: Kan jeg utvide azd med egen funksjonalitet?
**Svar**: Ja, gjennom deployeringshooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Spørsmål: Hvordan integrerer jeg azd med eksisterende DevOps-prosesser?
**Svar**: 
1. Bruk azd-kommandoer i eksisterende pipeline-skript
2. Standardiser på azd-maler på tvers av team
3. Integrer med eksisterende overvåking og varsling
4. Bruk azd's JSON-output for pipeline-integrasjon

### Spørsmål: Kan jeg bruke azd med Azure DevOps?
**Svar**: Ja, azd fungerer med alle CI/CD-systemer. Opprett Azure DevOps-pipelines som bruker azd-kommandoer.

### Spørsmål: Hvordan bidrar jeg til azd eller lager fellesskapsmaler?
**Svar**: 
1. **azd-verktøy**: Bidra til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Maler**: Lag maler i henhold til [malretningslinjene](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentasjon**: Bidra til dokumentasjon på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Spørsmål: Hva er veikartet for azd?
**Svar**: Sjekk [offisielt veikart](https://github.com/Azure/azure-dev/projects) for planlagte funksjoner og forbedringer.

### Spørsmål: Hvordan migrerer jeg fra andre deployeringsverktøy til azd?
**Svar**:
1. Analyser nåværende distribusjonsarkitektur  
2. Lag tilsvarende Bicep-maler  
3. Konfigurer `azure.yaml` for å samsvare med nåværende tjenester  
4. Test grundig i utviklingsmiljøet  
5. Migrer miljøer gradvis  

---

## Har du fortsatt spørsmål?

### **Søk først**  
- Sjekk [offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Søk etter [GitHub-issues](https://github.com/Azure/azure-dev/issues) for lignende problemer  

### **Få hjelp**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Fellesskapsstøtte  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørsmål  
- [Azure Discord](https://discord.gg/azure) - Sanntidschat med fellesskapet  

### **Rapporter problemer**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Feilrapporter og forespørsler om funksjoner  
- Inkluder relevante logger, feilmeldinger og trinn for å gjenskape problemet  

### **Lær mer**  
- [Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Denne FAQ-en oppdateres jevnlig. Sist oppdatert: 9. september 2025*  

---

**Navigasjon**  
- **Forrige leksjon**: [Ordliste](glossary.md)  
- **Neste leksjon**: [Studieguide](study-guide.md)  

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.