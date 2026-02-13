# Architektura mikroslužeb - příklad Container App

⏱️ **Odhadovaný čas**: 25–35 minut | 💰 **Odhadované náklady**: ~50–100 $/měsíc | ⭐ **Složitost**: Pokročilá

Jedna **zjednodušená, ale funkční** architektura mikroslužeb nasazená do Azure Container Apps pomocí AZD CLI. Tento příklad ukazuje komunikaci mezi službami, orchestraci kontejnerů a monitorování s praktickým nastavením se 2 službami.

> **📚 Přístup ke vzdelávání**: Tento příklad začíná s minimální architekturou se 2 službami (API Gateway + backendová služba), kterou si můžete skutečně nasadit a od které se učit. Po zvládnutí tohoto základu poskytujeme pokyny pro rozšíření do plnohodnotného ekosystému mikroslužeb.

## Co se naučíte

Po dokončení tohoto příkladu budete umět:
- Nasadit více kontejnerů do Azure Container Apps
- Implementovat komunikaci služba–služba s interním networkingem
- Nakonfigurovat škálování na základě prostředí a kontrolu stavu
- Monitorovat distribuované aplikace pomocí Application Insights
- Pochopit nasazovací vzory mikroslužeb a osvědčené postupy
- Naučit se postupné rozšiřování od jednoduché k složitější architektuře

## Architektura

### Fáze 1: Co stavíme (součást tohoto příkladu)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Proč začít jednoduše?**
- ✅ Rychlé nasazení a porozumění (25–35 minut)
- ✅ Naučíte se základní vzory mikroslužeb bez složitosti
- ✅ Funkční kód, který můžete upravovat a zkoušet
- ✅ Nižší náklady na učení (~50–100 $/měsíc oproti 300–1400 $/měsíc)
- ✅ Vybudujete si sebevědomí před přidáním databází a front zpráv

**Analogie**: Představte si to jako učení řízení. Začnete na prázdném parkovišti (2 služby), zvládnete základy a pak přejdete do městského provozu (5+ služeb s databázemi).

### Fáze 2: Budoucí rozšíření (referenční architektura)

Po zvládnutí 2-službové architektury ji můžete rozšířit o:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Viz sekce „Expansion Guide“ na konci pro krok za krokem instrukce.

## Zahrnuté funkce

✅ **Objevování služeb**: Automatické objevování založené na DNS mezi kontejnery  
✅ **Vyrovnávání zátěže**: Vestavěné vyrovnávání zátěže mezi replikami  
✅ **Automatické škálování**: Nezávislé škálování pro každou službu na základě HTTP požadavků  
✅ **Monitorování stavu**: Liveness a readiness sondy pro obě služby  
✅ **Distribuované logování**: Centralizované logování pomocí Application Insights  
✅ **Interní síťování**: Bezpečná komunikace služba–služba  
✅ **Orchestrace kontejnerů**: Automatické nasazení a škálování  
✅ **Aktualizace bez výpadku**: Rolling aktualizace s řízením revizí  

## Požadavky

### Požadované nástroje

Před začátkem ověřte, že máte nainstalované tyto nástroje:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verze 1.0.0 nebo vyšší)
   ```bash
   azd version
   # Očekávaný výstup: azd verze 1.0.0 nebo vyšší
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verze 2.50.0 nebo vyšší)
   ```bash
   az --version
   # Očekávaný výstup: azure-cli 2.50.0 nebo vyšší
   ```

3. **[Docker](https://www.docker.com/get-started)** (pro lokální vývoj/testování - volitelné)
   ```bash
   docker --version
   # Očekávaný výstup: Docker verze 20.10 nebo vyšší
   ```

### Požadavky na Azure

- Aktivní **Azure subscription** ([vytvořte si bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnění vytvářet prostředky ve vaší subscription
- Role **Contributor** na subscription nebo resource group

### Požadavky na znalosti

Toto je příklad na **pokročilé úrovni**. Měli byste mít:
- Dokončený [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Základní porozumění architektuře mikroslužeb
- Povědomí o REST API a HTTP
- Pochopení konceptů kontejnerů

**Jste noví v Container Apps?** Začněte nejprve s [Simple Flask API example](../../../../../examples/container-app/simple-flask-api), abyste se naučili základy.

## Rychlý start (krok za krokem)

### Krok 1: Klonování a navigace

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kontrola úspěchu**: Ověřte, že vidíte `azure.yaml`:
```bash
ls
# Očekává se: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentizace do Azure

```bash
azd auth login
```

Toto otevře váš prohlížeč pro autentizaci do Azure. Přihlaste se pomocí svých Azure přihlašovacích údajů.

**✓ Kontrola úspěchu**: Měli byste vidět:
```
Logged in to Azure.
```

### Krok 3: Inicializace prostředí

```bash
azd init
```

**Výzvy, které uvidíte**:
- **Environment name**: Zadejte krátký název (např. `microservices-dev`)
- **Azure subscription**: Vyberte svou subscription
- **Azure location**: Zvolte region (např. `eastus`, `westeurope`)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: New project initialized!
```

### Krok 4: Nasazení infrastruktury a služeb

```bash
azd up
```

**Co se stane** (trvá 8–12 minut):
1. Vytvoří Container Apps environment
2. Vytvoří Application Insights pro monitorování
3. Sestaví API Gateway kontejner (Node.js)
4. Sestaví Product Service kontejner (Python)
5. Nasadí oba kontejnery do Azure
6. Nakonfiguruje síťování a kontroly stavu
7. Nastaví monitorování a logování

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Čas**: 8–12 minut

### Krok 5: Otestujte nasazení

```bash
# Získejte koncový bod brány
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Otestujte stav API brány
curl $GATEWAY_URL/health

# Očekávaný výstup:
# {"stav":"zdravý","služba":"api-brána","časové_razítko":"2025-11-19T10:30:00Z"}
```

**Test produktové služby přes gateway**:
```bash
# Seznam produktů
curl $GATEWAY_URL/api/products

# Očekávaný výstup:
# [
#   {"id":1,"name":"Notebook","price":999.99,"stock":50},
#   {"id":2,"name":"Myš","price":29.99,"stock":200},
#   {"id":3,"name":"Klávesnice","price":79.99,"stock":150}
# ]
```

**✓ Kontrola úspěchu**: Oba endpointy vrátí JSON data bez chyb.

---

**🎉 Gratulujeme!** Nasadili jste architekturu mikroslužeb do Azure!

## Struktura projektu

Všechny implementační soubory jsou zahrnuty — jedná se o kompletní, funkční příklad:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Co každý komponent dělá:**

**Infrastructure (infra/)**:
- `main.bicep`: Orchestrace všech Azure prostředků a jejich závislostí
- `core/container-apps-environment.bicep`: Vytváří Container Apps environment a Azure Container Registry
- `core/monitor.bicep`: Nastavuje Application Insights pro distribuované logování
- `app/*.bicep`: Individuální definice container app s škálováním a kontrolami stavu

**API Gateway (src/api-gateway/)**:
- Veřejná služba, která směruje požadavky na backendové služby
- Implementuje logování, zpracování chyb a přeposílání požadavků
- Demonstruje komunikaci služba–služba přes HTTP

**Product Service (src/product-service/)**:
- Interní služba s katalogem produktů (in-memory pro jednoduchost)
- REST API s kontrolami stavu
- Příklad backendového vzoru mikroslužby

## Přehled služeb

### API Gateway (Node.js/Express)

**Port**: 8080  
**Přístup**: Veřejný (external ingress)  
**Účel**: Směruje příchozí požadavky na příslušné backendové služby  

**Endpointy**:
- `GET /` - Informace o službě
- `GET /health` - Health check endpoint
- `GET /api/products` - Přepošle na product service (vypsat vše)
- `GET /api/products/:id` - Přepošle na product service (získat podle ID)

**Klíčové vlastnosti**:
- Směrování požadavků s axios
- Centralizované logování
- Zpracování chyb a nastavení timeoutů
- Objevování služeb přes proměnné prostředí
- Integrace Application Insights

**Zajímavý úryvek kódu** (`src/api-gateway/app.js`):
```javascript
// Interní komunikace služby
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Přístup**: Pouze interní (bez externího ingressu)  
**Účel**: Spravuje katalog produktů s in-memory daty  

**Endpointy**:
- `GET /` - Informace o službě
- `GET /health` - Health check endpoint
- `GET /products` - Vypsat všechny produkty
- `GET /products/<id>` - Získat produkt podle ID

**Klíčové vlastnosti**:
- RESTful API s Flaskem
- In-memory úložiště produktů (jednoduché, není potřeba databáze)
- Monitorování stavu pomocí sond
- Strukturované logování
- Integrace Application Insights

**Datový model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Proč jen interní?**
Product service není veřejně vystavena. Všechny požadavky musí projít přes API Gateway, která poskytuje:
- Bezpečnost: Řízený vstupní bod
- Flexibilitu: Možnost měnit backend bez vlivu na klienty
- Monitorování: Centralizované logování požadavků

## Pochopení komunikace mezi službami

### Jak spolu služby komunikují

V tomto příkladu API Gateway komunikuje s Product Service pomocí **interních HTTP volání**:

```javascript
// API brána (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Proveď interní HTTP požadavek
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Klíčové body**:

1. **Objevování založené na DNS**: Container Apps automaticky poskytuje DNS pro interní služby
   - FQDN Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Zjednodušeno jako: `http://product-service` (Container Apps to vyřeší)

2. **Žádné veřejné vystavení**: Product Service má v Bicep `external: false`
   - Přístupná pouze v rámci Container Apps environmentu
   - Není dosažitelná z internetu

3. **Proměnné prostředí**: URL služeb jsou injektovány při nasazení
   - Bicep předává interní FQDN do gateway
   - V aplikačním kódu nejsou žádné hardcodované URL

**Analogie**: Představte si to jako kancelářské místnosti. API Gateway je recepce (veřejná), a Product Service je kancelář (pouze interní). Návštěvníci musí projít recepcí, aby se dostali do kanceláře.

## Možnosti nasazení

### Plné nasazení (doporučeno)

```bash
# Nasadit infrastrukturu a obě služby
azd up
```

Toto nasadí:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway kontejner
5. Product Service kontejner

**Čas**: 8–12 minut

### Nasadit jednotlivou službu

```bash
# Nasadit pouze jednu službu (po počátečním azd up)
azd deploy api-gateway

# Nebo nasadit produktovou službu
azd deploy product-service
```

**Použití**: Když jste aktualizovali kód v jedné službě a chcete nasadit pouze tu službu.

### Aktualizace konfigurace

```bash
# Změňte parametry škálování
azd env set GATEWAY_MAX_REPLICAS 30

# Znovu nasaďte s novou konfigurací
azd up
```

## Konfigurace

### Konfigurace škálování

Obě služby jsou v jejich Bicep souborech nakonfigurovány pro HTTP založené autoscaling:

**API Gateway**:
- Min repliky: 2 (vždy alespoň 2 pro dostupnost)
- Max repliky: 20
- Trigger škálování: 50 současných požadavků na repliku

**Product Service**:
- Min repliky: 1 (v případě potřeby může škálovat na nulu)
- Max repliky: 10
- Trigger škálování: 100 současných požadavků na repliku

**Přizpůsobení škálování** (v `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Přidělení prostředků

**API Gateway**:
- CPU: 1.0 vCPU
- Paměť: 2 GiB
- Důvod: Zpracovává veškerý externí provoz

**Product Service**:
- CPU: 0.5 vCPU
- Paměť: 1 GiB
- Důvod: Lehká in-memory operace

### Kontroly stavu

Obě služby zahrnují liveness a readiness sondy:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Co to znamená**:
- **Liveness**: Pokud kontrola stavu selže, Container Apps restartuje kontejner
- **Readiness**: Pokud není připravená, Container Apps přestane směrovat provoz na tu repliku



## Monitorování a observabilita

### Zobrazení logů služby

```bash
# Zobrazte protokoly pomocí azd monitoru
azd monitor --logs

# Nebo použijte Azure CLI pro konkrétní Container Apps:
# Streamujte protokoly z API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Zobrazte nedávné protokoly služby produktu
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Očekávaný výstup**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Dotazy v Application Insights

Přejděte do Application Insights v Azure Portal a spusťte tyto dotazy:

**Najít pomalé požadavky**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sledovat volání služba–služba**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Míra chyb podle služby**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Objem požadavků v čase**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Přístup k dashboardu monitorování

```bash
# Získat podrobnosti o Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otevřít monitorování v portálu Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Přejděte do Application Insights v Azure Portal
2. Klikněte na "Live Metrics"
3. Uvidíte metriky v reálném čase: požadavky, selhání a výkon
4. Otestujte spuštěním: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktická cvičení

[Poznámka: Viz úplná cvičení výše v sekci „Practical Exercises“ pro podrobné krok za krokem aktivity včetně ověření nasazení, úprav dat, testů autoskalování, zpracování chyb a přidání třetí služby.]

## Analýza nákladů

### Odhadované měsíční náklady (pro tento příklad se 2 službami)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Rozpis nákladů podle využití**:
- **Nízká zátěž** (testování/učení): ~60 $/měsíc
- **Střední zátěž** (malá produkce): ~120 $/měsíc
- **Vysoká zátěž** (náročné období): ~240 $/měsíc

### Tipy pro optimalizaci nákladů

1. **Škálovat na nulu pro vývoj**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Použijte Consumption plán pro Cosmos DB** (když ji přidáte):
   - Platíte pouze za to, co využijete
   - Žádný minimální poplatek

3. **Nastavte sampling v Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Vzorkovat 50 % požadavků
   ```

4. **Vyčistěte prostředky, když nejsou potřeba**:
   ```bash
   azd down
   ```

### Možnosti bezplatného tarifu
Pro učení/testování zvažte:
- Použijte Azure free credits (prvních 30 dní)
- Udržujte minimální počet replik
- Odstraňte po testování (žádné průběžné poplatky)

---

## Úklid

Aby nedocházelo k průběžným poplatkům, odstraňte všechny zdroje:

```bash
azd down --force --purge
```

**Potvrzovací výzva**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Zadejte `y` pro potvrzení.

**Co se smaže**:
- Container Apps Environment
- Obě Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Ověření úklidu**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Mělo by vrátit prázdný výsledek.

---

## Průvodce rozšířením: Z 2 na 5+ služeb

Jakmile zvládnete tuto architekturu se 2 službami, zde je návod, jak rozšířit:

### Fáze 1: Přidat perzistenci databáze (další krok)

**Přidat Cosmos DB pro službu produktů**:

1. Vytvořte `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Aktualizujte product service tak, aby používala Cosmos DB místo dat v paměti

3. Odhadované dodatečné náklady: ~25 USD/měsíc (serverless)

### Fáze 2: Přidat třetí službu (správa objednávek)

**Vytvořit Order Service**:

1. Nová složka: `src/order-service/` (Python/Node.js/C#)
2. Nový Bicep: `infra/app/order-service.bicep`
3. Aktualizujte API Gateway pro routování `/api/orders`
4. Přidejte Azure SQL Database pro perzistenci objednávek

**Architektura bude**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fáze 3: Přidat asynchronní komunikaci (Service Bus)

**Implementovat architekturu řízenou událostmi**:

1. Přidejte Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service publikuje události "ProductCreated"
3. Order Service se přihlašuje k událostem produktů
4. Přidejte Notification Service pro zpracování událostí

**Vzor**: Požadavek/Odpověď (HTTP) + řízené událostmi (Service Bus)

### Fáze 4: Přidat autentizaci uživatelů

**Implementovat User Service**:

1. Vytvořte `src/user-service/` (Go/Node.js)
2. Přidejte Azure AD B2C nebo vlastní JWT autentizaci
3. API Gateway ověřuje tokeny
4. Služby kontrolují oprávnění uživatelů

### Fáze 5: Připravenost do produkce

**Přidejte tyto komponenty**:
- Azure Front Door (globální vyrovnávání zátěže)
- Azure Key Vault (správa tajemství)
- Azure Monitor Workbooks (vlastní panely)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green nasazení
- Spravovaná identita pro všechny služby

**Cena plné produkční architektury**: ~300–1 400 USD/měsíc

---

## Další informace

### Související dokumentace
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Další kroky v tomto kurzu
- ← Předchozí: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Začátečnický příklad s jedním kontejnerem
- → Další: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Přidat AI schopnosti
- 🏠 [Domov kurzu](../../README.md)

### Porovnání: Kdy použít co

**Aplikace v jednom kontejneru** (příklad Simple Flask API):
- ✅ Jednoduché aplikace
- ✅ Monolitická architektura
- ✅ Rychlé nasazení
- ❌ Omezená škálovatelnost
- **Cena**: ~15–50 USD/měsíc

**Mikroslužby** (tento příklad):
- ✅ Složité aplikace
- ✅ Nezávislé škálování pro každou službu
- ✅ Autonomie týmu (různé služby, různé týmy)
- ❌ Složitější správa
- **Cena**: ~60–250 USD/měsíc

**Kubernetes (AKS)**:
- ✅ Maximální kontrola a flexibilita
- ✅ Přenositelnost mezi cloudy
- ✅ Pokročilá síťová konfigurace
- ❌ Vyžaduje znalost Kubernetes
- **Cena**: ~150–500 USD/měsíc minimum

**Doporučení**: Začněte s Container Apps (tento příklad), přejděte na AKS pouze pokud potřebujete funkce specifické pro Kubernetes.

---

## Často kladené otázky

**Otázka: Proč jen 2 služby místo 5+?**  
Odpověď: Vzdělávací postup. Ovládněte základy (komunikace mezi službami, monitoring, škálování) s jednoduchým příkladem před přidáním složitosti. Vzory, které se zde naučíte, platí i pro architektury s 100 službami.

**Otázka: Mohu přidat více služeb sám?**  
Odpověď: Rozhodně! Postupujte podle průvodce rozšířením výše. Každá nová služba následuje stejný vzor: vytvořit složku src, vytvořit Bicep soubor, aktualizovat azure.yaml, nasadit.

**Otázka: Je to připravené pro produkci?**  
Odpověď: Je to solidní základ. Pro produkci přidejte: spravovanou identitu, Key Vault, perzistentní databáze, CI/CD pipeline, monitorovací upozornění a zálohovací strategii.

**Otázka: Proč nepoužít Dapr nebo jiný service mesh?**  
Odpověď: Zachovejte jednoduchost pro učení. Jakmile pochopíte nativní síťování Container Apps, můžete přidat Dapr pro pokročilé scénáře.

**Otázka: Jak debugovat lokálně?**  
Odpověď: Spusťte služby lokálně s Dockerem:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Otázka: Mohu použít různé programovací jazyky?**  
Odpověď: Ano! Tento příklad ukazuje Node.js (gateway) + Python (product service). Můžete kombinovat jakékoli jazyky, které běží v kontejnerech.

**Otázka: Co když nemám kredity Azure?**  
Odpověď: Použijte Azure free tier (prvních 30 dní pro nové účty) nebo nasazujte na krátké testovací období a okamžitě odstraňte.

---

> **🎓 Shrnutí učební cesty**: Naučili jste se nasadit architekturu s více službami s automatickým škálováním, interním propojením, centralizovaným monitoringem a vzory připravenými pro produkci. Tento základ vás připraví na složité distribuované systémy a podnikové mikroslužby.

**📚 Navigace kurzu:**
- ← Předchozí: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Další: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Domov kurzu](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby AI překladů Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za rozhodující zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->