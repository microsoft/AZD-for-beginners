# Architektura mikroslužeb - Příklad aplikace v kontejnerech

⏱️ **Odhadovaný čas**: 25-35 minut | 💰 **Odhadované náklady**: ~50-100 $/měsíc | ⭐ **Složitost**: Pokročilá

**Zjednodušená, ale funkční** architektura mikroslužeb nasazená do Azure Container Apps pomocí AZD CLI. Tento příklad ukazuje komunikaci mezi službami, orchestraci kontejnerů a monitorování s praktickým nastavením dvou služeb.

> **📚 Vzdělávací přístup**: Tento příklad začíná s minimální architekturou dvou služeb (API Gateway + Backend Service), kterou můžete skutečně nasadit a učit se z ní. Po zvládnutí tohoto základu poskytujeme pokyny pro rozšíření na plnohodnotný ekosystém mikroslužeb.

## Co se naučíte

Po dokončení tohoto příkladu budete schopni:
- Nasadit více kontejnerů do Azure Container Apps
- Implementovat komunikaci mezi službami pomocí interní sítě
- Konfigurovat škálování a zdravotní kontroly na základě prostředí
- Monitorovat distribuované aplikace pomocí Application Insights
- Pochopit vzory nasazení mikroslužeb a osvědčené postupy
- Naučit se postupné rozšiřování od jednoduchých k složitějším architekturám

## Architektura

### Fáze 1: Co budujeme (součástí tohoto příkladu)

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
- ✅ Rychlé nasazení a pochopení (25-35 minut)
- ✅ Naučte se základní vzory mikroslužeb bez složitostí
- ✅ Funkční kód, který můžete upravovat a experimentovat s ním
- ✅ Nižší náklady na učení (~50-100 $/měsíc oproti 300-1400 $/měsíc)
- ✅ Získejte jistotu před přidáním databází a front zpráv

**Přirovnání**: Je to jako učit se řídit. Začnete na prázdném parkovišti (2 služby), zvládnete základy a poté přejdete na městský provoz (5+ služeb s databázemi).

### Fáze 2: Budoucí rozšíření (referenční architektura)

Jakmile zvládnete architekturu dvou služeb, můžete ji rozšířit na:

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

Podívejte se na sekci "Průvodce rozšířením" na konci pro podrobné pokyny.

## Zahrnuté funkce

✅ **Objevování služeb**: Automatické objevování DNS mezi kontejnery  
✅ **Vyvažování zátěže**: Vestavěné vyvažování zátěže mezi replikami  
✅ **Automatické škálování**: Nezávislé škálování pro každou službu na základě HTTP požadavků  
✅ **Monitorování zdraví**: Kontroly živosti a připravenosti pro obě služby  
✅ **Distribuované logování**: Centralizované logování pomocí Application Insights  
✅ **Interní síť**: Bezpečná komunikace mezi službami  
✅ **Orchestrace kontejnerů**: Automatické nasazení a škálování  
✅ **Aktualizace bez výpadků**: Postupné aktualizace s řízením revizí  

## Předpoklady

### Požadované nástroje

Před zahájením ověřte, že máte nainstalované tyto nástroje:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verze 1.0.0 nebo vyšší)  
   ```bash
   azd version
   # Očekávaný výstup: verze azd 1.0.0 nebo vyšší
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

- Aktivní **Azure předplatné** ([vytvořte si bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnění k vytváření prostředků ve vašem předplatném
- Role **Přispěvatel** v předplatném nebo skupině prostředků

### Požadavky na znalosti

Toto je příklad na **pokročilé úrovni**. Měli byste mít:
- Dokončený [jednoduchý příklad Flask API](../../../../../examples/container-app/simple-flask-api) 
- Základní pochopení architektury mikroslužeb
- Znalost REST API a HTTP
- Pochopení konceptů kontejnerů

**Nováček v Container Apps?** Začněte nejprve s [jednoduchým příkladem Flask API](../../../../../examples/container-app/simple-flask-api), abyste se naučili základy.

## Rychlý start (krok za krokem)

### Krok 1: Klonování a navigace

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kontrola úspěchu**: Ověřte, že vidíte `azure.yaml`:
```bash
ls
# Očekáváno: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentizace s Azure

```bash
azd auth login
```

Tím se otevře váš prohlížeč pro autentizaci Azure. Přihlaste se pomocí svých Azure přihlašovacích údajů.

**✓ Kontrola úspěchu**: Měli byste vidět:
```
Logged in to Azure.
```

### Krok 3: Inicializace prostředí

```bash
azd init
```

**Výzvy, které uvidíte**:
- **Název prostředí**: Zadejte krátký název (např. `microservices-dev`)
- **Azure předplatné**: Vyberte své předplatné
- **Azure lokalita**: Vyberte region (např. `eastus`, `westeurope`)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: New project initialized!
```

### Krok 4: Nasazení infrastruktury a služeb

```bash
azd up
```

**Co se stane** (trvá 8-12 minut):
1. Vytvoří prostředí Container Apps
2. Vytvoří Application Insights pro monitorování
3. Sestaví kontejner API Gateway (Node.js)
4. Sestaví kontejner Product Service (Python)
5. Nasadí oba kontejnery do Azure
6. Nakonfiguruje síť a zdravotní kontroly
7. Nastaví monitorování a logování

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Čas**: 8-12 minut

### Krok 5: Testování nasazení

```bash
# Získejte koncový bod brány
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Otestujte zdraví API Gateway
curl $GATEWAY_URL/health

# Očekávaný výstup:
# {"status":"zdravý","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testování služby produktů přes bránu**:
```bash
# Seznam produktů
curl $GATEWAY_URL/api/products

# Očekávaný výstup:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Myš","price":29.99,"stock":200},
#   {"id":3,"name":"Klávesnice","price":79.99,"stock":150}
# ]
```

**✓ Kontrola úspěchu**: Oba koncové body vracejí JSON data bez chyb.

---

**🎉 Gratulujeme!** Nasadili jste architekturu mikroslužeb do Azure!

## Struktura projektu

Všechny implementační soubory jsou zahrnuty – jedná se o kompletní, funkční příklad:

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

**Co dělá každá komponenta:**

**Infrastruktura (infra/)**:
- `main.bicep`: Orchestrace všech Azure prostředků a jejich závislostí
- `core/container-apps-environment.bicep`: Vytváří prostředí Container Apps a Azure Container Registry
- `core/monitor.bicep`: Nastavuje Application Insights pro distribuované logování
- `app/*.bicep`: Definice jednotlivých kontejnerových aplikací se škálováním a zdravotními kontrolami

**API Gateway (src/api-gateway/)**:
- Veřejně přístupná služba, která směruje požadavky na backendové služby
- Implementuje logování, zpracování chyb a přesměrování požadavků
- Ukazuje HTTP komunikaci mezi službami

**Product Service (src/product-service/)**:
- Interní služba s katalogem produktů (pro jednoduchost v paměti)
- REST API se zdravotními kontrolami
- Příklad vzoru backendové mikroslužby

## Přehled služeb

### API Gateway (Node.js/Express)

**Port**: 8080  
**Přístup**: Veřejný (externí přístup)  
**Účel**: Směruje příchozí požadavky na příslušné backendové služby  

**Koncové body**:
- `GET /` - Informace o službě
- `GET /health` - Koncový bod zdravotní kontroly
- `GET /api/products` - Přesměrování na službu produktů (seznam všech)
- `GET /api/products/:id` - Přesměrování na službu produktů (získání podle ID)

**Klíčové funkce**:
- Směrování požadavků pomocí axios
- Centralizované logování
- Zpracování chyb a správa časových limitů
- Objevování služeb prostřednictvím proměnných prostředí
- Integrace Application Insights

**Ukázka kódu** (`src/api-gateway/app.js`):
```javascript
// Interní komunikace služeb
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Přístup**: Pouze interní (žádný externí přístup)  
**Účel**: Spravuje katalog produktů s daty v paměti  

**Koncové body**:
- `GET /` - Informace o službě
- `GET /health` - Koncový bod zdravotní kontroly
- `GET /products` - Seznam všech produktů
- `GET /products/<id>` - Získání produktu podle ID

**Klíčové funkce**:
- RESTful API s Flask
- Úložiště produktů v paměti (jednoduché, bez potřeby databáze)
- Monitorování zdraví pomocí sond
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

**Proč pouze interní?**
Služba produktů není veřejně přístupná. Všechny požadavky musí procházet přes API Gateway, která poskytuje:
- Bezpečnost: Řízený přístupový bod
- Flexibilitu: Možnost změnit backend bez ovlivnění klientů
- Monitorování: Centralizované logování požadavků

## Pochopení komunikace mezi službami

### Jak spolu služby komunikují

V tomto příkladu API Gateway komunikuje se službou produktů pomocí **interních HTTP volání**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Proveď interní HTTP požadavek
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Klíčové body**:

1. **Objevování na základě DNS**: Container Apps automaticky poskytuje DNS pro interní služby
   - FQDN služby produktů: `product-service.internal.<environment>.azurecontainerapps.io`
   - Zjednodušeno na: `http://product-service` (Container Apps to vyřeší)

2. **Žádná veřejná expozice**: Služba produktů má `external: false` v Bicep
   - Přístupná pouze v prostředí Container Apps
   - Nelze ji dosáhnout z internetu

3. **Proměnné prostředí**: URL služeb jsou injektovány při nasazení
   - Bicep předává interní FQDN bráně
   - Žádné pevně zakódované URL v aplikačním kódu

**Přirovnání**: Představte si to jako kancelářské místnosti. API Gateway je recepce (veřejně přístupná) a služba produktů je kancelář (pouze interní). Návštěvníci musí projít recepcí, aby se dostali do jakékoli kanceláře.

## Možnosti nasazení

### Plné nasazení (doporučeno)

```bash
# Nasadit infrastrukturu a obě služby
azd up
```

Tím se nasadí:
1. Prostředí Container Apps
2. Application Insights
3. Container Registry
4. Kontejner API Gateway
5. Kontejner Product Service

**Čas**: 8-12 minut

### Nasazení jednotlivé služby

```bash
# Nasadit pouze jednu službu (po počátečním azd up)
azd deploy api-gateway

# Nebo nasadit službu produktu
azd deploy product-service
```

**Použití**: Když jste aktualizovali kód v jedné službě a chcete nasadit pouze tuto službu.

### Aktualizace konfigurace

```bash
# Změňte parametry škálování
azd env set GATEWAY_MAX_REPLICAS 30

# Znovu nasadit s novou konfigurací
azd up
```

## Konfigurace

### Konfigurace škálování

Obě služby jsou nakonfigurovány s automatickým škálováním na základě HTTP v jejich Bicep souborech:

**API Gateway**:
- Min. repliky: 2 (vždy alespoň 2 pro dostupnost)
- Max. repliky: 20
- Spouštěč škálování: 50 současných požadavků na repliku

**Product Service**:
- Min. repliky: 1 (může se škálovat na nulu, pokud je potřeba)
- Max. repliky: 10
- Spouštěč škálování: 100 současných požadavků na repliku

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
- Důvod: Lehká operace v paměti

### Zdravotní kontroly

Obě služby zahrnují sondy živosti a připravenosti:

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
- **Živost**: Pokud zdravotní kontrola selže, Container Apps restartuje kontejner
- **Připravenost**: Pokud není připraven, Container Apps přestane směrovat provoz na tuto repliku

## Monitorování a sledování

### Zobrazení logů služby

```bash
# Streamujte logy z API Gateway
azd logs api-gateway --follow

# Zobrazit nedávné logy služby produktu
azd logs product-service --tail 100

# Zobrazit všechny logy z obou služeb
azd logs --follow
```

**Očekávaný výstup**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Dotazy v Application Insights

Přistupte k Application Insights v Azure Portal a spusťte tyto dotazy:

**Najít pomalé požadavky**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Sledování volání mezi službami**:
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

### Přístup k monitorovacímu panelu

```bash
# Získejte podrobnosti o Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Otevřete monitorování Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Živá metrika

1. Přejděte do Application Insights v Azure Portal
2. Klikněte na "Live Metrics"
3. Zobrazte si požadavky, chyby a výkon v reálném čase
4. Otestujte spuštěním: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktická cvičení

[Poznámka: Podívejte se na úplná cvičení výše v sekci "Praktická cvičení" pro podrobné kroky včetně ověření nasazení, úpravy dat, testů automatického škálování, zpracování chyb a přidání třetí služby.]

## Analýza nákladů

### Odhadované měsíční náklady (pro tento příklad se 2 službami)

| Zdroj | Konfigurace | Odhadované náklady |
|-------|-------------|--------------------|
| API Gateway | 2-20 replik, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replik, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Základní úroveň | $5 |
| Application Insights | 1-2 GB/měsíc | $5-10 |
| Log Analytics | 1 GB/měsíc | $3 |
| **Celkem** | | **$58-243/měsíc** |

**Rozdělení nákladů podle využití**:
- **Nízký provoz** (testování/učení): ~60 $/měsíc
- **Střední provoz** (malá produkce): ~120 $/měsíc
- **Vysoký provoz** (rušná období): ~240 $/měsíc

### Tipy pro optimalizaci nákladů

1. **Škálování na nulu pro vývoj**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Použití plánu spotřeby pro Cosmos DB** (když ji přidáte):
   - Platíte pouze za to, co používáte
   - Žádné minimální poplatky

3. **Nastavení vzorkování Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Vzorek 50 % požadavků
   ```

4. **Vyčištění, když není potřeba**:
   ```bash
   azd down
   ```

### Možnosti bezplatného tarifu
Pro učení/testování zvažte:
- Použijte bezplatné kredity Azure (prvních 30 dní)
- Udržujte minimální počet replik
- Po testování smažte (žádné průběžné poplatky)

---

## Úklid

Abyste se vyhnuli průběžným poplatkům, smažte všechny prostředky:

```bash
azd down --force --purge
```

**Potvrzovací výzva**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Zadejte `y` pro potvrzení.

**Co bude smazáno**:
- Prostředí Container Apps
- Obě Container Apps (gateway & produktová služba)
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

## Průvodce rozšířením: Od 2 k 5+ službám

Jakmile zvládnete tuto architekturu se dvěma službami, zde je návod, jak ji rozšířit:

### Fáze 1: Přidání perzistence databáze (další krok)

**Přidání Cosmos DB pro produktovou službu**:

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

2. Aktualizujte produktovou službu, aby používala Cosmos DB místo dat v paměti

3. Odhadované dodatečné náklady: ~25 USD/měsíc (serverless)

### Fáze 2: Přidání třetí služby (správa objednávek)

**Vytvoření služby objednávek**:

1. Nová složka: `src/order-service/` (Python/Node.js/C#)
2. Nový Bicep: `infra/app/order-service.bicep`
3. Aktualizujte API Gateway pro směrování `/api/orders`
4. Přidejte Azure SQL Database pro perzistenci objednávek

**Architektura se stává**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fáze 3: Přidání asynchronní komunikace (Service Bus)

**Implementace architektury založené na událostech**:

1. Přidejte Azure Service Bus: `infra/core/servicebus.bicep`
2. Produktová služba publikuje události "ProductCreated"
3. Služba objednávek se přihlašuje k událostem produktů
4. Přidejte službu notifikací pro zpracování událostí

**Vzorec**: Požadavek/Odpověď (HTTP) + Založeno na událostech (Service Bus)

### Fáze 4: Přidání autentizace uživatelů

**Implementace služby uživatelů**:

1. Vytvořte `src/user-service/` (Go/Node.js)
2. Přidejte Azure AD B2C nebo vlastní autentizaci pomocí JWT
3. API Gateway ověřuje tokeny
4. Služby kontrolují oprávnění uživatelů

### Fáze 5: Připravenost na produkci

**Přidejte tyto komponenty**:
- Azure Front Door (globální vyvažování zátěže)
- Azure Key Vault (správa tajných klíčů)
- Azure Monitor Workbooks (vlastní dashboardy)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity pro všechny služby

**Celkové náklady na produkční architekturu**: ~300-1 400 USD/měsíc

---

## Další informace

### Související dokumentace
- [Dokumentace Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Průvodce architekturou mikroslužeb](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights pro distribuované trasování](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Další kroky v tomto kurzu
- ← Předchozí: [Jednoduché Flask API](../../../../../examples/container-app/simple-flask-api) - Příklad jednoduché aplikace s jedním kontejnerem
- → Další: [Průvodce integrací AI](../../../../../examples/docs/ai-foundry) - Přidání AI funkcí
- 🏠 [Domovská stránka kurzu](../../README.md)

### Porovnání: Kdy použít co

**Jedna Container App** (Příklad jednoduchého Flask API):
- ✅ Jednoduché aplikace
- ✅ Monolitická architektura
- ✅ Rychlé nasazení
- ❌ Omezená škálovatelnost
- **Náklady**: ~15-50 USD/měsíc

**Mikroslužby** (Tento příklad):
- ✅ Komplexní aplikace
- ✅ Nezávislé škálování jednotlivých služeb
- ✅ Autonomie týmů (různé služby, různé týmy)
- ❌ Složitější správa
- **Náklady**: ~60-250 USD/měsíc

**Kubernetes (AKS)**:
- ✅ Maximální kontrola a flexibilita
- ✅ Přenositelnost mezi cloudy
- ✅ Pokročilé síťové funkce
- ❌ Vyžaduje znalosti Kubernetes
- **Náklady**: ~150-500 USD/měsíc minimálně

**Doporučení**: Začněte s Container Apps (tento příklad), přejděte na AKS pouze pokud potřebujete specifické funkce Kubernetes.

---

## Často kladené otázky

**Otázka: Proč pouze 2 služby místo 5+?**  
Odpověď: Vzdělávací postup. Zvládněte základy (komunikace mezi službami, monitoring, škálování) na jednoduchém příkladu, než přidáte složitost. Vzorce, které se zde naučíte, platí i pro architektury se 100 službami.

**Otázka: Mohu přidat další služby sám?**  
Odpověď: Rozhodně! Postupujte podle průvodce rozšířením výše. Každá nová služba následuje stejný vzorec: vytvořte složku src, vytvořte Bicep soubor, aktualizujte azure.yaml, nasazujte.

**Otázka: Je to připravené na produkci?**  
Odpověď: Je to solidní základ. Pro produkci přidejte: spravovanou identitu, Key Vault, perzistentní databáze, CI/CD pipeline, monitorovací upozornění a strategii zálohování.

**Otázka: Proč nepoužít Dapr nebo jiný service mesh?**  
Odpověď: Udržujte to jednoduché pro učení. Jakmile pochopíte nativní síťování Container Apps, můžete přidat Dapr pro pokročilé scénáře.

**Otázka: Jak ladit lokálně?**  
Odpověď: Spusťte služby lokálně pomocí Dockeru:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Otázka: Mohu použít různé programovací jazyky?**  
Odpověď: Ano! Tento příklad ukazuje Node.js (gateway) + Python (produktová služba). Můžete kombinovat jakékoliv jazyky, které běží v kontejnerech.

**Otázka: Co když nemám kredity Azure?**  
Odpověď: Použijte bezplatnou verzi Azure (prvních 30 dní s novými účty) nebo nasazujte na krátké testovací období a ihned poté smažte.

---

> **🎓 Shrnutí vzdělávací cesty**: Naučili jste se nasadit architekturu s více službami s automatickým škálováním, interním síťováním, centralizovaným monitoringem a vzory připravenými na produkci. Tento základ vás připraví na komplexní distribuované systémy a podnikové architektury mikroslužeb.

**📚 Navigace v kurzu:**
- ← Předchozí: [Jednoduché Flask API](../../../../../examples/container-app/simple-flask-api)
- → Další: [Příklad integrace databáze](../../../../../examples/database-app)
- 🏠 [Domovská stránka kurzu](../../README.md)
- 📖 [Nejlepší postupy pro Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->