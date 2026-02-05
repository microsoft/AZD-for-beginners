# 5. Настройка шаблона

!!! tip "ПОСЛЕ ПРОХОЖДЕНИЯ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Изучить стандартные возможности AI-агента
    - [ ] Добавить AI-поиск с вашим собственным индексом
    - [ ] Активировать и проанализировать метрики трассировки
    - [ ] Выполнить оценочный запуск
    - [ ] Провести сканирование на уязвимости (red-teaming)
    - [ ] **Лабораторная работа 5: Создать план настройки**

---

## 5.1 Возможности AI-агента

!!! success "Мы завершили это в Лабораторной работе 01"

- **Поиск файлов**: Встроенный поиск файлов OpenAI для извлечения знаний
- **Цитирование**: Автоматическое указание источников в ответах
- **Настраиваемые инструкции**: Изменение поведения и характера агента
- **Интеграция инструментов**: Расширяемая система инструментов для добавления пользовательских возможностей

---

## 5.2 Варианты извлечения знаний

!!! task "Для выполнения этого шага необходимо внести изменения и повторно развернуть"    
    
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

**Поиск файлов OpenAI (по умолчанию):**

- Встроен в сервис Azure AI Agent
- Автоматическая обработка и индексация документов
- Не требует дополнительной настройки

**Azure AI Search (опционально):**

- Гибридный семантический и векторный поиск
- Управление пользовательскими индексами
- Расширенные возможности поиска
- Требует `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Трассировка и мониторинг](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Для выполнения этого шага необходимо внести изменения и повторно развернуть"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Трассировка:**

- Интеграция с OpenTelemetry
- Отслеживание запросов и ответов
- Метрики производительности
- Доступно в портале AI Foundry

**Логирование:**

- Логи приложений в Container Apps
- Структурированное логирование с идентификаторами корреляции
- Просмотр логов в реальном времени и исторических данных

---

## 5.4 [Оценка агента](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локальная оценка:**

- Встроенные инструменты для оценки качества
- Пользовательские скрипты для оценки
- Бенчмаркинг производительности

**Непрерывный мониторинг:**

- Автоматическая оценка взаимодействий в реальном времени
- Отслеживание метрик качества
- Обнаружение регрессии производительности

**Интеграция CI/CD:**

- Рабочий процесс GitHub Actions
- Автоматическое тестирование и оценка
- Статистическое сравнение результатов тестирования

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Автоматизированное сканирование безопасности
- Оценка рисков для AI-систем
- Проверка безопасности по нескольким категориям

**Аутентификация:**

- Управляемая идентификация для сервисов Azure
- Опциональная аутентификация через Azure App Service
- Резервная базовая аутентификация для разработки

!!! quote "ПОСЛЕ ПРОХОЖДЕНИЯ ЭТОЙ ЛАБОРАТОРНОЙ РАБОТЫ ВЫ ДОЛЖНЫ"

    - [ ] Определить требования сценария
    - [ ] Настроить переменные окружения (config)
    - [ ] Настроить инструкции агента (task)
    - [ ] Развернуть настроенный шаблон (app)
    - [ ] Завершить задачи после развертывания (manual)
    - [ ] Провести тестовую оценку

Этот пример демонстрирует настройку шаблона для корпоративного розничного сценария с двумя специализированными агентами и несколькими развертываниями моделей.

---

## 5.6 Настройте под себя!

### 5.6.1. Требования сценария

#### **Развертывание агентов:** 

   - Агент покупателя: помогает клиентам находить и сравнивать товары
   - Агент лояльности: управляет программами вознаграждений и акциями для клиентов

#### **Развертывание моделей:**

   - `gpt-4.1`: Основная модель для чата
   - `o3`: Модель для сложных запросов
   - `gpt-4.1-nano`: Легковесная модель для простых взаимодействий
   - `text-embedding-3-large`: Высококачественные эмбеддинги для поиска

#### **Функции:**

   - Включена трассировка и мониторинг
   - AI-поиск для каталога товаров
   - Оценочная структура для обеспечения качества
   - Red-teaming для проверки безопасности

---

### 5.6.2 Реализация сценария

#### 5.6.2.1. Конфигурация перед развертыванием

Создайте скрипт настройки (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
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

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
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

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
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
- Tracing: Available in AI Foundry > Tracing tab
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

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
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

# Run evaluation if configured
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
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Ожидаемые результаты

После выполнения этого руководства вы получите:

1. **Развернутую инфраструктуру:**

      - Проект AI Foundry с развернутыми моделями
      - Container Apps, хостинг веб-приложения
      - Сервис AI Search для каталога товаров
      - Application Insights для мониторинга

2. **Начального агента:**

      - Агент покупателя с базовыми инструкциями
      - Включена возможность поиска файлов
      - Настроена трассировка и мониторинг

3. **Готовность к настройке:**

      - Структура для добавления агента лояльности
      - Шаблоны пользовательских инструкций
      - Скрипты тестирования и проверки
      - Настройка мониторинга и оценки

4. **Готовность к производству:**

      - Сканирование безопасности с помощью red-teaming
      - Мониторинг производительности
      - Структура оценки качества
      - Масштабируемая архитектура

Этот пример демонстрирует, как шаблон AZD может быть расширен и настроен для конкретных корпоративных сценариев, сохраняя лучшие практики в области безопасности, мониторинга и масштабируемости.

---

