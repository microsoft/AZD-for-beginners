# 5. टेम्पलेट को कस्टमाइज़ करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] डिफ़ॉल्ट AI एजेंट क्षमताओं का पता लगाया
    - [ ] अपने स्वयं के इंडेक्स के साथ AI सर्च जोड़ा
    - [ ] ट्रेसिंग मेट्रिक्स को सक्रिय किया और विश्लेषण किया
    - [ ] एक मूल्यांकन रन निष्पादित किया
    - [ ] रेड-टीमिंग स्कैन निष्पादित किया
    - [ ] **लैब 5: कस्टमाइज़ेशन प्लान बनाया**

---

## 5.1 AI एजेंट क्षमताएं

!!! success "हमने इसे लैब 01 में पूरा किया"

- **फाइल सर्च**: OpenAI की बिल्ट-इन फाइल सर्च ज्ञान पुनर्प्राप्ति के लिए
- **संदर्भ**: प्रतिक्रियाओं में स्वचालित स्रोत संदर्भ
- **कस्टमाइज़ेबल निर्देश**: एजेंट के व्यवहार और व्यक्तित्व को संशोधित करें
- **टूल इंटीग्रेशन**: कस्टम क्षमताओं के लिए एक्स्टेंसिबल टूल सिस्टम

---

## 5.2 ज्ञान पुनर्प्राप्ति विकल्प

!!! task "इसे पूरा करने के लिए हमें बदलाव करने और पुनः तैनात करने की आवश्यकता है"    
    
    ```bash title=""
    # पर्यावरण वेरिएबल सेट करें
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड करें और अपना इंडेक्स बनाएं

    ```

---

**OpenAI फाइल सर्च (डिफ़ॉल्ट):**

- Azure AI एजेंट सेवा में बिल्ट-इन
- स्वचालित दस्तावेज़ प्रसंस्करण और इंडेक्सिंग
- कोई अतिरिक्त कॉन्फ़िगरेशन आवश्यक नहीं

**Azure AI सर्च (वैकल्पिक):**

- हाइब्रिड सेमांटिक और वेक्टर सर्च
- कस्टम इंडेक्स प्रबंधन
- उन्नत सर्च क्षमताएं
- `USE_AZURE_AI_SEARCH_SERVICE=true` की आवश्यकता है

---

## 5.3 [ट्रेसिंग और मॉनिटरिंग](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "इसे पूरा करने के लिए हमें बदलाव करने और पुनः तैनात करने की आवश्यकता है"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry इंटीग्रेशन
- अनुरोध/प्रतिक्रिया ट्रैकिंग
- प्रदर्शन मेट्रिक्स
- AI Foundry पोर्टल में उपलब्ध

**लॉगिंग:**

- कंटेनर ऐप्स में एप्लिकेशन लॉग्स
- कोरिलेशन IDs के साथ संरचित लॉगिंग
- रीयल-टाइम और ऐतिहासिक लॉग देखने की सुविधा

---

## 5.4 [एजेंट मूल्यांकन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानीय मूल्यांकन:**

- गुणवत्ता आकलन के लिए बिल्ट-इन मूल्यांकनकर्ता
- कस्टम मूल्यांकन स्क्रिप्ट्स
- प्रदर्शन बेंचमार्किंग

**निरंतर मॉनिटरिंग:**

- लाइव इंटरैक्शन का स्वचालित मूल्यांकन
- गुणवत्ता मेट्रिक्स ट्रैकिंग
- प्रदर्शन प्रतिगमन का पता लगाना

**CI/CD इंटीग्रेशन:**

- GitHub Actions वर्कफ़्लो
- स्वचालित परीक्षण और मूल्यांकन
- सांख्यिकीय तुलना परीक्षण

---

## 5.5 [AI रेड टीमिंग एजेंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टीमिंग:**

- स्वचालित सुरक्षा स्कैनिंग
- AI सिस्टम के लिए जोखिम आकलन
- कई श्रेणियों में सुरक्षा मूल्यांकन

**प्रमाणीकरण:**

- Azure सेवाओं के लिए प्रबंधित पहचान
- वैकल्पिक Azure App Service प्रमाणीकरण
- विकास के लिए बेसिक ऑथ फॉलबैक

!!! quote "इस लैब के अंत तक आपके पास होना चाहिए"
    - [ ] अपने परिदृश्य आवश्यकताओं को परिभाषित किया
    - [ ] पर्यावरण वेरिएबल्स को कस्टमाइज़ किया (कॉन्फ़िग)
    - [ ] एजेंट निर्देशों को कस्टमाइज़ किया (टास्क)
    - [ ] कस्टमाइज़ किए गए टेम्पलेट को तैनात किया (ऐप)
    - [ ] पोस्ट-डिप्लॉयमेंट कार्य पूरे किए (मैनुअल)
    - [ ] एक परीक्षण मूल्यांकन चलाया

यह उदाहरण दिखाता है कि कैसे एक एंटरप्राइज़ रिटेल उपयोग केस के लिए टेम्पलेट को कस्टमाइज़ किया जा सकता है, जिसमें दो विशेष एजेंट और कई मॉडल तैनाती शामिल हैं।

---

## 5.6 इसे अपने लिए कस्टमाइज़ करें!

### 5.6.1. परिदृश्य आवश्यकताएं

#### **एजेंट तैनाती:** 

   - शॉपर एजेंट: ग्राहकों को उत्पाद खोजने और तुलना करने में मदद करता है
   - लॉयल्टी एजेंट: ग्राहक पुरस्कार और प्रमोशन प्रबंधित करता है

#### **मॉडल तैनाती:**

   - `gpt-4.1`: प्राथमिक चैट मॉडल
   - `o3`: जटिल प्रश्नों के लिए तर्कसंगत मॉडल
   - `gpt-4.1-nano`: सरल इंटरैक्शन के लिए हल्का मॉडल
   - `text-embedding-3-large`: सर्च के लिए उच्च गुणवत्ता वाले एम्बेडिंग

#### **विशेषताएं:**

   - ट्रेसिंग और मॉनिटरिंग सक्षम
   - उत्पाद कैटलॉग के लिए AI सर्च
   - गुणवत्ता आश्वासन के लिए मूल्यांकन फ्रेमवर्क
   - सुरक्षा मान्यता के लिए रेड टीमिंग

---

### 5.6.2 परिदृश्य कार्यान्वयन

#### 5.6.2.1. प्री-डिप्लॉयमेंट कॉन्फ़िग

एक सेटअप स्क्रिप्ट बनाएं (`setup-retail.sh`)

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

#### 5.6.2.2: एजेंट निर्देश

`custom-agents/shopper-agent-instructions.md` बनाएं:

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

`custom-agents/loyalty-agent-instructions.md` बनाएं:

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

`deploy-retail.sh` बनाएं:

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

#### 5.6.2.4: पोस्ट-डिप्लॉयमेंट कॉन्फ़िग

`configure-retail-agents.sh` बनाएं:

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

### 5.6.3: परीक्षण और मान्यता

`test-retail-deployment.sh` बनाएं:

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

इस कार्यान्वयन गाइड का पालन करने के बाद, आपके पास होगा:

1. **तैनात इंफ्रास्ट्रक्चर:**

      - मॉडल तैनाती के साथ AI Foundry प्रोजेक्ट
      - वेब एप्लिकेशन होस्ट करने वाले कंटेनर ऐप्स
      - उत्पाद कैटलॉग के लिए AI सर्च सेवा
      - मॉनिटरिंग के लिए एप्लिकेशन इनसाइट्स

2. **प्रारंभिक एजेंट:**

      - शॉपर एजेंट बुनियादी निर्देशों के साथ कॉन्फ़िगर किया गया
      - फाइल सर्च क्षमता सक्षम
      - ट्रेसिंग और मॉनिटरिंग कॉन्फ़िगर किया गया

3. **कस्टमाइज़ेशन के लिए तैयार:**

      - लॉयल्टी एजेंट जोड़ने के लिए फ्रेमवर्क
      - कस्टम निर्देश टेम्पलेट्स
      - परीक्षण और मान्यता स्क्रिप्ट्स
      - मॉनिटरिंग और मूल्यांकन सेटअप

4. **प्रोडक्शन रेडीनेस:**

      - रेड टीमिंग के साथ सुरक्षा स्कैनिंग
      - प्रदर्शन मॉनिटरिंग
      - गुणवत्ता मूल्यांकन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

यह उदाहरण दिखाता है कि AZD टेम्पलेट को कैसे विस्तारित और कस्टमाइज़ किया जा सकता है, ताकि विशिष्ट एंटरप्राइज़ परिदृश्यों के लिए सर्वोत्तम सुरक्षा, मॉनिटरिंग और स्केलेबिलिटी प्रथाओं को बनाए रखा जा सके।

---

