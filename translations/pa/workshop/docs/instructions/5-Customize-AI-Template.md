# 5. ਟੈਂਪਲੇਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ

!!! tip "ਇਸ ਮੋਡਿਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ"

    - [ ] ਡਿਫਾਲਟ AI ਏਜੰਟ ਸਮਰੱਥਾਵਾਂ ਦੀ ਜਾਂਚ ਕੀਤੀ
    - [ ] ਆਪਣੇ ਇੰਡੈਕਸ ਨਾਲ AI ਖੋਜ ਸ਼ਾਮਲ ਕੀਤੀ
    - [ ] ਟ੍ਰੇਸਿੰਗ ਮੈਟ੍ਰਿਕਸ ਨੂੰ ਐਕਟੀਵੇਟ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕੀਤਾ
    - [ ] ਇੱਕ ਮੁਲਾਂਕਨ ਚਲਾਉਣਾ ਕੀਤਾ
    - [ ] ਇੱਕ ਰੈੱਡ-ਟੀਮਿੰਗ ਸਕੈਨ ਚਲਾਇਆ
    - [ ] **ਲੈਬ 5: ਇੱਕ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਯੋਜਨਾ ਬਣਾਈ** 

---

## 5.1 AI ਏਜੰਟ ਸਮਰੱਥਾਵਾਂ

!!! success "ਅਸੀਂ ਇਹ ਲੈਬ 01 ਵਿੱਚ ਪੂਰਾ ਕੀਤਾ"

- **ਫਾਈਲ ਖੋਜ**: OpenAI ਦੀ ਬਣਾਈ ਫਾਈਲ ਖੋਜ ਗਿਆਨ ਪ੍ਰਾਪਤੀ ਲਈ
- **ਹਵਾਲੇ**: ਜਵਾਬਾਂ ਵਿੱਚ ਸਵੈਚਾਲਿਤ ਸਰੋਤ ਅਟ੍ਰਿਬਿਊਸ਼ਨ
- **ਕਸਟਮਾਈਜ਼ੇਬਲ ਹਦਾਇਤਾਂ**: ਏਜੰਟ ਦੇ ਵਿਹਾਰ ਅਤੇ ਸ਼ਖਸੀਅਤ ਨੂੰ ਸੋਧੋ
- **ਟੂਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: ਕਸਟਮ ਸਮਰੱਥਾਵਾਂ ਲਈ ਵਧਾਉਣਯੋਗ ਟੂਲ ਸਿਸਟਮ

---

## 5.2 ਗਿਆਨ ਪ੍ਰਾਪਤੀ ਵਿਕਲਪ

!!! task "ਇਸ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਨੂੰ ਬਦਲਾਅ ਕਰਨੇ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਇ ਕਰਨਾ ਪਵੇਗਾ"    
    
    ```bash title=""
    # ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈਟ ਕਰੋ
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ਡਾਟਾ ਅੱਪਲੋਡ ਕਰੋ ਅਤੇ ਆਪਣਾ ਇੰਡੈਕਸ ਬਣਾਓ

    ```

---

**OpenAI ਫਾਈਲ ਖੋਜ (ਡਿਫਾਲਟ):**

- Azure AI Agent ਸੇਵਾ ਵਿੱਚ ਬਣਾਈ ਗਈ
- ਸਵੈਚਾਲਿਤ ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਇੰਡੈਕਸਿੰਗ
- ਕੋਈ ਵਾਧੂ ਸੰਰਚਨਾ ਦੀ ਲੋੜ ਨਹੀਂ

**Azure AI ਖੋਜ (ਵਿਕਲਪਿਕ):**

- ਹਾਈਬ੍ਰਿਡ ਸੈਮੈਂਟਿਕ ਅਤੇ ਵੈਕਟਰ ਖੋਜ
- ਕਸਟਮ ਇੰਡੈਕਸ ਪ੍ਰਬੰਧਨ
- ਉੱਚ-ਸਤਹ ਖੋਜ ਸਮਰੱਥਾਵਾਂ
- `USE_AZURE_AI_SEARCH_SERVICE=true` ਦੀ ਲੋੜ ਹੈ

---

## 5.3 [ਟ੍ਰੇਸਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ਇਸ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਨੂੰ ਬਦਲਾਅ ਕਰਨੇ ਅਤੇ ਮੁੜ-ਡਿਪਲੌਇ ਕਰਨਾ ਪਵੇਗਾ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ਟ੍ਰੇਸਿੰਗ:**

- OpenTelemetry ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਬੇਨਤੀ/ਜਵਾਬ ਟ੍ਰੈਕਿੰਗ
- ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ
- AI Foundry ਪੋਰਟਲ ਵਿੱਚ ਉਪਲਬਧ

**ਲੌਗਿੰਗ:**

- ਕੰਟੇਨਰ ਐਪਸ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ
- ਕੋਰਲੇਸ਼ਨ IDs ਨਾਲ ਸਟ੍ਰਕਚਰਡ ਲੌਗਿੰਗ
- ਰੀਅਲ-ਟਾਈਮ ਅਤੇ ਇਤਿਹਾਸਕ ਲੌਗ ਦੇਖਣਾ

---

## 5.4 [ਏਜੰਟ ਮੁਲਾਂਕਨ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ਲੋਕਲ ਮੁਲਾਂਕਨ:**

- ਗੁਣਵੱਤਾ ਮੁਲਾਂਕਨ ਲਈ ਬਣਾਈ ਗਈ ਮੁਲਾਂਕਨ ਸਕ੍ਰਿਪਟ
- ਕਸਟਮ ਮੁਲਾਂਕਨ ਸਕ੍ਰਿਪਟ
- ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ

**ਨਿਰੰਤਰ ਮਾਨੀਟਰਿੰਗ:**

- ਲਾਈਵ ਇੰਟਰੈਕਸ਼ਨ ਦਾ ਸਵੈਚਾਲਿਤ ਮੁਲਾਂਕਨ
- ਗੁਣਵੱਤਾ ਮੈਟ੍ਰਿਕਸ ਟ੍ਰੈਕਿੰਗ
- ਪ੍ਰਦਰਸ਼ਨ ਰਿਗਰੈਸ਼ਨ ਦੀ ਪਛਾਣ

**CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ:**

- GitHub Actions ਵਰਕਫਲੋ
- ਸਵੈਚਾਲਿਤ ਟੈਸਟਿੰਗ ਅਤੇ ਮੁਲਾਂਕਨ
- ਸਾਂਖਿਆਤਮਕ ਤੁਲਨਾ ਟੈਸਟਿੰਗ

---

## 5.5 [AI ਰੈੱਡ-ਟੀਮਿੰਗ ਏਜੰਟ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ਰੈੱਡ-ਟੀਮਿੰਗ:**

- ਸਵੈਚਾਲਿਤ ਸੁਰੱਖਿਆ ਸਕੈਨਿੰਗ
- AI ਸਿਸਟਮਾਂ ਲਈ ਜੋਖਮ ਮੁਲਾਂਕਨ
- ਕਈ ਸ਼੍ਰੇਣੀਆਂ ਵਿੱਚ ਸੁਰੱਖਿਆ ਮੁਲਾਂਕਨ

**ਪ੍ਰਮਾਣਿਕਤਾ:**

- Azure ਸੇਵਾਵਾਂ ਲਈ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ
- ਵਿਕਲਪਿਕ Azure ਐਪ ਸੇਵਾ ਪ੍ਰਮਾਣਿਕਤਾ
- ਵਿਕਾਸ ਲਈ ਬੇਸਿਕ ਆਥFallback

!!! quote "ਇਸ ਲੈਬ ਦੇ ਅੰਤ ਤੱਕ ਤੁਹਾਡੇ ਕੋਲ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ"
    - [ ] ਆਪਣੇ ਸਿਨੇਰੀਓ ਦੀਆਂ ਲੋੜਾਂ ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕੀਤਾ
    - [ ] env ਵੈਰੀਏਬਲ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕੀਤਾ (ਕੰਫਿਗ)
    - [ ] ਏਜੰਟ ਹਦਾਇਤਾਂ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕੀਤਾ (ਟਾਸਕ)
    - [ ] ਕਸਟਮਾਈਜ਼ਡ ਟੈਂਪਲੇਟ ਨੂੰ ਡਿਪਲੌਇ ਕੀਤਾ (ਐਪ)
    - [ ] ਡਿਪਲੌਇਮੈਂਟ ਬਾਅਦ ਦੇ ਕੰਮ ਪੂਰੇ ਕੀਤੇ (ਮੈਨੂਅਲ)
    - [ ] ਇੱਕ ਟੈਸਟ ਮੁਲਾਂਕਨ ਚਲਾਇਆ

ਇਹ ਉਦਾਹਰਨ ਦਿਖਾਉਂਦੀ ਹੈ ਕਿ ਕਿਵੇਂ ਇੱਕ ਐਨਟਰਪ੍ਰਾਈਜ਼ ਰਿਟੇਲ ਸਿਨੇਰੀਓ ਲਈ ਟੈਂਪਲੇਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਦੋ ਵਿਸ਼ੇਸ਼ ਏਜੰਟ ਅਤੇ ਕਈ ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਸ਼ਾਮਲ ਹਨ।

---

## 5.6 ਇਸਨੂੰ ਆਪਣੇ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰੋ!

### 5.6.1. ਸਿਨੇਰੀਓ ਲੋੜਾਂ

#### **ਏਜੰਟ ਡਿਪਲੌਇਮੈਂਟ:** 

   - ਸ਼ਾਪਰ ਏਜੰਟ: ਗਾਹਕਾਂ ਨੂੰ ਉਤਪਾਦ ਲੱਭਣ ਅਤੇ ਤੁਲਨਾ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ
   - ਲਾਇਲਟੀ ਏਜੰਟ: ਗਾਹਕ ਇਨਾਮ ਅਤੇ ਪ੍ਰੋਮੋਸ਼ਨ ਪ੍ਰਬੰਧਿਤ ਕਰਦਾ ਹੈ

#### **ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ:**

   - `gpt-4.1`: ਪ੍ਰਾਇਮਰੀ ਚੈਟ ਮਾਡਲ
   - `o3`: ਜਟਿਲ ਪ੍ਰਸ਼ਨਾਂ ਲਈ ਤਰਕ ਮਾਡਲ
   - `gpt-4.1-nano`: ਸਧਾਰਨ ਇੰਟਰੈਕਸ਼ਨ ਲਈ ਹਲਕਾ ਮਾਡਲ
   - `text-embedding-3-large`: ਖੋਜ ਲਈ ਉੱਚ-ਗੁਣਵੱਤਾ ਵਾਲੇ ਐਮਬੈਡਿੰਗ

#### **ਫੀਚਰ:**

   - ਟ੍ਰੇਸਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਐਨਬਲ ਕੀਤੀ
   - ਉਤਪਾਦ ਕੈਟਾਲੌਗ ਲਈ AI ਖੋਜ
   - ਗੁਣਵੱਤਾ ਅਸ਼ਵਾਸਨ ਲਈ ਮੁਲਾਂਕਨ ਫਰੇਮਵਰਕ
   - ਸੁਰੱਖਿਆ ਵੈਰੀਫਿਕੇਸ਼ਨ ਲਈ ਰੈੱਡ-ਟੀਮਿੰਗ

---

### 5.6.2 ਸਿਨੇਰੀਓ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ


#### 5.6.2.1. ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਕੰਫਿਗ

`setup-retail.sh` ਸੈਟਅਪ ਸਕ੍ਰਿਪਟ ਬਣਾਓ

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

#### 5.6.2.2: ਏਜੰਟ ਹਦਾਇਤਾਂ

`custom-agents/shopper-agent-instructions.md` ਬਣਾਓ:

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

`custom-agents/loyalty-agent-instructions.md` ਬਣਾਓ:

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

#### 5.6.2.3: ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ

`deploy-retail.sh` ਬਣਾਓ:

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

#### 5.6.2.4: ਡਿਪਲੌਇਮੈਂਟ ਬਾਅਦ ਕੰਫਿਗ

`configure-retail-agents.sh` ਬਣਾਓ:

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

### 5.6.3: ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਰੀਫਿਕੇਸ਼ਨ

`test-retail-deployment.sh` ਬਣਾਓ:

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

### 5.6.4 ਉਮੀਦ ਕੀਤੇ ਨਤੀਜੇ

ਇਸ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਗਾਈਡ ਨੂੰ ਫਾਲੋ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਹਾਡੇ ਕੋਲ ਹੋਵੇਗਾ:

1. **ਡਿਪਲੌਇਡ ਇੰਫਰਾਸਟਰਕਚਰ:**

      - ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਨਾਲ AI Foundry ਪ੍ਰੋਜੈਕਟ
      - ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਹੋਸਟਿੰਗ ਕਰਨ ਵਾਲੇ ਕੰਟੇਨਰ ਐਪਸ
      - ਉਤਪਾਦ ਕੈਟਾਲੌਗ ਲਈ AI ਖੋਜ ਸੇਵਾ
      - ਮਾਨੀਟਰਿੰਗ ਲਈ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ

2. **ਸ਼ੁਰੂਆਤੀ ਏਜੰਟ:**

      - ਸ਼ਾਪਰ ਏਜੰਟ ਬੁਨਿਆਦੀ ਹਦਾਇਤਾਂ ਨਾਲ ਸੰਰਚਿਤ
      - ਫਾਈਲ ਖੋਜ ਸਮਰੱਥਾ ਐਨਬਲ ਕੀਤੀ
      - ਟ੍ਰੇਸਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਸੰਰਚਿਤ

3. **ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਲਈ ਤਿਆਰ:**

      - ਲਾਇਲਟੀ ਏਜੰਟ ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਫਰੇਮਵਰਕ
      - ਕਸਟਮ ਹਦਾਇਤਾਂ ਟੈਂਪਲੇਟ
      - ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟ
      - ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਨ ਸੈਟਅਪ

4. **ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ:**

      - ਰੈੱਡ-ਟੀਮਿੰਗ ਨਾਲ ਸੁਰੱਖਿਆ ਸਕੈਨਿੰਗ
      - ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ
      - ਗੁਣਵੱਤਾ ਮੁਲਾਂਕਨ ਫਰੇਮਵਰਕ
      - ਸਕੇਲਬਲ ਆਰਕੀਟੈਕਚਰ

ਇਹ ਉਦਾਹਰਨ ਦਿਖਾਉਂਦੀ ਹੈ ਕਿ AZD ਟੈਂਪਲੇਟ ਨੂੰ ਕਿਵੇਂ ਵਿਸ਼ੇਸ਼ ਐਨਟਰਪ੍ਰਾਈਜ਼ ਸਿਨੇਰੀਓਜ਼ ਲਈ ਵਧਾਇਆ ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ, ਜਦੋਂ ਕਿ ਸੁਰੱਖਿਆ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਸਕੇਲਬਿਲਟੀ ਲਈ ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸਾਂ ਨੂੰ ਬਰਕਰਾਰ ਰੱਖਿਆ ਜਾ ਸਕਦਾ ਹੈ।

---

