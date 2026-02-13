# Microservices-arkitektur - Container App-eksempel

⏱️ **Anslået tid**: 25-35 minutter | 💰 **Anslået pris**: ~$50-100/month | ⭐ **Kompleksitet**: Avanceret

En **forenklet men funktionel** microservices-arkitektur udrullet til Azure Container Apps ved hjælp af AZD CLI. Dette eksempel demonstrerer tjeneste-til-tjeneste kommunikation, containerorkestrering og overvågning med en praktisk opsætning med 2 tjenester.

> **📚 Læringsmetode**: Dette eksempel starter med en minimal arkitektur med 2 tjenester (API Gateway + Backend Service), som du faktisk kan udrulle og lære af. Efter at have mestret dette fundament giver vi vejledning til at udvide til et fuldt microservices-økosystem.

## Hvad du lærer

Ved at gennemføre dette eksempel vil du:
- Udrulle flere containere til Azure Container Apps
- Implementere tjeneste-til-tjeneste-kommunikation med internt netværk
- Konfigurere miljøbaseret skalering og sundhedstjek
- Overvåge distribuerede applikationer med Application Insights
- Forstå udrulningsmønstre for microservices og bedste praksis
- Lære trinvis udvidelse fra simple til komplekse arkitekturer

## Arkitektur

### Fase 1: Hvad vi bygger (inkluderet i dette eksempel)

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

**Hvorfor starte simpelt?**
- ✅ Udrul og forstå hurtigt (25-35 minutter)
- ✅ Lær kernemønstre for microservices uden kompleksitet
- ✅ Fungerende kode, du kan ændre og eksperimentere med
- ✅ Lavere omkostninger til læring (~$50-100/month vs $300-1400/month)
- ✅ Opbyg selvtillid før du tilføjer databaser og beskedkøer

**Analogi**: Tænk på dette som at lære at køre bil. Du starter med en tom parkeringsplads (2 tjenester), mestrer det grundlæggende og går så videre til bytrafik (5+ tjenester med databaser).

### Fase 2: Fremtidig udvidelse (referencearkitektur)

Når du mestrer 2-tjeneste-arkitekturen, kan du udvide til:

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

Se afsnittet "Expansion Guide" i slutningen for trin-for-trin instruktioner.

## Inkluderede funktioner

✅ **Serviceopdagelse**: Automatisk DNS-baseret opdagelse mellem containere  
✅ **Belastningsfordeling**: Indbygget belastningsfordeling på tværs af replikaer  
✅ **Autoskalering**: Uafhængig skalering pr. tjeneste baseret på HTTP-forespørgsler  
✅ **Sundhedsovervågning**: Liveness- og readiness-prober for begge tjenester  
✅ **Distribueret logning**: Centraliseret logning med Application Insights  
✅ **Internt netværk**: Sikker tjeneste-til-tjeneste kommunikation  
✅ **Containerorkestrering**: Automatisk udrulning og skalering  
✅ **Opdateringer uden nedetid**: Rolling updates med revisionstyring  

## Forudsætninger

### Påkrævede værktøjer

Før du starter, bekræft, at du har disse værktøjer installeret:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 eller nyere)
   ```bash
   azd version
   # Forventet output: azd version 1.0.0 eller nyere
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 eller nyere)
   ```bash
   az --version
   # Forventet output: azure-cli 2.50.0 eller nyere
   ```

3. **[Docker](https://www.docker.com/get-started)** (til lokal udvikling/test - valgfrit)
   ```bash
   docker --version
   # Forventet output: Docker-version 20.10 eller nyere
   ```

### Azure-krav

- Et aktivt **Azure-abonnement** ([create a free account](https://azure.microsoft.com/free/))
- Tilladelser til at oprette ressourcer i dit abonnement
- **Contributor**-rollen på abonnementet eller ressourcegruppen

### Forudgående viden

Dette er et **avanceret** eksempel. Du bør have:
- Gennemført [Simple Flask API-eksemplet](../../../../../examples/container-app/simple-flask-api) 
- Grundlæggende forståelse af microservices-arkitektur
- Kendskab til REST-API'er og HTTP
- Forståelse af containerbegreber

**Ny til Container Apps?** Start med [Simple Flask API-eksemplet](../../../../../examples/container-app/simple-flask-api) først for at lære det grundlæggende.

## Hurtig start (trin for trin)

### Trin 1: Klon og naviger

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Succeskontrol**: Bekræft, at du ser `azure.yaml`:
```bash
ls
# Forventet: README.md, azure.yaml, infra/, src/
```

### Trin 2: Godkend med Azure

```bash
azd auth login
```

Dette åbner din browser til Azure-autentificering. Log ind med dine Azure-legitimationsoplysninger.

**✓ Succeskontrol**: Du bør se:
```
Logged in to Azure.
```

### Trin 3: Initialiser miljøet

```bash
azd init
```

**Følgende prompts vil vises**:
- **Miljønavn**: Indtast et kort navn (f.eks. `microservices-dev`)
- **Azure-abonnement**: Vælg dit abonnement
- **Azure-lokation**: Vælg en region (f.eks. `eastus`, `westeurope`)

**✓ Succeskontrol**: Du bør se:
```
SUCCESS: New project initialized!
```

### Trin 4: Udrul infrastruktur og tjenester

```bash
azd up
```

**Hvad sker der** (tager 8-12 minutter):
1. Opretter Container Apps-miljø
2. Opretter Application Insights til overvågning
3. Bygger API Gateway-containeren (Node.js)
4. Bygger Product Service-containeren (Python)
5. Udruller begge containere til Azure
6. Konfigurerer netværk og sundhedstjek
7. Opsætter overvågning og logning

**✓ Succeskontrol**: Du bør se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tid**: 8-12 minutter

### Trin 5: Test udrulningen

```bash
# Hent gateway-endpointet
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Test API-gatewayens sundhed
curl $GATEWAY_URL/health

# Forventet output:
# {"status":"sund","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test produktservice gennem gateway**:
```bash
# Vis produkter
curl $GATEWAY_URL/api/products

# Forventet output:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Succeskontrol**: Begge endepunkter returnerer JSON-data uden fejl.

---

**🎉 Tillykke!** Du har udrullet en microservices-arkitektur til Azure!

## Projektstruktur

Alle implementeringsfiler er inkluderet—dette er et komplet, fungerende eksempel:

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

**Hvad hver komponent gør:**

**Infrastruktur (infra/)**:
- `main.bicep`: Orkestrerer alle Azure-ressourcer og deres afhængigheder
- `core/container-apps-environment.bicep`: Opretter Container Apps-miljøet og Azure Container Registry
- `core/monitor.bicep`: Opsætter Application Insights til distribueret logning
- `app/*.bicep`: Individuelle container app-definitioner med skalering og sundhedstjek

**API Gateway (src/api-gateway/)**:
- Offentlig tjeneste, der dirigerer forespørgsler til backend-tjenester
- Implementerer logning, fejlbehandling og videresendelse af forespørgsler
- Demonstrerer tjeneste-til-tjeneste HTTP-kommunikation

**Product Service (src/product-service/)**:
- Intern tjeneste med produktkatalog (i hukommelsen for enkelhed)
- REST-API med sundhedstjek
- Eksempel på backend-microservice-mønster

## Oversigt over tjenester

### API Gateway (Node.js/Express)

**Port**: 8080  
**Adgang**: Offentlig (ekstern ingress)  
**Formål**: Dirigerer indkommende forespørgsler til de rette backend-tjenester  

**Endepunkter**:
- `GET /` - Tjenesteinformation
- `GET /health` - Sundhedstjek-endpoint
- `GET /api/products` - Videregiver til produktservice (viser alle)
- `GET /api/products/:id` - Videregiver til produktservice (hent efter ID)

**Nøglefunktioner**:
- Routing af forespørgsler med axios
- Centraliseret logning
- Fejlbehandling og timeout-håndtering
- Serviceopdagelse via miljøvariabler
- Integration med Application Insights

**Kodeeksempel** (`src/api-gateway/app.js`):
```javascript
// Intern tjenestekommunikation
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Produktservice (Python/Flask)

**Port**: 8000  
**Adgang**: Kun internt (ingen ekstern ingress)  
**Formål**: Håndterer produktkatalog med data i hukommelsen  

**Endepunkter**:
- `GET /` - Tjenesteinformation
- `GET /health` - Sundhedstjek-endpoint
- `GET /products` - List alle produkter
- `GET /products/<id>` - Hent produkt efter ID

**Nøglefunktioner**:
- RESTful API med Flask
- Produktlager i hukommelsen (simpelt, ingen database nødvendig)
- Sundhedsovervågning med prober
- Struktureret logning
- Integration med Application Insights

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

**Hvorfor kun internt?**
Produktservicen er ikke eksponeret offentligt. Alle forespørgsler skal gå gennem API Gateway, som giver:
- Sikkerhed: Kontrolleret adgangspunkt
- Fleksibilitet: Kan ændre backend uden at påvirke klienter
- Overvågning: Centraliseret forespørgselslogning

## Forståelse af tjenestekommunikation

### Hvordan tjenester kommunikerer med hinanden

I dette eksempel kommunikerer API Gateway med Produktservicen ved hjælp af **interne HTTP-opkald**:

```javascript
// API-gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Foretag intern HTTP-anmodning
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Vigtige punkter**:

1. **DNS-baseret opdagelse**: Container Apps leverer automatisk DNS til interne tjenester
   - Produktservice FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Forenklet som: `http://product-service` (Container Apps resolver det)

2. **Ingen offentlig eksponering**: Produktservice har `external: false` i Bicep
   - Kun tilgængelig inden for Container Apps-miljøet
   - Kan ikke nås fra internettet

3. **Miljøvariabler**: Tjeneste-URL'er injiceres ved udrulningstidspunktet
   - Bicep videregiver den interne FQDN til gateway'en
   - Ingen hardkodede URL'er i applikationskoden

**Analogi**: Tænk på dette som kontorværelser. API Gateway er receptionen (offentlig), og Produktservicen er et kontor (kun internt). Besøgende skal gå gennem receptionen for at nå kontoret.

## Udrulningsmuligheder

### Fuld udrulning (anbefalet)

```bash
# Udrul infrastruktur og begge tjenester
azd up
```

Dette udruller:
1. Container Apps-miljø
2. Application Insights
3. Container Registry
4. API Gateway-container
5. Product Service-container

**Tid**: 8-12 minutter

### Udrul enkelt tjeneste

```bash
# Udrul kun én tjeneste (efter den indledende azd up)
azd deploy api-gateway

# Eller udrul produkttjenesten
azd deploy product-service
```

**Brugstilfælde**: Når du har opdateret koden i en tjeneste og ønsker kun at udrulle den tjeneste.

### Opdater konfiguration

```bash
# Ændr skaleringsparametre
azd env set GATEWAY_MAX_REPLICAS 30

# Udrul igen med ny konfiguration
azd up
```

## Konfiguration

### Skaleringskonfiguration

Begge tjenester er konfigureret med HTTP-baseret autoskalering i deres Bicep-filer:

**API Gateway**:
- Min replikaer: 2 (altid mindst 2 for tilgængelighed)
- Maks replikaer: 20
- Skaleringsudløser: 50 samtidige forespørgsler pr. replika

**Product Service**:
- Min replikaer: 1 (kan skaleres til nul hvis nødvendigt)
- Maks replikaer: 10
- Skaleringsudløser: 100 samtidige forespørgsler pr. replika

**Tilpas skalering** (i `infra/app/*.bicep`):
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

### Ressourcetildeling

**API Gateway**:
- CPU: 1.0 vCPU
- Hukommelse: 2 GiB
- Årsag: Håndterer al ekstern trafik

**Produktservice**:
- CPU: 0.5 vCPU
- Hukommelse: 1 GiB
- Årsag: Letvægts hukommelsesoperationer

### Sundhedstjek

Begge tjenester inkluderer liveness- og readiness-prober:

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

**Hvad dette betyder**:
- **Liveness**: Hvis sundhedstjek mislykkes, genstarter Container Apps containeren
- **Readiness**: Hvis ikke klar, stopper Container Apps routing til den replika



## Overvågning og observerbarhed

### Vis tjenestelogs

```bash
# Vis logfiler ved hjælp af azd monitor
azd monitor --logs

# Eller brug Azure CLI til specifikke Container Apps:
# Stream logfiler fra API-gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Vis nylige logfiler for produktservicen
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Forventet output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights-forespørgsler

Åbn Application Insights i Azure-portalen, og kør derefter disse forespørgsler:

**Find langsomme forespørgsler**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Spor tjeneste-til-tjeneste opkald**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Fejlraten pr. tjeneste**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Antal forespørgsler over tid**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Åbn overvågningsdashboard

```bash
# Hent Application Insights-detaljer
azd env get-values | grep APPLICATIONINSIGHTS

# Åbn overvågning i Azure-portalen
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live-målinger

1. Gå til Application Insights i Azure-portalen
2. Klik på "Live Metrics"
3. Se realtidsforespørgsler, fejl og ydeevne
4. Test ved at køre: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiske øvelser

[Bemærk: Se de fulde øvelser ovenfor i afsnittet "Praktiske øvelser" for detaljerede trin-for-trin øvelser inklusive udrulningsverifikation, datamodifikation, autoskalerings-tests, fejlbehandling og tilføjelse af en tredje tjeneste.]

## Omkostningsanalyse

### Anslåede månedlige omkostninger (for dette 2-tjeneste-eksempel)

| Ressource | Konfiguration | Anslået pris |
|----------|--------------|----------------|
| API Gateway | 2-20 replikaer, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replikaer, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic-niveau | $5 |
| Application Insights | 1-2 GB/måned | $5-10 |
| Log Analytics | 1 GB/måned | $3 |
| **I alt** | | **$58-243/month** |

**Omkostningsfordeling efter brug**:
- **Lav trafik** (test/undervisning): ~$60/måned
- **Moderat trafik** (lille produktion): ~$120/måned
- **Høj trafik** (travle perioder): ~$240/måned

### Tips til omkostningsoptimering

1. **Skaler til nul under udvikling**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Brug forbrugsplan for Cosmos DB** (når du tilføjer det):
   - Betal kun for det, du bruger
   - Ingen minimumsafgift

3. **Sæt sampling i Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Udtag 50 % af anmodningerne
   ```

4. **Ryd op, når det ikke er nødvendigt**:
   ```bash
   azd down
   ```

### Gratis muligheder
For learning/testing, consider:
- Brug Azure gratis kreditter (første 30 dage)
- Hold antal replikaer på et minimum
- Slet efter test (ingen løbende omkostninger)

---

## Oprydning

For at undgå løbende omkostninger, slet alle ressourcer:

```bash
azd down --force --purge
```

**Bekræftelsesprompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Skriv `y` for at bekræfte.

**Hvad bliver slettet**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Bekræft oprydning**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Skal returnere tomt.

---

## Udvidelsesvejledning: Fra 2 til 5+ tjenester

Når du har mestret denne 2-tjenesters arkitektur, kan du udvide på følgende måde:

### Fase 1: Tilføj databasepersistens (næste skridt)

**Tilføj Cosmos DB til produktservice**:

1. Opret `infra/core/cosmos.bicep`:
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

2. Opdater produktservicen til at bruge Cosmos DB i stedet for data i hukommelsen

3. Anslået yderligere omkostning: ~$25/måned (serverløs)

### Fase 2: Tilføj tredje tjeneste (ordrestyring)

**Opret Order Service**:

1. Ny mappe: `src/order-service/` (Python/Node.js/C#)
2. Ny Bicep: `infra/app/order-service.bicep`
3. Opdater API Gateway til at rute `/api/orders`
4. Tilføj Azure SQL Database til ordrepersistens

**Arkitekturen bliver**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Tilføj asynkron kommunikation (Service Bus)

**Implementer begivenhedsdrevet arkitektur**:

1. Tilføj Azure Service Bus: `infra/core/servicebus.bicep`
2. Produktservicen publicerer "ProductCreated"-hændelser
3. Order Service abonnerer på produktevents
4. Tilføj Notification Service til at behandle hændelser

**Mønster**: Request/Response (HTTP) + Begivenhedsdrevet (Service Bus)

### Fase 4: Tilføj brugerautentifikation

**Implementer User Service**:

1. Opret `src/user-service/` (Go/Node.js)
2. Tilføj Azure AD B2C eller brugerdefineret JWT-autentificering
3. API Gateway validerer tokens
4. Services kontrollerer brugerrettigheder

### Fase 5: Klar til produktion

**Tilføj disse komponenter**:
- Azure Front Door (global lastbalancering)
- Azure Key Vault (hemmelighedshåndtering)
- Azure Monitor Workbooks (tilpassede dashboards)
- CI/CD-pipeline (GitHub Actions)
- Blue-Green-udrulninger
- Managed Identity for alle tjenester

**Omkostning for fuld produktionsarkitektur**: ~$300-1,400/måned

---

## Læs mere

### Relateret dokumentation
- [Azure Container Apps-dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [Guide til microservices-arkitektur](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights til distribueret sporing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Næste skridt i dette kursus
- ← Forrige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Begynder enkelt-container eksempel
- → Næste: [AI Integrationsguide](../../../../../examples/docs/ai-foundry) - Tilføj AI-funktioner
- 🏠 [Kursusforside](../../README.md)

### Sammenligning: Hvornår man skal bruge hvad

**Enkelt container-app** (Simple Flask API-eksempel):
- ✅ Enkle applikationer
- ✅ Monolitisk arkitektur
- ✅ Hurtig at udrulle
- ❌ Begrænset skalerbarhed
- **Omkostning**: ~$15-50/måned

**Mikrotjenester** (Dette eksempel):
- ✅ Komplekse applikationer
- ✅ Uafhængig skalering per tjeneste
- ✅ Teamautonomi (forskellige tjenester, forskellige teams)
- ❌ Mere komplekst at administrere
- **Omkostning**: ~$60-250/måned

**Kubernetes (AKS)**:
- ✅ Maksimal kontrol og fleksibilitet
- ✅ Multi-cloud portabilitet
- ✅ Avanceret netværk
- ❌ Kræver Kubernetes-ekspertise
- **Omkostning**: ~$150-500/måned minimum

**Anbefaling**: Start med Container Apps (dette eksempel), skift til AKS kun hvis du har brug for Kubernetes-specifikke funktioner.

---

## Ofte stillede spørgsmål

**Q: Hvorfor kun 2 tjenester i stedet for 5+?**  
A: For læringens skyld. Mestér grundprincipperne (servicekommunikation, overvågning, skalering) med et enkelt eksempel, før du tilføjer kompleksitet. De mønstre, du lærer her, gælder for arkitekturer med 100 tjenester.

**Q: Kan jeg selv tilføje flere tjenester?**  
A: Absolut! Følg udvidelsesvejledningen ovenfor. Hver ny tjeneste følger samme mønster: opret src-mappe, opret Bicep-fil, opdater azure.yaml, deploy.

**Q: Er dette klar til produktion?**  
A: Det er et solidt fundament. Til produktion tilføj: managed identity, Key Vault, persistente databaser, CI/CD-pipeline, overvågningsalarmer, og backup-strategi.

**Q: Hvorfor ikke bruge Dapr eller anden service mesh?**  
A: Hold det enkelt til læring. Når du først forstår native Container Apps-netværket, kan du tilføje Dapr til avancerede scenarier.

**Q: Hvordan fejlsøger jeg lokalt?**  
A: Kør tjenester lokalt med Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Kan jeg bruge forskellige programmeringssprog?**  
A: Ja! Dette eksempel viser Node.js (gateway) + Python (produktservice). Du kan blande alle sprog, der kører i containere.

**Q: Hvad hvis jeg ikke har Azure-kreditter?**  
A: Brug Azure gratisniveau (første 30 dage for nye konti) eller deploy til korte testperioder og slet straks.

---

> **🎓 Læringsoversigt**: Du har lært at udrulle en multi-tjeneste-arkitektur med automatisk skalering, intern netværkskommunikation, centraliseret overvågning og produktionsklare mønstre. Dette fundament forbereder dig på komplekse distribuerede systemer og enterprise mikrotjenestearkitekturer.

**📚 Kursusnavigation:**
- ← Forrige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Næste: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Kursus Forside](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Mens vi stræber efter nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel, menneskelig oversættelse. Vi kan ikke holdes ansvarlige for misforståelser eller fejltolkninger, som opstår ved brug af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->