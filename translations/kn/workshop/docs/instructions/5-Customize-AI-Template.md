# 5. ಟೆಂಪ್ಲೇಟನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ

!!! tip "ಈ ಕಾರ್ಯಘಟಕದ ಕೊನೆಯಲ್ಲಿ ನೀವು ಸಾಮರ್ಥ್ಯವಂತಾಗುವಿರಿ"

    - [ ] ಡೀಫಾಲ್ಟ್ AI ಏಜೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿದರು
    - [ ] ನಿಮ್ಮ ಸ್ವಂತ ಸೂಚ್ಯಂಕದೊಂದಿಗೆ AI ಹುಡುಕಾಟ ಸೇರಿಸಲಾಯಿತು
    - [ ] ಟ್ರೇಸಿಂಗ್ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ವಿಶ್ಲೇಷಿಸಿದರು
    - [ ] ಒಂದು ಮೌಲ್ಯಮಾಪನ ರನ್ ನಡೆಸಲಾಯಿತು
    - [ ] ರೆಡ್-ಟೀಮಿಂಗ್ ಸ್ಕ್ಯಾನ್ ನಡೆಸಲಾಯಿತು
    - [ ] **ಲ್ಯಾಬ್ 5: ಕಸ್ಟಮೈಜೆಶನ್ ಯೋಜನೆ ನಿರ್ಮಿಸಲಾಯಿತು** 

---

## 5.1 AI ಏಜೆಂಟ್ ಸಾಮರ್ಥ್ಯಗಳು

!!! success "ಇದನ್ನು ನಾವು ಲ್ಯಾಬ್ 01 ನಲ್ಲಿ ಪೂರ್ಣಗೊಳಿಸಿದ್ದು"

- **ಫೈಲ್ ಹುಡುಕಾಟ**: ಜ್ಞಾನ ಪಾವತಿಗಾಗಿ OpenAI ನಿರ್ಮಿತ ಫೈಲ್ ಹುಡುಕಾಟ
- **ಉಲ್ಲೇಖಗಳು**: ಪ್ರತಿಕ್ರಿಯೆಗಳಲ್ಲಿ ಸ್ವಯಂಚಾಲಿತ ಮೂಲ ಉಲ್ಲೇಖ ನೀಡುವುದು
- **ಕಸ್ಟಮೈಜೆಬಲ್ ಸೂಚನೆಗಳು**: ಏಜೆಂಟ್ ನ ವರ್ತನೆಯನ್ನು ಮತ್ತು ವ್ಯಕ್ತಿತ್ವವನ್ನು ಬದಲಾಯಿಸುವುದು
- **ಟೂಲ್ ಏಕೀಕರಣ**: ಕಸ್ಟಮ್ ಸಾಮರ್ಥ್ಯಗಳಿಗಾಗಿ ವಿಸ್ತರಿಸಬಹುದಾದ ಟೂಲ್ ವ್ಯವಸ್ಥೆ

---

## 5.2 ಜ್ಞಾನ ಪಾವತಿ ಆಯ್ಕೆಗಳು

!!! task "ಇದನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ನಾವು ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮರುಪ್ರಯೋಗ ಮಾಡಬೇಕು"    
    
    ```bash title=""
    # ಪರಿಸರ ಪರಿವರ್ತಕಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ಡೇಟಾವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ ಮತ್ತು ನನ್ನ ಸೂಚ್ಯಂಕವನ್ನು ಸೃಷ್ಟಿಸಿ

    ```

---

**OpenAI ಫೈಲ್ ಹುಡುಕಾಟ (ಡೀಫಾಲ್ಟ್):**

- ಫೌಂಡ್ರಿ ಏಜೆಂಟ್‌ಗಳಿಗೆ ನಿರ್ಮಿತವಾಗಿ ಸೇರಿಸಲಾಗಿದೆ
- ಸ್ವಯಂಚಾಲಿತ ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ಸೂಚ್ಯಂಕ ನಿರ್ಮಾಣ
- ಹೆಚ್ಚುವರಿ ಸಂರಚನೆ ಅಗತ್ಯವಿಲ್ಲ

**ಆಜ್ಯೂರ್ AI ಹುಡುಕಾಟ (ಐಚ್ಛಿಕ):**

- ಸಂಕರ ಸೆಮ್ಯಾಂಟಿಕ್ ಮತ್ತು ವೆಕ್ಟರ್ ಹುಡುಕಾಟ
- ಕಸ್ಟಮ್ ಸೂಚ್ಯಂಕ ನಿರ್ವಹಣೆ
- ಪ್ರगतಿಪರ ಹುಡುಕಾಟ ಸಾಮರ್ಥ್ಯಗಳು
- ಅಗತ್ಯವಿದೆ `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮോണಿಟರಿಂಗ್](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ಇದನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ನಾವು ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮರುಪ್ರಯೋಗ ಮಾಡಬೇಕು"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ಟ್ರೇಸಿಂಗ್:**

- ಓಪನ್ ಟೆಲಿಮೆಟ್ರಿ ಏಕೀಕರಣ
- ವಿನಂತಿ/ಪ್ರತಿಕ್ರಿಯೆ ಟ್ರ್ಯಾಕಿಂಗ್
- ಕಾರ್ಯಕ್ಷಮತಾ ಮೆಟ್ರಿಕ್ಸ್
- ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಲಭ್ಯ

**ಲಾಗಿಂಗ್:**

- ಕಂಟೇನರ್ ಅಪ್ಸ್ ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲೋಗ್‌ಗಳು
- ಕೊರಿಲೇಶನ್ ಐಡಿಗಳೊಂದಿಗೆ ಸಂರಚಿತ ಲಾಗಿಂಗ್
- ನೇರ ಮತ್ತು ಐತಿಹಾಸಿಕ ಲಾಗ್ ವೀಕ್ಷಣೆ

---

## 5.4 [ಏಜೆಂಟ್ ಮೌಲ್ಯಮಾಪನ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ಸ್ಥಳೀಯ ಮೌಲ್ಯಮಾಪನ:**

- ಗುಣಮಟ್ಟ ಮೌಲ್ಯಮಾಪನಕ್ಕಾಗಿ ನಿರ್ಮಿತ ಮೌಲ್ಯಮಾಪಕರು
- ಕಸ್ಟಮ್ ಮೌಲ್ಯಮಾಪನ ಸ್ಕ್ರಿಪ್ಟ್ಗಳು
- ಕಾರ್ಯಕ್ಷಮತೆ ತುಲನಾತ್ಮಕ ಮೌಲ್ಯಮಾಪನ

**ತತ್ಕಾಲಿಕ ಮോണಿಟರಿಂಗ್:**

- ಲೈವ್ ಸಂವಹನಗಳ ಸ್ವಯಂಚಾಲಿತ ಮೌಲ್ಯಮಾಪನ
- ಗುಣಮಟ್ಟ ಮೆಟ್ರಿಕ್ಸ್ ಟ್ರ್ಯಾಕಿಂಗ್
- ಕಾರ್ಯಕ್ಷಮತೆ ಕುಸಿತ ಪತ್ತೆ

**CI/CD ಏಕೀಕರಣ:**

- GitHub ಅ್ಯಕ್ಶನ್ಸ್ ಕಾರ್ಯಪ್ರವಾಹ
- ಸ್ವಯಂ ಪರಿಷೀಲನೆ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ
- ಸಂಸ್ಥಾಶಾಸ್ತ್ರೀಯ ತುಲನಾತ್ಮಕ ಪರೀಕ್ಷೆ

---

## 5.5 [AI ರೆಡ್ ಟೀಮಿಂಗ್ ಏಜೆಂಟ್](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ರೆಡ್ ಟೀಮಿಂಗ್:**

- ಸ್ವಯಂಚಾಲಿತ ಸುರಕ್ಷತಾ ಸ್ಕ್ಯಾನಿಂಗ್
- AI ವ್ಯವಸ್ಥೆಗಳಿಗೆ ಅಪಾಯ ಮೌಲ್ಯಮಾಪನ
- ವಿವಿಧ ವರ್ಗಗಳಲ್ಲಿ ಸುರಕ್ಷತಾ ಮೌಲ್ಯಮಾಪನ

**ಪ್ರಮಾಣೀಕರಣ:**

- ಆಜ್ಯೂರ್ ಸೇವೆಗಳಿಗೆ ಮ್ಯಾನೇಜ್ಡ್ ಐಡೆಂಟಿಟಿ
- ಐಚ್ಛಿಕ ಆಜ್ಯೂರ್ ಅಪ್ಲಿಕೇಶನ್ ಸೇವೆ ಪ್ರಮಾಣೀಕರಣ
- ಅಭಿವೃದ್ಧಿಗಾಗಿ ಬೇಸಿಕ್ ಆಥ್ ಬ್ಯಾಕ್ಅಪ್

!!! quote "ಈ ಲ್ಯಾಬ್ ಕೊನೆಯಲ್ಲಿ ನೀವು ಹೊಂದಿರಬೇಕು"
    - [ ] ನಿಮ್ಮ ಸನ್ನಿವೇಶ ಅವಶ್ಯಕತೆಗಳನ್ನು ನಿರ್ಧರಿಸಿ
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ env ಪರಿವರ್ತಕಗಳು (config)
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ ಏಜೆಂಟ್ ಸೂಚನೆಗಳು (task)
    - [ ] ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ ಟೆಂಪ್ಲೇಟನ್ನು ಮರುಪ್ರಯೋಗ ಮಾಡಲಾಗಿದೆ (app)
    - [ ] ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಕಾರ್ಯಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಲಾಗಿದೆ (manual)
    - [ ] ಪರೀಕ್ಷಾ ಮೌಲ್ಯಮಾಪನವನ್ನು ನಡೆಸಲಾಗಿದೆ

ಈ ಉದಾಹರಣೆ ಎಂಟರ್ಪ್ರೈಸ್ ರಿಟೇಲ್ ಉಪಯೋಗದಟ್ಟಿಗೆ ಎರಡು ವಿಶೇಷ ಏಜೆಂಟ್‌ಗಳು ಮತ್ತು ಬಹು ಮಾದರಿ ನಿಯೋಜನೆಗಳೊಂದಿಗೆ ಟೆಂಪ್ಲೇಟನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು ತೋರಿಸುತ್ತದೆ.

---

## 5.6 ನಿಮ್ಮಿಗಾಗಿ ಅದನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ!

### 5.6.1. ಸನ್ನಿವೇಶ ಅವಶ್ಯಕತೆಗಳು

#### **ಏಜೆಂಟ್ ನಿಯೋಜನೆಗಳು:**

   - ಶಾಪರ್ ಏಜೆಂಟ್: ಗ್ರಾಹಕರಿಗೆ ಉತ್ಪನ್ನಗಳನ್ನು ಕಂಡುಹಿಡಿಯಲು ಮತ್ತು ಹೋಲಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ
   - ಲಾಯಾಲ್ಟಿ ಏಜೆಂಟ್: ಗ್ರಾಹಕರ ಬಹುಮಾನಗಳು ಮತ್ತು ಪ್ರಚಾರಗಳು ನಿರ್ವಹಣೆ ಮಾಡುತ್ತದೆ

#### **ಮಾದರಿ ನಿಯೋಜನೆಗಳು:**

   - `gpt-4.1`: ಪ್ರಾಥಮಿಕ ಚಾಟ್ ಮಾದರಿ
   - `o3`: ಸಂಕೀರ್ಣ ಪ್ರಶ್ನೆಗಳಿಗೆ ನಿರ್ಣಯಾತ್ಮಕ ಮಾದರಿ
   - `gpt-4.1-nano`: ಸರಳ ಸಂವಹನಗಳಿಗೆ ಲಘು ತೂಕದ ಮಾದರಿ
   - `text-embedding-3-large`: ಹುಡುಕಾಟಕ್ಕೆ ಉನ್ನತ ಗುಣಮಟ್ಟದ ಎಂಬಡ್ಡಿಂಗ್‌ಗಳು

#### **ಫೀಚರ್‌ಗಳು:**

   - ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ ಸಕ್ರಿಯ
   - ಉತ್ಪನ್ನ ಕ್ಯಾಟಲಾಗಿಗಾಗಿ AI ಹುಡುಕಾಟ
   - ಗುಣಮಟ್ಟ ಭರವಸೆಗಾಗಿ ಮೌಲ್ಯಮಾಪನ ಚಟುವಟಿಕೆ
   - ಸುರಕ್ಷತಾ ಪರಿಶೀಲನೆಗಾಗಿ ರೆಡ್ ಟೀಮಿಂಗ್

---

### 5.6.2 ಸನ್ನಿವೇಶ ಅನುಷ್ಠಾನ


#### 5.6.2.1. ಪೂರ್ವ-ನಿಯೋಜನೆ ಸಂರಚನೆ

ಸೆಟ್‌ಅಪ್ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ಪರಿಸರದ ಹೆಸರು ಸೆಟ್ ಮಾಡಿ
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ಪ್ರಾಂತ್ಯವನ್ನು ಸಂರಚಿಸಿ (ಮಾದರಿ ಲಭ್ಯತೆಯ ಆಧಾರದ ಮೇಲೆ ಆಯ್ಕೆಮಾಡಿ)
azd env set AZURE_LOCATION "eastus2"

# ಎಲ್ಲಾ ಐಚ್ಛಿಕ ಸೇವೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ಪ್ರಾಥಮಿಕ ಚಾಟ್ ಮಾದರಿಯನ್ನು ಸಂರಚಿಸಿ (gpt-4.1 gpt-4.1 ಗೆ ಅತ್ಯಂತ ಸಮೀಪವಿರುವ ಮಾದರಿಯಾಗಿದ್ದು)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ಶೋಧನೆಗಾಗಿ ಎಂಬೆಡ್ಡಿಂಗ್ ಮಾದರಿಯನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ಏಜೆಂಟ್ ಹೆಸರು ಸೆಟ್ ಮಾಡಿ (ಮೊದಲ ಏಜೆಂಟ್ ಅನ್ನು ರಚಿಸುತ್ತದೆ)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# ಶೋಧ ಸೂಚ್ಯಂಕವನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ಏಜೆಂಟ್ ಸೂಚನೆಗಳು

`custom-agents/shopper-agent-instructions.md` ರಚಿಸಿ:

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

`custom-agents/loyalty-agent-instructions.md` ರಚಿಸಿ:

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

`deploy-retail.sh` ರಚಿಸಿ:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# ಪೂರ್ವಶರತ್ತುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ಪರಿಸರವನ್ನು ಹೊಂದಿಸಿ
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ಆಯ್ದ ಪ್ರಾಂತದಲ್ಲಿನ ಕುಾಟವನ್ನು ಪರಿಶೀಲಿಸಿ
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

# ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅನ್ವಯವನ್ನು ನಿಯೋಜಿಸಿ
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ನಿಯೋಜನೆಯ ಔಟ್‌ಪುಟ್‌ಗಳನ್ನು ಪಕಡಿಸಿ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ವೆಬ್ ಆ್ಯಪ್ URL ಪಡೆಯಿರಿ
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

#### 5.6.2.4: ಪೋಸ್ಟ್-ನಿಯೋಜನೆ ಸಂರಚನೆ

`configure-retail-agents.sh` ರಚಿಸಿ:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ನಿಯೋಗ ಮಾಹಿತಿಯನ್ನು ಪಡೆಯಿರಿ
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# ಕೈಯಾರೆ ಸಂರಚನೆಗೆ ಸೂಚನೆಗಳು
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

`test-retail-deployment.sh` ರಚಿಸಿ:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ಪರಿಸರ ಚರಗಳು ಹೊಂದಿಸಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಲಭ್ಯತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
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

# ಸಂರಚಿಸಲಾಗಿದೆ ಎಂದಾದರೆ ಮೌಲ್ಯಮಾಪನ ನಡೆಸಿ
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

ಈ ಅನುಷ್ಠಾನ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಅನುಸರಿಸುವ ನಂತರ, ನೀವು ಹೊಂದಿರುವಿರಿ:

1. **ನಿಯೋಜಿತ ಮೂಲಸೌಕರ್ಯ:**

      - ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಯೋಜನೆ ಮತ್ತು ಮಾದರಿ ನಿಯೋಜನೆಗಳು
      - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಆಯೋಜಿಸಿದ ಕಂಟೇನರ್ ಅಪ್ಸ್
      - ಉತ್ಪನ್ನ ಕ್ಯಾಟಲಾಗಿಗಾಗಿ AI ಹುಡುಕಾಟ ಸೇವೆ
      - ಮോണಿಟರಿಂಗ್‌ಗಾಗಿ ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್

2. **ಪ್ರಾಥಮಿಕ ಏಜೆಂಟ್:**

      - ಮೂಲ ಸೂಚನೆಗಳೊಂದಿಗೆ ಶಾಪರ್ ಏಜೆಂಟ್ ವಿನ್ಯಾಸಗೊಳ್ಳಿದ್ದು
      - ಫೈಲ್ ಹುಡುಕಾಟ ಸಾಮರ್ಥ್ಯ ಸಕ್ರಿಯ
      - ಟ್ರೇಸಿಂಗ್ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ ಸಂರಚಿತ

3. **ಕಸ್ಟಮೈಜೆಶನ್‌ಗೆ ಸಿದ್ಧ:**

      - ಲಾಯಾಲ್ಟಿ ಏಜೆಂಟ್ ಸೇರ್ಪಡೆಗೊಳಿಸುವ ಚಟುವಟಿಕೆ
      - ಕಸ್ಟಮ್ ಸೂಚನಾ ಟೆಂಪ್ಲೇಟುಗಳು
      - ಪರೀಕ್ಷಾ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
      - ಮೌಲ್ಯಮಾಪನ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ವ್ಯವಸ್ಥೆ

4. **ಉತ್ಪಾದನಾ ಸಿದ್ಧತೆ:**

      - ರೆಡ್ ಟೀಮಿಂಗ್ ಜೊತೆಗೆ ಸುರಕ್ಷತಾ ಸ್ಕ್ಯಾನಿಂಗ್
      - ಕಾರ್ಯಕ್ಷಮತಾ ಮೌಲ್ಯಮಾಪನ
      - ಗುಣಮಟ್ಟ ಮೌಲ್ಯಮಾಪನ ಚಟುವಟಿಕೆ
      - ಶಾಲಾಜ್ಞೀಯ ವಾಸ್ತುಶಿಲ್ಪ

ಈ ಉದಾಹರಣೆ AZD ಟೆಂಪ್ಲೇಟನ್ನು ನಿರ್ದಿಷ್ಟ ಎಂಟರ್ಪ್ರೈಸ್ ಸನ್ನಿವೇಶಗಳಿಗೆ ವಿಸ್ತರಿಸಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದು ಮತ್ತು ಸುರಕ್ಷತೆ, ಮೌಲ್ಯಮಾಪನ ಮತ್ತು ಮಾಪಕತೆಗಾಗಿ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಕಾಯ್ದು ಕೊಳ್ಳುತ್ತದೆ ಎಂದು ತೋರಿಸುತ್ತದೆ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅನಿವಾರ್ಯ ಮಾಹಿತಿ**:  
ಈ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು AI ಭಾಷಾಂತರ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಭಾಷಾಂತರಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಭಾಷಾಂತರಗಳಲ್ಲಿ ತಪ್ಪುಗಳಿರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಶೆಯಲ್ಲಿನ ಮೂಲ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು ಪ್ರಾಧಿಕಾರಿಕ ಸ್ರೋತನಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಭಾಷಾಂತರದಿಂದ ಉಂಟಾದ ಯಾವುದೇ ತಪ್ಪು ತಿಳಿವುಗಳಿಗಾಗಿ ಅಥವಾ ಬೇರೆಯುವ ಭ್ರಮೆಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->