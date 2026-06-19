# Simple Flask API - Container App Eksempel

**Læringssti:** Begynder ⭐ | **Tid:** 25-35 minutter | **Pris:** $0-15/måned

En komplet, fungerende Python Flask REST-API udrullet til Azure Container Apps ved hjælp af Azure Developer CLI (azd). Dette eksempel demonstrerer containerudrulning, autoskalering og grundlæggende overvågning.

## 🎯 Hvad du lærer

- Udrul en containeriseret Python-applikation til Azure
- Konfigurer autoskalering med scale-to-zero
- Implementer sundhedsprober og readiness-tjek
- Overvåg applikationens logfiler og målinger
- Brug Azure Developer CLI til hurtig udrulning

## 📦 Hvad er inkluderet

✅ **Flask-applikation** - Fuldstændig REST-API med CRUD-operationer (`src/app.py`)  
✅ **Dockerfile** - Produktionsklar containerkonfiguration  
✅ **Bicep-infrastruktur** - Container Apps-miljø og API-udrulning  
✅ **AZD-konfiguration** - Opsætning til udrulning med én kommando  
✅ **Sundhedsprober** - Liveness- og readiness-tjek konfigureret  
✅ **Autoskalering** - 0-10 replikaer baseret på HTTP-trafik  

## Arkitektur

```mermaid
graph TD
    subgraph ACA[Azure Container Apps-miljø]
        Flask[Flask API-container<br/>Sundhedsendepunkter<br/>REST API<br/>Autoskalering 0-10 replikaer]
        AppInsights[Application Insights]
    end
```

## Forudsætninger

### Påkrævet
- **Azure Developer CLI (azd)** - [Installationsvejledning](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** - [Gratis konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installer Docker](https://www.docker.com/products/docker-desktop/) (til lokal test)

### Bekræft forudsætninger

```bash
# Kontroller azd-version (kræver 1.5.0 eller nyere)
azd version

# Bekræft Azure-login
azd auth login

# Kontroller Docker (valgfrit, til lokal test)
docker --version
```

## ⏱️ Tidslinje for udrulning

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Hurtigstart

```bash
# Naviger til eksemplet
cd examples/container-app/simple-flask-api

# Initialiser miljøet (vælg et unikt navn)
azd env new myflaskapi

# Udrul alt (infrastruktur + applikation)
azd up
# Du bliver bedt om at:
# 1. Vælg Azure-abonnement
# 2. Vælg placering (f.eks. eastus2)
# 3. Vent 8-12 minutter på udrulningen

# Hent dit API-endpoint
azd env get-values

# Test API'en
curl $(azd env get-value API_ENDPOINT)/health
```

**Forventet output:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Bekræft udrulning

### Trin 1: Tjek udrulningsstatus

```bash
# Vis udrullede tjenester
azd show

# Forventet output viser:
# - Tjeneste: api
# - Endepunkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Kører
```

### Trin 2: Test API-endpoints

```bash
# Hent API-endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Test sundhed
curl $API_URL/health

# Test rod-endpoint
curl $API_URL/

# Opret en vare
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hent alle varer
curl $API_URL/api/items
```

**Succeskriterier:**
- ✅ Sundheds-endpoint returnerer HTTP 200
- ✅ Root-endpoint viser API-oplysninger
- ✅ POST opretter element og returnerer HTTP 201
- ✅ GET returnerer oprettede elementer

### Trin 3: Se logfiler

```bash
# Se live-logfiler med azd monitor
azd monitor --logs

# Eller brug Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Du bør se:
# - Gunicorn-opstartsmeddelelser
# - HTTP-anmodningslogfiler
# - Applikationsinformationslogfiler
```

## Projektstruktur

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

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Sundhedstjek |
| `/api/items` | GET | List alle elementer |
| `/api/items` | POST | Opret nyt element |
| `/api/items/{id}` | GET | Hent specifikt element |
| `/api/items/{id}` | PUT | Opdater element |
| `/api/items/{id}` | DELETE | Slet element |

## Konfiguration

### Miljøvariabler

```bash
# Angiv brugerdefineret konfiguration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skaleringskonfiguration

API'en skalerer automatisk baseret på HTTP-trafik:
- **Min Replicas**: 0 (skalerer til nul når inaktiv)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Udvikling

### Kør lokalt

```bash
# Installer afhængigheder
cd src
pip install -r requirements.txt

# Kør appen
python app.py

# Test lokalt
curl http://localhost:8000/health
```

### Byg og test container

```bash
# Byg Docker-billede
docker build -t flask-api:local ./src

# Kør containeren lokalt
docker run -p 8000:8000 flask-api:local

# Test containeren
curl http://localhost:8000/health
```

## Udrulning

### Fuld udrulning

```bash
# Udrul infrastruktur og applikation
azd up
```

### Kun kode-udrulning

```bash
# Udrul kun applikationskode (infrastrukturen uændret)
azd deploy api
```

### Opdater konfiguration

```bash
# Opdater miljøvariabler
azd env set API_KEY "new-api-key"

# Genudrul med ny konfiguration
azd deploy api
```

## Overvågning

### Se logfiler

```bash
# Stream live-logfiler med azd monitor
azd monitor --logs

# Eller brug Azure CLI til Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Vis de sidste 100 linjer
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Overvåg målinger

```bash
# Åbn Azure Monitor-dashboard
azd monitor --overview

# Vis specifikke målinger
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Test

### Sundhedscheck

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Forventet svar:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Opret element

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Hent alle elementer

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Omkostningsoptimering

Denne udrulning bruger scale-to-zero, så du betaler kun, når API'en behandler forespørgsler:

- **Inaktiv pris**: ~$0/måned (skaleret til nul)
- **Aktiv omkostning**: ~$0.000024/sekund per replika
- **Forventet månedlig omkostning** (let brug): $5-15

### Reducer omkostninger yderligere

```bash
# Reducer maks. antal replikaer for dev
azd env set MAX_REPLICAS 3

# Brug kortere tomgangstimeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutter
```

## Fejlfinding

### Container starter ikke

```bash
# Kontroller containerlogfiler ved hjælp af Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Bekræft, at Docker-billedet bygges lokalt
docker build -t test ./src
```

### API ikke tilgængelig

```bash
# Bekræft, at ingress er ekstern
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Høje svartider

```bash
# Kontroller CPU- og hukommelsesforbrug
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skaler ressourcerne op om nødvendigt
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Oprydning

```bash
# Slet alle ressourcer
azd down --force --purge
```

## Næste skridt

### Udvid dette eksempel

1. **Tilføj database** - Integrer Azure Cosmos DB eller SQL Database
   ```bash
   # Tilføj Cosmos DB-modul til infra/main.bicep
   # Opdater app.py med databaseforbindelse
   ```

2. **Tilføj autentificering** - Implementer Microsoft Entra ID eller API-nøgler
   ```python
   # Tilføj autentificeringsmiddleware til app.py
   from functools import wraps
   ```

3. **Opsæt CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Tilføj Managed Identity** - Sikre adgang til Azure-tjenester
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Relaterede eksempler

- **[Database-app](../../../../../examples/database-app)** - Fuldstændigt eksempel med SQL-database
- **[Mikrotjenester](../../../../../examples/container-app/microservices)** - Arkitektur med flere services
- **[Container Apps Master Guide](../README.md)** - Alle container-mønstre

### Læringsressourcer

- 📚 [AZD For Beginners Course](../../../README.md) - Kursusets hovedside
- 📚 [Container Apps Patterns](../README.md) - Flere udrulningsmønstre
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Skabeloner fra fællesskabet

## Yderligere ressourcer

### Dokumentation
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Vejledning til Flask-rammeværket
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiel Azure-dokumentation
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd kommando-reference

### Vejledninger
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Udrul din første app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Guide til Python-udvikling
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur som kode

### Værktøjer
- **[Azure Portal](https://portal.azure.com)** - Administrer ressourcer visuelt
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integration

---

**🎉 Tillykke!** Du har udrullet en produktionsklar Flask-API til Azure Container Apps med autoskalering og overvågning.

**Spørgsmål?** [Opret en issue](https://github.com/microsoft/AZD-for-beginners/issues) eller tjek [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->