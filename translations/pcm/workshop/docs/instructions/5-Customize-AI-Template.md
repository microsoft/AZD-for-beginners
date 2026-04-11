# 5. Customize a Template

!!! tip "BY THE END OF THIS MODULE YOU GO FIT DO"

    - [ ] Explored di default AI Agent Capabilities
    - [ ] Added AI Search wit your own index
    - [ ] Activated and analyzed Tracing metrics
    - [ ] Executed an evaluation run
    - [ ] Executed a red-teaming scan
    - [ ] **Lab 5: Build Customization Plan** 

---

## 5.1 Wetin AI Agent Fit Do

!!! success "We don complete dis for Lab 01"

- **File Search**: OpenAI built-in file search wey dem dey use to get knowledge
- **Citations**: Automatic source attribution for responses
- **Customizable Instructions**: Change agent behaviour and personality
- **Tool Integration**: Extensible tool system to add custom capabilities

---

## 5.2 Options to fetch knowledge

!!! task "To finish dis we need make changes and redeploy"    
    
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

- E dey built-in for Foundry Agents
- Documents go process and index automatically
- No extra configuration needed

**Azure AI Search (Optional):**

- Hybrid semantic and vector search
- You fit manage custom index
- Advanced search capabilities
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "To finish dis we need make changes and redeploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integration wit OpenTelemetry
- Track request/response
- Performance metrics
- You fit see am for Microsoft Foundry portal

**Logging:**

- App logs dey for Container Apps
- Structured logging wit correlation IDs
- You fit view logs live and past logs

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Built-in evaluators to check quality
- Custom evaluation scripts
- Performance benchmarking

**Continuous Monitoring:**

- Automatic evaluation of live interactions
- Track quality metrics
- Detect performance regressions

**CI/CD Integration:**

- GitHub Actions workflow
- Automated testing and evaluation
- Statistical comparison testing

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automated security scanning
- Risk assessment for AI systems
- Safety evaluation across multiple categories

**Authentication:**

- Managed Identity for Azure services
- Optional Azure App Service authentication
- Basic auth fallback for development



!!! quote "BY THE END OF THIS LAB YOU GO GET"
    - [ ] Define your scenario requirements
    - [ ] Customized env variables (config)
    - [ ] Customized agent instructions (task)
    - [ ] Deployed the customized template (app)
    - [ ] Completed post-deployment tasks (manual)
    - [ ] Run a test evaluation

This example dey show how to customize di template for enterprise retail use case wit two special agents and multiple model deployments.

---

## 5.6 Customize am for you!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: De help customers find and compare products
   - Loyalty Agent: De manage customer rewards and promotions

#### **Model Deployments:**

   - `gpt-4.1`: Na di main chat model
   - `o3`: Reasoning model for complex queries
   - `gpt-4.1-nano`: Lightweight model for simple interactions
   - `text-embedding-3-large`: High-quality embeddings wey good for search

#### **Features:**

   - Tracing and monitoring don enable
   - AI Search for product catalog
   - Evaluation framework for quality assurance
   - Red teaming to validate security

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create di setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set di environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure di region (choose based on which model dey available)
azd env set AZURE_LOCATION "eastus2"

# Enable all di optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure di primary chat model (gpt-4.1 na di closest wey dey available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure di embedding model for better search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set di agent name (dis go create di first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure di search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

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

#### 5.6.2.3: Deployment Script

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Make sure say di tins wey dem need dey
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up di environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check how much quota dey for di region wey dem select
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

# Deploy di infrastructure and di application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Collect di outputs wey di deployment give
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get di web app URL
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

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Comot deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Steps to set am up by hand
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

### 5.6.3: Testing and Validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Make sure say environment variables don set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test if web app dey available
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

# Run evaluation if e don configure
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

### 5.6.4 Wetin to Expect

After you follow dis implementation guide, you go get:

1. **Infrastructure wey dem don deploy:**

      - Microsoft Foundry project wey get model deployments
      - Container Apps wey dey host di web application
      - AI Search service for product catalog
      - Application Insights for monitoring

2. **Initial Agent:**

      - Shopper Agent wey dem configure with basic instructions
      - File search capability don enable
      - Tracing and monitoring don configure

3. **Ready for Customization:**

      - Framework to add Loyalty Agent
      - Custom instruction templates
      - Testing and validation scripts
      - Monitoring and evaluation setup

4. **Production Readiness:**

      - Security scanning wit red teaming
      - Performance monitoring
      - Quality evaluation framework
      - Scalable architecture

This example show how di AZD template fit extend and customize for specific enterprise scenarios while you still dey follow best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don get translated by AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg note say automated translations fit get errors or inaccuracies. Treat di original document for im native language as di main authoritative source. If na critical information, e better make professional human translator do di translation. We no dey liable for any misunderstanding or misinterpretation wey fit arise from the use of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->