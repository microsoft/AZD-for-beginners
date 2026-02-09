# 5. Customize a Template

!!! tip "ਇਸ ਮੋਡੀਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ"

    - [ ] ਡਿਫੌਲਟ AI ਏਜੰਟ ਸਮਰੱਥਾਵਾਂ ਦੀ ਖੋਜ ਕੀਤੀ
    - [ ] ਆਪਣੀ ਆਪਣੀ ਇੰਡੈਕਸ ਨਾਲ AI ਖੋਜ ਜੋੜੀ
    - [ ] ਟ੍ਰੇਸਿੰਗ ਮੈਟ੍ਰਿਕਸ ਨੂੰ ਸක්ਰੀਆ ਕੀਤਾ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕੀਤਾ
    - [ ] ਇੱਕ ਮੁਲਾਂਕਣ ਰਨ ਚਲਾਇਆ
    - [ ] ਇੱਕ ਰੈੱਡ-ਟੀਮਿੰਗ ਸਕੈਨ ਚਲਾਇਆ
    - [ ] **ਲੈਬ 5: ਅਨੁਕੂਲਤਾ ਯੋਜਨਾ ਬਣਾਈ** 

---

## 5.1 AI Agent Capabilities

!!! success "ਅਸੀਂ ਇਹ ਲੈਬ 01 ਵਿੱਚ ਪੂਰਾ ਕੀਤਾ"

- **File Search**: OpenAI ਦਾ ਬਿਲਟ-ਇਨ ਫਾਇਲ ਖੋਜ ਗਿਆਨ ਪਹੁੰਚ ਲਈ
- **Citations**: ਜਵਾਬਾਂ ਵਿੱਚ ਆਟੋਮੈਟਿਕ ਸੋਰਸ ਉਦਘੋਸ਼ਣਾ
- **Customizable Instructions**: ਏਜੰਟ ਦੇ ਵਿਹਾਰ ਅਤੇ ਸ਼ਖਸੀਅਤ ਨੂੰ ਬਦਲੋ
- **Tool Integration**: ਕਸਟਮ ਸਮਰੱਥਾਵਾਂ ਲਈ ਵਿਆਪਕ ਟੂਲ ਸਿਸਟਮ

---

## 5.2 Knowledge Retrieval Options

!!! task "ਇਸ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਨੂੰ ਬਦਲਾਵ ਕਰਨੇ ਅਤੇ ਮੁੜ-ਡਿਪਲੋਇ ਕਰਨ ਦੀ ਲੋੜ ਹੈ"    
    
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

- Microsoft Foundry Agents ਵਿੱਚ ਬਿਲਟ-ਇਨ
- ਦਸਤਾਵੇਜ਼ਾਂ ਦੀ ਆਟੋਮੈਟਿਕ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਇੰਡੈਕਸਿੰਗ
- ਹੋਰ ਕਿਸੇ ਵਿਸ਼ੇਸ਼ Конਫਿਗਰੇਸ਼ਨ ਦੀ ਲੋੜ ਨਹੀਂ

**Azure AI Search (Optional):**

- ਹਾਈਬ੍ਰਿਡ ਸੈਮੈਂਟਿਕ ਅਤੇ ਵੈਕਟਰ ਖੋਜ
- ਕਸਟਮ ਇੰਡੈਕਸ ਪ੍ਰਬੰਧਨ
- ਉन्नਤ ਖੋਜ ਸਮਰੱਥਾਵਾਂ
- ਜ਼ਰੂਰੀ: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ਟਰੇਸਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ਇਸ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਨੂੰ ਬਦਲਾਵ ਕਰਨੇ ਅਤੇ ਮੁੜ-ਡਿਪਲੋਇ ਕਰਨ ਦੀ ਲੋੜ ਹੈ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry ਇੰਟੀਗਰੇਸ਼ਨ
- ਰਿਕਵੇਸਟ/ਰਿਸਪਾਂਸ ਟ੍ਰੈੱਕਿੰਗ
- ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ
- Microsoft Foundry ਪੋਰਟਲ ਵਿੱਚ ਉਪਲਬਧ

**Logging:**

- Container Apps ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੋਗز
- ਕੋਰਲੇਸ਼ਨ ID ਨਾਲ ਸਟ੍ਰੱਕਚਰਡ ਲੌਗਿੰਗ
- ਰੀਅਲ-ਟਾਈਮ ਅਤੇ ਇਤਿਹਾਸਕ ਲੌਗ ਦੇਖਣਾ

---

## 5.4 [ਏਜੰਟ ਮੁਲਾਂਕਣ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- ਗੁਣਵੱਤਾ ਅੰਕਣ ਲਈ ਬਿਲਟ-ਇਨ ਇਵੈਲੀਯੂਏਟਰ
- ਕਸਟਮ ਮੁਲਾਂਕਣ ਸਕਰਿਪਟ
- ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ

**Continuous Monitoring:**

- ਲਾਈਵ ਇੰਟਰੈਕਸ਼ਨਾਂ ਦੀ ਆਟੋਮੈਟਿਕ ਮੁਲਾਂਕਣ
- ਗੁਣਵੱਤਾ ਮੈਟ੍ਰਿਕਸ ਟਰੈਕਿੰਗ
- ਪ੍ਰਦਰਸ਼ਨ ਰਿਗ੍ਰੈਸ਼ਨ ਦਾ ਪਤਾ ਲਗਾਣਾ

**CI/CD Integration:**

- GitHub Actions ਵਰਕਫਲੋ
- ਆਟੋਮੇਟਿਕ ਟੈਸਟਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ
- ਸਟੈਟਿਸਟਿਕਲ ਤੁਲਨਾਤਮਕ ਟੈਸਟਿੰਗ

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- ਆਟੋਮੇਟਿਕ ਸੁਰੱਖਿਆ ਸਕੈਨਿੰਗ
- AI ਸਿਸਟਮਾਂ ਲਈ ਖਤਰਾ ਅੰਕਣ
- ਕਈ ਸ਼੍ਰੇਣੀਆਂ 'ਚ ਸੁਰੱਖਿਆ ਮੁਲਾਂਕਣ

**Authentication:**

- Azure ਸੇਵਾਵਾਂ ਲਈ Managed Identity
- ਵਿਕਲਪੀਕ Azure App Service ਪ੍ਰਮਾਣਿਕਤਾ
- ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਬੇਸਿਕ ਆਥ ਫੌਲਬੈਕ



!!! quote "ਇਸ ਲੈਬ ਦੇ ਅੰਤ ਤੱਕ ਤੁਹਾਡੇ ਕੋਲ ਇਹ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ"
    - [ ] ਆਪਣੀ ਸਿਨਾਰੀਓ ਦੀਆਂ ਲੋੜਾਂ ਨਿਰਧਾਰਤ ਕੀਤੀਆਂ
    - [ ] env ਵੈਰੀਏਬਲ (config) ਨੂੰ ਅਨੁਕੂਲ ਕੀਤਾ
    - [ ] ਏਜੰਟ ਹਦਾਇਤਾਂ (ਟਾਸਕ) ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕੀਤਾ
    - [ ] ਅਨੁਕੂਲ ਟੈਂਪਲੇਟ ਨੂੰ ਡਿਪਲੋਇ ਕੀਤਾ (ਐਪ)
    - [ ] ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਾਅਦਕਾਰ ਕਾਰਜ (ਮੈਨੂਅਲ) ਪੂਰੇ ਕੀਤੇ
    - [ ] ਇੱਕ ਟੈਸਟ ਮੁਲਾਂਕਣ ਚਲਾਇਆ

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: ਗਾਹਕਾਂ ਨੂੰ ਉਤਪਾਦ ਲੱਭਣ ਅਤੇ ਤੁਲਨਾ ਕਰਨ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰਦਾ ਹੈ
   - Loyalty Agent: ਗਾਹਕ ਰਿਵਾਰਡ ਅਤੇ ਪ੍ਰੋਮੋਸ਼ਨਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕਰਦਾ ਹੈ

#### **Model Deployments:**

   - `gpt-4.1`: ਪ੍ਰਾਇਮਰੀ ਚੈਟ ਮਾਡਲ
   - `o3`: ਜਟਿਲ ਪ੍ਰਸ਼ਨਾਂ ਲਈ ਰੀਜ਼ਨਿੰਗ ਮਾਡਲ
   - `gpt-4.1-nano`: ਸਧਾਰਣ ਇੰਟਰਐਕਸ਼ਨਾਂ ਲਈ ਹਲਕਾ ਮਾਡਲ
   - `text-embedding-3-large`: ਖੋਜ ਲਈ ਉੱਚ-ਗੁਣਵੱਤਾ ਇਕਾਈਆਂ (embeddings)

#### **Features:**

   - ਟਰੇਸਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ ਸක්ਰੀਆ
   - ਉਤਪਾਦ ਕੈਟਲੌਗ ਲਈ AI ਖੋਜ
   - ਗੁਣਵੱਤਾ ਆਸ਼ਵਾਸਨ ਲਈ ਮੁਲਾਂਕਣ ਢਾਂਚਾ
   - ਸੁਰੱਖਿਆ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ ਰੈੱਡ-ਟੀਮਿੰਗ

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ਵਾਤਾਵਰਨ ਦਾ ਨਾਮ ਸੈੱਟ ਕਰੋ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ਰੇਜਨ ਸੰਰਚਨਾ ਕਰੋ (ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਦੇ ਅਧਾਰ 'ਤੇ ਚੁਣੋ)
azd env set AZURE_LOCATION "eastus2"

# ਸਾਰੇ ਵਿਕਲਪਿਕ ਸੇਵਾਵਾਂ ਚਾਲੂ ਕਰੋ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ਮੁੱਖ ਚੈਟ ਮਾਡਲ ਸੰਰਚਨਾ ਕਰੋ (gpt-4.1 ਦੇ ਸਭ ਤੋਂ ਨੇੜੇ ਉਪਲਬਧ ਮਾਡਲ ਵਜੋਂ gpt-4o)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ਸੁਧਰੇ ਹੋਏ ਸਰਚ ਲਈ ਐਂਬੈਡਿੰਗ ਮਾਡਲ ਸੰਰਚਨਾ ਕਰੋ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ਏਜੰਟ ਦਾ ਨਾਮ ਸੈੱਟ ਕਰੋ (ਇਹ ਪਹਿਲਾ ਏਜੰਟ ਬਣਾਏਗਾ)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ਸਰਚ ਇੰਡੈਕਸ ਸੰਰਚਨਾ ਕਰੋ
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

# ਪੂਰਵ-ਸ਼ਰਤਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ਮਾਹੌਲ ਸੈੱਟ ਕਰੋ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ਚੁਣੇ ਹੋਏ ਖੇਤਰ ਵਿੱਚ ਕੋਟਾ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ਤੈਨਾਤ ਦੇ ਨਤੀਜੇ ਸੰਗ੍ਰਹਿਤ ਕਰੋ
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

# ਮੈਨੂਅਲ ਸੰਰਚਨਾ ਲਈ ਹਿਦਾਇਤਾਂ
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

# ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਵਾਤਾਵਰਨ ਦੇ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕੀਤੇ ਗਏ ਹਨ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਜੇ ਕਨਫਿਗਰ ਕੀਤਾ ਗਿਆ ਹੈ ਤਾਂ ਮੁਲਾਂਕਣ ਚਲਾਓ
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

      - Microsoft Foundry ਪ੍ਰੋਜੈਕਟ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟਸ ਨਾਲ
      - वेਬ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਹੋਸਟ ਕਰਨ ਵਾਲੇ Container Apps
      - ਉਤਪਾਦ ਕੈਟਲੌਗ ਲਈ AI Search ਸੇਵਾ
      - ਨਿਗਰਾਨੀ ਲਈ Application Insights

2. **Initial Agent:**

      - Shopper Agent ਬੁਨਿਆਦੀ ਹਦਾਇਤਾਂ ਨਾਲ ਸੰਰਚਿਤ
      - ਫਾਇਲ ਖੋਜ ਸਮਰੱਥਾ ਸਕਰੀਆ
      - ਟਰੇਸਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ ਸੰਰਚਿਤ

3. **Ready for Customization:**

      - Loyalty Agent ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਢਾਂਚਾ
      - ਕਸਟਮ ਹਦਾਇਤ ਟੈਂਪਲੇਟ
      - ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਧਤਾ ਸਕਰਿਪਟ
      - ਨਿਗਰਾਨੀ ਅਤੇ ਮੁਲਾਂਕਣ ਸੈੱਟਅਪ

4. **Production Readiness:**

      - ਰੈੱਡ-ਟੀਮਿੰਗ ਨਾਲ ਸੁਰੱਖਿਆ ਸਕੈਨਿੰਗ
      - ਪ੍ਰਦਰਸ਼ਨ ਨਿਗਰਾਨੀ
      - ਗੁਣਵੱਤਾ ਮੁਲਾਂਕਣ ਢਾਂਚਾ
      - ਸਕੇਲ ਕਰਨ ਯੋਗ ਆਰਕੀਟੈਕਚਰ

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->