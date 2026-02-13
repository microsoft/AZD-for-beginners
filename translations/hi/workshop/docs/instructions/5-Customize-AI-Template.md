# 5. एक टेम्पलेट को अनुकूलित करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] डिफ़ॉल्ट AI एजेंट क्षमताओं का अन्वेषण किया
    - [ ] अपने इंडेक्स के साथ AI Search जोड़ा
    - [ ] ट्रेसिंग मीट्रिक्स को सक्रिय किया और विश्लेषण किया
    - [ ] एक मूल्यांकन रन चलाया
    - [ ] रेड-टीमिंग स्कैन चलाया
    - [ ] **Lab 5: अनुकूलन योजना बनाई** 

---

## 5.1 AI एजेंट क्षमताएँ

!!! success "हमने यह Lab 01 में पूरा कर लिया"

- **File Search**: OpenAI का अंतर्निर्मित फ़ाइल खोज ज्ञान पुनर्प्राप्ति के लिए
- **Citations**: उत्तरों में स्रोतों का स्वचालित उद्धरण
- **Customizable Instructions**: एजेंट के व्यवहार और व्यक्तित्व को संशोधित करने की क्षमता
- **Tool Integration**: कस्टम क्षमताओं के लिए विस्तार योग्य टूल सिस्टम

---

## 5.2 ज्ञान पुनर्प्राप्ति विकल्प

!!! task "इसे पूरा करने के लिए हमें बदलाव करने और पुनः तैनात करने की आवश्यकता है"    
    
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

**OpenAI फ़ाइल खोज (डिफ़ॉल्ट):**

- Foundry एजेंटों में निर्मित
- दस्तावेज़ों की स्वचालित प्रोसेसिंग और इंडेक्सिंग
- कोई अतिरिक्त कॉन्फ़िगरेशन आवश्यक नहीं

**Azure AI Search (वैकल्पिक):**

- हाइब्रिड सैमान्टिक और वेक्टर सर्च
- कस्टम इंडेक्स प्रबंधन
- उन्नत खोज क्षमताएं
- इसकी आवश्यकता है: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ट्रेसिंग और मॉनिटरिंग](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "इसे पूरा करने के लिए हमें बदलाव करने और पुनः तैनात करने की आवश्यकता है"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry एकीकरण
- अनुरोध/प्रतिक्रिया ट्रैकिंग
- प्रदर्शन मीट्रिक्स
- Microsoft Foundry पोर्टल में उपलब्ध

**लॉगिंग:**

- Container Apps में एप्लिकेशन लॉग
- कॉरिलेशन आईडी के साथ संरचित लॉगिंग
- रीयल-टाइम और ऐतिहासिक लॉग देखने की क्षमता

---

## 5.4 [एजेंट मूल्यांकन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानीय मूल्यांकन:**

- गुणवत्ता आकलन के लिए अंतर्निहित मूल्यांकन उपकरण
- कस्टम मूल्यांकन स्क्रिप्ट
- प्रदर्शन बेंचमार्किंग

**निरंतर निगरानी:**

- लाइव इंटरैक्शन के स्वचालित मूल्यांकन
- गुणवत्ता मीट्रिक्स की ट्रैकिंग
- प्रदर्शन रिग्रेशन का पता लगाना

**CI/CD एकीकरण:**

- GitHub Actions वर्कफ़्लो
- स्वचालित परीक्षण और मूल्यांकन
- सांख्यिकीय तुलना परीक्षण

---

## 5.5 [AI रेड-टीमिंग एजेंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड-टीमिंग:**

- स्वचालित सुरक्षा स्कैनिंग
- AI प्रणालियों के लिए जोखिम आकलन
- कई श्रेणियों में सुरक्षा मूल्यांकन

**प्रमाणीकरण:**

- Azure सेवाओं के लिए Managed Identity
- वैकल्पिक Azure App Service प्रमाणीकरण
- डेवलपमेंट के लिए बेसिक ऑथ विकल्प



!!! quote "इस लैब के अंत तक आपके पास होना चाहिए"
    - [ ] परिदृश्य आवश्यकताएँ परिभाषित करें
    - [ ] अनुकूलित env वेरिएबल्स (config)
    - [ ] अनुकूलित एजेंट निर्देश (task)
    - [ ] अनुकूलित टेम्पलेट तैनात किया गया (app)
    - [ ] पोस्ट-डिप्लॉयमेंट कार्य (manual) पूरा किया
    - [ ] एक परीक्षण मूल्यांकन चलाया

यह उदाहरण दो विशेष एजेंट और कई मॉडल तैनाती के साथ एक एंटरप्राइज़ रिटेल उपयोग मामले के लिए टेम्पलेट को अनुकूलित करने का प्रदर्शन करता है।

---

## 5.6 इसे अपने लिए अनुकूलित करें!

### 5.6.1. परिदृश्य आवश्यकताएँ

#### **एजेंट तैनाती:** 

   - Shopper Agent: ग्राहकों को उत्पाद खोजने और तुलना करने में मदद करता है
   - Loyalty Agent: ग्राहक पुरस्कार और प्रमोशन का प्रबंधन करता है

#### **मॉडल तैनाती:**

   - `gpt-4.1`: प्राथमिक चैट मॉडल
   - `o3`: जटिल प्रश्नों के लिए तर्क मॉडल
   - `gpt-4.1-nano`: सरल इंटरैक्शन के लिए हल्का मॉडल
   - `text-embedding-3-large`: खोज के लिए उच्च-गुणवत्ता इम्बेडिंग

#### **विशेषताएँ:**

   - ट्रेसिंग और मॉनिटरिंग सक्षम
   - उत्पाद कैटलॉग के लिए AI Search
   - गुणवत्ता आश्वासन के लिए मूल्यांकन फ़्रेमवर्क
   - सुरक्षा मान्यता के लिए रेड-टीमिंग

---

### 5.6.2 परिदृश्य कार्यान्वयन


#### 5.6.2.1. प्री-डिप्लॉयमेंट कॉन्फ़िग

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# पर्यावरण का नाम सेट करें
azd env set AZURE_ENV_NAME "retail-ai-agents"

# क्षेत्र कॉन्फ़िगर करें (मॉडल उपलब्धता के आधार पर चुनें)
azd env set AZURE_LOCATION "eastus2"

# सभी वैकल्पिक सेवाओं को सक्षम करें
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# प्राथमिक चैट मॉडल कॉन्फ़िगर करें (gpt-4o, gpt-4.1 के सबसे नज़दीकी उपलब्ध विकल्प के रूप में)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# सुधरित खोज के लिए एम्बेडिंग मॉडल कॉन्फ़िगर करें
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजेंट का नाम सेट करें (पहला एजेंट बनाया जाएगा)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# खोज सूचकांक कॉन्फ़िगर करें
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: एजेंट निर्देश

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

#### 5.6.2.3: डिप्लॉयमेंट स्क्रिप्ट

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# पूर्वापेक्षाएँ सत्यापित करें
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# पर्यावरण सेट करें
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# चयनित क्षेत्र में कोटा की जाँच करें
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

# बुनियादी ढांचा और एप्लिकेशन तैनात करें
echo "🏗️  Deploying Azure infrastructure..."
azd up

# तैनाती के आउटपुट कैप्चर करें
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# वेब ऐप का URL प्राप्त करें
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

#### 5.6.2.4: पोस्ट-डिप्लॉयमेंट कॉन्फ़िग

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# डिप्लॉयमेंट की जानकारी प्राप्त करें
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# मैनुअल कॉन्फ़िगरेशन के निर्देश
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

### 5.6.3: परीक्षण और सत्यापन

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# सुनिश्चित करें कि पर्यावरण चर सेट हैं
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# वेब अनुप्रयोग की उपलब्धता का परीक्षण करें
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

# यदि कॉन्फ़िगर किया गया है तो मूल्यांकन चलाएँ
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

### 5.6.4 अपेक्षित परिणाम

इस कार्यान्वयन मार्गदर्शिका का पालन करने के बाद, आपके पास निम्न होंगे:

1. **तैनात इन्फ्रास्ट्रक्चर:**

      - मॉडल तैनाती के साथ Microsoft Foundry प्रोजेक्ट
      - वेब एप्लिकेशन होस्ट करने वाले Container Apps
      - उत्पाद कैटलॉग के लिए AI Search सर्विस
      - मॉनिटरिंग के लिए Application Insights

2. **प्रारम्भिक एजेंट:**

      - Shopper Agent बुनियादी निर्देशों के साथ कॉन्फ़िगर किया गया
      - फ़ाइल खोज क्षमता सक्षम की गई
      - ट्रेसिंग और मॉनिटरिंग कॉन्फ़िगर की गई

3. **अनुकूलन के लिए तैयार:**

      - Loyalty Agent जोड़ने के लिए फ़्रेमवर्क
      - कस्टम निर्देश टेम्पलेट
      - परीक्षण और सत्यापन स्क्रिप्ट
      - मॉनिटरिंग और मूल्यांकन सेटअप

4. **प्रोडक्शन के लिए तैयार:**

      - रेड-टीमिंग के साथ सुरक्षा स्कैनिंग
      - प्रदर्शन निगरानी
      - गुणवत्ता मूल्यांकन फ़्रेमवर्क
      - स्केलेबल आर्किटेक्चर

यह उदाहरण दिखाता है कि AZD टेम्पलेट को सुरक्षा, मॉनिटरिंग, और स्केलेबिलिटी के सर्वोत्तम अभ्यासों को बनाए रखते हुए विशेष एंटरप्राइज़ परिदृश्यों के लिए कैसे बढ़ाया और अनुकूलित किया जा सकता है।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा (Co-op Translator: https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हम सटीकता के लिए प्रयासशील हैं, फिर भी कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में ही अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->