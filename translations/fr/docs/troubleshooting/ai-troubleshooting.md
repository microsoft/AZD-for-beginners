<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-17T13:26:26+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "fr"
}
-->
# Guide de dépannage spécifique à l'IA

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour les débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 7 - Dépannage et débogage
- **⬅️ Précédent** : [Guide de débogage](debugging.md)
- **➡️ Chapitre suivant** : [Chapitre 8 : Modèles de production et d'entreprise](../ai-foundry/production-ai-practices.md)
- **🤖 Connexe** : [Chapitre 2 : Développement axé sur l'IA](../ai-foundry/azure-ai-foundry-integration.md)

**Précédent :** [Pratiques de production IA](../ai-foundry/production-ai-practices.md) | **Suivant :** [Commencer avec AZD](../getting-started/README.md)

Ce guide de dépannage complet aborde les problèmes courants liés au déploiement de solutions IA avec AZD, en fournissant des solutions et des techniques de débogage spécifiques aux services Azure AI.

## Table des matières

- [Problèmes avec Azure OpenAI Service](../../../../docs/troubleshooting)
- [Problèmes avec Azure AI Search](../../../../docs/troubleshooting)
- [Problèmes de déploiement des applications conteneurisées](../../../../docs/troubleshooting)
- [Erreurs d'authentification et de permissions](../../../../docs/troubleshooting)
- [Échecs de déploiement de modèles](../../../../docs/troubleshooting)
- [Problèmes de performance et de mise à l'échelle](../../../../docs/troubleshooting)
- [Gestion des coûts et des quotas](../../../../docs/troubleshooting)
- [Outils et techniques de débogage](../../../../docs/troubleshooting)

## Problèmes avec Azure OpenAI Service

### Problème : Service OpenAI indisponible dans la région

**Symptômes :**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causes :**
- Azure OpenAI n'est pas disponible dans la région sélectionnée
- Quota épuisé dans les régions préférées
- Contraintes de capacité régionale

**Solutions :**

1. **Vérifier la disponibilité régionale :**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Mettre à jour la configuration AZD :**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Utiliser des régions alternatives :**
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

### Problème : Quota de déploiement de modèle dépassé

**Symptômes :**
```
Error: Deployment failed due to insufficient quota
```

**Solutions :**

1. **Vérifier le quota actuel :**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Demander une augmentation de quota :**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimiser la capacité du modèle :**
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

### Problème : Version API invalide

**Symptômes :**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solutions :**

1. **Utiliser une version API prise en charge :**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Vérifier la compatibilité de la version API :**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problèmes avec Azure AI Search

### Problème : Niveau de tarification du service de recherche insuffisant

**Symptômes :**
```
Error: Semantic search requires Basic tier or higher
```

**Solutions :**

1. **Mettre à niveau le niveau de tarification :**
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

2. **Désactiver la recherche sémantique (développement) :**
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

### Problème : Échecs de création d'index

**Symptômes :**
```
Error: Cannot create index, insufficient permissions
```

**Solutions :**

1. **Vérifier les clés du service de recherche :**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Vérifier le schéma de l'index :**
```python
# Validate index schema
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

3. **Utiliser une identité managée :**
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

## Problèmes de déploiement des applications conteneurisées

### Problème : Échecs de construction de conteneur

**Symptômes :**
```
Error: Failed to build container image
```

**Solutions :**

1. **Vérifier la syntaxe du Dockerfile :**
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

2. **Valider les dépendances :**
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

3. **Ajouter une vérification de santé :**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problème : Échecs de démarrage de l'application conteneurisée

**Symptômes :**
```
Error: Container failed to start within timeout period
```

**Solutions :**

1. **Augmenter le délai de démarrage :**
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

2. **Optimiser le chargement du modèle :**
```python
# Lazy load models to reduce startup time
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
        # Initialize AI client here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    app.state.model_manager = ModelManager()
    yield
    # Shutdown
    pass

app = FastAPI(lifespan=lifespan)
```

## Erreurs d'authentification et de permissions

### Problème : Permission refusée pour l'identité managée

**Symptômes :**
```
Error: Authentication failed for Azure OpenAI Service
```

**Solutions :**

1. **Vérifier les affectations de rôle :**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Attribuer les rôles requis :**
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

3. **Tester l'authentification :**
```python
# Test managed identity authentication
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

### Problème : Accès refusé à Key Vault

**Symptômes :**
```
Error: The user, group or application does not have secrets get permission
```

**Solutions :**

1. **Accorder les permissions Key Vault :**
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

2. **Utiliser RBAC au lieu des politiques d'accès :**
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

## Échecs de déploiement de modèles

### Problème : Version de modèle non disponible

**Symptômes :**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solutions :**

1. **Vérifier les modèles disponibles :**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Utiliser des modèles de secours :**
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

3. **Valider le modèle avant le déploiement :**
```python
# Pre-deployment model validation
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

## Problèmes de performance et de mise à l'échelle

### Problème : Réponses à haute latence

**Symptômes :**
- Temps de réponse > 30 secondes
- Erreurs de délai d'attente
- Mauvaise expérience utilisateur

**Solutions :**

1. **Implémenter des délais d'attente pour les requêtes :**
```python
# Configure proper timeouts
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

2. **Ajouter une mise en cache des réponses :**
```python
# Redis cache for responses
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

3. **Configurer la mise à l'échelle automatique :**
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

### Problème : Erreurs de mémoire insuffisante

**Symptômes :**
```
Error: Container killed due to memory limit exceeded
```

**Solutions :**

1. **Augmenter l'allocation de mémoire :**
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

2. **Optimiser l'utilisation de la mémoire :**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check memory usage before processing
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Force garbage collection
            
        result = await self._process_ai_request(request)
        
        # Clean up after processing
        gc.collect()
        return result
```

## Gestion des coûts et des quotas

### Problème : Coûts élevés inattendus

**Symptômes :**
- Facture Azure plus élevée que prévu
- Utilisation de jetons dépassant les estimations
- Alertes budgétaires déclenchées

**Solutions :**

1. **Implémenter des contrôles de coûts :**
```python
# Token usage tracking
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

2. **Configurer des alertes de coûts :**
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

3. **Optimiser la sélection des modèles :**
```python
# Cost-aware model selection
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K tokens
    'gpt-4': 0.03,          # per 1K tokens
    'gpt-35-turbo': 0.0015  # per 1K tokens
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

## Outils et techniques de débogage

### Commandes de débogage AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View deployment logs
azd logs --follow

# Check environment variables
azd env get-values
```

### Débogage d'application

1. **Journalisation structurée :**
```python
import logging
import json

# Configure structured logging for AI applications
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

2. **Points de vérification de santé :**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check OpenAI connectivity
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

3. **Surveillance des performances :**
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

## Codes d'erreur courants et solutions

| Code d'erreur | Description | Solution |
|---------------|-------------|----------|
| 401 | Non autorisé | Vérifier les clés API et la configuration de l'identité managée |
| 403 | Interdit | Vérifier les affectations de rôle RBAC |
| 429 | Limité par le taux | Implémenter une logique de reprise avec backoff exponentiel |
| 500 | Erreur interne du serveur | Vérifier le statut de déploiement du modèle et les journaux |
| 503 | Service indisponible | Vérifier la santé du service et la disponibilité régionale |

## Prochaines étapes

1. **Consulter [Guide de déploiement de modèles IA](ai-model-deployment.md)** pour les meilleures pratiques de déploiement
2. **Compléter [Pratiques de production IA](production-ai-practices.md)** pour des solutions prêtes pour l'entreprise
3. **Rejoindre le [Discord Azure AI Foundry](https://aka.ms/foundry/discord)** pour un support communautaire
4. **Soumettre des problèmes** au [répertoire GitHub AZD](https://github.com/Azure/azure-dev) pour des problèmes spécifiques à AZD

## Ressources

- [Dépannage Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Dépannage des applications conteneurisées](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Dépannage Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour les débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 7 - Dépannage et débogage
- **⬅️ Précédent** : [Guide de débogage](debugging.md)
- **➡️ Chapitre suivant** : [Chapitre 8 : Modèles de production et d'entreprise](../ai-foundry/production-ai-practices.md)
- **🤖 Connexe** : [Chapitre 2 : Développement axé sur l'IA](../ai-foundry/azure-ai-foundry-integration.md)
- [Dépannage Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.