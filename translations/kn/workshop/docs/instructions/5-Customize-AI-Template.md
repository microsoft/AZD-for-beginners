# 5. ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು

!!! tip "ಈ ಅಧ್ಯಾಯದ ಕೊನೆಯಲ್ಲಿ ನೀವು ಈ ಕಾರ್ಯಗಳನ್ನು ಮಾಡಲು ಸಾಮರ್ಥ್ಯ ಹೊಂದಿರುತ್ತೀರಿ"

    - [ ] ಡೀಫಾಲ್ಟ್ AI ಏಜೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಅನ್ವೇಷಿಸಲಾಗಿದೆ
    - [ ] ನಿಮ್ಮ ಸ್ವಂತ ಸೂಚ್ಯಂಕದೊಂದಿಗೆ AI ಹುಡುಕಾಟವನ್ನು ಸೇರಿಸಲಾಗಿದೆ
    - [ ] ಟ್ರೇಸಿಂಗ್ ಮೆಟ್ರಿಕ್ಸ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ವಿಶ್ಲೇಷಿಸಲಾಗಿದೆ
    - [ ] ಮೌಲ್ಯಮಾಪನ ಚಾಲನೆ ನಡೆಸಲಾಗಿದೆ
    - [ ] ರೆಡ್‑ಟೀಮಿಂಗ್ ಸ್ಕ್ಯಾನ್ ನಡೆಸಲಾಗಿದೆ
    - [ ] **Lab 5: ಕಸ್ಟಮೈಜೆಶನ್ ಯೋಜನೆಯನ್ನು ರಚಿಸಲಾಗಿದೆ** 

---

## 5.1 AI ಏಜೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳು

!!! success "ನಾವು ಇದನ್ನು Lab 01ರಲ್ಲಿ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ"

- **File Search**: ಜ್ಞಾನ ಹಿಂಪಡೆಯಲು OpenAI ನೊಳಗಿನ ಫೈಲ್ ಹುಡುಕಾಟ
- **Citations**: ಪ್ರತ್ಯುತ್ತರಗಳಲ್ಲಿ స్వಯಂಚಾಲಿತ ಮೂಲ ಉಲ್ಲೇಖನ
- **Customizable Instructions**: ಏಜೆಂಟ್ ವರ್ತನೆ ಮತ್ತು ವ್ಯಕ್ತಿತ್ವವನ್ನು ತಿದ್ದುಪಡಿ ಮಾಡಬಹುದು
- **Tool Integration**: ಕಸ್ಟಮ್ ಸಾಮರ್ಥ್ಯಗಳಿಗಾಗಿ ವಿಸ್ತರಿಸಲಾಗಬಹುದಾದ ಟೂಲ್ ಸಿಸ್ಟಮ್

---

## 5.2 ಜ್ಞಾನ ಹಿಂಪಡೆಯುವ ಆಯ್ಕೆಗಳು

!!! task "ಇದನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ನಮಗೆ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಪುನಃ ಜಾರಿಗೆ ತರಬೇಕಾಗಿದೆ"    
    
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

**OpenAI ಫೈಲ್ ಹುಡುಕಾಟ (ಡೀಫಾಲ್ಟ್):**

- Foundry ಏಜೆಂಟ್‌ಗಳಿಗೆ ಒಳಗೇರಿಸಲಾಗಿದೆ
- ದಾಖಲೆಗಳ ಸ್ವಯಂಚಾಲಿತ ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ಸೂಚ್ಯಂಕೀಕರಣ
- ಯಾವುದೇ ಹೆಚ್ಚುವರಿ ಕಾನ್ಫಿಗರೇಶನ್ ಅಗತ್ಯವಿಲ್ಲ

**Azure AI Search (ಐಚ್ಛಿಕ):**

- ಹೈಬ್ರಿಡ್ ಸೈಮ್ಯಾಂಟಿಕ್ ಮತ್ತು ವೆಕ್ಟರ್ ಹುಡುಕಾಟ
- ಕಸ್ಟಮ್ ಸೂಚ್ಯಂಕ ನಿರ್ವಹಣೆ
- ಅತ್ಯಾಧುನಿಕ ಹುಡುಕಾಟ ಸಾಮರ್ಥ್ಯಗಳು
- ಅಗತ್ಯವಿದೆ `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ಇದನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ನಮಗೆ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಪುನಃ ಜಾರಿಗೆ ತರಬೇಕಾಗಿದೆ"    
    
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

- Container Apps ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್ಗಳು
- ಸಂಬಂಧಿತ IDs ಬಳಸಿ ರಚಿತ ಲಾಗಿಂಗ್
- ರಿಯಲ್‑ಟೈಮ್ ಮತ್ತು ಐತಿಹಾಸಿಕ ಲಾಗ್ ವೀಕ್ಷಣೆ

---

## 5.4 [ಏಜೆಂಟ್ ಮೌಲ್ಯಮಾಪನ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ಸ್ಥಳೀಯ ಮೌಲ್ಯಮಾಪನ:**

- ಗುಣಮಟ್ಟ ಮೌಲ್ಯಮಾಪನಕ್ಕಾಗಿ ಒಳಗಿನ ಮೌಲ್ಯಮಾಪಕರ
- ಕಸ್ಟಮ್ ಮೌಲ್ಯಮಾಪನ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ಕಾರ್ಯಕ್ಷಮತಾ ಬೆಂಚ್ಮಾರ್ಕಿಂಗ್

**ನಿರಂತರ ಮಾನಿಟರಿಂಗ್:**

- ಲೈವ್ ಸಂವಹನಗಳ ಸ್ವಯಂಚಾಲಿತ ಮೌಲ್ಯಮಾಪನ
- ಗುಣಮಟ್ಟ ಮೆಟ್ರಿಕ್ ಟ್ರ್ಯಾಕಿಂಗ್
- ಕಾರ್ಯಕ್ಷಮತೆ ಹಿನ್ನಡೆ ಪತ್ತೆ

**CI/CD ಏಕೀಕರಣ:**

- GitHub Actions ವರ್ಕ್ಫ್ಲೋ
- ಸ್ವಯಂಚಾಲಿತ ಟೆಸ್ಟಿಂಗ್ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ
- ಸಾಂಖ್ಯಿಕ ಹೋಲಿಕೆ ಪರೀಕ್ಷೆ

---

## 5.5 [AI ರೆಡ್‑ಟೀಮಿಂಗ್ ಏಜೆಂಟ್](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ರೆಡ್‑ಟೀಮಿಂಗ್:**

- ಸ್ವಯಂಚಾಲಿತ ಭದ್ರತಾ ಸ್ಕ್ಯಾನೇರ್
- AI ವ್ಯವಸ್ಥೆಗಳಿಗಾಗಿ ಅಪಾಯ ಮೌಲ್ಯಮಾಪನ
- ಬಹುಪಾಲು ವರ್ಗಗಳಲ್ಲಿ ಸುರಕ್ಷತಾ ಮೌಲ್ಯಮಾಪನ

**ಪ್ರಮಾಣೀಕರಣ:**

- Azure ಸೇವೆಗಳಿಗೆ Managed Identity
- ಐಚ್ಛಿಕ Azure App Service ಪ್ರಮಾಣೀಕರಣ
- ಅಭಿವೃದ್ಧಿಗಾಗಿ ಮೂಲ auth ಬ್ಯಾಕ್ಫಾಲ್



!!! quote "ಈ ಲ್ಯಾಬ್‌ನ ಅಂತ್ಯಕ್ಕೆ ನಿಮ್ಮ ಬಳಿ ಇರಬೇಕು"
    - [ ] ನಿಮ್ಮ ಸನ್ನಿವೇಶದ ಅಗತ್ಯಗಳನ್ನು ನಿರ್ಧರಿಸಿ
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ env ಚರಗಳು (config)
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ ಏಜೆಂಟ್ ಸೂಚನೆಗಳು (task)
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಲಾದ ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ನಿಯೋಜಿಸಲಾಗುವುದು (app)
    - [ ] ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ನಂತರದ ಕಾರ್ಯಗಳನ್ನು ಮುಗಿಸಿ (manual)
    - [ ] ಪರೀಕ್ಷಾ ಮೌಲ್ಯಮಾಪನ ನಡೆಸಿ

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 ನಿಮ್ಮಿಗಾಗಿ ಅದನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ!

### 5.6.1. ಸನ್ನಿವೇಶದ ಅಗತ್ಯಗಳು

#### **ಏಜೆಂಟ್ ನಿಯೋಜನೆಗಳು:** 

   - Shopper Agent: ಗ್ರಾಹಕರಿಗೆ ಉತ್ಪನ್ನಗಳನ್ನು ಹುಡುಕಲು ಮತ್ತು ಹೋಲಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ
   - Loyalty Agent: ಗ್ರಾಹಕರ ರಿವಾರ್ಡ್‌ಗಳು ಮತ್ತು ಪ್ರಚಾರಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ

#### **ಮಾದರಿ ನಿಯೋಜನೆಗಳು:**

   - `gpt-4.1`: ಪ್ರಾಥಮಿಕ ಚಾಟ್ ಮಾದರಿ
   - `o3`: ಜಟಿಲ ವಿನಂತಿಗಳಿಗೆ ತರ್ಕ ಮಾದರಿ
   - `gpt-4.1-nano`: ಸರಳ ಸಂವಹನಗಳಿಗೆ ಲಘು-ತೂಕ ಮಾದರಿ
   - `text-embedding-3-large`: ಹುಡುಕಾಟಕ್ಕಾಗಿ ಉನ್ನತ-ನಾಣ್ಯತೆಯ ಎಂಬೆಡಿಂಗ್ಸ್

#### **ವೈಶಿಷ್ಟ್ಯಗಳು:**

   - ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
   - ಉತ್ಪನ್ನ ಕಾಟಾಲಾಗ್‌ಗೆ AI ಹುಡುಕಾಟ
   - ಗುಣಮಟ್ಟ ಭರವಸೆಗಾಗಿ ಮೌಲ್ಯಮಾಪನ ಫ್ರೇಮ್‌ವರ್ಕ್
   - ಭದ್ರತಾ ಮಾನ್ಯತೆಗಾಗಿ ರೆಡ್‑ಟೀಮಿಂಗ್

---

### 5.6.2 ಸನ್ನಿವೇಶ ಜಾರಿಗೆ


#### 5.6.2.1. ಪೂರ್ವ-ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾನ್ಫಿಗ್

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ಪರಿಸರದ ಹೆಸರನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ಪ್ರದೇಶವನ್ನು ಸಂರಚಿಸಿ (ಮಾದರಿ ಲಭ್ಯತೆಯ ಆಧಾರದ ಮೇಲೆ ಆಯ್ಕೆಮಾಡಿ)
azd env set AZURE_LOCATION "eastus2"

# ಎಲ್ಲಾ ಐಚ್ಛಿಕ ಸೇವೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ಪ್ರಾಥಮಿಕ ಚಾಟ್ ಮಾದರಿಯನ್ನು ಸಂರಚಿಸಿ (gpt-4.1 ಗೆ ಅತ್ಯಂತ ಸಮೀಪವಿರುವ ಮತ್ತು ಲಭ್ಯವಿರುವ ಮಾದರಿ: gpt-4o)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ಸುಧಾರಿತ ಹುಡುಕಾಟಕ್ಕಾಗಿ ಎಂಬೆಡಿಂಗ್ ಮಾದರಿಯನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ಏಜೆಂಟ್ ಹೆಸರನ್ನು ಹೊಂದಿಸಿ (ಮೊದಲ ಏಜೆಂಟ್ ಸೃಷ್ಟಿಯಾಗುತ್ತದೆ)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ಹುಡುಕಾಟ ಸೂಚ್ಯಂಕವನ್ನು ಸಂರಚಿಸಿ
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

# ಮುಂಚಿತ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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

# ಆಯ್ಕೆಮಾಡಿದ ಪ್ರದೇಶದಲ್ಲಿ ಕ್ವೋಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ
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

# ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಔಟ್‌ಪುಟ್‌ಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ನ URL ಅನ್ನು ಪಡೆಯಿರಿ
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

#### 5.6.2.4: ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾನ್ಫಿಗ್

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಮಾಹಿತಿಯನ್ನು ಪಡೆಯಿರಿ
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

# ಪರಿಸರ ಚರಗಳು ನಿಗದಿಯಾಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
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

# ಸಂರಚಿಸಲಾದರೆ ಮೌಲ್ಯಮಾಪನವನ್ನು ಚಲಾಯಿಸಿ
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

1. **ನಿಯೋಜಿಸಲ್ಪಟ್ಟ ಮೂಲಸೌಕರ್ಯ:**

      - Microsoft Foundry ಯೋಜನೆ ಮಾದರಿ ನಿಯೋಜನೆಗಳೊಂದಿಗೆ
      - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡುವ Container Apps
      - ಉತ್ಪನ್ನ ಕಾಟಾಲಾಗ್‌ಗೆ AI Search ಸೇವೆ
      - ಮಾನಿಟರಿಂಗ್‌ಗೆ Application Insights

2. **ಪ್ರಾಥಮಿಕ ಏಜೆಂಟ್:**

      - Shopper Agent ಮೂಲಭೂತ ಸೂಚನೆಗಳೊಂದಿಗೆ ಸಂರಚಿಸಲಾಗಿದೆ
      - ಫೈಲ್ ಹುಡುಕಾಟ ಸಾಮರ್ಥ್ಯ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
      - ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಸಂರಚಿಸಲಾಗಿದೆ

3. **ಕಸ್ಟಮೈಜೆಷನ್‌ಗೆ ಸಿದ್ಧವಾಗಿದೆ:**

      - Loyalty Agent ಸೇರಿಸುವುದಕ್ಕಾಗಿ ಫ್ರೇಮ್‌ವರ್ಕ್
      - ಕಸ್ಟಮ್ ಸೂಚನಾ ಟೆಂಪ್ಲೇಟ್ಗಳು
      - ಪರೀಕ್ಷೆ ಮತ್ತು ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
      - ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ ವ್ಯವಸ್ಥೆ

4. **ಉತ್ಪಾದನೆ ಸಿದ್ಧತೆ:**

      - ರೆಡ್‑ಟೀಮಿಂಗ್ ಮೂಲಕ ಭದ್ರತಾ ಸ್ಕ್ಯಾನಿಂಗ್
      - ಕಾರ್ಯಕ್ಷಮತೆಯ ಮಾನಿಟರಿಂಗ್
      - ಗುಣಮಟ್ಟ ಮೌಲ್ಯಮಾಪನ ಫ್ರೇಮ್‌ವರ್ಕ್
      - ವಿಸ್ತಾರಗೊಳ್ಳಬಹುದಾದ ಸಂರಚನೆ

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:

ಈ ದಸ್ತಾವೇಜನ್ನು AI ಭಾಷಾಂತರ ಸೇವೆ Co-op Translator (https://github.com/Azure/co-op-translator) ಬಳಸಿ ಭಾಷಾಂತರಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಭಾಷಾಂತರಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಶುದ್ಧತೆಗಳಿರುವ ಸಾಧ್ಯತೆ ಇದೆ ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರವಾದ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಭಾಷಾಂತರದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜಸತೆಗಳು ಅಥವಾ ತಪ್ಪಾಗಿ ವ್ಯಾಖ್ಯಾನವಾಗುವ ಪರಿಣಾಮಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->