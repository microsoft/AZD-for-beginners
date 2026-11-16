# Intégration Microsoft Foundry avec AZD

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant** : [Agents d'IA](agents.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Aperçu

Ce guide montre comment intégrer les services Microsoft Foundry avec Azure Developer CLI (AZD) pour des déploiements d'applications IA simplifiés. Microsoft Foundry fournit une plateforme complète pour construire, déployer et gérer des applications IA, tandis qu'AZD simplifie le processus d'infrastructure et de déploiement.

## Qu'est-ce que Microsoft Foundry ?

Microsoft Foundry est la plateforme unifiée de Microsoft pour le développement IA qui inclut :

- **Catalogue de modèles** : Accès aux modèles IA de pointe
- **Prompt Flow** : Concepteur visuel pour les workflows IA
- **Portail Microsoft Foundry** : Environnement de développement intégré pour les applications IA
- **Options de déploiement** : Multiples options d'hébergement et de mise à l'échelle
- **Sécurité et sûreté** : Fonctions IA responsables intégrées

## AZD + Microsoft Foundry : Mieux ensemble

| Fonctionnalité | Microsoft Foundry | Avantage de l’intégration AZD |
|---------|-----------------|------------------------|
| **Déploiement de modèle** | Déploiement manuel via le portail | Déploiements automatisés et réplicables |
| **Infrastructure** | Configuration projet et ressources | Démarrer depuis `azure.yaml` ; exporter Bicep ou Terraform selon besoin |
| **Gestion des environnements** | Focus sur un seul environnement | Multi-environnements (dev/staging/prod) |
| **Intégration CI/CD** | Services de déploiement et évaluation | Réutiliser la configuration dans GitHub Actions ou Azure DevOps |
| **Gestion des coûts** | Surveillance basique | Optimisation des coûts par environnement |

## Prérequis

- Abonnement Azure avec les permissions appropriées
- Azure Developer CLI 1.37.0 ou plus récent pour le workflow GA Foundry
- Accès aux services Microsoft Foundry Models
- Connaissance basique de Microsoft Foundry

> **Mise à jour GA Foundry (2026-11-09) :** Le bundle d’extension `microsoft.foundry` a atteint la version 1.0 et la disponibilité générale le [5 novembre 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Le tutoriel ci-dessous suit cette annonce et le démarrage rapide Microsoft Learn lié. Ceci est une revue documentaire, pas une validation de déploiement en direct. Les fonctionnalités en aperçu facultatives et les extensions publiées indépendamment gardent leur propre statut de version.

**Résultats d’apprentissage :** Installer le bundle GA, examiner le `azure.yaml` d’un agent, comparer les réponses locales et déployées, et expliquer évaluation, CI/CD et limites de nettoyage. Pour un déploiement agent étape par étape, voir le [tutoriel agent hébergé](#hosted-agent-walkthrough-ga). Les fragments ressources ci-dessous couvrent d’autres modèles d’intégration.

## Principaux modèles d’intégration

**Portée des exemples :** Le Bicep ci-dessous contient des fragments ressources illustratifs, pas un template complet déployable. Le template contenant doit définir noms, `location`, ressources référencées, identités, sorties, et hébergement d’application. Utiliser un exemple lié pour un point de départ exécutable. Les exemples Bash nécessitent une authentification Azure CLI séparée de `azd auth login`.

### Modèle 1 : Intégration Microsoft Foundry Models

**Cas d’usage** : Déployer des applications de chat avec des modèles Azure OpenAI dans Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastructure (main.bicep) :**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

L’appelant a besoin d'une identité gérée attachée et de `Cognitive Services OpenAI User` au niveau du compte ; la désactivation des clés ne donne pas accès. Vérifier la disponibilité région/modèle/SKU et quota avant déploiement.

### Modèle 2 : Intégration AI Search + RAG

**Cas d’usage** : Déployer des applications de génération augmentée par récupération (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

Il n’existe pas de ressource ARM `Microsoft.Search/searchServices/dataConnections` pour cette intégration. Configurer un index Search, source de données, indexeur/skillset ou vectoriseur via les APIs data-plane Search supportées. Si Search appelle un modèle d’embedding, activer son identité gérée, accorder le rôle modèle pertinent, et configurer sa compétence embedding/vectoriseur. Voir [vectorisation intégrée](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Modèle 3 : Intégration Document Intelligence

**Cas d’usage** : Flux de travail de traitement et analyse de documents

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Modèles de configuration

### Configuration des variables d’environnement

Sauf pour les paramètres AZD documentés comme `AZURE_LOCATION`, ce sont des **noms d’entrées templates personnalisés**. Ils n’ont aucun effet sauf si le template/application les consomme via les mappages paramètres et environnement hôte. Pour `azure-search-openai-demo`, utiliser ses noms réels comme `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` et `AZURE_SEARCH_SERVICE_SKU`. La capacité modèle n’est pas un SKU de compte.

**Configuration production :**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuration développement :**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configuration sécurisée avec Key Vault

Préférez Entra ID avec l’authentification locale clé désactivée. Ce qui suit est seulement une **alternative d’authentification par clé ancienne** pour applications nécessitant des clés : il requiert un compte avec authentification clé activée, identité applicative attachée à son hôte, et accès/réseautage Key Vault fonctionnels. Ne combinez pas récupération de clé et `disableLocalAuth: true` en espérant que les appels par clé fonctionnent.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Workflows de déploiement

### Extensions AZD pour Foundry

Pour le workflow GA, installez le bundle `microsoft.foundry` plutôt que d’assembler les extensions principales une par une :

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Le bundle installe agents, connexions, inspecteur, projets, routines, compétences et boîtes à outils. Il n’ajoute pas de groupe de commandes `microsoft.foundry`. Évaluations, ensembles de données, fine-tuning et modèles personnalisés sont installés séparément selon besoin. Voir la [référence sur le packaging des extensions](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Tutoriel Agent Hébergé (GA)

Un **agent hébergé** exécute votre code agent sur une infrastructure gérée par Foundry. Cet exercice utilise l’exemple API basique Python Agent Framework Responses en amont, pas les fragments classiques SDK Agent Service des autres leçons.

#### 1. Préparer et initialiser

Utilisez un répertoire vide en dehors de ce checkout de cours. Installez Python 3.13 ou plus récent et une version actuelle [uv release](https://docs.astral.sh/uv/getting-started/installation/). Les installations standalone uv peuvent utiliser `uv self update`. Vérifiez [permissions agent hébergé](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), disponibilité modèle et quota dans votre abonnement et région avant provisionnement. Les ressources Azure et appels locaux au modèle entraînent des coûts.

Complétez l’installation de `azd auth login` et du bundle ci-dessus. Le code exemple local utilise `DefaultAzureCredential` ; si vous utilisez les identifiants Azure CLI, connectez-vous avec `az login` en utilisant le même compte et locataire qu’AZD. La connexion AZD seule ne valide pas une connexion Azure CLI.

Exécutez cette commande en ligne unique dans Bash ou PowerShell :

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Choisissez un projet Foundry nouveau ou existant et l’abonnement et région prévus. Pour réutiliser un déploiement modèle, ajoutez `--model-deployment <existing-deployment-name>` à la commande d’initialisation **avant de la lancer**, et sélectionnez le projet existant. Restez dans le répertoire contenant le fichier `azure.yaml` généré pour les commandes suivantes.

#### 2. Examiner la définition de déploiement

Ouvrez `azure.yaml` et localisez ces paramètres dans l’[exemple en amont](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml) :

| Paramètre | À vérifier |
|---------|---------------|
| `host: azure.ai.project` et `deployments` | Projet Foundry et nom modèle prévus, version, SKU déploiement, et capacité |
| `host: azure.ai.agent` et `project` | Agent hébergé et répertoire contenant son code source |
| `codeConfiguration` | Runtime Python et point d’entrée ; l’exemple examiné utilise `python_3_13` et `main.py` |
| `uses` | Dépendance au service projet Foundry |
| `container.resources` | Allocation CPU et mémoire, même si code build à distance |
| `env` | Mapping déploiement modèle et `PYTHONNOUSERSITE: "1"` pour désactiver chargement de packages côté utilisateur |
| `infra.provider` | `microsoft.foundry`, qui synthétise l’infrastructure requise |

Engagez ensemble le `azure.yaml` revu et le code agent. Aucune infrastructure écrite à la main n’est nécessaire au départ ; quand vous avez besoin de fichiers provision editables, suivez [éjection infrastructure](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) pour Bicep ou Terraform et continuez d’utiliser `azd provision`. Ne committez pas les identifiants ni l’état d’environnement `.azure/`.

#### 3. Provisionner et tester localement

```bash
azd provision
azd ai agent run
```

Le provisionnement peut créer des déploiements modèle manquants **même dans un projet réutilisé**. Passez en revue les prompts modèle et sélectionnez un type de déploiement en ligne disponible comme Global Standard ou Data Zone Standard ; quota et support régional varient.

L’exécution locale prépare les dépendances et ouvre **Agent Inspector**, où vous pouvez inspecter requêtes, réponses, et activité outil/modèle. Gardez-le ouvert et ouvrez un second terminal dans le même répertoire projet :

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Point de contrôle :** Confirmez que vous recevez une réponse pertinente et pouvez inspecter l’activité locale associée. L’exécution locale appelle toujours votre déploiement modèle Azure ; ce n’est pas un test hors-ligne ou gratuit. Utilisez des prompts synthétiques et évitez d’exposer secrets ou données sensibles dans la sortie inspecteur.

#### 4. Déployer et comparer

Arrêtez l’exécution locale avec Ctrl+C quand fini. Avant l’invocation à distance, configurez ou vérifiez la [connexion Application Insights du projet et accès trace lecture](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

En mode déploiement code, AZD télécharge la source pour une build Foundry distante ; vous n'avez pas besoin d’un build container local pour cette voie. La sortie de déploiement fournit des liens playground et endpoint. Vérifiez une réponse de l’agent déployé et sa trace cloud ; seuls les événements inspecteur locaux ne prouvent pas que le traçage cloud fonctionne.

Pour les changements suivants, examinez la configuration agent hébergé supportée avec `azd deploy --preview`. Diffusez les logs avec `azd ai agent monitor --follow`, ou diagnostiquez problème de configuration et accès avec `azd ai agent doctor`. Un aperçu de déploiement n’est pas une revue complète infrastructure ou sécurité.

#### 5. Ajouter un contrôle qualité répétable

Installez l’extension évaluations publiée indépendamment, puis générez des actifs de test brouillons :

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Décrivez le comportement attendu de l’agent et sélectionnez **Dataset and evaluator**, puis **Turn**. Passez en revue et éditez les cas générés et la grille de notation, y compris un cas question non supportée, avant de configurer l’évaluation :

```bash
azd ai eval init --name quality
```

Sélectionnez le dataset et la grille revus et confirmez le déploiement modèle juge. Inspectez `evals/azure.eval.yaml` et sa référence au service évaluation dans `azure.yaml`, puis enregistrez les actifs et exécutez :

```bash
azd up
azd ai eval run start --eval quality
```

Inspectez scores et cas échoués ou en erreur ; une évaluation terminée n’est pas automatiquement un passage qualité. Génération et notation entraînent aussi des coûts modèles. Engagez la configuration non secrète, datasets, et grilles pour que les coéquipiers puissent comparer les changements. `azd ai agent optimize` peut réutiliser une évaluation compatible comme référence, mais vérifiez les candidats avant de déployer explicitement. Voir [portes qualité et migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pour projets anciens et CI.

#### 6. Réutiliser le workflow en CI/CD

Après un `azd up` réussi, exécutez `azd pipeline config` et vérifiez le workflow GitHub Actions ou Azure DevOps généré. Installez `microsoft.foundry` sur le runner, plus `azure.ai.evaluations` si vous exécutez des évaluations. Gardez les paramètres checkout, connexion et environnement générés ; seule l’installation n’authentifie pas la pipeline.

Utilisez un environnement AZD distinct par étape, accordez à l’identité pipeline les permissions ressources et Foundry requises, et conservez les credentials dans les secrets pipeline ou utilisez une identité fédérée. Engagez les actifs d’évaluation et vérifiez que l’identité peut accéder aux datasets/évaluateurs référencés. Voir l’[exemple pipeline de cours](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) et le [guide Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Nettoyer délibérément

Pour un **nouveau projet créé par cet environnement**, vérifiez les ressources listées par `azd down` avant confirmation : cela supprime le groupe de ressources et tout ce qu’il contient.

Pour un **projet réutilisé**, `azd down` laisse en place le projet, l’agent hébergé et autres ressources. Supprimez seulement les ressources inutiles dont vous êtes propriétaire en suivant les [instructions de nettoyage rapide](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources) ; ne supprimez pas un groupe de ressources partagé pour nettoyer un exercice.

**Vérification de complétion :** Expliquez quels paramètres contrôlent les comportements local et cloud, montrez des réponses locales et déployées, passez en revue un résultat d’évaluation, et identifiez quelles ressources restent après nettoyage.

### Optionnel : Générer avec la compétence Microsoft Foundry

Installez la [compétence Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) pour l’hôte de votre agent code, puis ouvrez un dossier vide séparé. Demandez-lui de générer l’exemple basique Python Agent Framework Responses API en mode déploiement code, expliquez le `azure.yaml` généré, et proposez abonnement, région, projet et déploiement modèle. Exigez l’approbation **avant création des ressources Azure**, demandez un test local, et arrêtez avant déploiement. Révisez sa sortie et poursuivez les étapes de déploiement ci-dessus seulement quand vous êtes prêt.

Pour les projets existants, `--template`/`-t` remplace l’orthographe obsolète `--manifest`/`-m` ; changer le drapeau ne migre pas les manifestes existants ni la configuration imbriquée de l’agent. Voir la [référence AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Déploiement par commande unique

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Déploiements spécifiques à l’environnement

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Supervision et Observabilité

### Intégration Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Ceci provisionne une ressource Insights, pas une instrumentation de télémétrie. Une fois que votre application émet des traces de modèle sortantes, exécutez cette requête illustrative dans les journaux Application Insights (adaptez le filtre aux noms réels de vos traces) :

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Surveillance des coûts

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Utilisez un destinataire réel et vérifiez les autorisations du périmètre de facturation. Un budget envoie des alertes ; ce n’est pas un plafond de dépenses.

## 🔐 Meilleures pratiques de sécurité

### Configuration de l’identité gérée

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Sécurité réseau

Ce fragment de point de terminaison nécessite également une zone/groupe DNS privé, des liens VNet, une connectivité VNet applicative, et une politique d’accès public explicite. La création d’un point de terminaison privé seul ne désactive pas l’accès public.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Optimisation des performances

### Stratégies de mise en cache

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium est sur une [voie de retrait](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq) ; utilisez Azure Managed Redis pour les nouveaux déploiements et suivez ses directives actuelles de modèle/authentification. Scopez les réponses AI mises en cache par autorisation, modèle/instructions, et version des données, avec expiration ; ne partagez jamais des réponses privées utilisant uniquement le texte de la requête.

### Configuration de la mise à l’échelle automatique

**Ressource partielle :** fusionnez ces réglages de mise à l’échelle/entrée dans une application Container complète avec un environnement géré, une image de conteneur, et des limites de ressources. Plus de réplicas n’augmentent pas le quota de modèle.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Résolution des problèmes courants

### Problème 1 : Quota OpenAI dépassé

**Symptômes :**
- Le déploiement échoue avec des erreurs de quota
- Erreurs 429 dans les journaux applicatifs

**Solutions :**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

La variable capacity ci-dessus s’applique uniquement à un modèle personnalisé configuré pour la consommer. Pour l’exemple RAG, utilisez `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ne changez pas `AZURE_LOCATION` pour déplacer les ressources existantes ; créez un environnement séparé pour une nouvelle région et planifiez migration/nettoyage.

### Problème 2 : Échecs d’authentification

**Symptômes :**
- Erreurs 401/403 lors des appels aux services AI
- Messages "Accès refusé"

**Solutions :**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problème 3 : Problèmes de déploiement de modèle

**Symptômes :**
- Modèles non disponibles au déploiement
- Versions spécifiques de modèle échouant

**Solutions :**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Modèles d’exemples

Ce sont des alternatives, pas des commandes séquentielles. Démarrez chacune dans un répertoire vide distinct. La destination explicite `.` conserve l’initialisation dans votre répertoire actuel ; autrement, AZD peut créer un répertoire enfant nommé d’après le modèle sans changer le répertoire actif de votre shell.

### Application Chat RAG (Python)

**Dépôt** : [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description** : Application de référence de chat RAG pour les questions sur vos documents, avec récupération Azure AI Search. Passez en revue les modèles supportés actuels, les options facultatives, les conseils de coût, et le renforcement pour production avant utilisation ; déployer un exemple ne rend pas une application prête pour la production.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Application Chat RAG (.NET)

**Dépôt** : [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description** : Équivalent .NET/C# de l’exemple de chat RAG Python. Construit avec ASP.NET Core Minimal API et frontend Blazor WebAssembly. Inclut chat vocal, support vision GPT-4o-mini, et client de bureau/mobile .NET MAUI Blazor Hybrid compagnon.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Application Chat RAG (Java)

**Dépôt** : [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description** : Version Java de l’exemple de chat RAG utilisant Langchain4J pour l’orchestration AI. Supporte une architecture microservices pilotée par événements, plusieurs stratégies de recherche (texte, vecteur, hybride), téléversement de documents avec Azure Document Intelligence, et déploiement sur Azure Container Apps ou Azure Kubernetes Service.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilote Retail Entreprise avec Microsoft Foundry

**Dépôt** : [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services** : Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description** : Copilote retail RAG complet utilisant Microsoft Foundry et Prompty. Chatbot d’un détaillant Contoso Outdoor qui fonde les réponses sur le catalogue produit et les données de commande client. Démontre le workflow complet GenAIOps — prototype avec Prompty, évaluation assistée par AI, déploiement via AZD sur Container Apps.

**Démarrage rapide** :
```bash
azd init --template contoso-chat .
azd up
```

### Application Multi-Agent d’Écriture Créative

**Dépôt** : [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services** : Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description** : Exemple multi-agent démontrant l’orchestration d’agents AI avec Prompty. Utilise un agent de recherche (Bing Grounding dans Azure AI Agent Service), un agent produit (Azure AI Search), un agent écrivain, et un agent éditeur pour produire collaborativement des articles bien documentés. Inclut CI/CD avec évaluation dans GitHub Actions.

**Démarrage rapide** :
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG sans serveur (JavaScript/TypeScript)

**Dépôt** : [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services** : Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pour NoSQL + LangChain.js

**Description** : Chatbot RAG entièrement sans serveur utilisant LangChain.js avec Azure Functions comme API et Azure Static Web Apps pour l’hébergement. Utilise Azure Cosmos DB comme magasin vectoriel et base de données d’historique de chat. Supporte le développement local avec Ollama pour des tests gratuits.

**Démarrage rapide** :
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accélérateur de Solution Chat avec Vos Données

**Dépôt** : [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services** : Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search avec Cosmos DB, ou PostgreSQL avec pgvector

**Description** : Accélérateur de chat fondé sur des documents avec citations. L’échantillon actuel héberge un frontend React, backend FastAPI, et un worker Functions d’ingestion sur Container Apps ; options d’orchestrateur sont Agent Framework et LangGraph. Options de base de données/récupération sélectionnées au déploiement. C’est un point de départ, pas un système de production clé en main ; ne supposez pas que les variantes plus anciennes App Service, Semantic Kernel, ou Prompt Flow décrivent la valeur actuelle par défaut.

**Démarrage rapide** :
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agents de Voyage AI — Orchestration Multi-Agent MCP

**Dépôt** : [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services** : Azure OpenAI + Microsoft Foundry + Azure Container Apps + serveurs MCP (.NET, Python, Java, TypeScript)

**Description** : Application de référence pour orchestration multi-agent AI utilisant trois frameworks (LangChain.js, LlamaIndex.TS, et Microsoft Agent Framework). Comporte des serveurs MCP (Model Context Protocol) en quatre langages déployés en Azure Container Apps sans serveur avec supervision OpenTelemetry.

**Démarrage rapide** :
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Parcourez plus de modèles** : Visitez la [Galerie Awesome AZD AI Template](https://azure.github.io/awesome-azd/?tags=ai) pour les modèles disponibles actuels à travers langages et scénarios. Chaque exemple lié est un dépôt externe, non un exemple local fourni par ce cours ; inspectez ses prérequis actuels et conseils de production avant déploiement.

## Étapes suivantes

1. **Essayez les exemples** : Commencez par un modèle préconstruit correspondant à votre cas d’usage
2. **Personnalisez selon vos besoins** : Modifiez l’infrastructure et le code applicatif
3. **Ajoutez la supervision** : Mettez en œuvre une observabilité complète
4. **Optimisez les coûts** : Ajustez les configurations pour votre budget
5. **Sécurisez votre déploiement** : Implémentez des modèles de sécurité d’entreprise
6. **Passez en production à l’échelle** : Ajoutez des fonctionnalités multi-régions et haute disponibilité

## 🎯 Exercices pratiques

### Exercice 1 : Déployer l’application Microsoft Foundry Models Chat (30 minutes)
**Objectif** : Déployer et tester une application de chat AI de référence

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Critères de réussite :**
- [ ] Déploiement sans erreurs de quota
- [ ] Accès à l’interface de chat dans le navigateur
- [ ] Possibilité de poser des questions et obtenir des réponses AI
- [ ] Application Insights affiche des données de télémétrie
- [ ] Ressources nettoyées avec succès

**Coût :** Consultez le guide des coûts actuels et les SKU sélectionnés avant déploiement. La facturation continue jusqu’à suppression des ressources ; aucune estimation fixe de 30 minutes ne s’applique à toutes les configurations.

### Exercice 2 : Configurer un déploiement multi-modèle (45 minutes)
**Objectif** : Déployer plusieurs modèles AI avec différentes configurations

**Point de départ :** Un compte Azure OpenAI existant et un module de groupe de ressources AZD pouvant appeler ce fichier. Créez `infra/ai-models.bicep` avec le contenu suivant à l’aide de votre éditeur. Il n’est pas automatiquement déployé parce qu’il est sous `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Depuis le module scoped au groupe de ressources qui possède le compte, ajoutez une invocation de module (adaptez le nom du symbole à votre compte réel) :

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ne déclarez pas les mêmes déploiements dans les deux modules. Si le point d’entrée AZD est scoped à l’abonnement, invoquez ceci depuis son module enfant scoped au groupe de ressources et ajustez le chemin relatif. Compilez ce module contenant avec `az bicep build --file <path-to-containing-module>`, puis :

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Critères de réussite :**
- [ ] Plusieurs modèles déployés avec succès
- [ ] Différents réglages de capacité appliqués
- [ ] Modèles accessibles via API
- [ ] Possibilité d’appeler les deux modèles depuis l’application

### Exercice 3 : Mettre en place la surveillance des coûts (20 minutes)
**Objectif** : Configurer alertes budget et suivi des coûts

**Point de départ :** Le modèle de budget ci-dessus et un module infrastructure scoped au groupe de ressources. Ajoutez cette ressource avec votre éditeur ; passez `budgetStartDate` depuis votre mapping de paramètres (ne dupliquez pas le paramètre s’il est déjà déclaré). Remplacez le destinataire et confirmez que vous avez les droits d’écriture budget.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Attendu : la réponse contient `amount: 200`, les deux seuils, et votre destinataire. Inspectez Gestion des Coûts dans le portail pour les charges réelles ; les données de coût sont différées et une alerte n’est pas forcément déclenchée lors d’un court exercice.

**Critères de réussite :**
- [ ] Alerte budget créée dans Azure
- [ ] Notifications par email configurées
- [ ] Données de coûts consultables dans le portail Azure
- [ ] Seuils budgétaires réglés correctement

## 💡 Questions fréquemment posées

<details>
<summary><strong>Comment réduire les coûts Microsoft Foundry Models pendant le développement ?</strong></summary>

1. **Vérifiez les tarifs** : Il n’y a pas d’allocation gratuite universelle de 50 000 jetons par mois pour les modèles Azure OpenAI
2. **Ajustez la capacité** : La capacité `10` représente généralement 10 000 TPM pour ces modèles Standard texte, pas 10 TPM. Réduire cette limite de débit ne réduit pas les prix par jeton
3. **Utilisez azd down** : Supprimez les ressources jetables quand vous ne développez pas activement (ce n’est pas une désallocation)
4. **Mettez en cache les réponses** : Implémentez un cache Redis pour les requêtes répétées
5. **Employez le Prompt Engineering** : Réduisez l’usage de jetons avec des invites efficaces

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Quelle est la différence entre Microsoft Foundry Models et OpenAI API ?</strong></summary>

**Microsoft Foundry Models** :
- Sécurité et conformité entreprise
- Intégration réseau privé
- Garanties SLA
- Authentification par identité gérée
- Quotas plus élevés disponibles

**OpenAI API** : Un fournisseur/API distinct offrant ses propres disponibilités de modèles, tarification, authentification, et options de connectivité entreprise. Comparez les offres actuelles au lieu de supposer que c’est uniquement internet public ou que les modèles sont toujours livrés en premier.

Choisissez selon les exigences de votre organisation ; les exemples d’identité gérée spécifique à Azure et de liaison privée dans ce cours s’appliquent aux services hébergés Azure, pas à tous les modèles/fournisseurs du catalogue Foundry.
</details>

<details>
<summary><strong>Comment gérer les erreurs de dépassement de quota Microsoft Foundry Models ?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Puis-je utiliser mes propres données avec Microsoft Foundry Models ?</strong></summary>

Oui ! Utilisez **Azure AI Search** pour RAG (Retrieval Augmented Generation) :

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Voir le modèle [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Comment sécuriser les points de terminaison des modèles d'IA ?</strong></summary>

**Bonnes pratiques** :
1. Utiliser Managed Identity (pas de clés API)
2. Activer les points de terminaison privés
3. Configurer les groupes de sécurité réseau
4. Mettre en place une limitation du débit
5. Utiliser Azure Key Vault pour les secrets

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Communauté et support

- **Microsoft Foundry Discord** : [canal #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub** : [Problèmes et discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn** : [Documentation officielle](https://learn.microsoft.com/azure/ai-studio/)
- **Compétences Agent** : [Compétence Microsoft Foundry sur skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installez les compétences Azure + Foundry agent dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre en cours** : Chapitre 2 - Développement axé sur l'IA
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant** : [Agents IA](agents.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d'aide ?** Rejoignez nos discussions communautaires ou ouvrez un problème dans le dépôt. La communauté Azure AI + AZD est là pour vous aider à réussir !

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->