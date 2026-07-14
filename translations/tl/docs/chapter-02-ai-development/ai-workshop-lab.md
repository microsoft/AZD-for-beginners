# AI Workshop Lab: Paggawa ng Iyong mga Solusyon sa AI na Maaaring I-deploy gamit ang AZD

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First na Pagbuo
- **⬅️ Nakaraang**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **➡️ Susunod**: [Mga Pinakamahusay na Gawain sa Production AI](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

## Pangkalahatang Ideya ng Workshop

Ang praktikal na lab na ito ay gagabay sa mga developer sa proseso ng paggamit ng isang umiiral na template ng AI at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matututuhan mo ang mahahalagang pattern para sa production AI deployments gamit ang mga serbisyo ng Microsoft Foundry.

> **Tala sa Pagpapatunay (2026-07-13):** Sinuri ang workshop na ito gamit ang `azd` `1.27.1`. Kung mas luma ang iyong lokal na instalasyon, i-update muna ang AZD bago magsimula upang magkatugma ang authentication, template, at deployment workflow sa mga hakbang sa ibaba.

**Tagal:** 2-3 oras  
**Antas:** Intermediate  
**Mga Kinakailangan:** Pangunahing kaalaman sa Azure, pamilyar sa mga konsepto ng AI/ML

## 🎓 Mga Layunin sa Pagkatuto

Sa pagtatapos ng workshop na ito, magagawa mong:
- ✅ I-convert ang umiiral na AI application upang gumamit ng AZD templates
- ✅ I-configure ang mga serbisyo ng Microsoft Foundry gamit ang AZD
- ✅ Ipatupad ang secure na pamamahala ng mga credential para sa mga AI service
- ✅ Mag-deploy ng mga production-ready na AI application na may monitoring
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa deployment ng AI

## Mga Kinakailangan

### Mga Kailangang Tools
- May naka-install na [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- May naka-install na [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- May naka-install na [Git](https://git-scm.com/)
- Code editor (inirerekomenda ang VS Code)

### Mga Azure Resources
- Azure subscription na may contributor access
- Access sa Microsoft Foundry Models services (o kakayahang humiling ng access)
- Pahintulot sa paggawa ng resource group

### Mga Kaalamang Kinakailangan
- Pangunahing pang-unawa sa mga Azure services
- Pamilyar sa mga command-line interface
- Mga pangunahing konsepto ng AI/ML (mga API, mga modelo, prompts)

## Pagsasaayos ng Lab

### Hakbang 1: Paghahanda ng Kapaligiran

1. **Suriin ang mga naka-install na tool:**
```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az --version

# Mag-login sa Azure para sa mga workflow ng AZD
azd auth login

# Mag-login sa Azure CLI lamang kung plano mong patakbuhin ang mga az command sa panahon ng diagnostic
az login
```

Kung nagtatrabaho ka sa maraming tenant o hindi awtomatikong nade-detect ang iyong subscription, subukang muli gamit ang `azd auth login --tenant-id <tenant-id>`.

2. **I-clone ang repository ng workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Pag-unawa sa Strukturang AZD para sa mga AI Application

### Anato ng isang AI AZD Template

Tuklasin ang mga pangunahing file sa isang AI-ready AZD template:

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

### **Lab Exercise 1.1: Tuklasin ang Configuration**

1. **Suriin ang azure.yaml file:**
```bash
cat azure.yaml
```

**Ano ang dapat tingnan:**
- Mga depinisyon ng serbisyo para sa mga AI component
- Mga mapping ng environment variable
- Mga configuration ng host

2. **Balikan ang pangunahing infrastructure main.bicep:**
```bash
cat infra/main.bicep
```

**Mga mahahalagang pattern sa AI na dapat tuklasin:**
- Provision ng Microsoft Foundry Models service
- Integrasyon ng Azure AI Search
- Secure na pamamahala ng mga key
- Mga configuration sa seguridad ng network

### **Punto sa Diskusyon:** Bakit Mahalaga ang mga Pattern na Ito para sa AI

- **Mga Dependency sa Serbisyo**: Madalas kailangan ng AI apps ng maraming magkakaugnay na serbisyo
- **Seguridad**: Kailangan ng secure na pamamahala ng API keys at mga endpoint
- **Scalability**: May natatanging pangangailangan sa scaling ang mga AI workload
- **Pamamahala ng Gastos**: Maaaring magastos ang mga AI service kung hindi tama ang configuration

## Module 2: I-deploy ang Iyong Unang AI Application

### Hakbang 2.1: I-initialize ang Kapaligiran

1. **Gumawa ng bagong AZD environment:**
```bash
azd env new myai-workshop
```

2. **Itakda ang mga kinakailangang parametro:**
```bash
# Itakda ang iyong nais na Azure na rehiyon
azd env set AZURE_LOCATION eastus

# Opsyonal: Itakda ang tiyak na modelo ng OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Hakbang 2.2: I-deploy ang Infrastructure at Application

1. **I-deploy gamit ang AZD:**
```bash
azd up
```

**Mga nangyayari habang nagpapatakbo ng `azd up`:**
- ✅ Nagpo-provision ng Microsoft Foundry Models service
- ✅ Lumilikha ng Azure AI Search service
- ✅ Nagsasaayos ng App Service para sa web application
- ✅ Naka-configure ang networking at seguridad
- ✅ Naide-deploy ang code ng aplikasyon
- ✅ Nagsasaayos ng monitoring at logging

2. **Subaybayan ang progreso ng deployment** at tandaan ang mga nilikhang resources.

### Hakbang 2.3: Beripikahin ang Iyong Deployment

1. **Suriin ang mga na-deploy na resource:**
```bash
azd show
```

2. **Buksan ang na-deploy na aplikasyon:**
```bash
azd show
```

Buksan ang web endpoint na ipinakita sa output ng `azd show`.

3. **Subukan ang functionality ng AI:**
   - Pumunta sa web application
   - Subukan ang mga sample queries
   - Tiyaking gumagana ang mga sagot ng AI

### **Lab Exercise 2.1: Pagsasanay sa Troubleshooting**

**Senaryo**: Matagumpay ang deployment pero hindi tumutugon ang AI.

**Karaniwang isyung dapat tingnan:**
1. **Mga OpenAI API key**: Tiyaking tama ang pagkaka-set
2. **Availability ng modelo**: Suriin kung sinusuportahan ng iyong rehiyon ang modelo
3. **Konektibidad ng network**: Siguraduhing makausap ng mga serbisyo ang isa't isa
4. **RBAC permissions**: Tiyaking may access ang app sa OpenAI

**Mga utos sa pag-debug:**
```bash
# Suriin ang mga variable ng kapaligiran
azd env get-values

# Tingnan ang mga log ng deployment
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Suriin ang status ng deployment ng OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Pag-customize ng mga AI Application para sa Iyong Pangangailangan

### Hakbang 3.1: Baguhin ang AI Configuration

1. **I-update ang OpenAI model:**
```bash
# Palitan ng ibang modelo (kung available sa iyong rehiyon)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# I-redploy gamit ang bagong configuration
azd deploy
```

2. **Magdagdag ng karagdagang AI services:**

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

### Hakbang 3.2: Mga Configuration na Espesipiko sa Kapaligiran

**Pinakamahusay na Kasanayan**: Magkaibang configuration para sa development at production.

1. **Gumawa ng production environment:**
```bash
azd env new myai-production
```

2. **Itakda ang mga production-specific na parametro:**
```bash
# Karaniwang gumagamit ang produksyon ng mas mataas na mga SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Paganahin ang mga karagdagang tampok sa seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Pag-optimize ng Gastos**

**Hamon**: I-configure ang template para sa cost-effective na development.

**Mga Gawain:**
1. Tukuyin kung aling mga SKU ang pwedeng itakda sa free/basic tiers
2. I-configure ang environment variables para sa minimal na gastos
3. I-deploy at ikumpara ang mga gastos sa production configuration

**Mga pahiwatig sa solusyon:**
- Gumamit ng F0 (free) tier para sa Azure AI Services kapag maaari
- Gumamit ng Basic tier para sa Search Service sa development
- Isaalang-alang ang paggamit ng Consumption plan para sa Functions

## Module 4: Seguridad at Mga Pinakamahusay na Gawain sa Production

### Hakbang 4.1: Secure na Pamamahala ng Credential

**Kasalukuyang Hamon**: Maraming AI app ang nag-hardcode ng API key o gumagamit ng insecure na imbakan.

**Solusyon ng AZD**: Managed Identity + Key Vault integration.

1. **Suriin ang security configuration sa iyong template:**
```bash
# Maghanap ng Key Vault at Managed Identity na konfigurasyon
grep -r "keyVault\|managedIdentity" infra/
```

2. **Beripikahin na gumagana ang Managed Identity:**
```bash
# Suriin kung ang web app ay may tamang pagkakakilanlan na konfigurasyon
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hakbang 4.2: Seguridad ng Network

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
# Dapat awtomatikong maayos ang Application Insights
# Suriin ang pagsasaayos:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **I-setup ang AI-specific monitoring:**

Magdagdag ng custom metrics para sa mga AI operations:
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
- [ ] Walang hardcoded na mga lihim sa code o configuration
- [ ] Ginamit ang Managed Identity para sa service-to-service authentication
- [ ] Nakaimbak sa Key Vault ang sensitibong configuration
- [ ] Maayos ang pagkakablock ng access sa network
- [ ] Naka-enable ang monitoring at logging

## Module 5: Pag-convert ng Iyong Sariling AI Application

### Hakbang 5.1: Worksheet sa Pagsusuri

**Bago mo i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Arkitektura ng Application:**
   - Anong mga AI service ang ginagamit ng iyong app?
   - Anong compute resources ang kailangan nito?
   - Kailangan ba nito ng database?
   - Ano ang mga dependency sa pagitan ng mga serbisyo?

2. **Mga Kinakailangan sa Seguridad:**
   - Anong sensitibong data ang hinahawakan ng iyong app?
   - Anong mga compliance requirements ang kailangan?
   - Kailangan mo ba ng pribadong networking?

3. **Mga Kinakailangan sa Scaling:**
   - Ano ang inaasahang load?
   - Kailangan mo ba ng auto-scaling?
   - May mga regional na pangangailangan ba?

### Hakbang 5.2: Gumawa ng Iyong AZD Template

**Sundin ang pattern na ito para i-convert ang iyong app:**

1. **Gumawa ng pangunahing istruktura:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Simulan ang AZD template
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

3. **Gumawa ng mga infrastructure template:**

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

### **Lab Exercise 5.1: Hamon sa Paglikha ng Template**

**Hamon**: Gumawa ng AZD template para sa document processing AI app.

**Mga Kinakailangan:**
- Microsoft Foundry Models para sa pagsusuri ng content
- Document Intelligence para sa OCR
- Storage Account para sa pag-upload ng dokumento
- Function App para sa processing logic
- Web app para sa user interface

**Mga bonus na puntos:**
- Magdagdag ng tamang paghawak ng errors
- Isama ang pagtatantya ng gastos
- Mag-setup ng monitoring dashboards

## Module 6: Pagsasaayos ng mga Karaniwang Isyu

### Mga Karaniwang Isyu sa Deployment

#### Isyu 1: Naabot ang Quota ng OpenAI Service
**Sintomas:** Nabibigo ang deployment dahil sa quota error
**Mga Solusyon:**
```bash
# Suriin ang kasalukuyang mga quota
az cognitiveservices usage list --location eastus

# Humiling ng pagtaas ng quota o subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up
```

#### Isyu 2: Hindi Available ang Modelo sa Rehiyon
**Sintomas:** Nabibigo ang AI responses o nagkakaroon ng error sa deployment ng modelo
**Mga Solusyon:**
```bash
# Suriin ang availability ng modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update sa available na modelo
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Isyu 3: Mga Permiso
**Sintomas:** 403 Forbidden errors kapag tinatawagan ang AI services
**Mga Solusyon:**
```bash
# Suriin ang mga itinalagang papel
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Magdagdag ng mga nawawalang papel
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Mga Isyu sa Performance

#### Isyu 4: Mabagal ang AI Responses
**Mga hakbang sa pagsisiyasat:**
1. Suriin ang Application Insights para sa mga performance metric
2. Balikan ang mga metric ng OpenAI service sa Azure portal
3. Beripikahin ang network connectivity at latency

**Mga Solusyon:**
- Ipatupad ang caching para sa mga karaniwang query
- Gumamit ng angkop na OpenAI model para sa iyong kaso
- Isaalang-alang ang paggamit ng read replicas para sa mataas na load na sitwasyon

### **Lab Exercise 6.1: Hamon sa Pag-debug**

**Senaryo**: Matagumpay ang deployment ngunit ang aplikasyon ay nagbabalik ng mga 500 error.

**Mga gawain sa pag-debug:**
1. Suriin ang mga log ng aplikasyon
2. Beripikahin ang konektibidad ng serbisyo
3. Subukan ang authentication
4. Balikan ang configuration

**Mga tool na gagamitin:**
- `azd show` para sa overview ng deployment
- Azure portal para sa mga detalyadong log ng serbisyo
- Application Insights para sa telemetry ng aplikasyon

## Module 7: Monitoring at Pag-optimize

### Hakbang 7.1: Mag-setup ng Komprehensibong Monitoring

1. **Gumawa ng custom dashboards:**

Pumunta sa Azure portal at gumawa ng dashboard na may:
- Bilang ng request at latency sa OpenAI
- Rate ng mga error sa aplikasyon
- Paggamit ng resources
- Pagsubaybay ng gastos

2. **Mag-setup ng alerts:**
```bash
# Babala para sa mataas na antas ng error
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Hakbang 7.2: Pag-optimize ng Gastos

1. **Suriin ang kasalukuyang gastos:**
```bash
# Gamitin ang Azure CLI upang makuha ang datos ng gastos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ipatupad ang mga control sa gastos:**
- Mag-setup ng mga budget alert
- Gumamit ng autoscaling policies
- Ipatupad ang request caching
- Subaybayan ang paggamit ng token para sa OpenAI

### **Lab Exercise 7.1: Pag-optimize ng Performance**

**Gawain**: I-optimize ang iyong AI application para sa performance at gastos.

**Mga metric na dapat pagbutihin:**
- Bawasan ang average response time ng 20%
- Bawasan ang buwanang gastos ng 15%
- Panatilihin ang 99.9% uptime

**Mga stratehiya na subukan:**
- Ipatupad ang response caching
- I-optimize ang prompts para sa token efficiency
- Gumamit ng angkop na compute SKU
- Mag-setup ng tamang autoscaling

## Pangwakas na Hamon: End-to-End na Implementasyon

### Senaryo ng Hamon

Tatagaan ka ng tungkulin na gumawa ng production-ready na AI-powered customer service chatbot na may mga sumusunod na kinakailangan:

**Functional Requirements:**
- Web interface para sa mga pakikipag-ugnayan ng customer
- Integrasyon sa Microsoft Foundry Models para sa mga sagot
- Kakayahang mag-search ng dokumento gamit ang Azure AI Search
- Integrasyon sa umiiral na database ng customer
- Suporta para sa maraming wika

**Non-Functional Requirements:**
- Kayang hawakan ang 1000 magkakasabay na user
- SLA na 99.9% uptime
- SOC 2 compliance
- Gastos na hindi hihigit sa $500/buwan
- Mag-deploy sa maraming environment (dev, staging, prod)

### Mga Hakbang sa Implementasyon

1. **Idisenyo ang arkitektura**
2. **Gumawa ng AZD template**
3. **Ipatupad ang mga hakbang sa seguridad**
4. **Mag-setup ng monitoring at alerting**
5. **Gumawa ng deployment pipelines**
6. **Idokumento ang solusyon**

### Mga Pamantayan sa Pagsusuri

- ✅ **Functionality**: Natutugunan ba nito lahat ng mga pangangailangan?
- ✅ **Seguridad**: Naipatupad ba ang mga pinakamahusay na kasanayan?
- ✅ **Scalability**: Kaya ba nitong hawakan ang load?
- ✅ **Maintainability**: Ayos ba ang pagkakaayos ng code at infrastructure?
- ✅ **Gastos**: Nanatili ba ito sa budget?

## Mga Karagdagang Mapagkukunan

### Dokumentasyon ng Microsoft
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasyon ng Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasyon ng Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Mga Sample na Template
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Mga Mapagkukunan ng Komunidad
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertipiko ng Pagkumpleto

Binabati kita! Nakumpleto mo na ang AI Workshop Lab. Dapat ngayon ay kaya mo nang:

- ✅ I-convert ang umiiral na mga AI application sa mga AZD template
- ✅ Mag-deploy ng mga production-ready na AI application
- ✅ Magpatupad ng mga pinakamahuhusay na kasanayan sa seguridad para sa mga AI workload
- ✅ Mag-monitor at mag-optimize ng performance ng AI application
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa deployment

### Mga Susunod na Hakbang
1. I-apply ang mga pattern na ito sa iyong sariling mga AI proyekto
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
- **➡️ Susunod**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at talakayan tungkol sa AZD at AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->