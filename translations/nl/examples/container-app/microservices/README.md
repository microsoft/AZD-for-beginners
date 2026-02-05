# Microservices Architectuur - Container App Voorbeeld

⏱️ **Geschatte Tijd**: 25-35 minuten | 💰 **Geschatte Kosten**: ~$50-100/maand | ⭐ **Complexiteit**: Gevorderd

Een **vereenvoudigde maar functionele** microservices architectuur geïmplementeerd op Azure Container Apps met behulp van AZD CLI. Dit voorbeeld demonstreert communicatie tussen services, container orkestratie en monitoring met een praktische setup van 2 services.

> **📚 Leerbenadering**: Dit voorbeeld begint met een minimale architectuur van 2 services (API Gateway + Backend Service) die je daadwerkelijk kunt implementeren en van kunt leren. Nadat je deze basis beheerst, bieden we richtlijnen voor uitbreiding naar een volledige microservices-ecosysteem.

## Wat Je Leert

Door dit voorbeeld te voltooien, leer je:
- Meerdere containers implementeren op Azure Container Apps
- Service-naar-service communicatie implementeren met intern netwerk
- Omgevingsgebaseerde schaalvergroting en gezondheidscontroles configureren
- Gedistribueerde applicaties monitoren met Application Insights
- Microservices implementatiepatronen en best practices begrijpen
- Progressieve uitbreiding van eenvoudige naar complexe architecturen

## Architectuur

### Fase 1: Wat We Bouwen (Inbegrepen in Dit Voorbeeld)

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

**Waarom Simpel Beginnen?**
- ✅ Snel implementeren en begrijpen (25-35 minuten)
- ✅ Leer de kernpatronen van microservices zonder complexiteit
- ✅ Werkende code die je kunt aanpassen en mee experimenteren
- ✅ Lagere kosten voor leren (~$50-100/maand vs $300-1400/maand)
- ✅ Vertrouwen opbouwen voordat je databases en message queues toevoegt

**Analogie**: Zie het als leren autorijden. Je begint op een lege parkeerplaats (2 services), beheerst de basis, en gaat dan verder naar stadsverkeer (5+ services met databases).

### Fase 2: Toekomstige Uitbreiding (Referentie Architectuur)

Zodra je de architectuur met 2 services beheerst, kun je uitbreiden naar:

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

## Inbegrepen Functionaliteiten

✅ **Service Discovery**: Automatische DNS-gebaseerde ontdekking tussen containers  
✅ **Load Balancing**: Ingebouwde load balancing over replica's  
✅ **Auto-scaling**: Onafhankelijke schaalvergroting per service op basis van HTTP-verzoeken  
✅ **Gezondheidsmonitoring**: Liveness- en readiness-probes voor beide services  
✅ **Gedistribueerde Logging**: Gecentraliseerde logging met Application Insights  
✅ **Intern Netwerk**: Veilige service-naar-service communicatie  
✅ **Container Orkestratie**: Automatische implementatie en schaalvergroting  
✅ **Zero-Downtime Updates**: Rolling updates met revisiebeheer  

## Vereisten

### Benodigde Tools

Controleer voordat je begint of je deze tools hebt geïnstalleerd:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versie 1.0.0 of hoger)  
   ```bash
   azd version
   # Verwachte output: azd versie 1.0.0 of hoger
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versie 2.50.0 of hoger)  
   ```bash
   az --version
   # Verwachte output: azure-cli 2.50.0 of hoger
   ```

3. **[Docker](https://www.docker.com/get-started)** (voor lokale ontwikkeling/testen - optioneel)  
   ```bash
   docker --version
   # Verwachte output: Docker versie 20.10 of hoger
   ```

### Azure Vereisten

- Een actieve **Azure-abonnement** ([maak een gratis account aan](https://azure.microsoft.com/free/))
- Machtigingen om resources te maken in je abonnement
- **Contributor** rol op het abonnement of resourcegroep

### Kennisvereisten

Dit is een **gevorderd niveau** voorbeeld. Je zou moeten:
- Het [Simple Flask API voorbeeld](../../../../../examples/container-app/simple-flask-api) hebben voltooid
- Basisbegrip hebben van microservices architectuur
- Bekend zijn met REST API's en HTTP
- Begrip hebben van containerconcepten

**Nieuw met Container Apps?** Begin eerst met het [Simple Flask API voorbeeld](../../../../../examples/container-app/simple-flask-api) om de basis te leren.

## Snel Starten (Stapsgewijs)

### Stap 1: Clone en Navigeer

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Succescontrole**: Controleer of je `azure.yaml` ziet:  
```bash
ls
# Verwacht: README.md, azure.yaml, infra/, src/
```

### Stap 2: Authenticeer met Azure

```bash
azd auth login
```

Dit opent je browser voor Azure-authenticatie. Log in met je Azure-gegevens.

**✓ Succescontrole**: Je zou moeten zien:  
```
Logged in to Azure.
```

### Stap 3: Initialiseer de Omgeving

```bash
azd init
```

**Prompts die je ziet**:
- **Omgevingsnaam**: Voer een korte naam in (bijv. `microservices-dev`)
- **Azure-abonnement**: Selecteer je abonnement
- **Azure-locatie**: Kies een regio (bijv. `eastus`, `westeurope`)

**✓ Succescontrole**: Je zou moeten zien:  
```
SUCCESS: New project initialized!
```

### Stap 4: Implementeer Infrastructuur en Services

```bash
azd up
```

**Wat er gebeurt** (duurt 8-12 minuten):
1. Creëert Container Apps omgeving
2. Creëert Application Insights voor monitoring
3. Bouwt API Gateway container (Node.js)
4. Bouwt Product Service container (Python)
5. Implementeert beide containers op Azure
6. Configureert netwerk en gezondheidscontroles
7. Stelt monitoring en logging in

**✓ Succescontrole**: Je zou moeten zien:  
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tijd**: 8-12 minuten

### Stap 5: Test de Implementatie

```bash
# Haal het gateway-eindpunt op
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Test de gezondheid van de API Gateway
curl $GATEWAY_URL/health

# Verwachte output:
# {"status":"gezond","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test productservice via gateway**:  
```bash
# Lijst producten
curl $GATEWAY_URL/api/products

# Verwachte output:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Muis","price":29.99,"stock":200},
#   {"id":3,"name":"Toetsenbord","price":79.99,"stock":150}
# ]
```

**✓ Succescontrole**: Beide endpoints retourneren JSON-data zonder fouten.

---

**🎉 Gefeliciteerd!** Je hebt een microservices architectuur geïmplementeerd op Azure!

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

**Wat Elk Component Doet:**

**Infrastructuur (infra/)**:
- `main.bicep`: Orkestreert alle Azure-resources en hun afhankelijkheden
- `core/container-apps-environment.bicep`: Creëert de Container Apps omgeving en Azure Container Registry
- `core/monitor.bicep`: Stelt Application Insights in voor gedistribueerde logging
- `app/*.bicep`: Individuele container app-definities met schaalvergroting en gezondheidscontroles

**API Gateway (src/api-gateway/)**:
- Publiek toegankelijke service die verzoeken doorstuurt naar backend services
- Implementeert logging, foutafhandeling en verzoekdoorsturing
- Demonstreert service-naar-service HTTP-communicatie

**Product Service (src/product-service/)**:
- Interne service met productcatalogus (in-memory voor eenvoud)
- REST API met gezondheidscontroles
- Voorbeeld van backend microservice patroon

## Services Overzicht

### API Gateway (Node.js/Express)

**Poort**: 8080  
**Toegang**: Publiek (externe ingress)  
**Doel**: Stuurt inkomende verzoeken door naar de juiste backend services  

**Endpoints**:
- `GET /` - Service-informatie
- `GET /health` - Endpoint voor gezondheidscontrole
- `GET /api/products` - Doorsturen naar productservice (lijst alles)
- `GET /api/products/:id` - Doorsturen naar productservice (op ID ophalen)

**Belangrijke Functionaliteiten**:
- Verzoekdoorsturing met axios
- Gecentraliseerde logging
- Foutafhandeling en time-outbeheer
- Service discovery via omgevingsvariabelen
- Integratie met Application Insights

**Code Highlight** (`src/api-gateway/app.js`):  
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
- `GET /` - Service-informatie
- `GET /health` - Endpoint voor gezondheidscontrole
- `GET /products` - Lijst alle producten
- `GET /products/<id>` - Haal product op ID op

**Belangrijke Functionaliteiten**:
- RESTful API met Flask
- In-memory productopslag (eenvoudig, geen database nodig)
- Gezondheidsmonitoring met probes
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

**Waarom Alleen Intern?**
De productservice is niet publiekelijk toegankelijk. Alle verzoeken moeten via de API Gateway gaan, wat biedt:
- Veiligheid: Gecontroleerd toegangspunt
- Flexibiliteit: Kan backend wijzigen zonder impact op clients
- Monitoring: Gecentraliseerde verzoeklogging

## Begrip van Service Communicatie

### Hoe Services Met Elkaar Praten

In dit voorbeeld communiceert de API Gateway met de Product Service via **interne HTTP-verzoeken**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Maak interne HTTP-verzoek
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Belangrijke Punten**:

1. **DNS-gebaseerde Ontdekking**: Container Apps biedt automatisch DNS voor interne services
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Vereenvoudigd als: `http://product-service` (Container Apps lost dit op)

2. **Geen Publieke Blootstelling**: Product Service heeft `external: false` in Bicep
   - Alleen toegankelijk binnen de Container Apps omgeving
   - Niet bereikbaar vanaf het internet

3. **Omgevingsvariabelen**: Service-URL's worden geïnjecteerd tijdens implementatie
   - Bicep geeft de interne FQDN door aan de gateway
   - Geen hardcoded URL's in applicatiecode

**Analogie**: Zie dit als kantoorruimtes. De API Gateway is de receptie (publiek toegankelijk), en de Product Service is een kantoorruimte (alleen intern). Bezoekers moeten via de receptie gaan om een kantoor te bereiken.

## Implementatieopties

### Volledige Implementatie (Aanbevolen)

```bash
# Implementeer infrastructuur en beide services
azd up
```

Dit implementeert:
1. Container Apps omgeving
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Tijd**: 8-12 minuten

### Implementeer Individuele Service

```bash
# Implementeer slechts één service (na de eerste azd up)
azd deploy api-gateway

# Of implementeer productservice
azd deploy product-service
```

**Gebruikssituatie**: Wanneer je code in één service hebt bijgewerkt en alleen die service opnieuw wilt implementeren.

### Update Configuratie

```bash
# Wijzig schaalparameters
azd env set GATEWAY_MAX_REPLICAS 30

# Herdeploy met nieuwe configuratie
azd up
```

## Configuratie

### Schaalconfiguratie

Beide services zijn geconfigureerd met HTTP-gebaseerde autoscaling in hun Bicep-bestanden:

**API Gateway**:
- Min replica's: 2 (altijd minimaal 2 voor beschikbaarheid)
- Max replica's: 20
- Schaaltrigger: 50 gelijktijdige verzoeken per replica

**Product Service**:
- Min replica's: 1 (kan naar nul schalen indien nodig)
- Max replica's: 10
- Schaaltrigger: 100 gelijktijdige verzoeken per replica

**Schaal aanpassen** (in `infra/app/*.bicep`):  
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

### Resource Allocatie

**API Gateway**:
- CPU: 1.0 vCPU
- Geheugen: 2 GiB
- Reden: Verwerkt al het externe verkeer

**Product Service**:
- CPU: 0.5 vCPU
- Geheugen: 1 GiB
- Reden: Lichtgewicht in-memory operaties

### Gezondheidscontroles

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

**Wat Dit Betekent**:
- **Liveness**: Als de gezondheidscontrole faalt, herstart Container Apps de container
- **Readiness**: Als niet gereed, stopt Container Apps met het routeren van verkeer naar die replica

## Monitoring & Observatie

### Bekijk Service Logs

```bash
# Stream logs van API Gateway
azd logs api-gateway --follow

# Bekijk recente productservicelogs
azd logs product-service --tail 100

# Bekijk alle logs van beide services
azd logs --follow
```

**Verwachte Output**:  
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Queries

Toegang tot Application Insights in Azure Portal, voer vervolgens deze queries uit:

**Vind Langzame Verzoeken**:  
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Volg Service-naar-Service Verzoeken**:  
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Foutpercentage per Service**:  
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Verzoekvolume Over Tijd**:  
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Toegang tot Monitoring Dashboard

```bash
# Haal Application Insights-details op
azd env get-values | grep APPLICATIONINSIGHTS

# Open Azure Portal monitoring
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Navigeer naar Application Insights in Azure Portal
2. Klik op "Live Metrics"
3. Bekijk realtime verzoeken, fouten en prestaties
4. Test door uit te voeren: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktische Oefeningen

[Opmerking: Zie volledige oefeningen hierboven in de sectie "Praktische Oefeningen" voor gedetailleerde stapsgewijze oefeningen, inclusief implementatieverificatie, gegevenswijziging, autoscaling tests, foutafhandeling en het toevoegen van een derde service.]

## Kostenanalyse

### Geschatte Maandelijkse Kosten (Voor Dit 2-Service Voorbeeld)

| Resource | Configuratie | Geschatte Kosten |
|----------|--------------|------------------|
| API Gateway | 2-20 replica's, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replica's, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basisniveau | $5 |
| Application Insights | 1-2 GB/maand | $5-10 |
| Log Analytics | 1 GB/maand | $3 |
| **Totaal** | | **$58-243/maand** |

**Kostenverdeling op Basis van Gebruik**:
- **Licht verkeer** (testen/leren): ~$60/maand
- **Gemiddeld verkeer** (kleine productie): ~$120/maand
- **Hoog verkeer** (drukke periodes): ~$240/maand

### Tips voor Kostenoptimalisatie

1. **Schalen naar Nul voor Ontwikkeling**:  
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gebruik Consumption Plan voor Cosmos DB** (wanneer je dit toevoegt):
   - Betaal alleen voor wat je gebruikt
   - Geen minimale kosten

3. **Stel Application Insights Sampling in**:  
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Neem 50% van de verzoeken
   ```

4. **Ruim Op Wanneer Niet Nodig**:  
   ```bash
   azd down
   ```

### Gratis Niveau Opties
Voor leren/testen, overweeg:
- Gebruik Azure gratis tegoed (eerste 30 dagen)
- Beperk het aantal replica's tot een minimum
- Verwijder na het testen (geen doorlopende kosten)

---

## Opruimen

Om doorlopende kosten te vermijden, verwijder alle resources:

```bash
azd down --force --purge
```

**Bevestigingsprompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Typ `y` om te bevestigen.

**Wat wordt verwijderd**:
- Container Apps-omgeving
- Beide Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resourcegroep

**✓ Controleer opruiming**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Moet leeg terugkeren.

---

## Uitbreidingsgids: Van 2 naar 5+ services

Zodra je deze 2-service architectuur beheerst, kun je uitbreiden:

### Fase 1: Voeg database-persistentie toe (volgende stap)

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

2. Update de product service om Cosmos DB te gebruiken in plaats van in-memory data

3. Geschatte extra kosten: ~$25/maand (serverless)

### Fase 2: Voeg een derde service toe (Orderbeheer)

**Maak Order Service**:

1. Nieuwe map: `src/order-service/` (Python/Node.js/C#)
2. Nieuwe Bicep: `infra/app/order-service.bicep`
3. Update API Gateway om `/api/orders` te routeren
4. Voeg Azure SQL Database toe voor order-persistentie

**Architectuur wordt**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Voeg asynchrone communicatie toe (Service Bus)

**Implementeer event-gedreven architectuur**:

1. Voeg Azure Service Bus toe: `infra/core/servicebus.bicep`
2. Product Service publiceert "ProductCreated"-events
3. Order Service abonneert zich op productevents
4. Voeg Notification Service toe om events te verwerken

**Patroon**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Fase 4: Voeg gebruikersauthenticatie toe

**Implementeer User Service**:

1. Maak `src/user-service/` (Go/Node.js)
2. Voeg Azure AD B2C of aangepaste JWT-authenticatie toe
3. API Gateway valideert tokens
4. Services controleren gebruikersrechten

### Fase 5: Productiegereedheid

**Voeg deze componenten toe**:
- Azure Front Door (globale load balancing)
- Azure Key Vault (geheimenbeheer)
- Azure Monitor Workbooks (aangepaste dashboards)
- CI/CD-pijplijn (GitHub Actions)
- Blue-Green Deployments
- Managed Identity voor alle services

**Volledige productiekosten architectuur**: ~$300-1.400/maand

---

## Meer leren

### Gerelateerde documentatie
- [Azure Container Apps Documentatie](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architectuurgids](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights voor Gedistribueerde Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Volgende stappen in deze cursus
- ← Vorige: [Eenvoudige Flask API](../../../../../examples/container-app/simple-flask-api) - Voorbeeld van een enkele container voor beginners
- → Volgende: [AI Integratiegids](../../../../../examples/docs/ai-foundry) - Voeg AI-mogelijkheden toe
- 🏠 [Cursus Home](../../README.md)

### Vergelijking: Wanneer gebruik je wat

**Enkele Container App** (Eenvoudige Flask API voorbeeld):
- ✅ Eenvoudige applicaties
- ✅ Monolithische architectuur
- ✅ Snel te implementeren
- ❌ Beperkte schaalbaarheid
- **Kosten**: ~$15-50/maand

**Microservices** (Dit voorbeeld):
- ✅ Complexe applicaties
- ✅ Onafhankelijke schaalbaarheid per service
- ✅ Teamautonomie (verschillende services, verschillende teams)
- ❌ Complexer te beheren
- **Kosten**: ~$60-250/maand

**Kubernetes (AKS)**:
- ✅ Maximale controle en flexibiliteit
- ✅ Multi-cloud portabiliteit
- ✅ Geavanceerde netwerken
- ❌ Vereist Kubernetes-expertise
- **Kosten**: ~$150-500/maand minimum

**Aanbeveling**: Begin met Container Apps (dit voorbeeld), schakel over naar AKS alleen als je Kubernetes-specifieke functies nodig hebt.

---

## Veelgestelde vragen

**V: Waarom slechts 2 services in plaats van 5+?**  
A: Educatieve opbouw. Beheers de basis (servicecommunicatie, monitoring, schaalbaarheid) met een eenvoudig voorbeeld voordat je complexiteit toevoegt. De patronen die je hier leert, zijn toepasbaar op architecturen met 100 services.

**V: Kan ik zelf meer services toevoegen?**  
A: Absoluut! Volg de uitbreidingsgids hierboven. Elke nieuwe service volgt hetzelfde patroon: maak een src-map, maak een Bicep-bestand, update azure.yaml, implementeer.

**V: Is dit productie-klaar?**  
A: Het is een solide basis. Voor productie, voeg toe: managed identity, Key Vault, persistente databases, CI/CD-pijplijn, monitoring alerts en een back-upstrategie.

**V: Waarom geen Dapr of andere service mesh gebruiken?**  
A: Houd het eenvoudig voor het leren. Zodra je de native Container Apps-netwerken begrijpt, kun je Dapr toevoegen voor geavanceerde scenario's.

**V: Hoe debug ik lokaal?**  
A: Draai services lokaal met Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**V: Kan ik verschillende programmeertalen gebruiken?**  
A: Ja! Dit voorbeeld toont Node.js (gateway) + Python (product service). Je kunt elke taal mixen die in containers draait.

**V: Wat als ik geen Azure-tegoed heb?**  
A: Gebruik de gratis Azure-laag (eerste 30 dagen met nieuwe accounts) of implementeer voor korte testperiodes en verwijder direct.

---

> **🎓 Samenvatting leerpad**: Je hebt geleerd hoe je een multi-service architectuur implementeert met automatische schaalbaarheid, interne netwerken, gecentraliseerde monitoring en productieklare patronen. Deze basis bereidt je voor op complexe gedistribueerde systemen en enterprise microservices-architecturen.

**📚 Cursusnavigatie:**
- ← Vorige: [Eenvoudige Flask API](../../../../../examples/container-app/simple-flask-api)
- → Volgende: [Database Integratie Voorbeeld](../../../../../examples/database-app)
- 🏠 [Cursus Home](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->