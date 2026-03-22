# 5. ပုံစံကို သင့်အလိုက် ပြုပြင်ခြင်း

!!! tip "ဤ မော်ဂျူးအဆုံးတွင် သင် အောက်ပါအရာများကို ပြုနိုင်ပါမည်"

    - [ ] ပုံမှန် AI Agent စွမ်းရည်များကို စူးစမ်းလေ့လာခြင်း
    - [ ] သင့်ကိုယ်ပိုင် index ဖြင့် AI Search ကို ထည့်သွင်းခြင်း
    - [ ] Tracing မက်ထရစ်များကို ဖွင့်လှစ်၍ သုံးသပ်ခြင်း
    - [ ] အကဲဖြတ် စမ်းသပ်ချက်ကို ပြုလုပ်ခြင်း
    - [ ] Red-teaming စစ်ဆေးမှုကို ဆောင်ရွက်ခြင်း
    - [ ] **Lab 5: စိတ်ကြိုက်ပြုပြင်မှု စီမံချက် တည်ဆောက်ခြင်း** 

---

## 5.1 AI Agent စွမ်းရည်များ

!!! success "ကျွန်ုပ်တို့သည် Lab 01 တွင် ဤကို ပြီးစီးခဲ့သည်"

- **File Search**: OpenAI တွင် built-in အဖြစ်ပါရှိသည့် ဖိုင်ရှာဖွေမှု — ဗဟုသုတ ရယူရန်
- **Citations**: တုံ့ပြန်ချက်များ၌ အလိုအလျောက် အရင်းအမြစ် ဖော်ပြခြင်း
- **Customizable Instructions**: အေးဂျင့်၏ အပြုအမူနှင့် ကိုယ်ပွားကို ပြင်ဆင်နိုင်ခြင်း
- **Tool Integration**: စိတ်ကြိုက် စွမ်းရည်များအတွက် တိုးချဲ့နိုင်သော ကိရိယာ စနစ်

---

## 5.2 အချက်အလက် ရယူနည်းလမ်းများ

!!! task "ပြီးစီးရန် ပြင်ဆင်ချက်များ ပြုလုပ်ပြီး ပြန်လည် တင်သွင်းရမည်"    
    
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

- Foundry Agents တွင် အတွင်းတပ်ဆင်ထားသည်
- စာရွက်စာတမ်းများကို အလိုအလျောက် လုပ်ဆောင်၍ အင်ဒက်စ် ပြုလုပ်ပေးသည်
- အပို configuration မလိုအပ်ပါ

**Azure AI Search (Optional):**

- semantic နှင့် vector ရှာဖွေမှု ပေါင်းစပ်ထားသည့် Hybrid ရှာဖွေမှု
- စိတ်ကြိုက် အင်ဒက်စ် စီမံခန့်ခွဲမှု
- တိုးတက်သော ရှာဖွေရေး စွမ်းရည်များ
- လိုအပ်သည်: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing နှင့် မော်နီတာလုပ်ခြင်း](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ပြီးစီးရန် ပြင်ဆင်ချက်များ ပြုလုပ်ပြီး ပြန်လည် တင်သွင်းရမည်"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry ပေါင်းစည်းမှု
- တောင်းဆိုမှု/တုံ့ပြန်မှု ကို လိုက်နာစောင့်ကြည့်ခြင်း
- စွမ်းဆောင်ရည် မက်ထရစ်များ
- Microsoft Foundry ပေါ်တယ်တွင် အသုံးပြုနိုင်သည်

**Logging:**

- Container Apps တွင် အပလီကေးရှင်း မှတ်တမ်းများ
- Correlation ID များနှင့် ဖွဲ့စည်းထားသည့် မှတ်တမ်းတင်ခြင်း
- တိုက်ရိုက်နှင့် သမိုင်းမှတ်တမ်းများ ကြည့်ရှုနိုင်ခြင်း

---

## 5.4 [အေးဂျင့် အကဲဖြတ်ခြင်း](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ဒေသတွင်း အကဲဖြတ်ချက်:**

- အရည်အသွေး အကဲဖြတ်ရန် built-in အကဲဖြတ်သူများ
- စိတ်ကြိုက် အကဲဖြတ် စက်ရုပ်များ (scripts)
- စွမ်းဆောင်ရည် စံနှိုင်းယှဉ်ခြင်း

**ဆက်တိုက် မော်နီတာခြင်း:**

- တိုက်ရိုက် ဆက်သွယ်မှုများကို အလိုအလျောက် အကဲဖြတ်ခြင်း
- အရည်အသွေး မက်ထရစ် ခြေရာခံခြင်း
- စွမ်းဆောင်ရည် ကျဆင်းမှု ရှာဖွေရေး

**CI/CD ပေါင်းစည်းမှု:**

- GitHub Actions workflow
- အလိုအလျောက် စမ်းသပ်ခြင်းနှင့် အကဲဖြတ်ခြင်း
- စာရင်းပိုင်းဆိုင်ရာ နှိုင်းယှဉ် စမ်းသပ်ခြင်း

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- အလိုအလျောက် လုံခြုံရေး စစ်ဆေးခြင်း
- AI စနစ်များအတွက် အန္တရာယ် သုံးသပ်ချက်
- အမျိုးမျိုးသော အုပ်စုများအတွင်း ဘေးကင်းရေး အကဲဖြတ်ခြင်း

**အတည်ပြုခြင်း:**

- Azure ဝန်ဆောင်မှုများအတွက် Managed Identity
- ရွေးချယ်စရာ Azure App Service အတည်ပြုခြင်း
- ဖွံ့ဖြိုးရေးအတွက် Basic auth fallback



!!! quote "ဤ လက်တွေ့လေ့ကျင့်ခန်း အဆုံးတွင် သင်မှာ အောက်ပါ အရာများ ရရှိထားသင့်သည်"
    - [ ] သင်၏ စီနာရီယို လိုအပ်ချက်များ သတ်မှတ်ခြင်း
    - [ ] ပတ်ဝန်းကျင် မီတာများ (env variables) ကို စိတ်ကြိုက် ပြင်ဆင်ခြင်း (config)
    - [ ] အေးဂျင့် ညွှန်ကြားချက်များကို စိတ်ကြိုက် ပြင်ဆင်ခြင်း (task)
    - [ ] စိတ်ကြိုက် ပြင်ဆင်ထားသည့် ပုံစံကို တင်သွင်းခြင်း (app)
    - [ ] တင်သွင်းပြီးနောက် လက်လုပ်လုပ်ဆောင်ချက်များကို ပြီးစီးခြင်း (manual)
    - [ ] စမ်းသပ် အကဲဖြတ် တစ်ကြိမ် ချိန်ဆောင်ခြင်း

ဤ ဥပမာသည် နှစ်ဦးပါသော အထူးပြု အေးဂျင့်များနှင့် မော်ဒယ်တပ်ဆင်မှုများစွာပါဝင်သည့် ကုမ္ပဏီဆိုင်ရာ ကုန်ချော ရောင်းဝယ်ရေး အသုံးပြုမှုအတွက် ပုံစံကို စိတ်ကြိုက် ပြုလုပ်သည့် နည်းလမ်းကို ဖော်ပြပါသည်။

---

## 5.6 သင့်အတွက် စိတ်ကြိုက် ပြုပြင်ပါ!

### 5.6.1. စီနာရီယို လိုအပ်ချက်များ

#### **အေးဂျင့် တပ်ဆင်မှုများ:** 

   - Shopper Agent: ဖောက်သည်များကို ထုတ်ကုန်များကို ရှာဖွေ၊ နှိုင်းယှဉ်ကူညီပေးသည်
   - Loyalty Agent: ဖောက်သည် ဆုလာဘ်များနှင့် ပရိုမိုးရှင်းများကို စီမံထိန်းချုပ်ပေးသည်

#### **မော်ဒယ် တပ်ဆင်မှုများ:**

   - `gpt-4.1`: အဓိက စကားပြော မော်ဒယ်
   - `o3`: ရှုပ်ထွေးသော မေးခွန်းများအတွက် အတွေးခေါ်နိုင်မော်ဒယ်
   - `gpt-4.1-nano`: ရိုးရှင်းသော ဆက်သွယ်မှုများအတွက် အလယ်လတ် ပေါ့ပါးမော်ဒယ်
   - `text-embedding-3-large`: ရှာဖွေရေးအတွက် အရည်အသွေးမြင့် embeddings

#### **အင်္ဂါရပ်များ:**

   - Tracing နှင့် မော်နီတာလုပ်ခြင်း ဖွင့်ထားသည်
   - ထုတ်ကုန် ကတ်တလော့အတွက် AI Search
   - အရည်အသွေး အာမခံရေး အကဲဖြတ် ဖရိမ်းဝတ်
   - လုံခြုံရေး အတည်ပြုရေးအတွက် Red teaming

---

### 5.6.2 စီနာရီယို အကောင်အထည်ဖော်ခြင်း


#### 5.6.2.1. တင်သွင်းမီ ပြင်ဆင်မှုများ

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ပတ်ဝန်းကျင်အမည် သတ်မှတ်ပါ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ဒေသကို ပြင်ဆင်ပါ (မော်ဒယ်ရရှိနိုင်မှုအပေါ် မူတည်၍ ရွေးချယ်ပါ)
azd env set AZURE_LOCATION "eastus2"

# ရွေးချယ်နိုင်သော ဝန်ဆောင်မှုများအားလုံးကို ဖွင့်ပါ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ပင်မ chat မော်ဒယ်ကို ပြင်ဆင်ပါ (gpt-4.1 ကို gpt-4.1 အနီးဆုံး ရရှိနိုင်သည့် မော်ဒယ်အဖြစ်)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# တိုးတက်သော ရှာဖွေမှုအတွက် embedding မော်ဒယ်ကို ပြင်ဆင်ပါ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Agent အမည် သတ်မှတ်ပါ (ပထမဆုံး agent ကို ဖန်တီးမည်)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# search index ကို ပြင်ဆင်ပါ
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: အေးဂျင့် ညွှန်ကြားချက်များ

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

#### 5.6.2.3: တင်သွင်း စာရင်း

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# လိုအပ်ချက်များကို အတည်ပြုပါ
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ပတ်ဝန်းကျင်ကို တပ်ဆင်ပါ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ရွေးထားသော တိုင်းဒေသရှိ အရေအတွက်အကန့်အသတ်ကို စစ်ဆေးပါ
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

# အခြေခံအဆောက်အအုံနှင့် အပလီကေးရှင်းကို တပ်ဆင်ပြီး ဖြန့်ချိပါ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ဖြန့်ချိထားသော ရလဒ်များကို ဖမ်းယူပါ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ဝက်ဘ်အက်ပလီကေးရှင်း၏ URL ကို ရယူပါ
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

#### 5.6.2.4: တင်သွင်းပြီးနောက် ပြင်ဆင်မှုများ

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# တပ်ဆင်မှုအချက်အလက်များကို ရယူပါ
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# လက်ဖြင့် ပြင်ဆင်ရန် ညွှန်ကြားချက်များ
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

### 5.6.3: စမ်းသပ်ခြင်းနှင့် အတည်ပြုခြင်း

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ပတ်ဝန်းကျင်တန်ဖိုးများကို သတ်မှတ်ထားကြောင်း အတည်ပြုပါ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ဝဘ်လျှောက်လွှာ၏ ရရှိနိုင်မှုကို စမ်းသပ်ပါ
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

# သတ်မှတ်ထားပါက အကဲဖြတ်မှုကို ပြုလုပ်ပါ
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

### 5.6.4 မျှော်မှန်းရလဒ်များ

ဤ အကောင်အထည်ဖော် လမ်းညွှန်ကို လိုက်နာပြီးနောက် သင့်မှာ ရရှိမည့် အရာများမှာ -

1. **တင်သွင်းထားသော အင်ဖ্রားစထပ်ချာ:**

      - မော်ဒယ် တပ်ဆင်မှုများပါရှိသည့် Microsoft Foundry project
      - ဝက်ဘ် အက်ပလီကေးရှင်းကို ဟိုစ့် လုပ်ထားသော Container Apps
      - ထုတ်ကုန် ကတ်တလော့အတွက် AI Search ဝန်ဆောင်မှု
      - မော်နီတာလုပ်ငန်းအတွက် Application Insights

2. **အစပိုင်း အေးဂျင့်:**

      - အခြေခံ ညွှန်ကြားချက်များနှင့် တပ်ဆင်ထားသော Shopper Agent
      - ဖိုင် ရှာဖွေမှု စွမ်းရည် ဖွင့်ထားသည်
      - Tracing နှင့် မော်နီတာ ဆက်တင်များ ထားရှိထားသည်

3. **စိတ်ကြိုက်ပြုပြင်ရန် အသင့်:**

      - Loyalty Agent ထည့်သွင်းနိုင်ရန် ဖရိမ်းဝတ်
      - စိတ်ကြိုက် ညွှန်ကြားချက် တမ်းပလိတ်များ
      - စမ်းသပ်ခြင်းနှင့် အတည်ပြုခြင်း စာရွက်များ
      - မော်နီတာနှင့် အကဲဖြတ် ချိန်ညှိမှု

4. **ထုတ်လုပ်ရေး အသင့်:**

      - Red teaming ဖြင့် လုံခြုံရေး စစ်ဆေးမှု
      - စွမ်းဆောင်ရည် မော်နီတာခြင်း
      - အရည်အသွေး အကဲဖြတ် ဖရိမ်းဝတ်
      - တိုးချဲ့နိုင်သော ပုံသဏ္ဍာန်

ဤ ဥပမာသည် AZD ပုံစံကို သတ်မှတ်ထားသော စီးပွားရေးအခြေအနေများအတွက် ဘယ်လို တိုးချဲ့၍ စိတ်ကြိုက်ပြုလုပ်နိုင်ပြီး လုံခြုံရေး၊ မော်နီတာနှင့် တိုးချဲ့နိုင်မှုအတွက် ကောင်းမွန်သည့် လေ့လာချက်များကို ထိန်းသိမ်းထားနိုင်ကြောင်းကို ဖော်ပြသည်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သော [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုကို ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူရင်းစာရွက်ကို ၎င်း၏ မူရင်းဘာသာဖြင့် အာဏာပိုင် အထောက်အထားအဖြစ် သတ်မှတ်စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် လူ့ကျွမ်းကျင် ဘာသာပြန်ကို ညွှန်ပြလိုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုရာမှ ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှုချောပါးခြင်းများ သို့မဟုတ် အဓိပ္ပာယ်မွန်းတိုင် မမှန်မှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->