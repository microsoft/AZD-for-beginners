# Ръководство за конфигуриране

**Навигация в главата:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 3 - Конфигурация и удостоверяване
- **⬅️ Предишна**: [Вашият първи проект](first-project.md)
- **➡️ Следваща**: [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следваща глава**: [Глава 4: Инфраструктура като код](../chapter-04-infrastructure/deployment-guide.md)

## Въведение

Това цялостно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни процеси на разработка и внедряване. Ще научите за йерархията на конфигурацията, управлението на среди, методите за удостоверяване и усъвършенстваните конфигурационни модели, които позволяват ефективни и сигурни внедрявания в Azure.

## Цели за обучение

В края на този урок ще можете да:
- Овладеете йерархията на конфигурацията на azd и да разберете как се приоритизират настройките
- Конфигурирате глобални и проектно-специфични настройки ефективно
- Управлявате множество среди с различни конфигурации
- Прилагате сигурни модели за удостоверяване и овластяване
- Разбирате усъвършенствани конфигурационни модели за сложни сценарии

## Резултати от обучението

След завършване на този урок, ще можете да:
- Конфигурирате azd за оптимални работни процеси на разработка
- Настроите и управлявате множество среди за внедряване
- Прилагате практики за сигурно управление на конфигурацията
- Откривате и отстранявате проблеми, свързани с конфигурацията
- Персонализирате поведението на azd за специфични организационни изисквания

Това цялостно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни процеси на разработка и внедряване.

## Разбиране на AI агенти в azd проект

Ако сте нови в AI агентите, ето прост начин да ги разгледате в света на azd.

### Какво е агент?

Агентът е парче софтуер, което може да получи заявка, да я анализира и предприеме действия — често чрез извикване на AI модел, търсене на данни или използване на други услуги. В azd проект агентът е просто още една **услуга** заедно с вашия уеб фронтенд или API бекенд.

### Как агентите се вписват в структурата на azd проекта

azd проектът се състои от три слоя: **инфраструктура**, **код** и **конфигурация**. Агентите се интегрират в тези слоеве по същия начин, както и другите услуги:

| Слой | Какво прави за традиционно приложение | Какво прави за агент |
|-------|-------------------------------------|---------------------|
| **Инфраструктура** (`infra/`) | Осигурява уеб приложение и база данни | Осигурява крайна точка за AI модел, индекс за търсене или хост за агент |
| **Код** (`src/`) | Съдържа кода на фронтенда и API | Съдържа логиката на агента и дефинициите на подсказки |
| **Конфигурация** (`azure.yaml`) | Изброява вашите услуги и техните хостинг цели | Изброява вашия агент като услуга, сочеща към кода и хоста му |

### Ролята на `azure.yaml`

Не е нужно да запаметявате синтаксиса сега. Концептуално, `azure.yaml` е файлът, в който казвате на azd: *"Ето услугите, които съставят моето приложение, и тук е къде да намерите техния код."*

Когато проектът ви включва AI агент, `azure.yaml` просто изброява този агент като една от услугите. azd после знае да осигури правилната инфраструктура (като крайна точка Microsoft Foundry Models или Container App за хостване на агента) и да внедри кода на агента — също както за уеб приложение или API.

Това означава, че няма фундаментално нови неща за научаване. Ако разбирате как azd управлява уеб услуга, вече разбирате как управлява агент.

## Йерархия на конфигурацията

azd използва йерархична система за конфигурация:
1. **Флагове от командния ред** (най-висок приоритет)
2. **Променливи на средата**
3. **Локална проектна конфигурация** (`.azd/config.json`)
4. **Глобална потребителска конфигурация** (`~/.azd/config.json`)
5. **По подразбиране стойности** (най-нисък приоритет)

## Глобална конфигурация

### Настройка на глобални стойности по подразбиране
```bash
# Задайте подразбираща се абонамент
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Задайте подразбиращо се местоположение
azd config set defaults.location "eastus2"

# Задайте подразбираща се конвенция за именуване на групи с ресурси
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Прегледайте всички глобални конфигурации
azd config show

# Премахнете конфигурация
azd config unset defaults.location
```

### Често използвани глобални настройки
```bash
# Предпочитания за разработка
azd config set alpha.enable true                    # Активиране на алфа функции
azd config set telemetry.enabled false             # Деактивиране на телеметрия
azd config set output.format json                  # Задаване на формат за изход

# Настройки за сигурност
azd config set auth.useAzureCliCredential true     # Използване на Azure CLI за удостоверяване
azd config set tls.insecure false                  # Прилагане на TLS проверка

# Оптимизация на производителността
azd config set provision.parallelism 5             # Паралелно създаване на ресурси
azd config set deploy.timeout 30m                  # Таймаут за внедряване
```

## 🏗️ Проектна конфигурация

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

### Опции за конфигурация на услуги

#### Типове хостове
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
# Създайте нова среда
azd env new development

# Създайте със специфично местоположение
azd env new staging --location "westus2"

# Създайте от шаблон
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурация на средата
Всяка среда има своя конфигурация в `.azure/<env-name>/config.json`:

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
# Задайте специфични за околната среда променливи
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Прегледайте променливите на околната среда
azd env get-values

# Очакван изход:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Премахнете променлива на околната среда
azd env unset DEBUG

# Потвърдете премахването
azd env get-values | grep DEBUG
# (трябва да връща нищо)
```

### Шаблони за среда
Създайте `.azure/env.template` за последователна настройка на средата:
```bash
# Задължителни променливи
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Настройки на приложението
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Допълнителни настройки за разработка
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Конфигурация за удостоверяване

### Интеграция с Azure CLI
```bash
# Използване на идентификационни данни на Azure CLI (по подразбиране)
azd config set auth.useAzureCliCredential true

# Вход с конкретен клиент
az login --tenant <tenant-id>

# Задаване на подразбирана абонаментна услуга
az account set --subscription <subscription-id>
```

### Удостоверяване чрез Service Principal
За CI/CD pipeline:
```bash
# Задайте променливи на средата
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Или конфигурирайте директно
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управлявана самоличност
За среди хоствани в Azure:
```bash
# Активиране на удостоверяване с управлявана самоличност
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Инфраструктурна конфигурация

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
За Terraform проекти, конфигурирайте в `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфигурация за внедряване

### Конфигурация на изграждане
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

### Docker конфигурация
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

## 🔧 Усъвършенствана конфигурация

### Персонализирано именуване на ресурси
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

### Конфигурация за наблюдение
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
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Среда за тестове
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

### Валидиране на конфигурацията
```bash
# Проверка на синтаксиса на конфигурацията
azd config validate

# Тествайте променливите на средата
azd env get-values

# Валидиране на инфраструктурата
azd provision --dry-run
```

### Скриптове за конфигурация
Създайте скриптове за проверка в `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Проверете задължителните променливи на средата
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Валидирайте синтаксиса на azure.yaml
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

### 2. Организиране на конфигурационни файлове
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

### 3. Съображения за контрол на версиите
```bash
# .gitignore
.azure/*/config.json         # Конфигурации на средата (съдържат идентификатори на ресурси)
.azure/*/.env               # Променливи на средата (може да съдържат тайни)
.env                        # Локален файл на средата
```

### 4. Документация на конфигурацията
Документирайте конфигурацията си в `CONFIG.md`:
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

### Упражнение 1: Конфигурация с много среди (15 минути)

**Цел**: Създаване и конфигуриране на три среди с различни настройки

```bash
# Създайте среда за разработка
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Създайте тестова среда
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
- [ ] Три среди успешно създадени
- [ ] Всяка среда има уникална конфигурация
- [ ] Може да се превключва между средите без грешки
- [ ] `azd env list` показва всичките три среди

### Упражнение 2: Управление на тайни (10 минути)

**Цел**: Практика със сигурна конфигурация с чувствителни данни

```bash
# Задайте тайни (не се показват в изхода)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Задайте конфигурация без тайни
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Прегледайте средата (тайните трябва да са редактирани)
azd env get-values

# Проверете дали тайните са запазени
azd env get DB_PASSWORD  # Трябва да показва реалната стойност
```

**Критерии за успех:**
- [ ] Тайните са съхранени без показване в терминала
- [ ] `azd env get-values` показва скрити тайни
- [ ] Отделните `azd env get <SECRET_NAME>` извличат реалната стойност

## Следващи стъпки

- [Вашият първи проект](first-project.md) - Приложете конфигурацията на практика
- [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md) - Използвайте конфигурацията за внедряване
- [Осигуряване на ресурси](../chapter-04-infrastructure/provisioning.md) - Конфигурации готови за производство

## Ресурси

- [azd справочник за конфигурация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема на azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Променливи на средата](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигация в главата:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 3 - Конфигурация и удостоверяване
- **⬅️ Предишна**: [Вашият първи проект](first-project.md)
- **➡️ Следваща глава**: [Глава 4: Инфраструктура като код](../chapter-04-infrastructure/deployment-guide.md)
- **Следващ урок**: [Вашият първи проект](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стараем за точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е неразбирателства или погрешни тълкувания, възникнали в резултат на използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->