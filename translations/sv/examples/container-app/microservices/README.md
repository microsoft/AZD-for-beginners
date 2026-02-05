# Mikrotjänstarkitektur - Exempel på Container App

⏱️ **Beräknad tid**: 25-35 minuter | 💰 **Beräknad kostnad**: ~$50-100/månad | ⭐ **Komplexitet**: Avancerad

En **förenklad men funktionell** mikrotjänstarkitektur som distribueras till Azure Container Apps med hjälp av AZD CLI. Detta exempel visar tjänst-till-tjänst-kommunikation, containerorkestrering och övervakning med en praktisk tvåtjänstuppsättning.

> **📚 Inlärningsmetod**: Detta exempel börjar med en minimal arkitektur med två tjänster (API Gateway + Backend-tjänst) som du faktiskt kan distribuera och lära dig av. Efter att ha bemästrat grunderna ger vi vägledning för att expandera till ett komplett mikrotjänstekosystem.

## Vad du kommer att lära dig

Genom att slutföra detta exempel kommer du att:
- Distribuera flera containrar till Azure Container Apps
- Implementera tjänst-till-tjänst-kommunikation med intern nätverksanslutning
- Konfigurera miljöbaserad skalning och hälsokontroller
- Övervaka distribuerade applikationer med Application Insights
- Förstå distributionsmönster och bästa praxis för mikrotjänster
- Lära dig progressiv expansion från enkla till komplexa arkitekturer

## Arkitektur

### Fas 1: Vad vi bygger (ingår i detta exempel)

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

**Varför börja enkelt?**
- ✅ Distribuera och förstå snabbt (25-35 minuter)
- ✅ Lär dig grundläggande mönster för mikrotjänster utan komplexitet
- ✅ Fungerande kod som du kan modifiera och experimentera med
- ✅ Lägre kostnad för inlärning (~$50-100/månad jämfört med $300-1400/månad)
- ✅ Bygg självförtroende innan du lägger till databaser och meddelandeköer

**Liknelse**: Tänk på detta som att lära sig köra bil. Du börjar på en tom parkeringsplats (2 tjänster), bemästrar grunderna och går sedan vidare till stadstrafik (5+ tjänster med databaser).

### Fas 2: Framtida expansion (referensarkitektur)

När du har bemästrat arkitekturen med två tjänster kan du expandera till:

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

Se avsnittet "Expansionsguide" i slutet för steg-för-steg-instruktioner.

## Inkluderade funktioner

✅ **Tjänstupptäckt**: Automatisk DNS-baserad upptäckt mellan containrar  
✅ **Lastbalansering**: Inbyggd lastbalansering över repliker  
✅ **Autoskalning**: Oberoende skalning per tjänst baserat på HTTP-förfrågningar  
✅ **Hälsomonitorering**: Liveness- och readiness-prober för båda tjänsterna  
✅ **Distribuerad loggning**: Centraliserad loggning med Application Insights  
✅ **Intern nätverksanslutning**: Säker tjänst-till-tjänst-kommunikation  
✅ **Containerorkestrering**: Automatisk distribution och skalning  
✅ **Uppdateringar utan driftstopp**: Rullande uppdateringar med versionshantering  

## Förutsättningar

### Nödvändiga verktyg

Innan du börjar, verifiera att du har dessa verktyg installerade:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 eller högre)
   ```bash
   azd version
   # Förväntad output: azd version 1.0.0 eller högre
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 eller högre)
   ```bash
   az --version
   # Förväntad output: azure-cli 2.50.0 eller högre
   ```

3. **[Docker](https://www.docker.com/get-started)** (för lokal utveckling/testning - valfritt)
   ```bash
   docker --version
   # Förväntad output: Docker version 20.10 eller högre
   ```

### Azure-krav

- Ett aktivt **Azure-abonnemang** ([skapa ett gratis konto](https://azure.microsoft.com/free/))
- Behörighet att skapa resurser i ditt abonnemang
- **Contributor**-roll på abonnemanget eller resursgruppen

### Kunskapsförutsättningar

Detta är ett exempel på **avancerad nivå**. Du bör ha:
- Slutfört [Simple Flask API-exemplet](../../../../../examples/container-app/simple-flask-api) 
- Grundläggande förståelse för mikrotjänstarkitektur
- Bekantskap med REST API:er och HTTP
- Förståelse för containerkoncept

**Ny på Container Apps?** Börja med [Simple Flask API-exemplet](../../../../../examples/container-app/simple-flask-api) först för att lära dig grunderna.

## Snabbstart (steg-för-steg)

### Steg 1: Klona och navigera

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kontrollera framgång**: Verifiera att du ser `azure.yaml`:
```bash
ls
# Förväntat: README.md, azure.yaml, infra/, src/
```

### Steg 2: Autentisera med Azure

```bash
azd auth login
```

Detta öppnar din webbläsare för Azure-autentisering. Logga in med dina Azure-uppgifter.

**✓ Kontrollera framgång**: Du bör se:
```
Logged in to Azure.
```

### Steg 3: Initiera miljön

```bash
azd init
```

**Frågor du kommer att få**:
- **Miljönamn**: Ange ett kort namn (t.ex. `microservices-dev`)
- **Azure-abonnemang**: Välj ditt abonnemang
- **Azure-plats**: Välj en region (t.ex. `eastus`, `westeurope`)

**✓ Kontrollera framgång**: Du bör se:
```
SUCCESS: New project initialized!
```

### Steg 4: Distribuera infrastruktur och tjänster

```bash
azd up
```

**Vad som händer** (tar 8-12 minuter):
1. Skapar Container Apps-miljö
2. Skapar Application Insights för övervakning
3. Bygger API Gateway-container (Node.js)
4. Bygger Product Service-container (Python)
5. Distribuerar båda containrarna till Azure
6. Konfigurerar nätverksanslutning och hälsokontroller
7. Ställer in övervakning och loggning

**✓ Kontrollera framgång**: Du bör se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tid**: 8-12 minuter

### Steg 5: Testa distributionen

```bash
# Hämta gateway-slutpunkt
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testa API Gateway hälsa
curl $GATEWAY_URL/health

# Förväntad utdata:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testa produkttjänsten via gateway**:
```bash
# Lista produkter
curl $GATEWAY_URL/api/products

# Förväntad utdata:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mus","price":29.99,"stock":200},
#   {"id":3,"name":"Tangentbord","price":79.99,"stock":150}
# ]
```

**✓ Kontrollera framgång**: Båda ändpunkterna returnerar JSON-data utan fel.

---

**🎉 Grattis!** Du har distribuerat en mikrotjänstarkitektur till Azure!

## Projektstruktur

Alla implementeringsfiler ingår—detta är ett komplett, fungerande exempel:

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

**Vad varje komponent gör:**

**Infrastruktur (infra/)**:
- `main.bicep`: Orkestrerar alla Azure-resurser och deras beroenden
- `core/container-apps-environment.bicep`: Skapar Container Apps-miljön och Azure Container Registry
- `core/monitor.bicep`: Ställer in Application Insights för distribuerad loggning
- `app/*.bicep`: Individuella containerappdefinitioner med skalning och hälsokontroller

**API Gateway (src/api-gateway/)**:
- Publik tjänst som dirigerar förfrågningar till backend-tjänster
- Implementerar loggning, felhantering och vidarebefordran av förfrågningar
- Demonstrerar tjänst-till-tjänst HTTP-kommunikation

**Product Service (src/product-service/)**:
- Intern tjänst med produktkatalog (i minnet för enkelhetens skull)
- REST API med hälsokontroller
- Exempel på backend-mikrotjänstmönster

## Tjänstöversikt

### API Gateway (Node.js/Express)

**Port**: 8080  
**Åtkomst**: Publik (extern ingress)  
**Syfte**: Dirigerar inkommande förfrågningar till lämpliga backend-tjänster  

**Ändpunkter**:
- `GET /` - Tjänsteinformation
- `GET /health` - Hälsokontrolländpunkt
- `GET /api/products` - Vidarebefordra till produkttjänst (lista alla)
- `GET /api/products/:id` - Vidarebefordra till produkttjänst (hämta efter ID)

**Nyckelfunktioner**:
- Förfrågningsdirigering med axios
- Centraliserad loggning
- Felhantering och timeout-hantering
- Tjänstupptäckt via miljövariabler
- Integration med Application Insights

**Kodexempel** (`src/api-gateway/app.js`):
```javascript
// Intern tjänstekommunikation
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Åtkomst**: Endast internt (ingen extern ingress)  
**Syfte**: Hanterar produktkatalog med data i minnet  

**Ändpunkter**:
- `GET /` - Tjänsteinformation
- `GET /health` - Hälsokontrolländpunkt
- `GET /products` - Lista alla produkter
- `GET /products/<id>` - Hämta produkt efter ID

**Nyckelfunktioner**:
- RESTful API med Flask
- Produktlagring i minnet (enkelt, ingen databas behövs)
- Hälsomonitorering med prober
- Strukturerad loggning
- Integration med Application Insights

**Datamodell**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Varför endast internt?**
Produkttjänsten exponeras inte publikt. Alla förfrågningar måste gå via API Gateway, vilket ger:
- Säkerhet: Kontrollerad åtkomstpunkt
- Flexibilitet: Backend kan ändras utan att påverka klienter
- Övervakning: Centraliserad loggning av förfrågningar

## Förstå tjänstkommunikation

### Hur tjänster kommunicerar med varandra

I detta exempel kommunicerar API Gateway med Product Service via **interna HTTP-anrop**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Gör intern HTTP-begäran
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Nyckelpunkter**:

1. **DNS-baserad upptäckt**: Container Apps tillhandahåller automatiskt DNS för interna tjänster
   - Produkttjänstens FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Förenklat som: `http://product-service` (Container Apps löser detta)

2. **Ingen publik exponering**: Produkttjänsten har `external: false` i Bicep
   - Endast åtkomlig inom Container Apps-miljön
   - Kan inte nås från internet

3. **Miljövariabler**: Tjänst-URL:er injiceras vid distribution
   - Bicep skickar den interna FQDN till gatewayen
   - Inga hårdkodade URL:er i applikationskoden

**Liknelse**: Tänk på detta som kontorsrum. API Gateway är receptionen (publik), och Product Service är ett kontorsrum (endast internt). Besökare måste gå via receptionen för att nå något kontor.

## Distributionsalternativ

### Full distribution (rekommenderas)

```bash
# Distribuera infrastruktur och båda tjänsterna
azd up
```

Detta distribuerar:
1. Container Apps-miljö
2. Application Insights
3. Container Registry
4. API Gateway-container
5. Product Service-container

**Tid**: 8-12 minuter

### Distribuera enskild tjänst

```bash
# Distribuera endast en tjänst (efter initial azd up)
azd deploy api-gateway

# Eller distribuera produkttjänst
azd deploy product-service
```

**Användningsfall**: När du har uppdaterat koden i en tjänst och vill distribuera endast den tjänsten.

### Uppdatera konfiguration

```bash
# Ändra skalningsparametrar
azd env set GATEWAY_MAX_REPLICAS 30

# Återimplementera med ny konfiguration
azd up
```

## Konfiguration

### Skalningskonfiguration

Båda tjänsterna är konfigurerade med HTTP-baserad autoskalning i sina Bicep-filer:

**API Gateway**:
- Minsta repliker: 2 (alltid minst 2 för tillgänglighet)
- Max repliker: 20
- Skalningsutlösare: 50 samtidiga förfrågningar per replik

**Product Service**:
- Minsta repliker: 1 (kan skalas till noll vid behov)
- Max repliker: 10
- Skalningsutlösare: 100 samtidiga förfrågningar per replik

**Anpassa skalning** (i `infra/app/*.bicep`):
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

### Resursallokering

**API Gateway**:
- CPU: 1.0 vCPU
- Minne: 2 GiB
- Anledning: Hanterar all extern trafik

**Product Service**:
- CPU: 0.5 vCPU
- Minne: 1 GiB
- Anledning: Lättviktiga operationer i minnet

### Hälsokontroller

Båda tjänsterna inkluderar liveness- och readiness-prober:

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

**Vad detta innebär**:
- **Liveness**: Om hälsokontrollen misslyckas startar Container Apps om containern
- **Readiness**: Om inte redo slutar Container Apps dirigera trafik till den repliken

## Övervakning och insyn

### Visa tjänstloggar

```bash
# Strömma loggar från API Gateway
azd logs api-gateway --follow

# Visa senaste produktserviceloggar
azd logs product-service --tail 100

# Visa alla loggar från båda tjänsterna
azd logs --follow
```

**Förväntad utdata**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights-frågor

Gå till Application Insights i Azure Portal och kör dessa frågor:

**Hitta långsamma förfrågningar**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Spåra tjänst-till-tjänst-anrop**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Felfrekvens per tjänst**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Förfrågningsvolym över tid**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Åtkomst till övervakningsdashboard

```bash
# Hämta detaljer om Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Öppna Azure Portal-övervakning
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Navigera till Application Insights i Azure Portal
2. Klicka på "Live Metrics"
3. Se realtidsförfrågningar, fel och prestanda
4. Testa genom att köra: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiska övningar

[Obs: Se fullständiga övningar ovan i avsnittet "Praktiska övningar" för detaljerade steg-för-steg-övningar inklusive verifiering av distribution, datamodifiering, autoskalningstester, felhantering och tillägg av en tredje tjänst.]

## Kostnadsanalys

### Beräknade månadskostnader (för detta exempel med två tjänster)

| Resurs | Konfiguration | Beräknad kostnad |
|----------|--------------|----------------|
| API Gateway | 2-20 repliker, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 repliker, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Grundläggande nivå | $5 |
| Application Insights | 1-2 GB/månad | $5-10 |
| Log Analytics | 1 GB/månad | $3 |
| **Totalt** | | **$58-243/månad** |

**Kostnadsuppdelning efter användning**:
- **Låg trafik** (testning/inlärning): ~$60/månad
- **Måttlig trafik** (liten produktion): ~$120/månad
- **Hög trafik** (intensiva perioder): ~$240/månad

### Tips för kostnadsoptimering

1. **Skala till noll för utveckling**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Använd konsumtionsplan för Cosmos DB** (när du lägger till det):
   - Betala endast för det du använder
   - Ingen minimikostnad

3. **Ställ in Application Insights-sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Prova 50% av förfrågningarna
   ```

4. **Rensa upp när det inte behövs**:
   ```bash
   azd down
   ```

### Alternativ för gratisnivå
För lärande/testning, överväg:
- Använd Azure gratis krediter (första 30 dagarna)
- Håll antalet repliker till ett minimum
- Ta bort efter testning (inga löpande kostnader)

---

## Rensning

För att undvika löpande kostnader, ta bort alla resurser:

```bash
azd down --force --purge
```

**Bekräftelseprompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Skriv `y` för att bekräfta.

**Vad som tas bort**:
- Container Apps Environment
- Båda Container Apps (gateway & produktservice)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verifiera rensning**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Borde returnera tomt.

---

## Expansionsguide: Från 2 till 5+ tjänster

När du har bemästrat denna 2-tjänsters arkitektur, här är hur du kan expandera:

### Fas 1: Lägg till databaspersistens (nästa steg)

**Lägg till Cosmos DB för produktservice**:

1. Skapa `infra/core/cosmos.bicep`:
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

2. Uppdatera produktservice för att använda Cosmos DB istället för in-memory data

3. Beräknad extra kostnad: ~25 USD/månad (serverless)

### Fas 2: Lägg till en tredje tjänst (Orderhantering)

**Skapa Order Service**:

1. Ny mapp: `src/order-service/` (Python/Node.js/C#)
2. Ny Bicep: `infra/app/order-service.bicep`
3. Uppdatera API Gateway för att dirigera `/api/orders`
4. Lägg till Azure SQL Database för orderpersistens

**Arkitekturen blir**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fas 3: Lägg till asynkron kommunikation (Service Bus)

**Implementera händelsedriven arkitektur**:

1. Lägg till Azure Service Bus: `infra/core/servicebus.bicep`
2. Produktservice publicerar "ProductCreated"-händelser
3. Orderservice prenumererar på produkthändelser
4. Lägg till Notification Service för att bearbeta händelser

**Mönster**: Begäran/Svar (HTTP) + Händelsedriven (Service Bus)

### Fas 4: Lägg till användarautentisering

**Implementera User Service**:

1. Skapa `src/user-service/` (Go/Node.js)
2. Lägg till Azure AD B2C eller anpassad JWT-autentisering
3. API Gateway validerar tokens
4. Tjänster kontrollerar användarbehörigheter

### Fas 5: Produktionsberedskap

**Lägg till dessa komponenter**:
- Azure Front Door (global lastbalansering)
- Azure Key Vault (hantering av hemligheter)
- Azure Monitor Workbooks (anpassade dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity för alla tjänster

**Full produktionsarkitektur kostnad**: ~300-1,400 USD/månad

---

## Läs mer

### Relaterad dokumentation
- [Azure Container Apps Dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [Guide för mikrotjänstarkitektur](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights för distribuerad spårning](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Nästa steg i denna kurs
- ← Föregående: [Enkel Flask API](../../../../../examples/container-app/simple-flask-api) - Nybörjarexempel med en container
- → Nästa: [AI Integrationsguide](../../../../../examples/docs/ai-foundry) - Lägg till AI-funktioner
- 🏠 [Kursens startsida](../../README.md)

### Jämförelse: När ska man använda vad

**Enkel Container App** (Exempel med enkel Flask API):
- ✅ Enkla applikationer
- ✅ Monolitisk arkitektur
- ✅ Snabb att distribuera
- ❌ Begränsad skalbarhet
- **Kostnad**: ~15-50 USD/månad

**Mikrotjänster** (Detta exempel):
- ✅ Komplexa applikationer
- ✅ Oberoende skalning per tjänst
- ✅ Teamautonomi (olika tjänster, olika team)
- ❌ Mer komplex att hantera
- **Kostnad**: ~60-250 USD/månad

**Kubernetes (AKS)**:
- ✅ Maximal kontroll och flexibilitet
- ✅ Multi-cloud portabilitet
- ✅ Avancerad nätverkshantering
- ❌ Kräver Kubernetes-expertis
- **Kostnad**: ~150-500 USD/månad minimum

**Rekommendation**: Börja med Container Apps (detta exempel), gå över till AKS endast om du behöver Kubernetes-specifika funktioner.

---

## Vanliga frågor

**F: Varför bara 2 tjänster istället för 5+?**  
S: Pedagogisk progression. Bemästra grunderna (tjänstkommunikation, övervakning, skalning) med ett enkelt exempel innan du lägger till komplexitet. Mönstren du lär dig här gäller för arkitekturer med 100 tjänster.

**F: Kan jag lägga till fler tjänster själv?**  
S: Absolut! Följ expansionsguiden ovan. Varje ny tjänst följer samma mönster: skapa src-mapp, skapa Bicep-fil, uppdatera azure.yaml, distribuera.

**F: Är detta produktionsklart?**  
S: Det är en solid grund. För produktion, lägg till: managed identity, Key Vault, persistenta databaser, CI/CD-pipeline, övervakningsvarningar och backupstrategi.

**F: Varför inte använda Dapr eller andra service mesh?**  
S: Håll det enkelt för lärande. När du förstår nätverkshantering i Container Apps kan du lägga till Dapr för avancerade scenarier.

**F: Hur felsöker jag lokalt?**  
S: Kör tjänster lokalt med Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**F: Kan jag använda olika programmeringsspråk?**  
S: Ja! Detta exempel visar Node.js (gateway) + Python (produktservice). Du kan blanda vilka språk som helst som körs i containers.

**F: Vad händer om jag inte har Azure-krediter?**  
S: Använd Azure gratisnivå (första 30 dagarna med nya konton) eller distribuera för korta testperioder och ta bort direkt.

---

> **🎓 Sammanfattning av lärandebanan**: Du har lärt dig att distribuera en arkitektur med flera tjänster med automatisk skalning, intern nätverkshantering, centraliserad övervakning och produktionsklara mönster. Denna grund förbereder dig för komplexa distribuerade system och företagsmikrotjänstarkitekturer.

**📚 Kursnavigering:**
- ← Föregående: [Enkel Flask API](../../../../../examples/container-app/simple-flask-api)
- → Nästa: [Exempel på databasintegration](../../../../../examples/database-app)
- 🏠 [Kursens startsida](../../README.md)
- 📖 [Container Apps Bästa Praxis](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->