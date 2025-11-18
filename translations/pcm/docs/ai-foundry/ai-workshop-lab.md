<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-11-18T19:21:58+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "pcm"
}
-->
# AI Workshop Lab: How to Make Your AI Solutions Fit for AZD Deployment

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

## Workshop Overview

Dis lab go show developers how dem go take one AI template wey dey already and deploy am wit Azure Developer CLI (AZD). You go sabi di main patterns wey dem dey use for production AI deployment wit Azure AI Foundry services.

**Time wey e go take:** 2-3 hours  
**Level:** Intermediate  
**Wetin you need sabi before:** Small knowledge of Azure, and you sabi AI/ML small.

## 🎓 Wetin You Go Learn

By di time you finish dis workshop, you go fit:
- ✅ Change one AI app wey dey already to dey use AZD templates
- ✅ Set up Azure AI Foundry services wit AZD
- ✅ Use secure way to manage credentials for AI services
- ✅ Deploy AI apps wey fit production wit monitoring
- ✅ Solve common wahala wey fit happen for AI deployment

## Wetin You Need Before You Start

### Tools wey you go need
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) wey you don install
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) wey you don install
- [Git](https://git-scm.com/) wey you don install
- Code editor (VS Code na di one we recommend)

### Azure Resources
- Azure subscription wey you get contributor access
- Access to Azure OpenAI services (or you fit request access)
- Permission to create resource group

### Knowledge wey you go need
- Small understanding of Azure services
- You sabi command-line interfaces
- You sabi AI/ML small (APIs, models, prompts)

## Lab Setup

### Step 1: Prepare Your Environment

1. **Check say you don install all di tools:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clone di workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: How AZD Structure Be for AI Applications

### How AI AZD Template Be

Look di main files wey dey inside AI-ready AZD template:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Check di Configuration**

1. **Look di azure.yaml file:**
```bash
cat azure.yaml
```

**Wetin you go check:**
- Service definitions for AI components
- Environment variable mappings
- Host configurations

2. **Check di main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Di main AI patterns wey you go see:**
- Azure OpenAI service setup
- Cognitive Search integration
- Secure key management
- Network security configurations

### **Discussion Point:** Why Dis Patterns Dey Important for AI

- **Service Dependencies**: AI apps dey need many services wey go work together
- **Security**: API keys and endpoints need better way to manage dem
- **Scalability**: AI workloads dey need special way to scale
- **Cost Management**: If you no configure AI services well, e fit cost plenty money

## Module 2: Deploy Your First AI Application

### Step 2.1: Set Up di Environment

1. **Create new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set di parameters wey you need:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy di Infrastructure and Application

1. **Deploy wit AZD:**
```bash
azd up
```

**Wetin `azd up` dey do:**
- ✅ E go create Azure OpenAI service
- ✅ E go create Cognitive Search service
- ✅ E go set up App Service for di web app
- ✅ E go configure networking and security
- ✅ E go deploy di app code
- ✅ E go set up monitoring and logging

2. **Dey monitor di deployment progress** and note di resources wey dem dey create.

### Step 2.3: Check Your Deployment

1. **Check di resources wey dem deploy:**
```bash
azd show
```

2. **Open di app wey dem deploy:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test di AI functionality:**
   - Go di web app
   - Try sample queries
   - Check say di AI dey respond well

### **Lab Exercise 2.1: Practice Troubleshooting**

**Scenario**: Your deployment work but di AI no dey respond.

**Common wahala wey you fit check:**
1. **OpenAI API keys**: Make sure say dem dey set well
2. **Model availability**: Check if di model dey your region
3. **Network connectivity**: Make sure say di services fit talk to each other
4. **RBAC permissions**: Check say di app fit access OpenAI

**Debugging commands:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: How to Customize AI Applications for Your Needs

### Step 3.1: Change di AI Configuration

1. **Update di OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Add more AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Step 3.2: Configurations for Different Environments

**Best Practice**: Use different configurations for development and production.

1. **Create production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: How to Save Cost**

**Challenge**: Configure di template to save money for development.

**Tasks:**
1. Find di SKUs wey you fit set to free/basic tiers
2. Set environment variables to reduce cost
3. Deploy and compare di cost wit di production configuration

**Hints for solution:**
- Use F0 (free) tier for Cognitive Services if e dey possible
- Use Basic tier for Search Service for development
- Use Consumption plan for Functions

## Module 4: Security and Best Practices for Production

### Step 4.1: Manage Credentials Securely

**Di problem wey dey now**: Many AI apps dey put API keys for code or dey use insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Check di security configuration for your template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Make sure Managed Identity dey work:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if dem never configure am):

Add dis one to your bicep template:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Step 4.3: Monitoring and Observability

1. **Set up Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up monitoring for AI:**

Add custom metrics for AI operations:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Exercise 4.1: Security Audit**

**Task**: Check your deployment to make sure say e follow security best practices.

**Checklist:**
- [ ] No hardcoded secrets for code or configuration
- [ ] Managed Identity dey for service-to-service authentication
- [ ] Key Vault dey store sensitive configuration
- [ ] Network access dey restricted well
- [ ] Monitoring and logging dey enabled

## Module 5: How to Convert Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before you convert your app**, answer dis questions:

1. **App Architecture:**
   - Which AI services your app dey use?
   - Which compute resources e need?
   - E need database?
   - Which services dey depend on each other?

2. **Security Requirements:**
   - Which sensitive data your app dey handle?
   - Which compliance requirements you get?
   - You need private networking?

3. **Scaling Requirements:**
   - How many people go dey use am?
   - You need auto-scaling?
   - You get regional requirements?

### Step 5.2: Create Your AZD Template

**Follow dis pattern to convert your app:**

1. **Create di basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Create azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Create infrastructure templates:**

**infra/main.bicep** - Main template:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI module:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Create AZD template for document processing AI app.

**Requirements:**
- Azure OpenAI for content analysis
- Document Intelligence for OCR
- Storage Account for document uploads
- Function App for processing logic
- Web app for user interface

**Bonus points:**
- Add error handling
- Include cost estimation
- Set up monitoring dashboards

## Module 6: How to Solve Common Issues

### Common Deployment Wahala

#### Issue 1: OpenAI Service Quota Don Finish
**Symptoms:** Deployment no work because of quota error
**Solutions:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model No Dey for Region
**Symptoms:** AI no dey respond or model deployment dey fail
**Solutions:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Wahala
**Symptoms:** 403 Forbidden errors when you dey call AI services
**Solutions:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Wahala

#### Issue 4: AI Dey Respond Slow
**Steps to check:**
1. Check Application Insights for performance metrics
2. Check OpenAI service metrics for Azure portal
3. Make sure say network connectivity and latency dey okay

**Solutions:**
- Use caching for common queries
- Use di correct OpenAI model for your use case
- Use read replicas for high-load scenarios

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Your deployment work, but di app dey return 500 errors.

**Debugging tasks:**
1. Check app logs
2. Make sure services dey connect well
3. Test authentication
4. Check configuration

**Tools wey you fit use:**
- `azd show` to see deployment overview
- Azure portal to check service logs
- Application Insights to see app telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Better Monitoring

1. **Create custom dashboards:**

Go Azure portal and create dashboard wey go show:
- OpenAI request count and latency
- App error rates
- Resource usage
- Cost tracking

2. **Set up alerts:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Save Cost

1. **Check di cost wey dey now:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Control di cost:**
- Set budget alerts
- Use autoscaling policies
- Use caching for requests
- Monitor token usage for OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Make your AI app better for performance and cost.

**Metrics to improve:**
- Reduce response time by 20%
- Reduce monthly cost by 15%
- Maintain 99.9% uptime

**Strategies wey you fit try:**
- Use response caching
- Optimize prompts to save tokens
- Use di correct compute SKUs
- Set up autoscaling well

## Final Challenge: End-to-End Implementation

### Challenge Scenario

You go create one production-ready AI-powered customer service chatbot wey get dis requirements:

**Functional Requirements:**
- Web interface for customer interactions
- Use Azure OpenAI for responses
- Use Cognitive Search for document search
- Connect to existing customer database
- Support multiple languages

**Non-Functional Requirements:**
- Fit handle 1000 users at di same time
- 99.9% uptime SLA
- SOC 2 compliance
- Cost no go pass $500/month
- Deploy to different environments (dev, staging, prod)

### Steps to Implement

1. **Design di architecture**
2. **Create di AZD template**
3. **Set up security measures**
4. **Set up monitoring and alerts**
5. **Create deployment pipelines**
6. **Document di solution**

### How Dem Go Score You

- ✅ **Functionality**: E meet all di requirements?
- ✅ **Security**: E follow best practices?
- ✅ **Scalability**: E fit handle di load?
- ✅ **Maintainability**: Di code and infrastructure dey organized?
- ✅ **Cost**: E dey within budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
Congrats! You don finish di AI Workshop Lab. You suppose fit do dis kain tins now:

- ✅ Change AI apps wey dey already to AZD templates
- ✅ Deploy AI apps wey ready for production
- ✅ Put security best practices for AI workloads
- ✅ Check and make AI app performance better
- ✅ Solve wahala wey fit happen for deployment

### Wetin to do next
1. Use dis patterns for your own AI projects
2. Add templates back to di community
3. Join di Azure AI Foundry Discord for support wey no dey finish
4. Learn advanced topics like multi-region deployments

---

**Workshop Feedback**: Make di workshop better by sharing how e be for you inside [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

**Need Help?** Join our community to get support and talk about AZD and AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator) do di translation. Even as we dey try make am accurate, abeg sabi say automated translations fit get mistake or no dey correct well. Di original dokyument wey dey for im native language na di main source wey you go fit trust. For important information, e better make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->