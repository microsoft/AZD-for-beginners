# Ghid de Configurare

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 3 - Configurare & Autentificare
- **⬅️ Anterior**: [Primul Tău Proiect](first-project.md)
- **➡️ Următor**: [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Capitolul Următor**: [Capitolul 4: Infrastructură ca și Cod](../chapter-04-infrastructure/deployment-guide.md)

## Introducere

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de lucru optime de dezvoltare și implementare. Vei învăța despre ierarhia configurației, managementul mediilor, metodele de autentificare și tiparele avansate de configurare care permit implementări Azure eficiente și sigure.

## Obiective de Învățare

La finalul acestei lecții, vei:
- Stăpâni ierarhia configurației azd și vei înțelege cum sunt prioritizate setările
- Configura setările globale și cele specifice proiectului eficient
- Gestiona mai multe medii cu configurații diferite
- Implementa tipare sigure de autentificare și autorizare
- Înțelege tipare avansate de configurare pentru scenarii complexe

## Rezultate de Învățare

După parcurgerea acestei lecții, vei putea:
- Configura azd pentru fluxuri optime de dezvoltare
- Configura și gestiona mai multe medii de implementare
- Implementa practici sigure de management al configurației
- Depana probleme legate de configurare
- Personaliza comportamentul azd pentru cerințe organizaționale specifice

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de lucru optime de dezvoltare și implementare.

## Înțelegerea Agenților AI într-un Proiect azd

Dacă ești nou în ceea ce privește agenții AI, iată o modalitate simplă de a-i înțelege în lumea azd.

### Ce Este un Agent?

Un agent este un software care poate primi o solicitare, să o analizeze și să acționeze — de multe ori apelând un model AI, căutând date sau invocând alte servicii. Într-un proiect azd, un agent este doar un alt **serviciu** alături de frontend-ul web sau backend-ul API.

### Cum se Integrează Agenții în Structura Proiectului azd

Un proiect azd este alcătuit din trei straturi: **infrastructură**, **cod** și **configurație**. Agenții se conectează la aceste straturi în același mod ca orice alt serviciu:

| Strat | Ce Face pentru o Aplicație Tradițională | Ce Face pentru un Agent |
|-------|-----------------------------------------|------------------------|
| **Infrastructură** (`infra/`) | Provoacă o aplicație web și o bază de date | Provoacă un endpoint de model Microsoft Foundry, un index de căutare sau un host pentru agent |
| **Cod** (`src/`) | Conține codul sursă pentru frontend și API | Conține logica agentului și definițiile prompturilor |
| **Configurație** (`azure.yaml`) | Listează serviciile și gazdele lor | Listează agentul ca serviciu, arătând locația codului și a hostului |

### Rolul fișierului `azure.yaml`

Nu trebuie să memorezi sintaxa acum. Conceptual, `azure.yaml` este fișierul în care îi spui azd: *„Iată serviciile care compun aplicația mea și unde să găsești codul lor.”*

Când proiectul tău include un agent AI, `azure.yaml` listează pur și simplu agentul ca unul dintre servicii. Azd știe astfel să provoace infrastructura potrivită (cum ar fi un endpoint Microsoft Foundry Models sau o aplicație Container pentru găzduirea agentului) și să implementeze codul agentului — exact ca pentru o aplicație web sau API.

Asta înseamnă că nu este nimic fundamental nou de învățat. Dacă înțelegi cum azd gestionează un serviciu web, înțelegi deja cum gestionează un agent.

## Ierarhia Configurației

azd folosește un sistem ierarhic de configurare:
1. **Flaguri din linia de comandă** (prioritate maximă)
2. **Variabile de mediu**
3. **Configurație locală de proiect** (`.azd/config.json`)
4. **Configurație globală a utilizatorului** (`~/.azd/config.json`)
5. **Valori implicite** (prioritate minimă)

## Configurație Globală

### Setarea Valorilor Implicite Globale
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

### Setări Comune Globale
```bash
# Preferințe de dezvoltare
azd config set alpha.enable true                    # Activează funcțiile alfa
azd config set telemetry.enabled false             # Dezactivează telemetria
azd config set output.format json                  # Setează formatul de ieșire

# Setări de securitate
azd config set auth.useAzureCliCredential true     # Folosește Azure CLI pentru autentificare
azd config set tls.insecure false                  # Impune verificarea TLS

# Optimizare performanță
azd config set provision.parallelism 5             # Crearea paralelă a resurselor
azd config set deploy.timeout 30m                  # Timeout pentru implementare
```

## 🏗️ Configurație Proiect

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

### Opțiuni de Configurare pentru Servicii

#### Tipuri de Host
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

#### Setări Specifice Limbajului
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

## 🌟 Managementul Mediilor

### Crearea Mediilor
```bash
# Creează un mediu nou
azd env new development

# Creează cu o locație specifică
azd env new staging --location "westus2"

# Creează din șablon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurația Mediului
Fiecare mediu are propria configurație în `.azure/<nume-mediu>/config.json`:

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

### Variabile de Mediu
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
# (ar trebui să nu returneze nimic)
```

### Șabloane pentru Medii
Creează `.azure/env.template` pentru configurare consistentă a mediului:
```bash
# Variabile necesare
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Setările aplicației
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Setări opționale de dezvoltare
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Configurare Autentificare

### Integrare Azure CLI
```bash
# Folosește acreditările Azure CLI (implicit)
azd config set auth.useAzureCliCredential true

# Autentificare cu un tenant specific
az login --tenant <tenant-id>

# Setează abonamentul implicit
az account set --subscription <subscription-id>
```

### Autentificare prin Service Principal
Pentru pipeline-uri CI/CD:
```bash
# Setează variabile de mediu
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Sau configurează direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identitate Administrată
Pentru medii găzduite în Azure:
```bash
# Activarea autentificării prin identitate gestionată
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configurare Infrastructură

### Parametri Bicep
Configurează parametrii infrastructurii în `infra/main.parameters.json`:
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
Pentru proiecte Terraform, configurează în `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configurare Implementare

### Configurare Build
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
Exemplu `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configurare Avansată

### Nomenclatură Personalizată a Resurselor
```bash
# Setează convențiile de denumire
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configurare Rețea
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configurare Monitorizare
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

## 🎯 Configurații Specifice Mediului

### Mediu de Dezvoltare
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mediu de Testare
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Mediu de Producție
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validarea Configurației

### Validare Configurație
```bash
# Verifică sintaxa configurației
azd config validate

# Testează variabilele de mediu
azd env get-values

# Validează infrastructura
azd provision --dry-run
```

### Scripturi de Configurație
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

# Validează sintaxa azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Cele Mai Bune Practici

### 1. Folosește Variabile de Mediu
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizează Fișierele de Configurație
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

### 3. Considerații privind Controlul Versiunii
```bash
# .gitignore
.azure/*/config.json         # Configurări de mediu (conțin ID-uri de resurse)
.azure/*/.env               # Variabile de mediu (pot conține secrete)
.env                        # Fișier local de mediu
```

### 4. Documentația Configurației
Documentează configurația în `CONFIG.md`:
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

## 🎯 Exerciții Practice

### Exercițiul 1: Configurare Multi-Medii (15 minute)

**Scop**: Creează și configurează trei medii cu setări diferite

```bash
# Creează mediu de dezvoltare
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Creează mediu de testare
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Creează mediu de producție
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifică fiecare mediu
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criterii de Succes:**
- [ ] Trei medii create cu succes
- [ ] Fiecare mediu are o configurație unică
- [ ] Se poate comuta între medii fără erori
- [ ] `azd env list` afișează toate cele trei medii

### Exercițiul 2: Managementul Secretelor (10 minute)

**Scop**: Exersează configurarea sigură cu date sensibile

```bash
# Setează secrete (nu sunt afișate în output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Setează configurarea non-secretă
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vizualizează mediul (secretele ar trebui să fie redactate)
azd env get-values

# Verifică dacă secretele sunt stocate
azd env get DB_PASSWORD  # Ar trebui să arate valoarea reală
```

**Criterii de Succes:**
- [ ] Secrete stocate fără a fi afișate în terminal
- [ ] `azd env get-values` afișează secretele redactate
- [ ] Comanda individuală `azd env get <SECRET_NAME>` returnează valoarea reală

## Pașii Următori

- [Primul Tău Proiect](first-project.md) - Aplică configurația în practică
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Folosește configurația pentru implementare
- [Provisionarea Resurselor](../chapter-04-infrastructure/provisioning.md) - Configurații gata de producție

## Referințe

- [Referință Configurație azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabile de Mediu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 3 - Configurare & Autentificare
- **⬅️ Anterior**: [Primul Tău Proiect](first-project.md)
- **➡️ Capitolul Următor**: [Capitolul 4: Infrastructură ca și Cod](../chapter-04-infrastructure/deployment-guide.md)
- **Lecția Următoare**: [Primul Tău Proiect](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->