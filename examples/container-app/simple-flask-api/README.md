# Simple Flask API - Container App Example

A basic Python Flask REST API deployed to Azure Container Apps using AZD CLI.

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

- Azure Developer CLI (azd) installed
- Docker installed locally
- Azure subscription

## Quick Start

```bash
# Clone and navigate
cd examples/container-app/simple-flask-api

# Initialize environment
azd env new dev

# Deploy everything
azd up

# Test the API
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
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

This deployment uses scale-to-zero, so you only pay when the API is processing requests:

- **Idle cost**: ~$0/month (scaled to zero)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### Reduce Costs Further

```bash
# Scale down max replicas for dev
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

- Add database integration (see [database-integration example](../database-integration/))
- Implement authentication (see [auth-example](../auth-example/))
- Set up CI/CD pipeline (see [cicd-example](../cicd-example/))
- Add Dapr for microservices (see [dapr-example](../dapr-example/))

## Additional Resources

- [Flask Documentation](https://flask.palletsprojects.com/)
- [Azure Container Apps Docs](https://learn.microsoft.com/azure/container-apps/)
- [AZD Container Apps Guide](../../docs/microsoft-foundry/ai-model-deployment.md)
