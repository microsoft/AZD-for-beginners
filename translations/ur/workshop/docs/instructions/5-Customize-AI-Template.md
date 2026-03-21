# 5. ٹیمپلیٹ کو حسبِ منشا بنائیں

!!! tip "اس ماڈیول کے آخر تک آپ کرنے کے قابل ہوں گے"

    - [ ] ڈیفالٹ AI ایجنٹ صلاحیتوں کو دریافت کیا
    - [ ] اپنی انڈیکس کے ساتھ AI تلاش کا اضافہ کیا
    - [ ] ٹریسنگ میٹرکس کو فعال اور تجزیہ کیا
    - [ ] ایک تشخیصی رن انجام دیا
    - [ ] ریڈ ٹیمنگ اسکین کیا
    - [ ] **لیب 5: حسبِ منشا پلان تیار کیا**

---

## 5.1 AI ایجنٹ کی صلاحیتیں

!!! success "ہم نے یہ لیب 01 میں مکمل کیا"

- **فائل تلاش**: علم حاصل کرنے کے لیے OpenAI کا بلٹ ان فائل سرچ
- **حوالہ جات**: جوابات میں خودکار ماخذ کا حوالہ دینا
- **حسبِ منشا ہدایات**: ایجنٹ کے رویے اور شخصیت کو تبدیل کریں
- **ٹول انٹیگریشن**: حسبِ منشا صلاحیتوں کے لیے قابل توسیع ٹول سسٹم

---

## 5.2 علم حاصل کرنے کے آپشنز

!!! task "اسے مکمل کرنے کے لیے ہمیں تبدیلیاں کر کے دوبارہ تعینات کرنا ہوں گا"    
    
    ```bash title=""
    # ماحول کے متغیرات سیٹ کریں
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ڈیٹا اپلوڈ کریں اور اپنی انڈیکس بنائیں

    ```

---

**OpenAI فائل تلاش (ڈیفالٹ):**

- فاؤنڈری ایجنٹس میں بلٹ ان
- خودکار دستاویز پروسیسنگ اور انڈیکسنگ
- اضافی کنفیگریشن کی ضرورت نہیں

**Azure AI تلاش (اختیاری):**

- ہائبرڈ سیمینٹک اور ویکٹر تلاش
- حسبِ منشا انڈیکس مینجمنٹ
- اعلیٰ درجے کی تلاش کی صلاحیتیں
- `USE_AZURE_AI_SEARCH_SERVICE=true` کی ضرورت

---

## 5.3 [ٹریسنگ اور مانیٹرنگ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "اسے مکمل کرنے کے لیے ہمیں تبدیلیاں کر کے دوبارہ تعینات کرنا ہوں گا"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ٹریسنگ:**

- OpenTelemetry انٹیگریشن
- درخواست/جواب کی ٹریکنگ
- کارکردگی کے میٹرکس
- Microsoft Foundry پورٹل میں دستیاب

**لاگنگ:**

- کنٹینر ایپس میں ایپلیکیشن لاگز
- تعلقاتی شناخت کے ساتھ منظم لاگنگ
- حقیقی وقت اور تاریخی لاگز دیکھنا

---

## 5.4 [ایجنٹ کی تشخیص](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**مقامی تشخیص:**

- معیار کے تجزیے کے لیے بلٹ ان ایویلیویٹرز
- حسبِ منشا تشخیصی اسکرپٹس
- کارکردگی کا بینچ مارکنگ

**مسلسل مانیٹرنگ:**

- لائیو تعاملات کی خودکار تشخیص
- معیار کے میٹرکس کی نگرانی
- کارکردگی میں ردِ رفت کی دریافت

**CI/CD انٹیگریشن:**

- GitHub Actions ورک فلو
- خودکار ٹیسٹنگ اور تشخیص
- شماریاتی موازنہ ٹیسٹنگ

---

## 5.5 [AI ریڈ ٹیمنگ ایجنٹ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ریڈ ٹیمنگ:**

- خودکار سیکیورٹی اسکیننگ
- AI سسٹمز کے لیے خطرے کا اندازہ
- متعدد زمروں میں حفاظتی تشخیص

**تصدیق:**

- Azure سروسز کے لیے Managed Identity
- اختیاری Azure App Service توثیق
- ترقی کے لیے بنیادی توثیق کا سہارا

!!! quote "اس لیب کے آخر تک آپ کو ہونا چاہیے"
    - [ ] اپنے منظرنامے کی ضروریات کا تعین کیا
    - [ ] انوائرنمنٹ ویری ایبلز (config) حسبِ منشا کیے
    - [ ] ایجنٹ کی ہدایات (task) حسبِ منشا کیں
    - [ ] حسبِ منشا ٹیمپلیٹ (app) تعینات کیا
    - [ ] تعیناتی کے بعد کے کام مکمل کیے (manual)
    - [ ] ایک ٹیسٹ تشخیص چلائی

یہ مثال ایک انٹرپرائز ریٹیل استعمال کیس کے لیے ٹیمپلیٹ کو دو ماہر ایجنٹس اور متعدد ماڈل تعینات کرنے کے ساتھ کسٹمائز کرنے کا مظاہرہ کرتی ہے۔

---

## 5.6 اسے اپنے لیے حسبِ منشا بنائیں!

### 5.6.1 منظرنامے کی ضروریات

#### **ایجنٹ کی تعیناتیاں:** 

   - شاپر ایجنٹ: صارفین کو مصنوعات تلاش کرنے اور موازنہ کرنے میں مدد دیتا ہے
   - لائلٹی ایجنٹ: صارفین کے انعامات اور پروموشنز کا انتظام کرتا ہے

#### **ماڈل کی تعیناتیاں:**

   - `gpt-4.1`: بنیادی چیٹ ماڈل
   - `o3`: پیچیدہ سوالات کے لیے استدلال ماڈل
   - `gpt-4.1-nano`: سادہ تعاملات کے لیے ہلکا ماڈل
   - `text-embedding-3-large`: تلاش کے لیے اعلیٰ معیار کے ایمبیڈنگز

#### **خصوصیات:**

   - ٹریسنگ اور مانیٹرنگ فعال
   - پروڈکٹ کیٹلاگ کے لیے AI تلاش
   - معیار کی یقین دہانی کے لیے جانچ کا فریم ورک
   - حفاظتی توثیق کے لیے ریڈ ٹیمنگ

---

### 5.6.2 منظرنامے کا نفاذ


#### 5.6.2.1. پری-ڈپلائمنٹ کنفیگریشن

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

# بنیادی چیٹ ماڈل ترتیب دیں (gpt-4.1 کو gpt-4.1 کے قریب ترین دستیاب ماڈل کے طور پر)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# بہتر تلاش کے لیے ایمبیڈنگ ماڈل ترتیب دیں
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ایجنٹ کا نام سیٹ کریں (پہلا ایجنٹ بنائے گا)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# تلاش انڈیکس ترتیب دیں
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ایجنٹ کی ہدایات

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

# شرائطِ لازم کی توثیق کریں
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ماحول سیٹ کریں
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# منتخب کردہ علاقے میں کوٹہ چیک کریں
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

# انفراسٹرکچر اور ایپلیکیشن تعینات کریں
echo "🏗️  Deploying Azure infrastructure..."
azd up

# تعیناتی کے نتائج حاصل کریں
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ویب ایپ کا URL حاصل کریں
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

#### 5.6.2.4: تعیناتی کے بعد کی کنفیگریشن

`configure-retail-agents.sh` بنائیں:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# تعیناتی کی معلومات حاصل کریں
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# دستی ترتیب کی ہدایات
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

### 5.6.3: جانچ اور تصدیق

`test-retail-deployment.sh` بنائیں:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# تصدیق کریں کہ ماحولیاتی متغیرات مقرر کیے گئے ہیں
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ویب ایپلیکیشن کی دستیابی کا ٹیسٹ کریں
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

اس نفاذی گائیڈ کی پیروی کرنے کے بعد، آپ کے پاس ہوگا:

1. **تعینات شدہ بنیادی ڈھانچہ:**

      - Microsoft Foundry پروجیکٹ ماڈل کی تعیناتیوں کے ساتھ
      - کنٹینر ایپس جہاں ویب ایپلیکیشن ہوسٹ ہو رہی ہے
      - پروڈکٹ کیٹلاگ کے لیے AI تلاش سروس
      - مانیٹرنگ کے لیے Application Insights

2. **ابتدائی ایجنٹ:**

      - شاپر ایجنٹ بنیادی ہدایات کے ساتھ مرتب
      - فائل تلاش کی صلاحیت فعال
      - ٹریسنگ اور مانیٹرنگ ترتیب دی گئی

3. **حسبِ منشا بنانے کے لیے تیار:**

      - لائلٹی ایجنٹ شامل کرنے کا فریم ورک
      - کسٹم ہدایت ٹیمپلیٹس
      - جانچ اور تصدیقی اسکرپٹس
      - مانیٹرنگ اور تشخیص کا نظام

4. **پروڈکشن کے لیے تیار:**

      - ریڈ ٹیمنگ کے ساتھ سیکیورٹی اسکیننگ
      - کارکردگی کی نگرانی
      - معیار کی تشخیص کا فریم ورک
      - توسیعی معمار

یہ مثال دکھاتی ہے کہ AZD ٹیمپلیٹ کو مخصوص انٹرپرائز منظرناموں کے لیے کس طرح توسیع اور حسبِ منشا کیا جا سکتا ہے جبکہ سیکیورٹی، مانیٹرنگ، اور توسیع پذیری کے بہترین طریقہ کار برقرار رکھے جاتے ہیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا نقائص ہو سکتے ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ذریعہ تصور کی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->