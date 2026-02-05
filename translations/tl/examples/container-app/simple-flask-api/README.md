# Simple Flask API - Halimbawa ng Container App

**Landas ng Pag-aaral:** Baguhan ⭐ | **Oras:** 25-35 minuto | **Gastos:** $0-15/buwan

Isang kumpleto at gumaganang Python Flask REST API na na-deploy sa Azure Container Apps gamit ang Azure Developer CLI (azd). Ang halimbawang ito ay nagpapakita ng mga pangunahing kaalaman sa container deployment, auto-scaling, at monitoring.

## 🎯 Ano ang Matututuhan Mo

- Mag-deploy ng containerized na Python application sa Azure
- I-configure ang auto-scaling gamit ang scale-to-zero
- Mag-implement ng health probes at readiness checks
- I-monitor ang application logs at metrics
- Gumamit ng Azure Developer CLI para sa mabilisang deployment

## 📦 Kasama sa Package

✅ **Flask Application** - Kumpletong REST API na may CRUD operations (`src/app.py`)  
✅ **Dockerfile** - Production-ready na container configuration  
✅ **Bicep Infrastructure** - Container Apps environment at API deployment  
✅ **AZD Configuration** - One-command deployment setup  
✅ **Health Probes** - Nakakonfigura ang liveness at readiness checks  
✅ **Auto-scaling** - 0-10 replicas base sa HTTP load  

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

## Mga Kinakailangan

### Kailangan
- **Azure Developer CLI (azd)** - [Gabay sa Pag-install](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Libreng account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [I-install ang Docker](https://www.docker.com/products/docker-desktop/) (para sa lokal na pagsubok)

### I-verify ang Mga Kinakailangan

```bash
# Suriin ang bersyon ng azd (kailangan 1.5.0 o mas mataas)
azd version

# Tiyakin ang pag-login sa Azure
azd auth login

# Suriin ang Docker (opsyonal, para sa lokal na pagsubok)
docker --version
```

## ⏱️ Timeline ng Deployment

| Yugto | Tagal | Ano ang Nangyayari |
|-------|-------|--------------------||
| Pagsasaayos ng environment | 30 segundo | Gumawa ng azd environment |
| Pagbuo ng container | 2-3 minuto | Docker build Flask app |
| Pag-provision ng infrastructure | 3-5 minuto | Gumawa ng Container Apps, registry, monitoring |
| Pag-deploy ng application | 2-3 minuto | I-push ang image at i-deploy sa Container Apps |
| **Kabuuan** | **8-12 minuto** | Kumpletong deployment na handa na |

## Mabilisang Simula

```bash
# Mag-navigate sa halimbawa
cd examples/container-app/simple-flask-api

# I-initialize ang kapaligiran (pumili ng natatanging pangalan)
azd env new myflaskapi

# I-deploy ang lahat (infrastructure + application)
azd up
# Ikaw ay tatanungin na:
# 1. Piliin ang Azure subscription
# 2. Pumili ng lokasyon (hal., eastus2)
# 3. Maghintay ng 8-12 minuto para sa deployment

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

## ✅ I-verify ang Deployment

### Hakbang 1: Suriin ang Status ng Deployment

```bash
# Tingnan ang mga na-deploy na serbisyo
azd show

# Inaasahang output ay nagpapakita:
# - Serbisyo: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Katayuan: Tumatakbo
```

### Hakbang 2: Subukan ang API Endpoints

```bash
# Kunin ang API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Subukan ang kalusugan
curl $API_URL/health

# Subukan ang root endpoint
curl $API_URL/

# Lumikha ng isang item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Kunin ang lahat ng mga item
curl $API_URL/api/items
```

**Pamantayan ng Tagumpay:**
- ✅ Ang health endpoint ay nagbabalik ng HTTP 200
- ✅ Ang root endpoint ay nagpapakita ng impormasyon ng API
- ✅ Ang POST ay lumilikha ng item at nagbabalik ng HTTP 201
- ✅ Ang GET ay nagbabalik ng mga nalikhang item

### Hakbang 3: Tingnan ang Logs

```bash
# I-stream ang mga live na log
azd logs api --follow

# Makikita mo:
# - Mga mensahe ng pagsisimula ng Gunicorn
# - Mga log ng HTTP na kahilingan
# - Mga log ng impormasyon ng aplikasyon
```

## Estruktura ng Proyekto

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

| Endpoint | Method | Deskripsyon |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/api/items` | GET | Listahan ng lahat ng items |
| `/api/items` | POST | Gumawa ng bagong item |
| `/api/items/{id}` | GET | Kunin ang partikular na item |
| `/api/items/{id}` | PUT | I-update ang item |
| `/api/items/{id}` | DELETE | Burahin ang item |

## Konfigurasyon

### Environment Variables

```bash
# Itakda ang pasadyang konfigurasyon
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

Ang API ay awtomatikong nag-a-adjust base sa HTTP traffic:
- **Min Replicas**: 0 (nag-scale sa zero kapag idle)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Pag-develop

### Patakbuhin nang Lokal

```bash
# I-install ang mga dependency
cd src
pip install -r requirements.txt

# Patakbuhin ang app
python app.py

# Subukan nang lokal
curl http://localhost:8000/health
```

### Bumuo at Subukan ang Container

```bash
# Gumawa ng Docker image
docker build -t flask-api:local ./src

# Patakbuhin ang container nang lokal
docker run -p 8000:8000 flask-api:local

# Subukan ang container
curl http://localhost:8000/health
```

## Deployment

### Buong Deployment

```bash
# I-deploy ang imprastraktura at aplikasyon
azd up
```

### Deployment ng Code Lamang

```bash
# I-deploy lamang ang code ng aplikasyon (hindi binago ang imprastraktura)
azd deploy api
```

### I-update ang Konfigurasyon

```bash
# I-update ang mga variable ng kapaligiran
azd env set API_KEY "new-api-key"

# I-redeploy gamit ang bagong configuration
azd deploy api
```

## Monitoring

### Tingnan ang Logs

```bash
# I-stream ang mga live na log
azd logs api --follow

# Tingnan ang huling 100 linya
azd logs api --tail 100
```

### I-monitor ang Metrics

```bash
# Buksan ang Azure Monitor dashboard
azd monitor --overview

# Tingnan ang mga partikular na sukatan
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Pagsusuri

### Health Check

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

### Kunin ang Lahat ng Items

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Pag-optimize ng Gastos

Ang deployment na ito ay gumagamit ng scale-to-zero, kaya't magbabayad ka lamang kapag ang API ay nagpo-proseso ng mga request:

- **Idle cost**: ~$0/buwan (scaled to zero)
- **Active cost**: ~$0.000024/segundo bawat replica
- **Inaasahang buwanang gastos** (magaan na paggamit): $5-15

### Karagdagang Paraan para Makatipid

```bash
# Bawasan ang max replicas para sa dev
azd env set MAX_REPLICAS 3

# Gumamit ng mas maikling idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuto
```

## Pag-aayos ng Problema

### Hindi Nag-i-start ang Container

```bash
# Suriin ang mga log ng container
azd logs api --tail 100

# Tiyakin na ang Docker image ay nabubuo nang lokal
docker build -t test ./src
```

### Hindi Ma-access ang API

```bash
# Tiyakin na ang ingress ay panlabas
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Mataas na Response Times

```bash
# Suriin ang paggamit ng CPU/Memory
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Dagdagan ang mga mapagkukunan kung kinakailangan
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Paglilinis

```bash
# Tanggalin ang lahat ng mga mapagkukunan
azd down --force --purge
```

## Mga Susunod na Hakbang

### Palawakin ang Halimbawang Ito

1. **Magdagdag ng Database** - I-integrate ang Azure Cosmos DB o SQL Database
   ```bash
   # Magdagdag ng Cosmos DB module sa infra/main.bicep
   # I-update ang app.py gamit ang koneksyon sa database
   ```

2. **Magdagdag ng Authentication** - Mag-implement ng Azure AD o API keys
   ```python
   # Magdagdag ng authentication middleware sa app.py
   from functools import wraps
   ```

3. **Mag-set Up ng CI/CD** - Workflow ng GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Magdagdag ng Managed Identity** - Siguraduhing access sa Azure services
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Kaugnay na Mga Halimbawa

- **[Database App](../../../../../examples/database-app)** - Kumpletong halimbawa na may SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service architecture
- **[Container Apps Master Guide](../README.md)** - Lahat ng container patterns

### Mga Mapagkukunan sa Pag-aaral

- 📚 [AZD Para sa Mga Baguhan na Kurso](../../../README.md) - Pangunahing kurso
- 📚 [Container Apps Patterns](../README.md) - Higit pang deployment patterns
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Mga template mula sa komunidad

## Karagdagang Mapagkukunan

### Dokumentasyon
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Gabay sa Flask framework
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Opisyal na dokumentasyon ng Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd command reference

### Mga Tutorial
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - I-deploy ang iyong unang app
- **[Python sa Azure](https://learn.microsoft.com/azure/developer/python/)** - Gabay sa pag-develop gamit ang Python
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### Mga Tool
- **[Azure Portal](https://portal.azure.com)** - Pamahalaan ang mga resources nang biswal
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrasyon sa IDE

---

**🎉 Binabati Kita!** Na-deploy mo na ang isang production-ready Flask API sa Azure Container Apps na may auto-scaling at monitoring.

**May Tanong?** [Magbukas ng isyu](https://github.com/microsoft/AZD-for-beginners/issues) o tingnan ang [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->