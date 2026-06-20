# AI Workshop Lab: Paggawing AZD-Deployable ang Iyong mga Solusyon sa AI

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 2 - AI-Unang Pag-unlad
- **⬅️ Previous**: [Pag-deploy ng Modelong AI](ai-model-deployment.md)
- **➡️ Next**: [Pinakamahuhusay na Praktika para sa Production AI](production-ai-practices.md)
- **🚀 Next Chapter**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

## Pangkalahatang-ideya ng Workshop

Ang hands-on lab na ito ay ginagabayan ang mga developer sa proseso ng pagkuha ng umiiral na AI template at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matututuhan mo ang mahahalagang pattern para sa production AI deployments gamit ang Microsoft Foundry services.

> **Validation note (2026-03-25):** Ang workshop na ito ay nirepaso laban sa `azd` `1.23.12`. Kung mas luma ang lokal mong installation, i-update ang AZD bago magsimula upang tumugma ang auth, template, at deployment workflow sa mga hakbang sa ibaba.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Mga Layunin sa Pagkatuto

Sa pagtatapos ng workshop na ito, magagawa mong:
- ✅ I-convert ang umiiral na AI application para gumamit ng mga AZD template
- ✅ I-configure ang Microsoft Foundry services gamit ang AZD
- ✅ Magpatupad ng secure na pamamahala ng kredensyal para sa mga AI service
- ✅ Mag-deploy ng production-ready na AI applications na may monitoring
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa pag-deploy ng AI

## Mga Kinakailangan

### Kinakailangang Mga Tool
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) na-install
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) na-install
- [Git](https://git-scm.com/) na-install
- Code editor (inirerekomenda ang VS Code)

### Mga Resource ng Azure
- Azure subscription na may access bilang Contributor
- Access sa Microsoft Foundry Models services (o kakayahang humiling ng access)
- Mga pahintulot para sa paglikha ng resource group

### Mga Kinakailangang Kaalaman
- Pangunahing pag-unawa sa mga serbisyo ng Azure
- Pamilyar sa command-line interfaces
- Pangunahing kaalaman sa AI/ML (APIs, mga modelo, prompts)

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

# Mag-login sa Azure CLI lamang kung balak mong patakbuhin ang mga utos na az habang nagsasagawa ng diagnostics
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **I-clone ang repository ng workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Pag-unawa sa Istruktura ng AZD para sa mga AI Application

### Anatomiya ng isang AI AZD Template

Suriin ang mga pangunahing file sa isang AI-handang AZD template:

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

### **Gawain sa Lab 1.1: Suriin ang Konfigurasyon**

1. **Suriin ang file na azure.yaml:**
```bash
cat azure.yaml
```

**Ano ang hahanapin:**
- Mga kahulugan ng serbisyo para sa mga bahagi ng AI
- Mga mapping ng environment variable
- Mga konfigurasyon ng host

2. **Suriin ang main.bicep na imprastruktura:**
```bash
cat infra/main.bicep
```

**Mga pangunahing pattern ng AI na dapat tukuyin:**
- Pag-provision ng serbisyo ng Microsoft Foundry Models
- Integrasyon ng Azure AI Search
- Ligtas na pamamahala ng key
- Mga konfigurasyon ng seguridad sa network

### **Punto ng Diskusyon:** Bakit Mahalaga ang mga Pattern na Ito para sa AI

- **Mga Depensiya ng Serbisyo**: Kadalasang nangangailangan ang mga AI app ng maramihang magkakaugnay na serbisyo
- **Seguridad**: Kailangang ligtas ang pamamahala ng API keys at mga endpoint
- **Kakayahang mag-scale**: May natatanging pangangailangan sa pag-scale ang mga AI workload
- **Pamamahala ng Gastos**: Maaaring maging mahal ang mga AI service kung hindi maayos ang pagkakonfigura

## Module 2: I-deploy ang Iyong Unang AI Application

### Hakbang 2.1: I-initialize ang Kapaligiran

1. **Gumawa ng bagong AZD environment:**
```bash
azd env new myai-workshop
```

2. **Itakda ang mga kinakailangang parameter:**
```bash
# Itakda ang nais mong rehiyon ng Azure
azd env set AZURE_LOCATION eastus

# Opsyonal: Itakda ang partikular na modelo ng OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Hakbang 2.2: I-deploy ang Imprastruktura at Aplikasyon

1. **I-deploy gamit ang AZD:**
```bash
azd up
```

**Ano ang nangyayari habang nagpapatakbo ng `azd up`:**
- ✅ Nagpo-provision ng serbisyo ng Microsoft Foundry Models
- ✅ Lumilikha ng serbisyo ng Azure AI Search
- ✅ Nagtatakda ng App Service para sa web application
- ✅ Nagkokonpigura ng networking at seguridad
- ✅ Ina-deploy ang code ng aplikasyon
- ✅ Nagtatakda ng monitoring at logging

2. **I-monitor ang progreso ng deployment** at tandaan ang mga resource na nililikha.

### Hakbang 2.3: Beripikahin ang Iyong Deployment

1. **Suriin ang mga na-deploy na resource:**
```bash
azd show
```

2. **Buksan ang na-deploy na aplikasyon:**
```bash
azd show
```

Buksan ang web endpoint na ipinapakita sa output ng `azd show`.

3. **Subukan ang AI na functionality:**
   - Pumunta sa web application
   - Subukan ang mga sample na query
   - Tiyakin na gumagana ang mga tugon ng AI

### **Gawain sa Lab 2.1: Pagsasanay sa Pag-troubleshoot**

**Scenario**: Matagumpay ang deployment ngunit hindi tumutugon ang AI.

**Mga karaniwang isyu na dapat suriin:**
1. **OpenAI API keys**: Tiyakin na tama ang pagkaka-set ng mga ito
2. **Availability ng modelo**: Suriin kung sinusuportahan ng iyong rehiyon ang modelo
3. **Konektividad ng network**: Tiyakin na makakakonekta ang mga serbisyo
4. **Mga pahintulot ng RBAC**: Tiyakin na may access ang app sa OpenAI

**Mga utos para sa pag-debug:**
```bash
# Suriin ang mga environment variable
azd env get-values

# Tingnan ang mga log ng deployment
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Suriin ang status ng deployment ng OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Pag-customize ng mga AI Application Para sa Iyong Pangangailangan

### Hakbang 3.1: Baguhin ang Konfigurasyon ng AI

1. **I-update ang OpenAI model:**
```bash
# Lumipat sa ibang modelo (kung magagamit sa iyong rehiyon)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# I-deploy muli gamit ang bagong konfigurasyon
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

### Hakbang 3.2: Mga Konfigurasyon na Espesipiko sa Kapaligiran

**Pinakamahusay na Praktika**: Iba't ibang konfigurasyon para sa development at production.

1. **Lumikha ng production environment:**
```bash
azd env new myai-production
```

2. **Itakda ang mga parameter na tiyak sa production:**
```bash
# Karaniwang gumagamit ang produksyon ng mas mataas na mga SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Paganahin ang karagdagang mga tampok sa seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Gawain sa Lab 3.1: Pag-optimize ng Gastos**

**Hamon**: I-configure ang template para sa cost-effective na development.

**Mga gawain:**
1. Tukuyin kung aling mga SKU ang maaaring itakda sa free/basic tiers
2. I-configure ang mga environment variable para sa minimal na gastos
3. I-deploy at ihambing ang mga gastos sa production configuration

**Mga pahiwatig ng solusyon:**
- Gumamit ng F0 (free) tier para sa Azure AI Services kapag posible
- Gumamit ng Basic tier para sa Search Service sa development
- Isaalang-alang ang paggamit ng Consumption plan para sa Functions

## Module 4: Seguridad at Pinakamahuhusay na Praktika sa Production

### Hakbang 4.1: Ligtas na Pamamahala ng Credential

**Kasalukuyang hamon**: Maraming AI app ang nagha-hardcode ng API key o gumagamit ng hindi ligtas na storage.

**Solusyon ng AZD**: Integrasyon ng Managed Identity + Key Vault.

1. **Suriin ang security configuration sa iyong template:**
```bash
# Hanapin ang konfigurasyon ng Key Vault at Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Tiyakin na gumagana ang Managed Identity:**
```bash
# Suriin kung ang web app ay may tamang konfigurasyon ng identidad
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Hakbang 4.2: Seguridad sa Network

1. **I-enable ang private endpoints** (kung hindi pa na-configure):

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

### Hakbang 4.3: Pagmo-monitor at Observability

1. **I-configure ang Application Insights:**
```bash
# Dapat awtomatikong naka-configure ang Application Insights.
# Suriin ang konfigurasyon:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Mag-set up ng monitoring na espesipiko sa AI:**

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

### **Gawain sa Lab 4.1: Audit sa Seguridad**

**Gawain**: Suriin ang iyong deployment para sa mga pinakamahusay na kasanayan sa seguridad.

**Tseklis:**
- [ ] Walang hardcoded na mga secret sa code o konfigurasyon
- [ ] Gumagamit ng Managed Identity para sa service-to-service awtentikasyon
- [ ] Nagtatago ang Key Vault ng sensitibong konfigurasyon
- [ ] Maayos na na-restrict ang access sa network
- [ ] Naka-enable ang monitoring at logging

## Module 5: Pagko-convert ng Iyong Sariling AI Application

### Hakbang 5.1: Worksheet ng Pagsusuri

**Bago i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Application Architecture:**
   - Anong AI services ang ginagamit ng iyong app?
   - Anong compute resources ang kailangan nito?
   - Kailangan ba nito ng database?
   - Ano ang mga dependency sa pagitan ng mga serbisyo?

2. **Mga Kinakailangan sa Seguridad:**
   - Anong sensitibong data ang hinahawakan ng iyong app?
   - Anong mga compliance requirements ang mayroon ka?
   - Kailangan mo ba ng private networking?

3. **Mga Kinakailangan sa Pag-scale:**
   - Ano ang inaasahan mong load?
   - Kailangan mo ba ng auto-scaling?
   - May mga regional requirements ba?

### Hakbang 5.2: Gumawa ng Iyong AZD Template

**Sundan ang pattern na ito para i-convert ang iyong app:**

1. **Gumawa ng basic na istruktura:**
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

### **Gawain sa Lab 5.1: Hamon sa Paglikha ng Template**

**Hamon**: Gumawa ng AZD template para sa isang document processing AI app.

**Mga kinakailangan:**
- Microsoft Foundry Models para sa content analysis
- Document Intelligence para sa OCR
- Storage Account para sa pag-upload ng dokumento
- Function App para sa processing logic
- Web app para sa user interface

**Mga dagdag na puntos:**
- Magdagdag ng tamang error handling
- Isama ang pagtatantya ng gastos
- Mag-set up ng monitoring dashboards

## Module 6: Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Karaniwang Isyu sa Deployment

#### Isyu 1: Lumampas ang Quota ng OpenAI Service
**Mga Sintomas:** Nabibigo ang deployment na may quota error
**Mga Solusyon:**
```bash
# Suriin ang kasalukuyang mga quota
az cognitiveservices usage list --location eastus

# Humiling ng pagtaas ng mga quota o subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up
```

#### Isyu 2: Hindi Available ang Modelo sa Rehiyon
**Mga Sintomas:** Nabibigo ang AI responses o may mga error sa deployment ng modelo
**Mga Solusyon:**
```bash
# Suriin ang pagkakaroon ng modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update sa magagamit na modelo
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Isyu 3: Mga Isyu sa Pahintulot
**Mga Sintomas:** Mga error na 403 Forbidden kapag tumatawag sa mga AI services
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
**Mga hakbang sa pag-iimbestiga:**
1. Suriin ang Application Insights para sa performance metrics
2. Suriin ang OpenAI service metrics sa Azure portal
3. Suriin ang konektividad ng network at latency

**Mga Solusyon:**
- Magpatupad ng caching para sa karaniwang query
- Gumamit ng angkop na OpenAI model para sa iyong use case
- Isaalang-alang ang read replicas para sa mga high-load na senaryo

### **Gawain sa Lab 6.1: Hamon sa Pag-debug**

**Scenario**: Matagumpay ang deployment, ngunit nagbabalik ang aplikasyon ng 500 errors.

**Mga gawain sa pag-debug:**
1. Suriin ang application logs
2. Tiyakin ang konektividad sa mga serbisyo
3. Subukan ang awtentikasyon
4. Suriin ang konfigurasyon

**Mga tool na gagamitin:**
- `azd show` para sa overview ng deployment
- Azure portal para sa detalyadong service logs
- Application Insights para sa application telemetry

## Module 7: Pagmo-monitor at Pag-optimize

### Hakbang 7.1: Mag-set Up ng Komprehensibong Monitoring

1. **Gumawa ng custom dashboards:**

Pumunta sa Azure portal at gumawa ng dashboard na may:
- Bilang ng OpenAI request at latency
- Rate ng error ng aplikasyon
- Paggamit ng resource
- Pagsubaybay sa gastos

2. **Mag-set up ng alerts:**
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

1. **Suriin ang kasalukuyang mga gastos:**
```bash
# Gamitin ang Azure CLI para makuha ang datos ng gastos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ipatupad ang mga kontrol sa gastos:**
- Mag-set up ng budget alerts
- Gumamit ng autoscaling policies
- Magpatupad ng request caching
- I-monitor ang token usage para sa OpenAI

### **Gawain sa Lab 7.1: Pag-optimize ng Pagganap**

**Gawain**: I-optimize ang iyong AI application para sa pagganap at gastos.

**Mga metric na i-improve:**
- Bawasan ang average response time ng 20%
- Bawasan ang buwanang gastos ng 15%
- Panatilihin ang 99.9% uptime

**Mga estratehiyang subukan:**
- Magpatupad ng response caching
- I-optimize ang prompts para sa token efficiency
- Gumamit ng angkop na compute SKUs
- Mag-set up ng tamang autoscaling

## Panghuling Hamon: End-to-End na Implementasyon

### Senaryo ng Hamon

Inatasan kang gumawa ng production-ready na AI-powered customer service chatbot na may mga sumusunod na kinakailangan:

**Functional Requirements:**
- Web interface para sa pakikipag-ugnayan ng customer
- Integrasyon sa Microsoft Foundry Models para sa mga tugon
- Kakayahan sa paghahanap ng dokumento gamit ang Azure AI Search
- Integrasyon sa umiiral na customer database
- Multi-language support

**Non-Functional Requirements:**
- Kayang humawak ng 1000 sabay-sabay na user
- 99.9% uptime SLA
- SOC 2 compliance
- Gastos na mas mababa sa $500/buwan
- I-deploy sa maraming environment (dev, staging, prod)

### Mga Hakbang sa Implementasyon

1. **Disenyo ng arkitektura**
2. **Gumawa ng AZD template**
3. **Ipatupad ang mga hakbang sa seguridad**
4. **Mag-set up ng monitoring at alerting**
5. **Gumawa ng deployment pipelines**
6. **Idokumento ang solusyon**

### Mga Pamantayan sa Pagsusuri

- ✅ **Functionality**: Natutugunan ba nito ang lahat ng kinakailangan?
- ✅ **Security**: Naipatupad ba ang mga pinakamahusay na kasanayan?
- ✅ **Scalability**: Kayang bumili ng load?
- ✅ **Maintainability**: Maayos ba ang pagkakaayos ng code at imprastruktura?
- ✅ **Cost**: Nananatili ba ito sa badyet?

## Karagdagang Mga Sanggunian

### Dokumentasyon ng Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Mga Halimbawang Template
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Mga Mapagkukunan ng Komunidad
- [Discord ng Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub ng Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Mga Kahanga-hangang Template ng AZD](https://azure.github.io/awesome-azd/)

## 🎓 Sertipiko ng Pagkumpleto

Binabati kita! Nakumpleto mo na ang AI Workshop Lab. Ngayon ay dapat mong magawa ang mga sumusunod:

- ✅ I-convert ang umiiral na mga aplikasyong AI sa mga template ng AZD
- ✅ Mag-deploy ng mga aplikasyong AI na handa para sa produksyon
- ✅ Ipatupad ang mga pinakamahusay na kasanayan sa seguridad para sa mga workload ng AI
- ✅ Subaybayan at i-optimize ang pagganap ng mga aplikasyon ng AI
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa deployment

### Mga Susunod na Hakbang
1. Ilapat ang mga pattern na ito sa iyong sariling mga proyekto ng AI
2. Mag-ambag ng mga template pabalik sa komunidad
3. Sumali sa Discord ng Microsoft Foundry para sa patuloy na suporta
4. Tuklasin ang mga advanced na paksa tulad ng pag-deploy sa maraming rehiyon

---

**Feedback sa Workshop**: Tulungan mo kaming pagbutihin ang workshop na ito sa pamamagitan ng pagbabahagi ng iyong karanasan sa [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - Pagbuo na Unahin ang AI
- **⬅️ Nakaraan**: [Pag-deploy ng Modelong AI](ai-model-deployment.md)
- **➡️ Susunod**: [Mga Pinakamahusay na Kasanayan sa AI para sa Produksyon](production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at mga diskusyon tungkol sa AZD at mga deployment ng AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->