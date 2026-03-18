# Водич за конфигурацију

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 3 - Конфигурација и аутентификација
- **⬅️ Претходно**: [Ваш први пројекат](first-project.md)
- **➡️ Следеће**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следеће поглавље**: [Поглавље 4: Инфраструктура као код](../chapter-04-infrastructure/deployment-guide.md)

## Увод

Овај опсежни водич обухвата све аспекте конфигурисања Azure Developer CLI за оптималне токове рада развоја и деплоја. Научићете о хијерархији конфигурације, управљању окружењима, методама аутентификације и напредним шаблонима конфигурације који омогућавају ефикасне и безбедне Azure деплое.

## Циљеви учења

До краја ове лекције, ви ћете:
- Усвојити хијерархију конфигурације azd и разумети како се подешавања приоритизују
- Ефикасно конфигурисати глобална и пројектно-специфична подешавања
- Управљати више окружења са различитим конфигурацијама
- Имплементирати сигурне шаблоне аутентификације и ауторизације
- Разумети напредне шаблоне конфигурације за сложене сценарије

## Резултати учења

Након завршетка ове лекције, моћи ћете да:
- Конфигуришете azd за оптималне токове рада развоја
- Подесите и управљате више окружења за деплој
- Имплементирате сигурне праксе управљања конфигурацијом
- Решавате проблеме повезане са конфигурацијом
- Прилагодите понашање azd за специфичне организационе захтеве

Овај опсежни водич обухвата све аспекте конфигурисања Azure Developer CLI за оптималне токове рада развоја и деплоја.

## Разумевање AI агената у azd пројекту

Ако сте нови у вези AI агената, ево једноставног начина да их замислите у оквиру azd света.

### Шта је агент?

Агент је софтверски елемент који може да прими захтев, размисли о њему и предузме акције — често позивајући AI модел, тражећи податке или позивајући друге сервисе. У azd пројекту, агент је само још један **сервис** поред вашег веб фронтенда или API бекенда.

### Како се агенти уклапају у структуру azd пројекта

azd пројекат је састављен из три слоја: **инфраструктура**, **код** и **конфигурација**. Агенти се прикључују на ове слојеве на исти начин као и сваки други сервис:

| Layer | Шта ради за традиционалну апликацију | Шта ради за агента |
|-------|-------------------------------------|---------------------------|
| **Инфраструктура** (`infra/`) | Поставља веб апликацију и базу података | Поставља endpoint AI модела, search index или хост за агента |
| **Код** (`src/`) | Садржи ваш фронтенд и API изворни код | Садржи логику агента и дефиниције упита |
| **Конфигурација** (`azure.yaml`) | Листује ваше сервисе и њихове хостинг циљеве | Листује вашег агента као сервис, указујући на његов код и хост |

### Улога `azure.yaml`

Не морате сада да памтимо синтаксу. Концептуално, `azure.yaml` је датотека у којој кажете azd: *"Ово су сервиси који чине моју апликацију, и ево где да пронађете њихов код."*

Када ваш пројекат укључује AI агента, `azure.yaml` једноставно наведе тог агента као један од сервиса. azd онда зна да обезбеди праву инфраструктуру (на пример Microsoft Foundry Models endpoint или Container App да хостује агента) и да деплојује ваш агентски код — као што би то урадио за веб апликацију или API.

Ово значи да нема ништа фундаментално ново за учење. Ако разумете како azd управља веб сервисом, већ разумете како управља агентом.

## Хијерархија конфигурације

azd користи хијерархијски систем конфигурације:
1. **Флаге командне линије** (највиши приоритет)
2. **Променљиве окружења**
3. **Локална конфигурација пројекта** (`.azd/config.json`)
4. **Глобална корисничка конфигурација** (`~/.azd/config.json`)
5. **Подразумеване вредности** (најнижи приоритет)

## Глобална конфигурација

### Подешавање глобалних подразумеваних вредности
```bash
# Постави подразумевану претплату
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Постави подразумевану локацију
azd config set defaults.location "eastus2"

# Постави подразумевану конвенцију именовања група ресурса
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Прикажи сву глобалну конфигурацију
azd config list

# Уклони конфигурацију
azd config unset defaults.location
```

### Уобичајена глобална подешавања
```bash
# Преференције за развој
azd config set alpha.enable true                    # Омогући алфа функције
azd config set telemetry.enabled false             # Онемогући телеметрију
azd config set output.format json                  # Постави формат излаза

# Безбедносна подешавања
azd config set auth.useAzureCliCredential true     # Користи Azure CLI за аутентификацију
azd config set tls.insecure false                  # Принуди проверу TLS-а

# Подешавање перформанси
azd config set provision.parallelism 5             # Паралелно креирање ресурса
azd config set deploy.timeout 30m                  # Временско ограничење распоређивања
```

## 🏗️ Конфигурација пројекта

### Структура `azure.yaml`
Фајл `azure.yaml` је срце вашег azd пројекта:

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

## 🌟 Управљање окружењем

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
# Поставите променљиве специфичне за окружење
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Прикажите променљиве окружења
azd env get-values

# Очекујани излаз:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Уклоните променљиву окружења
azd env unset DEBUG

# Потврдите уклањање
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
# Користите Azure CLI акредитиве (подразумевано)
azd config set auth.useAzureCliCredential true

# Пријавите се са одређеним тенантом
az login --tenant <tenant-id>

# Поставите подразумевану претплату
az account set --subscription <subscription-id>
```

### Аутентификација помоћу Service Principal-а
За CI/CD pipeline-ове:
```bash
# Подесите променљиве окружења
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Или конфигуришите директно
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управљани идентитет
За окружења која су хостована у Azure:
```bash
# Омогући аутентификацију управљаног идентитета
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфигурација инфраструктуре

### Bicep параметри
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

### Конфигурација Terraform-а
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
# Поставите конвенције именовања
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Мрежна конфигурација
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

### Предпродукционо окружење
```bash
# .azure/staging/.env
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

### Валидација конфигурације
```bash
# Проверите синтаксу конфигурације
azd config validate

# Тестирајте променљиве окружења
azd env get-values

# Валидирајте инфраструктуру
azd provision --dry-run
```

### Скрипте за конфигурацију
Креирајте скрипте за валидацију у `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Проверите обавезне променљиве окружења
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Валидирајте синтаксу azure.yaml
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

### 2. Организујте конфигурационе датотеке
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

### 3. Разматрања у вези контроле верзија
```bash
# .gitignore
.azure/*/config.json         # Конфигурације окружења (садрже идентификаторе ресурса)
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

## 🎯 Практични задаци

### Вежба 1: Конфигурација за више окружења (15 минута)

**Циљ**: Креирајте и конфигуришите три окружења са различитим подешавањима

```bash
# Направити развојно окружење
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Направити предпродукцијско окружење
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Направити продукционо окружење
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Проверити свако окружење
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Критеријуми успеха:**
- [ ] Три окружења су успешно креирана
- [ ] Свако окружење има јединствену конфигурацију
- [ ] Могуће је пребацивање између окружења без грешака
- [ ] `azd env list` приказује сва три окружења

### Вежба 2: Управљање тајнама (10 минута)

**Циљ**: Вежбајте сигурну конфигурацију са осетљивим подацима

```bash
# Поставите тајне (не приказују се у излазу)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Поставите нетајну конфигурацију
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Погледајте окружење (тајне треба да буду сакривене)
azd env get-values

# Проверите да ли су тајне сачуване
azd env get DB_PASSWORD  # Требало би да прикаже стварну вредност
```

**Критеријуми успеха:**
- [ ] Тајне сачуване без приказивања у терминалу
- [ ] `azd env get-values` приказује цензурисане тајне
- [ ] Појединачно `azd env get <SECRET_NAME>` враћа стварну вредност

## Следећи кораци

- [Ваш први пројекат](first-project.md) - Примените конфигурацију у пракси
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Користите конфигурацију за деплој
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Конфигурације спремне за продукцију

## Референце

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 3 - Конфигурација и аутентификација
- **⬅️ Претходно**: [Ваш први пројекат](first-project.md)
- **➡️ Следеће поглавље**: [Поглавље 4: Инфраструктура као код](../chapter-04-infrastructure/deployment-guide.md)
- **Следећа лекција**: [Ваш први пројекат](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Овај документ је преведен помоћу AI преводилачке услуге [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте на уму да аутоматизовани преводи могу садржати грешке или нетачности. Изворни документ на његовом оригиналном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->