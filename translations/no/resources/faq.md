# Ofte stilte spørsmål (FAQ)

**Få hjelp per kapittel**
- **📚 Kurs Hjem**: [AZD For Beginners](../README.md)
- **🚆 Problemer med installasjon**: [Kapittel 1: Installasjon & Oppsett](../docs/getting-started/installation.md)
- **🤖 AI-spørsmål**: [Kapittel 2: AI-Først Utvikling](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Feilsøking**: [Kapittel 7: Feilsøking & Debugging](../docs/troubleshooting/common-issues.md)

## Innledning

Denne omfattende FAQ gir svar på de mest vanlige spørsmålene om Azure Developer CLI (azd) og Azure-distribusjoner. Finn raske løsninger på vanlige problemer, forstå beste praksis, og få klarhet i azd-konsepter og arbeidsflyter.

## Læringsmål

Ved å gjennomgå denne FAQ vil du:
- Finne raske svar på vanlige spørsmål og problemer med Azure Developer CLI
- Forstå nøkkelkonsepter og terminologi gjennom praktisk spørsmål- og svarformat
- Få tilgang til feilsøking for hyppige problemer og feilsituasjoner
- Lære beste praksis gjennom ofte stilte spørsmål om optimalisering
- Oppdage avanserte funksjoner og muligheter gjennom ekspertspørsmål
- Ha effektiv tilgang til veiledning om kostnader, sikkerhet og distribusjonsstrategi

## Læringsresultater

Med jevnlig bruk av denne FAQ-en vil du kunne:
- Løse vanlige problemer med Azure Developer CLI selvstendig ved hjelp av foreslåtte løsninger
- Ta informerte beslutninger om distribusjonsstrategier og konfigurasjoner
- Forstå forholdet mellom azd og andre Azure-verktøy og tjenester
- Anvende beste praksis basert på erfaring fra fellesskapet og ekspertanbefalinger
- Feilsøke autentisering, distribusjon og konfigurasjonsproblemer effektivt
- Optimalisere kostnader og ytelse ved hjelp av innsikter og anbefalinger fra FAQ

## Innholdsfortegnelse

- [Kom i gang](../../../resources)
- [Autentisering & Tilgang](../../../resources)
- [Malverk & Prosjekter](../../../resources)
- [Distribusjon & Infrastruktur](../../../resources)
- [Konfigurasjon & Miljøer](../../../resources)
- [Feilsøking](../../../resources)
- [Kostnader & Fakturering](../../../resources)
- [Beste praksis](../../../resources)
- [Avanserte emner](../../../resources)

---

## Kom i gang

### Q: Hva er Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) er et utviklerfokusert kommandolinjeverktøy som akselererer tiden det tar å få applikasjonen din fra lokal utviklingsmiljø til Azure. Den tilbyr beste praksis gjennom maler og hjelper med hele distribusjonens livssyklus.

### Q: Hvordan skiller azd seg fra Azure CLI?
**A**: 
- **Azure CLI**: Generelt verktøy for administrasjon av Azure-ressurser
- **azd**: Utviklerfokusert verktøy for arbeidsflyter ved applikasjonsdistribusjon
- azd bruker Azure CLI internt, men tilbyr høyere abstraksjoner for vanlige utviklingsscenarioer
- azd inkluderer maler, miljøhåndtering og distribusjonsautomatisering

### Q: Må jeg ha Azure CLI installert for å bruke azd?
**A**: Ja, azd krever Azure CLI for autentisering og enkelte operasjoner. Installer Azure CLI først, deretter azd.

### Q: Hvilke programmeringsspråk støtter azd?
**A**: azd er språkagnostisk. Det fungerer med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statisk nettsteder
- Containerbaserte applikasjoner

### Q: Kan jeg bruke azd med eksisterende prosjekter?
**A**: Ja! Du kan enten:
1. Bruke `azd init` for å legge til azd-konfigurasjon i eksisterende prosjekter
2. Tilpasse eksisterende prosjekter til å matche azd-malstrukturen
3. Lage egendefinerte maler basert på din eksisterende arkitektur

---

## Autentisering & Tilgang

### Q: Hvordan autentiserer jeg mot Azure med azd?
**A**: Bruk `azd auth login` som åpner et nettleservindu for Azure-autentisering. For CI/CD-scenarier, bruk tjenesteprinsipper eller administrerte identiteter.

### Q: Kan jeg bruke azd med flere Azure-abonnementer?
**A**: Ja. Bruk `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` for å spesifisere hvilket abonnement som skal brukes for hvert miljø.

### Q: Hvilke tillatelser trenger jeg for å deployere med azd?
**A**: Vanligvis trenger du:
- **Bidragsyter**-rolle på ressursgruppen eller abonnementet
- **User Access Administrator** hvis du deployerer ressurser som krever rolleoppdrag
- Spesifikke tillatelser varierer etter mal og ressurser som deployeres

### Q: Kan jeg bruke azd i CI/CD-pipelines?
**A**: Absolutt! azd er designet for CI/CD-integrasjon. Bruk tjenesteprinsipper for autentisering og sett miljøvariabler for konfigurasjon.

### Q: Hvordan håndterer jeg autentisering i GitHub Actions?
**A**: Bruk Azure Login action med tjenesteprinsipp-legitimasjon:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Malverk & Prosjekter

### Q: Hvor finner jeg azd-maler?
**A**: 
- Offisielle maler: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Fellesskapsmaler: Søk på GitHub etter "azd-template"
- Bruk `azd template list` for å bla gjennom tilgjengelige maler

### Q: Hvordan lager jeg en egendefinert mal?
**A**: 
1. Start med en eksisterende malstruktur
2. Endre `azure.yaml`, infrastrukturfilene og applikasjonskoden
3. Test grundig med `azd up`
4. Publiser på GitHub med passende tags

### Q: Kan jeg bruke azd uten en mal?
**A**: Ja, bruk `azd init` i et eksisterende prosjekt for å lage nødvendige konfigurasjonsfiler. Du må manuelt konfigurere `azure.yaml` og infrastrukturfilene.

### Q: Hva er forskjellen på offisielle og fellesskapsmaler?
**A**: 
- **Offisielle maler**: Vedlikeholdes av Microsoft, oppdateres jevnlig, omfattende dokumentasjon
- **Fellesskapsmaler**: Laget av utviklere, kan ha spesialiserte bruksområder, varierende kvalitet og vedlikehold

### Q: Hvordan oppdaterer jeg en mal i mitt prosjekt?
**A**: Maler oppdateres ikke automatisk. Du kan:
1. Sammenligne og slå sammen endringer fra kilde malen manuelt
2. Starte på nytt med `azd init` med den oppdaterte malen
3. Velge ut spesifikke forbedringer fra oppdaterte maler

---

## Distribusjon & Infrastruktur

### Q: Hvilke Azure-tjenester kan azd deployere?
**A**: azd kan deployere alle Azure-tjenester gjennom Bicep/ARM-maler, inkludert:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Lagring, Key Vault, Application Insights
- Nettverk, sikkerhet og overvåkingsressurser

### Q: Kan jeg deployere til flere regioner?
**A**: Ja, konfigurer flere regioner i Bicep-malene dine og sett lokasjonsparameteren riktig for hvert miljø.

### Q: Hvordan håndterer jeg migrasjon av databaseskjema?
**A**: Bruk distribusjonshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Kan jeg kun deployere infrastruktur uten applikasjoner?
**A**: Ja, bruk `azd provision` for kun å deployere infrastrukturkomponentene definert i malene dine.

### Q: Hvordan deployerer jeg til eksisterende Azure-ressurser?
**A**: Dette er komplekst og ikke direkte støttet. Du kan:
1. Importere eksisterende ressurser inn i Bicep-malene dine
2. Bruke eksisterende ressursreferanser i malene
3. Endre malene for betinget opprettelse eller referanse til ressurser

### Q: Kan jeg bruke Terraform i stedet for Bicep?
**A**: Foreløpig støtter azd primært Bicep/ARM-maler. Terraform-støtte er ikke offisielt tilgjengelig, men det kan finnes løsninger fra fellesskapet.

---

## Konfigurasjon & Miljøer

### Q: Hvordan håndterer jeg forskjellige miljøer (dev, staging, prod)?
**A**: Opprett separate miljøer med `azd env new <environment-name>` og konfigurer ulike innstillinger for hvert:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Hvor lagres miljøkonfigurasjoner?
**A**: I `.azure`-mappen i prosjektkatalogen. Hvert miljø har sin egen mappe med konfigurasjonsfiler.

### Q: Hvordan setter jeg miljøspesifikk konfigurasjon?
**A**: Bruk `azd env set` for å konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Kan jeg dele miljøkonfigurasjoner med teammedlemmer?
**A**: `.azure`-mappen inneholder sensitiv informasjon og bør ikke legges inn i versjonskontroll. I stedet:
1. Dokumenter nødvendige miljøvariabler
2. Bruk distribusjonsskript for å sette opp miljøer
3. Bruk Azure Key Vault for sensitive konfigurasjoner

### Q: Hvordan overstyrer jeg malens standardverdier?
**A**: Sett miljøvariabler som samsvarer med malparametere:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Feilsøking

### Q: Hvorfor feiler `azd up`?
**A**: Vanlige årsaker:
1. **Autentiseringsproblemer**: Kjør `azd auth login`
2. **Manglende tillatelser**: Sjekk Azure-rolleoppdrag
3. **Navnekonflikter med ressurser**: Endre AZURE_ENV_NAME
4. **Kvoter/kapasitetsproblemer**: Sjekk regionspesifikk tilgjengelighet
5. **Feil i maler**: Valider Bicep-maler

### Q: Hvordan feilsøker jeg distribusjonsfeil?
**A**: 
1. Bruk `azd deploy --debug` for detaljert output
2. Sjekk distribusjonshistorikk i Azure-portalen
3. Gå gjennom aktivitetslogg i Azure-portalen
4. Bruk `azd show` for å vise gjeldende miljøstatus

### Q: Hvorfor virker ikke miljøvariablene mine?
**A**: Sjekk:
1. At variabelnavn samsvarer nøyaktig med malparametere
2. At verdier er riktig sitert om de inneholder mellomrom
3. At riktig miljø er valgt: `azd env select <environment>`
4. At variablene er satt i riktig miljø

### Q: Hvordan rydder jeg opp i mislykkede distribusjoner?
**A**: 
```bash
azd down --force --purge
```
Dette fjerner alle ressurser og miljøkonfigurasjon.

### Q: Hvorfor er ikke applikasjonen min tilgjengelig etter distribusjon?
**A**: Sjekk:
1. At distribusjonen fullførte uten feil
2. At applikasjonen kjører (sjekk logger i Azure-portalen)
3. At nettverkssikkerhetsgrupper tillater trafikk
4. At DNS/egendefinerte domener er korrekt konfigurert

---

## Kostnader & Fakturering

### Q: Hvor mye vil azd-distribusjoner koste?
**A**: Kostnadene avhenger av:
- Azure-tjenester som deployeres
- Tjenestenivåer/SKUer som velges
- Regionsprisforskjeller
- Bruksmønstre

Bruk [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) for anslag.

### Q: Hvordan kontrollerer jeg kostnader i azd-distribusjoner?
**A**: 
1. Bruk lavere SKU-nivåer i utviklingsmiljøer
2. Sett opp Azure budsjetter og varslinger
3. Bruk `azd down` for å fjerne ressurser når de ikke trengs
4. Velg passende regioner (priser varierer med lokasjon)
5. Bruk Azure Cost Management-verktøy

### Q: Finnes det gratisnivå for azd-maler?
**A**: Mange Azure-tjenester tilbyr gratisnivå:
- App Service: Gratisnivå tilgjengelig
- Azure Functions: 1M gratis kjøringer per måned
- Cosmos DB: Gratisnivå med 400 RU/s
- Application Insights: Første 5GB per måned gratis

Konfigurer maler til å bruke gratisnivåer der det er tilgjengelig.

### Q: Hvordan estimerer jeg kostnader før distribusjon?
**A**: 
1. Gå gjennom malens `main.bicep` for å se hvilke ressurser som opprettes
2. Bruk Azure Pricing Calculator med spesifikke SKUer
3. Deploy til et utviklingsmiljø først for å overvåke faktiske kostnader
4. Bruk Azure Cost Management for detaljert kostnadsanalyse

---

## Beste praksis

### Q: Hva er beste praksis for azd-prosjektstruktur?
**A**: 
1. Hold applikasjonskode atskilt fra infrastrukturen
2. Bruk meningsfulle tjenestenavn i `azure.yaml`
3. Implementer god feilhåndtering i byggeskript
4. Bruk miljøspesifikk konfigurasjon
5. Inkluder grundig dokumentasjon

### Q: Hvordan organiserer jeg flere tjenester i azd?
**A**: Bruk anbefalt struktur:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Skal jeg legge `.azure`-mappen inn i versjonskontroll?
**A**: **Nei!** `.azure`-mappen inneholder sensitiv informasjon. Legg den til i `.gitignore`:
```gitignore
.azure/
```

### Q: Hvordan håndterer jeg hemmeligheter og sensitiv konfigurasjon?
**A**: 
1. Bruk Azure Key Vault for hemmeligheter
2. Referer Key Vault-hemmeligheter i applikasjonskonfigurasjon
3. Ikke legg hemmeligheter i versjonskontroll
4. Bruk administrerte identiteter for tjeneste-til-tjeneste autentisering

### Q: Hva er anbefalt tilnærming for CI/CD med azd?
**A**: 
1. Bruk separate miljøer for hvert steg (dev/staging/prod)
2. Implementer automatisert testing før distribusjon
3. Bruk tjenesteprinsipper for autentisering
4. Lagre sensitiv konfigurasjon i pipeline hemmeligheter/variabler
5. Implementer godkjenningsporter for produksjonsdistribusjoner

---

## Avanserte emner

### Q: Kan jeg utvide azd med egendefinert funksjonalitet?
**A**: Ja, gjennom distribusjonshooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Hvordan integrerer jeg azd med eksisterende DevOps-prosesser?
**A**: 
1. Bruk azd-kommandoer i eksisterende pipelineskript
2. Standardiser på azd-maler på tvers av team
3. Integrer med eksisterende overvåking og varsling
4. Bruk azd sin JSON-utdata for pipeline-integrasjon

### Q: Kan jeg bruke azd med Azure DevOps?
**A**: Ja, azd fungerer med alle CI/CD-systemer. Lag Azure DevOps pipelines som bruker azd-kommandoer.

### Q: Hvordan kan jeg bidra til azd eller lage fellesskapsmaler?
**A**: 
1. **azd-verktøy**: Bidra til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Malverk**: Lag maler i henhold til [malretningslinjene](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentasjon**: Bidra til dokumentasjonen på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Hva er veikartet for azd?
**A**: Sjekk det [offisielle veikartet](https://github.com/Azure/azure-dev/projects) for planlagte funksjoner og forbedringer.

### Q: Hvordan migrerer jeg fra andre distribusjonsverktøy til azd?
**A**: 
1. Analyser nåværende distribusjonsarkitektur
2. Lag tilsvarende Bicep-maler
3. Konfigurer `azure.yaml` for å matche nåværende tjenester
4. Test grundig i utviklingsmiljø
5. Migrer miljøer gradvis

---

## Har du fortsatt spørsmål?

### **Søk først**
- Sjekk [offisiell dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Søk i [GitHub issues](https://github.com/Azure/azure-dev/issues) etter lignende problemer

### **Få hjelp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Fellesskapsstøtte
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørsmål
- [Azure Discord](https://discord.gg/azure) - Fellesskapssamtaler i sanntid

### **Rapporter problemer**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Feilmeldinger og funksjonsforespørsler
- Inkluder relevante logger, feilmeldinger og trinn for å gjenskape

### **Lær mer**
- [Azure Developer CLI dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Denne FAQ-en oppdateres regelmessig. Sist oppdatert: 9. september 2025*

---

**Navigasjon**
- **Forrige leksjon**: [Glossar](glossary.md)
- **Neste leksjon**: [Studieveiledning](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->