<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-21T09:56:47+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "sv"
}
-->
# Enkel Flask API - Exempel på Container App

**Lärandespår:** Nybörjare ⭐ | **Tid:** 25-35 minuter | **Kostnad:** $0-15/månad

En komplett, fungerande Python Flask REST API distribuerad till Azure Container Apps med hjälp av Azure Developer CLI (azd). Detta exempel visar grunderna i containerdistribution, autoskalning och övervakning.

## 🎯 Vad du kommer att lära dig

- Distribuera en containeriserad Python-applikation till Azure
- Konfigurera autoskalning med skalning till noll
- Implementera hälsokontroller och readiness checks
- Övervaka applikationsloggar och mätvärden
- Använd Azure Developer CLI för snabb distribution

## 📦 Vad som ingår

✅ **Flask-applikation** - Komplett REST API med CRUD-operationer (`src/app.py`)  
✅ **Dockerfile** - Produktionsklar containerkonfiguration  
✅ **Bicep-infrastruktur** - Container Apps-miljö och API-distribution  
✅ **AZD-konfiguration** - En-kommandos distributionsinställning  
✅ **Hälsokontroller** - Liveness och readiness checks konfigurerade  
✅ **Autoskalning** - 0-10 repliker baserat på HTTP-belastning  

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

## Förutsättningar

### Obligatoriskt
- **Azure Developer CLI (azd)** - [Installationsguide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-prenumeration** - [Gratis konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installera Docker](https://www.docker.com/products/docker-desktop/) (för lokal testning)

### Verifiera förutsättningar

```bash
# Kontrollera azd-version (behöver 1.5.0 eller högre)
azd version

# Verifiera Azure-inloggning
azd auth login

# Kontrollera Docker (valfritt, för lokal testning)
docker --version
```

## ⏱️ Distributionsschema

| Fas | Varaktighet | Vad händer |
|-----|-------------|------------||
| Miljöinställning | 30 sekunder | Skapa azd-miljö |
| Bygg container | 2-3 minuter | Docker bygger Flask-applikation |
| Tillhandahåll infrastruktur | 3-5 minuter | Skapa Container Apps, register, övervakning |
| Distribuera applikation | 2-3 minuter | Skicka bild och distribuera till Container Apps |
| **Totalt** | **8-12 minuter** | Komplett distribution redo |

## Snabbstart

```bash
# Navigera till exemplet
cd examples/container-app/simple-flask-api

# Initiera miljön (välj unikt namn)
azd env new myflaskapi

# Distribuera allt (infrastruktur + applikation)
azd up
# Du kommer att bli uppmanad att:
# 1. Välj Azure-abonnemang
# 2. Välj plats (t.ex. eastus2)
# 3. Vänta 8-12 minuter för distribution

# Hämta din API-slutpunkt
azd env get-values

# Testa API:t
curl $(azd env get-value API_ENDPOINT)/health
```

**Förväntad utdata:**
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

# Förväntad output visar:
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
- ✅ Hälsokontroll-endpoint returnerar HTTP 200
- ✅ Rot-endpoint visar API-information
- ✅ POST skapar objekt och returnerar HTTP 201
- ✅ GET returnerar skapade objekt

### Steg 3: Visa loggar

```bash
# Strömma live-loggar
azd logs api --follow

# Du bör se:
# - Gunicorn startmeddelanden
# - HTTP-förfrågningsloggar
# - Applikationsinformationsloggar
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

| Endpoint | Metod | Beskrivning |
|----------|-------|-------------|
| `/health` | GET | Hälsokontroll |
| `/api/items` | GET | Lista alla objekt |
| `/api/items` | POST | Skapa nytt objekt |
| `/api/items/{id}` | GET | Hämta specifikt objekt |
| `/api/items/{id}` | PUT | Uppdatera objekt |
| `/api/items/{id}` | DELETE | Ta bort objekt |

## Konfiguration

### Miljövariabler

```bash
# Ställ in anpassad konfiguration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skalningskonfiguration

API:et skalar automatiskt baserat på HTTP-trafik:
- **Minimalt antal repliker**: 0 (skalar till noll när inaktiv)
- **Maximalt antal repliker**: 10
- **Samtidiga förfrågningar per replik**: 50

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
# Bygg Docker-bild
docker build -t flask-api:local ./src

# Kör container lokalt
docker run -p 8000:8000 flask-api:local

# Testa container
curl http://localhost:8000/health
```

## Distribution

### Fullständig distribution

```bash
# Distribuera infrastruktur och applikation
azd up
```

### Endast koddistribution

```bash
# Distribuera endast applikationskod (infrastruktur oförändrad)
azd deploy api
```

### Uppdatera konfiguration

```bash
# Uppdatera miljövariabler
azd env set API_KEY "new-api-key"

# Återdistribuera med ny konfiguration
azd deploy api
```

## Övervakning

### Visa loggar

```bash
# Strömma live-loggar
azd logs api --follow

# Visa de senaste 100 raderna
azd logs api --tail 100
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

Denna distribution använder skalning till noll, så du betalar endast när API:et bearbetar förfrågningar:

- **Inaktiv kostnad**: ~$0/månad (skalat till noll)
- **Aktiv kostnad**: ~$0.000024/sekund per replik
- **Förväntad månadskostnad** (lätt användning): $5-15

### Minska kostnader ytterligare

```bash
# Minska max antal repliker för utveckling
azd env set MAX_REPLICAS 3

# Använd kortare inaktivitetstid
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuter
```

## Felsökning

### Containern startar inte

```bash
# Kontrollera containerloggar
azd logs api --tail 100

# Verifiera att Docker-bilden byggs lokalt
docker build -t test ./src
```

### API är inte tillgängligt

```bash
# Verifiera att ingressen är extern
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Höga svarstider

```bash
# Kontrollera CPU/minnesanvändning
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

### Utöka detta exempel

1. **Lägg till databas** - Integrera Azure Cosmos DB eller SQL Database
   ```bash
   # Lägg till Cosmos DB-modul till infra/main.bicep
   # Uppdatera app.py med databasanslutning
   ```

2. **Lägg till autentisering** - Implementera Azure AD eller API-nycklar
   ```python
   # Lägg till autentiseringsmiddleware i app.py
   from functools import wraps
   ```

3. **Ställ in CI/CD** - GitHub Actions-arbetsflöde
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Lägg till hanterad identitet** - Säker åtkomst till Azure-tjänster
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Relaterade exempel

- **[Databasapplikation](../../../../../examples/database-app)** - Komplett exempel med SQL Database
- **[Mikrotjänster](../../../../../examples/container-app/microservices)** - Arkitektur med flera tjänster
- **[Container Apps Master Guide](../README.md)** - Alla container-mönster

### Läranderesurser

- 📚 [AZD För Nybörjare Kurs](../../../README.md) - Huvudkursens startsida
- 📚 [Container Apps Mönster](../README.md) - Fler distributionsmönster
- 📚 [AZD Mallgalleri](https://azure.github.io/awesome-azd/) - Community-mallar

## Ytterligare resurser

### Dokumentation
- **[Flask-dokumentation](https://flask.palletsprojects.com/)** - Flask-ramverksguide
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Officiell Azure-dokumentation
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-kommandoreferens

### Handledningar
- **[Container Apps Snabbstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Distribuera din första app
- **[Python på Azure](https://learn.microsoft.com/azure/developer/python/)** - Python-utvecklingsguide
- **[Bicep-språk](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur som kod

### Verktyg
- **[Azure Portal](https://portal.azure.com)** - Hantera resurser visuellt
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integration

---

**🎉 Grattis!** Du har distribuerat en produktionsklar Flask API till Azure Container Apps med autoskalning och övervakning.

**Frågor?** [Öppna ett ärende](https://github.com/microsoft/AZD-for-beginners/issues) eller kolla [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->