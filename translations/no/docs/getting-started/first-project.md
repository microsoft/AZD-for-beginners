<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T21:07:57+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "no"
}
-->
# Ditt Første Prosjekt - Praktisk Veiledning

**Forrige:** [Konfigurasjon](configuration.md) | **Neste:** [Azure AI Foundry Integrasjon](../ai-foundry/azure-ai-foundry-integration.md)

## Introduksjon

Velkommen til ditt første Azure Developer CLI-prosjekt! Denne omfattende praktiske veiledningen gir deg en komplett gjennomgang av hvordan du oppretter, distribuerer og administrerer en fullstack-applikasjon på Azure ved hjelp av azd. Du vil jobbe med en ekte todo-applikasjon som inkluderer en React frontend, Node.js API backend og MongoDB-database.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre arbeidsflyten for initialisering av azd-prosjekter ved hjelp av maler
- Forstå strukturen og konfigurasjonsfilene i Azure Developer CLI-prosjekter
- Utføre fullstendig applikasjonsdistribusjon til Azure med infrastrukturprovisjonering
- Implementere strategier for applikasjonsoppdateringer og ny distribusjon
- Administrere flere miljøer for utvikling og staging
- Anvende praksiser for ressursopprydding og kostnadsstyring

## Læringsutbytte

Etter fullføring vil du kunne:
- Initialisere og konfigurere azd-prosjekter fra maler på egen hånd
- Navigere og endre azd-prosjektstrukturer effektivt
- Distribuere fullstack-applikasjoner til Azure med enkle kommandoer
- Feilsøke vanlige distribusjonsproblemer og autentiseringsfeil
- Administrere flere Azure-miljøer for ulike distribusjonsstadier
- Implementere kontinuerlige distribusjonsarbeidsflyter for applikasjonsoppdateringer

## Komme i Gang

### Sjekkliste for Forutsetninger
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](installation.md))
- ✅ Azure CLI installert og autentisert
- ✅ Git installert på systemet ditt
- ✅ Node.js 16+ (for denne veiledningen)
- ✅ Visual Studio Code (anbefalt)

### Verifiser Oppsettet
```bash
# Check azd installation
azd version
```
### Verifiser Azure-autentisering

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
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Hva Skjedde Akkurat?
- Malens kode ble lastet ned til din lokale katalog
- En `azure.yaml`-fil med tjenestedefinisjoner ble opprettet
- Infrastrukturkode ble satt opp i `infra/`-katalogen
- Et miljøkonfigurasjon ble opprettet

## Steg 2: Utforsk Prosjektstrukturen

La oss undersøke hva azd har opprettet for oss:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Du bør se:
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

### Viktige Filer å Forstå

**azure.yaml** - Kjernen i ditt azd-prosjekt:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinisjon:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Steg 3: Tilpass Prosjektet (Valgfritt)

Før distribusjon kan du tilpasse applikasjonen:

### Endre Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Gjør en enkel endring:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurer Miljøvariabler
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Steg 4: Distribuer til Azure

Nå til den spennende delen - distribuer alt til Azure!

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

Kommandoen `azd up` utfører disse stegene:
1. **Provisjon** (`azd provision`) - Oppretter Azure-ressurser
2. **Pakke** - Bygger applikasjonskoden din
3. **Distribuer** (`azd deploy`) - Distribuerer kode til Azure-ressurser

### Forventet Utdata
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Test Applikasjonen

### Få Tilgang til Applikasjonen
Klikk på URL-en som ble gitt i distribusjonsutdataene, eller hent den når som helst:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-Appen
1. **Legg til en todo-oppgave** - Klikk "Add Todo" og skriv inn en oppgave
2. **Marker som fullført** - Kryss av fullførte oppgaver
3. **Slett oppgaver** - Fjern todo-oppgaver du ikke lenger trenger

### Overvåk Applikasjonen
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Steg 6: Gjør Endringer og Distribuer på Nytt

La oss gjøre en endring og se hvor enkelt det er å oppdatere:

### Endre API-en
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Legg til en tilpasset responsheader:
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

Når du er ferdig med å eksperimentere, rydd opp for å unngå løpende kostnader:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Hva Du Har Lært

Gratulerer! Du har med suksess:
- Initialisert et azd-prosjekt fra en mal
- Utforsket prosjektstrukturen og viktige filer
- Distribuert en fullstack-applikasjon til Azure
- Gjort kodeendringer og distribuert på nytt
- Administrert flere miljøer
- Ryddet opp ressurser

## Feilsøking av Vanlige Problemer

### Autentiseringsfeil
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Distribusjonsfeil
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Ressursnavnkonflikter
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
- [Infrastruktur som kode](../deployment/provisioning.md)
- [Legg til databaser, lagring og andre tjenester](../deployment/provisioning.md#adding-services)

### 2. Sett Opp CI/CD
- [GitHub Actions Integrasjon](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Beste Praksiser for Produksjon
- [Sikkerhetskonfigurasjoner](../deployment/best-practices.md#security)
- [Ytelsesoptimalisering](../deployment/best-practices.md#performance)
- [Overvåking og logging](../deployment/best-practices.md#monitoring)

### 4. Utforsk Flere Maler
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Tilleggsressurser

### Læringsmateriale
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitektursenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fellesskap og Støtte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Maler og Eksempler
- [Offisiell Malgalleri](https://azure.github.io/awesome-azd/)
- [Fellesskapsmaler](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Mønstre](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulerer med å ha fullført ditt første azd-prosjekt!** Du er nå klar til å bygge og distribuere fantastiske applikasjoner på Azure med selvtillit.

---

**Forrige:** [Konfigurasjon](configuration.md) | **Neste:** [Azure AI Foundry Integrasjon](../ai-foundry/azure-ai-foundry-integration.md)
- **Neste Leksjon**: [Distribusjonsveiledning](../deployment/deployment-guide.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.