# Maloobchodné riešenie s viacerými agentmi - Šablóna infraštruktúry

**Kapitola 5: Balík pre nasadenie do produkcie**
- **📚 Domovská stránka kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Súvisiaca kapitola**: [Kapitola 5: Riešenia s viacerými agentmi AI](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Sprievodca scenárom**: [Kompletná architektúra](../retail-scenario.md)
- **🎯 Rýchle nasadenie**: [Nasadenie jedným kliknutím](../../../../examples/retail-multiagent-arm-template)

> **⚠️ IBA ŠABLÓNA INFRAŠTRUKTÚRY**  
> Táto ARM šablóna nasadzuje **Azure zdroje** pre systém s viacerými agentmi.  
>  
> **Čo sa nasadí (15-25 minút):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings v 3 regiónoch)
> - ✅ Služba AI Search (prázdna, pripravená na vytvorenie indexu)
> - ✅ Container Apps (základné obrázky, pripravené na váš kód)
> - ✅ Úložisko, Cosmos DB, Key Vault, Application Insights
>  
> **Čo NIE JE zahrnuté (vyžaduje vývoj):**
> - ❌ Implementačný kód agentov (Zákaznícky agent, Agent inventára)
> - ❌ Logika smerovania a API koncové body
> - ❌ Frontendové chatovacie rozhranie
> - ❌ Schémy indexov vyhľadávania a dátové pipeline
> - ❌ **Odhadovaná náročnosť vývoja: 80-120 hodín**
>  
> **Použite túto šablónu, ak:**
> - ✅ Chcete pripraviť Azure infraštruktúru pre projekt s viacerými agentmi
> - ✅ Plánujete samostatne vyvíjať implementáciu agentov
> - ✅ Potrebujete základ pre produkčne pripravenú infraštruktúru
>  
> **Nepoužívajte, ak:**
> - ❌ Očakávate okamžitú funkčnú ukážku s viacerými agentmi
> - ❌ Hľadáte kompletné príklady aplikačného kódu

## Prehľad

Tento adresár obsahuje komplexnú šablónu Azure Resource Manager (ARM) na nasadenie **základnej infraštruktúry** systému zákazníckej podpory s viacerými agentmi. Šablóna pripraví všetky potrebné Azure služby, správne nakonfigurované a prepojené, pripravené na váš aplikačný vývoj.

**Po nasadení budete mať:** Produkčne pripravenú Azure infraštruktúru  
**Na dokončenie systému potrebujete:** Kód agentov, frontendové rozhranie a konfiguráciu dát (pozrite [Sprievodca architektúrou](../retail-scenario.md))

## 🎯 Čo sa nasadí

### Základná infraštruktúra (Stav po nasadení)

✅ **Azure OpenAI Services** (Pripravené na API volania)
  - Primárny región: GPT-4o nasadenie (kapacita 20K TPM)
  - Sekundárny región: GPT-4o-mini nasadenie (kapacita 10K TPM)
  - Terciárny región: Model textových embeddings (kapacita 30K TPM)
  - Región na hodnotenie: GPT-4o grader model (kapacita 15K TPM)
  - **Stav:** Plne funkčné - okamžite pripravené na API volania

✅ **Azure AI Search** (Prázdne - pripravené na konfiguráciu)
  - Povolené schopnosti vektorového vyhľadávania
  - Štandardná úroveň s 1 partíciou, 1 replikou
  - **Stav:** Služba beží, ale vyžaduje vytvorenie indexu
  - **Potrebná akcia:** Vytvorte vyhľadávací index s vašou schémou

✅ **Azure Storage Account** (Prázdne - pripravené na nahrávanie)
  - Blob kontajnery: `documents`, `uploads`
  - Bezpečná konfigurácia (iba HTTPS, žiadny verejný prístup)
  - **Stav:** Pripravené na prijímanie súborov
  - **Potrebná akcia:** Nahrajte vaše produktové dáta a dokumenty

⚠️ **Container Apps Environment** (Nasadené základné obrázky)
  - Aplikačný router (nginx predvolený obrázok)
  - Frontendová aplikácia (nginx predvolený obrázok)
  - Automatické škálovanie (0-10 inštancií)
  - **Stav:** Bežia základné kontajnery
  - **Potrebná akcia:** Vytvorte a nasadte vaše aplikačné kódy agentov

✅ **Azure Cosmos DB** (Prázdne - pripravené na dáta)
  - Predkonfigurovaná databáza a kontajner
  - Optimalizované pre operácie s nízkou latenciou
  - Povolené TTL pre automatické čistenie
  - **Stav:** Pripravené na ukladanie histórie chatu

✅ **Azure Key Vault** (Voliteľné - pripravené na tajomstvá)
  - Povolené mäkké mazanie
  - RBAC nakonfigurované pre spravované identity
  - **Stav:** Pripravené na ukladanie API kľúčov a pripojovacích reťazcov

✅ **Application Insights** (Voliteľné - monitorovanie aktívne)
  - Pripojené k Log Analytics workspace
  - Nakonfigurované vlastné metriky a upozornenia
  - **Stav:** Pripravené na prijímanie telemetrie z vašich aplikácií

✅ **Document Intelligence** (Pripravené na API volania)
  - Úroveň S0 pre produkčné pracovné zaťaženia
  - **Stav:** Pripravené na spracovanie nahraných dokumentov

✅ **Bing Search API** (Pripravené na API volania)
  - Úroveň S1 pre vyhľadávanie v reálnom čase
  - **Stav:** Pripravené na webové vyhľadávacie dotazy

### Režimy nasadenia

| Režim | Kapacita OpenAI | Inštancie kontajnerov | Úroveň vyhľadávania | Redundancia úložiska | Najvhodnejšie pre |
|-------|-----------------|-----------------------|---------------------|---------------------|------------------|
| **Minimal** | 10K-20K TPM | 0-2 repliky | Basic | LRS (lokálne) | Vývoj/testovanie, učenie, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 repliky | Standard | ZRS (zónové) | Produkcia, stredná záťaž (<10K používateľov) |
| **Premium** | 80K-150K TPM | 5-10 repliky, zónová redundancia | Premium | GRS (geografické) | Podniky, vysoká záťaž (>10K používateľov), 99,99% SLA |

**Vplyv na náklady:**
- **Minimal → Standard:** ~4x zvýšenie nákladov ($100-370/mes → $420-1,450/mes)
- **Standard → Premium:** ~3x zvýšenie nákladov ($420-1,450/mes → $1,150-3,500/mes)
- **Vyberte na základe:** Očakávanej záťaže, požiadaviek na SLA, rozpočtových obmedzení

**Plánovanie kapacity:**
- **TPM (Tokens Per Minute):** Celkový počet naprieč všetkými nasadeniami modelov
- **Inštancie kontajnerov:** Rozsah automatického škálovania (min-max repliky)
- **Úroveň vyhľadávania:** Ovplyvňuje výkon dotazov a limity veľkosti indexu

## 📋 Predpoklady

### Potrebné nástroje
1. **Azure CLI** (verzia 2.50.0 alebo vyššia)
   ```bash
   az --version  # Skontrolovať verziu
   az login      # Autentifikovať
   ```

2. **Aktívne Azure predplatné** s prístupom Owner alebo Contributor
   ```bash
   az account show  # Overiť predplatné
   ```

### Potrebné Azure kvóty

Pred nasadením overte dostatočné kvóty vo vašich cieľových regiónoch:

```bash
# Skontrolujte dostupnosť Azure OpenAI vo vašom regióne
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Overte kvótu OpenAI (príklad pre gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Skontrolujte kvótu pre Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimálne požadované kvóty:**
- **Azure OpenAI:** 3-4 nasadenia modelov naprieč regiónmi
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Poznámka:** GPT-4o môže byť na čakacej listine v niektorých regiónoch - overte [dostupnosť modelov](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Spravované prostredie + 2-10 inštancií kontajnerov
- **AI Search:** Štandardná úroveň (Basic nedostatočná pre vektorové vyhľadávanie)
- **Cosmos DB:** Štandardná prednastavená priepustnosť

**Ak kvóty nie sú dostatočné:**
1. Prejdite na Azure Portal → Kvóty → Požiadajte o zvýšenie
2. Alebo použite Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Zvážte alternatívne regióny s dostupnosťou

## 🚀 Rýchle nasadenie

### Možnosť 1: Použitie Azure CLI

```bash
# Klonujte alebo stiahnite súbory šablóny
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Urobte skript nasadenia spustiteľným
chmod +x deploy.sh

# Nasadzujte s predvolenými nastaveniami
./deploy.sh -g myResourceGroup

# Nasadzujte pre produkciu s prémiovými funkciami
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Možnosť 2: Použitie Azure Portalu

[![Nasadiť do Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Možnosť 3: Priame použitie Azure CLI

```bash
# Vytvorte skupinu zdrojov
az group create --name myResourceGroup --location eastus2

# Nasadiť šablónu
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Časový harmonogram nasadenia

### Čo očakávať

| Fáza | Trvanie | Čo sa deje |
|------|---------|------------||
| **Validácia šablóny** | 30-60 sekúnd | Azure overuje syntax ARM šablóny a parametre |
| **Nastavenie Resource Group** | 10-20 sekúnd | Vytvára sa Resource Group (ak je potrebné) |
| **Nasadenie OpenAI** | 5-8 minút | Vytvára 3-4 OpenAI účty a nasadzuje modely |
| **Container Apps** | 3-5 minút | Vytvára prostredie a nasadzuje základné kontajnery |
| **Vyhľadávanie a úložisko** | 2-4 minúty | Nasadzuje AI Search službu a úložiská |
| **Cosmos DB** | 2-3 minúty | Vytvára databázu a konfiguruje kontajnery |
| **Nastavenie monitorovania** | 2-3 minúty | Nastavuje Application Insights a Log Analytics |
| **Konfigurácia RBAC** | 1-2 minúty | Konfiguruje spravované identity a povolenia |
| **Celkové nasadenie** | **15-25 minút** | Kompletná infraštruktúra pripravená |

**Po nasadení:**
- ✅ **Infraštruktúra pripravená:** Všetky Azure služby nasadené a bežia
- ⏱️ **Vývoj aplikácie:** 80-120 hodín (vaša zodpovednosť)
- ⏱️ **Konfigurácia indexu:** 15-30 minút (vyžaduje vašu schému)
- ⏱️ **Nahrávanie dát:** Závisí od veľkosti datasetu
- ⏱️ **Testovanie a validácia:** 2-4 hodiny

---

## ✅ Overenie úspešnosti nasadenia

### Krok 1: Skontrolujte nasadenie zdrojov (2 minúty)

```bash
# Overte, či boli všetky zdroje úspešne nasadené
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Očakávané:** Prázdna tabuľka (všetky zdroje zobrazujú stav "Succeeded")

### Krok 2: Overte nasadenia Azure OpenAI (3 minúty)

```bash
# Zoznam všetkých účtov OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Skontrolujte nasadenia modelov pre primárny región
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Očakávané:** 
- 3-4 OpenAI účty (primárny, sekundárny, terciárny, hodnotiaci regióny)
- 1-2 nasadenia modelov na účet (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Krok 3: Otestujte koncové body infraštruktúry (5 minút)

```bash
# Získajte URL adresy aplikácie kontajnera
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Otestujte koncový bod smerovača (odpovie zástupný obrázok)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Očakávané:** 
- Container Apps zobrazujú stav "Running"
- Základný nginx odpovedá s HTTP 200 alebo 404 (žiadny aplikačný kód zatiaľ)

### Krok 4: Overte prístup k Azure OpenAI API (3 minúty)

```bash
# Získajte koncový bod OpenAI a kľúč
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Otestujte nasadenie GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Očakávané:** JSON odpoveď s dokončením chatu (potvrdzuje funkčnosť OpenAI)

### Čo funguje vs. čo nie

**✅ Funguje po nasadení:**
- Azure OpenAI modely nasadené a prijímajú API volania
- AI Search služba beží (prázdna, bez indexov)
- Container Apps bežia (základné nginx obrázky)
- Úložiská prístupné a pripravené na nahrávanie
- Cosmos DB pripravené na operácie s dátami
- Application Insights zhromažďuje telemetriu infraštruktúry
- Key Vault pripravený na ukladanie tajomstiev

**❌ Zatiaľ nefunguje (vyžaduje vývoj):**
- Koncové body agentov (žiadny aplikačný kód nasadený)
- Funkčnosť chatu (vyžaduje frontend + backend implementáciu)
- Vyhľadávacie dotazy (žiadny vytvorený vyhľadávací index)
- Pipeline na spracovanie dokumentov (žiadne nahrané dáta)
- Vlastná telemetria (vyžaduje inštrumentáciu aplikácie)

**Ďalšie kroky:** Pozrite [Konfigurácia po nasadení](../../../../examples/retail-multiagent-arm-template) na vývoj a nasadenie vašej aplikácie

---

## ⚙️ Možnosti konfigurácie

### Parametre šablóny

| Parameter | Typ | Predvolená hodnota | Popis |
|-----------|------|--------------------|-------|
| `projectName` | string | "retail" | Prefix pre všetky názvy zdrojov |
| `location` | string | Lokácia Resource Group | Primárny región nasadenia |
| `secondaryLocation` | string | "westus2" | Sekundárny región pre nasadenie vo viacerých regiónoch |
| `tertiaryLocation` | string | "francecentral" | Región pre embeddings model |
| `environmentName` | string | "dev" | Označenie prostredia (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurácia nasadenia (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Povoliť nasadenie vo viacerých regiónoch |
| `enableMonitoring` | bool | true | Povoliť Application Insights a logovanie |
| `enableSecurity` | bool | true | Povoliť Key Vault a zvýšenú bezpečnosť |

### Prispôsobenie parametrov

Upravte `azuredeploy.parameters.json`:

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

## 🏗️ Prehľad architektúry

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

## 📖 Použitie nasadzovacieho skriptu

Skript `deploy.sh` poskytuje interaktívne nasadzovacie prostredie:

```bash
# Zobraziť pomoc
./deploy.sh --help

# Základné nasadenie
./deploy.sh -g myResourceGroup

# Pokročilé nasadenie s vlastnými nastaveniami
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Vývojové nasadenie bez viacerých regiónov
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funkcie skriptu

- ✅ **Validácia predpokladov** (Azure CLI, stav prihlásenia, súbory šablóny)
- ✅ **Správa Resource Group** (vytvorí, ak neexistuje)
- ✅ **Validácia šablóny** pred nasadením
- ✅ **Monitorovanie priebehu** s farebným výstupom
- ✅ **Zobrazenie výstupov nasadenia**
- ✅ **Sprievodca po nasadení**

## 📊 Monitorovanie nasadenia

### Skontrolujte stav nasadenia

```bash
# Zoznam nasadení
az deployment group list --resource-group myResourceGroup --output table

# Získať podrobnosti o nasadení
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Sledovať priebeh nasadenia
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Výstupy nasadenia

Po úspešnom nasadení sú dostupné nasledujúce výstupy:

- **Frontend URL**: Verejný koncový bod pre webové rozhranie
- **Router URL**: API koncový bod pre aplikačný router
- **OpenAI Endpoints**: Primárne a sekundárne OpenAI koncové body
- **Search Service**: Koncový bod služby Azure AI Search
- **Storage Account**: Názov
> **📝 Dôležité:** Infraštruktúra je nasadená, ale je potrebné vyvinúť a nasadiť aplikačný kód.

### Fáza 1: Vývoj aplikácií agentov (Vaša zodpovednosť)

ARM šablóna vytvára **prázdne aplikácie kontajnerov** s dočasnými nginx obrázkami. Musíte:

**Požadovaný vývoj:**
1. **Implementácia agentov** (30-40 hodín)
   - Agent zákazníckeho servisu s integráciou GPT-4o
   - Agent inventára s integráciou GPT-4o-mini
   - Logika smerovania agentov

2. **Vývoj frontend-u** (20-30 hodín)
   - UI pre chatovacie rozhranie (React/Vue/Angular)
   - Funkcionalita nahrávania súborov
   - Formátovanie a zobrazovanie odpovedí

3. **Backend služby** (12-16 hodín)
   - FastAPI alebo Express router
   - Middleware pre autentifikáciu
   - Integrácia telemetrie

**Pozrite si:** [Príručka architektúry](../retail-scenario.md) pre podrobné vzory implementácie a príklady kódu

### Fáza 2: Konfigurácia AI vyhľadávacieho indexu (15-30 minút)

Vytvorte vyhľadávací index zodpovedajúci vášmu dátovému modelu:

```bash
# Získajte podrobnosti o službe vyhľadávania
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Vytvorte index s vašou schémou (príklad)
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

**Zdroje:**
- [Návrh schémy AI vyhľadávacieho indexu](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfigurácia vektorového vyhľadávania](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fáza 3: Nahranie vašich dát (čas sa líši)

Keď máte produktové dáta a dokumenty:

```bash
# Získajte podrobnosti o úložnom účte
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Nahrajte svoje dokumenty
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Príklad: Nahrajte jeden súbor
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fáza 4: Vytvorenie a nasadenie vašich aplikácií (8-12 hodín)

Keď ste vyvinuli kód agentov:

```bash
# 1. Vytvorte Azure Container Registry (ak je to potrebné)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Vytvorte a nahrajte obraz agent routera
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Vytvorte a nahrajte obraz frontend-u
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Aktualizujte Container Apps s vašimi obrazmi
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Nakonfigurujte environmentálne premenné
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fáza 5: Testovanie vašej aplikácie (2-4 hodiny)

```bash
# Získajte URL vašej aplikácie
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Otestujte koncový bod agenta (po nasadení vášho kódu)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Skontrolujte logy aplikácie
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Zdroje implementácie

**Architektúra a dizajn:**
- 📖 [Kompletná príručka architektúry](../retail-scenario.md) - Podrobné vzory implementácie
- 📖 [Vzory dizajnu pre multi-agentov](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Príklady kódu:**
- 🔗 [Azure OpenAI Chat Sample](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG vzor
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Rámec pre agentov (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orchestrácia agentov (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Konverzácie multi-agentov

**Odhadovaný celkový čas:**
- Nasadenie infraštruktúry: 15-25 minút (✅ Hotovo)
- Vývoj aplikácií: 80-120 hodín (🔨 Vaša práca)
- Testovanie a optimalizácia: 15-25 hodín (🔨 Vaša práca)

## 🛠️ Riešenie problémov

### Bežné problémy

#### 1. Prekročenie kvóty Azure OpenAI

```bash
# Skontrolujte aktuálne využitie kvóty
az cognitiveservices usage list --location eastus2

# Požiadajte o zvýšenie kvóty
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Zlyhanie nasadenia aplikácií kontajnerov

```bash
# Skontrolujte denníky aplikácie kontajnera
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Reštartujte aplikáciu kontajnera
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicializácia vyhľadávacej služby

```bash
# Overiť stav služby vyhľadávania
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Otestovať konektivitu služby vyhľadávania
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validácia nasadenia

```bash
# Overiť, či sú všetky zdroje vytvorené
az resource list \
  --resource-group myResourceGroup \
  --output table

# Skontrolovať stav zdrojov
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Bezpečnostné aspekty

### Správa kľúčov
- Všetky tajomstvá sú uložené v Azure Key Vault (ak je povolené)
- Aplikácie kontajnerov používajú spravovanú identitu na autentifikáciu
- Účty úložiska majú zabezpečené predvolené nastavenia (iba HTTPS, žiadny verejný prístup k blobom)

### Sieťová bezpečnosť
- Aplikácie kontajnerov používajú interné sieťové pripojenie, kde je to možné
- Vyhľadávacia služba je nakonfigurovaná s možnosťou privátnych koncových bodov
- Cosmos DB je nakonfigurovaná s minimálnymi potrebnými povoleniami

### Konfigurácia RBAC
```bash
# Priraďte potrebné úlohy pre spravovanú identitu
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimalizácia nákladov

### Odhady nákladov (mesačne, USD)

| Režim | OpenAI | Aplikácie kontajnerov | Vyhľadávanie | Úložisko | Celkový odhad |
|-------|--------|-----------------------|--------------|----------|---------------|
| Minimálny | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Štandardný | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Prémiový | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorovanie nákladov

```bash
# Nastavte upozornenia na rozpočet
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Aktualizácie a údržba

### Aktualizácie šablóny
- Verziujte súbory ARM šablóny
- Testujte zmeny najskôr v vývojovom prostredí
- Používajte režim inkrementálneho nasadenia pre aktualizácie

### Aktualizácie zdrojov
```bash
# Aktualizovať s novými parametrami
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Zálohovanie a obnova
- Automatické zálohovanie Cosmos DB je povolené
- Soft delete v Key Vault je povolené
- Revízie aplikácií kontajnerov sú uchovávané pre možnosť návratu

## 📞 Podpora

- **Problémy so šablónou**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Podpora Azure**: [Portál podpory Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunita**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Pripravení nasadiť vaše riešenie multi-agentov?**

Začnite s: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->