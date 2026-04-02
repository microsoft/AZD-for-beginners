# 5. Персонализиране на шаблон

!!! tip "В КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ ДА"

    - [ ] Изследвали сте стандартните възможности на AI агентите
    - [ ] Добавили сте AI Търсене с ваш собствен индекс
    - [ ] Активирали и анализирали сте метрики за трасировки
    - [ ] Изпълнили сте изпитателно изпълнение
    - [ ] Извършили сте ред тиминг сканиране
    - [ ] **Лаборатория 5: Създаване на План за Персонализация**

---

## 5.1 Възможности на AI агента

!!! success "Завършихме това в Лаборатория 01"

- **Търсене в файлове**: Вградената търсачка на OpenAI за извличане на знания
- **Цитиране**: Автоматично приписване на източници в отговорите
- **Персонализируеми инструкции**: Промяна на поведението и личността на агента
- **Интеграция с инструменти**: Разширяема система за добавяне на специализирани възможности

---

## 5.2 Опции за извличане на знание

!!! task "За да завършим това, трябва да направим промени и да повторим разгръщането"    
    
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

**OpenAI Търсене в файлове (по подразбиране):**

- Вградено в Foundry Agents
- Автоматична обработка и индексиране на документи
- Необходима е нула допълнителна конфигурация

**Azure AI Търсене (по избор):**

- Хибридно семантично и векторно търсене
- Управление на персонализирани индекси
- Разширени възможности за търсене
- Изисква `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Трасировки и мониторинг](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "За да завършим това, трябва да направим промени и да повторим разгръщането"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Трасиране:**

- Интеграция с OpenTelemetry
- Проследяване на заявки/отговори
- Метрики за производителност
- Налични в портала Microsoft Foundry

**Логване:**

- Логове на приложения в Container Apps
- Структурирано логване с корелационни идентификатори
- Преглед в реално време и исторически логове

---

## 5.4 [Оценка на агент](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локална оценка:**

- Вградени оценители за качествен анализ
- Потребителски скриптове за оценка
- Бенчмаркинг на производителността

**Непрекъснат мониторинг:**

- Автоматична оценка на живи интеракции
- Следене на качествени метрики
- Откриване на регресии в производителността

**Интеграция CI/CD:**

- Работен процес GitHub Actions
- Автоматизирано тестване и оценка
- Статистически сравнителни тестове

---

## 5.5 [Агенти за червен тиминг на AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Червен тиминг на AI:**

- Автоматизирано сканиране за сигурност
- Оценка на риска за AI системи
- Оценка на безопасността в няколко категории

**Удостоверяване:**

- Управлявана идентичност за Azure услуги
- По избор удостоверяване чрез Azure App Service
- Базова автентикация като резервен вариант за разработка

!!! quote "НА КРАЯ НА ТАЗИ ЛАБОРАТОРИЯ ТРЯБВА ДА ИМАТЕ"
    - [ ] Определени изисквания на вашия сценарий
    - [ ] Персонализирани променливи на средата (конфигурация)
    - [ ] Персонализирани инструкции за агентите (задачи)
    - [ ] Разгръната персонализирана шаблона (приложение)
    - [ ] Завършени задачи след разгръщане (ръчно)
    - [ ] Изпълнена тестова оценка

Този пример илюстрира персонализирането на шаблон за корпоративен търговски сценарий с двама специализирани агенти и няколко разгръщания на модели.

---

## 5.6 Персонализирайте го за Вас!

### 5.6.1. Изисквания на сценария

#### **Разгръщане на агенти:** 

   - Агент Купувач: Помага на клиентите да намират и сравняват продукти
   - Агент Лоялност: Управлява клиентски награди и промоции

#### **Разгръщане на модели:**

   - `gpt-4.1`: Основен чат модел
   - `o3`: Модел за анализ и разсъждения при сложни заявки
   - `gpt-4.1-nano`: Лекия модел за прости взаимодействия
   - `text-embedding-3-large`: Висококачествени embedding-и за търсене

#### **Функционалности:**

   - Активирано трасиране и мониторинг
   - AI Търсене в продуктов каталог
   - Рамка за оценка на качеството
   - Червен тиминг за валидиране на сигурността

---

### 5.6.2 Изпълнение на сценария


#### 5.6.2.1. Предварителна конфигурация

Създайте скрипт за настройка (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Задайте име на средата
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Конфигурирайте регион (изберете според наличността на модела)
azd env set AZURE_LOCATION "eastus2"

# Активирайте всички допълнителни услуги
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Конфигурирайте основния чат модел (gpt-4.1 като най-близък наличен до gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Конфигурирайте вграждащия модел за подобрено търсене
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

#### 5.6.2.2: Инструкции за агентите

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

#### 5.6.2.3: Скрипт за разгръщане

Създайте `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Проверете изискванията
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
echo "   - gpt-4.1: 150,000 TPM"
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

# Заснемете изходите от разгръщането
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Вземете URL адреса на уеб приложението
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

#### 5.6.2.4: Конфигурация след разгръщане

Създайте `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Вземи информация за разгръщането
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

### 5.6.3: Тестване и валидиране

Създайте `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Проверете дали променливите на средата са зададени
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Тествайте наличността на уеб приложението
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

# Изпълнете оценката, ако е конфигурирана
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

След като следвате това ръководство за изпълнение, вие ще имате:

1. **Разположена инфраструктура:**

      - Microsoft Foundry проект с разгръщане на модели
      - Container Apps, хостващи уеб приложението
      - AI Търсене услуга за продуктов каталог
      - Application Insights за мониторинг

2. **Начален агент:**

      - Агент Купувач, конфигуриран с основни инструкции
      - Активирана възможност за търсене в документи
      - Конфигурирано трасиране и мониторинг

3. **Готовност за персонализация:**

      - Рамка за добавяне на Агент Лоялност
      - Шаблони за персонализирани инструкции
      - Скриптове за тестване и валидиране
      - Настройка за мониторинг и оценяване

4. **Готовност за продукция:**

      - Сканиране за сигурност с червен тиминг
      - Мониторинг на производителността
      - Рамка за оценка на качеството
      - Масшабируема архитектура

Този пример демонстрира как шаблонът на AZD може да бъде разширен и персонализиран за специфични корпоративни сценарии, като същевременно се спазват най-добрите практики за сигурност, мониторинг и мащабируемост.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да било недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->