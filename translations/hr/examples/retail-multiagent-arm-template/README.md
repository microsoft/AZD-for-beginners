<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T12:16:16+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "hr"
}
-->
# Retail Multi-Agent Solution - ARM Predložak za Implementaciju

**Poglavlje 5: Paket za Implementaciju u Produkciji**
- **📚 Početna stranica tečaja**: [AZD Za Početnike](../../README.md)
- **📖 Povezano poglavlje**: [Poglavlje 5: Multi-Agent AI Rješenja](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Vodič scenarija**: [Potpuna Implementacija](../retail-scenario.md)
- **🎯 Brza Implementacija**: [Jedan Klik za Implementaciju](../../../../examples/retail-multiagent-arm-template)

Ovaj direktorij sadrži kompletan Azure Resource Manager (ARM) predložak za implementaciju rješenja za podršku korisnicima u maloprodaji s više agenata, pružajući infrastrukturu kao kod za cijelu arhitekturu.

## 🎯 Što se implementira

### Osnovna infrastruktura
- **Azure OpenAI usluge** (Više regija za visoku dostupnost)
  - Primarna regija: GPT-4o za agenta za korisnike
  - Sekundarna regija: GPT-4o-mini za agenta za inventar  
  - Tercijarna regija: Model za tekstualne ugrađene podatke
  - Regija za evaluaciju: GPT-4o model za ocjenjivanje
- **Azure AI Search** s mogućnostima pretraživanja vektora
- **Azure Storage Account** s blob spremnicima za dokumente i prijenose
- **Azure Container Apps Environment** s automatskim skaliranjem
- **Container Apps** za usmjeravanje agenata i frontend
- **Azure Cosmos DB** za pohranu povijesti razgovora
- **Azure Key Vault** za upravljanje tajnama (opcionalno)
- **Application Insights** i Log Analytics za praćenje (opcionalno)
- **Document Intelligence** za obradu dokumenata
- **Bing Search API** za informacije u stvarnom vremenu

### Načini implementacije

| Način | Opis | Upotreba | Resursi |
|------|-------------|----------|-----------|
| **Minimalno** | Troškovno optimizirana osnovna implementacija | Razvoj, testiranje | Osnovni SKUs, jedna regija, smanjeni kapacitet |
| **Standardno** | Uravnotežena implementacija za produkcijske radne opterećenja | Produkcija, umjerena skala | Standardni SKUs, više regija, standardni kapacitet |
| **Premium** | Visoke performanse, implementacija za poduzeća | Poduzeća, velika skala | Premium SKUs, više regija, veliki kapacitet |

## 📋 Preduvjeti

1. **Azure CLI** instaliran i konfiguriran
2. **Aktivna Azure pretplata** s dovoljnim kvotama
3. **Odgovarajuće dozvole** za kreiranje resursa u ciljnoj pretplati
4. **Kvote resursa** za:
   - Azure OpenAI (provjerite dostupnost po regijama)
   - Container Apps (varira po regiji)
   - AI Search (preporučuje se standardni nivo ili viši)

## 🚀 Brza Implementacija

### Opcija 1: Korištenje Azure CLI

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

### Opcija 2: Korištenje Azure Portala

[![Implementiraj na Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opcija 3: Direktno korištenje Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opcije konfiguracije

### Parametri predloška

| Parametar | Tip | Zadano | Opis |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefiks za sve nazive resursa |
| `location` | string | Lokacija grupe resursa | Primarna regija implementacije |
| `secondaryLocation` | string | "westus2" | Sekundarna regija za implementaciju u više regija |
| `tertiaryLocation` | string | "francecentral" | Regija za model ugrađenih podataka |
| `environmentName` | string | "dev" | Oznaka okruženja (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfiguracija implementacije (minimalno/standardno/premium) |
| `enableMultiRegion` | bool | true | Omogućuje implementaciju u više regija |
| `enableMonitoring` | bool | true | Omogućuje Application Insights i logiranje |
| `enableSecurity` | bool | true | Omogućuje Key Vault i poboljšanu sigurnost |

### Prilagodba parametara

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

## 📖 Upotreba skripte za implementaciju

Skripta `deploy.sh` pruža interaktivno iskustvo implementacije:

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

### Značajke skripte

- ✅ **Provjera preduvjeta** (Azure CLI, status prijave, predlošci)
- ✅ **Upravljanje grupama resursa** (kreira ako ne postoji)
- ✅ **Validacija predloška** prije implementacije
- ✅ **Praćenje napretka** s obojenim izlazom
- ✅ **Prikaz rezultata implementacije**
- ✅ **Vodič nakon implementacije**

## 📊 Praćenje implementacije

### Provjera statusa implementacije

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

### Rezultati implementacije

Nakon uspješne implementacije, dostupni su sljedeći rezultati:

- **Frontend URL**: Javni endpoint za web sučelje
- **Router URL**: API endpoint za usmjeravanje agenata
- **OpenAI Endpoints**: Primarni i sekundarni OpenAI endpointi
- **Search Service**: Endpoint za Azure AI Search uslugu
- **Storage Account**: Naziv računa za pohranu dokumenata
- **Key Vault**: Naziv Key Vaulta (ako je omogućeno)
- **Application Insights**: Naziv usluge za praćenje (ako je omogućeno)

## 🔧 Konfiguracija nakon implementacije

### 1. Konfigurirajte indeks pretraživanja

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

### 2. Prenesite početne podatke

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testirajte endpointove agenata

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

ARM predložak implementira slike spremnika kao privremene. Za implementaciju stvarnog koda agenata:

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

## 🛠️ Rješavanje problema

### Uobičajeni problemi

#### 1. Prekoračena kvota za Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Neuspjela implementacija Container Apps

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

#### 3. Inicijalizacija usluge pretraživanja

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validacija implementacije

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

## 🔐 Sigurnosni aspekti

### Upravljanje ključevima
- Sve tajne pohranjene su u Azure Key Vaultu (ako je omogućeno)
- Container Apps koristi upravljani identitet za autentifikaciju
- Računi za pohranu imaju sigurne zadane postavke (samo HTTPS, bez javnog pristupa blobovima)

### Sigurnost mreže
- Container Apps koristi internu mrežu gdje je moguće
- Usluga pretraživanja konfigurirana s opcijom privatnih endpointova
- Cosmos DB konfiguriran s minimalnim potrebnim dozvolama

### RBAC Konfiguracija
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimizacija troškova

### Procjena troškova (Mjesečno, USD)

| Način | OpenAI | Container Apps | Search | Storage | Ukupno |
|------|--------|----------------|--------|---------|------------|
| Minimalno | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardno | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Praćenje troškova

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

## 🔄 Ažuriranja i održavanje

### Ažuriranja predloška
- Verzionirajte ARM predloške
- Testirajte promjene prvo u razvojnom okruženju
- Koristite inkrementalni način implementacije za ažuriranja

### Ažuriranja resursa
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup i oporavak
- Automatski backup za Cosmos DB omogućen
- Soft delete za Key Vault omogućen
- Verzije aplikacija spremnika održavaju se za povratak na prethodnu verziju

## 📞 Podrška

- **Problemi s predloškom**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure podrška**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Zajednica**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Spremni za implementaciju vašeg rješenja s više agenata?**

Započnite s: `./deploy.sh -g myResourceGroup`

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.