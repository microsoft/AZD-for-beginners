# Architektúra mikroslužieb - príklad Container Apps

⏱️ **Odhadovaný čas**: 25-35 minút | 💰 **Odhadované náklady**: ~$50-100/mesiac | ⭐ **Zložitosť**: Pokročilé

Jednoduchá, ale funkčná architektúra mikroslužieb nasadená do Azure Container Apps pomocou AZD CLI. Tento príklad demonštruje komunikáciu medzi službami, orchestráciu kontajnerov a monitorovanie na praktickom riešení s 2 službami.

> **📚 Prístup k učeniu**: Tento príklad začína s minimálnou architektúrou so 2 službami (API Gateway + backend služba), ktorú si môžete skutočne nasadiť a od ktorej sa môžete učiť. Po zvládnutí základov poskytujeme usmernenie na rozšírenie do plného ekosystému mikroslužieb.

## Čo sa naučíte

Po dokončení tohto príkladu budete:
- Nasadzovať viac kontajnerov do Azure Container Apps
- Implementovať komunikáciu medzi službami s internou sieťou
- Konfigurovať škálovanie na základe prostredia a kontrolu zdravia
- Monitorovať distribuované aplikácie pomocou Application Insights
- Pochopiť vzory nasadenia mikroslužieb a osvedčené postupy
- Naučiť sa postupné rozširovanie od jednoduchých po zložité architektúry

## Architektúra

### Fáza 1: Čo budujeme (zahrnuté v tomto príklade)

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

**Prečo začať jednoducho?**
- ✅ Rýchle nasadenie a pochopenie (25-35 minút)
- ✅ Naučíte sa základné vzory mikroslužieb bez zložitosti
- ✅ Funkčný kód, ktorý môžete upravovať a experimentovať s ním
- ✅ Nižšie náklady na učenie (~$50-100/mesiac vs $300-1400/mesiac)
- ✅ Získate sebadôveru pred pridaním databáz a správnych front

**Analógia**: Predstavte si to ako učenie sa šoférovať. Začnete na prázdnom parkovisku (2 služby), osvojíte si základy a potom prejdete do mestskej premávky (5+ služieb s databázami).

### Fáza 2: Budúce rozšírenie (referenčná architektúra)

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

Pozrite si sekciu „Sprievodca rozšírením“ na konci pre krok za krokom inštrukcie.

## Obsahované funkcie

✅ **Service Discovery**: Automatické zisťovanie na základe DNS medzi kontajnermi  
✅ **Load Balancing**: Vstavané vyváženie záťaže medzi replikami  
✅ **Auto-scaling**: Nezávislé škálovanie pre každú službu na základe HTTP požiadaviek  
✅ **Health Monitoring**: Liveness a readiness sondy pre obe služby  
✅ **Distributed Logging**: Centralizované logovanie s Application Insights  
✅ **Internal Networking**: Bezpečná komunikácia medzi službami  
✅ **Container Orchestration**: Automatické nasadenie a škálovanie  
✅ **Zero-Downtime Updates**: Rolling aktualizácie s riadením revízií  

## Predpoklady

### Požadované nástroje

Pred začiatkom si overte, že máte nainštalované tieto nástroje:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzia 1.0.0 alebo vyššia)
   ```bash
   azd version
   # Očakávaný výstup: azd verzia 1.0.0 alebo novšia
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzia 2.50.0 alebo vyššia)
   ```bash
   az --version
   # Očakávaný výstup: azure-cli 2.50.0 alebo novšia
   ```

3. **[Docker](https://www.docker.com/get-started)** (pre lokálny vývoj/testovanie - voliteľné)
   ```bash
   docker --version
   # Očakávaný výstup: Docker verzia 20.10 alebo novšia
   ```

### Požiadavky pre Azure

- Aktívne **predplatné Azure** ([vytvorte bezplatný účet](https://azure.microsoft.com/free/))
- Povolenia na vytváranie zdrojov vo vašom predplatnom
- **Rola Contributor** na predplatnom alebo v resource groupe

### Potrebné znalosti

Toto je príklad na **pokročilej úrovni**. Mali by ste:
- Dokončiť [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Základné pochopenie architektúry mikroslužieb
- Znalosť REST API a HTTP
- Pochopenie koncepcie kontajnerov

**Nový v Container Apps?** Najprv začnite s [Simple Flask API example](../../../../../examples/container-app/simple-flask-api), aby ste sa naučili základy.

## Rýchly štart (krok za krokom)

### Krok 1: Klonovanie a navigácia

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kontrola úspechu**: Overte, že vidíte `azure.yaml`:
```bash
ls
# Očakávané: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentifikácia v Azure

```bash
azd auth login
```

Toto otvorí váš prehliadač na autentifikáciu v Azure. Prihláste sa pomocou svojich prihlasovacích údajov do Azure.

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
Logged in to Azure.
```

### Krok 3: Inicializácia prostredia

```bash
azd init
```

**Výzvy, ktoré uvidíte**:
- **Názov prostredia**: Zadajte krátky názov (napr. `microservices-dev`)
- **Predplatné Azure**: Vyberte svoje predplatné
- **Lokalita Azure**: Zvoľte región (napr. `eastus`, `westeurope`)

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: New project initialized!
```

### Krok 4: Nasadiť infraštruktúru a služby

```bash
azd up
```

**Čo sa stane** (trvá 8–12 minút):
1. Vytvorí sa Container Apps prostredie
2. Vytvorí sa Application Insights pre monitorovanie
3. Zostaví sa kontajner API Gateway (Node.js)
4. Zostaví sa kontajner Product Service (Python)
5. Nasadia sa oba kontajnery do Azure
6. Skonfiguruje sa sieťovanie a kontrola zdravia
7. Nastaví sa monitorovanie a logovanie

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Čas**: 8–12 minút

### Krok 5: Otestujte nasadenie

```bash
# Získajte koncový bod brány
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Otestujte zdravie API brány
curl $GATEWAY_URL/health

# Očakávaný výstup:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Otestujte produktovú službu cez API Gateway**:
```bash
# Zoznam produktov
curl $GATEWAY_URL/api/products

# Očakávaný výstup:
# [
#   {"id":1,"name":"Notebook","price":999.99,"stock":50},
#   {"id":2,"name":"Myš","price":29.99,"stock":200},
#   {"id":3,"name":"Klávesnica","price":79.99,"stock":150}
# ]
```

**✓ Kontrola úspechu**: Obe koncové body vracajú JSON dáta bez chýb.

---

**🎉 Gratulujeme!** Nasadili ste architektúru mikroslužieb do Azure!

## Štruktúra projektu

Všetky implementačné súbory sú zahrnuté—ide o kompletný, funkčný príklad:

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

**Čo robí každá súčasť:**

**Infraštruktúra (infra/)**:
- `main.bicep`: Orchestruje všetky Azure zdroje a ich závislosti
- `core/container-apps-environment.bicep`: Vytvára Container Apps prostredie a Azure Container Registry
- `core/monitor.bicep`: Nastavuje Application Insights pre distribuované logovanie
- `app/*.bicep`: Individuálne definície container app s konfiguráciou škálovania a sondami zdravia

**API Gateway (src/api-gateway/)**:
- Verejne prístupná služba, ktorá smeruje požiadavky na backend služby
- Implementuje logovanie, ošetrenie chýb a preposielanie požiadaviek
- Demonštruje HTTP komunikáciu medzi službami

**Product Service (src/product-service/)**:
- Interná služba s katalógom produktov (v pamäti pre jednoduchosť)
- REST API s kontrolami zdravia
- Príklad vzoru backend mikroslužby

## Prehľad služieb

### API Gateway (Node.js/Express)

**Port**: 8080  
**Prístup**: Verejný (externý ingress)  
**Účel**: Smeruje prichádzajúce požiadavky na príslušné backend služby  

**Koncové body**:
- `GET /` - Informácie o službe
- `GET /health` - Kontrola zdravia
- `GET /api/products` - Preposiela na product service (zoznam)
- `GET /api/products/:id` - Preposiela na product service (zobraziť podľa ID)

**Hlavné vlastnosti**:
- Smerovanie požiadaviek pomocou axios
- Centralizované logovanie
- Ošetrenie chýb a správa timeoutov
- Zisťovanie služieb cez premenné prostredia
- Integrácia s Application Insights

**Ukážka kódu** (`src/api-gateway/app.js`):
```javascript
// Interná komunikácia medzi službami
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Produktová služba (Python/Flask)

**Port**: 8000  
**Prístup**: Iba interný (bez externého ingressu)  
**Účel**: Spravuje katalóg produktov v pamäti  

**Koncové body**:
- `GET /` - Informácie o službe
- `GET /health` - Kontrola zdravia
- `GET /products` - Zoznam všetkých produktov
- `GET /products/<id>` - Zobraziť produkt podľa ID

**Hlavné vlastnosti**:
- RESTful API s Flask
- Ukladanie produktov v pamäti (jednoduché, nie je potrebná databáza)
- Monitorovanie zdravia pomocou sond
- Štruktúrované logovanie
- Integrácia s Application Insights

**Dátový model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Prečo len interné?**
Produktová služba nie je verejne vystavená. Všetky požiadavky musia prejsť cez API Gateway, ktorá poskytuje:
- Bezpečnosť: Kontrolovaný vstupný bod
- Flexibilitu: Možnosť meniť backend bez vplyvu na klientov
- Monitorovanie: Centralizované logovanie požiadaviek

## Pochopenie komunikácie medzi službami

### Ako spolu služby komunikujú

V tomto príklade API Gateway komunikuje s Product Service pomocou **interných HTTP volaní**:

```javascript
// Brána API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Vykonať vnútornú HTTP požiadavku
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Kľúčové body**:

1. **DNS-založené zisťovanie**: Container Apps automaticky poskytuje DNS pre interné služby
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Zjednodušene: `http://product-service` (Container Apps to vyrieši)

2. **Žiadne verejné vystavenie**: Product Service má v Bicep `external: false`
   - Prístupná len v rámci Container Apps prostredia
   - Nedá sa osloviť z internetu

3. **Premenné prostredia**: URL služieb sú injektované pri nasadení
   - Bicep poskytne interné FQDN do gateway
   - Žiadne pevne zadané URL v aplikačnom kóde

**Analógia**: Predstavte si to ako kancelárske priestory. API Gateway je recepcia (verejne prístupná) a Product Service je kancelária (iba interná). Návštevníci musia prejsť cez recepciu, aby sa dostali do kancelárie.

## Možnosti nasadenia

### Kompletné nasadenie (odporúčané)

```bash
# Nasadiť infraštruktúru a obe služby
azd up
```

Toto nasadí:
1. Container Apps prostredie
2. Application Insights
3. Container Registry
4. Kontajner API Gateway
5. Kontajner Product Service

**Čas**: 8–12 minút

### Nasadiť jednotlivú službu

```bash
# Nasadiť iba jednu službu (po počiatočnom azd up)
azd deploy api-gateway

# Alebo nasadiť produktovú službu
azd deploy product-service
```

**Prípad použitia**: Keď ste upravili kód v jednej službe a chcete znovu nasadiť len túto službu.

### Aktualizovať konfiguráciu

```bash
# Zmeniť parametre škálovania
azd env set GATEWAY_MAX_REPLICAS 30

# Znovu nasadiť s novou konfiguráciou
azd up
```

## Konfigurácia

### Konfigurácia škálovania

Obe služby sú nakonfigurované s HTTP-based autoscaling v ich Bicep súboroch:

**API Gateway**:
- Min. replík: 2 (vždy aspoň 2 pre dostupnosť)
- Max. replík: 20
- Spúšťač škálovania: 50 súbežných požiadaviek na repliku

**Product Service**:
- Min. replík: 1 (možno škálovať na nulu, ak je to potrebné)
- Max. replík: 10
- Spúšťač škálovania: 100 súbežných požiadaviek na repliku

**Prispôsobiť škálovanie** (v `infra/app/*.bicep`):
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

### Pridelenie zdrojov

**API Gateway**:
- CPU: 1.0 vCPU
- Pamäť: 2 GiB
- Dôvod: Spracováva celý externý prenos

**Product Service**:
- CPU: 0.5 vCPU
- Pamäť: 1 GiB
- Dôvod: Ľahké operácie v pamäti

### Kontroly stavu

Obe služby obsahujú liveness a readiness sondy:

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

**Čo to znamená**:
- **Liveness**: Ak kontrola zdravia zlyhá, Container Apps reštartuje kontajner
- **Readiness**: Ak nie je pripravená, Container Apps prestane smerovať premávku na danú repliku



## Monitorovanie a pozorovateľnosť

### Zobraziť logy služieb

```bash
# Zobraziť logy pomocou azd monitor
azd monitor --logs

# Alebo použite Azure CLI pre konkrétne Container Apps:
# Streamovať logy z API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Zobraziť nedávne logy služby produktu
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Očakávaný výstup**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Dopyty v Application Insights

Otvorte Application Insights v Azure Porte a potom spustite tieto dopyty:

**Nájsť pomalé požiadavky**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sledovať volania medzi službami**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Miera chýb podľa služby**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Objem požiadaviek v čase**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Prístup k monitorovaciemu panelu

```bash
# Získať podrobnosti o Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otvoriť monitorovanie v Azure portáli
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Živé metriky

1. Prejdite do Application Insights v Azure Porte
2. Kliknite na "Live Metrics"
3. Zobrať reálne požiadavky, zlyhania a výkon
4. Otestujte spustením: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktické cvičenia

[Poznámka: Pozrite si plné cvičenia vyššie v sekcii "Praktické cvičenia" pre podrobné krok za krokom cvičenia vrátane overenia nasadenia, úprav dát, testov autoscalingu, ošetrenia chýb a pridania tretej služby.]

## Analýza nákladov

### Odhadované mesačné náklady (pre tento príklad so 2 službami)

| Zdroje | Konfigurácia | Odhadované náklady |
|----------|--------------|----------------|
| API Gateway | 2-20 replík, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replík, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Celkom** | | **$58-243/mesiac** |

**Rozpis nákladov podľa využitia**:
- **Nízka prevádzka** (testovanie/učenie): ~ $60/mesiac
- **Stredná prevádzka** (malá produkcia): ~ $120/mesiac
- **Vysoká prevádzka** (zaneprázdnené obdobia): ~ $240/mesiac

### Tipy na optimalizáciu nákladov

1. **Škálovanie na nulu pre vývoj**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Použite Consumption plán pre Cosmos DB** (keď ho pridáte):
   - Plaťte len za to, čo použijete
   - Žiadny minimálny poplatok

3. **Nastavte vzorkovanie v Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Vzorkovať 50 % požiadaviek
   ```

4. **Vyčistite prostredie, keď ho nepotrebujete**:
   ```bash
   azd down
   ```

### Možnosti bezplatnej úrovne
For learning/testing, consider:
- Využite bezplatné kredity Azure (prvých 30 dní)
- Udržujte minimálny počet replík
- Vymažte po testovaní (žiadne priebežné poplatky)

---

## Vyčistenie

Aby ste sa vyhli priebežným poplatkom, odstráňte všetky zdroje:

```bash
azd down --force --purge
```

**Výzva na potvrdenie**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Zadajte `y` na potvrdenie.

**Čo bude odstránené**:
- Prostredie Container Apps
- Obe Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Overiť vyčistenie**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Malo by vrátiť prázdne.

---

## Návod na rozšírenie: Z 2 na 5+ služieb

Keď zvládnete túto architektúru so 2 službami, tu je návod, ako ju rozšíriť:

### Fáza 1: Pridať perzistenciu databázy (ďalší krok)

**Pridať Cosmos DB pre službu produktu**:

1. Vytvorte `infra/core/cosmos.bicep`:
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

2. Aktualizujte službu produktu, aby používala Cosmos DB namiesto dát v pamäti

3. Odhadovaný dodatočný náklad: približne $25/mesiac (serverless)

### Fáza 2: Pridať tretiu službu (správa objednávok)

**Vytvoriť službu objednávok**:

1. Nová zložka: `src/order-service/` (Python/Node.js/C#)
2. Nový Bicep: `infra/app/order-service.bicep`
3. Aktualizujte API Gateway tak, aby presmerovala na `/api/orders`
4. Pridajte Azure SQL Database pre perzistenciu objednávok

**Architektúra bude**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fáza 3: Pridať asynchrónnu komunikáciu (Service Bus)

**Implementovať event-driven architektúru**:

1. Pridajte Azure Service Bus: `infra/core/servicebus.bicep`
2. Služba produktu publikuje udalosti "ProductCreated"
3. Služba objednávok sa prihlási na odber udalostí produktu
4. Pridajte službu notifikácií na spracovanie udalostí

**Vzor**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Fáza 4: Pridať autentifikáciu používateľov

**Implementovať službu používateľov**:

1. Vytvorte `src/user-service/` (Go/Node.js)
2. Pridajte Azure AD B2C alebo vlastnú JWT autentifikáciu
3. API Gateway overuje tokeny
4. Služby kontrolujú oprávnenia používateľa

### Fáza 5: Pripravenosť do produkcie

**Pridať tieto komponenty**:
- Azure Front Door (globálne vyrovnávanie záťaže)
- Azure Key Vault (správa tajomstiev)
- Azure Monitor Workbooks (vlastné panely)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green nasadenia
- Managed Identity pre všetky služby

**Celkové náklady produkčnej architektúry**: približne $300-1,400/mesiac

---

## Zistite viac

### Súvisiaca dokumentácia
- [Dokumentácia Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Sprievodca architektúrou mikroservisov](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights pre distribuované trasovanie](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúce: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Začiatočnícky príklad s jedným kontajnerom
- → Nasledujúce: [Sprievodca integráciou AI](../../../../../examples/docs/ai-foundry) - Pridať AI funkcie
- 🏠 [Domov kurzu](../../README.md)

### Porovnanie: Kedy použiť čo

**Aplikácia v jednom kontajneri** (príklad Simple Flask API):
- ✅ Jednoduché aplikácie
- ✅ Monolitická architektúra
- ✅ Rýchle nasadenie
- ❌ Obmedzená škálovateľnosť
- **Cena**: približne $15-50/mesiac

**Mikroslužby** (tento príklad):
- ✅ Komplexné aplikácie
- ✅ Nezávislé škálovanie pre každú službu
- ✅ Autonómia tímov (rôzne služby, rôzne tímy)
- ❌ Komplikovanejšie na správu
- **Cena**: približne $60-250/mesiac

**Kubernetes (AKS)**:
- ✅ Maximálna kontrola a flexibilita
- ✅ Prenositeľnosť naprieč cloudmi
- ✅ Pokročilé sieťovanie
- ❌ Vyžaduje odborné znalosti Kubernetes
- **Cena**: približne $150-500/mesiac minimum

**Odporúčanie**: Začnite s Container Apps (tento príklad), prejdite na AKS len ak potrebujete špecifické funkcionality Kubernetes.

---

## Často kladené otázky

**Otázka: Prečo len 2 služby namiesto 5+?**  
Odpoveď: Vzdelávací postup. Ovládnite základy (komunikácia služieb, monitorovanie, škálovanie) s jednoduchým príkladom pred pridaním zložitosti. Vzorce, ktoré sa tu naučíte, sa dajú použiť v architektúrach s 100 službami.

**Otázka: Môžem pridať viac služieb sám?**  
Odpoveď: Určite! Postupujte podľa vyššie uvedeného návodu na rozšírenie. Každá nová služba nasleduje ten istý vzor: vytvorte src priečinok, vytvorte Bicep súbor, aktualizujte azure.yaml, nasadte.

**Otázka: Je to pripravené na produkciu?**  
Odpoveď: Je to solídny základ. Pre produkciu pridajte: managed identity, Key Vault, perzistentné databázy, CI/CD pipeline, monitorovacie upozornenia a stratégiu zálohovania.

**Otázka: Prečo nepoužiť Dapr alebo iný service mesh?**  
Odpoveď: Pre učenie udržiavajte veci jednoduché. Keď pochopíte natívne sieťovanie Container Apps, môžete pridať Dapr pre pokročilé scenáre.

**Otázka: Ako debugujem lokálne?**  
Odpoveď: Spustite služby lokálne pomocou Dockeru:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Otázka: Môžem použiť rôzne programovacie jazyky?**  
Odpoveď: Áno! Tento príklad ukazuje Node.js (gateway) + Python (služba produktu). Môžete kombinovať ľubovoľné jazyky, ktoré bežia v kontajneroch.

**Otázka: Čo ak nemám Azure kredity?**  
Odpoveď: Využite bezplatnú vrstvu Azure (prvých 30 dní pri nových účtoch) alebo nasadzujte len na krátke testovacie obdobia a okamžite odstráňte.

---

> **🎓 Zhrnutie učebnej cesty**: Naučili ste sa nasadiť architektúru s viacerými službami s automatickým škálovaním, interným sieťovaním, centralizovaným monitorovaním a vzormi pripravenými na produkciu. Tento základ vás pripraví na zložité distribuované systémy a podnikové architektúry mikroservisov.

**📚 Navigácia kurzu:**
- ← Predchádzajúce: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Nasledujúce: [Príklad integrácie databázy](../../../../../examples/database-app)
- 🏠 [Domov kurzu](../../../README.md)
- 📖 [Najlepšie postupy pre Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku treba považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia ani nesprávne výklady, ktoré môžu vzniknúť v dôsledku použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->