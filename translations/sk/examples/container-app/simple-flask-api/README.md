# Simple Flask API - Container App Example

**Learning Path:** Začiatočník ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

Úplné, fungujúce Python Flask REST API nasadené do Azure Container Apps pomocou Azure Developer CLI (azd). Tento príklad demonštruje nasadenie kontajnera, automatické škálovanie a základy monitorovania.

## 🎯 What You'll Learn

- Nasadiť kontajnerizovanú Python aplikáciu do Azure
- Konfigurovať automatické škálovanie so škálovaním na nulu
- Implementovať health probes a readiness kontroly
- Monitorovať logy a metriky aplikácie
- Použiť Azure Developer CLI pre rýchle nasadenie

## 📦 What's Included

✅ **Flask Application** - Kompletné REST API s CRUD operáciami (`src/app.py`)  
✅ **Dockerfile** - Konfigurácia kontajnera pripravená na produkciu  
✅ **Bicep Infrastructure** - Prostredie Container Apps a nasadenie API  
✅ **AZD Configuration** - Nasadenie jedným príkazom  
✅ **Health Probes** - Nakonfigurované liveness a readiness kontroly  
✅ **Auto-scaling** - 0-10 replík na základe HTTP záťaže  

## Architecture

```mermaid
graph TD
    subgraph ACA[Prostredie Azure Container Apps]
        Flask[Kontajner Flask API<br/>Koncové body stavu<br/>REST API<br/>Automatické škálovanie 0-10 replík]
        AppInsights[Služba Application Insights]
    end
```
## Prerequisites

### Required
- **Azure Developer CLI (azd)** - [Inštalačný návod](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Bezpečný účet](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (pre lokálne testovanie)

### Verify Prerequisites

```bash
# Skontrolujte verziu azd (potrebujete verziu 1.5.0 alebo novšiu)
azd version

# Overte prihlásenie do Azure
azd auth login

# Skontrolujte Docker (voliteľné, pre lokálne testovanie)
docker --version
```

## ⏱️ Deployment Timeline

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Quick Start

```bash
# Prejdite na príklad
cd examples/container-app/simple-flask-api

# Inicializujte prostredie (zvoľte jedinečný názov)
azd env new myflaskapi

# Nasaďte všetko (infrastruktúra + aplikácia)
azd up
# Budete vyzvaní, aby ste:
# 1. Vyberte predplatné Azure
# 2. Zvoľte umiestnenie (napr. eastus2)
# 3. Počkajte 8-12 minút na nasadenie

# Získajte koncový bod API
azd env get-values

# Otestujte API
curl $(azd env get-value API_ENDPOINT)/health
```

**Expected Output:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verify Deployment

### Step 1: Check Deployment Status

```bash
# Zobraziť nasadené služby
azd show

# Očakávaný výstup zobrazuje:
# - Služba: api
# - Koncový bod: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stav: Beží
```

### Step 2: Test API Endpoints

```bash
# Získať koncový bod API
API_URL=$(azd env get-value API_ENDPOINT)

# Test stavu
curl $API_URL/health

# Test koreňového koncového bodu
curl $API_URL/

# Vytvoriť položku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Získať všetky položky
curl $API_URL/api/items
```

**Success Criteria:**
- ✅ Koncový bod /health vracia HTTP 200
- ✅ Root koncový bod zobrazuje informácie o API
- ✅ POST vytvorí položku a vracia HTTP 201
- ✅ GET vráti vytvorené položky

### Step 3: View Logs

```bash
# Streamujte živé logy pomocou azd monitor
azd monitor --logs

# Alebo použite Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Mali by ste vidieť:
# - Správy o spustení Gunicorn
# - Záznamy HTTP požiadaviek
# - Informačné záznamy aplikácie
```

## Project Structure

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

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Kontrola stavu |
| `/api/items` | GET | Zoznam všetkých položiek |
| `/api/items` | POST | Vytvoriť novú položku |
| `/api/items/{id}` | GET | Získať konkrétnu položku |
| `/api/items/{id}` | PUT | Aktualizovať položku |
| `/api/items/{id}` | DELETE | Zmazať položku |

## Configuration

### Environment Variables

```bash
# Nastaviť vlastnú konfiguráciu
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

API sa automaticky škáluje na základe HTTP prevádzky:
- **Min Replicas**: 0 (škáluje na nulu, keď je nečinné)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Development

### Run Locally

```bash
# Nainštalovať závislosti
cd src
pip install -r requirements.txt

# Spustiť aplikáciu
python app.py

# Otestovať lokálne
curl http://localhost:8000/health
```

### Build and Test Container

```bash
# Vytvoriť Docker obraz
docker build -t flask-api:local ./src

# Spustiť kontajner lokálne
docker run -p 8000:8000 flask-api:local

# Otestovať kontajner
curl http://localhost:8000/health
```

## Deployment

### Full Deployment

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up
```

### Code-Only Deployment

```bash
# Nasadiť iba aplikačný kód (infraštruktúra zostáva nezmenená)
azd deploy api
```

### Update Configuration

```bash
# Aktualizovať premenné prostredia
azd env set API_KEY "new-api-key"

# Znovu nasadiť s novou konfiguráciou
azd deploy api
```

## Monitoring

### View Logs

```bash
# Sledujte živé logy pomocou azd monitor
azd monitor --logs

# Alebo použite Azure CLI pre Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Zobraziť posledných 100 riadkov
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitor Metrics

```bash
# Otvoriť informačný panel Azure Monitor
azd monitor --overview

# Zobraziť konkrétne metriky
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testing

### Health Check

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Expected response:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Create Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Get All Items

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Cost Optimization

Toto nasadenie používa škálovanie na nulu, takže platíte len keď API spracováva požiadavky:

- **Idle cost**: ~$0/month (škálované na nulu)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### Reduce Costs Further

```bash
# Znížiť maximálny počet replík pre vývoj
azd env set MAX_REPLICAS 3

# Použiť kratší časový limit nečinnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minút
```

## Troubleshooting

### Container Won't Start

```bash
# Skontrolujte denníky kontajnera pomocou Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Overte, či sa Docker image zostaví lokálne
docker build -t test ./src
```

### API Not Accessible

```bash
# Overte, že ingress je externý
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### High Response Times

```bash
# Skontrolujte využitie CPU a pamäte
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Navýšte zdroje, ak je to potrebné
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Clean Up

```bash
# Odstrániť všetky zdroje
azd down --force --purge
```

## Next Steps

### Expand This Example

1. **Add Database** - Integrate Azure Cosmos DB or SQL Database
   ```bash
   # Pridať modul Cosmos DB do infra/main.bicep
   # Aktualizovať app.py s pripojením k databáze
   ```

2. **Add Authentication** - Implement Azure AD or API keys
   ```python
   # Pridať autentifikačný middleware do app.py
   from functools import wraps
   ```

3. **Set Up CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Add Managed Identity** - Secure access to Azure services
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Related Examples

- **[Database App](../../../../../examples/database-app)** - Kompletný príklad s SQL databázou
- **[Microservices](../../../../../examples/container-app/microservices)** - Architektúra viacerých služieb
- **[Container Apps Master Guide](../README.md)** - Všetky vzory pre kontajnery

### Learning Resources

- 📚 [AZD For Beginners Course](../../../README.md) - Hlavná stránka kurzu
- 📚 [Container Apps Patterns](../README.md) - Ďalšie vzory nasadení
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Šablóny komunity

## Additional Resources

### Documentation
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Sprievodca frameworkom Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiálna dokumentácia Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia príkazov azd

### Tutorials
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Nasadte svoju prvú aplikáciu
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Sprievodca vývojom v Pythone pre Azure
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktúra ako kód

### Tools
- **[Azure Portal](https://portal.azure.com)** - Spravujte zdroje vizuálne
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrácia do IDE

---

**🎉 Gratulujeme!** Nasadili ste produkčne pripravené Flask API do Azure Container Apps s automatickým škálovaním a monitorovaním.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z používania tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->