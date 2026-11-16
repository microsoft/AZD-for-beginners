# Водич за конфигурацију

**Навигација по поглављима:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 3 - Конфигурација и аутентификација
- **⬅️ Претходно**: [Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће**: [Водич за деплојмент](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следеће поглавље**: [Поглавље 4: Инфраструктура као код](../chapter-04-infrastructure/deployment-guide.md)

## Увод

> Прегледано у складу са `azd 1.37.2` (новембар 2026). Баш команде претпостављају иницијализован azd пројекат. Ако није јасно описано као потпуна датотека, YAML/Bicep исечци су фрагменти за уметање у одговарајуће пројектне датотеке, не самостални пројекти спремни за покретање.

Овај обухватни водич покрива све аспекте конфигурисања Azure Developer CLI за оптималне токове рада у развоју и деплојменту. Научићете о хијерархији конфигурације, управљању окружењем, методама аутентикације и напредним шаблонима конфигурације који омогућавају ефикасан и безбедан Azure деплојмент.

## Циљеви учења

До краја ове лекције, научићете:
- Савладати хијерархију конфигурације azd и разумети како се приоритетизују подешавања
- Ефикасно конфигурисати глобална и специјална подешавања за пројекте
- Управљати више окружења са различитим конфигурацијама
- Имплементирати безбедне шаблоне аутентификације и ауторизације
- Разумети напредне шаблоне конфигурације за сложене сценарије

## Резултати учења

Након завршетка ове лекције, бићете у могућности да:
- Конфигуришете azd за оптималне токове рада у развоју
- Постављате и управљате више окружења за деплојмент
- Имплементирате безбедне праксе управљања конфигурацијама
- Решавате проблеме везане за конфигурацију
- Прилагодите понашање azd за специфичне организационе потребе

Овај обухватни водич покрива све аспекте конфигурисања Azure Developer CLI за оптималне токове рада у развоју и деплојменту.

## Разумевање AI агената у azd пројекту

Ако сте нови у AI агентима, ево једноставног начина да их разумете у азд свету.

### Шта је агент?

Агент је софтверски елемент који може примати захтев, размишљати о њему и предузимати акције — често позивајући AI модел, претражујући податке или позивајући друге сервисе. У azd пројекту, агент је само још један **сервис** поред вашег веб фронтенда или API бекенда.

### Како агенти уклапају у структуру azd пројекта

azd пројекат се састоји из три слоја: **инфраструктура**, **код** и **конфигурација**. Агенти се убацују у ове слојеве као и било који други сервис:

| Слој | Шта ради за традиционалну апликацију | Шта ради за агента |
|-------|-------------------------------------|---------------------------|
| **Инфраструктура** (`infra/`) | Пропразује веб апликацију и базу података | Пропразује AI модел крајњу тачку, индекс претраге или хост агента |
| **Код** (`src/`) | Садржи изворни код фронтенда и API-а | Садржи логику агента и дефиниције упита |
| **Конфигурација** (`azure.yaml`) | Наводи ваше сервисе и њихове хостинг циљеве | Наводи вашег агента као сервис, упућујући на његов код и домаћина |

### Улога `azure.yaml`

Не морате сада да памтите синтаксу. Концептуално, `azure.yaml` је датотека у којој кажете azd-у: *"Овде су сервиси који чине моју апликацију и овде се налази њихов код."*

Када ваш пројекат укључује AI агента, `azure.yaml` једноставно листа тог агента као једног од сервиса. azd онда зна да обезбеди одговарајућу инфраструктуру (као Microsoft Foundry Models крајњу тачку или Container App за хостовање агента) и деплојује ваш агентски код — као што то ради за веб апликацију или API.

Ово значи да нема ничег фундаментално новог за учење. Ако разумете како azd управља веб сервисом, већ разумете како управља агентом.

## Хијерархија конфигурације

azd има различите конфигурационе површине, а не један универзални преклоп:
- **Глобалне корисничке преференце**: `~/.azd/config.json`, управља `azd config`.
- **Дефиниција пројекта**: `azure.yaml` спецификује сервисе, инфраструктуру и хукове.
- **Избор локалног окружења**: `.azure/config.json`.
- **Вредности по окружењу**: `.azure/<name>/.env`, управља `azd env`; додатна подешавања се налазе у `config.json` тог окружења.
- **Флагови и променљиве процеса**: преовлађују само подешавања које одређена команда/провајдер подржава.

Која било вредност `azd env set` не постаје аутоматски параметар инфраструктуре или подешавање распоређене апликације. Јасно је наведите у параметар датотеци, подржаној конфигурацији сервиса или хуку.

## Глобална конфигурација

### Постављање глобалних подразумеваних вредности
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

### Уобичајена глобална подешавања
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

## 🏗️ Конфигурација пројекта

### Структура azure.yaml
Датотека `azure.yaml` је срце вашег azd пројекта:

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

Ово је пример **дефиниције пројекта**, а не испоручени стартер. Креирајте наведене изворне фасцикле, хук скрипте, пакетске скрипте и одговарајуће `infra/main.bicep`/`main.parameters.json` пре покретања. Базе података припадају инфраструктури; `postgres` није уграђени хост сервиса. Параметри инфраструктуре иду у датотеку параметара провајдера, не у `infra.parameters`.

### Опције конфигурације сервиса

#### Типови хоста
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

#### Језички специфични хукови за изградњу

Следећи исечци сервиса илуструју хукове; спојите их са стварним `project` и `host` сваког сервиса. `buildCommand` и `startCommand` нису општи азд својства сервиса. Конфигуришите покретање у апликацији, Dockerfile-у или инфраструктури хоста.

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

## 🌟 Управљање окружењима

### Креирање окружења
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурација окружења
Основне вредности окружења налазе се у `.azure/<env-name>/.env`, укључујући `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, и `AZURE_LOCATION`. Користите `azd env config get/set` за додатна подешавања окружења у JSON формату. Следећи JSON је **концептуално стање апликације**, а не azd конфигурациона шема; не копирајте га у azd датотеке:

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

### Променљиве окружења

**Само демонстрација у чистом тексту.** Обичне `azd env set` вредности се записују у `.azure/<name>/.env` и могу се исписати read командама. Немојте користити пример API кључа као прави креденцијал. За тајне користите `azd env set-secret` и експлицитно повезивање у време извршења.

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

### Шаблони окружења
Креирајте **не-тајни, ручно одржавани** `.env.example` у корену пројекта за конзистентна подешавања. azd не учитава аутоматски датотеку са именом `env.template`:
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

### Дељење окружења у тиму

Када више особа ради на пројекту, потребно је договорити се **шта путује са репозиторијумом, а шта остаје локално**. azd чува свако окружење у `.azure/` фасцикли, али не треба све уписивати у репозиторијум.

**Шта је у `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Шта треба додати у .gitignore.** Подразумевани `.gitignore` azd-а већ изузима `.azure/`. Оставите је тако — `.env` датотеке могу садржати тајне, а ID-ови ресурса су специфични за онога ко их је креирао. Свако из тима креира своје **локално** окружење:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Преваљивање између окружења.** Програмер који управља са неколико окружења бира активно пре покретања команди:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Обезбеђивање позадине која није тајна за тим.** Комуницирајте `.env.example` ван игнорисане `.azure/` фасцикле. Нови чланови тима је копирају у локалну игнорисану датотеку, попуњавају вредности и експлицитно је увозе помоћу `azd env set --file <local-file>`. Никада не уводите празне резервне места у радно окружење.

**Окружења у CI/CD.** Пипелина не чита вашу локалну `.azure/` фасциклу. Уместо тога, обезбедите вредности окружења као променљиве/тајне пипелина, а azd их чита из процесног окружења:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Пропоручено правило:** код инфраструктуре (`infra/`, `azure.yaml`) дели се у Гиту; *статус и тајне окружења* (`.azure/`) су поразличите за сваког програмера и за сваку линију интеграције. `azd pipeline config` аутоматски подешава променљиве линије за вас.

## 🔐 Конфигурација аутентификације

### Интеграција Azure CLI-ја
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Аутентификација помоћу Service Principal-а
За CI/CD линије:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Управљани идентитет
За окружења која су хостована у Azure-у:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Конфигурација инфраструктуре

### Параметри за Bicep
Подесите параметре инфраструктуре у `infra/main.parameters.json`:
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

### Конфигурација Terraform-а
За Terraform пројекте, azd замењује прописане ознаке у `infra/main.tfvars.json`. Ова имена морају одговарати декларисаним улазним променљивима Terraform-а:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Конфигурација распореда

### Конфигурација компилације
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

### Docker конфигурација
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
Путање су релативне на пројекат сервиса. Dockerfile мора декларисати сваки `ARG` параметар који користи. За вишефазну компилацију, поставите фазу распореда као последњу или користите прилагођени ток паковања; `docker.target` није подржани атрибут у прегледаној шеми.

## 🔧 Напредна конфигурација

### Прилагођено именовање ресурса
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Дефинишите стварна имена ресурса у Bicep-у/Terraform-у и одржавајте доследност приликом креирања ресурсних група према овом подешавању. Не постоје генерички `naming.storageAccount` или `naming.keyVault` кључеви конфигурације.

### Мрежна конфигурација
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Упишите ове **илустративне параметре** у `infra/main.parameters.json` у делу `parameters` и декларишите и користите одговарајуће параметре у Bicep-у. Они сами по себи не раде ништа.

### Мониторинг конфигурација
Обезбедите Application Insights и Log Analytics у Bicep-у/Terraform-у и конфигуришите телеметрију апликације у вашем SDK-у. Не постоји општа врхунска `monitoring` секција у `azure.yaml` која аутоматски прави ове ресурсе. Погледајте [инфраструктуру за мониторинг](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Конфигурације специфичне за окружење

### Девелоперско окружење
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Сценско окружење
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Продукцијско окружење
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Валидација конфигурације

### Провери конфигурацију
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Скрипте за конфигурацију
Направите скрипте за валидацију у `scripts/`:

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

## 🎓 Најбоље праксе

### 1. Користите променљиве окружења
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Избегавајте убацивање осетљивих вредности непосредно у код (одвојена илустративна конфигурација, не други `database` кључ у истом фајлу):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организујте конфигурационе фајлове
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

### 3. Разматрања о контроли верзија
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Документација конфигурације
Документујте вашу конфигурацију у `CONFIG.md`:
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

## 🎯 Вежбе за практичан рад

### Вежба 1: Конфигурација за више окружења (15 минута)

**Циљ**: Креирајте и конфигуришите три локална окружења са различитим вредностима. Почните у већ иницијализованом пројекту; користите непостојећа имена ако ови већ постоје. Ове вредности специфичне за апликацију не мењају подешавања телеметрије или извршавања док их ваша шаблона не употреби.

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

**Критеријуми успеха:**
- [ ] Три окружења су успешно креирана
- [ ] Свако окружење има јединствену конфигурацију
- [ ] Могу се пребацивати између окружења без грешака
- [ ] `azd env list` приказује све три окружења

### Вежба 2: Референце Кеy Vault тајни (10-20 минута)

**Циљ**: Смештати референцу на Key Vault уместо plain текст. **Почетна тачка:** иницијализовано окружење, Azure пријава, и приступ Key Vault-у са дозволама за креирање/читање тестне тајне. Операције над Vault-ом могу изазвати трошкове.

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

**Критеријуми успеха:**
- [ ] Интерактивна команда пријављује изабрани vault и референцу на тајну
- [ ] Локални `.env` садржи референцу уместо тестне тајне
- [ ] Може се објаснити да идентитет током извршавања/RBAC и потрошња и даље морају бити конфигурисани

**Уобичајени проблеми:** 403 захтева исправну улогу за vault data-plane и време да се промена прошири; `azd env set ... --secret` није валидна команда. Обични `get-values`/`get-value` излаз не мора бити аутоматски цензурисан. Уклоните референцу за обуку командом `azd env unset TRAINING_API_KEY`; ово не брише тајну у vault-у, коју морате посебно очистити ако сте је креирали.

## Следећи кораци

- [Ваш први пројекат](../chapter-01-foundation/first-project.md) - Примена конфигурације у пракси
- [Водич за распоређивање](../chapter-04-infrastructure/deployment-guide.md) - Користите конфигурацију за распоређивање
- [Обезбеђивање ресурса](../chapter-04-infrastructure/provisioning.md) - Конфигурације спремне за производњу

## Референце

- [azd Reference za konfiguraciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Шема](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Променљиве окружења](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 3 - Конфигурација и аутентификација
- **⬅️ Претходно**: [Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **➡️ Следеће поглавље**: [Поглавље 4: Инфраструктура као код](../chapter-04-infrastructure/deployment-guide.md)
- **Следећа лекција**: [Аутентификација и безбедност](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->