# AI Workshop Lab: How to Fit Your AI Solutions to AZD Deployment

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Dis hands-on lab dey guide developers how dem go take existing AI template put am dey use Azure Developer CLI (AZD) deploy am. You go sabi di important patan dem for production AI deployments using Microsoft Foundry services.

> **Release review (2026-11-04):** Di AZD command instruction and sample configuration names dem check 'em against `azd` `1.37.2` release plus di linked sample current configuration. Na documentation review dis, no be live deployment checking. Di RAG lab no need agent extension; for agent evaluations, use di separate `azure.ai.evaluations` extension plus [current evaluation workflow](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), no use old agent evaluation commands.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, sabi AI/ML concepts

## 🎓 Learning Objectives

By di time wey you finish dis workshop, you go fit:
- ✅ Look through existing AI AZD template and plan how to convert your own app
- ✅ Setup Microsoft Foundry services with AZD
- ✅ Use secure way to manage credential for AI services
- ✅ Deploy AI reference app with monitoring
- ✅ Solve common AI deployment wahala

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code na better choice)

Dem commands wey dem write for Bash syntax (including line continuations and `grep`). For Windows, you fit use Git Bash/WSL or translate to PowerShell. You gats also install language, package-manager, and container tools wey dem list for [sample's local environment setup](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure Resources
- Azure subscription wey get resource provisioning and role-assignment permissions (Contributor alone no fit create RBAC assignments; you gats use role administrator wey get authority or wetin sample talk)
- Access to Microsoft Foundry Models services (or fit request access)
- Permission to create resource group

### Knowledge Prerequisites
- Basic understanding of Azure services
- Sabi use command-line interface
- Basic AI/ML concepts (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Check tool installations:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

If you dey work across plenty tenants or your subscription no detect automatic, try again with `azd auth login --tenant-id <tenant-id>`.

2. **Clone workshop repo:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: How AZD Structure Be for AI Applications

### Anatomy of AI AZD Template

Look key files for AI-ready AZD template:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Di sample wey dem checkout fit change; `.azure/` dey come after environment don initialize, no sure say fresh clone get am. Check the actual checkout no be to create directories wey no dey to match schematic.

### **Lab Exercise 1.1: Explore Configuration**

1. **Look di azure.yaml file:**
```bash
cat azure.yaml
```

**Wetin to dey find:**
- Service definitions for AI components
- Environment variable mappings
- Host configurations

2. **Review di main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns wey you suppose sabi:**
- Microsoft Foundry Models service provisioning
- Azure AI Search integration
- Secure key management
- Network security configurations

### **Discussion Point:** Why Dem Patterns Matter for AI

- **Service Dependencies**: AI apps need many services wey dem dey coordinate well
- **Security**: API keys and endpoints gats be managed securely
- **Scalability**: AI work get special scaling needs
- **Cost Management**: AI services fit cost well well if you no set am right

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize Environment

1. **Create new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set all necessary parameters:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**Wetin dey happen during `azd up`:**
- ✅ Microsoft Foundry Models service dey provisioned
- ✅ Azure AI Search service dey created
- ✅ Azure Container Apps setup for backend plus bundled frontend (di current sample default)
- ✅ Network and security dem dey configured
- ✅ Application code dey deployed
- ✅ Monitoring and logging dem set up

2. **Dey monitor deployment progress** and notice the resources dem dey create.

### Step 2.3: Verify Your Deployment

1. **Check di resources wey deploy:**
```bash
azd show
```

2. **Open di deployed app:**
```bash
azd show
```

Open di web endpoint wey `azd show` output show.

3. **Try test di AI functionality:**
   - Go di web app
   - Try sample queries
   - Check sey AI responses dey work

### **Lab Exercise 2.1: Troubleshooting Practice**

**Situation**: Your deployment finish well but AI no dey respond.

**Common wahalas to check:**
1. **Authentication**: Make sure managed identity and role assignments correct; check API keys only if you turn on key-based authentication purposely
2. **Model availability**: Make sure di model dey your region
3. **Network connectivity**: Make sure services fit yan to each other
4. **RBAC permissions**: Make sure app fit access OpenAI

**Commands to check:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customize AI Apps to Your Needs

### Step 3.1: Change AI Configuration

1. **Update OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Add extra AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

This one na just example fragment, no be full template. Di sample fit don already provide document-processing services: check its infrastructure before you add same resource twice. Custom addition need make outputs, identities, and app configuration connect well.

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

**Best Practice**: Different config dem for dev and production.

1. **Create production environment:**
```bash
azd env new myai-production
```

2. **Set parameters for production:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

These names come from sample [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` fit hold value but e no make any variable effective: template gats use am. Check sample [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) before you disable public access, plus use `azd up` to make infrastructure changes. OpenAI SKU `S0` alone no dey decide model throughput; deployment type and capacity still matter.

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Make template cost-effective for development.

**Tasks:**
1. Choose disposable workshop environment: `azd env select myai-workshop`.
2. Write down current Search SKU and model capacity from `infra/main.parameters.json` and chosen environment.
3. Use supported inputs below, after you check model/region quota:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Check Search SKU and deployment capacity inside portal and estimate price diff with pricing calculator. No expect billing data update immediately.

**Success criteria:** Search use Basic, chat deployment get requested capacity, and app still fit answer sample question. Capacity `10` na rate-limit allocation, no be token discount. Search tier change fit be restricted or need recreation; no try am for production resources. F0 na service-specific, no be Azure OpenAI model SKU.

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current problem**: Plenty AI apps dey hardcode API keys or store am insecurely.

**AZD Fix**: Managed Identity plus Key Vault integration.

1. **Check security config for your template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Make sure Managed Identity dey work:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Turn on private endpoints** if sample network configuration no set am before.

For your own template, dis example fragment show OpenAI endpoint connection. E still need VNet, private DNS config, plus app connection; no just paste am for sample wey get private-endpoint modules already:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Enable sample's Application Insights integration:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Sample instrumentation dey send telemetry; just set `OPENAI_MONITOR_ENABLED` no go enable AI metrics. Check traces for model calls, latency, failures, and token usage, and no record sensitive prompts or responses.

### **Lab Exercise 4.1: Security Audit**

**Task**: Review your deployment for security best practices.

**Checklist:**
- [ ] No hardcoded secrets for code or config
- [ ] Managed Identity dey used for service to service authentication
- [ ] Key Vault dey store sensitive config
- [ ] Network access dey properly restricted
- [ ] Monitoring and logging dey enabled

## Module 5: Convert Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before you convert your app**, answer dis questions:

1. **App Architecture:**
   - Wetin AI services your app dey use?
   - Wetin compute resources e need?
   - E need database?
   - Wetin be service dependencies?

2. **Security Needs:**
   - Wetin sensitive data your app handle?
   - Wetin compliance you get?
   - You need private networking?

3. **Scaling Needs:**
   - How much load you expect?
   - You need auto-scaling?
   - You get regional requirements?

### Step 5.2: Create Your AZD Template

**Follow dis pattern to convert your app:**

**Scaffold only:** Dis section no get API/web app source, host infrastructure, model deployments, identity/RBAC, or finished `main.parameters.json`. Resource-group-scoped Bicep show module composition; typical AZD subscription entry point gats create resource group and call am for that scope. No expect `azd up` make complete app after you copy only these fragments. To run base, still use RAG template from Module 1.

1. **Create basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Create AZD template for document processing AI app.

**Requirements:**
- Microsoft Foundry Models for content analysis
- Document Intelligence for OCR
- Storage Account for document uploads
- Function App for processing logic
- Web app for user interface

**Bonus points:**
- Add proper error handling
- Include cost estimation
- Setup monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Wahala

#### Wahala 1: OpenAI Service Quota Don Finish
**Symptoms:** Deployment fail dey show quota error
**Solutions:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Wahala 2: Model No Dey for Region
**Symptoms:** AI responses no wan work or model deployment get error
**Solutions:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Wahala 3: Permission Wahala
**Symptoms:** 403 Forbidden error when you try call AI services
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

#### Wahala 4: AI Responses Slow
**Steps to find problem:**
1. Check Application Insights for performance metrics
2. Look OpenAI service metrics for Azure portal
3. Check network connectivity and latency

**Solutions:**
- Use caching for common query
- Use proper OpenAI model for your case
- Scale app replicas only after you check model RPM/TPM limits; Azure OpenAI deployment no get generic "read replica" setting like database

### **Lab Exercise 6.1: Debugging Challenge**

**Situation**: Your deployment finish well, but app dey give 500 errors.

**Debugging work:**
1. Check app logs
2. Verify service connectivity
3. Test authentication
4. Review configuration

**Tools wey you fit use:**
- `azd show` for deployment overview
- Azure portal for detailed service logs
- Application Insights for application telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Make custom dashboards:**

Enter Azure portal come create dashboard wey get:
- OpenAI request count and latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Set up alerts:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Confirm say the component dey send request telemetry and add action group if you need notifications. The metric na count, no be failure percentage; a rate alert need correct query and denominator.

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Change the date placeholders. Consumption API support dey depending on your billing agreement; use Cost Management for the portal if usage details no dey. Costs dey delayed, no be real-time test oracle.

2. **Put cost controls:**
- Set up budget alerts
- Use autoscaling policies
- Implement request caching
- Monitor token usage for OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimize your AI application for both performance and cost.

**Metrics to improve:**
- Reduce average response time by 20%
- Reduce monthly costs by 15%
- Define a 99.9% availability SLO and a measurement window (short lab no fit show monthly uptime)

**Strategies to try:**
- Implement response caching
- Optimize prompts for token efficiency
- Use correct compute SKUs
- Set up proper autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

This na **optional architecture/design challenge**, no be supplied runnable exercise or production certification. Propose AI-powered customer service chatbot and talk which requirements still need more implementation and proof:

**Functional Requirements:**
- Web interface for customer interactions
- Integration with Microsoft Foundry Models for responses
- Document search capability using Azure AI Search
- Integration with existing customer database
- Multi-language support

**Non-Functional Requirements:**
- Handle 1000 concurrent users
- 99.9% uptime SLA
- SOC 2 compliance
- Cost under $500/month
- Deploy to multiple environments (dev, staging, prod)

These na hypothetical stakeholder constraints, no be sure sure guaranteed outcomes. Define request rate, prompt/output sizes, and session duration before you estimate costs; 1,000 concurrent users no mean say workload dey or $500 budget dey possible. SOC 2 na organizational audit outcome, no be switch wey AZD template fit turn on. Identify trade-offs and reject impossible constraints with proof.

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Dem show di capabilities wey dem implement and di gaps wey remain dey clear?
- ✅ **Security**: Dem follow beta security practice?
- ✅ **Scalability**: E fit handle di load?
- ✅ **Maintainability**: Di code and infrastructure dey well organize?
- ✅ **Cost**: E dey within budget?

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

## 🎓 Completion Checkpoint

Congrats! You don finish AI Workshop Lab. Now you fit:

- ✅ Explain how to adapt existing AI application to AZD template
- ✅ Deploy and test AI reference application
- ✅ Implement security best practices for AI workloads
- ✅ Monitor and optimize AI application performance
- ✅ Troubleshoot common deployment issues

**Clean up:** Run `azd env list`, select every disposable environment wey you create for this lab (`myai-workshop`, and if you deploy `myai-production`/`myai-quota-test`), then run `azd down` for all. Check the deletion plan; to delete only local configuration for environment no go delete Azure resources. Avoid `--purge` unless you sabi say the resource removal no fit reverse.

### Next Steps
1. Apply these patterns for your own AI projects
2. Contribute templates back to the community
3. Join di Microsoft Foundry Discord for ongoing support
4. Explore advanced topics like multi-region deployments

---

**Workshop Feedback**: Help us make this workshop beta by sharing your experience for the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community for support and discussions about AZD and AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->