# AI Workshop Lab: How To Make Your AI Solutions Fit For AZD Deploy

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Dis hands-on lab go show developers how dem go take AI template wey dem don get and deploy am using Azure Developer CLI (AZD). You go learn important waya dem dey do production AI deployments using Microsoft Foundry services.

> **Validation note (2026-07-13):** Dis workshop don check well well with `azd` `1.27.1`. If your local installation old pass dat, make you update AZD before you start so auth, template, and deployment waka go follow like we talk for below.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, sabi some AI/ML concepts

## 🎓 Wetin You Go Learn

By the time you finish dis workshop, you go fit:
- ✅ Change existing AI app make e use AZD templates
- ✅ Setup Microsoft Foundry services with AZD
- ✅ Do secure credential management for AI services
- ✅ Deploy AI applications ready for production with monitoring
- ✅ Solve common AI deployment wahala dem

## Wetin You Need Before You Start

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor wey good (VS Code na the best)

### Azure Resources
- Azure subscription wey get contributor access
- Access to Microsoft Foundry Models services (or you fit request access)
- Permission to create resource group

### Knowledge Prerequisites
- Basic knowledge of Azure services
- Know how command-line interface dey work
- Basic AI/ML concepts (APIs, models, prompts)

## How To Set Lab

### Step 1: Prepare Your Environment

1. **Check if your tools dey installed well:**
```bash
# Check if AZD don install
azd version

# Check Azure CLI
az --version

# Login for Azure make AZD workflow fit work
azd auth login

# Login to Azure CLI only if you wan run az commands during diagnostics
az login
```

If you dey work for many tenants or your subscription no show automatically, try again with `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understand AZD Structure for AI Applications

### Anatomy of AI AZD Template

Check the key files wey dey AI-ready AZD template:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Check The Configuration**

1. **Look the azure.yaml file:**
```bash
cat azure.yaml
```

**Wetin you suppose find:**
- Service definitions for AI parts
- Environment variable mapping dem
- Host configurations

2. **Look main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Important AI patterns to sabi:**
- Microsoft Foundry Models service setup
- Azure AI Search join
- Secure key management
- Network security setup

### **Discussion Point:** Why These Patterns Na Important for AI

- **Service Dependencies**: AI apps need plenti services to balance well
- **Security**: API keys and endpoints need to be secure
- **Scalability**: AI workloads get special scaling demands
- **Cost Management**: AI services dey cost if you no setup well

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set necessary parameters:**
```bash
# Set yu preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy Infrastructure and Application

1. **Deploy using AZD:**
```bash
azd up
```

**Wetin happen when you do `azd up`:**
- ✅ E go setup Microsoft Foundry Models service
- ✅ E go create Azure AI Search service
- ✅ E go setup App Service for web app
- ✅ E go setup networking and security
- ✅ E go deploy app code
- ✅ E go setup monitoring and logging

2. **Watch deployment progress** and notice the resources wey e dey create.

### Step 2.3: Check Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed app:**
```bash
azd show
```

Open the web URL wey `azd show` display.

3. **Test the AI function:**
   - Go the web app
   - Try sample queries
   - Confirm say AI responses dey work

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Your deployment successful but AI no dey respond.

**Common things to check:**
1. **OpenAI API keys**: Confirm say dem set correct
2. **Model availability**: Check if your region get model
3. **Network connectivity**: Make sure services fit talk each other
4. **RBAC permissions**: Confirm app fit access OpenAI

**Debugging commands:**
```bash
# Check environment variables
azd env get-values

# See deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customize AI Applications For Your Use

### Step 3.1: Change AI Configuration

1. **Update OpenAI model:**
```bash
# Change go another model (if e dey your area)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redeploy wit di new setup
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

### Step 3.2: Environment-Specific Settings

**Best Practice**: Make configurations different for development and production.

1. **Create production environment:**
```bash
azd env new myai-production
```

2. **Set production parameters:**
```bash
# Production most time dey use higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Make e possible to add more security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Configure template to make development cheap.

**Tasks:**
1. Identify which SKUs fit free/basic tiers
2. Setup environment variables to reduce cost
3. Deploy and compare cost with production config

**Solution hints:**
- Use F0 (free) tier for Azure AI Services if you fit
- Use Basic tier for Search Service in development
- Try use Consumption plan for Functions

## Module 4: Security and Best Practices for Production

### Step 4.1: Secure Credential Management

**Current problem**: Many AI apps dey hardcode API keys or dey store dem insecurely.

**AZD Solution**: Use Managed Identity + Key Vault join together.

1. **Check the security setup in your template:**
```bash
# Find Key Vault and Managed Identity configuration deh
grep -r "keyVault\|managedIdentity" infra/
```

2. **Confirm Managed Identity dey work:**
```bash
# Check if di web app get di correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** if you no don set am before:

Add am for your bicep template:
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

1. **Setup Application Insights:**
```bash
# Application Insights suppose configure by itself
# Make you check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Setup AI-specific monitoring:**

Add custom metrics for AI opretion:
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

**Task**: Check your deployment for security correct way.

**Checklist:**
- [ ] No hardcoded secrets for code or config
- [ ] Managed Identity dey for service-to-service auth
- [ ] Key Vault dey for sensitive config
- [ ] Network access dey restrict well
- [ ] Monitoring and logging dey active

## Module 5: Change Your Own AI Application To Fit AZD

### Step 5.1: Assessment Worksheet

**Before you convert your app**, answer these questions:

1. **Application Architecture:**
   - Which AI services your app dey use?
   - Which compute resources e need?
   - E need database?
   - Which dependencies between services?

2. **Security Requirements:**
   - Which sensitive data your app dey handle?
   - Which compliance rules you get?
   - You need private networking?

3. **Scaling Requirements:**
   - Which load you expect?
   - You want auto-scaling?
   - You get regional requirements?

### Step 5.2: Create Your AZD Template

**Follow dis pattern to convert your app:**

1. **Create basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Make we start AZD template
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

**Challenge**: Make AZD template for document processing AI app.

**Requirements:**
- Microsoft Foundry Models for content analysis
- Document Intelligence for OCR
- Storage Account for document upload
- Function App for processing
- Web app for user interface

**Bonus points:**
- Add good error handling
- Include cost estimation
- Setup monitoring dashboard

## Module 6: Solve Common Wahala For Deployment

### Common Deployment Wahala

#### Wahala 1: OpenAI Service Quota Finish
**Symptoms:** Deployment fail with quota error
**Solutions:**
```bash
# Check how much quota dey now
az cognitiveservices usage list --location eastus

# Request make dem increase quota or try different area region
azd env set AZURE_LOCATION westus2
azd up
```

#### Wahala 2: Model No Dey For Region
**Symptoms:** AI response fail or model deployment error
**Solutions:**
```bash
# Make sure say di model dey for di region
az cognitiveservices model list --location eastus

# Change am to di model wey dey available
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Wahala 3: Permission Denied
**Symptoms:** 403 Forbidden error when calling AI services
**Solutions:**
```bash
# Check di role wey dem assign
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add di roles wey dey miss
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Wahala

#### Wahala 4: AI Responses Slow
**Steps to check:**
1. Check Application Insights for performance data
2. Check OpenAI service metrics for Azure portal
3. Confirm network connectivity and latency

**Solutions:**
- Use caching for common queries
- Use correct OpenAI model for your case
- Think about read replicas for heavy load

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Your deployment dey work but app dey return 500 error.

**Tasks to debug:**
1. Check app logs
2. Verify service connectivity
3. Test authentication
4. Check configuration

**Tools to use:**
- `azd show` for deployment overview
- Azure portal for service logs details
- Application Insights for telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Setup Complete Monitoring

1. **Create custom dashboards:**

Go Azure portal and create dashboard with:
- OpenAI request count and latency
- App error rates
- Resource usage
- Cost tracking

2. **Setup alerts:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current cost:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Do cost controls:**
- Setup budget alerts
- Use autoscaling policies
- Implement request caching
- Monitor token use for OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimize your AI app for performance and cost.

**Metrics wey you fit improve:**
- Reduce average response time by 20%
- Reduce monthly cost by 15%
- Make uptime 99.9%

**Strategies to try:**
- Use response caching
- Optimize prompts for token use
- Use correct compute SKUs
- Setup proper autoscaling

## Final Challenge: Complete End-to-End Implementation

### Challenge Scenario

You get work to create production-ready AI customer service chatbot with these demand:

**Functional Requirements:**
- Web interface for customer interactions
- Join Microsoft Foundry Models for responses
- Document search with Azure AI Search
- Join existing customer database
- Multi-language support

**Non-Functional Requirements:**
- Fit handle 1000 users at same time
- 99.9% uptime SLA
- SOC 2 compliance
- Cost under $500/month
- Deploy to many environments (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Setup security measures**
4. **Setup monitoring and alerting**
5. **Create deployment pipelines**
6. **Write documentation**

### How They Go Judge Am

- ✅ **Functionality**: E meet all the requirements?
- ✅ **Security**: Best practices dem dey put?
- ✅ **Scalability**: E fit handle the load?
- ✅ **Maintainability**: Code and infrastructure fine well?
- ✅ **Cost**: E still dey inside budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

Congrats! You don finish di AI Workshop Lab. Now you suppose fit:

- ✅ Convert existing AI applications to AZD templates
- ✅ Deploy production-ready AI applications
- ✅ Implement security best practices for AI workloads
- ✅ Monitor and optimize AI application performance
- ✅ Troubleshoot common deployment issues

### Next Steps
1. Apply these patterns to your own AI projects
2. Contribute templates back to the community
3. Join the Microsoft Foundry Discord for ongoing support
4. Explore advanced topics like multi-region deployments

---

**Workshop Feedback**: Help us make dis workshop beta by sharing your experience for the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community for support and discussions about AZD and AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->