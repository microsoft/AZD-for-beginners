<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T19:09:08+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ru"
}
-->
# Решение для розничной торговли с несколькими агентами - Развертывание ARM-шаблона

**Глава 5: Пакет для развертывания в производственной среде**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Связанная глава**: [Глава 5: Решения с несколькими агентами на основе ИИ](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Руководство по сценарию**: [Полная реализация](../retail-scenario.md)
- **🎯 Быстрое развертывание**: [Развертывание в один клик](../../../../examples/retail-multiagent-arm-template)

Этот каталог содержит полный шаблон Azure Resource Manager (ARM) для развертывания решения поддержки клиентов с несколькими агентами в розничной торговле, предоставляя инфраструктуру как код для всей архитектуры.

## 🎯 Что будет развернуто

### Основная инфраструктура
- **Сервисы Azure OpenAI** (мульти-региональная для высокой доступности)
  - Основной регион: GPT-4o для агента поддержки клиентов
  - Вторичный регион: GPT-4o-mini для агента инвентаризации  
  - Третичный регион: Модель текстовых эмбеддингов
  - Регион для оценки: Модель оценщика GPT-4o
- **Azure AI Search** с возможностями векторного поиска
- **Аккаунт хранения Azure** с контейнерами для документов и загрузок
- **Среда Azure Container Apps** с авто-масштабированием
- **Контейнерные приложения** для маршрутизатора агентов и фронтенда
- **Azure Cosmos DB** для хранения истории чатов
- **Azure Key Vault** для управления секретами (опционально)
- **Application Insights** и Log Analytics для мониторинга (опционально)
- **Document Intelligence** для обработки документов
- **Bing Search API** для получения информации в реальном времени

### Режимы развертывания

| Режим | Описание | Сценарий использования | Ресурсы |
|-------|----------|-------------------------|---------|
| **Минимальный** | Оптимизированное по стоимости базовое развертывание | Разработка, тестирование | Базовые SKUs, один регион, уменьшенная емкость |
| **Стандартный** | Сбалансированное развертывание для производственных нагрузок | Производство, умеренный масштаб | Стандартные SKUs, мульти-регион, стандартная емкость |
| **Премиум** | Высокопроизводительное развертывание корпоративного уровня | Корпоративный, большой масштаб | Премиум SKUs, мульти-регион, высокая емкость |

## 📋 Предварительные требования

1. **Azure CLI** установлен и настроен
2. **Активная подписка Azure** с достаточными квотами
3. **Соответствующие разрешения** для создания ресурсов в целевой подписке
4. **Квоты ресурсов** для:
   - Azure OpenAI (проверьте доступность по регионам)
   - Container Apps (зависит от региона)
   - AI Search (рекомендуется стандартный уровень или выше)

## 🚀 Быстрое развертывание

### Вариант 1: Использование Azure CLI

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

### Вариант 2: Использование Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Вариант 3: Использование Azure CLI напрямую

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Опции конфигурации

### Параметры шаблона

| Параметр | Тип | Значение по умолчанию | Описание |
|----------|-----|-----------------------|----------|
| `projectName` | string | "retail" | Префикс для всех имен ресурсов |
| `location` | string | Местоположение группы ресурсов | Основной регион развертывания |
| `secondaryLocation` | string | "westus2" | Вторичный регион для мульти-регионального развертывания |
| `tertiaryLocation` | string | "francecentral" | Регион для модели эмбеддингов |
| `environmentName` | string | "dev" | Обозначение среды (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Конфигурация развертывания (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Включить мульти-региональное развертывание |
| `enableMonitoring` | bool | true | Включить Application Insights и логирование |
| `enableSecurity` | bool | true | Включить Key Vault и усиленную безопасность |

### Настройка параметров

Редактируйте `azuredeploy.parameters.json`:

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

## 🏗️ Обзор архитектуры

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

## 📖 Использование скрипта развертывания

Скрипт `deploy.sh` предоставляет интерактивный опыт развертывания:

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

### Особенности скрипта

- ✅ **Проверка предварительных условий** (Azure CLI, статус входа, файлы шаблонов)
- ✅ **Управление группой ресурсов** (создает, если не существует)
- ✅ **Проверка шаблона** перед развертыванием
- ✅ **Мониторинг прогресса** с цветным выводом
- ✅ **Отображение результатов развертывания**
- ✅ **Рекомендации после развертывания**

## 📊 Мониторинг развертывания

### Проверка статуса развертывания

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

### Результаты развертывания

После успешного развертывания доступны следующие результаты:

- **URL фронтенда**: Публичная точка доступа для веб-интерфейса
- **URL маршрутизатора**: API-эндпоинт для маршрутизатора агентов
- **Эндпоинты OpenAI**: Основной и вторичный эндпоинты сервиса OpenAI
- **Сервис поиска**: Эндпоинт сервиса Azure AI Search
- **Аккаунт хранения**: Имя аккаунта хранения для документов
- **Key Vault**: Имя Key Vault (если включено)
- **Application Insights**: Имя сервиса мониторинга (если включено)

## 🔧 Настройка после развертывания

### 1. Настройка индекса поиска

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

### 2. Загрузка начальных данных

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Тестирование эндпоинтов агентов

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Настройка контейнерных приложений

ARM-шаблон развертывает контейнерные изображения-заглушки. Для развертывания реального кода агентов:

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

## 🛠️ Устранение неполадок

### Распространенные проблемы

#### 1. Превышена квота Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Ошибка развертывания контейнерных приложений

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

#### 3. Инициализация сервиса поиска

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Проверка развертывания

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

## 🔐 Соображения безопасности

### Управление ключами
- Все секреты хранятся в Azure Key Vault (если включено)
- Контейнерные приложения используют управляемую идентичность для аутентификации
- Аккаунты хранения имеют безопасные настройки по умолчанию (только HTTPS, без публичного доступа к блобам)

### Сетевое обеспечение безопасности
- Контейнерные приложения используют внутренние сети, где это возможно
- Сервис поиска настроен с опцией приватных эндпоинтов
- Cosmos DB настроен с минимально необходимыми разрешениями

### Конфигурация RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Оптимизация затрат

### Оценка затрат (ежемесячно, USD)

| Режим | OpenAI | Контейнерные приложения | Поиск | Хранение | Общая оценка |
|-------|--------|--------------------------|-------|----------|--------------|
| Минимальный | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Стандартный | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Премиум | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Мониторинг затрат

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

## 🔄 Обновления и обслуживание

### Обновления шаблона
- Используйте контроль версий для файлов ARM-шаблона
- Тестируйте изменения сначала в среде разработки
- Используйте режим инкрементального развертывания для обновлений

### Обновления ресурсов
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Резервное копирование и восстановление
- Автоматическое резервное копирование Cosmos DB включено
- Включено мягкое удаление для Key Vault
- Ревизии контейнерных приложений сохраняются для отката

## 📞 Поддержка

- **Проблемы с шаблоном**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Поддержка Azure**: [Портал поддержки Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Сообщество**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Готовы развернуть ваше решение с несколькими агентами?**

Начните с: `./deploy.sh -g myResourceGroup`

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.