# AI Workshop Lab: How to make your AI solution dem fit deploy wit AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Dis hands-on lab go guide developers paso passo on how dem go take one existing AI template an deploy am wit Azure Developer CLI (AZD). You go learn important patterns wey production AI deployments dey use for Microsoft Foundry services.

> **Validation note (2026-03-25):** Dis workshop don review against `azd` `1.23.12`. If your local installation old pass dat, update AZD before you start make auth, template, an deployment workflow match the steps wey dey below.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, sabi small AI/ML concepts

## 🎓 Learning Objectives

By the time you finish this workshop, you go fit:
- ✅ Convert one existing AI application make e use AZD templates
- ✅ Configure Microsoft Foundry services wit AZD
- ✅ Implement secure credential management for AI services
- ✅ Deploy production-ready AI applications wit monitoring
- ✅ Troubleshoot common AI deployment wahala

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code recommended)

### Azure Resources
- Azure subscription wey get contributor access
- Access to Microsoft Foundry Models services (or ability to request access)
- Resource group creation permissions

### Knowledge Prerequisites
- Basic understanding of Azure services
- Comfortable wit command-line interfaces
- Basic AI/ML concepts (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Check if AZD don install
azd version

# Check if Azure CLI don install
az --version

# Login to Azure make AZD workflow dem fit run
azd auth login

# Only login to Azure CLI if you wan run az commands when you dey do diagnostics
az login
```

If you dey work across multiple tenants or your subscription no show automatically, try again wit `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Check the important files wey dey one AI-ready AZD template:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**Wetin you suppose look for:**
- Service definitions for AI components
- Environment variable mappings
- Host configurations

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns make you identify:**
- Microsoft Foundry Models service provisioning
- Azure AI Search integration
- Secure key management
- Network security configurations

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI apps dey need many services wey gats work together
- **Security**: API keys and endpoints gats manage secure
- **Scalability**: AI workloads get special scaling needs
- **Cost Management**: AI services fit kpai money if you no configure dem well

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Choose di Azure region wey you prefer
azd env set AZURE_LOCATION eastus

# If you wan: Set di particular OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy wit AZD:**
```bash
azd up
```

**Wetin dey happen during `azd up`:**
- ✅ Provisions Microsoft Foundry Models service
- ✅ Creates Azure AI Search service
- ✅ Sets up App Service for the web application
- ✅ Configures networking and security
- ✅ Deploys application code
- ✅ Sets up monitoring and logging

2. **Monitor the deployment progress** an note the resources wey dem dey create.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Open the web endpoint wey show for the `azd show` output.

3. **Test the AI functionality:**
   - Go the web application
   - Try sample queries
   - Confirm say AI responses dey work

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Your deployment succeed but the AI no dey respond.

**Common issues make you check:**
1. **OpenAI API keys**: Make sure dem set correct
2. **Model availability**: Check if your region dey support the model
3. **Network connectivity**: Make sure services fit talk to each other
4. **RBAC permissions**: Confirm the app get access to OpenAI

**Debugging commands:**
```bash
# Make sure say environment variables dey correct
azd env get-values

# Check the deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Make sure say OpenAI deployment status dey
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Change to anoda model (if e dey for your area)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redeploy wit di new configuration
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` make you add Document Intelligence:

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Make development and production get different configurations.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# For production dem dey usually use higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Make you turn on extra security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Configure the template make e cheap for development.

**Tasks:**
1. Find which SKUs you fit set to free/basic tiers
2. Configure environment variables make cost small
3. Deploy an compare costs with the production configuration

**Solution hints:**
- Use F0 (free) tier for Azure AI Services when you fit
- Use Basic tier for Search Service for development
- Think of using Consumption plan for Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Plenty AI apps dey hardcode API keys or dem dey store am insecurely.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Review the security configuration inside your template:**
```bash
# Find di Key Vault and Managed Identity setup
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity dey work:**
```bash
# Make sure say di web app get di correct identity setup
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if e never set):

Add to your bicep template:
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

1. **Configure Application Insights:**
```bash
# Application Insights suppose dey configured automatically
# Check di configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

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

**Task**: Review your deployment make sure security best practices dey.

**Checklist:**
- [ ] No secret wey dem don hardcode for code or config
- [ ] Managed Identity dey used for service-to-service authentication
- [ ] Key Vault dey store sensitive configuration
- [ ] Network access don restrict well
- [ ] Monitoring and logging don enable

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before you convert your app**, answer these questions:

1. **Application Architecture:**
   - Which AI services your app dey use?
   - Which compute resources e need?
   - E need database?
   - Wetin be the dependencies between services?

2. **Security Requirements:**
   - Which sensitive data your app dey handle?
   - Which compliance requirements you get?
   - You need private networking?

3. **Scaling Requirements:**
   - Wetin be your expected load?
   - You need auto-scaling?
   - Any regional requirements?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Make AZD template ready
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

**Challenge**: Create one AZD template for document processing AI app.

**Requirements:**
- Microsoft Foundry Models for content analysis
- Document Intelligence for OCR
- Storage Account for document uploads
- Function App for processing logic
- Web app for user interface

**Bonus points:**
- Add better error handling
- Include cost estimation
- Set up monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Deployment fail wit quota error
**Solutions:**
```bash
# Check di current quota dem
az cognitiveservices usage list --location eastus

# Ask make dem increase di quota or try another region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI responses no dey or model deployment dey error
**Solutions:**
```bash
# Make sure say model dey available for each region
az cognitiveservices model list --location eastus

# Update to de model wey dey available
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden errors wen you dey call AI services
**Solutions:**
```bash
# Check di roles wey dem assign
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add di roles wey dey miss
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Check Application Insights for performance metrics
2. Review OpenAI service metrics for Azure portal
3. Confirm network connectivity and latency

**Solutions:**
- Implement caching for common queries
- Use the correct OpenAI model for your use case
- Consider read replicas for heavy load scenarios

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Your deployment succeed, but the application dey return 500 errors.

**Debugging tasks:**
1. Check application logs
2. Verify service connectivity
3. Test authentication
4. Review configuration

**Tools to use:**
- `azd show` for deployment overview
- Azure portal for detailed service logs
- Application Insights for application telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Go Azure portal an create dashboard wey get:
- OpenAI request count and latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Set up alerts:**
```bash
# Alert say error rate don high
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Use Azure CLI make you get info about how much e dey cost
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Set up budget alerts
- Use autoscaling policies
- Implement request caching
- Monitor token usage for OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimize your AI application for performance an cost.

**Metrics to improve:**
- Reduce average response time by 20%
- Reduce monthly costs by 15%
- Maintain 99.9% uptime

**Strategies to try:**
- Implement response caching
- Optimize prompts make dem use fewer tokens
- Use proper compute SKUs
- Set up correct autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

You get task to build production-ready AI-powered customer service chatbot wey get these requirements:

**Functional Requirements:**
- Web interface for customer interactions
- Integration wit Microsoft Foundry Models for responses
- Document search capability using Azure AI Search
- Integration wit your existing customer database
- Support many languages

**Non-Functional Requirements:**
- Handle 1000 concurrent users
- 99.9% uptime SLA
- SOC 2 compliance
- Cost under $500/month
- Deploy to multiple environments (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: E meet all requirements?
- ✅ **Security**: Dem implement best practices?
- ✅ **Scalability**: E fit handle the load?
- ✅ **Maintainability**: Code an infra tidy?
- ✅ **Cost**: E remain inside budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komyuniti Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificate wey show say you don finish

Congrats! You don finish the AI Workshop Lab. Now you suppose fit:

- ✅ Convert di existing AI applications go AZD templates
- ✅ Deploy AI apps wey ready for production
- ✅ Apply security best practices for AI workloads
- ✅ Monitor and optimize di AI app performance
- ✅ Troubleshoot common deployment wahalas

### Wetin to do next
1. Apply these patterns for your own AI projects
2. Contribute templates back to the community
3. Join the Microsoft Foundry Discord for ongoing support
4. Explore advanced tins like multi-region deployments

---

**Workshop Feedback**: Help us make this workshop beta by sharing your experience for the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community make you fit get support and yarn about AZD and AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->