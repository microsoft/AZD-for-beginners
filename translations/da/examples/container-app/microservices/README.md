# Microservices Arkitektur - Eksempel på Container App

⏱️ **Estimeret tid**: 25-35 minutter | 💰 **Estimeret omkostning**: ~$50-100/måned | ⭐ **Kompleksitet**: Avanceret

En **forenklet men funktionel** microservices arkitektur implementeret på Azure Container Apps ved brug af AZD CLI. Dette eksempel demonstrerer service-til-service kommunikation, container orkestrering og overvågning med en praktisk opsætning af 2 tjenester.

> **📚 Læringsmetode**: Dette eksempel starter med en minimal arkitektur med 2 tjenester (API Gateway + Backend Service), som du faktisk kan implementere og lære af. Når du har mestret denne grundlæggende opsætning, giver vi vejledning til at udvide til et fuldt microservices økosystem.

## Hvad du vil lære

Ved at gennemføre dette eksempel vil du:
- Implementere flere containere på Azure Container Apps
- Implementere service-til-service kommunikation med intern netværk
- Konfigurere miljøbaseret skalering og sundhedstjek
- Overvåge distribuerede applikationer med Application Insights
- Forstå microservices implementeringsmønstre og bedste praksis
- Lære progressiv udvidelse fra simple til komplekse arkitekturer

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
- ✅ Implementer og forstå hurtigt (25-35 minutter)
- ✅ Lær kerne microservices mønstre uden kompleksitet
- ✅ Fungerende kode, du kan modificere og eksperimentere med
- ✅ Lavere omkostninger til læring (~$50-100/måned vs $300-1400/måned)
- ✅ Opbyg selvtillid før tilføjelse af databaser og beskedkøer

**Analogi**: Tænk på dette som at lære at køre bil. Du starter på en tom parkeringsplads (2 tjenester), mestrer det grundlæggende og går derefter videre til bytrafik (5+ tjenester med databaser).

### Fase 2: Fremtidig udvidelse (referencearkitektur)

Når du har mestret arkitekturen med 2 tjenester, kan du udvide til:

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

Se afsnittet "Udvidelsesvejledning" i slutningen for trin-for-trin instruktioner.

## Inkluderede funktioner

✅ **Service Discovery**: Automatisk DNS-baseret opdagelse mellem containere  
✅ **Load Balancing**: Indbygget load balancing på tværs af replikaer  
✅ **Auto-skalering**: Uafhængig skalering pr. tjeneste baseret på HTTP-anmodninger  
✅ **Sundhedsovervågning**: Liveness og readiness probes for begge tjenester  
✅ **Distribueret logning**: Centraliseret logning med Application Insights  
✅ **Intern netværk**: Sikker service-til-service kommunikation  
✅ **Container orkestrering**: Automatisk implementering og skalering  
✅ **Zero-Downtime Updates**: Rullende opdateringer med revisionsstyring  

## Forudsætninger

### Påkrævede værktøjer

Før du starter, skal du sikre dig, at du har disse værktøjer installeret:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 eller højere)
   ```bash
   azd version
   # Forventet output: azd version 1.0.0 eller højere
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 eller højere)
   ```bash
   az --version
   # Forventet output: azure-cli 2.50.0 eller højere
   ```

3. **[Docker](https://www.docker.com/get-started)** (til lokal udvikling/test - valgfrit)
   ```bash
   docker --version
   # Forventet output: Docker version 20.10 eller højere
   ```

### Azure krav

- Et aktivt **Azure-abonnement** ([opret en gratis konto](https://azure.microsoft.com/free/))
- Tilladelser til at oprette ressourcer i dit abonnement
- **Contributor** rolle på abonnementet eller ressourcegruppen

### Vidensforudsætninger

Dette er et eksempel på **avanceret niveau**. Du bør have:
- Gennemført [Simple Flask API eksemplet](../../../../../examples/container-app/simple-flask-api) 
- Grundlæggende forståelse af microservices arkitektur
- Kendskab til REST API'er og HTTP
- Forståelse af containerkoncepter

**Ny til Container Apps?** Start med [Simple Flask API eksemplet](../../../../../examples/container-app/simple-flask-api) først for at lære det grundlæggende.

## Hurtig start (trin-for-trin)

### Trin 1: Klon og naviger

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Succes tjek**: Bekræft, at du ser `azure.yaml`:
```bash
ls
# Forventet: README.md, azure.yaml, infra/, src/
```

### Trin 2: Autentificer med Azure

```bash
azd auth login
```

Dette åbner din browser til Azure-autentificering. Log ind med dine Azure-legitimationsoplysninger.

**✓ Succes tjek**: Du bør se:
```
Logged in to Azure.
```

### Trin 3: Initialiser miljøet

```bash
azd init
```

**Prompter du vil se**:
- **Miljønavn**: Indtast et kort navn (f.eks. `microservices-dev`)
- **Azure-abonnement**: Vælg dit abonnement
- **Azure placering**: Vælg en region (f.eks. `eastus`, `westeurope`)

**✓ Succes tjek**: Du bør se:
```
SUCCESS: New project initialized!
```

### Trin 4: Implementer infrastruktur og tjenester

```bash
azd up
```

**Hvad sker der** (tager 8-12 minutter):
1. Opretter Container Apps miljø
2. Opretter Application Insights til overvågning
3. Bygger API Gateway container (Node.js)
4. Bygger Product Service container (Python)
5. Implementerer begge containere til Azure
6. Konfigurerer netværk og sundhedstjek
7. Opsætter overvågning og logning

**✓ Succes tjek**: Du bør se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tid**: 8-12 minutter

### Trin 5: Test implementeringen

```bash
# Hent gateway-endpointen
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Test API Gateway sundhed
curl $GATEWAY_URL/health

# Forventet output:
# {"status":"sund","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test produktservice via gateway**:
```bash
# Liste produkter
curl $GATEWAY_URL/api/products

# Forventet output:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mus","price":29.99,"stock":200},
#   {"id":3,"name":"Tastatur","price":79.99,"stock":150}
# ]
```

**✓ Succes tjek**: Begge endpoints returnerer JSON-data uden fejl.

---

**🎉 Tillykke!** Du har implementeret en microservices arkitektur på Azure!

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
- `core/container-apps-environment.bicep`: Opretter Container Apps miljø og Azure Container Registry
- `core/monitor.bicep`: Opsætter Application Insights til distribueret logning
- `app/*.bicep`: Individuelle container app definitioner med skalering og sundhedstjek

**API Gateway (src/api-gateway/)**:
- Offentlig-facing tjeneste, der videresender anmodninger til backend-tjenester
- Implementerer logning, fejlhåndtering og anmodningsvideresendelse
- Demonstrerer service-til-service HTTP-kommunikation

**Product Service (src/product-service/)**:
- Intern tjeneste med produktkatalog (i hukommelsen for enkelhed)
- REST API med sundhedstjek
- Eksempel på backend microservice mønster

## Tjenesteoversigt

### API Gateway (Node.js/Express)

**Port**: 8080  
**Adgang**: Offentlig (ekstern ingress)  
**Formål**: Videresender indkommende anmodninger til passende backend-tjenester  

**Endpoints**:
- `GET /` - Tjenesteinformation
- `GET /health` - Sundhedstjek endpoint
- `GET /api/products` - Videresend til produktservice (liste alle)
- `GET /api/products/:id` - Videresend til produktservice (hent efter ID)

**Nøglefunktioner**:
- Anmodningsrouting med axios
- Centraliseret logning
- Fejlhåndtering og timeout-styring
- Serviceopdagelse via miljøvariabler
- Application Insights integration

**Kodehøjdepunkt** (`src/api-gateway/app.js`):
```javascript
// Intern tjenestekommunikation
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Adgang**: Kun intern (ingen ekstern ingress)  
**Formål**: Administrerer produktkatalog med data i hukommelsen  

**Endpoints**:
- `GET /` - Tjenesteinformation
- `GET /health` - Sundhedstjek endpoint
- `GET /products` - Liste alle produkter
- `GET /products/<id>` - Hent produkt efter ID

**Nøglefunktioner**:
- RESTful API med Flask
- Produktlager i hukommelsen (simpelt, ingen database nødvendig)
- Sundhedsovervågning med probes
- Struktureret logning
- Application Insights integration

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

**Hvorfor kun intern?**
Produktservice er ikke offentligt eksponeret. Alle anmodninger skal gå gennem API Gateway, som giver:
- Sikkerhed: Kontrolleret adgangspunkt
- Fleksibilitet: Kan ændre backend uden at påvirke klienter
- Overvågning: Centraliseret anmodningslogning

## Forståelse af servicekommunikation

### Hvordan tjenester kommunikerer med hinanden

I dette eksempel kommunikerer API Gateway med Product Service ved brug af **interne HTTP-opkald**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Foretag intern HTTP-anmodning
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Nøglepunkter**:

1. **DNS-baseret opdagelse**: Container Apps leverer automatisk DNS til interne tjenester
   - Produktservice FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Forenklet som: `http://product-service` (Container Apps løser det)

2. **Ingen offentlig eksponering**: Produktservice har `external: false` i Bicep
   - Kun tilgængelig inden for Container Apps miljøet
   - Kan ikke nås fra internettet

3. **Miljøvariabler**: Service-URL'er injiceres ved implementeringstidspunktet
   - Bicep sender den interne FQDN til gatewayen
   - Ingen hardkodede URL'er i applikationskoden

**Analogi**: Tænk på dette som kontorlokaler. API Gateway er receptionen (offentlig-facing), og Product Service er et kontorrum (kun internt). Besøgende skal gå gennem receptionen for at nå ethvert kontor.

## Implementeringsmuligheder

### Fuld implementering (anbefalet)

```bash
# Udrul infrastruktur og begge tjenester
azd up
```

Dette implementerer:
1. Container Apps miljø
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Tid**: 8-12 minutter

### Implementer individuel tjeneste

```bash
# Udrul kun én tjeneste (efter initial azd up)
azd deploy api-gateway

# Eller udrul produkttjeneste
azd deploy product-service
```

**Brugsscenarie**: Når du har opdateret kode i én tjeneste og vil genimplementere kun den tjeneste.

### Opdater konfiguration

```bash
# Ændr skaleringsparametre
azd env set GATEWAY_MAX_REPLICAS 30

# Genudrul med ny konfiguration
azd up
```

## Konfiguration

### Skalering

Begge tjenester er konfigureret med HTTP-baseret autoskalering i deres Bicep-filer:

**API Gateway**:
- Min replikaer: 2 (altid mindst 2 for tilgængelighed)
- Max replikaer: 20
- Skaleringstrigger: 50 samtidige anmodninger pr. replika

**Product Service**:
- Min replikaer: 1 (kan skaleres til nul, hvis nødvendigt)
- Max replikaer: 10
- Skaleringstrigger: 100 samtidige anmodninger pr. replika

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

### Ressourceallokering

**API Gateway**:
- CPU: 1.0 vCPU
- Hukommelse: 2 GiB
- Årsag: Håndterer al ekstern trafik

**Product Service**:
- CPU: 0.5 vCPU
- Hukommelse: 1 GiB
- Årsag: Letvægts operationer i hukommelsen

### Sundhedstjek

Begge tjenester inkluderer liveness og readiness probes:

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
- **Liveness**: Hvis sundhedstjek fejler, genstarter Container Apps containeren
- **Readiness**: Hvis ikke klar, stopper Container Apps med at dirigere trafik til den replika

## Overvågning & Observabilitet

### Se tjenestelogfiler

```bash
# Stream logfiler fra API Gateway
azd logs api-gateway --follow

# Se nylige produktservice logfiler
azd logs product-service --tail 100

# Se alle logfiler fra begge tjenester
azd logs --follow
```

**Forventet output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights forespørgsler

Få adgang til Application Insights i Azure Portal, og kør disse forespørgsler:

**Find langsomme anmodninger**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Spor service-til-service opkald**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Fejlrate pr. tjeneste**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Anmodningsvolumen over tid**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Få adgang til overvågningsdashboard

```bash
# Hent Application Insights detaljer
azd env get-values | grep APPLICATIONINSIGHTS

# Åbn Azure Portal overvågning
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Naviger til Application Insights i Azure Portal
2. Klik på "Live Metrics"
3. Se real-time anmodninger, fejl og ydeevne
4. Test ved at køre: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiske øvelser

[Note: Se fulde øvelser ovenfor i afsnittet "Praktiske øvelser" for detaljerede trin-for-trin øvelser, herunder implementeringsverifikation, datamodifikation, autoskaleringstests, fejlhåndtering og tilføjelse af en tredje tjeneste.]

## Omkostningsanalyse

### Estimerede månedlige omkostninger (for dette eksempel med 2 tjenester)

| Ressource | Konfiguration | Estimeret omkostning |
|----------|--------------|----------------|
| API Gateway | 2-20 replikaer, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replikaer, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/måned | $5-10 |
| Log Analytics | 1 GB/måned | $3 |
| **Total** | | **$58-243/måned** |

**Omkostningsfordeling efter brug**:
- **Let trafik** (test/læring): ~$60/måned
- **Moderat trafik** (lille produktion): ~$120/måned
- **Høj trafik** (travle perioder): ~$240/måned

### Tips til omkostningsoptimering

1. **Skaler til nul for udvikling**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Brug forbrugsplan for Cosmos DB** (når du tilføjer det):
   - Betal kun for det, du bruger
   - Ingen minimumsgebyr

3. **Indstil Application Insights sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Udtag 50% af anmodninger
   ```

4. **Ryd op, når det ikke er nødvendigt**:
   ```bash
   azd down
   ```

### Gratis niveau muligheder
For læring/testning, overvej:
- Brug Azure gratis credits (de første 30 dage)
- Hold antallet af replikaer på et minimum
- Slet efter testning (ingen løbende omkostninger)

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
- Container Apps-miljø
- Begge Container Apps (gateway & produktservice)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Ressourcegruppe

**✓ Bekræft oprydning**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Skal returnere tomt.

---

## Udvidelsesguide: Fra 2 til 5+ tjenester

Når du har mestret denne 2-tjeneste arkitektur, kan du udvide:

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

2. Opdater produktservice til at bruge Cosmos DB i stedet for in-memory data

3. Estimeret ekstra omkostning: ~25 USD/måned (serverless)

### Fase 2: Tilføj tredje tjeneste (ordrehåndtering)

**Opret ordreservice**:

1. Ny mappe: `src/order-service/` (Python/Node.js/C#)
2. Ny Bicep-fil: `infra/app/order-service.bicep`
3. Opdater API Gateway til at rute `/api/orders`
4. Tilføj Azure SQL Database til ordre-persistens

**Arkitekturen bliver**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Tilføj asynkron kommunikation (Service Bus)

**Implementer event-drevet arkitektur**:

1. Tilføj Azure Service Bus: `infra/core/servicebus.bicep`
2. Produktservice publicerer "ProductCreated"-events
3. Ordreservice abonnerer på produkt-events
4. Tilføj notifikationsservice til at behandle events

**Mønster**: Request/Response (HTTP) + Event-drevet (Service Bus)

### Fase 4: Tilføj brugerautentifikation

**Implementer brugerservice**:

1. Opret `src/user-service/` (Go/Node.js)
2. Tilføj Azure AD B2C eller brugerdefineret JWT-autentifikation
3. API Gateway validerer tokens
4. Tjenester tjekker brugerrettigheder

### Fase 5: Produktionsklarhed

**Tilføj disse komponenter**:
- Azure Front Door (global load balancing)
- Azure Key Vault (hemmelighedshåndtering)
- Azure Monitor Workbooks (tilpassede dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for alle tjenester

**Fuld produktionsarkitektur omkostning**: ~300-1.400 USD/måned

---

## Lær mere

### Relateret dokumentation
- [Azure Container Apps Dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Arkitektur Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Næste trin i dette kursus
- ← Forrige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Begynder eksempel med én container
- → Næste: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Tilføj AI-funktioner
- 🏠 [Kursus Hjem](../../README.md)

### Sammenligning: Hvornår skal man bruge hvad

**Single Container App** (Simple Flask API eksempel):
- ✅ Enkle applikationer
- ✅ Monolitisk arkitektur
- ✅ Hurtig at implementere
- ❌ Begrænset skalerbarhed
- **Omkostning**: ~15-50 USD/måned

**Microservices** (Dette eksempel):
- ✅ Komplekse applikationer
- ✅ Uafhængig skalering pr. tjeneste
- ✅ Teamautonomi (forskellige tjenester, forskellige teams)
- ❌ Mere komplekst at administrere
- **Omkostning**: ~60-250 USD/måned

**Kubernetes (AKS)**:
- ✅ Maksimal kontrol og fleksibilitet
- ✅ Multi-cloud portabilitet
- ✅ Avanceret netværk
- ❌ Kræver Kubernetes-ekspertise
- **Omkostning**: ~150-500 USD/måned minimum

**Anbefaling**: Start med Container Apps (dette eksempel), skift til AKS kun hvis du har brug for Kubernetes-specifikke funktioner.

---

## Ofte stillede spørgsmål

**Q: Hvorfor kun 2 tjenester i stedet for 5+?**  
A: Uddannelsesmæssig progression. Mestér det grundlæggende (servicekommunikation, overvågning, skalering) med et enkelt eksempel, før du tilføjer kompleksitet. De mønstre, du lærer her, gælder for arkitekturer med 100 tjenester.

**Q: Kan jeg selv tilføje flere tjenester?**  
A: Absolut! Følg udvidelsesguiden ovenfor. Hver ny tjeneste følger samme mønster: opret src-mappe, opret Bicep-fil, opdater azure.yaml, implementer.

**Q: Er dette produktionsklart?**  
A: Det er et solidt fundament. For produktion, tilføj: managed identity, Key Vault, persistente databaser, CI/CD pipeline, overvågningsalarmer og backup-strategi.

**Q: Hvorfor ikke bruge Dapr eller andre service mesh?**  
A: Hold det enkelt for læring. Når du forstår native Container Apps-netværk, kan du tilføje Dapr til avancerede scenarier.

**Q: Hvordan debugger jeg lokalt?**  
A: Kør tjenester lokalt med Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Kan jeg bruge forskellige programmeringssprog?**  
A: Ja! Dette eksempel viser Node.js (gateway) + Python (produktservice). Du kan blande alle sprog, der kan køre i containere.

**Q: Hvad hvis jeg ikke har Azure credits?**  
A: Brug Azure gratis tier (de første 30 dage med nye konti) eller implementer i korte testperioder og slet straks.

---

> **🎓 Læringssti resumé**: Du har lært at implementere en multi-service arkitektur med automatisk skalering, intern netværk, centraliseret overvågning og produktionsklare mønstre. Dette fundament forbereder dig til komplekse distribuerede systemer og enterprise microservices arkitekturer.

**📚 Kursusnavigation:**
- ← Forrige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Næste: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Kursus Hjem](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->