# AI Workshop Lab: Paggawa ng Iyong AI Solutions na Maaaring I-deploy gamit ang AZD

**Pag-navigate ng Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **➡️ Susunod**: [Pinakamahuhusay na Gawi sa Produksyon ng AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

## Pangkalahatang-ideya ng Workshop

Ginagabayan ng praktikal na lab na ito ang mga developer sa proseso ng pagkuha ng umiiral na AI template at pag-deploy nito gamit ang Azure Developer CLI (AZD). Matututuhan mo ang mahahalagang pattern para sa production AI deployments gamit ang mga serbisyo ng Microsoft Foundry.

> **Review ng release (2026-11-04):** Ang patnubay sa utos ng AZD at mga pangalan ng sample configuration ay sinuri laban sa `azd` `1.37.2` release at ang kasalukuyang configuration ng naka-link na sample. Ito ay isang dokumentasyon review, hindi isang validation ng live deployment. Hindi nangangailangan ang RAG lab ng agent extension; para sa mga pagsusuri ng agent, gamitin ang hiwalay na `azure.ai.evaluations` extension at [kasalukuyang workflow ng pagsusuri](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), hindi ang mga lumang command para sa pagsusuri ng agent.

**Tagal:** 2-3 oras  
**Antas:** Intermediate  
**Mga Kinakailangan:** Pangunahing kaalaman sa Azure, pamilyar sa mga konsepto ng AI/ML

## 🎓 Mga Layunin sa Pagkatuto

Sa pagtatapos ng workshop na ito, magagawa mo ang mga sumusunod:
- ✅ Suriin ang umiiral na AI AZD template at planuhin ang conversion ng iyong sariling aplikasyon
- ✅ I-configure ang mga Microsoft Foundry services gamit ang AZD
- ✅ Ipatupad ang secure na pamamahala ng kredensyal para sa mga AI service
- ✅ I-deploy ang isang AI reference application na may monitoring
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa deployment ng AI

## Mga Kinakailangan

### Mga Kinakailangang Tool
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) naka-install
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) naka-install
- [Git](https://git-scm.com/) naka-install
- Code editor (inirerekomenda ang VS Code)

Ginagamit ng mga command block na ito ang Bash syntax (kasama ang line continuations at `grep`). Sa Windows, gamitin ang Git Bash/WSL o isalin ito sa PowerShell. Mag-install din ng mga tool para sa wika, package-manager, at container na nakalista sa [sample's local environment setup](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Mga Azure Resources
- Azure subscription na may mga permiso sa pag-provision ng resource at role-assignment (Hindi maaaring gumawa ng RBAC assignments ang Contributor lamang; gumamit ng awtorisadong role administrator o ang dokumentadong kapareho ng sample)
- Access sa Microsoft Foundry Models services (o kakayahang humiling ng access)
- Permiso sa paggawa ng resource group

### Mga Kaunang Kaalaman
- Pangunahing pagkaunawa sa mga serbisyo ng Azure
- Pamilyar sa mga command-line interface
- Pangunahing konsepto ng AI/ML (APIs, mga modelo, mga prompt)

## Pagsasaayos ng Lab

### Hakbang 1: Paghahanda ng Kapaligiran

1. **Suriin ang mga installation ng tool:**
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

Kung nagtatrabaho ka sa maraming tenant o hindi awtomatikong natutukoy ang iyong subscription, subukang muli gamit ang `azd auth login --tenant-id <tenant-id>`.

2. **I-clone ang repositoryo ng workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Pag-unawa sa Estruktura ng AZD para sa Mga AI Application

### Anatomiya ng isang AI AZD Template

Suriin ang mga pangunahing file sa isang AI-ready na AZD template:

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

Maaaring magbago ang naka-checkout na sample; lumalabas ang `.azure/` pagkatapos ng environment initialization, hindi palaging sa bagong clone. Suriin ang aktwal na checkout sa halip na gumawa ng mga nawawalang direktoryo para tumbasan ang schematics na ito.

### **Lab Exercise 1.1: Siyasatin ang Configuration**

1. **Suriin ang azure.yaml file:**
```bash
cat azure.yaml
```

**Mga dapat tingnan:**
- Mga definition ng serbisyo para sa mga bahagi ng AI
- Mga mapping ng environment variables
- Mga konfigurasyon ng host

2. **Suriin ang main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Mga mahahalagang AI pattern na kilalanin:**
- Pag-provision ng Microsoft Foundry Models service
- Integrasyon ng Azure AI Search
- Secure na pamamahala ng mga key
- Mga konfigurasyon ng seguridad sa network

### **Punto ng Diskusyon:** Bakit Mahalaga ang Mga Pattern na Ito para sa AI

- **Depende sa Serbisyo**: Kadalasang nangangailangan ng maraming magkakaugnay na serbisyo ang mga AI app
- **Seguridad**: Kailangan ng secure na pamamahala sa mga API key at endpoint
- **Scalability**: May natatanging pangangailangan sa pag-scale ang mga AI workload
- **Pamamahala ng Gastos**: Maaaring maging mahal ang mga AI service kung hindi maayos ang konfigurasyon

## Module 2: I-deploy ang Iyong Unang AI Application

### Hakbang 2.1: I-initialize ang Kapaligiran

1. **Gumawa ng bagong AZD environment:**
```bash
azd env new myai-workshop
```

2. **Itakda ang mga kinakailangang parameter:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Hakbang 2.2: I-deploy ang Infrastrukturang at Aplikasyon

1. **I-deploy gamit ang AZD:**
```bash
azd up
```

**Ano ang nangyayari sa panahon ng `azd up`:**
- ✅ Nagpo-provision ng Microsoft Foundry Models service
- ✅ Lumilikha ng Azure AI Search service
- ✅ Nagseset up ng Azure Container Apps para sa backend at bundled frontend (ang kasalukuyang default na sample)
- ✅ Naka-configure ang networking at seguridad
- ✅ Nade-deploy ang code ng application
- ✅ Naka-set up ang monitoring at logging

2. **I-monitor ang progreso ng deployment** at pansinin ang mga resource na nililikha.

### Hakbang 2.3: Suriin ang Iyong Deployment

1. **Suriin ang mga na-deploy na resource:**
```bash
azd show
```

2. **Buksan ang na-deploy na aplikasyon:**
```bash
azd show
```

Buksan ang web endpoint na ipinakita sa `azd show` output.

3. **Subukan ang functionality ng AI:**
   - Pumunta sa web application
   - Subukan ang mga sample na query
   - Siguruhing gumagana ang mga AI response

### **Lab Exercise 2.1: Pagsasanay sa Pag-troubleshoot**

**Scenario**: Matagumpay ang deployment ngunit hindi tumutugon ang AI.

**Mga karaniwang isyu na dapat suriin:**
1. **Authentication**: Suriin ang managed identity at role assignments; suriin lamang ang API keys kung sinadyang pina-enable ang key-based authentication
2. **Availability ng modelo**: Tiyakin kung sinusuportahan ng iyong rehiyon ang modelo
3. **Konektividad sa network**: Siguraduhing makapag-komunikasyon ang mga serbisyo
4. **Mga permiso sa RBAC**: Siguraduhing may access ang app sa OpenAI

**Mga command para sa debugging:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Pag-customize ng Mga AI Application Para sa Iyong Mga Pangangailangan

### Hakbang 3.1: Baguhin ang AI Configuration

1. **I-update ang OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Magdagdag ng karagdagang AI services:**

I-edit ang `infra/main.bicep` para magdagdag ng Document Intelligence:

Ang sumusunod ay isang ilustratibong bahagi lamang, hindi isang kumpletong template. Maaring mayroon nang provision ang sample para sa mga document-processing services: suriin ang kasalukuyang infrastructure bago magdagdag ng mga duplikadong resource. Ang mga custom na dagdag ay nangangailangan ng pag-wire ng outputs, identities, at application configuration.

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

### Hakbang 3.2: Mga Environment-Specific na Konfigurasyon

**Pinakamahusay na Gawi**: Magkaibang konfigurasyon para sa development at production.

1. **Gumawa ng production environment:**
```bash
azd env new myai-production
```

2. **Itakda ang mga production-specific na parameter:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Ang mga pangalan na ito ay mula sa [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) ng sample. Nag-iimbak ang `azd env set` ng isang halaga ngunit hindi ginagawa itong epektibo nang arbitraryo: dapat itong gamitin ng template. Suriin ang [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ng sample bago i-disable ang public access, at gamitin ang `azd up` para mag-apply ng mga pagbabago sa infrastructure. Hindi nagtatakda ng throughput ng modelo ang OpenAI SKU `S0` mag-isa; mahalaga rin ang uri at kapasidad ng model deployment.

### **Lab Exercise 3.1: Pag-optimize ng Gastos**

**Hamon**: I-configure ang template para sa cost-effective na development.

**Mga Gawain:**
1. Piliin ang disposable workshop environment: `azd env select myai-workshop`.
2. I-record ang kasalukuyang Search SKU at kapasidad ng modelo mula sa `infra/main.parameters.json` at ang napiling environment.
3. Gamitin ang mga suportadong input sa ibaba, pagkatapos makumpirma ang modelo/rehiyon quota:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Suriin ang Search SKU at deployment capacity sa portal at tantyahin ang pagkakaiba gamit ang pricing calculator. Huwag asahan na agad mag-a-update ang billing data.

**Kriterya ng tagumpay:** Gumagamit ang Search ng Basic, ang chat deployment ay may hiniling na suportadong kapasidad, at ang app ay nakasasagot pa rin ng sample na tanong. Ang kapasidad `10` ay isang rate-limit allocation, hindi discount sa presyo ng token. Maaaring ma-restrict o mangailangan ng muling paggawa ang pagbabago ng Search tier; huwag magsagawa ng eksperimento sa production resources. Ang F0 ay specific sa serbisyo at hindi isang Azure OpenAI model SKU.

## Module 4: Seguridad at Mga Pinakamahuhusay na Gawi sa Produksyon

### Hakbang 4.1: Secure na Pamamahala ng Kredensyal

**Kasalukuyang hamon:** Maraming AI app ang naglalagay ng hardcoded API keys o gumagamit ng hindi secure na imbakan.

**Solusyon ng AZD:** Managed Identity + Key Vault integration.

1. **Suriin ang seguridad na konfigurasyon sa iyong template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Siguraduhing gumagana ang Managed Identity:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Hakbang 4.2: Seguridad sa Network

1. **Paganahin ang private endpoints** gamit ang suportadong network configuration ng sample (kung hindi pa naka-configure).

Para sa iyong sariling template, ipinapakita ng ilustratibong bahagi na ito ang koneksyon sa OpenAI endpoint. Nangangailangan din ito ng VNet, private DNS configuration, at connectivity ng application; huwag itong i-paste nang ganap sa sample, na mayroon nang mga private-endpoint na module:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Paganahin ang Application Insights integration ng sample:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Nag-e-emit ang instrumentation ng sample ng telemetry; ang arbitraryong setting na `OPENAI_MONITOR_ENABLED` ay hindi nagpapagana ng AI metrics. Suriin ang mga trace para sa mga tawag sa modelo, latency, pagkabigo, at paggamit ng token, at iwasang mag-record ng sensitibong mga prompt o sagot.

### **Lab Exercise 4.1: Security Audit**

**Gawain:** Suriin ang iyong deployment para sa pinakamahusay na mga gawi sa seguridad.

**Checklist:**
- [ ] Walang hardcoded na sikreto sa code o konfigurasyon
- [ ] Ginamit ang Managed Identity para sa authentication mula serbisyo-sa-serbisyo
- [ ] Nag-iimbak ang Key Vault ng sensitibong konfigurasyon
- [ ] Maayos ang restriksyon sa access sa network
- [ ] Aktibo ang monitoring at logging

## Module 5: Pag-convert ng Iyong Sariling AI Application

### Hakbang 5.1: Worksheet sa Pagsusuri

**Bago i-convert ang iyong app**, sagutin ang mga tanong na ito:

1. **Arkitektura ng Application:**
   - Anong mga AI service ang ginagamit ng iyong app?
   - Anong mga compute resources ang kailangan nito?
   - Nangangailangan ba ito ng database?
   - Ano ang mga dependencies sa pagitan ng mga serbisyo?

2. **Mga Kinakailangan sa Seguridad:**
   - Anong sensitibong data ang hinahawakan ng iyong app?
   - Ano ang mga kinakailangan sa pagsunod?
   - Kailangan mo ba ng pribadong networking?

3. **Mga Kinakailangan sa Scaling:**
   - Ano ang inaasahang load?
   - Kailangan mo ba ng auto-scaling?
   - May mga regional na kinakailangan ba?

### Hakbang 5.2: Gumawa ng Iyong AZD Template

**Sundin ang pattern na ito para i-convert ang iyong app:**

**Gawa lamang ng scaffold:** Hindi nagbibigay ang seksyong ito ng source ng API/web application, host infrastructure, mga deployment ng modelo, identity/RBAC, o isang tapos na `main.parameters.json`. Ipinapakita ng resource-group-scoped Bicep ang komposisyon ng module; ang tipikal na AZD subscription-scoped entry point ay kailangang gumawa ng resource group at tawagin ito sa scope na iyon. Huwag asahan na magde-deploy ng kumpletong app ang `azd up` pagkatapos lamang kopyahin ang mga fragment na ito. Para sa isang runnable baseline, patuloy na gamitin ang RAG template mula sa Module 1.

1. **Gumawa ng pangunahing estruktura:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

3. **Gumawa ng mga template ng infrastructure:**

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

**infra/modules/openai.bicep** - Module ng OpenAI:
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

### **Lab Exercise 5.1: Hamon sa Paglikha ng Template**

**Hamon:** Gumawa ng isang AZD template para sa isang document processing AI app.

**Mga Kinakailangan:**
- Microsoft Foundry Models para sa content analysis
- Document Intelligence para sa OCR
- Storage Account para sa pag-upload ng dokumento
- Function App para sa processing logic
- Web app para sa user interface

**Bonus points:**
- Magdagdag ng maayos na paghawak ng error
- Isama ang pagtatantya ng gastos
- Mag-set up ng monitoring dashboards

## Module 6: Pag-troubleshoot ng Mga Karaniwang Isyu

### Mga Karaniwang Isyu sa Deployment

#### Isyu 1: Lumampas ang Quota ng OpenAI Service
**Sintomas:** Nabigo ang deployment dahil sa quota error
**Mga Solusyon:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Isyu 2: Hindi Available ang Modelo sa Rehiyon
**Sintomas:** Nabibigo ang mga AI response o may error sa deployment ng modelo
**Mga Solusyon:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Isyu 3: Mga Isyu sa Permiso
**Sintomas:** 403 Forbidden error kapag tumatawag sa mga AI service
**Mga Solusyon:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Mga Isyu sa Performance

#### Isyu 4: Mabagal na AI Response
**Mga hakbang sa pagsisiyasat:**
1. Suriin ang Application Insights para sa mga performance metrics
2. Suriin ang mga OpenAI service metrics sa Azure portal
3. Siguraduhin ang konektividad at latency ng network

**Mga Solusyon:**
- Magpatupad ng caching para sa mga karaniwang query
- Gamitin ang angkop na OpenAI modelo para sa iyong use case
- I-scale ang replicas ng application lamang pagkatapos suriin ang mga limitasyon ng modelo sa RPM/TPM; hindi naglalabas ang Azure OpenAI deployments ng generic na database-style na "read replica" setting

### **Lab Exercise 6.1: Hamon sa Pag-debug**

**Scenario:** Matagumpay ang iyong deployment, ngunit nagbabalik ng 500 errors ang application.

**Mga gawain sa pag-debug:**
1. Suriin ang mga log ng application
2. Siguraduhing may koneksyon ang serbisyo
3. Subukan ang pag-authenticate
4. Suriin ang konfigurasyon

**Mga Kasangkapang gagamitin:**
- `azd show` para sa pangkalahatang-ideya ng deployment
- Azure portal para sa detalyadong mga log ng serbisyo
- Application Insights para sa telemetry ng aplikasyon

## Modul 7: Pagsubaybay at Pag-optimize

### Hakbang 7.1: Mag-set Up ng Komprehensibong Pagsubaybay

1. **Gumawa ng mga pasadyang dashboard:**

Pumunta sa Azure portal at gumawa ng dashboard na may:
- Bilang ng mga kahilingan sa OpenAI at latency
- Mga rate ng error ng aplikasyon
- Paggamit ng mga pinagkukunan
- Pagsubaybay sa gastos

2. **Mag-set up ng mga alerto:**
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

Siguraduhing nagpapalabas ang bahagi ng telemetry ng kahilingan at magdagdag ng action group kung kinakailangan ng mga notification. Ang metriko ay bilang, hindi porsyento ng pagkabigo; ang alerto sa rate ay nangangailangan ng angkop na query at denominator.

### Hakbang 7.2: Pag-optimize ng Gastos

1. **Suriin ang kasalukuyang mga gastos:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Palitan ang mga placeholder ng petsa. Iba-iba ang suporta ng Consumption API depende sa kasunduan sa pagsingil; gamitin ang Cost Management sa portal kung hindi available ang detalye ng paggamit. Ang mga gastos ay natatagalan, hindi ito isang real-time na pagsubok na orakulo.

2. **Magpatupad ng mga kontrol sa gastos:**
- Mag-set up ng mga alerto sa budget
- Gumamit ng mga patakaran sa autoscaling
- Magpatupad ng pag-cache ng kahilingan
- Subaybayan ang paggamit ng token para sa OpenAI

### **Lab Exercise 7.1: Pag-optimize ng Performance**

**Gawain**: I-optimize ang iyong AI aplikasyon para sa parehong performance at gastos.

**Mga metriko upang pagbutihin:**
- Bawasan ang average na oras ng tugon ng 20%
- Bawasan ang buwanang gastos ng 15%
- Tukuyin ang 99.9% availability SLO at isang panukat ng window (ang maikling lab ay hindi maaaring ipakita ang buwanang uptime)

**Mga estratehiya na subukan:**
- Magpatupad ng response caching
- I-optimize ang mga prompt para sa kahusayan ng token
- Gumamit ng angkop na compute SKU
- Mag-set up ng wastong autoscaling

## Pangwakas na Hamon: End-to-End na Implementasyon

### Scenario ng Hamon

Ito ay isang **opsyonal na hamon sa arkitektura/disenyo**, hindi isang inilaan na maaaring patakbuhing ehersisyo o sertipikasyon sa produksyon. Magmungkahi ng AI-powered na chatbot para sa serbisyo sa customer at idokumento kung aling mga pangangailangan ang kailangan ng karagdagang implementasyon at ebidensya:

**Mga Functional na Pangangailangan:**
- Web interface para sa interaksyon ng mga customer
- Integrasyon sa Microsoft Foundry Models para sa mga tugon
- Kakayahan sa paghahanap ng dokumento gamit ang Azure AI Search
- Integrasyon sa umiiral na database ng customer
- Suporta sa maraming wika

**Mga Non-Functional na Pangangailangan:**
- Kayang tumanggap ng 1000 sabay-sabay na user
- 99.9% uptime SLA
- Pagsunod sa SOC 2
- Gastos ay nasa ilalim ng $500/buwan
- Mag-deploy sa maraming kapaligiran (dev, staging, prod)

Ang mga ito ay mga hipotetikong limitasyon ng stakeholder, hindi sabay-sabay na garantisadong resulta. Tukuyin ang rate ng kahilingan, laki ng prompt/output, at tagal ng session bago magtantya ng gastos; ang 1,000 sabay-sabay na user ay hindi nagtatakda ng isang workload o nagpapatunay na ang $500 na budget ay posible. Ang SOC 2 ay resulta ng organisasyunal na audit, hindi isang switch na pinapagana ng AZD template. Tukuyin ang mga trade-off at tanggihan ang mga hindi makakayang limitasyon gamit ang ebidensya.

### Mga Hakbang sa Implementasyon

1. **Disenyuhin ang arkitektura**
2. **Gawin ang AZD template**
3. **Ipatupad ang mga hakbang sa seguridad**
4. **Mag-set up ng pagsubaybay at pag-alerto**
5. **Gumawa ng deployment pipelines**
6. **Idokumento ang solusyon**

### Mga Pamantayan sa Pagsusuri

- ✅ **Functionality**: Naipakita ba ang mga ipinatupad na kakayahan at malinaw ang mga natitirang puwang?
- ✅ **Seguridad**: Naipatupad ba ang mga pinakamahusay na praktis?
- ✅ **Scalability**: Kaya ba nitong hawakan ang load?
- ✅ **Maintainability**: Maayos ba ang pagkakaayos ng code at imprastruktura?
- ✅ **Gastos**: Nananatili ba ito sa loob ng budget?

## Karagdagang Mga Sanggunian

### Dokumentasyon ng Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Mga Halimbawang Template
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Mga Sanggunian ng Komunidad
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Punto ng Pagsusuri ng Pagtatapos

Binabati kita! Natapos mo na ang AI Workshop Lab. Dapat ngayon ay kaya mong:

- ✅ Ipaliwanag kung paano iakma ang umiiral na AI na aplikasyon sa isang AZD template
- ✅ Mag-deploy at subukan ang isang AI reference application
- ✅ Ipatupad ang mga pinakamahusay na pamamaraan sa seguridad para sa AI workloads
- ✅ Subaybayan at i-optimize ang performance ng AI aplikasyon
- ✅ Mag-troubleshoot ng mga karaniwang isyu sa deployment

**Linisin:** Patakbuhin ang `azd env list`, piliin ang bawat disposable na kapaligiran na ginawa sa lab na ito (`myai-workshop`, at kung na-deploy `myai-production`/`myai-quota-test`), at patakbuhin ang `azd down` sa bawat isa. Suriin ang plano ng pag-delete; ang pagtanggal lamang ng lokal na konfigurasyon ng kapaligiran ay hindi nagtatanggal ng mga Azure na resources. Iwasan ang `--purge` maliban kung nauunawaan mo ang hindi na maibabalik na pagtanggal ng soft-deleted na resource.

### Mga Susunod na Hakbang
1. Ilapat ang mga pattern na ito sa sarili mong mga AI proyekto
2. Mag-ambag ng mga template pabalik sa komunidad
3. Sumali sa Microsoft Foundry Discord para sa patuloy na suporta
4. Tuklasin ang mga advanced na paksa tulad ng multi-region deployments

---

**Feedback sa Workshop**: Tulungan kaming pagbutihin ang workshop na ito sa pamamagitan ng pagbabahagi ng iyong karanasan sa [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Susunod**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming komunidad para sa suporta at talakayan tungkol sa AZD at mga deployment ng AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->