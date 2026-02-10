# Simpel Flask API - Container App-eksempel

**Læringsspor:** Begynder ⭐ | **Tid:** 25-35 minutter | **Omkostninger:** $0-15/month

En komplet, fungerende Python Flask REST API udrullet til Azure Container Apps ved brug af Azure Developer CLI (azd). Dette eksempel demonstrerer container-udrulning, autoskalering og grundlæggende overvågning.

## 🎯 Hvad du vil lære

- Udrul en containeriseret Python-applikation til Azure
- Konfigurér autoskalering med scale-to-zero
- Implementér health probes og readiness checks
- Overvåg applikationslogfiler og metrikker
- Brug Azure Developer CLI for hurtig udrulning

## 📦 Hvad der er inkluderet

✅ **Flask Application** - Komplett REST API med CRUD-operationer (`src/app.py`)  
✅ **Dockerfile** - Produktionsklar containerkonfiguration  
✅ **Bicep Infrastructure** - Container Apps-miljø og API-udrulning  
✅ **AZD Configuration** - Én-kommando udrulningsopsætning  
✅ **Health Probes** - Liveness- og readiness-checks konfigureret  
✅ **Auto-scaling** - 0-10 replikaer baseret på HTTP-load  

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

## Prækrævenser

### Krævet
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (til lokal test)

### Bekræft prækrævenser

```bash
# Kontroller azd-version (kræver 1.5.0 eller nyere)
azd version

# Bekræft login til Azure
azd auth login

# Kontroller Docker (valgfrit, til lokal testning)
docker --version
```

## ⏱️ Udrulningstidslinje

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Hurtig start

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

# Hent dit API-endepunkt
azd env get-values

# Test API'et
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

### Trin 1: Kontroller udrulningsstatus

```bash
# Vis udrullede tjenester
azd show

# Forventet output viser:
# - Tjeneste: api
# - Endepunkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Kører
```

### Trin 2: Test API-endepunkter

```bash
# Hent API-endepunkt
API_URL=$(azd env get-value API_ENDPOINT)

# Sundhedstjek
curl $API_URL/health

# Test rod-endepunkt
curl $API_URL/

# Opret et element
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hent alle elementer
curl $API_URL/api/items
```

**Succeskriterier:**
- ✅ Health endpoint returnerer HTTP 200
- ✅ Root endpoint viser API-information
- ✅ POST opretter element og returnerer HTTP 201
- ✅ GET returnerer oprettede elementer

### Trin 3: Se logfiler

```bash
# Stream live-logfiler ved hjælp af azd monitor
azd monitor --logs

# Eller brug Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Du bør se:
# - Gunicorn-opstartsmeddelelser
# - HTTP-anmodningslogfiler
# - Applikationsinfo-logfiler
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

## API-endepunkter

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Sundhedstjek |
| `/api/items` | GET | Vis alle elementer |
| `/api/items` | POST | Opret nyt element |
| `/api/items/{id}` | GET | Hent specifikt element |
| `/api/items/{id}` | PUT | Opdater element |
| `/api/items/{id}` | DELETE | Slet element |

## Konfiguration

### Miljøvariabler

```bash
# Indstil brugerdefineret konfiguration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skaleringskonfiguration

API'en skalerer automatisk baseret på HTTP-trafik:
- **Min. replikaer**: 0 (skaleres til nul når inaktiv)
- **Maks. replikaer**: 10
- **Samtidige forespørgsler pr. replika**: 50

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

# Kør container lokalt
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

### Udrulning kun kode

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
# Strøm live-logfiler ved hjælp af azd monitor
azd monitor --logs

# Eller brug Azure CLI til Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Vis de sidste 100 linjer
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Overvåg metrikker

```bash
# Åbn Azure Monitor-instrumentbræt
azd monitor --overview

# Vis specifikke målinger
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Test

### Sundhedstjek

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

- **Inaktiv omkostning**: ~$0/month (skaleret til nul)
- **Aktiv omkostning**: ~$0.000024/second per replica
- **Forventet månedlig omkostning** (let brug): $5-15

### Reducér omkostninger yderligere

```bash
# Skaler ned det maksimale antal replikaer til udvikling
azd env set MAX_REPLICAS 3

# Brug kortere timeout ved inaktivitet
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutter
```

## Fejlfindelse

### Container starter ikke

```bash
# Kontroller containerlogs ved hjælp af Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Bekræft, at Docker-image kan bygges lokalt
docker build -t test ./src
```

### API'en er ikke tilgængelig

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

# Skaler ressourcerne op, hvis det er nødvendigt
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Ryd op

```bash
# Slet alle ressourcer
azd down --force --purge
```

## Næste skridt

### Udvid dette eksempel

1. **Tilføj database** - Integrér Azure Cosmos DB eller SQL Database
   ```bash
   # Tilføj Cosmos DB-modul til infra/main.bicep
   # Opdater app.py med databaseforbindelse
   ```

2. **Tilføj godkendelse** - Implementér Azure AD eller API-nøgler
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

4. **Tilføj Managed Identity** - Sikr adgang til Azure-tjenester
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Relaterede eksempler

- **[Database-app](../../../../../examples/database-app)** - Fuldt eksempel med SQL Database
- **[Mikrotjenester](../../../../../examples/container-app/microservices)** - Fler-service-arkitektur
- **[Container Apps Master Guide](../README.md)** - Alle container-mønstre

### Læringsressourcer

- 📚 [AZD For Beginners Course](../../../README.md) - Hovedkurset
- 📚 [Container Apps Patterns](../README.md) - Flere udrulningsmønstre
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Community-skabeloner

## Yderligere ressourcer

### Dokumentation
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask-framework guide
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiel Azure-dokumentation
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd kommandoreference

### Vejledninger
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Udrul din første app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python-udviklingsguide
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur som kode

### Værktøjer
- **[Azure Portal](https://portal.azure.com)** - Administrér ressourcer visuelt
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integration

---

**🎉 Tillykke!** Du har udrullet en produktionsklar Flask API til Azure Container Apps med autoskalering og overvågning.

**Spørgsmål?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) eller tjek [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Originaldokumentet på originalsproget bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel, menneskelig oversættelse. Vi kan ikke gøres ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->