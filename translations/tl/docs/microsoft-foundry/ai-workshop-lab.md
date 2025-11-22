<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-22T11:35:31+00:00",
  "source_file": "docs/microsoft-foundry/ai-workshop-lab.md",
  "language_code": "tl"
}
-->
# AI Workshop Lab: Paggawa ng Iyong AI Solutions na AZD-Deployable

**Pag-navigate sa Kabanata:**
- **📚 Kurso Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Susunod**: [Mga Praktika sa Production AI](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../getting-started/configuration.md)

## Pangkalahatang-ideya ng Workshop

Ang hands-on lab na ito ay gagabay sa mga developer sa proseso ng paggamit ng isang umiiral na AI template at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matutunan mo ang mahahalagang pattern para sa production AI deployments gamit ang Microsoft Foundry services.

**Tagal:** 2-3 oras  
**Antas:** Intermediate  
**Mga Kinakailangan:** Pangunahing kaalaman sa Azure, pamilyar sa mga konsepto ng AI/ML

## 🎓 Mga Layunin sa Pag-aaral

Sa pagtatapos ng workshop na ito, magagawa mo:
- ✅ I-convert ang isang umiiral na AI application upang gumamit ng AZD templates
- ✅ I-configure ang Microsoft Foundry services gamit ang AZD
- ✅ Magpatupad ng secure na pamamahala ng kredensyal para sa AI services
- ✅ Mag-deploy ng production-ready AI applications na may monitoring
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa AI deployment

## Mga Kinakailangan

### Mga Kinakailangang Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) na naka-install
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) na naka-install
- [Git](https://git-scm.com/) na naka-install
- Code editor (VS Code ang inirerekomenda)

### Mga Azure Resources
- Azure subscription na may contributor access
- Access sa Azure OpenAI services (o kakayahang mag-request ng access)
- Mga pahintulot para sa paglikha ng resource group

### Mga Kinakailangang Kaalaman
- Pangunahing pag-unawa sa mga serbisyo ng Azure
- Pamilyar sa mga command-line interfaces
- Pangunahing konsepto ng AI/ML (APIs, models, prompts)

## Pagsasaayos ng Lab

### Hakbang 1: Paghahanda ng Kapaligiran

1. **I-verify ang mga naka-install na tools:**
```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az --version

# Mag-login sa Azure
az login
azd auth login
```

2. **I-clone ang workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Pag-unawa sa AZD Structure para sa AI Applications

### Anatomy ng isang AI AZD Template

Suriin ang mga pangunahing file sa isang AI-ready AZD template:

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

### **Lab Exercise 1.1: Suriin ang Configuration**

1. **Suriin ang azure.yaml file:**
```bash
cat azure.yaml
```

**Ano ang dapat hanapin:**
- Mga service definitions para sa AI components
- Mga mapping ng environment variable
- Mga host configurations

2. **Suriin ang main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Mga Key AI Patterns na dapat kilalanin:**
- Azure OpenAI service provisioning
- Cognitive Search integration
- Secure key management
- Network security configurations

### **Punto ng Diskusyon:** Bakit Mahalaga ang Mga Pattern na Ito para sa AI

- **Mga Dependency ng Serbisyo**: Ang mga AI apps ay madalas nangangailangan ng maraming coordinated services
- **Seguridad**: Ang mga API keys at endpoints ay kailangang secure na pamamahalaan
- **Scalability**: Ang mga AI workloads ay may natatanging scaling requirements
- **Pamamahala ng Gastos**: Ang mga AI services ay maaaring magastos kung hindi maayos na na-configure

## Module 2: I-deploy ang Iyong Unang AI Application

### Hakbang 2.1: I-initialize ang Kapaligiran

1. **Gumawa ng bagong AZD environment:**
```bash
azd env new myai-workshop
```

2. **Itakda ang mga kinakailangang parameter:**
```bash
# Itakda ang iyong nais na rehiyon ng Azure
azd env set AZURE_LOCATION eastus

# Opsyonal: Itakda ang tiyak na modelo ng OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Hakbang 2.2: I-deploy ang Infrastructure at Application

1. **Mag-deploy gamit ang AZD:**
```bash
azd up
```

**Ano ang nangyayari sa `azd up`:**
- ✅ Nagpo-provision ng Azure OpenAI service
- ✅ Gumagawa ng Cognitive Search service
- ✅ Nagsa-set up ng App Service para sa web application
- ✅ Nagko-configure ng networking at security
- ✅ Nag-deploy ng application code
- ✅ Nagsa-set up ng monitoring at logging

2. **I-monitor ang deployment progress** at tandaan ang mga resources na nalikha.

### Hakbang 2.3: I-verify ang Iyong Deployment

1. **Suriin ang mga na-deploy na resources:**
```bash
azd show
```

2. **Buksan ang na-deploy na application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Subukan ang AI functionality:**
   - Mag-navigate sa web application
   - Subukan ang mga sample queries
   - I-verify na gumagana ang AI responses

### **Lab Exercise 2.1: Pagsasanay sa Troubleshooting**

**Scenario**: Ang iyong deployment ay nagtagumpay ngunit hindi tumutugon ang AI.

**Mga Karaniwang Isyu na Dapat Suriin:**
1. **OpenAI API keys**: I-verify kung tama ang pagkaka-set
2. **Model availability**: Suriin kung sinusuportahan ng iyong rehiyon ang model
3. **Network connectivity**: Siguraduhing makakapag-ugnayan ang mga serbisyo
4. **RBAC permissions**: I-verify kung may access ang app sa OpenAI

**Mga Debugging Commands:**
```bash
# Suriin ang mga variable ng kapaligiran
azd env get-values

# Tingnan ang mga log ng deployment
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Suriin ang status ng OpenAI deployment
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Pag-customize ng AI Applications para sa Iyong Pangangailangan

### Hakbang 3.1: I-modify ang AI Configuration

1. **I-update ang OpenAI model:**
```bash
# Magpalit sa ibang modelo (kung available sa iyong rehiyon)
azd env set AZURE_OPENAI_MODEL gpt-4

# Muling i-deploy gamit ang bagong configuration
azd deploy
```

2. **Magdagdag ng karagdagang AI services:**

I-edit ang `infra/main.bicep` upang magdagdag ng Document Intelligence:

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

### Hakbang 3.2: Mga Configurations na Specific sa Kapaligiran

**Pinakamahusay na Praktika**: Iba't ibang configurations para sa development vs production.

1. **Gumawa ng production environment:**
```bash
azd env new myai-production
```

2. **Itakda ang mga production-specific parameters:**
```bash
# Karaniwan gumagamit ang produksyon ng mas mataas na mga SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Paganahin ang karagdagang mga tampok sa seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Pag-optimize ng Gastos**

**Hamunin**: I-configure ang template para sa cost-effective development.

**Mga Gawain:**
1. Tukuyin kung aling SKUs ang maaaring itakda sa free/basic tiers
2. I-configure ang mga environment variables para sa minimal na gastos
3. I-deploy at ihambing ang mga gastos sa production configuration

**Mga Solusyon na Pahiwatig:**
- Gumamit ng F0 (free) tier para sa Cognitive Services kung maaari
- Gumamit ng Basic tier para sa Search Service sa development
- Isaalang-alang ang paggamit ng Consumption plan para sa Functions

## Module 4: Seguridad at Mga Praktika sa Production

### Hakbang 4.1: Secure Credential Management

**Kasalukuyang Hamon**: Maraming AI apps ang nagha-hardcode ng API keys o gumagamit ng insecure storage.

**AZD Solution**: Managed Identity + Key Vault integration.

1. **Suriin ang security configuration sa iyong template:**
```bash
# Hanapin ang Key Vault at Managed Identity na configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **I-verify na gumagana ang Managed Identity:**
```bash
# Suriin kung ang web app ay may tamang configuration ng pagkakakilanlan
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hakbang 4.2: Network Security

1. **I-enable ang private endpoints** (kung hindi pa naka-configure):

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

### Hakbang 4.3: Monitoring at Observability

1. **I-configure ang Application Insights:**
```bash
# Ang Application Insights ay dapat awtomatikong naka-configure
# Suriin ang configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **I-set up ang AI-specific monitoring:**

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

**Gawain**: Suriin ang iyong deployment para sa mga pinakamahusay na praktika sa seguridad.

**Checklist:**
- [ ] Walang hardcoded secrets sa code o configuration
- [ ] Managed Identity ang ginagamit para sa service-to-service authentication
- [ ] Key Vault ang nag-iimbak ng sensitibong configuration
- [ ] Ang network access ay maayos na na-restrict
- [ ] Ang monitoring at logging ay naka-enable

## Module 5: Pag-convert ng Iyong Sariling AI Application

### Hakbang 5.1: Assessment Worksheet

**Bago i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Application Architecture:**
   - Anong AI services ang ginagamit ng iyong app?
   - Anong compute resources ang kailangan nito?
   - Kailangan ba nito ng database?
   - Ano ang mga dependencies sa pagitan ng mga serbisyo?

2. **Mga Kinakailangan sa Seguridad:**
   - Anong sensitibong data ang hinahawakan ng iyong app?
   - Anong compliance requirements ang mayroon ka?
   - Kailangan mo ba ng private networking?

3. **Mga Kinakailangan sa Scaling:**
   - Ano ang inaasahang load?
   - Kailangan mo ba ng auto-scaling?
   - Mayroon bang mga regional requirements?

### Hakbang 5.2: Gumawa ng Iyong AZD Template

**Sundin ang pattern na ito upang i-convert ang iyong app:**

1. **Gumawa ng pangunahing istruktura:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# I-initialize ang AZD template
azd init --template minimal
```

2. **Gumawa ng azure.yaml:**
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

3. **Gumawa ng mga infrastructure templates:**

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

**Hamunin**: Gumawa ng AZD template para sa isang document processing AI app.

**Mga Kinakailangan:**
- Azure OpenAI para sa content analysis
- Document Intelligence para sa OCR
- Storage Account para sa document uploads
- Function App para sa processing logic
- Web app para sa user interface

**Bonus points:**
- Magdagdag ng tamang error handling
- Isama ang cost estimation
- Mag-set up ng monitoring dashboards

## Module 6: Troubleshooting Common Issues

### Mga Karaniwang Isyu sa Deployment

#### Isyu 1: OpenAI Service Quota Exceeded
**Sintomas:** Nabigo ang deployment na may quota error
**Mga Solusyon:**
```bash
# Suriin ang kasalukuyang mga quota
az cognitiveservices usage list --location eastus

# Humiling ng pagtaas ng quota o subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up
```

#### Isyu 2: Model Not Available in Region
**Sintomas:** Nabigo ang AI responses o may model deployment errors
**Mga Solusyon:**
```bash
# Suriin ang pagkakaroon ng modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update sa magagamit na modelo
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Isyu 3: Permission Issues
**Sintomas:** 403 Forbidden errors kapag tumatawag sa AI services
**Mga Solusyon:**
```bash
# Suriin ang mga nakatalagang papel
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Idagdag ang mga nawawalang papel
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Mga Isyu sa Performance

#### Isyu 4: Mabagal na AI Responses
**Mga Hakbang sa Pagsisiyasat:**
1. Suriin ang Application Insights para sa performance metrics
2. Suriin ang OpenAI service metrics sa Azure portal
3. I-verify ang network connectivity at latency

**Mga Solusyon:**
- Magpatupad ng caching para sa mga karaniwang query
- Gumamit ng angkop na OpenAI model para sa iyong use case
- Isaalang-alang ang read replicas para sa high-load scenarios

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Ang iyong deployment ay nagtagumpay, ngunit ang application ay nagbabalik ng 500 errors.

**Mga Gawain sa Debugging:**
1. Suriin ang application logs
2. I-verify ang service connectivity
3. Subukan ang authentication
4. Suriin ang configuration

**Mga Tools na gagamitin:**
- `azd show` para sa deployment overview
- Azure portal para sa detalyadong service logs
- Application Insights para sa application telemetry

## Module 7: Monitoring at Optimization

### Hakbang 7.1: Mag-set Up ng Comprehensive Monitoring

1. **Gumawa ng custom dashboards:**

Mag-navigate sa Azure portal at gumawa ng dashboard na may:
- OpenAI request count at latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Mag-set up ng alerts:**
```bash
# Alerto para sa mataas na rate ng error
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Hakbang 7.2: Cost Optimization

1. **Suriin ang kasalukuyang gastos:**
```bash
# Gamitin ang Azure CLI upang makuha ang datos ng gastos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Magpatupad ng cost controls:**
- Mag-set up ng budget alerts
- Gumamit ng autoscaling policies
- Magpatupad ng request caching
- I-monitor ang token usage para sa OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Gawain**: I-optimize ang iyong AI application para sa parehong performance at gastos.

**Mga Metrics na dapat pagbutihin:**
- Bawasan ang average response time ng 20%
- Bawasan ang buwanang gastos ng 15%
- Panatilihin ang 99.9% uptime

**Mga Estratehiya na subukan:**
- Magpatupad ng response caching
- I-optimize ang prompts para sa token efficiency
- Gumamit ng angkop na compute SKUs
- Mag-set up ng tamang autoscaling

## Panghuling Hamon: End-to-End Implementation

### Scenario ng Hamon

Ikaw ay inatasan na gumawa ng production-ready AI-powered customer service chatbot na may mga sumusunod na kinakailangan:

**Functional Requirements:**
- Web interface para sa customer interactions
- Integration sa Azure OpenAI para sa responses
- Kakayahan sa document search gamit ang Cognitive Search
- Integration sa umiiral na customer database
- Multi-language support

**Non-Functional Requirements:**
- Kayang mag-handle ng 1000 concurrent users
- 99.9% uptime SLA
- SOC 2 compliance
- Gastos na mas mababa sa $500/buwan
- I-deploy sa maraming environments (dev, staging, prod)

### Mga Hakbang sa Implementasyon

1. **I-disenyo ang architecture**
2. **Gumawa ng AZD template**
3. **Magpatupad ng mga security measures**
4. **Mag-set up ng monitoring at alerting**
5. **Gumawa ng deployment pipelines**
6. **I-dokumenta ang solusyon**

### Mga Pamantayan sa Pagsusuri

- ✅ **Functionality**: Natutugunan ba nito ang lahat ng kinakailangan?
- ✅ **Seguridad**: Naipatupad ba ang mga pinakamahusay na praktika?
- ✅ **Scalability**: Kaya ba nitong mag-handle ng load?
- ✅ **Maintainability**: Maayos ba ang code at infrastructure?
- ✅ **Gastos**: Nananatili ba ito sa budget?

## Karagdagang Resources

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

## 🎓 Sertipiko ng Pagkumpleto
Binabati kita! Natapos mo na ang AI Workshop Lab. Dapat ay kaya mo nang:

- ✅ I-convert ang mga umiiral na AI application sa AZD templates
- ✅ I-deploy ang mga production-ready na AI application
- ✅ Ipatupad ang mga pinakamahusay na kasanayan sa seguridad para sa AI workloads
- ✅ I-monitor at i-optimize ang performance ng AI application
- ✅ I-troubleshoot ang mga karaniwang isyu sa deployment

### Mga Susunod na Hakbang
1. I-apply ang mga pattern na ito sa sarili mong AI projects
2. Mag-ambag ng mga template pabalik sa komunidad
3. Sumali sa Microsoft Foundry Discord para sa patuloy na suporta
4. Tuklasin ang mga advanced na paksa tulad ng multi-region deployments

---

**Feedback sa Workshop**: Tulungan kaming pagbutihin ang workshop na ito sa pamamagitan ng pagbabahagi ng iyong karanasan sa [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Susunod**: [Mga Pinakamahusay na Kasanayan sa Production AI](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../getting-started/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at talakayan tungkol sa AZD at AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->