# Konfigurasjonsguide

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 3 - Konfigurasjon og autentisering
- **⬅️ Forrige**: [Your First Project](first-project.md)
- **➡️ Neste**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Neste kapittel**: [Kapittel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)

## Introduksjon

Denne omfattende veiledningen dekker alle aspekter av å konfigurere Azure Developer CLI for optimale utviklings- og distribusjonsarbeidsflyter. Du vil lære om konfigurasjonshierarkiet, miljøhåndtering, autentiseringsmetoder og avanserte konfigurasjonsmønstre som muliggjør effektive og sikre Azure-distribusjoner.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Mestre azd konfigurasjonshierarki og forstå hvordan innstillinger prioriteres
- Konfigurere globale og prosjektspesifikke innstillinger effektivt
- Administrere flere miljøer med forskjellige konfigurasjoner
- Implementere sikre autentiserings- og autorisasjonsmønstre
- Forstå avanserte konfigurasjonsmønstre for komplekse scenarioer

## Læringsutbytte

Etter å ha fullført denne leksjonen, vil du kunne:
- Konfigurere azd for optimale utviklingsarbeidsflyter
- Sette opp og administrere flere distribusjonsmiljøer
- Implementere sikre praksiser for konfigurasjonsstyring
- Feilsøke konfigurasjonsrelaterte problemer
- Tilpasse azd-opptreden etter spesifikke organisatoriske krav

Denne omfattende veiledningen dekker alle aspekter av å konfigurere Azure Developer CLI for optimale utviklings- og distribusjonsarbeidsflyter.

## Forståelse av AI-agenter i et azd-prosjekt

Hvis du er ny på AI-agenter, her er en enkel måte å tenke på dem i azd-verdenen.

### Hva er en agent?

En agent er et program som kan motta en forespørsel, resonnere rundt den, og utføre handlinger – ofte ved å kalle en AI-modell, slå opp data eller påkalle andre tjenester. I et azd-prosjekt er en agent bare en annen **tjeneste** sammen med ditt webfrontend eller API-backend.

### Hvordan agenter passer inn i azd-prosjektstrukturen

Et azd-prosjekt består av tre lag: **infrastruktur**, **kode**, og **konfigurasjon**. Agenter kobles til disse lagene på samme måte som alle andre tjenester:

| Lag | Hva det gjør for en tradisjonell app | Hva det gjør for en agent |
|-------|-------------------------------------|---------------------------|
| **Infrastruktur** (`infra/`) | Provisjonerer en webapp og database | Provisjonerer et AI-modellendepunkt, søkeindeks eller agentvert |
| **Kode** (`src/`) | Inneholder frontend- og API-kildekode | Inneholder agentlogikk og promptdefinisjoner |
| **Konfigurasjon** (`azure.yaml`) | Lister opp tjenestene dine og deres hostingmål | Lister agenten som en tjeneste, med peker til kode og vert |

### Rollen til `azure.yaml`

Du trenger ikke å huske syntaksen akkurat nå. Konseptuelt er `azure.yaml` filen der du forteller azd: *"Her er tjenestene som utgjør applikasjonen min, og her er hvor du finner koden deres."*

Når prosjektet ditt inkluderer en AI-agent, lister `azure.yaml` bare den agenten som en av tjenestene. azd vet da å provisjonere riktig infrastruktur (som et Microsoft Foundry Models-endepunkt eller en Container App for å hoste agenten) og distribuere agentkoden – akkurat som det ville gjort for en webapp eller API.

Dette betyr at det ikke er noe fundamentalt nytt å lære. Hvis du forstår hvordan azd håndterer en webtjeneste, forstår du allerede hvordan det håndterer en agent.

## Konfigurasjonshierarki

azd bruker et hierarkisk konfigurasjonssystem:
1. **Kommandolinjeflagg** (høyeste prioritet)
2. **Miljøvariabler**
3. **Lokal prosjektkonfigurasjon** (`.azd/config.json`)
4. **Global brukerkonfigurasjon** (`~/.azd/config.json`)
5. **Standardverdier** (laveste prioritet)

## Global konfigurasjon

### Sette globale standardverdier
```bash
# Sett standardabonnement
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Sett standardplassering
azd config set defaults.location "eastus2"

# Sett standard navnekonvensjon for ressursgrupper
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vis all global konfigurasjon
azd config list

# Fjern en konfigurasjon
azd config unset defaults.location
```

### Vanlige globale innstillinger
```bash
# Utviklingspreferanser
azd config set alpha.enable true                    # Aktiver alfa-funksjoner
azd config set telemetry.enabled false             # Deaktiver telemetri
azd config set output.format json                  # Angi utdataformat

# Sikkerhetsinnstillinger
azd config set auth.useAzureCliCredential true     # Bruk Azure CLI for autentisering
azd config set tls.insecure false                  # Håndhev TLS-verifisering

# Ytelsestilpasning
azd config set provision.parallelism 5             # Parallell ressursopprettelse
azd config set deploy.timeout 30m                  # Utrullingstidsavbrudd
```

## 🏗️ Prosjektkonfigurasjon

### azure.yaml Struktur
`azure.yaml`-filen er hjertet i azd-prosjektet ditt:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Tjenestekonfigurasjonsalternativer

#### Verttyper
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Språkspesifikke innstillinger
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Miljøhåndtering

### Opprette miljøer
```bash
# Opprett et nytt miljø
azd env new development

# Opprett med spesifikk plassering
azd env new staging --location "westus2"

# Opprett fra mal
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Miljøkonfigurasjon
Hvert miljø har sin egen konfigurasjon i `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Miljøvariabler
```bash
# Sett miljøspesifikke variabler
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Vis miljøvariabler
azd env get-values

# Forventet utdata:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=hemmelig-api-nøkkel
# DEBUG=sant

# Fjern miljøvariabel
azd env unset DEBUG

# Verifiser fjerning
azd env get-values | grep DEBUG
# (skal ikke returnere noe)
```

### Miljømaler
Lag `.azure/env.template` for konsekvent miljøoppsett:
```bash
# Krevede variabler
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Applikasjonsinnstillinger
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valgfrie utviklingsinnstillinger
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Autentiseringskonfigurasjon

### Integrasjon med Azure CLI
```bash
# Bruk Azure CLI-legitimasjon (standard)
azd config set auth.useAzureCliCredential true

# Logg inn med spesifikk leietaker
az login --tenant <tenant-id>

# Angi standardabonnement
az account set --subscription <subscription-id>
```

### Tjenesteprinsipp-autentisering
For CI/CD-pipelines:
```bash
# Sett miljøvariabler
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Eller konfigurer direkte
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Administrert identitet
For Azure-vertsmiljøer:
```bash
# Aktiver autentisering med administrert identitet
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastrukturkonfigurasjon

### Bicep-parametere
Konfigurer infrastrukturparametere i `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform-konfigurasjon
For Terraform-prosjekter, konfigurer i `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Distribusjonskonfigurasjon

### Byggekonfigurasjon
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker-konfigurasjon
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Eksempel `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml

## 🔧 Avansert konfigurasjon

### Egendefinert ressursnavngiving
```bash
# Sett navnekonvensjoner
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Nettverkskonfigurasjon
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Overvåkningskonfigurasjon
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Miljøspesifikke konfigurasjoner

### Utviklingsmiljø
```bash
# .azure/utvikling/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging-miljø
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produksjonsmiljø
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigurasjonsvalidering

### Valider konfigurasjon
```bash
# Sjekk konfigurasjonssyntaks
azd config validate

# Test miljøvariabler
azd env get-values

# Verifiser infrastruktur
azd provision --dry-run
```

### Konfigurasjonsskript
Lag valideringsskript i `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Sjekk nødvendige miljøvariabler
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valider azure.yaml syntaks
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Beste praksiser

### 1. Bruk miljøvariabler
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiser konfigurasjonsfiler
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Vurderinger for versjonskontroll
```bash
# .gitignore
.azure/*/config.json         # Miljøkonfigurasjoner (inneholder ressurs-IDer)
.azure/*/.env               # Miljøvariabler (kan inneholde hemmeligheter)
.env                        # Lokal miljøfil
```

### 4. Dokumentasjon av konfigurasjon
Dokumenter konfigurasjonen din i `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Praktiske øvelser

### Øvelse 1: Konfigurasjon for flere miljøer (15 minutter)

**Mål**: Opprett og konfigurer tre miljøer med forskjellige innstillinger

```bash
# Opprett utviklingsmiljø
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Opprett staging-miljø
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Opprett produksjonsmiljø
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifiser hvert miljø
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Suksesskriterier:**
- [ ] Tre miljøer opprettet uten feil
- [ ] Hvert miljø har unik konfigurasjon
- [ ] Kan bytte mellom miljøer uten feil
- [ ] `azd env list` viser alle tre miljøer

### Øvelse 2: Hemmelighetshåndtering (10 minutter)

**Mål**: Øv på sikker konfigurasjon med sensitiv informasjon

```bash
# Sett hemmeligheter (vises ikke i utdata)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Sett ikke-hemmelig konfigurasjon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vis miljø (hemmeligheter skal sladres)
azd env get-values

# Bekreft at hemmeligheter er lagret
azd env get DB_PASSWORD  # Skal vise faktisk verdi
```

**Suksesskriterier:**
- [ ] Hemmeligheter lagres uten å vises i terminalen
- [ ] `azd env get-values` viser skjulte hemmeligheter
- [ ] Individuell `azd env get <SECRET_NAME>` henter faktisk verdi

## Neste steg

- [Your First Project](first-project.md) - Bruk konfigurasjon i praksis
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Bruk konfigurasjon ved distribusjon
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Produksjonsklare konfigurasjoner

## Referanser

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 3 - Konfigurasjon og autentisering
- **⬅️ Forrige**: [Your First Project](first-project.md)
- **➡️ Neste kapittel**: [Kapittel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)
- **Neste leksjon**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets opprinnelige språk skal betraktes som det autoritative kildematerialet. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->