<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T13:57:47+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ru"
}
-->
# Лаборатория AI Workshop: Делайте свои AI-решения готовыми к AZD-развертыванию

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом AI
- **⬅️ Предыдущая**: [Развертывание AI-модели](ai-model-deployment.md)
- **➡️ Следующая**: [Лучшие практики для AI в продакшене](production-ai-practices.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

## Обзор мастерской

Эта практическая лаборатория помогает разработчикам пройти процесс использования существующего AI-шаблона и его развертывания с помощью Azure Developer CLI (AZD). Вы изучите ключевые шаблоны для развертывания AI-решений в продакшене с использованием сервисов Azure AI Foundry.

**Продолжительность:** 2-3 часа  
**Уровень:** Средний  
**Предварительные требования:** Базовые знания Azure, знакомство с концепциями AI/ML

## 🎓 Цели обучения

К концу этой лаборатории вы сможете:
- ✅ Преобразовать существующее AI-приложение для использования шаблонов AZD
- ✅ Настроить сервисы Azure AI Foundry с помощью AZD
- ✅ Реализовать безопасное управление учетными данными для AI-сервисов
- ✅ Развернуть готовые к продакшену AI-приложения с мониторингом
- ✅ Устранить распространенные проблемы развертывания AI

## Предварительные требования

### Необходимые инструменты
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) установлен
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) установлен
- [Git](https://git-scm.com/) установлен
- Редактор кода (рекомендуется VS Code)

### Ресурсы Azure
- Подписка Azure с доступом уровня Contributor
- Доступ к сервисам Azure OpenAI (или возможность запросить доступ)
- Разрешения на создание группы ресурсов

### Знания
- Базовое понимание сервисов Azure
- Знакомство с интерфейсами командной строки
- Основы AI/ML (API, модели, подсказки)

## Настройка лаборатории

### Шаг 1: Подготовка окружения

1. **Проверьте установку инструментов:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Клонируйте репозиторий лаборатории:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Понимание структуры AZD для AI-приложений

### Структура AI-шаблона AZD

Изучите ключевые файлы в шаблоне AZD, готовом для AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Практическое задание 1.1: Исследование конфигурации**

1. **Изучите файл azure.yaml:**
```bash
cat azure.yaml
```

**На что обратить внимание:**
- Определения сервисов для AI-компонентов
- Отображение переменных окружения
- Конфигурации хоста

2. **Просмотрите инфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Ключевые AI-шаблоны:**
- Настройка сервиса Azure OpenAI
- Интеграция Cognitive Search
- Безопасное управление ключами
- Конфигурации сетевой безопасности

### **Тема для обсуждения:** Почему эти шаблоны важны для AI

- **Зависимости сервисов**: AI-приложения часто требуют координации нескольких сервисов
- **Безопасность**: API-ключи и конечные точки нуждаются в безопасном управлении
- **Масштабируемость**: AI-нагрузки имеют уникальные требования к масштабированию
- **Управление затратами**: AI-сервисы могут быть дорогими без правильной настройки

## Модуль 2: Разверните свое первое AI-приложение

### Шаг 2.1: Инициализация окружения

1. **Создайте новое окружение AZD:**
```bash
azd env new myai-workshop
```

2. **Установите необходимые параметры:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Шаг 2.2: Развертывание инфраструктуры и приложения

1. **Разверните с помощью AZD:**
```bash
azd up
```

**Что происходит во время `azd up`:**
- ✅ Настраивается сервис Azure OpenAI
- ✅ Создается сервис Cognitive Search
- ✅ Настраивается App Service для веб-приложения
- ✅ Конфигурируется сеть и безопасность
- ✅ Развертывается код приложения
- ✅ Настраивается мониторинг и логирование

2. **Следите за ходом развертывания** и обратите внимание на создаваемые ресурсы.

### Шаг 2.3: Проверьте развертывание

1. **Проверьте развернутые ресурсы:**
```bash
azd show
```

2. **Откройте развернутое приложение:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Протестируйте функциональность AI:**
   - Перейдите к веб-приложению
   - Попробуйте примерные запросы
   - Убедитесь, что ответы AI работают

### **Практическое задание 2.1: Практика устранения неполадок**

**Сценарий**: Развертывание прошло успешно, но AI не отвечает.

**Распространенные проблемы:**
1. **API-ключи OpenAI**: Убедитесь, что они настроены правильно
2. **Доступность модели**: Проверьте, поддерживает ли ваш регион модель
3. **Сетевое подключение**: Убедитесь, что сервисы могут взаимодействовать
4. **Разрешения RBAC**: Убедитесь, что приложение имеет доступ к OpenAI

**Команды для отладки:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Настройка AI-приложений под ваши нужды

### Шаг 3.1: Изменение конфигурации AI

1. **Обновите модель OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Добавьте дополнительные AI-сервисы:**

Отредактируйте `infra/main.bicep`, чтобы добавить Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Шаг 3.2: Конфигурации для разных окружений

**Лучшие практики**: Разные конфигурации для разработки и продакшена.

1. **Создайте окружение для продакшена:**
```bash
azd env new myai-production
```

2. **Установите параметры для продакшена:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Практическое задание 3.1: Оптимизация затрат**

**Задача**: Настроить шаблон для экономичной разработки.

**Задания:**
1. Определите, какие SKUs можно установить на бесплатные/базовые уровни
2. Настройте переменные окружения для минимальных затрат
3. Разверните и сравните затраты с конфигурацией для продакшена

**Подсказки:**
- Используйте уровень F0 (бесплатный) для Cognitive Services, если возможно
- Используйте базовый уровень для Search Service в разработке
- Рассмотрите использование Consumption-плана для Functions

## Модуль 4: Безопасность и лучшие практики для продакшена

### Шаг 4.1: Безопасное управление учетными данными

**Текущая проблема**: Многие AI-приложения жестко прописывают API-ключи или используют небезопасное хранилище.

**Решение AZD**: Интеграция Managed Identity + Key Vault.

1. **Изучите конфигурацию безопасности в вашем шаблоне:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Убедитесь, что Managed Identity работает:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Шаг 4.2: Сетевая безопасность

1. **Включите приватные конечные точки** (если они еще не настроены):

Добавьте в ваш шаблон bicep:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Шаг 4.3: Мониторинг и наблюдаемость

1. **Настройте Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Настройте мониторинг, специфичный для AI:**

Добавьте пользовательские метрики для операций AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Практическое задание 4.1: Аудит безопасности**

**Задача**: Проверьте ваше развертывание на соответствие лучшим практикам безопасности.

**Контрольный список:**
- [ ] Нет жестко прописанных секретов в коде или конфигурации
- [ ] Используется Managed Identity для аутентификации между сервисами
- [ ] Key Vault хранит конфиденциальные настройки
- [ ] Сетевой доступ правильно ограничен
- [ ] Мониторинг и логирование включены

## Модуль 5: Преобразование вашего AI-приложения

### Шаг 5.1: Оценочный лист

**Перед преобразованием вашего приложения** ответьте на эти вопросы:

1. **Архитектура приложения:**
   - Какие AI-сервисы использует ваше приложение?
   - Какие вычислительные ресурсы ему нужны?
   - Требуется ли база данных?
   - Каковы зависимости между сервисами?

2. **Требования безопасности:**
   - Какие конфиденциальные данные обрабатывает ваше приложение?
   - Какие требования к соответствию у вас есть?
   - Нужна ли приватная сеть?

3. **Требования к масштабированию:**
   - Какова ожидаемая нагрузка?
   - Нужна ли авто-масштабируемость?
   - Есть ли региональные требования?

### Шаг 5.2: Создайте свой шаблон AZD

**Следуйте этому шаблону для преобразования вашего приложения:**

1. **Создайте базовую структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Создайте azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Создайте инфраструктурные шаблоны:**

**infra/main.bicep** - Основной шаблон:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Модуль OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Практическое задание 5.1: Задача по созданию шаблона**

**Задача**: Создайте шаблон AZD для приложения AI по обработке документов.

**Требования:**
- Azure OpenAI для анализа контента
- Document Intelligence для OCR
- Storage Account для загрузки документов
- Function App для логики обработки
- Веб-приложение для пользовательского интерфейса

**Бонусные баллы:**
- Добавьте обработку ошибок
- Включите оценку затрат
- Настройте мониторинговые панели

## Модуль 6: Устранение распространенных проблем

### Распространенные проблемы развертывания

#### Проблема 1: Превышение квоты сервиса OpenAI
**Симптомы:** Развертывание завершается с ошибкой квоты
**Решения:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна в регионе
**Симптомы:** Ошибки ответов AI или ошибки развертывания модели
**Решения:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблема 3: Проблемы с разрешениями
**Симптомы:** Ошибки 403 Forbidden при вызове AI-сервисов
**Решения:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблемы с производительностью

#### Проблема 4: Медленные ответы AI
**Шаги для расследования:**
1. Проверьте метрики производительности в Application Insights
2. Просмотрите метрики сервиса OpenAI в портале Azure
3. Убедитесь в сетевой доступности и низкой задержке

**Решения:**
- Реализуйте кэширование для часто используемых запросов
- Используйте подходящую модель OpenAI для вашего случая
- Рассмотрите использование реплик для высокой нагрузки

### **Практическое задание 6.1: Задача по отладке**

**Сценарий**: Развертывание прошло успешно, но приложение возвращает ошибки 500.

**Задачи для отладки:**
1. Проверьте журналы приложения
2. Убедитесь в подключении сервисов
3. Протестируйте аутентификацию
4. Проверьте конфигурацию

**Инструменты для использования:**
- `azd show` для обзора развертывания
- Портал Azure для подробных журналов сервисов
- Application Insights для телеметрии приложения

## Модуль 7: Мониторинг и оптимизация

### Шаг 7.1: Настройка комплексного мониторинга

1. **Создайте пользовательские панели мониторинга:**

Перейдите в портал Azure и создайте панель с:
- Количеством запросов и задержкой OpenAI
- Уровнем ошибок приложения
- Использованием ресурсов
- Отслеживанием затрат

2. **Настройте оповещения:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Шаг 7.2: Оптимизация затрат

1. **Анализ текущих затрат:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Реализуйте контроль затрат:**
- Настройте оповещения о бюджете
- Используйте политики авто-масштабирования
- Реализуйте кэширование запросов
- Отслеживайте использование токенов для OpenAI

### **Практическое задание 7.1: Оптимизация производительности**

**Задача**: Оптимизируйте ваше AI-приложение для производительности и затрат.

**Метрики для улучшения:**
- Сократите среднее время ответа на 20%
- Сократите ежемесячные затраты на 15%
- Поддерживайте доступность на уровне 99.9%

**Стратегии для проб:**
- Реализуйте кэширование ответов
- Оптимизируйте подсказки для эффективности токенов
- Используйте подходящие вычислительные SKUs
- Настройте правильное авто-масштабирование

## Финальный вызов: Реализация от начала до конца

### Сценарий вызова

Вам поручено создать готовый к продакшену AI-чатбот для обслуживания клиентов с такими требованиями:

**Функциональные требования:**
- Веб-интерфейс для взаимодействия с клиентами
- Интеграция с Azure OpenAI для ответов
- Возможность поиска документов с помощью Cognitive Search
- Интеграция с существующей базой данных клиентов
- Поддержка нескольких языков

**Нефункциональные требования:**
- Обработка 1000 одновременных пользователей
- SLA доступности 99.9%
- Соответствие SOC 2
- Затраты менее $500/месяц
- Развертывание в нескольких окружениях (разработка, тестирование, продакшен)

### Шаги реализации

1. **Спроектируйте архитектуру**
2. **Создайте шаблон AZD**
3. **Реализуйте меры безопасности**
4. **Настройте мониторинг и оповещения**
5. **Создайте конвейеры развертывания**
6. **Документируйте решение**

### Критерии оценки

- ✅ **Функциональность**: Соответствует ли всем требованиям?
- ✅ **Безопасность**: Реализованы ли лучшие практики?
- ✅ **Масштабируемость**: Может ли справляться с нагрузкой?
- ✅ **Поддерживаемость**: Хорошо ли организованы код и инфраструктура?
- ✅ **Затраты**: Укладывается ли в бюджет?

## Дополнительные ресурсы

### Документация Microsoft
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документация Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документация Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Примерные шаблоны
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурсы сообщества
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат о завершении
Поздравляем! Вы завершили лабораторный практикум AI Workshop. Теперь вы должны уметь:

- ✅ Преобразовывать существующие AI-приложения в шаблоны AZD
- ✅ Развертывать AI-приложения, готовые к работе в продакшене
- ✅ Реализовывать лучшие практики безопасности для AI-нагрузок
- ✅ Мониторить и оптимизировать производительность AI-приложений
- ✅ Устранять распространенные проблемы при развертывании

### Следующие шаги
1. Примените эти шаблоны к своим собственным AI-проектам
2. Вносите шаблоны обратно в сообщество
3. Присоединяйтесь к Discord-сообществу Azure AI Foundry для постоянной поддержки
4. Изучите продвинутые темы, такие как развертывание в нескольких регионах

---

**Обратная связь по воркшопу**: Помогите нам улучшить этот воркшоп, поделившись своим опытом в [канале #Azure Discord-сообщества Azure AI Foundry](https://discord.gg/microsoft-azure).

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом AI
- **⬅️ Предыдущая**: [Развертывание AI-моделей](ai-model-deployment.md)
- **➡️ Следующая**: [Лучшие практики для AI в продакшене](production-ai-practices.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

**Нужна помощь?** Присоединяйтесь к нашему сообществу для поддержки и обсуждений по AZD и развертыванию AI.

---

