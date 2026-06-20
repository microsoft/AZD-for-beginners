# Configuratiehandleiding

**Hoofdstuknavigatie:**
- **📚 Cursusoverzicht**: [AZD For Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Vorige**: [Jouw Eerste Project](first-project.md)
- **➡️ Volgende**: [Implementatiehandleiding](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 4: Infrastructuur als Code](../chapter-04-infrastructure/deployment-guide.md)

## Inleiding

Deze uitgebreide handleiding behandelt alle aspecten van het configureren van de Azure Developer CLI voor optimale ontwikkel- en uitrolworkflows. Je leert over de configuratiehiërarchie, omgevingsbeheer, authenticatiemethoden en geavanceerde configuratiepatronen die efficiënte en veilige Azure-implementaties mogelijk maken.

## Leerdoelen

Aan het einde van deze les zul je:
- De azd-configuratiehiërarchie beheersen en begrijpen hoe instellingen worden geprioriteerd
- Globale en project-specifieke instellingen effectief configureren
- Meerdere omgevingen met verschillende configuraties beheren
- Veilige authenticatie- en autorisatiepatronen implementeren
- Geavanceerde configuratiepatronen voor complexe scenario's begrijpen

## Leerresultaten

Na het voltooien van deze les kun je:
- azd configureren voor optimale ontwikkelworkflows
- Meerdere implementatieomgevingen opzetten en beheren
- Veilige configuratiebeheerpraktijken implementeren
- Problemen met configuratie oplossen
- Het gedrag van azd aanpassen aan specifieke organisatorische vereisten

Deze uitgebreide handleiding behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkel- en uitrolworkflows.

## Begrijpen van AI-agents in een azd-project

Als je nieuw bent met AI-agents, is hier een eenvoudige manier om erover na te denken binnen de azd-wereld.

### Wat is een agent?

Een agent is een stuk software dat een verzoek kan ontvangen, erover kan redeneren en acties kan uitvoeren—vaak door een AI-model aan te roepen, gegevens op te zoeken of andere services te gebruiken. In een azd-project is een agent gewoon een andere **service** naast je webfrontend of API-backend.

### Hoe agents passen in de azd-projectstructuur

Een azd-project bestaat uit drie lagen: **infrastructure**, **code**, en **configuration**. Agents pluggen op dezelfde manier in deze lagen als elk ander servicecomponent:

| Laag | Wat het doet voor een traditionele app | Wat het doet voor een agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Voorziet in een webapp en database | Voorziet een AI-modelendpoint, zoekindex of agent-host |
| **Code** (`src/`) | Bevat je frontend- en API-broncode | Bevat je agentlogica en promptdefinities |
| **Configuration** (`azure.yaml`) | Lijst van je services en hun hostingdoelen | Lijst je agent als een service, verwijzend naar de code en host |

### De rol van `azure.yaml`

Je hoeft de syntax nu nog niet uit je hoofd te leren. Conceptueel is `azure.yaml` het bestand waarin je azd vertelt: *"Hier zijn de services die mijn applicatie vormen, en hier is te vinden waar hun code staat."*

Wanneer je project een AI-agent omvat, vermeldt `azure.yaml` die agent gewoon als een van de services. azd weet dan welke infrastructuur moet worden ingericht (zoals een Microsoft Foundry Models-endpoint of een Container App om de agent te hosten) en zet je agentcode uit—net zoals het dat voor een webapp of API zou doen.

Dit betekent dat er fundamenteel niets nieuws te leren is. Als je begrijpt hoe azd een webservice beheert, begrijp je al hoe het een agent beheert.

## Configuratiehiërarchie

azd gebruikt een hiërarchisch configuratiesysteem:
1. **Opdrachtregelvlaggen** (hoogste prioriteit)
2. **Omgevingsvariabelen**
3. **Lokale projectconfiguratie** (`.azd/config.json`)
4. **Globale gebruikersconfiguratie** (`~/.azd/config.json`)
5. **Standaardwaarden** (laagste prioriteit)

## Globale configuratie

### Globale standaardwaarden instellen
```bash
# Stel het standaardabonnement in
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Stel de standaardlocatie in
azd config set defaults.location "eastus2"

# Stel de standaardnaamgevingsconventie voor resourcegroepen in
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Bekijk alle globale configuraties
azd config show

# Verwijder een configuratie
azd config unset defaults.location
```

### Veelvoorkomende globale instellingen
```bash
# Ontwikkelingsvoorkeuren
azd config set alpha.enable true                    # Alpha-functies inschakelen
azd config set telemetry.enabled false             # Telemetrie uitschakelen
azd config set output.format json                  # Uitvoerformaat instellen

# Beveiligingsinstellingen
azd config set auth.useAzureCliCredential true     # Gebruik Azure CLI voor authenticatie
azd config set tls.insecure false                  # TLS-verificatie afdwingen

# Prestatieoptimalisatie
azd config set provision.parallelism 5             # Parallelle aanmaak van resources
azd config set deploy.timeout 30m                  # Time-out voor implementatie
```

## 🏗️ Projectconfiguratie

### Structuur van azure.yaml
Het `azure.yaml`-bestand is het hart van je azd-project:

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

### Opties voor serviceconfiguratie

#### Hosttypen
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

#### Taalspecifieke instellingen
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

## 🌟 Omgevingsbeheer

### Omgevingen aanmaken
```bash
# Maak een nieuwe omgeving
azd env new development

# Maak met een specifieke locatie
azd env new staging --location "westus2"

# Maak vanuit sjabloon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Omgevingsconfiguratie
Elke omgeving heeft zijn eigen configuratie in `.azure/<env-name>/config.json`:

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

### Omgevingsvariabelen
```bash
# Stel omgevingsspecifieke variabelen in
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Bekijk omgevingsvariabelen
azd env get-values

# Verwachte uitvoer:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Verwijder omgevingsvariabele
azd env unset DEBUG

# Controleer verwijdering
azd env get-values | grep DEBUG
# (moet niets teruggeven)
```

### Omgevingssjablonen
Maak `.azure/env.template` voor consistente omgevingsinstelling:
```bash
# Vereiste variabelen
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Applicatie-instellingen
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optionele ontwikkelinstellingen
DEBUG=false
LOG_LEVEL=info
```

### Omgevingen delen binnen een team

Wanneer meer dan één persoon aan een project werkt, moet je het eens worden over **wat met de repository meereist en wat lokaal blijft**. azd houdt elke omgeving onder een `.azure/`-map, en niet alles daarvan zou gecommit moeten worden.

**Wat zit er in `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Wat te gitignore-en.** azd's standaard `.gitignore` sluit `.azure/` al uit. Laat dat zo—de `.env`-bestanden kunnen geheimen bevatten, en resource-ID's zijn specifiek voor degene die ze heeft voorzien. Elke teamgenoot creëert lokaal zijn **eigen** omgeving:

```bash
# Elke ontwikkelaar voert dit één keer uit om een eigen geïsoleerde omgeving te krijgen
azd env new dev-alice
azd up
```

**Schakelen tussen omgevingen.** Een ontwikkelaar die meerdere omgevingen beheert selecteert de actieve omgeving voordat hij opdrachten uitvoert:

```bash
azd env list                 # bekijk alle lokale omgevingen en welke de standaard is
azd env select staging       # maak 'staging' de actieve omgeving
azd env get-values           # controleer of je op de juiste omgeving gericht bent
```

**Niet-geheime standaarden aan het team geven.** Commit een sjabloon (zoals de `.azure/env.template` hierboven) zodat iedereen weet welke variabelen ingesteld moeten worden—maar commit nooit de ingevulde waarden. Nieuwe teamgenoten kopiëren het sjabloon en vullen hun eigen waarden in.

**Omgevingen in CI/CD.** Pipelines lezen je lokale `.azure/`-map niet. Geef in plaats daarvan de omgevingswaarden als pipeline-variabelen/geheimen, en azd leest ze uit de procesomgeving:

```bash
# In CI, azd leest deze uit de omgeving, niet uit .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Vuistregel:** infrastructuurcode (`infra/`, `azure.yaml`) wordt gedeeld in Git; omgeving *staat en geheimen* (`.azure/`) zijn per ontwikkelaar en per pipeline. `azd pipeline config` zet de pipeline-variabelen automatisch voor je op.

## 🔐 Authenticatieconfiguratie

### Azure CLI-integratie
```bash
# Gebruik Azure CLI-referenties (standaard)
azd config set auth.useAzureCliCredential true

# Inloggen met specifieke tenant
az login --tenant <tenant-id>

# Stel standaardabonnement in
az account set --subscription <subscription-id>
```

### Authenticatie met Service Principal
Voor CI/CD-pipelines:
```bash
# Stel omgevingsvariabelen in
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Of configureer direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Beheerde identiteit
Voor in Azure gehoste omgevingen:
```bash
# Schakel authenticatie met beheerde identiteit in
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructuurconfiguratie

### Bicep-parameters
Configureer infrastructuurparameters in `infra/main.parameters.json`:
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

### Terraform-configuratie
Voor Terraform-projecten, configureer in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Implementatieconfiguratie

### Buildconfiguratie
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

### Docker-configuratie
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
Voorbeeld `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Geavanceerde configuratie

### Aangepaste resourcebenamingen
```bash
# Stel naamgevingsconventies in
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Netwerkconfiguratie
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoringconfiguratie
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

## 🎯 Omgevingsspecifieke configuraties

### Ontwikkelomgeving
```bash
# .azure/ontwikkeling/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Stagingomgeving
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Productieomgeving
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuratievalidatie

### Configuratie valideren
```bash
# Controleer configuratiesyntaxis
azd config validate

# Test omgevingsvariabelen
azd env get-values

# Valideer infrastructuur
azd provision --dry-run
```

### Configuratiescripts
Maak validatiescripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Controleer de vereiste omgevingsvariabelen
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valideer de syntaxis van azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Beste praktijken

### 1. Gebruik omgevingsvariabelen
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiseer configuratiebestanden
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

### 3. Overwegingen voor versiebeheer
```bash
# .gitignore
.azure/*/config.json         # Omgevingsconfiguraties (bevatten resource-ID's)
.azure/*/.env               # Omgevingsvariabelen (kunnen geheimen bevatten)
.env                        # Lokaal omgevingsbestand
```

### 4. Configuratiedocumentatie
Documenteer je configuratie in `CONFIG.md`:
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

## 🎯 Praktijkoefeningen

### Oefening 1: Multi-omgevingconfiguratie (15 minuten)

**Doel**: Maak en configureer drie omgevingen met verschillende instellingen

```bash
# Maak een ontwikkelomgeving
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Maak een stagingomgeving
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Maak een productieomgeving
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Controleer elke omgeving
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Succescriteria:**
- [ ] Drie omgevingen succesvol aangemaakt
- [ ] Elke omgeving heeft een unieke configuratie
- [ ] Kan schakelen tussen omgevingen zonder fouten
- [ ] `azd env list` toont alle drie de omgevingen

### Oefening 2: Geheimbeheer (10 minuten)

**Doel**: Oefen veilige configuratie met gevoelige gegevens

```bash
# Stel geheimen in (niet weergegeven in uitvoer)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Stel niet-geheime configuratie in
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Bekijk omgeving (geheimen moeten worden afgeschermd)
azd env get-values

# Controleer of geheimen zijn opgeslagen
azd env get DB_PASSWORD  # Moet de werkelijke waarde tonen
```

**Succescriteria:**
- [ ] Geheimen opgeslagen zonder weergave in de terminal
- [ ] `azd env get-values` toont afgeschermde geheimen
- [ ] Individuele `azd env get <SECRET_NAME>` haalt de werkelijke waarde op

## Volgende stappen

- [Jouw Eerste Project](first-project.md) - Pas de configuratie in de praktijk toe
- [Implementatiehandleiding](../chapter-04-infrastructure/deployment-guide.md) - Gebruik configuratie voor implementatie
- [Provisioning van resources](../chapter-04-infrastructure/provisioning.md) - Productieklare configuraties

## Referenties

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Hoofdstuknavigatie:**
- **📚 Cursusoverzicht**: [AZD For Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Vorige**: [Jouw Eerste Project](first-project.md)
- **➡️ Volgend Hoofdstuk**: [Hoofdstuk 4: Infrastructuur als Code](../chapter-04-infrastructure/deployment-guide.md)
- **Volgende Les**: [Jouw Eerste Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->