# Eenvoudige Flask API - Voorbeeld van een Container App

**Leerpad:** Beginner ⭐ | **Tijd:** 25-35 minuten | **Kosten:** €0-15/maand

Een complete, werkende Python Flask REST API, gedeployed naar Azure Container Apps met behulp van Azure Developer CLI (azd). Dit voorbeeld demonstreert containerdeployment, autoscaling en basisprincipes van monitoring.

## 🎯 Wat je gaat leren

- Een containerized Python-applicatie deployen naar Azure
- Autoscaling configureren met scale-to-zero
- Gezondheidscontroles en readiness checks implementeren
- Applicatielogs en metrics monitoren
- Azure Developer CLI gebruiken voor snelle deployment

## 📦 Wat is inbegrepen

✅ **Flask Applicatie** - Complete REST API met CRUD-operaties (`src/app.py`)  
✅ **Dockerfile** - Productieklaar containerconfiguratie  
✅ **Bicep Infrastructuur** - Container Apps omgeving en API-deployment  
✅ **AZD Configuratie** - Eén-commando deployment setup  
✅ **Gezondheidscontroles** - Liveness en readiness checks geconfigureerd  
✅ **Autoscaling** - 0-10 replicas gebaseerd op HTTP-belasting  

## Architectuur

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Vereisten

### Vereist
- **Azure Developer CLI (azd)** - [Installatiegids](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** - [Gratis account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker installeren](https://www.docker.com/products/docker-desktop/) (voor lokaal testen)

### Controleer vereisten

```bash
# Controleer azd-versie (minimaal 1.5.0 vereist)
azd version

# Verifieer Azure-login
azd auth login

# Controleer Docker (optioneel, voor lokaal testen)
docker --version
```

## ⏱️ Deployment Tijdlijn

| Fase | Duur | Wat gebeurt er |
|------|------|----------------||
| Omgevingssetup | 30 seconden | Maak azd-omgeving |
| Container bouwen | 2-3 minuten | Docker bouwt Flask-app |
| Infrastructuur provisioneren | 3-5 minuten | Maak Container Apps, registry, monitoring |
| Applicatie deployen | 2-3 minuten | Push image en deploy naar Container Apps |
| **Totaal** | **8-12 minuten** | Volledige deployment gereed |

## Snelstart

```bash
# Navigeer naar het voorbeeld
cd examples/container-app/simple-flask-api

# Initialiseer omgeving (kies unieke naam)
azd env new myflaskapi

# Implementeer alles (infrastructuur + applicatie)
azd up
# Je wordt gevraagd om:
# 1. Selecteer Azure-abonnement
# 2. Kies locatie (bijv. eastus2)
# 3. Wacht 8-12 minuten op implementatie

# Haal je API-eindpunt op
azd env get-values

# Test de API
curl $(azd env get-value API_ENDPOINT)/health
```

**Verwachte output:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Deployment verifiëren

### Stap 1: Controleer deploymentstatus

```bash
# Bekijk geïmplementeerde services
azd show

# Verwachte output toont:
# - Service: api
# - Eindpunt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Actief
```

### Stap 2: Test API-endpoints

```bash
# Haal API-eindpunt op
API_URL=$(azd env get-value API_ENDPOINT)

# Test gezondheid
curl $API_URL/health

# Test root-eindpunt
curl $API_URL/

# Maak een item aan
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Haal alle items op
curl $API_URL/api/items
```

**Succescriteria:**
- ✅ Health endpoint retourneert HTTP 200
- ✅ Root endpoint toont API-informatie
- ✅ POST maakt item aan en retourneert HTTP 201
- ✅ GET retourneert aangemaakte items

### Stap 3: Bekijk logs

```bash
# Stream live logs
azd logs api --follow

# Je zou moeten zien:
# - Gunicorn opstartberichten
# - HTTP-verzoeklogs
# - Applicatie-informatielogs
```

## Projectstructuur

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API-endpoints

| Endpoint | Methode | Beschrijving |
|----------|---------|--------------|
| `/health` | GET | Gezondheidscontrole |
| `/api/items` | GET | Lijst alle items |
| `/api/items` | POST | Maak nieuw item aan |
| `/api/items/{id}` | GET | Haal specifiek item op |
| `/api/items/{id}` | PUT | Update item |
| `/api/items/{id}` | DELETE | Verwijder item |

## Configuratie

### Omgevingsvariabelen

```bash
# Stel aangepaste configuratie in
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuratie

De API schaalt automatisch op basis van HTTP-verkeer:
- **Minimale replicas**: 0 (schaalt naar nul wanneer inactief)
- **Maximale replicas**: 10
- **Gelijktijdige verzoeken per replica**: 50

## Ontwikkeling

### Lokaal uitvoeren

```bash
# Installeer afhankelijkheden
cd src
pip install -r requirements.txt

# Start de app
python app.py

# Test lokaal
curl http://localhost:8000/health
```

### Container bouwen en testen

```bash
# Bouw Docker-afbeelding
docker build -t flask-api:local ./src

# Container lokaal uitvoeren
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Deployment

### Volledige deployment

```bash
# Implementeer infrastructuur en applicatie
azd up
```

### Alleen code deployen

```bash
# Alleen applicatiecode implementeren (infrastructuur ongewijzigd)
azd deploy api
```

### Configuratie bijwerken

```bash
# Werk omgevingsvariabelen bij
azd env set API_KEY "new-api-key"

# Herdeploy met nieuwe configuratie
azd deploy api
```

## Monitoring

### Logs bekijken

```bash
# Stream live logboeken
azd logs api --follow

# Bekijk de laatste 100 regels
azd logs api --tail 100
```

### Metrics monitoren

```bash
# Open Azure Monitor-dashboard
azd monitor --overview

# Bekijk specifieke statistieken
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testen

### Gezondheidscontrole

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Verwachte respons:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Item aanmaken

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Alle items ophalen

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kostenoptimalisatie

Deze deployment gebruikt scale-to-zero, dus je betaalt alleen wanneer de API verzoeken verwerkt:

- **Idle kosten**: ~€0/maand (schaalt naar nul)
- **Actieve kosten**: ~€0.000024/seconde per replica
- **Verwachte maandelijkse kosten** (lichte belasting): €5-15

### Kosten verder verlagen

```bash
# Schaal max replica's omlaag voor ontwikkeling
azd env set MAX_REPLICAS 3

# Gebruik kortere idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuten
```

## Problemen oplossen

### Container start niet

```bash
# Controleer containerlogs
azd logs api --tail 100

# Verifieer dat Docker-image lokaal wordt gebouwd
docker build -t test ./src
```

### API niet toegankelijk

```bash
# Verifieer dat de ingress extern is
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Hoge responstijden

```bash
# Controleer CPU/geheugengebruik
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Schaal middelen op indien nodig
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Opruimen

```bash
# Verwijder alle bronnen
azd down --force --purge
```

## Volgende stappen

### Breid dit voorbeeld uit

1. **Voeg database toe** - Integreer Azure Cosmos DB of SQL Database
   ```bash
   # Voeg Cosmos DB-module toe aan infra/main.bicep
   # Werk app.py bij met databaseverbinding
   ```

2. **Voeg authenticatie toe** - Implementeer Azure AD of API-sleutels
   ```python
   # Voeg authenticatiemiddleware toe aan app.py
   from functools import wraps
   ```

3. **Stel CI/CD in** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Voeg Managed Identity toe** - Beveilig toegang tot Azure-services
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Gerelateerde voorbeelden

- **[Database App](../../../../../examples/database-app)** - Compleet voorbeeld met SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service architectuur
- **[Container Apps Master Guide](../README.md)** - Alle containerpatronen

### Leerbronnen

- 📚 [AZD Voor Beginners Cursus](../../../README.md) - Hoofdcursus
- 📚 [Container Apps Patronen](../README.md) - Meer deploymentpatronen
- 📚 [AZD Templates Galerij](https://azure.github.io/awesome-azd/) - Community templates

## Aanvullende bronnen

### Documentatie
- **[Flask Documentatie](https://flask.palletsprojects.com/)** - Flask framework gids
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiële Azure documentatie
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd commandoreferentie

### Tutorials
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Deploy je eerste app
- **[Python op Azure](https://learn.microsoft.com/azure/developer/python/)** - Python ontwikkelingsgids
- **[Bicep Taal](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### Tools
- **[Azure Portal](https://portal.azure.com)** - Beheer resources visueel
- **[VS Code Azure Extensie](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integratie

---

**🎉 Gefeliciteerd!** Je hebt een productieklare Flask API gedeployed naar Azure Container Apps met autoscaling en monitoring.

**Vragen?** [Open een issue](https://github.com/microsoft/AZD-for-beginners/issues) of bekijk de [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->