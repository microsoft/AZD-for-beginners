<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T12:15:35+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "sr"
}
-->
# Решење за малопродају са више агената - Деплојмент ARM шаблона

**Поглавље 5: Пакет за продукцијски деплојмент**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Повезано поглавље**: [Поглавље 5: AI решења са више агената](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Водич за сценарио**: [Комплетна имплементација](../retail-scenario.md)
- **🎯 Брзи деплојмент**: [Један клик за деплојмент](../../../../examples/retail-multiagent-arm-template)

Овај директоријум садржи комплетан Azure Resource Manager (ARM) шаблон за деплојмент решења за корисничку подршку у малопродаји са више агената, пружајући инфраструктуру као код за целокупну архитектуру.

## 🎯 Шта се деплојује

### Основна инфраструктура
- **Azure OpenAI услуге** (више региона за високу доступност)
  - Примарни регион: GPT-4o за агента за кориснике
  - Секундарни регион: GPT-4o-mini за агента за инвентар  
  - Терцијарни регион: Модел за текстуалне уграђене представе
  - Регион за евалуацију: GPT-4o модел за оцењивање
- **Azure AI Search** са могућностима претраге по векторима
- **Azure Storage Account** са blob контејнерима за документе и отпремања
- **Azure Container Apps Environment** са аутоматским скалирањем
- **Container Apps** за рутирање агената и фронтенд
- **Azure Cosmos DB** за складиштење историје ћаскања
- **Azure Key Vault** за управљање тајнама (опционо)
- **Application Insights** и Log Analytics за праћење (опционо)
- **Document Intelligence** за обраду докумената
- **Bing Search API** за информације у реалном времену

### Модови деплојмента

| Мод | Опис | Корисни случај | Ресурси |
|-----|------|---------------|---------|
| **Минимални** | Основни деплојмент оптимизован за трошкове | Развој, тестирање | Основни SKUs, један регион, смањени капацитет |
| **Стандардни** | Балансирани деплојмент за продукцијске радне оптерећења | Продукција, умерена скала | Стандардни SKUs, више региона, стандардни капацитет |
| **Премијум** | Високоперформансни деплојмент за предузећа | Предузећа, велика скала | Премијум SKUs, више региона, велики капацитет |

## 📋 Предуслови

1. **Azure CLI** инсталиран и конфигурисан
2. **Активна Azure претплата** са довољним квотама
3. **Одговарајуће дозволе** за креирање ресурса у циљној претплати
4. **Квоте за ресурсе** за:
   - Azure OpenAI (проверите доступност по регионима)
   - Container Apps (варира по региону)
   - AI Search (препоручује се стандардни ниво или виши)

## 🚀 Брзи деплојмент

### Опција 1: Коришћење Azure CLI

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

### Опција 2: Коришћење Azure портала

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Опција 3: Директно коришћење Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Опције конфигурације

### Параметри шаблона

| Параметар | Тип | Подразумевано | Опис |
|-----------|-----|--------------|------|
| `projectName` | string | "retail" | Префикс за сва имена ресурса |
| `location` | string | Локација ресурсне групе | Примарни регион деплојмента |
| `secondaryLocation` | string | "westus2" | Секундарни регион за деплојмент у више региона |
| `tertiaryLocation` | string | "francecentral" | Регион за модел уграђених представa |
| `environmentName` | string | "dev" | Ознака окружења (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Конфигурација деплојмента (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Омогући деплојмент у више региона |
| `enableMonitoring` | bool | true | Омогући Application Insights и логовање |
| `enableSecurity` | bool | true | Омогући Key Vault и побољшану безбедност |

### Прилагођавање параметара

Измените `azuredeploy.parameters.json`:

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

## 🏗️ Преглед архитектуре

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

## 📖 Упутство за коришћење скрипте за деплојмент

Скрипта `deploy.sh` пружа интерактивно искуство деплојмента:

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

### Карактеристике скрипте

- ✅ **Валидација предуслова** (Azure CLI, статус пријаве, датотеке шаблона)
- ✅ **Управљање ресурсним групама** (креира ако не постоји)
- ✅ **Валидација шаблона** пре деплојмента
- ✅ **Праћење напретка** са обојеним излазом
- ✅ **Приказ резултата деплојмента**
- ✅ **Упутства након деплојмента**

## 📊 Праћење деплојмента

### Провера статуса деплојмента

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

### Резултати деплојмента

Након успешног деплојмента, доступни су следећи резултати:

- **Frontend URL**: Јавна адреса за веб интерфејс
- **Router URL**: API адреса за рутирање агената
- **OpenAI Endpoints**: Примарни и секундарни OpenAI сервиси
- **Search Service**: Azure AI Search сервис
- **Storage Account**: Назив складишног налога за документе
- **Key Vault**: Назив Key Vault-а (ако је омогућен)
- **Application Insights**: Назив сервиса за праћење (ако је омогућен)

## 🔧 Конфигурација након деплојмента

### 1. Конфигуришите индекс претраге

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

### 2. Отпремите почетне податке

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Тестирајте крајње тачке агената

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Конфигуришите Container Apps

ARM шаблон деплојује привремене слике контејнера. За деплојмент стварног кода агената:

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

## 🛠️ Решавање проблема

### Уобичајени проблеми

#### 1. Прекорачење Azure OpenAI квоте

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Неуспешан деплојмент Container Apps

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

#### 3. Иницијација Search сервиса

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Валидација деплојмента

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

## 🔐 Безбедносни аспекти

### Управљање кључевима
- Сви тајни подаци се чувају у Azure Key Vault (ако је омогућен)
- Container Apps користе управљани идентитет за аутентификацију
- Складишни налози имају подразумеване безбедносне поставке (само HTTPS, без јавног приступа blob-овима)

### Мрежна безбедност
- Container Apps користе интерно умрежавање где је могуће
- Search сервис конфигурисан са приватним крајњим тачкама
- Cosmos DB конфигурисан са минималним неопходним дозволама

### RBAC конфигурација
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Оптимизација трошкова

### Процена трошкова (месечно, USD)

| Мод | OpenAI | Container Apps | Search | Storage | Укупно |
|-----|--------|----------------|--------|---------|--------|
| Минимални | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Стандардни | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Премијум | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Праћење трошкова

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

## 🔄 Ажурирања и одржавање

### Ажурирања шаблона
- Верзионишите ARM шаблон датотеке
- Тестирајте измене у развојном окружењу прво
- Користите инкрементални мод деплојмента за ажурирања

### Ажурирања ресурса
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Резервне копије и опоравак
- Cosmos DB аутоматске резервне копије су омогућене
- Key Vault омогућен са опцијом меког брисања
- Ревизије Container Apps-а се чувају за враћање на претходну верзију

## 📞 Подршка

- **Проблеми са шаблоном**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure подршка**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Заједница**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Спремни за деплојмент вашег решења са више агената?**

Почните са: `./deploy.sh -g myResourceGroup`

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.