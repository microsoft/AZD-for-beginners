# 5. Customize a Template

!!! tip "ਇਸ ਮਾਡਿਊਲ ਦੇ ਅਖੀਰ ਤੱਕ ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ"

    - [ ] ਡਿਫਾਲਟ AI ਏਜੰਟ ਸਮਰੱਥਾਵਾਂ ਦੀ ਖੋਜ ਕੀਤੀ
    - [ ] ਆਪਣੀ ਆਪਣੀ ਇੰਡੈਕਸ ਨਾਲ AI Search ਜੋੜਿਆ
    - [ ] ਟ੍ਰੇਸਿੰਗ ਮੈਟ੍ਰਿਕਸ ਸਰਗਰਮ ਕੀਤੀਆਂ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕੀਤੀ
    - [ ] ਇੱਕ ਮੁਲਾਂਕਣ ਚਲਾਇਆ
    - [ ] रेड-ਟੀਮਿੰਗ ਸਕੈਨ ਚਲਾਇਆ
    - [ ] **ਲੈਬ 5: ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਯੋਜਨਾ ਬਣਾਈ** 

---

## 5.1 AI ਏਜੰਟ ਸਮਰੱਥਾਵਾਂ

!!! success "ਅਸੀਂ ਇਹ ਲੈਬ 01 ਵਿੱਚ ਪੂਰਾ ਕੀਤਾ"

- **File Search**: OpenAI ਦੀ ਬਣੀ ਹੋਈ ਫਾਇਲ ਖੋਜ ਜਾਣਕਾਰੀ ਪ੍ਰਾਪਤੀ ਲਈ
- **Citations**: ਜਵਾਬਾਂ ਵਿੱਚ ਸੋਰਸ ਦਾ ਆਟੋਮੈਟਿਕ ਉਲੇਖ
- **Customizable Instructions**: ਏਜੰਟ ਦੇ ਵਰਤਾਰਾ ਅਤੇ ਪर्सਨਾਲਿਟੀ ਨੂੰ ਬਦਲੋ
- **Tool Integration**: ਕੁਸਟਮ ਸਮਰੱਥਾਵਾਂ ਲਈ ਵਿਆਪਕ ਟੂਲ ਸਿਸਟਮ

---

## 5.2 ਗਿਆਨ ਪ੍ਰਾਪਤੀ ਵਿਕਲਪ

!!! task "ਇਸ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਨੂੰ ਬਦਲਾਅ ਕਰਕੇ ਮੁੜ-ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਲੋੜ ਹੈ"    
    
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

- Foundry Agents ਵਿੱਚ ਇੰਬਿਲਟ
- ਡਾਕਯੂਮੈਂਟਾਂ ਦੀ ਆਟੋਮੈਟਿਕ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਇੰਡੈਕਸਿੰਗ
- ਹੋਰ ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਲੋੜ ਨਹੀਂ

**Azure AI Search (Optional):**

- ਹਾਈਬ੍ਰਿਡ ਸੈਮੈਂਟਿਕ ਅਤੇ ਵੈਕਟਰ ਖੋਜ
- ਕੁਸਟਮ ਇੰਡੈਕਸ ਪ੍ਰਬੰਧਨ
- ਅドਵਾਂਸਡ ਖੋਜ ਸਮਰੱਥਾਵਾਂ
- ਲੋੜ ਹੈ `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ਟ੍ਰੇਸਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ਇਸ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਨੂੰ ਬਦਲਾਅ ਕਰਕੇ ਮੁੜ-ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਲੋੜ ਹੈ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ਟ੍ਰੇਸਿੰਗ:**

- OpenTelemetry ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਰਿਕਵੇਸਟ/ਰਿਸਪਾਂਸ ਟ੍ਰੈਕਿੰਗ
- ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ
- Microsoft Foundry ਪੋਰਟਲ ਵਿੱਚ ਉਪਲਬਧ

**ਲੌਗਿੰਗ:**

- Container Apps ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ
- ਕੋਰਲੇਸ਼ਨ ID ਨਾਲ ਸਟਰੱਕਚਰਡ ਲੌਗਿੰਗ
- ਰੀਅਲ-ਟਾਈਮ ਅਤੇ ਇਤਿਹਾਸਕ ਲੌਗ ਵੇਖਣਾ

---

## 5.4 [ਏਜੰਟ ਮੂਲਾਂਕਣ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ਲੋਕਲ ਮੂਲਾਂਕਣ:**

- ਗੁਣਵੱਤਾ ਅੰਕਣ ਲਈ ਇੰਬਿਲਟ ਇਵੈਲੂਏਟਰ
- ਕੁਸਟਮ ਮੁਲਾਂਕਣ ਸਕ੍ਰਿਪਟ
- ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ

**ਲਗਾਤਾਰ ਮਾਨੀਟਰਿੰਗ:**

- ਲਾਈਵ ਇੰਟਰੈਕਸ਼ਨਜ਼ ਦਾ ਆਟੋਮੈਟਿਕ ਮੁਲਾਂਕਣ
- ਗੁਣਵੱਤਾ ਮੈਟ੍ਰਿਕਸ ਦੀ ਟ੍ਰੈਕਿੰਗ
- ਪ੍ਰਦਰਸ਼ਨ ਰੈਗਰੈਸ਼ਨ ਦਾ ਪਤਾ ਲਗਾਉਣਾ

**CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ:**

- GitHub Actions ਵਰਕਫਲੋ
- ਆਟੋਮੈਟਿਕ ਟੈਸਟਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ
- ਸਾਂਖਿਆਕੀ ਤੁਲਨਾਤਮਕ ਟੈਸਟਿੰਗ

---

## 5.5 [AI ਰੈਡ-ਟੀਮਿੰਗ ਏਜੰਟ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ਰੈਡ-ਟੀਮਿੰਗ:**

- ਆਟੋਮੈਟਿਕ ਸੁਰੱਖਿਆ ਸਕੈਨਿੰਗ
- AI ਸਿਸਟਮਾਂ ਲਈ ਜੋਖਮ ਅੰਕਣ
- ਕਈ ਸ਼੍ਰੇਣੀਆਂ ਵਿੱਚ ਸੁਰੱਖਿਆ ਮੁਲਾਂਕਣ

**ਪਛਾਣਕਰਨ:**

- Azure ਸੇਵਾਵਾਂ ਲਈ Managed Identity
- ਵਿਕਲਪਿਕ Azure App Service ਪਛਾਣਕਰਨ
- ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਬੇਸਿਕ ਓਥ ਫੈਲਬੈਕ



!!! quote "ਇਸ ਲੈਬ ਦੇ ਅਖੀਰ ਤੱਕ ਤੁਹਾਡੇ ਕੋਲ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ"
    - [ ] ਆਪਣੇ ਦ੍ਰਿਸ਼ਟੀਕੋਣ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨਿਰਧਾਰਤ ਕੀਤੀਆਂ
    - [ ] env ਵੈਰੀਏਬਲ (ਕਨਫਿਗ) ਨੂੰ ਕਸਟਮ ਕੀਤਾ
    - [ ] ਏਜੰਟ ਨਿਰਦੇਸ਼ (ਟਾਸਕ) ਨੂੰ ਕਸਟਮ ਕੀਤਾ
    - [ ] ਕਸਟਮਾਈਜ਼ਡ ਟੈਂਪਲੇਟ ਨੂੰ ਡਿਪਲੌਇ ਕੀਤਾ (ਐਪ)
    - [ ] ਡਿਪਲੌਇਮੈਂਟ-ਬਾਅਦ ਕਾਰਜ (ਮੈਨੂਅਲ) ਪੂਰੇ ਕੀਤੇ
    - [ ] ਇੱਕ ਟੈਸਟ ਮੁਲਾਂਕਣ ਚਲਾਇਆ

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: ਗਾਹਕਾਂ ਨੂੰ ਉਤਪਾਦ ਲੱਭਣ ਅਤੇ ਤੁਲਨਾ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦਾ
   - Loyalty Agent: ਗਾਹਕ ਰਿਵਾਰਡ ਅਤੇ ਪ੍ਰੋਮੋਸ਼ਨ ਪ੍ਰਬੰਧਿਤ ਕਰਦਾ

#### **Model Deployments:**

   - `gpt-4.1`: ਪ੍ਰਾਇਮਰੀ ਚੈਟ ਮਾਡਲ
   - `o3`: ਜਟਿਲ ਪ੍ਰਸ਼ਨਾਂ ਲਈ ਰੀਜ਼ਨਿੰਗ ਮਾਡਲ
   - `gpt-4.1-nano`: ਸਧਾਰਨ ਇੰਟਰੈਕਸ਼ਨਾਂ ਲਈ ਹਲਕਾ ਮਾਡਲ
   - `text-embedding-3-large`: ਖੋਜ ਲਈ ਉੱਚ-ਗੁਣਵੱਤਾ ਐਂਬੇਡਿੰਗ

#### **ਖਾਸੀਅਤਾਂ:**

   - ਟ੍ਰੇਸਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਸਰਗਰਮ
   - ਉਤਪਾਦ ਕੈਟਲੌਗ ਲਈ AI Search
   - ਗੁਣਵੱਤਾ ਯਕੀਨ ਲਈ ਮੁਲਾਂਕਣ ਫਰੇਮਵਰਕ
   - ਸੁਰੱਖਿਆ ਪੁਸ਼ਟੀ ਲਈ ਰੈਡ-ਟੀਮਿੰਗ

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ਵਾਤਾਵਰਣ ਦਾ ਨਾਮ ਸੈੱਟ ਕਰੋ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ਖੇਤਰ ਸੰਰਚਿਤ ਕਰੋ (ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਦੇ ਆਧਾਰ ਤੇ ਚੁਣੋ)
azd env set AZURE_LOCATION "eastus2"

# ਸਾਰੇ ਵਿਕਲਪਿਕ ਸੇਵਾਵਾਂ ਚਾਲੂ ਕਰੋ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ਮੁੱਖ ਚੈਟ ਮਾਡਲ ਸੰਰਚਿਤ ਕਰੋ (gpt-4.1 — gpt-4.1 ਦੇ ਸਭ ਤੋਂ ਨੇੜਲੇ ਉਪਲਬਧ ਮਾਡਲ ਵਜੋਂ)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ਬਿਹਤਰ ਖੋਜ ਲਈ ਐਂਬੈਡਿੰਗ ਮਾਡਲ ਸੰਰਚਿਤ ਕਰੋ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ਏਜੰਟ ਦਾ ਨਾਮ ਸੈੱਟ ਕਰੋ (ਪਹਿਲਾ ਏਜੰਟ ਬਣੇਗਾ)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ਖੋਜ ਇੰਡੈਕਸ ਸੰਰਚਿਤ ਕਰੋ
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

# ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ਵਾਤਾਵਰਨ ਸੈੱਟ ਕਰੋ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ਚੁਣੇ ਹੋਏ ਖੇਤਰ ਵਿੱਚ ਕੋਟਾ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ਤੈਨਾਤ ਦੇ ਨਤੀਜੇ ਰਿਕਾਰਡ ਕਰੋ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ਵੈੱਬ ਐਪ ਦਾ URL ਪ੍ਰਾਪਤ ਕਰੋ
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

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਜਾਣਕਾਰੀ ਪ੍ਰਾਪਤ ਕਰੋ
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# ਮੈਨੂਅਲ ਸੰਰਚਨਾ ਲਈ ਨਿਰਦੇਸ਼
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

# ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਹੋਣ ਦੀ ਜਾਂਚ ਕਰੋ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਉਪਲਬਧਤਾ ਜਾਂਚੋ
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

# ਜੇ ਸੰਰਚਿਤ ਹੋਵੇ ਤਾਂ ਮੁਲਾਂਕਣ ਚਲਾਓ
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

      - Microsoft Foundry ਪ੍ਰੋਜੈਕਟ ਨਾਲ ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ
      - ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਹੋਸਟ ਕਰਨ ਲਈ Container Apps
      - ਉਤਪਾਦ ਕੈਟਲੌਗ ਲਈ AI Search ਸੇਵਾ
      - ਮਾਨੀਟਰਿੰਗ ਲਈ Application Insights

2. **Initial Agent:**

      - Shopper Agent ਮੁੱਲ-ਨਿਰਦੇਸ਼ਾਂ ਨਾਲ ਕੰਫਿਗਰ ਕੀਤਾ ਗਿਆ
      - ਫਾਇਲ ਖੋਜ ਸਮਰੱਥਾ ਸਰਗਰਮ
      - ਟ੍ਰੇਸਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਸੰਰਚਿਤ

3. **ਤਿਆਰ ਇਨ-ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਲਈ:**

      - Loyalty Agent ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਫਰੇਮਵਰਕ
      - ਕਸਟਮ ਨਿਰਦੇਸ਼ ਟੈਂਪਲੇਟ
      - ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ
      - ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ ਸੈਟਅਪ

4. **ਪੈਦਾਵਾਰੀ ਤਿਆਰੀ:**

      - ਰੈਡ-ਟੀਮਿੰਗ ਨਾਲ ਸੁਰੱਖਿਆ ਸਕੈਨਿੰਗ
      - ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ
      - ਗੁਣਵੱਤਾ ਮੁਲਾਂਕਣ ਫਰੇਮਵਰਕ
      - ਸਕੇਲ ਕਰਨ ਯੋਗ ਆਰਕੀਟੈਕਚਰ

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣ-ਸਹੀ ਜਾਣਕਾਰੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਜਿਸਦੀ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਰਚਨਾ ਕੀਤੀ ਗਈ ਹੈ, ਉਸਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਵਜੋਂ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਪੈਦਾਂ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->