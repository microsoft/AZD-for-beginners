# Водич за конфигурацију

**Навигација по поглављима:**
- **📚 Почетна курсa**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 3 - Конфигурација и аутентификација
- **⬅️ Претходно**: [Ваш први пројекат](first-project.md)
- **➡️ Следеће**: [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следеће поглавље**: [Поглавље 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Увод

Овај свеобухватни водич обухвата све аспекте конфигурисања Azure Developer CLI за оптималне развојне и деплој радне токове. Учићете о хијерархији конфигурације, управљању окружењима, методама аутентификације и напредним обрасцима конфигурације који омогућавају ефикасне и сигурне Azure деплоје.

## Циљеви учења

До краја ове лекције, ви ћете:
- Овладати azd хијерархијом конфигурације и разумети како се подешавања приоритизују
- Ефикасно конфигурисати глобална и специфична подешавања пројекта
- Управљати више окружења са различитим конфигурацијама
- Имплементирати безбедне обрасце за аутентификацију и овлашћење
- Разумети напредне обрасце конфигурације за комплексне сценарије

## Исходи учења

Након завршетка ове лекције, бићете у стању да:
- Конфигуришете azd за оптималне развојне радне токове
- Поставите и управљате вишеструким окружењима за деплој
- Имплементирате безбедне праксе управљања конфигурацијом
- Решавате проблеме везане за конфигурацију
- Прилагодите понашање azd за специфичне организационе захтеве

Овај свеобухватни водич обухвата све аспекте конфигурисања Azure Developer CLI за оптималне развојне и деплој радне токове.

## Разумевање AI агената у azd пројекту

Ако сте нови у раду са AI агентима, ево једноставног начина да их замислите у azd свету.

### Шта је агент?

Агент је део софтвера који може да прими захтев, размисли о њему и предузме акције — често позивајући AI модел, претражујући податке или позивајући друге сервисе. У azd пројекту, агент је само још једна **услуга** поред вашег веб фронтенда или API бекенда.

### Како се агенти уклапају у структуру azd пројекта

azd пројекат се састоји из три слоја: **инфраструктура**, **код** и **конфигурација**. Агенти се укључују у ове слојеве на исти начин као и било која друга услуга:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Инфраструктура** (`infra/`) | Обезбеђује веб апликацију и базу података | Обезбеђује крајњу тачку модела AI, индекс претраге или хост за агента |
| **Код** (`src/`) | Садржи изворни код фронтенда и API-ја | Садржи логику агента и дефиниције упита |
| **Конфигурација** (`azure.yaml`) | Листе ваше услуге и њихове хостинг циљеве | Листе вашег агента као услугу, указујући на његов код и хост |

### Улога `azure.yaml`

Не морате да памтите синтаксу одмах. Концептуално, `azure.yaml` је фајл у којем кажете azd: *"Ово су услуге које чине моју апликацију, и ово је место где да пронађеш њихов код."*

Када ваш пројекат укључује AI агента, `azure.yaml` једноставно наводи тог агента као једну од услуга. azd онда зна да обезбеди праву инфраструктуру (као што је Microsoft Foundry Models крајња тачка или Container App за хостовање агента) и деплогује ваш агент код—исто као што би то урадио за веб апликацију или API.

Ово значи да нема ништа фундаментално ново за учење. Ако разумете како azd управља веб сервисом, већ разумете како управља агентом.

## Хијерархија конфигурације

azd користи хијерархијски систем конфигурације:
1. **Флаги командне линије** (највиши приоритет)
2. **Променљиве окружења**
3. **Локална конфигурација пројекта** (`.azd/config.json`)
4. **Глобална корисничка конфигурација** (`~/.azd/config.json`)
5. **Подразумеване вредности** (најнижи приоритет)

## Глобална конфигурација

### Постављање глобалних подразумеваних вредности
```bash
# Постави подразумевану претплату
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Постави подразумевану локацију
azd config set defaults.location "eastus2"

# Постави подразумевану конвенцију именовања групе ресурса
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Прикажи сву глобалну конфигурацију
azd config show

# Уклони конфигурацију
azd config unset defaults.location
```

### Честа глобална подешавања
```bash
# Преференције за развој
azd config set alpha.enable true                    # Омогући алфа функције
azd config set telemetry.enabled false             # Онемогући телеметрију
azd config set output.format json                  # Постави формат излаза

# Безбедносна подешавања
azd config set auth.useAzureCliCredential true     # Користи Azure CLI за аутентификацију
azd config set tls.insecure false                  # Примени верификацију TLS

# Подешавање перформанси
azd config set provision.parallelism 5             # Паралелно креирање ресурса
azd config set deploy.timeout 30m                  # Временско ограничење распоређивања
```

## 🏗️ Конфигурација пројекта

### Структура `azure.yaml`
Фајл `azure.yaml` је срж вашег azd пројекта:

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

#### Подешавања специфична за језик
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

## 🌟 Управљање окружењима

### Креирање окружења
```bash
# Креирај ново окружење
azd env new development

# Креирај са одређеном локацијом
azd env new staging --location "westus2"

# Креирај из шаблона
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурација окружења
Свако окружење има своју конфигурацију у `.azure/<env-name>/config.json`:

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
```bash
# Постави променљиве специфичне за окружење
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Прикажи променљиве окружења
azd env get-values

# Очекивани излаз:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Уклони променљиву окружења
azd env unset DEBUG

# Потврди уклањање
azd env get-values | grep DEBUG
# (не би требало да врати ништа)
```

### Шаблони окружења
Креирајте `.azure/env.template` за доследно подешавање окружења:
```bash
# Обавезне променљиве
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Подешавања апликације
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Опциона подешавања за развој
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Конфигурација аутентификације

### Интеграција Azure CLI
```bash
# Користи Azure CLI пријавне податке (подразумевано)
azd config set auth.useAzureCliCredential true

# Пријави се са одређеним тенантом
az login --tenant <tenant-id>

# Постави подразумевану претплату
az account set --subscription <subscription-id>
```

### Аутентификација помоћу сервисног принципала
За CI/CD pipeline-ове:
```bash
# Поставите променљиве окружења
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Или конфигуришите директно
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управљани идентитет
За окружења хостована у Azure:
```bash
# Омогућите аутентификацију помоћу управљаног идентитета
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфигурација инфраструктуре

### Параметри Bicep
Конфигуришите параметре инфраструктуре у `infra/main.parameters.json`:
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

### Terraform конфигурација
За Terraform пројекте, конфигуришите у `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфигурација деплоја

### Конфигурација изградње
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

### Docker конфигурација
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
Пример `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Напредна конфигурација

### Прилагођено именовање ресурса
```bash
# Поставити правила именовања
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Конфигурација мреже
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Конфигурација надзора
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

## 🎯 Конфигурације специфичне за окружење

### Развојно окружење
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Прелазно окружење
```bash
# .азуре/стејџинг/.енв
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Продукционо окружење
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Валидација конфигурације

### Проверите конфигурацију
```bash
# Провери синтаксу конфигурације
azd config validate

# Тестирај променљиве окружења
azd env get-values

# Валидирај инфраструктуру
azd provision --dry-run
```

### Скрипте за конфигурацију
Креирајте скрипте за валидацију у `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Провери обавезне променљиве окружења
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Провери синтаксу azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организујте конфигурационе фајлове
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

### 3. Разматрања у вези са контролом верзија
```bash
# .gitignore
.azure/*/config.json         # Конфигурације окружења (садрже ИД-ове ресурса)
.azure/*/.env               # Променљиве окружења (могу садржати тајне)
.env                        # Локална датотека окружења
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

## 🎯 Практичне вежбе

### Вежба 1: Конфигурација за више окружења (15 минута)

**Циљ**: Креирати и конфигурисати три окружења са различитим подешавањима

```bash
# Креирајте развојно окружење
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Креирајте претпродукционо окружење
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Креирајте продукционо окружење
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Проверите свако окружење
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Критеријуми успеха:**
- [ ] Креирана су три окружења успешно
- [ ] Свако окружење има јединствену конфигурацију
- [ ] Могуће је пребацивање између окружења без грешака
- [ ] `azd env list` приказује сва три окружења

### Вежба 2: Управљање тајнама (10 минута)

**Циљ**: Вежбати безбедну конфигурацију са осетљивим подацима

```bash
# Постави тајне (не приказују се у излазу)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Постави конфигурацију која није тајна
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Прикажи окружење (тајне би требало да буду сакривене)
azd env get-values

# Провери да ли су тајне сачуване
azd env get DB_PASSWORD  # Требало би да прикаже стварну вредност
```

**Критеријуми успеха:**
- [ ] Тајне се чувају без приказивања у терминалу
- [ ] `azd env get-values` приказује сакривене тајне
- [ ] Појединачно `azd env get <SECRET_NAME>` враћа стварну вредност

## Следећи кораци

- [Ваш први пројекат](first-project.md) - Примените конфигурацију у пракси
- [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md) - Користите конфигурацију за деплој
- [Провизионисање ресурса](../chapter-04-infrastructure/provisioning.md) - Конфигурације спремне за продукцију

## Референце

- [Референца за конфигурацију azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Шема `azure.yaml`](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Променљиве окружења](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигација по поглављима:**
- **📚 Почетна курсa**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 3 - Конфигурација и аутентификација
- **⬅️ Претходно**: [Ваш први пројекат](first-project.md)
- **➡️ Следеће поглавље**: [Поглавље 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Следећа лекција**: [Ваш први пројекат](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Искључење одговорности**:
Овај документ је преведен помоћу AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод који обавља стручни преводилац. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистичу из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->