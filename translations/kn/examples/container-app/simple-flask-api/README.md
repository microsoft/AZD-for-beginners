# Simple Flask API - Container App ಉದಾಹರಣೆ

**ಕಲಿಕೆ ಮಾರ್ಗ:** ಆರಂಭಿಕ ⭐ | **ಸಮಯ:** 25-35 ನಿಮಿಷ | **ಖರ್ಚು:** $0-15/ತಿಂಗಳು

ಒಂದು ಸಂಪೂರ್ಣ, ಕಾರ್ಯನಿರತ Python Flask REST API ಅನ್ನು Azure Developer CLI (azd) ಬಳಸಿ Azure Container Apps ಗೆ ನಿಯೋಜಿಸಲಾಗಿದೆ. ಈ ಉದಾಹರಣೆ ಕಂಟೇನರ್ ನಿಯೋಜನೆ, ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆಯ ಮೂಲಭೂತಾಂಶಗಳನ್ನು ತೋರಿಸುತ್ತದೆ.

## 🎯 ನೀವು ಏನು ಕಲಿಯುತ್ತೀರಿ

- ಕಂಟೇನರೈಸ್ ಮಾಡಿದ Python ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು Azure ಗೆ ನಿಯೋಜಿಸುವುದು
- ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡುವ ಮೂಲಕ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚಿಸುವುದು
- ಹೆಲ್ತ್ ಪ್ರೋಬ್‌ಗಳು ಮತ್ತು ರೆಡಿನೆಸ್ ಚೆಕ್‌ಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳು ಮತ್ತು ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡುವುದು
- ತ್ವರಿತ ನಿಯೋಜನೆಗಾಗಿ Azure Developer CLI ಬಳಸುವುದು

## 📦 ಏನು ಒಳಗೊಂಡಿದೆ

✅ **Flask ಅಪ್ಲಿಕೇಶನ್** - CRUD ಕಾರ್ಯಾಚರಣೆಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ REST API (`src/app.py`)  
✅ **Dockerfile** - ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ ಕಂಟೇನರ್ ಸಂರಚನೆ  
✅ **Bicep ಮೂಲಸೌಕರ್ಯ** - Container Apps ಪರಿಸರ ಮತ್ತು API ನಿಯೋಜನೆ  
✅ **AZD ಸಂರಚನೆ** - ಒಂದೇ ಕಮಾಂಡ್ ನಿಯೋಜನೆ ಸರಂಜಾಮು  
✅ **Health Probes** - Liveness ಮತ್ತು readiness ಪರಿಶೀಲನೆಗಳು ಸಂರಚಿಸಲಾಗಿದೆ  
✅ **Auto-scaling** - HTTP ಲೋಡ್ ಆಧಾರಿತ 0-10 ರೆಪ್ಲಿಕಾ ಗಳು  

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

## ಪೂರ್ವಾವಶ್ಯಕತೆಗಳು

### ಅಗತ್ಯಗಳು
- **Azure Developer CLI (azd)** - [ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure ಚಂದಾ** - [ಉಚಿತ ಖಾತೆ](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker ಅನ್ನು ಸ್ಥಾಪಿಸಿ](https://www.docker.com/products/docker-desktop/) (ಸ್ಥಳೀಯ ಪರೀಕ್ಷೆಗಾಗಿ)

### ಪೂರ್ವಾವಶ್ಯಕತೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
# azd ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ (ಅವಶ್ಯಕತೆ 1.5.0 ಅಥವಾ ಇದಕ್ಕಿಂತ ಹೆಚ್ಚು)
azd version

# Azure ಲಾಗಿನ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ
azd auth login

# Docker ಅನ್ನು ಪರಿಶೀಲಿಸಿ (ಐಚ್ಛಿಕ, ಸ್ಥಳೀಯ ಪರೀಕ್ಷೆಗಾಗಿ)
docker --version
```

## ⏱️ ನಿಯೋಜನೆ ಸಮಯರೇಖೆ

| ಘಟ್ಟ | ಕಾಲಾವಧಿ | ಏನು ಸಂಭವಿಸುತ್ತದೆ |
|-------|----------|--------------||
| ಪರಿಸರ ಸಿದ್ಧತೆ | 30 ಸೆಕೆಂಡುಗಳು | azd ವಾತಾವರಣ ರಚನೆ |
| ಕಂಟೇನರ್ ರಚನೆ | 2-3 ನಿಮಿಷ | Docker ಮೂಲಕ Flask ಅಪ್ಲಿಕೇಶನ್ ನಿರ್ಮಾಣ |
| ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆ | 3-5 ನಿಮಿಷ | Container Apps, ರಜಿಸ್ಟ್ರಿ ಮತ್ತು ಮೋನಿಟರಿಂಗ್ ರಚನೆ |
| ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ | 2-3 ನಿಮಿಷ | ಇಮೇಜ್ push ಮಾಡಿ ಮತ್ತು Container Apps ಗೆ ನಿಯೋಜಿಸಿ |
| **ಒಟ್ಟು** | **8-12 ನಿಮಿಷ** | ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಸಿದ್ಧವಾಗಿದೆ |

## ತ್ವರಿತ ಪ್ರಾರಂಭ

```bash
# ಉದಾಹರಣೆಗೆ ತೆರಳಿ
cd examples/container-app/simple-flask-api

# ಪರಿಸರವನ್ನು ಆರಂಭಿಸಿ (ವಿಶಿಷ್ಟ ಹೆಸರು ಆಯ್ಕೆ ಮಾಡಿ)
azd env new myflaskapi

# ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ (ಮೂಲಸೌಕರ್ಯ + ಅಪ್ಲಿಕೇಶನ್)
azd up
# ನಿಮಗೆ ಕೆಳಗಿನವುಗಳನ್ನು ಕೇಳಲಾಗುತ್ತದೆ:
# 1. Azure ಚಂದಾವನ್ನು ಆಯ್ಕೆಮಾಡಿ
# 2. ಸ್ಥಳವನ್ನು ಆಯ್ಕೆಮಾಡಿ (ಉದಾ., eastus2)
# 3. ನಿಯೋಜನೆಗಾಗಿ 8-12 ನಿಮಿಷ ಕಾಯಿರಿ

# ನಿಮ್ಮ API ಎಂಡ್‌ಪಾಯಿಂಟ್ ಅನ್ನು ಪಡೆಯಿರಿ
azd env get-values

# API ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl $(azd env get-value API_ENDPOINT)/health
```

**ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ

### ಹಂತ 1: ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
# ಅಳವಡಿಸಿದ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್ ತೋರಿಸುತ್ತದೆ:
# - ಸೇವೆ: api
# - ಎಂಡ್‌ಪಾಯಿಂಟ್: https://ca-api-[env].xxx.azurecontainerapps.io
# - ಸ್ಥಿತಿ: ಚಾಲನೆಯಲ್ಲಿದೆ
```

### ಹಂತ 2: API ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ

```bash
# API ಎಂಡ್‌ಪಾಯಿಂಟ್ ಪಡೆಯಿರಿ
API_URL=$(azd env get-value API_ENDPOINT)

# ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ
curl $API_URL/health

# ಮೂಲ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಪರೀಕ್ಷೆ
curl $API_URL/

# ಒಂದು ಐಟಂ ರಚಿಸಿ
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# ಎಲ್ಲಾ ಐಟಂಗಳನ್ನು ಪಡೆಯಿರಿ
curl $API_URL/api/items
```

**ಯಶಸ್ಸಿನ ಮಾಪಕಗಳು:**
- ✅ Health ಎಂಡ್ಪಾಯಿಂಟ್ HTTP 200 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ
- ✅ ರೂಟ್ ಎಂಡ್ಪಾಯಿಂಟ್ API ಮಾಹಿತಿ ತೋರಿಸುತ್ತದೆ
- ✅ POST ಐಟಂ ಅನ್ನು ರಚಿಸಿ ಮತ್ತು HTTP 201 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ
- ✅ GET ರಚಿಸಿದ ಐಟಂಗಳನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ

### ಹಂತ 3: ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ

```bash
# azd monitor ಅನ್ನು ಬಳಸಿ ಲೈವ್ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs

# ಅಥವಾ Azure CLI ಬಳಸಿ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ನೀವು ಕೆಳಕಂಡವುಗಳನ್ನು ಕಾಣಬೇಕು:
# - Gunicorn ಪ್ರಾರಂಭದ ಸಂದೇಶಗಳು
# - HTTP ವಿನಂತಿ ಲಾಗ್‌ಗಳು
# - ಅಪ್ಲಿಕೇಶನ್ ಮಾಹಿತಿ ಲಾಗ್‌ಗಳು
```

## ಯೋಜನೆ ಸಂರಚನೆ

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

## API ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು

| ಎಂಡ್‌ಪಾಯಿಂಟ್ | ವಿಧಾನ | ವಿವರಣೆ |
|----------|--------|-------------|
| `/health` | GET | ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ |
| `/api/items` | GET | ಎಲ್ಲಾ ಐಟಂಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ |
| `/api/items` | POST | ಹೊಸ ಐಟಂ ರಚಿಸಿ |
| `/api/items/{id}` | GET | ನಿರ್ದಿಷ್ಟ ಐಟಂ ಪಡೆಯಿ |
| `/api/items/{id}` | PUT | ಐಟಂ ಅನ್ನು ನವೀಕರಿಸಿ |
| `/api/items/{id}` | DELETE | ಐಟಂ ಅನ್ನು ಅಳಿಸಿ |

## ಸಂರಚನೆ

### ಪರಿಸರ ವೇರಿಯಬಲ್ಗಳು

```bash
# ಕಸ್ಟಮ್ ಸಂರಚನೆಯನ್ನು ಹೊಂದಿಸಿ
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

API HTTP ಟ್ರಾಫಿಕ್ ಆಧಾರವಾಗಿ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸ್ಕೇಲ್ ಆಗುತ್ತದೆ:
- **ಕನಿಷ್ಠ ರೆಪ್ಲಿಕಾಗಳು (Min Replicas)**: 0 (ನಿಶ್ಚಲವಾಗಿರುವಾಗ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಆಗುತ್ತದೆ)
- **ಗರಿಷ್ಠ ರೆಪ್ಲಿಕಾಗಳು (Max Replicas)**: 10
- **ಪ್ರತಿ ರೆಪ್ಲಿಕೆಗೆ ಸಮಕಾಲೀನ ವಿನಂತಿಗಳು**: 50

## ಅಭಿವೃದ್ಧಿ

### ಸ್ಥಳೀಯವಾಗಿ ರನ್ ಮಾಡಿ

```bash
# ಆಶ್ರಿತಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
cd src
pip install -r requirements.txt

# ಆಪ್ ಅನ್ನು ಚಲಾಯಿಸಿ
python app.py

# ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
curl http://localhost:8000/health
```

### ಕಂಟೇನರ್ ನಿರ್ಮಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

```bash
# ಡಾಕರ್ ಇಮೇಜ್ ನಿರ್ಮಿಸಿ
docker build -t flask-api:local ./src

# ಕಂಟೇನರ್ನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಚಲಾಯಿಸಿ
docker run -p 8000:8000 flask-api:local

# ಕಂಟೇನರ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl http://localhost:8000/health
```

## ನಿಯೋಜನೆ

### ಪೂರ್ಣ ನಿಯೋಜನೆ

```bash
# ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up
```

### ಕೋಡ್-ಮಾತ್ರ ನಿಯೋಜನೆ

```bash
# ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ಭೌತಸೌಕರ್ಯ ಬದಲಾಯಿಸದೆ)
azd deploy api
```

### ಸಂರಚನೆ ನವೀಕರಣ

```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ನವೀಕರಿಸಿ
azd env set API_KEY "new-api-key"

# ಹೊಸ ರಚನೆಯೊಂದಿಗೆ ಮರು ಜಾರಿಗೆ ತರಿಸಿ
azd deploy api
```

## ಮೇಲ್ವಿಚಾರಣೆ

### ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ

```bash
# azd monitor ಬಳಸಿ ಸಜೀವ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs

# ಅಥವಾ Container Apps ಗಾಗಿ Azure CLI ಬಳಸಿ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ಕೊನೆಯ 100 ಸಾಲುಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ

```bash
# Azure Monitor ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆyಿರಿ
azd monitor --overview

# ನಿರ್ದಿಷ್ಟ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## ಪರೀಕ್ಷೆ

### ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

ನಿರೀಕ್ಷಿತ ಪ್ರತಿಕ್ರಿಯೆ:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### ಐಟಂ ರಚನೆ

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### ಎಲ್ಲ ಐಟಂಗಳನ್ನು ಪಡೆಯಿ

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ವೆಚ್ಚ ಉಳಿತಾಯ

ಈ ನಿಯೋಜನೆ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡುವುದನ್ನು ಬಳಸುತ್ತದೆ, ಆದ್ದರಿಂದ API ವಿನಂತಿಗಳನ್ನು ಪ್ರಕ್ರಿಯೆ ಮಾಡುತ್ತಿರುವಾಗ ಮಾತ್ರ ನೀವು ಪಾವತಿ ಮಾಡುತ್ತೀರಿ:

- **ನಿಶ್ಚಲ ವೆಚ್ಚ**: ~ $0/ತಿಂಗಳು (ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಆಗಿದೆ)
- **ಸಕ್ರಿಯ ವೆಚ್ಚ**: ~ $0.000024/ಸೆಕೆಂಡು ಪ್ರತಿಯೊಂದು ರೆಪ್ಲಿಕಾ
- **ನಿರೀಕ್ಷಿತ ಮಾಸಿಕ ವೆಚ್ಚ** (ಸಣ್ಣ ಬಳಕೆ): $5-15

### ವೆಚ್ಚವನ್ನು ಇನ್ನಷ್ಟು ಕಡಿಮೆಮಾಡಿ

```bash
# ಡೆವ್‌ಗಾಗಿ ಗರಿಷ್ಠ ರೆಪ್ಲಿಕಾಗಳನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set MAX_REPLICAS 3

# ಸಣ್ಣ ಐಡಲ್ ಟೈಮೌಟ್ ಅನ್ನು ಬಳಸಿ
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 ನಿಮಿಷ
```

## ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಕಂಟೇನರ್ ಪ್ರಾರಂಭವಾಗುತ್ತಿಲ್ಲ

```bash
# Azure CLI ಬಳಸಿ ಕಂಟೇನರ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker ಇಮೇಜ್‌ಗಳ ನಿರ್ಮಾಣವನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪರಿಶೀಲಿಸಿ
docker build -t test ./src
```

### API ಪ್ರವೇಶಿಸಬಹುದಿಲ್ಲ

```bash
# ingress ಬಾಹ್ಯವಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### ಉತ್ತರದ ಸಮಯ ಹೆಚ್ಚು

```bash
# CPU/Memory ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ಅಗತ್ಯವಿದ್ದರೆ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಹೆಚ್ಚಿಸಿ
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ಶುದ್ಧಗೊಳಿಸಿ

```bash
# ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ
azd down --force --purge
```

## ಮುಂದಿನ ಹಂತಗಳು

### ಈ ಉದಾಹರಣೆಯನ್ನು ವಿಸ್ತರಿಸಿ

1. **ಡೇಟಾಬೇಸ್ ಸೇರಿಸಿ** - Azure Cosmos DB ಅಥವಾ SQL ಡೇಟಾಬೇಸ್ ಅನ್ನು ಏಕೀಕರಿಸಿ
   ```bash
   # infra/main.bicep ಗೆ Cosmos DB ಮೋಡ್ಯೂಲ್ ಅನ್ನು ಸೇರಿಸಿ
   # ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕದೊಂದಿಗೆ app.py ಅನ್ನು ನವೀಕರಿಸಿ
   ```

2. **ಪ್ರಮಾಣೀಕರಣ ಸೇರಿಸಿ** - Azure AD ಅಥವಾ API ಕೀಲಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
   ```python
   # app.py ಗೆ ಪ್ರಮಾಣೀಕರಣ ಮಧ್ಯವರ್ತಿಯನ್ನು ಸೇರಿಸಿ
   from functools import wraps
   ```

3. **CI/CD ಸ್ಥಾಪಿಸಿ** - GitHub Actions ಕಾರ್ಯಪ್ರವಾಹ
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity ಸೇರಿಸಿ** - Azure ಸೇವೆಗಳಿಗೆ ಸುರಕ್ಷಿತ ಪ್ರವೇಶ ಒದಗಿಸಿ
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ಸಂಬಂಧಿತ ಉದಾಹರಣೆಗಳು

- **[ಡೇಟಾಬೇಸ್ ಅಪ್ಲಿಕೇಶನ್](../../../../../examples/database-app)** - SQL ಡೇಟಾಬೇಸ್ ಜೊತೆ ಸಂಪೂರ್ಣ ಉದಾಹರಣೆ
- **[ಮೈಕ್ರೋಸರ್ವಿಸಸ್](../../../../../examples/container-app/microservices)** - ಬಹು-ಸೇವಾ ವಿನ್ಯಾಸ
- **[Container Apps ಮಾಸ್ಟರ್ ಗೈಡ್](../README.md)** - ಎಲ್ಲಾ ಕಂಟೇನರ್ ಮಾದರಿಗಳು

### ಅಧ್ಯಯನ ಸಂಪನ್ಮೂಲಗಳು

- 📚 [ಆರಂಭಿಕರಿಗಾಗಿ AZD ಕೋರ್ಸ್](../../../README.md) - ಮುಖ್ಯ ಕೋರ್ಸ್ ಪುಟ
- 📚 [Container Apps ಮಾದರಿಗಳು](../README.md) - ಹೆಚ್ಚಿನ ನಿಯೋಜನೆ ಮಾದರಿಗಳು
- 📚 [AZD ಟೆಂಪ್ಲೇಟ್ಸ್ ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/) - ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟ್ಗಳು

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- **[Flask ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://flask.palletsprojects.com/)** - Flask ಫ್ರೇಮ್ವರ್ಕ್ ಮಾರ್ಗದರ್ಶಿ
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - ಅಧಿಕೃತ Azure ದಾಖಲೆಗಳು
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd ಕಮಾಂಡ್ ಉಲ್ಲೇಖ

### ಟ್ಯೂಟೋರಿಯಲ್ಗಳು
- **[Container Apps ಕ್ವಿಕ್‌ಸ್ಟಾರ್ಟ್](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - ನಿಮ್ಮ ಮೊದಲ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
- **[Azure ಮೇಲೆ Python](https://learn.microsoft.com/azure/developer/python/)** - Python ಅಭಿವೃದ್ಧಿ ಮಾರ್ಗದರ್ಶಿ
- **[Bicep ಭಾಷೆ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - ಕೋಡ್ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ

### ಉಪಕರಣಗಳು
- **[Azure ಪೋರ್ಟಲ್](https://portal.azure.com)** - ಸಂಪನ್ಮೂಲಗಳನ್ನು ದೃಶ್ಯವಾಗಿ ನಿರ್ವಹಿಸಿ
- **[VS Code Azure ವಿಸ್ತಾರ](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ಏಕೀಕರಣ

---

**🎉 ಅಭಿನಂದನೆಗಳು!** ನೀವು ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆಯೊಂದಿಗೆ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ Flask API ಅನ್ನು Azure Container Apps ಗೆ ನಿಯೋಜಿಸಿದ್ದೀರಿ.

**ಪ್ರಶ್ನೆಗಳು?** [ಇಶ್ಯೂ ತೆರೆಯಿರಿ](https://github.com/microsoft/AZD-for-beginners/issues) ಅಥವಾ [ಸಾಮಾನ್ಯವಾಗಿ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು](../../../resources/faq.md) ಪರಿಶೀಲಿಸಿ

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಎಂಬ AI ಅನುವಾದ ಸೇವೆ ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯತ್ತ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸ್ಪಷ್ಟತೆಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಾಖಲೆ ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಅಥವಾ ನಿರ್ಧಾರಾತ್ಮಕ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗೊಳ್ಳುವಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವಿವರಣೆಗಳ үчүн ನಾವು ಹೊಣೆಗಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->