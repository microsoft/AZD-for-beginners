<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-22T10:05:22+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "tl"
}
-->
# Retail Multi-Agent Solution - Template ng Imprastraktura

**Kabanata 5: Production Deployment Package**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kaugnay na Kabanata**: [Kabanata 5: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Gabay sa Senaryo**: [Kumpletong Arkitektura](../retail-scenario.md)
- **🎯 Mabilis na Pag-deploy**: [Isang-Click na Deployment](../../../../examples/retail-multiagent-arm-template)

> **⚠️ TEMPLATE NG IMPRASTRAKTURA LAMANG**  
> Ang ARM template na ito ay nagde-deploy ng **mga Azure resources** para sa isang multi-agent system.  
>  
> **Ano ang nade-deploy (15-25 minuto):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings sa 3 rehiyon)
> - ✅ AI Search service (walang laman, handa para sa paglikha ng index)
> - ✅ Container Apps (placeholder images, handa para sa iyong code)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Ano ang HINDI kasama (kailangan ng development):**
> - ❌ Code ng implementasyon ng agent (Customer Agent, Inventory Agent)
> - ❌ Routing logic at API endpoints
> - ❌ Frontend chat UI
> - ❌ Mga schema ng search index at data pipelines
> - ❌ **Tinatayang oras ng development: 80-120 oras**
>  
> **Gamitin ang template na ito kung:**
> - ✅ Gusto mong mag-provision ng Azure infrastructure para sa isang multi-agent na proyekto
> - ✅ Plano mong i-develop ang implementasyon ng agent nang hiwalay
> - ✅ Kailangan mo ng production-ready na imprastraktura bilang baseline
>  
> **Huwag gamitin kung:**
> - ❌ Inaasahan mo ang isang gumaganang multi-agent demo kaagad
> - ❌ Naghahanap ka ng kumpletong halimbawa ng application code

## Pangkalahatang-ideya

Ang direktoryong ito ay naglalaman ng isang komprehensibong Azure Resource Manager (ARM) template para sa pag-deploy ng **pundasyon ng imprastraktura** ng isang multi-agent customer support system. Ang template ay nagpo-provision ng lahat ng kinakailangang Azure services, maayos na naka-configure at magkakaugnay, handa na para sa iyong application development.

**Pagkatapos ng deployment, magkakaroon ka ng:** Production-ready na Azure infrastructure  
**Upang makumpleto ang sistema, kailangan mo ng:** Agent code, frontend UI, at data configuration (tingnan ang [Architecture Guide](../retail-scenario.md))

## 🎯 Ano ang Nade-deploy

### Pangunahing Imprastraktura (Kalagayan Pagkatapos ng Deployment)

✅ **Azure OpenAI Services** (Handa para sa API calls)
  - Pangunahing rehiyon: GPT-4o deployment (20K TPM capacity)
  - Pangalawang rehiyon: GPT-4o-mini deployment (10K TPM capacity)
  - Pangatlong rehiyon: Text embeddings model (30K TPM capacity)
  - Rehiyon para sa pagsusuri: GPT-4o grader model (15K TPM capacity)
  - **Kalagayan:** Ganap na gumagana - maaaring mag-API calls kaagad

✅ **Azure AI Search** (Walang laman - handa para sa configuration)
  - May kakayahang mag-vector search
  - Standard tier na may 1 partition, 1 replica
  - **Kalagayan:** Tumatakbo ang serbisyo, ngunit kailangan ng paglikha ng index
  - **Kailangang gawin:** Lumikha ng search index gamit ang iyong schema

✅ **Azure Storage Account** (Walang laman - handa para sa uploads)
  - Blob containers: `documents`, `uploads`
  - Secure na configuration (HTTPS-only, walang public access)
  - **Kalagayan:** Handa nang tumanggap ng mga file
  - **Kailangang gawin:** I-upload ang iyong product data at mga dokumento

⚠️ **Container Apps Environment** (Placeholder images ang nadeploy)
  - Agent router app (nginx default image)
  - Frontend app (nginx default image)
  - Auto-scaling na naka-configure (0-10 instances)
  - **Kalagayan:** Tumatakbo ang placeholder containers
  - **Kailangang gawin:** I-build at i-deploy ang iyong mga agent applications

✅ **Azure Cosmos DB** (Walang laman - handa para sa data)
  - Database at container na pre-configured
  - Na-optimize para sa low-latency operations
  - TTL na naka-enable para sa awtomatikong paglilinis
  - **Kalagayan:** Handa nang mag-imbak ng chat history

✅ **Azure Key Vault** (Opsyonal - handa para sa mga secrets)
  - Soft delete na naka-enable
  - RBAC na naka-configure para sa managed identities
  - **Kalagayan:** Handa nang mag-imbak ng API keys at connection strings

✅ **Application Insights** (Opsyonal - aktibo ang monitoring)
  - Nakakonekta sa Log Analytics workspace
  - Custom metrics at alerts na naka-configure
  - **Kalagayan:** Handa nang tumanggap ng telemetry mula sa iyong apps

✅ **Document Intelligence** (Handa para sa API calls)
  - S0 tier para sa production workloads
  - **Kalagayan:** Handa nang magproseso ng mga na-upload na dokumento

✅ **Bing Search API** (Handa para sa API calls)
  - S1 tier para sa real-time searches
  - **Kalagayan:** Handa para sa web search queries

### Mga Mode ng Deployment

| Mode | OpenAI Capacity | Container Instances | Search Tier | Storage Redundancy | Pinakamainam Para sa |
|------|-----------------|---------------------|-------------|-------------------|-----------------------|
| **Minimal** | 10K-20K TPM | 0-2 replicas | Basic | LRS (Local) | Dev/test, learning, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replicas | Standard | ZRS (Zone) | Production, moderate traffic (<10K users) |
| **Premium** | 80K-150K TPM | 5-10 replicas, zone-redundant | Premium | GRS (Geo) | Enterprise, high traffic (>10K users), 99.99% SLA |

**Epekto sa Gastos:**
- **Minimal → Standard:** ~4x na pagtaas sa gastos ($100-370/buwan → $420-1,450/buwan)
- **Standard → Premium:** ~3x na pagtaas sa gastos ($420-1,450/buwan → $1,150-3,500/buwan)
- **Pumili batay sa:** Inaasahang load, SLA requirements, mga limitasyon sa badyet

**Pagpaplano ng Kapasidad:**
- **TPM (Tokens Per Minute):** Kabuuan sa lahat ng model deployments
- **Container Instances:** Saklaw ng auto-scaling (min-max replicas)
- **Search Tier:** Nakakaapekto sa query performance at mga limitasyon sa laki ng index

## 📋 Mga Kinakailangan

### Mga Kinakailangang Tool
1. **Azure CLI** (bersyon 2.50.0 o mas mataas)
   ```bash
   az --version  # Suriin ang bersyon
   az login      # Magpatotoo
   ```

2. **Aktibong Azure subscription** na may Owner o Contributor access
   ```bash
   az account show  # Tiyakin ang subscription
   ```

### Mga Kinakailangang Azure Quotas

Bago ang deployment, tiyaking sapat ang mga quota sa iyong target na rehiyon:

```bash
# Suriin ang availability ng Azure OpenAI sa iyong rehiyon
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# I-verify ang OpenAI quota (halimbawa para sa gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Suriin ang quota ng Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimum na Kinakailangang Quotas:**
- **Azure OpenAI:** 3-4 na model deployments sa mga rehiyon
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Tandaan:** Ang GPT-4o ay maaaring nasa waitlist sa ilang rehiyon - tingnan ang [model availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Managed environment + 2-10 container instances
- **AI Search:** Standard tier (hindi sapat ang Basic para sa vector search)
- **Cosmos DB:** Standard provisioned throughput

**Kung kulang ang quota:**
1. Pumunta sa Azure Portal → Quotas → Humiling ng pagtaas
2. O gamitin ang Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Isaalang-alang ang mga alternatibong rehiyon na may availability

## 🚀 Mabilis na Pag-deploy

### Opsyon 1: Gamit ang Azure CLI

```bash
# Kopyahin o i-download ang mga template na file
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Gawing executable ang deployment script
chmod +x deploy.sh

# I-deploy gamit ang default na mga setting
./deploy.sh -g myResourceGroup

# I-deploy para sa produksyon gamit ang mga premium na tampok
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opsyon 2: Gamit ang Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opsyon 3: Gamit ang Azure CLI nang direkta

```bash
# Lumikha ng pangkat ng mapagkukunan
az group create --name myResourceGroup --location eastus2

# I-deploy ang template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Timeline ng Deployment

### Ano ang Aasahan

| Yugto | Tagal | Ano ang Nangyayari |
|-------|-------|--------------------||
| **Template Validation** | 30-60 segundo | Tine-validate ng Azure ang syntax at mga parameter ng ARM template |
| **Resource Group Setup** | 10-20 segundo | Lumilikha ng resource group (kung kinakailangan) |
| **OpenAI Provisioning** | 5-8 minuto | Lumilikha ng 3-4 OpenAI accounts at nagde-deploy ng mga modelo |
| **Container Apps** | 3-5 minuto | Lumilikha ng environment at nagde-deploy ng placeholder containers |
| **Search & Storage** | 2-4 minuto | Nagpo-provision ng AI Search service at mga storage account |
| **Cosmos DB** | 2-3 minuto | Lumilikha ng database at nagko-configure ng mga container |
| **Monitoring Setup** | 2-3 minuto | Nagsesetup ng Application Insights at Log Analytics |
| **RBAC Configuration** | 1-2 minuto | Nagko-configure ng managed identities at mga pahintulot |
| **Kabuuang Deployment** | **15-25 minuto** | Kumpletong imprastraktura na handa na |

**Pagkatapos ng Deployment:**
- ✅ **Handa na ang Imprastraktura:** Lahat ng Azure services ay na-provision at tumatakbo
- ⏱️ **Application Development:** 80-120 oras (iyong responsibilidad)
- ⏱️ **Index Configuration:** 15-30 minuto (kailangan ng iyong schema)
- ⏱️ **Data Upload:** Depende sa laki ng dataset
- ⏱️ **Testing & Validation:** 2-4 oras

---

## ✅ I-verify ang Tagumpay ng Deployment

### Hakbang 1: Suriin ang Resource Provisioning (2 minuto)

```bash
# Tiyakin na lahat ng mga resources ay matagumpay na na-deploy
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Inaasahan:** Walang laman na talahanayan (lahat ng resources ay nagpapakita ng "Succeeded" status)

### Hakbang 2: I-verify ang Azure OpenAI Deployments (3 minuto)

```bash
# Ilista ang lahat ng mga account ng OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Suriin ang mga deployment ng modelo para sa pangunahing rehiyon
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Inaasahan:** 
- 3-4 OpenAI accounts (pangunahing, pangalawa, pangatlong rehiyon, rehiyon para sa pagsusuri)
- 1-2 model deployments bawat account (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Hakbang 3: Subukan ang Infrastructure Endpoints (5 minuto)

```bash
# Kunin ang mga URL ng Container App
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Subukan ang endpoint ng router (magre-respond ang placeholder na imahe)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Inaasahan:** 
- Ang Container Apps ay nagpapakita ng "Running" status
- Ang placeholder nginx ay tumutugon gamit ang HTTP 200 o 404 (walang application code pa)

### Hakbang 4: I-verify ang Azure OpenAI API Access (3 minuto)

```bash
# Kunin ang endpoint at key ng OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Subukan ang deployment ng GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Inaasahan:** JSON response na may chat completion (nagkukumpirma na gumagana ang OpenAI)

### Ano ang Gumagana vs. Hindi Gumagana

**✅ Gumagana Pagkatapos ng Deployment:**
- Na-deploy ang mga Azure OpenAI models at tumatanggap ng API calls
- Tumatakbo ang AI Search service (walang laman, walang indexes pa)
- Tumatakbo ang Container Apps (placeholder nginx images)
- Accessible ang mga storage account at handa para sa uploads
- Handa ang Cosmos DB para sa data operations
- Nagtitipon ng telemetry ang Application Insights mula sa imprastraktura
- Handa ang Key Vault para sa pag-iimbak ng mga secrets

**❌ Hindi Pa Gumagana (Kailangan ng Development):**
- Mga endpoint ng agent (walang application code na na-deploy)
- Chat functionality (kailangan ng frontend + backend implementation)
- Mga search query (walang search index na nalikha pa)
- Document processing pipeline (walang data na na-upload)
- Custom telemetry (kailangan ng application instrumentation)

**Mga Susunod na Hakbang:** Tingnan ang [Post-Deployment Configuration](../../../../examples/retail-multiagent-arm-template) upang i-develop at i-deploy ang iyong application

---

## ⚙️ Mga Opsyon sa Configuration

### Mga Parameter ng Template

| Parameter | Uri | Default | Paglalarawan |
|-----------|-----|---------|--------------|
| `projectName` | string | "retail" | Prefix para sa lahat ng resource names |
| `location` | string | Lokasyon ng resource group | Pangunahing rehiyon ng deployment |
| `secondaryLocation` | string | "westus2" | Pangalawang rehiyon para sa multi-region deployment |
| `tertiaryLocation` | string | "francecentral" | Rehiyon para sa embeddings model |
| `environmentName` | string | "dev" | Designasyon ng environment (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuration ng deployment (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Paganahin ang multi-region deployment |
| `enableMonitoring` | bool | true | Paganahin ang Application Insights at logging |
| `enableSecurity` | bool | true | Paganahin ang Key Vault at enhanced security |

### Pag-customize ng Mga Parameter

I-edit ang `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Pangkalahatang-ideya ng Arkitektura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Paggamit ng Deployment Script

Ang `deploy.sh` script ay nagbibigay ng interactive na karanasan sa deployment:

```bash
# Ipakita ang tulong
./deploy.sh --help

# Pangunahing pag-deploy
./deploy.sh -g myResourceGroup

# Advanced na pag-deploy gamit ang pasadyang mga setting
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Pag-deploy para sa pag-develop nang walang multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Mga Tampok ng Script

- ✅ **Pag-validate ng mga kinakailangan** (Azure CLI, login status, template files)
- ✅ **Pamamahala ng resource group** (lumilikha kung wala pa)
- ✅ **Pag-validate ng template** bago ang deployment
- ✅ **Pagsubaybay sa progreso** na may colored output
- ✅ **Pagpapakita ng deployment outputs**
- ✅ **Gabay pagkatapos ng deployment**

## 📊 Pagsubaybay sa Deployment

### Suriin ang Status ng Deployment

```bash
# Ilista ang mga deployment
az deployment group list --resource-group myResourceGroup --output table

# Kunin ang mga detalye ng deployment
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Panoorin ang progreso ng deployment
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Mga Output ng Deployment

Pagkatapos ng matagumpay na deployment, ang mga sumusunod na outputs ay magagamit:

- **Frontend URL**: Pampublikong endpoint para sa web interface
- **Router URL**: API endpoint para sa agent router
- **OpenAI Endpoints**: Pangunahing at pangalawang OpenAI service endpoints
- **Search Service**: Endpoint ng Azure AI Search service
- **Storage Account**: Pangalan ng storage account para sa mga dokumento
- **Key Vault**: Pangalan ng Key Vault (kung naka-enable)
- **Application Insights**: Pangalan ng monitoring service (kung naka-enable)

## 🔧 Pagkatapos ng Deployment: Mga Susunod na Hakbang
> **📝 Mahalagang Paalala:** Na-deploy na ang imprastraktura, ngunit kailangan mong bumuo at mag-deploy ng application code.

### Phase 1: Bumuo ng Agent Applications (Iyong Responsibilidad)

Ang ARM template ay lumilikha ng **walang laman na Container Apps** na may placeholder na mga nginx image. Kailangan mong:

**Kinakailangang Pagbuo:**
1. **Pagpapatupad ng Agent** (30-40 oras)
   - Customer service agent na may GPT-4o integration
   - Inventory agent na may GPT-4o-mini integration
   - Agent routing logic

2. **Frontend Development** (20-30 oras)
   - UI ng chat interface (React/Vue/Angular)
   - Functionality para sa pag-upload ng file
   - Pag-render at pag-format ng mga sagot

3. **Backend Services** (12-16 oras)
   - FastAPI o Express router
   - Authentication middleware
   - Telemetry integration

**Tingnan:** [Architecture Guide](../retail-scenario.md) para sa detalyadong mga pattern ng implementasyon at mga halimbawa ng code

### Phase 2: I-configure ang AI Search Index (15-30 minuto)

Gumawa ng search index na tumutugma sa iyong data model:

```bash
# Kunin ang mga detalye ng serbisyo sa paghahanap
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Gumawa ng index gamit ang iyong schema (halimbawa)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Mga Mapagkukunan:**
- [AI Search Index Schema Design](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vector Search Configuration](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Phase 3: I-upload ang Iyong Data (Nag-iiba ang Oras)

Kapag mayroon ka nang product data at mga dokumento:

```bash
# Kunin ang mga detalye ng storage account
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# I-upload ang iyong mga dokumento
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Halimbawa: Mag-upload ng isang file
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Phase 4: Bumuo at I-deploy ang Iyong Mga Application (8-12 oras)

Kapag natapos mo na ang pagbuo ng iyong agent code:

```bash
# 1. Gumawa ng Azure Container Registry (kung kinakailangan)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. I-build at i-push ang agent router image
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. I-build at i-push ang frontend image
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. I-update ang Container Apps gamit ang iyong mga imahe
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. I-configure ang mga environment variable
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Phase 5: Subukan ang Iyong Application (2-4 oras)

```bash
# Kunin ang URL ng iyong aplikasyon
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Subukan ang endpoint ng ahente (kapag na-deploy na ang iyong code)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Suriin ang mga log ng aplikasyon
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Mga Mapagkukunan para sa Implementasyon

**Arkitektura at Disenyo:**
- 📖 [Kumpletong Architecture Guide](../retail-scenario.md) - Detalyadong mga pattern ng implementasyon
- 📖 [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Mga Halimbawa ng Code:**
- 🔗 [Azure OpenAI Chat Sample](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG pattern
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agent framework (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agent orchestration (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agent conversations

**Tinatayang Kabuuang Pagsisikap:**
- Deployment ng imprastraktura: 15-25 minuto (✅ Tapos na)
- Pagbuo ng application: 80-120 oras (🔨 Iyong trabaho)
- Pagsubok at pag-optimize: 15-25 oras (🔨 Iyong trabaho)

## 🛠️ Pag-troubleshoot

### Karaniwang Mga Isyu

#### 1. Lumampas sa Azure OpenAI Quota

```bash
# Suriin ang kasalukuyang paggamit ng quota
az cognitiveservices usage list --location eastus2

# Humiling ng pagtaas ng quota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Nabigo ang Deployment ng Container Apps

```bash
# Suriin ang mga log ng container app
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# I-restart ang container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Pag-initialize ng Search Service

```bash
# Tiyakin ang status ng serbisyo ng paghahanap
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Subukan ang koneksyon ng serbisyo ng paghahanap
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Pag-validate ng Deployment

```bash
# Tiyakin na lahat ng mga mapagkukunan ay nalikha
az resource list \
  --resource-group myResourceGroup \
  --output table

# Suriin ang kalusugan ng mapagkukunan
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Mga Pagsasaalang-alang sa Seguridad

### Pamamahala ng Key
- Lahat ng mga secret ay nakaimbak sa Azure Key Vault (kapag naka-enable)
- Ang mga container app ay gumagamit ng managed identity para sa authentication
- Ang mga storage account ay may secure defaults (HTTPS lamang, walang public blob access)

### Seguridad ng Network
- Ang mga container app ay gumagamit ng internal networking kung maaari
- Ang search service ay naka-configure gamit ang private endpoints option
- Ang Cosmos DB ay naka-configure na may minimal na kinakailangang mga pahintulot

### RBAC Configuration
```bash
# Magtalaga ng mga kinakailangang tungkulin para sa pinamamahalaang pagkakakilanlan
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Pag-optimize ng Gastos

### Tinatayang Gastos (Buwanang, USD)

| Mode | OpenAI | Container Apps | Search | Storage | Kabuuang Tantiya |
|------|--------|----------------|--------|---------|------------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Pagsubaybay sa Gastos

```bash
# Mag-set up ng mga alerto sa badyet
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Mga Update at Pagpapanatili

### Mga Update sa Template
- I-version control ang mga ARM template file
- Subukan ang mga pagbabago sa development environment muna
- Gumamit ng incremental deployment mode para sa mga update

### Mga Update sa Resource
```bash
# I-update gamit ang mga bagong parameter
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup at Recovery
- Naka-enable ang automatic backup ng Cosmos DB
- Naka-enable ang soft delete ng Key Vault
- Ang mga revision ng container app ay pinapanatili para sa rollback

## 📞 Suporta

- **Mga Isyu sa Template:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suporta sa Azure:** [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunidad:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Handa ka na bang i-deploy ang iyong multi-agent solution?**

Simulan sa: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->