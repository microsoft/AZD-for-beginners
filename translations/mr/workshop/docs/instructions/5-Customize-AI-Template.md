# 5. साच्याचे सानुकूलन करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही करू शकाल"

    - [ ] डीफॉल्ट AI एजंट क्षमता एक्सप्लोर केली
    - [ ] तुमच्या स्वतःच्या इंडेक्ससह AI शोध जोडलं
    - [ ] ट्रेसिंग मेट्रिक्स सक्रिय आणि विश्लेषित केल्या
    - [ ] मूल्यमापन धावणं चालवले
    - [ ] रेड-टीमिंग स्कॅन चालवलं
    - [ ] **लॅब 5: सानुकूलन योजना तयार केली** 

---

## 5.1 AI एजंट क्षमता

!!! success "हे आम्ही लॅब 01 मध्ये पूर्ण केले"

- **फाईल शोध**: ज्ञान पुनर्प्राप्तीसाठी OpenAI चा अंगभूत फाइल शोध
- **संदर्भ**: प्रतिसादांमध्ये स्वयंचलित स्रोत उल्लेख
- **सानुकूल सूचना**: एजंटच्या वर्तन आणि व्यक्तिमत्त्वात बदल करा
- **साधन एकत्रीकरण**: सानुकूल क्षमता वाढविण्यासाठी विस्तारक्षम साधन प्रणाली

---

## 5.2 ज्ञान पुनर्प्राप्ती पर्याय

!!! task "हे पूर्ण करण्यासाठी आम्हाला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    # पर्यावरण चल सेट करा
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड करा आणि माझा इंडेक्स तयार करा

    ```

---

**OpenAI फाइल शोध (डीफॉल्ट):**

- Foundry एजंटमध्ये अंगभूत
- स्वयंचलित दस्तऐवज प्रक्रिया आणि इंडेक्सिंग
- कोणतीही अतिरिक्त कॉन्फिगरेशन आवश्यक नाही

**Azure AI शोध (ऐच्छिक):**

- संमिश्र अर्थपूर्ण आणि व्हेक्टर शोध
- सानुकूल इंडेक्स व्यवस्थापन
- प्रगत शोध क्षमता
- `USE_AZURE_AI_SEARCH_SERVICE=true` आवश्यक

---

## 5.3 [ट्रेसिंग आणि निरीक्षण](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "हे पूर्ण करण्यासाठी आम्हाला बदल करावे लागतील आणि पुन्हा तैनात करावे लागेल"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिंग:**

- OpenTelemetry एकत्रीकरण
- विनंती / प्रतिसाद ट्रॅकिंग
- कार्यक्षमता मेट्रिक्स
- Microsoft Foundry पोर्टलमध्ये उपलब्ध

**लॉगिंग:**

- कंटेनर अ‍ॅप्समधील अनुप्रयोग लॉग्स
- सहसंबंध आयडीसह संरचित लॉगिंग
- रिअल-टाइम आणि ऐतिहासिक लॉग पाहणी

---

## 5.4 [एजंट मूल्यांकन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानिक मूल्यांकन:**

- गुणवत्ता मूल्यांकनासाठी अंगभूत मूल्यांकनकर्ते
- सानुकूल मूल्यांकन स्क्रिप्ट्स
- कार्यक्षमता मापन

**सतत निरीक्षण:**

- थेट संवादांचे स्वयंचलित मूल्यांकन
- गुणवत्ता मेट्रिक्स ट्रॅकिंग
- कार्यक्षमता regressions ची शोध

**CI/CD एकत्रीकरण:**

- GitHub Actions वर्कफ्लो
- स्वयंचलित चाचणी आणि मूल्यांकन
- सांख्यिक तौलनिक चाचणी

---

## 5.5 [AI रेड टीमिंग एजंट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टीमिंग:**

- स्वयंचलित सुरक्षा स्कॅनिंग
- AI सिस्टमसाठी धोका मूल्यांकन
- अनेक वर्गांमध्ये सुरक्षा मूल्यमापन

**प्रमाणीकरण:**

- Azure सेवांसाठी व्यवस्थापीत ओळख
- ऐच्छिक Azure App Service प्रमाणीकरण
- विकासासाठी मूलभूत auth fallback

!!! quote "या लॅबसाठी तुम्ही असा कराल"
    - [ ] तुमच्या परिस्थितीच्या आवश्यकता निश्चित केल्या
    - [ ] सानुकूलित env चल (कॉन्फिग)
    - [ ] सानुकूलित एजंट सूचना (कार्य)
    - [ ] सानुकूलित साच्याची तैनात केली (अ‍ॅप)
    - [ ] पोस्ट-तैनाती कार्य पूर्ण केले (मॅन्युअल)
    - [ ] चाचणी मूल्यमापन चालवले

हा उदा. एंटरप्रायझ रिटेल वापरासाठी दोन विशेष एजंटसह आणि अनेक मॉडेल तैनातींसह साच्याचे कसे सानुकूलन करायचे हे दाखवितो.

---

## 5.6 तुमच्यासाठी सानुकूल करा!

### 5.6.1. परिस्थितीच्या आवश्यकता

#### **एजंट तैनाती:** 

   - खरेदी एजंट: ग्राहकांना उत्पादने शोधण्यात आणि तुलना करण्यात मदत करतो
   - लॉयल्टी एजंट: ग्राहकांच्या बक्षिसे आणि प्रमोशन्स व्यवस्थापित करतो

#### **मॉडेल तैनाती:**

   - `gpt-4.1`: प्राथमिक चॅट मॉडेल
   - `o3`: गुंतागुंतीच्या प्रश्नांसाठी तर्क मॉडेल
   - `gpt-4.1-nano`: सोप्या संवादांसाठी लहान मॉडेल
   - `text-embedding-3-large`: शोधासाठी उच्च-गुणवत्तेची एम्बेडिंग्ज

#### **वैशिष्ट्ये:**

   - ट्रेसिंग आणि निरीक्षण सक्षम
   - उत्पादन कॅटलॉगसाठी AI शोध
   - गुणवत्ता खात्रीसाठी मूल्यांकन फ्रेमवर्क
   - सुरक्षा पुष्टीसाठी रेड टीमिंग

---

### 5.6.2 परिस्थिती अंमलबजावणी


#### 5.6.2.1. पूर्व-तैनाती कॉन्फिग

सेटअप स्क्रिप्ट तयार करा (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# पर्यावरणाचे नाव सेट करा
azd env set AZURE_ENV_NAME "retail-ai-agents"

# प्रदेश सेट करा (मॉडेल उपलब्धतेनुसार निवडा)
azd env set AZURE_LOCATION "eastus2"

# सर्व पर्यायी सेवा सक्षम करा
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# प्राथमिक चैट मॉडेल सेट करा (gpt-4o, gpt-4.1 ला सर्वाधिक जवळचे)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# उच्च दर्जाचा शोधासाठी एम्बेडिंग मॉडेल सेट करा
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजंटचे नाव सेट करा (पहिला एजंट तयार करेल)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# शोध सूची सेट करा
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

# पूर्वअटांची सत्यता करा
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
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# पायाभूत सुविधा आणि अनुप्रयोग स्थापित करा
echo "🏗️  Deploying Azure infrastructure..."
azd up

# प्रतिष्ठापनाचे आउटपुट कॅप्चर करा
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

#### 5.6.2.4: पोस्ट-तैनाती कॉन्फिग

`configure-retail-agents.sh` तयार करा:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# तैनात करण्याची माहिती मिळवा
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

# पर्यावरण चालू करा हे तपासा
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

# कॉन्फिगर केल्यास मूल्यांकन चालवा
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

हा मार्गदर्शक अनुसरल्यानंतर, तुम्ही असे करू शकाल:

1. **तैनात केलेली पायाभूत सुविधा:**

      - Microsoft Foundry प्रकल्प मॉडेल तैनातींसह
      - वेब अनुप्रयोगासाठी कंटेनर अ‍ॅप्स
      - उत्पादन कॅटलॉगसाठी AI शोध सेवा
      - निरीक्षणासाठी Application Insights

2. **प्रारंभिक एजंट:**

      - मूलभूत सूचनांसह खरेदी एजंट कॉन्फिगर केला
      - फाईल शोध क्षमता सक्षम
      - ट्रेसिंग आणि निरीक्षण कॉन्फिगर केले

3. **सानुकूलनासाठी तयार:**

      - लॉयल्टी एजंट जोडण्याचा फ्रेमवर्क
      - सानुकूल सूचना साचे
      - चाचणी आणि पडताळणी स्क्रिप्ट्स
      - निरीक्षण आणि मूल्यमापन सेटअप

4. **उत्पादनासाठी तयार:**

      - रेड टीमिंगसह सुरक्षा स्कॅनिंग
      - कार्यक्षमता निरीक्षण
      - गुणवत्ता मूल्यमापन फ्रेमवर्क
      - प्रमाणयोग्य आर्किटेक्चर

हा उदा. दाखवतो की AZD साचा विशिष्ट एंटरप्रायझ परिस्थितीसाठी कसा विस्तारित आणि सानुकूल करता येतो, तसेच सुरक्षा, निरीक्षण आणि प्रमाणयोग्यतेसाठी सर्वोत्तम पद्धती कशा राखता येतात.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**माफ करा**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या समस्यांचा समावेश असू शकतो. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत म्हणून मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी अनुवाद करण्याचा सल्ला दिला जातो. या अनुवादाच्या वापरामुळे होणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलागी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->