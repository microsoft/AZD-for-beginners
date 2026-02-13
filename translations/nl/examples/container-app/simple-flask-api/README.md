# Eenvoudige Flask-API - Container App Voorbeeld

**Leerpad:** Beginner ⭐ | **Tijd:** 25-35 minuten | **Kosten:** $0-15/month

Een complete, werkende Python Flask REST API gedeployed naar Azure Container Apps met behulp van Azure Developer CLI (azd). Dit voorbeeld laat containerdeployment, autoscaling en basis monitoring zien.

## 🎯 Wat Je Leert

- Deploy een gecontaineriseerde Python-app naar Azure
- Configureer autoscaling met schalen-naar-nul
- Implementeer health probes en readiness checks
- Monitor applicatielogs en metrics
- Gebruik Azure Developer CLI voor snelle deployment

## 📦 Wat Inbegrepen Is

✅ **Flask Application** - Complete REST API met CRUD-operaties (`src/app.py`)  
✅ **Dockerfile** - Productieklare containerconfiguratie  
✅ **Bicep Infrastructure** - Container Apps-omgeving en API-deployment  
✅ **AZD Configuration** - One-command deployment setup  
✅ **Health Probes** - Liveness en readiness checks geconfigureerd  
✅ **Auto-scaling** - 0-10 replicas op basis van HTTP-load  

## Architecture

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
- **Azure subscription** - [Gratis account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installeer Docker](https://www.docker.com/products/docker-desktop/) (voor lokaal testen)

### Controleer vereisten

```bash
# Controleer de azd-versie (vereist 1.5.0 of hoger)
azd version

# Controleer Azure-aanmelding
azd auth login

# Controleer Docker (optioneel, voor lokaal testen)
docker --version
```

## ⏱️ Deployment Tijdlijn

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Snel aan de slag

```bash
# Navigeer naar het voorbeeld
cd examples/container-app/simple-flask-api

# Initialiseer de omgeving (kies een unieke naam)
azd env new myflaskapi

# Implementeer alles (infrastructuur + applicatie)
azd up
# Je wordt gevraagd om:
# 1. Selecteer een Azure-abonnement
# 2. Kies locatie (bijv. eastus2)
# 3. Wacht 8-12 minuten op de implementatie

# Haal je API-endpoint op
azd env get-values

# Test de API
curl $(azd env get-value API_ENDPOINT)/health
```

**Verwachte uitvoer:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Controleer implementatie

### Stap 1: Controleer implementatiestatus

```bash
# Bekijk geïmplementeerde services
azd show

# Verwachte uitvoer toont:
# - Service: api
# - Eindpunt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Actief
```

### Stap 2: Test API-eindpunten

```bash
# API-endpoint ophalen
API_URL=$(azd env get-value API_ENDPOINT)

# Gezondheid testen
curl $API_URL/health

# Root-endpoint testen
curl $API_URL/

# Een item aanmaken
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Alle items ophalen
curl $API_URL/api/items
```

**Succescriteria:**
- ✅ Health-endpoint geeft HTTP 200 terug
- ✅ Root-endpoint toont API-informatie
- ✅ POST maakt item aan en retourneert HTTP 201
- ✅ GET retourneert aangemaakte items

### Stap 3: Bekijk logs

```bash
# Stream live-logboeken met azd monitor
azd monitor --logs

# Of gebruik de Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# U zou het volgende moeten zien:
# - Gunicorn-opstartmeldingen
# - HTTP-aanvraaglogboeken
# - Applicatie-informatielogboeken
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

## API-eindpunten

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Health-check |
| `/api/items` | GET | Geef alle items weer |
| `/api/items` | POST | Maak nieuw item aan |
| `/api/items/{id}` | GET | Haal specifiek item op |
| `/api/items/{id}` | PUT | Werk item bij |
| `/api/items/{id}` | DELETE | Verwijder item |

## Configuratie

### Omgevingsvariabelen

```bash
# Stel aangepaste configuratie in
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Schaalconfiguratie

De API schaalt automatisch op basis van HTTP-verkeer:
- **Min Replicas**: 0 (schaalt naar nul wanneer inactief)
- **Max Replicas**: 10
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
# Bouw Docker-image
docker build -t flask-api:local ./src

# Draai container lokaal
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Implementatie

### Volledige implementatie

```bash
# Implementeer infrastructuur en applicatie
azd up
```

### Alleen code-implementatie

```bash
# Rol alleen applicatiecode uit (infrastructuur ongewijzigd)
azd deploy api
```

### Configuratie bijwerken

```bash
# Werk omgevingsvariabelen bij
azd env set API_KEY "new-api-key"

# Rol opnieuw uit met nieuwe configuratie
azd deploy api
```

## Monitoring

### Bekijk logs

```bash
# Live logs streamen met azd monitor
azd monitor --logs

# Of gebruik de Azure CLI voor Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Bekijk de laatste 100 regels
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitoren van statistieken

```bash
# Open het Azure Monitor-dashboard
azd monitor --overview

# Bekijk specifieke meetwaarden
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testen

### Health-check

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

Deze deployment gebruikt schalen-naar-nul, dus je betaalt alleen wanneer de API verzoeken verwerkt:

- **Kosten tijdens inactiviteit**: ~$0/month (geschaald naar nul)
- **Actieve kosten**: ~$0.000024/second per replica
- **Verwachte maandelijkse kosten** (licht gebruik): $5-15

### Kosten verder verlagen

```bash
# Verlaag het maximale aantal replica's voor dev
azd env set MAX_REPLICAS 3

# Gebruik een kortere idle-timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuten
```

## Probleemoplossing

### Container start niet

```bash
# Controleer containerlogs met de Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Controleer of Docker-images lokaal worden gebouwd
docker build -t test ./src
```

### API niet toegankelijk

```bash
# Controleer of ingress extern is
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Hoge responstijden

```bash
# Controleer CPU- en geheugengebruik
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

1. **Database toevoegen** - Integreer Azure Cosmos DB of SQL Database
   ```bash
   # Voeg Cosmos DB-module toe aan infra/main.bicep
   # Werk app.py bij met databaseverbinding
   ```

2. **Authenticatie toevoegen** - Implementeer Azure AD of API-sleutels
   ```python
   # Voeg authenticatie-middleware toe aan app.py
   from functools import wraps
   ```

3. **CI/CD opzetten** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity toevoegen** - Beveilig toegang tot Azure-services
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Gerelateerde voorbeelden

- **[Database App](../../../../../examples/database-app)** - Volledig voorbeeld met SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Architectuur met meerdere services
- **[Container Apps Master Guide](../README.md)** - Alle containerpatronen

### Leermaterialen

- 📚 [AZD For Beginners Course](../../../README.md) - Hoofdpagina van de cursus
- 📚 [Container Apps Patterns](../README.md) - Meer implementatiepatronen
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Templates van de community

## Aanvullende bronnen

### Documentatie
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Gids voor het Flask-framework
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiële Azure-documentatie
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd commando-referentie

### Handleidingen
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Deploy je eerste app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Handleiding voor Python-ontwikkeling
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructuur als code

### Tools
- **[Azure Portal](https://portal.azure.com)** - Beheer resources visueel
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integratie

---

**🎉 Gefeliciteerd!** Je hebt een productieklare Flask-API naar Azure Container Apps gedeployed met autoscaling en monitoring.

**Vragen?** [Open een issue](https://github.com/microsoft/AZD-for-beginners/issues) of bekijk de [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal geldt als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->