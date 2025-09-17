<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T23:41:29+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "sv"
}
-->
# Retail Multi-Agent Solution - ARM-mall för distribution

**Kapitel 5: Produktionsdistributionspaket**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Relaterat Kapitel**: [Kapitel 5: Multi-Agent AI-lösningar](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenarioguide**: [Fullständig Implementering](../retail-scenario.md)
- **🎯 Snabbdistribution**: [Enklicksdistribution](../../../../examples/retail-multiagent-arm-template)

Denna katalog innehåller en komplett Azure Resource Manager (ARM)-mall för att distribuera detaljhandelslösningen för Multi-Agent kundsupport, vilket tillhandahåller infrastruktur som kod för hela arkitekturen.

## 🎯 Vad som distribueras

### Kärninfrastruktur
- **Azure OpenAI Services** (Multi-region för hög tillgänglighet)
  - Primär region: GPT-4o för kundagent
  - Sekundär region: GPT-4o-mini för lageragent  
  - Tertiär region: Textinbäddningsmodell
  - Utvärderingsregion: GPT-4o graderingsmodell
- **Azure AI Search** med vektorsökningsfunktioner
- **Azure Storage Account** med blob-containrar för dokument och uppladdningar
- **Azure Container Apps Environment** med automatisk skalning
- **Container Apps** för agentrouter och frontend
- **Azure Cosmos DB** för lagring av chattloggar
- **Azure Key Vault** för hantering av hemligheter (valfritt)
- **Application Insights** och Log Analytics för övervakning (valfritt)
- **Document Intelligence** för dokumentbearbetning
- **Bing Search API** för realtidsinformation

### Distributionslägen

| Läge | Beskrivning | Användningsfall | Resurser |
|------|-------------|-----------------|----------|
| **Minimal** | Kostnadsoptimerad grundläggande distribution | Utveckling, testning | Grundläggande SKUs, en region, reducerad kapacitet |
| **Standard** | Balanserad distribution för produktionsarbetsbelastningar | Produktion, måttlig skala | Standard-SKUs, multi-region, standardkapacitet |
| **Premium** | Högpresterande, företagsklassad distribution | Företag, hög skala | Premium-SKUs, multi-region, hög kapacitet |

## 📋 Förutsättningar

1. **Azure CLI** installerad och konfigurerad
2. **Aktivt Azure-abonnemang** med tillräckliga kvoter
3. **Lämpliga behörigheter** för att skapa resurser i målabonnemanget
4. **Resurskvoter** för:
   - Azure OpenAI (kontrollera regional tillgänglighet)
   - Container Apps (varierar beroende på region)
   - AI Search (standardnivå eller högre rekommenderas)

## 🚀 Snabbdistribution

### Alternativ 1: Använda Azure CLI

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

### Alternativ 2: Använda Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Alternativ 3: Använda Azure CLI direkt

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigurationsalternativ

### Mallparametrar

| Parameter | Typ | Standard | Beskrivning |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefix för alla resursnamn |
| `location` | string | Resursgruppens plats | Primär distributionsregion |
| `secondaryLocation` | string | "westus2" | Sekundär region för multi-region distribution |
| `tertiaryLocation` | string | "francecentral" | Region för inbäddningsmodell |
| `environmentName` | string | "dev" | Miljöbeteckning (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Distributionskonfiguration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktivera multi-region distribution |
| `enableMonitoring` | bool | true | Aktivera Application Insights och loggning |
| `enableSecurity` | bool | true | Aktivera Key Vault och förbättrad säkerhet |

### Anpassa parametrar

Redigera `azuredeploy.parameters.json`:

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

## 🏗️ Arkitekturöversikt

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

## 📖 Användning av distributionsskript

Skriptet `deploy.sh` erbjuder en interaktiv distributionsupplevelse:

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

### Skriptfunktioner

- ✅ **Validering av förutsättningar** (Azure CLI, inloggningsstatus, mallfiler)
- ✅ **Hantering av resursgrupper** (skapar om det inte finns)
- ✅ **Mallvalidering** före distribution
- ✅ **Övervakning av framsteg** med färgkodad output
- ✅ **Visning av distributionsresultat**
- ✅ **Vägledning efter distribution**

## 📊 Övervakning av distribution

### Kontrollera distributionsstatus

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

### Distributionsresultat

Efter en lyckad distribution är följande resultat tillgängliga:

- **Frontend URL**: Publik endpoint för webbgränssnittet
- **Router URL**: API-endpoint för agentrouter
- **OpenAI Endpoints**: Primära och sekundära OpenAI-tjänstendpoints
- **Search Service**: Azure AI Search-tjänstendpoint
- **Storage Account**: Namn på lagringskontot för dokument
- **Key Vault**: Namn på Key Vault (om aktiverad)
- **Application Insights**: Namn på övervakningstjänsten (om aktiverad)

## 🔧 Konfiguration efter distribution

### 1. Konfigurera sökindex

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

### 2. Ladda upp initial data

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testa agentendpoints

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurera Container Apps

ARM-mallen distribuerar platshållarcontainerbilder. För att distribuera faktisk agentkod:

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

## 🛠️ Felsökning

### Vanliga problem

#### 1. Azure OpenAI-kvot överskriden

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps-distribution misslyckades

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

#### 3. Initialisering av söktjänst

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validering av distribution

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

## 🔐 Säkerhetsöverväganden

### Hantering av nycklar
- Alla hemligheter lagras i Azure Key Vault (om aktiverad)
- Container Apps använder hanterad identitet för autentisering
- Lagringskonton har säkra standardinställningar (endast HTTPS, ingen offentlig blobåtkomst)

### Nätverkssäkerhet
- Container Apps använder intern nätverkning där det är möjligt
- Söktjänsten konfigurerad med alternativ för privata endpoints
- Cosmos DB konfigurerad med minimalt nödvändiga behörigheter

### RBAC-konfiguration
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostnadsoptimering

### Kostnadsuppskattningar (Månatligt, USD)

| Läge | OpenAI | Container Apps | Search | Storage | Total Est. |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kostnadsövervakning

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

## 🔄 Uppdateringar och underhåll

### Malluppdateringar
- Versionskontrollera ARM-mallfilerna
- Testa ändringar i utvecklingsmiljön först
- Använd inkrementellt distributionsläge för uppdateringar

### Resursuppdateringar
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup och återställning
- Cosmos DB automatisk backup aktiverad
- Key Vault mjuk radering aktiverad
- Container App-revisioner bibehålls för återställning

## 📞 Support

- **Mallproblem**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Redo att distribuera din multi-agentlösning?**

Starta med: `./deploy.sh -g myResourceGroup`

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.