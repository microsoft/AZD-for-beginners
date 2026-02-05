# AI Workshop Lab: How to Make Your AI Solution Fit AZD Deployment

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

## Workshop Overview

Dis lab go show developers how dem go use one AI template wey dey already and deploy am wit Azure Developer CLI (AZD). You go learn di main ways wey dem dey use deploy AI for production wit Microsoft Foundry services.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Small knowledge of Azure, sabi AI/ML concepts small

## 🎓 Wetin You Go Learn

By di end of dis workshop, you go fit:
- ✅ Change one AI app wey dey already to dey use AZD templates
- ✅ Set up Microsoft Foundry services wit AZD
- ✅ Use secure way manage credentials for AI services
- ✅ Deploy AI apps wey ready for production wit monitoring
- ✅ Solve wahala wey dey common for AI deployment

## Wetin You Need Before You Start

### Tools Weh You Go Need
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) don install
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) don install
- [Git](https://git-scm.com/) don install
- Code editor (VS Code na di one wey dem recommend)

### Azure Resources
- Azure subscription wey get contributor access
- Access to Azure OpenAI services (or fit request access)
- Permission to create resource group

### Knowledge Weh You Go Need
- Small sabi of Azure services
- Small sabi of command-line interfaces
- Small sabi of AI/ML concepts (APIs, models, prompts)

## Lab Setup

### Step 1: Prepare Your Environment

1. **Check say tools don install:**
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

## Module 1: How AZD Structure for AI Apps Be

### Di Main Files for AI AZD Template

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

### **Lab Exercise 1.1: Check Di Configuration**

1. **Look di azure.yaml file:**
```bash
cat azure.yaml
```

**Wetin You Go Check:**
- Service definitions for AI components
- Environment variable mappings
- Host configurations

2. **Look di main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Di Main AI Patterns Weh You Go See:**
- Azure OpenAI service provisioning
- Cognitive Search integration
- Secure key management
- Network security configurations

### **Discussion Point:** Why Dis Patterns Important for AI

- **Service Dependencies**: AI apps dey need many services wey go work together
- **Security**: API keys and endpoints need secure management
- **Scalability**: AI workloads dey need special scaling
- **Cost Management**: AI services fit cost plenty if dem no configure well

## Module 2: Deploy Your First AI App

### Step 2.1: Start Di Environment

1. **Create new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set di parameters wey you need:**
```bash
# Choose di Azure region wey you like
azd env set AZURE_LOCATION eastus

# Optional: Choose specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy Di Infrastructure and App

1. **Deploy wit AZD:**
```bash
azd up
```

**Wetin dey happen when you run `azd up`:**
- ✅ Azure OpenAI service go dey provision
- ✅ Cognitive Search service go dey create
- ✅ App Service go dey set up for di web app
- ✅ Networking and security go dey configure
- ✅ Application code go dey deploy
- ✅ Monitoring and logging go dey set up

2. **Check di deployment progress** and note di resources wey dem dey create.

### Step 2.3: Confirm Say Deployment Work

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
   - Confirm say AI dey respond well

### **Lab Exercise 2.1: Practice Troubleshooting**

**Scenario**: Deployment work but di AI no dey respond.

**Common wahala wey you fit check:**
1. **OpenAI API keys**: Confirm say dem set well
2. **Model availability**: Check if di model dey your region
3. **Network connectivity**: Make sure services fit talk to each other
4. **RBAC permissions**: Confirm say di app fit access OpenAI

**Debugging commands:**
```bash
# Check environment variables
azd env get-values

# See deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Change AI Apps to Fit Your Needs

### Step 3.1: Change Di AI Configuration

1. **Update di OpenAI model:**
```bash
# Change am to another model (if e dey available for your area)
azd env set AZURE_OPENAI_MODEL gpt-4

# Deploy am again wit di new configuration
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
# Production dey usually use higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Make extra security features dey work
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Manage Cost Well**

**Challenge**: Configure di template to save money for development.

**Tasks:**
1. Find di SKUs wey fit dey free/basic tiers
2. Set environment variables to reduce cost
3. Deploy and compare di cost wit production configuration

**Solution hints:**
- Use F0 (free) tier for Cognitive Services if e dey possible
- Use Basic tier for Search Service for development
- Fit use Consumption plan for Functions

## Module 4: Security and Best Practices for Production

### Step 4.1: Manage Credentials Securely

**Di Wahala Now**: Many AI apps dey hardcode API keys or dey use insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Check di security configuration for your template:**
```bash
# Check for Key Vault and Managed Identity setup
grep -r "keyVault\|managedIdentity" infra/
```

2. **Confirm say Managed Identity dey work:**
```bash
# Check say di web app get di correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if dem never configure am):

Add am to your bicep template:
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
# Application Insights suppose configure by itself
# Check di configuration:
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

**Task**: Check your deployment for security best practices.

**Checklist:**
- [ ] No hardcoded secrets for code or configuration
- [ ] Managed Identity dey for service-to-service authentication
- [ ] Key Vault dey store sensitive configuration
- [ ] Network access dey restricted well
- [ ] Monitoring and logging dey enabled

## Module 5: Change Your Own AI App

### Step 5.1: Assessment Worksheet

**Before you change your app**, answer dis questions:

1. **App Architecture:**
   - Which AI services your app dey use?
   - Which compute resources e need?
   - E need database?
   - Wetin be di dependencies between services?

2. **Security Requirements:**
   - Which sensitive data your app dey handle?
   - Wetin be di compliance requirements?
   - You need private networking?

3. **Scaling Requirements:**
   - Wetin be di expected load?
   - You need auto-scaling?
   - Any regional requirements dey?

### Step 5.2: Create Your AZD Template

**Follow dis pattern to change your app:**

1. **Create di basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Start AZD template
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
- Add error handling well
- Include cost estimation
- Set up monitoring dashboards

## Module 6: Solve Common Wahala

### Common Deployment Wahala

#### Wahala 1: OpenAI Service Quota Don Finish
**Symptoms:** Deployment fail wit quota error
**Solutions:**
```bash
# Check di current quotas
az cognitiveservices usage list --location eastus

# Ask for quota increase or try another region
azd env set AZURE_LOCATION westus2
azd up
```

#### Wahala 2: Model No Dey for Region
**Symptoms:** AI response fail or model deployment error
**Solutions:**
```bash
# Check model wey dey available for di area
az cognitiveservices model list --location eastus

# Update am to di model wey dey available
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Wahala 3: Permission Wahala
**Symptoms:** 403 Forbidden errors when you dey call AI services
**Solutions:**
```bash
# Check wetin dem assign for role
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add roles wey dey miss
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Wahala

#### Wahala 4: AI Response Slow
**Steps to Investigate:**
1. Check Application Insights for performance metrics
2. Look OpenAI service metrics for Azure portal
3. Confirm network connectivity and latency

**Solutions:**
- Use caching for common queries
- Use di correct OpenAI model for your use case
- Fit use read replicas for high-load scenarios

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Deployment work, but di app dey return 500 errors.

**Debugging tasks:**
1. Check application logs
2. Confirm service connectivity
3. Test authentication
4. Look configuration

**Tools wey you go use:**
- `azd show` for deployment overview
- Azure portal for detailed service logs
- Application Insights for application telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Full Monitoring

1. **Create custom dashboards:**

Go Azure portal and create dashboard wey get:
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

### Step 7.2: Manage Cost Well

1. **Check di current cost:**
```bash
# Use Azure CLI to collect cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Use cost controls:**
- Set up budget alerts
- Use autoscaling policies
- Use request caching
- Monitor token usage for OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Make your AI app better for performance and cost.

**Metrics wey you go improve:**
- Reduce average response time by 20%
- Reduce monthly cost by 15%
- Maintain 99.9% uptime

**Strategies wey you fit try:**
- Use response caching
- Optimize prompts for token efficiency
- Use di correct compute SKUs
- Set up autoscaling well

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Dem don give you task to create production-ready AI-powered customer service chatbot wey get dis requirements:

**Functional Requirements:**
- Web interface for customer interactions
- Integration wit Azure OpenAI for responses
- Document search wit Cognitive Search
- Fit work wit existing customer database
- Multi-language support

**Non-Functional Requirements:**
- Fit handle 1000 users at di same time
- 99.9% uptime SLA
- SOC 2 compliance
- Cost no pass $500/month
- Deploy to different environments (dev, staging, prod)

### Implementation Steps

1. **Design di architecture**
2. **Create di AZD template**
3. **Set up security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document di solution**

### Evaluation Criteria

- ✅ **Functionality**: E meet all requirements?
- ✅ **Security**: Best practices dey?
- ✅ **Scalability**: E fit handle di load?
- ✅ **Maintainability**: Code and infrastructure dey organized well?
- ✅ **Cost**: E dey within budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
Congrats! You don finish di AI Workshop Lab. You suppose fit do dis kain tins now:

- ✅ Change AI apps wey dey already to AZD templates
- ✅ Deploy AI apps wey ready for production
- ✅ Put security best practices for AI workloads
- ✅ Check and make AI app performance better
- ✅ Solve common deployment wahala

### Wetin You Go Do Next
1. Use dis patterns for your own AI projects
2. Add templates back to di community
3. Join di Microsoft Foundry Discord for support wey no dey finish
4. Learn advanced tins like multi-region deployments

---

**Workshop Feedback**: Make we sabi how we go take make dis workshop better by sharing your experience for di [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

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
Dis dokyument don use AI transle-shun service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shun. Even though we dey try make am correct, abeg sabi say AI transle-shun fit get mistake or no dey accurate well. Di original dokyument wey dey for im native language na di one wey you go take as di correct source. For important mata, e good make you use professional human transle-shun. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shun.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->