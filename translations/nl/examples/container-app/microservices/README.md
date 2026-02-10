# Microservices-architectuur - Container App-voorbeeld

⏱️ **Geschatte tijd**: 25-35 minuten | 💰 **Geschatte kosten**: ~$50-100/maand | ⭐ **Complexiteit**: Geavanceerd

Een **vereenvoudigde maar functionele** microservices-architectuur die wordt uitgerold naar Azure Container Apps met behulp van AZD CLI. Dit voorbeeld laat service-naar-service communicatie, containerorchestratie en monitoring zien met een praktische opzet van 2 services.

> **📚 Leerbenadering**: Dit voorbeeld begint met een minimale architectuur van 2 services (API Gateway + Backend Service) die je daadwerkelijk kunt uitrollen en van kunt leren. Nadat je deze basis beheerst, bieden we begeleiding om uit te breiden naar een volledig microservices-ecosysteem.

## Wat je leert

Door dit voorbeeld te voltooien, zul je:
- Meerdere containers naar Azure Container Apps uitrollen
- Service-naar-service communicatie implementeren met intern netwerk
- Schaalinstellingen en health checks configureren op basis van de omgeving
- Gedistribueerde applicaties monitoren met Application Insights
- Deployment-patronen en best practices voor microservices begrijpen
- Leren hoe je stapsgewijs uitbreidt van eenvoudige naar complexere architecturen

## Architectuur

### Fase 1: Wat we bouwen (opgenomen in dit voorbeeld)

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

**Waarom eenvoudig beginnen?**
- ✅ Snel uitrollen en begrijpen (25-35 minuten)
- ✅ Leer kernpatronen van microservices zonder complexiteit
- ✅ Werkende code die je kunt aanpassen en mee experimenteren
- ✅ Lagere kosten om te leren (~$50-100/maand vs $300-1400/maand)
- ✅ Bouw vertrouwen op voordat je databases en message queues toevoegt

**Analogie**: Zie het als leren autorijden. Je begint op een lege parkeerplaats (2 services), beheerst de basis en gaat vervolgens naar het stadsverkeer (5+ services met databases).

### Fase 2: Toekomstige uitbreiding (referentiearchitectuur)

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

Zie de sectie "Uitbreidingsgids" aan het einde voor stapsgewijze instructies.

## Inbegrepen functies

✅ **Service discovery**: Automatische DNS-gebaseerde ontdekking tussen containers  
✅ **Load balancing**: Ingebouwde load balancing over replicas  
✅ **Auto-scaling**: Onafhankelijke schaalvergroting per service op basis van HTTP-verzoeken  
✅ **Health monitoring**: Liveness- en readiness-probes voor beide services  
✅ **Distributed logging**: Gecentraliseerde logging met Application Insights  
✅ **Internal networking**: Beveiligde service-naar-service communicatie  
✅ **Containerorchestratie**: Automatische uitrol en schaling  
✅ **Updates zonder downtime**: Rolling updates met revisiebeheer  

## Vereisten

### Benodigde tools

Controleer voordat je begint of je deze tools geïnstalleerd hebt:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versie 1.0.0 of hoger)
   ```bash
   azd version
   # Verwachte uitvoer: azd versie 1.0.0 of hoger
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versie 2.50.0 of hoger)
   ```bash
   az --version
   # Verwachte uitvoer: azure-cli 2.50.0 of hoger
   ```

3. **[Docker](https://www.docker.com/get-started)** (voor lokale ontwikkeling/testen - optioneel)
   ```bash
   docker --version
   # Verwachte uitvoer: Docker-versie 20.10 of hoger
   ```

### Azure-vereisten

- Een actief **Azure-abonnement** ([maak een gratis account](https://azure.microsoft.com/free/))
- Machtigingen om resources in je abonnement te maken
- De rol **Contributor** op het abonnement of de resource group

### Vereiste kennis

Dit is een **gevorderd** voorbeeld. Je zou het volgende moeten beheersen:
- Het voltooien van het [Eenvoudig Flask API-voorbeeld](../../../../../examples/container-app/simple-flask-api) 
- Basisbegrip van microservices-architectuur
- Bekendheid met REST-API's en HTTP
- Begrip van containerconcepten

**Nieuw met Container Apps?** Begin eerst met het [Eenvoudig Flask API-voorbeeld](../../../../../examples/container-app/simple-flask-api) om de basis te leren.

## Snelle start (Stap-voor-stap)

### Stap 1: Klonen en navigeren

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Succescontrole**: Controleer of je `azure.yaml` ziet:
```bash
ls
# Verwacht: README.md, azure.yaml, infra/, src/
```

### Stap 2: Authentiseren bij Azure

```bash
azd auth login
```

Dit opent je browser voor Azure-authenticatie. Meld je aan met je Azure-referenties.

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
Logged in to Azure.
```

### Stap 3: Initialiseer de omgeving

```bash
azd init
```

**Vragen die je ziet**:
- **Environment name**: Enter a short name (e.g., `microservices-dev`)
- **Azure subscription**: Selecteer je abonnement
- **Azure location**: Kies een regio (bijv. `eastus`, `westeurope`)

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
SUCCESS: New project initialized!
```

### Stap 4: Infrastructuur en services uitrollen

```bash
azd up
```

**Wat er gebeurt** (duurt 8-12 minuten):
1. Maakt Container Apps-omgeving aan
2. Maakt Application Insights aan voor monitoring
3. Bouwt API Gateway-container (Node.js)
4. Bouwt Product Service-container (Python)
5. Rol beide containers naar Azure uit
6. Configureert netwerken en health checks
7. Stelt monitoring en logging in

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tijd**: 8-12 minuten

### Stap 5: Test de uitrol

```bash
# Haal het gateway-eindpunt op
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Test de gezondheid van de API-gateway
curl $GATEWAY_URL/health

# Verwachte uitvoer:
# {"status":"gezond","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test de productservice via de gateway**:
```bash
# Producten weergeven
curl $GATEWAY_URL/api/products

# Verwachte uitvoer:
# [
#   {"id":1,"naam":"Laptop","prijs":999.99,"voorraad":50},
#   {"id":2,"naam":"Muis","prijs":29.99,"voorraad":200},
#   {"id":3,"naam":"Toetsenbord","prijs":79.99,"voorraad":150}
# ]
```

**✓ Succescontrole**: Beide endpoints geven JSON-data terug zonder fouten.

---

**🎉 Gefeliciteerd!** Je hebt een microservices-architectuur naar Azure uitgerold!

## Projectstructuur

Alle implementatiebestanden zijn inbegrepen—dit is een compleet, werkend voorbeeld:

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

**Wat elk component doet:**

**Infrastructuur (infra/)**:
- `main.bicep`: Orkestreert alle Azure-resources en hun afhankelijkheden
- `core/container-apps-environment.bicep`: Maakt de Container Apps-omgeving en Azure Container Registry aan
- `core/monitor.bicep`: Stelt Application Insights in voor gedistribueerde logging
- `app/*.bicep`: Individuele container appdefinities met schaling en health checks

**API Gateway (src/api-gateway/)**:
- Publiek toegankelijke service die verzoeken naar backendservices doorstuurt
- Implementeert logging, foutafhandeling en doorsturen van verzoeken
- Toont service-naar-service HTTP-communicatie

**Product Service (src/product-service/)**:
- Interne service met productcatalogus (in-memory voor eenvoud)
- REST-API met health checks
- Voorbeeld van een backend microservicepatroon

## Overzicht van services

### API Gateway (Node.js/Express)

**Poort**: 8080  
**Toegang**: Publiek (externe ingress)  
**Doel**: Stuurt binnenkomende verzoeken naar de juiste backendservices  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /api/products` - Forward to product service (list all)
- `GET /api/products/:id` - Forward to product service (get by ID)

**Belangrijkste kenmerken**:
- Verzoekroutering met axios
- Gecentraliseerde logging
- Foutafhandeling en time-outbeheer
- Service-discovery via omgevingsvariabelen
- Integratie met Application Insights

**Codevoorbeeld** (`src/api-gateway/app.js`):
```javascript
// Interne servicecommunicatie
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Poort**: 8000  
**Toegang**: Alleen intern (geen externe ingress)  
**Doel**: Beheert productcatalogus met in-memory data  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /products` - List all products
- `GET /products/<id>` - Get product by ID

**Belangrijkste kenmerken**:
- RESTful API met Flask
- In-memory productopslag (eenvoudig, geen database nodig)
- Health-monitoring met probes
- Gestructureerde logging
- Integratie met Application Insights

**Datamodel**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Waarom alleen intern?**
De productservice is niet publiekelijk toegankelijk. Alle verzoeken moeten via de API Gateway lopen, die biedt:
- Beveiliging: Gecontroleerd toegangspunt
- Flexibiliteit: Kan de backend wijzigen zonder clients te beïnvloeden
- Monitoring: Gecentraliseerde verzoeklogging

## Begrijpen van servicecommunicatie

### Hoe services met elkaar communiceren

In dit voorbeeld communiceert de API Gateway met de Product Service via **interne HTTP-aanroepen**:

```javascript
// API-gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Maak interne HTTP-aanvraag
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Belangrijke punten**:

1. **DNS-gebaseerde ontdekking**: Container Apps verzorgt automatisch DNS voor interne services
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplified as: `http://product-service` (Container Apps resolves it)

2. **Geen publieke blootstelling**: Product Service heeft `external: false` in Bicep
   - Alleen toegankelijk binnen de Container Apps-omgeving
   - Niet bereikbaar vanaf het internet

3. **Omgevingsvariabelen**: Service-URL's worden tijdens deployment geïnjecteerd
   - Bicep geeft de interne FQDN door aan de gateway
   - Geen hardgecodeerde URL's in de applicatiecode

**Analogie**: Zie het als kantoorruimtes. De API Gateway is de receptiebalie (publiekelijk), en de Product Service is een kantoorruimte (alleen intern). Bezoekers moeten via de receptie om bij een kantoor te komen.

## Implementatie-opties

### Volledige implementatie (aanbevolen)

```bash
# Implementeer de infrastructuur en beide services
azd up
```

Dit wordt uitgerold:
1. Container Apps-omgeving
2. Application Insights
3. Container Registry
4. API Gateway-container
5. Product Service-container

**Tijd**: 8-12 minuten

### Een enkele service uitrollen

```bash
# Implementeer slechts één service (na de initiële azd up)
azd deploy api-gateway

# Of implementeer de productservice
azd deploy product-service
```

**Gebruikssituatie**: Als je code in één service hebt bijgewerkt en alleen die service opnieuw wilt uitrollen.

### Configuratie bijwerken

```bash
# Wijzig schaalparameters
azd env set GATEWAY_MAX_REPLICAS 30

# Heruitrollen met nieuwe configuratie
azd up
```

## Configuratie

### Schaalconfiguratie

Beide services zijn geconfigureerd met HTTP-gebaseerde autoscaling in hun Bicep-bestanden:

**API Gateway**:
- Min replicas: 2 (altijd minstens 2 voor beschikbaarheid)
- Max replicas: 20
- Scale trigger: 50 gelijktijdige verzoeken per replica

**Product Service**:
- Min replicas: 1 (kan indien nodig naar nul schalen)
- Max replicas: 10
- Scale trigger: 100 gelijktijdige verzoeken per replica

**Schaalconfiguratie aanpassen** (in `infra/app/*.bicep`):
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

### Resourcetoewijzing

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- Reden: Handelt al het externe verkeer af

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Reden: Lichtgewicht in-memory bewerkingen

### Healthchecks

Beide services bevatten liveness- en readiness-probes:

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

**Wat dit betekent**:
- **Liveness**: Als de healthcheck faalt, herstart Container Apps de container
- **Readiness**: Als niet klaar, stopt Container Apps met het routeren van verkeer naar die replica



## Monitoring & Observeerbaarheid

### Service-logboeken bekijken

```bash
# Bekijk logs met azd monitor
azd monitor --logs

# Of gebruik de Azure CLI voor specifieke Container Apps:
# Stream logs van API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Bekijk recente logs van de productservice
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Verwachte uitvoer**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights-queries

Open Application Insights in de Azure Portal en voer dan deze query's uit:

**Langzame verzoeken vinden**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Service-naar-service oproepen volgen**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Foutpercentage per service**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Verzoekvolume in de tijd**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Toegang tot monitoringdashboard

```bash
# Application Insights-details ophalen
azd env get-values | grep APPLICATIONINSIGHTS

# Open monitoring in het Azure-portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live-metrics

1. Navigeer naar Application Insights in de Azure Portal
2. Klik "Live Metrics"
3. Zie real-time verzoeken, fouten en prestaties
4. Test door het uitvoeren van: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktische oefeningen

[Opmerking: Zie de volledige oefeningen hierboven in de sectie "Praktische oefeningen" voor gedetailleerde stap-voor-stap oefeningen inclusief verificatie van de uitrol, gegevenswijziging, autoscaling-tests, foutafhandeling en het toevoegen van een derde service.]

## Kostenanalyse

### Geschatte maandelijkse kosten (voor dit voorbeeld met 2 services)

| Resource | Configuratie | Geschatte kosten |
|----------|--------------|------------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/maand | $5-10 |
| Log Analytics | 1 GB/maand | $3 |
| **Totaal** | | **$58-243/maand** |

Kostenverdeling op basis van gebruik:
- **Licht verkeer** (testen/leren): ~$60/maand
- **Gemiddeld verkeer** (kleine productie): ~$120/maand
- **Veel verkeer** (drukke perioden): ~$240/maand

### Tips voor kostenoptimalisatie

1. **Schaal naar nul voor ontwikkeling**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gebruik het Consumption-plan voor Cosmos DB** (wanneer je het toevoegt):
   - Betaal alleen voor wat je gebruikt
   - Geen minimale kosten

3. **Stel sampling in voor Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Neem een steekproef van 50% van de verzoeken
   ```

4. **Opruimen wanneer niet nodig**:
   ```bash
   azd down
   ```

### Gratis tier-opties
Voor leren/testen, overweeg:
- Gebruik Azure gratis tegoeden (eerste 30 dagen)
- Beperk het aantal replica's tot het minimum
- Verwijder na testen (geen doorlopende kosten)

---

## Cleanup

Om lopende kosten te voorkomen, verwijder alle resources:

```bash
azd down --force --purge
```

**Bevestigingsprompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Typ `y` om te bevestigen.

**Wat wordt verwijderd**:
- Container Apps Environment
- Beide Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Controleer opruiming**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Zou leeg moeten zijn.

---

## Uitbreidingsgids: Van 2 naar 5+ services

Zodra je deze 2-service architectuur onder de knie hebt, volgt hier hoe je kunt uitbreiden:

### Fase 1: Databasepersistentie toevoegen (Volgende stap)

**Voeg Cosmos DB toe voor Product Service**:

1. Maak `infra/core/cosmos.bicep`:
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

2. Werk de productservice bij om Cosmos DB te gebruiken in plaats van in-memory data

3. Geschatte extra kosten: ~$25/maand (serverless)

### Fase 2: Derde service toevoegen (Orderbeheer)

**Maak Order Service**:

1. Nieuwe map: `src/order-service/` (Python/Node.js/C#)
2. Nieuwe Bicep: `infra/app/order-service.bicep`
3. Werk API Gateway bij om `/api/orders` te routeren
4. Voeg Azure SQL Database toe voor orderpersistentie

**Architectuur wordt**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Asynchrone communicatie toevoegen (Service Bus)

**Implementeer gebeurtenisgestuurde architectuur**:

1. Voeg Azure Service Bus toe: `infra/core/servicebus.bicep`
2. Product Service publiceert "ProductCreated" events
3. Order Service abonneert zich op productevents
4. Voeg Notification Service toe om events te verwerken

**Patroon**: Request/Response (HTTP) + Event-driven (Service Bus)

### Fase 4: Gebruikersauthenticatie toevoegen

**Implementeer Gebruikersservice**:

1. Maak `src/user-service/` (Go/Node.js)
2. Voeg Azure AD B2C of aangepaste JWT-authenticatie toe
3. API Gateway valideert tokens
4. Services controleren gebruikersrechten

### Fase 5: Productieklaar maken

**Voeg deze componenten toe**:
- Azure Front Door (globale load balancing)
- Azure Key Vault (geheimbeheer)
- Azure Monitor Workbooks (aangepaste dashboards)
- CI/CD-pijplijn (GitHub Actions)
- Blue-Green-implementaties
- Managed Identity voor alle services

**Volledige productiekosten**: ~$300-1,400/maand

---

## Meer informatie

### Gerelateerde documentatie
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Volgende stappen in deze cursus
- ← Vorige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Beginner single-container voorbeeld
- → Volgende: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI-mogelijkheden toevoegen
- 🏠 [Course Home](../../README.md)

### Vergelijking: Wanneer wat te gebruiken

**Single Container App** (Eenvoudig Flask API-voorbeeld):
- ✅ Eenvoudige applicaties
- ✅ Monolithische architectuur
- ✅ Snelle deployment
- ❌ Beperkte schaalbaarheid
- **Kosten**: ~$15-50/maand

**Microservices** (Dit voorbeeld):
- ✅ Complexe applicaties
- ✅ Onafhankelijke schaalbaarheid per service
- ✅ Teamautonomie (verschillende services, verschillende teams)
- ❌ Moeilijker te beheren
- **Kosten**: ~$60-250/maand

**Kubernetes (AKS)**:
- ✅ Maximale controle en flexibiliteit
- ✅ Multi-cloud draagbaarheid
- ✅ Geavanceerde netwerkfunctionaliteit
- ❌ Vereist Kubernetes-expertise
- **Kosten**: ~$150-500/maand minimaal

**Aanbeveling**: Begin met Container Apps (dit voorbeeld), ga pas naar AKS als je Kubernetes-specifieke functies nodig hebt.

---

## Veelgestelde vragen

**Q: Waarom slechts 2 services in plaats van 5+?**  
A: Educatieve opbouw. Beheers de basisprincipes (servicecommunicatie, monitoring, schaaling) met een eenvoudig voorbeeld vóórdat je complexiteit toevoegt. De patronen die je hier leert, zijn toepasbaar op 100-service architecturen.

**Q: Kan ik zelf meer services toevoegen?**  
A: Absoluut! Volg de uitbreidingsgids hierboven. Elke nieuwe service volgt hetzelfde patroon: maak een src-map, maak een Bicep-bestand, werk azure.yaml bij, deploy.

**Q: Is dit productieklaar?**  
A: Het is een solide basis. Voor productie voeg je toe: managed identity, Key Vault, persistente databases, CI/CD-pijplijn, monitoringalerts en backup-strategie.

**Q: Waarom geen Dapr of andere service mesh gebruiken?**  
A: Houd het simpel voor het leerproces. Zodra je native Container Apps-netwerken begrijpt, kun je Dapr toevoegen voor geavanceerde scenario's.

**Q: Hoe debug ik lokaal?**  
A: Draai services lokaal met Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Kan ik verschillende programmeertalen gebruiken?**  
A: Ja! Dit voorbeeld toont Node.js (gateway) + Python (productservice). Je kunt elke taal mixen die in containers draait.

**Q: Wat als ik geen Azure-tegoeden heb?**  
A: Gebruik de Azure free tier (eerste 30 dagen voor nieuwe accounts) of deploy voor korte testperiodes en verwijder direct daarna.

---

> **🎓 Samenvatting leerroute**: Je hebt geleerd een multi-service architectuur te deployen met automatische schaaling, interne netwerken, gecentraliseerde monitoring en productieklaarpatronen. Deze basis bereidt je voor op complexe gedistribueerde systemen en enterprise microservices-architecturen.

**📚 Cursusnavigatie:**
- ← Vorige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Volgende: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst Co-op Translator (https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal dient als de gezaghebbende bron te worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->