<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-20T22:24:57+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "it"
}
-->
# Guida alla Configurazione

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 3 - Configurazione e Autenticazione
- **⬅️ Precedente**: [Il Tuo Primo Progetto](first-project.md)
- **➡️ Successivo**: [Guida al Deployment](../deployment/deployment-guide.md)
- **🚀 Prossimo Capitolo**: [Capitolo 4: Infrastruttura come Codice](../deployment/deployment-guide.md)

## Introduzione

Questa guida completa copre tutti gli aspetti della configurazione di Azure Developer CLI per flussi di lavoro di sviluppo e deployment ottimali. Imparerai la gerarchia di configurazione, la gestione degli ambienti, i metodi di autenticazione e i modelli di configurazione avanzati che consentono deployment efficienti e sicuri su Azure.

## Obiettivi di Apprendimento

Alla fine di questa lezione, sarai in grado di:
- Padroneggiare la gerarchia di configurazione di azd e comprendere come vengono prioritizzate le impostazioni
- Configurare efficacemente impostazioni globali e specifiche del progetto
- Gestire più ambienti con configurazioni diverse
- Implementare modelli di autenticazione e autorizzazione sicuri
- Comprendere modelli di configurazione avanzati per scenari complessi

## Risultati di Apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Configurare azd per flussi di lavoro di sviluppo ottimali
- Configurare e gestire più ambienti di deployment
- Implementare pratiche di gestione della configurazione sicure
- Risolvere problemi legati alla configurazione
- Personalizzare il comportamento di azd per requisiti specifici dell'organizzazione

Questa guida completa copre tutti gli aspetti della configurazione di Azure Developer CLI per flussi di lavoro di sviluppo e deployment ottimali.

## Gerarchia di Configurazione

azd utilizza un sistema di configurazione gerarchico:
1. **Flag della riga di comando** (massima priorità)
2. **Variabili d'ambiente**
3. **Configurazione locale del progetto** (`.azd/config.json`)
4. **Configurazione globale dell'utente** (`~/.azd/config.json`)
5. **Valori predefiniti** (priorità più bassa)

## Configurazione Globale

### Impostazione dei Valori Predefiniti Globali
```bash
# Imposta l'abbonamento predefinito
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Imposta la posizione predefinita
azd config set defaults.location "eastus2"

# Imposta la convenzione di denominazione del gruppo di risorse predefinita
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Visualizza tutta la configurazione globale
azd config list

# Rimuovi una configurazione
azd config unset defaults.location
```

### Impostazioni Globali Comuni
```bash
# Preferenze di sviluppo
azd config set alpha.enable true                    # Abilita funzionalità alpha
azd config set telemetry.enabled false             # Disabilita telemetria
azd config set output.format json                  # Imposta formato di output

# Impostazioni di sicurezza
azd config set auth.useAzureCliCredential true     # Usa Azure CLI per l'autenticazione
azd config set tls.insecure false                  # Forza la verifica TLS

# Ottimizzazione delle prestazioni
azd config set provision.parallelism 5             # Creazione parallela delle risorse
azd config set deploy.timeout 30m                  # Timeout di distribuzione
```

## 🏗️ Configurazione del Progetto

### Struttura di azure.yaml
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

### Opzioni di Configurazione del Servizio

#### Tipi di Host
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

#### Impostazioni Specifiche per Linguaggio
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

## 🌟 Gestione degli Ambienti

### Creazione di Ambienti
```bash
# Creare un nuovo ambiente
azd env new development

# Creare con posizione specifica
azd env new staging --location "westus2"

# Creare da modello
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configurazione degli Ambienti
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

### Variabili d'Ambiente
```bash
# Imposta variabili specifiche dell'ambiente
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

# Verifica rimozione
azd env get-values | grep DEBUG
# (non dovrebbe restituire nulla)
```

### Template degli Ambienti
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
# Usa le credenziali di Azure CLI (predefinito)
azd config set auth.useAzureCliCredential true

# Accedi con tenant specifico
az login --tenant <tenant-id>

# Imposta la sottoscrizione predefinita
az account set --subscription <subscription-id>
```

### Autenticazione con Service Principal
Per pipeline CI/CD:
```bash
# Imposta le variabili di ambiente
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Oppure configura direttamente
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identità Gestita
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

### Configurazione della Build
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
Esempio di `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configurazione Avanzata

### Nomi Personalizzati delle Risorse
```bash
# Imposta le convenzioni di denominazione
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configurazione della Rete
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configurazione del Monitoraggio
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

## 🎯 Configurazioni Specifiche per Ambiente

### Ambiente di Sviluppo
```bash
# .azure/sviluppo/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Ambiente di Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Ambiente di Produzione
```bash
# .azure/produzione/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validazione della Configurazione

### Validare la Configurazione
```bash
# Controlla la sintassi della configurazione
azd config validate

# Testa le variabili d'ambiente
azd env get-values

# Convalida l'infrastruttura
azd provision --dry-run
```

### Script di Configurazione
Crea script di validazione in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Controlla le variabili d'ambiente richieste
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valida la sintassi di azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Utilizzare Variabili d'Ambiente
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizzare i File di Configurazione
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

### 3. Considerazioni sul Versionamento
```bash
# .gitignore
.azure/*/config.json         # Configurazioni dell'ambiente (contengono ID delle risorse)
.azure/*/.env               # Variabili d'ambiente (possono contenere segreti)
.env                        # File dell'ambiente locale
```

### 4. Documentazione della Configurazione
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

## 🎯 Esercizi Pratici

### Esercizio 1: Configurazione Multi-Ambiente (15 minuti)

**Obiettivo**: Creare e configurare tre ambienti con impostazioni diverse

```bash
# Creare ambiente di sviluppo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Creare ambiente di staging
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Creare ambiente di produzione
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verificare ogni ambiente
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criteri di Successo:**
- [ ] Tre ambienti creati con successo
- [ ] Ogni ambiente ha una configurazione unica
- [ ] È possibile passare tra gli ambienti senza errori
- [ ] `azd env list` mostra tutti e tre gli ambienti

### Esercizio 2: Gestione dei Segreti (10 minuti)

**Obiettivo**: Praticare una configurazione sicura con dati sensibili

```bash
# Imposta segreti (non visualizzati nell'output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Imposta configurazione non segreta
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Visualizza ambiente (i segreti dovrebbero essere oscurati)
azd env get-values

# Verifica che i segreti siano memorizzati
azd env get DB_PASSWORD  # Dovrebbe mostrare il valore effettivo
```

**Criteri di Successo:**
- [ ] Segreti memorizzati senza essere visualizzati nel terminale
- [ ] `azd env get-values` mostra segreti oscurati
- [ ] Il comando individuale `azd env get <SECRET_NAME>` recupera il valore effettivo

## Prossimi Passi

- [Il Tuo Primo Progetto](first-project.md) - Applicare la configurazione nella pratica
- [Guida al Deployment](../deployment/deployment-guide.md) - Utilizzare la configurazione per il deployment
- [Provisioning delle Risorse](../deployment/provisioning.md) - Configurazioni pronte per la produzione

## Riferimenti

- [Riferimento Configurazione azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabili d'Ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 3 - Configurazione e Autenticazione
- **⬅️ Precedente**: [Il Tuo Primo Progetto](first-project.md)
- **➡️ Prossimo Capitolo**: [Capitolo 4: Infrastruttura come Codice](../deployment/deployment-guide.md)
- **Prossima Lezione**: [Il Tuo Primo Progetto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->