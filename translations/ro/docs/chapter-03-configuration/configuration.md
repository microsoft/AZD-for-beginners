# Ghid de configurare

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 3 - Configurare & Autentificare
- **⬅️ Anterior**: [Primul tău proiect](first-project.md)
- **➡️ Următor**: [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Următorul capitol**: [Capitolul 4: Infrastructură ca cod](../chapter-04-infrastructure/deployment-guide.md)

## Introducere

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de lucru optime de dezvoltare și implementare. Vei învăța despre ierarhia de configurare, gestionarea mediilor, metodele de autentificare și tiparele avansate de configurare care permit implementări Azure eficiente și sigure.

## Obiective de învățare

La sfârșitul acestei lecții, veți:
- Stăpâni ierarhia de configurare azd și înțelegeți modul în care sunt prioritizate setările
- Configura setările globale și specifice proiectului în mod eficient
- Gestiona medii multiple cu configurații diferite
- Implementa tipare sigure de autentificare și autorizare
- Înțelege tipare avansate de configurare pentru scenarii complexe

## Rezultate ale învățării

După parcurgerea acestei lecții, veți putea:
- Configura azd pentru fluxuri de lucru optime de dezvoltare
- Configura și administra medii multiple de implementare
- Implementa practici sigure de gestionare a configurației
- Depana probleme legate de configurare
- Personaliza comportamentul azd pentru cerințe organizaționale specifice

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de lucru optime de dezvoltare și implementare.

## Ierarhia de configurare

azd folosește un sistem ierarhic de configurare:
1. **Flaguri din linia de comandă** (cea mai mare prioritate)
2. **Variabile de mediu**
3. **Configurare locală a proiectului** (`.azd/config.json`)
4. **Configurare globală a utilizatorului** (`~/.azd/config.json`)
5. **Valori implicite** (cea mai mică prioritate)

## Configurare globală

### Setarea valorilor implicite globale
```bash
# Setează abonamentul implicit
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Setează locația implicită
azd config set defaults.location "eastus2"

# Setează convenția implicită de denumire a grupului de resurse
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vizualizează toată configurația globală
azd config list

# Elimină o configurație
azd config unset defaults.location
```

### Setări globale comune
```bash
# Preferințe de dezvoltare
azd config set alpha.enable true                    # Activează funcționalități alpha
azd config set telemetry.enabled false             # Dezactivează telemetria
azd config set output.format json                  # Setează formatul de ieșire

# Setări de securitate
azd config set auth.useAzureCliCredential true     # Folosește Azure CLI pentru autentificare
azd config set tls.insecure false                  # Forțează verificarea TLS

# Optimizarea performanței
azd config set provision.parallelism 5             # Crearea paralelă a resurselor
azd config set deploy.timeout 30m                  # Timeout pentru implementare
```

## 🏗️ Configurare proiect

### Structura `azure.yaml`
Fișierul `azure.yaml` este inima proiectului tău azd:

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

### Opțiuni de configurare a serviciilor

#### Tipuri de gazdă
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

#### Setări specifice limbajului
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

## 🌟 Gestionarea mediilor

### Crearea mediilor
```bash
# Creează un mediu nou
azd env new development

# Creează cu o locație specifică
azd env new staging --location "westus2"

# Creează din șablon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurarea mediului
Fiecare mediu are propria configurație în `.azure/<env-name>/config.json`:

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

### Variabile de mediu
```bash
# Setează variabile specifice mediului
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Vizualizează variabilele de mediu
azd env get-values

# Ieșire așteptată:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Elimină variabila de mediu
azd env unset DEBUG

# Verifică eliminarea
azd env get-values | grep DEBUG
# (nu ar trebui să returneze nimic)
```

### Șabloane de mediu
Creați `.azure/env.template` pentru configurare consistentă a mediului:
```bash
# Variabile necesare
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Setări ale aplicației
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Setări opționale de dezvoltare
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Configurare autentificare

### Integrare Azure CLI
```bash
# Folosește acreditările Azure CLI (implicit)
azd config set auth.useAzureCliCredential true

# Autentifică-te cu un tenant specific
az login --tenant <tenant-id>

# Setează abonamentul implicit
az account set --subscription <subscription-id>
```

### Autentificare cu Service Principal
Pentru pipeline-uri CI/CD:
```bash
# Setați variabilele de mediu
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Sau configurați direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identitate gestionată
Pentru medii găzduite în Azure:
```bash
# Activați autentificarea cu identitate administrată
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configurare infrastructură

### Parametri Bicep
Configurați parametrii infrastructurii în `infra/main.parameters.json`:
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

### Configurare Terraform
Pentru proiecte Terraform, configurați în `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configurare implementare

### Configurare build
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

### Configurare Docker
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
Exemplu de `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configurare avansată

### Denumirea personalizată a resurselor
```bash
# Stabiliți convențiile de denumire
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configurare rețea
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configurare monitorizare
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

## 🎯 Configurații specifice mediului

### Mediu de dezvoltare
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mediu de staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Mediu de producție
```bash
# .azure/producție/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validarea configurației

### Validare configurație
```bash
# Verifică sintaxa configurației
azd config validate

# Testează variabilele de mediu
azd env get-values

# Validează infrastructura
azd provision --dry-run
```

### Scripturi de configurare
Creați scripturi de validare în `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Verifică variabilele de mediu necesare
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validează sintaxa azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Cele mai bune practici

### 1. Folosiți variabile de mediu
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizați fișierele de configurare
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

### 3. Considerații privind controlul versiunilor
```bash
# .gitignore
.azure/*/config.json         # Configurări de mediu (conțin ID-uri de resurse)
.azure/*/.env               # Variabile de mediu (pot conține secrete)
.env                        # Fișier local de mediu
```

### 4. Documentația configurației
Documentați configurația în `CONFIG.md`:
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

## 🎯 Exerciții practice

### Exercițiul 1: Configurare multi-mediu (15 minute)

**Obiectiv**: Creează și configurează trei medii cu setări diferite

```bash
# Creați mediul de dezvoltare
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Creați mediul de testare
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Creați mediul de producție
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verificați fiecare mediu
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criterii de succes:**
- [ ] Trei medii create cu succes
- [ ] Fiecare mediu are configurație unică
- [ ] Se poate comuta între medii fără erori
- [ ] `azd env list` afișează toate cele trei medii

### Exercițiul 2: Gestionarea secretelor (10 minute)

**Obiectiv**: Exersează configurarea sigură cu date sensibile

```bash
# Setează secretele (nu sunt afișate în ieșire)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Setează configurația non-secretă
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Afișează mediul (secretele ar trebui să fie redactate)
azd env get-values

# Verifică dacă secretele sunt stocate
azd env get DB_PASSWORD  # Ar trebui să afișeze valoarea reală
```

**Criterii de succes:**
- [ ] Secrete stocate fără a fi afișate în terminal
- [ ] `azd env get-values` afișează secretele redactate
- [ ] `azd env get <SECRET_NAME>` recuperează valoarea reală

## Următorii pași

- [Primul tău proiect](first-project.md) - Aplicați configurația în practică
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md) - Folosiți configurația pentru implementare
- [Aprovizionarea resurselor](../chapter-04-infrastructure/provisioning.md) - Configurații pregătite pentru producție

## Referințe

- [Referință de configurare azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabile de mediu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 3 - Configurare & Autentificare
- **⬅️ Anterior**: [Primul tău proiect](first-project.md)
- **➡️ Următor**: [Capitolul 4: Infrastructură ca cod](../chapter-04-infrastructure/deployment-guide.md)
- **Următoarea lecție**: [Primul tău proiect](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->