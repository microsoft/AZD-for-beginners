# 5. एक टेम्प्लेट को अनुकूलित करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] डिफ़ॉल्ट AI एजेंट क्षमताओं का अन्वेषण किया
    - [ ] अपनी खुद की इंडेक्स के साथ AI खोज जोड़ी
    - [ ] ट्रेसिंग मेट्रिक्स को सक्रिय और विश्लेषित किया
    - [ ] एक मूल्यांकन रन निष्पादित किया
    - [ ] एक रेड-टीमिंग स्कैन निष्पादित किया
    - [ ] **लैब 5: एक कस्टमाइजेशन योजना बनाई**

---

## 5.1 AI एजेंट क्षमताएं

!!! success "हमने इसे लैब 01 में पूर्ण किया"

- **फ़ाइल खोज**: ज्ञान पुनर्प्राप्ति के लिए OpenAI का इन-बिल्ट फ़ाइल खोज
- **संदर्भ**: प्रतिक्रियाओं में स्वचालित स्रोत उद्धरण
- **अनुकूलन योग्य निर्देश**: एजेंट व्यवहार और व्यक्तित्व को संशोधित करें
- **टूल इंटीग्रेशन**: कस्टम क्षमताओं के लिए एक्स्टेंसिबल टूल सिस्टम

---

## 5.2 ज्ञान पुनर्प्राप्ति विकल्प

!!! task "इसे पूरा करने के लिए हमें परिवर्तन करने और पुनःडिप्लॉय करने की आवश्यकता है"    
    
    ```bash title=""
    # पर्यावरण चर सेट करें
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड करें और मेरी इंडेक्स बनाएं

    ```

---

**OpenAI फ़ाइल खोज (डिफ़ॉल्ट):**

- Foundry एजेंट्स में इन-बिल्ट
- स्वचालित दस्तावेज़ प्रसंस्करण और इंडेक्सिंग
- अतिरिक्त कॉन्फ़िगरेशन की आवश्यकता नहीं

**Azure AI खोज (वैकल्पिक):**

- हाइब्रिड सेमांटिक और वेक्टर खोज
- कस्टम इंडेक्स प्रबंधन
- उन्नत खोज क्षमताएं
- `USE_AZURE_AI_SEARCH_SERVICE=true` की आवश्यकता

---

## 5.3 [ट्रेसिंग और मॉनिटरिंग](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "इसे पूरा करने के लिए हमें परिवर्तन करने और पुनःडिप्लॉय करने की आवश्यकता है"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry इंटीग्रेशन
- अनुरोध/प्रतिक्रिया ट्रैकिंग
- प्रदर्शन मेट्रिक्स
- Microsoft Foundry पोर्टल में उपलब्ध

**लॉगिंग:**

- कंटेनर ऐप्स में एप्लिकेशन लॉग्स
- सहसंबंध आईडी के साथ संरचित लॉगिंग
- रियल-टाइम और ऐतिहासिक लॉग दृश्य

---

## 5.4 [एजेंट मूल्यांकन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानीय मूल्यांकन:**

- गुणवत्ता आकलन के लिए इन-बिल्ट इवैल्युएटर्स
- कस्टम मूल्यांकन स्क्रिप्ट्स
- प्रदर्शन बेंचमार्किंग

**लगातार मॉनिटरिंग:**

- लाइव इंटरैक्शन का स्वचालित मूल्यांकन
- गुणवत्ता मेट्रिक्स ट्रैकिंग
- प्रदर्शन रिग्रेशन का पता लगाना

**CI/CD इंटीग्रेशन:**

- GitHub Actions वर्कफ़्लो
- स्वचालित परीक्षण और मूल्यांकन
- सांख्यिकीय तुलना परीक्षण

---

## 5.5 [AI रेड टीमिंग एजेंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टीमिंग:**

- स्वचालित सुरक्षा स्कैनिंग
- AI सिस्टम के लिए जोखिम मूल्यांकन
- कई श्रेणियों में सुरक्षा मूल्यांकन

**प्रमाणीकरण:**

- Azure सेवाओं के लिए Managed Identity
- वैकल्पिक Azure App Service प्रमाणीकरण
- विकास के लिए बेसिक ऑथ फॉलबैक



!!! quote "इस लैब के अंत तक आपके पास होना चाहिए"
    - [ ] अपने परिदृश्य आवश्यकताओं को परिभाषित किया
    - [ ] पर्यावरण चर अनुकूलित किए (कॉन्फ़िग)
    - [ ] एजेंट निर्देश अनुकूलित किए (टास्क)
    - [ ] अनुकूलित टेम्प्लेट को डिप्लॉय किया (ऐप)
    - [ ] पोस्ट-डिप्लॉयमेंट कार्य पूर्ण किए (मैनुअल)
    - [ ] एक परीक्षण मूल्यांकन चलाया

यह उदाहरण एक उद्यम रिटेल उपयोग मामले के लिए टेम्प्लेट को दो विशेष एजेंट्स और कई मॉडल डिप्लॉयमेंट्स के साथ अनुकूलित करना दिखाता है।

---

## 5.6 इसे आपके लिए अनुकूलित करें!

### 5.6.1. परिदृश्य आवश्यकताएँ

#### **एजेंट डिप्लॉयमेंट्स:** 

   - शॉपर एजेंट: ग्राहकों को उत्पाद खोजने और तुलना करने में मदद करता है
   - लॉयल्टी एजेंट: ग्राहक पुरस्कार और प्रचार प्रबंधित करता है

#### **मॉडल डिप्लॉयमेंट्स:**

   - `gpt-4.1`: प्राथमिक चैट मॉडल
   - `o3`: जटिल प्रश्नों के लिए तर्क मॉडल
   - `gpt-4.1-nano`: सरल इंटरैक्शन के लिए हल्का मॉडल
   - `text-embedding-3-large`: खोज के लिए उच्च गुणवत्ता वाले एम्बेडिंग्स

#### **विशेषताएं:**

   - ट्रेसिंग और मॉनिटरिंग सक्रिय
   - उत्पाद कैटलॉग के लिए AI खोज
   - गुणवत्ता आश्वासन के लिए मूल्यांकन फ्रेमवर्क
   - सुरक्षा सत्यापन के लिए रेड टीमिंग

---

### 5.6.2 परिदृश्य क्रियान्वयन


#### 5.6.2.1. पूर्व-डिप्लॉयमेंट कॉन्फ़िग

एक सेटअप स्क्रिप्ट बनाएं (`setup-retail.sh`)

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

# प्राथमिक चैट मॉडल कॉन्फ़िगर करें (gpt-4.1 सबसे निकटतम उपलब्ध के रूप में gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# उन्नत खोज के लिए एम्बेडिंग मॉडल कॉन्फ़िगर करें
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजेंट का नाम सेट करें (पहला एजेंट बनाएगा)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# खोज सूचकांक कॉन्फ़िगर करें
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: एजेंट निर्देश

`custom-agents/shopper-agent-instructions.md` बनाएँ:

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

`custom-agents/loyalty-agent-instructions.md` बनाएँ:

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

`deploy-retail.sh` बनाएँ:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# आवश्यकताओं को सत्यापित करें
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

# चुने गए क्षेत्र में कोटा जांचें
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

# अवसंरचना और आवेदन को तैनात करें
echo "🏗️  Deploying Azure infrastructure..."
azd up

# तैनाती आउटपुट कैप्चर करें
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# वेब ऐप URL प्राप्त करें
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

#### 5.6.2.4: पोस्ट-डिप्लॉयमेंट कॉन्फ़िग

`configure-retail-agents.sh` बनाएँ:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# परिनियोजन जानकारी प्राप्त करें
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# मैनुअल कॉन्फ़िगरेशन के लिए निर्देश
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

`test-retail-deployment.sh` बनाएँ:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# सुनिश्चित करें कि परिवेश चर सेट हैं
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# वेब एप्लिकेशन की उपलब्धता परीक्षण करें
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

# यदि कॉन्फ़िगर किया गया हो तो मूल्यांकन चलाएं
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

इस क्रियान्वयन गाइड का पालन करने के बाद, आपके पास निम्नलिखित होगा:

1. **डिप्लॉय की गई इन्फ्रास्ट्रक्चर:**

      - मॉडल डिप्लॉयमेंट्स के साथ Microsoft Foundry प्रोजेक्ट
      - वेब एप्लिकेशन के लिए कंटेनर ऐप्स होस्टिंग
      - उत्पाद कैटलॉग के लिए AI खोज सेवा
      - मॉनिटरिंग के लिए एप्लिकेशन इनसाइट्स

2. **प्रारंभिक एजेंट:**

      - मूल निर्देशों के साथ शॉपर एजेंट कॉन्फ़िगर किया गया
      - फ़ाइल खोज क्षमता सक्षम
      - ट्रेसिंग और मॉनिटरिंग कॉन्फ़िगर किया गया

3. **अनुकूलन के लिए तैयार:**

      - लॉयल्टी एजेंट जोड़ने के लिए फ्रेमवर्क
      - कस्टम निर्देश टेम्प्लेट्स
      - परीक्षण और सत्यापन स्क्रिप्ट्स
      - मॉनिटरिंग और मूल्यांकन सेटअप

4. **उत्पादन के लिए तत्पर:**

      - रेड टीमिंग के साथ सुरक्षा स्कैनिंग
      - प्रदर्शन मॉनिटरिंग
      - गुणवत्ता मूल्यांकन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

यह उदाहरण दिखाता है कि कैसे AZD टेम्प्लेट को विशिष्ट उद्यम परिदृश्यों के लिए विस्तार और अनुकूलित किया जा सकता है साथ ही सुरक्षा, मॉनिटरिंग और स्केलेबिलिटी के सर्वोत्तम प्रथाओं को बनाए रखते हुए।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->