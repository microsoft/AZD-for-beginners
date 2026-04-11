# 5. टेम्प्लेट अनुकूलित गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्म तपाईं सक्षम हुनुहुनेछ"

    - [ ] पूर्वनिर्धारित AI एजेन्ट क्षमता अनुसंधान गर्ने
    - [ ] आफ्नो आफ्नै सूचीसहित AI खोज थप्ने
    - [ ] ट्रेसिङ मेट्रिक्स सक्रिय र विश्लेषण गर्ने
    - [ ] मूल्याङ्कन रन सञ्चालन गर्ने
    - [ ] रेड-टीमिङ स्क्यान सञ्चालन गर्ने
    - [ ] **प्रयोगशाला 5: अनुकूलन योजना तयार पार्ने** 

---

## 5.1 AI एजेन्ट क्षमता

!!! success "हामीले यो प्रयोगशाला 01 मा पूरा गर्यौं"

- **फाइल खोजी**: ज्ञान पुनःप्राप्तिका लागि OpenAI को बिल्ट-इन फाइल खोजी
- **स्रोत सूचनाहरु**: प्रतिक्रियाहरूमा स्वचालित स्रोत सन्दर्भ
- **अनुकूलनयोग्य निर्देशनहरू**: एजेन्टको व्यवहार र व्यक्तित्व परिमार्जन गर्ने
- **उपकरण एकीकरण**: अनुकूलन क्षमता को लागि विस्तार योग्य उपकरण प्रणाली

---

## 5.2 ज्ञान पुनःप्राप्ति विकल्पहरू

!!! task "यसलाई पूरा गर्न हामीले परिवर्तनहरू गर्न र पुनर्संचालन गर्न आवश्यक छ"    
    
    ```bash title=""
    # वातावरण चर सेट गर्नुहोस्
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # डेटा अपलोड गरेर मेरो सूची बनाउनुहोस्

    ```

---

**OpenAI फाइल खोज (पूर्वनिर्धारित):**

- Foundry एजेन्टहरूमा नै बिल्ट-इन
- स्वचालित कागजात प्रक्रिया र सूचीकरण
- कुनै अतिरिक्त कन्फिगरेसन आवश्यक छैन

**Azure AI खोज (वैकल्पिक):**

- हाइब्रिड सेम्यान्टिक र भेक्टर खोज
- अनुकूलित सूची व्यवस्थापन
- उन्नत खोज क्षमता
- `USE_AZURE_AI_SEARCH_SERVICE=true` आवश्यक

---

## 5.3 [ट्रेसिङ र अनुगमन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "यसलाई पूरा गर्न हामीले परिवर्तनहरू गर्न र पुनर्संचालन गर्न आवश्यक छ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ट्रेसिङ:**

- OpenTelemetry एकीकरण
- अनुरोध/प्रतिक्रिया ट्र्याकिङ
- प्रदर्शन मेट्रिक्स
- Microsoft Foundry पोर्टलमा उपलब्ध

**लगिङ:**

- Container Apps मा अनुप्रयोग लगहरू
- सम्बन्धित IDs सहित संरचित लगिङ
- रियल-टाइम र ऐतिहासिक लग अवलोकन

---

## 5.4 [एजेन्ट मूल्याङ्कन](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**स्थानीय मूल्याङ्कन:**

- गुणस्तर मूल्याङ्कनको लागि बिल्ट-इन मूल्याङ्ककहरू
- अनुकूलन मूल्याङ्कन स्क्रिप्टहरू
- प्रदर्शन मापन

**लगातार अनुगमन:**

- प्रत्यक्ष अन्तरक्रियाहरूको स्वचालित मूल्याङ्कन
- गुणस्तर मेट्रिक्स अनुगमन
- प्रदर्शन रिग्रेसन पहिचान

**CI/CD एकीकरण:**

- GitHub Actions वर्कफ्लो
- स्वचालित परीक्षण र मूल्याङ्कन
- सांख्यिक तुलना परीक्षण

---

## 5.5 [AI रेड टीमिङ एजेन्ट](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI रेड टीमिङ:**

- स्वचालित सुरक्षा स्क्यानिङ
- AI प्रणालीहरूको जोखिम मूल्याङ्कन
- धेरै वर्गहरूमा सुरक्षा मूल्याङ्कन

**प्रमाणीकरण:**

- Azure सेवाहरूका लागि प्रबन्धित पहिचान
- वैकल्पिक Azure एप सेवा प्रमाणीकरण
- विकासका लागि बेसिक प्रमाणीकरण ब्याकअप

!!! quote "यस प्रयोगशालाको अन्त्यसम्म तपाईंले पाइसक्नु पर्ने कुरा"
    - [ ] तपाईंको परिदृश्य आवश्यकताहरू परिभाषित गर्नुभएको
    - [ ] अनुकूलित वातावरण चरहरू (कन्फिग)
    - [ ] अनुकूलित एजेन्ट निर्देशनहरू (कार्य)
    - [ ] अनुकूलित टेम्प्लेट लागू गर्नुहोस् (एप)
    - [ ] पोस्ट-डिप्लोयमेन्ट कार्यहरू पूरा गर्ने (म्यानुअल)
    - [ ] परीक्षण मूल्याङ्कन सञ्चालन गर्ने

यस उदाहरणले दुई विशेषज्ञ एजेन्ट र थुप्रै मोडल डिप्लोयमेन्टहरू सहित एक एन्त्रप्राइज खुद्रा प्रयोग केसको लागि टेम्प्लेट अनुकूलन देखाउँदछ।

---

## 5.6 तपाईंका लागि अनुकूलित गर्नुहोस्!

### 5.6.1. परिदृश्य आवश्यकताहरू

#### **एजेन्ट डिप्लोयमेन्टहरू:** 

   - ग्राहक एजेन्ट: ग्राहकहरूलाई उत्पादनहरू पत्ता लगाउन र तुलना गर्न मद्दत गर्ने
   - वफादारी एजेन्ट: ग्राहक पुरस्कार र प्रचार व्यवस्थापन गर्ने

#### **मोडल डिप्लोयमेन्टहरू:**

   - `gpt-4.1`: प्रमुख च्याट मोडल
   - `o3`: जटिल प्रश्नहरूको लागि तर्क मोडल
   - `gpt-4.1-nano`: सरल अन्तरक्रियाको लागि हल्का मोडल
   - `text-embedding-3-large`: खोजको लागि उच्च गुणस्तर_embeddings

#### **विशेषताहरू:**

   - ट्रेसिङ र अनुगमन सक्षम
   - उत्पादन सूचीको लागि AI खोज
   - गुणस्तर आश्वासनको लागि मूल्याङ्कन फ्रेमवर्क
   - सुरक्षा मान्यताको लागि रेड टीमिङ

---

### 5.6.2 परिदृश्य कार्यान्वयन


#### 5.6.2.1. पूर्व-डिप्लोयमेन्ट कन्फिग

सेटअप स्क्रिप्ट बनाउनुहोस् (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# वातावरण नाम सेट गर्नुहोस्
azd env set AZURE_ENV_NAME "retail-ai-agents"

# क्षेत्र कन्फिगर गर्नुहोस् (मोडेल उपलब्धतामा आधारित चयन गर्नुहोस्)
azd env set AZURE_LOCATION "eastus2"

# सबै वैकल्पिक सेवाहरू सक्षम गर्नुहोस्
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# प्राथमिक च्याट मोडेल कन्फिगर गर्नुहोस् (gpt-4.1 लाई gpt-4.1 सँग सबैभन्दा नजिक उपलब्ध मोडेलको रूपमा)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# सुधारिएको खोजको लागि एम्बेडिङ मोडेल कन्फिगर गर्नुहोस्
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# एजेंट नाम सेट गर्नुहोस् (पहिलो एजेंट सिर्जना हुनेछ)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# खोज इन्डेक्स कन्फिगर गर्नुहोस्
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: एजेन्ट निर्देशनहरू

`custom-agents/shopper-agent-instructions.md` बनाउनुहोस्:

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

`custom-agents/loyalty-agent-instructions.md` बनाउनुहोस्:

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

`deploy-retail.sh` बनाउनुहोस्:

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

# वातावरण सेट अप गर्नुहोस्
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# चयन गरिएको क्षेत्रको कोटा जाँच्नुहोस्
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

# पूर्वाधार र अनुप्रयोग तैनात गर्नुहोस्
echo "🏗️  Deploying Azure infrastructure..."
azd up

# तैनाती आउटपुटहरू कैद गर्नुहोस्
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# वेब अनुप्रयोग URL प्राप्त गर्नुहोस्
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

#### 5.6.2.4: पोस्ट-डिप्लोयमेन्ट कन्फिग

`configure-retail-agents.sh` बनाउनुहोस्:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# वितरण जानकारी प्राप्त गर्नुहोस्
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

### 5.6.3: परीक्षण र मान्यता

`test-retail-deployment.sh` बनाउनुहोस्:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# वातावरण चर सेट गरिएको छ कि छैन जाँच गर्नुहोस्
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# वेब अनुप्रयोग उपलब्धता परीक्षण गर्नुहोस्
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

# कन्फिगर गरिएको भए मूल्यांकन चलाउनुहोस्
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

### 5.6.4 अपेक्षित परिणामहरू

यस कार्यान्वयन मार्गनिर्देशन पछ्याएपछि, तपाईंले:

1. **डिप्लोय गरिएको पूर्वाधार:**

      - मोडल डिप्लोयमेन्टसहित Microsoft Foundry प्रोजेक्ट
      - वेब अनुप्रयोग होस्ट गर्ने Container Apps
      - उत्पादन सूचीका लागि AI खोज सेवा
      - अनुगमनको लागि Application Insights

2. **प्रारम्भिक एजेन्ट:**

      - आधारभूत निर्देशनहरूसँग कन्फिगर गरिएको ग्राहक एजेन्ट
      - फाइल खोज क्षमतासँग सक्षम
      - ट्रेसिङ र अनुगमन कन्फिगर गरिएको

3. **अनुकूलनको लागि तयार:**

      - वफादारी एजेन्ट थप्ने फ्रेमवर्क
      - अनुकूलन निर्देशन टेम्प्लेटहरू
      - परीक्षण र मान्यता स्क्रिप्टहरू
      - अनुगमन र मूल्याङ्कन सेटअप

4. **उत्पादन तत्परता:**

      - रेड टीमिङ मार्फत सुरक्षा स्क्यानिङ
      - प्रदर्शन अनुगमन
      - गुणस्तर मूल्याङ्कन फ्रेमवर्क
      - स्केलेबल संरचना

यस उदाहरणले कसरी AZD टेम्प्लेटलाई विशिष्ट एन्त्रप्राइज परिदृश्यहरूको लागि विस्तार गरी अनुकूलित गर्न सकिन्छ भन्ने देखाउँदछ, जबकि सुरक्षा, अनुगमन, र स्केलेबिलिटीका उत्तम अभ्यासहरू कायम राखिन्छ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयासरत छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज यसको आफैंको भाषा में आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याहरूको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->