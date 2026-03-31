# Guide de dépannage spécifique à l'IA

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 7 - Dépannage & Debugging
- **⬅️ Précédent** : [Guide de Debugging](debugging.md)
- **➡️ Chapitre suivant** : [Chapitre 8 : Pratiques de production & entreprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Connexe** : [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ce guide complet de dépannage traite des problèmes courants lors du déploiement de solutions IA avec AZD, en fournissant des solutions et des techniques de débogage spécifiques aux services Azure AI.

## Table des matières

- [Problèmes du service Microsoft Foundry Models](#azure-openai-service-issues)
- [Problèmes Azure AI Search](#problèmes-azure-ai-search)
- [Problèmes de déploiement Container Apps](#problèmes-de-déploiement-container-apps)
- [Erreurs d'authentification et d'autorisation](#erreurs-dauthentification-et-dautorisation)
- [Échecs de déploiement de modèle](#échecs-de-déploiement-de-modèle)
- [Problèmes de performance et de montée en charge](#problèmes-de-performance-et-de-montée-en-charge)
- [Gestion des coûts et des quotas](#gestion-des-coûts-et-des-quotas)
- [Outils et techniques de débogage](#outils-et-techniques-de-débogage)

## Problèmes du service Microsoft Foundry Models

### Problème : Service OpenAI indisponible dans la région

**Symptômes :**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causes :**
- Microsoft Foundry Models non disponible dans la région sélectionnée
- Quota épuisé dans les régions privilégiées
- Contraintes de capacité régionales

**Solutions :**

1. **Vérifier la disponibilité de la région :**
```bash
# Liste des régions disponibles pour OpenAI
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

### Problème : Quota de déploiement du modèle dépassé

**Symptômes :**
```
Error: Deployment failed due to insufficient quota
```

**Solutions :**

1. **Vérifier le quota actuel :**
```bash
# Vérifier l'utilisation du quota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Demander une augmentation du quota :**
```bash
# Soumettre une demande d'augmentation de quota
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
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Problème : Version d'API invalide

**Symptômes :**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solutions :**

1. **Utiliser une version d'API prise en charge :**
```python
# Utilisez la dernière version prise en charge
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Vérifier la compatibilité de la version d'API :**
```bash
# Lister les versions d'API prises en charge
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problèmes Azure AI Search

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
# Obtenir la clé d'administration du service de recherche
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Vérifier le schéma de l'index :**
```python
# Valider le schéma de l'index
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

## Problèmes de déploiement Container Apps

### Problème : Échecs de construction du conteneur

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

3. **Ajouter un contrôle de santé :**
```python
# main.py - Ajouter un point de terminaison de vérification de l'état
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problème : Échecs au démarrage de l'application conteneur

**Symptômes :**
```
Error: Container failed to start within timeout period
```

**Solutions :**

1. **Augmenter le délai d'attente au démarrage :**
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
# Chargement paresseux des modèles pour réduire le temps de démarrage
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
        # Initialiser le client IA ici
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Démarrage
    app.state.model_manager = ModelManager()
    yield
    # Arrêt
    pass

app = FastAPI(lifespan=lifespan)
```

## Erreurs d'authentification et d'autorisation

### Problème : Autorisation refusée pour l'identité managée

**Symptômes :**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Solutions :**

1. **Vérifier les affectations de rôle :**
```bash
# Vérifier les affectations de rôles actuelles
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
# Tester l'authentification d'identité gérée
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

## Échecs de déploiement de modèle

### Problème : Version du modèle non disponible

**Symptômes :**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solutions :**

1. **Vérifier les modèles disponibles :**
```bash
# Lister les modèles disponibles
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Utiliser des modèles de repli :**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
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

3. **Valider le modèle avant déploiement :**
```python
# Validation du modèle avant déploiement
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

## Problèmes de performance et de montée en charge

### Problème : Réponses à haute latence

**Symptômes :**
- Temps de réponse > 30 secondes
- Erreurs de dépassement de délai
- Mauvaise expérience utilisateur

**Solutions :**

1. **Mettre en place des délais d'attente de requête :**
```python
# Configurer des délais d'attente appropriés
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

2. **Ajouter un cache de réponse :**
```python
# Cache Redis pour les réponses
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

3. **Configurer l’auto-scalabilité :**
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

2. **Optimiser l’utilisation de la mémoire :**
```python
# Gestion efficace de la mémoire du modèle
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Vérifier l'utilisation de la mémoire avant le traitement
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forcer la collecte des déchets
            
        result = await self._process_ai_request(request)
        
        # Nettoyer après le traitement
        gc.collect()
        return result
```

## Gestion des coûts et des quotas

### Problème : Coûts élevés inattendus

**Symptômes :**
- Facture Azure plus élevée que prévu
- Utilisation de tokens dépassant les estimations
- Alertes budgétaires déclenchées

**Solutions :**

1. **Mettre en place des contrôles de coûts :**
```python
# Suivi de l'utilisation des jetons
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
# Sélection de modèle en tenant compte des coûts
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

### Commandes de debug AZD

```bash
# Activer la journalisation détaillée
azd up --debug

# Vérifier le statut du déploiement
azd show

# Voir les journaux de l'application (ouvre le tableau de bord de surveillance)
azd monitor --logs

# Voir les métriques en temps réel
azd monitor --live

# Vérifier les variables d'environnement
azd env get-values
```

### Commandes de l’extension AZD AI pour diagnostics

Si vous avez déployé des agents avec `azd ai agent init`, ces outils supplémentaires sont disponibles :

```bash
# Assurez-vous que l'extension des agents est installée
azd extension install azure.ai.agents

# Réinitialiser ou mettre à jour un agent à partir d'un manifeste
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Utilisez le serveur MCP pour permettre aux outils d'IA d'interroger l'état du projet
azd mcp start

# Générer des fichiers d'infrastructure pour examen et audit
azd infra generate
```

> **Conseil :** Utilisez `azd infra generate` pour écrire l’IaC sur disque afin d’inspecter exactement les ressources provisionnées. Ceci est inestimable pour déboguer les problèmes de configuration des ressources. Voir la [référence AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pour tous les détails.

### Débogage d’application

1. **Journalisation structurée :**
```python
import logging
import json

# Configurer la journalisation structurée pour les applications d'IA
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

2. **Points de contrôle de santé :**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Vérifier la connectivité OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Vérifier le service de recherche
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

## Codes d’erreur courants et solutions

| Code d’erreur | Description | Solution |
|---------------|-------------|----------|
| 401 | Non autorisé | Vérifiez les clés API et la configuration de l’identité managée |
| 403 | Interdit | Vérifiez les affectations de rôles RBAC |
| 429 | Limite de fréquence atteinte | Implémentez une logique de retry avec backoff exponentiel |
| 500 | Erreur interne du serveur | Vérifiez l’état du déploiement du modèle et les journaux |
| 503 | Service indisponible | Vérifiez la santé du service et la disponibilité régionale |

## Étapes suivantes

1. **Consultez le [Guide de déploiement de modèles IA](../chapter-02-ai-development/ai-model-deployment.md)** pour les meilleures pratiques de déploiement
2. **Complétez les [Pratiques AI de production](../chapter-08-production/production-ai-practices.md)** pour des solutions prêtes pour l’entreprise
3. **Rejoignez le [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pour le support communautaire
4. **Soumettez des problèmes** au [dépôt GitHub AZD](https://github.com/Azure/azure-dev) pour des problèmes spécifiques à AZD

## Ressources

- [Dépannage du service Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Dépannage Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Dépannage Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Compétence Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) – Installez des compétences de dépannage Azure dans votre éditeur : `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 7 - Dépannage & Debugging
- **⬅️ Précédent** : [Guide de Debugging](debugging.md)
- **➡️ Chapitre suivant** : [Chapitre 8 : Pratiques de production & entreprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Connexe** : [Chapitre 2 : Développement AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Référence** : [Dépannage Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->