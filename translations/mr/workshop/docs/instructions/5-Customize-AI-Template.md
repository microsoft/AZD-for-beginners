# 5. टेम्पलेट सानुकूल करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्हाला हे करता येईल"

    - [ ] डिफॉल्ट AI एजंट क्षमता तपासल्या
    - [ ] तुमच्या स्वतःच्या इंडेक्ससह AI सर्च जोडले
    - [ ] ट्रेसिंग मेट्रिक्स सक्रिय आणि विश्लेषण केले
    - [ ] एक मूल्यमापन रन कार्यान्वित केले
    - [ ] रेड-टीमिंग स्कॅन कार्यान्वित केले
    - [ ] **लॅब 5: एक सानुकूलन योजना तयार केली**

---

## 5.1 AI एजंट क्षमता

!!! success "हे आपल्या लॅब 01 मध्ये पूर्ण केले"

- **फाइल सर्च**: नॉलेज रिट्रीवलसाठी OpenAI चे अंगभूत फाइल सर्च
- **साइटेशन्स**: प्रतिसादांमध्ये स्वयंचलित स्त्रोत अधिकृतता
- **सानुकूलित सूचना**: एजंटचे वर्तन आणि व्यक्तिमत्त्व बदलणे
- **टूल इंटीग्रेशन**: सानुकूल क्षमतांसाठी विस्तारशील टूल सिस्टम

---

## 5.2 ज्ञान पुनर्प्राप्ती पर्याय

!!! task "हे पूर्ण करण्यासाठी आपल्याला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    # वातावरण चल सेट करा
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड करा आणि माझा इंडेक्स तयार करा

    ```

---

**OpenAI फाइल सर्च (डिफॉल्ट):**

- Foundry एजंट्समध्ये अंगभूत
- स्वयंचलित दस्तऐवज प्रक्रिया आणि इंडेक्सिंग
- कोणतीही अतिरिक्त कॉन्फिगरेशन आवश्यक नाही

**Azure AI सर्च (पर्यायी):**

- हायब्रिड सेमॅंटिक आणि व्हेक्टर सर्च
- सानुकूल इंडेक्स व्यवस्थापन
- प्रगत सर्च क्षमताएं
- आवश्यक आहे `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ट्रेसिंग आणि मॉनिटरिंग](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "हे पूर्ण करण्यासाठी आपल्याला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry इंटीग्रेशन
- विनंती/प्रतिसाद ट्रॅकिंग
- कार्यक्षमता मेट्रिक्स
- Microsoft Foundry पोर्टलमध्ये उपलब्ध

**लॉगिंग:**

- कंटेनर अॅप्समधील अ‍ॅप्लिकेशन लॉग्स
- सुसंरचित लॉगिंग सह संबंध आयडी
- वास्तविक-वेळ आणि इतिहासातील लॉग पाहणी

---

## 5.4 [एजंट मूल्यमापन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानिक मूल्यमापन:**

- गुणवत्ता मूल्यांकनासाठी अंगभूत मूल्यांकन करणारे
- सानुकूल मूल्यमापन स्क्रिप्ट्स
- कार्यक्षमता बेंचमार्किंग

**सतत मॉनिटरिंग:**

- थेट संवादांचे स्वयंचलित मूल्यमापन
- गुणवत्ता मेट्रिक्सचे ट्रॅकिंग
- कार्यक्षमता रिग्रेशन शोधणे

**CI/CD इंटीग्रेशन:**

- GitHub Actions वर्कफ्लो
- स्वयंचलित चाचणी आणि मूल्यमापन
- सांख्यिकी तुलना चाचणी

---

## 5.5 [AI रेड टीमिंग एजंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टीमिंग:**

- स्वयंचलित सुरक्षा स्कॅनिंग
- AI प्रणालींसाठी जोखीम मूल्यांकन
- अनेक वर्गांमध्ये सुरक्षा मूल्यमापन

**प्रमाणीकरण:**

- Azure सेवा साठी मॅनेज्ड आयडेंटिटी
- ऐच्छिक Azure App Service प्रमाणीकरण
- विकासासाठी बेसिक ऑथ फॉलबॅक

!!! quote "या लॅबच्या शेवटी तुमच्याकडे असे असावे"
    - [ ] तुमच्या परिदृश्याच्या गरजा निश्चित केल्या
    - [ ] सानुकूल वातावरणीय चल (कॉन्फिग) तयार केले
    - [ ] एजंटच्या सूचनांचे सानुकूलन केले (टास्क)
    - [ ] सानुकूलित टेम्पलेट डिप्लॉय केले (अ‍ॅप)
    - [ ] डिप्लॉयनंतरचे कार्य पूर्ण केले (मॅन्युअल)
    - [ ] एक चाचणी मूल्यमापन चालवले

हा उदाहरण दोन विशेष एजंट आणि एकाधिक मॉडेल तैनातींसह एंटरप्राइझ रिटेल वापरासाठी टेम्पलेट सानुकूल कसे करायचे हे स्पष्ट करतो.

---

## 5.6 स्वतःसाठी सानुकूल करा!

### 5.6.1. परिदृश्य गरजा

#### **एजंट तैनाती:** 

   - शॉपर एजंट: ग्राहकांना उत्पादने शोधण्यात आणि तुलना करण्यात मदत करतो
   - लॉयल्टी एजंट: ग्राहक बोनस आणि प्रमोशन्सचे व्यवस्थापन करतो

#### **मॉडेल तैनाती:**

   - `gpt-4.1`: प्राथमिक चॅट मॉडेल
   - `o3`: जटिल प्रश्नांसाठी तर्क मॉडेल
   - `gpt-4.1-nano`: साध्या संवादांसाठी हलके मॉडेल
   - `text-embedding-3-large`: शोधासाठी उच्च-गुणवत्तेचे एम्बेडिंग्ज

#### **वैशिष्ट्ये:**

   - ट्रेसिंग आणि मॉनिटरिंग सक्षम केले
   - उत्पादन कॅटलॉगसाठी AI सर्च
   - गुणवत्ता खात्रीसाठी मूल्यमापन फ्रेमवर्क
   - सुरक्षा वैधतेसाठी रेड टीमिंग

---

### 5.6.2 परिदृश्य अंमलबजावणी


#### 5.6.2.1. डिप्लॉयमेंटपूर्व कॉन्फिग

सेटअप स्क्रिप्ट तयार करा (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# पर्यावरणाचे नाव सेट करा
azd env set AZURE_ENV_NAME "retail-ai-agents"

# प्रदेश कॉन्फिगर करा (मॉडेल उपलब्धतेनुसार निवडा)
azd env set AZURE_LOCATION "eastus2"

# सर्व ऐच्छिक सेवा सक्षम करा
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# प्राथमिक चॅट मॉडेल कॉन्फिगर करा (gpt-4.1 gpt-4.1 च्या सर्वाधिक जवळीक असलेले)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# सुधारित शोधासाठी एम्बेडिंग मॉडेल कॉन्फिगर करा
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजंट नाव सेट करा (प्रथम एजंट तयार करेल)
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

#### 5.6.2.3: डिप्लॉयमेंट स्क्रिप्ट

`deploy-retail.sh` तयार करा:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# पूर्वअटींची पडताळणी करा
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# वातावरण सेट करा
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

# पायाभूत सेवा आणि अनुप्रयोग तैनात करा
echo "🏗️  Deploying Azure infrastructure..."
azd up

# तैनातीचा आऊटपुट कॅप्चर करा
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# वेब अॅप URL मिळवा
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

#### 5.6.2.4: डिप्लॉयनंतर कॉन्फिग

`configure-retail-agents.sh` तयार करा:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# तैनातीची माहिती मिळवा
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

# पर्यावरण चल (environment variables) सेट आहेत का तपासा
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# वेब अनुप्रयोग उपलब्धता तपासा
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

या अंमलबजावणी मार्गदर्शकानंतर, तुमच्याकडे असे असेल:

1. **तैनात इन्फ्रास्ट्रक्चर:**

      - Microsoft Foundry प्रोजेक्टसहित मॉडेल डिप्लॉयमेंट्स
      - वेब अॅप्लिकेशन होस्टिंगसाठी कंटेनर अॅप्स
      - उत्पादन कॅटलॉगसाठी AI सर्च सेवा
      - मॉनिटरिंगसाठी Application Insights

2. **प्रारंभिक एजंट:**

      - मूलभूत सूचनांसह शॉपर एजंट कॉन्फिगर केला
      - फाइल सर्च क्षमता सक्षम केली
      - ट्रेसिंग आणि मॉनिटरिंग कॉन्फिगर केले

3. **सानुकूलनासाठी तयार:**

      - लॉयल्टी एजंट जोडण्यासाठी फ्रेमवर्क
      - सानुकूल सूचना टेम्पलेट्स
      - चाचणी आणि पडताळणी स्क्रिप्ट्स
      - मॉनिटरिंग आणि मूल्यमापन सेटअप

4. **उत्पादन तयार:**

      - रेड टीमिंगसह सुरक्षा स्कॅनिंग
      - कार्यक्षमता मॉनिटरिंग
      - गुणवत्ता मूल्यमापन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

हा उदाहरण दर्शवितो की AZD टेम्पलेट कसे विशिष्ट एंटरप्राइझ परिदृश्यांसाठी विस्तारित आणि सानुकूल केले जाऊ शकते जेव्हा सुरक्षा, मॉनिटरिंग आणि स्केलेबिलिटीसाठी सर्वोत्तम पद्धती राखल्या जातात.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सर्वशर्ती**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरात चुका किंवा अचूकतेत त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत खरे स्त्रोत मानला जावा. महत्वाच्या माहितीकरिता व्यावसायिक मानवी भाषांतर करण्याची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उत्पन्न झालेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलावबाबत आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->