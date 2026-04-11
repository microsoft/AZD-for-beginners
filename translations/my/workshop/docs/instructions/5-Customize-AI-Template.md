# 5. Customize a Template

!!! tip "ဤမော်ဂျူးလ်၏အဆုံးတွင် သင်လုပ်နိုင်မည့်အရာများ"

    - [ ] အလိုအလျောက် AI Agent စွမ်းရည်ပုံစံများကို စူးစမ်းလေ့လာပြီးပြီ
    - [ ] ကိုယ့်အပေါ်၌ index တစ်ခုဖြင့် AI Search ထည့်သွင်းပြီးပြီ
    - [ ] Tracing မီထရစ်များကို ဖွင့်လှစ်၍ ကောက်ချက်ချပြီးပြီ
    - [ ] အကဲဖြတ်ပြေးဆွဲမှုကို အကောင်အထည်ဖော်ပြီးပြီ
    - [ ] red-teaming စကန်းကို ဖမ်းဆီးပြီးပြီ
    - [ ] **Lab 5: ပြင်ဆင်ရေးအစီအစဉ်တစ်ခု ဖန်တီးပြီးပြီ** 

---

## 5.1 AI Agent Capabilities

!!! success "ဒီဟာကို Lab 01 မှာ ပြီးမြောက်ထားပါပြီ"

- **File Search**: OpenAI ၏ အတွင်းတပ်ဆင်ထားသော ဖိုင်ရှာရေး ကို သိမ်းဆည်းအသုံးပြုခြင်း
- **Citations**: တုံ့ပြန်ချက်များတွင် အရင်းအမြစ်ကို အလိုအလျောက် ဖော်ပြပေးခြင်း
- **Customizable Instructions**: agent ၏ အပြုအမူနှင့် ကိုယ်ရည်ကိုယ်သွေးကို ပြင်ဆင်နိုင်ခြင်း
- **Tool Integration**: စိတ်ကြိုက် လုပ်ဆောင်ချက်များအတွက် တိုးချဲ့နိုင်သော tool စနစ်

---

## 5.2 Knowledge Retrieval Options

!!! task "ဤကိုပြီးစေရန် ပြင်ဆင်မှုများ ပြုလုပ်ပြီး ထပ်မံ deploy လုပ်ရန်လိုအပ်သည်"    
    
    ```bash title=""
    # ပတ်ဝန်းကျင် environment များကို သတ်မှတ်ပါ
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ဒေတာတွေကိုတင်/upload လုပ်ပြီး index ကို ဖန်တီးပါ

    ```

---

**OpenAI File Search (Default):**

- Foundry Agents ထဲတွင် အတွင်းထည့်ထားသည်
- စာရွက်စာတမ်းများကို အလိုအလျောက် ဆက်စပ်လုပ်ထုတ်ခြင်းနှင့် index ပြုစုခြင်း
- ထပ်ဆောင်း ပတ်သက်သော ဖော်ပြချက်များမလိုအပ်

**Azure AI Search (Optional):**

- Hybrid semantic နှင့် vector search
- စိတ်ကြိုက် index စီမံခန့်ခွဲမှု
- အဆင့်မြင့် ရှာဖွေရေး စွမ်းရည်များ
- `USE_AZURE_AI_SEARCH_SERVICE=true` သတ်မှတ်ရန် လိုအပ်သည်

---

## 5.3 [Tracing နှင့် စောင့်ကြည့်မှု](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ဤကိုပြီးစေရန် ပြင်ဆင်မှုများ ပြုလုပ်ပြီး ထပ်မံ deploy လုပ်ရန်လိုအပ်သည်"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry ပေါင်းစည်းမှု
- မေးမြန်းမှု/တုံ့ပြန်မှု လိုက်လံခြင်း
- ဆောင်ရွက်မှု မီထရစ်များ
- Microsoft Foundry ပေါ်တွင် တွေ့ရှိနိုင်သည်

**Logging:**

- Container Apps တွင် အပ်လိုအပ်သော application logs
- correlation ID များနှင့် အဖွဲ့ပြီး စနစ်တကျ logging
- အချိန်နောက်ခံနှင့် အတိတ်မှတ်တမ်း log ကြည့်ရှုနိုင်ခြင်း

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- သတ်မှတ်အရည်အသွေး အကဲဖြတ်ရန် အတွင်းပါတဲ့ evaluator များ
- စိတ်တိုင်းမကျသော အကဲဖြတ်ရေး scripts များ
- စွမ်းဆောင်ရည် အခြေခံ စမ်းသပ်ချက်များ

**Continuous Monitoring:**

- လက်ရှိ အပြန်အလှန်များကို အလိုအလျောက် အကဲဖြတ်ခြင်း
- အရည်အသွေး မီထရစ်များကို ချုံ့ချုံ့ကြည့်ခြင်း
- စွမ်းဆောင်ရည် regressions တွေကို ရှာဖွေရန်

**CI/CD Integration:**

- GitHub Actions workflow
- အလိုအလျောက် စမ်းသပ်ခြင်းနှင့် အကဲဖြတ်ခြင်း
- စာရင်းအင်းဆိုင်ရာ နှိုင်းယှဉ် စမ်းသပ်မှု

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- အလိုအလျောက် လုံခြုံရေး စကန်းလုပ်ခြင်း
- AI စနစ်များအတွက် အန္တရာယ် ခန့်မှန်းချက်
- အမျိုးမျိုးသော အစုအဝေးများတွင် ဘေးကင်းရေးအကဲဖြတ်ခြင်း

**Authentication:**

- Azure ဝန်ဆောင်မှုများအတွက် Managed Identity
- ရွေးချယ်ချက်အနေဖြင့် Azure App Service authentication
- ဖွံ့ဖြိုးရေးအတွက် basic auth fallback

!!! quote "ဤ Lab ၏အဆုံးတွင် သင်တွင် ရှိသင့်သည်များ"
    - [ ] သင်၏ အခြေအနေ 요구ments များကို သတ်မှတ်ထားသည်
    - [ ] ပတ်ဝန်းကျင် variables (config) များကို စိတ်ကြိုက် ပြင်ဆင်ထားသည်
    - [ ] agent အတွက် အသိပညာ အညွှန်းများ (task) ကို စိတ်ကြိုက် ပြင်ဆင်ထားသည်
    - [ ] စိတ်ကြိုက် template ကို deploy လုပ်ပြီးပြီ (app)
    - [ ] deploy ပြီးနောက် လုပ်ဆောင်ရန် အလုပ်များ (manual) ကို ပြီးမြောက်အောင်လုပ်ထားသည်
    - [ ] စမ်းသပ်အကဲဖြတ်မှု တစ်ခု ပြေးဆောင်ထားသည်

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: ဖောက်သည်များကို ထုတ်ကုန် ရှာဖွေခြင်းနှင့် နှိုင်းယှဉ်နိုင်ရန် ရှ่วยပါသည်
   - Loyalty Agent: ဖောက်သည်များ၏ reward များနှင့် promotion များကို ကူညီ စီမံဆောင်ရွက်ပေးသည်

#### **Model Deployments:**

   - `gpt-4.1`: အဓိက chat မော်ဒယ်
   - `o3`: ခက်ခဲသော မေးခွန်းများအတွက် သွေးပြင်းစိတ်ရှာ ဖော်ထုတ်ဆောင်ရွက်ရန် reasoning မော်ဒယ်
   - `gpt-4.1-nano`: ရိုးရှင်းသော အပြန်အလှန်များအတွက် အလေးချိန်နည်း မော်ဒယ်
   - `text-embedding-3-large`: ရှာဖွေရေးအတွက် အရည်အသွေးမြင့် embeddings

#### **Features:**

   - Tracing နှင့် စောင့်ကြည့်မှု ဖွင့်ထားသည်
   - ထုတ်ကုန် catalog အတွက် AI Search
   - အရည်အသွေး သေချာစေရေးအတွက် အကဲဖြတ်ရေး ဖရိမ်ဝေါ့ခ်
   - လုံခြုံရေး အတည်ပြုရန် red teaming

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ပတ်ဝန်းကျင်အမည်ကို သတ်မှတ်ပါ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ဒေသကို ဆက်တင်ပါ (မော်ဒယ် ရရှိနိုင်မှုအပေါ် မူတည်၍ ရွေးပါ)
azd env set AZURE_LOCATION "eastus2"

# ရွေးချယ်နိုင်သည့် ဝန်ဆောင်မှုအားလုံးကို ဖွင့်ပါ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# အဓိက chat မော်ဒယ်ကို ဆက်တင်ပါ (gpt-4.1 ကို gpt-4.1 အနီးဆုံး ရနိုင်သည့် မော်ဒယ်အဖြစ် သတ်မှတ်ထားသည်)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# တိုးတက်သော ရှာဖွေရေးအတွက် embedding မော်ဒယ်ကို ဆက်တင်ပါ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# အေးဂျင့်အမည်ကို သတ်မှတ်ပါ (ပထမအေးဂျင့်ကို ဖန်တီးမည်)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ရှာဖွေရေး အင်ဒက်စ်ကို ဆက်တင်ပါ
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

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

#### 5.6.2.3: Deployment Script

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

# ပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ရွေးချယ်ထားသော ဒေသတွင် ကွိုတာကို စစ်ဆေးပါ
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

# အဆောက်အဦဖွဲ့စည်းမှုနှင့် အက်ပလီကေးရှင်းကို တင်သွင်းပါ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# တပ်ဆင်မှု၏ အထွက်များကို ဖမ်းယူပါ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ဝက်ဘ်အက်ပလီကေးရှင်း၏ URL ကို ရယူပါ
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

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# တပ်ဆင်မှု အချက်အလက်များကို ရယူပါ
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# လက်ဖြင့် ဖွဲ့စည်းခြင်းအတွက် လမ်းညွှန်ချက်များ
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

### 5.6.3: Testing and Validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ပတ်ဝန်းကျင် အပြောင်းအလဲများ (environment variables) သတ်မှတ်ထားကြောင်း စစ်ဆေးပါ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ဝဘ် အက်ပလီကေးရှင်း ရရှိနိုင်မှုကို စမ်းသပ်ပါ
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

# သတ်မှတ်ထားပါက အကဲဖြတ်မှုကို ဆောင်ရွက်ပါ
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

### 5.6.4 Expected Outcomes

After following this implementation guide, you will have:

1. **Deployed Infrastructure:**

      - Microsoft Foundry project နှင့် model deployments များ
      - Web application ကို ဟိုစ့်ထားသည့် Container Apps များ
      - ထုတ်ကုန် catalog အတွက် AI Search ဝန်ဆောင်မှု
      - မော်နီတာရေးအတွက် Application Insights

2. **Initial Agent:**

      - အခြေခံ အညွှန်းများဖြင့် ပြုစုထားသော Shopper Agent
      - File search စွမ်းရည် ဖွင့်ထားသည်
      - Tracing နှင့် မော်နီတာရေး စနစ်များ ဖွင့်ထားသည်

3. **Ready for Customization:**

      - Loyalty Agent ထည့်သွင်းနိုင်ရန် ဖရိမ်ဝေါ့ခ်
      - စိတ်ကြိုက် အညွှန်း ဗဟိုပုံစံများ
      - စမ်းသပ်ခြင်းနှင့် အတည်ပြုရေး scripts များ
      - မော်နီတာနှင့် အကဲဖြတ်ရေး ချိတ်ဆက်မှုများ

4. **Production Readiness:**

      - red teaming ဖြင့် လုံခြုံရေး စစ်ဆေးခြင်း
      - စွမ်းဆောင်ရည် မော်နီတာရေး
      - အရည်အသွေး အကဲဖြတ်ရေး ဖရိမ်ဝေါ့ခ်
      - များပြားစွာတိုးချဲ့နိုင်သော အဆောက်အအုံ

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုရန် လိုအပ်ပါသည်။ မူလ စာရွက်စာတမ်းကို ထုတ်ဖော်ခဲ့သော မူလဘာသာစကားဖြင့်သာ ထားရှိသင့်ပြီး အဲဒါကို အဓိက အာဏာရှိ မူရင်းအရင်းအမြစ်အဖြစ် ယူဆရပါမည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကိုယ်စားလှယ် လူ့ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို ညှိနှိုင်းအသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြမှုများအပေါ် ကျွန်ုပ်တို့ တာဝန်မယူပါကြောင်း အသိပေးပါသည်။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->