# 5. ടെംപ്ലേറ്റ് ഇഷ്‌ടാനുസരണം സജ്ജമാക്കുക

!!! tip "ഈ മോദ്യൂളിന്റെ അവസാനം നിങ്ങൾക്ക് കഴിയുന്നതാണ്"

    - [ ] ഡീഫോൾട്ട് AI ഏജന്റ് ശേഷികൾ പരിശോധിച്ചു
    - [ ] നിങ്ങളുടെ സ്വന്തം ഇൻഡക്സുമായി AI Search ചേർത്തു
    - [ ] ട്രേസിംഗ് മെട്രിക്‌സുകൾ സജീവമാക്കി വിശകലനം ചെയ്തു
    - [ ] ഒരു മൂല്യനിർണ്ണയ റൺ നിർവഹിച്ചു
    - [ ] ഒരു റെഡ്-ടീമിംഗ് സ്കാൻ നിർവഹിച്ചു
    - [ ] **ലാബ് 5: ഒരു ഇഷ്‌ടാനുസരണം പദ്ധതി നിർമ്മിച്ചു** 

---

## 5.1 AI ഏജന്റ് ശേഷികൾ

!!! success "നാം ലാബ് 01-ൽ ഇത് പൂർത്തിയാക്കി"

- **ഫയൽ സെർച്ച്**: അറിവ് റിട്രീവലിനായി OpenAI-യുടെ ബിൽറ്റ്-ഇൻ ഫയൽ സെർച്ച്
- **സൈറ്റേഷനുകൾ**: പ്രതികരണങ്ങളിൽ സ്വയകൃത ഉറവിട Attribution
- **ഇഷ്‌ടാനുസരണമാകുന്ന നിർദ്ദേശങ്ങൾ**: ഏജന്റിന്റെ പെരുമാറ്റം, വ്യക്തിത്വം മാറ്റാം
- **ടൂൾ ഇന്റഗ്രേഷൻ**: ഇഷ്‌ടാനുസരണം ശേഷികൾക്കായി വ്യാപിപ്പിക്കുന്ന ടൂൾ സിസ്റ്റം

---

## 5.2 അറിവ് റിട്രീവൽ ഓപ്‌ഷനുകൾ

!!! task "ഇത് പൂർത്തിയാക്കാൻ മാറ്റങ്ങൾ വരുത്തി വീണ്ടും വിന്യസിക്കണം"    
    
    ```bash title=""
    # പരിസ്ഥിതി വ്യത്യാസങ്ങൾ സജ്ജമാക്കുക
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ഡാറ്റ അപ്‌ലോഡ് ചെയ്ത് എന്റെ ഇൻഡക്സ് സൃഷ്‌ടിക്കുക

    ```

---

**OpenAI ഫയൽ സെർച്ച് (ഡീഫോൾട്ട്):**

- ഫൗണ്ട്രി ഏജന്റുകളിൽ ബിൽറ്റ്-ഇൻ
- സ്വയകൃത ഡോക്യുമെന്റ് പ്രോസസ്സിംഗ് & ഇൻഡക്സിംഗ്
- അധിക ക്രമീകരണം വേണ്ട

**Azure AI സെർച്ച് (ഐച്ഛികം):**

- ഹൈബ്രിഡ് സെമാന്റിക് & വെക്റ്റർ സെർച്ച്
- ഇഷ്‌ടാനുസരണമാകുന്ന ഇൻഡക്സ് മാനേജ്മെന്റ്
- പുരോഗമനമായ സെർച്ച് ശേഷികൾ
- വേണ്ടതാണെങ്കിൽ `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ട്രേസിംഗ് & മോണിറ്ററിംഗ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ഇത് പൂർത്തിയാക്കാൻ മാറ്റങ്ങൾ വരുത്തി വീണ്ടും വിന്യസിക്കണം"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ട്രേസിംഗ്:**

- OpenTelemetry ഇന്റഗ്രേഷൻ
- അഭ്യർത്ഥന/പ്രതികരണ ട്രാക്കിംഗ്
- പ്രകടന മെട്രിക്‌സ്
- മൈക്രോസോഫ്റ്റ് ഫൗണ്ട്രി പോർട്ടലിൽ ലഭ്യമാണ്

**ലോഗിംഗ്:**

- കണ്ടെയ്‌നർ ആപ്പുകളിൽ അപ്ലിക്കേഷൻ ലോഗുകൾ
- കോറിലേഷൻ ഐഡികളോടെയുള്ള ഘടനയുള്ള ലോഗിംഗ്
- റിയൽ-ടൈം & ചരിത്ര ലോഗ് കാണിക്കൽ

---

## 5.4 [ഏജന്റ് മൂല്യനിർണ്ണയം](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**പ്രാദേശിക മൂല്യനിർണ്ണയം:**

- ഗുണമേന്മാ അളവിന് ബിൽറ്റ്-ഇൻ മൂല്യനിർണയ ഉപകരണങ്ങൾ
- ഇഷ്‌ടാനുസരണം മൂല്യനിർണ്ണയ സ്ക്രിപറ്റുകൾ
- പ്രകടന ബഞ്ച്മാർക്കിംഗ്

**തുടർച്ചയായ മോണിറ്ററിംഗ്:**

- ലൈവ് ഇടപഴകലുകളുടെ സ്വയകൃത മൂല്യനിർണ്ണയം
- ഗുണമേന്മാ മെട്രിക്‌സ് ട്രാക്കിംഗ്
- പ്രകടനഗണിത മാറ്റങ്ങൾ കണ്ടെത്തൽ

**CI/CD ഇന്റഗ്രേഷൻ:**

- GitHub Actions വർക്ക്‌ഫ്ലോ
- സ്വയം പ്രവർത്തിക്കുന്ന പരിശോധനകളും മൂല്യനിർണ്ണയവും
- സാങ്ക്യാത്മക താരതമ്യ പരിശോധന

---

## 5.5 [AI റെഡ്-ടീമിംഗ് ഏജന്റ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI റെഡ്-ടീമിംഗ്:**

- സ്വയം പ്രവർത്തിക്കുന്ന സുരക്ഷാ സ്കാനിംഗ്
- AI സംവിധാനങ്ങളുടെ അപകടമാനദണ്ഡാ വിശകലനം
- ഏറെ വിഭാഗങ്ങളിൽ സുരക്ഷാ മൂല്യനിർണ്ണയം

**പ്രമാണീകരണം:**

- Azure സേവനങ്ങൾക്ക് മാനേജ്ഡ് ഐഡന്റിറ്റി
- ഐച്ഛിക Azure ആപ്പ് സർവീസ് പ്രമാണീകരണം
- വികസനത്തിന് അടിസ്ഥാന അഥോറിറ്റി ഫാള്ബാക്ക്

!!! quote "ഈ ലാബിന്റെ അവസാനം നിങ്ങൾക്ക് ലഭിക്കേണ്ടത്"
    - [ ] നിങ്ങളുടെ സീനം ആവശ്യങ്ങൾ നിർവചിച്ചത്
    - [ ] ഇഷ്‌ടാനുസരണമാക്കിയ പരിസ്ഥിതി വ്യത്യാസങ്ങൾ (കൊണ്ടfiguration)
    - [ ] ഇഷ്‌ടാനുസരണമാക്കിയ ഏജന്റ് നിർദ്ദേശങ്ങൾ (ടാസ്ക്)
    - [ ] ഇഷ്‌ടാനുസരണമാക്കിയ ടെംപ്ലേറ്റ് വിന്യസിച്ചത് (ആപ്പ്)
    - [ ] വിന്യാസാനന്തരം പ്രവർത്തനങ്ങൾ പൂർത്തിയാക്കി (മാനുവൽ)
    - [ ] ഒരു പരീക്ഷണ മൂല്യനിർണ്ണയം നിർവഹിച്ചു

ഈ ഉദാഹരണം എന്റർപ്രൈസ് റീട്ടെയിൽ ഉപയോഗത്തിന് രണ്ട് പ്രത്യേക ഏജന്റുകളും നാനാഭാഗം മോഡൽ വിന്യാസങ്ങളും ഉൾപ്പെടുത്തി ടെംപ്ലേറ്റ് ഇഷ്‌ടാനുസരണമായി മാറ്റാനുള്ള പ്രദർശനമാണ്.

---

## 5.6 നിങ്ങളുടെ അനുസൃതമാക്കുക!

### 5.6.1. സീനം ആവശ്യങ്ങൾ

#### **ഏജന്റ് വിന്യാസങ്ങൾ:** 

   - ഷോപ്പർ ഏജന്റ്: ഉപഭോക്താക്കളെ ഉൽപ്പന്നങ്ങൾ കണ്ടെത്താനും ആശയവിനിമയം നടത്താനും സഹായിക്കുന്നു
   - ലോയൽട്ടി ഏജന്റ്: ഉപഭോക്തൃ റിവാർഡുകളും പ്രമോഷനുകളും നിയന്ത്രിക്കുന്നു

#### **മോഡൽ വിന്യാസങ്ങൾ:**

   - `gpt-4.1`: പ്രഥമ ചാറ്റ് മോഡൽ
   - `o3`: ക്ലിഷ്ടമായ ചോദ്യങ്ങൾക്ക് റീസണിംഗ് മോഡൽ
   - `gpt-4.1-nano`: ലഘുസംബന്ധമായ ഇടപഴകലിനായി ലഘു മോഡൽ
   - `text-embedding-3-large`: സെർച്ച്‌ക്കായുള്ള ഉയർന്ന നിലവാരമുള്ള എംബെഡിങുകൾ

#### **ഫീച്ചറുകൾ:**

   - ട്രേസിംഗ് & മോണിറ്ററിംഗ് സജീവം
   - ഉൽപ്പന്ന കാറ്റലോഗിനായി AI Search
   - ഗുണനിലവാര ഉറപ്പുവരുത്താനുള്ള മൂല്യനിർണ്ണയ ഫ്രെയിംവർക്ക്
   - സുരക്ഷാ പരിശോധനയ്ക്കായി റെഡ് ടീമിംഗ്

---

### 5.6.2 സീനം നടപ്പാക്കൽ


#### 5.6.2.1. വിന്യാസമുൻകൂർ ക്രമീകരണം

`setup-retail.sh` എന്ന സജ്ജീകരണ സ്ക്രിപ്റ്റ് സൃഷ്‌ടിക്കുക

```bash title="" linenums="0"
#!/bin/bash

# പരിസ്ഥിതി പേര് സജ്ജമാക്കുക
azd env set AZURE_ENV_NAME "retail-ai-agents"

# പ്രദേശം ക്രമീകരിക്കുക (മਾਡൽ ലഭ്യതയുടെ അടിസ്ഥാനത്തിൽ തിരഞ്ഞെടുക്കുക)
azd env set AZURE_LOCATION "eastus2"

# എല്ലാ ഐഷിക സേവനങ്ങളും സജീവമാക്കുക
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# പ്രാഥമിക ചാറ്റ് മോഡൽ ക്രമീകരിക്കുക (gpt-4.1 ഏറ്റവും അടുത്ത ലഭ്യമാകുന്നതായി gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# മെച്ചപ്പെട്ട തിരച്ചിലിന് എൻബെഡിംഗ് മോഡൽ ക്രമീകരിക്കുക
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ഏജന്റ് പേര് സജ്ജമാക്കുക (പ്രഥമ ഏജന്റ് സൃഷ്‌ടിക്കും)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# തിരച്ചിൽ സൂചിക ക്രമീകരിക്കുക
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ഏജന്റ് നിർദ്ദേശങ്ങൾ

`custom-agents/shopper-agent-instructions.md` സൃഷ്‌ടിക്കുക:

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

`custom-agents/loyalty-agent-instructions.md` സൃഷ്‌ടിക്കുക:

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

#### 5.6.2.3: വിന്യാസ സ്ക്രിപ്റ്റ്

`deploy-retail.sh` സൃഷ്‌ടിക്കുക:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# മുൻപരിചയങ്ങൾ പരിശോധന നടത്തുക
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

# തിരഞ്ഞെടുക്കപ്പെട്ട പ്രദേശത്തെ ക്വോട്ട പരിശോധിക്കുക
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

# ഇൻഫ്രാസ്ട്രക്ചറും ആപ്പ്ലിക്കേഷനും വിന്യസിക്കുക
echo "🏗️  Deploying Azure infrastructure..."
azd up

# വിന്യാസ ഔട്ട്പുട്ടുകൾ കയറ്റുക
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# വെബ് ആപ്പ് URL ലഭിക്കുക
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

#### 5.6.2.4: വിന്യാസാനന്തരം ക്രമീകരണം

`configure-retail-agents.sh` സൃഷ്‌ടിക്കുക:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# വിനിയോഗ വിവരം നേടുക
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# മാനുവൽ കോൺഫിഗറേഷനിനുള്ള നിർദ്ദേശങ്ങൾ
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

### 5.6.3: പരിശോധനയും ശരിവെപ്പും

`test-retail-deployment.sh` സൃഷ്‌ടിക്കുക:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# പരിസര വ്യത്യാസങ്ങളുള്ള സജ്ജമാണെന്ന് പരിശോദിക്കുക
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# വെബ് ആപ്ലിക്കേഷൻ ലഭ്യത പരിശോദിക്കുക
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

# ക്രമീകരിച്ചിട്ടുണ്ടെങ്കിൽ മൂല്യനിർണ്ണയം നടത്തുക
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

ഈ നടപ്പാക്കൽ ഗൈഡ് പിന്തുടർന്നതിനു ശേഷം നിങ്ങൾക്ക് ലഭ്യമാകുന്നത്:

1. **വിന്യാസം:**

      - മൈക്രോസോഫ്റ്റ് ഫൗണ്ട്രി പ്രോജക്ടോടുകൂടി മോഡൽ വിന്യാസങ്ങൾ
      - വെബ് ആപ്പ് ഹോസ്റ്റുചെയ്യുന്ന കണ്ടെയ്‌നർ ആപ്പുകൾ
      - ഉൽപ്പന്ന കാറ്റലോഗിനായി AI Search സേവനം
      - മോണിറ്ററിംഗിനായി അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്

2. **ആരംഭിക ഏജന്റ്:**

      - അടിസ്ഥാന നിർദ്ദേശങ്ങളോടുകൂടിയ ഷോപ്പർ ഏജന്റ്
      - ഫയൽ സെർച് ശേഷി സജീവീകരിച്ചത്
      - ട്രേസിംഗ് മോണിറ്ററിംഗ് ക്രമീകരിച്ചത്

3. **ഇഷ്‌ടാനുസരണം പാടവത്തിലുള്ളത്:**

      - ലോയൽട്ടി ഏജന്റ് ചേർക്കാനുള്ള ഘടന
      - ഇഷ്‌ടാനുസരണമാകുന്ന നിർദ്ദേശം ഫോർമാറ്റുകൾ
      - പരിശോധന & ശരിവെപ്പ് സ്ക്രിപ്റ്റുകൾ
      - മോണിറ്ററിംഗ് & മൂല്യനിർണ്ണയ സജ്ജീകരണം

4. **പ്രൊഡക്ഷൻ റെഡിയണസ്:**

      - സുരക്ഷാ പരിശോധന റെഡ് ടീമിങോടെ
      - പ്രകടനം മോണിറ്ററിംഗ്
      - ഗുണനിലവാര മൂല്യനിർണ്ണയ ഘടന
      - ആധുനിക ആർക്കിടെക്ചർ

ഈ ഉദാഹരണം AZD ടെംപ്ലേറ്റ് എന്റർപ്രൈസ് സീനാരിയോകൾക്കായി എങ്ങനെ വികസിപ്പിച്ച് ഇഷ്‌ടാനുസരണമാക്കാമെന്നു മാർഗ്ഗനിർദ്ദേശം നൽകുന്നു, സുരക്ഷ, മോണിറ്ററിംഗ്, സ്‌കെയിലബിലിറ്റി മികച്ച രീതി പാലിച്ച്.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**പരിചയപ്പെടുത്തൽ**:  
ഈ ഡോക്യുമെന്റ് AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. കൃത്യതയ്ക്ക് ഞങ്ങൾ ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയംകർമ്മ വിവർത്തനങ്ങളിൽ തെറ്റുകളും അസംബന്ധികതകളും ഉണ്ടാവാവുന്നതാണ്. അതിനാൽ, ആദിത്യഭാഷയിലിരിക്കുന്ന മൗലിക ഡോക്യുമെന്റ് പ്രാമാണികമായ ಮೂಲമായി പരിഗണിക്കണം. അത്യാവശ്യം അഭിമുഖവുമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മാനവ വിവർത്തനം നിർദേശിക്കുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന തെറ്റുകൾക്കോ നവീകരണങ്ങളിക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->