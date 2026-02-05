# Mikrotjenestearkitektur - Eksempel på Container App

⏱️ **Estimert tid**: 25-35 minutter | 💰 **Estimert kostnad**: ~$50-100/måned | ⭐ **Kompleksitet**: Avansert

En **forenklet, men funksjonell** mikrotjenestearkitektur distribuert til Azure Container Apps ved bruk av AZD CLI. Dette eksempelet demonstrerer kommunikasjon mellom tjenester, containerorkestrering og overvåking med en praktisk oppsett av to tjenester.

> **📚 Læringsmetode**: Dette eksempelet starter med en minimal arkitektur med to tjenester (API Gateway + Backend-tjeneste) som du faktisk kan distribuere og lære av. Etter å ha mestret dette grunnlaget, gir vi veiledning for å utvide til et komplett mikrotjenesteøkosystem.

## Hva du vil lære

Ved å fullføre dette eksempelet vil du:
- Distribuere flere containere til Azure Container Apps
- Implementere kommunikasjon mellom tjenester med internt nettverk
- Konfigurere miljøbasert skalering og helsesjekker
- Overvåke distribuerte applikasjoner med Application Insights
- Forstå distribusjonsmønstre og beste praksis for mikrotjenester
- Lære progressiv utvidelse fra enkle til komplekse arkitekturer

## Arkitektur

### Fase 1: Hva vi bygger (inkludert i dette eksempelet)

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
- ✅ Lær grunnleggende mønstre for mikrotjenester uten kompleksitet
- ✅ Fungerende kode du kan modifisere og eksperimentere med
- ✅ Lavere kostnad for læring (~$50-100/måned vs $300-1400/måned)
- ✅ Bygg selvtillit før du legger til databaser og meldingskøer

**Analogien**: Tenk på dette som å lære å kjøre bil. Du starter på en tom parkeringsplass (2 tjenester), mestrer det grunnleggende, og går deretter videre til bytrafikk (5+ tjenester med databaser).

### Fase 2: Fremtidig utvidelse (referansearkitektur)

Når du har mestret arkitekturen med to tjenester, kan du utvide til:

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

Se avsnittet "Utvidelsesveiledning" på slutten for trinnvise instruksjoner.

## Inkluderte funksjoner

✅ **Tjenesteoppdagelse**: Automatisk DNS-basert oppdagelse mellom containere  
✅ **Lastbalansering**: Innebygd lastbalansering på tvers av replikater  
✅ **Autoskalering**: Uavhengig skalering per tjeneste basert på HTTP-forespørsler  
✅ **Helseovervåking**: Liveness- og readiness-prober for begge tjenester  
✅ **Distribuert logging**: Sentralisert logging med Application Insights  
✅ **Internt nettverk**: Sikker kommunikasjon mellom tjenester  
✅ **Containerorkestrering**: Automatisk distribusjon og skalering  
✅ **Oppdateringer uten nedetid**: Rullerende oppdateringer med revisjonshåndtering  

## Forutsetninger

### Nødvendige verktøy

Før du starter, må du kontrollere at du har disse verktøyene installert:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versjon 1.0.0 eller høyere)  
   ```bash
   azd version
   # Forventet output: azd versjon 1.0.0 eller høyere
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versjon 2.50.0 eller høyere)  
   ```bash
   az --version
   # Forventet output: azure-cli 2.50.0 eller høyere
   ```

3. **[Docker](https://www.docker.com/get-started)** (for lokal utvikling/testing - valgfritt)  
   ```bash
   docker --version
   # Forventet output: Docker versjon 20.10 eller høyere
   ```

### Azure-krav

- Et aktivt **Azure-abonnement** ([opprett en gratis konto](https://azure.microsoft.com/free/))
- Tillatelser til å opprette ressurser i abonnementet ditt
- **Bidragsyter**-rolle på abonnementet eller ressursgruppen

### Kunnskapsforutsetninger

Dette er et eksempel på **avansert nivå**. Du bør ha:
- Fullført [Simple Flask API-eksempelet](../../../../../examples/container-app/simple-flask-api) 
- Grunnleggende forståelse av mikrotjenestearkitektur
- Kjennskap til REST API-er og HTTP
- Forståelse av containerkonsepter

**Ny i Container Apps?** Start med [Simple Flask API-eksempelet](../../../../../examples/container-app/simple-flask-api) først for å lære det grunnleggende.

## Hurtigstart (trinnvis)

### Trinn 1: Klon og naviger

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Suksesskontroll**: Kontroller at du ser `azure.yaml`:
```bash
ls
# Forventet: README.md, azure.yaml, infra/, src/
```

### Trinn 2: Autentiser med Azure

```bash
azd auth login
```

Dette åpner nettleseren din for Azure-autentisering. Logg inn med Azure-legitimasjonen din.

**✓ Suksesskontroll**: Du bør se:
```
Logged in to Azure.
```

### Trinn 3: Initialiser miljøet

```bash
azd init
```

**Spørsmål du vil se**:
- **Miljønavn**: Skriv inn et kort navn (f.eks. `microservices-dev`)
- **Azure-abonnement**: Velg abonnementet ditt
- **Azure-plassering**: Velg en region (f.eks. `eastus`, `westeurope`)

**✓ Suksesskontroll**: Du bør se:
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

**✓ Suksesskontroll**: Du bør se:
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

# Forventet output:
# {"status":"frisk","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test produkt-tjenesten via gateway**:
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

**✓ Suksesskontroll**: Begge endepunktene returnerer JSON-data uten feil.

---

**🎉 Gratulerer!** Du har distribuert en mikrotjenestearkitektur til Azure!

## Prosjektstruktur

Alle implementeringsfiler er inkludert—dette er et komplett, fungerende eksempel:

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
- `main.bicep`: Orkestrerer alle Azure-ressurser og deres avhengigheter
- `core/container-apps-environment.bicep`: Oppretter Container Apps-miljøet og Azure Container Registry
- `core/monitor.bicep`: Setter opp Application Insights for distribuert logging
- `app/*.bicep`: Individuelle containerapp-definisjoner med skalering og helsesjekker

**API Gateway (src/api-gateway/)**:
- Offentlig tjeneste som ruter forespørsler til backend-tjenester
- Implementerer logging, feilhåndtering og forespørsel-videresending
- Demonstrerer HTTP-kommunikasjon mellom tjenester

**Product Service (src/product-service/)**:
- Intern tjeneste med produktkatalog (i minnet for enkelhet)
- REST API med helsesjekker
- Eksempel på backend-mikrotjenestemønster

## Tjenesteoversikt

### API Gateway (Node.js/Express)

**Port**: 8080  
**Tilgang**: Offentlig (ekstern ingress)  
**Formål**: Ruter innkommende forespørsler til riktige backend-tjenester  

**Endepunkter**:
- `GET /` - Tjenesteinformasjon
- `GET /health` - Helsesjekk-endepunkt
- `GET /api/products` - Videresender til produkttjenesten (list alle)
- `GET /api/products/:id` - Videresender til produkttjenesten (hent etter ID)

**Nøkkelfunksjoner**:
- Forespørselsruting med axios
- Sentralisert logging
- Feilhåndtering og tidsavbruddshåndtering
- Tjenesteoppdagelse via miljøvariabler
- Integrasjon med Application Insights

**Kodeutdrag** (`src/api-gateway/app.js`):
```javascript
// Intern tjenestekommunikasjon
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Tilgang**: Kun internt (ingen ekstern ingress)  
**Formål**: Administrerer produktkatalog med data i minnet  

**Endepunkter**:
- `GET /` - Tjenesteinformasjon
- `GET /health` - Helsesjekk-endepunkt
- `GET /products` - List alle produkter
- `GET /products/<id>` - Hent produkt etter ID

**Nøkkelfunksjoner**:
- RESTful API med Flask
- Produktlager i minnet (enkelt, ingen database nødvendig)
- Helseovervåking med prober
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
Produkttjenesten er ikke eksponert offentlig. Alle forespørsler må gå gjennom API Gateway, som gir:
- Sikkerhet: Kontrollert tilgangspunkt
- Fleksibilitet: Kan endre backend uten å påvirke klienter
- Overvåking: Sentralisert forespørselslogging

## Forstå tjenestekommunikasjon

### Hvordan tjenester kommuniserer med hverandre

I dette eksempelet kommuniserer API Gateway med Product Service ved bruk av **interne HTTP-kall**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Gjør intern HTTP-forespørsel
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Viktige punkter**:

1. **DNS-basert oppdagelse**: Container Apps gir automatisk DNS for interne tjenester
   - Produkt-tjenestens FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Forenklet som: `http://product-service` (Container Apps løser det)

2. **Ingen offentlig eksponering**: Produkttjenesten har `external: false` i Bicep
   - Kun tilgjengelig innenfor Container Apps-miljøet
   - Kan ikke nås fra internett

3. **Miljøvariabler**: Tjeneste-URL-er injiseres ved distribusjon
   - Bicep sender den interne FQDN til gatewayen
   - Ingen hardkodede URL-er i applikasjonskoden

**Analogien**: Tenk på dette som kontorrom. API Gateway er resepsjonen (offentlig), og Product Service er et kontorrom (kun internt). Besøkende må gå gjennom resepsjonen for å nå et kontor.

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
5. Product Service-container

**Tid**: 8-12 minutter

### Distribuer individuell tjeneste

```bash
# Distribuer kun én tjeneste (etter initial azd up)
azd deploy api-gateway

# Eller distribuer produkttjeneste
azd deploy product-service
```

**Brukstilfelle**: Når du har oppdatert koden i én tjeneste og vil distribuere kun den tjenesten.

### Oppdater konfigurasjon

```bash
# Endre skaleringsparametere
azd env set GATEWAY_MAX_REPLICAS 30

# Gjenopprett med ny konfigurasjon
azd up
```

## Konfigurasjon

### Skalering

Begge tjenestene er konfigurert med HTTP-basert autoskalering i sine Bicep-filer:

**API Gateway**:
- Min replikater: 2 (alltid minst 2 for tilgjengelighet)
- Maks replikater: 20
- Skaleringstrigger: 50 samtidige forespørsler per replika

**Product Service**:
- Min replikater: 1 (kan skalere til null om nødvendig)
- Maks replikater: 10
- Skaleringstrigger: 100 samtidige forespørsler per replika

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

### Ressurstildeling

**API Gateway**:
- CPU: 1.0 vCPU
- Minne: 2 GiB
- Begrunnelse: Håndterer all ekstern trafikk

**Product Service**:
- CPU: 0.5 vCPU
- Minne: 1 GiB
- Begrunnelse: Lettvektsoperasjoner i minnet

### Helsesjekker

Begge tjenestene inkluderer liveness- og readiness-prober:

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
- **Liveness**: Hvis helsesjekken feiler, starter Container Apps containeren på nytt
- **Readiness**: Hvis ikke klar, slutter Container Apps å rute trafikk til den replikaten

## Overvåking og observasjon

### Se tjenestelogger

```bash
# Strøm logger fra API Gateway
azd logs api-gateway --follow

# Vis nylige produktservicelogger
azd logs product-service --tail 100

# Vis alle logger fra begge tjenester
azd logs --follow
```

**Forventet utdata**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights-spørringer

Gå til Application Insights i Azure-portalen, og kjør disse spørringene:

**Finn trege forespørsler**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Spor tjeneste-til-tjeneste-kall**:
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
# Hent detaljer om Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Åpne Azure Portal-overvåking
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Gå til Application Insights i Azure-portalen
2. Klikk på "Live Metrics"
3. Se sanntidsforespørsler, feil og ytelse
4. Test ved å kjøre: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktiske øvelser

[Merk: Se fullstendige øvelser ovenfor i avsnittet "Praktiske øvelser" for detaljerte trinnvise øvelser, inkludert distribusjonsverifisering, datamodifikasjon, autoskaleringstester, feilhåndtering og legge til en tredje tjeneste.]

## Kostnadsanalyse

### Estimerte månedlige kostnader (for dette 2-tjenesteeksempelet)

| Ressurs | Konfigurasjon | Estimert kostnad |
|----------|--------------|----------------|
| API Gateway | 2-20 replikater, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replikater, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Grunnleggende nivå | $5 |
| Application Insights | 1-2 GB/måned | $5-10 |
| Log Analytics | 1 GB/måned | $3 |
| **Totalt** | | **$58-243/måned** |

**Kostnadsfordeling etter bruk**:
- **Lett trafikk** (testing/læring): ~$60/måned
- **Moderat trafikk** (liten produksjon): ~$120/måned
- **Høy trafikk** (travle perioder): ~$240/måned

### Kostnadsoptimaliseringstips

1. **Skaler til null for utvikling**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Bruk forbruksplan for Cosmos DB** (når du legger det til):
   - Betal kun for det du bruker
   - Ingen minimumsavgift

3. **Sett Application Insights-sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Prøv 50% av forespørslene
   ```

4. **Rydd opp når det ikke trengs**:
   ```bash
   azd down
   ```

### Gratisnivåalternativer
For læring/testing, vurder:
- Bruk Azure gratis kreditter (første 30 dager)
- Hold antall replikaer til et minimum
- Slett etter testing (ingen løpende kostnader)

---

## Opprydding

For å unngå løpende kostnader, slett alle ressurser:

```bash
azd down --force --purge
```

**Bekreftelsesprompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Skriv `y` for å bekrefte.

**Hva blir slettet**:
- Container Apps-miljø
- Begge Container Apps (gateway & produkt-tjeneste)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Ressursgruppe

**✓ Verifiser opprydding**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Bør returnere tomt.

---

## Utvidelsesguide: Fra 2 til 5+ tjenester

Når du har mestret denne 2-tjeneste-arkitekturen, slik kan du utvide:

### Fase 1: Legg til databasepersistens (neste steg)

**Legg til Cosmos DB for produkttjenesten**:

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

2. Oppdater produkttjenesten til å bruke Cosmos DB i stedet for in-memory data

3. Anslått tilleggskostnad: ~$25/måned (serverløs)

### Fase 2: Legg til en tredje tjeneste (ordrehåndtering)

**Opprett ordretjeneste**:

1. Ny mappe: `src/order-service/` (Python/Node.js/C#)
2. Ny Bicep: `infra/app/order-service.bicep`
3. Oppdater API Gateway for å rute `/api/orders`
4. Legg til Azure SQL Database for ordre-persistens

**Arkitekturen blir**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Legg til asynkron kommunikasjon (Service Bus)

**Implementer hendelsesdrevet arkitektur**:

1. Legg til Azure Service Bus: `infra/core/servicebus.bicep`
2. Produkttjenesten publiserer "ProductCreated"-hendelser
3. Ordretjenesten abonnerer på produkthendelser
4. Legg til en varslingstjeneste for å behandle hendelser

**Mønster**: Forespørsel/svar (HTTP) + hendelsesdrevet (Service Bus)

### Fase 4: Legg til brukergodkjenning

**Implementer brukertjeneste**:

1. Opprett `src/user-service/` (Go/Node.js)
2. Legg til Azure AD B2C eller tilpasset JWT-autentisering
3. API Gateway validerer tokens
4. Tjenester sjekker brukerrettigheter

### Fase 5: Produksjonsklarhet

**Legg til disse komponentene**:
- Azure Front Door (global lastbalansering)
- Azure Key Vault (hemmelighetshåndtering)
- Azure Monitor Workbooks (tilpassede dashbord)
- CI/CD-pipeline (GitHub Actions)
- Blue-Green-deployeringer
- Managed Identity for alle tjenester

**Full produksjonsarkitektur kostnad**: ~$300-1,400/måned

---

## Lær mer

### Relatert dokumentasjon
- [Azure Container Apps Dokumentasjon](https://learn.microsoft.com/azure/container-apps/)
- [Mikrotjenestearkitekturguide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for distribuert sporing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Neste steg i dette kurset
- ← Forrige: [Enkel Flask API](../../../../../examples/container-app/simple-flask-api) - Nybegynner eksempel med én container
- → Neste: [AI Integrasjonsguide](../../../../../examples/docs/ai-foundry) - Legg til AI-funksjonalitet
- 🏠 [Kursoversikt](../../README.md)

### Sammenligning: Når skal du bruke hva

**Enkel Container App** (Eksempel med enkel Flask API):
- ✅ Enkle applikasjoner
- ✅ Monolitisk arkitektur
- ✅ Rask å distribuere
- ❌ Begrenset skalerbarhet
- **Kostnad**: ~$15-50/måned

**Mikrotjenester** (Dette eksempelet):
- ✅ Komplekse applikasjoner
- ✅ Uavhengig skalering per tjeneste
- ✅ Teamautonomi (forskjellige tjenester, forskjellige team)
- ❌ Mer komplekst å administrere
- **Kostnad**: ~$60-250/måned

**Kubernetes (AKS)**:
- ✅ Maksimal kontroll og fleksibilitet
- ✅ Multi-cloud portabilitet
- ✅ Avansert nettverksfunksjonalitet
- ❌ Krever Kubernetes-ekspertise
- **Kostnad**: ~$150-500/måned minimum

**Anbefaling**: Start med Container Apps (dette eksempelet), gå over til AKS kun hvis du trenger Kubernetes-spesifikke funksjoner.

---

## Ofte stilte spørsmål

**Spørsmål: Hvorfor bare 2 tjenester i stedet for 5+?**  
Svar: Pedagogisk progresjon. Mestre det grunnleggende (tjenestekommunikasjon, overvåking, skalering) med et enkelt eksempel før du legger til kompleksitet. Mønstrene du lærer her gjelder for arkitekturer med 100 tjenester.

**Spørsmål: Kan jeg legge til flere tjenester selv?**  
Svar: Absolutt! Følg utvidelsesguiden ovenfor. Hver nye tjeneste følger samme mønster: opprett src-mappe, opprett Bicep-fil, oppdater azure.yaml, distribuer.

**Spørsmål: Er dette produksjonsklart?**  
Svar: Det er et solid fundament. For produksjon, legg til: administrert identitet, Key Vault, vedvarende databaser, CI/CD-pipeline, overvåkingsvarsler og backup-strategi.

**Spørsmål: Hvorfor ikke bruke Dapr eller andre service mesh?**  
Svar: Hold det enkelt for læring. Når du forstår nettverksfunksjonaliteten til Container Apps, kan du legge til Dapr for avanserte scenarier.

**Spørsmål: Hvordan feilsøker jeg lokalt?**  
Svar: Kjør tjenester lokalt med Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Spørsmål: Kan jeg bruke forskjellige programmeringsspråk?**  
Svar: Ja! Dette eksempelet viser Node.js (gateway) + Python (produkttjeneste). Du kan blande alle språk som kjører i containere.

**Spørsmål: Hva hvis jeg ikke har Azure-kreditter?**  
Svar: Bruk Azure gratisnivå (første 30 dager med nye kontoer) eller distribuer for korte testperioder og slett umiddelbart.

---

> **🎓 Oppsummering av læringssti**: Du har lært å distribuere en arkitektur med flere tjenester med automatisk skalering, intern nettverksfunksjonalitet, sentralisert overvåking og produksjonsklare mønstre. Dette fundamentet forbereder deg på komplekse distribuerte systemer og bedriftsmikrotjenestearkitekturer.

**📚 Kursnavigasjon:**
- ← Forrige: [Enkel Flask API](../../../../../examples/container-app/simple-flask-api)
- → Neste: [Databaseintegrasjonseksempel](../../../../../examples/database-app)
- 🏠 [Kursoversikt](../../README.md)
- 📖 [Container Apps Beste Praksis](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->