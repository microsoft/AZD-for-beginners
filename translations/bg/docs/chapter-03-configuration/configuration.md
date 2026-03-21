# Ръководство за конфигурация

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 3 - Конфигурация & Удостоверяване
- **⬅️ Предишна**: [Вашият първи проект](first-project.md)
- **➡️ Следваща**: [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следваща глава**: [Глава 4: Инфраструктура като код](../chapter-04-infrastructure/deployment-guide.md)

## Въведение

Това изчерпателно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни потоци при разработка и внедряване. Ще научите за йерархията на конфигурацията, управлението на среди, методите за удостоверяване и напреднали конфигурационни модели, които позволяват ефективни и сигурни внедрявания в Azure.

## Цели на обучението

Към края на този урок вие ще:
- Да овладеете йерархията на конфигурацията на azd и да разберете как се приоритизират настройките
- Да конфигурирате глобални и проектно-специфични настройки ефективно
- Да управлявате няколко среди с различни конфигурации
- Да внедрите сигурни модели за удостоверяване и авторизация
- Да разберете напреднали шаблони за конфигуриране за сложни сценарии

## Резултати от обучението

След завършване на този урок ще можете да:
- Да конфигурирате azd за оптимални работни потоци при разработка
- Да настроите и управлявате няколко среди за внедряване
- Да прилагате сигурни практики за управление на конфигурации
- Да отстранявате проблеми, свързани с конфигурацията
- Да персонализирате поведението на azd за специфични организационни изисквания

Това изчерпателно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни потоци при разработка и внедряване.

## Разбиране на AI агентите в azd проект

Ако сте нови в AI агентите, ето прост начин да ги разгледате в контекста на azd.

### Какво е агент?

Агентът е софтуерен компонент, който може да получи заявка, да я анализира и да предприеме действия—често чрез извикване на AI модел, търсене на данни или извикване на други услуги. В azd проект агентът е просто още една **услуга** заедно с вашия уеб фронтенд или API бекенд.

### Как агентите се вписват в структурата на azd проекта

azd проектът е съставен от три слоя: **инфраструктура**, **код** и **конфигурация**. Агентите се интегрират в тези слоеве по същия начин, както всяка друга услуга:

| Слой | Какво прави за традиционно приложение | Какво прави за агент |
|-------|-------------------------------------|---------------------------|
| **Инфраструктура** (`infra/`) | Осигурява уеб приложение и база данни | Осигурява крайна точка за AI модел, индекс за търсене или хост за агент |
| **Код** (`src/`) | Съдържа изходния код на фронтенда и API-то | Съдържа логиката на агента и дефинициите на подсказките |
| **Конфигурация** (`azure.yaml`) | Изброява вашите услуги и техните целеви хостинг места | Изброява вашия агент като услуга, посочвайки неговия код и хост |

### Ролята на `azure.yaml`

Не е необходимо да запомняте синтаксиса в момента. Концептуално, `azure.yaml` е файлът, в който казвате на azd: *"Ето услугите, които съставляват моето приложение, и къде да намерите техния код."*

Когато проектът ви включва AI агент, `azure.yaml` просто изброява този агент като една от услугите. azd тогава знае да осигури правилната инфраструктура (например Microsoft Foundry Models endpoint или Container App за хостиране на агента) и да внедри кода на агента—по същия начин, както би направил за уеб приложение или API.

Това означава, че няма нищо принципно ново за научаване. Ако разбирате как azd управлява уеб услуга, вече разбирате как управлява агент.

## Йерархия на конфигурацията

azd използва йерархична система за конфигурация:
1. **Командни флагове** (най-висок приоритет)
2. **Променливи на средата**
3. **Локална конфигурация на проекта** (`.azd/config.json`)
4. **Глобална потребителска конфигурация** (`~/.azd/config.json`)
5. **Стойности по подразбиране** (най-нисък приоритет)

## Глобална конфигурация

### Настройване на глобалните стойности по подразбиране
```bash
# Задаване на абонамент по подразбиране
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Задаване на местоположение по подразбиране
azd config set defaults.location "eastus2"

# Задаване на конвенция за именуване на ресурсни групи по подразбиране
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Преглед на всички глобални настройки
azd config list

# Премахване на конфигурация
azd config unset defaults.location
```

### Чести глобални настройки
```bash
# Предпочитания за разработка
azd config set alpha.enable true                    # Активиране на алфа функции
azd config set telemetry.enabled false             # Деактивиране на телеметрията
azd config set output.format json                  # Задаване на формат на изхода

# Настройки за сигурност
azd config set auth.useAzureCliCredential true     # Използване на Azure CLI за удостоверяване
azd config set tls.insecure false                  # Задължителна проверка на TLS

# Оптимизация на производителността
azd config set provision.parallelism 5             # Паралелно създаване на ресурси
azd config set deploy.timeout 30m                  # Таймаут на внедряването
```

## 🏗️ Конфигурация на проекта

### Структура на azure.yaml
Файлът `azure.yaml` е сърцето на вашия azd проект:

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

### Опции за конфигурация на услугите

#### Типове хостинг
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

#### Езиково-специфични настройки
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

## 🌟 Управление на среди

### Създаване на среди
```bash
# Създаване на нова среда
azd env new development

# Създаване с конкретно местоположение
azd env new staging --location "westus2"

# Създаване от шаблон
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурация на средата
Всяка среда има собствена конфигурация в `.azure/<env-name>/config.json`:

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

### Променливи на средата
```bash
# Задайте променливи, специфични за средата
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Прегледайте променливите на средата
azd env get-values

# Очакван изход:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Премахнете променлива на средата
azd env unset DEBUG

# Проверете премахването
azd env get-values | grep DEBUG
# (не трябва да връща нищо)
```

### Шаблони за среди
Създайте `.azure/env.template` за последователна настройка на средите:
```bash
# Задължителни променливи
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Настройки на приложението
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Незадължителни настройки за разработка
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Конфигурация за удостоверяване

### Интеграция с Azure CLI
```bash
# Използвайте идентификационни данни на Azure CLI (по подразбиране)
azd config set auth.useAzureCliCredential true

# Влезте с конкретен наемател
az login --tenant <tenant-id>

# Задайте абонамент по подразбиране
az account set --subscription <subscription-id>
```

### Удостоверяване чрез Service Principal
За CI/CD пайплайни:
```bash
# Задайте променливи на средата
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Или конфигурирайте директно
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управлявана идентичност
За среди, хоствани в Azure:
```bash
# Активиране на удостоверяване чрез управлявана идентичност
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфигурация на инфраструктурата

### Параметри на Bicep
Конфигурирайте параметрите на инфраструктурата в `infra/main.parameters.json`:
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

### Конфигурация на Terraform
За Terraform проекти конфигурирайте в `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфигурация за внедряване

### Конфигурация на изграждането
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

### Конфигурация на Docker
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
Примерен `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Разширена конфигурация

### Персонализиране на имената на ресурсите
```bash
# Задайте конвенции за именуване
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Мрежова конфигурация
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Конфигурация на наблюдение
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

## 🎯 Конфигурации, специфични за средата

### Среда за разработка
```bash
# .azure/разработка/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Предпроизводствена среда
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Производствена среда
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Проверка на конфигурацията

### Проверка на конфигурацията
```bash
# Проверете синтаксиса на конфигурацията
azd config validate

# Тествайте променливите на средата
azd env get-values

# Проверете инфраструктурата
azd provision --dry-run
```

### Скриптове за конфигурация
Създайте скриптове за валидация в `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Проверете задължителните променливи на средата
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Проверете синтаксиса на azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Най-добри практики

### 1. Използвайте променливи на средата
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организирайте файловете за конфигурация
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

### 3. Съображения относно контрол на версиите
```bash
# .gitignore
.azure/*/config.json         # Конфигурации на средата (съдържат идентификатори на ресурси)
.azure/*/.env               # Променливи на средата (могат да съдържат тайни)
.env                        # Локален файл на средата
```

### 4. Документация на конфигурацията
Документирайте вашата конфигурация в `CONFIG.md`:
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

## 🎯 Практически упражнения

### Упражнение 1: Конфигурация за няколко среди (15 минути)

**Цел**: Създайте и конфигурирайте три среди с различни настройки

```bash
# Създайте среда за разработка
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Създайте стейджинг среда
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Създайте продукционна среда
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Проверете всяка среда
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Критерии за успех:**
- [ ] Три среди са създадени успешно
- [ ] Всяка среда има уникална конфигурация
- [ ] Може да се превключва между среди без грешки
- [ ] `azd env list` показва всичките три среди

### Упражнение 2: Управление на тайни (10 минути)

**Цел**: Практикувайте сигурна конфигурация с чувствителни данни

```bash
# Задайте тайни (не се показват в изхода)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Задайте конфигурация без тайни
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Прегледайте средата (тайните трябва да бъдат скрити)
azd env get-values

# Проверете дали тайните са съхранени
azd env get DB_PASSWORD  # Трябва да покаже действителната стойност
```

**Критерии за успех:**
- [ ] Тайните са съхранявани без да се показват в терминала
- [ ] `azd env get-values` показва замаскирани тайни
- [ ] Индивидуалната команда `azd env get <SECRET_NAME>` извлича реалната стойност

## Следващи стъпки

- [Вашият първи проект](first-project.md) - Приложете конфигурацията на практика
- [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md) - Използвайте конфигурацията за внедряване
- [Осигуряване на ресурси](../chapter-04-infrastructure/provisioning.md) - Конфигурации, готови за продукция

## Референции

- [Референция за конфигурацията на azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема на azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Променливи на средата](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 3 - Конфигурация & Удостоверяване
- **⬅️ Предишна**: [Вашият първи проект](first-project.md)
- **➡️ Следваща глава**: [Глава 4: Инфраструктура като код](../chapter-04-infrastructure/deployment-guide.md)
- **Следващ урок**: [Вашият първи проект](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->