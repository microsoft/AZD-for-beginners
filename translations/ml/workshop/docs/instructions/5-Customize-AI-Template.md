# 5. ഒരു ടെംപ്ലേറ്റ് ഇഷ്ടാനുസൃതമാക്കുക

!!! tip "ഈ മോഡ്യൂളിന്റെ അവസാനം നിങ്ങൾക്ക് സാധിക്കാനിരിക്കുന്നത്"

    - [ ] ഡിഫോൾട്ട് AI ഏജന്റ് കഴിവുകൾ തേടി
    - [ ] നിങ്ങളുടെ സ്വന്തം ഇൻഡക്സ് ഉപയോഗിച്ച് AI സെർച്ച് ചേർത്തു
    - [ ] ട്രേസിങ്ങ് മെട്രിക്‌സുകൾ സജീവമാക്കി വിശകലനം ചെയ്തു
    - [ ] ഒരു മൂല്യനിർണയ റൺ നടപ്പാക്കി
    - [ ] ഒരു റെഡ്-ടിമിംഗ് സ്‌കാൻ നടപ്പാക്കി
    - [ ] **ലാബ് 5: ഒരു ഇഷ്ടാനുസൃത പാഠ്യം നിർമ്മിച്ചു** 

---

## 5.1 AI ഏജന്റ് കഴിവുകൾ

!!! success "ഇത് ലാബ് 01 ൽ പൂർത്തിയാക്കിയിട്ടുണ്ട്"

- **ഫയൽ സെർച്ച്**: ജ്ഞാനപരമായ തിരയൽക്കായി OpenAI ന്റെ ബിൽറ്റ്-ഇൻ ഫയൽ സെർച്ച്
- **ഉദ്ധരണികൾ**: മറുപടികളിൽ സ്വയം സ്രോതസ്സ് സൂചന നൽകുന്നു
- **ഇഷ്ടാനുസൃത മാർഗനിർദ്ദേശങ്ങൾ**: ഏജന്റിന്റെ പെരുമാറ്റവും വ്യക്തിത്വവും മാറ്റം വരുത്തുക
- **ടൂൾ ഇന്റഗ്രേഷൻ**: ഇഷ്ടാനുസൃത കഴിവുകൾക്കായി വിപുലീകരണ ടൂൾ സിസ്റ്റം

---

## 5.2 ജ്ഞാനം പുനഃപ്രാപന ഓപ്ഷനുകൾ

!!! task "ഇത് പൂർത്തിയാക്കാൻ മാറ്റങ്ങൾ ചെയ്ത് പുനഃപ്രസിദ്ധീകരണം ആവശ്യം"    
    
    ```bash title=""
    # പരിസ്ഥിതി വ്യത്യസ്ഥങ്ങൾ സജ്ജമാക്കുക
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ഡാറ്റ അപ്‌ലോഡ് ചെയ്ത് എന്റെ ഇൻഡക്സ് സൃഷ്ടിക്കുക

    ```

---

**OpenAI ഫയൽ സെർച്ച് (ഡിഫോൾട്ട്):**

- ഫൗണ്ട്രി ഏജന്റ്‌സിലാണ് ഉൾക്കൊളളിച്ചിരിക്കുന്നത്
- സ്വയം രേഖ പ്രോസസ്സിംഗ്, ഇൻഡക്സിംഗ്
- അധിക കോൺഫിഗറേഷൻ ആവശ്യമില്ല

**Azure AI സെർച്ച് (ഐച്ഛികം):**

- ഹൈബ്രിഡ് സെമാന്റിക് ആൻഡ് വെക്ടർ സെർച്ച്
- ഇഷ്ടാനുസൃത ഇൻഡക്സ് മാനേജ്മെന്റ്
- പുരോഗമിച്ച സെർച്ച് കഴിവുകൾ
- `USE_AZURE_AI_SEARCH_SERVICE=true` ആവശ്യമുണ്ട്

---

## 5.3 [ട്രേസിങും മോണിറ്ററിംഗും](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ഇത് പൂർത്തിയാക്കാൻ മാറ്റങ്ങൾ ചെയ്ത് പുനഃപ്രസിദ്ധീകരണം ആവശ്യം"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ട്രേസിങ്:**

- OpenTelemetry ഇന്റഗ്രേഷൻ
- അഭ്യർത്ഥന/മറുപടി ട്രാക്കിങ്
- പ്രകടന മെട്രിക്‌സുകൾ
- മൈക്രോസോഫ്റ്റ് ഫൗണ്ട്രി പോർട്ടലിൽ ലഭ്യമാണ്

**ലോഗിംഗ്:**

- കൺറ്റൈനർ ആപ്പ്‌സിൽ അപ്ലിക്കേഷൻ ലോഗുകൾ
- കോറിലേഷൻ ഐഡികളോടെ ഘടനാപരമായ ലോഗിംഗ്
- റിയൽ-ടൈം, ചരിത്രലോഗുകളും കാണാം

---

## 5.4 [ഏജന്റ് മൂല്യനിർണയം](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**പ്രാദേശിക മൂല്യനിർണയം:**

- ഗുണനിലവാരം വിലയിരുത്താൻ ഉൾപ്പെട്ട എവാലുവേറ്ററുകൾ
- ഇഷ്ടാനുസൃത മൂല്യനിർണയ സ്ക്രിപ്റ്റുകൾ
- പ്രകടന മാനദണ്ഡം

**സतത മോണിറ്ററിംഗ്:**

- ജീവിച്ചിരിക്കുന്ന ഇടപെടലുകളുടെ സ്വയം മൂല്യനിർണയം
- ഗുണനിലവാര മെട്രിക്‌സ് ട്രാക്കിങ്
- പ്രകടന റീഗ്രഷൻ കണ്ടെത്തൽ

**CI/CD സംയോജനം:**

- GitHub Actions വർക്ക്‌ഫ്ലോ
- സ്വയമേവ പരിശോധനയും മൂല്യനിർണയവും
- സാങ്കേതിക താരതമ്യ പരിശോധനകൾ

---

## 5.5 [AI റെഡ് ടീമിംഗ് ഏജന്റ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI റെഡ് ടീമിംഗ്:**

- സ്വയം പ്രവർത്തിക്കുന്ന സുരക്ഷ സ്കാനിംഗ്
- AI സിസ്റ്റങ്ങൾക്കായുള്ള അപകടം വിലയിരുത്തൽ
- വിവിധ വിഭാഗങ്ങളിലുടനീളം സുരക്ഷാ അവലോകനം

**ആധികാരികത:**

- Azure സേവനങ്ങൾക്ക് മാനേജ്ഡ് ഐഡന്റിറ്റി
- ഐച്ഛിക Azure ആപ്പ് സർവീസ് ആധികാരികത
- വികസനത്തിനു ബേസിക് ഓത് ഫാൾബാക്ക്

!!! quote "ഈ ലാബിന്റെ അവസാനം നിങ്ങൾ പൂർത്തിയാക്കേണ്ടത്"
    - [ ] നിങ്ങളുടെ സീനാരിയോ ആവശ്യകതകൾ നിർവചിക്കുക
    - [ ] ഇണ്‍വാർമന്റ് വ്യത്യസ്ഥങ്ങൾ (കോൺഫിഗ്) ഇഷ്ടാനുസൃതമാക്കുക
    - [ ] ഏജന്റ് മാർഗനിർദ്ദേശങ്ങൾ (ടാസ്‌ക്ക്) ഇഷ്ടാനുസൃതമാക്കുക
    - [ ] ഇഷ്ടാനുസൃത ടെംപ്ലേറ്റ് (ആപ്പ്) വിന്യസിക്കുക
    - [ ] വിന്യസന ശേഷം പ്രവർത്തനങ്ങൾ പൂർത്തിയാക്കുക (മാന്വൽ)
    - [ ] ഒരു പരീക്ഷണ മൂല്യനിർണയം നടത്തുക

ഈ ഉദാഹരണം രണ്ട് പ്രത്യേക ഏജന്റുകളും പല മോഡൽ വിന്യസനങ്ങളുമുള്ള എന്റർപ്രൈസ് റീട്ടെയിൽ ഉപയോഗകേസിനായി ടെംപ്ലേറ്റ് ഇഷ്ടാനുസൃതമാക്കുന്നത് കാണിക്കുന്നു.

---

## 5.6 ഒപ്പം നിങ്ങൾക്കായി ഇഷ്ടാനുസൃതമാക്കുക!

### 5.6.1. സീനാരിയോ ആവശ്യകതകൾ

#### **ഏജന്റ് വിന്യസനങ്ങൾ:** 

   - ഷോപ്പർ ഏജന്റ്: ഉപഭോക്താക്കൾക്ക് ഉൽപ്പന്നങ്ങൾ കണ്ടെത്താനും താരതമ്യം ചെയ്യാനും സഹായിക്കുന്നു
   - ലോയൽട്ടി ഏജന്റ്: ഉപഭോക്തൃ പ്രതിഫലം, പ്രൊമോഷനുകൾ നിയന്ത്രിക്കുന്നു

#### **മോഡൽ വിന്യസനങ്ങൾ:**

   - `gpt-4.1`: പ്രധാന ചാറ്റ് മോഡൽ
   - `o3`: സങ്കീർണ്ണമായ ചോദ്യങ്ങൾക്കായുള്ള കാരണം വിശകലന മോഡൽ
   - `gpt-4.1-nano`: ലഘുലേഖ മോഡൽ ഏളുപ്പുള്ള ഇടപെടലുകൾക്കായി
   - `text-embedding-3-large`: തിരച്ചിലിനായുള്ള ഉയർന്ന ഗുണമേറിയ എംബെഡിങ്ങുകൾ

#### **പ്രധാന സവിശേഷതകൾ:**

   - ട്രേസിംഗും മോണിറ്ററിംഗും സജീവം
   - ഉൽപ്പന്ന കാറ്റലോഗിനായി AI സെർച്ചിംഗ്
   - ഗുണനിലവാര ഉറപ്പിനുള്ള മൂല്യനിർണയ ഘടന
   - സുരക്ഷാ സാക്ഷ്യവത്കരണത്തിനായുള്ള റെഡ്-ടീമിംഗ്

---

### 5.6.2 സീനാരിയോ നടപ്പാക്കൽ


#### 5.6.2.1. മുൻവിന്യസന കോൺഫിഗ്

ഒരു സജ്ജീകരണ സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# പരിസ്ഥിതി പേര് സെറ്റ് ചെയ്യുക
azd env set AZURE_ENV_NAME "retail-ai-agents"

# പ്രദേശം ക്രമീകരിക്കൽ (മോഡൽ ലഭ്യതയുടെ അടിസ്ഥാനത്തിൽ തിരഞ്ഞെടുക്കുക)
azd env set AZURE_LOCATION "eastus2"

# എല്ലാ ഐച്ഛിക സേവനങ്ങളും സജീവമാക്കുക
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# മുഖ്യ ചാറ്റ് മോഡൽ ക്രമീകരിക്കുക (gpt-4.1, gpt-4.1-നോട് ഏറ്റവും സാമ്യമുള്ളത് ആയി)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# മെച്ചപ്പെട്ട തിരച്ചിലിനായി എംബെഡിംഗ് മോഡൽ ക്രമീകരിക്കുക
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ഏജന്റ് പേര് സെറ്റ് ചെയ്യുക (ആദ്യ ഏജന്റ് സൃഷ്ടിക്കും)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# തിരച്ചിൽ ഇൻഡക്സ് ക്രമീകരിക്കുക
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ഏജന്റ് മാർഗനിർദ്ദേശങ്ങൾ

`custom-agents/shopper-agent-instructions.md` സൃഷ്ടിക്കുക:

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

`custom-agents/loyalty-agent-instructions.md` സൃഷ്ടിക്കുക:

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

#### 5.6.2.3: വിന്യസന സ്ക്രിപ്റ്റ്

`deploy-retail.sh` സൃഷ്ടിക്കുക:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# പ്രാഥമിക യോഗ്യതകൾ സാധൂകരിക്കുക
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# പരിസ്ഥിതി സജ്ജീകരിക്കുക
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# തെരഞ്ഞെടുക്കപ്പെട്ട რეგიონിലെ ക്വോട്ട പരിശോധിക്കുക
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

# അടിസ്ഥാനസൗകര്യവും ആപ്ലിക്കേഷനും വിന്യസിക്കുക
echo "🏗️  Deploying Azure infrastructure..."
azd up

# വിന്യാസ ഔട്ട്പുട്ടുകൾ രജിസ്റ്റർ ചെയ്യുക
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# വെബ് ആപ്പ് URL നേടുക
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

#### 5.6.2.4: വിന്യസനാനന്തര കോൺഫിഗ്

`configure-retail-agents.sh` സൃഷ്ടിക്കുക:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# വിതരണം വിവരങ്ങൾ നേടുക
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# കൈകാര്യം നടത്താനുള്ള നിർദ്ദേശങ്ങൾ
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

### 5.6.3: ടെസ്റ്റിംഗ്, സാധുത പരിശോധന

`test-retail-deployment.sh` സൃഷ്ടിക്കുക:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# പരിസ്ഥിതി വ്യത്യസാനം ക്രമീകരിച്ചതാണെന്ന് പരിശോദിക്കുക
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# വെബ് അപ്ലിക്കേഷൻ ലഭ്യത പരിശോധിക്കുക
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

# ക്രമീകരിച്ചിട്ടുണ്ടെങ്കിൽ വിലയിരുത്തൽ പ്രവർത്തിപ്പിക്കുക
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

### 5.6.4 പ്രതീക്ഷിച്ച ഫലങ്ങൾ

ഈ നടപ്പാക്കൽ മാർഗനിർദ്ദേശം പാലിച്ചതിനു ശേഷം നിങ്ങൾക്കുണ്ടാകും:

1. **വിന്യസിച്ച ബാഹ്യ ഘടന:**

      - മോഡൽ വിന്യസനങ്ങളുള്ള Microsoft Foundry പ്രൊജക്ട്
      - വെബ് അപ്ലിക്കേഷൻ ഹോസ്റ്റിംഗ് കൺറ്റെയ്‌നർ ആപ്സ്
      - ഉൽപ്പന്ന കാറ്റലോഗിനുള്ള AI സെർച്ച് സർവീസ്
      - മോണിറ്ററിംഗിനായുള്ള അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്

2. **ആരംഭ ഘട്ട ഏജന്റ്:**

      - അടിസ്ഥാന മാർഗനിർദ്ദേശങ്ങളോടെ ഷോപ്പർ ഏജന്റ്
      - ഫയൽ സെർച്ച് കഴിവ് സജീവം
      - ട്രേസിംഗ്, മോണിറ്ററിംഗ് കോൺഫിഗർ ചെയ്തു

3. **ഇഷ്ടാനുസൃതമാക്കാനായി തയ്യാറായി:**

      - ലോയൽട്ടി ഏജന്റ് ചേർക്കാനുള്ള ഘടന
      - ഇഷ്ടാനുസൃത മാർഗനിർദ്ദേശ ടെംപ്ലേറ്റുകൾ
      - ടെസ്റ്റിംഗ്, സാധുത പരിശോധനാ സ്ക്രിപ്റ്റുകൾ
      - മോണിറ്ററിംഗ്, മൂല്യനിർണയ ക്രമീകരണങ്ങൾ

4. **പ്രൊഡക്ഷൻ റെഡിയായി:**

      - റെഡ്-ടീമിംഗ് ഉപയോഗിച്ചുള്ള സുരക്ഷ സ്കാനിംഗ്
      - പ്രകടന മോണിറ്ററിംഗ്
      - ഗുണനിലവാര മൂല്യനിർണയ ഘടന
      - സ്‌കേലബിൾ ആർക്കിടെക്ചർ

ഈ ഉദാഹരണം കാട്ടുന്നത് AZD ടെംപ്ലേറ്റിനെ എന്റർപ്രൈസ് പ്രത്യേക സാഹചര്യങ്ങൾക്കായി എങ്ങനെ വിപുലീകരിക്കുകയും സുരക്ഷ, മോണിറ്ററിംഗ്, സ്‌കേലബിലിറ്റി മുൻഗണനയോടെ ഇഷ്ടാനുസൃതമാക്കുകയും ചെയ്യാമെന്ന്.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയാപത്രം**:  
ഈ രേഖ AI ഭാഷാന്തരണ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് എല്ലാ മാറ്റങ്ങളും കൃത്യതയോടെ നുവദിച്ചിട്ടുള്ളത്. ഞങ്ങൾ കൃത്യതയ്ക്ക് ശ്രമിക്കുന്നുണ്ടെങ്കിലും, സ്വയംഭാഷാന്തരങ്ങൾ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റിദ്ധാരണകൾ ഉൾക്കൊള്ളാമെന്ന് അറിയിക്കുക. അവിഭക്ത ഭാഷയിൽ ഉള്ള അസൽ രേഖ അഥോറിറ്റേറ്റീവ് മാർഗ്ഗദർശകമെന്ന് കാണേണ്ടതാണ്. നിർണായക വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യഭാഷാന്തരണം ശിപാർശ ചെയ്യപ്പെടുന്നു. ഈ ഭാഷാന്തരണത്തിന്റെ ഉപയോഗത്തിൽ നിന്ന് ഉണ്ടായാകുന്ന ആരോഗ്യങ്ങൾക്കോ തെറ്റിദ്ധാരണകൾക്കോ എ ഞങ്ങൾ ബാധ്യസ്ഥരല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->