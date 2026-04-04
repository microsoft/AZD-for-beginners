# Guida alla Configurazione

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 3 - Configurazione e Autenticazione
- **⬅️ Precedente**: [Il tuo primo progetto](first-project.md)
- **➡️ Successivo**: [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Capitolo Successivo**: [Capitolo 4: Infrastruttura come codice](../chapter-04-infrastructure/deployment-guide.md)

## Introduzione

Questa guida completa copre tutti gli aspetti della configurazione di Azure Developer CLI per flussi di lavoro di sviluppo e deployment ottimali. Imparerai la gerarchia di configurazione, la gestione degli ambienti, i metodi di autenticazione e i pattern di configurazione avanzati che consentono deployment Azure efficienti e sicuri.

## Obiettivi di apprendimento

Al termine di questa lezione, sarai in grado di:
- Padroneggiare la gerarchia di configurazione di azd e capire come vengono prioritizzate le impostazioni
- Configurare in modo efficace le impostazioni globali e specifiche del progetto
- Gestire più ambienti con configurazioni diverse
- Implementare pattern sicuri di autenticazione e autorizzazione
- Comprendere pattern avanzati di configurazione per scenari complessi

## Risultati di apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Configurare azd per flussi di lavoro di sviluppo ottimali
- Impostare e gestire più ambienti di deployment
- Implementare pratiche sicure di gestione della configurazione
- Diagnosticare e risolvere problemi relativi alla configurazione
- Personalizzare il comportamento di azd per requisiti organizzativi specifici

Questa guida completa copre tutti gli aspetti della configurazione di Azure Developer CLI per flussi di lavoro di sviluppo e deployment ottimali.

## Comprendere gli agenti AI in un progetto azd

Se sei nuovo agli agenti AI, ecco un modo semplice per considerarli nel mondo azd.

### Cos'è un agente?

Un agente è un pezzo di software che può ricevere una richiesta, ragionarci sopra e intraprendere azioni—spesso chiamando un modello AI, cercando dati o invocando altri servizi. In un progetto azd, un agente è semplicemente un altro **servizio** accanto al tuo frontend web o backend API.

### Come gli agenti si inseriscono nella struttura di un progetto azd

Un progetto azd è composto da tre livelli: **infrastruttura**, **codice** e **configurazione**. Gli agenti si integrano in questi livelli allo stesso modo di qualunque altro servizio:

| Livello | Cosa fa per un'app tradizionale | Cosa fa per un agente |
|-------|-------------------------------------|---------------------------|
| **Infrastruttura** (`infra/`) | Esegue il provisioning di un'applicazione web e di un database | Esegue il provisioning di un endpoint per modelli AI, di un indice di ricerca o di un host per l'agente |
| **Codice** (`src/`) | Contiene il codice sorgente del frontend e dell'API | Contiene la logica dell'agente e le definizioni dei prompt |
| **Configurazione** (`azure.yaml`) | Elenca i tuoi servizi e le loro destinazioni di hosting | Elenca il tuo agente come servizio, indicando il suo codice e l'host |

### Il ruolo di `azure.yaml`

Non è necessario memorizzare la sintassi adesso. Concettualmente, `azure.yaml` è il file dove dici ad azd: *"Ecco i servizi che compongono la mia applicazione e dove trovare il loro codice."*

Quando il tuo progetto include un agente AI, `azure.yaml` semplicemente elenca quell'agente come uno dei servizi. azd saprà quindi come eseguire il provisioning dell'infrastruttura corretta (come un Microsoft Foundry Models endpoint o un Container App per ospitare l'agente) e distribuire il codice dell'agente—proprio come farebbe per un'app web o un'API.

Questo significa che non c'è nulla di fondamentalmente nuovo da imparare. Se capisci come azd gestisce un servizio web, capisci già come gestisce un agente.

## Gerarchia di Configurazione

azd utilizza un sistema di configurazione gerarchico:
1. **Flag della riga di comando** (massima priorità)
2. **Variabili d'ambiente**
3. **Configurazione locale del progetto** (`.azd/config.json`)
4. **Configurazione utente globale** (`~/.azd/config.json`)
5. **Valori predefiniti** (priorità più bassa)

## Configurazione Globale

### Impostare i valori predefiniti globali
```bash
# Imposta la sottoscrizione predefinita
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Imposta la posizione predefinita
azd config set defaults.location "eastus2"

# Imposta la convenzione di denominazione predefinita per i gruppi di risorse
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Visualizza tutta la configurazione globale
azd config show

# Rimuovi una configurazione
azd config unset defaults.location
```

### Impostazioni globali comuni
```bash
# Preferenze di sviluppo
azd config set alpha.enable true                    # Abilita funzionalità alpha
azd config set telemetry.enabled false             # Disabilita la telemetria
azd config set output.format json                  # Imposta il formato di output

# Impostazioni di sicurezza
azd config set auth.useAzureCliCredential true     # Usa Azure CLI per l'autenticazione
azd config set tls.insecure false                  # Forza la verifica TLS

# Ottimizzazione delle prestazioni
azd config set provision.parallelism 5             # Creazione parallela delle risorse
azd config set deploy.timeout 30m                  # Timeout di distribuzione
```

## 🏗️ Configurazione del Progetto

### Struttura di `azure.yaml`
Il file `azure.yaml` è il cuore del tuo progetto azd:

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

### Opzioni di configurazione del servizio

#### Tipi di host
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

#### Impostazioni specifiche per linguaggio
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

## 🌟 Gestione degli ambienti

### Creazione degli ambienti
```bash
# Crea un nuovo ambiente
azd env new development

# Crea con una posizione specifica
azd env new staging --location "westus2"

# Crea da un modello
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurazione dell'ambiente
Ogni ambiente ha la propria configurazione in `.azure/<env-name>/config.json`:

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

### Variabili d'ambiente
```bash
# Imposta variabili specifiche per l'ambiente
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Visualizza variabili d'ambiente
azd env get-values

# Output previsto:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Rimuovi variabile d'ambiente
azd env unset DEBUG

# Verifica la rimozione
azd env get-values | grep DEBUG
# (non dovrebbe restituire nulla)
```

### Template degli ambienti
Crea `.azure/env.template` per una configurazione coerente degli ambienti:
```bash
# Variabili richieste
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Impostazioni dell'applicazione
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Impostazioni di sviluppo opzionali
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Configurazione dell'Autenticazione

### Integrazione con Azure CLI
```bash
# Usa le credenziali della CLI di Azure (predefinito)
azd config set auth.useAzureCliCredential true

# Accedi con un tenant specifico
az login --tenant <tenant-id>

# Imposta la sottoscrizione predefinita
az account set --subscription <subscription-id>
```

### Autenticazione con Service Principal
Per pipeline CI/CD:
```bash
# Imposta le variabili d'ambiente
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Oppure configura direttamente
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identità gestita
Per ambienti ospitati su Azure:
```bash
# Abilita l'autenticazione con identità gestita
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configurazione dell'Infrastruttura

### Parametri Bicep
Configura i parametri dell'infrastruttura in `infra/main.parameters.json`:
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

### Configurazione Terraform
Per progetti Terraform, configura in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configurazione del Deployment

### Configurazione di build
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

### Configurazione Docker
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
Esempio `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configurazione Avanzata

### Nomenclatura personalizzata delle risorse
```bash
# Imposta convenzioni di denominazione
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configurazione di rete
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configurazione di monitoraggio
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

## 🎯 Configurazioni specifiche per ambiente

### Ambiente di sviluppo
```bash
# .azure/sviluppo/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Ambiente di staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Ambiente di produzione
```bash
# .azure/produzione/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validazione della Configurazione

### Validare la configurazione
```bash
# Verifica la sintassi della configurazione
azd config validate

# Verifica le variabili d'ambiente
azd env get-values

# Verifica l'infrastruttura
azd provision --dry-run
```

### Script di configurazione
Crea script di validazione in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Verifica le variabili d'ambiente richieste
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Verifica la sintassi di azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Buone pratiche

### 1. Usa variabili d'ambiente
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizza i file di configurazione
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

### 3. Considerazioni sul controllo di versione
```bash
# .gitignore
.azure/*/config.json         # Configurazioni dell'ambiente (contengono ID delle risorse)
.azure/*/.env               # Variabili d'ambiente (possono contenere segreti)
.env                        # File di ambiente locale
```

### 4. Documentazione della configurazione
Documenta la tua configurazione in `CONFIG.md`:
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

## 🎯 Esercizi pratici

### Esercizio 1: Configurazione multi-ambiente (15 minuti)

**Obiettivo**: Creare e configurare tre ambienti con impostazioni diverse

```bash
# Crea l'ambiente di sviluppo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Crea l'ambiente di staging
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Crea l'ambiente di produzione
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifica ogni ambiente
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criteri di successo:**
- [ ] Tre ambienti creati con successo
- [ ] Ogni ambiente ha una configurazione unica
- [ ] È possibile passare tra gli ambienti senza errori
- [ ] `azd env list` mostra tutti e tre gli ambienti

### Esercizio 2: Gestione dei segreti (10 minuti)

**Obiettivo**: Esercitarsi nella configurazione sicura con dati sensibili

```bash
# Imposta i segreti (non visualizzati nell'output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Imposta la configurazione non segreta
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Visualizza l'ambiente (i segreti dovrebbero essere censurati)
azd env get-values

# Verifica che i segreti siano memorizzati
azd env get DB_PASSWORD  # Dovrebbe mostrare il valore effettivo
```

**Criteri di successo:**
- [ ] I segreti memorizzati senza essere visualizzati nel terminale
- [ ] `azd env get-values` mostra i segreti oscurati
- [ ] Il singolo comando `azd env get <SECRET_NAME>` recupera il valore reale

## Prossimi passi

- [Il tuo primo progetto](first-project.md) - Applica la configurazione nella pratica
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) - Usa la configurazione per il deployment
- [Provisioning delle risorse](../chapter-04-infrastructure/provisioning.md) - Configurazioni pronte per la produzione

## Riferimenti

- [Riferimento alla configurazione di azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema di azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabili d'ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 3 - Configurazione e Autenticazione
- **⬅️ Precedente**: [Il tuo primo progetto](first-project.md)
- **➡️ Capitolo Successivo**: [Capitolo 4: Infrastruttura come codice](../chapter-04-infrastructure/deployment-guide.md)
- **Lezione successiva**: [Il tuo primo progetto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si tenga presente che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->