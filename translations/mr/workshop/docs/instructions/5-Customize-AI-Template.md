<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T13:41:19+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "mr"
}
-->
# 5. टेम्पलेट सानुकूलित करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही सक्षम असाल"

    - [ ] डीफॉल्ट AI Agent क्षमतांचा अभ्यास केला
    - [ ] तुमच्या स्वतःच्या इंडेक्ससह AI शोध जोडला
    - [ ] ट्रेसिंग मेट्रिक्स सक्रिय केले आणि विश्लेषण केले
    - [ ] मूल्यांकन रन कार्यान्वित केला
    - [ ] रेड-टीमिंग स्कॅन कार्यान्वित केला
    - [ ] **लॅब 5: सानुकूलन योजना तयार केली**

---

## 5.1 AI Agent क्षमतांबद्दल

!!! success "हे आम्ही लॅब 01 मध्ये पूर्ण केले"

- **फाइल शोध**: OpenAI चा अंगभूत फाइल शोध ज्ञान पुनर्प्राप्तीसाठी
- **संदर्भ**: प्रतिसादांमध्ये स्वयंचलित स्रोत श्रेय
- **सानुकूलन करण्यायोग्य सूचना**: एजंटचे वर्तन आणि व्यक्तिमत्व बदलणे
- **टूल इंटिग्रेशन**: सानुकूल क्षमतांसाठी विस्तारक्षम टूल प्रणाली

---

## 5.2 ज्ञान पुनर्प्राप्ती पर्याय

!!! task "हे पूर्ण करण्यासाठी आम्हाला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    # पर्यावरणीय व्हेरिएबल्स सेट करा
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड करा आणि माझा इंडेक्स तयार करा

    ```

---

**OpenAI फाइल शोध (डीफॉल्ट):**

- Azure AI Agent सेवेमध्ये अंगभूत
- स्वयंचलित दस्तऐवज प्रक्रिया आणि अनुक्रमणिका
- अतिरिक्त कॉन्फिगरेशन आवश्यक नाही

**Azure AI शोध (पर्यायी):**

- हायब्रिड सेमॅंटिक आणि व्हेक्टर शोध
- सानुकूल इंडेक्स व्यवस्थापन
- प्रगत शोध क्षमता
- `USE_AZURE_AI_SEARCH_SERVICE=true` आवश्यक

---

## 5.3 [ट्रेसिंग आणि मॉनिटरिंग](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "हे पूर्ण करण्यासाठी आम्हाला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry एकत्रीकरण
- विनंती/प्रतिसाद ट्रॅकिंग
- कार्यक्षमता मेट्रिक्स
- AI Foundry पोर्टलमध्ये उपलब्ध

**लॉगिंग:**

- कंटेनर अॅप्समधील अनुप्रयोग लॉग्स
- संबंध आयडीसह संरचित लॉगिंग
- रिअल-टाइम आणि ऐतिहासिक लॉग पाहणे

---

## 5.4 [एजंट मूल्यांकन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानिक मूल्यांकन:**

- गुणवत्ता मूल्यांकनासाठी अंगभूत मूल्यांकनकर्ता
- सानुकूल मूल्यांकन स्क्रिप्ट्स
- कार्यक्षमता बेंचमार्किंग

**सतत मॉनिटरिंग:**

- थेट संवादांचे स्वयंचलित मूल्यांकन
- गुणवत्ता मेट्रिक्स ट्रॅकिंग
- कार्यक्षमता अधोगती शोधणे

**CI/CD एकत्रीकरण:**

- GitHub Actions वर्कफ्लो
- स्वयंचलित चाचणी आणि मूल्यांकन
- सांख्यिकीय तुलना चाचणी

---

## 5.5 [AI रेड टीमिंग एजंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टीमिंग:**

- स्वयंचलित सुरक्षा स्कॅनिंग
- AI प्रणालींसाठी जोखीम मूल्यांकन
- अनेक श्रेणींमध्ये सुरक्षा मूल्यांकन

**प्रमाणीकरण:**

- Azure सेवांसाठी व्यवस्थापित ओळख
- पर्यायी Azure App Service प्रमाणीकरण
- विकासासाठी बेसिक ऑथ फॉलबॅक

!!! quote "या लॅबच्या शेवटी तुम्ही पूर्ण केले पाहिजे"
    - [ ] तुमच्या परिस्थितीच्या गरजा परिभाषित केल्या
    - [ ] पर्यावरणीय व्हेरिएबल्स सानुकूलित केले (कॉन्फिग)
    - [ ] एजंट सूचना सानुकूलित केल्या (कार्य)
    - [ ] सानुकूलित टेम्पलेट तैनात केले (अॅप)
    - [ ] तैनातीनंतरचे कार्य पूर्ण केले (मॅन्युअल)
    - [ ] चाचणी मूल्यांकन चालवले

हे उदाहरण दोन विशेष एजंट्स आणि अनेक मॉडेल तैनातींसह एंटरप्राइझ रिटेल वापर प्रकरणासाठी टेम्पलेट सानुकूलित करण्याचे प्रदर्शन करते.

---

## 5.6 तुमच्यासाठी सानुकूलित करा!

### 5.6.1. परिस्थितीच्या गरजा

#### **एजंट तैनाती:** 

   - Shopper Agent: ग्राहकांना उत्पादने शोधण्यात आणि तुलना करण्यात मदत करते
   - Loyalty Agent: ग्राहकांचे बक्षिसे आणि प्रमोशन व्यवस्थापित करते

#### **मॉडेल तैनाती:**

   - `gpt-4.1`: प्राथमिक चॅट मॉडेल
   - `o3`: जटिल प्रश्नांसाठी विचार मॉडेल
   - `gpt-4.1-nano`: सोप्या संवादांसाठी हलके मॉडेल
   - `text-embedding-3-large`: शोधासाठी उच्च-गुणवत्तेची एम्बेडिंग्ज

#### **वैशिष्ट्ये:**

   - ट्रेसिंग आणि मॉनिटरिंग सक्षम
   - उत्पादन कॅटलॉगसाठी AI शोध
   - गुणवत्ता आश्वासनासाठी मूल्यांकन फ्रेमवर्क
   - सुरक्षा पडताळणीसाठी रेड टीमिंग

---

### 5.6.2 परिस्थिती अंमलबजावणी


#### 5.6.2.1. तैनातीपूर्व कॉन्फिगरेशन

`setup-retail.sh` सेटअप स्क्रिप्ट तयार करा

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

#### 5.6.2.2: एजंट सूचना

`custom-agents/shopper-agent-instructions.md` तयार करा:

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

`custom-agents/loyalty-agent-instructions.md` तयार करा:

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

#### 5.6.2.3: तैनाती स्क्रिप्ट

`deploy-retail.sh` तयार करा:

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

#### 5.6.2.4: तैनातीनंतरचे कॉन्फिगरेशन

`configure-retail-agents.sh` तयार करा:

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

### 5.6.3: चाचणी आणि पडताळणी

`test-retail-deployment.sh` तयार करा:

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

### 5.6.4 अपेक्षित परिणाम

या अंमलबजावणी मार्गदर्शकाचे अनुसरण केल्यानंतर, तुम्ही खालील गोष्टी साध्य कराल:

1. **तैनात पायाभूत सुविधा:**

      - मॉडेल तैनातींसह AI Foundry प्रकल्प
      - वेब अनुप्रयोग होस्ट करणारे कंटेनर अॅप्स
      - उत्पादन कॅटलॉगसाठी AI शोध सेवा
      - मॉनिटरिंगसाठी Application Insights

2. **प्रारंभिक एजंट:**

      - Shopper Agent मूलभूत सूचनांसह कॉन्फिगर केलेला
      - फाइल शोध क्षमता सक्षम
      - ट्रेसिंग आणि मॉनिटरिंग कॉन्फिगर केलेले

3. **सानुकूलनासाठी तयार:**

      - Loyalty Agent जोडण्यासाठी फ्रेमवर्क
      - सानुकूल सूचना टेम्पलेट्स
      - चाचणी आणि पडताळणी स्क्रिप्ट्स
      - मॉनिटरिंग आणि मूल्यांकन सेटअप

4. **उत्पादनासाठी तयारी:**

      - रेड टीमिंगसह सुरक्षा स्कॅनिंग
      - कार्यक्षमता मॉनिटरिंग
      - गुणवत्ता मूल्यांकन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

हे उदाहरण दाखवते की AZD टेम्पलेट विशिष्ट एंटरप्राइझ परिस्थितींसाठी कसे विस्तारित आणि सानुकूलित केले जाऊ शकते, सुरक्षा, मॉनिटरिंग आणि स्केलेबिलिटीसाठी सर्वोत्तम पद्धती राखून.

---

