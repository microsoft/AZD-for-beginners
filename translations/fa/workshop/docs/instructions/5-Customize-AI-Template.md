# 5. سفارشی‌سازی یک قالب

!!! tip "در پایان این ماژول قادر خواهید بود"

    - [ ] قابلیت‌های پیش‌فرض عامل‌های هوش مصنوعی را بررسی کردید
    - [ ] جستجوی AI را با ایندکس خود اضافه کردید
    - [ ] معیارهای Tracing را فعال و تحلیل کردید
    - [ ] یک اجرای ارزیابی انجام دادید
    - [ ] یک اسکن red-teaming اجرا کردید
    - [ ] **آزمایشگاه 5: تهیه طرح سفارشی‌سازی** 

---

## 5.1 قابلیت‌های عامل هوش‌مصنوعی

!!! success "این مورد را در آزمایشگاه 01 تکمیل کردیم"

- **File Search**: جستجوی فایل داخلی OpenAI برای بازیابی دانش
- **Citations**: تخصیص خودکار منبع در پاسخ‌ها
- **Customizable Instructions**: تغییر رفتار و شخصیت عامل
- **Tool Integration**: سیستم ابزار قابل توسعه برای قابلیت‌های سفارشی

---

## 5.2 گزینه‌های بازیابی دانش

!!! task "برای تکمیل این باید تغییراتی ایجاد کرده و مجدداً مستقر کنیم"    
    
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

- Built-in to Foundry Agents
- Automatic document processing and indexing
- No additional configuration required

**Azure AI Search (Optional):**

- Hybrid semantic and vector search
- Custom index management
- Advanced search capabilities
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ردیابی و نظارت](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "برای تکمیل این باید تغییراتی ایجاد کرده و مجدداً مستقر کنیم"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ردیابی:**

- OpenTelemetry integration
- Request/response tracking
- Performance metrics
- Available in Microsoft Foundry portal

**لاگ‌گیری:**

- Application logs in Container Apps
- Structured logging with correlation IDs
- Real-time and historical log viewing

---

## 5.4 [ارزیابی عامل](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ارزیابی محلی:**

- Built-in evaluators for quality assessment
- Custom evaluation scripts
- Performance benchmarking

**نظارت مستمر:**

- Automatic evaluation of live interactions
- Quality metrics tracking
- Performance regression detection

**ادغام CI/CD:**

- GitHub Actions workflow
- Automated testing and evaluation
- Statistical comparison testing

---

## 5.5 [عامل تیم قرمز هوش مصنوعی](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**تیم‌قرمز (Red Teaming) هوش مصنوعی:**

- Automated security scanning
- Risk assessment for AI systems
- Safety evaluation across multiple categories

**احراز هویت:**

- Managed Identity برای سرویس‌های Azure
- Optional Azure App Service authentication
- Basic auth fallback for development



!!! quote "در پایان این آزمایشگاه شما باید موارد زیر را داشته باشید"
    - [ ] نیازمندی‌های سناریوی خود را تعریف کنید
    - [ ] متغیرهای محیطی را سفارشی کنید (config)
    - [ ] دستورالعمل‌های عامل را سفارشی کنید (task)
    - [ ] قالب سفارشی‌شده را استقرار دهید (app)
    - [ ] وظایف پس از استقرار را تکمیل کنید (manual)
    - [ ] یک ارزیابی آزمایشی اجرا کنید

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 سفارشی‌سازی برای شما!

### 5.6.1. نیازمندی‌های سناریو

#### **استقرار عامل‌ها:** 

   - Shopper Agent: به مشتریان کمک می‌کند محصولات را پیدا و مقایسه کنند
   - Loyalty Agent: مدیریت جوایز و تبلیغات مشتریان

#### **استقرار مدل‌ها:**

   - `gpt-4.1`: مدل اصلی چت
   - `o3`: مدل استدلال برای پرسش‌های پیچیده
   - `gpt-4.1-nano`: مدل سبک برای تعاملات ساده
   - `text-embedding-3-large`: تعبیه‌های باکیفیت برای جستجو

#### **ویژگی‌ها:**

   - ردیابی و نظارت فعال شده‌اند
   - AI Search برای فهرست محصولات
   - چارچوب ارزیابی برای تضمین کیفیت
   - تیم‌قرمز برای اعتبارسنجی امنیت

---

### 5.6.2 پیاده‌سازی سناریو


#### 5.6.2.1 پیکربندی پیش از استقرار

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# نام محیط را تنظیم کنید
azd env set AZURE_ENV_NAME "retail-ai-agents"

# منطقه را پیکربندی کنید (براساس در دسترس بودن مدل انتخاب کنید)
azd env set AZURE_LOCATION "eastus2"

# تمام سرویس‌های اختیاری را فعال کنید
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# مدل اصلی چت را پیکربندی کنید (gpt-4.1 به‌عنوان نزدیک‌ترین مدل موجود به gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# مدل امبدینگ را برای بهبود جستجو پیکربندی کنید
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# نام عامل را تنظیم کنید (اولین عامل ایجاد خواهد شد)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# شاخص جستجو را پیکربندی کنید
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: دستورالعمل‌های عامل

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

#### 5.6.2.3: اسکریپت استقرار

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# اعتبارسنجی پیش‌نیازها
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# راه‌اندازی محیط
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# بررسی سهمیه در منطقه انتخاب‌شده
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

# استقرار زیرساخت و برنامه
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ثبت خروجی‌های استقرار
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# دریافت آدرس برنامه وب
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

#### 5.6.2.4: پیکربندی پس از استقرار

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# دریافت اطلاعات استقرار
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# دستورالعمل‌های پیکربندی دستی
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

### 5.6.3: تست و اعتبارسنجی

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# اطمینان حاصل کنید که متغیرهای محیطی تنظیم شده‌اند
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# در دسترس بودن برنامه وب را آزمایش کنید
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

# در صورت پیکربندی، ارزیابی را اجرا کنید
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

### 5.6.4 نتایج مورد انتظار

پس از دنبال کردن این راهنمای پیاده‌سازی، شما خواهید داشت:

1. **زیرساخت‌های مستقر شده:**

      - Microsoft Foundry project با استقرار مدل‌ها
      - Container Apps میزبانی‌کننده برنامه وب
      - AI Search service برای فهرست محصولات
      - Application Insights برای نظارت

2. **عامل اولیه:**

      - Shopper Agent با دستورالعمل‌های پایه پیکربندی شده است
      - قابلیت جستجوی فایل فعال شده است
      - ردیابی و نظارت پیکربندی شده‌اند

3. **آماده‌سازی برای سفارشی‌سازی:**

      - چارچوبی برای اضافه کردن عامل Loyalty
      - قالب‌های دستورالعمل سفارشی
      - اسکریپت‌های تست و اعتبارسنجی
      - تنظیمات نظارت و ارزیابی

4. **آمادگی برای تولید:**

      - اسکن امنیتی با تیم‌قرمز
      - نظارت بر عملکرد
      - چارچوب ارزیابی کیفیت
      - معماری مقیاس‌پذیر

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع معتبر تلقی شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئول نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->