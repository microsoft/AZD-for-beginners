# Simple Flask API - Container App Example

**Learning Path:** Beginner ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

A complete, working Python Flask REST API deployed to Azure Container Apps using Azure Developer CLI (azd). This example demonstrates container deployment, auto-scaling, and monitoring basics.

## 🎯 What You'll Learn

- Deploy a containerized Python application to Azure
- Configure auto-scaling with scale-to-zero
- Implement health probes and readiness checks
- Monitor application logs and metrics
- Use Azure Developer CLI for rapid deployment

## 📦 What's Included

✅ **Flask Application** - Complete REST API with CRUD operations (`src/app.py`)  
✅ **Dockerfile** - Production-ready container configuration  
✅ **Bicep Infrastructure** - Container Apps environment and API deployment  
✅ **AZD Configuration** - One-command deployment setup  
✅ **Health Probes** - Liveness and readiness checks configured  
✅ **Auto-scaling** - 0-10 replicas based on HTTP load  

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

## Prerequisites

### Required
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (for local testing)

### Verify Prerequisites

```bash
# Make sure say azd version dey 1.5.0 or pass
azd version

# Confirm say you don log in to Azure
azd auth login

# Check Docker (optional, if you wan test locally)
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
# Go open di example
cd examples/container-app/simple-flask-api

# Set up di environment (make sure say name unique)
azd env new myflaskapi

# Deploy all di tins (infrastructure + application)
azd up
# Dem go ask you to:
# 1. Choose Azure subscription
# 2. Pick di location (e.g., eastus2)
# 3. Wait 8-12 minutes for di deployment

# Grab your API endpoint
azd env get-values

# Test di API
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
# See services wey don deploy
azd show

# Wetin di expected output go show:
# - Sabis: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Dey run
```

### Step 2: Test API Endpoints

```bash
# Get di API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Check di health
curl $API_URL/health

# Check di root endpoint
curl $API_URL/

# Create wan item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Get all di items
curl $API_URL/api/items
```

**Success Criteria:**
- ✅ Health endpoint returns HTTP 200
- ✅ Root endpoint shows API information
- ✅ POST creates item and returns HTTP 201
- ✅ GET returns created items

### Step 3: View Logs

```bash
# Stream di live logs wit azd monitor
azd monitor --logs

# Or you fit use Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# You go see:
# - Gunicorn messages wey dey show say e don start
# - Logs wey dey show HTTP requests
# - Logs wey dey show application info
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
| `/health` | GET | Health check |
| `/api/items` | GET | List all items |
| `/api/items` | POST | Create new item |
| `/api/items/{id}` | GET | Get specific item |
| `/api/items/{id}` | PUT | Update item |
| `/api/items/{id}` | DELETE | Delete item |

## Configuration

### Environment Variables

```bash
# Set di settings wey you choose.
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

The API automatically scales based on HTTP traffic:
- **Min Replicas**: 0 (scales to zero when idle)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Development

### Run Locally

```bash
# Install di dependencies
cd src
pip install -r requirements.txt

# Run di app
python app.py

# Test am for local machine
curl http://localhost:8000/health
```

### Build and Test Container

```bash
# Make Docker image
docker build -t flask-api:local ./src

# Run di container for local komputa
docker run -p 8000:8000 flask-api:local

# Test di container
curl http://localhost:8000/health
```

## Deployment

### Full Deployment

```bash
# Deploy di infrastructure and di application
azd up
```

### Code-Only Deployment

```bash
# Deploy only di application code (infrastructure no change)
azd deploy api
```

### Update Configuration

```bash
# Update di environment variables
azd env set API_KEY "new-api-key"

# Redeploy wit di new configuration
azd deploy api
```

## Monitoring

### View Logs

```bash
# Dey stream live logs wit azd monitor
azd monitor --logs

# Abi use Azure CLI for Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# See di last 100 lines
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitor Metrics

```bash
# Open di Azure Monitor dashboard
azd monitor --overview

# See di specific metrics
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

This deployment uses scale-to-zero, so you only pay when the API is processing requests:

- **Idle cost**: ~$0/month (scaled to zero)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### Reduce Costs Further

```bash
# Bring down di max replicas for dev
azd env set MAX_REPLICAS 3

# Make di idle timeout shorter
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## Troubleshooting

### Container Won't Start

```bash
# Check container logs wit Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Confirm say Docker image dey build locally
docker build -t test ./src
```

### API Not Accessible

```bash
# Make sure say ingress dey outside
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### High Response Times

```bash
# Check how CPU and memory dey used
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# If e necessary, add more resources
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Clean Up

```bash
# Comot all di resources
azd down --force --purge
```

## Next Steps

### Expand This Example

1. **Add Database** - Integrate Azure Cosmos DB or SQL Database
   ```bash
   # Put Cosmos DB module for infra/main.bicep
   # Update app.py make e connect to database
   ```

2. **Add Authentication** - Implement Azure AD or API keys
   ```python
   # Put authentication middleware enter app.py
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

- **[Database App](../../../../../examples/database-app)** - Complete example with SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service architecture
- **[Container Apps Master Guide](../README.md)** - All container patterns

### Learning Resources

- 📚 [AZD For Beginners Course](../../../README.md) - Main course home
- 📚 [Container Apps Patterns](../README.md) - More deployment patterns
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Community templates

## Additional Resources

### Documentation
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask framework guide
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Official Azure docs
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd command reference

### Tutorials
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Deploy your first app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python development guide
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### Tools
- **[Azure Portal](https://portal.azure.com)** - Manage resources visually
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integration

---

**🎉 Congratulations!** You've deployed a production-ready Flask API to Azure Container Apps with auto-scaling and monitoring.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Make una sabi:

Dis document don translate wit AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automatic translations fit get errors or mistakes. Di original document for im native language na di authoritative source. If na important matter, better make person wey sabi translate am professionally do am. We no go responsible for any misunderstandings or wrong interpretations wey fit follow from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->