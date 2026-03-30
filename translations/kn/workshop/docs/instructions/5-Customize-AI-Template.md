# 5. ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ

!!! tip "ಈ ಘಟಕದ ಕೊನೆಯಲ್ಲಿ ನೀವು ಈ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಹೊಂದಿರುತ್ತೀರಿ"

    - [ ] ಡೀಫಾಲ್ಟ್ AI ಏಜೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಅನ್ವೇಷಿಸಲಾಗಿದೆ
    - [ ] ನಿಮ್ಮ ಸ್ವಂತ ಇಂಡೆಕ್ಸಿನೊಂದಿಗೆ AI ಶೋಧನೆಯನ್ನು ಸೇರಿಸಲಾಗಿದೆ
    - [ ] ಟ್ರೇಸಿಂಗ್ ಮೆಟ್ರಿಕ್ಸ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ವಿಶ್ಲೇಷಿಸಲಾಗಿದೆ
    - [ ] ಮೌಲ್ಯಮಾಪನ ರನ್ ನಡೆಸಲಾಗಿದೆ
    - [ ] ರೆಡ್-ಟೀಮಿಂಗ್ ಸ್ಕ್ಯಾನ್ ನಡೆಸಲಾಗಿದೆ
    - [ ] **ಲ್ಯಾಬ್ 5: ಕಸ್ಟಮೈಜೇಶನ್ ಯೋಜನೆ ನಿರ್ಮಿಸಲಾಗಿದೆ** 

---

## 5.1 AI ಏಜೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳು

!!! success "ನಾವು ಇದನ್ನು ಲ್ಯಾಬ್ 01 ನಲ್ಲಿ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ"

- **File Search**: ಜ್ಞಾನ ಪಡೆದಿಕೆಗೆ OpenAI ಒಳಗ್ನಿರುತ್ತದೆ ಫೈಲ್ ಶೋಧನೆ
- **Citations**: ಪ್ರತಿಕ್ರಿಯೆಗಳಲ್ಲಿ ಸ್ವಯಂಚಾಲಿತ ಮೂಲ ಉಲ್ಲೇಖ
- **ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದಾದ ಸೂಚನೆಗಳು**: ಏಜೆಂಟ್ ವರ್ತನೆ ಮತ್ತು ವ್ಯಕ್ತಿತ್ವವನ್ನು ಬದಲಾಯಿಸಬಹುದು
- **ಉಪಕರಣ ಸಂಯೋಜನೆ**: ಕಸ್ಟಮ್ ಸಾಮರ್ಥ್ಯಗಳಿಗೆ ವಿಸ್ತಾರದೋಗ್ಯ ಉಪಕರಣ ವ್ಯವಸ್ಥೆ

---

## 5.2 ಜ್ಞಾನ ಪಡೆಯುವ ಆಯ್ಕೆಗಳು

!!! task "ಇದನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮರುನಿಯೋಜನೆ ಮಾಡಬೇಕಾಗುತ್ತದೆ"    
    
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

**OpenAI ಫೈಲ್ ಶೋಧನೆ (ಡೀಫಾಲ್ಟ್):**

- Foundry ಏಜೆಂಟ್ಗಳಿಗೆ ಒಳಗಿದೆ
- ಸ್ವಯಂಚಾಲಿತ ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ಇಂಡೆಕ್ಸಿಂಗ್
- ಯಾವುದೇ ಹೆಚ್ಚುವರಿ ಸಂರಚನೆ ಅಗತ್ಯವಿಲ್ಲ

**Azure AI Search (ಐಚ್ಛಿಕ):**

- ಹೈಬ್ರಿಡ್ ಸೆಮ್ಯಾಂಟಿಕ್ ಮತ್ತು ವೆಕ್ಟರ್ ಶೋಧನೆ
- ಕಸ್ಟಮ್ ಇಂಡೆಕ್ಸು ನಿರ್ವಹಣೆ
- ಅತ್ಯಾಧುನಿಕ ಶೋಧನೆ ಸಾಮರ್ಥ್ಯಗಳು
- ಅಗತ್ಯವಿದೆ `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ಟ್ರೆಸಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ಇದನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮರುನಿಯೋಜನೆ ಮಾಡಬೇಕಾಗುತ್ತದೆ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ಟ್ರೆಸಿಂಗ್:**

- OpenTelemetry ಏಕೀಕರಣ
- ವಿನಂತಿ/ಪ್ರತಿಕ್ರಿಯೆ ಟ್ರ್ಯಾಕಿಂಗ್
- ಕಾರ್ಯಕ್ಷಮತಾ ಮೆಟ್ರಿಕ್ಸ್
- Microsoft Foundry ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಲಭ್ಯ

**ಲಾಗಿಂಗ್:**

- Container Apps ನಲ್ಲಿ ಅಪ್ಲಿಕೇಷನ್ ಲಾಗ್ಗಳು
-Correlation ID ಗಳೊಂದಿಗೆ ರಚನಾತ್ಮಕ ಲಾಗಿಂಗ್
- ರಿಯಲ್-ಟೈಮ್ ಮತ್ತು ಐತಿಹಾಸಿಕ ಲಾಗ್ ವೀಕ್ಷಣೆ

---

## 5.4 [ಏಜೆಂಟ್ ಮೌಲ್ಯಮಾಪನ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ಸ್ಥಳೀಯ ಮೌಲ್ಯಮಾಪನ:**

- ಗುಣಮಟ್ಟ ಮೌಲ್ಯಮಾಪನಕ್ಕೆ ಒಳಗಾದ ನಿರ್ಮಿತ ಮೌಲ್ಯಮಾಪಕರು
- ಕಸ್ಟಮ್ ಮೌಲ್ಯಮಾಪನ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ಕಾರ್ಯಕ್ಷಮತಾ ಬೆಂಚ್‌ಮಾರ್ಕಿಂಗ್

**ನಿರಂತರ ಮಾನಿಟರಿಂಗ್:**

- ಲೈವ್ ಕನ್ವರ್ಶನ್‌ಗಳ ಸ್ವಯಂಚಾಲಿತ ಮೌಲ್ಯಮಾಪನ
- ಗುಣಮಟ್ಟ ಮೆಟ್ರಿಕ್ಸ್ ಟ್ರ್ಯಾಕಿಂಗ್
- ಕಾರ್ಯಕ್ಷಮತಾ ಹ್ರಾಸ ಪತ್ತೆ

**CI/CD ಸಂಯೋಜನೆ:**

- GitHub Actions ವರ್ಕ್‌ಫ್ಲೋ
- ಸ್ವಯಂಚಾಲಿತ ಪರೀಕ್ಷೆ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ
- ಸ್ಥಿತಿಸಂಖ್ಯಾತ್ಮಕ ಹೋಲಿಕೆ ಪರೀಕ್ಷೆ

---

## 5.5 [AI ರೆಡ್-ಟೀಮಿಂಗ್ ಏಜೆಂಟ್](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ರೆಡ್-ಟೀಮಿಂಗ್:**

- ಸ್ವಯಂಚಾಲಿತ ಭದ್ರತಾ ಸ್ಕ್ಯಾನಿಂಗ್
- AI ವ್ಯವಸ್ಥೆಗಳಿಗಾಗಿ ಅಪಾಯ ಮೌಲ್ಯಮಾಪನ
- ಅನೇಕ ವರ್ಗಗಳಲ್ಲಿ ಸುರಕ್ಷತಾ ಮೌಲ್ಯಮಾಪನ

**ಪ್ರಮಾಣೀಕರಣ:**

- Azure ಸೇವೆಗಳಿಗಾಗಿ Managed Identity
- ಐಚ್ಛಿಕ Azure App Service ಪ್ರಮಾಣೀಕರಣ
- ಅಭಿವೃದ್ಧಿಗಾಗಿ ಮೂಲಭೂತ authFallback

!!! quote "ಈ ಲ್ಯಾಬ್‌ನ ಕೊನೆಯಲ್ಲಿ ನೀವು ಇವುಗಳನ್ನು ಹೊಂದಿರಬೇಕು"
    - [ ] ನಿಮ್ಮ ಸನ್ನಿವೇಶದ ಅಗತ್ಯಗಳನ್ನು ನಿರ್ಧರಿಸಿ
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ env ಚರಗಳು (config)
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ ಏಜೆಂಟ್ ಸೂಚನೆಗಳು (task)
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ ಟೆಂಪ್ಲೇಟ್ ನಿಯೋಜಿಸಲಾಗಿದೆ (app)
    - [ ] ನಿಯೋಜನೆ ನಂತರದ ಕಾರ್ಯಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಲಾಗಿದೆ (manual)
    - [ ] ಟೆಸ್ಟ್ ಮೌಲ್ಯಮಾಪನ ನಡೆಸಿ

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 ಇದನ್ನು ನಿಮ್ಮಿಗಾಗಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ!

### 5.6.1. ಸನ್ನಿವೇಶದ ಅಗತ್ಯಗಳು

#### **ಏಜೆಂಟ್ ನಿಯೋಜನೆಗಳು:** 

   - Shopper Agent: ಗ್ರಾಹಕರಿಗೆ ಉತ್ಪನ್ನಗಳನ್ನು ಹುಡುಕಲು ಮತ್ತು ಹೋಲಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ
   - Loyalty Agent: ಗ್ರಾಹಕ ರಿವಾರ್ಡ್‌ಗಳು ಮತ್ತು ಪ್ರಚಾರಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ

#### **ಮಾದರಿ ನಿಯೋಜನೆಗಳು:**

   - `gpt-4.1`: ಪ್ರಾಥಮಿಕ ಚಾಟ್ ಮಾದರಿ
   - `o3`: ಸಂಕೀರ್ಣ ಪ್ರಶ್ನೆಗಳಿಗೆ ತರ್ಕಾತ್ಮಕ ಮಾದರಿ
   - `gpt-4.1-nano`: ಸರಳ ಸಂವಹನಗಳಿಗೆ ಲಘು ತೂಕದ ಮಾದರಿ
   - `text-embedding-3-large`: ಶೋಧನೆಗಾಗಿ ಉನ್ನತ ಗುಣಮಟ್ಟದ ಎಂಬೆಡ್ಡಿಂಗ್‌ಗಳು

#### **ವೈಶಿಷ್ಟ್ಯಗಳು:**

   - ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಸಕ್ರಿಯಗೊಂಡಿದೆ
   - ಉತ್ಪನ್ನ ಕ್ಯಾಟಲೋಗ್‌ಗಾಗಿ AI ಶೋಧನೆ
   - ಗುಣಮಟ್ಟ ಭರವಸೆಗೆ ಮೌಲ್ಯಮಾಪನ ಫ್ರೇಮ್‌ವರ್ಕ್
   - ಭದ್ರತಾ ಮಾನ್ಯತೆಗಾಗಿ ರೆಡ್-ಟೀಮಿಂಗ್

---

### 5.6.2 ಸನ್ನಿವೇಶ ಅನುಷ್ಠಾನ


#### 5.6.2.1. ನಿಯೋಜನೆ ಪೂರ್ವ ಸಂರಚನೆ

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ಪರಿಸರದ ಹೆಸರು ನಿಗದಿಪಡಿಸಿ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ಪ್ರದೇಶವನ್ನು ಸಂರಚಿಸಿ (ಮಾದರಿ ಲಭ್ಯತೆಯ ಆಧಾರದ ಮೇಲೆ ಆಯ್ಕೆಮಾಡಿ)
azd env set AZURE_LOCATION "eastus2"

# ಎಲ್ಲಾ ಐಚ್ಛಿಕ ಸೇವೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ಪ್ರಾಥಮಿಕ ಚಾಟ್ ಮಾದರಿಯನ್ನು ಸಂರಚಿಸಿ (gpt-4.1 ಅನ್ನು gpt-4.1ಗೆ ಅತ್ಯಂತ ಸಮೀಪವಾದ ಲಭ್ಯವಿರುವ ಮಾದರಿಯಾಗಿ)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ಸುಧಾರಿತ ಶೋಧನೆಗಾಗಿ ಎಂಬೆಡ್ಡಿಂಗ್ ಮಾದರಿಯನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ಏಜೆಂಟ್ ಹೆಸರನ್ನು ನಿಗದಿಪಡಿಸಿ (ಮೊದಲ ಏಜೆಂಟ್ ರಚಿಸಲಾಗುವುದು)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ಶೋಧನಾ ಸೂಚ್ಯಂಕವನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ಏಜೆಂಟ್ ಸೂಚನೆಗಳು

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

#### 5.6.2.3: ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# ಪೂರ್ವಾಪೇಕ್ಷೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ಪರಿಸರವನ್ನು ಸ್ಥಾಪಿಸಿ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ಆಯ್ದ ಪ್ರದೇಶದಲ್ಲಿ ಕೊಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ
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

# ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ನಿಯೋಜನೆಯ ಫಲಿತಾಂಶಗಳನ್ನು ದಾಖಲುಮಾಡಿ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪಡೆಯಿರಿ
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

#### 5.6.2.4: ನಿಯೋಜನೆ ನಂತರದ ಸಂರಚನೆ

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ಡಿಪ್ಲಾಯ್‌ನ ಮಾಹಿತಿ ಪಡೆಯಿರಿ
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# ಹಸ್ತಚಾಲಿತ ಸಂರಚನೆಗಾಗಿ ಸೂಚನೆಗಳು
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

### 5.6.3: ಪರೀಕ್ಷೆ ಮತ್ತು ಮಾನ್ಯತೆ

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ಪರಿಸರ ಚರಗಳು ಹೊಂದಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಲಭ್ಯತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
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

# ಕನ್ಫಿಗರ್ ಮಾಡಿದ್ದರೆ ಮೌಲ್ಯಮಾಪನವನ್ನು ನಡೆಸಿ
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

### 5.6.4 ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶಗಳು

After following this implementation guide, you will have:

1. **ನಿಯೋಜಿತ ಮೂಲಸೌಕರ್ಯ:**

      - Microsoft Foundry ಪ್ರಾಜೆಕ್ಟ್ ಮಾದರಿ ನಿಯೋಜನೆಗಳೊಂದಿಗೆ
      - ವೆಬ್ ಅಪ್ಲಿಕೇಷನ್ ಅನ್ನು ಹೊಸ್ತಿಲು ಮಾಡುವ Container Apps
      - ಉತ್ಪನ್ನ ಕ್ಯಾಟಲೋಗ್‌ಗಾಗಿ AI Search ಸೇವೆ
      - ಮಾನಿಟರಿಂಗ್‌ಗಾಗಿ Application Insights

2. **ಪ್ರಾಥಮಿಕ ಏಜೆಂಟ್:**

      - ಮೂಲಭೂತ ಸೂಚನೆಗಳೊಂದಿಗೆ Shopper Agent ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
      - ಫೈಲ್ ಶೋಧನೆ ಸಾಮರ್ಥ್ಯ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
      - ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ

3. **ಕಸ್ಟಮೈಜೆಶನ್‌ಗೆ ಸಿದ್ಧ:**

      - Loyalty Agent ಅನ್ನು ಸೇರಿಸಲು ಫ್ರೇಮ್‌ವರ್ಕ್
      - ಕಸ್ಟಮ್ ಸೂಚನೆ ಟೆಂಪ್ಲೇಟುಗಳು
      - ಪರೀಕ್ಷೆ ಮತ್ತು ಮಾನ್ಯತಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
      - ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ ವ್ಯವಸ್ಥೆ

4. **ಉತ್ಪಾದನಾ ಸಿದ್ಧತೆ:**

      - ರೆಡ್-ಟೀಮಿಂಗ್ ಸಹಿತ ಭದ್ರತಾ ಸ್ಕ್ಯಾನಿಂಗ್
      - ಕಾರ್ಯಕ್ಷಮತೆ ಮಾನಿಟರಿಂಗ್
      - ಗುಣಮಟ್ಟ ಮೌಲ್ಯಮಾಪन ಫ್ರೇಮ್‌ವರ್ಕ್
      - ಸ್ಕೇಲಬಲ್ ಆರ್ಕಿಟೆಕ್ಚರ್

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು AI ಭಾಷಾಂತರ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿಕೊಂಡು ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾಗಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅನಿಖರತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು ಅಧಿಕೃತ ಮೂಲವಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗರ್ಭಿತತೆಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಮ್ಮ ಜವಾಬ್ದಾರಿ ಇಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->