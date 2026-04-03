# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Current Chapter**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Previous**: [Utekelezaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Next**: [Mifano Bora ya AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Next Chapter**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Workshop Overview

This hands-on lab guides developers through the process of taking an existing AI template and deploying it using Azure Developer CLI (AZD). You'll learn essential patterns for production AI deployments using Microsoft Foundry services.

> **Validation note (2026-03-25):** This workshop was reviewed against `azd` `1.23.12`. If your local installation is older, update AZD before starting so the auth, template, and deployment workflow matches the steps below.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

By the end of this workshop, you will be able to:
- ✅ Convert an existing AI application to use AZD templates
- ✅ Configure Microsoft Foundry services with AZD
- ✅ Implement secure credential management for AI services
- ✅ Deploy production-ready AI applications with monitoring
- ✅ Troubleshoot common AI deployment issues

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code recommended)

### Azure Resources
- Azure subscription with contributor access
- Access to Microsoft Foundry Models services (or ability to request access)
- Resource group creation permissions

### Knowledge Prerequisites
- Basic understanding of Azure services
- Familiarity with command-line interfaces
- Basic AI/ML concepts (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Kagua usakinishaji wa AZD
azd version

# Kagua Azure CLI
az --version

# Ingia kwenye Azure kwa ajili ya mtiririko wa kazi za AZD
azd auth login

# Ingia kwenye Azure CLI tu ikiwa unapanga kuendesha amri za az wakati wa uchunguzi
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Explore the key files in an AI-ready AZD template:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
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

**What to look for:**
- Service definitions for AI components
- Environment variable mappings
- Host configurations

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models service provisioning
- Cognitive Search integration
- Secure key management
- Network security configurations

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI apps often require multiple coordinated services
- **Security**: API keys and endpoints need secure management
- **Scalability**: AI workloads have unique scaling requirements
- **Cost Management**: AI services can be expensive if not properly configured

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Weka mkoa wa Azure unaopendelea
azd env set AZURE_LOCATION eastus

# Hiari: Weka mfano maalum wa OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Provisions Microsoft Foundry Models service
- ✅ Creates Cognitive Search service
- ✅ Sets up App Service for the web application
- ✅ Configures networking and security
- ✅ Deploys application code
- ✅ Sets up monitoring and logging

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **Test the AI functionality:**
   - Navigate to the web application
   - Try sample queries
   - Verify AI responses are working

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Your deployment succeeded but the AI isn't responding.

**Common issues to check:**
1. **OpenAI API keys**: Verify they're correctly set
2. **Model availability**: Check if your region supports the model
3. **Network connectivity**: Ensure services can communicate
4. **RBAC permissions**: Verify the app can access OpenAI

**Debugging commands:**
```bash
# Angalia vigezo vya mazingira
azd env get-values

# Tazama kumbukumbu za usambazaji
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Angalia hali ya usambazaji wa OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Badilisha kwa modeli tofauti (ikiwa inapatikana katika eneo lako)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Anzisha tena kwa usanidi mpya
azd deploy
```

2. **Add additional AI services:**

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Different configurations for development vs production.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Mazingira ya uzalishaji kawaida hutumia SKU za juu
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Wezesha vipengele vya ziada vya usalama
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Configure the template for cost-effective development.

**Tasks:**
1. Identify which SKUs can be set to free/basic tiers
2. Configure environment variables for minimal cost
3. Deploy and compare costs with the production configuration

**Solution hints:**
- Use F0 (free) tier for Cognitive Services when possible
- Use Basic tier for Search Service in development
- Consider using Consumption plan for Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Many AI apps hardcode API keys or use insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Review the security configuration in your template:**
```bash
# Tafuta usanidi wa Key Vault na Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Angalia ikiwa programu ya wavuti ina usanidi sahihi wa utambulisho
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

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
# Application Insights inapaswa kusanidiwa kiotomatiki
# Angalia usanidi:
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

**Task**: Review your deployment for security best practices.

**Checklist:**
- [ ] No hardcoded secrets in code or configuration
- [ ] Managed Identity used for service-to-service authentication
- [ ] Key Vault stores sensitive configuration
- [ ] Network access is properly restricted
- [ ] Monitoring and logging are enabled

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, answer these questions:

1. **Application Architecture:**
   - What AI services does your app use?
   - What compute resources does it need?
   - Does it require a database?
   - What are the dependencies between services?

2. **Security Requirements:**
   - What sensitive data does your app handle?
   - What compliance requirements do you have?
   - Do you need private networking?

3. **Scaling Requirements:**
   - What's your expected load?
   - Do you need auto-scaling?
   - Are there regional requirements?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
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

**Challenge**: Create an AZD template for a document processing AI app.

**Requirements:**
- Microsoft Foundry Models for content analysis
- Document Intelligence for OCR
- Storage Account for document uploads
- Function App for processing logic
- Web app for user interface

**Bonus points:**
- Add proper error handling
- Include cost estimation
- Set up monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Deployment fails with quota error
**Solutions:**
```bash
# Angalia mipaka ya sasa
az cognitiveservices usage list --location eastus

# Omba ongezeko la mipaka au jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI responses fail or model deployment errors
**Solutions:**
```bash
# Angalia upatikanaji wa modeli kwa kanda
az cognitiveservices model list --location eastus

# Sasisha hadi modeli inayopatikana
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden errors when calling AI services
**Solutions:**
```bash
# Kagua ugawaji wa nyadhifa
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ongeza nyadhifa zilizokosekana
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Check Application Insights for performance metrics
2. Review OpenAI service metrics in Azure portal
3. Verify network connectivity and latency

**Solutions:**
- Implement caching for common queries
- Use appropriate OpenAI model for your use case
- Consider read replicas for high-load scenarios

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Your deployment succeeded, but the application returns 500 errors.

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

Navigate to Azure portal and create a dashboard with:
- OpenAI request count and latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Set up alerts:**
```bash
# Onyo kwa kiwango cha juu cha makosa
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
# Tumia Azure CLI kupata data ya gharama
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Set up budget alerts
- Use autoscaling policies
- Implement request caching
- Monitor token usage for OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimize your AI application for both performance and cost.

**Metrics to improve:**
- Reduce average response time by 20%
- Reduce monthly costs by 15%
- Maintain 99.9% uptime

**Strategies to try:**
- Implement response caching
- Optimize prompts for token efficiency
- Use appropriate compute SKUs
- Set up proper autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

You're tasked with creating a production-ready AI-powered customer service chatbot with these requirements:

**Functional Requirements:**
- Web interface for customer interactions
- Integration with Microsoft Foundry Models for responses
- Document search capability using Cognitive Search
- Integration with existing customer database
- Multi-language support

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

- ✅ **Functionality**: Does it meet all requirements?
- ✅ **Security**: Are best practices implemented?
- ✅ **Scalability**: Can it handle the load?
- ✅ **Maintainability**: Is the code and infrastructure well-organized?
- ✅ **Cost**: Does it stay within budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Programu ya Gumzo ya Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Mwongozo wa Haraka wa OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Gumzo la Contoso](https://github.com/Azure-Samples/contoso-chat)

### Rasilimali za Jamii
- [Discord ya Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub ya Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Violezo Bora za AZD](https://azure.github.io/awesome-azd/)

## 🎓 Cheti cha Kukamilisha

Hongera! Umehitimu Maabara ya Warsha ya AI. Sasa unapaswa kuwa unaweza:

- ✅ Geuza programu za AI zilizopo kuwa violezo vya AZD
- ✅ Tumia programu za AI zinazofaa kwa uzalishaji
- ✅ Tekeleza mbinu bora za usalama kwa mzigo wa kazi wa AI
- ✅ Fuatilia na boresha utendaji wa programu za AI
- ✅ Tatua matatizo ya kawaida ya utekelezaji

### Hatua Zifuatazo
1. Tumia mifano hii kwenye miradi yako ya AI
2. Changia violezo kwa jamii
3. Jiunge na Discord ya Microsoft Foundry kwa msaada endelevu
4. Chunguza mada za juu kama utekelezaji katika mikoa mingi

---

**Maoni ya Warsha**: Tusaidie kuboresha warsha hii kwa kushiriki uzoefu wako katika the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya AI Kwanza
- **⬅️ Iliyotangulia**: [Utekelezaji wa Mfano wa AI](ai-model-deployment.md)
- **➡️ Ifuatayo**: [Mbinu Bora za AI kwa Uzalishaji](production-ai-practices.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na jamii yetu kwa msaada na mijadala kuhusu utekelezaji wa AZD na AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya kibinadamu inapendekezwa. Hatuwajibiki kwa kutoelewana au tafsiri potofu zitokanazo na kutumia tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->