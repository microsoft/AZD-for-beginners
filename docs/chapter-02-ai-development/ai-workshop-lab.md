# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

This hands-on lab guides developers through the process of taking an existing AI template and deploying it using Azure Developer CLI (AZD). You'll learn essential patterns for production AI deployments using Microsoft Foundry services.

> **Release review (2026-11-04):** The AZD command guidance and sample configuration names were checked against the `azd` `1.37.2` release and the linked sample's current configuration. This is a documentation review, not a live deployment validation. The RAG lab does not require the agent extension; for agent evaluations, use the separate `azure.ai.evaluations` extension and [current evaluation workflow](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), not legacy agent evaluation commands.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

By the end of this workshop, you will be able to:
- ✅ Explore an existing AI AZD template and plan conversion of your own application
- ✅ Configure Microsoft Foundry services with AZD
- ✅ Implement secure credential management for AI services
- ✅ Deploy an AI reference application with monitoring
- ✅ Troubleshoot common AI deployment issues

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code recommended)

These command blocks use Bash syntax (including line continuations and `grep`). On Windows, use Git Bash/WSL or translate them to PowerShell. Also install the language, package-manager, and container tools listed in the [sample's local environment setup](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure Resources
- Azure subscription with resource provisioning and role-assignment permissions (Contributor alone cannot create RBAC assignments; use an authorized role administrator or the sample's documented equivalent)
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
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
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
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

The checked-out sample can change; `.azure/` appears after environment initialization, not necessarily in a fresh clone. Inspect the actual checkout rather than creating missing directories to match this schematic.

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
- Azure AI Search integration
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
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Provisions Microsoft Foundry Models service
- ✅ Creates Azure AI Search service
- ✅ Sets up Azure Container Apps for the backend and bundled frontend (the current sample default)
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
1. **Authentication**: Verify the managed identity and role assignments; only check API keys if you deliberately enabled key-based authentication
2. **Model availability**: Check if your region supports the model
3. **Network connectivity**: Ensure services can communicate
4. **RBAC permissions**: Verify the app can access OpenAI

**Debugging commands:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Add additional AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

The following is an illustrative fragment, not a complete template. The sample may already provision document-processing services: inspect its current infrastructure before adding duplicate resources. Custom additions require wiring outputs, identities, and application configuration.

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
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

These names come from the sample's [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` stores a value but does not make an arbitrary variable effective: the template must consume it. Review the sample's [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) before disabling public access, and use `azd up` to apply infrastructure changes. OpenAI SKU `S0` alone does not determine model throughput; model deployment type and capacity also matter.

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Configure the template for cost-effective development.

**Tasks:**
1. Select the disposable workshop environment: `azd env select myai-workshop`.
2. Record current Search SKU and model capacity from `infra/main.parameters.json` and the selected environment.
3. Use the supported inputs below, after confirming model/region quota:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verify the Search SKU and deployment capacity in the portal and estimate the difference with the pricing calculator. Do not expect billing data to update immediately.

**Success criteria:** Search uses Basic, the chat deployment has the requested supported capacity, and the app still answers a sample question. Capacity `10` is a rate-limit allocation, not a token price discount. Search tier changes can be restricted or require recreation; do not experiment on production resources. F0 is service-specific and is not an Azure OpenAI model SKU.

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Many AI apps hardcode API keys or use insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Review the security configuration in your template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** using the sample's supported network configuration (if not already configured).

For your own template, this illustrative fragment shows the OpenAI endpoint connection. It also needs a VNet, private DNS configuration, and application connectivity; do not paste it unchanged into the sample, which already has private-endpoint modules:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Enable the sample's Application Insights integration:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

The sample's instrumentation emits telemetry; an arbitrary `OPENAI_MONITOR_ENABLED` setting does not enable AI metrics. Review traces for model calls, latency, failures, and token usage, and avoid recording sensitive prompts or responses.

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

**Scaffold only:** This section does not provide API/web application source, host infrastructure, model deployments, identity/RBAC, or a finished `main.parameters.json`. The resource-group-scoped Bicep illustrates module composition; a typical AZD subscription-scoped entry point must create a resource group and invoke it at that scope. Do not expect `azd up` to deploy a complete app after copying only these fragments. For a runnable baseline, keep using the RAG template from Module 1.

1. **Create the basic structure:**
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
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI responses fail or model deployment errors
**Solutions:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden errors when calling AI services
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

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Check Application Insights for performance metrics
2. Review OpenAI service metrics in Azure portal
3. Verify network connectivity and latency

**Solutions:**
- Implement caching for common queries
- Use appropriate OpenAI model for your use case
- Scale application replicas only after checking model RPM/TPM limits; Azure OpenAI deployments do not expose a generic database-style "read replica" setting

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

Verify the component emits request telemetry and add an action group if notifications are required. The metric is a count, not a failure percentage; a rate alert needs a suitable query and denominator.

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Replace the date placeholders. Consumption API support varies by billing agreement; use Cost Management in the portal if usage details are unavailable. Costs are delayed, not a real-time test oracle.

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
- Define a 99.9% availability SLO and a measurement window (a short lab cannot demonstrate monthly uptime)

**Strategies to try:**
- Implement response caching
- Optimize prompts for token efficiency
- Use appropriate compute SKUs
- Set up proper autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

This is an **optional architecture/design challenge**, not a supplied runnable exercise or a production certification. Propose an AI-powered customer service chatbot and document which requirements need further implementation and evidence:

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

These are hypothetical stakeholder constraints, not simultaneously guaranteed outcomes. Define request rate, prompt/output sizes, and session duration before estimating costs; 1,000 concurrent users does not establish a workload or prove a $500 budget is feasible. SOC 2 is an organizational audit outcome, not a switch enabled by an AZD template. Identify trade-offs and reject infeasible constraints with evidence.

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Are implemented capabilities demonstrated and remaining gaps explicit?
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
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Checkpoint

Congratulations! You've completed the AI Workshop Lab. You should now be able to:

- ✅ Explain how to adapt an existing AI application to an AZD template
- ✅ Deploy and test an AI reference application
- ✅ Implement security best practices for AI workloads
- ✅ Monitor and optimize AI application performance
- ✅ Troubleshoot common deployment issues

**Clean up:** Run `azd env list`, select each disposable environment created in this lab (`myai-workshop`, and if deployed `myai-production`/`myai-quota-test`), and run `azd down` in each. Review the deletion plan; deleting an environment's local configuration alone does not delete Azure resources. Avoid `--purge` unless you understand irreversible soft-deleted resource removal.

### Next Steps
1. Apply these patterns to your own AI projects
2. Contribute templates back to the community
3. Join the Microsoft Foundry Discord for ongoing support
4. Explore advanced topics like multi-region deployments

---

**Workshop Feedback**: Help us improve this workshop by sharing your experience in the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community for support and discussions about AZD and AI deployments.
