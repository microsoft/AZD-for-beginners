# Enkel Flask API - Eksempel på Container App

**Læringssti:** Begynder ⭐ | **Tid:** 25-35 minutter | **Omkostninger:** $0-15/måned

En komplet, fungerende Python Flask REST API, der er udrullet til Azure Container Apps ved hjælp af Azure Developer CLI (azd). Dette eksempel demonstrerer containerudrulning, auto-skalering og grundlæggende overvågning.

## 🎯 Hvad Du Vil Lære

- Udrulle en containeriseret Python-applikation til Azure
- Konfigurere auto-skalering med scale-to-zero
- Implementere sundhedsprober og readiness checks
- Overvåge applikationslogfiler og metrikker
- Bruge Azure Developer CLI til hurtig udrulning

## 📦 Hvad Der Er Inkluderet

✅ **Flask-applikation** - Komplet REST API med CRUD-operationer (`src/app.py`)  
✅ **Dockerfile** - Produktionsklar containerkonfiguration  
✅ **Bicep Infrastruktur** - Container Apps miljø og API-udrulning  
✅ **AZD Konfiguration** - Opsætning til udrulning med én kommando  
✅ **Sundhedsprober** - Liveness og readiness checks konfigureret  
✅ **Auto-skalering** - 0-10 replikaer baseret på HTTP-belastning  

## Arkitektur

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

## Forudsætninger

### Krævet
- **Azure Developer CLI (azd)** - [Installationsvejledning](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** - [Gratis konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installer Docker](https://www.docker.com/products/docker-desktop/) (til lokal test)

### Verificer Forudsætninger

```bash
# Kontroller azd-version (skal være 1.5.0 eller højere)
azd version

# Bekræft Azure-login
azd auth login

# Kontroller Docker (valgfrit, til lokal test)
docker --version
```

## ⏱️ Udrulningstidslinje

| Fase | Varighed | Hvad Sker Der |
|------|----------|--------------||
| Miljøopsætning | 30 sekunder | Opret azd-miljø |
| Byg container | 2-3 minutter | Docker bygger Flask-app |
| Provisionering af infrastruktur | 3-5 minutter | Opret Container Apps, registry, overvågning |
| Udrul applikation | 2-3 minutter | Push image og udrul til Container Apps |
| **Total** | **8-12 minutter** | Færdig udrulning klar |

## Hurtig Start

```bash
# Naviger til eksemplet
cd examples/container-app/simple-flask-api

# Initialiser miljø (vælg unikt navn)
azd env new myflaskapi

# Udrul alt (infrastruktur + applikation)
azd up
# Du vil blive bedt om at:
# 1. Vælge Azure-abonnement
# 2. Vælge placering (f.eks. eastus2)
# 3. Vente 8-12 minutter på udrulning

# Få din API-endpoint
azd env get-values

# Test API'en
curl $(azd env get-value API_ENDPOINT)/health
```

**Forventet Output:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verificer Udrulning

### Trin 1: Tjek Udrulningsstatus

```bash
# Se implementerede tjenester
azd show

# Forventet output viser:
# - Tjeneste: api
# - Endepunkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Kører
```

### Trin 2: Test API Endpoints

```bash
# Hent API-endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Test sundhed
curl $API_URL/health

# Test rod-endpoint
curl $API_URL/

# Opret en genstand
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hent alle genstande
curl $API_URL/api/items
```

**Succeskriterier:**
- ✅ Sundheds-endpoint returnerer HTTP 200
- ✅ Root-endpoint viser API-information
- ✅ POST opretter element og returnerer HTTP 201
- ✅ GET returnerer oprettede elementer

### Trin 3: Se Logfiler

```bash
# Stream live logfiler
azd logs api --follow

# Du bør se:
# - Gunicorn opstartbeskeder
# - HTTP anmodningslogfiler
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

## API Endpoints

| Endpoint | Metode | Beskrivelse |
|----------|--------|-------------|
| `/health` | GET | Sundhedstjek |
| `/api/items` | GET | Liste over alle elementer |
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

### Skalering Konfiguration

API'en skalerer automatisk baseret på HTTP-trafik:
- **Minimale Replikaer**: 0 (skalerer til nul, når inaktiv)
- **Maksimale Replikaer**: 10
- **Samtidige Forespørgsler pr. Replika**: 50

## Udvikling

### Kør Lokalt

```bash
# Installer afhængigheder
cd src
pip install -r requirements.txt

# Kør appen
python app.py

# Test lokalt
curl http://localhost:8000/health
```

### Byg og Test Container

```bash
# Byg Docker-billede
docker build -t flask-api:local ./src

# Kør container lokalt
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Udrulning

### Fuld Udrulning

```bash
# Udrul infrastruktur og applikation
azd up
```

### Kun Kode-Udrulning

```bash
# Udrul kun applikationskode (infrastruktur uændret)
azd deploy api
```

### Opdater Konfiguration

```bash
# Opdater miljøvariabler
azd env set API_KEY "new-api-key"

# Genudrul med ny konfiguration
azd deploy api
```

## Overvågning

### Se Logfiler

```bash
# Stream live logfiler
azd logs api --follow

# Vis de sidste 100 linjer
azd logs api --tail 100
```

### Overvåg Metrikker

```bash
# Åbn Azure Monitor-dashboard
azd monitor --overview

# Se specifikke målinger
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

### Opret Element

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Hent Alle Elementer

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Omkostningsoptimering

Denne udrulning bruger scale-to-zero, så du betaler kun, når API'en behandler forespørgsler:

- **Inaktiv omkostning**: ~$0/måned (skaleret til nul)
- **Aktiv omkostning**: ~$0.000024/sekund pr. replika
- **Forventet månedlig omkostning** (let brug): $5-15

### Reducer Omkostninger Yderligere

```bash
# Skaler ned maks replikaer for udvikling
azd env set MAX_REPLICAS 3

# Brug kortere tomgangs timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutter
```

## Fejlfinding

### Container Starter Ikke

```bash
# Kontroller container-logfiler
azd logs api --tail 100

# Bekræft, at Docker-billedet bygger lokalt
docker build -t test ./src
```

### API Ikke Tilgængelig

```bash
# Bekræft, at ingress er ekstern
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Høje Responstider

```bash
# Kontroller CPU/hukommelsesforbrug
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skaler ressourcer op, hvis nødvendigt
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Ryd Op

```bash
# Slet alle ressourcer
azd down --force --purge
```

## Næste Skridt

### Udvid Dette Eksempel

1. **Tilføj Database** - Integrer Azure Cosmos DB eller SQL Database
   ```bash
   # Tilføj Cosmos DB-modul til infra/main.bicep
   # Opdater app.py med databaseforbindelse
   ```

2. **Tilføj Autentifikation** - Implementer Azure AD eller API-nøgler
   ```python
   # Tilføj godkendelsesmiddleware til app.py
   from functools import wraps
   ```

3. **Opsæt CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Tilføj Managed Identity** - Sikker adgang til Azure-tjenester
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Relaterede Eksempler

- **[Database App](../../../../../examples/database-app)** - Komplet eksempel med SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service arkitektur
- **[Container Apps Master Guide](../README.md)** - Alle container mønstre

### Læringsressourcer

- 📚 [AZD For Beginners Course](../../../README.md) - Hovedkursus hjem
- 📚 [Container Apps Patterns](../README.md) - Flere udrulningsmønstre
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Community templates

## Yderligere Ressourcer

### Dokumentation
- **[Flask Dokumentation](https://flask.palletsprojects.com/)** - Flask framework guide
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiel Azure dokumentation
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd kommando reference

### Tutorials
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Udrul din første app
- **[Python på Azure](https://learn.microsoft.com/azure/developer/python/)** - Python udviklingsguide
- **[Bicep Sprog](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur som kode

### Værktøjer
- **[Azure Portal](https://portal.azure.com)** - Administrer ressourcer visuelt
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integration

---

**🎉 Tillykke!** Du har udrullet en produktionsklar Flask API til Azure Container Apps med auto-skalering og overvågning.

**Spørgsmål?** [Åbn en issue](https://github.com/microsoft/AZD-for-beginners/issues) eller tjek [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->