# 5. ഒരു ടെംപ്ലേറ്റ് കസ്റ്റമൈസ് ചെയ്യുക

!!! tip "ഈ മഡ്യൂളിന്റെ അവസാനം നിങ്ങൾക്ക് സാധിക്കാനിരിക്കുന്നതുകൾ"

    - [ ] പൊതു AI ഏജന്റ് ശേഷികള്‍ അന്വേഷിച്ചു
    - [ ] നിങ്ങളുടെ സ്വന്തം ഇൻഡക്സ് ഉപയോഗിച്ച് AI സെർച്ച് ചേർത്ത്
    - [ ] ട്രേസിങ് മെട്രിക്ക്സുകൾ പ്രവർത്തനക്ഷമമാക്കി വിശകലനം ചെയ്തു
    - [ ] ഒരു മൂല്യനിർണ്ണയം നടത്തിച്ചു
    - [ ] ഒരു റെഡ്-ടിമിംഗ് സ്കാൻ നടത്തിയതു്
    - [ ] **ലാബ് 5: കസ്റ്റമൈസേഷൻ പ്ലാൻ നിർമ്മിച്ചു** 

---

## 5.1 AI ഏജന്റ് ശേഷികള്‍

!!! success "ഇത് ലാബ് 01 ൽ പൂർത്തിയാക്കി"

- **ഫയൽ സെർച്ച്**: അറിവ് തിരയലിന് OpenAIയുടെ ഇൻബിൽറ്റ് ഫയൽ സെർച്ച്
- **ഉദ്ധരണികൾ**: മറുപടികളിൽ സ്വയം സ്രോതസ്സ് അവകാശമൊടുക്കൽ
- **കസ്റ്റമൈസി ചെയ്യാവുന്ന നിർദ്ദേശങ്ങൾ**: ഏജന്റ് പെരുമാറ്റവും വ്യക്തിത്വവും പരിഷ്കരിക്കുക
- **ടൂൾ ഇന്റഗ്രേഷൻ**: വ്യത്യസ്ത ശേഷികള്‍ക്കായി വിപുലീകരണ സാധ്യതയുള്ള ടൂൾ സിസ്റ്റം

---

## 5.2 അറിവ് തിരയൽ ഓപ്ഷനുകൾ

!!! task "പൂർത്തിയാക്കാൻ മാറ്റങ്ങൾ ചെയ്ത് റിഡിപ്ലോയ് ചെയ്യണം"    
    
    ```bash title=""
    # പരിസ്ഥിതി മാറ്റിലുകൾ സജ്ജമാക്കുക
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ഡാറ്റ അപ്‌ലോഡ് ചെയ്ത് എന്റെ ഇൻഡക്സ് സൃഷ്ടിക്കുക

    ```

---

**OpenAI ഫയൽ സെർച്ച് (ഡിഫോൾട്):**

- ഫൗണ്ട്രി ഏജന്റുകളിലേക്ക് ഇൻബിൽറ്റ്
- സ്വയം ഡോക്യുമെന്റ് പ്രോസസ്സിങ്ങും ഇൻഡക്സിംഗും
- അധിക കോൺഫിഗറേഷൻ ആവശ്യമില്ല

**അസ്യൂർ AI സെർച്ച് (ഐച്ഛികം):**

- ഹൈബ്രിഡ് സെമാന്റിക്, വെക്ടർ സെർച്ചിങ്
- ഞങ്ങൾക്ക് ഇഷ്ടമുള്ള ഇൻഡക്സ് മാനേജ്മെന്റ്
- പുരോഗമന സെർച്ച് കഴിവുകൾ
- `USE_AZURE_AI_SEARCH_SERVICE=true` ആവശ്യമാണ്

---

## 5.3 [ട്രേസിങ് & മോണിറ്ററിംഗ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "പൂർത്തിയാക്കാൻ മാറ്റങ്ങൾ ചെയ്ത് റിഡിപ്ലോയ് ചെയ്യണം"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ട്രേസിങ്:**

- ഓപ്പൺ ടെലിമെട്രി ഇന്റഗ്രേഷൻ
- അഭ്യർത്ഥന/മറുപടി ട്രാക്കിംഗ്
- പ്രകടന മെട്രിക്ക്സ്
- Microsoft Foundry പോർട്ടലിൽ ലഭ്യമാണ്

**ലോഗ്ഗിംഗ്:**

- കണ്ടെയ്നർ ആപ്ലിക്കേഷനുകളിൽ അപ്ലിക്കേഷൻ ലോഗുകൾ
- കോറിലേഷൻ ഐ.ഡി.കളോടെ സ്ട്രക്ചർഡ് ലോഗ്ഗിംഗ്
- റിയൽ ടൈം ആൻഡ് ചരിത്ര ലോഗ് ദൃശ്യമാക്കിൾ

---

## 5.4 [ഏജന്റ് മൂല്യനിർണ്ണയം](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ലൊക്കൽ മൂല്യനിർണ്ണയം:**

- ഗുണമേന്മ വിലയിരുത്താൻ ഇൻബിൽറ്റ് ഈവാലുവേറ്ററുകൾ
- കസ്റ്റം ഇവാലുവേഷൻ സ്ക്രിപ്റ്റുകൾ
- പ്രകടന ബഞ്ച്മാർക്കിംഗ്

**കണ്ടീന്യൂയസ് മോണിറ്ററിംഗ്:**

- ലൈവ് ഇടപെടലുകളുടെ സ്വയം മൂല്യനിർണ്ണയം
- ഗുണമേന്മ മെറ്റ്രിക്‌സ് ട്രാക്കിംഗ്
- പ്രകടന റഗ്രഷൻ കണ്ടെത്തൽ

**CI/CD ഇന്റഗ്രേഷൻ:**

- GitHub ആക്ഷൻസ് വർക്‌ഫ്ലോ
- ഓട്ടോമേറ്റഡ് ടെസ്റ്റിംഗ് ഒപ്പം മൂല്യനിർണ്ണയം
- സാംഖ്യിക താരതമ്യ പരിശോധന

---

## 5.5 [AI റെഡ് ടീമിംഗ് ഏജന്റ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI റെഡ് ടീമിംഗ്:**

- ഓട്ടോമേറ്റഡ് സുരക്ഷാ സ്കാനിംഗ്
- AI സിസ്റ്റങ്ങളിൽ അപകട മൂല്യനിർണ്ണയം
- പല വിഭാഗങ്ങളിലും സുരക്ഷാ വിലയിരുത്തൽ

**ഓതന്റിക്കേഷൻ:**

- അസ്യൂർ സേവനങ്ങൾക്ക് മാനേജ്ഡ് ഐഡന്റിറ്റി
- ഐച്ഛിക അസ്യൂർ ആപ് സർവീസ് ഓതന്റിക്കേഷൻ
- വികസനത്തിന് ബേസിക് ഓത് ഫാൽബാക്ക്

!!! quote "ഈ ലാബിന്റെ അവസാനം നിങ്ങൾക്കുണ്ടാകേണ്ടത്"
    - [ ] നിങ്ങളുടെ സീനറിയോ ആവശ്യങ്ങൾ നിർവ്വചിച്ചത്
    - [ ] പരിസ്ഥിതി മാറ്റിലുകൾ (കോൺഫിഗർ ചെയ്തത്)
    - [ ] ഏജന്റ് നിർദ്ദേശങ്ങൾ (ടാസ്‌ക്ക്) കസ്റ്റമൈസ് ചെയ്തത്
    - [ ] കസ്റ്റമൈസ് ചെയ്ത ടെംപ്ലേറ്റ് (ആപ്) ഡീപ്ലോയംെന്റ്
    - [ ] പോസ്റ്റ്-ഡീപ്ലോയ്‌മെന്റ് ടാസ്‌ക്കുകൾ പൂർത്തിയാക്കി
    - [ ] ഒരു ടെസ്റ്റ് ഇവാലുവേഷൻ നടത്തിയത്

ഈ ഉദാഹരണം കസ്റ്റമൈസ് ചെയ്ത രണ്ട് സ്പെഷ്യലൈസ്ഡ് ഏജന്റുകളോടും വിവിധ മോഡൽ ഡീപ്ലോയ്മെന്റുകളോടും ചേർന്ന് എന്റർപ്രൈസ് റീട്ടെയിൽ ഉപയോഗ കേസിനായി ടെംപ്ലേറ്റ് എങ്ങനെ മാറാമെന്ന് കാണിക്കുന്നു.

---

## 5.6 നിങ്ങൾക്കായി കസ്റ്റമൈസ് ചയ്യുക!

### 5.6.1 സീനARIOS ആവശ്യങ്ങൾ

#### **ഏജന്റ് ഡീപ്ലോയ്മെന്റ്:**

   - ഷോപ്പർ ഏജന്റ്: ഉപഭോക്താക്കൾക്ക് ഉൽപ്പന്നങ്ങൾ കണ്ടെത്താനും താരതമ്യം ചെയ്യാനും സഹായിക്കുന്നു
   - ലോയൽട്ടി ഏജന്റ്: ഉപഭോക്തൃ റിവാർഡ്‌സും പ്രമോഷനും മാനേജ് ചെയ്യുന്നു

#### **മോഡൽ ഡീപ്ലോയ്മെന്റ്:**

   - `gpt-4.1`: പ്രൈമറി ചാറ്റ് മോഡൽ
   - `o3`: സങ്കീർണ്ണ ചോദ്യങ്ങൾക്ക് റീഴണിംഗ് മോഡൽ
   - `gpt-4.1-nano`: ലളിതമായ ഇടപെടലുകൾക്കുള്ള ലൈറ്റ്‌വെയ്‌റ്റ് മോഡൽ
   - `text-embedding-3-large`: സെർച്ചിനുള്ള ഉയർന്ന നിലവാരമുള്ള എംബഡ്ഡിങ്‌സ്

#### **സവിശേഷതകൾ:**

   - ട്രേസിങ്, മോണിറ്ററിംഗ് പ്രവർത്തനക്ഷമമാക്കി
   - ഉൽപ്പന്ന കാറ്റലോഗിന് AI സെർച്ച്
   - ഗുണമേന്മ ഉറപ്പാക്കാനായി ഇവാലുവേഷൻ ഫ്രെയിംവർക്ക്
   - സുരക്ഷാ പരിശോധനയ്‌ക്കായി റെഡ് ടീമിംഗ്

---

### 5.6.2 സീനാരിയോ നടപ്പിലാക്കൽ


#### 5.6.2.1. പ്രീ-ഡീപ്ലോയ്‌മെന്റ് കോൺഫിഗറേഷൻ

സെറ്റപ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# പരിസ്ഥിതി പേര് സജ്ജമാക്കുക
azd env set AZURE_ENV_NAME "retail-ai-agents"

# പ്രദേശം ക്രമീകരിക്കുക (മോഡൽ ലഭ്യതയ്ക്കനുസരിച്ച് തിരഞ്ഞെടുക്കുക)
azd env set AZURE_LOCATION "eastus2"

# എല്ലാ ഐച്ഛിക സർവീസുകളും സജീവമാക്കുക
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# പ്രാഥമിക ചാറ്റ് മോഡൽ ക്രമീകരിക്കുക (gpt-4.1 നെ ഏറ്റവും അടുത്തുള്ള gpt-4o)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# മെച്ചപ്പെട്ട തിരച്ചിലിനായി എംബഡ്ഡിംഗ് മോഡൽ ക്രമീകരിക്കുക
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ഏജന്റ് പേര് സജ്ജമാക്കുക (ആദ്യ ഏജന്റ് സൃഷ്ടിക്കും)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# തിരച്ചിൽ ഇൻഡക്സിന്റെ ക്രമീകരണം
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ഏജന്റ് നിർദ്ദേശങ്ങൾ

സൃഷ്ടിക്കുക `custom-agents/shopper-agent-instructions.md`:

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

സൃഷ്ടിക്കുക `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: ഡീപ്ലോയ്‌മെന്റ് സ്ക്രിപ്റ്റ്

സൃഷ്ടിക്കുക `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# മുൻകൂട്ടി നിർവഹിക്കേണ്ട ആവശ്യകതകൾ പരിശോധിക്കുക
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# പരിസ്ഥിതി സജ്ജമാക്കുക
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# തിരഞ്ഞെടുത്ത മേഖലയിലെ ക്വോട്ട പരിശോധിക്കുക
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

# അടിസ്ഥാന സൗകര്യങ്ങളും ആപ്ലിക്കേഷനും വിന്യസിക്കുക
echo "🏗️  Deploying Azure infrastructure..."
azd up

# വിന്യസനത്തിന്റെ ഫലങ്ങൾ പിടിച്ചുവെക്കുക
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# വെബ് ആപ്പ് URL നേടുക
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

#### 5.6.2.4: പോസ്റ്റ്-ഡീപ്ലോയ്‌മെന്റ് കോൺഫിഗറേഷൻ

സൃഷ്ടിക്കുക `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# വിന്യാസ വിവരങ്ങൾ നേടുക
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# കൈമാറ്റ കോൺഫിഗർ ചെയ്യാനുള്ള നിർദ്ദേശങ്ങൾ
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

### 5.6.3: ടെസ്റ്റിംഗ് ആൻഡ് വെരിഫിക്കേഷൻ

സൃഷ്ടിക്കുക `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# പാരിസ്ഥിതിക ചേരുവകൾ സജ്ജമാണെന്ന് പരിശോധിക്കുക
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# വെബ് അപേക്ഷ ലഭ്യത പരിശോധിക്കുക
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

# കൃത്യമായി ക്രമീകരിച്ചാൽ വിലയിരുത്തൽ നടത്തുക
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

### 5.6.4 പ്രതീക്ഷിക്കാവുന്ന ഫലങ്ങൾ

ഈ നടപ്പിലാക്കൽ ഗൈഡ് പാലിച്ചുകഴിഞ്ഞാൽ നിങ്ങൾക്ക്:

1. **ഡീപ്ലോയ്മെന്റ് ഇൻഫ്രാസ്ട്രക്ചർ:**

      - മോഡൽ ഡീപ്ലോയ്മെന്റുകളുള്ള Microsoft Foundry പ്രോജക്ട്
      - വെബ് ആപ്ലിക്കേഷൻ ഹോസ്റ്റിങ് ചെയ്യുന്നത് കണ്ടെയ്‌നർ ആപ്സ്
      - ഉൽപ്പന്ന കാറ്റലോഗിന് AI സെർച്ച് സേവനം
      - മോണിറ്ററിംഗിനായി അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ്

2. **ആരംഭക ഏജന്റ്:**

      - അടിസ്ഥാന നിർദ്ദേശങ്ങളോടെ ഷോപ്പർ ഏജന്റ്
      - ഫയൽ സെർച്ച് പ്രവർത്തനക്ഷമമായി
      - ട്രേസിങ് മോണിറ്ററിംഗ് കോൺഫിഗർ ചെയ്തിട്ടുള്ളത്

3. **കസ്റ്റമൈസേഷനിന് തയ്യാറായി:**

      - ലോയൽട്ടി ഏജന്റ് ചേർക്കാനുള്ള ഫ്രെയിംവർക്ക്
      - കസ്റ്റം നിർദ്ദേശങ്ങളുടെ ടെംപ്ലേറ്റുകൾ
      - ടെസ്റ്റിംഗ്, വ്യാളിധരണ സ്ക്രിപ്റ്റുകൾ
      - മോണിറ്ററിംഗ്, ഇവാലുവേഷൻ സജ്ജീകരണം

4. **പ്രൊഡക്ഷൻ റെഡിയ്നസ്:**

      - റെഡ് ടീമിംഗ് ഉപയോഗിച്ചുള്ള സുരക്ഷാ സ്കാനിംഗ്
      - പ്രകടന നിരീക്ഷണം
      - ഗുണമേന്മ മൂല്യനിർണ്ണയം
      - സ്കെയിലബിൾ ആർക്കിടെക്ചർ

ഈ ഉദാഹരണം കാണിക്കുന്നു എങ്ങനെ AZD ടെംപ്ലേറ്റ് പ്രത്യേക എന്റർപ്രൈസ് സീനാരിയോകൾക്കായി വിപുലീകരിക്കുകയും കസ്റ്റമൈസ് ചെയ്യുകയും ചെയ്യാം, സുരക്ഷ, മോണിറ്ററിംഗ്, സ്കെയിലബിലിറ്റിക്ക് മികച്ച ശില്പകലകൾ പാലിച്ച്.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**തടസ്സം**:  
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ സമ്പൂർണമായ ശരിയായതിനെ ലക്ഷ്യമിടുന്നുവെങ്കിലും, യന്ത്രം ചെയ്ത പരിഭാഷകളിൽ പിശകുകളും അപര്യാപ്തതകളും ഉണ്ടാകാവുന്നതാണ്. ಮೂಲ ഭാഷയിലെ രേഖയെ ആധികാരികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടതാണ്. നിർണ്ണായക വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശിപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിക്കുന്നതിനായി ഉണ്ടാകുന്ന യാതൊരു തെറ്റിദ്ധാരണയ്ക്കോ തെറ്റായ വ്യാഖ്യാനത്തിനോ ഞങ്ങൾക്ക് ഉത്തരവാദിത്വം ഉണ്ടാകില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->