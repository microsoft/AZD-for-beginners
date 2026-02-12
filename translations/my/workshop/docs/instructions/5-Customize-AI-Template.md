# 5. တမ်းပလိတ်ကို စိတ်ကြိုက် ပြင်ဆင်ခြင်း

!!! tip "ဤမော်ဒျူး၏ အဆုံးတွင် သင်မှာ အောက်ပါအရာများကို ပြုလုပ်နိုင်ပါမည်"

    - [ ] မူရင်း AI Agent စွမ်းရည်များကို စူးစမ်းလေ့လာပြီး
    - [ ] သင်၏ ကိုယ်ပိုင် index ဖြင့် AI ရှာဖွေရေးကို ထည့်သွင်းထားပြီး
    - [ ] Tracing မက်ထရစ်များကို ဖွင့်လှစ် သုံးသပ်ထားပြီး
    - [ ] အကဲဖြတ် ပြေးစစ်မှုကို အပြည့်အဝ လုပ်ဆောင်ထားပြီး
    - [ ] red-teaming စစ်ဆေးမှုကို လုပ်ဆောင်ထားပြီး
    - [ ] **Lab 5: စိတ်ကြိုက် ပြင်ဆင်မှု စီမံကိန်း တည်ဆောက်ထားသည်**

---

## 5.1 AI Agent စွမ်းရည်များ

!!! success "Lab 01 တွင် ဤအရာကို ပြီးမြောက်ခဲ့ပါသည်"

- **File Search**: အသိပညာ ရယူခြင်းအတွက် OpenAI ထည့်သွင်းပေးထားသော ဖိုင်ရှာဖွေမှု
- **Citations**: တုံ့ပြန်ချက်များတွင် အရင်းအမြစ်ကို အလိုအလျောက် ကိုးကားပေးခြင်း
- **Customizable Instructions**: အေးဂျင့်၏ အပြုအမူနှင့် ပုဂ္ဂိုလ်ရေးကို ပြင်ဆင်နိုင်သော ညွှန်ကြားချက်များ
- **Tool Integration**: စိတ်ကြိုက် စွမ်းရည်များအတွက် တိုးချဲ့နိုင်သော ကိရိယာ ပေါင်းစည်းမှု

---

## 5.2 အသိပညာ ရယူနည်းများ

!!! task "ဤကို ပြီးမြောက်ရန် ပြင်ဆင်ပြီး ပြန်ထုတ်ဖို့ လိုအပ်ပါသည်"    
    
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

- Foundry Agents အတွက် ထည့်သွင်းပေးထားသည်
- စာရွက်စာတမ်းများကို အလိုအလျောက် လုပ်ဆောင်၍ index မှတ်ပုံတင်ခြင်း
- အပိုဆက်တင်ကွန်ဖင်ဖော်မေရိုင်း လိုအပ်မှု မရှိပါ

**Azure AI Search (Optional):**

- Semantic နှင့် Vector ရှာဖွေမှု ပေါင်းစပ်နိုင်မှု
- index ကို စိတ်ကြိုက် စီမံခန့်ခွဲနိုင်ခြင်း
- တိုးတက်သော ရှာဖွေရေး စွမ်းရည်များ
- `USE_AZURE_AI_SEARCH_SERVICE=true` ဖြစ်ရန် လိုအပ်သည်

---

## 5.3 [Tracing နှင့် စောင့်ကြည့်ခြင်း](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ဤကို ပြီးမြောက်ရန် ပြင်ဆင်ပြီး ပြန်ထုတ်ဖို့ လိုအပ်ပါသည်"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry ပေါင်းစည်းမှု
- တောင်းဆိုမှု/တုံ့ပြန်မှု လိုက်လံခြင်း
- ဆောင်ရွက်မှု မက်ထရစ်များ
- Microsoft Foundry ပေါ်တွင် ရနိုင်ပါသည်

**Logging:**

- Container Apps များအတွင်း အက်ပလီကေးရှင်း မှတ်တမ်းများ
- correlation ID များပါပြီး စနစ်တကျ မှတ်တမ်းတင်ခြင်း
- အချိန်နောက်တရား နှင့် အတိတ် မှတ်တမ်း ကြည့်ရှုနိုင်ခြင်း

---

## 5.4 [Agent အကဲဖြတ်ခြင်း](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local အကဲဖြတ်ခြင်း:**

- အရည်အသွေး အကဲဖြတ်ရန် ထည့်သွင်းထားသော အကဲဖြတ်စနစ်များ
- စိတ်ကြိုက် အကဲဖြတ် စက်ရုပ်များ
- ဆောင်ရွက်မှု စမ်းသပ်ခြင်း

**ဆက်လက် စောင့်ကြည့်ခြင်း:**

- တိုက်ရိုက် လှုပ်ရှားမှုများကို အလိုအလျောက် အကဲဖြတ်ခြင်း
- အရည်အသွေး မက်ထရစ်များကို လိုက်လံခြင်း
- ဆောင်ရွက်မှု ကျဆင်းမှု ရှာဖွေရေး

**CI/CD ပေါင်းစည်းမှု:**

- GitHub Actions အလုပ်စဉ်
- အလိုအလျောက် စမ်းသပ်ခြင်းနှင့် အကဲဖြတ်ခြင်း
- စာရင်းပညာဆိုင်ရာ နှိုင်းယှဉ်စမ်းသပ်မှု

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- အလိုအလျောက် လုံခြုံရေး စစ်ဆေးခြင်း
- AI စနစ်များအတွက် အန္တရာယ် အကဲဖြတ်ခြင်း
- အမျိုးအစား များစွာအလိုက် လုံခြုံရေး အကဲဖြတ်ခြင်း

**Authentication:**

- Azure ဝန်ဆောင်မှုများအတွက် Managed Identity
- ရွေးချယ်စရာ Azure App Service အတည်ပြုခြင်း
- ဖွံ့ဖြိုးရေးအတွက် Basic auth fallback

!!! quote "ဤ lab အဆုံးတွင် သင်တွင် ရှိသင့်သည်"
    - [ ] သင်၏ အခြေအနေ တောင်းဆိုချက်များကို သတ်မှတ်ထားပြီး
    - [ ] ပတ်ဝန်းကျင် ရေစည်းများ (env variables) ကို စိတ်ကြိုက် ပြင်ဆင်ထားပြီး (config)
    - [ ] အေးဂျင့် ညွှန်ကြားချက်များကို စိတ်ကြိုက် ပြင်ဆင်ထားပြီး (task)
    - [ ] စိတ်ကြိုက် ပြင်ဆင်ထားသည့် တမ်းပလိတ်ကို တပ်ဆင်ထားပြီး (app)
    - [ ] တပ်ဆင်ပြီးနောက် လုပ်ဆောင်ရန် လက်မဲ့တာများကို ပြီးမြောက်ထားပြီး (manual)
    - [ ] စမ်းသပ် အကဲဖြတ်ကို အားဖြင့် လုပ်ဆောင်ထားသည်

ဤဥပမာသည် စီးပွားရေး မျိုးဆက်တင်ထားသည့် retail အသုံးအတွက် တမ်းပလိတ်ကို နှစ်ဦး အထူးပြု အေးဂျင့်များနှင့် မော်ဒယ် တပ်ဆင်မှု မျိုးစုံဖြင့် စိတ်ကြိုက်ပြင်ဆင်ခြင်းကို ဖော်ပြထားသည်။

---

## 5.6 သင့်အတွက် စိတ်ကြိုက် ပြင်ဆင်ပါ!

### 5.6.1. အခြေအနေ တောင်းဆိုချက်များ

#### **Agent တပ်ဆင်မှုများ:** 

   - Shopper Agent: ဖောက်သည်များကို ကုန်ပစ္စည်းများကို ရှာဖွေရန်နှင့် နှိုင်းယှဉ်ရန် အကူအညီပေးသည်
   - Loyalty Agent: ဖောက်သည် အကျိုးခံစားခွင့်များနှင့် ပရိုမိုးရှင်းများကို စီမံခန့်ခွဲသည်

#### **Model တပ်ဆင်မှုများ:**

   - `gpt-4.1`: အဓိက chat မော်ဒယ်
   - `o3`: ကောက်ချက်ချရန် ရည်ရွယ်သော reasoning မော်ဒယ်
   - `gpt-4.1-nano`: ရိုးရှင်းသော အပြန်အလှန်များအတွက် အလေးချိန်နည်း မော်ဒယ်
   - `text-embedding-3-large`: ရှာဖွေမှုအတွက် အရည်အသွေးမြင့် embedding များ

#### **ဖိချာများ:**

   - Tracing နှင့် စောင့်ကြည့်ခြင်း ဖွင့်ထားသည်
   - ကုန်ပစ္စည်း ကတ်တလော့အတွက် AI Search
   - အရည်အသွေး အာမခံရေးအတွက် အကဲဖြတ် ခံနည်း
   - လုံခြုံရေး အတည်ပြုချက်အတွက် red teaming

---

### 5.6.2 အခြေအနေ အကောင်အထည်ဖော်ခြင်း


#### 5.6.2.1. တပ်ဆင်ခြင်းမတိုင်မီ ပြင်ဆင်မှု

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ပတ်ဝန်းကျင်အမည်ကို သတ်မှတ်ပါ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ဒေသကို ပြင်ဆင်ပါ (မော်ဒယ်ရရှိနိုင်မှုအပေါ် မူတည်၍ ရွေးပါ)
azd env set AZURE_LOCATION "eastus2"

# ရွေးချယ်စရာ ဝန်ဆောင်မှုများအားလုံးကို ဖွင့်ပါ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# အဓိက စကားပြော မော်ဒယ်ကို ပြင်ဆင်ပါ (gpt-4.1 အနီးဆုံးဖြစ်သော gpt-4o ကို အသုံးပြုပါ)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ရှာဖွေမှု တိုးတက်စေရန် embedding မော်ဒယ်ကို ပြင်ဆင်ပါ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# အေးဂျင့်အမည်ကို သတ်မှတ်ပါ (ပထမ အေးဂျင့်ကို ဖန်တီးမည်)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ရှာဖွေမှု အညွှန်းကို ပြင်ဆင်ပါ
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent ညွှန်ကြားချက်များ

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

#### 5.6.2.3: တပ်ဆင်ရေး စက်ရုပ်

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

# ပတ်ဝန်းကျင်ကို စီစဉ်တပ်ဆင်ပါ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ရွေးချယ်ထားသော ဒေသတွင် ကွိုတာကို စစ်ဆေးပါ
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

# အခြေခံအဆောက်အအုံနှင့် အပလီကေးရှင်းကို တပ်ဆင်ပါ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# တပ်ဆင်မှု၏ ထုတ်လွှင့်ချက်များကို ဖမ်းယူပါ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ဝဘ်အက်ပ်၏ URL ကို ရယူပါ
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

#### 5.6.2.4: တပ်ဆင်ပြီးနောက် ပြင်ဆင်မှု

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# တပ်ဆင်မှုဆိုင်ရာ အချက်အလက်များကို ရယူရန်
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# လက်ဖြင့် ဖွဲ့စည်းတပ်ဆင်ခြင်းအတွက် လမ်းညွှန်ချက်များ
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

# ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သော အချက်များ သတ်မှတ်ထားကြောင်း စစ်ဆေးပါ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ဝက်ဘ်အက်ပလီကေးရှင်း ရရှိနိုင်မှုကို စမ်းသပ်ပါ
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

# ပြင်ဆင်ထားပါက အကဲဖြတ်မှုကို ပြုလုပ်ပါ
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

### 5.6.4 မျှော်လင့်ရနိုင်သော ထွက်လာမှုများ

After following this implementation guide, you will have:

1. **တပ်ဆင်ထားသော အခြေစိုက်အင်ဖရာစရပ်ချာ:**

      - Microsoft Foundry project နှင့် model တပ်ဆင်မှုများ
      - Web application ကို ဟိုက်စတင်ထားသော Container Apps များ
      - ကုန်ပစ္စည်း ကတ်တလော့အတွက် AI Search ဝန်ဆောင်မှု
      - စောင့်ကြည့်ရန် Application Insights

2. **အစ အေးဂျင့်:**

      - အခြေခံ ညွှန်ကြားချက်များဖြင့် ဖွဲ့စည်းထားသော Shopper Agent
      - ဖိုင်ရှာဖွေရေး စွမ်းရည် ဖွင့်ထားခြင်း
      - Tracing နှင့် စောင့်ကြည့်ခြင်း စနစ်တကျ ဖွဲ့စည်းထားခြင်း

3. **စိတ်ကြိုက် ပြင်ဆင်နိုင်ရန် ပြင်ဆင်ထားပြီး:**

      - Loyalty Agent ထည့်ရန် ရှိသော ဖရိမ်ဝိတ်
      - စိတ်ကြိုက် ညွှန်ကြားချက် ရူပဗေဒ များ
      - စမ်းသပ်ခြင်းနှင့် အတည်ပြုခြင်း စက်ရုပ်များ
      - စောင့်ကြည့်ခြင်းနှင့် အကဲဖြတ် စနစ်များ

4. **ထုတ်လုပ်ရေးအဆင်သင့်:**

      - red teaming ဖြင့် လုံခြုံရေး စစ်ထုတ်ခြင်း
      - ဆောင်ရွက်မှု စောင့်ကြည့်ခြင်း
      - အရည်အသွေး အကဲဖြတ် ဖရိမ်ဝိတ်
      - တိုးချဲ့နိုင်သော ဆောက်လုပ်ပုံ

ဤဥပမာသည် AZD တမ်းပလိတ်ကို သီးသန့် စီးပွားရေး အခြေအနေများအတွက် ဘေးလုံခြုံရေး၊ စောင့်ကြည့်ခြင်းနှင့် တိုးချဲ့နိုင်မှု ဆိုင်ရာ အကောင်းဆုံး လက်တွေ့နည်းဗျူဟာများကို ထိန်းသိမ်းထားလျက် တိုးချဲ့ ပြင်ဆင်နိုင်ကြောင်း ပြသလိုက်သည်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု Co-op Translator (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်စေရေး ကြိုးစားသော်လည်း အလိုအလျှောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် ဖော်ပြထားသော မူရင်းကိုသာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန် ဝန်ဆောင်မှုကို အသုံးပြုနိုင်ရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် မနားလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->