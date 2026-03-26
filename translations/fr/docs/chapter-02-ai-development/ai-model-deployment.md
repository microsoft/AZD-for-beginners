# Déploiement de modèles d'IA avec Azure Developer CLI

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 2 - Développement axé sur l'IA
- **⬅️ Précédent**: [Intégration Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Suivant**: [Atelier sur l'IA](ai-workshop-lab.md)
- **🚀 Chapitre suivant**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

Ce guide fournit des instructions complètes pour déployer des modèles d'IA en utilisant les templates AZD, couvrant tout, du choix du modèle aux modèles de déploiement en production.

## Table des matières

- [Stratégie de sélection de modèle](../../../../docs/chapter-02-ai-development)
- [Configuration AZD pour les modèles d'IA](../../../../docs/chapter-02-ai-development)
- [Modèles de déploiement](../../../../docs/chapter-02-ai-development)
- [Gestion des modèles](../../../../docs/chapter-02-ai-development)
- [Considérations pour la production](../../../../docs/chapter-02-ai-development)
- [Surveillance et observabilité](../../../../docs/chapter-02-ai-development)

## Stratégie de sélection de modèle

### Microsoft Foundry Modèles Modèles

Choisissez le bon modèle pour votre cas d'utilisation :

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Planification de la capacité des modèles

| Type de modèle | Cas d'utilisation | Capacité recommandée | Considérations de coût |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&R | 10-50 TPM | Rentable pour la plupart des charges de travail |
| gpt-4.1 | Raisonnement complexe | 20-100 TPM | Coût plus élevé, à utiliser pour des fonctionnalités premium |
| Text-embedding-ada-002 | Recherche, RAG | 30-120 TPM | Essentiel pour la recherche sémantique |
| Whisper | Parole vers texte | 10-50 TPM | Charges de traitement audio |

## Configuration AZD pour les modèles d'IA

### Configuration du template Bicep

Créez des déploiements de modèles via des templates Bicep :

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

### Variables d'environnement

Configurez l'environnement de votre application :

```bash
# Configuration du fichier .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Modèles de déploiement

### Modèle 1 : Déploiement dans une seule région

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Idéal pour :
- Développement et tests
- Applications pour un seul marché
- Optimisation des coûts

### Modèle 2 : Déploiement multi-région

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Idéal pour :
- Applications mondiales
- Exigences de haute disponibilité
- Répartition de la charge

### Modèle 3 : Déploiement hybride

Combinez les modèles Microsoft Foundry avec d'autres services d'IA :

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## Gestion des modèles

### Contrôle de version

Suivez les versions des modèles dans votre configuration AZD :

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### Mises à jour des modèles

Utilisez les hooks AZD pour les mises à jour des modèles :

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### Tests A/B

Déployez plusieurs versions du modèle :

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Considérations pour la production

### Planification de la capacité

Calculez la capacité requise en fonction des modèles d'utilisation :

```python
# Exemple de calcul de capacité
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# Exemple d'utilisation
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Configuration de l'auto-scaling

Configurez l'auto-scaling pour les Container Apps :

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### Optimisation des coûts

Mettez en place des contrôles des coûts :

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## Surveillance et observabilité

### Intégration Application Insights

Configurez la surveillance pour les charges de travail IA :

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### Métriques personnalisées

Suivez les métriques spécifiques à l'IA :

```python
# Télémétrie personnalisée pour les modèles d'IA
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### Vérifications de santé

Mettez en œuvre la surveillance de l'état des services d'IA :

```python
# Points de terminaison pour la vérification de l'état
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test de la connexion à OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## Étapes suivantes

1. **Consultez le [Guide d'intégration Microsoft Foundry](microsoft-foundry-integration.md)** pour les modèles d'intégration de services
2. **Complétez l'[atelier pratique sur l'IA](ai-workshop-lab.md)** pour une expérience pratique
3. **Mettez en œuvre les [pratiques d'IA en production](production-ai-practices.md)** pour les déploiements en entreprise
4. **Consultez le [guide de dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)** pour les problèmes courants

## Ressources

- [Disponibilité des modèles Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Mise à l'échelle des Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimisation des coûts des modèles d'IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 2 - Développement axé sur l'IA
- **⬅️ Précédent**: [Intégration Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Suivant**: [Atelier sur l'IA](ai-workshop-lab.md)
- **🚀 Chapitre suivant**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->