# Simple Flask API - Container App Example

**Learning Path:** Beginner ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

A complete, functional Python Flask REST API deployed to Azure Container Apps using Azure Developer CLI (azd). This example showcases container deployment, auto-scaling, and monitoring basics.

## 🎯 What You'll Learn

- Deploy a containerized Python application to Azure
- Configure auto-scaling with scale-to-zero
- Set up health probes and readiness checks
- Monitor application logs and metrics
- Use Azure Developer CLI for quick deployment

## 📦 What's Included

✅ **Flask Application** - Fully functional REST API with CRUD operations (`src/app.py`)  
✅ **Dockerfile** - Production-ready container setup  
✅ **Bicep Infrastructure** - Container Apps environment and API deployment  
✅ **AZD Configuration** - One-command deployment setup  
✅ **Health Probes** - Configured liveness and readiness checks  
✅ **Auto-scaling** - 0-10 replicas based on HTTP traffic  

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
- **Azure Developer CLI (azd)** - [Installation guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (for local testing)

### Verify Prerequisites

```bash
# Check azd version (need 1.5.0 or higher)
azd version

# Verify Azure login
azd auth login

# Check Docker (optional, for local testing)
docker --version
```

## ⏱️ Deployment Timeline

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker builds Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Deployment complete |

## Quick Start

```bash
# Navigate to the example
cd examples/container-app/simple-flask-api

# Initialize environment (choose unique name)
azd env new myflaskapi

# Deploy everything (infrastructure + application)
azd up
# You'll be prompted to:
# 1. Select Azure subscription
# 2. Choose location (e.g., eastus2)
# 3. Wait 8-12 minutes for deployment

# Get your API endpoint
azd env get-values

# Test the API
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
# View deployed services
azd show

# Expected output shows:
# - Service: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Running
```

### Step 2: Test API Endpoints

```bash
# Get API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Test health
curl $API_URL/health

# Test root endpoint
curl $API_URL/

# Create an item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Get all items
curl $API_URL/api/items
```

**Success Criteria:**
- ✅ Health endpoint returns HTTP 200
- ✅ Root endpoint displays API information
- ✅ POST creates an item and returns HTTP 201
- ✅ GET retrieves created items

### Step 3: View Logs

```bash
# Stream live logs
azd logs api --follow

# You should see:
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
| `/api/items` | POST | Create a new item |
| `/api/items/{id}` | GET | Retrieve a specific item |
| `/api/items/{id}` | PUT | Update an item |
| `/api/items/{id}` | DELETE | Delete an item |

## Configuration

### Environment Variables

```bash
# Set custom configuration
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
# Install dependencies
cd src
pip install -r requirements.txt

# Run the app
python app.py

# Test locally
curl http://localhost:8000/health
```

### Build and Test Container

```bash
# Build Docker image
docker build -t flask-api:local ./src

# Run container locally
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Deployment

### Full Deployment

```bash
# Deploy infrastructure and application
azd up
```

### Code-Only Deployment

```bash
# Deploy only application code (infrastructure unchanged)
azd deploy api
```

### Update Configuration

```bash
# Update environment variables
azd env set API_KEY "new-api-key"

# Redeploy with new configuration
azd deploy api
```

## Monitoring

### View Logs

```bash
# Stream live logs
azd logs api --follow

# View last 100 lines
azd logs api --tail 100
```

### Monitor Metrics

```bash
# Open Azure Monitor dashboard
azd monitor --overview

# View specific metrics
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

This deployment uses scale-to-zero, meaning you only pay when the API is handling requests:

- **Idle cost**: ~$0/month (scaled to zero)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### Reduce Costs Further

```bash
# Scale down max replicas for development
azd env set MAX_REPLICAS 3

# Use shorter idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## Troubleshooting

### Container Won't Start

```bash
# Check container logs
azd logs api --tail 100

# Verify Docker image builds locally
docker build -t test ./src
```

### API Not Accessible

```bash
# Verify ingress is external
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### High Response Times

```bash
# Check CPU/Memory usage
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Scale up resources if needed
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Clean Up

```bash
# Delete all resources
azd down --force --purge
```

## Next Steps

### Expand This Example

1. **Add Database** - Integrate Azure Cosmos DB or SQL Database
   ```bash
   # Add Cosmos DB module to infra/main.bicep
   # Update app.py with database connection
   ```

2. **Add Authentication** - Implement Azure AD or API keys
   ```python
   # Add authentication middleware to app.py
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

**🎉 Congratulations!** You've successfully deployed a production-ready Flask API to Azure Container Apps with auto-scaling and monitoring.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->