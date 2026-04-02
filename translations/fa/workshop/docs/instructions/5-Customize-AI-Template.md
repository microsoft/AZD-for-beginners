# 5. سفارشی‌سازی یک قالب

!!! tip "تا پایان این ماژول شما قادر خواهید بود"

    - [ ] قابلیت‌های پیش‌فرض عامل‌های هوش مصنوعی را بررسی کردید
    - [ ] جستجوی AI را با ایندکس خود اضافه کردید
    - [ ] ردیابی و معیارها را فعال و تحلیل کردید
    - [ ] یک اجرای ارزیابی انجام دادید
    - [ ] یک اسکن red-teaming اجرا کردید
    - [ ] **Lab 5: ساخت یک طرح سفارشی‌سازی** 

---

## 5.1 قابلیت‌های عامل هوش مصنوعی

!!! success "این مورد را در آزمایشگاه 01 تکمیل کردیم"

- **File Search**: جستجوی فایل داخلی OpenAI برای بازیابی دانش
- **Citations**: تخصیص خودکار منبع در پاسخ‌ها
- **Customizable Instructions**: تغییر رفتار و شخصیت عامل
- **Tool Integration**: سیستم ابزار قابل گسترش برای قابلیت‌های سفارشی

---

## 5.2 گزینه‌های بازیابی دانش

!!! task "برای تکمیل این بخش باید تغییراتی انجام دهیم و دوباره استقرار دهیم"    
    
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

- ساخته‌شده در Foundry Agents
- پردازش خودکار اسناد و ایندکس‌سازی
- نیاز به پیکربندی اضافی ندارد

**Azure AI Search (Optional):**

- جستجوی هیبریدی معنایی و برداری
- مدیریت ایندکس سفارشی
- قابلیت‌های جستجوی پیشرفته
- نیازمند `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ردیابی و پایش](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "برای تکمیل این بخش باید تغییراتی انجام دهیم و دوباره استقرار دهیم"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ردیابی:**

- ادغام OpenTelemetry
- ردیابی درخواست/پاسخ
- معیارهای عملکرد
- در پرتال Microsoft Foundry در دسترس است

**لاگ‌گیری:**

- لاگ‌های اپلیکیشن در Container Apps
- لاگ‌گیری ساختاریافته با شناسه‌های همبستگی
- مشاهده لاگ‌ها به‌صورت بلادرنگ و تاریخی

---

## 5.4 [ارزیابی عامل](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ارزیابی محلی:**

- ارزیاب‌های داخلی برای سنجش کیفیت
- اسکریپت‌های ارزیابی سفارشی
- معیارگذاری عملکرد

**پایش مداوم:**

- ارزیابی خودکار تعاملات زنده
- ردیابی معیارهای کیفیت
- تشخیص افت عملکرد

**ادغام CI/CD:**

- جریان کاری GitHub Actions
- تست و ارزیابی خودکار
- تست‌های مقایسه‌ای آماری

---

## 5.5 [عامل تیم قرمز هوش مصنوعی](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**تیم قرمز هوش مصنوعی:**

- اسکن امنیتی خودکار
- ارزیابی ریسک برای سیستم‌های هوش مصنوعی
- ارزیابی ایمنی در رشته‌های مختلف

**احراز هویت:**

- Managed Identity برای سرویس‌های Azure
- احراز هویت اختیاری Azure App Service
- بازگشت به احراز هویت پایه برای توسعه



!!! quote "تا پایان این آزمایشگاه شما باید داشته باشید"
    - [ ] نیازمندی‌های سناریو خود را تعریف کرده باشید
    - [ ] متغیرهای محیطی سفارشی شده (پیکربندی)
    - [ ] دستورالعمل‌های عامل سفارشی شده (وظیفه)
    - [ ] قالب سفارشی شده را مستقر کرده باشید (اپ)
    - [ ] وظایف پس از استقرار را تکمیل کرده باشید (دستی)
    - [ ] یک ارزیابی آزمایشی اجرا کرده باشید

این مثال نشان می‌دهد چگونه قالب را برای یک سناریوی سازمانی خرده‌فروشی با دو عامل تخصصی و چندین استقرار مدل سفارشی‌سازی کنیم.

---

## 5.6 آن را برای شما سفارشی کنید!

### 5.6.1. نیازمندی‌های سناریو

#### **استقرار عامل‌ها:** 

   - Shopper Agent: به مشتریان کمک می‌کند محصولات را پیدا و مقایسه کنند
   - Loyalty Agent: جوایز و تبلیغات مشتریان را مدیریت می‌کند

#### **استقرار مدل‌ها:**

   - `gpt-4.1`: مدل چت اصلی
   - `o3`: مدل استدلال برای پرسش‌های پیچیده
   - `gpt-4.1-nano`: مدل سبک برای تعاملات ساده
   - `text-embedding-3-large`: بردارهای تعبیه‌شده با کیفیت بالا برای جستجو

#### **ویژگی‌ها:**

   - ردیابی و پایش فعال شده
   - AI Search برای فهرست محصولات
   - چارچوب ارزیابی برای تضمین کیفیت
   - red teaming برای اعتبارسنجی امنیت

---

### 5.6.2 پیاده‌سازی سناریو


#### 5.6.2.1. پیکربندی پیش‌از استقرار

یک اسکریپت راه‌انداز بسازید (`setup-retail.sh`)

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

# مدل چت اصلی را پیکربندی کنید (gpt-4.1 به‌عنوان نزدیک‌ترین مدل موجود به gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# مدل تعبیه‌سازی را برای جستجوی بهبود یافته پیکربندی کنید
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

فایل `custom-agents/shopper-agent-instructions.md` را ایجاد کنید:

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

فایل `custom-agents/loyalty-agent-instructions.md` را ایجاد کنید:

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

فایل `deploy-retail.sh` را ایجاد کنید:

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

# جمع‌آوری خروجی‌های استقرار
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# دریافت آدرس URL برنامه وب
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

#### 5.6.2.4: پیکربندی پس از استقرار

فایل `configure-retail-agents.sh` را ایجاد کنید:

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

فایل `test-retail-deployment.sh` را ایجاد کنید:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# اطمینان از تنظیم بودن متغیرهای محیطی
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# بررسی در دسترس بودن برنامه وب
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

# اجرای ارزیابی در صورت پیکربندی
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

پس از پیروی از این راهنمای پیاده‌سازی، شما خواهید داشت:

1. **زیرساخت مستقر شده:**

      - پروژه Microsoft Foundry با استقرار مدل‌ها
      - Container Apps میزبانی برنامه وب
      - سرویس AI Search برای فهرست محصولات
      - Application Insights برای پایش

2. **عامل اولیه:**

      - Shopper Agent با دستورالعمل‌های پایه پیکربندی شده
      - قابلیت جستجوی فایل فعال شده
      - ردیابی و پایش پیکربندی شده

3. **آماده برای سفارشی‌سازی:**

      - چارچوبی برای افزودن Loyalty Agent
      - الگوهای دستورالعمل سفارشی
      - اسکریپت‌های تست و اعتبارسنجی
      - تنظیمات پایش و ارزیابی

4. **آمادگی برای تولید:**

      - اسکن امنیتی با red teaming
      - پایش عملکرد
      - چارچوب ارزیابی کیفیت
      - معماری قابل مقیاس

این مثال نشان می‌دهد چگونه قالب AZD می‌تواند برای سناریوهای سازمانی خاص گسترش و سفارشی شود در حالی که بهترین شیوه‌ها برای امنیت، پایش و مقیاس‌پذیری حفظ می‌شود.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه‌ی هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی اشتباهات یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->