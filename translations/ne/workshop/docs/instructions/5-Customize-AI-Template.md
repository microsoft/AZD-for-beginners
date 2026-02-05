# 5. टेम्प्लेट अनुकूलन गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्ममा तपाईं सक्षम हुनुहुनेछ"

    - [ ] डिफल्ट AI एजेन्ट क्षमताहरू अन्वेषण गर्नुभएको छ
    - [ ] आफ्नै इन्डेक्सको साथ AI खोज थप्नुभएको छ
    - [ ] ट्रेसिङ मेट्रिक्स सक्रिय र विश्लेषण गर्नुभएको छ
    - [ ] मूल्याङ्कन रन कार्यान्वयन गर्नुभएको छ
    - [ ] रेड-टिमिङ स्क्यान कार्यान्वयन गर्नुभएको छ
    - [ ] **प्रयोगशाला ५: अनुकूलन योजना निर्माण गर्नुभएको छ** 

---

## 5.1 AI एजेन्ट क्षमताहरू

!!! success "हामीले यो प्रयोगशाला ०१ मा पूरा गर्यौं"

- **फाइल खोज**: OpenAI को बिल्ट-इन फाइल खोज ज्ञान पुनःप्राप्तिका लागि
- **उद्धरणहरू**: प्रतिक्रियामा स्वचालित स्रोत श्रेय
- **अनुकूलन योग्य निर्देशनहरू**: एजेन्टको व्यवहार र व्यक्तित्व परिमार्जन गर्नुहोस्
- **टूल एकीकरण**: अनुकूलन क्षमताहरूका लागि विस्तार योग्य टूल प्रणाली

---

## 5.2 ज्ञान पुनःप्राप्ति विकल्पहरू

!!! task "यसलाई पूरा गर्न हामीले परिवर्तन गर्न र पुनःपरिनियोजन गर्न आवश्यक छ"    
    
    ```bash title=""
    # वातावरण चर सेट गर्नुहोस्
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड गर्नुहोस् र मेरो इन्डेक्स सिर्जना गर्नुहोस्

    ```

---

**OpenAI फाइल खोज (डिफल्ट):**

- Azure AI एजेन्ट सेवामा बिल्ट-इन
- स्वचालित दस्तावेज प्रशोधन र इन्डेक्सिङ
- कुनै अतिरिक्त कन्फिगरेसन आवश्यक छैन

**Azure AI खोज (वैकल्पिक):**

- हाइब्रिड सेम्यान्टिक र भेक्टर खोज
- अनुकूलन इन्डेक्स व्यवस्थापन
- उन्नत खोज क्षमताहरू
- `USE_AZURE_AI_SEARCH_SERVICE=true` आवश्यक छ

---

## 5.3 [ट्रेसिङ र अनुगमन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "यसलाई पूरा गर्न हामीले परिवर्तन गर्न र पुनःपरिनियोजन गर्न आवश्यक छ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिङ:**

- OpenTelemetry एकीकरण
- अनुरोध/प्रतिक्रिया ट्र्याकिङ
- प्रदर्शन मेट्रिक्स
- AI Foundry पोर्टलमा उपलब्ध

**लगिङ:**

- कन्टेनर एप्समा एप्लिकेसन लगहरू
- सम्बन्धित ID हरूसँग संरचित लगिङ
- वास्तविक समय र ऐतिहासिक लग हेर्ने सुविधा

---

## 5.4 [एजेन्ट मूल्याङ्कन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानीय मूल्याङ्कन:**

- गुणस्तर मूल्याङ्कनका लागि बिल्ट-इन मूल्याङ्कनकर्ता
- अनुकूलन मूल्याङ्कन स्क्रिप्टहरू
- प्रदर्शन बेंचमार्किङ

**निरन्तर अनुगमन:**

- प्रत्यक्ष अन्तरक्रियाको स्वचालित मूल्याङ्कन
- गुणस्तर मेट्रिक्स ट्र्याकिङ
- प्रदर्शन प्रतिगमन पत्ता लगाउने

**CI/CD एकीकरण:**

- GitHub Actions वर्कफ्लो
- स्वचालित परीक्षण र मूल्याङ्कन
- सांख्यिकीय तुलना परीक्षण

---

## 5.5 [AI रेड टिमिङ एजेन्ट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टिमिङ:**

- स्वचालित सुरक्षा स्क्यानिङ
- AI प्रणालीहरूको जोखिम मूल्याङ्कन
- विभिन्न श्रेणीहरूमा सुरक्षा मूल्याङ्कन

**प्रमाणीकरण:**

- Azure सेवाहरूका लागि प्रबन्धित पहिचान
- वैकल्पिक Azure App Service प्रमाणीकरण
- विकासका लागि आधारभूत प्रमाणीकरण विकल्प

!!! quote "यस प्रयोगशालाको अन्त्यसम्ममा तपाईंले पूरा गर्नुभएको हुनेछ"
    - [ ] आफ्नो परिदृश्य आवश्यकताहरू परिभाषित गर्नुभएको छ
    - [ ] वातावरण चरहरू अनुकूलन गर्नुभएको छ (कन्फिग)
    - [ ] एजेन्ट निर्देशनहरू अनुकूलन गर्नुभएको छ (कार्य)
    - [ ] अनुकूलित टेम्प्लेट परिनियोजन गर्नुभएको छ (एप)
    - [ ] परिनियोजनपछिका कार्यहरू पूरा गर्नुभएको छ (म्यानुअल)
    - [ ] परीक्षण मूल्याङ्कन चलाउनुभएको छ

यो उदाहरणले दुई विशेष एजेन्टहरू र बहु मोडेल परिनियोजनको साथ उद्यम खुद्रा उपयोग केसका लागि टेम्प्लेट अनुकूलन गर्ने प्रक्रिया प्रदर्शन गर्दछ।

---

## 5.6 यसलाई तपाईंको लागि अनुकूलन गर्नुहोस्!

### 5.6.1. परिदृश्य आवश्यकताहरू

#### **एजेन्ट परिनियोजनहरू:** 

   - शपिङ एजेन्ट: ग्राहकहरूलाई उत्पादनहरू फेला पार्न र तुलना गर्न मद्दत गर्दछ
   - वफादारी एजेन्ट: ग्राहक पुरस्कार र प्रचारहरू व्यवस्थापन गर्दछ

#### **मोडेल परिनियोजनहरू:**

   - `gpt-4.1`: प्राथमिक च्याट मोडेल
   - `o3`: जटिल प्रश्नहरूको लागि तर्क मोडेल
   - `gpt-4.1-nano`: साधारण अन्तरक्रियाहरूका लागि हल्का मोडेल
   - `text-embedding-3-large`: खोजका लागि उच्च-गुणस्तर इम्बेडिङ

#### **विशेषताहरू:**

   - ट्रेसिङ र अनुगमन सक्षम
   - उत्पादन क्याटलगका लागि AI खोज
   - गुणस्तर सुनिश्चितताका लागि मूल्याङ्कन फ्रेमवर्क
   - सुरक्षा मान्यताका लागि रेड टिमिङ

---

### 5.6.2 परिदृश्य कार्यान्वयन


#### 5.6.2.1. परिनियोजनपूर्व कन्फिग

सेटअप स्क्रिप्ट (`setup-retail.sh`) सिर्जना गर्नुहोस्

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

#### 5.6.2.2: एजेन्ट निर्देशनहरू

`custom-agents/shopper-agent-instructions.md` सिर्जना गर्नुहोस्:

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

`custom-agents/loyalty-agent-instructions.md` सिर्जना गर्नुहोस्:

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

#### 5.6.2.3: परिनियोजन स्क्रिप्ट

`deploy-retail.sh` सिर्जना गर्नुहोस्:

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

#### 5.6.2.4: परिनियोजनपछिको कन्फिग

`configure-retail-agents.sh` सिर्जना गर्नुहोस्:

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

### 5.6.3: परीक्षण र मान्यता

`test-retail-deployment.sh` सिर्जना गर्नुहोस्:

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

### 5.6.4 अपेक्षित परिणामहरू

यस कार्यान्वयन मार्गदर्शनलाई पालना गरेपछि, तपाईंले निम्न प्राप्त गर्नुहुनेछ:

1. **परिनियोजित पूर्वाधार:**

      - मोडेल परिनियोजनको साथ AI Foundry परियोजना
      - वेब एप्लिकेसन होस्ट गर्ने कन्टेनर एप्स
      - उत्पादन क्याटलगका लागि AI खोज सेवा
      - अनुगमनका लागि एप्लिकेसन इनसाइट्स

2. **प्रारम्भिक एजेन्ट:**

      - आधारभूत निर्देशनहरूसँग कन्फिग गरिएको शपिङ एजेन्ट
      - फाइल खोज क्षमता सक्षम
      - ट्रेसिङ र अनुगमन कन्फिग गरिएको

3. **अनुकूलनका लागि तयार:**

      - वफादारी एजेन्ट थप्न फ्रेमवर्क
      - अनुकूलन निर्देशन टेम्प्लेटहरू
      - परीक्षण र मान्यता स्क्रिप्टहरू
      - अनुगमन र मूल्याङ्कन सेटअप

4. **उत्पादन तयारी:**

      - रेड टिमिङको साथ सुरक्षा स्क्यानिङ
      - प्रदर्शन अनुगमन
      - गुणस्तर मूल्याङ्कन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

यो उदाहरणले AZD टेम्प्लेटलाई विशिष्ट उद्यम परिदृश्यहरूको लागि कसरी विस्तार र अनुकूलन गर्न सकिन्छ भन्ने प्रदर्शन गर्दछ, सुरक्षा, अनुगमन, र स्केलेबिलिटीका लागि उत्तम अभ्यासहरू कायम राख्दै।

---

