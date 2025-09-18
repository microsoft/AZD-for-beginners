<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T12:15:06+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "bg"
}
-->
# Retail Multi-Agent Solution - ARM Template Deployment

**Глава 5: Пакет за внедряване в продукция**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Свързана глава**: [Глава 5: Мулти-агентни AI решения](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Ръководство за сценарий**: [Пълна имплементация](../retail-scenario.md)
- **🎯 Бързо внедряване**: [Еднократно внедряване](../../../../examples/retail-multiagent-arm-template)

Тази директория съдържа пълен шаблон на Azure Resource Manager (ARM) за внедряване на решението за мулти-агентна клиентска поддръжка в търговията на дребно, предоставяйки инфраструктура като код за цялата архитектура.

## 🎯 Какво се внедрява

### Основна инфраструктура
- **Azure OpenAI Services** (Мултирегионална за висока наличност)
  - Основен регион: GPT-4o за клиентски агент
  - Вторичен регион: GPT-4o-mini за агент за инвентар  
  - Третичен регион: Модел за текстови вграждания
  - Регион за оценка: GPT-4o модел за оценка
- **Azure AI Search** с възможности за векторно търсене
- **Azure Storage Account** с blob контейнери за документи и качвания
- **Azure Container Apps Environment** с автоматично мащабиране
- **Container Apps** за маршрутизатор на агенти и фронтенд
- **Azure Cosmos DB** за съхранение на историята на чатове
- **Azure Key Vault** за управление на тайни (по избор)
- **Application Insights** и Log Analytics за мониторинг (по избор)
- **Document Intelligence** за обработка на документи
- **Bing Search API** за информация в реално време

### Режими на внедряване

| Режим | Описание | Приложение | Ресурси |
|-------|----------|------------|---------|
| **Минимален** | Оптимизиран за разходи базов модел | Разработка, тестване | Базови SKUs, един регион, намален капацитет |
| **Стандартен** | Балансирано внедряване за производствени натоварвания | Производство, умерен мащаб | Стандартни SKUs, мултирегионален, стандартен капацитет |
| **Премиум** | Високопроизводително, корпоративно внедряване | Корпоративно, голям мащаб | Премиум SKUs, мултирегионален, висок капацитет |

## 📋 Предварителни условия

1. **Инсталиран и конфигуриран Azure CLI**
2. **Активен Azure абонамент** с достатъчни квоти
3. **Подходящи разрешения** за създаване на ресурси в целевия абонамент
4. **Квоти за ресурси** за:
   - Azure OpenAI (проверете регионалната наличност)
   - Container Apps (варира според региона)
   - AI Search (препоръчва се стандартен или по-висок клас)

## 🚀 Бързо внедряване

### Опция 1: Използване на Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Опция 2: Използване на Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Опция 3: Използване на Azure CLI директно

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Опции за конфигурация

### Параметри на шаблона

| Параметър | Тип | По подразбиране | Описание |
|-----------|-----|----------------|----------|
| `projectName` | string | "retail" | Префикс за всички имена на ресурси |
| `location` | string | Местоположение на ресурсната група | Основен регион за внедряване |
| `secondaryLocation` | string | "westus2" | Вторичен регион за мултирегионално внедряване |
| `tertiaryLocation` | string | "francecentral" | Регион за модел за вграждания |
| `environmentName` | string | "dev" | Обозначение на средата (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Конфигурация на внедряване (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Активиране на мултирегионално внедряване |
| `enableMonitoring` | bool | true | Активиране на Application Insights и логове |
| `enableSecurity` | bool | true | Активиране на Key Vault и подобрена сигурност |

### Персонализиране на параметри

Редактирайте `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Преглед на архитектурата

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Използване на скрипт за внедряване

Скриптът `deploy.sh` предоставя интерактивно внедряване:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Функции на скрипта

- ✅ **Проверка на предварителни условия** (Azure CLI, статус на вход, файлове на шаблона)
- ✅ **Управление на ресурсни групи** (създава, ако не съществува)
- ✅ **Валидиране на шаблона** преди внедряване
- ✅ **Мониторинг на прогреса** с цветен изход
- ✅ **Показване на резултати от внедряването**
- ✅ **Насоки след внедряване**

## 📊 Мониторинг на внедряването

### Проверка на статус на внедряване

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Резултати от внедряването

След успешно внедряване, са налични следните резултати:

- **URL на фронтенд**: Публична точка за достъп до уеб интерфейса
- **URL на маршрутизатор**: API точка за достъп до маршрутизатора на агенти
- **OpenAI точки за достъп**: Основни и вторични точки за достъп до OpenAI услуги
- **Търсачка**: Точка за достъп до Azure AI Search услуга
- **Акаунт за съхранение**: Име на акаунта за съхранение на документи
- **Key Vault**: Име на Key Vault (ако е активиран)
- **Application Insights**: Име на услугата за мониторинг (ако е активирана)

## 🔧 Конфигурация след внедряване

### 1. Конфигуриране на индекс за търсене

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Качване на начални данни

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Тестване на точки за достъп на агенти

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Конфигуриране на Container Apps

Шаблонът ARM внедрява контейнерни изображения заместители. За да внедрите реален код на агенти:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Отстраняване на проблеми

### Чести проблеми

#### 1. Превишена квота на Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Провалено внедряване на Container Apps

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Инициализация на услуга за търсене

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Валидиране на внедряването

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Съображения за сигурност

### Управление на ключове
- Всички тайни се съхраняват в Azure Key Vault (ако е активиран)
- Container Apps използват управлявана идентичност за автентикация
- Акаунтите за съхранение имат сигурни настройки по подразбиране (само HTTPS, без публичен достъп до blob)

### Мрежова сигурност
- Container Apps използват вътрешна мрежа, когато е възможно
- Услугата за търсене е конфигурирана с опция за частни крайни точки
- Cosmos DB е конфигуриран с минимално необходими разрешения

### Конфигурация на RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Оптимизация на разходите

### Оценка на разходите (месечно, USD)

| Режим | OpenAI | Container Apps | Търсене | Съхранение | Обща оценка |
|-------|--------|----------------|---------|------------|-------------|
| Минимален | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Стандартен | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Премиум | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Мониторинг на разходите

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Актуализации и поддръжка

### Актуализации на шаблона
- Версионирайте файловете на шаблона ARM
- Тествайте промените първо в среда за разработка
- Използвайте режим на инкрементално внедряване за актуализации

### Актуализации на ресурси
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Архивиране и възстановяване
- Автоматично архивиране на Cosmos DB е активирано
- Активирано меко изтриване на Key Vault
- Поддържане на ревизии на контейнерни приложения за връщане назад

## 📞 Поддръжка

- **Проблеми с шаблона**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Поддръжка на Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Общност**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Готови ли сте да внедрите вашето мулти-агентно решение?**

Започнете с: `./deploy.sh -g myResourceGroup`

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.