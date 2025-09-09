<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T17:23:52+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "fr"
}
-->
# Guide de sélection des SKU - Choisir les bons niveaux de service Azure

## Introduction

Ce guide complet vous aide à sélectionner les SKU (Unités de gestion des stocks) de services Azure optimaux pour différents environnements, charges de travail et besoins. Apprenez à analyser les besoins en performance, les considérations de coût et les exigences de scalabilité pour choisir les niveaux de service les plus appropriés pour vos déploiements Azure Developer CLI.

## Objectifs d'apprentissage

En suivant ce guide, vous allez :
- Comprendre les concepts de SKU Azure, les modèles de tarification et les différences de fonctionnalités
- Maîtriser les stratégies de sélection de SKU spécifiques à l'environnement pour le développement, la préproduction et la production
- Analyser les besoins des charges de travail et les associer aux niveaux de service appropriés
- Mettre en œuvre des stratégies d'optimisation des coûts grâce à une sélection intelligente des SKU
- Appliquer des techniques de test de performance et de validation pour les choix de SKU
- Configurer des recommandations et une surveillance automatisées des SKU

## Résultats d'apprentissage

À la fin de ce guide, vous serez capable de :
- Sélectionner les SKU de services Azure appropriés en fonction des besoins et contraintes des charges de travail
- Concevoir des architectures multi-environnements rentables avec une sélection de niveaux adaptée
- Mettre en œuvre des benchmarks de performance et des validations pour les choix de SKU
- Créer des outils automatisés pour les recommandations de SKU et l'optimisation des coûts
- Planifier les migrations de SKU et les stratégies de scalabilité pour répondre aux besoins changeants
- Appliquer les principes du cadre Azure Well-Architected à la sélection des niveaux de service

## Table des matières

- [Comprendre les SKU](../../../../docs/pre-deployment)
- [Sélection basée sur l'environnement](../../../../docs/pre-deployment)
- [Directives spécifiques aux services](../../../../docs/pre-deployment)
- [Stratégies d'optimisation des coûts](../../../../docs/pre-deployment)
- [Considérations sur la performance](../../../../docs/pre-deployment)
- [Tableaux de référence rapide](../../../../docs/pre-deployment)
- [Outils de validation](../../../../docs/pre-deployment)

---

## Comprendre les SKU

### Que sont les SKU ?

Les SKU (Unités de gestion des stocks) représentent différents niveaux de service et performances pour les ressources Azure. Chaque SKU offre différents :

- **Caractéristiques de performance** (CPU, mémoire, débit)
- **Disponibilité des fonctionnalités** (options de scalabilité, niveaux de SLA)
- **Modèles de tarification** (basés sur la consommation, capacité réservée)
- **Disponibilité régionale** (tous les SKU ne sont pas disponibles dans toutes les régions)

### Facteurs clés dans la sélection des SKU

1. **Besoins des charges de travail**
   - Modèles de trafic/charge attendus
   - Exigences de performance (CPU, mémoire, I/O)
   - Besoins de stockage et modèles d'accès

2. **Type d'environnement**
   - Développement/test vs production
   - Exigences de disponibilité
   - Besoins en sécurité et conformité

3. **Contraintes budgétaires**
   - Coûts initiaux vs coûts opérationnels
   - Réductions pour capacité réservée
   - Implications des coûts d'auto-scalabilité

4. **Projections de croissance**
   - Exigences de scalabilité
   - Besoins futurs en fonctionnalités
   - Complexité de migration

---

## Sélection basée sur l'environnement

### Environnement de développement

**Priorités** : Optimisation des coûts, fonctionnalités de base, provisionnement/déprovisionnement facile

#### SKU recommandés
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
- **App Service** : F1 (Gratuit) ou B1 (Basique) pour des tests simples
- **Bases de données** : Niveau basique avec ressources minimales
- **Stockage** : Standard avec redondance locale uniquement
- **Calcul** : Ressources partagées acceptables
- **Réseau** : Configurations basiques

### Environnement de préproduction/test

**Priorités** : Configuration proche de la production, équilibre des coûts, capacité de test de performance

#### SKU recommandés
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
- **Performance** : 70-80 % de la capacité de production
- **Fonctionnalités** : La plupart des fonctionnalités de production activées
- **Redondance** : Une certaine redondance géographique
- **Scalabilité** : Auto-scalabilité limitée pour les tests
- **Surveillance** : Pile de surveillance complète

### Environnement de production

**Priorités** : Performance, disponibilité, sécurité, conformité, scalabilité

#### SKU recommandés
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
- **Haute disponibilité** : Exigences SLA de 99,9 %+
- **Performance** : Ressources dédiées, haut débit
- **Sécurité** : Fonctionnalités de sécurité premium
- **Scalabilité** : Capacités complètes d'auto-scalabilité
- **Surveillance** : Observabilité complète

---

## Directives spécifiques aux services

### Azure App Service

#### Matrice de décision des SKU

| Cas d'utilisation | SKU recommandé | Raison |
|-------------------|----------------|--------|
| Développement/test | F1 (Gratuit) ou B1 (Basique) | Rentable, suffisant pour les tests |
| Petites applications de production | S1 (Standard) | Domaines personnalisés, SSL, auto-scalabilité |
| Applications de production moyenne | P1V3 (Premium V3) | Meilleure performance, plus de fonctionnalités |
| Applications à fort trafic | P2V3 ou P3V3 | Ressources dédiées, haute performance |
| Applications critiques | I1V2 (Isolé V2) | Isolation réseau, matériel dédié |

#### Exemples de configuration

**Développement**
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

1. **Basé sur DTU (Unités de transaction de base de données)**
   - **Basique** : 5 DTU - Développement/test
   - **Standard** : S0-S12 (10-3000 DTU) - Usage général
   - **Premium** : P1-P15 (125-4000 DTU) - Critique pour la performance

2. **Basé sur vCore** (Recommandé pour la production)
   - **Usage général** : Équilibre entre calcul et stockage
   - **Critique pour l'entreprise** : Faible latence, haut IOPS
   - **Hyperscale** : Stockage hautement évolutif (jusqu'à 100 To)

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
   - Adapté au développement et aux charges de travail variables
   - Infrastructure partagée

2. **Dédié (Profils de charge de travail)**
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

1. **Débit provisionné manuel**
   - Performance prévisible
   - Réductions pour capacité réservée
   - Idéal pour les charges de travail stables

2. **Débit provisionné autoscalable**
   - Scalabilité automatique en fonction de l'utilisation
   - Paiement à l'utilisation (avec minimum)
   - Adapté aux charges de travail variables

3. **Sans serveur**
   - Paiement par requête
   - Pas de débit provisionné
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

### Compte de stockage Azure

#### Types de compte de stockage

1. **Standard_LRS** - Développement, données non critiques
2. **Standard_GRS** - Production, besoin de redondance géographique
3. **Premium_LRS** - Applications haute performance
4. **Premium_ZRS** - Haute disponibilité avec redondance zonale

#### Niveaux de performance

- **Standard** : Usage général, rentable
- **Premium** : Scénarios haute performance, faible latence

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

Réservez des ressources pour 1 à 3 ans pour des réductions significatives :

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dimensionnement adapté

Commencez avec des SKU plus petits et augmentez en fonction de l'utilisation réelle :

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

### 3. Configuration d'auto-scalabilité

Mettez en œuvre une scalabilité intelligente pour optimiser les coûts :

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

### 4. Scalabilité programmée

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

## Considérations sur la performance

### Exigences de performance de base

Définissez des exigences de performance claires avant la sélection des SKU :

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

Testez différents SKU pour valider la performance :

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Surveillance et optimisation

Configurez une surveillance complète :

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

## Tableaux de référence rapide

### Référence rapide des SKU App Service

| SKU | Niveau | vCPU | RAM | Stockage | Gamme de prix | Cas d'utilisation |
|-----|--------|------|-----|----------|---------------|-------------------|
| F1 | Gratuit | Partagé | 1 Go | 1 Go | Gratuit | Développement |
| B1 | Basique | 1 | 1,75 Go | 10 Go | $ | Petites applications |
| S1 | Standard | 1 | 1,75 Go | 50 Go | $$ | Production |
| P1V3 | Premium V3 | 2 | 8 Go | 250 Go | $$$ | Haute performance |
| I1V2 | Isolé V2 | 2 | 8 Go | 1 To | $$$$ | Entreprise |

### Référence rapide des SKU SQL Database

| SKU | Niveau | DTU/vCore | Stockage | Gamme de prix | Cas d'utilisation |
|-----|--------|-----------|----------|---------------|-------------------|
| Basique | Basique | 5 DTU | 2 Go | $ | Développement |
| S2 | Standard | 50 DTU | 250 Go | $$ | Petite production |
| P2 | Premium | 250 DTU | 1 To | $$$ | Haute performance |
| GP_Gen5_4 | Usage général | 4 vCore | 4 To | $$$ | Équilibré |
| BC_Gen5_8 | Critique pour l'entreprise | 8 vCore | 4 To | $$$$ | Critique |

### Référence rapide des SKU Container Apps

| Modèle | Tarification | CPU/Mémoire | Cas d'utilisation |
|--------|--------------|-------------|-------------------|
| Consommation | Paiement à l'utilisation | 0,25-2 vCPU | Développement, charge variable |
| Dédié D4 | Réservé | 4 vCPU, 16 Go | Production |
| Dédié D8 | Réservé | 8 vCPU, 32 Go | Haute performance |

---

## Outils de validation

### Vérificateur de disponibilité des SKU

```bash
#!/bin/bash
# Check SKU availability in target region

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

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Script d'estimation des coûts

```powershell
# PowerShell script for cost estimation
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
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Validation de performance

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

1. **Commencez petit et évoluez** en fonction de l'utilisation réelle
2. **Utilisez différents SKU pour différents environnements**
3. **Surveillez continuellement la performance et les coûts**
4. **Profitez de la capacité réservée pour les charges de production**
5. **Mettez en œuvre l'auto-scalabilité là où c'est approprié**
6. **Testez la performance avec des charges réalistes**
7. **Planifiez la croissance mais évitez la surprovision**
8. **Utilisez les niveaux gratuits pour le développement lorsque possible**

### À ne pas faire

1. **N'utilisez pas les SKU de production pour le développement**
2. **Ne négligez pas la disponibilité régionale des SKU**
3. **N'oubliez pas les coûts de transfert de données**
4. **Ne surprovisionnez pas sans justification**
5. **Ne négligez pas l'impact des dépendances**
6. **Ne définissez pas des limites d'auto-scalabilité trop élevées**
7. **N'oubliez pas les exigences de conformité**
8. **Ne prenez pas de décisions basées uniquement sur le prix**

---

**Astuce** : Utilisez Azure Cost Management et Advisor pour obtenir des recommandations personnalisées afin d'optimiser vos sélections de SKU en fonction des modèles d'utilisation réels.

---

**Navigation**
- **Leçon précédente** : [Planification de capacité](capacity-planning.md)
- **Leçon suivante** : [Vérifications préalables](preflight-checks.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.