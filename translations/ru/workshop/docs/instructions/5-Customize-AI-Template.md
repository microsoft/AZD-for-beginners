# 5. Настройка шаблона

!!! tip "К КОНЦУ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Ознакомиться с возможностями ИИ-агента по умолчанию
    - [ ] Добавить AI Search с вашим собственным индексом
    - [ ] Активировать и проанализировать метрики трассировки
    - [ ] Выполнить тестовый запуск оценки
    - [ ] Провести проверку с использованием red-teaming
    - [ ] **Лабораторная работа 5: Создать план настройки**

---

## 5.1 Возможности ИИ-агента

!!! success "Мы выполнили это в Лабораторной работе 01"

- **Поиск по файлам**: Встроенный поиск файлов OpenAI для извлечения знаний
- **Цитирование**: Автоматическое указание источников в ответах
- **Настраиваемые инструкции**: Изменение поведения и личности агента
- **Интеграция инструментов**: Расширяемая система инструментов для пользовательских возможностей

---

## 5.2 Варианты извлечения знаний

!!! task "Для завершения необходимо внести изменения и развернуть заново"    
    
    ```bash title=""
    # Установить переменные окружения
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Загрузить данные и создать мой индекс

    ```

---

**OpenAI File Search (по умолчанию):**

- Встроено в Foundry Agents
- Автоматическая обработка и индексирование документов
- Дополнительная настройка не требуется

**Azure AI Search (опционально):**

- Гибридный семантический и векторный поиск
- Управление пользовательским индексом
- Расширенные возможности поиска
- Требуется `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Трассировка и мониторинг](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Для завершения необходимо внести изменения и развернуть заново"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Трассировка:**

- Интеграция с OpenTelemetry
- Отслеживание запросов и ответов
- Метрики производительности
- Доступно в портале Microsoft Foundry

**Логирование:**

- Логи приложений в Container Apps
- Структурированное логирование с корреляционными ID
- Просмотр логов в режиме реального времени и исторически

---

## 5.4 [Оценка агента](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локальная оценка:**

- Встроенные оценщики для проверки качества
- Пользовательские скрипты оценки
- Производительное тестирование

**Непрерывный мониторинг:**

- Автоматическая оценка живых взаимодействий
- Отслеживание метрик качества
- Обнаружение регрессий производительности

**Интеграция CI/CD:**

- Workflow GitHub Actions
- Автоматизированное тестирование и оценка
- Статистическое тестирование сравнений

---

## 5.5 [ИИ Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**ИИ Red Teaming:**

- Автоматизированное сканирование безопасности
- Оценка рисков для ИИ-систем
- Оценка безопасности по нескольким категориям

**Аутентификация:**

- Управляемая идентификация для Azure-сервисов
- Опциональная аутентификация Azure App Service
- Запасная базовая аутентификация для разработки

!!! quote "К КОНЦУ ЭТОЙ ЛАБОРАТОРНОЙ РАБОТЫ У ВАС ДОЛЖНО БЫТЬ"
    - [ ] Определены требования сценария
    - [ ] Настроены переменные окружения (config)
    - [ ] Настроены инструкции агента (task)
    - [ ] Развернут кастомизированный шаблон (app)
    - [ ] Выполнены действия после развертывания (manual)
    - [ ] Запущен тест оценки

Этот пример демонстрирует настройку шаблона для корпоративного использования в розничной торговле с двумя специализированными агентами и несколькими развертываниями моделей.

---

## 5.6 Настройте его для себя!

### 5.6.1. Требования сценария

#### **Развертывания агентов:** 

   - Shopper Agent: Помогает клиентам искать и сравнивать продукты
   - Loyalty Agent: Управляет программами лояльности и акциями клиентов

#### **Развертывания моделей:**

   - `gpt-4.1`: Основная модель для чата
   - `o3`: Модель рассуждения для сложных запросов
   - `gpt-4.1-nano`: Легковесная модель для простых взаимодействий
   - `text-embedding-3-large`: Высококачественные эмбеддинги для поиска

#### **Особенности:**

   - Включены трассировка и мониторинг
   - AI Search для каталога продуктов
   - Фреймворк оценки для контроля качества
   - Red teaming для проверки безопасности

---

### 5.6.2 Реализация сценария


#### 5.6.2.1. Конфигурация перед развертыванием

Создайте скрипт настройки (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Установить имя окружения
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Настроить регион (выберите в зависимости от доступности модели)
azd env set AZURE_LOCATION "eastus2"

# Включить все необязательные службы
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Настроить основную модель чата (gpt-4.1 как ближайшая доступная к gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Настроить модель эмбеддинга для улучшенного поиска
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Установить имя агента (создаст первого агента)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Настроить индекс поиска
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Инструкции для агентов

Создайте `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Создайте `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Скрипт развертывания

Создайте `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Проверка предварительных условий
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Настройка окружения
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Проверка квоты в выбранном регионе
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Развертывание инфраструктуры и приложения
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Сохранение результатов развертывания
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Получение URL веб-приложения
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Конфигурация после развертывания

Создайте `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Получить информацию о развертывании
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Инструкции для ручной настройки
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Тестирование и проверка

Создайте `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Проверить, что переменные среды установлены
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Проверить доступность веб-приложения
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Запустить оценку, если настроено
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Ожидаемые результаты

После выполнения этого руководства по реализации у вас будет:

1. **Развернутая инфраструктура:**

      - Проект Microsoft Foundry с развертываниями моделей
      - Container Apps с размещенным веб-приложением
      - Сервис AI Search для каталога продуктов
      - Application Insights для мониторинга

2. **Начальный агент:**

      - Shopper Agent с базовыми инструкциями
      - Включенная возможность поиска по файлам
      - Настроенная трассировка и мониторинг

3. **Готовность к настройке:**

      - Фреймворк для добавления Loyalty Agent
      - Шаблоны пользовательских инструкций
      - Скрипты для тестирования и проверки
      - Настройка мониторинга и оценки

4. **Готовность к производству:**

      - Сканирование безопасности с red teaming
      - Мониторинг производительности
      - Фреймворк для оценки качества
      - Масштабируемая архитектура

Этот пример демонстрирует, как шаблон AZD можно расширять и настраивать для конкретных корпоративных сценариев, сохраняя лучшие практики по безопасности, мониторингу и масштабируемости.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать официальным источником. Для критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->