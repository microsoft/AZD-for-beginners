<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-21T16:27:02+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "nl"
}
-->
# Retail Multi-Agent Oplossing - Infrastructuur Template

**Hoofdstuk 5: Productie Implementatiepakket**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Gerelateerd Hoofdstuk**: [Hoofdstuk 5: Multi-Agent AI Oplossingen](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenario Gids**: [Volledige Architectuur](../retail-scenario.md)
- **🎯 Snelle Implementatie**: [One-Click Implementatie](../../../../examples/retail-multiagent-arm-template)

> **⚠️ ALLEEN INFRASTRUCTUUR TEMPLATE**  
> Deze ARM-template implementeert **Azure resources** voor een multi-agent systeem.  
>  
> **Wat wordt geïmplementeerd (15-25 minuten):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings in 3 regio's)
> - ✅ AI Zoekservice (leeg, klaar voor indexcreatie)
> - ✅ Container Apps (placeholder afbeeldingen, klaar voor jouw code)
> - ✅ Opslag, Cosmos DB, Key Vault, Application Insights
>  
> **Wat is NIET inbegrepen (vereist ontwikkeling):**
> - ❌ Agent implementatiecode (Customer Agent, Inventory Agent)
> - ❌ Routeringslogica en API-eindpunten
> - ❌ Frontend chat UI
> - ❌ Zoekindexschema's en datastromen
> - ❌ **Geschatte ontwikkelingsinspanning: 80-120 uur**
>  
> **Gebruik deze template als:**
> - ✅ Je Azure infrastructuur wilt voorzien voor een multi-agent project
> - ✅ Je van plan bent om agent implementatie apart te ontwikkelen
> - ✅ Je een productieklare infrastructuur baseline nodig hebt
>  
> **Gebruik niet als:**
> - ❌ Je direct een werkende multi-agent demo verwacht
> - ❌ Je op zoek bent naar volledige applicatiecodevoorbeelden

## Overzicht

Deze map bevat een uitgebreide Azure Resource Manager (ARM) template voor het implementeren van de **infrastructuur basis** van een multi-agent klantenondersteuningssysteem. De template voorziet alle benodigde Azure services, correct geconfigureerd en verbonden, klaar voor jouw applicatieontwikkeling.

**Na implementatie heb je:** Productieklare Azure infrastructuur  
**Om het systeem te voltooien heb je nodig:** Agent code, frontend UI en dataconfiguratie (zie [Architectuur Gids](../retail-scenario.md))

## 🎯 Wat Wordt Geïmplementeerd

### Kerninfrastructuur (Status Na Implementatie)

✅ **Azure OpenAI Services** (Klaar voor API-aanroepen)
  - Primaire regio: GPT-4o implementatie (20K TPM capaciteit)
  - Secundaire regio: GPT-4o-mini implementatie (10K TPM capaciteit)
  - Tertiaire regio: Tekst embeddings model (30K TPM capaciteit)
  - Evaluatieregio: GPT-4o grader model (15K TPM capaciteit)
  - **Status:** Volledig functioneel - kan direct API-aanroepen doen

✅ **Azure AI Zoekservice** (Leeg - klaar voor configuratie)
  - Vector zoekmogelijkheden ingeschakeld
  - Standaard tier met 1 partitie, 1 replica
  - **Status:** Service actief, maar vereist indexcreatie
  - **Actie nodig:** Maak zoekindex met jouw schema

✅ **Azure Opslagaccount** (Leeg - klaar voor uploads)
  - Blob containers: `documents`, `uploads`
  - Veilige configuratie (alleen HTTPS, geen openbare toegang)
  - **Status:** Klaar om bestanden te ontvangen
  - **Actie nodig:** Upload jouw productdata en documenten

⚠️ **Container Apps Omgeving** (Placeholder afbeeldingen geïmplementeerd)
  - Agent router app (nginx standaard afbeelding)
  - Frontend app (nginx standaard afbeelding)
  - Auto-scaling geconfigureerd (0-10 instanties)
  - **Status:** Placeholder containers actief
  - **Actie nodig:** Bouw en implementeer jouw agent applicaties

✅ **Azure Cosmos DB** (Leeg - klaar voor data)
  - Database en container vooraf geconfigureerd
  - Geoptimaliseerd voor lage latentie operaties
  - TTL ingeschakeld voor automatische opruiming
  - **Status:** Klaar om chatgeschiedenis op te slaan

✅ **Azure Key Vault** (Optioneel - klaar voor geheimen)
  - Soft delete ingeschakeld
  - RBAC geconfigureerd voor beheerde identiteiten
  - **Status:** Klaar om API-sleutels en verbindingsstrings op te slaan

✅ **Application Insights** (Optioneel - monitoring actief)
  - Verbonden met Log Analytics workspace
  - Aangepaste metrics en waarschuwingen geconfigureerd
  - **Status:** Klaar om telemetrie van jouw apps te ontvangen

✅ **Document Intelligence** (Klaar voor API-aanroepen)
  - S0 tier voor productie workloads
  - **Status:** Klaar om geüploade documenten te verwerken

✅ **Bing Zoek API** (Klaar voor API-aanroepen)
  - S1 tier voor realtime zoekopdrachten
  - **Status:** Klaar voor webzoekopdrachten

### Implementatiemodi

| Modus | OpenAI Capaciteit | Container Instanties | Zoek Tier | Opslag Redundantie | Beste Voor |
|-------|-------------------|----------------------|-----------|--------------------|------------|
| **Minimal** | 10K-20K TPM | 0-2 replica's | Basic | LRS (Lokaal) | Ontwikkeling/test, leren, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replica's | Standaard | ZRS (Zone) | Productie, matig verkeer (<10K gebruikers) |
| **Premium** | 80K-150K TPM | 5-10 replica's, zone-redundant | Premium | GRS (Geo) | Enterprise, hoog verkeer (>10K gebruikers), 99.99% SLA |

**Kostenimpact:**
- **Minimal → Standard:** ~4x kostenstijging ($100-370/maand → $420-1,450/maand)
- **Standard → Premium:** ~3x kostenstijging ($420-1,450/maand → $1,150-3,500/maand)
- **Kies op basis van:** Verwachte belasting, SLA-vereisten, budgetbeperkingen

**Capaciteitsplanning:**
- **TPM (Tokens Per Minute):** Totaal over alle modelimplementaties
- **Container Instanties:** Auto-scaling bereik (min-max replica's)
- **Zoek Tier:** Beïnvloedt queryprestaties en indexgrootte limieten

## 📋 Vereisten

### Vereiste Tools
1. **Azure CLI** (versie 2.50.0 of hoger)
   ```bash
   az --version  # Controleer versie
   az login      # Verifiëren
   ```

2. **Actief Azure abonnement** met Eigenaar of Bijdrager toegang
   ```bash
   az account show  # Verifieer abonnement
   ```

### Vereiste Azure Quota's

Controleer vóór implementatie of er voldoende quota's beschikbaar zijn in jouw doelregio's:

```bash
# Controleer de beschikbaarheid van Azure OpenAI in uw regio
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifieer OpenAI-quota (voorbeeld voor gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Controleer Container Apps-quota
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimaal Vereiste Quota's:**
- **Azure OpenAI:** 3-4 modelimplementaties in verschillende regio's
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Let op:** GPT-4o kan een wachtlijst hebben in sommige regio's - controleer [modelbeschikbaarheid](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Beheerde omgeving + 2-10 container instanties
- **AI Zoekservice:** Standaard tier (Basic onvoldoende voor vectorzoekopdrachten)
- **Cosmos DB:** Standaard geprovisioneerde throughput

**Als quota onvoldoende zijn:**
1. Ga naar Azure Portal → Quota's → Verzoek om verhoging
2. Of gebruik Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Overweeg alternatieve regio's met beschikbaarheid

## 🚀 Snelle Implementatie

### Optie 1: Gebruik Azure CLI

```bash
# Clone of download de templatebestanden
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Maak het implementatiescript uitvoerbaar
chmod +x deploy.sh

# Implementeer met standaardinstellingen
./deploy.sh -g myResourceGroup

# Implementeer voor productie met premiumfuncties
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Optie 2: Gebruik Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Optie 3: Gebruik Azure CLI direct

```bash
# Maak resourcegroep
az group create --name myResourceGroup --location eastus2

# Implementeer sjabloon
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Implementatietijdlijn

### Wat te Verwachten

| Fase | Duur | Wat Gebeurt Er |
|------|------|----------------||
| **Template Validatie** | 30-60 seconden | Azure valideert ARM template syntax en parameters |
| **Resourcegroep Setup** | 10-20 seconden | Maakt resourcegroep (indien nodig) |
| **OpenAI Implementatie** | 5-8 minuten | Maakt 3-4 OpenAI accounts en implementeert modellen |
| **Container Apps** | 3-5 minuten | Maakt omgeving en implementeert placeholder containers |
| **Zoek & Opslag** | 2-4 minuten | Voorziet AI Zoekservice en opslagaccounts |
| **Cosmos DB** | 2-3 minuten | Maakt database en configureert containers |
| **Monitoring Setup** | 2-3 minuten | Stelt Application Insights en Log Analytics in |
| **RBAC Configuratie** | 1-2 minuten | Configureert beheerde identiteiten en permissies |
| **Totale Implementatie** | **15-25 minuten** | Volledige infrastructuur klaar |

**Na Implementatie:**
- ✅ **Infrastructuur Klaar:** Alle Azure services geïmplementeerd en actief
- ⏱️ **Applicatieontwikkeling:** 80-120 uur (jouw verantwoordelijkheid)
- ⏱️ **Index Configuratie:** 15-30 minuten (vereist jouw schema)
- ⏱️ **Data Upload:** Afhankelijk van datasetgrootte
- ⏱️ **Testen & Validatie:** 2-4 uur

---

## ✅ Verifieer Implementatiesucces

### Stap 1: Controleer Resource Implementatie (2 minuten)

```bash
# Verifieer of alle resources succesvol zijn ingezet
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Verwacht:** Lege tabel (alle resources tonen "Succeeded" status)

### Stap 2: Verifieer Azure OpenAI Implementaties (3 minuten)

```bash
# Lijst alle OpenAI-accounts
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Controleer modelimplementaties voor de primaire regio
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Verwacht:** 
- 3-4 OpenAI accounts (primaire, secundaire, tertiaire, evaluatieregio's)
- 1-2 modelimplementaties per account (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Stap 3: Test Infrastructuur Eindpunten (5 minuten)

```bash
# Haal Container App URL's op
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Test router eindpunt (plaatsvervangende afbeelding zal reageren)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Verwacht:** 
- Container Apps tonen "Running" status
- Placeholder nginx reageert met HTTP 200 of 404 (nog geen applicatiecode)

### Stap 4: Verifieer Azure OpenAI API Toegang (3 minuten)

```bash
# Haal OpenAI-eindpunt en sleutel op
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Test GPT-4o implementatie
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Verwacht:** JSON-reactie met chatvoltooiing (bevestigt dat OpenAI functioneel is)

### Wat Werkt vs. Wat Niet

**✅ Werkt Na Implementatie:**
- Azure OpenAI modellen geïmplementeerd en accepteren API-aanroepen
- AI Zoekservice actief (leeg, geen indexen nog)
- Container Apps actief (placeholder nginx afbeeldingen)
- Opslagaccounts toegankelijk en klaar voor uploads
- Cosmos DB klaar voor dataoperaties
- Application Insights verzamelt infrastructuurtelemetrie
- Key Vault klaar voor geheimenopslag

**❌ Werkt Nog Niet (Vereist Ontwikkeling):**
- Agent eindpunten (geen applicatiecode geïmplementeerd)
- Chatfunctionaliteit (vereist frontend + backend implementatie)
- Zoekopdrachten (geen zoekindex nog gemaakt)
- Documentverwerkingsstroom (geen data geüpload)
- Aangepaste telemetrie (vereist applicatie-instrumentatie)

**Volgende Stappen:** Zie [Post-Implementatie Configuratie](../../../../examples/retail-multiagent-arm-template) om jouw applicatie te ontwikkelen en implementeren

---

## ⚙️ Configuratieopties

### Template Parameters

| Parameter | Type | Standaard | Beschrijving |
|-----------|------|----------|--------------|
| `projectName` | string | "retail" | Prefix voor alle resource namen |
| `location` | string | Resourcegroep locatie | Primaire implementatieregio |
| `secondaryLocation` | string | "westus2" | Secundaire regio voor multi-regio implementatie |
| `tertiaryLocation` | string | "francecentral" | Regio voor embeddings model |
| `environmentName` | string | "dev" | Omgevingsaanduiding (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Implementatieconfiguratie (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Multi-regio implementatie inschakelen |
| `enableMonitoring` | bool | true | Application Insights en logging inschakelen |
| `enableSecurity` | bool | true | Key Vault en verbeterde beveiliging inschakelen |

### Parameters Aanpassen

Bewerk `azuredeploy.parameters.json`:

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

## 🏗️ Architectuuroverzicht

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

## 📖 Implementatiescript Gebruik

Het `deploy.sh` script biedt een interactieve implementatie-ervaring:

```bash
# Toon hulp
./deploy.sh --help

# Basisimplementatie
./deploy.sh -g myResourceGroup

# Geavanceerde implementatie met aangepaste instellingen
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Ontwikkelingsimplementatie zonder multi-regio
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Script Functies

- ✅ **Vereistenvalidatie** (Azure CLI, loginstatus, templatebestanden)
- ✅ **Resourcegroepbeheer** (maakt aan indien niet aanwezig)
- ✅ **Templatevalidatie** vóór implementatie
- ✅ **Voortgangsmonitoring** met gekleurde output
- ✅ **Implementatie-uitvoer** weergave
- ✅ **Post-implementatie begeleiding**

## 📊 Implementatie Monitoren

### Controleer Implementatiestatus

```bash
# Lijst implementaties
az deployment group list --resource-group myResourceGroup --output table

# Verkrijg implementatiedetails
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Bekijk implementatievoortgang
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Implementatie Uitvoer

Na succesvolle implementatie zijn de volgende uitvoer beschikbaar:

- **Frontend URL**: Publiek eindpunt voor de webinterface
- **Router URL**: API-eindpunt voor de agent router
- **OpenAI Eindpunten**: Primaire en secundaire OpenAI service eindpunten
- **Zoekservice**: Azure AI Zoekservice eindpunt
- **Opslagaccount**: Naam van het opslagaccount voor documenten
- **Key Vault**: Naam van de Key Vault (indien ingeschakeld)
- **Application Insights**: Naam van de monitoringservice (indien ingeschakeld)

## 🔧 Post-Implementatie: Volgende Stappen
> **📝 Belangrijk:** De infrastructuur is geïmplementeerd, maar je moet de applicatiecode ontwikkelen en implementeren.

### Fase 1: Ontwikkel Agent Applicaties (Jouw Verantwoordelijkheid)

De ARM-template maakt **lege Container Apps** met tijdelijke nginx-afbeeldingen. Jij moet:

**Vereiste Ontwikkeling:**
1. **Agent Implementatie** (30-40 uur)
   - Klantenservice-agent met GPT-4o-integratie
   - Inventarisagent met GPT-4o-mini-integratie
   - Logica voor agentroutering

2. **Frontend Ontwikkeling** (20-30 uur)
   - Chatinterface UI (React/Vue/Angular)
   - Functionaliteit voor bestand uploaden
   - Weergave en opmaak van reacties

3. **Backend Services** (12-16 uur)
   - FastAPI of Express-router
   - Authenticatie-middleware
   - Telemetrie-integratie

**Zie:** [Architectuurgids](../retail-scenario.md) voor gedetailleerde implementatiepatronen en codevoorbeelden

### Fase 2: Configureer AI Zoekindex (15-30 minuten)

Maak een zoekindex die overeenkomt met je datamodel:

```bash
# Haal zoekservicedetails op
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Maak een index met je schema (voorbeeld)
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

**Bronnen:**
- [AI Zoekindex Schema Ontwerp](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vector Zoekconfiguratie](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Upload Je Data (Tijd varieert)

Zodra je productdata en documenten hebt:

```bash
# Haal opslagaccountgegevens op
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Upload uw documenten
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Voorbeeld: Upload een enkel bestand
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Bouw en Implementeer Je Applicaties (8-12 uur)

Zodra je je agentcode hebt ontwikkeld:

```bash
# 1. Maak Azure Container Registry (indien nodig)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Bouw en push agent router afbeelding
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Bouw en push frontend afbeelding
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Update Container Apps met jouw afbeeldingen
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Configureer omgevingsvariabelen
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fase 5: Test Je Applicatie (2-4 uur)

```bash
# Haal de URL van uw applicatie op
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Test de agent-eindpunt (zodra uw code is geïmplementeerd)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Controleer applicatielogs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Implementatiebronnen

**Architectuur & Ontwerp:**
- 📖 [Volledige Architectuurgids](../retail-scenario.md) - Gedetailleerde implementatiepatronen
- 📖 [Multi-Agent Ontwerppatronen](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Codevoorbeelden:**
- 🔗 [Azure OpenAI Chat Voorbeeld](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG-patroon
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agentframework (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agentorkestratie (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agent gesprekken

**Geschatte Totale Inspanning:**
- Implementatie van infrastructuur: 15-25 minuten (✅ Voltooid)
- Applicatieontwikkeling: 80-120 uur (🔨 Jouw werk)
- Testen en optimalisatie: 15-25 uur (🔨 Jouw werk)

## 🛠️ Problemen oplossen

### Veelvoorkomende Problemen

#### 1. Azure OpenAI Quota Overschreden

```bash
# Controleer het huidige quotagebruik
az cognitiveservices usage list --location eastus2

# Vraag om een quotaverhoging
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps Implementatie Mislukt

```bash
# Controleer container-app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Herstart container-app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisatie van Zoekservice

```bash
# Verifieer de status van de zoekservice
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test de connectiviteit van de zoekservice
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validatie van Implementatie

```bash
# Valideer dat alle resources zijn aangemaakt
az resource list \
  --resource-group myResourceGroup \
  --output table

# Controleer de gezondheid van de resources
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Veiligheidsoverwegingen

### Sleutelbeheer
- Alle geheimen worden opgeslagen in Azure Key Vault (indien ingeschakeld)
- Container apps gebruiken managed identity voor authenticatie
- Opslagaccounts hebben veilige standaardinstellingen (alleen HTTPS, geen openbare blobtoegang)

### Netwerkbeveiliging
- Container apps gebruiken interne netwerken waar mogelijk
- Zoekservice geconfigureerd met optie voor private endpoints
- Cosmos DB geconfigureerd met minimale benodigde permissies

### RBAC Configuratie
```bash
# Wijs de benodigde rollen toe voor beheerde identiteit
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostenoptimalisatie

### Kostenramingen (Maandelijks, USD)

| Modus | OpenAI | Container Apps | Zoekservice | Opslag | Totale Schatting |
|-------|--------|----------------|-------------|--------|------------------|
| Minimaal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standaard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kostenmonitoring

```bash
# Stel budgetwaarschuwingen in
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Updates en Onderhoud

### Template Updates
- Versiebeheer de ARM-templatebestanden
- Test wijzigingen eerst in de ontwikkelomgeving
- Gebruik incrementele implementatiemodus voor updates

### Resource Updates
```bash
# Bijwerken met nieuwe parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Back-up en Herstel
- Cosmos DB automatische back-up ingeschakeld
- Key Vault soft delete ingeschakeld
- Container app-revisies behouden voor rollback

## 📞 Ondersteuning

- **Template Problemen**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Ondersteuning**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Klaar om je multi-agent oplossing te implementeren?**

Begin met: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->