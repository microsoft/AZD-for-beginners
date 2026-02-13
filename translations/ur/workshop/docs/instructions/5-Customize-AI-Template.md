# 5. ایک ٹیمپلیٹ حسبِ ضرورت بنائیں

!!! tip "اس ماڈیول کے اختتام تک آپ قابل ہوں گے"

    - [ ] ڈیفالٹ AI ایجنٹ صلاحیتوں کو دریافت کیا
    - [ ] اپنے انڈیکس کے ساتھ AI سرچ شامل کی
    - [ ] ٹریسنگ میٹرکس کو فعال اور تجزیہ کیا
    - [ ] ایک جائزہ رن انجام دیا
    - [ ] ریڈ ٹیمنگ اسکین کیا
    - [ ] **لیب 5: تخصیصی منصوبہ بنایا** 

---

## 5.1 AI ایجنٹ کی صلاحیتیں

!!! success "ہم نے یہ لیب 01 میں مکمل کیا"

- **فائل سرچ**: نالج رٹریول کے لیے OpenAI کا بلٹ ان فائل سرچ
- **حوالہ جات**: جوابات میں خودکار ماخذ کی وضاحت
- **حسبِ ضرورت ہدایات**: ایجنٹ کے رویے اور شخصیت میں ترمیم کریں
- **ٹول انٹیگریشن**: حسبِ ضرورت صلاحیتوں کے لیے توسیع پذیر ٹول سسٹم

---

## 5.2 نالج رٹریول کےاختیارات

!!! task "اسے مکمل کرنے کے لیے تبدیلیاں کرنی ہیں اور دوبارہ تعینات کرنا ہے"    
    
    ```bash title=""
    # ماحول کی ویریبل سیٹ کریں
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ڈیٹا اپ لوڈ کریں اور اپنا انڈیکس بنائیں

    ```

---

**OpenAI فائل سرچ (ڈیفالٹ):**

- Foundry ایجنٹس میں بلٹ ان
- خودکار دستاویز پراسیسنگ اور انڈیکسنگ
- کوئی اضافی کنفیگریشن درکار نہیں

**Azure AI سرچ (اختیاری):**

- ہائبرڈ سیمانٹک اور ویکٹر سرچ
- حسبِ ضرورت انڈیکس مینجمنٹ
- پیش رفت سرچ صلاحیتیں
- `USE_AZURE_AI_SEARCH_SERVICE=true` کی ضرورت ہے

---

## 5.3 [ٹریسنگ اور مانیٹرنگ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "اسے مکمل کرنے کے لیے تبدیلیاں کرنی ہیں اور دوبارہ تعینات کرنا ہے"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ٹریسنگ:**

- OpenTelemetry انٹیگریشن
- درخواست / جواب کا سراغ لگانا
- کارکردگی کے میٹرکس
- Microsoft Foundry پورٹل میں دستیاب

**لاگنگ:**

- کنٹینر ایپس میں ایپلیکیشن لاگز
- correlation IDs کے ساتھ منظم لاگنگ
- حقیقی وقت اور تاریخی لاگز دیکھنا

---

## 5.4 [ایجنٹ کا جائزہ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**مقامی جائزہ:**

- معیار کے اندازے کے لیے بلٹ ان ایویلیوایٹرز
- حسبِ ضرورت جائزہ اسکرپٹس
- کارکردگی کا بینچ مارکنگ

**مسلسل مانیٹرنگ:**

- لائیو تعاملات کا خودکار جائزہ
- معیار میٹرکس کا سراغ لگانا
- کارکردگی میں رجعت کی نشاندہی

**CI/CD انٹیگریشن:**

- GitHub Actions ورک فلو
- خودکار ٹیسٹنگ اور جائزہ
- شماریاتی موازنہ ٹیسٹنگ

---

## 5.5 [AI ریڈ ٹیمنگ ایجنٹ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ریڈ ٹیمنگ:**

- خودکار سیکیورٹی اسکیننگ
- AI سسٹمز کے لیے خطرے کا اندازہ
- مختلف زمروں میں حفاظت کا جائزہ

**تصدیق:**

- Azure سروسز کے لیے منیجد آئیڈینٹیٹی
- اختیاری Azure App Service تصدیق
- ترقی کے لیے بیسک آتھ فال بیک

!!! quote "اس لیب کے اختتام تک آپ کے پاس ہونا چاہیے"
    - [ ] اپنے منظرنامے کی ضروریات متعین کریں
    - [ ] ماحول کی ویریبلز حسبِ ضرورت
    - [ ] ایجنٹ ہدایات حسبِ ضرورت
    - [ ] حسبِ ضرورت ٹیمپلیٹ تعینات کریں
    - [ ] تعیناتی کے بعد کے کام مکمل کریں
    - [ ] جائزہ لینے کا ٹیسٹ چلائیں

یہ مثال ایک انٹرپرائز ریٹیل استعمال کے لیے ٹیمپلیٹ کو حسب ضرورت بنانے کی وضاحت کرتی ہے جس میں دو خاص ایجنٹس اور متعدد ماڈل تعیناتیاں شامل ہیں۔

---

## 5.6 اپنے لیے حسبِ ضرورت بنائیں!

### 5.6.1۔ منظرنامے کی ضروریات

#### **ایجنٹ تعیناتیاں:** 

   - شاپر ایجنٹ: صارفین کو مصنوعات تلاش کرنے اور موازنہ کرنے میں مدد دیتا ہے
   - لائلٹی ایجنٹ: صارفین کے انعامات اور پروموشنز کا انتظام کرتا ہے

#### **ماڈل تعیناتیاں:**

   - `gpt-4.1`: بنیادی چیٹ ماڈل
   - `o3`: پیچیدہ سوالات کے لیے ریزننگ ماڈل
   - `gpt-4.1-nano`: آسان تعاملات کے لیے ہلکا ماڈل
   - `text-embedding-3-large`: سرچ کے لیے اعلی معیار کے ایمبیڈنگز

#### **خصوصیات:**

   - ٹریسنگ اور مانیٹرنگ فعال
   - مصنوعات کے کیٹلاگ کے لیے AI سرچ
   - معیار کی یقین دہانی کے لیے جائزہ فریم ورک
   - سیکیورٹی کی توثیق کے لیے ریڈ ٹیمنگ

---

### 5.6.2 منظرنامے کا نفاذ


#### 5.6.2.1۔ پیش تعیناتی کنفیگریشن

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

# بنیادی چیٹ ماڈل ترتیب دیں (gpt-4o کو gpt-4.1 کے سب سے قریب دستیاب کے طور پر)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
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

# ضروریات کی توثیق کریں
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

# منتخب شدہ علاقے میں کوٹہ چیک کریں
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

# انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
echo "🏗️  Deploying Azure infrastructure..."
azd up

# تعیناتی کے نتائج حاصل کریں
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ویب ایپ کا یو آر ایل حاصل کریں
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

# تصدیق کریں کہ ماحولیاتی متغیرات سیٹ کیے گئے ہیں
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ویب درخواست کی دستیابی کا امتحان دیں
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

# اگر ترتیب دیا گیا ہو تو جائزہ چلائیں
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

اس نفاذی گائیڈ کی پیروی کے بعد، آپ کے پاس ہوگا:

1. **تعینات شدہ انفراسٹرکچر:**

      - ماڈل تعیناتیوں کے ساتھ Microsoft Foundry پروجیکٹ
      - ویب ایپلیکیشن کی میزبانی کے لیے کنٹینر ایپس
      - مصنوعات کے کیٹلاگ کے لیے AI سرچ سروس
      - مانیٹرنگ کے لیے Application Insights

2. **ابتدائی ایجنٹ:**

      - شاپر ایجنٹ جو بنیادی ہدایات سے ترتیب دیا گیا ہے
      - فائل سرچ کی صلاحیت فعال
      - ٹریسنگ اور مانیٹرنگ کنفیگرڈ

3. **حسبِ ضرورت کی تیاری:**

      - لائلٹی ایجنٹ شامل کرنے کا فریم ورک
      - حسبِ ضرورت ہدایات کے ٹیمپلیٹس
      - ٹیسٹنگ اور توثیقی اسکرپٹس
      - مانیٹرنگ اور جائزہ سیٹ اپ

4. **پروڈکشن کی تیاری:**

      - ریڈ ٹیمنگ کے ذریعے سیکیورٹی اسکیننگ
      - کارکردگی کی مانیٹرنگ
      - معیار کا جائزہ فریم ورک
      - توسیع پذیر فن تعمیر

یہ مثال ظاہر کرتی ہے کہ AZD ٹیمپلیٹ کو کس طرح مخصوص انٹرپرائز منظرناموں کے لیے بڑھایا اور حسب ضرورت بنایا جا سکتا ہے جبکہ سیکیورٹی، مانیٹرنگ، اور توسیع پذیری کے بہترین طریقوں کو برقرار رکھا جائے۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ ذمہ داری**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجموں میں غلطیاں یا عدم درستیاں ہوسکتی ہیں۔ اصلی دستاویز اپنی مادری زبان میں معتبر ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->