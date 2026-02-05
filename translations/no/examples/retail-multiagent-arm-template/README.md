# Retail Multi-Agent Løsning - Infrastrukturmal

**Kapittel 5: Produksjonsdistribusjonspakke**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Relatert Kapittel**: [Kapittel 5: Multi-Agent AI-løsninger](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Scenario Guide**: [Komplett Arkitektur](../retail-scenario.md)
- **🎯 Rask Distribusjon**: [Ett-Klikk Distribusjon](../../../../examples/retail-multiagent-arm-template)

> **⚠️ KUN INFRASTRUKTURMAL**  
> Denne ARM-malen distribuerer **Azure-ressurser** for et multi-agent system.  
>  
> **Hva som distribueres (15-25 minutter):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings på tvers av 3 regioner)
> - ✅ AI Søketjeneste (tom, klar for opprettelse av indeks)
> - ✅ Container Apps (plassholderbilder, klar for din kode)
> - ✅ Lagring, Cosmos DB, Key Vault, Application Insights
>  
> **Hva som IKKE er inkludert (krever utvikling):**
> - ❌ Agentimplementeringskode (Kundeagent, Lageragent)
> - ❌ Rutelogikk og API-endepunkter
> - ❌ Frontend chat UI
> - ❌ Søkeindeksskjemaer og datapipelines
> - ❌ **Estimert utviklingsinnsats: 80-120 timer**
>  
> **Bruk denne malen hvis:**
> - ✅ Du ønsker å klargjøre Azure-infrastruktur for et multi-agent prosjekt
> - ✅ Du planlegger å utvikle agentimplementeringen separat
> - ✅ Du trenger en produksjonsklar infrastruktur som grunnlag
>  
> **Ikke bruk hvis:**
> - ❌ Du forventer en fungerende multi-agent demo umiddelbart
> - ❌ Du ser etter komplette eksempler på applikasjonskode

## Oversikt

Denne katalogen inneholder en omfattende Azure Resource Manager (ARM)-mal for å distribuere **infrastrukturgrunnlaget** til et multi-agent kundestøttesystem. Malen klargjør alle nødvendige Azure-tjenester, riktig konfigurert og sammenkoblet, klar for din applikasjonsutvikling.

**Etter distribusjon har du:** Produksjonsklar Azure-infrastruktur  
**For å fullføre systemet trenger du:** Agentkode, frontend UI og datakonfigurasjon (se [Arkitekturguide](../retail-scenario.md))

## 🎯 Hva som distribueres

### Kjerneinfrastruktur (Status etter distribusjon)

✅ **Azure OpenAI-tjenester** (Klar for API-kall)
  - Primærregion: GPT-4o-distribusjon (20K TPM kapasitet)
  - Sekundærregion: GPT-4o-mini-distribusjon (10K TPM kapasitet)
  - Tertiærregion: Tekstembeddingsmodell (30K TPM kapasitet)
  - Evalueringsregion: GPT-4o graderingsmodell (15K TPM kapasitet)
  - **Status:** Fullt funksjonell - kan gjøre API-kall umiddelbart

✅ **Azure AI Søketjeneste** (Tom - klar for konfigurasjon)
  - Vektorsøkeegenskaper aktivert
  - Standardnivå med 1 partisjon, 1 replika
  - **Status:** Tjenesten kjører, men krever opprettelse av indeks
  - **Handling nødvendig:** Opprett søkeindeks med ditt skjema

✅ **Azure Lagringskonto** (Tom - klar for opplastinger)
  - Blob-containere: `documents`, `uploads`
  - Sikker konfigurasjon (kun HTTPS, ingen offentlig tilgang)
  - **Status:** Klar til å motta filer
  - **Handling nødvendig:** Last opp produktdataene og dokumentene dine

⚠️ **Container Apps Miljø** (Plassholderbilder distribuert)
  - Agent router app (nginx standardbilde)
  - Frontend app (nginx standardbilde)
  - Auto-skalering konfigurert (0-10 instanser)
  - **Status:** Kjører plassholdercontainere
  - **Handling nødvendig:** Bygg og distribuer dine agentapplikasjoner

✅ **Azure Cosmos DB** (Tom - klar for data)
  - Database og container forhåndskonfigurert
  - Optimalisert for lav-latens operasjoner
  - TTL aktivert for automatisk opprydding
  - **Status:** Klar til å lagre chathistorikk

✅ **Azure Key Vault** (Valgfritt - klar for hemmeligheter)
  - Myk sletting aktivert
  - RBAC konfigurert for administrerte identiteter
  - **Status:** Klar til å lagre API-nøkler og tilkoblingsstrenger

✅ **Application Insights** (Valgfritt - overvåking aktiv)
  - Koblet til Log Analytics arbeidsområde
  - Tilpassede metrikker og varsler konfigurert
  - **Status:** Klar til å motta telemetri fra dine apper

✅ **Dokumentintelligens** (Klar for API-kall)
  - S0-nivå for produksjonsarbeidsbelastninger
  - **Status:** Klar til å behandle opplastede dokumenter

✅ **Bing Søke-API** (Klar for API-kall)
  - S1-nivå for sanntidssøk
  - **Status:** Klar for websøkforespørsler

### Distribusjonsmoduser

| Modus | OpenAI Kapasitet | Container Instanser | Søkenivå | Lagringsredundans | Best For |
|-------|------------------|---------------------|----------|-------------------|----------|
| **Minimal** | 10K-20K TPM | 0-2 replikaer | Basic | LRS (Lokal) | Utvikling/test, læring, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replikaer | Standard | ZRS (Sone) | Produksjon, moderat trafikk (<10K brukere) |
| **Premium** | 80K-150K TPM | 5-10 replikaer, sone-redundant | Premium | GRS (Geo) | Enterprise, høy trafikk (>10K brukere), 99.99% SLA |

**Kostnadseffekt:**
- **Minimal → Standard:** ~4x kostnadsøkning ($100-370/mnd → $420-1,450/mnd)
- **Standard → Premium:** ~3x kostnadsøkning ($420-1,450/mnd → $1,150-3,500/mnd)
- **Velg basert på:** Forventet belastning, SLA-krav, budsjettbegrensninger

**Kapasitetsplanlegging:**
- **TPM (Tokens Per Minute):** Totalt på tvers av alle modellimplementeringer
- **Container Instanser:** Auto-skalering rekkevidde (min-maks replikaer)
- **Søkenivå:** Påvirker spørringsytelse og indeksstørrelsesgrenser

## 📋 Forutsetninger

### Nødvendige Verktøy
1. **Azure CLI** (versjon 2.50.0 eller høyere)
   ```bash
   az --version  # Sjekk versjon
   az login      # Autentiser
   ```

2. **Aktivt Azure-abonnement** med Eier- eller Bidragsytertilgang
   ```bash
   az account show  # Bekreft abonnement
   ```

### Nødvendige Azure Kvoter

Før distribusjon, verifiser tilstrekkelige kvoter i dine målregioner:

```bash
# Sjekk tilgjengeligheten av Azure OpenAI i din region
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifiser OpenAI-kvoten (eksempel for gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Sjekk kvoten for Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimumskrav til kvoter:**
- **Azure OpenAI:** 3-4 modellimplementeringer på tvers av regioner
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Merk:** GPT-4o kan ha venteliste i noen regioner - sjekk [modelltilgjengelighet](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Administrert miljø + 2-10 containerinstanser
- **AI Søketjeneste:** Standardnivå (Basic utilstrekkelig for vektorsøk)
- **Cosmos DB:** Standard forhåndsbestemt gjennomstrømning

**Hvis kvoten er utilstrekkelig:**
1. Gå til Azure Portal → Kvoter → Be om økning
2. Eller bruk Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Vurder alternative regioner med tilgjengelighet

## 🚀 Rask Distribusjon

### Alternativ 1: Bruke Azure CLI

```bash
# Klon eller last ned malfilene
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Gjør distribusjonsskriptet kjørbart
chmod +x deploy.sh

# Distribuer med standardinnstillinger
./deploy.sh -g myResourceGroup

# Distribuer for produksjon med premiumfunksjoner
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Alternativ 2: Bruke Azure Portal

[![Distribuer til Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Alternativ 3: Bruke Azure CLI direkte

```bash
# Opprett ressursgruppe
az group create --name myResourceGroup --location eastus2

# Distribuer mal
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Distribusjonstidslinje

### Hva du kan forvente

| Fase | Varighet | Hva skjer |
|------|----------|-----------||
| **Validering av mal** | 30-60 sekunder | Azure validerer ARM-malens syntaks og parametere |
| **Oppsett av ressursgruppe** | 10-20 sekunder | Oppretter ressursgruppe (hvis nødvendig) |
| **OpenAI Klargjøring** | 5-8 minutter | Oppretter 3-4 OpenAI-kontoer og distribuerer modeller |
| **Container Apps** | 3-5 minutter | Oppretter miljø og distribuerer plassholdercontainere |
| **Søk & Lagring** | 2-4 minutter | Klargjør AI Søketjeneste og lagringskontoer |
| **Cosmos DB** | 2-3 minutter | Oppretter database og konfigurerer containere |
| **Overvåkingsoppsett** | 2-3 minutter | Setter opp Application Insights og Log Analytics |
| **RBAC Konfigurasjon** | 1-2 minutter | Konfigurerer administrerte identiteter og tillatelser |
| **Total Distribusjon** | **15-25 minutter** | Komplett infrastruktur klar |

**Etter Distribusjon:**
- ✅ **Infrastruktur Klar:** Alle Azure-tjenester klargjort og kjører
- ⏱️ **Applikasjonsutvikling:** 80-120 timer (ditt ansvar)
- ⏱️ **Indekskonfigurasjon:** 15-30 minutter (krever ditt skjema)
- ⏱️ **Dataopplasting:** Varierer etter datasettstørrelse
- ⏱️ **Testing & Validering:** 2-4 timer

---

## ✅ Verifiser Distribusjonssuksess

### Steg 1: Sjekk Ressursklargjøring (2 minutter)

```bash
# Verifiser at alle ressurser er distribuert vellykket
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Forventet:** Tom tabell (alle ressurser viser "Succeeded"-status)

### Steg 2: Verifiser Azure OpenAI Implementeringer (3 minutter)

```bash
# List alle OpenAI-kontoer
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Sjekk modellutplasseringer for primærregion
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Forventet:** 
- 3-4 OpenAI-kontoer (primær, sekundær, tertiær, evalueringsregioner)
- 1-2 modellimplementeringer per konto (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Steg 3: Test Infrastrukturendepunkter (5 minutter)

```bash
# Hent Container App URLer
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Test router endepunkt (plassholderbilde vil svare)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Forventet:** 
- Container Apps viser "Running"-status
- Plassholder nginx svarer med HTTP 200 eller 404 (ingen applikasjonskode ennå)

### Steg 4: Verifiser Azure OpenAI API-tilgang (3 minutter)

```bash
# Hent OpenAI-endepunkt og nøkkel
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Test GPT-4o-utplassering
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Forventet:** JSON-respons med chat fullføring (bekrefter at OpenAI fungerer)

### Hva som fungerer vs. hva som ikke fungerer

**✅ Fungerer etter distribusjon:**
- Azure OpenAI-modeller distribuert og aksepterer API-kall
- AI Søketjeneste kjører (tom, ingen indekser ennå)
- Container Apps kjører (plassholder nginx-bilder)
- Lagringskontoer tilgjengelige og klare for opplastinger
- Cosmos DB klar for dataoperasjoner
- Application Insights samler infrastrukturtelemetri
- Key Vault klar for lagring av hemmeligheter

**❌ Fungerer ikke ennå (krever utvikling):**
- Agentendepunkter (ingen applikasjonskode distribuert)
- Chatfunksjonalitet (krever frontend + backend implementering)
- Søkeforespørsler (ingen søkeindeks opprettet ennå)
- Dokumentbehandlingspipeline (ingen data opplastet)
- Tilpasset telemetri (krever applikasjonsinstrumentering)

**Neste Steg:** Se [Post-Distribusjonskonfigurasjon](../../../../examples/retail-multiagent-arm-template) for å utvikle og distribuere din applikasjon

---

## ⚙️ Konfigurasjonsalternativer

### Malparametere

| Parameter | Type | Standard | Beskrivelse |
|-----------|------|----------|-------------|
| `projectName` | string | "retail" | Prefiks for alle ressursnavn |
| `location` | string | Ressursgruppens plassering | Primær distribusjonsregion |
| `secondaryLocation` | string | "westus2" | Sekundærregion for multi-region distribusjon |
| `tertiaryLocation` | string | "francecentral" | Region for embeddingsmodell |
| `environmentName` | string | "dev" | Miljøbetegnelse (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Distribusjonskonfigurasjon (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktiver multi-region distribusjon |
| `enableMonitoring` | bool | true | Aktiver Application Insights og logging |
| `enableSecurity` | bool | true | Aktiver Key Vault og forbedret sikkerhet |

### Tilpasning av Parametere

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

## 📖 Bruk av Distribusjonsskript

`deploy.sh`-skriptet gir en interaktiv distribusjonsopplevelse:

```bash
# Vis hjelp
./deploy.sh --help

# Grunnleggende distribusjon
./deploy.sh -g myResourceGroup

# Avansert distribusjon med tilpassede innstillinger
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Utviklingsdistribusjon uten multi-region
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
- ✅ **Validering av mal** før distribusjon
- ✅ **Fremdriftsovervåking** med fargekodet utdata
- ✅ **Visning av distribusjonsutdata**
- ✅ **Veiledning etter distribusjon**

## 📊 Overvåking av Distribusjon

### Sjekk Distribusjonsstatus

```bash
# Liste distribusjoner
az deployment group list --resource-group myResourceGroup --output table

# Hent distribusjonsdetaljer
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Se distribusjonsfremgang
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Distribusjonsutdata

Etter vellykket distribusjon er følgende utdata tilgjengelige:

- **Frontend URL**: Offentlig endepunkt for webgrensesnittet
- **Router URL**: API-endepunkt for agentrouteren
- **OpenAI Endepunkter**: Primære og sekundære OpenAI-tjenesteendepunkter
- **Søketjeneste**: Azure AI Søketjenesteendepunkt
- **Lagringskonto**: Navn på lagringskontoen for dokumenter
- **Key Vault**: Navn på Key Vault (hvis aktivert)
- **Application Insights**: Navn på overvåkingstjenesten (hvis aktivert)

## 🔧 Etter Distribusjon: Neste Steg
> **📝 Viktig:** Infrastruktur er distribuert, men du må utvikle og distribuere applikasjonskode.

### Fase 1: Utvikle agentapplikasjoner (Din ansvar)

ARM-malen oppretter **tomme Container Apps** med plassholder nginx-bilder. Du må:

**Påkrevd utvikling:**
1. **Agentimplementering** (30-40 timer)
   - Kundeserviceagent med GPT-4o-integrasjon
   - Lageragent med GPT-4o-mini-integrasjon
   - Logikk for agentruting

2. **Frontend-utvikling** (20-30 timer)
   - Chatgrensesnitt UI (React/Vue/Angular)
   - Filopplastingsfunksjonalitet
   - Gjengivelse og formatering av svar

3. **Backend-tjenester** (12-16 timer)
   - FastAPI eller Express router
   - Autentiseringsmiddleware
   - Telemetriintegrasjon

**Se:** [Arkitekturguide](../retail-scenario.md) for detaljerte implementeringsmønstre og kodeeksempler

### Fase 2: Konfigurer AI-søkeindeks (15-30 minutter)

Opprett en søkeindeks som samsvarer med datamodellen din:

```bash
# Hent detaljer om søketjenesten
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Opprett indeks med ditt skjema (eksempel)
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

**Ressurser:**
- [AI Search Index Schema Design](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vector Search Configuration](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Last opp dataene dine (Tidsbruk varierer)

Når du har produktdata og dokumenter:

```bash
# Hent lagringskontodetaljer
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Last opp dokumentene dine
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Eksempel: Last opp enkeltfil
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Bygg og distribuer applikasjonene dine (8-12 timer)

Når du har utviklet agentkoden din:

```bash
# 1. Opprett Azure Container Registry (hvis nødvendig)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Bygg og push agent router-bilde
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Bygg og push frontend-bilde
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Oppdater Container Apps med bildene dine
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

### Fase 5: Test applikasjonen din (2-4 timer)

```bash
# Få applikasjons-URL-en din
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Test agentens endepunkt (når koden din er distribuert)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Sjekk applikasjonslogger
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Implementeringsressurser

**Arkitektur og design:**
- 📖 [Komplett arkitekturguide](../retail-scenario.md) - Detaljerte implementeringsmønstre
- 📖 [Multi-agent designmønstre](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Kodeeksempler:**
- 🔗 [Azure OpenAI Chat Sample](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG-mønster
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agentrammeverk (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agentorkestrering (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agent samtaler

**Estimert total innsats:**
- Distribusjon av infrastruktur: 15-25 minutter (✅ Fullført)
- Applikasjonsutvikling: 80-120 timer (🔨 Din jobb)
- Testing og optimalisering: 15-25 timer (🔨 Din jobb)

## 🛠️ Feilsøking

### Vanlige problemer

#### 1. Azure OpenAI-kvote overskredet

```bash
# Sjekk nåværende kvotebruk
az cognitiveservices usage list --location eastus2

# Be om økning av kvote
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Distribusjon av Container Apps mislyktes

```bash
# Sjekk containerappens logger
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Start containerappen på nytt
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisering av søketjeneste

```bash
# Verifiser status for søketjenesten
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test søketjenestens tilkobling
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validering av distribusjon

```bash
# Valider at alle ressurser er opprettet
az resource list \
  --resource-group myResourceGroup \
  --output table

# Sjekk ressursenes tilstand
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Sikkerhetsvurderinger

### Nøkkelhåndtering
- Alle hemmeligheter lagres i Azure Key Vault (når aktivert)
- Container Apps bruker administrert identitet for autentisering
- Lagringskontoer har sikre standarder (kun HTTPS, ingen offentlig blobtilgang)

### Nettverkssikkerhet
- Container Apps bruker intern nettverkskonfigurasjon der det er mulig
- Søketjenesten er konfigurert med private endepunkter
- Cosmos DB er konfigurert med minimale nødvendige tillatelser

### RBAC-konfigurasjon
```bash
# Tilordne nødvendige roller for administrert identitet
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kostnadsoptimalisering

### Kostnadsestimater (Månedlig, USD)

| Modus | OpenAI | Container Apps | Søketjeneste | Lagring | Total Est. |
|-------|--------|----------------|--------------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kostnadsovervåking

```bash
# Sett opp budsjettvarsler
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
- Test endringer i utviklingsmiljøet først
- Bruk inkrementell distribusjonsmodus for oppdateringer

### Ressursoppdateringer
```bash
# Oppdater med nye parametere
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sikkerhetskopiering og gjenoppretting
- Cosmos DB automatisk sikkerhetskopiering aktivert
- Key Vault myk sletting aktivert
- Container App-revisjoner opprettholdt for tilbakestilling

## 📞 Support

- **Malproblemer**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Support**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Klar til å distribuere din multi-agent løsning?**

Start med: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->