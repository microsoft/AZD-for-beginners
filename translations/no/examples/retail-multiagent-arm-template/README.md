<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T07:25:08+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "no"
}
-->
# Retail Multi-Agent Solution - ARM-mal for distribusjon

**Kapittel 5: Produksjonsdistribusjonspakke**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Relatert kapittel**: [Kapittel 5: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenario Guide**: [Fullstendig implementering](../retail-scenario.md)
- **🎯 Rask distribusjon**: [Ett-klikk distribusjon](../../../../examples/retail-multiagent-arm-template)

Denne katalogen inneholder en komplett Azure Resource Manager (ARM)-mal for distribusjon av detaljhandelens Multi-Agent kundestøtteløsning, og gir infrastruktur som kode for hele arkitekturen.

## 🎯 Hva som distribueres

### Kjerneinfrastruktur
- **Azure OpenAI Services** (Multi-region for høy tilgjengelighet)
  - Primærregion: GPT-4o for kundeagent
  - Sekundærregion: GPT-4o-mini for lageragent  
  - Tertiærregion: Tekstinnbindingsmodell
  - Evalueringsregion: GPT-4o grader-modell
- **Azure AI Search** med vektorsøkeegenskaper
- **Azure Storage Account** med blob-containere for dokumenter og opplastinger
- **Azure Container Apps Environment** med auto-skalering
- **Container Apps** for agentrouter og frontend
- **Azure Cosmos DB** for lagring av chathistorikk
- **Azure Key Vault** for hemmelighetsadministrasjon (valgfritt)
- **Application Insights** og Log Analytics for overvåking (valgfritt)
- **Document Intelligence** for dokumentbehandling
- **Bing Search API** for sanntidsinformasjon

### Distribusjonsmoduser

| Modus | Beskrivelse | Bruksområde | Ressurser |
|-------|-------------|-------------|-----------|
| **Minimal** | Kostnadsoptimalisert grunnleggende distribusjon | Utvikling, testing | Grunnleggende SKUs, én region, redusert kapasitet |
| **Standard** | Balansert distribusjon for produksjonsarbeidsbelastninger | Produksjon, moderat skala | Standard SKUs, multi-region, standard kapasitet |
| **Premium** | Høy ytelse, bedriftsnivå distribusjon | Bedrift, høy skala | Premium SKUs, multi-region, høy kapasitet |

## 📋 Forutsetninger

1. **Azure CLI** installert og konfigurert
2. **Aktivt Azure-abonnement** med tilstrekkelige kvoter
3. **Rettigheter** til å opprette ressurser i mål-abonnementet
4. **Ressurskvoter** for:
   - Azure OpenAI (sjekk regional tilgjengelighet)
   - Container Apps (varierer etter region)
   - AI Search (standardnivå eller høyere anbefales)

## 🚀 Rask distribusjon

### Alternativ 1: Bruke Azure CLI

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

### Alternativ 2: Bruke Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Alternativ 3: Bruke Azure CLI direkte

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Konfigurasjonsalternativer

### Malparametere

| Parameter | Type | Standard | Beskrivelse |
|-----------|------|----------|-------------|
| `projectName` | string | "retail" | Prefiks for alle ressursnavn |
| `location` | string | Ressursgruppeplassering | Primær distribusjonsregion |
| `secondaryLocation` | string | "westus2" | Sekundærregion for multi-region distribusjon |
| `tertiaryLocation` | string | "francecentral" | Region for innbindingsmodell |
| `environmentName` | string | "dev" | Miljøbetegnelse (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Distribusjonskonfigurasjon (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktiver multi-region distribusjon |
| `enableMonitoring` | bool | true | Aktiver Application Insights og logging |
| `enableSecurity` | bool | true | Aktiver Key Vault og forbedret sikkerhet |

### Tilpasning av parametere

Rediger `azuredeploy.parameters.json`:

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

## 🏗️ Arkitekturoversikt

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

## 📖 Bruk av distribusjonsskript

`deploy.sh`-skriptet gir en interaktiv distribusjonsopplevelse:

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

### Skriptfunksjoner

- ✅ **Validering av forutsetninger** (Azure CLI, innloggingsstatus, malfiler)
- ✅ **Administrasjon av ressursgrupper** (oppretter hvis ikke eksisterer)
- ✅ **Malvalidering** før distribusjon
- ✅ **Fremdriftsovervåking** med fargekodet utdata
- ✅ **Visning av distribusjonsresultater**
- ✅ **Veiledning etter distribusjon**

## 📊 Overvåking av distribusjon

### Sjekk distribusjonsstatus

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

### Distribusjonsresultater

Etter vellykket distribusjon er følgende resultater tilgjengelige:

- **Frontend URL**: Offentlig endepunkt for webgrensesnittet
- **Router URL**: API-endepunkt for agentrouter
- **OpenAI Endpoints**: Primære og sekundære OpenAI-tjenesteendepunkter
- **Search Service**: Azure AI Search-tjenesteendepunkt
- **Storage Account**: Navn på lagringskontoen for dokumenter
- **Key Vault**: Navn på Key Vault (hvis aktivert)
- **Application Insights**: Navn på overvåkingstjenesten (hvis aktivert)

## 🔧 Konfigurasjon etter distribusjon

### 1. Konfigurer søkeindeks

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

### 2. Last opp innledende data

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Test agentendepunkter

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurer Container Apps

ARM-malen distribuerer plassholder-containerbilder. For å distribuere faktisk agentkode:

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

## 🛠️ Feilsøking

### Vanlige problemer

#### 1. Azure OpenAI-kvote overskredet

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps-distribusjon mislyktes

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

#### 3. Initialisering av søketjeneste

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validering av distribusjon

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

## 🔐 Sikkerhetsvurderinger

### Nøkkeladministrasjon
- Alle hemmeligheter lagres i Azure Key Vault (når aktivert)
- Container Apps bruker administrert identitet for autentisering
- Lagringskontoer har sikre standardinnstillinger (kun HTTPS, ingen offentlig blob-tilgang)

### Nettverkssikkerhet
- Container Apps bruker intern nettverkskonfigurasjon der det er mulig
- Søketjeneste konfigurert med privat endepunkt-alternativ
- Cosmos DB konfigurert med minimale nødvendige tillatelser

### RBAC-konfigurasjon
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostnadsoptimalisering

### Kostnadsestimater (månedlig, USD)

| Modus | OpenAI | Container Apps | Search | Storage | Total Est. |
|-------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kostnadsovervåking

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

## 🔄 Oppdateringer og vedlikehold

### Maloppdateringer
- Versjonskontroller ARM-malfilene
- Test endringer i utviklingsmiljø først
- Bruk inkrementell distribusjonsmodus for oppdateringer

### Ressursoppdateringer
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup og gjenoppretting
- Cosmos DB automatisk backup aktivert
- Key Vault soft delete aktivert
- Container App-revisjoner opprettholdt for tilbakestilling

## 📞 Support

- **Malproblemer**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Klar til å distribuere din multi-agent løsning?**

Start med: `./deploy.sh -g myResourceGroup`

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.