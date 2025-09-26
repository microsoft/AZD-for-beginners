<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T12:03:44+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "ur"
}
-->
# 5. ٹیمپلیٹ کو حسب ضرورت بنائیں

!!! tip "اس ماڈیول کے اختتام تک آپ یہ کرنے کے قابل ہوں گے"

    - [ ] ڈیفالٹ AI ایجنٹ کی صلاحیتوں کو دریافت کریں
    - [ ] اپنی انڈیکس کے ساتھ AI سرچ شامل کریں
    - [ ] ٹریسنگ میٹرکس کو فعال کریں اور تجزیہ کریں
    - [ ] ایک ایویلیوایشن رن انجام دیں
    - [ ] ریڈ ٹیمنگ اسکین انجام دیں
    - [ ] **لیب 5: حسب ضرورت منصوبہ تیار کریں**

---

## 5.1 AI ایجنٹ کی صلاحیتیں

!!! success "ہم نے یہ لیب 01 میں مکمل کیا"

- **فائل سرچ**: OpenAI کی بلٹ ان فائل سرچ علم کی بازیافت کے لیے
- **حوالہ جات**: جوابات میں خودکار ذریعہ کی وضاحت
- **حسب ضرورت ہدایات**: ایجنٹ کے رویے اور شخصیت میں ترمیم کریں
- **ٹول انٹیگریشن**: حسب ضرورت صلاحیتوں کے لیے قابل توسیع ٹول سسٹم

---

## 5.2 علم کی بازیافت کے اختیارات

!!! task "اسے مکمل کرنے کے لیے ہمیں تبدیلیاں کرنی ہوں گی اور دوبارہ تعیناتی کرنی ہوگی"    
    
    ```bash title=""
    # ماحول کے متغیرات سیٹ کریں
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ڈیٹا اپ لوڈ کریں اور اپنا انڈیکس بنائیں

    ```

---

**OpenAI فائل سرچ (ڈیفالٹ):**

- Azure AI ایجنٹ سروس میں بلٹ ان
- خودکار دستاویز پروسیسنگ اور انڈیکسنگ
- اضافی کنفیگریشن کی ضرورت نہیں

**Azure AI سرچ (اختیاری):**

- ہائبرڈ سیمینٹک اور ویکٹر سرچ
- حسب ضرورت انڈیکس مینجمنٹ
- جدید سرچ صلاحیتیں
- `USE_AZURE_AI_SEARCH_SERVICE=true` کی ضرورت ہے

---

## 5.3 [ٹریسنگ اور مانیٹرنگ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "اسے مکمل کرنے کے لیے ہمیں تبدیلیاں کرنی ہوں گی اور دوبارہ تعیناتی کرنی ہوگی"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ٹریسنگ:**

- OpenTelemetry انٹیگریشن
- درخواست/جواب کی ٹریکنگ
- کارکردگی کے میٹرکس
- AI Foundry پورٹل میں دستیاب

**لاگنگ:**

- کنٹینر ایپس میں ایپلیکیشن لاگز
- تعلق آئی ڈیز کے ساتھ ساختی لاگنگ
- حقیقی وقت اور تاریخی لاگ دیکھنا

---

## 5.4 [ایجنٹ ایویلیوایشن](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**مقامی ایویلیوایشن:**

- معیار کی تشخیص کے لیے بلٹ ان ایویلیوایٹرز
- حسب ضرورت ایویلیوایشن اسکرپٹس
- کارکردگی کا بینچ مارکنگ

**مسلسل مانیٹرنگ:**

- لائیو تعاملات کی خودکار ایویلیوایشن
- معیار کے میٹرکس کی ٹریکنگ
- کارکردگی کی کمی کا پتہ لگانا

**CI/CD انٹیگریشن:**

- GitHub Actions ورک فلو
- خودکار ٹیسٹنگ اور ایویلیوایشن
- شماریاتی موازنہ ٹیسٹنگ

---

## 5.5 [AI ریڈ ٹیمنگ ایجنٹ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ریڈ ٹیمنگ:**

- خودکار سیکیورٹی اسکیننگ
- AI سسٹمز کے لیے خطرے کی تشخیص
- متعدد زمروں میں حفاظتی تشخیص

**تصدیق:**

- Azure سروسز کے لیے مینیجڈ شناخت
- اختیاری Azure App Service تصدیق
- ترقی کے لیے بنیادی تصدیق کا متبادل

!!! quote "اس لیب کے اختتام تک آپ کے پاس ہونا چاہیے"
    - [ ] اپنے منظر نامے کی ضروریات کی وضاحت کریں
    - [ ] ماحول کے متغیرات کو حسب ضرورت بنائیں (کنفیگریشن)
    - [ ] ایجنٹ کی ہدایات کو حسب ضرورت بنائیں (ٹاسک)
    - [ ] حسب ضرورت ٹیمپلیٹ کو تعینات کریں (ایپ)
    - [ ] تعیناتی کے بعد کے کام مکمل کریں (دستی)
    - [ ] ایک ٹیسٹ ایویلیوایشن چلائیں

یہ مثال ایک انٹرپرائز ریٹیل کیس کے لیے ٹیمپلیٹ کو حسب ضرورت بنانے کا مظاہرہ کرتی ہے، جس میں دو خصوصی ایجنٹس اور متعدد ماڈل تعینات کیے گئے ہیں۔

---

## 5.6 اسے اپنے لیے حسب ضرورت بنائیں!

### 5.6.1 منظر نامے کی ضروریات

#### **ایجنٹ تعیناتیاں:** 

   - شاپر ایجنٹ: صارفین کو مصنوعات تلاش کرنے اور موازنہ کرنے میں مدد کرتا ہے
   - لائلٹی ایجنٹ: صارفین کے انعامات اور پروموشنز کا انتظام کرتا ہے

#### **ماڈل تعیناتیاں:**

   - `gpt-4.1`: بنیادی چیٹ ماڈل
   - `o3`: پیچیدہ سوالات کے لیے استدلال ماڈل
   - `gpt-4.1-nano`: سادہ تعاملات کے لیے ہلکا پھلکا ماڈل
   - `text-embedding-3-large`: سرچ کے لیے اعلیٰ معیار کے ایمبیڈنگز

#### **خصوصیات:**

   - ٹریسنگ اور مانیٹرنگ فعال
   - مصنوعات کی کیٹلاگ کے لیے AI سرچ
   - معیار کی یقین دہانی کے لیے ایویلیوایشن فریم ورک
   - سیکیورٹی کی توثیق کے لیے ریڈ ٹیمنگ

---

### 5.6.2 منظر نامے کا نفاذ

#### 5.6.2.1 تعیناتی سے پہلے کی کنفیگریشن

ایک سیٹ اپ اسکرپٹ بنائیں (`setup-retail.sh`)

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

#### 5.6.2.4: تعیناتی کے بعد کی کنفیگریشن

`configure-retail-agents.sh` بنائیں:

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

### 5.6.3: ٹیسٹنگ اور توثیق

`test-retail-deployment.sh` بنائیں:

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

### 5.6.4 متوقع نتائج

اس نفاذی گائیڈ کی پیروی کرنے کے بعد، آپ کے پاس ہوگا:

1. **تعینات شدہ انفراسٹرکچر:**

      - ماڈل تعیناتیوں کے ساتھ AI Foundry پروجیکٹ
      - ویب ایپلیکیشن کی میزبانی کرنے والے کنٹینر ایپس
      - مصنوعات کی کیٹلاگ کے لیے AI سرچ سروس
      - مانیٹرنگ کے لیے ایپلیکیشن انسائٹس

2. **ابتدائی ایجنٹ:**

      - شاپر ایجنٹ بنیادی ہدایات کے ساتھ ترتیب دیا گیا
      - فائل سرچ کی صلاحیت فعال
      - ٹریسنگ اور مانیٹرنگ ترتیب دی گئی

3. **حسب ضرورت کے لیے تیار:**

      - لائلٹی ایجنٹ شامل کرنے کے لیے فریم ورک
      - حسب ضرورت ہدایات کے ٹیمپلیٹس
      - ٹیسٹنگ اور توثیق کے اسکرپٹس
      - مانیٹرنگ اور ایویلیوایشن سیٹ اپ

4. **پروڈکشن کے لیے تیاری:**

      - ریڈ ٹیمنگ کے ساتھ سیکیورٹی اسکیننگ
      - کارکردگی کی مانیٹرنگ
      - معیار کی ایویلیوایشن فریم ورک
      - قابل توسیع آرکیٹیکچر

یہ مثال ظاہر کرتی ہے کہ AZD ٹیمپلیٹ کو مخصوص انٹرپرائز منظرناموں کے لیے کیسے بڑھایا اور حسب ضرورت بنایا جا سکتا ہے، جبکہ سیکیورٹی، مانیٹرنگ، اور قابل توسیعیت کے بہترین طریقوں کو برقرار رکھا جاتا ہے۔

---

