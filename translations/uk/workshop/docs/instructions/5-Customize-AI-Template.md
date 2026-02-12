# 5. Налаштування шаблону

!!! tip "НА КІНЕЦЬ ЦЬОГО МОДУЛЮ ВИ ЗМОЖЕТЕ"

    - [ ] Ознайомитись із стандартними можливостями AI-агента
    - [ ] Додати AI Пошук із власним індексом
    - [ ] Активувати та проаналізувати показники трасування
    - [ ] Виконати оцінювання
    - [ ] Виконати red-teaming сканування
    - [ ] **Лабораторна 5: Створити план налаштування** 

---

## 5.1 Можливості AI-агента

!!! success "Ми виконали це у Лабораторії 01"

- **Пошук у файлах**: Вбудований OpenAI пошук файлів для отримання знань
- **Цитування**: Автоматичне посилання на джерела у відповідях
- **Налаштовувані інструкції**: Зміна поведінки та особистості агента
- **Інтеграція інструментів**: Розширювана система інструментів для кастомних можливостей

---

## 5.2 Варіанти отримання знань

!!! task "Щоб виконати це, потрібно внести зміни та повторно розгорнути"    
    
    ```bash title=""
    # Встановити змінні середовища
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Завантажити дані та створити індекс

    ```

---

**OpenAI File Search (за замовчуванням):**

- Вбудовано у Foundry Agents
- Автоматична обробка документів і індексація
- Не потребує додаткового налаштування

**Azure AI Search (опційно):**

- Гібридний семантичний і векторний пошук
- Керування власними індексами
- Розширені можливості пошуку
- Вимагає `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Трасування та моніторинг](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Щоб виконати це, потрібно внести зміни та повторно розгорнути"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Трасування:**

- Інтеграція OpenTelemetry
- Відслідковування запитів/відповідей
- Показники продуктивності
- Доступно у порталі Microsoft Foundry

**Логування:**

- Логи додатку в Container Apps
- Структуроване логування з correlation ID
- Перегляд логів у реальному часі та історичних

---

## 5.4 [Оцінка агента](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локальна оцінка:**

- Вбудовані засоби оцінки якості
- Користувацькі скрипти оцінки
- Бенчмаркінг продуктивності

**Безперервний моніторинг:**

- Автоматична оцінка живих взаємодій
- Відстеження показників якості
- Виявлення регресії продуктивності

**Інтеграція CI/CD:**

- workflow GitHub Actions
- Автоматичне тестування та оцінка
- Статистичне порівняння для тестів

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Автоматизоване сканування безпеки
- Оцінка ризиків AI-систем
- Оцінка безпеки за кількома категоріями

**Аутентифікація:**

- Managed Identity для Azure сервісів
- Опційна аутентифікація Azure App Service
- Fallback базової аутентифікації для розробки



!!! quote "НА КІНЕЦЬ ЦЬОЇ ЛАБОРАТОРНОЇ ВИ МАЄТЕ"
    - [ ] Визначити вимоги сценарію
    - [ ] Налаштувати змінні середовища (конфіг)
    - [ ] Налаштувати інструкції агента (завдання)
    - [ ] Розгорнути налаштований шаблон (додаток)
    - [ ] Виконати завдання після розгортання (вручну)
    - [ ] Запустити тестову оцінку

Цей приклад демонструє налаштування шаблону для корпоративного рітейл-сценарію з двома спеціалізованими агентами і кількома розгортаннями моделей.

---

## 5.6 Налаштуйте його для себе!

### 5.6.1. Вимоги сценарію

#### **Розгортання агентів:** 

   - Shopper Agent: Допомагає клієнтам знаходити та порівнювати товари
   - Loyalty Agent: Керує бонусами та акціями для клієнтів

#### **Розгортання моделей:**

   - `gpt-4.1`: Основна чат-модель
   - `o3`: Модель логічного виведення для складних запитів
   - `gpt-4.1-nano`: Легка модель для простих взаємодій
   - `text-embedding-3-large`: Високоякісні ембеддинги для пошуку

#### **Функції:**

   - Включене трасування та моніторинг
   - AI Пошук для каталогу продуктів
   - Фреймворк оцінювання для забезпечення якості
   - Red teaming для перевірки безпеки

---

### 5.6.2 Впровадження сценарію


#### 5.6.2.1. Конфігурація перед розгортанням

Створити скрипт налаштування (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Встановити ім'я оточення
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Налаштувати регіон (вибрати залежно від доступності моделі)
azd env set AZURE_LOCATION "eastus2"

# Увімкнути всі необов’язкові сервіси
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Налаштувати основну модель чат-бота (gpt-4o як найближча до gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Налаштувати модель вбудовування для покращеного пошуку
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Встановити ім'я агента (створить першого агента)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Налаштувати індекс пошуку
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Інструкції агента

Створити `custom-agents/shopper-agent-instructions.md`:

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

Створити `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Скрипт розгортання

Створити `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Перевірте попередні умови
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Налаштуйте середовище
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Перевірте квоту у вибраному регіоні
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

# Розгорніть інфраструктуру та додаток
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Отримайте результати розгортання
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Отримайте URL веб-додатка
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

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

#### 5.6.2.4: Конфігурація після розгортання

Створити `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Отримати інформацію про розгортання
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Інструкції для ручного налаштування
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

### 5.6.3: Тестування та валідація

Створити `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Перевірити, чи встановлені змінні середовища
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Перевірити доступність веб-застосунку
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

# Запустити оцінювання, якщо налаштовано
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

### 5.6.4 Очікувані результати

Після виконання цього керівництва ви отримаєте:

1. **Розгорнуту інфраструктуру:**

      - Проект Microsoft Foundry з розгортанням моделей
      - Container Apps із хостингом веб-додатку
      - Сервіс AI Search для каталогу продуктів
      - Application Insights для моніторингу

2. **Початковий агент:**

      - Shopper Agent, налаштований базовими інструкціями
      - Активована можливість пошуку у файлах
      - Налаштоване трасування та моніторинг

3. **Готовність до кастомізації:**

      - Фреймворк для додавання Loyalty Agent
      - Шаблони кастомних інструкцій
      - Скрипти тестування та валідації
      - Налаштування моніторингу та оцінювання

4. **Готовність до виробництва:**

      - Сканування безпеки з red teaming
      - Моніторинг продуктивності
      - Фреймворк оцінки якості
      - Масштабована архітектура

Цей приклад демонструє, як шаблон AZD можна розширити та налаштувати для конкретних корпоративних сценаріїв, підтримуючи кращі практики безпеки, моніторингу та масштабованості.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->