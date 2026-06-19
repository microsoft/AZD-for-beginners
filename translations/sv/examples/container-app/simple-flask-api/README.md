# Enkelt Flask-API - Container App-exempel

**Lärväg:** Nybörjare ⭐ | **Tid:** 25-35 minuter | **Kostnad:** $0-15/month

En komplett, fungerande Python Flask REST-API distribuerat till Azure Container Apps med Azure Developer CLI (azd). Detta exempel visar containerdistribution, automatisk skalning och grundläggande övervakning.

## 🎯 Vad du kommer att lära dig

- Distribuera en containeriserad Python-applikation till Azure
- Konfigurera automatisk skalning med scale-to-zero
- Implementera hälsoavläsningar och readiness-kontroller
- Övervaka applikationsloggar och mätvärden
- Använd Azure Developer CLI för snabb distribution

## 📦 Vad som ingår

✅ **Flask Application** - Fullständigt REST API med CRUD-operationer (`src/app.py`)  
✅ **Dockerfile** - Produktionsklar containerkonfiguration  
✅ **Bicep Infrastructure** - Container Apps-miljö och API-distribution  
✅ **AZD Configuration** - One-command-distributionsinställning  
✅ **Health Probes** - Liveness- och readiness-kontroller konfigurerade  
✅ **Auto-scaling** - 0-10 repliker baserat på HTTP-belastning  

## Arkitektur

```mermaid
graph TD
    subgraph ACA[Azure Container Apps-miljö]
        Flask[Flask API-container<br/>Hälsokontroller<br/>REST-API<br/>Autoskalning 0-10 repliker]
        AppInsights[Application Insights]
    end
```

## Förutsättningar

### Krävs
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (för lokal testning)

### Verifiera förutsättningar

```bash
# Kontrollera azd-versionen (kräver 1.5.0 eller högre)
azd version

# Verifiera Azure-inloggning
azd auth login

# Kontrollera Docker (valfritt, för lokal testning)
docker --version
```

## ⏱️ Distribueringsschema

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Skapa azd-miljö |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Skapa Container Apps, registry, övervakning |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Komplett distribution redo |

## Snabbstart

```bash
# Navigera till exemplet
cd examples/container-app/simple-flask-api

# Initiera miljön (välj ett unikt namn)
azd env new myflaskapi

# Distribuera allt (infrastruktur + applikation)
azd up
# Du kommer att uppmanas att:
# 1. Välj Azure-prenumeration
# 2. Välj plats (t.ex. eastus2)
# 3. Vänta 8-12 minuter på distributionen

# Hämta din API-slutpunkt
azd env get-values

# Testa API:et
curl $(azd env get-value API_ENDPOINT)/health
```

**Förväntat utdata:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verifiera distribution

### Steg 1: Kontrollera distributionsstatus

```bash
# Visa distribuerade tjänster
azd show

# Förväntad utdata visar:
# - Tjänst: api
# - Slutpunkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Körs
```

### Steg 2: Testa API-endpoints

```bash
# Hämta API-slutpunkt
API_URL=$(azd env get-value API_ENDPOINT)

# Testa hälsa
curl $API_URL/health

# Testa rot-slutpunkt
curl $API_URL/

# Skapa ett objekt
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hämta alla objekt
curl $API_URL/api/items
```

**Framgångskriterier:**
- ✅ Hälsorutin returnerar HTTP 200
- ✅ Root-endpoint visar API-information
- ✅ POST skapar objekt och returnerar HTTP 201
- ✅ GET returnerar skapade objekt

### Steg 3: Visa loggar

```bash
# Strömma live-loggar med azd monitor
azd monitor --logs

# Eller använd Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Du bör se:
# - Startmeddelanden från Gunicorn
# - HTTP-förfrågningsloggar
# - Loggar med applikationsinformation
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
| `/health` | GET | Hälsokontroll |
| `/api/items` | GET | Lista alla objekt |
| `/api/items` | POST | Skapa nytt objekt |
| `/api/items/{id}` | GET | Hämta specifikt objekt |
| `/api/items/{id}` | PUT | Uppdatera objekt |
| `/api/items/{id}` | DELETE | Radera objekt |

## Konfiguration

### Miljövariabler

```bash
# Ange anpassad konfiguration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skalningskonfiguration

API:et skalar automatiskt baserat på HTTP-trafik:
- **Min repliker**: 0 (skalar till noll när den är inaktiv)
- **Max repliker**: 10
- **Samtidiga förfrågningar per replika**: 50

## Utveckling

### Kör lokalt

```bash
# Installera beroenden
cd src
pip install -r requirements.txt

# Kör appen
python app.py

# Testa lokalt
curl http://localhost:8000/health
```

### Bygg och testa container

```bash
# Bygg Docker-avbild
docker build -t flask-api:local ./src

# Kör container lokalt
docker run -p 8000:8000 flask-api:local

# Testa container
curl http://localhost:8000/health
```

## Distribution

### Fullständig distribution

```bash
# Driftsätt infrastruktur och applikation
azd up
```

### Endast koddistribution

```bash
# Distribuera endast applikationskoden (infrastrukturen oförändrad)
azd deploy api
```

### Uppdatera konfiguration

```bash
# Uppdatera miljövariablerna
azd env set API_KEY "new-api-key"

# Distribuera om med ny konfiguration
azd deploy api
```

## Övervakning

### Visa loggar

```bash
# Strömma live-loggar med azd monitor
azd monitor --logs

# Eller använd Azure CLI för Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Visa de senaste 100 raderna
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Övervaka mätvärden

```bash
# Öppna Azure Monitor-instrumentpanelen
azd monitor --overview

# Visa specifika mätvärden
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testning

### Hälsokontroll

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Förväntat svar:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Skapa objekt

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Hämta alla objekt

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kostnadsoptimering

Denna distribution använder scale-to-zero, så du betalar endast när API:et hanterar förfrågningar:

- **Inaktiv kostnad**: ~$0/month (skalad till noll)
- **Aktiv kostnad**: ~$0.000024/second per replika
- **Förväntad månadskostnad** (låg användning): $5-15

### Minska kostnader ytterligare

```bash
# Skala ner max antal repliker för utveckling
azd env set MAX_REPLICAS 3

# Använd kortare timeout för inaktivitet
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuter
```

## Felsökning

### Containern startar inte

```bash
# Kontrollera containerloggar med Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Verifiera att Docker-avbildningen byggs lokalt
docker build -t test ./src
```

### API:t är inte åtkomligt

```bash
# Verifiera att ingress är extern
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Höga svarstider

```bash
# Kontrollera CPU- och minnesanvändning
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skala upp resurser vid behov
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Rensa upp

```bash
# Ta bort alla resurser
azd down --force --purge
```

## Nästa steg

### Bygg ut det här exemplet

1. **Lägg till databas** - Integrera Azure Cosmos DB eller SQL Database
   ```bash
   # Lägg till Cosmos DB-modul i infra/main.bicep
   # Uppdatera app.py med databasanslutning
   ```

2. **Lägg till autentisering** - Implementera Microsoft Entra ID eller API-nycklar
   ```python
   # Lägg till autentiseringsmiddleware i app.py
   from functools import wraps
   ```

3. **Ställ in CI/CD** - Arbetsflöde för GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Lägg till hanterad identitet** - Säkerställ åtkomst till Azure-tjänster
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Relaterade exempel

- **[Database App](../../../../../examples/database-app)** - Komplett exempel med SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Arkitektur med flera tjänster
- **[Container Apps Master Guide](../README.md)** - Alla containermönster

### Lärresurser

- 📚 [AZD For Beginners Course](../../../README.md) - Huvudsida för kursen
- 📚 [Container Apps Patterns](../README.md) - Fler distributionsmönster
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Gemenskapsmallar

## Ytterligare resurser

### Dokumentation
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Guide för Flask-ramverket
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiell Azure-dokumentation
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-kommandoreferens

### Handledningar
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Distribuera din första app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Guide för Pythonutveckling
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur som kod

### Verktyg
- **[Azure Portal](https://portal.azure.com)** - Hantera resurser visuellt
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integrering

---

**🎉 Grattis!** Du har distribuerat ett produktionsklart Flask-API till Azure Container Apps med automatisk skalning och övervakning.

**Frågor?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) eller kolla [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->