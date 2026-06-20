# Simple Flask API - Container App Example

**Learning Path:** Beginner ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

Na complete, dey work Python Flask REST API wey dem don deploy to Azure Container Apps using Azure Developer CLI (azd). Dis example dey show how container deployment, auto-scaling, and basic monitoring dey work.

## 🎯 Wetin You Go Learn

- How to deploy one Python app wey dey inside container go Azure
- Configure auto-scaling wey fit scale to zero
- Implement health probes and readiness checks
- Monitor app logs and metrics
- Use Azure Developer CLI make deployment quick

## 📦 Wetin Dey Included

✅ **Flask Application** - Complete REST API wey get CRUD operations (`src/app.py`)  
✅ **Dockerfile** - Production-ready container configuration  
✅ **Bicep Infrastructure** - Container Apps environment and API deployment  
✅ **AZD Configuration** - One-command deployment setup  
✅ **Health Probes** - Liveness and readiness checks don configure  
✅ **Auto-scaling** - 0-10 replicas based on HTTP load  

## Architecture

```mermaid
graph TD
    subgraph ACA[Azure Container Apps Environmen]
        Flask[Container wey get Flask API<br/>Endpoints wey dey check health<br/>REST API<br/>E dey auto-scale 0-10 replicas]
        AppInsights[Application Insights]
    end
```

## Prerequisites

### Wetin You Need
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (for local testing)

### Check Wetin You Need

```bash
# Check azd version (you go need 1.5.0 or pass am)
azd version

# Verify Azure login -> Confirm say you don log in for Azure
azd auth login

# Check Docker (optional, if you wan test for your machine)
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
# Open di example
cd examples/container-app/simple-flask-api

# Set up di environment (pick unique name)
azd env new myflaskapi

# Deploy everytin (infrastructure + application)
azd up
# Dem go ask you to:
# 1. Pick Azure subscription
# 2. Pick location (e.g., eastus2)
# 3. Wait 8-12 minutes make deployment finish

# Collect your API endpoint
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
# See di services wey don deploy
azd show

# Wetin you suppose see:
# - Service: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Dey run
```

### Step 2: Test API Endpoints

```bash
# Grab di API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Test di health
curl $API_URL/health

# Test di root endpoint
curl $API_URL/

# Create wan item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Grab all di items
curl $API_URL/api/items
```

**Success Criteria:**
- ✅ Health endpoint returns HTTP 200
- ✅ Root endpoint shows API information
- ✅ POST creates item and returns HTTP 201
- ✅ GET returns created items

### Step 3: View Logs

```bash
# Stream live logs wit azd monitor
azd monitor --logs

# Or yu fit use Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# You go see:
# - Gunicorn messages wey show when e dey start
# - Logs for HTTP request dem
# - Logs wey show application info
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
# Set di custom settings
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

The API dey automatically scale based on HTTP traffic:
- **Min Replicas**: 0 (go scale to zero when e quiet)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Development

### Run Locally

```bash
# Install di dependencies dem
cd src
pip install -r requirements.txt

# Run di app
python app.py

# Test am for local
curl http://localhost:8000/health
```

### Build and Test Container

```bash
# Make di Docker image
docker build -t flask-api:local ./src

# Run di container for your machine
docker run -p 8000:8000 flask-api:local

# Test di container
curl http://localhost:8000/health
```

## Deployment

### Full Deployment

```bash
# Set up di infrastructure an di application
azd up
```

### Code-Only Deployment

```bash
# Only deploy di application code (no change to infrastructure)
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
# Stream di live logs wit azd monitor
azd monitor --logs

# Or you fit use Azure CLI for Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# See di last 100 lines
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitor Metrics

```bash
# Open di Azure Monitor dashboard
azd monitor --overview

# Check di specific metrics
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

Dis deployment dey use scale-to-zero, so you go only pay when the API dey process requests:

- **Idle cost**: ~$0/month (when e scale to zero)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### Reduce Costs Further

```bash
# Make di max replicas small for dev
azd env set MAX_REPLICAS 3

# Make di idle timeout shorter
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## Troubleshooting

### Container Won't Start

```bash
# Use Azure CLI to check di container logs
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Confirm say Docker image dey build for local machine
docker build -t test ./src
```

### API Not Accessible

```bash
# Make sure say ingress dey external
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### High Response Times

```bash
# Check how CPU and memory dey used
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Add more resources if e need am
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
   # Put Cosmos DB module inside infra/main.bicep
   # Update app.py make e connect to database
   ```

2. **Add Authentication** - Implement Microsoft Entra ID or API keys
   ```python
   # Put authentication middleware for app.py
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

**🎉 Congratulations!** You don deploy production-ready Flask API go Azure Container Apps wey get auto-scaling and monitoring.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->