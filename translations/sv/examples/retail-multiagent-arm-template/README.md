# Retail Multi-Agent Lösning - Infrastrukturmall

**Kapitel 5: Produktionsdistributionspaket**
- **📚 Kurshemsida**: [AZD För Nybörjare](../../README.md)
- **📖 Relaterat Kapitel**: [Kapitel 5: Multi-Agent AI-lösningar](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenarioguide**: [Komplett Arkitektur](../retail-scenario.md)
- **🎯 Snabbdistribution**: [Ett-Klicksdistribution](../../../../examples/retail-multiagent-arm-template)

> **⚠️ ENDAST INFRASTRUKTURMALL**  
> Denna ARM-mall distribuerar **Azure-resurser** för ett multi-agent system.  
>  
> **Vad som distribueras (15-25 minuter):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings över 3 regioner)
> - ✅ AI-söktjänst (tom, redo för indexskapande)
> - ✅ Container Apps (platshållarbilder, redo för din kod)
> - ✅ Lagring, Cosmos DB, Key Vault, Application Insights
>  
> **Vad som INTE ingår (kräver utveckling):**
> - ❌ Agentimplementeringskod (Kundagent, Lageragent)
> - ❌ Ruttlogik och API-slutpunkter
> - ❌ Frontend chatt-UI
> - ❌ Sökindexscheman och datapipelines
> - ❌ **Beräknad utvecklingsinsats: 80-120 timmar**
>  
> **Använd denna mall om:**
> - ✅ Du vill provisionera Azure-infrastruktur för ett multi-agent projekt
> - ✅ Du planerar att utveckla agentimplementering separat
> - ✅ Du behöver en produktionsklar infrastrukturgrund
>  
> **Använd inte om:**
> - ❌ Du förväntar dig en fungerande multi-agent demo omedelbart
> - ❌ Du letar efter kompletta applikationskodexempel

## Översikt

Denna katalog innehåller en omfattande Azure Resource Manager (ARM)-mall för att distribuera **infrastrukturgrunden** för ett multi-agent kundsupportsystem. Mallen provisionerar alla nödvändiga Azure-tjänster, korrekt konfigurerade och sammankopplade, redo för din applikationsutveckling.

**Efter distribution kommer du att ha:** Produktionsklar Azure-infrastruktur  
**För att slutföra systemet behöver du:** Agentkod, frontend-UI och datakonfiguration (se [Arkitekturguide](../retail-scenario.md))

## 🎯 Vad som distribueras

### Kärninfrastruktur (Status efter distribution)

✅ **Azure OpenAI-tjänster** (Redo för API-anrop)
  - Primär region: GPT-4o-distribution (20K TPM kapacitet)
  - Sekundär region: GPT-4o-mini-distribution (10K TPM kapacitet)
  - Tertiär region: Text embeddings-modell (30K TPM kapacitet)
  - Utvärderingsregion: GPT-4o grader-modell (15K TPM kapacitet)
  - **Status:** Fullt funktionell - kan göra API-anrop omedelbart

✅ **Azure AI-sökning** (Tom - redo för konfiguration)
  - Vektorsökningsfunktioner aktiverade
  - Standardnivå med 1 partition, 1 replik
  - **Status:** Tjänsten körs, men kräver indexskapande
  - **Åtgärd som krävs:** Skapa sökindex med ditt schema

✅ **Azure Storage-konto** (Tomt - redo för uppladdningar)
  - Blob-containrar: `documents`, `uploads`
  - Säker konfiguration (endast HTTPS, ingen offentlig åtkomst)
  - **Status:** Redo att ta emot filer
  - **Åtgärd som krävs:** Ladda upp dina produktdata och dokument

⚠️ **Container Apps-miljö** (Platshållarbilder distribuerade)
  - Agentrouter-app (nginx standardbild)
  - Frontend-app (nginx standardbild)
  - Autoskalning konfigurerad (0-10 instanser)
  - **Status:** Kör platshållarcontainrar
  - **Åtgärd som krävs:** Bygg och distribuera dina agentapplikationer

✅ **Azure Cosmos DB** (Tom - redo för data)
  - Databas och container förkonfigurerade
  - Optimerad för låglatensoperationer
  - TTL aktiverad för automatisk rensning
  - **Status:** Redo att lagra chattloggar

✅ **Azure Key Vault** (Valfritt - redo för hemligheter)
  - Mjuk radering aktiverad
  - RBAC konfigurerad för hanterade identiteter
  - **Status:** Redo att lagra API-nycklar och anslutningssträngar

✅ **Application Insights** (Valfritt - övervakning aktiv)
  - Ansluten till Log Analytics-arbetsyta
  - Anpassade mätvärden och varningar konfigurerade
  - **Status:** Redo att ta emot telemetri från dina appar

✅ **Dokumentintelligens** (Redo för API-anrop)
  - S0-nivå för produktionsarbetsbelastningar
  - **Status:** Redo att bearbeta uppladdade dokument

✅ **Bing Search API** (Redo för API-anrop)
  - S1-nivå för realtidssökningar
  - **Status:** Redo för webbsökfrågor

### Distributionslägen

| Läge | OpenAI-kapacitet | Containerinstanser | Sök-nivå | Lagringsredundans | Bäst för |
|------|------------------|--------------------|----------|-------------------|----------|
| **Minimal** | 10K-20K TPM | 0-2 repliker | Basic | LRS (Lokal) | Utveckling/test, inlärning, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 repliker | Standard | ZRS (Zon) | Produktion, måttlig trafik (<10K användare) |
| **Premium** | 80K-150K TPM | 5-10 repliker, zonredundant | Premium | GRS (Geo) | Företag, hög trafik (>10K användare), 99,99% SLA |

**Kostnadspåverkan:**
- **Minimal → Standard:** ~4x kostnadsökning ($100-370/mån → $420-1,450/mån)
- **Standard → Premium:** ~3x kostnadsökning ($420-1,450/mån → $1,150-3,500/mån)
- **Välj baserat på:** Förväntad belastning, SLA-krav, budgetbegränsningar

**Kapacitetsplanering:**
- **TPM (Tokens Per Minute):** Totalt över alla modellutplaceringar
- **Containerinstanser:** Autoskalningsintervall (min-max repliker)
- **Sök-nivå:** Påverkar frågeprestanda och indexstorleksgränser

## 📋 Förutsättningar

### Nödvändiga Verktyg
1. **Azure CLI** (version 2.50.0 eller högre)
   ```bash
   az --version  # Kontrollera version
   az login      # Autentisera
   ```

2. **Aktivt Azure-abonnemang** med Ägare- eller Medverkande-åtkomst
   ```bash
   az account show  # Verifiera prenumeration
   ```

### Nödvändiga Azure-kvoter

Innan distribution, verifiera tillräckliga kvoter i dina målregioner:

```bash
# Kontrollera Azure OpenAI tillgänglighet i din region
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifiera OpenAI-kvot (exempel för gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Kontrollera Container Apps-kvot
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimikrav på kvoter:**
- **Azure OpenAI:** 3-4 modellutplaceringar över regioner
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Obs:** GPT-4o kan ha väntelista i vissa regioner - kontrollera [modelltillgänglighet](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Hanterad miljö + 2-10 containerinstanser
- **AI-sökning:** Standardnivå (Basic otillräcklig för vektorsökning)
- **Cosmos DB:** Standard provisionerad genomströmning

**Om kvoter är otillräckliga:**
1. Gå till Azure Portal → Kvoter → Begär ökning
2. Eller använd Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Överväg alternativa regioner med tillgänglighet

## 🚀 Snabbdistribution

### Alternativ 1: Använda Azure CLI

```bash
# Klona eller ladda ner mallfilerna
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Gör distributionsskriptet körbart
chmod +x deploy.sh

# Distribuera med standardinställningar
./deploy.sh -g myResourceGroup

# Distribuera för produktion med premiumfunktioner
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Alternativ 2: Använda Azure Portal

[![Distribuera till Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Alternativ 3: Använda Azure CLI direkt

```bash
# Skapa resursgrupp
az group create --name myResourceGroup --location eastus2

# Distribuera mall
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Distributionsschema

### Vad att förvänta sig

| Fas | Varaktighet | Vad som händer |
|-----|-------------|----------------||
| **Mallvalidering** | 30-60 sekunder | Azure validerar ARM-mallens syntax och parametrar |
| **Resursgruppsinställning** | 10-20 sekunder | Skapar resursgrupp (om nödvändigt) |
| **OpenAI-provisionering** | 5-8 minuter | Skapar 3-4 OpenAI-konton och distribuerar modeller |
| **Container Apps** | 3-5 minuter | Skapar miljö och distribuerar platshållarcontainrar |
| **Sök & Lagring** | 2-4 minuter | Provisionerar AI-söktjänst och lagringskonton |
| **Cosmos DB** | 2-3 minuter | Skapar databas och konfigurerar containrar |
| **Övervakningsinställning** | 2-3 minuter | Ställer in Application Insights och Log Analytics |
| **RBAC-konfiguration** | 1-2 minuter | Konfigurerar hanterade identiteter och behörigheter |
| **Total distribution** | **15-25 minuter** | Komplett infrastruktur redo |

**Efter distribution:**
- ✅ **Infrastruktur Klar:** Alla Azure-tjänster provisionerade och körs
- ⏱️ **Applikationsutveckling:** 80-120 timmar (ditt ansvar)
- ⏱️ **Indexkonfiguration:** 15-30 minuter (kräver ditt schema)
- ⏱️ **Datauppladdning:** Varierar beroende på datasetstorlek
- ⏱️ **Testning & Validering:** 2-4 timmar

---

## ✅ Verifiera Distributionsframgång

### Steg 1: Kontrollera Resursprovisionering (2 minuter)

```bash
# Verifiera att alla resurser har distribuerats framgångsrikt
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Förväntat:** Tom tabell (alla resurser visar "Succeeded"-status)

### Steg 2: Verifiera Azure OpenAI-distributioner (3 minuter)

```bash
# Lista alla OpenAI-konton
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Kontrollera modellutplaceringar för primär region
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Förväntat:** 
- 3-4 OpenAI-konton (primär, sekundär, tertiär, utvärderingsregioner)
- 1-2 modellutplaceringar per konto (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Steg 3: Testa Infrastrukturens Slutpunkter (5 minuter)

```bash
# Hämta Container App-URL:er
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testa router-endpunkt (platshållarbild kommer att svara)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Förväntat:** 
- Container Apps visar "Running"-status
- Platshållar-nginx svarar med HTTP 200 eller 404 (ingen applikationskod ännu)

### Steg 4: Verifiera Azure OpenAI API-åtkomst (3 minuter)

```bash
# Hämta OpenAI-slutpunkt och nyckel
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testa GPT-4o-distribution
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Förväntat:** JSON-svar med chattkomplettering (bekräftar att OpenAI fungerar)

### Vad som Fungerar vs. Vad som Inte Gör det

**✅ Fungerar Efter Distribution:**
- Azure OpenAI-modeller distribuerade och accepterar API-anrop
- AI-söktjänst körs (tom, inga index ännu)
- Container Apps körs (platshållar-nginx-bilder)
- Lagringskonton tillgängliga och redo för uppladdningar
- Cosmos DB redo för dataoperationer
- Application Insights samlar in infrastrukturtelemetri
- Key Vault redo för hemlagring

**❌ Fungerar Inte Än (Kräver Utveckling):**
- Agent-slutpunkter (ingen applikationskod distribuerad)
- Chattfunktionalitet (kräver frontend + backend-implementering)
- Sökfrågor (inget sökindex skapat ännu)
- Dokumentbearbetningspipeline (ingen data uppladdad)
- Anpassad telemetri (kräver applikationsinstrumentering)

**Nästa Steg:** Se [Efter Distributionskonfiguration](../../../../examples/retail-multiagent-arm-template) för att utveckla och distribuera din applikation

---

## ⚙️ Konfigurationsalternativ

### Mallparametrar

| Parameter | Typ | Standard | Beskrivning |
|-----------|-----|----------|-------------|
| `projectName` | string | "retail" | Prefix för alla resursnamn |
| `location` | string | Resursgruppens plats | Primär distributionsregion |
| `secondaryLocation` | string | "westus2" | Sekundär region för multi-region distribution |
| `tertiaryLocation` | string | "francecentral" | Region för embeddings-modell |
| `environmentName` | string | "dev" | Miljöbeteckning (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Distributionskonfiguration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktivera multi-region distribution |
| `enableMonitoring` | bool | true | Aktivera Application Insights och loggning |
| `enableSecurity` | bool | true | Aktivera Key Vault och förbättrad säkerhet |

### Anpassa Parametrar

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

## 📖 Användning av Distributionsskript

Skriptet `deploy.sh` erbjuder en interaktiv distributionsupplevelse:

```bash
# Visa hjälp
./deploy.sh --help

# Grundläggande distribution
./deploy.sh -g myResourceGroup

# Avancerad distribution med anpassade inställningar
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Utvecklingsdistribution utan multi-region
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
- ✅ **Övervakning av framsteg** med färgkodad utdata
- ✅ **Visning av distributionsutdata**
- ✅ **Vägledning efter distribution**

## 📊 Övervakning av Distribution

### Kontrollera Distributionsstatus

```bash
# Lista distributioner
az deployment group list --resource-group myResourceGroup --output table

# Hämta distributionsdetaljer
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Övervaka distributionsframsteg
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Distributionsutdata

Efter lyckad distribution är följande utdata tillgängliga:

- **Frontend-URL**: Offentlig slutpunkt för webbgränssnittet
- **Router-URL**: API-slutpunkt för agentroutern
- **OpenAI-slutpunkter**: Primära och sekundära OpenAI-tjänstslutpunkter
- **Söktjänst**: Azure AI-söktjänstslutpunkt
- **Lagringskonto**: Namn på lagringskontot för dokument
- **Key Vault**: Namn på Key Vault (om aktiverad)
- **Application Insights**: Namn på övervakningstjänsten (om aktiverad)

## 🔧 Efter Distribution: Nästa Steg
> **📝 Viktigt:** Infrastruktur är distribuerad, men du behöver utveckla och distribuera applikationskoden.

### Fas 1: Utveckla agentapplikationer (Ditt ansvar)

ARM-mallen skapar **tomma Container Apps** med platshållar-nginx-bilder. Du måste:

**Nödvändig utveckling:**
1. **Agentimplementering** (30-40 timmar)
   - Kundtjänstagents med GPT-4o-integration
   - Lagerhanteringsagent med GPT-4o-mini-integration
   - Logik för agentdirigering

2. **Frontendutveckling** (20-30 timmar)
   - Chattgränssnitt UI (React/Vue/Angular)
   - Funktion för filuppladdning
   - Rendering och formatering av svar

3. **Backendtjänster** (12-16 timmar)
   - FastAPI eller Express-router
   - Autentiseringsmiddleware
   - Telemetriintegration

**Se:** [Arkitekturguide](../retail-scenario.md) för detaljerade implementeringsmönster och kodexempel

### Fas 2: Konfigurera AI-sökindex (15-30 minuter)

Skapa ett sökindex som matchar din datamodell:

```bash
# Hämta söktjänstinformation
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Skapa index med ditt schema (exempel)
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

**Resurser:**
- [AI-sökindexschema](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfiguration av vektorsökning](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fas 3: Ladda upp din data (Tidsåtgång varierar)

När du har produktdata och dokument:

```bash
# Hämta lagringskontouppgifter
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Ladda upp dina dokument
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Exempel: Ladda upp en enskild fil
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fas 4: Bygg och distribuera dina applikationer (8-12 timmar)

När du har utvecklat din agentkod:

```bash
# 1. Skapa Azure Container Registry (om det behövs)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Bygg och skicka agentrouterbild
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Bygg och skicka frontendbild
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Uppdatera Container Apps med dina bilder
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurera miljövariabler
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fas 5: Testa din applikation (2-4 timmar)

```bash
# Hämta din applikations-URL
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testa agentens slutpunkt (när din kod är distribuerad)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Kontrollera applikationsloggar
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Implementeringsresurser

**Arkitektur & design:**
- 📖 [Komplett arkitekturguide](../retail-scenario.md) - Detaljerade implementeringsmönster
- 📖 [Mönster för multi-agentdesign](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Kodexempel:**
- 🔗 [Azure OpenAI Chat-exempel](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG-mönster
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agentramverk (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agentorkestrering (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agentkonversationer

**Beräknad total arbetsinsats:**
- Infrastrukturdistribution: 15-25 minuter (✅ Klar)
- Applikationsutveckling: 80-120 timmar (🔨 Ditt arbete)
- Testning och optimering: 15-25 timmar (🔨 Ditt arbete)

## 🛠️ Felsökning

### Vanliga problem

#### 1. Azure OpenAI-kvot överskriden

```bash
# Kontrollera aktuell kvotanvändning
az cognitiveservices usage list --location eastus2

# Begär kvotökning
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Distribution av Container Apps misslyckades

```bash
# Kontrollera containerappens loggar
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Starta om containerappen
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initiering av söktjänst

```bash
# Verifiera söktjänstens status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testa anslutningen till söktjänsten
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validering av distribution

```bash
# Validera att alla resurser är skapade
az resource list \
  --resource-group myResourceGroup \
  --output table

# Kontrollera resursens hälsa
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Säkerhetsöverväganden

### Nyckelhantering
- Alla hemligheter lagras i Azure Key Vault (när aktiverat)
- Container-appar använder hanterad identitet för autentisering
- Lagringskonton har säkra standardinställningar (endast HTTPS, ingen offentlig blobåtkomst)

### Nätverkssäkerhet
- Container-appar använder intern nätverksanslutning där det är möjligt
- Söktjänsten är konfigurerad med alternativet för privata slutpunkter
- Cosmos DB är konfigurerad med minimalt nödvändiga behörigheter

### RBAC-konfiguration
```bash
# Tilldela nödvändiga roller för hanterad identitet
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostnadsoptimering

### Kostnadsuppskattningar (Månatligt, USD)

| Läge      | OpenAI | Container Apps | Sökning | Lagring | Total uppskattning |
|-----------|--------|----------------|---------|---------|--------------------|
| Minimal   | $50-200 | $20-50        | $25-100 | $5-20   | $100-370           |
| Standard  | $200-800 | $100-300     | $100-300| $20-50  | $420-1450          |
| Premium   | $500-2000 | $300-800    | $300-600| $50-100 | $1150-3500         |

### Kostnadsövervakning

```bash
# Ställ in budgetvarningar
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
- Versionshantera ARM-mallfilerna
- Testa ändringar i utvecklingsmiljön först
- Använd inkrementellt distributionsläge för uppdateringar

### Resursuppdateringar
```bash
# Uppdatera med nya parametrar
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Säkerhetskopiering och återställning
- Cosmos DB automatisk säkerhetskopiering aktiverad
- Key Vault soft delete aktiverad
- Container-apprevisioner bibehålls för återställning

## 📞 Support

- **Mallproblem**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Redo att distribuera din multi-agentlösning?**

Börja med: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->