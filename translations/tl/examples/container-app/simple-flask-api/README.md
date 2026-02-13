# Simple Flask API - Container App Example

**Landas ng Pagkatuto:** Beginner ⭐ | **Oras:** 25-35 minutes | **Gastos:** $0-15/month

Isang kumpleto, gumaganang Python Flask REST API na na-deploy sa Azure Container Apps gamit ang Azure Developer CLI (azd). Ipinapakita ng halimbawang ito ang deployment ng container, auto-scaling, at mga batayan ng monitoring.

## 🎯 Ano ang Iyong Matututuhan

- I-deploy ang isang containerized na Python application sa Azure
- I-configure ang auto-scaling na may scale-to-zero
- Mag-implement ng health probes at readiness checks
- I-monitor ang mga logs at metrics ng application
- Gamitin ang Azure Developer CLI para sa mabilisang deployment

## 📦 Ano ang Kasama

✅ **Flask Application** - Kumpletong REST API na may CRUD operations (`src/app.py`)  
✅ **Dockerfile** - Production-ready na container configuration  
✅ **Bicep Infrastructure** - Container Apps environment at API deployment  
✅ **AZD Configuration** - Isang-command na setup para sa deployment  
✅ **Health Probes** - Liveness at readiness checks na naka-configure  
✅ **Auto-scaling** - 0-10 replicas batay sa HTTP load  

## Arkitektura

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

## Kinakailangan

### Kailangan
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (para sa lokal na testing)

### Suriin ang Mga Kinakailangan

```bash
# Suriin ang bersyon ng azd (kailangan 1.5.0 o mas mataas)
azd version

# Suriin ang pag-login sa Azure
azd auth login

# Suriin ang Docker (opsyonal, para sa lokal na pagsubok)
docker --version
```

## ⏱️ Timeline ng Deployment

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Mabilis na Simula

```bash
# Pumunta sa halimbawa
cd examples/container-app/simple-flask-api

# I-initialize ang kapaligiran (pumili ng natatanging pangalan)
azd env new myflaskapi

# I-deploy ang lahat (imprastruktura + aplikasyon)
azd up
# Hihilingin sa iyo na:
# 1. Piliin ang Azure subscription
# 2. Piliin ang lokasyon (halimbawa, eastus2)
# 3. Maghintay ng 8-12 minuto para sa pag-deploy

# Kunin ang iyong API endpoint
azd env get-values

# Subukan ang API
curl $(azd env get-value API_ENDPOINT)/health
```

**Inaasahang Output:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Suriin ang Pag-deploy

### Hakbang 1: Suriin ang Katayuan ng Pag-deploy

```bash
# Tingnan ang mga naka-deploy na serbisyo
azd show

# Ipinapakita ng inaasahang output:
# - Serbisyo: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Katayuan: Gumagana
```

### Hakbang 2: Subukan ang mga Endpoint ng API

```bash
# Kunin ang endpoint ng API
API_URL=$(azd env get-value API_ENDPOINT)

# Suriin ang kalusugan
curl $API_URL/health

# Subukan ang pangunahing endpoint
curl $API_URL/

# Lumikha ng isang item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Kunin ang lahat ng mga item
curl $API_URL/api/items
```

**Pamantayan ng Tagumpay:**
- ✅ Nagbabalik ang health endpoint ng HTTP 200
- ✅ Ipinapakita ng root endpoint ang impormasyon ng API
- ✅ Gumagawa ang POST ng item at nagbabalik ng HTTP 201
- ✅ Nagbabalik ang GET ng mga nilikhang item

### Hakbang 3: Tingnan ang Mga Log

```bash
# I-stream ang mga live na log gamit ang azd monitor
azd monitor --logs

# O gamitin ang Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Dapat mong makita:
# - Mga mensahe ng pagsisimula ng Gunicorn
# - Mga log ng HTTP request
# - Mga log ng impormasyon ng aplikasyon
```

## Istruktura ng Proyekto

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

## Mga Endpoint ng API

| Endpoint | Method | Paglalarawan |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/api/items` | GET | List all items |
| `/api/items` | POST | Create new item |
| `/api/items/{id}` | GET | Get specific item |
| `/api/items/{id}` | PUT | Update item |
| `/api/items/{id}` | DELETE | Delete item |

## Konfigurasyon

### Mga Variable ng Kapaligiran

```bash
# Itakda ang pasadyang konfigurasyon
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

Ang API ay awtomatikong nag-scale batay sa HTTP traffic:
- **Min Replicas**: 0 (scales to zero when idle)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Pag-develop

### Patakbuhin nang Lokal

```bash
# I-install ang mga dependensya
cd src
pip install -r requirements.txt

# Patakbuhin ang app
python app.py

# Subukan nang lokal
curl http://localhost:8000/health
```

### Buoin at Subukan ang Container

```bash
# Buuin ang Docker image
docker build -t flask-api:local ./src

# Patakbuhin ang container nang lokal
docker run -p 8000:8000 flask-api:local

# Subukan ang container
curl http://localhost:8000/health
```

## Pag-deploy

### Buong Pag-deploy

```bash
# I-deploy ang imprastruktura at aplikasyon
azd up
```

### Pag-deploy ng Code Lamang

```bash
# I-deploy lamang ang kodigo ng aplikasyon (hindi binabago ang imprastruktura)
azd deploy api
```

### I-update ang Konfigurasyon

```bash
# I-update ang mga environment variables
azd env set API_KEY "new-api-key"

# Muling i-deploy gamit ang bagong konfigurasyon
azd deploy api
```

## Pagmomonitor

### Tingnan ang Mga Log

```bash
# I-stream ang mga live na log gamit ang azd monitor
azd monitor --logs

# O gamitin ang Azure CLI para sa Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Tingnan ang huling 100 linya
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Subaybayan ang Mga Metric

```bash
# Buksan ang dashboard ng Azure Monitor
azd monitor --overview

# Tingnan ang mga partikular na sukatan
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Pagsusuri

### Pagsusuri ng Kalusugan

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Inaasahang tugon:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Gumawa ng Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Kuhanin Lahat ng Mga Item

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Pag-optimize ng Gastos

Gumagamit ang deployment na ito ng scale-to-zero, kaya magbabayad ka lamang kapag nagpaproseso ng mga kahilingan ang API:

- **Idle cost**: ~$0/month (scaled to zero)
- **Active cost**: ~$0.000024/second per replica
- **Inaasahang buwanang gastos** (magaan na paggamit): $5-15

### Pababain Pa ang Gastos

```bash
# Bawasan ang maximum na replicas para sa dev
azd env set MAX_REPLICAS 3

# Gumamit ng mas maikling idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuto
```

## Pag-troubleshoot

### Hindi Magsisimula ang Container

```bash
# Suriin ang mga log ng container gamit ang Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Tiyakin na lokal na nabubuo ang Docker image
docker build -t test ./src
```

### Hindi Ma-access ang API

```bash
# Tiyakin na ang ingress ay panlabas
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Mataas na Oras ng Tugon

```bash
# Suriin ang paggamit ng CPU at memorya
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Palakihin ang mga mapagkukunan kung kinakailangan
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Paglilinis

```bash
# Tanggalin ang lahat ng mga mapagkukunan.
azd down --force --purge
```

## Mga Susunod na Hakbang

### Palawakin ang Halimbawang Ito

1. **Magdagdag ng Database** - I-integrate ang Azure Cosmos DB o SQL Database
   ```bash
   # Idagdag ang modyul ng Cosmos DB sa infra/main.bicep
   # I-update ang app.py upang idagdag ang koneksyon sa database
   ```

2. **Magdagdag ng Authentication** - I-implement ang Azure AD o API keys
   ```python
   # Magdagdag ng middleware para sa pagpapatunay sa app.py
   from functools import wraps
   ```

3. **I-setup ang CI/CD** - workflow ng GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Magdagdag ng Managed Identity** - Secure access to Azure services
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Mga Kaugnay na Halimbawa

- **[Database App](../../../../../examples/database-app)** - Kumpletong halimbawa na may SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service architecture
- **[Container Apps Master Guide](../README.md)** - Lahat ng container patterns

### Mga Mapagkukunan sa Pagkatuto

- 📚 [AZD For Beginners Course](../../../README.md) - Pangunahing pahina ng kurso
- 📚 [Container Apps Patterns](../README.md) - Higit pang mga deployment pattern
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Mga community template

## Karagdagang Mga Mapagkukunan

### Dokumentasyon
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Gabay sa Flask framework
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Opisyal na docs ng Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Reference ng azd commands

### Mga Tutorial
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - I-deploy ang iyong unang app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Gabay sa pag-develop ng Python
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### Mga Tool
- **[Azure Portal](https://portal.azure.com)** - Pamahalaan ang mga resource nang visual
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integration

---

**🎉 Congratulations!** Na-deploy mo ang isang production-ready na Flask API sa Azure Container Apps na may auto-scaling at monitoring.

**May mga Tanong?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) o tingnan ang [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI na serbisyo sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman pinagsisikapan naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng isang bihasang tagasalin. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->