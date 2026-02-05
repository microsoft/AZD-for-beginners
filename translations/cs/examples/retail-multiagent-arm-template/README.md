# Maloobchodní řešení s více agenty - Šablona infrastruktury

**Kapitola 5: Balíček pro nasazení do produkce**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Související kapitola**: [Kapitola 5: Řešení s více agenty](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Průvodce scénářem**: [Kompletní architektura](../retail-scenario.md)
- **🎯 Rychlé nasazení**: [Jedno kliknutí na nasazení](../../../../examples/retail-multiagent-arm-template)

> **⚠️ POUZE ŠABLONA INFRASTRUKTURY**  
> Tento ARM template nasazuje **Azure zdroje** pro systém s více agenty.  
>  
> **Co se nasazuje (15-25 minut):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings ve 3 regionech)
> - ✅ AI Search služba (prázdná, připravena na vytvoření indexu)
> - ✅ Container Apps (zástupné obrázky, připravené na váš kód)
> - ✅ Úložiště, Cosmos DB, Key Vault, Application Insights
>  
> **Co NENÍ zahrnuto (vyžaduje vývoj):**
> - ❌ Kód implementace agentů (Agent zákazníka, Agent inventáře)
> - ❌ Logika směrování a API endpointy
> - ❌ Frontend chat UI
> - ❌ Schémata indexů vyhledávání a datové pipeline
> - ❌ **Odhadovaná doba vývoje: 80-120 hodin**
>  
> **Použijte tuto šablonu, pokud:**
> - ✅ Chcete připravit Azure infrastrukturu pro projekt s více agenty
> - ✅ Plánujete samostatně vyvíjet implementaci agentů
> - ✅ Potřebujete základní infrastrukturu připravenou pro produkci
>  
> **Nepoužívejte, pokud:**
> - ❌ Očekáváte okamžitě funkční demo systému s více agenty
> - ❌ Hledáte kompletní příklady aplikačního kódu

## Přehled

Tento adresář obsahuje komplexní šablonu Azure Resource Manager (ARM) pro nasazení **základní infrastruktury** systému zákaznické podpory s více agenty. Šablona připraví všechny potřebné Azure služby, správně nakonfigurované a propojené, připravené pro váš aplikační vývoj.

**Po nasazení budete mít:** Infrastrukturu Azure připravenou pro produkci  
**Pro dokončení systému potřebujete:** Kód agentů, frontend UI a konfiguraci dat (viz [Průvodce architekturou](../retail-scenario.md))

## 🎯 Co se nasazuje

### Základní infrastruktura (stav po nasazení)

✅ **Azure OpenAI Services** (Připraveno na API volání)
  - Primární region: GPT-4o nasazení (kapacita 20K TPM)
  - Sekundární region: GPT-4o-mini nasazení (kapacita 10K TPM)
  - Třetí region: Model textových embeddings (kapacita 30K TPM)
  - Evaluační region: GPT-4o grader model (kapacita 15K TPM)
  - **Stav:** Plně funkční - API volání možné ihned

✅ **Azure AI Search** (Prázdné - připraveno na konfiguraci)
  - Aktivována schopnost vektorového vyhledávání
  - Standardní úroveň s 1 oddílem, 1 replikou
  - **Stav:** Služba běží, ale vyžaduje vytvoření indexu
  - **Nutná akce:** Vytvořte vyhledávací index podle vašeho schématu

✅ **Azure Storage Account** (Prázdné - připraveno na nahrávání)
  - Blob kontejnery: `documents`, `uploads`
  - Bezpečná konfigurace (pouze HTTPS, žádný veřejný přístup)
  - **Stav:** Připraveno na příjem souborů
  - **Nutná akce:** Nahrajte data o produktech a dokumenty

⚠️ **Container Apps Environment** (Nasazeny zástupné obrázky)
  - Aplikace pro směrování agentů (výchozí obrázek nginx)
  - Frontend aplikace (výchozí obrázek nginx)
  - Automatické škálování nakonfigurováno (0-10 instancí)
  - **Stav:** Běží zástupné kontejnery
  - **Nutná akce:** Vytvořte a nasazte aplikace vašich agentů

✅ **Azure Cosmos DB** (Prázdné - připraveno na data)
  - Databáze a kontejner předkonfigurovány
  - Optimalizováno pro operace s nízkou latencí
  - TTL povoleno pro automatické čištění
  - **Stav:** Připraveno na ukládání historie chatu

✅ **Azure Key Vault** (Volitelné - připraveno na tajemství)
  - Aktivováno měkké mazání
  - RBAC nakonfigurováno pro spravované identity
  - **Stav:** Připraveno na ukládání API klíčů a připojovacích řetězců

✅ **Application Insights** (Volitelné - monitoring aktivní)
  - Připojeno k Log Analytics workspace
  - Nakonfigurovány vlastní metriky a upozornění
  - **Stav:** Připraveno na příjem telemetrie z vašich aplikací

✅ **Document Intelligence** (Připraveno na API volání)
  - Úroveň S0 pro produkční zátěže
  - **Stav:** Připraveno na zpracování nahraných dokumentů

✅ **Bing Search API** (Připraveno na API volání)
  - Úroveň S1 pro vyhledávání v reálném čase
  - **Stav:** Připraveno na dotazy webového vyhledávání

### Režimy nasazení

| Režim | Kapacita OpenAI | Instance kontejnerů | Úroveň vyhledávání | Redundance úložiště | Nejvhodnější pro |
|-------|-----------------|---------------------|--------------------|---------------------|------------------|
| **Minimální** | 10K-20K TPM | 0-2 repliky | Základní | LRS (lokální) | Vývoj/testování, učení, proof-of-concept |
| **Standardní** | 30K-60K TPM | 2-5 replik | Standardní | ZRS (zónová) | Produkce, střední provoz (<10K uživatelů) |
| **Prémiový** | 80K-150K TPM | 5-10 replik, zónová redundance | Prémiový | GRS (geografická) | Podnikové, vysoký provoz (>10K uživatelů), SLA 99,99 % |

**Dopad na náklady:**
- **Minimální → Standardní:** ~4x zvýšení nákladů ($100-370/měsíc → $420-1,450/měsíc)
- **Standardní → Prémiový:** ~3x zvýšení nákladů ($420-1,450/měsíc → $1,150-3,500/měsíc)
- **Vyberte podle:** Očekávané zátěže, požadavků na SLA, rozpočtových omezení

**Plánování kapacity:**
- **TPM (Tokens Per Minute):** Celkem napříč všemi nasazeními modelů
- **Instance kontejnerů:** Rozsah automatického škálování (min-max repliky)
- **Úroveň vyhledávání:** Ovlivňuje výkon dotazů a limity velikosti indexu

## 📋 Předpoklady

### Požadované nástroje
1. **Azure CLI** (verze 2.50.0 nebo vyšší)
   ```bash
   az --version  # Zkontrolujte verzi
   az login      # Ověřte přihlašovací údaje
   ```

2. **Aktivní předplatné Azure** s přístupem vlastníka nebo přispěvatele
   ```bash
   az account show  # Ověřte předplatné
   ```

### Požadované kvóty Azure

Před nasazením ověřte dostatečné kvóty ve vašich cílových regionech:

```bash
# Zkontrolujte dostupnost Azure OpenAI ve vašem regionu
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Ověřte kvótu OpenAI (příklad pro gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Zkontrolujte kvótu Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimální požadované kvóty:**
- **Azure OpenAI:** 3-4 nasazení modelů napříč regiony
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Poznámka:** GPT-4o může být na čekací listině v některých regionech - ověřte [dostupnost modelů](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Spravované prostředí + 2-10 instancí kontejnerů
- **AI Search:** Standardní úroveň (Základní nedostatečná pro vektorové vyhledávání)
- **Cosmos DB:** Standardní přidělená propustnost

**Pokud jsou kvóty nedostatečné:**
1. Přejděte na Azure Portal → Kvóty → Požádejte o zvýšení
2. Nebo použijte Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Zvažte alternativní regiony s dostupností

## 🚀 Rychlé nasazení

### Možnost 1: Použití Azure CLI

```bash
# Klonujte nebo stáhněte soubory šablony
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Udělejte skript nasazení spustitelným
chmod +x deploy.sh

# Nasazení s výchozím nastavením
./deploy.sh -g myResourceGroup

# Nasazení pro produkci s prémiovými funkcemi
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Možnost 2: Použití Azure Portal

[![Nasadit na Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Možnost 3: Přímé použití Azure CLI

```bash
# Vytvořit skupinu prostředků
az group create --name myResourceGroup --location eastus2

# Nasadit šablonu
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Časová osa nasazení

### Co očekávat

| Fáze | Doba trvání | Co se děje |
|------|-------------|------------||
| **Validace šablony** | 30-60 sekund | Azure ověřuje syntaxi ARM šablony a parametry |
| **Nastavení Resource Group** | 10-20 sekund | Vytvoří Resource Group (pokud je potřeba) |
| **Nasazení OpenAI** | 5-8 minut | Vytvoří 3-4 OpenAI účty a nasadí modely |
| **Container Apps** | 3-5 minut | Vytvoří prostředí a nasadí zástupné kontejnery |
| **Vyhledávání a úložiště** | 2-4 minuty | Nasadí AI Search službu a úložiště |
| **Cosmos DB** | 2-3 minuty | Vytvoří databázi a nakonfiguruje kontejnery |
| **Nastavení monitoringu** | 2-3 minuty | Nastaví Application Insights a Log Analytics |
| **Konfigurace RBAC** | 1-2 minuty | Nakonfiguruje spravované identity a oprávnění |
| **Celkové nasazení** | **15-25 minut** | Kompletní infrastruktura připravena |

**Po nasazení:**
- ✅ **Infrastruktura připravena:** Všechny Azure služby nasazeny a běží
- ⏱️ **Vývoj aplikace:** 80-120 hodin (vaše odpovědnost)
- ⏱️ **Konfigurace indexu:** 15-30 minut (vyžaduje vaše schéma)
- ⏱️ **Nahrávání dat:** Závisí na velikosti datasetu
- ⏱️ **Testování a validace:** 2-4 hodiny

---

## ✅ Ověření úspěšnosti nasazení

### Krok 1: Zkontrolujte nasazení zdrojů (2 minuty)

```bash
# Ověřte, zda byly všechny prostředky úspěšně nasazeny
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Očekáváno:** Prázdná tabulka (všechny zdroje ukazují stav "Succeeded")

### Krok 2: Ověřte nasazení Azure OpenAI (3 minuty)

```bash
# Seznam všech účtů OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Zkontrolujte nasazení modelů pro primární region
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Očekáváno:** 
- 3-4 OpenAI účty (primární, sekundární, terciární, evaluační regiony)
- 1-2 nasazení modelů na účet (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Krok 3: Otestujte koncové body infrastruktury (5 minut)

```bash
# Získejte URL adresy aplikace Container
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Otestujte koncový bod routeru (odpoví zástupný obrázek)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Očekáváno:** 
- Container Apps ukazují stav "Running"
- Zástupný nginx odpovídá HTTP 200 nebo 404 (zatím žádný aplikační kód)

### Krok 4: Ověřte přístup k Azure OpenAI API (3 minuty)

```bash
# Získejte koncový bod OpenAI a klíč
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Otestujte nasazení GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Očekáváno:** JSON odpověď s dokončením chatu (potvrzuje funkčnost OpenAI)

### Co funguje vs. co ne

**✅ Funguje po nasazení:**
- Modely Azure OpenAI nasazeny a přijímají API volání
- AI Search služba běží (prázdná, bez indexů)
- Container Apps běží (zástupné nginx obrázky)
- Úložiště přístupné a připravené na nahrávání
- Cosmos DB připraveno na datové operace
- Application Insights sbírá telemetrii infrastruktury
- Key Vault připraven na ukládání tajemství

**❌ Zatím nefunguje (vyžaduje vývoj):**
- Endpointy agentů (zatím žádný aplikační kód)
- Funkčnost chatu (vyžaduje frontend + backend implementaci)
- Dotazy vyhledávání (zatím žádný vytvořený index)
- Pipeline zpracování dokumentů (zatím žádná nahraná data)
- Vlastní telemetrie (vyžaduje instrumentaci aplikace)

**Další kroky:** Viz [Konfigurace po nasazení](../../../../examples/retail-multiagent-arm-template) pro vývoj a nasazení vaší aplikace

---

## ⚙️ Možnosti konfigurace

### Parametry šablony

| Parametr | Typ | Výchozí | Popis |
|----------|-----|---------|-------|
| `projectName` | string | "retail" | Prefix pro všechny názvy zdrojů |
| `location` | string | Umístění Resource Group | Primární region nasazení |
| `secondaryLocation` | string | "westus2" | Sekundární region pro nasazení ve více regionech |
| `tertiaryLocation` | string | "francecentral" | Region pro model embeddings |
| `environmentName` | string | "dev" | Označení prostředí (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurace nasazení (minimální/standardní/prémiový) |
| `enableMultiRegion` | bool | true | Povolit nasazení ve více regionech |
| `enableMonitoring` | bool | true | Povolit Application Insights a logování |
| `enableSecurity` | bool | true | Povolit Key Vault a zvýšenou bezpečnost |

### Přizpůsobení parametrů

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

## 🏗️ Přehled architektury

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

## 📖 Použití skriptu pro nasazení

Skript `deploy.sh` poskytuje interaktivní zážitek z nasazení:

```bash
# Zobrazit nápovědu
./deploy.sh --help

# Základní nasazení
./deploy.sh -g myResourceGroup

# Pokročilé nasazení s vlastními nastaveními
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Vývojové nasazení bez více regionů
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funkce skriptu

- ✅ **Validace předpokladů** (Azure CLI, stav přihlášení, soubory šablony)
- ✅ **Správa Resource Group** (vytvoří, pokud neexistuje)
- ✅ **Validace šablony** před nasazením
- ✅ **Monitoring průběhu** s barevným výstupem
- ✅ **Zobrazení výstupů nasazení**
- ✅ **Pokyny po nasazení**

## 📊 Monitoring nasazení

### Zkontrolujte stav nasazení

```bash
# Seznam nasazení
az deployment group list --resource-group myResourceGroup --output table

# Získat podrobnosti o nasazení
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Sledovat průběh nasazení
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Výstupy nasazení

Po úspěšném nasazení jsou dostupné následující výstupy:

- **Frontend URL**: Veřejný endpoint pro webové rozhraní
- **Router URL**: API endpoint pro směrování agentů
- **OpenAI Endpointy**: Primární a sekundární endpointy OpenAI služeb
- **Search Service**: Endpoint služby Azure AI Search
- **Storage Account**: Název úložiště pro dokumenty
- **Key Vault**: Název Key Vault (pokud povoleno)
- **Application Insights**: Název monitorovací služby (pokud povoleno)

## 🔧 Po nasazení: Další kroky
> **📝 Důležité:** Infrastruktura je nasazena, ale je potřeba vyvinout a nasadit aplikační kód.

### Fáze 1: Vývoj aplikací agentů (Vaše odpovědnost)

ARM šablona vytvoří **prázdné Container Apps** s dočasnými nginx obrázky. Musíte:

**Požadovaný vývoj:**
1. **Implementace agentů** (30-40 hodin)
   - Agent zákaznické podpory s integrací GPT-4o
   - Agent inventáře s integrací GPT-4o-mini
   - Logika směrování agentů

2. **Frontend vývoj** (20-30 hodin)
   - Uživatelské rozhraní pro chat (React/Vue/Angular)
   - Funkce nahrávání souborů
   - Zobrazení a formátování odpovědí

3. **Backend služby** (12-16 hodin)
   - FastAPI nebo Express router
   - Middleware pro autentizaci
   - Integrace telemetrie

**Viz:** [Průvodce architekturou](../retail-scenario.md) pro podrobné implementační vzory a příklady kódu

### Fáze 2: Konfigurace AI vyhledávacího indexu (15-30 minut)

Vytvořte vyhledávací index odpovídající vašemu datovému modelu:

```bash
# Získejte podrobnosti o vyhledávací službě
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Vytvořte index podle svého schématu (příklad)
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
- [Návrh schématu AI vyhledávacího indexu](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfigurace vektorového vyhledávání](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fáze 3: Nahrání vašich dat (Doba se liší)

Jakmile máte produktová data a dokumenty:

```bash
# Získejte podrobnosti o úložišti
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Nahrajte své dokumenty
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Příklad: Nahrajte jeden soubor
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fáze 4: Vytvoření a nasazení vašich aplikací (8-12 hodin)

Jakmile vyvinete kód agentů:

```bash
# 1. Vytvořte Azure Container Registry (pokud je potřeba)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Vytvořte a pushněte image agent routeru
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Vytvořte a pushněte image frontendu
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Aktualizujte Container Apps pomocí vašich imagí
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Nakonfigurujte proměnné prostředí
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fáze 5: Testování vaší aplikace (2-4 hodiny)

```bash
# Získejte URL vaší aplikace
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Otestujte koncový bod agenta (jakmile je váš kód nasazen)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Zkontrolujte logy aplikace
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Zdroje pro implementaci

**Architektura a návrh:**
- 📖 [Kompletní průvodce architekturou](../retail-scenario.md) - Podrobné implementační vzory
- 📖 [Vzorové návrhy pro více agentů](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Příklady kódu:**
- 🔗 [Azure OpenAI Chat Sample](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG vzor
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework pro agenty (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orchestrace agentů (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Konverzace více agentů

**Odhad celkové náročnosti:**
- Nasazení infrastruktury: 15-25 minut (✅ Hotovo)
- Vývoj aplikací: 80-120 hodin (🔨 Vaše práce)
- Testování a optimalizace: 15-25 hodin (🔨 Vaše práce)

## 🛠️ Řešení problémů

### Běžné problémy

#### 1. Překročená kvóta Azure OpenAI

```bash
# Zkontrolujte aktuální využití kvóty
az cognitiveservices usage list --location eastus2

# Požádejte o zvýšení kvóty
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Selhání nasazení Container Apps

```bash
# Zkontrolujte logy aplikace kontejneru
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restartujte aplikaci kontejneru
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicializace vyhledávací služby

```bash
# Ověřte stav vyhledávací služby
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Otestujte připojení k vyhledávací službě
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validace nasazení

```bash
# Ověřte, že všechny zdroje byly vytvořeny
az resource list \
  --resource-group myResourceGroup \
  --output table

# Zkontrolujte stav zdrojů
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Bezpečnostní aspekty

### Správa klíčů
- Všechny tajné klíče jsou uloženy v Azure Key Vault (pokud je povoleno)
- Container Apps používají spravovanou identitu pro autentizaci
- Účty úložiště mají bezpečné výchozí nastavení (pouze HTTPS, žádný veřejný přístup k blobům)

### Síťová bezpečnost
- Container Apps používají interní síťové propojení, kde je to možné
- Vyhledávací služba je nakonfigurována s možností privátních koncových bodů
- Cosmos DB je nakonfigurována s minimálními potřebnými oprávněními

### Konfigurace RBAC
```bash
# Přiřaďte potřebné role pro spravovanou identitu
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimalizace nákladů

### Odhady nákladů (měsíčně, USD)

| Režim | OpenAI | Container Apps | Vyhledávání | Úložiště | Celkem odhad. |
|-------|--------|----------------|-------------|----------|---------------|
| Minimální | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardní | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Prémiový | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorování nákladů

```bash
# Nastavit upozornění na rozpočet
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Aktualizace a údržba

### Aktualizace šablon
- Verzujte soubory ARM šablon
- Testujte změny nejprve v vývojovém prostředí
- Používejte režim inkrementálního nasazení pro aktualizace

### Aktualizace zdrojů
```bash
# Aktualizovat s novými parametry
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Zálohování a obnova
- Cosmos DB má povolené automatické zálohování
- Key Vault má povolené soft delete
- Revidované verze Container Apps jsou uchovávány pro případné vrácení změn

## 📞 Podpora

- **Problémy se šablonou**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Podpora Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunita**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Připraveni nasadit vaše řešení s více agenty?**

Začněte s: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->