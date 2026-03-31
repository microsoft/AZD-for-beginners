# ಸರಳ Flask API - ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆ

**ಅಧ್ಯಯನ ಮಾರ್ಗ:** ಆರಂಭಿಕ ⭐ | **ಸಮಯ:** 25-35 ನಿಮಿಷಗಳು | **ಖರ್ಚು:** $0-15/ತಿಂಗಳು

ಸಂಪೂರ್ಣವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುವ Python Flask REST API ಅನ್ನು Azure Container Apps ಗೆ Azure Developer CLI (azd) ಬಳಸಿ ನಿಯೋಜಿಸಲಾಗಿದೆ. ಈ ಉದಾಹರಣೆ ಕಂಟೇನರ್ ನಿಯೋಜನೆ, ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಮೂಲಭೂತಗಳನ್ನು ತೋರಿಸುತ್ತದೆ.

## 🎯 ನೀವು ಏನು ಕಲಿಯುತ್ತೀರಿ

- Azure ಗೆ ಕಂಟೇನರ್‌ಗೊಳಿಸಿದ Python ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸುವುದು
- scale-to-zero ಜೊತೆಗೆ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸುವುದು
- ಆರೋಗ್ಯ ಪ್ರೊಬ್‌ಗಳು ಮತ್ತು ರೆಡಿನೆಸ್ ಪರಿಶೀಲನೆಗಳನ್ನು ಜಾರಿಗೆ ತರಲು
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳು ಮತ್ತು ಮೆಟ್ರಿಕ್ಸ್‌ಗಳನ್ನು ಮಾನಿಟರ್ ಮಾಡುವುದು
- ವೇಗದ ನಿಯೋಜನೆಗೆ Azure Developer CLI ಅನ್ನು ಬಳಸಿ

## 📦 ಏನು ಸೇರಿದೆ

✅ **Flask ಅಪ್ಲಿಕೇಶನ್** - CRUD ಕಾರ್ಯಾಚರಣೆಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ REST API (`src/app.py`)  
✅ **Dockerfile** - ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ ಕಂಟೇನರ್ ಸಂರಚನೆ  
✅ **Bicep ಮೂಲಸೌಕರ್ಯ** - Container Apps ಪರಿಸರ ಮತ್ತು API ನಿಯೋಜನೆ  
✅ **AZD ಸಂರಚನೆ** - ಒಂದೇ ಕಮಾಂಡ್‌ನಿಂದ ನಿಯೋಜನೆ ಸೆಟ್‌ಅಪ್  
✅ **ಆರೋಗ್ಯ ಪ್ರೊಬ್‌‌ಗಳು** - ಲೈವ್‌ನೆಸ್ ಮತ್ತು ರೆಡಿನೆಸ್ ಪರಿಶೀಲನೆಗಳು ಸಂರಚಿಸಲಾಗಿದೆ  
✅ **ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್** - HTTP ಲೋಡ್ ಆಧಾರಿತವಾಗಿ 0-10 ರಿಪ್ಲಿಕಾಗಳು  

## Architecture

```mermaid
graph TD
    subgraph ACA[ಆಜ್ಯೂರ್ ಕಂಟೈನರ್ ಅಪ್ಸ್ ಪರಿಸರ]
        Flask[Flask API ಕಂಟೈನರ್<br/>ಆರೋಗ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು<br/>REST ಎಪಿಐ<br/>ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ 0-10 ಪ್ರತಿಗಳು]
        AppInsights[ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್]
    end
```
##Prerequisites

### ಅವಶ್ಯಕತೆಗಳು
- **Azure Developer CLI (azd)** - [ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [ಉಚಿತ ಖಾತೆ](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker ಅನ್ನು ಇನ್ಸ್ಟಾಲ್ ಮಾಡಿ](https://www.docker.com/products/docker-desktop/) (ಸ್ಥಳೀಯ ಪರೀಕ್ಷೆಗಾಗಿ)

### ಪೂರ್ವಾಪೇಕ್ಷಿತಗಳನ್ನು ಪರಿಶೀಲಿಸಿ

```bash
# azd ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ (ಅವಶ್ಯಕ: 1.5.0 ಅಥವಾ ಹೆಚ್ಚು)
azd version

# Azure ಲಾಗಿನ್ ಪರಿಶೀಲಿಸಿ
azd auth login

# Docker ಪರಿಶೀಲಿಸಿ (ಐಚ್ಛಿಕ, ಸ್ಥಳೀಯ ಪರೀಕ್ಷೆಗಾಗಿ)
docker --version
```

## ⏱️ ನಿಯೋಜನೆ ವೇಳಾಪಟ್ಟಿ

| ಹಂತ | ಅವಧಿ | ಏನಾಗುತ್ತದೆ |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **ಒಟ್ಟು** | **8-12 ನಿಮಿಷಗಳು** | ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಸಿದ್ಧವಾಗಿದೆ |

## ತ್ವರಿತ ಪ್ರಾರಂಭ

```bash
# ಉದಾಹರಣೆಗೆ ನವಿಗೇಟ್ ಮಾಡಿ
cd examples/container-app/simple-flask-api

# ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ (ಅದ್ವಿತೀಯ ಹೆಸರು ಆಯ್ಕೆ ಮಾಡಿ)
azd env new myflaskapi

# ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ (ಮೂಲಸೌಕರ್ಯಗಳು + ಅಪ್ಲಿಕೇಶನ್)
azd up
# ನಿಮಗೆ ಕೆಳಕಂಡವು ಕೇಳಲಾಗುತ್ತದೆ:
# 1. Azure ಚಂದಾದಾರಿಕೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ
# 2. ಸ್ಥಳ ಆಯ್ಕೆ ಮಾಡಿ (ಉದಾ., eastus2)
# 3. ನಿಯೋಜನೆಗೆ 8-12 ನಿಮಿಷಗಳ ಕಾಲ ಕಾಯಿರಿ

# ನಿಮ್ಮ API ಎಂಡ್‌ಪಾಯಿಂಟ್ ಪಡೆಯಿರಿ
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
# ಡೆಪ್ಲಾಯ್ ಮಾಡಿದ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್ ತೋರಿಸುತ್ತದೆ:
# - ಸೇವೆ: api
# - ಎಂಡ್‌ಪಾಯಿಂಟ್: https://ca-api-[env].xxx.azurecontainerapps.io
# - ಸ್ಥಿತಿ: ಓಡುತ್ತಿದೆ
```

### ಹಂತ 2: API ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ

```bash
# API ಎಂಡ್‌ಪಾಯಿಂಟ್ ಪಡೆಯಿರಿ
API_URL=$(azd env get-value API_ENDPOINT)

# ಆರೋಗ್ಯ ಪರಿಶೀಲಿಸಿ
curl $API_URL/health

# ಮೂಲ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಪರಿಶೀಲಿಸಿ
curl $API_URL/

# ಒಂದು ಐಟಂ ರಚಿಸಿ
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# ಎಲ್ಲಾ ಐಟಂಗಳನ್ನು ಪಡೆಯಿರಿ
curl $API_URL/api/items
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- ✅ ಆರೋಗ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್ HTTP 200 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ
- ✅ ರೂಟ್ ಎಂಡ್‌ಪಾಯಿಂಟ್ API ಮಾಹಿತಿ ತೋರಿಸುತ್ತದೆ
- ✅ POST ಹೊಸ ಐಟಂ ಅನ್ನು ರಚಿಸುತ್ತದೆ ಮತ್ತು HTTP 201 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ
- ✅ GET ರಚಿಸಿದ ಐಟಂಗಳನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ

### ಹಂತ 3: ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ

```bash
# azd monitor ಬಳಸಿ ನೇರ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs

# ಅಥವಾ Azure CLI ಬಳಸಿ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ನೀವು ಕಾಣಬೇಕು:
# - Gunicorn ಆರಂಭಿಕ ಸಂದೇಶಗಳು
# - HTTP ವಿನಂತಿ ಲಾಗ್‌ಗಳು
# - ಅಪ್ಲಿಕೇಶನ್ ಮಾಹಿತಿ ಲಾಗ್‌ಗಳು
```

## ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ

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

## API ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು

| ಎಂಡ್‌ಪಾಯಿಂಟ್ | ವಿಧಾನ | ವಿವರಣೆ |
|----------|--------|-------------|
| `/health` | GET | ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ |
| `/api/items` | GET | ಎಲ್ಲಾ ಐಟಂಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡುವುದು |
| `/api/items` | POST | ಹೊಸ ಐಟಂ ರಚಿಸುವುದು |
| `/api/items/{id}` | GET | ನಿರ್ದಿಷ್ಟ ಐಟಂ ಪಡೆಯುವುದು |
| `/api/items/{id}` | PUT | ಐಟಂ ನವೀಕರಿಸುವುದು |
| `/api/items/{id}` | DELETE | ಐಟಂ ಅಳಿಸುವುದು |

## ಸಂರಚನೆ

### ಪರಿಸರ ಚರಗಳು

```bash
# ಕಸ್ಟಮ್ ಸಂರಚನೆಯನ್ನು ಹೊಂದಿಸಿ
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

API HTTP ಟ್ರಾಫಿಕ್ ಆಧಾರವಾಗಿ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಆಗುತ್ತದೆ:
- **ಕನಿಷ್ಠ ರಿಪ್ಲಿಕಾಗಳು**: 0 (ಆರಾಮಾವಸ್ಥೆಯಲ್ಲಿ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡುತ್ತದೆ)
- **ಗರಿಷ್ಟ ರಿಪ್ಲಿಕಾಗಳು**: 10
- **ಪ್ರತಿ ರಿಪ್ಲಿಕೆಗೆ ಸಮಕಾಲೀನ ವಿನಂತಿಗಳು**: 50

## ಅಭಿವೃದ್ಧಿ

### ಸ್ಥಳೀಯವಾಗಿ ಚಾಲನೆ ಮಾಡಿ

```bash
# ಆಶ್ರಿತತೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
cd src
pip install -r requirements.txt

# ಅ್ಯಾಪ್ ಅನ್ನು ಓಡಿಸಿ
python app.py

# ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
curl http://localhost:8000/health
```

### ಕಂಟೇನರ್ ನಿರ್ಮಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

```bash
# Docker ಇಮೇಜ್ ನಿರ್ಮಿಸಿ
docker build -t flask-api:local ./src

# ಕಂಟೈನರ್ ಅನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಓಡಿಸಿ
docker run -p 8000:8000 flask-api:local

# ಕಂಟೈನರ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl http://localhost:8000/health
```

## ನಿಯೋಜನೆ

### ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ

```bash
# ಮೂಲಭೂತ ಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲიკೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up
```

### ಕೋಡ್-ಮಾತ್ರ ನಿಯೋಜನೆ

```bash
# ಮಾತ್ರಾಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ಮೂಲಸೌಕರ್ಯ ಅಪ್ರಭಾವಿತವಾಗಿರಲಿ)
azd deploy api
```

### ಸಂರಚನೆ ನವೀಕರಿಸಿ

```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ನವೀಕರಿಸಿ
azd env set API_KEY "new-api-key"

# ಹೊಸ ಸಂರಚನೆಯೊಂದಿಗೆ ಮರು ನಿಯೋಜಿಸಿ
azd deploy api
```

## ಮಾನಿಟರಿಂಗ್

### ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ

```bash
# azd monitor ಬಳಸಿ ಲೈವ್ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs

# ಅಥವಾ Container Apps‌ಗಾಗಿ Azure CLI ಬಳಸಿ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ಕೊನೆಯ 100 ಸಾಲುಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### ಮೆಟ್ರಿಕ್ಸ್‌ಗಳನ್ನು ಮಾನಿಟರ್ ಮಾಡಿ

```bash
# Azure Monitor ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
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

### ಎಲ್ಲಾ ಐಟಂಗಳನ್ನು ಪಡೆಯಿರಿ

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಸೇಶನ್

ಈ ನಿಯೋಜನೆ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಅನ್ನು ಬಳಸುತ್ತದೆ, ಆದ್ದರಿಂದ API ವಿನಂತಿಗಳನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸುತ್ತಿರುವಾಗ ಮಾತ್ರ ನೀವು ಪಾವತಿಸುತ್ತೀರಿ:

- **ಐಡಲ್ ವೆಚ್ಚ**: ~ $0/ತಿಂಗಳು (ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್)
- **ಸಕ್ರಿಯ ವೆಚ್ಚ**: ~ $0.000024/ಸೆಕೆಂಡು ಪ್ರತಿ ರಿಪ್ಲಿಕಾ
- **ನಿರೀಕ್ಷಿತ ಮಾಸಿಕ ವೆಚ್ಚ** (ಸೌಮ್ಯ ಬಳಕೆ): $5-15

### ವೆಚ್ಚವನ್ನು ಇನ್ನೂ ಕಡಿಮೆ ಮಾಡುವುದು

```bash
# ಡೆವ್‌ಗಾಗಿ ಗರಿಷ್ಠ ರೆಪ್ಲಿಕಾಗಳನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set MAX_REPLICAS 3

# ಸಣ್ಣ ನಿಷ್ಕ್ರಿಯ ಸಮಯ ಮಿತಿಯನ್ನು ಬಳಸಿ
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 ನಿಮಿಷ
```

## ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಕಂಟೇನರ್ ಚಾಲನೆ ಆಗುತ್ತಿಲ್ಲ

```bash
# Azure CLI ಬಳಸಿ ಕಂಟೈನರ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# ಡಾಕರ್ ಇಮೇಜ್ ಸ್ಥಳೀಯವಾಗಿ ನಿರ್ಮಾಣವಾಗುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
docker build -t test ./src
```

### API ಪ್ರವೇಶಿಸಲಾಗುತ್ತಿಲ್ಲ

```bash
# ಇಂಗ್ರೆಸ್ ಬಾಹ್ಯವಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### ಉತ್ತರ ಸಮಯಗಳು ಹೆಚ್ಚಾಗಿವೆ

```bash
# CPU/ಮೆಮೊರಿ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ಅಗತ್ಯವಿದ್ದರೆ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಹೆಚ್ಚಿಸಿ
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ಸಂಪನ್ಮೂಲ ನಿವಾರಣೆ

```bash
# ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ
azd down --force --purge
```

## ಮುಂದಿನ ಹೆಜ್ಜೆಗಳು

### ಈ ಉದಾಹರಣೆಯನ್ನು ವಿಸ್ತರಿಸಿ

1. **ಡೇಟಾಬೇಸ್ ಸೇರಿಸಿ** - Azure Cosmos DB ಅಥವಾ SQL Database ಅನ್ನು ಏಕೀಕರಿಸಿ
   ```bash
   # infra/main.bicep ಗೆ Cosmos DB ಮಾಡ್ಯೂಲ್ ಸೇರಿಸಿ
   # app.py ಅನ್ನು ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕದೊಂದಿಗೆ ನವೀಕರಿಸಿ
   ```

2. **ಪ್ರಮಾಣೀಕರಣ ಸೇರಿಸಿ** - Azure AD ಅಥವಾ API ಕೀಲಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
   ```python
   # app.py ಗೆ ಪ್ರಮಾಣೀಕರಣ ಮಿಡಲ್‌ವೇರ್ ಸೇರಿಸಿ
   from functools import wraps
   ```

3. **CI/CD ಸ್ಥಾಪಿಸಿ** - GitHub Actions ವರ್ಕ್‌ಫ್ಲೋ
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity ಸೇರಿಸಿ** - Azure ಸೇವೆಗಳ ಪ್ರವೇಶವನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸಿ
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ಸಂಬಂಧಿತ ಉದಾಹರಣೆಗಳು

- **[ಡೇಟಾಬೇಸ್ ಅಪ್ಲಿಕೇಶನ್](../../../../../examples/database-app)** - SQL Database ಹೊಂದಿರುವ ಪೂರ್ಣ ಉದಾಹರಣೆ
- **[Microservices](../../../../../examples/container-app/microservices)** - ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪ
- **[Container Apps Master Guide](../README.md)** - ಎಲ್ಲಾ ಕಂಟೇನರ್ ಮಾದರಿಗಳು

### ಕಲಿಕೆ ಸಂಪನ್ಮೂಲಗಳು

- 📚 [AZD For Beginners Course](../../../README.md) - ಮುಖ್ಯ ಕೋರ್ಸ್ ಪುಟ
- 📚 [Container Apps Patterns](../README.md) - ಇನ್ನಷ್ಟು ನಿಯೋಜನೆ ಮಾದರಿಗಳು
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟುಗಳು

## 추가 ಸಂಪನ್ಮೂಲಗಳು

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask ಫ್ರೇಮ್ವರ್ಕ್ ಮಾರ್ಗದರ್ಶಿ
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - ಅಧಿಕೃತ Azure ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd ಕಮಾಂಡ್ ರೆಫರೆನ್ಸ್

### ಟ್ಯುಟೋರಿಯಲ್ಗಳು
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - ನಿಮ್ಮ ಮೊದಲ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python ಅಭಿವೃದ್ಧಿ ಮಾರ್ಗದರ್ಶಿ
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - ಕೋಡ್ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ

### ಸಾಧನಗಳು
- **[Azure Portal](https://portal.azure.com)** - ಸಂಪನ್ಮೂಲಗಳನ್ನು ದೃಶ್ಯವಾಗಿ ನಿರ್ವಹಿಸಿ
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ಏಕೀಕರಣ

---

**🎉 ಅಭಿನಂದನೆಗಳು!** ನೀವು ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಜೊತೆಗೆ ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ Flask API ಅನ್ನು Azure Container Apps ಗೆ ನಿಯೋಜಿಸಿದ್ದೀರಿ.

**ಪ್ರಶ್ನೆ ಇದೆ?** [ಇಶೂ ತೆರೆಯಿರಿ](https://github.com/microsoft/AZD-for-beginners/issues) ಅಥವಾ [ಪ್ರಶ್ನೋತ್ತರಗಳು](../../../resources/faq.md) ಪರಿಶೀಲಿಸಿ

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕರಣ**:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ: ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸೂತ್ತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಇರುವ ಮೂಲ ದಾಖಲೆನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->