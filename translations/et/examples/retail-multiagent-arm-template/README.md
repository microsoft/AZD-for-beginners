<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-10-11T15:41:08+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "et"
}
-->
# Jaemüügi mitmeagendi lahendus - ARM-malli juurutamine

**5. peatükk: Tootmisse juurutamise pakett**  
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)  
- **📖 Seotud peatükk**: [5. peatükk: Mitmeagendi tehisintellekti lahendused](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)  
- **📝 Stsenaariumi juhend**: [Täielik teostus](../retail-scenario.md)  
- **🎯 Kiirjuurutus**: [Ühe klõpsuga juurutamine](../../../../examples/retail-multiagent-arm-template)  

See kaust sisaldab täielikku Azure Resource Manager (ARM) malli jaemüügi mitmeagendi klienditoe lahenduse juurutamiseks, pakkudes kogu arhitektuuri jaoks infrastruktuuri koodina.

## 🎯 Mis juurutatakse

### Põhiinfrastruktuur
- **Azure OpenAI teenused** (mitme piirkonnaga kõrge kättesaadavuse tagamiseks)  
  - Esmane piirkond: GPT-4o klienditeeninduse agendile  
  - Teisene piirkond: GPT-4o-mini laovarude agendile  
  - Kolmas piirkond: Teksti sisukuse mudel  
  - Hindamispiirkond: GPT-4o hindamismudel  
- **Azure AI Search** vektoriotsingu võimalustega  
- **Azure Storage Account** koos dokumentide ja üleslaadimiste blob-konteineritega  
- **Azure Container Apps Environment** automaatse skaleerimisega  
- **Container Apps** agendi ruuteri ja esipaneeli jaoks  
- **Azure Cosmos DB** vestlusajaloo salvestamiseks  
- **Azure Key Vault** saladuste haldamiseks (valikuline)  
- **Application Insights** ja Log Analytics monitooringuks (valikuline)  
- **Document Intelligence** dokumentide töötlemiseks  
- **Bing Search API** reaalajas teabe jaoks  

### Juurutamisrežiimid

| Režiim | Kirjeldus | Kasutusjuhtum | Ressursid |
|-------|-----------|--------------|-----------|
| **Minimal** | Kuluefektiivne põhiline juurutus | Arendus, testimine | Põhilised SKUd, üks piirkond, vähendatud maht |
| **Standard** | Tasakaalustatud juurutus tootmiskoormustele | Tootmine, mõõdukas maht | Standardsed SKUd, mitme piirkonnaga, standardne maht |
| **Premium** | Kõrge jõudlusega, ettevõtte tasemel juurutus | Ettevõte, suur maht | Premium SKUd, mitme piirkonnaga, suur maht |

## 📋 Eeltingimused

1. **Azure CLI** peab olema installitud ja konfigureeritud  
2. **Aktiivne Azure'i tellimus** piisavate kvootidega  
3. **Sobivad õigused** ressursside loomiseks sihttellimuses  
4. **Ressursikvoodid**:  
   - Azure OpenAI (kontrollige piirkondlikku saadavust)  
   - Container Apps (sõltub piirkonnast)  
   - AI Search (soovitatav standardtase või kõrgem)  

## 🚀 Kiirjuurutus

### Valik 1: Azure CLI kasutamine

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
  
### Valik 2: Azure Portali kasutamine  

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)  

### Valik 3: Azure CLI otsene kasutamine  

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```
  
## ⚙️ Konfiguratsioonivalikud

### Malli parameetrid

| Parameeter | Tüüp | Vaikimisi | Kirjeldus |
|------------|------|-----------|-----------|
| `projectName` | string | "retail" | Kõigi ressursside nimede eesliide |
| `location` | string | Ressursigrupi asukoht | Esmane juurutuspiirkond |
| `secondaryLocation` | string | "westus2" | Teisene piirkond mitme piirkonna juurutamiseks |
| `tertiaryLocation` | string | "francecentral" | Piirkond sisukuse mudeli jaoks |
| `environmentName` | string | "dev" | Keskkonna määratlus (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Juurutuse konfiguratsioon (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Mitme piirkonna juurutuse lubamine |
| `enableMonitoring` | bool | true | Application Insights ja logimise lubamine |
| `enableSecurity` | bool | true | Key Vaulti ja täiustatud turvalisuse lubamine |

### Parameetrite kohandamine

Muuda faili `azuredeploy.parameters.json`:

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
  
## 🏗️ Arhitektuuri ülevaade

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
  
## 📖 Juurutusskripti kasutamine

`deploy.sh` skript pakub interaktiivset juurutuskogemust:

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
  
### Skripti funktsioonid

- ✅ **Eeltingimuste kontroll** (Azure CLI, sisselogimise staatus, mallifailid)  
- ✅ **Ressursigrupi haldus** (loob, kui seda pole olemas)  
- ✅ **Malli valideerimine** enne juurutamist  
- ✅ **Edenemise jälgimine** värvilise väljundiga  
- ✅ **Juurutuse tulemuste kuvamine**  
- ✅ **Järgneva juurutuse juhised**  

## 📊 Juurutuse jälgimine

### Juurutuse oleku kontrollimine

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
  
### Juurutuse tulemused

Pärast edukat juurutust on saadaval järgmised tulemused:

- **Esipaneeli URL**: Veebiliidese avalik lõpp-punkt  
- **Ruuteri URL**: Agendi ruuteri API lõpp-punkt  
- **OpenAI lõpp-punktid**: Esmane ja teisene OpenAI teenuse lõpp-punkt  
- **Otsinguteenused**: Azure AI Search teenuse lõpp-punkt  
- **Salvestuskonto**: Dokumentide salvestuskonto nimi  
- **Key Vault**: Key Vaulti nimi (kui lubatud)  
- **Application Insights**: Monitooringuteenuse nimi (kui lubatud)  

## 🔧 Järgnevad konfiguratsioonid pärast juurutust

### 1. Otsinguindeksi seadistamine

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
  
### 2. Algandmete üleslaadimine

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```
  
### 3. Agendi lõpp-punktide testimine

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```
  
### 4. Container Appide seadistamine

ARM-mall juurutab kohatäite konteineripildid. Tegeliku agendikoodi juurutamiseks:

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
  
## 🛠️ Tõrkeotsing

### Levinud probleemid

#### 1. Azure OpenAI kvoot ületatud

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```
  
#### 2. Container Appide juurutamine ebaõnnestus

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
  
#### 3. Otsinguteenuse initsialiseerimine

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```
  
### Juurutuse valideerimine

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
  
## 🔐 Turvalisuse kaalutlused

### Võtmete haldamine
- Kõik saladused salvestatakse Azure Key Vaulti (kui lubatud)  
- Container Appid kasutavad autentimiseks hallatavat identiteeti  
- Salvestuskontod on konfigureeritud turvalisteks (ainult HTTPS, avalik juurdepääs keelatud)  

### Võrguturve
- Container Appid kasutavad võimalusel sisemist võrgustikku  
- Otsinguteenused on konfigureeritud privaatsete lõpp-punktidega  
- Cosmos DB on konfigureeritud minimaalsete vajalike õigustega  

### RBAC konfiguratsioon
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```
  
## 💰 Kulude optimeerimine

### Kuluarvestus (kuus, USD)

| Režiim | OpenAI | Container Apps | Otsing | Salvestus | Kogusumma |
|-------|--------|----------------|--------|-----------|-----------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kulude jälgimine

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
  
## 🔄 Uuendused ja hooldus

### Malli uuendused
- Versioonikontrollige ARM-malli faile  
- Testige muudatusi esmalt arenduskeskkonnas  
- Kasutage uuenduste jaoks inkrementaalset juurutusrežiimi  

### Ressursside uuendused
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```
  
### Varundamine ja taastamine
- Cosmos DB automaatne varundamine on lubatud  
- Key Vaulti pehme kustutamine on lubatud  
- Container Appide versioonid säilitatakse tagasipööramiseks  

## 📞 Tugi

- **Malli probleemid**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)  
- **Azure'i tugi**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)  
- **Kogukond**: [Azure AI Discord](https://discord.gg/microsoft-azure)  

---

**⚡ Kas oled valmis oma mitmeagendi lahendust juurutama?**  

Alusta käsuga: `./deploy.sh -g myResourceGroup`

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.