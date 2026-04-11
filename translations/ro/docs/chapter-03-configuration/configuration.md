# Ghid de configurare

**Navigare în capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 3 - Configurare și autentificare
- **⬅️ Anterior**: [Primul tău proiect](first-project.md)
- **➡️ Următor**: [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Următorul capitol**: [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/deployment-guide.md)

## Introducere

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de dezvoltare și implementare optime. Vei învăța despre ierarhia de configurare, gestionarea mediilor, metodele de autentificare și modele avansate de configurare care permit implementări Azure eficiente și sigure.

## Obiective de învățare

Până la sfârșitul acestei lecții, vei:
- Stăpâni ierarhia de configurare azd și înțelege cum sunt prioritizate setările
- Configura eficient setări globale și specifice proiectului
- Gestiona mai multe medii cu configurații diferite
- Implementa modele securizate de autentificare și autorizare
- Înțelege modele avansate de configurare pentru scenarii complexe

## Rezultatele învățării

După finalizarea acestei lecții, vei putea:
- Configura azd pentru fluxuri de lucru de dezvoltare optime
- Configura și gestiona multiple medii de implementare
- Implementa practici sigure de gestionare a configurațiilor
- Depana probleme legate de configurare
- Personaliza comportamentul azd pentru cerințe specifice organizației

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de dezvoltare și implementare optime.

## Înțelegerea agenților AI într-un proiect azd

Dacă ești nou în privința agenților AI, iată o modalitate simplă de a-i înțelege în lumea azd.

### Ce este un agent?

Un agent este o bucată de software care poate primi o cerere, raționa asupra ei și întreprinde acțiuni — adesea apelând un model AI, căutând date sau invocând alte servicii. Într-un proiect azd, un agent este pur și simplu un alt serviciu alături de front-end-ul web sau backend-ul API.

### Cum se integrează agenții în structura unui proiect azd

Un proiect azd este compus din trei straturi: **infrastructură**, **cod** și **configurare**. Agenții se conectează la aceste straturi în același mod în care o face orice alt serviciu:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisionează o aplicație web și o bază de date | Provisionează un endpoint pentru modelul AI, un index de căutare sau un host pentru agent |
| **Code** (`src/`) | Conține codul sursă pentru frontend și API | Conține logica agentului și definițiile prompt-urilor |
| **Configuration** (`azure.yaml`) | Listează serviciile tale și țintele lor de hosting | Listează agentul tău ca serviciu, indicând spre codul și host-ul său |

### Rolul fișierului `azure.yaml`

Nu trebuie să memorezi sintaxa chiar acum. Conceptual, `azure.yaml` este fișierul în care îi spui azd: "Iată serviciile care alcătuiesc aplicația mea și iată unde să găsească codul lor."

Când proiectul tău include un agent AI, `azure.yaml` pur și simplu îl listează pe acel agent ca unul dintre servicii. azd va ști astfel să provisioneze infrastructura potrivită (cum ar fi un endpoint Microsoft Foundry Models sau o Container App pentru a găzdui agentul) și să-ți implementeze codul agentului — la fel cum ar face pentru o aplicație web sau un API.

Acest lucru înseamnă că nu există nimic fundamental nou de învățat. Dacă înțelegi cum gestionează azd un serviciu web, înțelegi deja cum gestionează un agent.

## Ierarhia de configurare

azd folosește un sistem ierarhic de configurare:
1. **Flag-uri din linia de comandă** (cea mai înaltă prioritate)
2. **Variabile de mediu**
3. **Configurația locală a proiectului** (`.azd/config.json`)
4. **Configurația globală a utilizatorului** (`~/.azd/config.json`)
5. **Valori implicite** (cea mai mică prioritate)

## Configurare globală

### Setarea valorilor implicite globale
```bash
# Setează abonamentul implicit
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Setează locația implicită
azd config set defaults.location "eastus2"

# Setează convenția implicită de denumire pentru grupurile de resurse
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Afișează întreaga configurație globală
azd config show

# Elimină o configurație
azd config unset defaults.location
```

### Setări globale comune
```bash
# Preferințe de dezvoltare
azd config set alpha.enable true                    # Activează funcționalitățile alfa
azd config set telemetry.enabled false             # Dezactivează telemetria
azd config set output.format json                  # Setează formatul de ieșire

# Setări de securitate
azd config set auth.useAzureCliCredential true     # Folosește Azure CLI pentru autentificare
azd config set tls.insecure false                  # Forțează verificarea TLS

# Ajustări de performanță
azd config set provision.parallelism 5             # Creare paralelă a resurselor
azd config set deploy.timeout 30m                  # Timeout pentru implementare
```

## 🏗️ Configurarea proiectului

### Structura azure.yaml
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

# Creează la o locație specifică
azd env new staging --location "westus2"

# Creează din șablon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurația mediului
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

# Afișează variabilele de mediu
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
Creează `.azure/env.template` pentru o configurare consistentă a mediului:
```bash
# Variabile obligatorii
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

## 🔐 Configurarea autentificării

### Integrarea cu Azure CLI
```bash
# Folosește acreditările Azure CLI (implicit)
azd config set auth.useAzureCliCredential true

# Autentificare cu un tenant specific
az login --tenant <tenant-id>

# Setează abonamentul implicit
az account set --subscription <subscription-id>
```

### Autentificare prin Service Principal
Pentru pipeline-urile CI/CD:
```bash
# Setați variabilele de mediu
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Sau configurați direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identitate administrată
Pentru mediile găzduite în Azure:
```bash
# Activează autentificarea prin identitate gestionată
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configurarea infrastructurii

### Parametri Bicep
Configurează parametrii de infrastructură în `infra/main.parameters.json`:
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
Pentru proiectele Terraform, configurează în `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configurarea implementării

### Configurația build-ului
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

### Configurarea Docker
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
Exemplu `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configurare avansată

### Denumirea personalizată a resurselor
```bash
# Stabilește convențiile de denumire
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configurarea rețelei
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configurarea monitorizării
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

## 🎯 Configurații specifice mediilor

### Mediu de dezvoltare
```bash
# .azure/dezvoltare/.env
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

### Validarea configurației
```bash
# Verifică sintaxa configurației
azd config validate

# Testează variabilele de mediu
azd env get-values

# Validează infrastructura
azd provision --dry-run
```

### Scripturi de configurare
Creează scripturi de validare în `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Verifică variabilele de mediu necesare
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validează sintaxa fișierului azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Practici recomandate

### 1. Folosește variabile de mediu
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizează fișierele de configurare
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

### 3. Considerații legate de versionare
```bash
# .gitignore
.azure/*/config.json         # Configurații de mediu (conțin ID-uri de resurse)
.azure/*/.env               # Variabile de mediu (pot conține secrete)
.env                        # Fișier de mediu local
```

### 4. Documentația configurației
Documentează-ți configurația în `CONFIG.md`:
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

**Scop**: Creează și configurează trei medii cu setări diferite

```bash
# Creează mediul de dezvoltare
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Creează mediul de preproducție
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Creează mediul de producție
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifică fiecare mediu
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criterii de succes:**
- [ ] Trei medii create cu succes
- [ ] Fiecare mediu are o configurație unică
- [ ] Poți comuta între medii fără erori
- [ ] `azd env list` afișează toate cele trei medii

### Exercițiul 2: Gestionarea secretelor (10 minute)

**Scop**: Exersează configurarea sigură cu date sensibile

```bash
# Setați secretele (nu sunt afișate în ieșire)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Setați configurația non-secretă
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vizualizați mediul (secretele ar trebui redactate)
azd env get-values

# Verificați că secretele sunt stocate
azd env get DB_PASSWORD  # Ar trebui să afișeze valoarea reală
```

**Criterii de succes:**
- [ ] Secrete stocate fără a fi afișate în terminal
- [ ] `azd env get-values` afișează secretele redactate
- [ ] `azd env get <SECRET_NAME>` individual recuperează valoarea reală

## Pașii următori

- [Primul tău proiect](first-project.md) - Aplică configurația în practică
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md) - Folosește configurația pentru implementare
- [Provisionarea resurselor](../chapter-04-infrastructure/provisioning.md) - Configurații pregătite pentru producție

## Referințe

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigare în capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 3 - Configurare și autentificare
- **⬅️ Anterior**: [Primul tău proiect](first-project.md)
- **➡️ Următorul capitol**: [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/deployment-guide.md)
- **Următoarea lecție**: [Primul tău proiect](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu răspundem pentru eventualele neînțelegeri sau interpretări greșite care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->