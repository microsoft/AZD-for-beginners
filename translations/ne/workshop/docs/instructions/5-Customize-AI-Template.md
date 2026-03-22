# 5. टेम्पलेट अनुकूलन गर्नुहोस्

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] पूर्वनिर्धारित AI एजेन्ट क्षमताहरू अन्वेषण गरियो
    - [ ] तपाईंको आफ्नै इन्डेक्ससँग AI सर्च थपियो
    - [ ] ट्रेसिङ मेट्रिक्स सक्रिय र विश्लेषण गरियो
    - [ ] मूल्याङ्कन रन सञ्चालन गरियो
    - [ ] रेड-टिमिङ स्क्यान सञ्चालन गरियो
    - [ ] **Lab 5: अनुकूलन योजना बनाइयो** 

---

## 5.1 AI Agent Capabilities

!!! success "We completed this in Lab 01"

- **File Search**: ज्ञान पुनःप्राप्तिका लागि OpenAI को बिल्ट-इन फाइल सर्च
- **Citations**: जवाफहरूमा स्वचालित स्रोत श्रेय
- **Customizable Instructions**: एजेन्टको व्यवहार र व्यक्तित्व परिमार्जन गर्न सकिन्छ
- **Tool Integration**: अनुकूल क्षमताहरूका लागि विस्तारयोग्य उपकरण प्रणाली

---

## 5.2 ज्ञान पुनःप्राप्ति विकल्पहरू

!!! task "To complete this we need to make changes and redeploy"    
    
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

- Foundry एजेन्टहरूमा बिल्ट-इन
- स्वचालित दस्तावेज प्रोसेसिङ र इन्डेक्सिङ
- थप कन्फिगरेसन आवश्यक छैन

**Azure AI Search (Optional):**

- हाइब्रिड सेम्यान्टिक र भेक्टर सर्च
- अनुकूलित इन्डेक्स व्यवस्थापन
- उन्नत सर्च क्षमता
- आवश्यक: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ट्रेसिङ र निगरानी](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "To complete this we need to make changes and redeploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry एकीकरण
- अनुरोध/प्रतिक्रिया ट्र्याकिङ
- प्रदर्शन मेट्रिक्स
- Microsoft Foundry पोर्टलमा उपलब्ध

**Logging:**

- Container Apps मा अनुप्रयोग लगहरू
- सम्बन्धित ID हरू सहित संरचित लगिङ
- रियल-टाइम र ऐतिहासिक लग हेर्ने सुविधा

---

## 5.4 [एजेन्ट मूल्याङ्कन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानीय मूल्याङ्कन:**

- गुणस्तर मूल्याङ्कनका लागि बिल्ट-इन इवालुएटरहरू
- अनुकूलित मूल्याङ्कन स्क्रिप्टहरू
- प्रदर्शन बेन्चमार्किङ

**निरन्तर निगरानी:**

- प्रत्यक्ष अन्तरक्रिया हरूको स्वचालित मूल्याङ्कन
- गुणस्तर मेट्रिक्स ट्र्याकिङ
- प्रदर्शन रिग्रेसन पत्ता लगाउने

**CI/CD एकीकरण:**

- GitHub Actions वर्कफ्लो
- स्वचालित परीक्षण र मूल्याङ्कन
- साँख्यिकीय तुलना परीक्षण

---

## 5.5 [AI रेड-टिमिङ एजेन्ट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टिमिङ:**

- स्वचालित सुरक्षा स्क्यानिंग
- AI प्रणालीहरूको जोखिम मूल्याङ्कन
- धेरै श्रेणीहरूमा सुरक्षा मूल्याङ्कन

**प्रमाणीकरण:**

- Azure सेवाहरूका लागि Managed Identity
- वैकल्पिक Azure App Service प्रमाणीकरण
- डेभलपमेन्टका लागि बेसिक प्रमाणीकरण फलब्याक



!!! quote "BY THE END OF THIS LAB YOU SHOULD HAVE"
    - [ ] तपाईंको परिदृश्य आवश्यकताहरू परिभाषित गर्नुहोस्
    - [ ] env भेरिएबलहरू अनुकूलित गर्नुहोस् (config)
    - [ ] एजेन्ट निर्देशनहरू अनुकूलित गर्नुहोस् (task)
    - [ ] अनुकूलित टेम्पलेट तैनाथ गर्नुहोस् (app)
    - [ ] पोस्ट-डिप्लोयमेन्ट कार्यहरू पूरा गर्नुहोस् (manual)
    - [ ] परीक्षण मूल्याङ्कन चलाउनुहोस्

यो उदाहरणले दुई विशेषज्ञ एजेन्टहरू र बहु मोडल तैनाथीहरूसहित उद्यम खुद्रा प्रयोग केसका लागि टेम्पलेट कसरी अनुकूलन गर्ने देखाउँछ।

---

## 5.6 तपाईंका लागि अनुकूलन गर्नुहोस्!

### 5.6.1. परिदृश्य आवश्यकताहरू

#### **एजेन्ट तैनाथीहरू:** 

   - Shopper Agent: ग्राहकहरूलाई उत्पादनहरू फेला पार्न र तुलना गर्न मद्दत गर्छ
   - Loyalty Agent: ग्राहक पुरस्कार र प्रचार व्यवस्थापन गर्छ

#### **मोडेल तैनाथीहरू:**

   - `gpt-4.1`: प्राथमिक च्याट मोडेल
   - `o3`: जटिल प्रश्नहरूको लागि reasoning मोडेल
   - `gpt-4.1-nano`: सरल अन्तरक्रियाका लागि हल्का मोडेल
   - `text-embedding-3-large`: सर्चका लागि उच्च-गुणस्तर एम्बेडिङ

#### **विशेषताहरू:**

   - ट्रेसिङ र निगरानी सक्षम गरिएको
   - उत्पादन सूचीका लागि AI सर्च
   - गुणस्तर सुनिश्चितताका लागि मूल्याङ्कन फ्रेमवर्क
   - सुरक्षा प्रमाणिकरणका लागि रेड-टिमिङ

---

### 5.6.2 परिदृश्य कार्यान्वयन


#### 5.6.2.1. पूर्व-डिप्लोयमेन्ट कन्फिग

सेटअप स्क्रिप्ट सिर्जना गर्नुहोस् (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# पर्यावरण नाम सेट गर्नुहोस्
azd env set AZURE_ENV_NAME "retail-ai-agents"

# क्षेत्र कन्फिगर गर्नुहोस् (मोडेल उपलब्धताका आधारमा छनौट गर्नुहोस्)
azd env set AZURE_LOCATION "eastus2"

# सबै वैकल्पिक सेवाहरू सक्षम गर्नुहोस्
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# प्राथमिक च्याट मोडेल कन्फिगर गर्नुहोस् (gpt-4.1 सबैभन्दा नजिक उपलब्ध मोडलको रूपमा)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# उन्नत खोजको लागि इम्बेडिङ मोडेल कन्फिगर गर्नुहोस्
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजेन्ट नाम सेट गर्नुहोस् (पहिलो एजेन्ट सिर्जना हुनेछ)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# खोज सूचकांक कन्फिगर गर्नुहोस्
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: एजेन्ट निर्देशनहरू

सिर्जना गर्नुहोस् `custom-agents/shopper-agent-instructions.md`:

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

सिर्जना गर्नुहोस् `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: डिप्लोयमेन्ट स्क्रिप्ट

सिर्जना गर्नुहोस् `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# पूर्वआवश्यकताहरू मान्य गर्नुहोस्
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# पर्यावरण सेटअप गर्नुहोस्
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# छानिएको क्षेत्रमा कोटा जाँच्नुहोस्
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

# अवसंरचना र अनुप्रयोग तैनाथ गर्नुहोस्
echo "🏗️  Deploying Azure infrastructure..."
azd up

# तैनाती आउटपुटहरू समात्नुहोस्
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# वेब एपको URL प्राप्त गर्नुहोस्
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

#### 5.6.2.4: पोस्ट-डिप्लोयमेन्ट कन्फिग

सिर्जना गर्नुहोस् `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# परिनियोजन जानकारी प्राप्त गर्नुहोस्
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# म्यानुअल कन्फिगरेसनका लागि निर्देशनहरू
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

### 5.6.3: परीक्षण र प्रमाणिकरण

सिर्जना गर्नुहोस् `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# पर्यावरण चरहरू सेट भएका छन् भनी जाँच गर्नुहोस्
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# वेब अनुप्रयोगको उपलब्धता परीक्षण गर्नुहोस्
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

# कन्फिगर गरिएको छ भने मूल्याङ्कन चलाउनुहोस्
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

### 5.6.4 अपेक्षित नतिजाहरू

After following this implementation guide, you will have:

1. **तैनाथ गरिएको पूर्वाधार:**

      - Microsoft Foundry परियोजना मोडेल तैनाथीहरूसहित
      - वेब अनुप्रयोग होस्ट गर्ने Container Apps
      - उत्पादन सूचीका लागि AI Search सेवा
      - निगरानीका लागि Application Insights

2. **प्रारम्भिक एजेन्ट:**

      - Shopper Agent आधारभूत निर्देशनहरूसँग कन्फिगर गरिएको
      - फाइल सर्च क्षमता सक्षम गरिएको
      - ट्रेसिङ र निगरानी कन्फिगर गरिएको

3. **अनुकूलनका लागि तयार:**

      - Loyalty Agent थप्नको लागि फ्रेमवर्क
      - अनुकूल निर्देशन टेम्पलेटहरू
      - परीक्षण र प्रमाणिकरण स्क्रिप्टहरू
      - निगरानी र मूल्याङ्कन सेटअप

4. **उत्पादन तयारी:**

      - रेड-टिमिङ सहित सुरक्षा स्क्यानिङ
      - प्रदर्शन निगरानी
      - गुणवत्ता मूल्याङ्कन फ्रेमवर्क
      - स्केलेबल आर्किटेक्चर

यो उदाहरणले देखाउँछ कि AZD टेम्पलेटलाई कसरी विशिष्ट उद्यम परिदृश्यहरूका लागि विस्तार र अनुकूलन गर्न सकिन्छ, सुरक्षा, निगरानी र स्केलेबिलिटीको उत्कृष्ट अभ्यासहरू कायम राख्दै।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयासरत भए तापनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->