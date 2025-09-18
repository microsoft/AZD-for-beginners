<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T07:25:34+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "fi"
}
-->
# Retail Multi-Agent Solution - ARM-mallin käyttöönotto

**Luku 5: Tuotantokäyttöönottopaketti**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../../README.md)
- **📖 Liittyvä luku**: [Luku 5: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Skenaariokäsikirja**: [Täydellinen toteutus](../retail-scenario.md)
- **🎯 Nopea käyttöönotto**: [Yhden klikkauksen käyttöönotto](../../../../examples/retail-multiagent-arm-template)

Tämä hakemisto sisältää täydellisen Azure Resource Manager (ARM) -mallin vähittäiskaupan Multi-Agent Customer Support Solutionin käyttöönottoon, tarjoten infrastruktuurin koodina koko arkkitehtuurille.

## 🎯 Mitä otetaan käyttöön

### Keskeinen infrastruktuuri
- **Azure OpenAI Services** (Monialueinen korkean saatavuuden takaamiseksi)
  - Ensisijainen alue: GPT-4o asiakasagentille
  - Toissijainen alue: GPT-4o-mini varastoagentille  
  - Kolmas alue: Tekstien upotusmalli
  - Arviointialue: GPT-4o arviointimalli
- **Azure AI Search** vektorihaun ominaisuuksilla
- **Azure Storage Account** blob-säiliöillä dokumentteja ja latauksia varten
- **Azure Container Apps Environment** automaattisella skaalaamisella
- **Container Apps** agenttireitittimelle ja käyttöliittymälle
- **Azure Cosmos DB** keskusteluhistorian tallennukseen
- **Azure Key Vault** salaisuuksien hallintaan (valinnainen)
- **Application Insights** ja Log Analytics seurantaan (valinnainen)
- **Document Intelligence** dokumenttien käsittelyyn
- **Bing Search API** reaaliaikaiseen tiedonhakuun

### Käyttöönoton tilat

| Tila | Kuvaus | Käyttötapaus | Resurssit |
|------|-------------|----------|-----------|
| **Minimal** | Kustannusoptimoitu peruskäyttöönotto | Kehitys, testaus | Perus-SKU:t, yksi alue, vähennetty kapasiteetti |
| **Standard** | Tasapainoinen käyttöönotto tuotantokuormille | Tuotanto, kohtalainen skaalaus | Standard-SKU:t, monialueinen, normaali kapasiteetti |
| **Premium** | Suorituskykyinen, yritystason käyttöönotto | Yritys, suuri skaalaus | Premium-SKU:t, monialueinen, suuri kapasiteetti |

## 📋 Esivaatimukset

1. **Azure CLI** asennettuna ja konfiguroituna
2. **Aktiivinen Azure-tilaus** riittävillä kiintiöillä
3. **Asianmukaiset käyttöoikeudet** resurssien luomiseen kohdetilauksessa
4. **Resurssikiintiöt**:
   - Azure OpenAI (tarkista alueellinen saatavuus)
   - Container Apps (vaihtelee alueittain)
   - AI Search (suositellaan standard-tasoa tai korkeampaa)

## 🚀 Nopea käyttöönotto

### Vaihtoehto 1: Azure CLI:n käyttö

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

### Vaihtoehto 2: Azure Portalin käyttö

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Vaihtoehto 3: Suora Azure CLI:n käyttö

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigurointivaihtoehdot

### Mallin parametrit

| Parametri | Tyyppi | Oletus | Kuvaus |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Kaikkien resurssien nimien etuliite |
| `location` | string | Resurssiryhmän sijainti | Ensisijainen käyttöönottoalue |
| `secondaryLocation` | string | "westus2" | Toissijainen alue monialuekäyttöönotolle |
| `tertiaryLocation` | string | "francecentral" | Alue upotusmallille |
| `environmentName` | string | "dev" | Ympäristön määrittely (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Käyttöönoton konfiguraatio (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Monialuekäyttöönoton aktivointi |
| `enableMonitoring` | bool | true | Application Insightsin ja lokituksen aktivointi |
| `enableSecurity` | bool | true | Key Vaultin ja parannetun turvallisuuden aktivointi |

### Parametrien muokkaaminen

Muokkaa `azuredeploy.parameters.json`:

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

## 🏗️ Arkkitehtuurin yleiskatsaus

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

## 📖 Käyttöönoton skriptin käyttö

`deploy.sh`-skripti tarjoaa interaktiivisen käyttöönoton:

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

### Skriptin ominaisuudet

- ✅ **Esivaatimusten tarkistus** (Azure CLI, kirjautumistila, mallin tiedostot)
- ✅ **Resurssiryhmän hallinta** (luo, jos ei ole olemassa)
- ✅ **Mallin validointi** ennen käyttöönottoa
- ✅ **Edistymisen seuranta** värikoodatulla ulostulolla
- ✅ **Käyttöönoton tulosten** näyttö
- ✅ **Ohjeet käyttöönoton jälkeen**

## 📊 Käyttöönoton seuranta

### Käyttöönoton tilan tarkistus

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

### Käyttöönoton tulokset

Onnistuneen käyttöönoton jälkeen seuraavat tulokset ovat saatavilla:

- **Frontend URL**: Julkinen päätepiste verkkokäyttöliittymälle
- **Router URL**: API-päätepiste agenttireitittimelle
- **OpenAI-päätepisteet**: Ensisijainen ja toissijainen OpenAI-palvelun päätepiste
- **Hakupalvelu**: Azure AI Search -palvelun päätepiste
- **Storage Account**: Dokumenttien tallennustilin nimi
- **Key Vault**: Key Vaultin nimi (jos aktivoitu)
- **Application Insights**: Seurantapalvelun nimi (jos aktivoitu)

## 🔧 Käyttöönoton jälkeinen konfigurointi

### 1. Hakemiston konfigurointi

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

### 2. Alustavien tietojen lataus

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Agenttien päätepisteiden testaus

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container Apps -konfigurointi

ARM-malli ottaa käyttöön paikkamerkkikonttikuvat. Todellisen agenttikoodin käyttöönotto:

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

## 🛠️ Vianmääritys

### Yleiset ongelmat

#### 1. Azure OpenAI -kiintiö ylitetty

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps -käyttöönotto epäonnistui

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

#### 3. Hakupalvelun alustaminen

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Käyttöönoton validointi

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

## 🔐 Turvallisuushuomiot

### Salaisuuksien hallinta
- Kaikki salaisuudet tallennetaan Azure Key Vaultiin (jos aktivoitu)
- Container Apps käyttää hallittua identiteettiä autentikointiin
- Tallennustilit on konfiguroitu turvallisilla oletuksilla (vain HTTPS, ei julkista blob-pääsyä)

### Verkkoturvallisuus
- Container Apps käyttää sisäistä verkkoa mahdollisuuksien mukaan
- Hakupalvelu konfiguroitu yksityisten päätepisteiden vaihtoehdolla
- Cosmos DB konfiguroitu minimivaatimusten mukaisilla käyttöoikeuksilla

### RBAC-konfiguraatio
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kustannusoptimointi

### Kustannusarviot (kuukausittain, USD)

| Tila | OpenAI | Container Apps | Search | Storage | Kokonaisarvio |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kustannusten seuranta

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

## 🔄 Päivitykset ja ylläpito

### Mallin päivitykset
- Versioi ARM-mallitiedostot
- Testaa muutokset kehitysympäristössä ensin
- Käytä inkrementaalista käyttöönottoa päivityksille

### Resurssien päivitykset
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Varmuuskopiointi ja palautus
- Cosmos DB:n automaattinen varmuuskopiointi aktivoitu
- Key Vaultin pehmeä poisto aktivoitu
- Container Apps -versiot säilytetään palautusta varten

## 📞 Tuki

- **Malliongelmat**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure-tuki**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Yhteisö**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Valmis ottamaan käyttöön multi-agent-ratkaisusi?**

Aloita komennolla: `./deploy.sh -g myResourceGroup`

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.