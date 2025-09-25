<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-25T02:23:37+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "my"
}
-->
# 5. Template ကို Customize လုပ်ခြင်း

!!! tip "ဒီ module အဆုံးသတ်မှာ သင်တတ်မြောက်မည်"

    - [ ] Default AI Agent ရဲ့ အစွမ်းအင်များကို လေ့လာပြီး
    - [ ] ကိုယ်ပိုင် index ဖြင့် AI Search ထည့်သွင်းပြီး
    - [ ] Tracing metrics ကို ဖွင့်ပြီး အနုနည်းများကို ချင့်ချိန်ပြီး
    - [ ] အကဲဖြတ်မှု run တစ်ခုကို အောင်မြင်စွာ လုပ်ဆောင်ပြီး
    - [ ] Red-teaming scan တစ်ခုကို run လုပ်ပြီး
    - [ ] **Lab 5: Customization Plan တစ်ခုကို တည်ဆောက်ပြီး** 

---

## 5.1 AI Agent ရဲ့ အစွမ်းအင်များ

!!! success "Lab 01 မှာ ဒီအပိုင်းကို ပြီးမြောက်ခဲ့ပါပြီ"

- **File Search**: OpenAI ရဲ့ built-in file search ကို အသုံးပြု၍ knowledge ကို ရှာဖွေခြင်း
- **Citations**: အဖြေများတွင် အရင်းအမြစ်ကို အလိုအလျောက် ဖော်ပြခြင်း
- **Customizable Instructions**: Agent ရဲ့ အပြုအမူနှင့် ပုဂ္ဂိုလ်ရေးကို ပြောင်းလဲနိုင်ခြင်း
- **Tool Integration**: Custom အစွမ်းအင်များအတွက် Extensible tool system

---

## 5.2 Knowledge Retrieval ရွေးချယ်မှုများ

!!! task "ဒီအပိုင်းကို ပြီးမြောက်ရန် ပြင်ဆင်ပြီး redeploy လုပ်ရန်လိုအပ်သည်"    
    
    ```bash title=""
    # Environment variables ကို သတ်မှတ်ပါ
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Data ကို upload လုပ်ပြီး index ကို ဖန်တီးပါ

    ```

---

**OpenAI File Search (Default):**

- Azure AI Agent service ထဲမှာ built-in ဖြစ်သည်
- Document ကို အလိုအလျောက် process လုပ်ပြီး index လုပ်ခြင်း
- ထပ်မံ configuration လုပ်ရန် မလိုအပ်ပါ

**Azure AI Search (Optional):**

- Semantic နှင့် vector search ကို ပေါင်းစပ်ထားသည်
- Custom index ကို စီမံခန့်ခွဲနိုင်သည်
- အဆင့်မြင့် search အစွမ်းအင်များ
- `USE_AZURE_AI_SEARCH_SERVICE=true` လိုအပ်သည်

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ဒီအပိုင်းကို ပြီးမြောက်ရန် ပြင်ဆင်ပြီး redeploy လုပ်ရန်လိုအပ်သည်"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry integration
- Request/response tracking
- Performance metrics
- AI Foundry portal မှာ ရရှိနိုင်သည်

**Logging:**

- Container Apps မှာ Application logs
- Correlation IDs ဖြင့် structured logging
- Real-time နှင့် historical log viewing

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Quality assessment အတွက် built-in evaluators
- Custom evaluation scripts
- Performance benchmarking

**Continuous Monitoring:**

- Live interactions ကို အလိုအလျောက် အကဲဖြတ်ခြင်း
- Quality metrics tracking
- Performance regression detection

**CI/CD Integration:**

- GitHub Actions workflow
- Automated testing နှင့် evaluation
- Statistical comparison testing

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automated security scanning
- AI systems အတွက် Risk assessment
- အမျိုးမျိုးသော category များအတွက် Safety evaluation

**Authentication:**

- Azure services အတွက် Managed Identity
- Optional Azure App Service authentication
- Development အတွက် Basic auth fallback

!!! quote "Lab အဆုံးမှာ သင်ရရှိထားမည်"

    - [ ] Scenario requirements ကို သတ်မှတ်ပြီး
    - [ ] Env variables ကို customize လုပ်ပြီး (config)
    - [ ] Agent instructions ကို customize လုပ်ပြီး (task)
    - [ ] Customized template ကို deploy လုပ်ပြီး (app)
    - [ ] Post-deployment tasks ကို ပြီးမြောက်ပြီး (manual)
    - [ ] Test evaluation ကို run လုပ်ပြီး

ဒီဥပမာက Enterprise retail use case အတွက် Template ကို customize လုပ်ခြင်းနှင့် Specialized agents နှစ်ခု၊ Model deployments များကို အသုံးပြုခြင်းကို ပြသထားသည်။

---

## 5.6 ကိုယ်ပိုင်အတွက် Customize လုပ်ပါ!

### 5.6.1 Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: Customer များကို Product ရှာဖွေခြင်းနှင့် နှိုင်းယှဉ်ခြင်းအတွက် အကူအညီပေးသည်
   - Loyalty Agent: Customer rewards နှင့် promotions ကို စီမံခန့်ခွဲသည်

#### **Model Deployments:**

   - `gpt-4.1`: Primary chat model
   - `o3`: Complex queries အတွက် Reasoning model
   - `gpt-4.1-nano`: Simple interactions အတွက် Lightweight model
   - `text-embedding-3-large`: Search အတွက် High-quality embeddings

#### **Features:**

   - Tracing နှင့် monitoring ကို enabled လုပ်ထားသည်
   - Product catalog အတွက် AI Search
   - Quality assurance အတွက် Evaluation framework
   - Security validation အတွက် Red teaming

---

### 5.6.2 Scenario Implementation

#### 5.6.2.1 Pre-Deployment Config

Setup script (`setup-retail.sh`) ကို ဖန်တီးပါ

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

#### 5.6.2.2 Agent Instructions

`custom-agents/shopper-agent-instructions.md` ကို ဖန်တီးပါ:

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

`custom-agents/loyalty-agent-instructions.md` ကို ဖန်တီးပါ:

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

#### 5.6.2.3 Deployment Script

`deploy-retail.sh` ကို ဖန်တီးပါ:

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

#### 5.6.2.4 Post-Deployment Config

`configure-retail-agents.sh` ကို ဖန်တီးပါ:

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

### 5.6.3 Testing နှင့် Validation

`test-retail-deployment.sh` ကို ဖန်တီးပါ:

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

### 5.6.4 ရလဒ်များ

ဒီ implementation guide ကို လိုက်နာပြီးနောက် သင်ရရှိမည့်အရာများမှာ:

1. **Deployed Infrastructure:**

      - Model deployments ပါဝင်သော AI Foundry project
      - Web application ကို host လုပ်ထားသော Container Apps
      - Product catalog အတွက် AI Search service
      - Monitoring အတွက် Application Insights

2. **Initial Agent:**

      - Shopper Agent ကို basic instructions ဖြင့် configure လုပ်ထားသည်
      - File search အစွမ်းအင်ကို enabled လုပ်ထားသည်
      - Tracing နှင့် monitoring ကို configure လုပ်ထားသည်

3. **Customization အတွက် ပြင်ဆင်ထားသည်:**

      - Loyalty Agent ထည့်သွင်းရန် Framework
      - Custom instruction templates
      - Testing နှင့် validation scripts
      - Monitoring နှင့် evaluation setup

4. **Production Readiness:**

      - Red teaming ဖြင့် Security scanning
      - Performance monitoring
      - Quality evaluation framework
      - Scalable architecture

ဒီဥပမာက AZD template ကို Enterprise scenarios အတွက် Extension နှင့် Customization လုပ်နိုင်ပုံကို ပြသထားပြီး Security, Monitoring, နှင့် Scalability အတွက် Best practices များကို ထိန်းသိမ်းထားသည်။

---

