# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Ang hands-on na lab na ito ay gumagabay sa mga developer sa proseso ng pagkuha ng umiiral na AI template at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matututuhan mo ang mahahalagang pattern para sa production AI deployments gamit ang Microsoft Foundry services.

> **Validation note (2026-03-25):** Ang workshop na ito ay nirreview laban sa `azd` `1.23.12`. Kung ang lokal na installation mo ay mas luma, i-update ang AZD bago magsimula upang tumugma ang auth, template, at deployment workflow sa mga hakbang sa ibaba.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

Sa pagtatapos ng workshop na ito, magagawa mong:
- ✅ I-convert ang umiiral na AI application para gumamit ng AZD templates
- ✅ I-configure ang Microsoft Foundry services gamit ang AZD
- ✅ Magpatupad ng secure credential management para sa AI services
- ✅ Mag-deploy ng production-ready AI applications na may monitoring
- ✅ Mag-troubleshoot ng karaniwang isyu sa AI deployment

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (inirerekomenda ang VS Code)

### Azure Resources
- Azure subscription na may contributor access
- Access sa Microsoft Foundry Models services (o kakayahang humiling ng access)
- Mga permiso para gumawa ng resource group

### Knowledge Prerequisites
- Pangunahing pag-unawa sa mga Azure services
- Pamilyaridad sa command-line interfaces
- Pangunahing konsepto sa AI/ML (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az --version

# Mag-login sa Azure para sa mga workflow ng AZD
azd auth login

# Mag-login sa Azure CLI lamang kung balak mong patakbuhin ang mga az command habang nagsasagawa ng diagnostics
az login
```

Kung nagta-trabaho ka sa maraming tenant o hindi awtomatikong nade-detect ang subscription, ulitin gamit ang `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Suriin ang mga pangunahing file sa isang AI-ready AZD template:

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
- Mga definisyon ng serbisyo para sa mga AI component
- Mga mapping ng environment variable
- Host configurations

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Provisioning ng Microsoft Foundry Models service
- Integrasyon ng Cognitive Search
- Secure key management
- Mga network security configuration

### **Discussion Point:** Bakit Mahalaga ang Mga Pattern na Ito para sa AI

- **Mga Depende ng Serbisyo**: Kadalasang nangangailangan ang AI apps ng maraming magkakaugnay na serbisyo
- **Seguridad**: Kailangang maayos na pamahalaan ang API keys at endpoints
- **Scalability**: May kakaibang scaling requirements ang AI workloads
- **Pamamahala ng Gastos**: Maaaring maging mahal ang mga AI services kung hindi tama ang pagkaka-configure

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
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Nagpo-provision ng Microsoft Foundry Models service
- ✅ Lumilikha ng Cognitive Search service
- ✅ Nagsesetup ng App Service para sa web application
- ✅ Nagko-configure ng networking at security
- ✅ Nagde-deploy ng application code
- ✅ Nagsesetup ng monitoring at logging

2. **Monitor the deployment progress** at pansinin ang mga resources na nililikha.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Buksan ang web endpoint na ipinapakita sa output ng `azd show`.

3. **Test the AI functionality:**
   - Mag-navigate sa web application
   - Subukan ang mga sample na query
   - I-verify na gumagana ang mga AI response

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Nagtagumpay ang deployment pero hindi sumasagot ang AI.

**Karaniwang isyung susuriin:**
1. **OpenAI API keys**: Suriin kung tama ang pagkaka-set
2. **Model availability**: Tingnan kung sinusuportahan ng iyong region ang model
3. **Network connectivity**: Tiyakin na makakakonekta ang mga serbisyo
4. **RBAC permissions**: Suriin na may access ang app sa OpenAI

**Debugging commands:**
```bash
# Suriin ang mga variable ng kapaligiran
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

# Muling i-deploy gamit ang bagong konfigurasyon
azd deploy
```

2. **Add additional AI services:**

I-edit ang `infra/main.bicep` para idagdag ang Document Intelligence:

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

**Best Practice**: Iba-ibang configuration para sa development at production.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Sa production karaniwan ginagamit ang mas mataas na mga SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Paganahin ang karagdagang mga tampok ng seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Hamong:** I-configure ang template para sa cost-effective na development.

**Mga Gawain:**
1. Tukuyin kung aling mga SKU ang maaaring itakda sa free/basic tiers
2. I-configure ang environment variables para sa pinakamababang gastos
3. I-deploy at i-compare ang mga gastos sa production configuration

**Mga hint sa solusyon:**
- Gumamit ng F0 (free) tier para sa Cognitive Services kapag posible
- Gumamit ng Basic tier para sa Search Service sa development
- Isaalang-alang ang paggamit ng Consumption plan para sa Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Kasalukuyang hamon**: Maraming AI apps ang nagha-hardcode ng API keys o gumagamit ng insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Review the security configuration in your template:**
```bash
# Hanapin ang konfigurasyon ng Key Vault at Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Suriin kung ang web app ay may tamang konfigurasyon ng pagkakakilanlan
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (kung hindi pa na-configure):

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
# Dapat awtomatikong naka-configure ang Application Insights
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

**Gawain**: Suriin ang iyong deployment para sa mga best practice sa seguridad.

**Checklist:**
- [ ] Walang hardcoded secrets sa code o configuration
- [ ] Managed Identity ang ginagamit para sa service-to-service authentication
- [ ] Naka-store sa Key Vault ang sensitibong configuration
- [ ] Maayos na na-restrict ang network access
- [ ] Naka-enable ang monitoring at logging

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Bago i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Application Architecture:**
   - Anong mga AI services ang ginagamit ng iyong app?
   - Anong compute resources ang kailangan nito?
   - Kailangan ba nito ng database?
   - Ano ang mga dependencies sa pagitan ng mga serbisyo?

2. **Security Requirements:**
   - Anong sensitibong data ang hinahandle ng iyong app?
   - Anong mga compliance requirements ang mayroon ka?
   - Kailangan mo ba ng private networking?

3. **Scaling Requirements:**
   - Ano ang inaasahang load?
   - Kailangan mo ba ng auto-scaling?
   - Mayroon bang mga regional na requirement?

### Step 5.2: Create Your AZD Template

**Sundan ang pattern na ito para i-convert ang iyong app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# I-initialize ang AZD na template
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

**Hamong**: Gumawa ng AZD template para sa isang document processing AI app.

**Mga Kinakailangan:**
- Microsoft Foundry Models para sa content analysis
- Document Intelligence para sa OCR
- Storage Account para sa mga document upload
- Function App para sa processing logic
- Web app para sa user interface

**Bonus points:**
- Magdagdag ng wastong error handling
- Isama ang cost estimation
- I-setup ang monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Sintomas:** Nabibigo ang deployment na may quota error
**Solusyon:**
```bash
# Suriin ang kasalukuyang mga quota
az cognitiveservices usage list --location eastus

# Humiling ng pagtaas ng quota o subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Sintomas:** Nabibigo ang AI responses o may model deployment errors
**Solusyon:**
```bash
# Suriin ang pagkakaroon ng modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update sa magagamit na modelo
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Sintomas:** 403 Forbidden errors kapag tumatawag sa AI services
**Solusyon:**
```bash
# Suriin ang mga pagtatalaga ng tungkulin
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Idagdag ang mga nawawalang tungkulin
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Mga hakbang sa pagsisiyasat:**
1. Suriin ang Application Insights para sa performance metrics
2. Review-in ang OpenAI service metrics sa Azure portal
3. I-verify ang network connectivity at latency

**Solusyon:**
- Magpatupad ng caching para sa mga karaniwang query
- Gumamit ng angkop na OpenAI model para sa iyong use case
- Isaalang-alang ang read replicas para sa mataas na load na scenario

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Nagtagumpay ang deployment, pero bumabalik ang application ng 500 errors.

**Mga debugging na gawain:**
1. Suriin ang application logs
2. I-verify ang connectivity ng serbisyo
3. Subukan ang authentication
4. Review-in ang configuration

**Mga tool na gagamitin:**
- `azd show` para sa deployment overview
- Azure portal para sa detalyadong service logs
- Application Insights para sa application telemetry

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Mag-navigate sa Azure portal at gumawa ng dashboard na may:
- Bilang at latency ng OpenAI requests
- Mga rate ng error ng application
- Paggamit ng resources
- Pagsubaybay ng gastos

2. **Set up alerts:**
```bash
# Babala para sa mataas na rate ng error
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
- I-monitor ang token usage para sa OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Gawain**: I-optimize ang iyong AI application para sa parehong performance at cost.

**Mga Metric na i-improve:**
- Bawasan ang average response time ng 20%
- Bawasan ang buwanang gastos ng 15%
- Panatilihin ang 99.9% uptime

**Mga stratehiyang subukan:**
- Magpatupad ng response caching
- I-optimize ang prompts para sa token efficiency
- Gumamit ng angkop na compute SKUs
- Mag-set up ng tamang autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Inatasan ka na gumawa ng production-ready AI-powered customer service chatbot na may mga sumusunod na kinakailangan:

**Functional Requirements:**
- Web interface para sa pakikipag-ugnayan ng customer
- Integrasyon sa Microsoft Foundry Models para sa mga response
- Document search capability gamit ang Cognitive Search
- Integrasyon sa umiiral na customer database
- Multi-language support

**Non-Functional Requirements:**
- Kayang hawakan ang 1000 concurrent users
- 99.9% uptime SLA
- SOC 2 compliance
- Gastos na mas mababa sa $500/buwan
- I-deploy sa maraming environment (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Natutugunan ba nito ang lahat ng requirements?
- ✅ **Security**: Naipatupad ba ang mga best practice?
- ✅ **Scalability**: Kaya ba nitong hawakan ang load?
- ✅ **Maintainability**: Maayos ba ang pagkakaayos ng code at infrastructure?
- ✅ **Cost**: Nananatili ba ito sa budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Mga Mapagkukunang Pangkomunidad
- [Discord ng Microsoft Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI sa GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertipiko ng Pagkumpleto

Binabati kita! Natapos mo na ang AI Workshop Lab. Dapat ngayon ay kaya mong:

- ✅ I-convert ang umiiral na mga AI application sa mga template ng AZD
- ✅ Mag-deploy ng mga AI application na handa para sa produksyon
- ✅ Ipatupad ang mga pinakamahusay na kasanayan sa seguridad para sa mga AI workload
- ✅ I-monitor at i-optimize ang pagganap ng AI application
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa deployment

### Mga Susunod na Hakbang
1. I-apply ang mga pattern na ito sa iyong sariling mga proyekto ng AI
2. Mag-ambag ng mga template pabalik sa komunidad
3. Sumali sa Microsoft Foundry Discord para sa patuloy na suporta
4. Suriin ang mga advanced na paksa tulad ng pag-deploy sa maraming rehiyon

---

**Workshop Feedback**: Tulungan kami na pagbutihin ang workshop na ito sa pamamagitan ng pagbabahagi ng iyong karanasan sa [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Chapter 2 - AI-First Development
- **⬅️ Nakaraan**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Susunod**: [Pinakamahuhusay na Praktis para sa Production AI](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at mga diskusyon tungkol sa AZD at mga deployment ng AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo ng pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi kawastuhan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->