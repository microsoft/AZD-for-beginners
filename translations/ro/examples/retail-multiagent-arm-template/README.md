<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T12:14:39+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ro"
}
-->
# Soluție Multi-Agent Retail - Implementare ARM Template

**Capitolul 5: Pachet de Implementare în Producție**
- **📚 Curs Acasă**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Corelat**: [Capitolul 5: Soluții AI Multi-Agent](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Ghid Scenariu**: [Implementare Completă](../retail-scenario.md)
- **🎯 Implementare Rapidă**: [Implementare cu un singur click](../../../../examples/retail-multiagent-arm-template)

Acest director conține un template complet Azure Resource Manager (ARM) pentru implementarea soluției Multi-Agent de Suport Clienți în retail, oferind infrastructură ca cod pentru întreaga arhitectură.

## 🎯 Ce se implementează

### Infrastructura de bază
- **Servicii Azure OpenAI** (Multi-regiune pentru disponibilitate ridicată)
  - Regiunea principală: GPT-4o pentru agentul de clienți
  - Regiunea secundară: GPT-4o-mini pentru agentul de inventar  
  - Regiunea terțiară: Model de text embeddings
  - Regiunea de evaluare: Model evaluator GPT-4o
- **Azure AI Search** cu capabilități de căutare vectorială
- **Azure Storage Account** cu containere blob pentru documente și încărcări
- **Mediu Azure Container Apps** cu auto-scalare
- **Container Apps** pentru routerul de agenți și interfața frontend
- **Azure Cosmos DB** pentru stocarea istoricului conversațiilor
- **Azure Key Vault** pentru gestionarea secretelor (opțional)
- **Application Insights** și Log Analytics pentru monitorizare (opțional)
- **Document Intelligence** pentru procesarea documentelor
- **Bing Search API** pentru informații în timp real

### Moduri de implementare

| Mod | Descriere | Utilizare | Resurse |
|-----|-----------|-----------|---------|
| **Minimal** | Implementare optimizată pentru costuri | Dezvoltare, testare | SKUs de bază, o singură regiune, capacitate redusă |
| **Standard** | Implementare echilibrată pentru sarcini de producție | Producție, scală moderată | SKUs standard, multi-regiune, capacitate standard |
| **Premium** | Performanță ridicată, implementare de nivel enterprise | Enterprise, scală mare | SKUs premium, multi-regiune, capacitate ridicată |

## 📋 Cerințe preliminare

1. **Azure CLI** instalat și configurat
2. **Abonament Azure activ** cu cote suficiente
3. **Permisiuni adecvate** pentru crearea resurselor în abonamentul țintă
4. **Cote de resurse** pentru:
   - Azure OpenAI (verificați disponibilitatea regională)
   - Container Apps (variază în funcție de regiune)
   - AI Search (se recomandă tierul standard sau superior)

## 🚀 Implementare Rapidă

### Opțiunea 1: Utilizând Azure CLI

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

### Opțiunea 2: Utilizând Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opțiunea 3: Utilizând Azure CLI direct

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opțiuni de Configurare

### Parametrii Template-ului

| Parametru | Tip | Implicit | Descriere |
|-----------|-----|----------|-----------|
| `projectName` | string | "retail" | Prefix pentru toate numele resurselor |
| `location` | string | Locația grupului de resurse | Regiunea principală de implementare |
| `secondaryLocation` | string | "westus2" | Regiunea secundară pentru implementare multi-regiune |
| `tertiaryLocation` | string | "francecentral" | Regiunea pentru modelul embeddings |
| `environmentName` | string | "dev" | Designația mediului (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configurația implementării (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Activare implementare multi-regiune |
| `enableMonitoring` | bool | true | Activare Application Insights și logare |
| `enableSecurity` | bool | true | Activare Key Vault și securitate avansată |

### Personalizarea Parametrilor

Editați `azuredeploy.parameters.json`:

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

## 🏗️ Prezentare Generală a Arhitecturii

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

## 📖 Utilizarea Scriptului de Implementare

Scriptul `deploy.sh` oferă o experiență interactivă de implementare:

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

### Funcționalități ale Scriptului

- ✅ **Validarea cerințelor preliminare** (Azure CLI, status login, fișiere template)
- ✅ **Gestionarea grupului de resurse** (creează dacă nu există)
- ✅ **Validarea template-ului** înainte de implementare
- ✅ **Monitorizarea progresului** cu output colorat
- ✅ **Afișarea rezultatelor implementării**
- ✅ **Ghid post-implementare**

## 📊 Monitorizarea Implementării

### Verificarea Statusului Implementării

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

### Rezultatele Implementării

După o implementare reușită, următoarele rezultate sunt disponibile:

- **URL Frontend**: Endpoint public pentru interfața web
- **URL Router**: Endpoint API pentru routerul de agenți
- **Endpoint-uri OpenAI**: Servicii OpenAI primare și secundare
- **Serviciu de Căutare**: Endpoint serviciu Azure AI Search
- **Cont de Stocare**: Numele contului de stocare pentru documente
- **Key Vault**: Numele Key Vault (dacă este activat)
- **Application Insights**: Numele serviciului de monitorizare (dacă este activat)

## 🔧 Configurare Post-Implementare

### 1. Configurarea Indexului de Căutare

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

### 2. Încărcarea Datelor Inițiale

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testarea Endpoint-urilor Agenților

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Configurarea Container Apps

Template-ul ARM implementează imagini container placeholder. Pentru a implementa codul real al agenților:

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

## 🛠️ Depanare

### Probleme Frecvente

#### 1. Cota Azure OpenAI Depășită

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Eșec la Implementarea Container Apps

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

#### 3. Inițializarea Serviciului de Căutare

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validarea Implementării

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

## 🔐 Considerații de Securitate

### Gestionarea Cheilor
- Toate secretele sunt stocate în Azure Key Vault (dacă este activat)
- Container apps utilizează identitate gestionată pentru autentificare
- Conturile de stocare au setări de securitate implicite (doar HTTPS, fără acces public la blob-uri)

### Securitatea Rețelei
- Container apps utilizează rețele interne, unde este posibil
- Serviciul de căutare configurat cu opțiunea de endpoint-uri private
- Cosmos DB configurat cu permisiuni minime necesare

### Configurarea RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimizarea Costurilor

### Estimări de Costuri (Lunar, USD)

| Mod | OpenAI | Container Apps | Search | Storage | Total Est. |
|-----|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorizarea Costurilor

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

## 🔄 Actualizări și Mentenanță

### Actualizări Template
- Controlați versiunea fișierelor template ARM
- Testați modificările mai întâi în mediul de dezvoltare
- Utilizați modul de implementare incremental pentru actualizări

### Actualizări Resurse
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup și Recuperare
- Backup automat activat pentru Cosmos DB
- Soft delete activat pentru Key Vault
- Revizii ale aplicațiilor container menținute pentru rollback

## 📞 Suport

- **Probleme Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suport Azure**: [Portal Suport Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunitate**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Gata să implementezi soluția ta multi-agent?**

Începe cu: `./deploy.sh -g myResourceGroup`

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.