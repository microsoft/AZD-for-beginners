# 5. Персонализиране на шаблон

!!! tip "В КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕШ"

    - [ ] Разгледали сте стандартните възможности на AI агента
    - [ ] Добавили сте AI Search със собствен индекс
    - [ ] Активирали сте и анализирали метриките за трасировка
    - [ ] Пуснали сте изпълнение за оценка
    - [ ] Пуснали сте red‑teaming сканиране
    - [ ] **Лаборатория 5: Изградили сте план за персонализиране** 

---

## 5.1 Възможности на AI агента

!!! success "Завършихме това в Лаборатория 01"

- **File Search**: OpenAI's built-in file search for knowledge retrieval
- **Citations**: Automatic source attribution in responses
- **Customizable Instructions**: Modify agent behavior and personality
- **Tool Integration**: Extensible tool system for custom capabilities

---

## 5.2 Опции за извличане на знания

!!! task "За да завършим това, трябва да направим промени и да разположим отново"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Вградено в Foundry Agents
- Автоматична обработка и индексиране на документи
- Не се изисква допълнителна конфигурация

**Azure AI Search (Optional):**

- Хибридно семантично и векторно търсене
- Управление на потребителски индекси
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
- Проследяване на заявки/отговори
- Метрики за производителност
- Налични в портала Microsoft Foundry

**Логване:**

- Логове на приложенията в Container Apps
- Структурирано логване с идентификатори за корелация
- Преглед на логове в реално време и исторически

---

## 5.4 [Оценка на агента](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локална оценка:**

- Вградени оценители за оценка на качеството
- Персонализирани скриптове за оценка
- Бенчмаркинг на производителността

**Непрекъснат мониторинг:**

- Автоматична оценка на живи интеракции
- Проследяване на метрики за качество
- Откриване на регресии в производителността

**Интеграция CI/CD:**

- Работен процес в GitHub Actions
- Автоматизирано тестване и оценка
- Статистически сравнителни тестове

---

## 5.5 [AI Red Teaming агент](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Автоматизирано сканиране за сигурност
- Оценка на риска за AI системи
- Оценка на безопасността в различни категории

**Аутентикация:**

- Managed Identity за Azure услуги
- По избор: удостоверяване на Azure App Service
- Резервна basic auth опция за разработка



!!! quote "В КРАЯ НА ТАЗИ ЛАБОРАТОРИЯ ТРЯБВА ДА ИМАТЕ"
    - [ ] Определили сте изискванията на вашия сценарий
    - [ ] Персонализирани променливи на средата (конфигурация)
    - [ ] Персонализирани инструкции за агента (задача)
    - [ ] Разположили сте персонализирания шаблон (приложение)
    - [ ] Завършили сте задачи след разполагането (ръчно)
    - [ ] Извършили сте тестова оценка

Този пример демонстрира персонализиране на шаблона за корпоративен търговски случай с два специализирани агента и множество разполагания на модели.

---

## 5.6 Персонализирайте го за вас!

### 5.6.1. Изисквания на сценария

#### **Разполагания на агенти:** 

   - Shopper Agent: Помага на клиентите да намират и сравняват продукти
   - Loyalty Agent: Управлява наградите и промоциите за клиенти

#### **Разполагания на модели:**

   - `gpt-4.1`: Основен чат модел
   - `o3`: Модел за логическо разсъждение при сложни заявки
   - `gpt-4.1-nano`: Лек модел за прости взаимодействия
   - `text-embedding-3-large`: Висококачествени вграждания за търсене

#### **Функции:**

   - Включено проследяване и мониторинг
   - AI Search за продуктов каталог
   - Рамка за оценка за осигуряване на качество
   - Red teaming за валидация на сигурността

---

### 5.6.2 Имплементация на сценария


#### 5.6.2.1. Конфигурация преди разполагане

Създайте скрипт за настройка (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Задайте име на средата
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Конфигурирайте регион (изберете в зависимост от наличността на моделите)
azd env set AZURE_LOCATION "eastus2"

# Активирайте всички незадължителни услуги
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Конфигурирайте основния чат модел (gpt-4o като най-близък наличен до gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Конфигурирайте модел за вграждане за подобрено търсене
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Задайте име на агента (ще създаде първия агент)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Конфигурирайте индекс за търсене
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Инструкции за агента

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

# Проверете предварителните изисквания
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Настройте средата
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Проверете квотата в избрания регион
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

# Разгърнете инфраструктурата и приложението
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Запишете изходните резултати от разгръщането
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Вземете URL адреса на уеб приложението
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

#### 5.6.2.4: Конфигурация след разполагане

Създайте `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Вземете информация за разгръщането
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Инструкции за ръчна конфигурация
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

### 5.6.3: Тестване и валидация

Създайте `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Проверете дали променливите на средата са зададени
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Проверете наличността на уеб приложението
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

# Извършете оценка, ако е конфигурирана
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

### 5.6.4 Очаквани резултати

Следвайки това ръководство за имплементация, ще имате:

1. **Разположена инфраструктура:**

      - Microsoft Foundry проект с разполагания на модели
      - Container Apps, хостващи уеб приложението
      - AI Search услуга за продуктов каталог
      - Application Insights за наблюдение

2. **Първоначален агент:**

      - Shopper Agent конфигуриран с основни инструкции
      - Включена възможност за търсене във файлове
      - Конфигурирано проследяване и мониторинг

3. **Готово за персонализиране:**

      - Рамка за добавяне на Loyalty Agent
      - Шаблони за персонализирани инструкции
      - Скриптове за тестване и валидация
      - Настройка за мониторинг и оценка

4. **Готовност за продукция:**

      - Сканиране за сигурност с red teaming
      - Мониторинг на производителността
      - Рамка за оценка на качеството
      - Скалираща се архитектура

Този пример демонстрира как AZD шаблонът може да бъде разширен и персонализиран за конкретни корпоративни сценарии, като същевременно се спазват добрите практики за сигурност, мониторинг и мащабируемост.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен чрез автоматизирана услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от човешки преводач. Не носим отговорност за никакви недоразумения или погрешни тълкувания, възникнали в резултат на използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->