# Enkel Flask API - Container App Eksempel

**Læringssti:** Nybegynner ⭐ | **Tid:** 25-35 minutter | **Kostnad:** 0-15 USD/måned

En komplett, fungerende Python Flask REST API distribuert til Azure Container Apps ved hjelp av Azure Developer CLI (azd). Dette eksempelet demonstrerer containerdistribusjon, autoskalering og overvåkingsgrunnlag.

## 🎯 Hva Du Vil Lære

- Distribuere en containerisert Python-applikasjon til Azure
- Konfigurere autoskalering med skalering til null
- Implementere helsesjekker og readiness-sjekker
- Overvåke applikasjonslogger og måleverdier
- Bruke Azure Developer CLI for rask distribusjon

## 📦 Hva Som Er Inkludert

✅ **Flask-applikasjon** - Komplett REST API med CRUD-operasjoner (`src/app.py`)  
✅ **Dockerfile** - Produksjonsklar containerkonfigurasjon  
✅ **Bicep Infrastruktur** - Container Apps-miljø og API-distribusjon  
✅ **AZD-konfigurasjon** - Distribusjonsoppsett med én kommando  
✅ **Helsesjekker** - Liveness og readiness-sjekker konfigurert  
✅ **Autoskalering** - 0-10 replikaer basert på HTTP-belastning  

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

## Forutsetninger

### Nødvendig
- **Azure Developer CLI (azd)** - [Installasjonsveiledning](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** - [Gratis konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installer Docker](https://www.docker.com/products/docker-desktop/) (for lokal testing)

### Verifiser Forutsetninger

```bash
# Sjekk azd-versjon (krever 1.5.0 eller høyere)
azd version

# Verifiser Azure-pålogging
azd auth login

# Sjekk Docker (valgfritt, for lokal testing)
docker --version
```

## ⏱️ Distribusjonstidslinje

| Fase | Varighet | Hva Som Skjer |
|-------|----------|--------------||
| Miljøoppsett | 30 sekunder | Opprett azd-miljø |
| Bygg container | 2-3 minutter | Docker bygger Flask-app |
| Opprett infrastruktur | 3-5 minutter | Opprett Container Apps, register, overvåking |
| Distribuer applikasjon | 2-3 minutter | Push bilde og distribuer til Container Apps |
| **Totalt** | **8-12 minutter** | Fullført distribusjon klar |

## Rask Start

```bash
# Naviger til eksempelet
cd examples/container-app/simple-flask-api

# Initialiser miljøet (velg unikt navn)
azd env new myflaskapi

# Distribuer alt (infrastruktur + applikasjon)
azd up
# Du vil bli bedt om å:
# 1. Velg Azure-abonnement
# 2. Velg plassering (f.eks., eastus2)
# 3. Vent 8-12 minutter på distribusjon

# Få din API-endepunkt
azd env get-values

# Test API-en
curl $(azd env get-value API_ENDPOINT)/health
```

**Forventet Utdata:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verifiser Distribusjon

### Steg 1: Sjekk distribusjonsstatus

```bash
# Vis distribuerte tjenester
azd show

# Forventet utdata viser:
# - Tjeneste: api
# - Endepunkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Kjører
```

### Steg 2: Test API-endepunkter

```bash
# Hent API-endepunkt
API_URL=$(azd env get-value API_ENDPOINT)

# Test helse
curl $API_URL/health

# Test rotnivå-endepunkt
curl $API_URL/

# Opprett et element
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hent alle elementer
curl $API_URL/api/items
```

**Suksesskriterier:**
- ✅ Helsesjekk-endepunkt returnerer HTTP 200
- ✅ Rot-endepunkt viser API-informasjon
- ✅ POST oppretter element og returnerer HTTP 201
- ✅ GET returnerer opprettede elementer

### Steg 3: Se Logger

```bash
# Stream direkte logger ved hjelp av azd monitor
azd monitor --logs

# Eller bruk Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Du bør se:
# - Oppstartsbeskjeder fra Gunicorn
# - HTTP-forespørselslogger
# - Applikasjonsinformasjonslogger
```

## Prosjektstruktur

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

| Endepunkt | Metode | Beskrivelse |
|----------|--------|-------------|
| `/health` | GET | Helsesjekk |
| `/api/items` | GET | Liste over alle elementer |
| `/api/items` | POST | Opprett nytt element |
| `/api/items/{id}` | GET | Hent spesifikt element |
| `/api/items/{id}` | PUT | Oppdater element |
| `/api/items/{id}` | DELETE | Slett element |

## Konfigurasjon

### Miljøvariabler

```bash
# Angi egendefinert konfigurasjon
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skaleringskonfigurasjon

API-en skalerer automatisk basert på HTTP-trafikk:
- **Minimale replikaer**: 0 (skalerer til null når inaktiv)
- **Maksimale replikaer**: 10
- **Samtidige forespørsler per replika**: 50

## Utvikling

### Kjør Lokalt

```bash
# Installer avhengigheter
cd src
pip install -r requirements.txt

# Kjør appen
python app.py

# Test lokalt
curl http://localhost:8000/health
```

### Bygg og Test Container

```bash
# Bygg Docker-bilde
docker build -t flask-api:local ./src

# Kjør container lokalt
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Distribusjon

### Full Distribusjon

```bash
# Distribuer infrastruktur og applikasjon
azd up
```

### Distribusjon Kun Kode

```bash
# Distribuer kun applikasjonskode (infrastruktur uendret)
azd deploy api
```

### Oppdater Konfigurasjon

```bash
# Oppdater miljøvariabler
azd env set API_KEY "new-api-key"

# Distribuer på nytt med ny konfigurasjon
azd deploy api
```

## Overvåking

### Se Logger

```bash
# Strøm live logger ved bruk av azd monitor
azd monitor --logs

# Eller bruk Azure CLI for Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Se de siste 100 linjene
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Overvåk Måleverdier

```bash
# Åpne Azure Monitor dashboard
azd monitor --overview

# Vis spesifikke måleverdier
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testing

### Helsesjekk

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Forventet respons:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Opprett Element

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Hent Alle Elementer

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kostnadsoptimalisering

Denne distribusjonen bruker skalering til null, så du betaler kun når API-en behandler forespørsler:

- **Inaktiv kostnad**: ~0 USD/måned (skalert til null)
- **Aktiv kostnad**: ~0,000024 USD/sekund per replika
- **Forventet månedlig kostnad** (lett bruk): 5-15 USD

### Reduser Kostnader Ytterligere

```bash
# Skaler ned maks antall replikaer for utvikling
azd env set MAX_REPLICAS 3

# Bruk kortere inaktivitetstimeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutter
```

## Feilsøking

### Container starter ikke

```bash
# Sjekk beholderlogger ved hjelp av Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Bekreft bygging av Docker-bilde lokalt
docker build -t test ./src
```

### API er ikke tilgjengelig

```bash
# Bekreft at inngangen er ekstern
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Høye responstider

```bash
# Sjekk CPU/minnebruk
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skaler opp ressurser om nødvendig
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Rydd Opp

```bash
# Slett alle ressurser
azd down --force --purge
```

## Neste Steg

### Utvid Dette Eksemplet

1. **Legg til Database** - Integrer Azure Cosmos DB eller SQL Database  
   ```bash
   # Legg til Cosmos DB-modul i infra/main.bicep
   # Oppdater app.py med databaseforbindelse
   ```

2. **Legg til Autentisering** - Implementer Azure AD eller API-nøkler  
   ```python
   # Legg til autentiserings-mellomvare i app.py
   from functools import wraps
   ```

3. **Sett opp CI/CD** - GitHub Actions workflow  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Legg til Administrert Identitet** - Sikre tilgang til Azure-tjenester  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Relaterte Eksempler

- **[Database App](../../../../../examples/database-app)** - Komplett eksempel med SQL Database
- **[Mikrotjenester](../../../../../examples/container-app/microservices)** - Multi-tjeneste arkitektur
- **[Container Apps Hovedguide](../README.md)** - Alle container-mønstre

### Læringsressurser

- 📚 [AZD For Beginners Course](../../../README.md) - Hovedkurs
- 📚 [Container Apps Mønstre](../README.md) - Flere distribusjonsmønstre
- 📚 [AZD Malbibliotek](https://azure.github.io/awesome-azd/) - Maler fra fellesskapet

## Ekstra Ressurser

### Dokumentasjon
- **[Flask Dokumentasjon](https://flask.palletsprojects.com/)** - Flask rammeverksguide
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Offisielle Azure-dokumenter
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd kommandoreferanse

### Veiledninger
- **[Container Apps Rask Start](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Distribuer din første app
- **[Python på Azure](https://learn.microsoft.com/azure/developer/python/)** - Python utviklingsguide
- **[Bicep Språk](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur som kode

### Verktøy
- **[Azure Portal](https://portal.azure.com)** - Administrer ressurser visuelt
- **[VS Code Azure Utvidelse](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integrasjon

---

**🎉 Gratulerer!** Du har distribuert en produksjonsklar Flask API til Azure Container Apps med autoskalering og overvåking.

**Spørsmål?** [Åpne et issue](https://github.com/microsoft/AZD-for-beginners/issues) eller sjekk [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->