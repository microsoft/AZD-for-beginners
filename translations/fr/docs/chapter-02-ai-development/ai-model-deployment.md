# Déploiement de Modèles d'IA avec Azure Developer CLI

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Précédent** : [Agents IA](agents.md)
- **➡️ Suivant** : [Atelier AI](ai-workshop-lab.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

Ce guide fournit des instructions complètes pour déployer des modèles d'IA en utilisant les modèles AZD, couvrant tout, de la sélection du modèle aux modèles de déploiement en production.

> **Revue de la version (2026-11-04) :** Les changements liés au CLI ont été examinés par rapport à `azd` `1.37.2` ; la disponibilité des modèles, les versions et les quotas dépendent de la région et de l'abonnement. `azd deploy --timeout <seconds>` contrôle la fenêtre de déploiement du service, pas une garantie d'activation de l'agent. Voir [notes de version actuelles et guide de migration IA](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Table des Matières

- [Stratégie de sélection du modèle](#model-selection-strategy)
- [Configuration AZD pour modèles IA](#azd-configuration-for-ai-models)
- [Modèles de déploiement](#deployment-patterns)
- [Gestion des modèles](#model-management)
- [Considérations en production](#production-considerations)
- [Surveillance et observabilité](#monitoring-and-observability)

## Stratégie de sélection du modèle

### Modèles Azure OpenAI dans Microsoft Foundry

Choisissez le modèle adapté à votre cas d'utilisation :

Déclarez les déploiements de modèles dans Bicep (ci-dessous), pas dans des paramètres `services.*.config.AZURE_OPENAI_MODELS` arbitraires. AZD n'interprète pas un tel paramètre comme une liste de ressources modèle. Le `project` d'un service pointe vers la source de l'application, pas son répertoire `infra/`.

Les exemples utilisent la version `gpt-4.1-mini` publiée **`2025-04-14`** et la version d'embedding **`1`**. Confirmez que la version du modèle et le SKU de déploiement sont pris en charge dans votre région/compte cible avant de provisionner.

### Planification de la capacité du modèle

| Type de modèle | Cas d'utilisation | Demande illustrative de tokens | Considérations de coûts |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&R | 10 000-50 000 TPM | Benchmark Coût et qualité pour votre charge de travail |
| gpt-4.1 | Tâches complexes | 20 000-100 000 TPM | Évaluer les gains de qualité par rapport au coût en tokens |
| text-embedding-3-large | Recherche, RAG | 30 000-120 000 TPM | Prendre en compte l'ingestion ainsi que le trafic de requêtes |
| Whisper | Reconnaissance vocale | Planifier avec la durée audio et les limites de requêtes | Ne pas appliquer de formule de capacité TPM modèle texte |

TPM signifie tokens par minute. Pour ces déploiements texte Standard, ARM `sku.capacity` est en **unités de 1 000 TPM**, pas en TPM individuel (capacité `10` signifie 10 000 TPM). Le ratio RPM-vers-TPM varie selon le modèle/type de déploiement ; vérifiez les deux limites avec la [documentation des quotas](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ces plages sont des exemples, pas des recommandations de dimensionnement.

## Configuration AZD pour modèles IA

### Configuration du modèle Bicep

Créez des déploiements de modèles via des templates Bicep :

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
    disableLocalAuth: true
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

Ceci est un **exemple d'infrastructure de développement** à l'échelle d'un groupe de ressources, pas un template complet d'application AZD. Le compte autorise l'accès réseau public et requiert une authentification Entra ID/RBAC (`Cognitive Services OpenAI User` pour les appelants). La production nécessite le point de terminaison privé, DNS et la connectivité applicative décrits au Chapitre 8. AZD a aussi besoin d'un mapping principal template/paramètre et de ressources hôtes applicatives ; utilisez un exemple fonctionnel pour un déploiement complet.

### Variables d'environnement

Configurez votre environnement applicatif :

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ce sont des noms définis par l'application ; intégrez-les dans la configuration de votre hôte. Le point de terminaison Azure OpenAI v1 utilisé par le contrôle de santé ci-dessous n'exige pas le paramètre de requête daté `api-version` ; les clients `AzureOpenAI` plus anciens oui, adaptez-vous donc à la génération d'API utilisée par votre application.

## Modèles de déploiement

### Modèle 1 : Déploiement mono-région

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Idéal pour :
- Développement et test
- Applications sur un seul marché
- Optimisation des coûts

### Modèle 2 : Déploiement multi-régions

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Les propriétés de compte/SKU omises doivent être fournies ; ce fragment n'est pas déployable tel quel. Déployez les modèles dans chaque compte et mettez en œuvre séparément le routage/basculement et les contrôles de résidence des données.

Idéal pour :
- Applications globales
- Exigences de haute disponibilité
- Répartition de charge

### Modèle 3 : Déploiement hybride

Combinez les modèles Microsoft Foundry avec d'autres services IA :

Les fragments suivants supposent que les noms et `location` sont fournis par le template contenant.

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

Suivez les versions des modèles dans la configuration de votre application ou IaC. Ce JSON est un **exemple défini par l'application**, pas un schéma de modèle AZD intégré ; une solution de secours doit être implémentée et déployée explicitement :

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Mises à jour de modèles

Utilisez un hook AZD pour une vérification de disponibilité en lecture seule, puis mettez à jour l’IaC et provisionnez-le :

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Exécutez `azd up` **en dehors** du hook pour appliquer l'infrastructure de modèle modifiée et déployer le code. N'appelez jamais `azd deploy` depuis un hook `predeploy`: cela déclenche récursivement le même hook. `azd deploy --timeout 1800` prolonge un timeout de déploiement applicatif ; il ne met pas à jour les ressources Bicep.

### Test A/B

La ressource illustrative ci-dessous sélectionne un nom de déploiement et une capacité ; elle crée **un** déploiement, pas un test A/B. Pour une véritable expérience, provisionnez deux ressources de déploiement distinctes, routez une fraction contrôlée des requêtes vers chacune, et comparez qualité, latence et coût. Elle part de `openAi` de l'exemple de compte :

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Considérations en production

### Planification de la capacité

Calculez la capacité requise en fonction des patterns d’utilisation :

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Sortie attendue : `Required capacity: 9100 TPM`. Avec des unités de capacité 1 000 TPM, arrondissez à au moins `10`, puis vérifiez l’estimation RPM spécifique au modèle et la limitation de débit du service (y compris le budget de sortie demandé). Cette estimation de demande en tokens ne garantit pas d'éviter la limitation.

### Configuration d’auto-scaling

Configurez l'auto-scaling pour Container Apps :

**Ressource partielle :** fusionnez les paramètres `template.scale` dans un Container App complet avec emplacement, environnement managé, image container, ressources et ingress. Le scaling des répliques n'augmente pas le quota de modèle.

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

Mettez en œuvre des contrôles de coûts :

**Ressource budget illustrative :** définissez `budgetStartDate` comme le premier jour du mois en cours UTC (par exemple `2026-11-01T00:00:00Z` pour cette revue), et remplacez l'adresse de contact. Le début doit respecter les contraintes de date actuelles du service. Les budgets alertent sur des données de facturation retardées ; ils ne coupent pas les dépenses.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Configurez la surveillance des charges de travail IA :

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

```

Le fragment de ressource suppose `applicationInsightsName`, `location`, et un `logAnalyticsWorkspace` existant. Il provisionne la surveillance, mais n’instrumente pas l’application ni ne crée de métriques personnalisées.

### Métriques personnalisées

Suivez les métriques spécifiques à l’IA :

Utilisez la [distribution Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) prise en charge, pas le SDK Python `applicationinsights` hérité. Installez `azure-monitor-opentelemetry`, configurez `APPLICATIONINSIGHTS_CONNECTION_STRING`, et initialisez une fois au démarrage :

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

Ceci illustre l'émission d'attributs, pas l'instrumentation réelle des appels modèle. Encapsulez la requête réelle dans un span pour mesurer sa durée ; inspectez `dependencies`/`traces` dans Application Insights. N'envoyez pas les prompts, réponses, clés, ni messages d'exception bruts contenant des données sensibles.

### Contrôles de santé

Mettez en œuvre la surveillance de santé du service IA :

Installez `fastapi`, `uvicorn`, `httpx`, et `azure-identity`. Définissez les variables endpoint/déploiement ci-dessus et accordez à l’appelant `Cognitive Services OpenAI User`. Cette **sonde de disponibilité** utilise le plan de données Azure OpenAI v1 avec Entra ID ; elle effectue un appel modèle facturable. Exécutez avec `uvicorn health:app` après avoir sauvegardé en `health.py`. Utilisez un contrôle de vivacité léger séparé, limitez/cachez les résultats de disponibilité, et ne rendez pas cette route publique sans contrôles d’accès.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Attendu : `GET /health/ai-models` retourne `200 {"status":"healthy"}` quand le déploiement de chat configuré est utilisable, ou `503` sans divulguer les détails en amont. La liste des déploiements est une opération de plan de gestion et n’est pas une sonde de santé valide pour le plan de données.

## Étapes suivantes

1. **Consultez le [Guide d'intégration Microsoft Foundry](microsoft-foundry-integration.md)** pour les modèles d'intégration de services
2. **Complétez l'[Atelier AI](ai-workshop-lab.md)** pour une expérience pratique
3. **Mettez en œuvre les [Pratiques IA en production](../chapter-08-production/production-ai-practices.md)** pour les déploiements d'entreprise
4. **Explorez le [Guide de dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)** pour les problèmes courants

## Ressources

- [Disponibilité des modèles Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scaling Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimisation des coûts des modèles IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Précédent** : [Agents IA](agents.md)
- **➡️ Suivant** : [Atelier AI](ai-workshop-lab.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->