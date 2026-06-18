# Ghid de Configurare

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 3 - Configurare & Autentificare
- **⬅️ Anterior**: [Primul Tău Proiect](first-project.md)
- **➡️ Următor**: [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Capitol Următor**: [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/deployment-guide.md)

## Introducere

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri optime de dezvoltare și implementare. Veți învăța despre ierarhia configurației, gestionarea mediilor, metodele de autentificare și modelele avansate de configurare care permit implementări Azure eficiente și sigure.

## Obiective de Învățare

La finalul acestei lecții, veți:
- Stăpâni ierarhia configurației azd și veți înțelege cum sunt prioritizate setările
- Configura setările globale și cele specifice proiectului eficient
- Gestione multiple medii cu configurații diferite
- Implementa modele sigure de autentificare și autorizare
- Înțelege modelele avansate de configurare pentru scenarii complexe

## Rezultate de Învățare

După completarea acestei lecții, veți putea să:
- Configura azd pentru fluxuri optime de dezvoltare
- Configureți și gestionați mai multe medii de implementare
- Implementa practici sigure de gestionare a configurațiilor
- Depanați probleme legate de configurație
- Personalizați comportamentul azd pentru cerințe organizaționale specifice

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri optime de dezvoltare și implementare.

## Înțelegerea Agenților AI într-un Proiect azd

Dacă sunteți nou la agenții AI, iată o modalitate simplă de a-i înțelege în lumea azd.

### Ce Este un Agent?

Un agent este o bucată de software care poate primi o cerere, gândi asupra ei și lua acțiuni—adesea apelând un model AI, căutând date sau invocând alte servicii. Într-un proiect azd, un agent este pur și simplu un alt **serviciu** alături de frontend-ul web sau backend-ul API.

### Cum se Integrează Agenții în Structura Proiectului azd

Un proiect azd este format din trei straturi: **infrastructură**, **cod** și **configurație**. Agenții se conectează la aceste straturi la fel ca orice alt serviciu:

| Strat | Ce face pentru o aplicație tradițională | Ce face pentru un agent |
|-------|-----------------------------------------|------------------------|
| **Infrastructură** (`infra/`) | Provoacă o aplicație web și o bază de date | Provoacă un endpoint model AI, un index de căutare sau un host pentru agent |
| **Cod** (`src/`) | Conține codul sursă pentru frontend și API | Conține logica agentului și definițiile prompturilor |
| **Configurație** (`azure.yaml`) | Listează serviciile și țintele lor de găzduire | Listează agentul ca serviciu, indicând spre codul și host-ul său |

### Rolul Fișierului `azure.yaml`

Nu trebuie să memorați sintaxa acum. Conceptual, `azure.yaml` este fișierul în care îi spuneți azd: *„Iată serviciile care alcătuiesc aplicația mea și unde găsiți codul lor.”*

Când proiectul dvs. include un agent AI, `azure.yaml` pur și simplu listează acel agent ca unul dintre servicii. azd știe atunci să provoace infrastructura potrivită (ca un endpoint Microsoft Foundry Models sau o Container App pentru a găzdui agentul) și să implementeze codul agentului—la fel cum ar face pentru o aplicație web sau API.

Aceasta înseamnă că nu există nimic fundamental nou de învățat. Dacă înțelegeți cum azd gestionează un serviciu web, deja înțelegeți cum gestionează un agent.

## Ierarhia Configurației

azd folosește un sistem ierarhic de configurare:
1. **Flag-uri din linia de comandă** (cea mai înaltă prioritate)
2. **Variabile de mediu**
3. **Configurația locală a proiectului** (`.azd/config.json`)
4. **Configurația globală a utilizatorului** (`~/.azd/config.json`)
5. **Valori implicite** (cea mai joasă prioritate)

## Configurația Globală

### Setarea Valorilor Implicite Globale
```bash
# Setează abonamentul implicit
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Setează locația implicită
azd config set defaults.location "eastus2"

# Setează convenția implicită pentru denumirea grupului de resurse
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vizualizează întreaga configurație globală
azd config show

# Elimină o configurație
azd config unset defaults.location
```

### Setări Globale Comune
```bash
# Preferințe de dezvoltare
azd config set alpha.enable true                    # Activează funcții alfa
azd config set telemetry.enabled false             # Dezactivează telemetria
azd config set output.format json                  # Setează formatul de ieșire

# Setări de securitate
azd config set auth.useAzureCliCredential true     # Folosește Azure CLI pentru autentificare
azd config set tls.insecure false                  # Aplică verificarea TLS

# Ajustare performanță
azd config set provision.parallelism 5             # Creare resurse în paralel
azd config set deploy.timeout 30m                  # Timp limită pentru implementare
```

## 🏗️ Configurarea Proiectului

### Structura azure.yaml
Fișierul `azure.yaml` este inima proiectului dvs. azd:

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

### Opțiuni de Configurare a Serviciului

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

## 🌟 Gestionarea Mediilor

### Crearea Mediilor
```bash
# Creează un mediu nou
azd env new development

# Creează cu locație specifică
azd env new staging --location "westus2"

# Creează din șablon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurația Mediului
Fiecare mediu are propria sa configurație în `.azure/<env-name>/config.json`:

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
# (nu ar trebui să returneze nimic)
```

### Șabloane pentru Medii
Creați `.azure/env.template` pentru o configurare consistentă a mediului:
```bash
# Variabile necesare
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Setări ale aplicației
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Setări opționale pentru dezvoltare
DEBUG=false
LOG_LEVEL=info
```

### Partajarea Mediilor Între Membrii Echipei

Când mai multe persoane lucrează la un proiect, trebuie să vă puneți de acord **ce călătorește împreună cu repo-ul și ce rămâne local**. azd păstrează fiecare mediu într-un folder `.azure/`, iar nu tot trebuie comis.

**Ce este în `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Ce să ignorați în git.** `.gitignore` implicit al azd exclude deja `.azure/`. Păstrați așa—fișierele `.env` pot conține secrete, iar ID-urile resurselor sunt specifice celui care le-a creat. Fiecare membru al echipei își creează **propriul** mediu local:

```bash
# Fiecare dezvoltator rulează acest lucru o dată pentru a obține propriul mediu izolat
azd env new dev-alice
azd up
```

**Comutarea între medii.** Un dezvoltator care gestionează mai multe medii selectează mediul activ înainte de a rula comenzi:

```bash
azd env list                 # vezi toate mediile locale și care este implicit
azd env select staging       # setează 'staging' ca mediu activ
azd env get-values           # confirmă că ești conectat la cel corect
```

**Furnizarea valorilor implicite ne-secrete echipei.** Comiteți un șablon (cum este `.azure/env.template` de mai sus) astfel încât toată lumea să știe ce variabile să seteze—însă niciodată să nu comiteți valorile completate. Colegii noi copiază șablonul și își completează propriile valori.

**Mediile în CI/CD.** Pipelines nu citesc folderul local `.azure/`. În schimb, furnizați valorile mediului ca variabile/secrete pentru pipeline, iar azd le va citi din mediul procesului:

```bash
# În CI, azd le citește din mediul de execuție, nu din .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Regulă practică:** codul de infrastructură (`infra/`, `azure.yaml`) se partajează în Git; *starea și secretele mediului* (`.azure/`) sunt pe utilizator și pe pipeline. `azd pipeline config` configurează automat variabilele pipeline-ului pentru dvs.

## 🔐 Configurarea Autentificării

### Integrare Azure CLI
```bash
# Folosește acreditările Azure CLI (implicit)
azd config set auth.useAzureCliCredential true

# Autentifică-te cu un tenant specific
az login --tenant <tenant-id>

# Setează abonamentul implicit
az account set --subscription <subscription-id>
```

### Autentificare prin Principal de Serviciu
Pentru pipeline-uri CI/CD:
```bash
# Setează variabilele de mediu
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Sau configurează direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identitate Gestionată
Pentru medii găzduite în Azure:
```bash
# Activează autentificarea identității gestionate
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configurarea Infrastructurii

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

### Configurarea Terraform
Pentru proiecte Terraform, configurați în `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configurarea Implementării

### Configurarea Build-ului
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

## 🔧 Configurare Avansată

### Denumire Personalizată a Resurselor
```bash
# Setează convențiile de denumire
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configurarea Rețelei
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configurarea Monitorizării
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

## 🎯 Configurări Specifice Mediului

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

### Validarea Configurației
```bash
# Verifică sintaxa configurației
azd config validate

# Testează variabilele de mediu
azd env get-values

# Validează infrastructura
azd provision --dry-run
```

### Scripturi de Configurație
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

## 🎓 Practici Recomandate

### 1. Folosiți Variabile de Mediu
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizați Fișierele de Configurație
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

### 3. Considerații pentru Controlul Versiunilor
```bash
# .gitignore
.azure/*/config.json         # Configurări de mediu (conțin ID-uri de resurse)
.azure/*/.env               # Variabile de mediu (pot conține secrete)
.env                        # Fișier local de mediu
```

### 4. Documentația Configurației
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

## 🎯 Exerciții Practice

### Exercițiul 1: Configurare Multi-Mediu (15 minute)

**Scop**: Creați și configurați trei medii cu setări diferite

```bash
# Creează mediul de dezvoltare
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Creează mediul de testare
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

**Criterii de Succes:**
- [ ] Trei medii create cu succes
- [ ] Fiecare mediu are configurație unică
- [ ] Se poate comuta între medii fără erori
- [ ] `azd env list` afișează toate cele trei medii

### Exercițiul 2: Gestionarea Secretelor (10 minute)

**Scop**: Exersați configurarea sigură cu date sensibile

```bash
# Setează secrete (nu sunt afișate în ieșire)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Setează configurație non-secretă
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
- [ ] `azd env get <SECRET_NAME>` individual afișează valoarea reală

## Pași Următori

- [Primul Tău Proiect](first-project.md) - Aplicați configurarea în practică
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Folosiți configurația pentru implementare
- [Provisionare Resurse](../chapter-04-infrastructure/provisioning.md) - Configurări gata pentru producție

## Referințe

- [Referință azd Configurație](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabile de Mediu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 3 - Configurare & Autentificare
- **⬅️ Anterior**: [Primul Tău Proiect](first-project.md)
- **➡️ Capitol Următor**: [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/deployment-guide.md)
- **Lecția Următoare**: [Primul Tău Proiect](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->