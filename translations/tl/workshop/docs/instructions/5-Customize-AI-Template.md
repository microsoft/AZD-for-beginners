# 5. I-customize ang Template

!!! tip "SA DULO NG MODULE NA ITO, MAGAGAWA MO NA ANG"

    - [ ] Nasuri ang default na kakayahan ng AI Agent
    - [ ] Nadagdag ang AI Search gamit ang sariling index
    - [ ] Na-activate at nasuri ang Tracing metrics
    - [ ] Na-execute ang isang evaluation run
    - [ ] Na-execute ang isang red-teaming scan
    - [ ] **Lab 5: Naka-buo ng Customization Plan**

---

## 5.1 Kakayahan ng AI Agent

!!! success "Natapos na natin ito sa Lab 01"

- **File Search**: Built-in file search ng OpenAI para sa knowledge retrieval
- **Citations**: Automatic na pagbanggit ng source sa mga sagot
- **Customizable Instructions**: Pagbabago ng ugali at personalidad ng agent
- **Tool Integration**: Extensible tool system para sa custom na kakayahan

---

## 5.2 Mga Opsyon sa Knowledge Retrieval

!!! task "Para matapos ito, kailangan nating gumawa ng pagbabago at mag-redeploy"

    ```bash title=""
    # I-set ang environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # I-upload ang data at gumawa ng index

    ```

---

**OpenAI File Search (Default):**

- Built-in sa Azure AI Agent service
- Automatic na pagproseso at pag-index ng dokumento
- Walang kinakailangang karagdagang configuration

**Azure AI Search (Opsyonal):**

- Hybrid semantic at vector search
- Custom na pamamahala ng index
- Advanced na kakayahan sa paghahanap
- Kinakailangan ang `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing at Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Para matapos ito, kailangan nating gumawa ng pagbabago at mag-redeploy"

    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry integration
- Pagsubaybay sa request/response
- Performance metrics
- Available sa AI Foundry portal

**Logging:**

- Application logs sa Container Apps
- Structured logging na may correlation IDs
- Real-time at historical na pagtingin sa logs

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Built-in evaluators para sa pagsusuri ng kalidad
- Custom na evaluation scripts
- Performance benchmarking

**Continuous Monitoring:**

- Automatic na pagsusuri ng live interactions
- Pagsubaybay sa quality metrics
- Pag-detect ng performance regression

**CI/CD Integration:**

- GitHub Actions workflow
- Automated na testing at evaluation
- Statistical comparison testing

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automated na security scanning
- Pagsusuri ng risk para sa AI systems
- Safety evaluation sa iba't ibang kategorya

**Authentication:**

- Managed Identity para sa Azure services
- Opsyonal na Azure App Service authentication
- Basic auth fallback para sa development

!!! quote "SA DULO NG LAB NA ITO, DAPAT NAGAWA MO NA ANG"
    - [ ] Na-define ang mga pangangailangan ng iyong scenario
    - [ ] Na-customize ang env variables (config)
    - [ ] Na-customize ang agent instructions (task)
    - [ ] Na-deploy ang customized template (app)
    - [ ] Natapos ang post-deployment tasks (manual)
    - [ ] Na-run ang test evaluation

Ang halimbawang ito ay nagpapakita ng pag-customize ng template para sa isang enterprise retail use case na may dalawang specialized agents at maraming model deployments.

---

## 5.6 I-customize Ito Para Sa Iyo!

### 5.6.1 Mga Pangangailangan ng Scenario

#### **Agent Deployments:** 

   - Shopper Agent: Tumutulong sa mga customer na maghanap at magkumpara ng mga produkto
   - Loyalty Agent: Namamahala sa customer rewards at promotions

#### **Model Deployments:**

   - `gpt-4.1`: Pangunahing chat model
   - `o3`: Reasoning model para sa mga kumplikadong query
   - `gpt-4.1-nano`: Magaan na model para sa simpleng interaksyon
   - `text-embedding-3-large`: Mataas na kalidad na embeddings para sa search

#### **Mga Tampok:**

   - Enabled ang tracing at monitoring
   - AI Search para sa product catalog
   - Evaluation framework para sa quality assurance
   - Red teaming para sa security validation

---

### 5.6.2 Implementasyon ng Scenario

#### 5.6.2.1 Pre-Deployment Config

Gumawa ng setup script (`setup-retail.sh`)

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

#### 5.6.2.2 Mga Instruksyon ng Agent

Gumawa ng `custom-agents/shopper-agent-instructions.md`:

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

Gumawa ng `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3 Deployment Script

Gumawa ng `deploy-retail.sh`:

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

#### 5.6.2.4 Post-Deployment Config

Gumawa ng `configure-retail-agents.sh`:

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

### 5.6.3 Pagsusuri at Pagpapatunay

Gumawa ng `test-retail-deployment.sh`:

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

### 5.6.4 Inaasahang Resulta

Pagkatapos sundin ang gabay na ito, magkakaroon ka ng:

1. **Na-deploy na Infrastructure:**

      - AI Foundry project na may model deployments
      - Container Apps na nagho-host ng web application
      - AI Search service para sa product catalog
      - Application Insights para sa monitoring

2. **Initial Agent:**

      - Shopper Agent na naka-configure gamit ang basic instructions
      - Enabled ang file search capability
      - Naka-configure ang tracing at monitoring

3. **Handa Para sa Customization:**

      - Framework para sa pagdagdag ng Loyalty Agent
      - Custom na instruction templates
      - Testing at validation scripts
      - Monitoring at evaluation setup

4. **Handa Para sa Production:**

      - Security scanning gamit ang red teaming
      - Performance monitoring
      - Quality evaluation framework
      - Scalable na architecture

Ang halimbawang ito ay nagpapakita kung paano ma-extend at ma-customize ang AZD template para sa mga partikular na enterprise scenarios habang pinapanatili ang best practices para sa seguridad, monitoring, at scalability.

---

