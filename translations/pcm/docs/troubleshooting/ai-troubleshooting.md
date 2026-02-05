# AI-Specific Troubleshooting Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [Debugging Guide](debugging.md)
- **➡️ Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)
- **🤖 Related**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

**Previous:** [Production AI Practices](../microsoft-foundry/production-ai-practices.md) | **Next:** [Getting Started with AZD](../getting-started/README.md)

Dis guide go help you solve common wahala wey fit happen when you dey deploy AI solutions with AZD, and e go show you how to debug Azure AI services.

## Table of Contents

- [Azure OpenAI Service Issues](../../../../docs/troubleshooting)
- [Azure AI Search Problems](../../../../docs/troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/troubleshooting)
- [Authentication and Permission Errors](../../../../docs/troubleshooting)
- [Model Deployment Failures](../../../../docs/troubleshooting)
- [Performance and Scaling Issues](../../../../docs/troubleshooting)
- [Cost and Quota Management](../../../../docs/troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/troubleshooting)

## Azure OpenAI Service Issues

### Issue: OpenAI Service No Dey Work for Region

**Symptoms:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causes:**
- Azure OpenAI no dey for di region wey you select
- Quota don finish for di region wey you prefer
- Capacity for di region no reach

**Solutions:**

1. **Check Region Availability:**
```bash
# Show di regions wey OpenAI dey available
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Update AZD Configuration:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Use Alternative Regions:**
```bicep
// infra/main.bicep - Multi-region fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Issue: Model Deployment Quota Don Finish

**Symptoms:**
```
Error: Deployment failed due to insufficient quota
```

**Solutions:**

1. **Check Current Quota:**
```bash
# Check how much quota you don use
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Request Quota Increase:**
```bash
# Send request make dem increase quota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimize Model Capacity:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Issue: Invalid API Version

**Symptoms:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solutions:**

1. **Use Supported API Version:**
```python
# Use di latest version wey dem support
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Check API Version Compatibility:**
```bash
# List di API versions wey e support
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier No Reach

**Symptoms:**
```
Error: Semantic search requires Basic tier or higher
```

**Solutions:**

1. **Upgrade Pricing Tier:**
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'  // Minimum for semantic search
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    semanticSearch: 'standard'
  }
}
```

2. **Disable Semantic Search (Development):**
```bicep
// For development environments
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  sku: {
    name: 'free'
  }
  properties: {
    semanticSearch: 'disabled'
  }
}
```

### Issue: Index Creation No Work

**Symptoms:**
```
Error: Cannot create index, insufficient permissions
```

**Solutions:**

1. **Verify Search Service Keys:**
```bash
# Collect search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Check Index Schema:**
```python
# Check say index schema correct
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Use Managed Identity:**
```bicep
// Grant search permissions to managed identity
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, searchIndexDataContributorRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
    principalType: 'ServicePrincipal'
  }
}
```

## Container Apps Deployment Issues

### Issue: Container Build No Work

**Symptoms:**
```
Error: Failed to build container image
```

**Solutions:**

1. **Check Dockerfile Syntax:**
```dockerfile
# Dockerfile - Python AI app example
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

2. **Validate Dependencies:**
```txt
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Add Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App No Start

**Symptoms:**
```
Error: Container failed to start within timeout period
```

**Solutions:**

1. **Increase Startup Timeout:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          probes: [
            {
              type: 'startup'
              httpGet: {
                path: '/health'
                port: 8000
              }
              initialDelaySeconds: 30
              periodSeconds: 10
              timeoutSeconds: 5
              failureThreshold: 10  // Allow more time for AI models to load
            }
          ]
        }
      ]
    }
  }
}
```

2. **Optimize Model Loading:**
```python
# Load models small small to make startup time short
import asyncio
from contextlib import asynccontextmanager

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Start AI client for here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Start work
    app.state.model_manager = ModelManager()
    yield
    # Close work
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity No Get Permission

**Symptoms:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Solutions:**

1. **Verify Role Assignments:**
```bash
# Check wetin dem don assign for role
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Assign Required Roles:**
```bicep
// Required role assignments for AI services
var cognitiveServicesOpenAIUserRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
var searchIndexDataContributorRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAi
  name: guid(openAi.id, containerApp.id, cognitiveServicesOpenAIUserRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: cognitiveServicesOpenAIUserRole
    principalType: 'ServicePrincipal'
  }
}
```

3. **Test Authentication:**
```python
# Test di managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### Issue: Key Vault Access Denied

**Symptoms:**
```
Error: The user, group or application does not have secrets get permission
```

**Solutions:**

1. **Grant Key Vault Permissions:**
```bicep
resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: containerApp.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
  }
}
```

2. **Use RBAC Instead of Access Policies:**
```bicep
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, containerApp.id, 'Key Vault Secrets User')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalType: 'ServicePrincipal'
  }
}
```

## Model Deployment Failures

### Issue: Model Version No Dey Available

**Symptoms:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solutions:**

1. **Check Available Models:**
```bash
# List di models wey dey available
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Use Model Fallbacks:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4o-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-35-turbo'
  version: '0125'
}

// Try primary model first, fallback if unavailable
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: primaryModel
  }
  sku: {
    name: 'Standard'
    capacity: 10
  }
}
```

3. **Validate Model Before Deployment:**
```python
# Before dem deploy di model, dem go check am well
import httpx

async def validate_model_availability(model_name: str, version: str) -> bool:
    """Check if model is available before deployment."""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/models",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            models = response.json()
            return any(
                model["id"] == f"{model_name}-{version}"
                for model in models.get("data", [])
            )
    except Exception:
        return False
```

## Performance and Scaling Issues

### Issue: Response Dey Take Time

**Symptoms:**
- Response time pass 30 seconds
- Timeout errors
- User experience no good

**Solutions:**

1. **Implement Request Timeouts:**
```python
# Set correct timeouts
import httpx

client = httpx.AsyncClient(
    timeout=httpx.Timeout(
        connect=5.0,
        read=30.0,
        write=10.0,
        pool=10.0
    )
)
```

2. **Add Response Caching:**
```python
# Redis cache for ansas
import redis.asyncio as redis
import json

class ResponseCache:
    def __init__(self, redis_url: str):
        self.redis = redis.from_url(redis_url)
        
    async def get_cached_response(self, query_hash: str) -> str | None:
        """Get cached response if available."""
        cached = await self.redis.get(f"ai_response:{query_hash}")
        return cached.decode() if cached else None
        
    async def cache_response(self, query_hash: str, response: str, ttl: int = 3600):
        """Cache AI response with TTL."""
        await self.redis.setex(f"ai_response:{query_hash}", ttl, response)
```

3. **Configure Auto-scaling:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      scale: {
        minReplicas: 2
        maxReplicas: 20
        rules: [
          {
            name: 'http-requests'
            http: {
              metadata: {
                concurrentRequests: '5'  // Scale aggressively for AI workloads
              }
            }
          }
          {
            name: 'cpu-utilization'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '60'  // Lower threshold for AI apps
              }
            }
          }
        ]
      }
    }
  }
}
```

### Issue: Memory Don Finish

**Symptoms:**
```
Error: Container killed due to memory limit exceeded
```

**Solutions:**

1. **Increase Memory Allocation:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          resources: {
            cpu: json('1.0')
            memory: '2Gi'  // Increase for AI workloads
          }
        }
      ]
    }
  }
}
```

2. **Optimize Memory Usage:**
```python
# Model wey no go use plenty memory
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check how memory dey before you process
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Make sure say garbage collection happen
            
        result = await self._process_ai_request(request)
        
        # Arrange everything well after you process
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Cost Don High Pass Wetin You Expect

**Symptoms:**
- Azure bill high pass wetin you plan
- Token usage don pass wetin you estimate
- Budget alerts dey trigger

**Solutions:**

1. **Implement Cost Controls:**
```python
# Tracking how many token dem dey use
class TokenTracker:
    def __init__(self, monthly_limit: int = 100000):
        self.monthly_limit = monthly_limit
        self.current_usage = 0
        
    async def track_usage(self, prompt_tokens: int, completion_tokens: int):
        """Track token usage with limits."""
        total_tokens = prompt_tokens + completion_tokens
        self.current_usage += total_tokens
        
        if self.current_usage > self.monthly_limit:
            raise Exception("Monthly token limit exceeded")
            
        return total_tokens
```

2. **Set up Cost Alerts:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500  // $500 monthly limit
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

3. **Optimize Model Selection:**
```python
# Model wey sabi cost well
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # for every 1K tokens
    'gpt-4': 0.03,          # for every 1K tokens
    'gpt-35-turbo': 0.0015  # for every 1K tokens
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4o-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4'
```

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# Make logging dey show plenty tori
azd up --debug

# Check how deployment dey go
azd show

# Look deployment logs
azd logs --follow

# Check environment variables
azd env get-values
```

### Application Debugging

1. **Structured Logging:**
```python
import logging
import json

# Set up structured logging for AI apps
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_ai_request(model: str, tokens: int, latency: float, success: bool):
    """Log AI request details."""
    logger.info(json.dumps({
        'event': 'ai_request',
        'model': model,
        'tokens': tokens,
        'latency_ms': latency,
        'success': success
    }))
```

2. **Health Check Endpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check OpenAI connection
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Check Search service
    try:
        search_client = SearchIndexClient(
            endpoint=AZURE_SEARCH_ENDPOINT,
            credential=DefaultAzureCredential()
        )
        indexes = await search_client.list_index_names()
        checks['search'] = {'status': 'healthy', 'indexes': list(indexes)}
    except Exception as e:
        checks['search'] = {'status': 'unhealthy', 'error': str(e)}
    
    return checks
```

3. **Performance Monitoring:**
```python
import time
from functools import wraps

def monitor_performance(func):
    """Decorator to monitor function performance."""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start_time = time.time()
        try:
            result = await func(*args, **kwargs)
            success = True
        except Exception as e:
            result = None
            success = False
            raise
        finally:
            end_time = time.time()
            latency = (end_time - start_time) * 1000
            
            logger.info(json.dumps({
                'function': func.__name__,
                'latency_ms': latency,
                'success': success
            }))
        
        return result
    return wrapper
```

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Unauthorized | Check API keys and managed identity configuration |
| 403 | Forbidden | Verify RBAC role assignments |
| 429 | Rate Limited | Implement retry logic with exponential backoff |
| 500 | Internal Server Error | Check model deployment status and logs |
| 503 | Service Unavailable | Verify service health and regional availability |

## Next Steps

1. **Review [AI Model Deployment Guide](ai-model-deployment.md)** for deployment best practices
2. **Complete [Production AI Practices](production-ai-practices.md)** for enterprise-ready solutions
3. **Join the [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for community support
4. **Submit issues** to the [AZD GitHub repository](https://github.com/Azure/azure-dev) for AZD-specific problems

## Resources

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [Debugging Guide](debugging.md)
- **➡️ Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)
- **🤖 Related**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say machine translation fit get mistake or no dey correct well. Di original dokyument for im native language na di main correct source. For important information, e good make una use professional human translation. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->