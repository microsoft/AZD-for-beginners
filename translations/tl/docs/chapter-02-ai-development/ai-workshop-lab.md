# AI Workshop Lab: Paggawa ng Iyong AI Solutions na Maaaring I-deploy gamit ang AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Ang hands-on na lab na ito ay gumagabay sa mga developer sa proseso ng pagkuha ng umiiral na AI template at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matututuhan mo ang mahahalagang pattern para sa production AI deployments gamit ang Microsoft Foundry services.

**Duration:** 2-3 oras  
**Level:** Katamtaman  
**Prerequisites:** Pangunahing kaalaman sa Azure, pamilyar sa mga konsepto ng AI/ML

## 🎓 Learning Objectives

Sa katapusan ng workshop na ito, magagawa mong:
- ✅ I-convert ang umiiral na AI application upang gumamit ng AZD templates
- ✅ I-configure ang Microsoft Foundry services gamit ang AZD
- ✅ Ipatupad ang ligtas na pamamahala ng kredensyal para sa mga serbisyo ng AI
- ✅ I-deploy ang production-ready na mga AI application na may monitoring
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa AI deployment

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (inirerekomenda ang VS Code)

### Azure Resources
- Azure subscription na may contributor access
- Access sa Azure OpenAI services (o kakayahang humiling ng access)
- Pahintulot sa paglikha ng resource group

### Knowledge Prerequisites
- Pangunahing pag-unawa sa mga serbisyo ng Azure
- Pamilyar sa command-line interfaces
- Pangunahing konsepto ng AI/ML (APIs, mga modelo, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az --version

# Mag-log in sa Azure
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

Explore ang mga pangunahing file sa isang AI-ready AZD template:

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
- Mga definisyon ng serbisyo para sa mga bahagi ng AI
- Pagmamapa ng mga environment variable
- Mga konfigurasyon ng host

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Pagpaprovide ng serbisyong Azure OpenAI
- Integrasyon ng Cognitive Search
- Ligtas na pamamahala ng mga susi
- Mga konfigurasyon ng seguridad ng network

### **Discussion Point:** Bakit Mahalaga ang mga Pattern na Ito para sa AI

- **Mga Dependensya ng Serbisyo**: Kadalasang nangangailangan ng maraming magkakaugnay na serbisyo ang mga AI app
- **Seguridad**: Kailangang ligtas na pamahalaan ang mga API key at mga endpoint
- **Pag-scale**: May natatanging pangangailangan sa pag-scale ang mga AI workload
- **Pamamahala ng Gastos**: Maaaring magastos ang mga AI service kung hindi maayos ang konfigurasyon

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Itakda ang iyong nais na rehiyon ng Azure
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
- ✅ Nagpo-provision ng Azure OpenAI service
- ✅ Lumilikha ng Cognitive Search service
- ✅ Nagtatakda ng App Service para sa web application
- ✅ Kinokonpigura ang networking at seguridad
- ✅ Ina-deploy ang application code
- ✅ Nagtatakda ng monitoring at logging

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
   - I-navigate ang web application
   - Subukan ang mga halimbawa ng query
   - Tiyakin na gumagana ang mga tugon ng AI

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Nagtagumpay ang deployment ngunit hindi tumutugon ang AI.

**Karaniwang mga isyung dapat suriin:**
1. **Mga OpenAI API key**: Tiyakin na tama ang pagkaka-set
2. **Pagkakaroon ng modelo**: Suriin kung sinusuportahan ng iyong rehiyon ang modelo
3. **Konektividad ng network**: Tiyakin na makakapag-communicate ang mga serbisyo
4. **Mga permiso ng RBAC**: Tiyakin na makaka-access ang app sa OpenAI

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
# Lumipat sa ibang modelo (kung available sa iyong rehiyon)
azd env set AZURE_OPENAI_MODEL gpt-4

# I-deploy muli gamit ang bagong konfigurasyon
azd deploy
```

2. **Add additional AI services:**

I-edit ang `infra/main.bicep` upang idagdag ang Document Intelligence:

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

**Pinakamainam na Kasanayan**: Iba't ibang konfigurasyon para sa development kumpara sa production.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Karaniwang ginagamit sa produksyon ang mas mataas na mga SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Paganahin ang karagdagang mga tampok sa seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Hamon**: I-configure ang template para sa matipid na development.

**Mga Gawain:**
1. Tukuyin kung aling mga SKUs ang maaaring itakda sa free/basic tiers
2. I-configure ang mga environment variable para sa pinakamababang gastos
3. I-deploy at ihambing ang gastos sa production configuration

**Mga pahiwatig sa solusyon:**
- Gumamit ng F0 (free) tier para sa Cognitive Services kung posible
- Gumamit ng Basic tier para sa Search Service sa development
- Isaalang-alang ang paggamit ng Consumption plan para sa Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Kasalukuyang hamon**: Maraming AI app ang nagha-hardcode ng mga API key o gumagamit ng hindi ligtas na imbakan.

**Solusyon ng AZD**: Integrasyon ng Managed Identity + Key Vault.

1. **Review the security configuration in your template:**
```bash
# Maghanap ng konfigurasyon ng Key Vault at Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Suriin kung ang web app ay may tamang konfigurasyon ng pagkakakilanlan
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (kung hindi pa nakakonpigura):

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

Magdagdag ng custom metrics para sa mga operasyon ng AI:
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

**Gawain**: Suriin ang iyong deployment para sa mga pinakamahusay na kasanayan sa seguridad.

**Checklist:**
- [ ] Walang hardcoded na mga lihim sa code o konfigurasyon
- [ ] Ginagamit ang Managed Identity para sa authentication mula serbisyo-sa-serbisyo
- [ ] Nakaimbak sa Key Vault ang sensitibong konfigurasyon
- [ ] Maayos na nililimitahan ang access sa network
- [ ] Naka-enable ang monitoring at logging

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Bago i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Application Architecture:**
   - Anong mga AI service ang ginagamit ng iyong app?
   - Anong compute resources ang kailangan nito?
   - Kailangan ba nito ng database?
   - Ano ang mga dependency sa pagitan ng mga serbisyo?

2. **Security Requirements:**
   - Anong sensitibong data ang hinahawakan ng iyong app?
   - Anong mga compliance requirement ang mayroon ka?
   - Kailangan mo ba ng private networking?

3. **Scaling Requirements:**
   - Ano ang inaasahan mong load?
   - Kailangan mo ba ng auto-scaling?
   - May mga kinakailangan ba sa rehiyon?

### Step 5.2: Create Your AZD Template

**Sundan ang pattern na ito para i-convert ang iyong app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# I-initialize ang template ng AZD.
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

**infra/main.bicep** - Pangunahing template:
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

**Hamon**: Gumawa ng AZD template para sa isang document processing AI app.

**Mga Kinakailangan:**
- Azure OpenAI para sa pagsusuri ng nilalaman
- Document Intelligence para sa OCR
- Storage Account para sa pag-upload ng dokumento
- Function App para sa processing logic
- Web app para sa user interface

**Karagdagang puntos:**
- Magdagdag ng maayos na error handling
- Isama ang pagtatantya ng gastos
- Magsaayos ng monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Isyu 1: Naabot ang Quota ng OpenAI Service
**Sintomas:** Nabibigo ang deployment na may quota error  
**Mga Solusyon:**
```bash
# Suriin ang kasalukuyang mga quota
az cognitiveservices usage list --location eastus

# Humiling ng pagtaas ng quota o subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up
```

#### Isyu 2: Modelo Hindi Magagamit sa Rehiyon
**Sintomas:** Nabibigo ang mga tugon ng AI o may mga error sa pag-deploy ng modelo  
**Mga Solusyon:**
```bash
# Suriin ang pagkakaroon ng modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update sa magagamit na modelo
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Isyu 3: Mga Isyu sa Pahintulot
**Sintomas:** 403 Forbidden errors kapag tumatawag sa mga serbisyo ng AI  
**Mga Solusyon:**
```bash
# Suriin ang mga itinalagang tungkulin
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Magdagdag ng mga nawawalang tungkulin
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Mga Isyu sa Pagganap

#### Isyu 4: Mabagal na Tugon ng AI
**Mga hakbang sa pagsisiyasat:**
1. Suriin ang Application Insights para sa mga metric ng pagganap
2. I-review ang mga metric ng OpenAI service sa Azure portal
3. Tiyakin ang konektividad at latency ng network

**Mga Solusyon:**
- Magpatupad ng caching para sa mga karaniwang query
- Gumamit ng angkop na OpenAI model para sa iyong kaso ng paggamit
- Isaalang-alang ang mga read replica para sa mataas na load na mga senaryo

### **Lab Exercise 6.1: Debugging Challenge**

**Senaryo**: Nagtagumpay ang deployment, ngunit nagbabalik ang aplikasyon ng mga 500 error.

**Mga gawain sa pag-debug:**
1. Suriin ang application logs
2. Tiyakin ang konektividad ng serbisyo
3. Subukan ang authentication
4. I-review ang konfigurasyon

**Mga tool na gagamitin:**
- `azd show` para sa overview ng deployment
- Azure portal para sa detalyadong service logs
- Application Insights para sa telemetry ng application

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

I-navigate ang Azure portal at gumawa ng dashboard na may:
- Bilang ng OpenAI request at latency
- Rate ng error ng application
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
# Gamitin ang Azure CLI upang makuha ang data ng gastos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Mag-set up ng budget alerts
- Gumamit ng autoscaling policies
- Magpatupad ng request caching
- Subaybayan ang token usage para sa OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Gawain**: I-optimize ang iyong AI application para sa parehong pagganap at gastos.

**Mga metric na dapat pagbutihin:**
- Bawasan ang average response time ng 20%
- Bawasan ang buwanang gastos ng 15%
- Panatilihin ang 99.9% uptime

**Mga estratehiyang subukan:**
- Magpatupad ng response caching
- I-optimize ang mga prompt para sa kahusayan ng token
- Gumamit ng angkop na compute SKUs
- Magsaayos ng maayos na autoscaling

## Final Challenge: End-to-End Implementation

### Senaryo ng Hamon

Ang iyong tungkulin ay gumawa ng production-ready na AI-powered customer service chatbot na may mga kinakailangang ito:

**Mga Functional na Kinakailangan:**
- Web interface para sa interaksyon ng customer
- Integrasyon sa Azure OpenAI para sa mga tugon
- Kakayahang maghanap ng dokumento gamit ang Cognitive Search
- Integrasyon sa umiiral na customer database
- Suporta sa maramihang wika

**Mga Non-Functional na Kinakailangan:**
- Kayang hawakan ang 1000 sabay-sabay na user
- 99.9% uptime SLA
- SOC 2 compliance
- Gastos sa ilalim ng $500/buwan
- I-deploy sa maraming kapaligiran (dev, staging, prod)

### Mga Hakbang sa Implementasyon

1. **Disenyo ng arkitektura**
2. **Gumawa ng AZD template**
3. **Ipatupad ang mga panukalang seguridad**
4. **Magsaayos ng monitoring at alerting**
5. **Gumawa ng deployment pipelines**
6. **Idokumento ang solusyon**

### Mga Pamantayan sa Pagsusuri

- ✅ **Functionality**: Natutugunan ba ang lahat ng kinakailangan?
- ✅ **Security**: Naipatupad ba ang mga pinakamahusay na kasanayan?
- ✅ **Scalability**: Kaya ba nitong hawakan ang load?
- ✅ **Maintainability**: Maayos ba ang pagkakaayos ng code at infrastruktura?
- ✅ **Cost**: Nananatili ba ito sa loob ng budget?

## Additional Resources

### Dokumentasyon ng Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Mga Halimbawang Template
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Mga Mapagkukunan ng Komunidad
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertipiko ng Pagkumpleto
Binabati kita! Nakumpleto mo na ang AI Workshop Lab. Dapat ngayon ay kaya mong:

- ✅ I-convert ang mga umiiral na AI application sa mga AZD template
- ✅ I-deploy ang mga AI application na handa na para sa production
- ✅ Ipatupad ang mga pinakamahusay na praktis sa seguridad para sa mga AI workload
- ✅ I-monitor at i-optimize ang performance ng mga AI application
- ✅ Mag-troubleshoot ng mga karaniwang problema sa pag-deploy

### Susunod na Hakbang
1. I-apply ang mga pattern na ito sa iyong sariling mga proyekto ng AI
2. Mag-ambag ng mga template pabalik sa komunidad
3. Sumali sa Microsoft Foundry Discord para sa patuloy na suporta
4. Tuklasin ang mga advanced na paksa tulad ng pag-deploy sa maraming rehiyon

---

**Feedback sa Workshop**: Tumulong sa amin na pagbutihin ang workshop na ito sa pamamagitan ng pagbabahagi ng iyong karanasan sa [Microsoft Foundry Discord #Azure na channel](https://discord.gg/microsoft-azure).

---

**Pag-navigate ng Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **➡️ Susunod**: [Pinakamahusay na Kasanayan para sa Production AI](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at mga talakayan tungkol sa AZD at pag-deploy ng AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama’t nagsusumikap kami na maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na awtoritatibong pinanggagalingan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->