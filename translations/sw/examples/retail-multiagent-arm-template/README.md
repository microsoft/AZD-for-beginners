<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T10:16:54+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "sw"
}
-->
# Retail Multi-Agent Solution - ARM Template Deployment

**Sura ya 5: Kifurushi cha Utekelezaji wa Uzalishaji**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura Inayohusiana**: [Sura ya 5: Suluhisho za AI za Wakala Wengi](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Mwongozo wa Hali**: [Utekelezaji Kamili](../retail-scenario.md)
- **🎯 Utekelezaji wa Haraka**: [Utekelezaji wa Bonyeza Moja](../../../../examples/retail-multiagent-arm-template)

Hifadhi hii ina templeti kamili ya Azure Resource Manager (ARM) kwa ajili ya kupeleka Suluhisho la Huduma kwa Wateja la Wakala Wengi wa Rejareja, ikitoa miundombinu kama msimbo kwa usanifu mzima.

## 🎯 Kinachopelekwa

### Miundombinu ya Msingi
- **Huduma za Azure OpenAI** (Eneo nyingi kwa upatikanaji wa juu)
  - Eneo la msingi: GPT-4o kwa wakala wa Wateja
  - Eneo la pili: GPT-4o-mini kwa wakala wa Hifadhi  
  - Eneo la tatu: Mfano wa maandishi ya embeddings
  - Eneo la tathmini: Mfano wa GPT-4o grader
- **Azure AI Search** yenye uwezo wa utafutaji wa vector
- **Akaunti ya Hifadhi ya Azure** yenye kontena za blob kwa nyaraka na upakiaji
- **Mazingira ya Programu za Kontena za Azure** yenye uwezo wa kuongeza kiotomatiki
- **Programu za Kontena** kwa router ya wakala na sehemu ya mbele
- **Azure Cosmos DB** kwa hifadhi ya historia ya mazungumzo
- **Azure Key Vault** kwa usimamizi wa siri (hiari)
- **Application Insights** na Log Analytics kwa ufuatiliaji (hiari)
- **Document Intelligence** kwa usindikaji wa nyaraka
- **Bing Search API** kwa taarifa za wakati halisi

### Njia za Utekelezaji

| Njia | Maelezo | Matumizi | Rasilimali |
|------|-------------|----------|-----------|
| **Minimal** | Utekelezaji wa gharama nafuu wa msingi | Maendeleo, majaribio | SKUs za msingi, eneo moja, uwezo mdogo |
| **Standard** | Utekelezaji wa uwiano kwa mzigo wa uzalishaji | Uzalishaji, kiwango cha wastani | SKUs za kawaida, eneo nyingi, uwezo wa kawaida |
| **Premium** | Utekelezaji wa utendaji wa juu, daraja la biashara | Biashara, kiwango cha juu | SKUs za premium, eneo nyingi, uwezo wa juu |

## 📋 Mahitaji ya Awali

1. **Azure CLI** imewekwa na kusanidiwa
2. **Usajili wa Azure ulio hai** wenye upendeleo wa kutosha
3. **Ruhusa zinazofaa** za kuunda rasilimali katika usajili lengwa
4. **Upendeleo wa rasilimali** kwa:
   - Azure OpenAI (angalia upatikanaji wa kieneo)
   - Programu za Kontena (hutofautiana kulingana na eneo)
   - AI Search (daraja la kawaida au juu linapendekezwa)

## 🚀 Utekelezaji wa Haraka

### Chaguo 1: Kutumia Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Chaguo 2: Kutumia Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Chaguo 3: Kutumia Azure CLI moja kwa moja

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Chaguo za Usanidi

### Vigezo vya Templeti

| Kigezo | Aina | Chaguo-msingi | Maelezo |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Kiambishi awali kwa majina yote ya rasilimali |
| `location` | string | Eneo la kikundi cha rasilimali | Eneo la msingi la utekelezaji |
| `secondaryLocation` | string | "westus2" | Eneo la pili kwa utekelezaji wa eneo nyingi |
| `tertiaryLocation` | string | "francecentral" | Eneo la mfano wa embeddings |
| `environmentName` | string | "dev" | Uteuzi wa mazingira (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Usanidi wa utekelezaji (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Washa utekelezaji wa eneo nyingi |
| `enableMonitoring` | bool | true | Washa Application Insights na ufuatiliaji |
| `enableSecurity` | bool | true | Washa Key Vault na usalama ulioboreshwa |

### Kubinafsisha Vigezo

Hariri `azuredeploy.parameters.json`:

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

## 🏗️ Muhtasari wa Usanifu

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

## 📖 Matumizi ya Script ya Utekelezaji

Script ya `deploy.sh` inatoa uzoefu wa utekelezaji wa maingiliano:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Vipengele vya Script

- ✅ **Uthibitishaji wa mahitaji ya awali** (Azure CLI, hali ya kuingia, faili za templeti)
- ✅ **Usimamizi wa kikundi cha rasilimali** (huunda ikiwa haipo)
- ✅ **Uthibitishaji wa templeti** kabla ya utekelezaji
- ✅ **Ufuatiliaji wa maendeleo** na matokeo ya rangi
- ✅ **Matokeo ya utekelezaji** yanaonyeshwa
- ✅ **Mwongozo baada ya utekelezaji**

## 📊 Ufuatiliaji wa Utekelezaji

### Angalia Hali ya Utekelezaji

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Matokeo ya Utekelezaji

Baada ya utekelezaji kufanikiwa, matokeo yafuatayo yanapatikana:

- **URL ya Sehemu ya Mbele**: Kiungo cha umma kwa kiolesura cha wavuti
- **URL ya Router**: Kiungo cha API kwa router ya wakala
- **Viungo vya OpenAI**: Viungo vya huduma za OpenAI vya msingi na vya pili
- **Huduma ya Utafutaji**: Kiungo cha huduma ya Azure AI Search
- **Akaunti ya Hifadhi**: Jina la akaunti ya hifadhi kwa nyaraka
- **Key Vault**: Jina la Key Vault (ikiwa imewezeshwa)
- **Application Insights**: Jina la huduma ya ufuatiliaji (ikiwa imewezeshwa)

## 🔧 Usanidi Baada ya Utekelezaji

### 1. Sanidi Kielezo cha Utafutaji

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Pakia Data ya Awali

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Jaribu Viungo vya Wakala

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Sanidi Programu za Kontena

Templeti ya ARM inaweka picha za kontena za nafasi. Ili kuweka msimbo halisi wa wakala:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Utatuzi wa Matatizo

### Masuala ya Kawaida

#### 1. Upendeleo wa Azure OpenAI Umezidi

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Utekelezaji wa Programu za Kontena Umeshindwa

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Uanzishaji wa Huduma ya Utafutaji

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Uthibitishaji wa Utekelezaji

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Masuala ya Usalama

### Usimamizi wa Vifunguo
- Siri zote zinahifadhiwa katika Azure Key Vault (ikiwa imewezeshwa)
- Programu za kontena zinatumia utambulisho uliosimamiwa kwa uthibitishaji
- Akaunti za hifadhi zina chaguo-msingi salama (HTTPS pekee, hakuna ufikiaji wa blob wa umma)

### Usalama wa Mtandao
- Programu za kontena zinatumia mitandao ya ndani inapowezekana
- Huduma ya utafutaji imesanidiwa na chaguo la viungo vya kibinafsi
- Cosmos DB imesanidiwa na ruhusa za chini zinazohitajika

### Usanidi wa RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Uboreshaji wa Gharama

### Makadirio ya Gharama (Kwa Mwezi, USD)

| Njia | OpenAI | Programu za Kontena | Utafutaji | Hifadhi | Jumla ya Makadirio |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Ufuatiliaji wa Gharama

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Sasisho na Matengenezo

### Sasisho za Templeti
- Dhibiti toleo la faili za templeti za ARM
- Jaribu mabadiliko katika mazingira ya maendeleo kwanza
- Tumia hali ya utekelezaji wa kuongeza kwa sasisho

### Sasisho za Rasilimali
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Hifadhi Nakala na Urejeshaji
- Hifadhi nakala ya kiotomatiki ya Cosmos DB imewezeshwa
- Key Vault imewezeshwa kufuta laini
- Marekebisho ya programu za kontena yanahifadhiwa kwa urejeshaji

## 📞 Msaada

- **Masuala ya Templeti**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Msaada wa Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Jamii**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Tayari kupeleka suluhisho lako la wakala wengi?**

Anza na: `./deploy.sh -g myResourceGroup`

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.