# Ditt første prosjekt - praktisk veiledning

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag og rask start
- **⬅️ Forrige**: [Installasjon og oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste kapittel**: [Kapittel 2: AI-fokusert utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Velkommen til ditt første Azure Developer CLI-prosjekt! Denne omfattende praktiske veiledningen gir en komplett gjennomgang av å opprette, distribuere og administrere en fullstack-applikasjon på Azure ved hjelp av azd. Du vil jobbe med en ekte todo-applikasjon som inkluderer en React-frontend, Node.js API-backend og MongoDB-database.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre azd-prosjektets initialiseringsflyt ved bruk av maler
- Forstå Azure Developer CLI-prosjektstruktur og konfigurasjonsfiler
- Utføre fullstendig applikasjonsdistribusjon til Azure med infrastrukturprovisjon
- Implementere applikasjonsoppdateringer og redeploy-strategier
- Administrere flere miljøer for utvikling og staging
- Anvende ressursopprydding og kostnadsstyringspraksis

## Læringsutbytte

Etter fullføring vil du kunne:
- Initialisere og konfigurere azd-prosjekter fra maler selvstendig
- Navigere og endre azd-prosjektstrukturer effektivt
- Distribuere fullstack-applikasjoner til Azure med enkeltkommandoer
- Feilsøke vanlige distribusjonsproblemer og autentiseringsproblemer
- Administrere flere Azure-miljøer for ulike distribusjonsstadier
- Implementere kontinuerlige distribusjonsarbeidsflyter for applikasjonsoppdateringer

## Kom i gang

### Sjekkliste for forutsetninger
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](installation.md))
- ✅ Azure CLI installert og autentisert
- ✅ Git installert på systemet ditt
- ✅ Node.js 16+ (for denne veiledningen)
- ✅ Visual Studio Code (anbefalt)

### Bekreft oppsettet ditt
```bash
# Sjekk azd-installasjonen
azd version
```
### Bekreft Azure-autentisering

```bash
az account show
```

### Sjekk Node.js-versjon
```bash
node --version
```

## Trinn 1: Velg og initialiser en mal

La oss begynne med en populær todo-applikasjonsmal som inkluderer en React-frontend og Node.js API-backend.

```bash
# Bla gjennom tilgjengelige maler
azd template list

# Initialiser todo-app-malen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Følg instruksjonene:
# - Skriv inn et miljønavn: "dev"
# - Velg et abonnement (hvis du har flere)
# - Velg en region: "East US 2" (eller din foretrukne region)
```

### Hva skjedde akkurat?
- Lastet ned malens kode til din lokale katalog
- Opprettet en `azure.yaml`-fil med tjenestedefinisjoner
- Satt opp infrastrukturkode i `infra/`-mappen
- Opprettet en miljøkonfigurasjon

## Trinn 2: Utforsk prosjektstrukturen

La oss se på hva azd opprettet for oss:

```bash
# Vis prosjektstrukturen
tree /f   # Windows
# eller
find . -type f | head -20   # macOS/Linux
```

Du skal se:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Nøkkelfiler å forstå

**azure.yaml** - Hjertet i azd-prosjektet ditt:
```bash
# Vis prosjektkonfigurasjonen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinisjon:
```bash
# Vis infrastrukturkoden
head -30 infra/main.bicep
```

## Trinn 3: Tilpass prosjektet ditt (valgfritt)

Før du distribuerer, kan du tilpasse applikasjonen:

### Endre frontend
```bash
# Åpne React-appkomponenten
code src/web/src/App.tsx
```

Gjør en enkel endring:
```typescript
// Finn tittelen og endre den
<h1>My Awesome Todo App</h1>
```

### Konfigurer miljøvariabler
```bash
# Angi egendefinerte miljøvariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vis alle miljøvariabler
azd env get-values
```

## Trinn 4: Distribuer til Azure

Nå kommer den spennende delen – distribuer alt til Azure!

```bash
# Distribuer infrastruktur og applikasjon
azd up

# Denne kommandoen vil:
# 1. Opprette Azure-ressurser (App Service, Cosmos DB osv.)
# 2. Bygg applikasjonen din
# 3. Distribuer til de opprettede ressursene
# 4. Vis applikasjonens URL
```

### Hva skjer under distribusjonen?

Kommandoen `azd up` utfører disse trinnene:
1. **Provision** (`azd provision`) - Oppretter Azure-ressurser
2. **Package** - Bygger applikasjonskoden din
3. **Deploy** (`azd deploy`) - Distribuerer kode til Azure-ressurser

### Forventet utdata
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Trinn 5: Test applikasjonen din

### Få tilgang til applikasjonen din
Klikk på URL-en som ble oppgitt i distribusjonsutdataene, eller hent den når som helst:
```bash
# Hent applikasjonsendepunkter
azd show

# Åpne applikasjonen i nettleseren din
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-appen
1. **Legg til et todo-element** - Klikk "Add Todo" og skriv inn en oppgave
2. **Merk som fullført** - Kryss av fullførte elementer
3. **Slett elementer** - Fjern todoer du ikke lenger trenger

### Overvåk applikasjonen din
```bash
# Åpne Azure-portalen for ressursene dine
azd monitor

# Vis applikasjonslogger
azd monitor --logs

# Vis sanntidsmålinger
azd monitor --live
```

## Trinn 6: Gjør endringer og distribuer på nytt

La oss gjøre en endring og se hvor enkelt det er å oppdatere:

### Endre API-en
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Legg til en egendefinert responsoverskrift:
```javascript
// Finn en rutehåndterer og legg til:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuer bare kodeendringene
```bash
# Distribuer kun applikasjonskoden (hopp over infrastrukturen)
azd deploy

# Dette er mye raskere enn 'azd up' siden infrastrukturen allerede finnes
```

## Trinn 7: Administrer flere miljøer

Opprett et staging-miljø for å teste endringer før produksjon:

```bash
# Opprett et nytt staging-miljø
azd env new staging

# Distribuer til staging
azd up

# Bytt tilbake til utviklingsmiljø
azd env select dev

# List opp alle miljøer
azd env list
```

### Miljøsammenligning
```bash
# Vis utviklingsmiljø
azd env select dev
azd show

# Vis staging-miljø
azd env select staging
azd show
```

## Trinn 8: Rydd opp ressurser

Når du er ferdig med å eksperimentere, rydd opp for å unngå løpende kostnader:

```bash
# Slett alle Azure-ressurser for gjeldende miljø
azd down

# Tving sletting uten bekreftelse og fjern mykt slettede ressurser permanent
azd down --force --purge

# Slett et spesifikt miljø
azd env select staging
azd down --force --purge
```

## Hva du har lært

Gratulerer! Du har med suksess:
- ✅ Initialisert et azd-prosjekt fra en mal
- ✅ Utforsket prosjektstrukturen og nøkkelfiler
- ✅ Distribuert en fullstack-applikasjon til Azure
- ✅ Gjort kodeendringer og distribuert på nytt
- ✅ Administrert flere miljøer
- ✅ Ryddet opp ressurser

## 🎯 Ferdighetsvalideringsøvelser

### Øvelse 1: Distribuer en annen mal (15 minutter)
**Mål**: Demonstrere mestring av azd init og distribusjonsflyt

```bash
# Prøv Python + MongoDB-stabel
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Bekreft distribusjon
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Applikasjonen distribueres uten feil
- [ ] Kan få tilgang til applikasjons-URL i nettleser
- [ ] Applikasjonen fungerer riktig (legg til/fjern todos)
- [ ] Vellykket opprydding av alle ressurser

### Øvelse 2: Tilpass konfigurasjon (20 minutter)
**Mål**: Øv på konfigurasjon av miljøvariabler

```bash
cd my-first-azd-app

# Opprett egendefinert miljø
azd env new custom-config

# Sett egendefinerte variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifiser variabler
azd env get-values | grep APP_TITLE

# Distribuer med egendefinert konfigurasjon
azd up
```

**Suksesskriterier:**
- [ ] Egendefinert miljø opprettet vellykket
- [ ] Miljøvariabler satt og hentbare
- [ ] Applikasjonen distribueres med egendefinert konfigurasjon
- [ ] Kan verifisere egendefinerte innstillinger i distribuert app

### Øvelse 3: Flermiljø-arbeidsflyt (25 minutter)
**Mål**: Mestre miljøhåndtering og distribusjonsstrategier

```bash
# Opprett utviklingsmiljø
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noter utviklings-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Opprett stagingmiljø
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Noter staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Sammenlign miljøene
azd env list

# Test begge miljøene
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Rydd opp i begge miljøene
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Suksesskriterier:**
- [ ] To miljøer opprettet med ulike konfigurasjoner
- [ ] Begge miljøene distribuert vellykket
- [ ] Kan bytte mellom miljøer ved hjelp av `azd env select`
- [ ] Miljøvariabler varierer mellom miljøene
- [ ] Vellykket opprydding av begge miljøene

## 📊 Din fremgang

**Tid investert**: ~60-90 minutter  
**Ervervede ferdigheter**:
- ✅ Malbasert prosjektinitialisering
- ✅ Azure-ressursprovisjon
- ✅ Applikasjonsdistribusjonsarbeidsflyter
- ✅ Miljøhåndtering
- ✅ Konfigurasjonshåndtering
- ✅ Ressursopprydding og kostnadsstyring

**Neste nivå**: Du er klar for [Konfigurasjonsveiledning](configuration.md) for å lære avanserte konfigurasjonsmønstre!

## Feilsøking av vanlige problemer

### Autentiseringsfeil
```bash
# Autentiser på nytt med Azure
az login

# Bekreft tilgang til abonnementet
az account show
```

### Distribusjonsfeil
```bash
# Aktiver feilsøkingslogging
export AZD_DEBUG=true
azd up --debug

# Vis applikasjonslogger i Azure
azd monitor --logs

# For Container Apps, bruk Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikter med ressursnavn
```bash
# Bruk et unikt miljønavn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/nettverksproblemer
```bash
# Sjekk om porter er tilgjengelige
netstat -an | grep :3000
netstat -an | grep :3100
```

## Neste steg

Nå som du har fullført ditt første prosjekt, utforsk disse avanserte emnene:

### 1. Tilpass infrastruktur
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sett opp CI/CD
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) - Fullstendige CI/CD-arbeidsflyter
- [Dokumentasjon for Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfigurasjon

### 3. Beste praksis for produksjon
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhet, ytelse og overvåking

### 4. Utforsk flere maler
```bash
# Bla gjennom maler etter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prøv forskjellige teknologistabler
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ytterligere ressurser

### Læringsmateriale
- [Dokumentasjon for Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fellesskap og støtte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Maler og eksempler
- [Offisielt malgalleri](https://azure.github.io/awesome-azd/)
- [Fellesskapsmaler](https://github.com/Azure-Samples/azd-templates)
- [Bedriftsmønstre](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulerer med å ha fullført ditt første azd-prosjekt!** Du er nå klar til å bygge og distribuere fantastiske applikasjoner på Azure med selvtillit.

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 1 - Grunnlag og rask start
- **⬅️ Forrige**: [Installasjon og oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste kapittel**: [Kapittel 2: AI-fokusert utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Neste leksjon**: [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, må du være oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->