# Soluție Multi-Agent Retail - Șablon de Infrastructură

**Capitolul 5: Pachet de Implementare în Producție**
- **📚 Curs Acasă**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Corelat**: [Capitolul 5: Soluții AI Multi-Agent](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Ghid Scenariu**: [Arhitectură Completă](../retail-scenario.md)
- **🎯 Implementare Rapidă**: [Implementare cu un singur click](../../../../examples/retail-multiagent-arm-template)

> **⚠️ DOAR ȘABLON DE INFRASTRUCTURĂ**  
> Acest șablon ARM implementează **resurse Azure** pentru un sistem multi-agent.  
>  
> **Ce se implementează (15-25 minute):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings în 3 regiuni)
> - ✅ Serviciu de Căutare AI (gol, pregătit pentru crearea indexului)
> - ✅ Container Apps (imagini de tip placeholder, pregătite pentru codul dvs.)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Ce NU este inclus (necesită dezvoltare):**
> - ❌ Codul de implementare al agenților (Agent Client, Agent Inventar)
> - ❌ Logica de rutare și punctele de acces API
> - ❌ Interfața de chat frontend
> - ❌ Schemele de indexare și fluxurile de date
> - ❌ **Efort estimat de dezvoltare: 80-120 ore**
>  
> **Utilizați acest șablon dacă:**
> - ✅ Doriți să provisionați infrastructura Azure pentru un proiect multi-agent
> - ✅ Plănuiți să dezvoltați separat implementarea agenților
> - ✅ Aveți nevoie de o infrastructură de bază pregătită pentru producție
>  
> **Nu utilizați dacă:**
> - ❌ Așteptați un demo multi-agent funcțional imediat
> - ❌ Căutați exemple complete de cod pentru aplicații

## Prezentare Generală

Acest director conține un șablon complet Azure Resource Manager (ARM) pentru implementarea **fundamentului infrastructurii** unui sistem de suport pentru clienți multi-agent. Șablonul provisionează toate serviciile Azure necesare, configurate și interconectate corespunzător, pregătite pentru dezvoltarea aplicației dvs.

**După implementare, veți avea:** Infrastructură Azure pregătită pentru producție  
**Pentru a finaliza sistemul, aveți nevoie de:** Codul agenților, interfața frontend și configurarea datelor (vezi [Ghidul Arhitecturii](../retail-scenario.md))

## 🎯 Ce se implementează

### Infrastructura de bază (Status după implementare)

✅ **Servicii Azure OpenAI** (Pregătite pentru apeluri API)
  - Regiunea principală: Implementare GPT-4o (capacitate 20K TPM)
  - Regiunea secundară: Implementare GPT-4o-mini (capacitate 10K TPM)
  - Regiunea terțiară: Model de embeddings text (capacitate 30K TPM)
  - Regiunea de evaluare: Model evaluator GPT-4o (capacitate 15K TPM)
  - **Status:** Complet funcțional - poate efectua apeluri API imediat

✅ **Azure AI Search** (Gol - pregătit pentru configurare)
  - Capacități de căutare vectorială activate
  - Nivel standard cu 1 partiție, 1 replică
  - **Status:** Serviciu activ, dar necesită crearea indexului
  - **Acțiune necesară:** Creați indexul de căutare cu schema dvs.

✅ **Azure Storage Account** (Gol - pregătit pentru încărcări)
  - Containere Blob: `documents`, `uploads`
  - Configurare securizată (doar HTTPS, fără acces public)
  - **Status:** Pregătit pentru primirea fișierelor
  - **Acțiune necesară:** Încărcați datele și documentele produselor dvs.

⚠️ **Container Apps Environment** (Imagini de tip placeholder implementate)
  - Aplicația router agent (imagine nginx implicită)
  - Aplicația frontend (imagine nginx implicită)
  - Configurat pentru scalare automată (0-10 instanțe)
  - **Status:** Containere placeholder în funcțiune
  - **Acțiune necesară:** Construiți și implementați aplicațiile agenților dvs.

✅ **Azure Cosmos DB** (Gol - pregătit pentru date)
  - Baza de date și container preconfigurate
  - Optimizat pentru operațiuni cu latență redusă
  - TTL activat pentru curățare automată
  - **Status:** Pregătit pentru stocarea istoricului de chat

✅ **Azure Key Vault** (Opțional - pregătit pentru secrete)
  - Ștergere soft activată
  - RBAC configurat pentru identități gestionate
  - **Status:** Pregătit pentru stocarea cheilor API și stringurilor de conexiune

✅ **Application Insights** (Opțional - monitorizare activă)
  - Conectat la Log Analytics workspace
  - Metrice personalizate și alerte configurate
  - **Status:** Pregătit pentru primirea telemetriei de la aplicațiile dvs.

✅ **Document Intelligence** (Pregătit pentru apeluri API)
  - Nivel S0 pentru sarcini de producție
  - **Status:** Pregătit pentru procesarea documentelor încărcate

✅ **Bing Search API** (Pregătit pentru apeluri API)
  - Nivel S1 pentru căutări în timp real
  - **Status:** Pregătit pentru interogări de căutare web

### Moduri de Implementare

| Mod | Capacitate OpenAI | Instanțe Container | Nivel Căutare | Redundanță Stocare | Cel Mai Potrivit Pentru |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **Minimal** | 10K-20K TPM | 0-2 replici | Basic | LRS (Local) | Dezvoltare/testare, învățare, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replici | Standard | ZRS (Zonal) | Producție, trafic moderat (<10K utilizatori) |
| **Premium** | 80K-150K TPM | 5-10 replici, redundanță zonală | Premium | GRS (Geo) | Enterprise, trafic ridicat (>10K utilizatori), SLA 99.99% |

**Impact Costuri:**
- **Minimal → Standard:** ~4x creștere cost ($100-370/lună → $420-1,450/lună)
- **Standard → Premium:** ~3x creștere cost ($420-1,450/lună → $1,150-3,500/lună)
- **Alegeți în funcție de:** Trafic estimat, cerințe SLA, constrângeri bugetare

**Planificare Capacitate:**
- **TPM (Tokens Per Minute):** Total pentru toate implementările de modele
- **Instanțe Container:** Interval de scalare automată (min-max replici)
- **Nivel Căutare:** Afectează performanța interogărilor și limitele dimensiunii indexului

## 📋 Cerințe Prealabile

### Instrumente Necesare
1. **Azure CLI** (versiunea 2.50.0 sau mai recentă)
   ```bash
   az --version  # Verifică versiunea
   az login      # Autentifică
   ```

2. **Abonament Azure activ** cu acces Owner sau Contributor
   ```bash
   az account show  # Verificați abonamentul
   ```

### Cote Azure Necesare

Înainte de implementare, verificați cotele suficiente în regiunile țintă:

```bash
# Verificați disponibilitatea Azure OpenAI în regiunea dvs.
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verificați cota OpenAI (exemplu pentru gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Verificați cota Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Cote Minime Necesare:**
- **Azure OpenAI:** 3-4 implementări de modele în regiunile țintă
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Notă:** GPT-4o poate avea listă de așteptare în unele regiuni - verificați [disponibilitatea modelului](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Mediu gestionat + 2-10 instanțe container
- **AI Search:** Nivel standard (Basic insuficient pentru căutare vectorială)
- **Cosmos DB:** Debit provisionat standard

**Dacă cotele sunt insuficiente:**
1. Accesați Azure Portal → Quotas → Solicitați creștere
2. Sau utilizați Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Luați în considerare regiunile alternative cu disponibilitate

## 🚀 Implementare Rapidă

### Opțiunea 1: Utilizând Azure CLI

```bash
# Clonează sau descarcă fișierele șablon
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Fă scriptul de implementare executabil
chmod +x deploy.sh

# Implementează cu setările implicite
./deploy.sh -g myResourceGroup

# Implementează pentru producție cu funcții premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opțiunea 2: Utilizând Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opțiunea 3: Utilizând direct Azure CLI

```bash
# Creează grup de resurse
az group create --name myResourceGroup --location eastus2

# Implementați șablon
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Cronologia Implementării

### Ce să așteptați

| Fază | Durată | Ce se întâmplă |
|-------|----------|--------------||
| **Validarea Șablonului** | 30-60 secunde | Azure validează sintaxa șablonului ARM și parametrii |
| **Configurarea Grupului de Resurse** | 10-20 secunde | Creează grupul de resurse (dacă este necesar) |
| **Provisionarea OpenAI** | 5-8 minute | Creează 3-4 conturi OpenAI și implementează modele |
| **Container Apps** | 3-5 minute | Creează mediul și implementează containerele placeholder |
| **Căutare & Stocare** | 2-4 minute | Provisionează serviciul AI Search și conturile de stocare |
| **Cosmos DB** | 2-3 minute | Creează baza de date și configurează containerele |
| **Configurarea Monitorizării** | 2-3 minute | Configurează Application Insights și Log Analytics |
| **Configurarea RBAC** | 1-2 minute | Configurează identitățile gestionate și permisiunile |
| **Implementare Totală** | **15-25 minute** | Infrastructura completă pregătită |

**După Implementare:**
- ✅ **Infrastructură Pregătită:** Toate serviciile Azure provisionate și funcționale
- ⏱️ **Dezvoltare Aplicație:** 80-120 ore (responsabilitatea dvs.)
- ⏱️ **Configurare Index:** 15-30 minute (necesită schema dvs.)
- ⏱️ **Încărcare Date:** Variază în funcție de dimensiunea datasetului
- ⏱️ **Testare & Validare:** 2-4 ore

---

## ✅ Verificați Succesul Implementării

### Pasul 1: Verificați Provisionarea Resurselor (2 minute)

```bash
# Verificați dacă toate resursele au fost implementate cu succes
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Așteptat:** Tabel gol (toate resursele arată statusul "Succeeded")

### Pasul 2: Verificați Implementările Azure OpenAI (3 minute)

```bash
# Listează toate conturile OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Verifică implementările modelului pentru regiunea principală
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Așteptat:** 
- 3-4 conturi OpenAI (regiuni primare, secundare, terțiare, de evaluare)
- 1-2 implementări de modele per cont (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Pasul 3: Testați Punctele de Acces ale Infrastructurii (5 minute)

```bash
# Obține URL-urile aplicației container
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testează punctul final al routerului (imaginea de substituție va răspunde)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Așteptat:** 
- Container Apps arată statusul "Running"
- Nginx placeholder răspunde cu HTTP 200 sau 404 (fără cod aplicație încă)

### Pasul 4: Verificați Accesul API Azure OpenAI (3 minute)

```bash
# Obține punctul final OpenAI și cheia
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testează implementarea GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Așteptat:** Răspuns JSON cu completare chat (confirmă funcționalitatea OpenAI)

### Ce Funcționează vs. Ce Nu

**✅ Funcționează După Implementare:**
- Modelele Azure OpenAI implementate și acceptă apeluri API
- Serviciul AI Search activ (gol, fără indexuri încă)
- Container Apps funcționale (imagini nginx placeholder)
- Conturile de stocare accesibile și pregătite pentru încărcări
- Cosmos DB pregătit pentru operațiuni de date
- Application Insights colectează telemetrie infrastructură
- Key Vault pregătit pentru stocarea secretelor

**❌ Nu Funcționează Încă (Necesită Dezvoltare):**
- Punctele de acces ale agenților (fără cod aplicație implementat)
- Funcționalitatea de chat (necesită implementare frontend + backend)
- Interogările de căutare (fără index de căutare creat încă)
- Fluxul de procesare documente (fără date încărcate)
- Telemetria personalizată (necesită instrumentare aplicație)

**Pași Următori:** Vezi [Configurare Post-Implementare](../../../../examples/retail-multiagent-arm-template) pentru dezvoltarea și implementarea aplicației dvs.

---

## ⚙️ Opțiuni de Configurare

### Parametrii Șablonului

| Parametru | Tip | Implicit | Descriere |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefix pentru toate numele resurselor |
| `location` | string | Locația grupului de resurse | Regiunea principală de implementare |
| `secondaryLocation` | string | "westus2" | Regiunea secundară pentru implementare multi-regională |
| `tertiaryLocation` | string | "francecentral" | Regiunea pentru modelul embeddings |
| `environmentName` | string | "dev" | Designația mediului (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configurația implementării (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Activează implementarea multi-regională |
| `enableMonitoring` | bool | true | Activează Application Insights și logarea |
| `enableSecurity` | bool | true | Activează Key Vault și securitatea avansată |

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

## 🏗️ Prezentare Generală Arhitectură

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
# Afișează ajutor
./deploy.sh --help

# Implementare de bază
./deploy.sh -g myResourceGroup

# Implementare avansată cu setări personalizate
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Implementare de dezvoltare fără multi-regiune
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funcționalități Script

- ✅ **Validarea cerințelor prealabile** (Azure CLI, status autentificare, fișiere șablon)
- ✅ **Gestionarea grupului de resurse** (creează dacă nu există)
- ✅ **Validarea șablonului** înainte de implementare
- ✅ **Monitorizarea progresului** cu output colorat
- ✅ **Afișarea rezultatelor implementării**
- ✅ **Ghid post-implementare**

## 📊 Monitorizarea Implementării

### Verificați Statusul Implementării

```bash
# Listează implementările
az deployment group list --resource-group myResourceGroup --output table

# Obține detalii despre implementare
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Urmărește progresul implementării
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Rezultatele Implementării

După implementare reușită, următoarele rezultate sunt disponibile:

- **URL Frontend**: Endpoint public pentru interfața web
- **URL Router**: Endpoint API pentru routerul agenților
- **Endpointuri OpenAI**: Endpointuri serviciu OpenAI primar și secundar
- **Serviciu Căutare**: Endpoint serviciu Azure AI Search
- **Cont Stocare**: Numele contului de stocare pentru documente
- **Key Vault**: Numele Key Vault (dacă este activat)
- **Application Insights**: Numele serviciului de monitorizare (dacă este activat)

## 🔧 Post-Implementare: Pași Următori
> **📝 Important:** Infrastructura este implementată, dar trebuie să dezvoltați și să implementați codul aplicației.

### Faza 1: Dezvoltarea Aplicațiilor Agent (Responsabilitatea Dumneavoastră)

Șablonul ARM creează **Container Apps goale** cu imagini nginx de tip placeholder. Trebuie să:

**Dezvoltare necesară:**
1. **Implementarea Agenților** (30-40 ore)
   - Agent de servicii pentru clienți cu integrare GPT-4o
   - Agent de inventar cu integrare GPT-4o-mini
   - Logica de rutare a agenților

2. **Dezvoltare Frontend** (20-30 ore)
   - Interfață UI pentru chat (React/Vue/Angular)
   - Funcționalitate de încărcare fișiere
   - Redare și formatare răspunsuri

3. **Servicii Backend** (12-16 ore)
   - Router FastAPI sau Express
   - Middleware pentru autentificare
   - Integrare telemetrie

**Vezi:** [Ghidul de Arhitectură](../retail-scenario.md) pentru modele detaliate de implementare și exemple de cod

### Faza 2: Configurarea Indexului de Căutare AI (15-30 minute)

Creați un index de căutare care să corespundă modelului dvs. de date:

```bash
# Obține detalii despre serviciul de căutare
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Creează index cu schema ta (exemplu)
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

**Resurse:**
- [Design Schema Index Căutare AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Configurare Căutare Vectorială](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Faza 3: Încărcarea Datelor (Timp variabil)

După ce aveți datele despre produse și documentele:

```bash
# Obține detaliile contului de stocare
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Încarcă documentele tale
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Exemplu: Încarcă un singur fișier
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Faza 4: Construirea și Implementarea Aplicațiilor (8-12 ore)

După ce ați dezvoltat codul agenților:

```bash
# 1. Creați Azure Container Registry (dacă este necesar)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Construiți și împingeți imaginea agent router
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Construiți și împingeți imaginea frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Actualizați Container Apps cu imaginile dvs.
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Configurați variabilele de mediu
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Faza 5: Testarea Aplicației (2-4 ore)

```bash
# Obțineți URL-ul aplicației dvs.
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testați punctul final al agentului (odată ce codul dvs. este implementat)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Verificați jurnalele aplicației
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Resurse pentru Implementare

**Arhitectură și Design:**
- 📖 [Ghid Complet de Arhitectură](../retail-scenario.md) - Modele detaliate de implementare
- 📖 [Modele de Design Multi-Agent](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Exemple de Cod:**
- 🔗 [Exemplu Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Model RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Cadru pentru agenți (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orchestrare agenți (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Conversații multi-agent

**Efort Total Estimat:**
- Implementare infrastructură: 15-25 minute (✅ Complet)
- Dezvoltare aplicație: 80-120 ore (🔨 Munca dvs.)
- Testare și optimizare: 15-25 ore (🔨 Munca dvs.)

## 🛠️ Depanare

### Probleme Comune

#### 1. Cota Azure OpenAI Depășită

```bash
# Verificați utilizarea actuală a cotei
az cognitiveservices usage list --location eastus2

# Solicitați creșterea cotei
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Eșec la Implementarea Container Apps

```bash
# Verificați jurnalele aplicației container
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Reporniți aplicația container
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inițializarea Serviciului de Căutare

```bash
# Verificați starea serviciului de căutare
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testați conectivitatea serviciului de căutare
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validarea Implementării

```bash
# Validați că toate resursele sunt create
az resource list \
  --resource-group myResourceGroup \
  --output table

# Verificați sănătatea resurselor
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considerații de Securitate

### Gestionarea Cheilor
- Toate secretele sunt stocate în Azure Key Vault (dacă este activat)
- Container apps utilizează identitate gestionată pentru autentificare
- Conturile de stocare au setări implicite de securitate (doar HTTPS, fără acces public la blob-uri)

### Securitatea Rețelei
- Container apps utilizează rețele interne, acolo unde este posibil
- Serviciul de căutare configurat cu opțiunea de endpoint-uri private
- Cosmos DB configurat cu permisiuni minime necesare

### Configurarea RBAC
```bash
# Atribuiți rolurile necesare pentru identitatea gestionată
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimizarea Costurilor

### Estimări de Costuri (Lunar, USD)

| Mod | OpenAI | Container Apps | Căutare | Stocare | Total Est. |
|-----|--------|----------------|---------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorizarea Costurilor

```bash
# Configurați alertele de buget
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Actualizări și Mentenanță

### Actualizări Șablon
- Controlați versiunea fișierelor șablon ARM
- Testați modificările mai întâi în mediul de dezvoltare
- Utilizați modul de implementare incremental pentru actualizări

### Actualizări Resurse
```bash
# Actualizați cu noi parametri
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup și Recuperare
- Backup automat activat pentru Cosmos DB
- Ștergere soft activată pentru Key Vault
- Revizii ale aplicațiilor container menținute pentru rollback

## 📞 Suport

- **Probleme Șablon:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suport Azure:** [Portal Suport Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunitate:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Gata să implementați soluția dvs. multi-agent?**

Începeți cu: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->