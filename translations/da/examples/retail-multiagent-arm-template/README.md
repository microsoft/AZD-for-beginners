<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-21T09:03:47+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "da"
}
-->
# Retail Multi-Agent Løsning - Infrastruktur Skabelon

**Kapitel 5: Produktionsudrulningspakke**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Relateret Kapitel**: [Kapitel 5: Multi-Agent AI Løsninger](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenarieguide**: [Komplet Arkitektur](../retail-scenario.md)
- **🎯 Hurtig Udrulning**: [Én-Klik Udrulning](../../../../examples/retail-multiagent-arm-template)

> **⚠️ KUN INFRASTRUKTUR SKABELON**  
> Denne ARM-skabelon udruller **Azure ressourcer** til et multi-agent system.  
>  
> **Hvad der bliver udrullet (15-25 minutter):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings på tværs af 3 regioner)
> - ✅ AI Search service (tom, klar til oprettelse af indeks)
> - ✅ Container Apps (pladsholder billeder, klar til din kode)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Hvad der IKKE er inkluderet (kræver udvikling):**
> - ❌ Agent implementeringskode (Kundeagent, Lageragent)
> - ❌ Routing logik og API endpoints
> - ❌ Frontend chat UI
> - ❌ Søgeindeks skemaer og datapipelines
> - ❌ **Estimeret udviklingsindsats: 80-120 timer**
>  
> **Brug denne skabelon hvis:**
> - ✅ Du vil klargøre Azure infrastruktur til et multi-agent projekt
> - ✅ Du planlægger at udvikle agent implementering separat
> - ✅ Du har brug for en produktionsklar infrastruktur baseline
>  
> **Brug ikke hvis:**
> - ❌ Du forventer en fungerende multi-agent demo med det samme
> - ❌ Du leder efter komplette applikationskodeeksempler

## Oversigt

Denne mappe indeholder en omfattende Azure Resource Manager (ARM) skabelon til udrulning af **infrastruktur fundamentet** for et multi-agent kundesupportsystem. Skabelonen klargør alle nødvendige Azure-tjenester, korrekt konfigureret og forbundet, klar til din applikationsudvikling.

**Efter udrulning har du:** Produktionsklar Azure infrastruktur  
**For at fuldføre systemet skal du bruge:** Agentkode, frontend UI og datakonfiguration (se [Arkitekturguide](../retail-scenario.md))

## 🎯 Hvad der bliver udrullet

### Kerneinfrastruktur (Status Efter Udrulning)

✅ **Azure OpenAI Services** (Klar til API-kald)
  - Primær region: GPT-4o udrulning (20K TPM kapacitet)
  - Sekundær region: GPT-4o-mini udrulning (10K TPM kapacitet)
  - Tertiær region: Tekst embeddings model (30K TPM kapacitet)
  - Evalueringsregion: GPT-4o grader model (15K TPM kapacitet)
  - **Status:** Fuldt funktionel - kan lave API-kald med det samme

✅ **Azure AI Search** (Tom - klar til konfiguration)
  - Vektorsøgefunktioner aktiveret
  - Standard tier med 1 partition, 1 replika
  - **Status:** Tjenesten kører, men kræver oprettelse af indeks
  - **Handling nødvendig:** Opret søgeindeks med dit skema

✅ **Azure Storage Account** (Tom - klar til uploads)
  - Blob containere: `documents`, `uploads`
  - Sikker konfiguration (kun HTTPS, ingen offentlig adgang)
  - **Status:** Klar til at modtage filer
  - **Handling nødvendig:** Upload dine produktdata og dokumenter

⚠️ **Container Apps Miljø** (Pladsholder billeder udrullet)
  - Agent router app (nginx standardbillede)
  - Frontend app (nginx standardbillede)
  - Auto-skalering konfigureret (0-10 instanser)
  - **Status:** Kører pladsholder containere
  - **Handling nødvendig:** Byg og udrul dine agentapplikationer

✅ **Azure Cosmos DB** (Tom - klar til data)
  - Database og container forudkonfigureret
  - Optimeret til lav-latens operationer
  - TTL aktiveret for automatisk oprydning
  - **Status:** Klar til at gemme chat-historik

✅ **Azure Key Vault** (Valgfri - klar til hemmeligheder)
  - Soft delete aktiveret
  - RBAC konfigureret til administrerede identiteter
  - **Status:** Klar til at gemme API-nøgler og forbindelsesstrenge

✅ **Application Insights** (Valgfri - overvågning aktiv)
  - Forbundet til Log Analytics arbejdsområde
  - Brugerdefinerede metrikker og alarmer konfigureret
  - **Status:** Klar til at modtage telemetri fra dine apps

✅ **Document Intelligence** (Klar til API-kald)
  - S0 tier til produktionsarbejdsbelastninger
  - **Status:** Klar til at behandle uploadede dokumenter

✅ **Bing Search API** (Klar til API-kald)
  - S1 tier til realtidssøgninger
  - **Status:** Klar til websøgeforespørgsler

### Udrulningsmodi

| Mode | OpenAI Kapacitet | Container Instanser | Søge Tier | Storage Redundans | Bedst Til |
|------|------------------|---------------------|-----------|-------------------|-----------|
| **Minimal** | 10K-20K TPM | 0-2 replikaer | Basic | LRS (Lokal) | Udvikling/test, læring, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replikaer | Standard | ZRS (Zone) | Produktion, moderat trafik (<10K brugere) |
| **Premium** | 80K-150K TPM | 5-10 replikaer, zone-redundant | Premium | GRS (Geo) | Enterprise, høj trafik (>10K brugere), 99.99% SLA |

**Omkostningspåvirkning:**
- **Minimal → Standard:** ~4x omkostningsstigning ($100-370/md → $420-1,450/md)
- **Standard → Premium:** ~3x omkostningsstigning ($420-1,450/md → $1,150-3,500/md)
- **Vælg baseret på:** Forventet belastning, SLA krav, budgetbegrænsninger

**Kapacitetsplanlægning:**
- **TPM (Tokens Per Minute):** Total på tværs af alle modeludrulninger
- **Container Instanser:** Auto-skalering rækkevidde (min-max replikaer)
- **Søge Tier:** Påvirker forespørgselsydelse og indeksstørrelsesgrænser

## 📋 Forudsætninger

### Nødvendige Værktøjer
1. **Azure CLI** (version 2.50.0 eller højere)
   ```bash
   az --version  # Kontroller version
   az login      # Godkend
   ```

2. **Aktivt Azure abonnement** med Ejer- eller Bidragsyderadgang
   ```bash
   az account show  # Bekræft abonnement
   ```

### Nødvendige Azure Kvoter

Før udrulning, verificer tilstrækkelige kvoter i dine målregioner:

```bash
# Kontroller Azure OpenAI tilgængelighed i din region
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Bekræft OpenAI-kvote (eksempel for gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Kontroller Container Apps-kvote
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimum Nødvendige Kvoter:**
- **Azure OpenAI:** 3-4 modeludrulninger på tværs af regioner
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Bemærk:** GPT-4o kan have venteliste i nogle regioner - tjek [modeltilgængelighed](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Administreret miljø + 2-10 container instanser
- **AI Search:** Standard tier (Basic utilstrækkelig til vektorsøgning)
- **Cosmos DB:** Standard provisioneret gennemløb

**Hvis kvoter er utilstrækkelige:**
1. Gå til Azure Portal → Kvoter → Anmod om stigning
2. Eller brug Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Overvej alternative regioner med tilgængelighed

## 🚀 Hurtig Udrulning

### Mulighed 1: Brug Azure CLI

```bash
# Klon eller download skabelonfilerne
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Gør implementeringsscriptet eksekverbart
chmod +x deploy.sh

# Implementer med standardindstillinger
./deploy.sh -g myResourceGroup

# Implementer til produktion med premiumfunktioner
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Mulighed 2: Brug Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Mulighed 3: Brug Azure CLI direkte

```bash
# Opret ressourcergruppe
az group create --name myResourceGroup --location eastus2

# Udrul skabelon
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Udrulningstidslinje

### Hvad man kan forvente

| Fase | Varighed | Hvad der sker |
|------|----------|--------------||
| **Skabelonvalidering** | 30-60 sekunder | Azure validerer ARM skabelonsyntaks og parametre |
| **Opsætning af Ressourcegruppe** | 10-20 sekunder | Opretter ressourcegruppe (hvis nødvendigt) |
| **OpenAI Klargøring** | 5-8 minutter | Opretter 3-4 OpenAI konti og udruller modeller |
| **Container Apps** | 3-5 minutter | Opretter miljø og udruller pladsholder containere |
| **Søgning & Storage** | 2-4 minutter | Klargør AI Search service og storage konti |
| **Cosmos DB** | 2-3 minutter | Opretter database og konfigurerer containere |
| **Opsætning af Overvågning** | 2-3 minutter | Opsætter Application Insights og Log Analytics |
| **RBAC Konfiguration** | 1-2 minutter | Konfigurerer administrerede identiteter og tilladelser |
| **Total Udrulning** | **15-25 minutter** | Komplet infrastruktur klar |

**Efter Udrulning:**
- ✅ **Infrastruktur Klar:** Alle Azure tjenester klargjort og kører
- ⏱️ **Applikationsudvikling:** 80-120 timer (dit ansvar)
- ⏱️ **Indekskonfiguration:** 15-30 minutter (kræver dit skema)
- ⏱️ **Data Upload:** Varierer efter datasætstørrelse
- ⏱️ **Test & Validering:** 2-4 timer

---

## ✅ Verificer Udrulningssucces

### Trin 1: Tjek Ressource Klargøring (2 minutter)

```bash
# Bekræft, at alle ressourcer er implementeret korrekt
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Forventet:** Tom tabel (alle ressourcer viser "Succeeded" status)

### Trin 2: Verificer Azure OpenAI Udrulninger (3 minutter)

```bash
# Liste alle OpenAI-konti
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Kontroller modelimplementeringer for primær region
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Forventet:** 
- 3-4 OpenAI konti (primær, sekundær, tertiær, evalueringsregioner)
- 1-2 modeludrulninger pr. konto (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Trin 3: Test Infrastruktur Endpoints (5 minutter)

```bash
# Hent Container App URL'er
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Test router endpoint (pladsholderbillede vil svare)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Forventet:** 
- Container Apps viser "Running" status
- Pladsholder nginx svarer med HTTP 200 eller 404 (ingen applikationskode endnu)

### Trin 4: Verificer Azure OpenAI API Adgang (3 minutter)

```bash
# Hent OpenAI endpoint og nøgle
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Test GPT-4o implementering
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Forventet:** JSON svar med chat completion (bekræfter OpenAI er funktionel)

### Hvad der virker vs. hvad der ikke gør

**✅ Virker Efter Udrulning:**
- Azure OpenAI modeller udrullet og accepterer API-kald
- AI Search service kører (tom, ingen indekser endnu)
- Container Apps kører (pladsholder nginx billeder)
- Storage konti tilgængelige og klar til uploads
- Cosmos DB klar til dataoperationer
- Application Insights indsamler infrastrukturtelemetri
- Key Vault klar til hemmelighedslagring

**❌ Virker Ikke Endnu (Kræver Udvikling):**
- Agent endpoints (ingen applikationskode udrullet)
- Chat funktionalitet (kræver frontend + backend implementering)
- Søgeforespørgsler (intet søgeindeks oprettet endnu)
- Dokumentbehandlingspipeline (ingen data uploadet)
- Brugerdefineret telemetri (kræver applikationsinstrumentering)

**Næste Skridt:** Se [Post-Udrulningskonfiguration](../../../../examples/retail-multiagent-arm-template) for at udvikle og udrulle din applikation

---

## ⚙️ Konfigurationsmuligheder

### Skabelonparametre

| Parameter | Type | Standard | Beskrivelse |
|-----------|------|----------|-------------|
| `projectName` | string | "retail" | Præfiks for alle ressourcenavne |
| `location` | string | Ressourcegruppens placering | Primær udrulningsregion |
| `secondaryLocation` | string | "westus2" | Sekundær region til multi-region udrulning |
| `tertiaryLocation` | string | "francecentral" | Region til embeddings model |
| `environmentName` | string | "dev" | Miljøbetegnelse (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Udrulningskonfiguration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktiver multi-region udrulning |
| `enableMonitoring` | bool | true | Aktiver Application Insights og logning |
| `enableSecurity` | bool | true | Aktiver Key Vault og forbedret sikkerhed |

### Tilpasning af Parametre

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

## 🏗️ Arkitektur Oversigt

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

## 📖 Brug af Udrulningsscript

`deploy.sh` scriptet giver en interaktiv udrulningsoplevelse:

```bash
# Vis hjælp
./deploy.sh --help

# Grundlæggende udrulning
./deploy.sh -g myResourceGroup

# Avanceret udrulning med brugerdefinerede indstillinger
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Udviklingsudrulning uden multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Script Funktioner

- ✅ **Validering af forudsætninger** (Azure CLI, loginstatus, skabelonfiler)
- ✅ **Ressourcegruppehåndtering** (opretter hvis den ikke findes)
- ✅ **Skabelonvalidering** før udrulning
- ✅ **Overvågning af fremskridt** med farvet output
- ✅ **Visning af udrulningsoutput**
- ✅ **Vejledning efter udrulning**

## 📊 Overvågning af Udrulning

### Tjek Udrulningsstatus

```bash
# Liste udrulninger
az deployment group list --resource-group myResourceGroup --output table

# Hent udrulningsdetaljer
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Overvåg udrulningsfremskridt
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Udrulningsoutput

Efter vellykket udrulning er følgende output tilgængelige:

- **Frontend URL**: Offentlig endpoint til webgrænsefladen
- **Router URL**: API endpoint til agent router
- **OpenAI Endpoints**: Primære og sekundære OpenAI service endpoints
- **Search Service**: Azure AI Search service endpoint
- **Storage Account**: Navn på storage kontoen til dokumenter
- **Key Vault**: Navn på Key Vault (hvis aktiveret)
- **Application Insights**: Navn på overvågningstjenesten (hvis aktiveret)

## 🔧 Efter Udrulning: Næste Skridt
> **📝 Vigtigt:** Infrastruktur er implementeret, men du skal udvikle og implementere applikationskode.

### Fase 1: Udvikling af agentapplikationer (Dit ansvar)

ARM-skabelonen opretter **tomme Container Apps** med pladsholder nginx-billeder. Du skal:

**Påkrævet udvikling:**
1. **Agentimplementering** (30-40 timer)
   - Kundeserviceagent med GPT-4o-integration
   - Lageragent med GPT-4o-mini-integration
   - Agent-routing logik

2. **Frontend-udvikling** (20-30 timer)
   - Chatgrænseflade UI (React/Vue/Angular)
   - Funktionalitet til filupload
   - Rendering og formatering af svar

3. **Backend-tjenester** (12-16 timer)
   - FastAPI eller Express-router
   - Middleware til autentifikation
   - Telemetri-integration

**Se:** [Arkitekturguide](../retail-scenario.md) for detaljerede implementeringsmønstre og kodeeksempler

### Fase 2: Konfigurer AI-søgeindeks (15-30 minutter)

Opret et søgeindeks, der matcher din datamodel:

```bash
# Hent søgetjenestedetaljer
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Opret indeks med dit skema (eksempel)
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

**Ressourcer:**
- [AI Search Index Schema Design](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vector Search Configuration](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Upload dine data (Tidsforbrug varierer)

Når du har produktdata og dokumenter:

```bash
# Hent lagerkontooplysninger
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Upload dine dokumenter
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Eksempel: Upload enkelt fil
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Byg og implementer dine applikationer (8-12 timer)

Når du har udviklet din agentkode:

```bash
# 1. Opret Azure Container Registry (hvis nødvendigt)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Byg og push agent router-billede
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Byg og push frontend-billede
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Opdater Container Apps med dine billeder
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurer miljøvariabler
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fase 5: Test din applikation (2-4 timer)

```bash
# Få din applikations-URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Test agentens endpoint (når din kode er implementeret)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Tjek applikationslogfiler
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Implementeringsressourcer

**Arkitektur & Design:**
- 📖 [Komplet arkitekturguide](../retail-scenario.md) - Detaljerede implementeringsmønstre
- 📖 [Multi-agent designmønstre](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Kodeeksempler:**
- 🔗 [Azure OpenAI Chat Sample](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG-mønster
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agentframework (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agentorkestrering (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agent samtaler

**Estimeret samlet indsats:**
- Implementering af infrastruktur: 15-25 minutter (✅ Fuldført)
- Applikationsudvikling: 80-120 timer (🔨 Dit arbejde)
- Test og optimering: 15-25 timer (🔨 Dit arbejde)

## 🛠️ Fejlfinding

### Almindelige problemer

#### 1. Azure OpenAI-kvote overskredet

```bash
# Kontroller nuværende kvoteforbrug
az cognitiveservices usage list --location eastus2

# Anmod om kvoteforøgelse
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps implementering mislykkedes

```bash
# Kontroller container-app-logfiler
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Genstart container-app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisering af søgetjeneste

```bash
# Bekræft søgetjenestens status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test søgetjenestens forbindelse
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validering af implementering

```bash
# Bekræft, at alle ressourcer er oprettet
az resource list \
  --resource-group myResourceGroup \
  --output table

# Kontroller ressourcehelbred
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Sikkerhedsovervejelser

### Nøglehåndtering
- Alle hemmeligheder opbevares i Azure Key Vault (når aktiveret)
- Container apps bruger administreret identitet til autentifikation
- Lagerkonti har sikre standardindstillinger (kun HTTPS, ingen offentlig blob-adgang)

### Netværkssikkerhed
- Container apps bruger intern netværk, hvor det er muligt
- Søgetjeneste konfigureret med private endpoints
- Cosmos DB konfigureret med minimale nødvendige tilladelser

### RBAC-konfiguration
```bash
# Tildel nødvendige roller til administreret identitet
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Omkostningsoptimering

### Omkostningsestimater (Månedligt, USD)

| Tilstand | OpenAI | Container Apps | Search | Storage | Total Est. |
|----------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Omkostningsovervågning

```bash
# Opsæt budgetadvarsler
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Opdateringer og vedligeholdelse

### Skabelonopdateringer
- Versionskontroller ARM-skabelonfilerne
- Test ændringer i udviklingsmiljøet først
- Brug inkrementel implementeringstilstand til opdateringer

### Ressourceopdateringer
```bash
# Opdater med nye parametre
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup og gendannelse
- Cosmos DB automatisk backup aktiveret
- Key Vault soft delete aktiveret
- Container app-revisioner opretholdt til rollback

## 📞 Support

- **Skabelonproblemer**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Klar til at implementere din multi-agent løsning?**

Start med: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->