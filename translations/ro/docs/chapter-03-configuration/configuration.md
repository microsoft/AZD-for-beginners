# Ghid de Configurare

**Navigare capitole:**
- **📚 Pagina principală curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 3 - Configurare și Autentificare
- **⬅️ Anterior**: [Primul tău Proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următor**: [Ghid de Desfășurare](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Următorul capitol**: [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/deployment-guide.md)

## Introducere

> Revizuit conform `azd 1.37.2` (noiembrie 2026). Comenzile Bash presupun un proiect azd inițializat. Cu excepția cazului în care sunt descrise explicit ca fișier complet, fragmentele YAML/Bicep sunt părți ce se integrează în fișierele proiectului corespunzătoare, nu proiecte standalone ce pot fi rulate.

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de lucru optime de dezvoltare și desfășurare. Veți învăța despre ierarhia configurațiilor, managementul mediilor, metodele de autentificare și modele avansate de configurare care permit desfășurări Azure eficiente și sigure.

## Obiective de învățare

Până la finalul acestei lecții, veți:
- Stăpâni ierarhia de configurare azd și să înțelegeți modul în care setările sunt prioritizate
- Configura setările globale și specifice proiectului eficient
- Gestione mai multe medii cu configurații diferite
- Implementa modele sigure de autentificare și autorizare
- Înțelege modele avansate de configurare pentru scenarii complexe

## Rezultatele învățării

După finalizarea acestei lecții, veți putea:
- Configura azd pentru fluxuri de lucru optime de dezvoltare
- Configura și gestiona multiple medii de desfășurare
- Implementa practici sigure de gestionare a configurației
- Depana probleme legate de configurare
- Personaliza comportamentul azd pentru cerințe organizaționale specifice

Acest ghid cuprinzător acoperă toate aspectele configurării Azure Developer CLI pentru fluxuri de lucru optime de dezvoltare și desfășurare.

## Înțelegerea Agenților AI într-un proiect azd

Dacă sunteți nou în ceea ce privește agenții AI, iată o modalitate simplă de a-i înțelege în lumea azd.

### Ce Este un Agent?

Un agent este o bucată de software care poate primi o cerere, să raționeze asupra ei și să ia acțiuni – adesea apelând un model AI, căutând date sau invocând alte servicii. Într-un proiect azd, un agent este doar un alt **serviciu** alături de front-end-ul web sau backend-ul API.

### Cum Se Încadrează Agenții în Structura Proiectului azd

Un proiect azd este alcătuit din trei straturi: **infrastructură**, **cod**, și **configurare**. Agenții se integrează în aceste straturi la fel ca orice alt serviciu:

| Strat | Ce Face pentru o Aplicație Tradițională | Ce Face pentru un Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructură** (`infra/`) | Provoacă o aplicație web și o bază de date | Provoacă un endpoint model AI, indexare de căutare sau gazdă agent |
| **Cod** (`src/`) | Conține codul sursă frontend și API | Conține logica agentului și definițiile prompturilor |
| **Configurare** (`azure.yaml`) | Listează serviciile și țintele lor de hosting | Listează agentul ca serviciu, indicând codul și gazda acestuia |

### Rolul lui `azure.yaml`

Nu trebuie să memorați sintaxa acum. Conceptual, `azure.yaml` este fișierul în care îi spui azd: *"Iată serviciile care alcătuiesc aplicația mea și iată unde găsesc codul lor."*

Când proiectul dvs. include un agent AI, `azure.yaml` pur și simplu listează acel agent ca unul dintre servicii. azd știe astfel să provoace infrastructura corectă (cum ar fi un endpoint Microsoft Foundry Models sau o aplicație containerizată care să găzduiască agentul) și să desfășoare codul agentului – așa cum ar face pentru o aplicație web sau API.

Aceasta înseamnă că nu este nimic fundamental nou de învățat. Dacă înțelegeți cum gestionează azd un serviciu web, deja înțelegeți cum gestionează un agent.

## Ierarhia Configurării

azd are suprafețe distincte de configurare, nu un strat universal:
- **Preferințele globale ale utilizatorului**: `~/.azd/config.json`, gestionate de `azd config`.
- **Definiția proiectului**: `azure.yaml` specifică serviciile, infrastructura și hook-urile.
- **Selecția mediului local**: `.azure/config.json`.
- **Valori pe medii**: `.azure/<name>/.env`, gestionate de `azd env`; setări suplimentare există în `config.json` ale acelui mediu.
- **Flag-uri și variabile de proces**: suprascriu doar setările suportate de o anumită comandă/furnizor.

O valoare arbitrară `azd env set` nu devine automat un parametru de infrastructură sau o setare a aplicației desfășurate. Faceți referință explicită în fișierul de parametri, în configurarea serviciului suportat sau într-un hook.

## Configurare Globală

### Setarea Valorilor Globale Implicite
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Setări Globale Comune
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Configurarea Proiectului

### Structura azure.yaml
Fișierul `azure.yaml` este inima proiectului dvs. azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

Acesta este un **exemplu de definiție a proiectului**, nu un starter furnizat. Creați directoarele sursă referite, scripturile hook, scripturile de pachet și fișierele `infra/main.bicep`/`main.parameters.json` care se potrivesc înainte de rulare. Bazele de date aparțin infrastructurii; `postgres` nu este un host serviciu încorporat. Parametrii infrastructurii trebuie plasați în fișierul de parametri al furnizorului, nu în `infra.parameters`.

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

#### Hook-uri specifice limbajelor de programare

Fragmentele de servicii următoare ilustrează hook-uri; combinați-le cu fișierele `project` și `host` reale ale fiecărui serviciu. `buildCommand` și `startCommand` nu sunt proprietăți generice azd ale serviciilor. Configurați startup-ul în aplicație, Dockerfile sau infrastructura gazdei.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Managementul Mediilor

### Crearea mediilor
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurarea mediului
Valorile de bază ale mediului se află în `.azure/<env-name>/.env`, inclusiv `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` și `AZURE_LOCATION`. Folosiți `azd env config get/set` pentru setări JSON suplimentare ale mediului. JSON-ul următor este **starea conceptuală a aplicației**, nu un schema de configurare azd; nu îl copiați în fișierele azd:

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

**Doar demonstrație în text simplu.** Valorile `azd env set` obișnuite sunt scrise în `.azure/<name>/.env` și pot fi tipărite de comenzile de citire. Nu folosiți cheia API exemplificativă ca acreditare reală. Pentru secrete, folosiți `azd env set-secret` și configurare explicită la rulare.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Șabloane pentru mediu
Creați un fișier **non-secret, gestionat manual** `.env.example` în rădăcina proiectului pentru o configurare coerentă. azd nu încarcă automat un fișier numit `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Partajarea mediilor într-o echipă

Când mai multe persoane lucrează la un proiect, trebuie să cădeți de acord asupra **a ceea ce călătorește cu repo-ul și ceea ce rămâne local**. azd păstrează fiecare mediu într-un folder `.azure/`, iar nu toate ar trebui să fie comise.

**Ce conține `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Ce să ignori în git.** `.gitignore` implicit al azd exclude deja `.azure/`. Păstrează-l așa — fișierele `.env` pot conține secrete, iar ID-urile resurselor sunt specifice persoanei care le-a provisionat. Fiecare coleg creează **propriul** mediu local:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Comutarea între medii.** Un dezvoltator care gestionează mai multe medii selectează mediul activ înainte de a rula comenzile:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Furnizarea de valori implicite non-secrete către echipă.** Comitează `.env.example` în afara directorului ignorat `.azure/`. Membrii noi ai echipei îl copiază într-un fișier ignorat local, completează valorile și îl importă explicit cu `azd env set --file <local-file>`. Nu importați niciodată substituenți goi peste un mediu funcțional.

**Mediile în CI/CD.** Pipeline-urile nu citesc folderul tău local `.azure/`. În schimb, furnizează valorile mediului ca variabile/secrete de pipeline, iar azd le citește din mediul procesului:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Regulă generală:** codul infrastructurii (`infra/`, `azure.yaml`) este partajat în Git; *starea mediului și secretele* (`.azure/`) sunt per-dezvoltator și per-pipeline. `azd pipeline config` configurează automat variabilele pipeline pentru tine.

## 🔐 Configurarea autentificării

### Integrarea Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Autentificarea cu Service Principal
Pentru pipeline-urile CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Identitate gestionată
Pentru mediile găzduite în Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Configurarea infrastructurii

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

### Configurația Terraform
Pentru proiectele Terraform, azd înlocuiește marcajele de poziție din `infra/main.tfvars.json`. Aceste nume trebuie să corespundă variabilelor de intrare Terraform declarate:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Configurația implementării

### Configurația build-ului
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Configurația Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Căile sunt relative la proiectul serviciului. Dockerfile trebuie să declare orice valori `ARG` pe care le consumă. Pentru un build în mai multe etape, pune etapa implementabilă ultima sau folosește un flux de lucru personalizat pentru ambalare; `docker.target` nu este o proprietate suportată în schema revizuită.

## 🔧 Configurație avansată

### Denumirea personalizată a resurselor
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definește numele reale ale resurselor în Bicep/Terraform și păstrează crearea grupului de resurse constistentă cu această setare. Nu există chei generice de configurare `naming.storageAccount` sau `naming.keyVault`.

### Configurația rețelei
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Îmbină aceste **intrări ilustrative de parametri** în `infra/main.parameters.json` sub `parameters`, și declară și consumă parametrii corespunzători în Bicep. Aceștia nu fac nimic de unii singuri.

### Configurarea Monitorizării
Asigură Application Insights și Log Analytics în Bicep/Terraform și configurează telemetria aplicației în SDK-ul tău. Nu există un bloc generic de nivel superior `monitoring` în `azure.yaml` care să creeze aceste resurse. Vezi [infrastructura de monitorizare](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Configurări Specifice Mediului

### Mediu de Dezvoltare
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mediu de Staging
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
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Scripturi de Configurație
Creează scripturi de validare în `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

Evită codarea hard a valorilor sensibile (configurație ilustrativă separată, nu o a doua cheie `database` în același fișier):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizează Fișierele de Configurație
```
.azure/
├── config.json              # Global project config
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

### 3. Considerații privind Controlul Versiunilor
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Documentarea Configurației
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

## 🎯 Exerciții Practice

### Exercițiul 1: Configurare Multi-Mediu (15 minute)

**Obiectiv**: Creează și configurează trei medii locale cu valori diferite. Pornește dintr-un proiect inițializat; folosește nume neutilizate dacă acestea există deja. Aceste valori specifice aplicației nu modifică setările de telemetrie/rulare până când șablonul tău nu le consumă.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criterii de succes:**
- [ ] Trei medii create cu succes
- [ ] Fiecare mediu are o configurație unică
- [ ] Se poate schimba între medii fără erori
- [ ] `azd env list` afișează toate cele trei medii

### Exercițiul 2: Referințe la Secrete din Key Vault (10-20 minute)

**Obiectiv**: Stochează o referință Key Vault în loc de text simplu. **Punct de plecare:** un mediu inițializat, autentificare Azure și acces la un Key Vault cu permisiuni pentru a crea/citi un secret dummy. Operațiile pe vault pot genera costuri.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Criterii de succes:**
- [ ] Comanda interactivă raportează vault-ul și referința secretă selectată
- [ ] `.env` local conține o referință în loc de secretul dummy
- [ ] Poate explica că identitatea la rulare/RBAC și consumul trebuie configurate totuși

**Probleme comune:** un 403 necesită rolul corect pentru planul de date al vault-ului și timp de propagare; `azd env set ... --secret` nu este o comandă validă. Ieșirea obișnuită `get-values`/`get-value` nu trebuie presupusă că este mascată. Elimină referința de instruire cu `azd env unset TRAINING_API_KEY`; aceasta nu șterge secretul din vault, pe care trebuie să-l cureți separat dacă l-ai creat.

## Pașii Următori

- [Primul tău Proiect](../chapter-01-foundation/first-project.md) - Aplică configurația în practică
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Folosește configurația pentru implementare
- [Provisionarea Resurselor](../chapter-04-infrastructure/provisioning.md) - Configurații gata pentru producție

## Referințe

- [Referință de configurare azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Variabile de mediu](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 3 - Configurare și Autentificare
- **⬅️ Capitolul anterior**: [Primul tău Proiect](../chapter-01-foundation/first-project.md)
- **➡️ Capitolul următor**: [Capitolul 4: Infrastructura ca și Cod](../chapter-04-infrastructure/deployment-guide.md)
- **Lecția următoare**: [Autentificare & Securitate](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->