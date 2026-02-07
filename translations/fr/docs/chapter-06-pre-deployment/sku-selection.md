# Guide de sélection des SKU - Choisir les bons niveaux de service Azure

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 6 - Validation et planification avant déploiement
- **⬅️ Précédent**: [Capacity Planning](capacity-planning.md)
- **➡️ Suivant**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Chapitre suivant**: [Chapitre 7 : Résolution des problèmes](../chapter-07-troubleshooting/common-issues.md)

## Introduction

Ce guide complet vous aide à sélectionner les SKU (unités de gestion des stocks) optimaux pour les différents services Azure en fonction des environnements, des charges de travail et des exigences. Apprenez à analyser les besoins en performances, les considérations de coût et les exigences de scalabilité afin de choisir les niveaux de service les plus appropriés pour vos déploiements avec Azure Developer CLI.

## Objectifs d'apprentissage

En complétant ce guide, vous allez :
- Comprendre les concepts de SKU Azure, les modèles de tarification et les différences de fonctionnalité
- Maîtriser les stratégies de sélection de SKU spécifiques à l'environnement pour le développement, la préproduction et la production
- Analyser les exigences des charges de travail et les faire correspondre aux niveaux de service appropriés
- Mettre en œuvre des stratégies d'optimisation des coûts grâce à une sélection intelligente des SKU
- Appliquer des techniques de test de performance et de validation pour les choix de SKU
- Configurer des recommandations de SKU automatisées et la surveillance

## Résultats d'apprentissage

Après avoir terminé, vous serez capable de :
- Sélectionner les SKU de services Azure appropriés en fonction des exigences et contraintes des charges de travail
- Concevoir des architectures multi-environnements économiquement efficaces avec une sélection de niveaux appropriée
- Mettre en place des benchmarks de performance et des validations pour les choix de SKU
- Créer des outils automatisés pour la recommandation de SKU et l'optimisation des coûts
- Planifier des migrations de SKU et des stratégies de montée en charge pour des exigences évolutives
- Appliquer les principes du Azure Well-Architected Framework à la sélection des niveaux de service

## Table des matières

- [Comprendre les SKU](../../../../docs/chapter-06-pre-deployment)
- [Sélection basée sur l'environnement](../../../../docs/chapter-06-pre-deployment)
- [Directives spécifiques aux services](../../../../docs/chapter-06-pre-deployment)
- [Stratégies d'optimisation des coûts](../../../../docs/chapter-06-pre-deployment)
- [Considérations de performance](../../../../docs/chapter-06-pre-deployment)
- [Tables de référence rapide](../../../../docs/chapter-06-pre-deployment)
- [Outils de validation](../../../../docs/chapter-06-pre-deployment)

---

## Comprendre les SKU

### Que sont les SKU ?

Les SKU (unités de gestion des stocks) représentent différents niveaux de service et niveaux de performance pour les ressources Azure. Chaque SKU offre différents :

- **Caractéristiques de performance** (CPU, mémoire, débit)
- **Disponibilité des fonctionnalités** (options de mise à l'échelle, niveaux de SLA)
- **Modèles de tarification** (à la consommation, capacité réservée)
- **Disponibilité régionale** (tous les SKU ne sont pas disponibles dans toutes les régions)

### Facteurs clés dans la sélection des SKU

1. **Exigences de la charge de travail**
   - Trafic/modèles de charge attendus
   - Exigences de performance (CPU, mémoire, E/S)
   - Besoins de stockage et modèles d'accès

2. **Type d'environnement**
   - Développement/test vs production
   - Exigences de disponibilité
   - Besoins de sécurité et de conformité

3. **Contraintes budgétaires**
   - Coûts initiaux vs coûts opérationnels
   - Remises sur capacité réservée
   - Implications de coût de l'auto-scaling

4. **Prévisions de croissance**
   - Exigences de scalabilité
   - Besoins fonctionnels futurs
   - Complexité de la migration

---

## Sélection basée sur l'environnement

### Environnement de développement

**Priorités** : Optimisation des coûts, fonctionnalité de base, provisionnement/déprovisionnement facile

#### SKUs recommandés
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### Caractéristiques
- **App Service**: F1 (Free) ou B1 (Basic) pour des tests simples
- **Bases de données**: niveau Basic avec des ressources minimales
- **Stockage**: Standard avec redondance locale uniquement
- **Calcul**: ressources partagées acceptables
- **Réseau**: configurations de base

### Environnement de préproduction/tests

**Priorités** : Configuration semblable à la production, équilibre coût/performance, capacité de test de performance

#### SKUs recommandés
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### Caractéristiques
- **Performance**: 70-80 % de la capacité de production
- **Fonctionnalités**: la plupart des fonctionnalités de production activées
- **Redondance**: une certaine redondance géographique
- **Mise à l'échelle**: auto-scaling limité pour les tests
- **Surveillance**: pile de surveillance complète

### Environnement de production

**Priorités** : Performance, disponibilité, sécurité, conformité, scalabilité

#### SKUs recommandés
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Caractéristiques
- **Haute disponibilité**: exigences SLA de 99,9 %+
- **Performance**: ressources dédiées, débit élevé
- **Sécurité**: fonctionnalités de sécurité premium
- **Mise à l'échelle**: capacités complètes d'auto-scaling
- **Surveillance**: observabilité complète

---

## Directives spécifiques aux services

### Azure App Service

#### Matrice de décision des SKU

| Cas d'utilisation | SKU recommandé | Justification |
|----------|----------------|-----------|
| Développement/Test | F1 (Free) ou B1 (Basic) | Rentable, suffisant pour les tests |
| Petites applications en production | S1 (Standard) | Domaines personnalisés, SSL, mise à l'échelle automatique |
| Applications de production moyennes | P1V3 (Premium V3) | Meilleures performances, plus de fonctionnalités |
| Applications à fort trafic | P2V3 ou P3V3 | Ressources dédiées, haute performance |
| Applications critiques | I1V2 (Isolated V2) | Isolation réseau, matériel dédié |

#### Exemples de configuration

**Development**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**Production**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL Database

#### Cadre de sélection des SKU

1. **Basé sur DTU (Database Transaction Units)**
   - **Basic** : 5 DTU - Développement/test
   - **Standard** : S0-S12 (10-3000 DTU) - Usage général
   - **Premium** : P1-P15 (125-4000 DTU) - Critique en termes de performance

2. **Basé sur vCore** (recommandé pour la production)
   - **General Purpose** : calcul et stockage équilibrés
   - **Business Critical** : faible latence, IOPS élevées
   - **Hyperscale** : stockage hautement évolutif (jusqu'à 100TB)

#### Exemples de configuration

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure Container Apps

#### Types d'environnement

1. **Basé sur la consommation**
   - Tarification à l'utilisation
   - Convient pour le développement et les charges variables
   - Infrastructure partagée

2. **Dédié (profils de charge de travail)**
   - Ressources de calcul dédiées
   - Performance prévisible
   - Mieux adapté aux charges de production

#### Exemples de configuration

**Développement (Consommation)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**Production (Dédié)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### Azure Cosmos DB

#### Modèles de débit

1. **Throughput provisionné manuel**
   - Performance prévisible
   - Remises sur capacité réservée
   - Idéal pour les charges stables

2. **Throughput provisionné en autoscale**
   - Mise à l'échelle automatique en fonction de l'utilisation
   - Paiement à l'utilisation (avec minimum)
   - Bien pour les charges variables

3. **Serverless**
   - Paiement par requête
   - Pas de throughput provisionné
   - Idéal pour le développement et les charges intermittentes

#### Exemples de SKU

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure Storage Account

#### Types de compte de stockage

1. **Standard_LRS** - Développement, données non critiques
2. **Standard_GRS** - Production, besoin de géo-redondance
3. **Premium_LRS** - Applications haute performance
4. **Premium_ZRS** - Haute disponibilité avec redondance par zone

#### Niveaux de performance

- **Standard**: usage général, économique
- **Premium**: haute performance, scénarios à faible latence

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## Stratégies d'optimisation des coûts

### 1. Capacité réservée

Réservez des ressources pour 1 à 3 ans pour obtenir des remises importantes :

```bash
# Vérifier les options de réservation
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dimensionnement approprié

Commencez avec des SKU plus petits et évoluez en fonction de l'utilisation réelle :

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. Configuration de la mise à l'échelle automatique

Mettez en œuvre une mise à l'échelle intelligente pour optimiser les coûts :

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. Mise à l'échelle planifiée

Réduisez la capacité pendant les heures creuses :

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## Considérations de performance

### Exigences de performance de base

Définissez clairement les exigences de performance avant la sélection des SKU :

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### Tests de charge

Testez différents SKU pour valider les performances :

```bash
# Service de test de charge Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Surveillance et optimisation

Mettez en place une surveillance complète :

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## Tables de référence rapide

### Référence rapide des SKU App Service

| SKU | Niveau | vCPU | RAM | Stockage | Fourchette de prix | Cas d'utilisation |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Développement |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Petites applications |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Haute performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Entreprise |

### Référence rapide des SKU SQL Database

| SKU | Niveau | DTU/vCore | Stockage | Fourchette de prix | Cas d'utilisation |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Développement |
| S2 | Standard | 50 DTU | 250GB | $$ | Petite production |
| P2 | Premium | 250 DTU | 1TB | $$$ | Haute performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Équilibré |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Critique |

### Référence rapide des SKU Container Apps

| Modèle | Tarification | CPU/Mémoire | Cas d'utilisation |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Développement, charge variable |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Haute performance |

---

## Outils de validation

### Vérificateur de disponibilité des SKU

```bash
#!/bin/bash
# Vérifier la disponibilité du SKU dans la région cible

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Utilisation
check_sku_availability "eastus" "app-service" "P1V3"
```

### Script d'estimation des coûts

```powershell
# Script PowerShell pour l'estimation des coûts
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # Utiliser l'API de tarification Azure ou le calculateur
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Utilisation
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Validation des performances

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## Résumé des bonnes pratiques

### À faire

1. **Commencer petit et monter en gamme** en fonction de l'utilisation réelle
2. **Utiliser des SKU différents pour différents environnements**
3. **Surveiller en continu les performances et les coûts**
4. **Exploiter la capacité réservée pour les charges de production**
5. **Mettre en place la mise à l'échelle automatique là où c'est approprié**
6. **Tester les performances avec des charges réalistes**
7. **Planifier la croissance mais éviter le sur-provisionnement**
8. **Utiliser les niveaux gratuits pour le développement lorsque c'est possible**

### À ne pas faire

1. **Ne pas utiliser des SKU de production pour le développement**
2. **Ne pas ignorer la disponibilité régionale des SKU**
3. **Ne pas oublier les coûts de transfert de données**
4. **Ne pas sur-provisionner sans justification**
5. **Ne pas ignorer l'impact des dépendances**
6. **Ne pas définir des limites d'auto-scaling trop élevées**
7. **Ne pas oublier les exigences de conformité**
8. **Ne pas prendre de décisions basées uniquement sur le prix**

---

**Astuce pro** : Utilisez Azure Cost Management et Advisor pour obtenir des recommandations personnalisées afin d'optimiser vos sélections de SKU en fonction des schémas d'utilisation réels.

---

**Navigation**
- **Leçon précédente**: [Capacity Planning](capacity-planning.md)
- **Leçon suivante**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avis de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->