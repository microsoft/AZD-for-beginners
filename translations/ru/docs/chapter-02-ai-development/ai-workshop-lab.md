# Лабораторная работа AI Workshop: Делайте ваши AI-решения готовыми к развертыванию с AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - AI-первичный подход к разработке
- **⬅️ Предыдущая**: [Развертывание AI модели](ai-model-deployment.md)
- **➡️ Следующая**: [Лучшие практики для production AI](production-ai-practices.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Обзор лабораторной работы

Эта практическая лабораторная работа проводит разработчиков через процесс использования существующего AI шаблона и развертывания его с помощью Azure Developer CLI (AZD). Вы научитесь основным паттернам для production-развертываний AI с использованием сервисов Microsoft Foundry.

> **Примечание по проверке (2026-03-25):** Эта лабораторная проверена с версией `azd` `1.23.12`. Если ваша локальная установка старше, обновите AZD перед началом, чтобы аутентификация, шаблоны и процесс развертывания соответствовали приведённым ниже шагам.

**Длительность:** 2-3 часа  
**Уровень:** Средний  
**Требования:** Базовые знания Azure, знакомство с концепциями AI/ML

## 🎓 Цели обучения

К концу лабораторной работы вы сможете:
- ✅ Конвертировать существующее AI-приложение для использования шаблонов AZD
- ✅ Настроить сервисы Microsoft Foundry с помощью AZD
- ✅ Реализовать безопасное управление учетными данными для AI сервисов
- ✅ Развернуть AI-приложения, готовые для production, с мониторингом
- ✅ Устранять распространённые проблемы развертывания AI

## Требования

### Необходимые инструменты
- Установленный [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Установленный [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Установленный [Git](https://git-scm.com/)
- Редактор кода (рекомендуется VS Code)

### Ресурсы Azure
- Подписка Azure с правами участника (contributor)
- Доступ к сервисам Microsoft Foundry Models (или возможность запросить доступ)
- Права на создание группы ресурсов

### Требуемые знания
- Базовое понимание сервисов Azure
- Знание работы с интерфейсом командной строки
- Основы AI/ML (API, модели, промпты)

## Настройка лабораторной работы

### Шаг 1: Подготовка окружения

1. **Проверьте установленные инструменты:**
```bash
# Проверьте установку AZD
azd version

# Проверьте Azure CLI
az --version

# Войдите в Azure для рабочих процессов AZD
azd auth login

# Войдите в Azure CLI только если планируете запускать команды az во время диагностики
az login
```

Если вы работаете в нескольких тенантах или ваша подписка не определяется автоматически, повторите вход с помощью `azd auth login --tenant-id <tenant-id>`.

2. **Клонируйте репозиторий лабораторной работы:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модуль 1: Понимание структуры AZD для AI приложений

### Анатомия AI-шаблона AZD

Изучите ключевые файлы в AI-шаблоне, готовом к работе с AZD:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Практическое задание 1.1: Изучение конфигурации**

1. **Рассмотрите файл azure.yaml:**
```bash
cat azure.yaml
```

**На что обратить внимание:**
- Определения сервисов для AI-компонентов
- Отображения переменных окружения
- Настройки хостов

2. **Просмотрите основную инфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Основные AI-паттерны для распознавания:**
- Развёртывание сервиса Microsoft Foundry Models
- Интеграция с Azure AI Search
- Безопасное управление ключами
- Настройки сетевой безопасности

### **Тема для обсуждения:** Почему эти паттерны важны для AI

- **Зависимости сервисов**: AI-приложения часто требуют координации множества сервисов
- **Безопасность**: API-ключи и конечные точки требуют надёжного хранения
- **Масштабируемость**: AI-нагрузки имеют уникальные требования к масштабированию
- **Управление затратами**: AI-сервисы могут быть дорогими при неправильных настройках

## Модуль 2: Развертывание вашего первого AI-приложения

### Шаг 2.1: Инициализация окружения

1. **Создайте новое окружение AZD:**
```bash
azd env new myai-workshop
```

2. **Установите необходимые параметры:**
```bash
# Установите предпочитаемый регион Azure
azd env set AZURE_LOCATION eastus

# Необязательно: Установите конкретную модель OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Шаг 2.2: Развёртывание инфраструктуры и приложения

1. **Развёртывание с AZD:**
```bash
azd up
```

**Что происходит при `azd up`:**
- ✅ Развёртывается сервис Microsoft Foundry Models
- ✅ Создаётся служба Azure AI Search
- ✅ Настраивается App Service для веб-приложения
- ✅ Конфигурируется сеть и безопасность
- ✅ Развёртывается код приложения
- ✅ Настраивается мониторинг и логирование

2. **Отслеживайте ход развертывания** и обращайте внимание на создаваемые ресурсы.

### Шаг 2.3: Проверка развертывания

1. **Проверьте созданные ресурсы:**
```bash
azd show
```

2. **Откройте развернутое приложение:**
```bash
azd show
```

Откройте веб-адрес, указанный в выводе `azd show`.

3. **Протестируйте AI-функциональность:**
   - Перейдите в веб-приложение
   - Попробуйте примерные запросы
   - Убедитесь, что AI отвечает корректно

### **Практическое задание 2.1: Практика устранения неполадок**

**Сценарий**: Развертывание прошло успешно, но AI не отвечает.

**Распространённые причины для проверки:**
1. **API-ключи OpenAI**: Проверьте их правильность
2. **Доступность модели**: Убедитесь, что модель поддерживается в вашем регионе
3. **Сетевое соединение**: Проверьте, что сервисы могут взаимодействовать
4. **RBAC разрешения**: Убедитесь, что приложение имеет доступ к OpenAI

**Команды для отладки:**
```bash
# Проверить переменные окружения
azd env get-values

# Просмотреть журналы развертывания
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверить статус развертывания OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модуль 3: Настройка AI-приложений под ваши нужды

### Шаг 3.1: Изменение конфигурации AI

1. **Обновите модель OpenAI:**
```bash
# Измените на другую модель (если доступна в вашем регионе)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Перепубликуйте с новой конфигурацией
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

### Шаг 3.2: Конфигурации для конкретных окружений

**Лучшая практика**: Различные конфигурации для разработки и production.

1. **Создайте production-окружение:**
```bash
azd env new myai-production
```

2. **Задайте параметры для production:**
```bash
# В производстве обычно используются более высокие артикулы
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Включить дополнительные функции безопасности
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Практическое задание 3.1: Оптимизация затрат**

**Задача**: Настроить шаблон для минимальных затрат в разработке.

**Задачи:**
1. Определите, какие SKU можно перевести в бесплатные/базовые уровни
2. Настройте переменные окружения для минимальных расходов
3. Разверните и сравните затраты с production-конфигурацией

**Подсказки:**
- Используйте F0 (бесплатный) уровень для Azure AI Services, где возможно
- В разработке используйте базовый уровень для Search Service
- Рассмотрите использование consumption-плана для Functions

## Модуль 4: Безопасность и лучшие практики для production

### Шаг 4.1: Безопасное управление учетными данными

**Текущая проблема**: Многие AI-приложения хранят API-ключи в коде или небезопасным способом.

**Решение AZD**: Управляемые учетные записи (Managed Identity) + интеграция с Key Vault.

1. **Проверьте конфигурацию безопасности в вашем шаблоне:**
```bash
# Поиск конфигурации Key Vault и управляемой идентичности
grep -r "keyVault\|managedIdentity" infra/
```

2. **Убедитесь, что Managed Identity работает:**
```bash
# Проверьте, что веб-приложение имеет правильную конфигурацию идентичности
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Шаг 4.2: Сетевая безопасность

1. **Включите private endpoints** (если ещё не настроены):

Добавьте в ваш bicep-шаблон:
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
# Application Insights должен быть настроен автоматически
# Проверьте конфигурацию:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Добавьте AI-специфичный мониторинг:**

Добавьте кастомные метрики для AI операций:
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

**Задача**: Проверьте развертывание на соответствие лучшим практикам безопасности.

**Чеклист:**
- [ ] Отсутствие захардкоженных секретов в коде и конфигурации
- [ ] Используется Managed Identity для аутентификации сервисов
- [ ] Ключи и конфигурация хранятся в Key Vault
- [ ] Сетевой доступ ограничен корректно
- [ ] Включен мониторинг и логирование

## Модуль 5: Конвертация вашего собственного AI-приложения

### Шаг 5.1: Оценочный лист

**Перед конвертацией приложения** ответьте на вопросы:

1. **Архитектура приложения:**
   - Какие AI-сервисы использует ваше приложение?
   - Какие вычислительные ресурсы требуются?
   - Нужна ли база данных?
   - Какие зависимости между сервисами?

2. **Требования к безопасности:**
   - Какие конфиденциальные данные обрабатывает приложение?
   - Какие требования по соответствию стандартам?
   - Нужна ли приватная сеть?

3. **Требования к масштабированию:**
   - Какова ожидаемая нагрузка?
   - Нужно ли авто-масштабирование?
   - Есть ли региональные ограничения?

### Шаг 5.2: Создайте ваш AZD шаблон

**Следуйте шаблону для конвертации приложения:**

1. **Создайте базовую структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Инициализировать шаблон AZD
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

**infra/main.bicep** - основной шаблон:
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

**infra/modules/openai.bicep** - модуль OpenAI:
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

### **Практическое задание 5.1: Задача на создание шаблона**

**Задача**: Создайте AZD шаблон для AI-приложения по обработке документов.

**Требования:**
- Microsoft Foundry Models для анализа контента
- Document Intelligence для OCR
- Учётная запись хранения для загрузки документов
- Function App для логики обработки
- Веб-приложение для интерфейса пользователя

**Бонусные баллы:**
- Добавьте обработку ошибок
- Включите оценку затрат
- Настройте панели мониторинга

## Модуль 6: Устранение распространённых проблем

### Распространённые проблемы развертывания

#### Проблема 1: Превышена квота сервиса OpenAI  
**Симптомы:** Развертывание завершается ошибкой квоты  
**Решения:**
```bash
# Проверьте текущие квоты
az cognitiveservices usage list --location eastus

# Запросите увеличение квоты или попробуйте другой регион
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблема 2: Модель недоступна в регионе  
**Симптомы:** AI не отвечает или ошибки развертывания моделей  
**Решения:**
```bash
# Проверить доступность модели по региону
az cognitiveservices model list --location eastus

# Обновить до доступной модели
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблема 3: Проблемы с разрешениями  
**Симптомы:** Ошибки 403 Forbidden при вызове AI-сервисов  
**Решения:**
```bash
# Проверить назначения ролей
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Добавить отсутствующие роли
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
3. Проверьте сетевое соединение и задержки

**Решения:**
- Внедрите кэширование для частых запросов
- Используйте подходящую модель OpenAI для задач
- Рассмотрите использование реплик только для чтения при высокой нагрузке

### **Практическое задание 6.1: Задача на отладку**

**Сценарий**: Развертывание прошло, но приложение возвращает ошибки 500.

**Задачи для отладки:**
1. Проверьте логи приложения
2. Убедитесь в доступности сервисов
3. Протестируйте аутентификацию
4. Проверьте конфигурации

**Инструменты для использования:**
- `azd show` — обзор развертывания
- Портал Azure для детальных логов сервисов
- Application Insights для телеметрии приложения

## Модуль 7: Мониторинг и оптимизация

### Шаг 7.1: Настройка комплексного мониторинга

1. **Создание кастомных панелей мониторинга:**

Перейдите в портал Azure и создайте дашборд с:
- Количеством запросов и задержкой OpenAI
- Уровнем ошибок приложения
- Использованием ресурсов
- Отслеживанием затрат

2. **Настройте оповещения:**
```bash
# Оповещение о высоком уровне ошибок
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
# Используйте Azure CLI для получения данных о расходах
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Реализация контроля затрат:**
- Настройте бюджетные оповещения
- Используйте политики автоскейлинга
- Реализуйте кэширование запросов
- Контролируйте использование токенов OpenAI

### **Практическое задание 7.1: Оптимизация производительности**

**Задача**: Оптимизируйте AI-приложение для повышения производительности и снижения затрат.

**Метрики для улучшения:**
- Снизить среднее время отклика на 20%
- Снизить ежемесячные расходы на 15%
- Поддерживать 99.9% времени безотказной работы

**Стратегии для попытки:**
- Внедрение кэширования ответов
- Оптимизация промптов для экономии токенов
- Использование подходящих SKU вычислений
- Корректная настройка автоскейлинга

## Финальное задание: Полная реализация

### Сценарий задания

Ваша задача — создать готового к production чат-бота для обслуживания клиентов на основе AI с этими требованиями:

**Функциональные требования:**
- Веб-интерфейс для взаимодействия с клиентами
- Интеграция с Microsoft Foundry Models для генерации ответов
- Возможность поиска документов с использованием Azure AI Search
- Интеграция с существующей базой клиентов
- Поддержка нескольких языков

**Нефункциональные требования:**
- Обработка 1000 одновременных пользователей
- SLA с 99.9% времени доступности
- Соответствие SOC 2
- Затраты не более $500 в месяц
- Развёртывание в нескольких окружениях (dev, staging, prod)

### Этапы реализации

1. Разработайте архитектуру
2. Создайте AZD шаблон
3. Реализуйте меры безопасности
4. Настройте мониторинг и оповещения
5. Создайте пайплайны для развертывания
6. Документируйте решение

### Критерии оценки

- ✅ **Функциональность**: Выполняет ли все требования?
- ✅ **Безопасность**: Реализованы ли лучшие практики?
- ✅ **Масштабируемость**: Готово ли к нагрузке?
- ✅ **Поддерживаемость**: Хорошо ли организован код и инфраструктура?
- ✅ **Затраты**: Соответствует ли бюджету?

## Дополнительные ресурсы

### Документация Microsoft
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документация Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документация Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Примерные шаблоны
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурсы сообщества
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат о завершении

Поздравляем! Вы завершили лабораторную работу AI Workshop. Теперь вы должны уметь:

- ✅ Преобразовывать существующие AI-приложения в шаблоны AZD
- ✅ Развертывать AI-приложения, готовые к использованию в продакшене
- ✅ Внедрять лучшие практики безопасности для AI-нагрузок
- ✅ Отслеживать и оптимизировать производительность AI-приложений
- ✅ Устранять распространённые проблемы при развертывании

### Следующие шаги
1. Примените эти шаблоны в своих собственных AI-проектах
2. Внесите шаблоны обратно в сообщество
3. Присоединяйтесь к Microsoft Foundry Discord для постоянной поддержки
4. Изучайте продвинутые темы, такие как развертывание в нескольких регионах

---

**Отзывы о мастер-классе**: Помогите нам улучшить этот мастер-класс, поделившись своим опытом в канале [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Глава 2 – Разработка с приоритетом AI
- **⬅️ Предыдущая**: [Развертывание AI-моделей](ai-model-deployment.md)
- **➡️ Следующая**: [Лучшие практики AI в продакшене](production-ai-practices.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нужна помощь?** Присоединяйтесь к нашему сообществу для поддержки и обсуждений по AZD и развертыванию AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->