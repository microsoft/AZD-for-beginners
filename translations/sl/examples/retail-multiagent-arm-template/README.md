<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T14:22:49+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "sl"
}
-->
# Rešitev za maloprodajo z več agenti - Namestitev ARM predloge

**Poglavje 5: Paket za produkcijsko namestitev**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Povezano poglavje**: [Poglavje 5: Rešitve z več agenti AI](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Vodnik scenarija**: [Popolna implementacija](../retail-scenario.md)
- **🎯 Hitro nameščanje**: [Namestitev z enim klikom](../../../../examples/retail-multiagent-arm-template)

Ta mapa vsebuje popolno predlogo Azure Resource Manager (ARM) za namestitev rešitve za podporo strankam z več agenti v maloprodaji, ki zagotavlja infrastrukturo kot kodo za celotno arhitekturo.

## 🎯 Kaj se namesti

### Osnovna infrastruktura
- **Azure OpenAI storitve** (več regij za visoko razpoložljivost)
  - Primarna regija: GPT-4o za agenta za stranke
  - Sekundarna regija: GPT-4o-mini za agenta za zaloge  
  - Tretja regija: Model za besedilne vektorske predstavitve
  - Regija za ocenjevanje: GPT-4o ocenjevalni model
- **Azure AI Search** z zmogljivostmi iskanja po vektorjih
- **Azure Storage Account** z vsebniki za dokumente in nalaganja
- **Azure Container Apps Environment** z avtomatskim skaliranjem
- **Container Apps** za usmerjevalnik agentov in uporabniški vmesnik
- **Azure Cosmos DB** za shranjevanje zgodovine klepeta
- **Azure Key Vault** za upravljanje skrivnosti (neobvezno)
- **Application Insights** in Log Analytics za spremljanje (neobvezno)
- **Document Intelligence** za obdelavo dokumentov
- **Bing Search API** za informacije v realnem času

### Načini namestitve

| Način | Opis | Uporaba | Viri |
|-------|------|---------|------|
| **Minimalno** | Stroškovno optimizirana osnovna namestitev | Razvoj, testiranje | Osnovni SKUs, ena regija, zmanjšana zmogljivost |
| **Standardno** | Uravnotežena namestitev za produkcijsko uporabo | Produkcija, zmerna obremenitev | Standardni SKUs, več regij, standardna zmogljivost |
| **Premium** | Visoko zmogljiva, podjetniška namestitev | Podjetje, velika obremenitev | Premium SKUs, več regij, visoka zmogljivost |

## 📋 Predpogoji

1. **Azure CLI** nameščen in konfiguriran
2. **Aktivna naročnina Azure** z zadostnimi kvotami
3. **Ustrezna dovoljenja** za ustvarjanje virov v ciljni naročnini
4. **Kvote virov** za:
   - Azure OpenAI (preverite razpoložljivost po regijah)
   - Container Apps (razlikuje se glede na regijo)
   - AI Search (priporočena standardna stopnja ali višja)

## 🚀 Hitro nameščanje

### Možnost 1: Uporaba Azure CLI

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

### Možnost 2: Uporaba Azure Portala

[![Namesti v Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Možnost 3: Neposredna uporaba Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Možnosti konfiguracije

### Parametri predloge

| Parameter | Tip | Privzeto | Opis |
|-----------|-----|----------|------|
| `projectName` | string | "retail" | Predpona za imena vseh virov |
| `location` | string | Lokacija skupine virov | Primarna regija namestitve |
| `secondaryLocation` | string | "westus2" | Sekundarna regija za namestitev v več regijah |
| `tertiaryLocation` | string | "francecentral" | Regija za model vektorskih predstavitev |
| `environmentName` | string | "dev" | Oznaka okolja (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfiguracija namestitve (minimalno/standardno/premium) |
| `enableMultiRegion` | bool | true | Omogoči namestitev v več regijah |
| `enableMonitoring` | bool | true | Omogoči Application Insights in beleženje |
| `enableSecurity` | bool | true | Omogoči Key Vault in izboljšano varnost |

### Prilagajanje parametrov

Uredite `azuredeploy.parameters.json`:

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

## 🏗️ Pregled arhitekture

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

## 📖 Uporaba skripta za namestitev

Skript `deploy.sh` omogoča interaktivno izkušnjo namestitve:

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

### Značilnosti skripta

- ✅ **Preverjanje predpogojev** (Azure CLI, status prijave, datoteke predloge)
- ✅ **Upravljanje skupine virov** (ustvari, če ne obstaja)
- ✅ **Preverjanje predloge** pred namestitvijo
- ✅ **Spremljanje napredka** z barvnim izpisom
- ✅ **Prikaz rezultatov namestitve**
- ✅ **Navodila po namestitvi**

## 📊 Spremljanje namestitve

### Preverjanje statusa namestitve

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

### Rezultati namestitve

Po uspešni namestitvi so na voljo naslednji rezultati:

- **URL uporabniškega vmesnika**: Javni dostop do spletnega vmesnika
- **URL usmerjevalnika**: API dostop do usmerjevalnika agentov
- **OpenAI končne točke**: Primarne in sekundarne končne točke storitve OpenAI
- **Storitev iskanja**: Končna točka storitve Azure AI Search
- **Račun za shranjevanje**: Ime računa za shranjevanje dokumentov
- **Key Vault**: Ime Key Vault (če je omogočeno)
- **Application Insights**: Ime storitve za spremljanje (če je omogočeno)

## 🔧 Konfiguracija po namestitvi

### 1. Konfigurirajte indeks iskanja

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

### 2. Naložite začetne podatke

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Preizkusite končne točke agentov

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurirajte Container Apps

ARM predloga namesti začasne slike kontejnerjev. Za namestitev dejanske kode agentov:

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

## 🛠️ Odpravljanje težav

### Pogoste težave

#### 1. Presežena kvota Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Napaka pri namestitvi Container Apps

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

#### 3. Inicializacija storitve iskanja

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Preverjanje namestitve

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

## 🔐 Varnostni vidiki

### Upravljanje ključev
- Vse skrivnosti so shranjene v Azure Key Vault (če je omogočeno)
- Container Apps uporabljajo upravljano identiteto za avtentikacijo
- Računi za shranjevanje imajo varne privzete nastavitve (samo HTTPS, brez javnega dostopa do blobov)

### Omrežna varnost
- Container Apps uporabljajo interno omrežje, kjer je to mogoče
- Storitev iskanja je konfigurirana z možnostjo zasebnih končnih točk
- Cosmos DB je konfiguriran z minimalnimi potrebnimi dovoljenji

### Konfiguracija RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimizacija stroškov

### Ocenjeni stroški (mesečno, USD)

| Način | OpenAI | Container Apps | Iskanje | Shranjevanje | Skupaj |
|-------|--------|----------------|---------|-------------|--------|
| Minimalno | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardno | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Spremljanje stroškov

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

## 🔄 Posodobitve in vzdrževanje

### Posodobitve predloge
- Predloge ARM datotek naj bodo pod nadzorom različic
- Spremembe najprej preizkusite v razvojnem okolju
- Za posodobitve uporabite način inkrementalne namestitve

### Posodobitve virov
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Varnostno kopiranje in obnovitev
- Samodejno varnostno kopiranje Cosmos DB omogočeno
- Mehka izbris Key Vault omogočen
- Revizije aplikacij v kontejnerjih ohranjene za povrnitev

## 📞 Podpora

- **Težave s predlogo**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Podpora Azure**: [Portal za podporo Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Skupnost**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Pripravljeni na namestitev vaše rešitve z več agenti?**

Začnite z: `./deploy.sh -g myResourceGroup`

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni prevod s strani človeka. Ne prevzemamo odgovornosti za morebitna napačna razumevanja ali napačne interpretacije, ki bi nastale zaradi uporabe tega prevoda.