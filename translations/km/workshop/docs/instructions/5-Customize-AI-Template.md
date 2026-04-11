# 5. កែប្រែគំរូ

!!! tip "នៅចុងម៉ូឌុលនេះ អ្នកនឹងអាច"

    - [ ] បានសិក្សាសមត្ថភាពលំនាំដើមរបស់ភ្នាក់ងារ AI
    - [ ] បានបន្ថែម AI Search ជាមួយ index របស់អ្នក
    - [ ] បានបើក និងវិភាគមេត្រិក Tracing
    - [ ] បានអនុវត្តការប្រតិបត្តិការវាយតម្លៃ
    - [ ] បានអនុវត្តស្កេន red-teaming
    - [ ] **Lab 5: បានបង្កើតផែនការកែប្រែ** 

---

## 5.1 សមត្ថភាពភ្នាក់ងារ AI

!!! success "យើងបានបញ្ចប់រួចក្នុង Lab 01"

- **File Search**: ការស្វែងរកឯកសារខាងក្នុងរបស់ OpenAI សម្រាប់ទាញយកចំណេះដឹង
- **Citations**: ការបញ្ជាក់ប្រភពដោយស្វ័យប្រវត្តិក្នុងចម្លើយ
- **Customizable Instructions**: ការផ្លាស់ប្តូរពេលបញ្ជា ដើម្បីកំណត់អាកប្បកិរិយា និងបុគ្គលិកលក្ខណៈរបស់ភ្នាក់ងារ
- **Tool Integration**: ប្រព័ន្ធឧបករណ៍ដែលអាចពង្រីកសម្រាប់សមត្ថភាពផ្ទាល់ខ្លួន

---

## 5.2 ជម្រើសសម្រាប់ការទាញយកចំណេះដឹង

!!! task "ដើម្បីបញ្ចប់នេះ យើងត្រូវធ្វើការផ្លាស់ប្តូរ និងដាក់ឡើងវិញ"    
    
    ```bash title=""
    # កំណត់អថេរបរិស្ថាន
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ផ្ទុកទិន្នន័យ និងបង្កើត index របស់ខ្ញុំ

    ```

---

**OpenAI File Search (Default):**

- រួមបញ្ចូលជាមួយ Foundry Agents
- ដំណើរការឯកសារដោយស្វ័យប្រវត្តិ និងការបញ្ចី
- មិនទាមទារការកំណត់បន្ថែមទេ

**Azure AI Search (Optional):**

- ការស្វែងរកទ្វេមុខ សេម៉ង់ទិក និងវ៉ិចទ័រ
- ការគ្រប់គ្រង index ផ្ទាល់ខ្លួន
- សមត្ថភាពស្វែងរកកម្រិតខ្ពស់
- តម្រូវឱ្យមាន `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ការតាមដាន និងត្រួតពិនិត្យ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ដើម្បីបញ្ចប់នេះ យើងត្រូវធ្វើការផ្លាស់ប្តូរ និងដាក់ឡើងវិញ"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ការតាមដាន:**

- ការរួមបញ្ចូល OpenTelemetry
- ការតាមដានសំណើ/ចម្លើយ
- មេត្រិកប្រសិទ្ធភាព
- មាននៅក្នុងផតហ្វូម Microsoft Foundry

**កំណត់ហេតុ:**

- កំណត់ហេតុកម្មវិធីនៅក្នុង Container Apps
- កំណត់ហេតុដែលមានរចនាសម្ព័ន្ធ និងលេខសម្គាល់ភ្ជាប់ (correlation IDs)
- មើលកំណត់ហេតុពេលវេលាពិត និងប្រវត្តិសាស្ត្រ

---

## 5.4 [ការវាយតម្លៃភ្នាក់ងារ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ការវាយតម្លៃក្នុងស្រុក:**

- កម្មវិធីវាយតម្លៃដែលរួមមានសម្រាប់ការវាស់គុណភាព
- ស្គ្រីបវាយតម្លៃផ្ទាល់ខ្លួន
- ការវាស់ស្ទង់ប្រសិទ្ធភាព

**ការត្រួតពិនិត្យបន្ត:**

- ការវាយតម្លៃដោយស្វ័យប្រវត្តិលើអន្តរកម្មពេលពិត
- ការតាមដានមេត្រិកគុណភាព
- ការរកឃើញការវិលត្រឡប់នៃប្រសិទ្ធភាព

**ការរួមបញ្ចូល CI/CD:**

- លំនាំប្រតិបត្តិការលើ GitHub Actions
- ការធ្វើតេស្ត និងវាយតម្លៃដោយស្វ័យប្រវត្តិ
- ការធ្វើតេស្តប្រៀបធៀបទិន្នន័យស្ថិតិសាស្ត្រ

---

## 5.5 [ភ្នាក់ងារ AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**ការធ្វើ Red Teaming សម្រាប់ AI:**

- ការស្កេនសន្តិសុខដោយស្វ័យប្រវត្តិ
- ការប៉ាន់ប្រមាណហានិភ័យសម្រាប់ប្រព័ន្ធ AI
- ការវាយតម្លៃសុវត្ថិភាពឆ្លងកាត់ចំនួនប្រភេទជាច្រើន

**ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ:**

- Managed Identity សម្រាប់សេវាកម្ម Azure
- ការផ្ទៀងផ្ទាត់ Azure App Service ជាជម្រើស
- ការវិលត្រឡប់ទៅ authentication មូលដ្ឋានសម្រាប់ការអភិវឌ្ឍ

!!! quote "នៅចុងមេរៀននេះ អ្នកគួរតែមាន"
    - [ ] កំណត់តម្រូវការសេណារីយ៉ូរបស់អ្នក
    - [ ] បានកំណត់អថេរបរិស្ថានផ្ទាល់ខ្លួន (config)
    - [ ] បានប្តូរណែនាំភ្នាក់ងារផ្ទាល់ខ្លួន (task)
    - [ ] បានដាក់បញ្ចូលគំរូផ្ទាល់ខ្លួន (app)
    - [ ] បានបញ្ចប់ភារកិច្ចក្រោយការដាក់បញ្ចូល (ដោយដៃ)
    - [ ] បានរត់ការវាយតម្លៃសាកល្បង

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 កែសម្រួលសម្រាប់អ្នក!

### 5.6.1. តម្រូវការសេណារីយ៉ូ

#### **ការដាក់ដំឡើងភ្នាក់ងារ:** 

   - Shopper Agent: ជួយអតិថិជនស្វែងរក និងប្រៀបធៀបផលិតផល
   - Loyalty Agent: គ្រប់គ្រងរង្វាន់ និងការផ្សព្វផ្សាយសម្រាប់អតិថិជន

#### **ការដាក់ចេញម៉ូឌែល:**

   - `gpt-4.1`: ម៉ូឌែលជជែកសំខាន់
   - `o3`: ម៉ូឌែលហេតុផលសម្រាប់សំណួរលំបាក
   - `gpt-4.1-nano`: ម៉ូឌែលទន់សម្រាប់អន្តរកម្មសាមញ្ញ
   - `text-embedding-3-large`: Embeddings គុណភាពខ្ពស់សម្រាប់ស្វែងរក

#### **លក្ខណៈពិសេស:**

   - បានបើកការតាមដាន និងត្រួតពិនិត្យ
   - AI Search សម្រាប់បញ្ជីផលិតផល
   - ស៊ុមវាយតម្លៃសម្រាប់ធានាគុណភាព
   - Red teaming សម្រាប់ផ្ទៀងផ្ទាត់សុវត្ថិភាព

---

### 5.6.2 អនុវត្តសេណារីយ៉ូ


#### 5.6.2.1. ការកំណត់មុនការដាក់បញ្ចូល

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# កំណត់ឈ្មោះបរិស្ថាន
azd env set AZURE_ENV_NAME "retail-ai-agents"

# កំណត់តំបន់ (ជ្រើសឡើងដោយផ្អែកលើការមានស្រាប់នៃម៉ូដែល)
azd env set AZURE_LOCATION "eastus2"

# បើកសេវាកម្មជ្រើសរើសទាំងអស់
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# កំណត់ម៉ូដែលជជែកចម្បង (gpt-4.1 ជាដែលមានស្រាប់នៅជិតที่สุดនៃ gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# កំណត់ម៉ូដែល embedding សម្រាប់ការស្វែងរកដែលបានបង្កើនប្រសិទ្ធភាព
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# កំណត់ឈ្មោះភ្នាក់ងារ (នឹងបង្កើតភ្នាក់ងារដំបូង)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# កំណត់សន្ទស្សន៍ស្វែងរក
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ការណែនាំភ្នាក់ងារ

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

#### 5.6.2.3: ស្គ្រីបដាក់បញ្ចូល

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# ផ្ទៀងផ្ទាត់លក្ខខណ្ឌជាមុន
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# រៀបចំបរិយាកាស
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ពិនិត្យក្វូតានៅតំបន់ដែលបានជ្រើស
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

# ដាក់ឲ្យដំណើរការរចនាសម្ព័ន្ធ និងកម្មវិធី
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ចាប់យកលទ្ធផលនៃការដាក់ឲ្យដំណើរការ
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# យក URL នៃកម្មវិធីបណ្ដាញ
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

#### 5.6.2.4: ការកំណត់ក្រោយដាក់បញ្ចូល

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ទាញយកព័ត៌មានអំពីការដាក់បញ្ចូល
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# សេចក្តីណែនាំសម្រាប់ការកំណត់រចនាសម្ព័ន្ធដោយដៃ
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

### 5.6.3: ការធ្វើតេស្ត និងផ្ទៀងផ្ទាត់

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ផ្ទៀងផ្ទាត់ថាអថេរបរិយាកាសត្រូវបានកំណត់
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# សាកល្បងភាពអាចប្រើបានរបស់កម្មវិធីវេប
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

# ដំណើរការវាយតម្លៃ ប្រសិនបើបានកំណត់
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

### 5.6.4 លទ្ធផលដែលរំពឹងទុក

បន្ទាប់ពីអនុវត្តតាមមគ្គុទេសក៍នេះ អ្នកនឹងមាន:

1. **គ្រឹះហេដ្ឋារចនាសម្ព័ន្ធដែលបានដាក់ចេញ:**

      - គម្រោង Microsoft Foundry ជាមួយការដាក់ចេញម៉ូឌែល
      - Container Apps ដែលបង្ហោះកម្មវិធីវែប
      - សេវា AI Search សម្រាប់បញ្ជីផលិតផល
      - Application Insights សម្រាប់ការត្រួតពិនិត្យ

2. **ភ្នាក់ងារដំបូង:**

      - Shopper Agent ត្រូវបានកំណត់ជាមួយការណែនាំមូលដ្ឋាន
      - សមត្ថភាពស្វែងរកឯកសារត្រូវបានបើក
      - ការតាមដាន និងត្រួតពិនិត្យត្រូវបានកំណត់

3. **រួចរាល់សម្រាប់ការកែតម្រូវ:**

      - ស៊ុមការ​ងារសម្រាប់បន្ថែម Loyalty Agent
      - គំរូណែនាំផ្ទាល់ខ្លួន
      - ស្គ្រីបសម្រាប់ធ្វើតេស្ត និងផ្ទៀងផ្ទាត់
      - ការកំណត់សម្រាប់ត្រួតពិនិត្យ និងវាយតម្លៃ

4. **ភាពរួចរាល់សម្រាប់ការបញ្ចេញផលិតកម្ម:**

      - ការស្កេនសន្តិសុខជាមួយ Red Teaming
      - ការត្រួតពិនិត្យប្រសិទ្ធភាព
      - ស៊ុមការវាយតម្លៃគុណភាព
      - ស្ថាបត្យកម្មដែលអាចពង្រីកបាន

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator). ក្នុងខណៈដែលយើងខំប្រឹងធ្វើឱ្យមានភាពត្រឹមត្រូវ សូមចំណាំថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមក្នុងភាសាមូលដ្ឋានគួរត្រូវបានចាត់ទុកថាជាធនធានដែលមានសុពលភាព។ សម្រាប់ព័ត៌មានសំខាន់ យើងណែនាំឱ្យប្រើការបកប្រែដោយមនុស្សជំនាញវិជ្ជាជីវៈ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសណាមួយដែលបណ្តាលមកពីការប្រើប្រាស់ការបកប្រែនេះ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->