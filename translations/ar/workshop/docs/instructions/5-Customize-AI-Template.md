# 5. تخصيص قالب

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

- [ ] استكشاف قدرات وكيل الذكاء الاصطناعي الافتراضية
- [ ] إضافة بحث الذكاء الاصطناعي باستخدام الفهرس الخاص بك
- [ ] تفعيل وتحليل مقاييس التتبع
- [ ] تنفيذ تشغيل تقييم
- [ ] تنفيذ فحص فريق الاختبار الأمني
- [ ] **المختبر 5: بناء خطة تخصيص**

---

## 5.1 قدرات وكيل الذكاء الاصطناعي

!!! success "لقد أكملنا هذا في المختبر 01"

- **بحث الملفات**: البحث المدمج في OpenAI لاسترجاع المعرفة
- **الاستشهادات**: الإسناد التلقائي للمصادر في الردود
- **تعليمات قابلة للتخصيص**: تعديل سلوك وشخصية الوكيل
- **تكامل الأدوات**: نظام أدوات قابل للتوسيع لإضافة قدرات مخصصة

---

## 5.2 خيارات استرجاع المعرفة

!!! task "لإكمال هذا، نحتاج إلى إجراء تغييرات وإعادة النشر"

    ```bash title=""
    # ضبط متغيرات البيئة
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # تحميل البيانات وإنشاء الفهرس الخاص بي
    ```

---

**بحث ملفات OpenAI (افتراضي):**

- مدمج في خدمة وكيل الذكاء الاصطناعي من Azure
- معالجة وفهرسة المستندات تلقائيًا
- لا يتطلب أي إعداد إضافي

**بحث Azure AI (اختياري):**

- بحث هجين دلالي ومتجهي
- إدارة فهرس مخصص
- قدرات بحث متقدمة
- يتطلب `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [التتبع والمراقبة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "لإكمال هذا، نحتاج إلى إجراء تغييرات وإعادة النشر"

    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**التتبع:**

- تكامل OpenTelemetry
- تتبع الطلبات/الردود
- مقاييس الأداء
- متاح في بوابة AI Foundry

**التسجيل:**

- سجلات التطبيقات في Container Apps
- تسجيل منظم مع معرفات الارتباط
- عرض السجلات في الوقت الفعلي والتاريخية

---

## 5.4 [تقييم الوكيل](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**التقييم المحلي:**

- أدوات تقييم مدمجة لتقييم الجودة
- نصوص تقييم مخصصة
- قياس الأداء

**المراقبة المستمرة:**

- تقييم تلقائي للتفاعلات الحية
- تتبع مقاييس الجودة
- اكتشاف تراجع الأداء

**تكامل CI/CD:**

- سير عمل GitHub Actions
- اختبارات وتقييم تلقائي
- اختبارات مقارنة إحصائية

---

## 5.5 [وكيل فريق الاختبار الأمني للذكاء الاصطناعي](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**فريق الاختبار الأمني للذكاء الاصطناعي:**

- فحص أمني تلقائي
- تقييم المخاطر لأنظمة الذكاء الاصطناعي
- تقييم الأمان عبر فئات متعددة

**المصادقة:**

- هوية مُدارة لخدمات Azure
- مصادقة اختيارية لخدمة Azure App Service
- مصادقة أساسية كخيار احتياطي للتطوير

!!! quote "بنهاية هذا المختبر يجب أن تكون قد"

- [ ] حددت متطلبات السيناريو الخاص بك
- [ ] خصصت متغيرات البيئة (الإعداد)
- [ ] خصصت تعليمات الوكيل (المهمة)
- [ ] نشرت القالب المخصص (التطبيق)
- [ ] أكملت مهام ما بعد النشر (يدويًا)
- [ ] أجريت اختبار تقييم

هذا المثال يوضح كيفية تخصيص القالب لحالة استخدام تجارية في مجال البيع بالتجزئة مع وكيلين متخصصين ونشر نماذج متعددة.

---

## 5.6 خصصه لك!

### 5.6.1. متطلبات السيناريو

#### **نشر الوكلاء:**

- وكيل المتسوق: يساعد العملاء في العثور على المنتجات ومقارنتها
- وكيل الولاء: يدير مكافآت العملاء والعروض الترويجية

#### **نشر النماذج:**

- `gpt-4.1`: نموذج الدردشة الأساسي
- `o3`: نموذج التفكير للاستفسارات المعقدة
- `gpt-4.1-nano`: نموذج خفيف للتفاعلات البسيطة
- `text-embedding-3-large`: تضمينات عالية الجودة للبحث

#### **الميزات:**

- تمكين التتبع والمراقبة
- بحث الذكاء الاصطناعي لفهرس المنتجات
- إطار عمل التقييم لضمان الجودة
- فريق الاختبار الأمني للتحقق من الأمان

---

### 5.6.2 تنفيذ السيناريو

#### 5.6.2.1. إعداد ما قبل النشر

إنشاء نص إعداد (`setup-retail.sh`)

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

#### 5.6.2.2: تعليمات الوكيل

إنشاء `custom-agents/shopper-agent-instructions.md`:

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

إنشاء `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: نص النشر

إنشاء `deploy-retail.sh`:

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

#### 5.6.2.4: إعداد ما بعد النشر

إنشاء `configure-retail-agents.sh`:

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

### 5.6.3: الاختبار والتحقق

إنشاء `test-retail-deployment.sh`:

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

### 5.6.4 النتائج المتوقعة

بعد اتباع دليل التنفيذ هذا، سيكون لديك:

1. **البنية التحتية المنشورة:**

   - مشروع AI Foundry مع نشر النماذج
   - تطبيقات الحاويات التي تستضيف التطبيق الويب
   - خدمة بحث الذكاء الاصطناعي لفهرس المنتجات
   - تطبيق Insights للمراقبة

2. **الوكيل الأولي:**

   - وكيل المتسوق مُعد بتعليمات أساسية
   - تمكين قدرة البحث في الملفات
   - تم إعداد التتبع والمراقبة

3. **جاهز للتخصيص:**

   - إطار عمل لإضافة وكيل الولاء
   - قوالب تعليمات مخصصة
   - نصوص الاختبار والتحقق
   - إعداد المراقبة والتقييم

4. **جاهزية الإنتاج:**

   - فحص الأمان باستخدام فريق الاختبار الأمني
   - مراقبة الأداء
   - إطار عمل تقييم الجودة
   - بنية قابلة للتوسع

هذا المثال يوضح كيفية تمديد وتخصيص قالب AZD لسيناريوهات مؤسسية محددة مع الحفاظ على أفضل الممارسات للأمان والمراقبة وقابلية التوسع.

---

