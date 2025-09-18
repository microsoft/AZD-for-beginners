<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T14:24:04+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "uk"
}
-->
# Рішення для роздрібної торгівлі з багатозадачними агентами - Розгортання ARM-шаблону

**Розділ 5: Пакет розгортання для виробництва**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Пов’язаний розділ**: [Розділ 5: Рішення з багатозадачними агентами](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Посібник зі сценарію**: [Повна реалізація](../retail-scenario.md)
- **🎯 Швидке розгортання**: [Розгортання в один клік](../../../../examples/retail-multiagent-arm-template)

Ця директорія містить повний шаблон Azure Resource Manager (ARM) для розгортання рішення з багатозадачними агентами для підтримки клієнтів у роздрібній торгівлі, забезпечуючи інфраструктуру як код для всієї архітектури.

## 🎯 Що буде розгорнуто

### Основна інфраструктура
- **Сервіси Azure OpenAI** (багаторегіональні для високої доступності)
  - Основний регіон: GPT-4o для агента підтримки клієнтів
  - Вторинний регіон: GPT-4o-mini для агента інвентаризації  
  - Третинний регіон: Модель текстових векторів
  - Регіон оцінювання: Модель GPT-4o для оцінювання
- **Azure AI Search** з можливостями пошуку за векторами
- **Обліковий запис Azure Storage** з контейнерами для документів та завантажень
- **Середовище Azure Container Apps** з автоматичним масштабуванням
- **Контейнерні додатки** для маршрутизатора агентів та фронтенду
- **Azure Cosmos DB** для зберігання історії чатів
- **Azure Key Vault** для управління секретами (опціонально)
- **Application Insights** та Log Analytics для моніторингу (опціонально)
- **Document Intelligence** для обробки документів
- **Bing Search API** для отримання інформації в реальному часі

### Режими розгортання

| Режим | Опис | Використання | Ресурси |
|------|-------------|----------|-----------|
| **Мінімальний** | Оптимізоване за витратами базове розгортання | Розробка, тестування | Базові SKU, один регіон, знижена потужність |
| **Стандартний** | Збалансоване розгортання для виробничих навантажень | Виробництво, середній масштаб | Стандартні SKU, багаторегіональність, стандартна потужність |
| **Преміум** | Високопродуктивне розгортання для підприємств | Підприємства, великий масштаб | Преміум SKU, багаторегіональність, висока потужність |

## 📋 Попередні вимоги

1. **Azure CLI** встановлений та налаштований
2. **Активна підписка Azure** з достатніми квотами
3. **Відповідні дозволи** для створення ресурсів у цільовій підписці
4. **Квоти ресурсів** для:
   - Azure OpenAI (перевірте доступність у регіонах)
   - Container Apps (залежить від регіону)
   - AI Search (рекомендується стандартний рівень або вищий)

## 🚀 Швидке розгортання

### Варіант 1: Використання Azure CLI

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

### Варіант 2: Використання Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Варіант 3: Використання Azure CLI напряму

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Опції конфігурації

### Параметри шаблону

| Параметр | Тип | За замовчуванням | Опис |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Префікс для всіх назв ресурсів |
| `location` | string | Розташування групи ресурсів | Основний регіон розгортання |
| `secondaryLocation` | string | "westus2" | Вторинний регіон для багаторегіонального розгортання |
| `tertiaryLocation` | string | "francecentral" | Регіон для моделі векторів |
| `environmentName` | string | "dev" | Позначення середовища (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Конфігурація розгортання (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Увімкнути багаторегіональне розгортання |
| `enableMonitoring` | bool | true | Увімкнути Application Insights та логування |
| `enableSecurity` | bool | true | Увімкнути Key Vault та посилену безпеку |

### Налаштування параметрів

Редагуйте `azuredeploy.parameters.json`:

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

## 🏗️ Огляд архітектури

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

## 📖 Використання скрипту розгортання

Скрипт `deploy.sh` забезпечує інтерактивний досвід розгортання:

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

### Особливості скрипту

- ✅ **Перевірка попередніх вимог** (Azure CLI, статус входу, файли шаблону)
- ✅ **Управління групами ресурсів** (створює, якщо не існує)
- ✅ **Перевірка шаблону** перед розгортанням
- ✅ **Моніторинг прогресу** з кольоровим виводом
- ✅ **Вивід результатів розгортання**
- ✅ **Рекомендації після розгортання**

## 📊 Моніторинг розгортання

### Перевірка статусу розгортання

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

### Результати розгортання

Після успішного розгортання доступні наступні результати:

- **URL фронтенду**: Публічна точка доступу для веб-інтерфейсу
- **URL маршрутизатора**: API точка доступу для маршрутизатора агентів
- **Точки доступу OpenAI**: Основний та вторинний сервіси OpenAI
- **Сервіс пошуку**: Точка доступу сервісу Azure AI Search
- **Обліковий запис зберігання**: Назва облікового запису для документів
- **Key Vault**: Назва Key Vault (якщо увімкнено)
- **Application Insights**: Назва сервісу моніторингу (якщо увімкнено)

## 🔧 Налаштування після розгортання

### 1. Налаштування індексу пошуку

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

### 2. Завантаження початкових даних

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Тестування точок доступу агентів

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Налаштування контейнерних додатків

ARM-шаблон розгортає контейнерні образи-заглушки. Для розгортання реального коду агентів:

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

## 🛠️ Вирішення проблем

### Поширені проблеми

#### 1. Перевищення квоти Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Помилка розгортання контейнерних додатків

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

#### 3. Ініціалізація сервісу пошуку

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Перевірка розгортання

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

## 🔐 Міркування щодо безпеки

### Управління ключами
- Усі секрети зберігаються в Azure Key Vault (якщо увімкнено)
- Контейнерні додатки використовують керовану ідентичність для автентифікації
- Облікові записи зберігання мають безпечні налаштування (лише HTTPS, без публічного доступу до блобів)

### Мережна безпека
- Контейнерні додатки використовують внутрішню мережу, де це можливо
- Сервіс пошуку налаштований з опцією приватних точок доступу
- Cosmos DB налаштований з мінімально необхідними дозволами

### Конфігурація RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Оптимізація витрат

### Оцінка витрат (щомісячно, USD)

| Режим | OpenAI | Контейнерні додатки | Пошук | Зберігання | Загальна оцінка |
|------|--------|----------------|--------|---------|------------|
| Мінімальний | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Стандартний | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Преміум | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Моніторинг витрат

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

## 🔄 Оновлення та обслуговування

### Оновлення шаблону
- Контролюйте версії файлів ARM-шаблону
- Тестуйте зміни спочатку в середовищі розробки
- Використовуйте режим інкрементного розгортання для оновлень

### Оновлення ресурсів
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Резервне копіювання та відновлення
- Автоматичне резервне копіювання Cosmos DB увімкнено
- М’яке видалення Key Vault увімкнено
- Ревізії контейнерних додатків зберігаються для відкату

## 📞 Підтримка

- **Проблеми з шаблоном**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Підтримка Azure**: [Портал підтримки Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Спільнота**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Готові розгорнути своє рішення з багатозадачними агентами?**

Почніть з: `./deploy.sh -g myResourceGroup`

---

**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.