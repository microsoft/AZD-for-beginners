# Guide de dépannage spécifique à l’IA

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 7 - Dépannage et débogage
- **⬅️ Précédent** : [Guide de débogage](debugging.md)
- **➡️ Chapitre suivant** : [Chapitre 8 : Production & Modèles Entreprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Connexes** : [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ce guide de dépannage complet aborde les problèmes courants lors du déploiement de solutions IA avec AZD, fournissant des solutions et des techniques de débogage spécifiques aux services Azure AI.

> **Portée :** Les commandes utilisent des noms de ressources exemples ; remplacez-les et sélectionnez l’abonnement correct. Les blocs Bicep sont des fragments à intégrer dans un modèle existant, pas des déploiements autonomes. Les extraits Python nécessitent les SDK indiqués et la configuration de l’application. Aucun déploiement Azure en direct n’a été réalisé pour cette revue.

## Table des matières

- [Problèmes du service Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problèmes de recherche Azure AI](#azure-ai-search-problems)
- [Problèmes de déploiement Container Apps](#container-apps-deployment-issues)
- [Erreurs d’authentification et d’autorisation](#authentication-and-permission-errors)
- [Échecs de déploiement de modèle](#model-deployment-failures)
- [Problèmes de performance et de montée en charge](#performance-and-scaling-issues)
- [Gestion des coûts et quotas](#cost-and-quota-management)
- [Outils et techniques de débogage](#debugging-tools-and-techniques)

## Problèmes du service Microsoft Foundry Models

### Problème : Service OpenAI indisponible dans la région

**Symptômes :**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causes :**
- Microsoft Foundry Models non disponible dans la région sélectionnée
- Quota épuisé dans les régions préférées
- Contraintes de capacité régionale

**Solutions :**

1. **Vérifier la disponibilité régionale :**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Mettre à jour la configuration AZD :**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Utiliser des régions alternatives :**
```bicep
// infra/main.bicep - Explicit location selection, NOT automatic fallback
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
  --location eastus2 --output table
```

2. **Demander une augmentation de quota :**
Utilisez le workflow de gestion des quotas du portail Foundry pour l’abonnement, la région, le modèle et le type de déploiement affectés. Voir la [documentation officielle sur les quotas](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Une demande de quota VM n’augmente pas le quota de modèle.

3. **Optimiser la capacité du modèle :**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi // Existing account resource declared in your template
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'GlobalStandard' // Verify this model/version/type in the target region
    capacity: 1  // Capacity units are model/deployment-type specific
  }
}
```

### Problème : Version d’API invalide

**Symptômes :**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solutions :**

1. **Utiliser une version d’API prise en charge :**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Vérifier la compatibilité de la version d’API :**
Consultez la [référence du cycle de vie de l’API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Les versions API des fournisseurs de ressources ARM ne listent **pas** les versions de l’API d’inférence/panneau de données. Les nouveaux clients v1 utilisent `/openai/v1/` sans `api-version` daté ; ne mélangez pas ces deux configurations clients.

## Problèmes de recherche Azure AI

### Problème : Niveau tarifaire du service de recherche insuffisant

**Symptômes :**
```
Error: Semantic search requires Basic tier or higher
```

**Solutions :**

1. **Utiliser un niveau tarifaire pris en charge :**

Le classificateur sémantique nécessite Basic ou supérieur. Passer de Free/Basic à un autre niveau peut nécessiter la création d’un nouveau service de recherche et la reconstruction des index ; modifier un SKU n’est pas une mise à niveau garantie sur place.
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
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

### Problème : Échecs de création d’index

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

2. **Vérifier le schéma de l’index :**
```python
# Validate index schema
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    # These are this application's requirements, not universal Search fields.
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Utiliser une identité gérée :**
```bicep
// Grant index-definition management permissions to the managed identity.
// Search Index Data Contributor manages documents, not index definitions.
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, 'Search Service Contributor')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalType: 'ServicePrincipal'
  }
}
```

## Problèmes de déploiement Container Apps

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
# Dependency names for these snippets. Resolve supported versions in your
# project's environment, test together, then commit a lock/pinned requirements file.
fastapi
uvicorn
openai
azure-identity
azure-keyvault-secrets
azure-search-documents
azure-cosmos
```

3. **Ajouter un contrôle d’état :**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problème : Échecs de démarrage de l’application conteneur

**Symptômes :**
```
Error: Container failed to start within timeout period
```

**Solutions :**

1. **Allonger le délai de démarrage :**
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
              type: 'Startup'
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
# Illustrative skeleton: implement _initialize_client and synchronize concurrent
# initialization before using this pattern in an application.
import asyncio
from contextlib import asynccontextmanager
from fastapi import FastAPI

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

## Erreurs d’authentification et d’autorisation

### Problème : Permission refusée pour l’identité gérée

**Symptômes :**
```
Error: Authentication failed for Microsoft Foundry Models Service
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

3. **Tester l’authentification :**
```python
# Test managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

def test_authentication():
    try:
        with DefaultAzureCredential() as credential:
            token = credential.get_token("https://cognitiveservices.azure.com/.default")
            print(f"Token acquired; expires at Unix time {token.expires_on}")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")

test_authentication()
```

L’acquisition d’un jeton prouve l’authentification, pas la permission d’invoquer un modèle. Testez l’opération prévue séparément. Localement, `DefaultAzureCredential` peut utiliser des identifiants développeur ; sur Azure, vérifiez que l’identité gérée prévue est sélectionnée.

### Problème : Accès refusé au Key Vault

**Symptômes :**
```
Error: The user, group or application does not have secrets get permission
```

**Solutions :**

1. **Accorder les permissions sur le Key Vault :**

Utilisez le fragment de politique d’accès suivant uniquement pour un coffre avec `enableRbacAuthorization: false`. Pour un coffre activé RBAC, utilisez l’option 2 ; ajouter une politique d’accès ne donne pas l’accès au niveau données en mode RBAC.
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

2. **Utiliser RBAC au lieu des politiques d’accès :**

Le coffre doit avoir `enableRbacAuthorization: true` ; changer de modèle de permission nécessite une migration planifiée des accès existants.
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

## Échecs de déploiement de modèle

### Problème : Version du modèle indisponible

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
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Sélectionner explicitement un modèle disponible :**
```bicep
// Example model selection; verify version and deployment type in the catalog.
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2025-04-14'
}

// Bicep does not catch provisioning failures and retry a fallback model.
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: primaryModel.name
      version: primaryModel.version
    }
  }
  sku: {
    name: 'GlobalStandard'
    capacity: 10
  }
}
```

3. **Valider le modèle avant déploiement :**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problèmes de performance et de montée en charge

### Problème : Réponses à haute latence

**Symptômes :**
- Temps de réponse > 30 secondes
- Erreurs de délai d’attente
- Mauvaise expérience utilisateur

**Solutions :**

1. **Implémenter des délais d’attente sur les requêtes :**
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

2. **Ajouter la mise en cache des réponses :**
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

3. **Configurer l’auto-scaling :**
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

### Problème : Erreurs d’épuisement mémoire

**Symptômes :**
```
Error: Container killed due to memory limit exceeded
```

**Solutions :**

1. **Augmenter l’allocation mémoire :**
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

2. **Optimiser l’utilisation mémoire :**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def _process_ai_request(self, request):
        raise NotImplementedError("Supply the application's AI operation")

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

## Gestion des coûts et quotas

### Problème : Coûts élevés inattendus

**Symptômes :**
- Facture Azure plus élevée que prévue
- Utilisation des jetons dépassant les estimations
- Alertes budgétaires déclenchées

**Solutions :**

1. **Mettre en place des contrôles des coûts :**
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

Ce compteur en mémoire est illustratif, pas un contrôle mensuel des dépenses : il se réinitialise au redémarrage, n’est pas partagé entre réplicas, et vérifie l’utilisation seulement après un appel. Une limite réelle nécessite une comptabilité durable, des réservations sûres en concurrence avant les requêtes, et une politique de réinitialisation mensuelle. Les métriques mémoire du conteneur doivent aussi prendre en compte les limites cgroup ; `psutil.virtual_memory()` n’est pas une mesure fiable de la limite du conteneur, et le ramasse-miettes n’applique pas un plafond mémoire.

2. **Configurer des alertes de coûts :**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate // Parameter: first day of a supported budget period
      endDate: budgetEndDate     // Parameter: a future date
    }
    timeGrain: 'Monthly'
    amount: 500  // Notification threshold in the subscription's billing currency
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        thresholdType: 'Actual'
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

Déclarez `budgetStartDate` et `budgetEndDate` dans votre modèle. Les budgets notifient ; ils ne stoppent pas les ressources ni n’imposent un plafond de dépenses strict.

3. **Optimiser la sélection du modèle :**
```python
# Cost-aware model selection
MODEL_COST_TIERS = {
  'gpt-4.1-mini': 'low',
  'gpt-4.1': 'high'
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    else:
        return 'gpt-4.1'
```

## Outils et techniques de débogage

### Commandes de débogage AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View application logs (opens monitoring dashboard)
azd monitor --logs

# View live metrics
azd monitor --live

# Check environment variables
azd env get-values
```

### Commandes de l’extension AI AZD pour diagnostics

Si vous avez déployé des agents avec `azd ai agent init`, ces outils supplémentaires sont disponibles :

```bash
# Ensure the agents extension is installed
azd extension install azure.ai.agents

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Astuce :** Utilisez `azd infra generate` pour écrire IaC sur disque afin d’inspecter précisément les ressources provisionnées. C’est inestimable pour déboguer les problèmes de configuration des ressources. Voir la [référence CLI AI AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pour tous les détails.

**Diagnostics sensibles à la version (2026-11-04) :** Les agents `1.0.0-beta.23` nécessitent `azd >= 1.37.0` ; mettez à jour le CLI de base avant les extensions incompatibles. Cette version d’agent conserve les avertissements RBAC développeur dans la sortie finale du déploiement et identifie la version impliquée dans les échecs/timeout d’activation. Un timeout n’établit pas que le déploiement a échoué : inspectez la version tentée avant de réessayer. Elle corrige aussi les invocations A2A 0.3 affichant des messages de cycle de vie au lieu de réponses complètes. Le noyau `azd 1.37.1` corrige la propagation d’annulation entre extensions ; `1.37.2` améliore les confirmations critiques de provisionnement et la gestion des annulations.

Si la commande d’évaluation d’un ancien tutoriel n’imprime que les conseils de migration, installez `azure.ai.evaluations` (`1.0.0-beta.2` nécessite `azd >= 1.33.0`) et utilisez `azd ai eval init`, `generate`, et `run start`. L’optimisation `--config` n’accepte plus les fichiers d’évaluation hérités. Voir [migration d’évaluation](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) et [migration d’optimisation](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Débogage d’application

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

2. **Points de contrôle santé :**
```python
# Integration fragment: add to an existing FastAPI app, protect this diagnostic
# endpoint, and configure AZURE_SEARCH_ENDPOINT. This tests Search index-list
# authorization, not Azure OpenAI inference.
import os
from azure.identity.aio import DefaultAzureCredential
from azure.search.documents.indexes.aio import SearchIndexClient
from fastapi import Response

@app.get("/debug/health")
async def detailed_health_check(response: Response):
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check Search service
    try:
        async with DefaultAzureCredential() as credential:
            async with SearchIndexClient(
                endpoint=os.environ['AZURE_SEARCH_ENDPOINT'],
                credential=credential
            ) as search_client:
                # AsyncItemPaged is iterated asynchronously, not awaited as a list.
                async for _ in search_client.list_index_names():
                    break
        checks['search'] = {'status': 'healthy'}
    except Exception:
        response.status_code = 503
        checks['search'] = {'status': 'unhealthy'}
    
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

## Codes d’erreur courants et solutions

| Code d’erreur | Description | Solution |
|------------|-------------|----------|
| 401 | Non autorisé | Vérifier les clés API et la configuration de l’identité gérée |
| 403 | Interdit | Vérifier les affectations de rôle RBAC |
| 429 | Limitation de débit | Implémenter une logique de retry avec backoff exponentiel |
| 500 | Erreur interne du serveur | Vérifier le statut et les journaux du déploiement du modèle |
| 503 | Service indisponible | Vérifier la santé du service et la disponibilité régionale |

## Prochaines étapes

1. **Consulter le [Guide de déploiement de modèles IA](../chapter-02-ai-development/ai-model-deployment.md)** pour les bonnes pratiques de déploiement
2. **Suivre les [Pratiques IA en production](../chapter-08-production/production-ai-practices.md)** pour des solutions prêtes pour l’entreprise
3. **Rejoindre le [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** pour le support communautaire
4. **Soumettre des problèmes** au [dépôt GitHub AZD](https://github.com/Azure/azure-dev) pour les problèmes spécifiques à AZD

## Ressources

- [Dépannage des quotas et limitations Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Dépannage Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Dépannage Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Compétence Agent de diagnostic Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installez les compétences de dépannage Azure dans votre éditeur : `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 7 - Dépannage et débogage
- **⬅️ Précédent** : [Guide de débogage](debugging.md)
- **➡️ Chapitre suivant** : [Chapitre 8 : Production & Modèles Entreprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Connexes** : [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Référence** : [Dépannage Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->