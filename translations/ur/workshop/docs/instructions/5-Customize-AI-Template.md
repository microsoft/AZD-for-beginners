# 5. ایک ٹیمپلیٹ کو اپنی مرضی کے مطابق بنائیں

!!! tip "اس ماڈیول کے اختتام تک آپ قابل ہو جائیں گے"

    - [ ] ڈیفالٹ AI ایجنٹ صلاحیتوں کو دریافت کیا
    - [ ] اپنی خود کی انڈیکس کے ساتھ AI سرچ شامل کی
    - [ ] ٹریسنگ میٹرکس کو فعال اور تجزیہ کیا
    - [ ] ایک تشخیصی رن چلایا
    - [ ] ریڈ-ٹیمنگ اسکین انجام دیا
    - [ ] **لیب 5: اپنی مرضی کے مطابق بنانے کا منصوبہ تیار کیا** 

---

## 5.1 AI ایجنٹ کی صلاحیتیں

!!! success "ہم نے یہ کام لیب 01 میں مکمل کیا"

- **فائل سرچ**: جانکاری بازیافت کے لیے OpenAI کا بلٹ ان فائل سرچ
- **حوالہ جات**: ردعمل میں خودکار ماخذ کا تذکرہ
- **حسب ضرورت ہدایات**: ایجنٹ کے رویے اور شخصیت میں ترمیم کریں
- **ٹول انضمام**: اپنی مرضی کی صلاحیتوں کے لیے وسعت پذیر ٹول سسٹم

---

## 5.2 معلومات بازیافت کے اختیارات

!!! task "اسے مکمل کرنے کے لیے ہمیں تبدیلیاں کرنی ہوں گی اور دوبارہ تعینات کرنا ہوگا"    
    
    ```bash title=""
    # ماحول کی متغیرات مقرر کریں
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ڈیٹا اپلوڈ کریں اور اپنی انڈیکس بنائیں

    ```

---

**OpenAI فائل سرچ (ڈیفالٹ):**

- Foundry ایجنٹس میں بلٹ ان
- خودکار دستاویز پروسیسنگ اور انڈیکسنگ
- مزید کوئی کنفیگریشن ضروری نہیں

**Azure AI سرچ (اختیاری):**

- ہائبرڈ سیمانٹک اور ویکٹر سرچ
- اپنی مرضی کے انڈیکس مینجمنٹ
- اعلیٰ درجے کی تلاش کی صلاحیتیں
- ضرورت ہے `USE_AZURE_AI_SEARCH_SERVICE=true` کی

---

## 5.3 [ٹریسنگ اور مانیٹرنگ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "اسے مکمل کرنے کے لیے ہمیں تبدیلیاں کرنی ہوں گی اور دوبارہ تعینات کرنا ہوگا"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ٹریسنگ:**

- OpenTelemetry انضمام
- درخواست/ردعمل کی ٹریکنگ
- کارکردگی کے میٹرکس
- Microsoft Foundry پورٹل میں دستیاب

**لاگنگ:**

- کنٹینر ایپس میں اپلیکیشن لاگز
- ساختی لاگنگ بمعہ کارلیشن IDs
- حقیقی وقت اور تاریخی لاگز دیکھنے کی سہولت

---

## 5.4 [ایجنٹ تشخیص](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**مقامی تشخیص:**

- معیار کے تخمینے کے لیے بلٹ ان ایویلیوایٹرز
- حسب ضرورت تشخیصی اسکرپٹس
- کارکردگی کی جانچ

**مسلسل مانیٹرنگ:**

- لائیو تعاملات کی خودکار تشخیص
- معیار کے میٹرکس کی نگرانی
- کارکردگی کا ریگریشن پتہ لگانا

**CI/CD انضمام:**

- GitHub Actions ورک فلو
- خودکار ٹیسٹنگ اور جائزہ
- شماریاتی موازنہ ٹیسٹنگ

---

## 5.5 [AI ریڈ ٹیمنگ ایجنٹ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ریڈ ٹیمنگ:**

- خودکار سیکیورٹی اسکیننگ
- AI سسٹمز کے لیے خطرے کا اندازہ
- متعدد زمروں میں حفاظتی تشخیص

**تصدیق:**

- Azure سروسز کے لیے Managed Identity
- متبادل Azure App Service تصدیق
- ترقی کے لیے بیسک آتھ فال بیک

!!!

    quote "اس لیب کے اختتام تک آپ کے پاس ہونا چاہیے"
    - [ ] اپنے منظر نامے کی ضروریات کی تعریف کی
    - [ ] حسب مرضی ماحول کی متغیرات (کنفیگریشن)
    - [ ] حسب ضرورت ایجنٹ ہدایات (ٹاسک)
    - [ ] حسب ضرورت ٹیمپلیٹ تعینات کیا (ایپ)
    - [ ] بعد از تعیناتی کام مکمل کیے (دستی)
    - [ ] تشخیصی جائزہ چلایا

یہ مثال ایک انٹرپرائز ریٹیل استعمال کے کیس کے لیے ٹیمپلیٹ کی تخصیص کی وضاحت کرتی ہے جس میں دو مخصوص ایجنٹس اور متعدد ماڈل تعیناتی شامل ہیں۔

---

## 5.6 اسے اپنے لیے حسبِ ضرورت بنائیں!

### 5.6.1 منظر نامے کی ضروریات

#### **ایجنٹ کی تعیناتیاں:** 

   - شاپر ایجنٹ: گاہکوں کو مصنوعات تلاش کرنے اور موازنہ کرنے میں مدد دیتا ہے
   - لائلٹی ایجنٹ: گاہکوں کے انعامات اور پروموشنز کا انتظام کرتا ہے

#### **ماڈل کی تعیناتیاں:**

   - `gpt-4.1`: بنیادی چیٹ ماڈل
   - `o3`: پیچیدہ سوالات کے لیے استدلال ماڈل
   - `gpt-4.1-nano`: آسان تعاملات کے لیے ہلکا پھلکا ماڈل
   - `text-embedding-3-large`: سرچ کے لیے اعلیٰ معیار کے ایمبیڈنگز

#### **خصوصیات:**

   - ٹریسنگ اور مانیٹرنگ فعال
   - پروڈکٹ کیٹلاگ کے لیے AI سرچ
   - معیار کی ضمانت کے لیے تشخیصی فریم ورک
   - سیکیورٹی کی تصدیق کے لیے ریڈ ٹیمنگ

---

### 5.6.2 منظر نامے کی تنفیذ


#### 5.6.2.1. پری-ڈیپلوئیمنٹ کنفیگریشن

ایک سیٹ اپ اسکرپٹ بنائیں (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ماحول کا نام سیٹ کریں
azd env set AZURE_ENV_NAME "retail-ai-agents"

# خطہ ترتیب دیں (ماڈل کی دستیابی کی بنیاد پر انتخاب کریں)
azd env set AZURE_LOCATION "eastus2"

# تمام اختیاری خدمات کو فعال کریں
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# بنیادی چیٹ ماڈل کو ترتیب دیں (gpt-4.1 جیسا قریب ترین دستیاب ماڈل)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# بہتر تلاش کے لئے ایمبیڈنگ ماڈل کو ترتیب دیں
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ایجنٹ کا نام سیٹ کریں (پہلا ایجنٹ بنائے گا)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# تلاش کا انڈیکس ترتیب دیں
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ایجنٹ ہدایات

`custom-agents/shopper-agent-instructions.md` بنائیں:

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

`custom-agents/loyalty-agent-instructions.md` بنائیں:

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

#### 5.6.2.3: تعیناتی اسکرپٹ

`deploy-retail.sh` بنائیں:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# ضروریات کی تصدیق کریں
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ماحول ترتیب دیں
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# منتخب علاقے میں کوٹا چیک کریں
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

# ڈھانچے اور ایپلیکیشن کو تعینات کریں
echo "🏗️  Deploying Azure infrastructure..."
azd up

# تعیناتی کے نتائج محفوظ کریں
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ویب ایپ کا URL حاصل کریں
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

#### 5.6.2.4: بعد از تعیناتی کنفیگریشن

`configure-retail-agents.sh` بنائیں:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# تعیناتی کی معلومات حاصل کریں
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# دستی ترتیب کے لیے ہدایات
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

### 5.6.3: ٹیسٹنگ اور توثیق

`test-retail-deployment.sh` بنائیں:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# یقینی بنائیں کہ ماحولیاتی متغیرات سیٹ ہیں
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ویب ایپلیکیشن کی دستیابی کا ٹیسٹ کریں
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

# اگر ترتیب دی گئی ہو تو جانچ چلائیں
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

### 5.6.4 متوقع نتائج

اس نفاذی رہنمائی پر عمل کرنے کے بعد، آپ کے پاس ہوگا:

1. **تعمیراتی ڈھانچہ تعینات کیا گیا:**

      - ماڈل کی تعیناتیاں کے ساتھ Microsoft Foundry پروجیکٹ
      - ویب ایپلیکیشن کی میزبانی کے لیے کنٹینر ایپس
      - پروڈکٹ کیٹلاگ کے لیے AI سرچ سروس
      - مانیٹرنگ کے لیے اپلیکیشن انسائٹس

2. **ابتدائی ایجنٹ:**

      - بنیادی ہدایات کے ساتھ شاپر ایجنٹ
      - فعال فائل سرچ صلاحیت
      - ٹریسنگ اور مانیٹرنگ کی ترتیب

3. **حسب ضرورت کے لیے تیار:**

      - لائلٹی ایجنٹ شامل کرنے کا فریم ورک
      - حسب مرضی ہدایات کے ٹیمپلیٹس
      - ٹیسٹنگ اور توثیق اسکرپٹس
      - مانیٹرنگ اور تشخیص کی ترتیب

4. **پروڈکشن کے لیے تیار:**

      - ریڈ ٹیمنگ کے ساتھ سیکیورٹی اسکیننگ
      - کارکردگی کی نگرانی
      - معیار کی تشخیصی فریم ورک
      - توسیع پذیر فن تعمیر

یہ مثال ظاہر کرتی ہے کہ AZD ٹیمپلیٹ کو مخصوص انٹرپرائز منظرناموں کے لیے کیسے بڑھایا اور اپنی مرضی کے مطابق بنایا جا سکتا ہے جبکہ سیکیورٹی، مانیٹرنگ، اور توسیع پذیری کے لیے بہترین طریقے برقرار رکھے جاتے ہیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) استعمال کرتے ہوئے کیا گیا ہے۔ جبکہ ہم درستگی کے لیے کوشش کرتے ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجموں میں غلطیاں یا بے دقتیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی مادری زبان میں ہی معتبر ماخذ سمجھنا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->