# 5. Персонализиране на шаблон

!!! tip "В КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ ДА"

    - [ ] Разгледате стандартните възможности на AI агент
    - [ ] Добавите AI търсене с ваш собствен индекс
    - [ ] Активирате и анализирате метрики за проследяване
    - [ ] Изпълните оценка на производителността
    - [ ] Проведете сканиране за уязвимости (red-teaming)
    - [ ] **Лаборатория 5: Създаване на план за персонализация**

---

## 5.1 Възможности на AI агент

!!! success "Завършихме това в Лаборатория 01"

- **Търсене на файлове**: Вградена функция на OpenAI за извличане на знания
- **Цитиране**: Автоматично приписване на източници в отговорите
- **Персонализирани инструкции**: Модифициране на поведението и личността на агента
- **Интеграция на инструменти**: Разширяема система за добавяне на персонализирани възможности

---

## 5.2 Опции за извличане на знания

!!! task "За да завършим това, трябва да направим промени и да разположим отново"    
    
    ```bash title=""
    # Задаване на променливи на средата
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Качване на данни и създаване на индекс

    ```

---

**Търсене на файлове в OpenAI (по подразбиране):**

- Вградено в услугата Azure AI Agent
- Автоматична обработка и индексиране на документи
- Не изисква допълнителна конфигурация

**Azure AI Search (по избор):**

- Хибридно семантично и векторно търсене
- Управление на персонализирани индекси
- Разширени възможности за търсене
- Изисква `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Проследяване и мониторинг](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "За да завършим това, трябва да направим промени и да разположим отново"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Проследяване:**

- Интеграция с OpenTelemetry
- Проследяване на заявки и отговори
- Метрики за производителност
- Налични в портала AI Foundry

**Логове:**

- Логове на приложенията в Container Apps
- Структурирано логване с корелационни идентификатори
- Преглед на логове в реално време и исторически данни

---

## 5.4 [Оценка на агента](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локална оценка:**

- Вградени инструменти за оценка на качеството
- Персонализирани скриптове за оценка
- Бенчмаркинг на производителността

**Непрекъснат мониторинг:**

- Автоматична оценка на взаимодействията в реално време
- Проследяване на метрики за качество
- Откриване на регресии в производителността

**Интеграция с CI/CD:**

- Работен процес с GitHub Actions
- Автоматизирано тестване и оценка
- Статистическо сравнение на тестове

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Автоматизирано сканиране за сигурност
- Оценка на рисковете за AI системи
- Проверка на безопасността в различни категории

**Автентикация:**

- Управлявана идентичност за Azure услуги
- Опционална автентикация чрез Azure App Service
- Резервна автентикация с основни данни за разработка

!!! quote "В КРАЯ НА ТАЗИ ЛАБОРАТОРИЯ ТРЯБВА ДА ИМАТЕ"
    - [ ] Определени изисквания за сценария
    - [ ] Персонализирани променливи на средата (конфигурация)
    - [ ] Персонализирани инструкции за агента (задача)
    - [ ] Разположен персонализиран шаблон (приложение)
    - [ ] Завършени задачи след разполагане (ръчно)
    - [ ] Проведено тестово оценяване

Този пример демонстрира персонализиране на шаблона за корпоративен сценарий в търговията на дребно с два специализирани агента и множество разположения на модели.

---

## 5.6 Персонализирайте го за вас!

### 5.6.1. Изисквания за сценария

#### **Разположения на агенти:** 

   - Агенти за пазаруване: Помага на клиентите да намират и сравняват продукти
   - Агенти за лоялност: Управлява награди и промоции за клиенти

#### **Разположения на модели:**

   - `gpt-4.1`: Основен модел за чат
   - `o3`: Модел за разсъждения при сложни запитвания
   - `gpt-4.1-nano`: Лек модел за прости взаимодействия
   - `text-embedding-3-large`: Висококачествени вграждания за търсене

#### **Функции:**

   - Активирано проследяване и мониторинг
   - AI търсене за продуктов каталог
   - Рамка за оценка на качеството
   - Проверка на сигурността чрез red-teaming

---

### 5.6.2 Имплементация на сценария

#### 5.6.2.1. Конфигурация преди разполагане

Създайте скрипт за настройка (`setup-retail.sh`)

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

#### 5.6.2.2: Инструкции за агенти

Създайте `custom-agents/shopper-agent-instructions.md`:

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

Създайте `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Скрипт за разполагане

Създайте `deploy-retail.sh`:

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

#### 5.6.2.4: Конфигурация след разполагане

Създайте `configure-retail-agents.sh`:

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

### 5.6.3: Тестване и валидиране

Създайте `test-retail-deployment.sh`:

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

### 5.6.4 Очаквани резултати

Следвайки това ръководство за имплементация, ще имате:

1. **Разположена инфраструктура:**

      - Проект AI Foundry с разположения на модели
      - Container Apps, хостващи уеб приложението
      - AI Search услуга за продуктов каталог
      - Application Insights за мониторинг

2. **Начален агент:**

      - Агенти за пазаруване, конфигурирани с основни инструкции
      - Активирана функция за търсене на файлове
      - Конфигурирано проследяване и мониторинг

3. **Готовност за персонализация:**

      - Рамка за добавяне на агенти за лоялност
      - Шаблони за персонализирани инструкции
      - Скриптове за тестване и валидиране
      - Настройка за мониторинг и оценка

4. **Готовност за продукция:**

      - Сканиране за сигурност чрез red-teaming
      - Мониторинг на производителността
      - Рамка за оценка на качеството
      - Скалируема архитектура

Този пример демонстрира как шаблонът AZD може да бъде разширен и персонализиран за специфични корпоративни сценарии, като същевременно се спазват най-добрите практики за сигурност, мониторинг и скалируемост.

---

