# 5. سفارشی‌سازی یک قالب

!!! tip "در پایان این ماژول شما قادر خواهید بود"

- [ ] قابلیت‌های پیش‌فرض عامل هوش مصنوعی را بررسی کنید
- [ ] جستجوی هوش مصنوعی را با شاخص خود اضافه کنید
- [ ] معیارهای ردیابی را فعال کرده و تحلیل کنید
- [ ] یک اجرای ارزیابی انجام دهید
- [ ] یک اسکن تیم قرمز اجرا کنید
- [ ] **آزمایش ۵: برنامه سفارشی‌سازی ایجاد کنید**

---

## 5.1 قابلیت‌های عامل هوش مصنوعی

!!! success "ما این را در آزمایش ۰۱ تکمیل کردیم"

- **جستجوی فایل**: جستجوی فایل داخلی OpenAI برای بازیابی دانش
- **ارجاعات**: نسبت‌دهی خودکار منابع در پاسخ‌ها
- **دستورالعمل‌های قابل تنظیم**: تغییر رفتار و شخصیت عامل
- **ادغام ابزار**: سیستم ابزار قابل توسعه برای قابلیت‌های سفارشی

---

## 5.2 گزینه‌های بازیابی دانش

!!! task "برای تکمیل این بخش باید تغییرات ایجاد کرده و دوباره مستقر کنیم"    

    ```bash title=""
    # تنظیم متغیرهای محیطی
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # آپلود داده‌ها و ایجاد شاخص من

    ```

---

**جستجوی فایل OpenAI (پیش‌فرض):**

- داخلی در سرویس عامل هوش مصنوعی Azure
- پردازش و شاخص‌گذاری خودکار اسناد
- نیازی به پیکربندی اضافی ندارد

**جستجوی هوش مصنوعی Azure (اختیاری):**

- جستجوی ترکیبی معنایی و برداری
- مدیریت شاخص سفارشی
- قابلیت‌های جستجوی پیشرفته
- نیازمند `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ردیابی و نظارت](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "برای تکمیل این بخش باید تغییرات ایجاد کرده و دوباره مستقر کنیم"    

    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ردیابی:**

- ادغام OpenTelemetry
- ردیابی درخواست/پاسخ
- معیارهای عملکرد
- موجود در پورتال AI Foundry

**ثبت وقایع:**

- ثبت وقایع برنامه در Container Apps
- ثبت وقایع ساختاریافته با شناسه‌های همبستگی
- مشاهده وقایع در زمان واقعی و تاریخی

---

## 5.4 [ارزیابی عامل](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ارزیابی محلی:**

- ارزیاب‌های داخلی برای ارزیابی کیفیت
- اسکریپت‌های ارزیابی سفارشی
- معیارهای عملکرد

**نظارت مداوم:**

- ارزیابی خودکار تعاملات زنده
- ردیابی معیارهای کیفیت
- تشخیص کاهش عملکرد

**ادغام CI/CD:**

- جریان کاری GitHub Actions
- آزمایش و ارزیابی خودکار
- آزمایش مقایسه آماری

---

## 5.5 [عامل تیم قرمز هوش مصنوعی](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**تیم قرمز هوش مصنوعی:**

- اسکن امنیتی خودکار
- ارزیابی ریسک برای سیستم‌های هوش مصنوعی
- ارزیابی ایمنی در دسته‌های مختلف

**احراز هویت:**

- هویت مدیریت‌شده برای خدمات Azure
- احراز هویت اختیاری Azure App Service
- بازگشت به احراز هویت پایه برای توسعه

!!! quote "در پایان این آزمایش شما باید داشته باشید"
- [ ] نیازمندی‌های سناریوی خود را تعریف کنید
- [ ] متغیرهای محیطی را سفارشی کنید (پیکربندی)
- [ ] دستورالعمل‌های عامل را سفارشی کنید (وظیفه)
- [ ] قالب سفارشی‌شده را مستقر کنید (برنامه)
- [ ] وظایف پس از استقرار را تکمیل کنید (دستی)
- [ ] یک ارزیابی آزمایشی اجرا کنید

این مثال سفارشی‌سازی قالب برای یک مورد استفاده خرده‌فروشی سازمانی با دو عامل تخصصی و چندین استقرار مدل را نشان می‌دهد.

---

## 5.6 آن را برای خود سفارشی کنید!

### 5.6.1. نیازمندی‌های سناریو

#### **استقرار عوامل:** 

- عامل خریدار: به مشتریان کمک می‌کند محصولات را پیدا کرده و مقایسه کنند
- عامل وفاداری: مدیریت پاداش‌ها و تبلیغات مشتریان

#### **استقرار مدل‌ها:**

- `gpt-4.1`: مدل چت اصلی
- `o3`: مدل استدلال برای پرسش‌های پیچیده
- `gpt-4.1-nano`: مدل سبک برای تعاملات ساده
- `text-embedding-3-large`: جاسازی‌های با کیفیت بالا برای جستجو

#### **ویژگی‌ها:**

- ردیابی و نظارت فعال شده
- جستجوی هوش مصنوعی برای کاتالوگ محصولات
- چارچوب ارزیابی برای تضمین کیفیت
- تیم قرمز برای اعتبارسنجی امنیت

---

### 5.6.2 پیاده‌سازی سناریو

#### 5.6.2.1. پیکربندی پیش از استقرار

ایجاد یک اسکریپت تنظیم (`setup-retail.sh`)

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

#### 5.6.2.2: دستورالعمل‌های عامل

ایجاد `custom-agents/shopper-agent-instructions.md`:

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

ایجاد `custom-agents/loyalty-agent-instructions.md`:

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

ایجاد `deploy-retail.sh`:

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

#### 5.6.2.4: پیکربندی پس از استقرار

ایجاد `configure-retail-agents.sh`:

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

### 5.6.3: آزمایش و اعتبارسنجی

ایجاد `test-retail-deployment.sh`:

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

### 5.6.4 نتایج مورد انتظار

پس از دنبال کردن این راهنمای پیاده‌سازی، شما خواهید داشت:

1. **زیرساخت مستقر شده:**

   - پروژه AI Foundry با استقرار مدل‌ها
   - Container Apps میزبان برنامه وب
   - سرویس جستجوی هوش مصنوعی برای کاتالوگ محصولات
   - Application Insights برای نظارت

2. **عامل اولیه:**

   - عامل خریدار با دستورالعمل‌های پایه پیکربندی شده
   - قابلیت جستجوی فایل فعال شده
   - ردیابی و نظارت پیکربندی شده

3. **آماده برای سفارشی‌سازی:**

   - چارچوبی برای افزودن عامل وفاداری
   - قالب‌های دستورالعمل سفارشی
   - اسکریپت‌های آزمایش و اعتبارسنجی
   - تنظیمات نظارت و ارزیابی

4. **آمادگی برای تولید:**

   - اسکن امنیتی با تیم قرمز
   - نظارت بر عملکرد
   - چارچوب ارزیابی کیفیت
   - معماری مقیاس‌پذیر

این مثال نشان می‌دهد که چگونه قالب AZD می‌تواند برای سناریوهای خاص سازمانی گسترش یافته و سفارشی شود، در حالی که بهترین شیوه‌ها برای امنیت، نظارت و مقیاس‌پذیری حفظ می‌شود.

---

