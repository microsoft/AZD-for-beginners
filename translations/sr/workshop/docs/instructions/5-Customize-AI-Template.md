# 5. Прилагодите шаблон

!!! tip "НА КРАЈУ ОВОГ МОДУЛА БИЋЕТЕ У СТАЊУ ДА"

    - [ ] Истражили подразумеване могућности AI агента
    - [ ] Додали AI претрагу са сопственим индексом
    - [ ] Активирали и анализирали метрике праћења
    - [ ] Покренули евалуацију
    - [ ] Извршили ред-тиминг скенирање
    - [ ] **Лаб 5: Саставили план прилагођавања** 

---

## 5.1 Могућности AI агента

!!! success "Завршено у Лаб 01"

- **Претрага фајлова**: OpenAI-јева уграђена претрага фајлова за дохватање знања
- **Цитирање**: Аутоматско навођење извора у одговорима
- **Прилагодљиве инструкције**: Модификујте понашање и личност агента
- **Интеграција алата**: Проширив систем алата за прилагођене могућности

---

## 5.2 Опције дохватања знања

!!! task "Да бисмо ово завршили, потребно је направити измене и поново распоредити"    
    
    ```bash title=""
    # Поставите променљиве окружења
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Отпремите податке и креирајте свој индекс

    ```

---

**OpenAI File Search (Default):**

- Уграђено у Foundry Agents
- Аутоматска обрада докумената и индексирање
- Нема додатне конфигурације

**Azure AI Search (Optional):**

- Хибридна семантичка и векторска претрага
- Управљање прилагођеним индексом
- Напредне могућности претраге
- Захтева `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Праћење и надгледање](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Да бисмо ово завршили, потребно је направити измене и поново распоредити"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Праћење:**

- Интеграција OpenTelemetry
- Праћење захтева/одговора
- Перформансне метрике
- Доступно у Microsoft Foundry порталу

**Логовање:**

- Логови апликације у Container Apps
- Структурирано логовање са ID-јевима корелације
- Преглед логова у реалном времену и историјских логова

---

## 5.4 [Евалуација агента](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Локална евалуација:**

- Уграђени евалуатори за процену квалитета
- Прилагођени скрипти за евалуацију
- Бенчмаркинг перформанси

**Континуирано праћење:**

- Аутоматска евалуација интеракција уживо
- Праћење метрика квалитета
- Откривање регресије перформанси

**Интеграција CI/CD:**

- GitHub Actions ток рада
- Аутоматско тестирање и евалуација
- Статистичко поређење тестова

---

## 5.5 [AI агент за ред-тиминг](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ред-тиминг:**

- Аутоматизовано безбедносно скенирање
- Процена ризика за AI системе
- Процена безбедности кроз више категорија

**Аутентикација:**

- Управљани идентитет за Azure сервисе
- Опционо аутентиковање Azure App Service
- Основна аутентикација као резервна опција за развој



!!! quote "НА КРАЈУ ОВЕ ЛАБОРАТОРИЈЕ ТРЕБА ДА ИМАТЕ"
    - [ ] Дефинишите захтеве вашег сценарија
    - [ ] Прилагодили променљиве окружења (конфиг)
    - [ ] Прилагодили упутства агента (задатак)
    - [ ] Деплојирали прилагођени шаблон (апликација)
    - [ ] Завршили пост-деплојмент задатке (ручно)
    - [ ] Покренули тест евалуацију

Овај пример показује прилагођавање шаблона за предузеће у малопродаји са два специјализована агента и више распоређивања модела.

---

## 5.6 Прилагодите га за себе!

### 5.6.1. Захтеви сценарија

#### **Распоређивања агената:** 

   - Shopper Agent: Помаже купцима да пронађу и упореде производе
   - Loyalty Agent: Управља наградама и промоцијама за купце

#### **Распоређивања модела:**

   - `gpt-4.1`: Примарни модел за чет
   - `o3`: Модел за резоновање за сложене упите
   - `gpt-4.1-nano`: Лаган модел за једноставне интеракције
   - `text-embedding-3-large`: Висококвалитетне ембеддинге за претрагу

#### **Функције:**

   - Омогућено праћење и надгледање
   - AI претрага за каталог производа
   - Оквир за евалуацију за осигурање квалитета
   - Ред-тиминг за проверу безбедности

---

### 5.6.2 Имплементација сценарија


#### 5.6.2.1. Конфигурација пре распоређивања

Креирајте скрипту за подешавање (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Подеси име окружења
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Конфигуриши регион (изабери у складу са доступношћу модела)
azd env set AZURE_LOCATION "eastus2"

# Омогући све опционе услуге
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Конфигуриши примарни модел за чат (gpt-4.1 као најближи доступни gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Конфигуриши модел за уграђивање за побољшано претраживање
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Подеси име агента (креираће првог агента)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Конфигуриши индекс претраге
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Упутства за агенте

Креирајте `custom-agents/shopper-agent-instructions.md`:

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

Креирајте `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Скрипта за распоређивање

Креирајте `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Проверите предуслове
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Подесите окружење
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Проверите квоту у изабраном региону
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

# Разместите инфраструктуру и апликацију
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Забележите излазне податке распоређивања
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Добијте URL веб апликације
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

#### 5.6.2.4: Конфигурација после распоређивања

Креирајте `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Добијте информације о распоређивању
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Упутства за ручну конфигурацију
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

### 5.6.3: Тестирање и валидација

Креирајте `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Проверите да ли су променљиве окружења подешене
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Проверите доступност веб апликације
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

# Покрените процену ако је конфигурисано
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

### 5.6.4 Очекивани резултати

Након праћења овог водича за имплементацију, имаћете:

1. **Распоређена инфраструктура:**

      - Microsoft Foundry пројекат са распоређивањима модела
      - Container Apps који хостују веб апликацију
      - AI Search сервис за каталог производа
      - Application Insights за праћење

2. **Почетни агент:**

      - Shopper Agent конфигурисан са основним упутствима
      - Омогућена могућност претраге фајлова
      - Конфигурисано праћење и надгледање

3. **Спремно за прилагођавање:**

      - Оквир за додавање Loyalty Agent
      - Прилагођени шаблони инструкција
      - Скрипте за тестирање и валидацију
      - Подешавање праћења и евалуације

4. **Спремност за производњу:**

      - Безбедносно скенирање уз ред-тиминг
      - Праћење перформанси
      - Оквир за евалуацију квалитета
      - Скалирајућа архитектура

Овај пример показује како се AZD шаблон може проширити и прилагодити за специфичне сценарије предузећа уз одржавање најбољих пракси за безбедност, праћење и скалабилност.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен уз помоћ AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте на уму да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистекну из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->