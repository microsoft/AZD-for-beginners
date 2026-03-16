# 5. تخصيص قالب

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

    - [ ] استكشاف قدرات وكلاء الذكاء الاصطناعي الافتراضية
    - [ ] إضافة بحث الذكاء الاصطناعي باستخدام الفهرس الخاص بك
    - [ ] تفعيل وتحليل مقاييس التتبع
    - [ ] تنفيذ تشغيل تقييم
    - [ ] تنفيذ فحص الفريق الأحمر
    - [ ] **المختبر 5: وضع خطة تخصيص** 

---

## 5.1 قدرات وكلاء الذكاء الاصطناعي

!!! success "أكملنا هذا في المختبر 01"

- **بحث في الملفات**: OpenAI's built-in file search for knowledge retrieval
- **الاستشهادات**: نسب المصادر تلقائيًا في الردود
- **تعليمات قابلة للتخصيص**: تعديل سلوك الوكيل وشخصيته
- **تكامل الأدوات**: نظام أدوات قابل للتوسيع لإضافة قدرات مخصصة

---

## 5.2 خيارات استرجاع المعرفة

!!! task "لإكمال هذا نحتاج إلى إجراء تغييرات وإعادة النشر"    
    
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

- مدمج في وكلاء Foundry
- معالجة المستندات والفهرسة تلقائيًا
- لا حاجة لتكوين إضافي

**Azure AI Search (Optional):**

- بحث هجين دلالي ومتجه
- إدارة فهرس مخصص
- قدرات بحث متقدمة
- يتطلب `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [التتبع والمراقبة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "لإكمال هذا نحتاج إلى إجراء تغييرات وإعادة النشر"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

التتبع:

- تكامل OpenTelemetry
- تتبع الطلب/الاستجابة
- مقاييس الأداء
- متاح في بوابة Microsoft Foundry

التسجيل:

- سجلات التطبيق في Container Apps
- تسجيل منظم مع معرفات الارتباط
- عرض السجلات في الوقت الحقيقي والتاريخي

---

## 5.4 [تقييم الوكيل](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

التقييم المحلي:

- مقَيّمات مدمجة لتقييم الجودة
- نصوص تقييم مخصصة
- قياس أداء

المراقبة المستمرة:

- تقييم تلقائي للتفاعلات الحية
- تتبع مقاييس الجودة
- كشف تراجعات الأداء

تكامل CI/CD:

- سير عمل GitHub Actions
- اختبار وتقييم آلي
- اختبار المقارنة الإحصائية

---

## 5.5 [وكيل الفريق الأحمر للذكاء الاصطناعي](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

اختبار الفريق الأحمر للذكاء الاصطناعي:

- مسح أمني آلي
- تقييم المخاطر لأنظمة الذكاء الاصطناعي
- تقييم السلامة عبر فئات متعددة

المصادقة:

- Managed Identity لخدمات Azure
- مصادقة Azure App Service اختيارية
- الرجوع إلى المصادقة الأساسية أثناء التطوير



!!! quote "بنهاية هذا المختبر يجب أن تكون قد"
    - [ ] حدد متطلبات السيناريو الخاص بك
    - [ ] تخصيص متغيرات البيئة (التكوين)
    - [ ] تخصيص تعليمات الوكيل (المهمة)
    - [ ] نشر القالب المخصص (التطبيق)
    - [ ] إكمال مهام ما بعد النشر (يدوي)
    - [ ] تشغيل تقييم تجريبي

يوضح هذا المثال تخصيص القالب لحالة استخدام مؤسسية في مجال البيع بالتجزئة مع وكيلين متخصصين ونشر عدة نماذج.

---

## 5.6 خصصه لك!

### 5.6.1. متطلبات السيناريو

#### **نشر الوكلاء:** 

   - Shopper Agent: يساعد العملاء في العثور على المنتجات ومقارنتها
   - Loyalty Agent: يدير مكافآت وعروض العملاء

#### **نشر النماذج:**

   - `gpt-4.1`: النموذج الأساسي للدردشة
   - `o3`: نموذج الاستدلال للاستفسارات المعقدة
   - `gpt-4.1-nano`: نموذج خفيف للتفاعلات البسيطة
   - `text-embedding-3-large`: تضمينات عالية الجودة للبحث

#### **الميزات:**

   - تم تمكين التتبع والمراقبة
   - AI Search لفهرس المنتجات
   - إطار تقييم لضمان الجودة
   - اختبار الفريق الأحمر من أجل التحقق الأمني

---

### 5.6.2 تنفيذ السيناريو


#### 5.6.2.1. تكوين ما قبل النشر

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# تعيين اسم البيئة
azd env set AZURE_ENV_NAME "retail-ai-agents"

# تكوين المنطقة (اختر بناءً على توفر النموذج)
azd env set AZURE_LOCATION "eastus2"

# تمكين جميع الخدمات الاختيارية
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# تكوين نموذج المحادثة الأساسي (gpt-4.1 كالأقرب المتاح إلى gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# تكوين نموذج التضمين لتحسين البحث
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# تعيين اسم الوكيل (سيُنشئ الوكيل الأول)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# تكوين فهرس البحث
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: تعليمات الوكلاء

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

#### 5.6.2.3: سكربت النشر

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# التحقق من المتطلبات المسبقة
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# إعداد البيئة
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# التحقق من الحصة في المنطقة المحددة
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

# نشر البنية التحتية والتطبيق
echo "🏗️  Deploying Azure infrastructure..."
azd up

# التقاط مخرجات النشر
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# الحصول على عنوان URL لتطبيق الويب
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

#### 5.6.2.4: تكوين ما بعد النشر

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# الحصول على معلومات النشر
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# تعليمات للتكوين اليدوي
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

### 5.6.3: الاختبار والتحقق

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# تحقق من تعيين متغيرات البيئة
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# اختبار توفر تطبيق الويب
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

# شغّل التقييم إذا تم تكوينه
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

### 5.6.4 النتائج المتوقعة

بعد اتباع دليل التنفيذ هذا، ستحصل على:

1. **البنية التحتية المنشورة:**

      - مشروع Microsoft Foundry مع نشر النماذج
      - Container Apps تستضيف تطبيق الويب
      - خدمة AI Search لفهرس المنتجات
      - Application Insights للمراقبة

2. **الوكيل الأولي:**

      - Shopper Agent مُكوّن بتعليمات أساسية
      - تم تمكين قدرة البحث في الملفات
      - تم تكوين التتبع والمراقبة

3. **جاهز للتخصيص:**

      - إطار لإضافة Loyalty Agent
      - قوالب تعليمات مخصصة
      - سكربتات الاختبار والتحقق
      - إعداد المراقبة والتقييم

4. **الجاهزية للإنتاج:**

      - فحص أمني باستخدام فريق الاختبار الأحمر
      - مراقبة الأداء
      - إطار تقييم الجودة
      - بنية قابلة للتوسع

يوضح هذا المثال كيف يمكن توسيع قالب AZD وتخصيصه لسيناريوهات مؤسسية محددة مع الحفاظ على أفضل الممارسات للأمان والمراقبة وقابلية التوسع.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. لا نتحمل أي مسؤولية عن أي سوء فهم أو تأويل ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->