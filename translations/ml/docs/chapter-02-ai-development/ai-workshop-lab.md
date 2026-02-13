# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

ഈ ഹാൻഡ്‌സ്-ഓൺ ലാബ് ഡെവലപ്പർമാരെ നിലവിലുള്ള ഒരു AI ടെംപ്ലേറ്റ് എടുത്ത് Azure Developer CLI (AZD) ഉപയോഗിച്ച് ഡിപ്ലോയ് ചെയ്യുന്നതിന്റെ പ്രക്രിയയിലൂടെ കൈകൊണ്ടു നയിക്കുന്നു. Microsoft Foundry സേവനങ്ങൾ ഉപയോഗിച്ച് പ്രൊഡക്ഷൻ-ലേബൽ AI ഡിപ്ലോയ്മെന്റുകളുടെ അടിസ്ഥാന പാറ്റേണുകൾ നിങ്ങള്‍ പഠിക്കും.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

ഈ വർക്ക്ഷോപ്പ് അവസാനിക്കുമ്പൊൾ നിങ്ങൾ കഴിയും:
- ✅ നിലവിലുള്ള ഒരു AI അപ്ലിക്കേഷൻ AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിക്കുന്ന വിധത്തിൽ മാറ്റാൻ
- ✅ AZD ഉപയോഗിച്ച് Microsoft Foundry സേവനങ്ങൾ കോൺഫിഗർ ചെയ്യാൻ
- ✅ AI സേവനങ്ങൾക്കുള്ള സുരക്ഷിത ക്രെഡൻഷ്യൽ മാനേജ്മെന്റ് നടപ്പാക്കാൻ
- ✅ മേൽനോട്ടത്തോടെ പ്രൊഡക്ഷൻ-റഡി AI അപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യാൻ
- ✅ സാധാരണ AI ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ ട്രബിൾഷൂട്ടുചെയ്യാൻ

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code recommended)

### Azure Resources
- Azure subscription with contributor access
- Access to Azure OpenAI services (or ability to request access)
- Resource group creation permissions

### Knowledge Prerequisites
- Basic understanding of Azure services
- Familiarity with command-line interfaces
- Basic AI/ML concepts (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
azd version

# Azure CLI പരിശോധിക്കുക
az --version

# Azure-ലേക്ക് ലോഗിൻ ചെയ്യുക
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI- റെഡി AZD ടെംപ്ലേറ്റിലെ പ്രധാന ഫയലുകൾ പരിശോധിക്കുക:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AI ഘടകങ്ങൾക്ക് സർവീസ് നിർവചനങ്ങൾ
- പരിസ്ഥിതി വേരിയബിൾ മാപ്പുകൾ
- ഹോസ്റ്റ് കോൺഫിഗറേഷനുകൾ

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Azure OpenAI service provisioning
- Cognitive Search integration
- Secure key management
- Network security configurations

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI അപ്ലിക്കേഷനുകൾക്ക് സാധാരണയായി বহু കോഓർഡിനേറ്റുചെയ്യുന്ന സേവനങ്ങൾ ആവശ്യമാകും
- **Security**: API കീകളും എന്റ്പോയിന്റുകളും സുരക്ഷിതമായി കൈകാര്യം ചെയ്യേണ്ടതാണ്
- **Scalability**: AI വർക്ക്ലോഡുകൾക്ക് പ്രത്യേക സ്കെയ്ലിംഗ് ആവശ്യകതകൾ ഉണ്ട്
- **Cost Management**: ശരിയായി കോൺഫിഗർ ചെയ്യാത്ത പക്ഷം AI സേവനങ്ങൾ ചിലവേറിയതായി മാറാം

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# നിങ്ങളുടെ ഇഷ്ടമുള്ള Azure മേഖല സെറ്റ് ചെയ്യുക
azd env set AZURE_LOCATION eastus

# ഐച്ഛികം: ഒരു പ്രത്യേക OpenAI മോഡൽ സെറ്റ് ചെയ്യുക
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Provisions Azure OpenAI service
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
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - വെബ് അപ്ലിക്കേഷനിലേക്ക് നീങ്ങുക
   - സാംപിൾ ക്വെറികൾ പരീക്ഷിക്കുക
   - AI പ്രതികരണങ്ങൾ ശരിയായി പ്രവർത്തിച്ചുണ്ടോ എന്ന് പരിശോധിക്കുക

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: നിങ്ങളുടെ ഡിപ്ലോയ്മെന്റ് വിജയിച്ചു, പക്ഷെ AI പ്രതികരിക്കുന്നില്ല.

**Common issues to check:**
1. **OpenAI API keys**: ശരിയായതായി സെറ്റ് ചെയ്തിട്ടുണ്ടോ എന്ന് പരിശോധന
2. **Model availability**: നിങ്ങളുടെ റീജിയനിൽ മോഡൽ ഒപ്ഷനല്ലെങ്കിൽ നോക്കുക
3. **Network connectivity**: സേവനങ്ങള്‍ ആശയവിനിമയത്തിന് കഴിയുന്ന നിലയിലുള്ളതാണോ എന്ന് ഉറപ്പാക്കുക
4. **RBAC permissions**: ആപ്പ് OpenAI ആക്‌സസ് ചെയ്യുന്നതിന് ആവശ്യമായ അനുമതികൾ ഉണ്ടോ എന്ന് പരിശോധിക്കുക

**Debugging commands:**
```bash
# പരിസ്ഥിതി വേരിയബിളുകൾ പരിശോധിക്കുക
azd env get-values

# ഡിപ്ലോയ്മെന്റ് ലോഗുകൾ കാണുക
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ഡിപ്ലോയ്മെന്റ് നില പരിശോധിക്കുക
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# വേറെ മോഡലിലേക്ക് മാറ്റുക (നിങ്ങളുടെ പ്രദേശത്ത് ലഭ്യമെങ്കിൽ)
azd env set AZURE_OPENAI_MODEL gpt-4

# പുതിയ ക്രമീകരണത്തോടെ വീണ്ടും വിന്യസിക്കുക
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

**Best Practice**: developmentക്കും productionക്കും വ്യത്യസ്ത കോൺഫിഗറേഷനുകൾ ഉപയോഗിക്കുക.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# ഉത്പാദനത്തിൽ സാധാരണയായി ഉയർന്ന SKU-കളാണ് ഉപയോഗിക്കുന്നത്
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# കൂടുതൽ സുരക്ഷാ ഫീച്ചറുകൾ സജീവമാക്കുക
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: ടെംപ്ലേറ്റ് development-സൗഹൃദമായി കുറഞ്ഞ ചെലവിലാക്കുക.

**Tasks:**
1. ഏത് SKUs free/basic ടയറുകളാക്കി ക്രമീകരിക്കാമെന്ന് തിരിച്ചറിയുക
2. കുറഞ്ഞ ചെലവിന് ആവശ്യമായ പരിസ്ഥിതി വേരിയബിളുകൾ കോൺഫിഗർ ചെയ്യുക
3. ഡിപ്ലോയ് ചെയ്ത് production കോൺഫിഗറേഷനുമായുള്ള ചെലവ് താരതമ്യം ചെയ്യുക

**Solution hints:**
- സാധ്യമായപ്പോൾ Cognitive Services-യ്ക്ക് F0 (free) ടയർ ഉപയോഗിക്കുക
- Development-ൽ Search Service-ക്ക് Basic ടയർ ഉപയോഗിക്കുക
- Functions-ക്ക് Consumption പ്ലാന്‍ പരിഗണിക്കുക

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: ഒരുപാട് AI അപ്ലിക്കേഷനുകൾ API കീകൾ ഹാർഡ്‌കോഡ് ചെയ്യുന്നതോ അല്ലെങ്കിൽ സുരക്ഷിതമല്ലാത്ത സ്ടോറേജ് ഉപയോഗിക്കുന്നതോ ചെയ്യുന്നു.

**AZD Solution**: Managed Identity + Key Vault ഇന്റഗ്രേഷൻ.

1. **Review the security configuration in your template:**
```bash
# Key Vault மற்றும் Managed Identity ക്രമീകരണങ്ങൾ തിരയുക
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# വെബ് അപ്ലിക്കേഷനിന് ശരിയായ ഐഡന്റിറ്റി ക്രമീകരണം ഉണ്ടായിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക
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
# Application Insights ഓട്ടോമാറ്റിക്കായി ക്രമീകരിക്കപ്പെട്ടിരിക്കണം
# ക്രമീകരണം പരിശോധിക്കുക:
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

**Task**: നിങ്ങൾ നടത്തിയ ഡിപ്ലോയ്‌മെന്റ് സുരക്ഷാ മികച്ച പ്രാക്ടീസുകൾ അനുസരിക്കുന്നുണ്ടോ എന്ന് അവലോകനം ചെയ്യുക.

**Checklist:**
- [ ] കോഡ് അല്ലെങ്കിൽ കോൺഫിഗറേഷനിൽ ഹാർഡ്‌കോഡ് ചെയ്ത സീക്രറ്റുകൾ ഇല്ല
- [ ] സേവനങ്ങൾക്ക് സർവീസ്-ടു-സേവീസ് ഓതന്റിക്കേഷനിൽ Managed Identity ഉപയോഗിക്കുന്നു
- [ ] Key Vault സൺസിറ്റീവ് കോൺഫിഗറേഷൻ സ്റ്റോർ ചെയ്യുന്നു
- [ ] നെറ്റ്‌വർക്ക് ആക്സസ് ശരിയായി മર્યാദപ്പെടുത്തılmış
- [ ] മൊനിറ്ററിംഗ് ಮತ್ತು ലോギങ് ഓൺ ആണ്

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, ഈ ചോദ്യങ്ങൾക്ക്答ിക്കുക:

1. **Application Architecture:**
   - നിങ്ങളുടെ ആപ്പ് ഏതെന്ത് AI സേവനങ്ങൾ ഉപയോഗിക്കുന്നു?
   - എന്ത് കംപ്യൂട്ട് റിസോഴ്‌സുകൾ അതിന് ആവശ്യമാണ്?
   - ഒരു ഡാറ്റാബേസ് ആവശ്യമാണ്吗?
   - സേവനങ്ങൾ തമ്മിലുള്ള ആശ്രിതത്വങ്ങൾ ഏതെന്താണ്?

2. **Security Requirements:**
   - നിങ്ങളുടെ ആപ്പ് കൈകാര്യം ചെയ്യുന്ന സെൻസിറ്റീവ് ഡാറ്റ എന്തെന്താണ്?
   - ഏതെന്തെങ്കിലും കംപ്ലയൻസ് ആവശ്യകതകളുണ്ടോ?
   - പ്രൈവറ്റ് നെറ്റ്‌വർകിങ് ആവശ്യമുണ്ടോ?

3. **Scaling Requirements:**
   - നിങ്ങളുടെ പ്രതീക്ഷിച്ചതായ ലോഡ് എത്രയാണ്?
   - ഓട്ടോ-സ്കെയ്ലിംഗ് ആവശ്യമുണ്ടോ?
   - ജില്ലയേക്കുറിച്ചുള്ള ആവശ്യകതകളുണ്ടോ?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ടെംപ്ലേറ്റ് ആരംഭിക്കുക
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

**Challenge**: ഡോക്യുമെന്റ് പ്രോസസ്സിംഗ് AI ആപ്പിനായി ഒരു AZD ടെംപ്ലേറ്റ് സൃഷ്‌ടിക്കുക.

**Requirements:**
- ഉള്ളടക്കം അനാലിസിങ്ക് Azure OpenAI
- OCR-യ്‌ക്കായി Document Intelligence
- ഡോക്യുമെന്റ് അപ്‌ലോഡുകൾക്കുള്ള Storage Account
- പ്രോസസ്സിംഗ് ലജിക്കിനുള്ള Function App
- ഉപയോക്തൃ ഇന്റർഫേസിനുള്ള Web app

**Bonus points:**
- ശരിയായ എറർ ഹാൻഡ്ലിംഗ് ചേർക്കുക
- ചെലവ് ഏകദേശം കണക്കാക്കൽ ഉൾപ്പെടുത്തുക
- മൊനിറ്ററിംഗ് ഡാഷ്‌ബോർഡുകൾ സജ്ജമാക്കുക

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Deployment fails with quota error
**Solutions:**
```bash
# നിലവിലെ ക്വോട്ടുകൾ പരിശോധിക്കുക
az cognitiveservices usage list --location eastus

# ക്വോട്ട വർധനവിന് അപേക്ഷിക്കുക അല്ലെങ്കിൽ മറ്റൊരു പ്രദേശം പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI responses fail or model deployment errors
**Solutions:**
```bash
# പ്രദേശത്തിന്റെ അടിസ്ഥാനത്തിൽ മോഡലിന്റെ ലഭ്യത പരിശോധന ചെയ്യുക
az cognitiveservices model list --location eastus

# ലഭ്യമായ മോഡലിലേക്ക് അപ്ഡേറ്റ് ചെയ്യുക
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden errors when calling AI services
**Solutions:**
```bash
# റോൾ നിയോഗങ്ങൾ പരിശോധിക്കുക
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# കാണാതിരിക്കുന്ന റോളുകൾ ചേർക്കുക
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Application Insights-ൽ പ്രകടന മെറ്റ്രിക്കുകൾ പരിശോധിക്കുക
2. Azure പോർട്ടലിൽ OpenAI സേവന മെറ്റ്രിക്കുകൾ അവലോകനം ചെയ്യുക
3. നെറ്റ്‌വർക്ക് കണക്ഷന്റിയും ലാറ്റൻസിയും സ്ഥിരീകരിക്കൂ

**Solutions:**
- സാധാരണ ക്വെറികൾക്കായി കാഷിംഗ് നടപ്പിലാക്കുക
- നിങ്ങളുടെ ഉപയോഗത്തിനനുസരിച്ച് അനുയോജ്യമായ OpenAI മോഡൽ ഉപയോഗിക്കുക
- ഉയർന്ന ലോഡിനായി റീഡ് റെപ്ലിക്കുകൾ പരിഗണിക്കുക

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: നിങ്ങളുടെ ഡിപ്ലോയ്മെന്റ് വിജയിച്ചു, പക്ഷേ അപ്ലിക്കേഷൻ 500 എററുകൾ დაბრუნിക്കുന്നു.

**Debugging tasks:**
1. അപ്ലിക്കേഷൻ ലോഗുകൾ പരിശോധിക്കുക
2. സേവന കണക്ടിവിറ്റി സ്ഥിരീകരിക്കുക
3. ഓതന്റിക്കേഷൻ ടെസ്റ്റ് ചെയ്യുക
4. കോൺഫിഗറേഷൻ അവലോകനം ചെയ്യുക

**Tools to use:**
- `azd show` for deployment overview
- Azure portal for detailed service logs
- Application Insights for application telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure പോർട്ടലിലേക്ക് പോവുക ಮತ್ತು ഈ ഘടകങ്ങളുള്ള ഡാഷ്‌ബോർഡ് സൃഷ്ടിക്കുക:
- OpenAI request count and latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Set up alerts:**
```bash
# ഉയർന്ന പിശക് നിരക്കിനുള്ള അറിയിപ്പ്
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
# ചെലവ് ഡാറ്റ ലഭിക്കാൻ Azure CLI ഉപയോഗിക്കുക
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- ബജറ്റ് അലർട്ടുകൾ സജ്ജമാക്കുക
- ഓട്ടോസ്കെയ്ലിംഗ് നയങ്ങൾ ഉപയോഗിക്കുക
- അഭ്യർത്ഥന കാഷിംഗ് നടപ്പിലാക്കുക
- OpenAI ടോക്കൻ ഉപയോഗം നിരീക്ഷിക്കുക

### **Lab Exercise 7.1: Performance Optimization**

**Task**: നിങ്ങളുടെ AI അപ്ലിക്കേഷൻ പ്രകടനവും ചെലവും ഇരുവരും മെച്ചപ്പെടുത്തുക.

**Metrics to improve:**
- ശരാശരി പ്രതികരണസമയം 20% കുറയ്ക്കുക
- മാസചെലവ് 15% വരെ കുറയ്ക്കുക
- 99.9% അപ്പോറ്റൈം നിലനിർത്തുക

**Strategies to try:**
- പ്രതികരണ കാഷിംഗ് നടപ്പിലാക്കുക
- ടോക്കൺ കാര്യക്ഷമതയ്ക്കായി പ്രോംപ്റ്റുകൾ ഒപ്റ്റിമൈസ് ചെയ്യുക
- അനുയോജ്യമായ കംപ്യൂട്ട് SKUs ഉപയോഗിക്കുക
- ശരിയായ ഓട്ടോസ്കെയ്ലിംഗ് സജ്ജീകരിക്കുക

## Final Challenge: End-to-End Implementation

### Challenge Scenario

നിങ്ങൾക്ക് നിര്‍ദേശിച്ചിരിക്കുന്നത്: പ്രൊഡക്ഷൻ-റഡി AI-പവർഡ് കസ്റ്റമർ സർവീസ് ചാറ്റ്ബോട്ട് സൃഷ്ടിക്കുന്നതെല്ലാം താഴെ നൽകപ്പെട്ട ആവശ്യകതകൾ പാലിക്കണമെന്നും.

**Functional Requirements:**
- ഉപഭോക്തൃ സംവാദത്തിനുള്ള വെബ് ഇന്റർഫെയ്‌സ്
- പ്രതികരണങ്ങൾക്ക് Azure OpenAI ഇന്സ്റ്റന്റുയേഷൻ
- Cognitive Search ഉപയോഗിച്ച് ഡോക്യുമെന്റ് സെർച്ച് കഴിവ്
- നിലവിലുള്ള കസ്റ്റമർ ഡേറ്റാബേസുമായി ഇന്റഗ്രേഷൻ
- ബഹുഭാഷാ പിന്തുണ

**Non-Functional Requirements:**
- 1000 ഒരേസമയം കൺകറന്റ് യൂസർ കൈകാര്യം ചെയ്യുക
- 99.9% അപ്പോറൈം SLA
- SOC 2 കമ്മപ്ലയൻസ്
- മാസ ചെലവ് $500-നക ക്യർ പ്രകാരം താഴെ
- നിരവധി എൻവയറൺമെന്റുകളിൽ (dev, staging, prod) ഡിപ്ലോയ്മെന്റ്

### Implementation Steps

1. ആർക്കിടെക്ചർ ഡിസൈൻ ചെയ്യുക
2. AZD ടെംപ്ലേറ്റ് സൃഷ്ടിക്കുക
3. സുരക്ഷാ നടപടിക്രമങ്ങൾ നടപ്പിൽ വരുത്തുക
4. മൊനിട്ടറിംഗ് आणि അലേർട്ടിംഗ് സജ്ജമാക്കുക
5. ഡിപ്ലോയ്‌മെന്റ് പൈപ്‌ലൈൻകൾ സൃഷ്ടിക്കുക
6. സൊല്യൂഷൻ ഡോക്യുമെന്റ് ചെയ്യുക

### Evaluation Criteria

- ✅ **Functionality**: എല്ലാ ആവശ്യങ്ങൾക്കും ഇത് അനുയോജ്യമാണോ?
- ✅ **Security**: മികച്ച പ്രാക്ടീസുകൾ നടപ്പിലാക്കി了吗?
- ✅ **Scalability**: ഇത് ലോഡ് കൈകാര്യം ചെയ്യാൻ കഴിയുമോ?
- ✅ **Maintainability**: കോഡ്യും ഇൻഫ്രാസ്ട്രക്ചറും നല്ല രീതിയിൽ ക്രമീകരിച്ചിട്ടുണ്ടോ?
- ✅ **Cost**: നിശ്ചിത ബഡ്ജറ്റിനുള്ളിൽ ഇതു കഴിയുമോ?

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
അഭിനന്ദനങ്ങൾ! നിങ്ങൾ AI Workshop Lab പൂർത്തിയാക്കുകയുണ്ടായി. ഇപ്പോൾ നിങ്ങൾക്ക് താഴെ പറയുന്ന കാര്യങ്ങൾ ചെയ്യാൻ കഴിയും:

- ✅ നിലവിലുള്ള AI അപ്ലിക്കേഷനുകൾ AZD ടെംപ്ലേറ്റുകളാക്കി മാറ്റുക
- ✅ പ്രൊഡക്ഷൻ-റഡിയായ AI അപ്ലിക്കേഷനുകൾ വിന്യസിക്കുക
- ✅ AI വർക്ക്ലോഡ്‌സിനുള്ള സുരക്ഷാ മികച്ച നിലവാരങ്ങള വിവരങ്ങൾ നടപ്പിലാക്കുക
- ✅ AI അപ്ലിക്കേഷനുകളുടെ പ്രകടനം നിരീക്ഷിക്കുകയും മെച്ചപ്പെടുത്തുകയും ചെയ്യുക
- ✅ സാധാരണ വിന്യാസ പ്രശ്നങ്ങൾ പരിഹരിക്കുക

### അടുത്ത ചുവടുകൾ
1. ഈ മാതൃകകൾ നിങ്ങളുടെ സ്വന്തം AI പദ്ധതികളിൽ പ്രയോഗിക്കുക
2. 템്പ്ലേറ്റുകൾ സമൂഹത്തിന് തിരിച്ച് സംഭാവന ചെയ്യുക
3. Support തുടരുന്നതിനായി Microsoft Foundry Discord-ൽ ചേരുക
4. മൾട്ടി-റീജിയൻ വിന്യാസങ്ങൾ പോലുള്ള ഉയർന്ന തലത്തിലുള്ള വിഷയങ്ങൾ പരിശോധിക്കുക

---

**വർക്‌ഷോപ്പ് പ്രതികരണം**: ഈ വർക്ക്‌ഷോപ്പ് മെച്ചപ്പെടുത്താൻ നിങ്ങളുടെ അനുഭവം [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) ൽ പങ്കുവെച്ച് ഞങ്ങളെ സഹായിക്കുക.

---

**Chapter Navigation:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**സഹായം വേണോ?** AZD-നും AI വിന്യാസങളുമായി ബന്ധപ്പെട്ട സഹായത്തിനും ചര്‍ച്ചകൾക്കും ഞങ്ങളുടെ സമൂഹത്തില്‍ ചേരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:
ഈ ഡോക്യുമെന്റ് AI പരിഭാഷാ സേവനമായ [Co‑op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം കൃത്യതയ്ക്ക് ശ്രമിച്ചതായിരുന്നിട്ടും, സ്വയംചാലിത(ഓട്ടോമേറ്റഡ്) പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അപൂർവമായ തെറ്റുകൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട് എന്ന് ദയവായി മനസിലാക്കുക. തദ്ദേശഭാഷയിലെ മൂലരൂപം ഔദ്യോഗികവും വിശ്വാസയോഗ്യവുമായ ഉറവിടവുമാണ് കരുതേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യപരിഭാഷ നിർബന്ധമായി ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ചതിനാൽ ഉണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണങ്ങളിലേക്കോ വിനുൽവ്യാഖ്യാനങ്ങളിലേക്കോ നമ്മുടെ ഉത്തരവാദിത്തം ഇല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->