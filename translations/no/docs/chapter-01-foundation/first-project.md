# Ditt Første Prosjekt - Praktisk Veiledning

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Velkommen til ditt første Azure Developer CLI-prosjekt! Du skal distribuere en todo-applikasjon med en React frontend, Node.js API, og Azure Cosmos DB. Malen beholder det historiske navnet `todo-nodejs-mongo`; den nåværende infrastrukturen bruker Cosmos DB for NoSQL, så undersøk den nedlastede README og `infra/` i stedet for å anta database-API fra navnet.

> Gjennomgått mot `azd 1.37.2` og den offentlige malen i november 2026. Eksemplene nedenfor bruker Bash; JSON-uttrekk krever også `jq`. Azure-distribusjoner medfører kostnader og ble ikke utført under denne gjennomgangen.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre azd prosjektinitialiseringsarbeidsflyt ved bruk av maler
- Forstå Azure Developer CLI prosjektstruktur og konfigurasjonsfiler
- Utføre fullstendig applikasjonsdistribusjon til Azure med infrastrukturprovisjonering
- Implementere applikasjonsoppdateringer og redeployeringsstrategier
- Administrere flere miljøer for utvikling og staging
- Anvende ressurs-rensing og kostnadsstyringspraksis

## Læringsutbytte

Når du er ferdig, vil du kunne:
- Initialisere og konfigurere azd prosjekter fra maler selvstendig
- Navigere og modifisere azd prosjektstrukturer effektivt
- Distribuere full-stack applikasjoner til Azure med enkeltkommandoer
- Feilsøke vanlige distribusjonsproblemer og autentiseringsfeil
- Administrere flere Azure-miljøer for ulike distribusjonsstadier
- Implementere kontinuerlige distribusjonsarbeidsflyter for applikasjonsoppdateringer

## Komme i Gang

### Sjekkliste for Forutsetninger
- ✅ Azure Developer CLI installert ([Installasjonsguide](installation.md))
- ✅ AZD-autentisering fullført med `azd auth login`
- ✅ Git installert på systemet ditt
- ✅ Node.js 22 LTS (eller en støttet versjon som kreves av den nedlastede malen)
- ✅ Visual Studio Code (anbefalt)

Før du fortsetter, kjør oppsettvalidereren fra depotets rot:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Bekreft Oppsettet Ditt
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifiser valgfri Azure CLI-autentisering

```bash
az account show
```

### Sjekk Node.js-versjon
```bash
node --version
```

## Steg 1: Velg og Initialiser en Mal

La oss starte med en populær todo-applikasjonsmal som inkluderer en React frontend og Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Hva Skjedde Nettopp?
- Lastet ned mal-kode til din lokale katalog
- Opprettet en `azure.yaml`-fil med tjenestedefinisjoner
- Satte opp infrastrukturkode i `infra/`-mappen
- Opprettet en miljøkonfigurasjon

## Steg 2: Utforsk Prosjektstrukturen

La oss se nærmere på hva azd laget for oss:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Du bør se:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Viktige Filer å Forstå

**azure.yaml** - Hjertet i ditt azd prosjekt:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinisjon:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Steg 3: Tilpass Prosjektet Ditt (Valgfritt)

Før distribusjon kan du tilpasse applikasjonen:

### Endre Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Gjør en enkel endring:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurer Miljøvariabler
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Disse to tilpassede verdiene demonstrerer lokal lagring kun. Standardmalen bruker ikke `WEBSITE_TITLE` eller `API_VERSION`, så de endrer ikke appen. Den eksplisitte kilderedigereringen ovenfor endrer den viste tittelen.

## Steg 4: Distribuer til Azure

Nå kommer den spennende delen - distribuer alt til Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Hva Skjer Under Distribusjonen?

Arbeidsflyten provisjonerer infrastruktur og pakker/distribuerer kode. Eksakt rekkefølge kan tilpasses med `workflows.up` i `azure.yaml`; denne malen spesifiserer provisjon først etterfulgt av deploy. Ikke stol på en universell fase-rekkefølge for alle maler.

### Forventet Utgang
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Test Applikasjonen Din

### Tilgang til Applikasjonen Din
Klikk på URL-en som ble oppgitt i distribusjonsutgangen, eller hent den når som helst:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Test Todo-appen
1. **Legg til en todo-post** - Klikk "Add Todo" og skriv inn en oppgave
2. **Marker som fullført** - Kryss av fullførte oppgaver
3. **Slett oppgaver** - Fjern todoer du ikke lenger trenger

### Overvåk Applikasjonen Din
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifiser Distribusjonen Din

Før du går videre, gå gjennom denne raske sjekklisten for å bekrefte at alt faktisk fungerer – ikke anta at "deploy lykkes" betyr "appen fungerer":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Distribusjonen er verifisert når:**
- ✅ `azd show` viser en tilgjengelig endepunkt-URL
- ✅ URL-en åpnes i nettleseren uten feil
- ✅ Kjernefunksjoner fungerer (legg til/fullfør/slett en todo)
- ✅ `azd monitor --logs` viser forespørsler som kommer uten uventede feil

Hvis noen sjekk feiler, gå til [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md).

## Steg 6: Gjør Endringer og Redeployer

La oss gjøre en endring og se hvor enkelt det er å oppdatere:

### Endre API-en
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Legg til en egendefinert responsheader:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuer Kun Kodeendringene
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Steg 7: Administrer Flere Miljøer

Opprett et staging-miljø for å teste endringer før produksjon:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Miljøsammenligning
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Steg 8: Rydd Opp Ressurser

Når du er ferdig med å eksperimentere, rydd opp for å unngå pågående kostnader:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassisk App vs. AI-Drevet App: Samme Arbeidsflyt

Du nettopp distribuerte en tradisjonell webapplikasjon. Men hva om du ønsket å distribuere en AI-drevet app i stedet—si en chatteapplikasjon støttet av Microsoft Foundry Models?

De gode nyhetene: **arbeidsflyten er identisk.**

| Steg | Klassisk Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialiser (tom mappe) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentiser | `azd auth login` | `azd auth login` |
| Distribuer | `azd up` | `azd up` |
| Overvåk | `azd monitor` | `azd monitor` |
| Rydd opp | `azd down --force --purge` | `azd down --force --purge` |

Livssykluskommandoene er de samme, men forutsetninger varierer. En AI-mal kan kreve modelltilgang, regional kvote, datainntak og tilleggskonfigurasjon. Les README før distribusjon; `azd up` kan ikke levere manglende tillatelser eller kvote.

Dette er kjerneprinsippet i azd: **én arbeidsflyt, hvilken som helst arbeidsmengde.** Ferdighetene du øvde på i denne veiledningen—initialisering, distribusjon, overvåkning, redeployering og opprydding—gjelder like mye for AI-applikasjoner og agenter.

---

## Det Du Har Lært

Gratulerer! Du har med suksess:
- ✅ Initialisert et azd prosjekt fra en mal
- ✅ Utforsket prosjektstruktur og nøkkelfiler
- ✅ Distribuert en full-stack applikasjon til Azure
- ✅ Gjort kodeendringer og redeployert
- ✅ Administrert flere miljøer
- ✅ Ryddet opp ressurser

## 🎯 Ferdighetsvalideringsøvelser

### Øvelse 1: Distribuer en Annen Mal (15 minutter)
**Mål**: Demonstrere mestring av azd init og distribusjonsarbeidsflyt

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Applikasjonen distribueres uten feil
- [ ] Kan få tilgang til applikasjons-URL i nettleser
- [ ] Applikasjonen fungerer korrekt (legg til/fjern todos)
- [ ] Alle ressurser ryddet opp med suksess

### Øvelse 2: Tilpass Konfigurasjon (20 minutter)
**Mål**: Øve på lokal miljøverdilagring uten å forveksle det med runtime-konfigurasjon

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Suksesskriterier:**
- [ ] Tilpasset miljø opprettet med hell
- [ ] Miljøvariabler satt og hentbare
- [ ] `azd env get-value APP_TITLE` skriver ut `My Custom Todo App`
- [ ] Kan forklare hvorfor disse verdiene ikke endrer standardappen med mindre kode/infrastruktur bruker dem

### Øvelse 3: Multi-Miljø Arbeidsflyt (25 minutter)
**Mål**: Mestre miljøadministrasjon og distribusjonsstrategier

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Suksesskriterier:**
- [ ] To miljøer opprettet med forskjellige konfigurasjoner
- [ ] Begge miljøene distribuert med suksess
- [ ] Kan bytte mellom miljøer med `azd env select`
- [ ] Miljøvariabler er forskjellige mellom miljøene
- [ ] Begge miljøer ryddet opp med suksess

## 📊 Din Fremgang

**Tid Investert**: ~60-90 minutter  
**Ervervede Ferdigheter**:
- ✅ Malbasert prosjektinitialisering
- ✅ Azure ressursprovisjonering
- ✅ Applikasjonsdistribusjonsarbeidsflyter
- ✅ Miljøadministrasjon
- ✅ Konfigurasjonsadministrasjon
- ✅ Ressursopprydding og kostnadsstyring

**Neste Nivå**: Du er klar for [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md) for å lære avanserte konfigurasjonsmønstre!

## Feilsøking av Vanlige Problemer

### Autentiseringsfeil
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Distribusjonssvikt
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursnavnkollisjoner
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Nettverksproblemer
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Neste Steg

Nå som du har fullført ditt første prosjekt, utforsk disse avanserte temaene:

### 1. Tilpass Infrastruktur
- [Infrastruktur som kode](../chapter-04-infrastructure/provisioning.md)
- [Legg til databaseløsning](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Sett opp CI/CD
- [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md) - Fullstendige CI/CD-arbeidsflyter
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline-konfigurasjon

### 3. Produksjonsbestepraksis
- [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhet, ytelse og overvåking

### 4. Utforsk Flere Maler
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Tilleggsressurser

### Læringsmateriell
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitektursenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fellesskap & Støtte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Maler & Eksempler
- [Offisiell Mal-galleri](https://azure.github.io/awesome-azd/)
- [Fellesskapsmal Bidrag](https://github.com/Azure/awesome-azd)
- [Todo Mal Kilde](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gratulerer med fullført ditt første azd-prosjekt!** Du er nå klar til å bygge og distribuere fantastiske applikasjoner på Azure med selvtillit.

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->