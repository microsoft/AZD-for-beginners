<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-24T14:21:18+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "pcm"
}
-->
# Simple Flask API - Container App Example

**Learning Path:** Beginner ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

Dis na complete, working Python Flask REST API wey dem deploy go Azure Container Apps using Azure Developer CLI (azd). Dis example go show how to deploy container, auto-scaling, and monitoring basics.

## 🎯 Wetin You Go Learn

- How to deploy Python app wey dem don put for container go Azure
- How to configure auto-scaling wey fit scale-to-zero
- How to set health probes and readiness checks
- How to monitor app logs and metrics
- How to use Azure Developer CLI for quick deployment

## 📦 Wetin Dey Inside

✅ **Flask Application** - Complete REST API wey get CRUD operations (`src/app.py`)  
✅ **Dockerfile** - Container configuration wey ready for production  
✅ **Bicep Infrastructure** - Container Apps environment and API deployment  
✅ **AZD Configuration** - One-command deployment setup  
✅ **Health Probes** - Liveness and readiness checks wey dem don configure  
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

## Wetin You Go Need

### Wetin You Must Get
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (for local testing)

### Check Wetin You Don Get

```bash
# Check azd version (need 1.5.0 or higher)
azd version

# Confirm say you don log into Azure
azd auth login

# Check Docker (optional, for local testing)
docker --version
```

## ⏱️ Deployment Timeline

| Phase | Duration | Wetin Go Happen |
|-------|----------|-----------------|
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker go build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Deployment go complete |

## Quick Start

```bash
# Go to di example
cd examples/container-app/simple-flask-api

# Set up environment (choose name wey no dey repeat)
azd env new myflaskapi

# Put everything for ground (infrastructure + application)
azd up
# Dem go ask you to:
# 1. Pick Azure subscription
# 2. Choose location (like eastus2)
# 3. Wait 8-12 minutes make deployment finish

# Collect your API endpoint
azd env get-values

# Try di API
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

## ✅ Check Deployment

### Step 1: Check Deployment Status

```bash
# See services wey dem don deploy
azd show

# Wetin we dey expect for output na:
# - Service: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: E dey run
```

### Step 2: Test API Endpoints

```bash
# Get API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Test health
curl $API_URL/health

# Test root endpoint
curl $API_URL/

# Create item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Get all items
curl $API_URL/api/items
```

**Success Criteria:**
- ✅ Health endpoint go return HTTP 200
- ✅ Root endpoint go show API information
- ✅ POST go create item and return HTTP 201
- ✅ GET go return created items

### Step 3: View Logs

```bash
# Stream live logs
azd logs api --follow

# You go see:
# - Gunicorn startup messages
# - HTTP request logs
# - Application info logs
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
# Set custom configuration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

Dis API go scale automatically based on HTTP traffic:
- **Min Replicas**: 0 (e go scale to zero if e no dey active)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Development

### Run Locally

```bash
# Install di things wey di app need
cd src
pip install -r requirements.txt

# Make di app dey work
python app.py

# Check am for your computer
curl http://localhost:8000/health
```

### Build and Test Container

```bash
# Build Docker image
docker build -t flask-api:local ./src

# Run container for local
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Deployment

### Full Deployment

```bash
# Set up infrastructure and application
azd up
```

### Code-Only Deployment

```bash
# Deploy only application code (infrastructure no change)
azd deploy api
```

### Update Configuration

```bash
# Update environment variables
azd env set API_KEY "new-api-key"

# Redeploy wit new configuration
azd deploy api
```

## Monitoring

### View Logs

```bash
# Show live logs
azd logs api --follow

# See di last 100 lines
azd logs api --tail 100
```

### Monitor Metrics

```bash
# Open Azure Monitor dashboard
azd monitor --overview

# See specific metrics
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

Dis deployment dey use scale-to-zero, so you go only pay when API dey process requests:

- **Idle cost**: ~$0/month (if e scale to zero)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### How to Reduce Costs

```bash
# Reduce max replicas for dev
azd env set MAX_REPLICAS 3

# Use shorter idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## Troubleshooting

### Container No Wan Start

```bash
# Check container logs
azd logs api --tail 100

# Confirm say Docker image dey build for local
docker build -t test ./src
```

### API No Dey Accessible

```bash
# Check say ingress dey outside
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Response Time Dey High

```bash
# Check CPU/Memory usage
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Add more resources if e dey necessary
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Clean Up

```bash
# Delete all di resources
azd down --force --purge
```

## Next Steps

### Expand Dis Example

1. **Add Database** - Add Azure Cosmos DB or SQL Database
   ```bash
   # Add Cosmos DB module to infra/main.bicep
   # Update app.py wit database connection
   ```

2. **Add Authentication** - Use Azure AD or API keys
   ```python
   # Add authentication middleware to app.py
   from functools import wraps
   ```

3. **Set Up CI/CD** - Use GitHub Actions workflow
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

- **[Database App](../../../../../examples/database-app)** - Complete example wey get SQL Database
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

**🎉 Congratulations!** You don deploy production-ready Flask API go Azure Container Apps with auto-scaling and monitoring.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even as we dey try make sure say e correct, abeg make you sabi say machine translation fit get mistake or no dey accurate well. Di original dokyument for im native language na di main correct source. For important mata, e good make professional human translator check am. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->