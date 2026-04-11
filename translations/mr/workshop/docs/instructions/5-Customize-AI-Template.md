# 5. टेम्पलेट सानुकूलित करा

!!! tip "या मॉड्यूलच्या शेवटी आपण हे करू शकाल"

    - [ ] डीफॉल्ट एआय एजंट क्षमता तपासल्या
    - [ ] आपला स्वत:चा इंडेक्स वापरून एआय शोध जोडला
    - [ ] ट्रेसिंग मेट्रिक्स सक्रिय आणि विश्लेषित केले
    - [ ] मूल्यमापन रन चालवला
    - [ ] रेड-टीमिंग स्कॅन चालवला
    - [ ] **लॅब 5: सानुकूलन योजना तयार केली** 

---

## 5.1 एआय एजंट क्षमता

!!! success "हे आम्ही लॅब 01 मध्ये पूर्ण केले"

- **File Search**: ज्ञान पुनर्प्राप्तीसाठी OpenAI ची अंगभूत फाइल शोध
- **Citations**: प्रतिसादांमध्ये स्वयंचलित स्रोत श्रेय
- **Customizable Instructions**: एजंटचे वर्तन आणि व्यक्तिमत्व बदलणे
- **Tool Integration**: सानुकूल क्षमतांसाठी विस्तारयोग्य टूल सिस्टम

---

## 5.2 ज्ञान पुनर्प्राप्ती पर्याय

!!! task "हे पूर्ण करण्यासाठी आपल्याला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
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

- Foundry Agents मध्ये अंगभूत
- दस्तऐवजांची स्वयंचलित प्रक्रिया आणि इंडेक्सिंग
- अतिरिक्त कॉन्फिगरेशन आवश्यक नाही

**Azure AI Search (Optional):**

- हायब्रिड सिमांटिक आणि व्हेक्टर शोध
- सानुकूल इंडेक्स व्यवस्थापन
- उन्नत शोध क्षमता
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ट्रेसिंग आणि मॉनिटरिंग](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "हे पूर्ण करण्यासाठी आपल्याला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry समाकलन
- विनंती/प्रतिक्रिया ट्रॅकिंग
- प्रदर्शन मेट्रिक्स
- Microsoft Foundry पोर्टलमध्ये उपलब्ध

**लॉगिंग:**

- Container Apps मध्ये अनुप्रयोग लॉग्स
- कोरिलेशन आयडीसह संरचित लॉगिंग
- रिअल-टाइम आणि ऐतिहासिक लॉग पाहणे

---

## 5.4 [एजंट मूल्यमापन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानिक मूल्यमापन:**

- गुणवत्ता मूल्यांकनासाठी अंगभूत इव्हॅल्युएटर्स
- सानुकूल मूल्यांकन स्क्रिप्ट्स
- कार्यक्षमता बेंचमार्किंग

**सतत मॉनिटरिंग:**

- थेट परस्परसंवादांचे स्वयंचलित मूल्यांकन
- गुणवत्ता मेट्रिक्सचे ट्रॅकिंग
- कार्यक्षमता रेग्रेशन शोध

**CI/CD एकत्रीकरण:**

- GitHub Actions वर्कफ्लो
- स्वयंचलित चाचणी आणि मूल्यांकन
- सांख्यिकी तुलना चाचणी

---

## 5.5 [एआय रेड टीमिंग एजंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**एआय रेड टीमिंग:**

- स्वयंचलित सुरक्षा स्कॅनिंग
- एआय सिस्टमसाठी जोखीम मूल्यांकन
- अनेक श्रेणींमध्ये सुरक्षा मूल्यांकन

**प्रमाणीकरण:**

- Azure सेवांसाठी Managed Identity
- ऐच्छिक Azure App Service प्रमाणीकरण
- विकासासाठी बेसिक ऑथ फॉलबॅक



!!! quote "या लॅबच्या शेवटी आपल्याकडे हे असले पाहिजे"
    - [ ] आपल्या परिदृश्याच्या आवश्यकता निश्चित करा
    - [ ] सानुकूलित env व्हेरिएबल्स (config)
    - [ ] सानुकूलित एजंट सूचनाएँ (task)
    - [ ] सानुकूल टेम्पलेट तैनात केले (app)
    - [ ] पोस्ट-डिप्लॉयमेंट टास्क पूर्ण केले (manual)
    - [ ] एक चाचणी मूल्यांकन चालवा

हे उदाहरण दोन विशेष एजंट आणि अनेक मॉडेल तैनातींसह एंटरप्राइझ रिटेल वापराच्या प्रकरणासाठी टेम्पलेट कसे सानुकूल करायचे हे दर्शवते.

---

## 5.6 हे आपल्यासाठी सानुकूलित करा!

### 5.6.1. परिदृश्य आवश्यकता

#### **एजंट तैनाती:** 

   - Shopper Agent: ग्राहकांना उत्पादने शोधण्यात आणि तुलना करण्यात मदत करतो
   - Loyalty Agent: ग्राहकांचे बक्षिसे आणि प्रचार व्यवस्थापित करतो

#### **मॉडेल तैनाती:**

   - `gpt-4.1`: प्राथमिक चॅट मॉडेल
   - `o3`: क्लिष्ट विचारांसाठी तर्क मॉडेल
   - `gpt-4.1-nano`: साध्या संवादांसाठी लाइटवेट मॉडेल
   - `text-embedding-3-large`: शोधासाठी उच्च-गुणवत्तेची एम्बेडिंग

#### **वैशिष्ट्ये:**

   - ट्रेसिंग आणि मॉनिटरिंग सक्षम केलेले
   - उत्पादन कॅटलॉगसाठी एआय शोध
   - गुणवत्ता हमीसाठी मूल्यमापन फ्रेमवर्क
   - सुरक्षा पडताळणीसाठी रेड-टीमिंग

---

### 5.6.2 परिदृश्य अंमलबजावणी


#### 5.6.2.1. पूर्व-तैनाती कॉन्फिग

एक सेटअप स्क्रिप्ट तयार करा (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# पर्यावरणाचे नाव सेट करा
azd env set AZURE_ENV_NAME "retail-ai-agents"

# क्षेत्र कॉन्फिगर करा (मॉडेल उपलब्धतेनुसार निवडा)
azd env set AZURE_LOCATION "eastus2"

# सर्व ऐच्छिक सेवा सक्षम करा
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# प्राथमिक चॅट मॉडेल कॉन्फिगर करा (gpt-4.1 — gpt-4.1 शी सर्वात जवळचे उपलब्ध मॉडेल)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# उन्नत शोधासाठी एम्बेडिंग मॉडेल कॉन्फिगर करा
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजंटचे नाव सेट करा (पहिला एजंट तयार होईल)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# शोध निर्देशांक कॉन्फिगर करा
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

# पूर्व-आवश्यकता सत्यापित करा
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# पर्यावरण सेट करा
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# निवडलेल्या प्रदेशातील कोटा तपासा
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

# पायाभूत संरचना आणि अनुप्रयोग तैनात करा
echo "🏗️  Deploying Azure infrastructure..."
azd up

# तैनातीचे आउटपुट जतन करा
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# वेब अ‍ॅपचा URL मिळवा
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

#### 5.6.2.4: पोस्ट-तैनाती कॉन्फिग

`configure-retail-agents.sh` तयार करा:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# डिप्लॉयमेंटची माहिती मिळवा
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# मॅन्युअल कॉन्फिगरेशनसाठी सूचना
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

### 5.6.3: चाचणी आणि पडताळणी

`test-retail-deployment.sh` तयार करा:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# पर्यावरण चल सेट आहेत का याची पडताळणी करा
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# वेब अनुप्रयोगाची उपलब्धता तपासा
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

# कॉन्फिगर केले असल्यास मूल्यांकन चालवा
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

या अंमलबजावणी मार्गदर्शकाचे पालन केल्यानंतर, आपल्याकडे हे असतील:

1. **तैनात इन्फ्रास्ट्रक्चर:**

      - मॉडेल तैनातींसह Microsoft Foundry प्रकल्प
      - वेब अनुप्रयोग होस्ट करणारे Container Apps
      - उत्पादन कॅटलॉगसाठी AI Search सेवा
      - मॉनिटरिंगसाठी Application Insights

2. **प्रारंभिक एजंट:**

      - Shopper Agent मूलभूत सूचनांसह कॉन्फिगर केलेला
      - फाईल शोध क्षमता सक्षम केलेली
      - ट्रेसिंग आणि मॉनिटरिंग कॉन्फिगर केलेले

3. **सानुकूलनासाठी तयार:**

      - Loyalty Agent जोडण्यासाठी फ्रेमवर्क
      - सानुकूल सूचना टेम्पलेट्स
      - चाचणी आणि पडताळणी स्क्रिप्ट्स
      - मॉनिटरिंग आणि मूल्यांकन सेटअप

4. **उत्पादनासाठी तयार:**

      - रेड-टीमिंगसह सुरक्षा स्कॅनिंग
      - प्रदर्शन मॉनिटरिंग
      - गुणवत्ता मूल्यांकन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

हे उदाहरण दर्शवते की AZD टेम्पलेट कसे विशिष्ट एंटरप्राइझ परिदृश्यांसाठी विस्तारित आणि सानुकूलित केले जाऊ शकते, आणि त्याचवेळी सुरक्षा, मॉनिटरिंग आणि स्केलेबिलिटीसाठी उत्तम पद्धती कायम ठेवता येतात.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेतील त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानले पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलावणीनिमित्त आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->