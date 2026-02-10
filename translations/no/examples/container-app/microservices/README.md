# Mikroservicearkitektur - Container App-eksempel

⏱️ **Estimert tid**: 25-35 minutter | 💰 **Estimert kostnad**: ~50-100 USD/måned | ⭐ **Kompleksitet**: Avansert

En **forenklet, men funksjonell** mikroservicearkitektur distribuert til Azure Container Apps ved bruk av AZD CLI. Dette eksemplet demonstrerer tjeneste-til-tjeneste-kommunikasjon, containerorkestrering og overvåking med en praktisk oppsett med 2 tjenester.

> **📚 Læringsmetode**: Dette eksemplet starter med en minimal 2-tjenestes arkitektur (API Gateway + Backend-tjeneste) som du faktisk kan distribuere og lære av. Etter å ha mestret dette grunnlaget gir vi veiledning for utvidelse til et fullstendig mikroservice-økosystem.

## Hva du vil lære

Ved å fullføre dette eksemplet vil du:
- Distribuere flere containere til Azure Container Apps
- Implementere tjeneste-til-tjeneste-kommunikasjon med intern nettverksforbindelse
- Konfigurere miljøbasert skalering og helsesjekker
- Overvåke distribuerte applikasjoner med Application Insights
- Forstå distribusjonsmønstre og beste praksis for mikroservicer
- Lære progressiv utvidelse fra enkle til komplekse arkitekturer

## Arkitektur

### Fase 1: Hva vi bygger (inkludert i dette eksemplet)

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

**Hvorfor starte enkelt?**
- ✅ Distribuer og forstå raskt (25-35 minutter)
- ✅ Lær kjerneprinsipper for mikroservicer uten kompleksitet
- ✅ Kode som fungerer og som du kan modifisere og eksperimentere med
- ✅ Lavere kostnad for læring (~50-100 USD/måned vs 300-1400 USD/måned)
- ✅ Bygg selvtillit før du legger til databaser og meldingskøer

**Analogien**: Tenk på dette som å lære å kjøre bil. Du starter på en tom parkeringsplass (2 tjenester), mestrer det grunnleggende, og går deretter videre til trafikken i byen (5+ tjenester med databaser).

### Fase 2: Fremtidig utvidelse (referansearkitektur)

Når du mestrer 2-tjenestes arkitekturen, kan du utvide til:

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

Se "Expansion Guide" seksjonen på slutten for trinnvise instruksjoner.

## Inkluderte funksjoner

✅ **Tjenesteoppdagelse**: Automatisk DNS-basert oppdagelse mellom containere  
✅ **Lastbalansering**: Innebygd lastbalansering over replikaer  
✅ **Autoskalering**: Uavhengig skalering per tjeneste basert på HTTP-forespørsler  
✅ **Helseovervåking**: Liveness og readiness probes for begge tjenester  
✅ **Distribuert logging**: Sentralisert logging med Application Insights  
✅ **Intern nettverksforbindelse**: Sikker tjeneste-til-tjeneste-kommunikasjon  
✅ **Containerorkestrering**: Automatisk distribusjon og skalering  
✅ **Oppdateringer uten nedetid**: Rolling updates med revisjonsstyring  

## Forutsetninger

### Nødvendige verktøy

Før du begynner, sjekk at du har disse verktøyene installert:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versjon 1.0.0 eller høyere)
   ```bash
   azd version
   # Forventet utdata: azd versjon 1.0.0 eller høyere
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versjon 2.50.0 eller høyere)
   ```bash
   az --version
   # Forventet output: azure-cli 2.50.0 eller høyere
   ```

3. **[Docker](https://www.docker.com/get-started)** (for lokal utvikling/testing - valgfritt)
   ```bash
   docker --version
   # Forventet utdata: Docker versjon 20.10 eller høyere
   ```

### Azure-krav

- Et aktivt **Azure-abonnement** ([opprett gratis konto](https://azure.microsoft.com/free/))
- Tillatelser til å opprette ressurser i abonnementet ditt
- **Bidragsyter**-rolle på abonnementet eller ressursgruppen

### Kunnskapsforutsetninger

Dette er et **avansert** eksempel. Du bør ha:
- Fullført [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Grunnleggende forståelse av mikroservicearkitektur
- Kjennskap til REST API-er og HTTP
- Forståelse av container-konsepter

**Ny til Container Apps?** Start med [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) først for å lære det grunnleggende.

## Rask start (trinn for trinn)

### Trinn 1: Klon og naviger

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Suksesssjekk**: Bekreft at du ser `azure.yaml`:
```bash
ls
# Forventet: README.md, azure.yaml, infra/, src/
```

### Trinn 2: Autentiser med Azure

```bash
azd auth login
```

Dette åpner nettleseren din for Azure-autentisering. Logg inn med dine Azure-legitimasjoner.

**✓ Suksesssjekk**: Du bør se:
```
Logged in to Azure.
```

### Trinn 3: Initialiser miljøet

```bash
azd init
```

**Spørsmål du vil få**:
- **Miljønavn**: Skriv inn et kort navn (f.eks. `microservices-dev`)
- **Azure-abonnement**: Velg abonnement
- **Azure-region**: Velg region (f.eks. `eastus`, `westeurope`)

**✓ Suksesssjekk**: Du bør se:
```
SUCCESS: New project initialized!
```

### Trinn 4: Distribuer infrastruktur og tjenester

```bash
azd up
```

**Hva som skjer** (tar 8-12 minutter):
1. Oppretter Container Apps-miljø
2. Oppretter Application Insights for overvåking
3. Bygger API Gateway-container (Node.js)
4. Bygger Product Service-container (Python)
5. Distribuerer begge containere til Azure
6. Konfigurerer nettverk og helsesjekker
7. Setter opp overvåking og logging

**✓ Suksesssjekk**: Du bør se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tid**: 8-12 minutter

### Trinn 5: Test distribusjonen

```bash
# Hent gateway-endepunktet
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Test API Gateway-helse
curl $GATEWAY_URL/health

# Forventet utdata:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test produkt-tjenesten gjennom gateway**:
```bash
# Liste produkter
curl $GATEWAY_URL/api/products

# Forventet utdata:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Suksesssjekk**: Begge endepunkter returnerer JSON-data uten feil.

---

**🎉 Gratulerer!** Du har distribuert en mikroservicearkitektur til Azure!

## Prosjektstruktur

Alle implementasjonsfiler er inkludert – dette er et komplett, fungerende eksempel:

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

**Hva hver komponent gjør:**

**Infrastruktur (infra/)**:
- `main.bicep`: Orkestrerer alle Azure-ressurser og avhengigheter
- `core/container-apps-environment.bicep`: Oppretter Container Apps-miljø og Azure Container Registry
- `core/monitor.bicep`: Setter opp Application Insights for distribuert logging
- `app/*.bicep`: Definisjoner for individuelle container-apper med skalering og helsesjekker

**API Gateway (src/api-gateway/)**:
- Offentlig tjeneste som ruter forespørsler til backend-tjenester
- Implementerer logging, feilhåndtering og videresending av forespørsler
- Demonstrerer tjeneste-til-tjeneste HTTP-kommunikasjon

**Produktenhet (src/product-service/)**:
- Intern tjeneste med produktkatalog (in-memory for enkelhets skyld)
- REST API med helsesjekker
- Eksempel på backend-mikrotjenestemønster

## Oversikt over tjenester

### API Gateway (Node.js/Express)

**Port**: 8080  
**Tilgang**: Offentlig (ekstern innlasting)  
**Formål**: Ruter innkommende forespørsler til riktig backend-tjeneste  

**Endepunkt**:
- `GET /` - Tjenesteinformasjon
- `GET /health` - Helsesjekk-endepunkt
- `GET /api/products` - Videresend til produkt-tjeneste (liste alle)
- `GET /api/products/:id` - Videresend til produkt-tjeneste (hent etter ID)

**Nøkkelfunksjoner**:
- Forespørselsruting med axios
- Sentralisert logging
- Feilhåndtering og timeout-styring
- Tjenesteoppdagelse via miljøvariabler
- Integrasjon av Application Insights

**Kodeeksempel** (`src/api-gateway/app.js`):
```javascript
// Intern tjenestekommunikasjon
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Produkt-tjeneste (Python/Flask)

**Port**: 8000  
**Tilgang**: Kun internt (ingen ekstern innlasting)  
**Formål**: Administrerer produktkatalog med in-memory data  

**Endepunkt**:
- `GET /` - Tjenesteinformasjon
- `GET /health` - Helsesjekk-endepunkt
- `GET /products` - Liste alle produkter
- `GET /products/<id>` - Hent produkt etter ID

**Nøkkelfunksjoner**:
- RESTful API med Flask
- In-memory produktlager (enkelt, ingen database nødvendig)
- Helsesjekk med probes
- Strukturert logging
- Integrasjon med Application Insights

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

**Hvorfor kun internt?**  
Produkt-tjenesten eksponeres ikke offentlig. Alle forespørsler må gå via API Gateway, som tilbyr:
- Sikkerhet: Kontrollert tilgangspunkt
- Fleksibilitet: Kan endre backend uten å påvirke klienter
- Overvåking: Sentralisert forespørselslogging

## Forstå tjenestekommunikasjon

### Hvordan tjenester kommuniserer

I dette eksemplet kommuniserer API Gateway med Produkt-tjenesten via **interne HTTP-kall**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Lag intern HTTP-forespørsel
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Nøkkelpunkter**:

1. **DNS-basert oppdagelse**: Container Apps gir automatisk DNS for interne tjenester  
   - Produkt-tjenestens FQDN: `product-service.internal.<environment>.azurecontainerapps.io`  
   - Forenklet: `http://product-service` (løses av Container Apps)

2. **Ingen offentlig eksponering**: Produkt-tjenesten har `external: false` i Bicep  
   - Kun tilgjengelig i Container Apps-miljøet  
   - Kan ikke nås fra internett

3. **Miljøvariabler**: Tjeneste-URL-er settes inn ved distribusjonstidspunktet  
   - Bicep sender den interne FQDN til gatewayen  
   - Ingen hardkodede URL-er i applikasjonskoden

**Analogien**: Tenk på dette som kontorrom. API Gateway er resepsjonen (offentlig), og produkt-tjenesten er et internt kontor. Besøkende må gå gjennom resepsjonen for å nå kontoret.

## Distribusjonsalternativer

### Full distribusjon (anbefalt)

```bash
# Distribuer infrastruktur og begge tjenester
azd up
```

Dette distribuerer:
1. Container Apps-miljø  
2. Application Insights  
3. Container Registry  
4. API Gateway-container  
5. Produkt-tjeneste-container  

**Tid**: 8-12 minutter

### Distribuer individuell tjeneste

```bash
# Distribuer kun én tjeneste (etter første azd opp)
azd deploy api-gateway

# Eller distribuer produkttjeneste
azd deploy product-service
```

**Brukstilfelle**: Når du har oppdatert kode i en tjeneste og ønsker å distribuere kun den tjenesten.

### Oppdater konfigurasjon

```bash
# Endre skaleringsparametere
azd env set GATEWAY_MAX_REPLICAS 30

# Distribuer på nytt med ny konfigurasjon
azd up
```

## Konfigurasjon

### Skalering

Begge tjenester er konfigurert med HTTP-basert autoskalering i sine Bicep-filer:

**API Gateway**:
- Minste replikaer: 2 (alltid minst 2 for tilgjengelighet)
- Maks replikaer: 20
- Skaleringsutløser: 50 samtidige forespørsler per replika

**Produkt-tjeneste**:
- Minste replikaer: 1 (kan skaleres til null hvis nødvendig)
- Maks replikaer: 10
- Skaleringsutløser: 100 samtidige forespørsler per replika

**Tilpass skalering** (i `infra/app/*.bicep`):
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

### Ressursallokering

**API Gateway**:
- CPU: 1.0 vCPU
- Minne: 2 GiB
- Begrunnelse: Håndterer all ekstern trafikk

**Produkt-tjeneste**:
- CPU: 0.5 vCPU
- Minne: 1 GiB
- Begrunnelse: Lettvekts in-memory-operasjoner

### Helsesjekker

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

**Hva dette betyr**:
- **Liveness**: Hvis helsesjekk feiler, starter Container Apps containeren på nytt  
- **Readiness**: Hvis ikke klar, stopper Container Apps å rute trafikk til den replikaen

## Overvåking og observabilitet

### Se tjenesteloggene

```bash
# Vis logger med azd monitor
azd monitor --logs

# Eller bruk Azure CLI for spesifikke Container Apps:
# Strøm logger fra API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Se nylige logger for produktservice
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Forventet output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights-spørringer

Gå til Application Insights i Azure-portalen, og kjør disse spørringene:

**Finn langsomme forespørsler**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Følg tjeneste-til-tjeneste-kall**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Feilrate per tjeneste**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Forespørselsvolum over tid**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Tilgang til overvåkingsdashbord

```bash
# Hent detaljer for Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Åpne Azure Portal overvåking
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live-metrikker

1. Naviger til Application Insights i Azure-portalen  
2. Klikk på "Live Metrics"  
3. Se sanntidsforespørsler, feil og ytelse  
4. Test ved å kjøre: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiske øvelser

[Merk: Se fullstendige øvelser ovenfor i seksjonen "Practical Exercises" for detaljerte steg-for-steg øvelser inkludert distribusjonsverifisering, datamodifisering, autoskaleringstester, feilhåndtering, og å legge til en tredje tjeneste.]

## Kostnadsanalyse

### Estimerte månedlige kostnader (for dette 2-tjeneste-eksemplet)

| Ressurs | Konfigurasjon | Estimert kostnad |
|----------|--------------|----------------|
| API Gateway | 2-20 replikaer, 1 vCPU, 2GB RAM | $30-150 |
| Produkt-tjeneste | 1-10 replikaer, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basisnivå | $5 |
| Application Insights | 1-2 GB/måned | $5-10 |
| Log Analytics | 1 GB/måned | $3 |
| **Totalt** | | **$58-243/måned** |

**Kostnadsfordeling etter bruk**:  
- **Lett trafikk** (testing/læring): ~60 USD/måned  
- **Moderat trafikk** (liten produksjon): ~120 USD/måned  
- **Høy trafikk** (travle perioder): ~240 USD/måned  

### Kostnadsoptimaliseringstips

1. **Skaler til null under utvikling**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Bruk forbruksplan for Cosmos DB** (når du legger til det):  
   - Betal bare for det du bruker  
   - Ingen minimumsavgift  

3. **Sett sampling i Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Prøve 50 % av forespørsler
   ```

4. **Rydd opp når det ikke er behov**:
   ```bash
   azd down
   ```

### Gratisnivå-alternativer
For læring/testing, vurder:
- Bruk Azure gratis kreditter (første 30 dager)
- Hold minimum antall replikaer
- Slett etter testing (ingen løpende kostnader)

---

## Rydding

For å unngå løpende kostnader, slett alle ressurser:

```bash
azd down --force --purge
```

**Bekreftelsesspørsmål**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Skriv `y` for å bekrefte.

**Hva blir slettet**:
- Container Apps Environment
- Begge Container Apps (gateway & produktjeneste)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verifiser rydding**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Bør returnere tomt.

---

## Utvidelsesguide: Fra 2 til 5+ tjenester

Når du har mestret denne 2-tjenesters arkitekturen, her er hvordan du utvider:

### Fase 1: Legg til Databasepersistens (Neste steg)

**Legg til Cosmos DB for produktjeneste**:

1. Opprett `infra/core/cosmos.bicep`:
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

2. Oppdater produktjenesten til å bruke Cosmos DB i stedet for minnebasert data

3. Anslått ekstra kostnad: ~25 USD/måned (serverless)

### Fase 2: Legg til Tredje Tjeneste (Ordrehåndtering)

**Opprett Ordretjeneste**:

1. Ny mappe: `src/order-service/` (Python/Node.js/C#)
2. Ny Bicep: `infra/app/order-service.bicep`
3. Oppdater API Gateway til å rute `/api/orders`
4. Legg til Azure SQL Database for ordrepersistens

**Arkitekturen blir**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Legg til Asynkron Kommunikasjon (Service Bus)

**Implementer Event-Driven Arkitektur**:

1. Legg til Azure Service Bus: `infra/core/servicebus.bicep`
2. Produktjeneste publiserer "ProductCreated" hendelser
3. Ordretjeneste abonnerer på produktevents
4. Legg til Notifikasjonstjeneste for å behandle hendelser

**Mønster**: Forespørsel/Svar (HTTP) + Event-Driven (Service Bus)

### Fase 4: Legg til Brukerautentisering

**Implementer Brukertjeneste**:

1. Opprett `src/user-service/` (Go/Node.js)
2. Legg til Azure AD B2C eller tilpasset JWT autentisering
3. API Gateway validerer token
4. Tjenester sjekker brukerrettigheter

### Fase 5: Produksjonsklarhet

**Legg til Disse Komponentene**:
- Azure Front Door (global lastbalansering)
- Azure Key Vault (hemmelighetshåndtering)
- Azure Monitor Workbooks (tilpassede dashboards)
- CI/CD pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for alle tjenester

**Full produksjonsarkitektur kostnad**: ~300-1400 USD/måned

---

## Lær mer

### Relatert dokumentasjon
- [Azure Container Apps Dokumentasjon](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Arkitekturguide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distribuert Sporing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Neste steg i dette kurset
- ← Forrige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Nybegynner enkelt container eksempel
- → Neste: [AI Integrasjonsguide](../../../../../examples/docs/ai-foundry) - Legg til AI-funksjonalitet
- 🏠 [Kurs Hjem](../../README.md)

### Sammenligning: Når bruke hva

**Enkelt Container App** (enkelt Flask API eksempel):
- ✅ Enkle applikasjoner
- ✅ Monolitisk arkitektur
- ✅ Rask å deployere
- ❌ Begrenset skalerbarhet
- **Kostnad**: ~15-50 USD/måned

**Microservices** (dette eksempelet):
- ✅ Komplekse applikasjoner
- ✅ Uavhengig skalering per tjeneste
- ✅ Teamautonomi (forskjellige tjenester, forskjellige team)
- ❌ Mer komplekst å administrere
- **Kostnad**: ~60-250 USD/måned

**Kubernetes (AKS)**:
- ✅ Maksimal kontroll og fleksibilitet
- ✅ Multi-cloud portabilitet
- ✅ Avansert nettverksadministrasjon
- ❌ Krever Kubernetes-ekspertise
- **Kostnad**: Minimum ~150-500 USD/måned

**Anbefaling**: Start med Container Apps (dette eksemplet), gå til AKS kun hvis du trenger Kubernetes-spesifikke funksjoner.

---

## Ofte Stilte Spørsmål

**Q: Hvorfor bare 2 tjenester i stedet for 5+?**  
A: Utdanningsmessig progresjon. Mestre grunnleggende (tjenestekommunikasjon, overvåking, skalering) med et enkelt eksempel før kompleksitet legges til. Mønstrene du lærer her gjelder for 100-tjenesters arkitekturer.

**Q: Kan jeg legge til flere tjenester selv?**  
A: Absolutt! Følg utvidelsesguiden ovenfor. Hver ny tjeneste følger samme mønster: opprett src-mappe, opprett Bicep-fil, oppdater azure.yaml, deploy.

**Q: Er dette produksjonsklart?**  
A: Det er et solid fundament. For produksjon, legg til: managed identity, Key Vault, persistente databaser, CI/CD pipeline, overvåkingsvarsler, og backup-strategi.

**Q: Hvorfor ikke bruke Dapr eller annen servicemesh?**  
A: Hold det enkelt for læring. Når du forstår native Container Apps nettverk, kan du legge til Dapr for avanserte scenarier.

**Q: Hvordan feilsøker jeg lokalt?**  
A: Kjør tjenester lokalt med Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Kan jeg bruke forskjellige programmeringsspråk?**  
A: Ja! Dette eksemplet viser Node.js (gateway) + Python (produkt-tjeneste). Du kan mixe hvilke som helst språk som kjører i containere.

**Q: Hva om jeg ikke har Azure-kreditter?**  
A: Bruk Azure gratisnivå (første 30 dager med nye kontoer) eller deploy for korte testperioder og slett umiddelbart.

---

> **🎓 Oppsummering av læringsvei**: Du har lært å deployere en fler-tjenesters arkitektur med automatisk skalering, intern nettverkskommunikasjon, sentral overvåking og produksjonsklare mønstre. Dette fundamentet forbereder deg for komplekse distribuerte systemer og enterprise microservices-arkitekturer.

**📚 Kursnavigasjon:**
- ← Forrige: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Neste: [Database Integrasjons Eksempel](../../../../../examples/database-app)
- 🏠 [Kurs Hjem](../../../README.md)
- 📖 [Container Apps Beste Praksis](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->