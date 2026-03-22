# 5. Настройване на шаблон

!!! tip "КЪМ КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ ДА"

    - [ ] Изследвахте възможностите на стандартния AI агент
    - [ ] Добавихте AI търсене с ваш собствен индекс
    - [ ] Активирахте и анализирахте метрики за проследяване (Tracing)
    - [ ] Изпълнихте оценъчен цикъл
    - [ ] Извършихте red-teaming сканиране
    - [ ] **Лаб 5: Създаване на план за персонализиране** 

---

## 5.1 AI Agent Capabilities

!!! success "Завършихме това в Лаб 01"

- **File Search**: Вградено търсене на файлове на OpenAI за извличане на знания
- **Citations**: Автоматично приписване на източници в отговорите
- **Customizable Instructions**: Промяна на поведението и личността на агента
- **Tool Integration**: Разширима система от инструменти за персонализирани възможности

---

## 5.2 Knowledge Retrieval Options

!!! task "За да завършим това, трябва да направим промени и да разположим наново (redeploy)"    
    
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
- Не изисква допълнителна конфигурация

**Azure AI Search (Optional):**

- Хибридно семантично и векторно търсене
- Управление на персонализирани индекси
- Разширени възможности за търсене
- Изисква `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "За да завършим това, трябва да направим промени и да разположим наново (redeploy)"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Интеграция с OpenTelemetry
- Проследяване на заявки/отговори
- Метрики за производителност
- Налично в портала Microsoft Foundry

**Logging:**

- Логове на приложението в Container Apps
- Структуриран запис с correlation ID-та
- Преглед в реално време и исторически логове

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Вградени оценители за оценка на качеството
- Персонализирани скриптове за оценяване
- Бенчмаркинг на производителността

**Continuous Monitoring:**

- Автоматична оценка на живи взаимодействия
- Проследяване на метрики за качество
- Откриване на регресии в производителността

**CI/CD Integration:**

- GitHub Actions workflow
- Автоматизирано тестване и оценяване
- Статистическо сравнително тестване

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Автоматизирано сканиране за сигурност
- Оценка на риска за AI системи
- Оценка на безопасността в множество категории

**Authentication:**

- Managed Identity за Azure услуги
- Допълнителна опция за удостоверяване чрез Azure App Service
- Basic auth като резервен вариант за развитие



!!! quote "КЪМ КРАЯ НА ТАЗИ ЛАБОРАТОРИЯ ТРЯБВА ДА ИМАТЕ"
    - [ ] Определени изисквания за вашия сценарий
    - [ ] Персонализирани променливи на средата (config)
    - [ ] Персонализирани инструкции за агента (task)
    - [ ] Разположен персонализиран шаблон (app)
    - [ ] Завършени задачи след разполагане (manual)
    - [ ] Изпълнено тестово оценяване

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: Помага на клиенти да намират и сравняват продукти
   - Loyalty Agent: Управлява клиентските награди и промоции

#### **Model Deployments:**

   - `gpt-4.1`: Основен chat модел
   - `o3`: Модел за разсъждение при сложни заявки
   - `gpt-4.1-nano`: Лекия модел за прости взаимодействия
   - `text-embedding-3-large`: Висококачествени ембединг вектори за търсене

#### **Features:**

   - Включено проследяване и мониторинг
   - AI Search за продуктовия каталог
   - Рамка за оценяване за осигуряване на качеството
   - Red teaming за валидация на сигурността

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Задайте име на средата
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Конфигурирайте регион (изберете въз основа на наличността на модела)
azd env set AZURE_LOCATION "eastus2"

# Активирайте всички незадължителни услуги
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Конфигурирайте основния чат модел (gpt-4.1 като най-близкия наличен до gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Конфигурирайте модел за вграждания за подобрено търсене
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

#### 5.6.2.2: Agent Instructions

Create `custom-agents/shopper-agent-instructions.md`:

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

Create `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Deployment Script

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Проверете предпоставките
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

# Разположете инфраструктурата и приложението
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Запишете резултатите от разгръщането
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

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Вземете информация за разгръщане
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

### 5.6.3: Testing and Validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Проверете дали променливите на околната среда са зададени
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Проверете достъпността на уеб приложението
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

# Стартирайте оценката, ако е конфигурирана
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

### 5.6.4 Expected Outcomes

After following this implementation guide, you will have:

1. **Deployed Infrastructure:**

      - Microsoft Foundry project with model deployments
      - Container Apps hosting the web application
      - AI Search service for product catalog
      - Application Insights for monitoring

2. **Initial Agent:**

      - Shopper Agent configured with basic instructions
      - File search capability enabled
      - Tracing and monitoring configured

3. **Ready for Customization:**

      - Framework for adding Loyalty Agent
      - Custom instruction templates
      - Testing and validation scripts
      - Monitoring and evaluation setup

4. **Production Readiness:**

      - Security scanning with red teaming
      - Performance monitoring
      - Quality evaluation framework
      - Scalable architecture

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език следва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от човек. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->