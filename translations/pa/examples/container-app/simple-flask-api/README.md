# Simple Flask API - Container App Example

**ਸ਼ਿੱਖਣ ਦਾ ਰਾਹ:** ਸ਼ੁਰੂਆਤੀ ⭐ | **ਸਮਾਂ:** 25-35 ਮਿੰਟ | **ਲਾਗਤ:** $0-15/ਮਹੀਨਾ

ਇਹ ਇੱਕ ਪੂਰਾ, ਕੰਮ ਕਰਨ ਵਾਲਾ Python Flask REST API ਹੈ ਜੋ Azure Container Apps 'ਤੇ Azure Developer CLI (azd) ਦੀ ਵਰਤੋਂ ਨਾਲ ਤੈਨਾਤ ਕੀਤਾ ਗਿਆ ਹੈ। ਇਹ ਉਦਾਹਰਨ ਕੰਟੇਨਰ ਤੈਨਾਤੀ ਕਰਨ, ਆਟੋ-ਸਕੇਲਿੰਗ ਅਤੇ ਮਾਨੀਟਰੀਂਗ ਦੇ ਬੁਨਿਆਦੀ ਤੱਤ ਦਰਸਾਂਦੀ ਹੈ।

## 🎯 ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

- Python ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਕੰਟੇਨਰ ਰੂਪ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
- scale-to-zero ਨਾਲ ਆਟੋ-ਸਕੇਲਿੰਗ ਕੋੰਫਿਗਰ ਕਰੋ
- ਹੈਲਥ ਪ੍ਰੋਬ ਅਤੇ ਰੈਡੀਨੈਸ ਚੈੱਕ ਲਾਗੂ ਕਰੋ
- ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਅਤੇ ਮੈਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
- ਤੇਜ਼ ਤੈਨਾਤੀ ਲਈ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰੋ

## 📦 ਕੀ ਸ਼ਾਮਿਲ ਹੈ

✅ **Flask ਐਪਲੀਕੇਸ਼ਨ** - CRUD ਓਪਰੇਸ਼ਨਾਂ ਨਾਲ ਪੂਰਾ REST API (`src/app.py`)  
✅ **Dockerfile** - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਕ ਤਿਆਰ ਕੰਟੇਨਰ ਕਨਫਿਗਰੇਸ਼ਨ  
✅ **Bicep Infrastructure** - Container Apps ਮਾਹੌਲ ਅਤੇ API ਤੈਨਾਤੀ  
✅ **AZD Configuration** - ਇੱਕ-ਕਮਾਂਡ ਤੈਨਾਤੀ ਸੈੱਟਅਪ  
✅ **Health Probes** - ਲਾਈਵਨੈੱਸ ਅਤੇ ਰੈਡੀਨੈਸ ਚੈੱਕਸ ਸੈੱਟ ਕੀਤੇ ਗਏ  
✅ **Auto-scaling** - HTTP ਲੋਡ ਦੇ ਅਧਾਰ 'ਤੇ 0-10 ਰੀਪਲਿਕਾ  

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

## ਪੂਰਵ-ਸ਼ਰਤਾਂ

### ਲੋੜੀਂਦਾ
- **Azure Developer CLI (azd)** - [ਇੰਸਟਾਲ ਕਰਨ ਦੀ ਗਾਈਡ](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ** - [ਮੁਫ਼ਤ ਖਾਤਾ](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker ਇੰਸਟਾਲ ਕਰੋ](https://www.docker.com/products/docker-desktop/) (ਲੋਕਲ ਟੈਸਟਿੰਗ ਲਈ)

### ਲੋੜੀਂਦਿਆਂ ਦੀ ਜਾਂਚ

```bash
# azd ਵਰਜਨ ਜਾਂਚੋ (ਲੋੜ ਹੈ 1.5.0 ਜਾਂ ਇਸ ਤੋਂ ਉੱਚਾ)
azd version

# Azure ਲੌਗਿਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd auth login

# Docker ਦੀ ਜਾਂਚ ਕਰੋ (ਵਿਕਲਪਿਕ, ਸਥਾਨਕ ਟੈਸਟਿੰਗ ਲਈ)
docker --version
```

## ⏱️ ਤੈਨਾਤੀ ਟਾਈਮਲਾਈਨ

| ਚਰਨ | ਅਵਧੀ | ਕੀ ਹੁੰਦਾ ਹੈ |
|-------|----------|--------------||
| ਵਾਤਾਵਰਨ ਸੈੱਟਅਪ | 30 ਸਕਿੰਟ | azd ਵਾਤਾਵਰਨ ਬਣਾਓ |
| ਕਨਟੇਨਰ ਬਿਲਡ | 2-3 ਮਿੰਟ | Docker ਨਾਲ Flask ਐਪ ਬਿਲਡ ਕਰੋ |
| ਢਾਂਚਾ ਤਿਆਰ ਕਰੋ | 3-5 ਮਿੰਟ | Container Apps, ਰਜਿਸਟਰੀ, ਮਾਨੀਟਰੀਂਗ ਬਣਾਓ |
| ਐਪ ਲਗਾਓ | 2-3 ਮਿੰਟ | ਇਮੇਜ ਪুশ ਕਰੋ ਅਤੇ Container Apps 'ਚ ਤੈਨਾਤ ਕਰੋ |
| **ਕੁੱਲ** | **8-12 ਮਿੰਟ** | ਮੁਕੰਮਲ ਤੈਨਾਤੀ ਤਿਆਰ |

## ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

```bash
# ਉਦਾਹਰਨ ਵੱਲ ਜਾਓ
cd examples/container-app/simple-flask-api

# ਵਾਤਾਵਰਣ ਸ਼ੁਰੂ ਕਰੋ (ਇੱਕ ਵਿਲੱਖਣ ਨਾਮ ਚੁਣੋ)
azd env new myflaskapi

# ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ (ਬੁਨਿਆਦੀ ਢਾਂਚਾ + ਐਪਲੀਕੇਸ਼ਨ)
azd up
# ਤੁਹਾਨੂੰ ਇਹ ਪੁੱਛਿਆ ਜਾਵੇਗਾ:
# 1. Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਚੁਣੋ
# 2. ਸਥਾਨ ਚੁਣੋ (ਉਦਾਹਰਣ ਲਈ, eastus2)
# 3. ਤੈਨਾਤ ਲਈ 8-12 ਮਿੰਟ ਉਡੀਕ ਕਰੋ

# ਆਪਣਾ API ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get-values

# API ਦੀ ਜਾਂਚ ਕਰੋ
curl $(azd env get-value API_ENDPOINT)/health
```

**ਉਮੀਦ ਕੀਤਾ ਗਿਆ ਆਉਟਪੁੱਟ:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ ਤੈਨਾਤੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

### ਕਦਮ 1: ਤੈਨਾਤੀ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ

```bash
# ਤੈਨਾਤ ਕੀਤੀਆਂ ਸੇਵਾਵਾਂ ਵੇਖੋ
azd show

# ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ ਦਿਖਾਉਂਦੀ ਹੈ:
# - ਸੇਵਾ: api
# - ਐਂਡਪੌਇੰਟ: https://ca-api-[env].xxx.azurecontainerapps.io
# - ਸਥਿਤੀ: ਚੱਲ ਰਹੀ
```

### ਕਦਮ 2: API ਐਂਡਪੌਇੰਟਾਂ ਦੀ ਟੈਸਟਿੰਗ ਕਰੋ

```bash
# API ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
API_URL=$(azd env get-value API_ENDPOINT)

# ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
curl $API_URL/health

# ਰੂਟ ਐਂਡਪੌਇੰਟ ਦੀ ਜਾਂਚ ਕਰੋ
curl $API_URL/

# ਇੱਕ ਆਈਟਮ ਬਣਾਓ
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# ਸਾਰੇ ਆਈਟਮ ਪ੍ਰਾਪਤ ਕਰੋ
curl $API_URL/api/items
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- ✅ Health endpoint HTTP 200 ਵਾਪਸ ਕਰਦਾ ਹੈ
- ✅ ਰੂਟ ਐਂਡਪੌਇੰਟ API ਜਾਣਕਾਰੀ ਦਿਖਾਉਂਦਾ ਹੈ
- ✅ POST ਆਈਟਮ ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ HTTP 201 ਵਾਪਸ ਕਰਦਾ ਹੈ
- ✅ GET ਬਣਾਈਆਂ ਆਈਟਮਾਂ ਵਾਪਸ ਕਰਦਾ ਹੈ

### ਕਦਮ 3: ਲੌਗ ਵੇਖੋ

```bash
# azd monitor ਵਰਤ ਕੇ ਲਾਈਵ ਲੌਗ ਸਟਰੀਮ ਕਰੋ
azd monitor --logs

# ਜਾਂ Azure CLI ਵਰਤੋ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ਤੁਸੀਂ ਇਹ ਵੇਖੋਗੇ:
# - Gunicorn ਸ਼ੁਰੂਆਤੀ ਸੁਨੇਹੇ
# - HTTP ਬੇਨਤੀ ਲੌਗ
# - ਐਪਲੀਕੇਸ਼ਨ ਜਾਣਕਾਰੀ ਲੌਗ
```

## ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ

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

## API ਐਂਡਪੌਇੰਟਸ

| ਐਂਡਪੌਇੰਟ | ਮੈਥਡ | ਵੇਰਵਾ |
|----------|--------|-------------|
| `/health` | GET | ਹੈਲਥ ਚੈਕ |
| `/api/items` | GET | ਸਭ ਆਈਟਮਾਂ ਦੀ ਸੂਚੀ |
| `/api/items` | POST | ਨਵਾਂ ਆਈਟਮ ਬਣਾਓ |
| `/api/items/{id}` | GET | ਖਾਸ ਆਈਟਮ ਪ੍ਰਾਪਤ ਕਰੋ |
| `/api/items/{id}` | PUT | ਆਈਟਮ ਅੱਪਡੇਟ ਕਰੋ |
| `/api/items/{id}` | DELETE | ਆਈਟਮ ਮਿਟਾਓ |

## ਸੰਰਚਨਾ

### ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲ

```bash
# ਕਸਟਮ ਸੰਰਚਨਾ ਸੈੱਟ ਕਰੋ
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ

API HTTP ਟ੍ਰੈਫਿਕ ਦੇ ਆਧਾਰ 'ਤੇ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਸਕੇਲ ਹੁੰਦਾ ਹੈ:
- **ਘੱਟੋ-ਘੱਟ ਰੀਪਲਿਕਾ**: 0 (idle ਹੋਣ 'ਤੇ ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ)
- **ਵੱਧੋ-ਵੱਧ ਰੀਪਲਿਕਾ**: 10
- **ਹਰ ਰੀਪਲਿਕਾ ਲਈ ਸਮਕਾਲੀ ਰਿਕਵੇஸਟ**: 50

## ਵਿਕਾਸ

### ਲੋਕਲ 'ਤੇ ਚਲਾਉਣਾ

```bash
# ਨਿਰਭਰਤਾਵਾਂ ਸਥਾਪਤ ਕਰੋ
cd src
pip install -r requirements.txt

# ਐਪ ਚਲਾਓ
python app.py

# ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
curl http://localhost:8000/health
```

### ਕੰਟੇਨਰ ਬਣਾਓ ਅਤੇ ਟੈਸਟ ਕਰੋ

```bash
# ਡੋਕਰ ਇਮੇਜ ਬਣਾਓ
docker build -t flask-api:local ./src

# ਕੰਟੇਨਰ ਨੂੰ ਸਥਾਨਕ ਤੌਰ ਤੇ ਚਲਾਓ
docker run -p 8000:8000 flask-api:local

# ਕੰਟੇਨਰ ਦੀ ਜਾਂਚ ਕਰੋ
curl http://localhost:8000/health
```

## ਤੈਨਾਤੀ

### ਪੂਰੀ ਤੈਨਾਤੀ

```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd up
```

### ਸਿਰਫ਼ ਕੋਡ ਤੈਨਾਤੀ

```bash
# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਬਿਨਾਂ ਬਦਲੇ)
azd deploy api
```

### ਸੰਰਚਨਾ ਅੱਪਡੇਟ ਕਰੋ

```bash
# ਮਾਹੌਲ ਦੇ ਵੈਰੀਏਬਲ ਅਪਡੇਟ ਕਰੋ
azd env set API_KEY "new-api-key"

# ਨਵੀਂ ਸੰਰਚਨਾ ਨਾਲ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd deploy api
```

## ਨਿਗਰਾਨੀ

### ਲੌਗ ਵੇਖੋ

```bash
# azd monitor ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਈਵ ਲੌਗਾਂ ਨੂੰ ਸਟ੍ਰੀਮ ਕਰੋ
azd monitor --logs

# ਜਾਂ Container Apps ਲਈ Azure CLI ਵਰਤੋ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ਆਖਰੀ 100 ਲਾਈਨਾਂ ਵੇਖੋ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### ਮੈਟ੍ਰਿਕਸ ਨਿਗਰਾਨੀ ਕਰੋ

```bash
# Azure Monitor ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --overview

# ਨਿਰਦਿਸ਼ਟ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## ਪਰੀਖਿਆ

### ਹੈਲਥ ਚੈੱਕ

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

ਉਮੀਦ ਕੀਤੀ ਪ੍ਰਤੀਕਿਰਿਆ:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### ਆਈਟਮ ਬਣਾਓ

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### ਸਾਰੇ ਆਈਟਮ ਪ੍ਰਾਪਤ ਕਰੋ

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

ਇਹ ਤੈਨਾਤੀ scale-to-zero ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ, ਇਸ ਲਈ ਤੁਸੀਂ ਸਿਰਫ ਉਸ ਸਮੇਂ ਹੀ ਭੁਗਤਾਨ ਕਰਦੇ ਹੋ ਜਦੋਂ API ਬੇਨਤੀਆਂ ਨੂੰ ਪ੍ਰੋਸੈਸ ਕਰ ਰਹੀ ਹੁੰਦੀ ਹੈ:

- **ਆਈਡਲ ਲਾਗਤ**: ~ $0/ਮਹੀਨਾ (ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ)
- **ਚਾਲੂ ਲਾਗਤ**: ~ $0.000024/ਸੈਕਿੰਡ ਪ੍ਰਤੀ ਰੀਪਲਿਕਾ
- **ਉਮੀਦ ਕੀਤੀ ਮਹੀਨਾਵਾਰ ਲਾਗਤ** (ਹਲਕੀ ਵਰਤੋਂ): $5-15

### ਹੋਰ ਲਾਗਤ ਘਟਾਓ

```bash
# ਡੈਵ ਲਈ ਵੱਧ ਤੋਂ ਵੱਧ ਰੀਪਲਿਕਾਵਾਂ ਘਟਾਓ
azd env set MAX_REPLICAS 3

# ਛੋਟਾ ਆਈਡਲ ਟਾਇਮਆਊਟ ਵਰਤੋ
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 ਮਿੰਟ
```

## ਸਮੱਸਿਆ-ਨਿਵਾਰਣ

### ਕੰਟੇਨਰ ਸ਼ੁਰੂ ਨਹੀਂ ਹੋ ਰਿਹਾ

```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੰਟੇਨਰ ਲੌਗਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# ਸਥਾਨਕ ਤੌਰ ਤੇ Docker ਇਮੇਜਾਂ ਦੇ ਬਣਨ ਦੀ ਜਾਂਚ ਕਰੋ
docker build -t test ./src
```

### API ਪਹੁੰਚਯੋਗ ਨਹੀਂ ਹੈ

```bash
# ਇਨਗ੍ਰੈਸ ਬਾਹਰੀ ਹੈ ਜਾਂ ਨਹੀਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### ਉੱਚ ਪ੍ਰਤੀਕਿਰਿਆ ਸਮੇਂ

```bash
# CPU/ਮੇਮੋਰੀ ਦੀ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ਲੋੜ ਪੈਣ ਤੇ ਸੰਸਾਧਨਾਂ ਨੂੰ ਵਧਾਓ
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ਸਾਫ਼-ਸਫਾਈ

```bash
# ਸਾਰੇ ਸਰੋਤ ਮਿਟਾਓ
azd down --force --purge
```

## ਅਗਲੇ ਕਦਮ

### ਇਸ ਉਦਾਹਰਨ ਨੂੰ ਵਿਸਤਾਰ ਦਿਓ

1. **ਡੇਟਾਬੇਸ ਸ਼ਾਮਲ ਕਰੋ** - Azure Cosmos DB ਜਾਂ SQL Database ਨੂੰ ਇੰਟੇਗਰੇਟ ਕਰੋ
   ```bash
   # infra/main.bicep ਵਿੱਚ Cosmos DB ਮੋਡੀਊਲ ਸ਼ਾਮਲ ਕਰੋ
   # app.py ਨੂੰ ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਨਾਲ ਅੱਪਡੇਟ ਕਰੋ
   ```

2. **ਪ੍ਰਮਾਣਿਕਤਾ ਸ਼ਾਮਲ ਕਰੋ** - Azure AD ਜਾਂ API ਕੀਜ਼ ਲਾਗੂ ਕਰੋ
   ```python
   # app.py ਵਿੱਚ ਪ੍ਰਮਾਣਕਰਣ ਮਿਡਲਵੇਅਰ ਸ਼ਾਮਲ ਕਰੋ
   from functools import wraps
   ```

3. **CI/CD ਸੈੱਟਅਪ ਕਰੋ** - GitHub Actions ਵਰਕਫਲੋ
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity ਸ਼ਾਮਲ ਕਰੋ** - Azure ਸੇਵਾਵਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ਸੰਬੰਧਿਤ ਉਦਾਹਰਨਾਂ

- **[ਡੇਟਾਬੇਸ ਐਪ](../../../../../examples/database-app)** - SQL Database ਨਾਲ ਪੂਰੀ ਉਦਾਹਰਨ
- **[ਮਾਈਕ੍ਰੋਸਰਵਿਸਜ਼](../../../../../examples/container-app/microservices)** - বহু-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ
- **[Container Apps Master Guide](../README.md)** - ਸਾਰੇ ਕੰਟੇਨਰ ਪੈਟਰਨ

### ਸਿੱਖਣ ਲਈ ਸਰੋਤ

- 📚 [AZD For Beginners Course](../../../README.md) - ਮੁੱਖ ਕੋਰਸ ਹੋਮ
- 📚 [Container Apps Patterns](../README.md) - ਹੋਰ ਤੈਨਾਤੀ ਪੈਟਰਨ
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - ਕਮਿਊਨਿਟੀ ਟੈਪਲੇਟਸ

## ਵਾਧੂ ਸਰੋਤ

### ਦਸਤਾਵੇਜ਼
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask ਫਰੇਮਵਰਕ ਗਾਈਡ
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - ਆਧਿਕਾਰਕ Azure ਦਸਤਾਵੇਜ਼
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd ਕਮਾਂਡ ਰੈਫਰੈਂਸ

### ਟਿਊਟੋਰਿਯਲ
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - ਆਪਣੀ ਪਹਿਲੀ ਐਪ ਤੈਨਾਤ ਕਰੋ
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python ਵਿਕਾਸ ਗਾਈਡ
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ

### ਟੂਲਜ਼
- **[Azure Portal](https://portal.azure.com)** - ਸੰਸਾਧਨਾਂ ਨੂੰ ਵਿਜ਼ੂਅਲੀ ਤੌਰ 'ਤੇ ਪ੍ਰਬੰਧ ਕਰੋ
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ਇੰਟੀਗ੍ਰੇਸ਼ਨ

---

**🎉 ਵਧਾਈਆਂ!** ਤੁਸੀਂ auto-scaling ਅਤੇ ਮਾਨੀਟਰੀਂਗ ਨਾਲ Azure Container Apps 'ਤੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ Flask API ਤੈਨਾਤ ਕੀਤਾ ਹੈ।

**ਸਵਾਲ?** [ਇੱਕ ਇਸ਼ੂ ਖੋਲ੍ਹੋ](https://github.com/microsoft/AZD-for-beginners/issues) ਜਾਂ ਦੇਖੋ [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਸਪੱਸ਼ਟੀਕਰਨ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ درستਗੀ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਤਰੁਟੀਆਂ ਜਾਂ ਭੂਲਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫ਼ਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->