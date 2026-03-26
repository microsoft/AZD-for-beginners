# AI Workshop Lab: Paggawing AZD-Deployable ang Iyong Mga Solusyon sa AI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Ang hands-on lab na ito ay gumagabay sa mga developer sa proseso ng pagkuha ng umiiral na AI template at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matututuhan mo ang mga mahahalagang pattern para sa production AI deployments gamit ang Microsoft Foundry services.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

Sa pagtatapos ng workshop na ito, magagawa mong:
- ✅ I-convert ang umiiral na AI application upang gumamit ng AZD templates
- ✅ I-configure ang Microsoft Foundry services gamit ang AZD
- ✅ Magpatupad ng secure credential management para sa AI services
- ✅ Mag-deploy ng production-ready AI applications na may monitoring
- ✅ Mag-troubleshoot ng karaniwang isyu sa AI deployment

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code recommended)

### Azure Resources
- Azure subscription na may contributor access
- Access sa Microsoft Foundry Models services (o kakayahang humiling ng access)
- Mga permiso para gumawa ng resource group

### Knowledge Prerequisites
- Pangunahing pag-unawa sa Azure services
- Pamilyar sa command-line interfaces
- Pangunahing konsepto ng AI/ML (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az --version

# Mag-login sa Azure
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

Galugarin ang mga pangunahing file sa isang AI-ready AZD template:

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
- Mga service definitions para sa mga AI components
- Mga environment variable mappings
- Host configurations

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Provisioning ng Microsoft Foundry Models service
- Cognitive Search integration
- Secure key management
- Mga network security configurations

### **Discussion Point:** Bakit Mahalaga ang mga Pattern na Ito para sa AI

- **Service Dependencies**: Kadalasan nangangailangan ang AI apps ng maraming magkakaugnay na serbisyo
- **Security**: Kailangan ng secure na pamamahala ng API keys at endpoints
- **Scalability**: May mga natatanging requirement sa scaling ang AI workloads
- **Cost Management**: Maaaring maging magastos ang AI services kung hindi maayos na na-configure

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Itakda ang nais mong rehiyon ng Azure
azd env set AZURE_LOCATION eastus

# Opsyonal: Itakda ang partikular na modelo ng OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Nagpo-provision ng Microsoft Foundry Models service
- ✅ Lumilikha ng Cognitive Search service
- ✅ Nagse-set up ng App Service para sa web application
- ✅ Nagko-configure ng networking at security
- ✅ Nagde-deploy ng application code
- ✅ Nagse-set up ng monitoring at logging

2. **Monitor the deployment progress** at pansinin ang mga resource na nililikha.

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
   - Mag-navigate sa web application
   - Subukan ang sample queries
   - I-verify na gumagana ang AI responses

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Matagumpay ang deployment ngunit hindi tumutugon ang AI.

**Karaniwang isyu na susuriin:**
1. **OpenAI API keys**: I-verify kung tama ang pagkaka-set
2. **Model availability**: Suriin kung sinusuportahan ng iyong rehiyon ang model
3. **Network connectivity**: Tiyakin na makakapag-komunika ang mga serbisyo
4. **RBAC permissions**: I-verify na may access ang app sa OpenAI

**Debugging commands:**
```bash
# Suriin ang mga environment variable
azd env get-values

# Tingnan ang mga log ng deployment
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Suriin ang katayuan ng deployment ng OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Lumipat sa ibang modelo (kung magagamit sa iyong rehiyon)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# I-deploy muli gamit ang bagong konfigurasyon
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` para magdagdag ng Document Intelligence:

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

**Best Practice**: Magkaiba ang mga configuration para sa development vs production.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Karaniwang gumagamit ang produksyon ng mas mataas na mga SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Paganahin ang karagdagang mga tampok ng seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: I-configure ang template para maging cost-effective sa development.

**Mga Gawain:**
1. Tukuyin kung aling mga SKU ang pwedeng itakda sa free/basic tiers
2. I-configure ang environment variables para sa minimal na gastos
3. I-deploy at ikumpara ang mga gastos sa production configuration

**Solution hints:**
- Gumamit ng F0 (free) tier para sa Cognitive Services kung posible
- Gumamit ng Basic tier para sa Search Service sa development
- Isaalang-alang ang paggamit ng Consumption plan para sa Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Maraming AI apps ang nagha-hardcode ng API keys o gumagamit ng insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Review the security configuration in your template:**
```bash
# Tingnan ang konfigurasyon ng Key Vault at Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Suriin kung ang web app ay may tamang konfigurasyon ng pagkakakilanlan
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (kung hindi pa naka-configure):

Idagdag sa iyong bicep template:
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
# Dapat awtomatikong mai-configure ang Application Insights
# Suriin ang konfigurasyon:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Magdagdag ng custom metrics para sa AI operations:
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

**Task**: Suriin ang iyong deployment para sa mga best practice sa seguridad.

**Checklist:**
- [ ] Walang hardcoded secrets sa code o configuration
- [ ] Managed Identity ang ginagamit para sa service-to-service authentication
- [ ] Key Vault ang nag-iimbak ng sensitibong configuration
- [ ] Maayos na naka-restrict ang network access
- [ ] Nakabukas ang monitoring at logging

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Bago i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Application Architecture:**
   - Anong AI services ang ginagamit ng iyong app?
   - Anong compute resources ang kailangan nito?
   - Kailangan ba ito ng database?
   - Ano ang mga dependencies sa pagitan ng mga serbisyo?

2. **Security Requirements:**
   - Anong sensitibong data ang hinahawakan ng iyong app?
   - Anong mga compliance requirements ang kailangan mo?
   - Kailangan mo ba ng private networking?

3. **Scaling Requirements:**
   - Ano ang inaasahan mong load?
   - Kailangan mo ba ng auto-scaling?
   - May mga regional requirements ba?

### Step 5.2: Create Your AZD Template

**Sundin ang pattern na ito para i-convert ang iyong app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# I-initialize ang template ng AZD
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

**Challenge**: Gumawa ng AZD template para sa isang document processing AI app.

**Mga Kinakailangan:**
- Microsoft Foundry Models para sa content analysis
- Document Intelligence para sa OCR
- Storage Account para sa document uploads
- Function App para sa processing logic
- Web app para sa user interface

**Bonus points:**
- Magdagdag ng tamang error handling
- Isama ang cost estimation
- Mag-set up ng monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Nabibigo ang deployment na may quota error
**Solutions:**
```bash
# Suriin ang kasalukuyang mga quota
az cognitiveservices usage list --location eastus

# Humiling ng pagtaas ng quota o subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** Nabibigo ang AI responses o may mga error sa model deployment
**Solutions:**
```bash
# Suriin ang pagkakaroon ng modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update sa magagamit na modelo
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden errors kapag tumatawag sa AI services
**Solutions:**
```bash
# Suriin ang mga itinalagang tungkulin
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Magdagdag ng mga nawawalang tungkulin
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Suriin ang Application Insights para sa performance metrics
2. Review-in ang OpenAI service metrics sa Azure portal
3. I-verify ang network connectivity at latency

**Solutions:**
- Magpatupad ng caching para sa mga karaniwang query
- Gumamit ng angkop na OpenAI model para sa iyong use case
- Isaalang-alang ang read replicas para sa high-load scenarios

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Matagumpay ang deployment, ngunit nagbabalik ang application ng 500 errors.

**Mga debugging na gawain:**
1. Suriin ang application logs
2. I-verify ang konektividad ng mga serbisyo
3. Subukan ang authentication
4. Review-in ang configuration

**Tools to use:**
- `azd show` para sa deployment overview
- Azure portal para sa detalyadong service logs
- Application Insights para sa application telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Mag-navigate sa Azure portal at gumawa ng dashboard na may:
- Bilang ng OpenAI request at latency
- Application error rates
- Resource utilization
- Pagsubaybay ng gastos

2. **Set up alerts:**
```bash
# Babala para sa mataas na antas ng pagkakamali
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
# Gamitin ang Azure CLI para kunin ang datos ng gastos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Mag-set up ng budget alerts
- Gumamit ng autoscaling policies
- Magpatupad ng request caching
- Subaybayan ang token usage para sa OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: I-optimize ang iyong AI application para sa performance at cost.

**Mga Metric na i-improve:**
- Bawasan ang average response time ng 20%
- Bawasan ang buwanang gastos ng 15%
- Panatilihin ang 99.9% uptime

**Mga Estratehiya na subukan:**
- Magpatupad ng response caching
- I-optimize ang prompts para sa token efficiency
- Gumamit ng angkop na compute SKUs
- Mag-set up ng tamang autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Inatasan kang gumawa ng production-ready AI-powered customer service chatbot na may mga sumusunod na requisito:

**Functional Requirements:**
- Web interface para sa customer interactions
- Integration sa Microsoft Foundry Models para sa mga responses
- Document search capability gamit ang Cognitive Search
- Integration sa umiiral na customer database
- Multi-language support

**Non-Functional Requirements:**
- Kayang mag-handle ng 1000 concurrent users
- 99.9% uptime SLA
- SOC 2 compliance
- Gastos na mas mababa sa $500/month
- I-deploy sa maraming environment (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Natutugunan ba ang lahat ng requirements?
- ✅ **Security**: Naipatupad ba ang mga best practices?
- ✅ **Scalability**: Kaya bang hawakan ang load?
- ✅ **Maintainability**: Maayos ba ang organisasyon ng code at infrastructure?
- ✅ **Cost**: Nanatili ba ito sa budget?

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

Binabati kita! Nakumpleto mo na ang AI Workshop Lab. Dapat ngayon ay magagawa mo na:
- ✅ I-convert ang mga umiiral na aplikasyon ng AI sa mga template ng AZD
- ✅ I-deploy ang mga aplikasyon ng AI na handa para sa produksyon
- ✅ Ipatupad ang mga pinakamahusay na kasanayan sa seguridad para sa mga workload ng AI
- ✅ Subaybayan at i-optimize ang pagganap ng mga aplikasyon ng AI
- ✅ Ayusin ang mga karaniwang isyu sa pag-deploy

### Susunod na Mga Hakbang
1. Ilapat ang mga pattern na ito sa iyong sariling mga proyekto ng AI
2. Mag-ambag ng mga template pabalik sa komunidad
3. Sumali sa Microsoft Foundry Discord para sa patuloy na suporta
4. Galugarin ang mga advanced na paksa tulad ng pag-deploy sa maraming rehiyon

---

**Feedback sa Workshop**: Tulungan kaming pagbutihin ang workshop na ito sa pamamagitan ng pagbabahagi ng iyong karanasan sa [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - Pag-unlad na Inuuna ang AI
- **⬅️ Nakaraan**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Susunod**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at mga talakayan tungkol sa AZD at pag-deploy ng AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Habang nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpakan. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na opisyal na sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->