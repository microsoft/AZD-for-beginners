# Guide de sélection des SKU - Choisir les bons niveaux de service Azure

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 6 - Validation & Planification avant déploiement
- **⬅️ Précédent** : [Planification de la capacité](capacity-planning.md)
- **➡️ Suivant** : [Vérifications préalables au vol](preflight-checks.md)
- **🚀 Chapitre suivant** : [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/common-issues.md)

## Introduction

Ce guide complet vous aide à sélectionner les SKU (Unités de gestion des stocks) Azure optimaux pour différents environnements, charges de travail et exigences. Apprenez à analyser les besoins en performances, les considérations de coûts et les exigences de scalabilité pour choisir les niveaux de service les plus appropriés pour vos déploiements Azure Developer CLI.

## Objectifs d'apprentissage

En complétant ce guide, vous allez :
- Comprendre les concepts des SKU Azure, les modèles de tarification et les différences fonctionnelles
- Maîtriser les stratégies de sélection de SKU spécifiques à l'environnement pour développement, préproduction et production
- Analyser les exigences des charges de travail et les associer aux niveaux de service appropriés
- Mettre en œuvre des stratégies d'optimisation des coûts grâce à une sélection intelligente des SKU
- Appliquer des techniques de tests de performance et de validation pour les choix de SKU
- Configurer des recommandations et une surveillance automatisées des SKU

## Résultats d'apprentissage

À la fin, vous serez capable de :
- Sélectionner les SKU de service Azure appropriés selon les exigences et contraintes de la charge de travail
- Concevoir des architectures multi-environnements économes avec une sélection de niveau adaptée
- Mettre en œuvre des évaluations comparatives de performance et validation pour les choix de SKU
- Créer des outils automatisés pour la recommandation de SKU et l'optimisation des coûts
- Planifier des migrations de SKU et stratégies de montée en charge selon l'évolution des besoins
- Appliquer les principes du cadre Azure Well-Architected à la sélection des niveaux de service

## Table des matières

- [Comprendre les SKU](#understanding-skus)
- [Sélection basée sur l'environnement](#environment-based-selection)
- [Directives spécifiques au service](#service-specific-guidelines)
- [Stratégies d'optimisation des coûts](#cost-optimization-strategies)
- [Considérations de performance](#performance-considerations)
- [Tableaux de référence rapides](#quick-reference-tables)
- [Outils de validation](#validation-tools)

---

## Comprendre les SKU

> **Exemple de portée :** Les cartes YAML de SKU et les configurations de performance ci-dessous sont des notes de conception, pas un schéma `azure.yaml` ou une configuration d’outil de charge. Les blocs Bicep sont des alternatives/fragments : déclarez leurs paramètres et ressources parentes, utilisez des noms symboliques uniques lors de leur combinaison, et intégrez les modules dans un projet fonctionnel. Les prix, limites, et disponibilités région/SKU doivent être vérifiés pour votre abonnement avant déploiement.

### Qu'est-ce que les SKU ?

Les SKU (Unités de gestion des stocks) représentent différents niveaux de service et performances pour les ressources Azure. Chaque SKU propose des :

- **Caractéristiques de performance** (CPU, mémoire, débit)
- **Disponibilité des fonctionnalités** (options de scalabilité, niveaux de SLA)
- **Modèles de tarification** (base consommation, capacité réservée)
- **Disponibilité régionale** (tous les SKU ne sont pas disponibles dans toutes les régions)

### Facteurs clés dans la sélection des SKU

1. **Exigences de la charge de travail**
   - Trafic/charge attendu
   - Besoins de performance (CPU, mémoire, I/O)
   - Besoins de stockage et modes d'accès

2. **Type d'environnement**
   - Développement/tests vs. production
   - Exigences de disponibilité
   - Besoins de sécurité et de conformité

3. **Contraintes budgétaires**
   - Coûts initiaux vs. coûts opérationnels
   - Remises capacité réservée
   - Implications des autoscaling

4. **Prévisions de croissance**
   - Besoins de scalabilité
   - Besoins fonctionnels futurs
   - Complexité des migrations

---

## Sélection basée sur l'environnement

### Environnement de développement

**Priorités** : Optimisation des coûts, fonctionnalité basique, facilité de provisionnement et déprovisionnement

#### SKU recommandés
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### Caractéristiques
- **App Service** : F1 (Gratuit) ou B1 (Basique) pour tests simples
- **Bases de données** : Niveau de base avec ressources minimales
- **Stockage** : Standard avec redondance locale uniquement
- **Calcul** : Ressources partagées acceptables
- **Réseau** : Configurations basiques

### Environnement de préproduction/tests

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
- **Fonctionnalités** : La plupart des fonctions de production activées
- **Redondance** : Une certaine redondance géographique
- **Scalabilité** : Auto-scaling limité pour tests
- **Surveillance** : Stack de monitoring complet

### Environnement de production

**Priorités** : Performance, disponibilité, sécurité, conformité, scalabilité

#### SKU recommandés
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Caractéristiques
- **Haute disponibilité** : Exigences SLA 99,9 %+
- **Performance** : Ressources dédiées, haut débit
- **Sécurité** : Fonctionnalités de sécurité premium
- **Scalabilité** : Pleines capacités d’auto-scaling
- **Surveillance** : Observabilité complète

---

## Directives spécifiques au service

### Azure App Service

#### Matrice de décision SKU

| Cas d’utilisation | SKU recommandé | Justification |
|----------|----------------|-----------|
| Développement/Tests | F1 (Gratuit) ou B1 (Basique) | Rentable, suffisant pour tests |
| Petites applications de production | S1 (Standard) | Domaines personnalisés, SSL, auto-scaling |
| Applications de production moyennes | P1V3 (Premium V3) | Meilleures performances, plus de fonctionnalités |
| Applications à trafic élevé | P2V3 ou P3V3 | Ressources dédiées, hautes performances |
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
   - **Basique** : 5 DTU - Développement/tests
   - **Standard** : S0-S12 (10-3000 DTU) - Usage général
   - **Premium** : P1-P15 (125-4000 DTU) - Performance critique

2. **Basé sur vCore** (Recommandé pour la production)
   - **Usage général** : Calcul et stockage équilibrés
   - **Critique pour entreprise** : Faible latence, IOPS élevées
   - **Hyperscale** : Stockage très scalable; vérifiez les limites actuelles et support régional

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

#### Types d'environnements

1. **Basé sur la consommation**
   - Tarification à l’utilisation
   - Adapté aux environnements de développement et charges variables
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
        targetPort: 80 // nginx listens on 80 by default
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
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

La redondance de zone nécessite aussi une infrastructure supportée par région et une configuration VNet/sous-réseau adaptée, omis ici. Cet exemple prévoit trois nœuds dédiés ; configurez au moins deux réplicas d’application pour distribution multi-zones et dimensionnez réplicas et nœuds pour tolérance de panne de zone. Voir [Guide de fiabilité Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Pour placer une application sur ce profil, définissez son `workloadProfileName: 'production-profile'`; créer le profil seul ne déplace pas les applications.

### Azure Cosmos DB

#### Modèles de débit

1. **Débit provisionné manuel**
   - Performance prévisible
   - Remises capacité réservée
   - Idéal pour charges stables

2. **Débit provisionné autoscale**
   - Mise à l’échelle automatique basée sur l’usage
   - Paiement à l’usage (avec minimum)
   - Adapté aux charges variables

3. **Sans serveur**
   - Paiement par requête
   - Pas de débit provisionné
   - Idéal pour développement et charges intermittentes

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
2. **Standard_GRS** - Production, redondance géographique nécessaire
3. **Premium_LRS** - Applications haute performance
4. **Premium_ZRS** - Haute disponibilité avec redondance de zone

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

Réservez des ressources pour 1-3 ans afin d’obtenir des remises significatives :

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Les offres de réservation et types de ressources éligibles varient ; examinez le catalogue et les conditions d’achat au lieu de supposer que chaque service/SKU supporte une réservation.

### 2. Dimensionnement approprié

Commencez avec des SKU plus petits et montez en fonction de l’usage réel :

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

### 3. Configuration d’auto-scaling

Mettez en œuvre un scaling intelligent pour optimiser les coûts :

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
            statistic: 'Average'
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
            statistic: 'Average'
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

### 4. Scalabilité planifiée

Réduisez la capacité durant les périodes creuses :

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

### Exigences minimales de performance

Définissez clairement vos besoins en performance avant la sélection des SKU :

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
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

| SKU | Niveau | vCPU | RAM | Stockage | Fourchette de prix | Cas d’usage |
|-----|--------|-------|-----|----------|------------------|------------|
| F1 | Gratuit | Partagé | 1GB | 1GB | Gratuit | Développement |
| B1 | Basique | 1 | 1,75GB | 10GB | $ | Petites apps |
| S1 | Standard | 1 | 1,75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Haute performance |
| I1V2 | Isolé V2 | 2 | 8GB | 1TB | $$$$ | Entreprise |

### Référence rapide des SKU SQL Database

| SKU | Niveau | DTU/vCore | Stockage | Fourchette de prix | Cas d’usage |
|-----|--------|-----------|----------|------------------|------------|
| Basique | Basique | 5 DTU | 2GB | $ | Développement |
| S2 | Standard | 50 DTU | 250GB | $$ | Petite production |
| P2 | Premium | 250 DTU | 1TB | $$$ | Haute performance |
| GP_Gen5_4 | Usage général | 4 vCore | 4TB | $$$ | Équilibré |
| BC_Gen5_8 | Critique entreprise | 8 vCore | 4TB | $$$$ | Critique |

### Référence rapide des SKU Container Apps

| Modèle | Tarification | CPU/Mémoire | Cas d’usage |
|-------|--------------|-------------|------------|
| Consommation | Paiement à l’usage | Combinaisons CPU/mémoire supportées selon environnement/profil | Développement ou production, charge variable |
| Dédicacé D4 | Facturation par nœud dédié | 4 vCPU, 16GiB par nœud | Charge soutenue/besoins d’isolation |
| Dédicacé D8 | Facturation par nœud dédié | 8 vCPU, 32GiB par nœud | Charge soutenue plus élevée |

---

## Outils de validation

### Vérificateur de disponibilité de SKU

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
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Script d’estimation des coûts

**Pseudocode uniquement :** `Get-ResourceCost` ci-dessous est une fonction spécifique au projet que vous devez implémenter en utilisant les tarifs régionaux/contractuels actuels et hypothèses d’usage. Ce n’est pas un cmdlet PowerShell ou Azure.

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

### Validation de la performance

Le YAML suivant est une ébauche des exigences, **pas** un schéma d’entrée Azure Load Testing, JMeter, Locust ou k6. Traduisez-le dans la configuration réelle de l’outil choisi avant d’utiliser la commande de test de charge ci-dessus.

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

1. **Commencez petit et montez en charge** selon l’usage réel
2. **Utilisez des SKU différentes pour chaque environnement**
3. **Surveillez en continu performance et coûts**
4. **Profitez de la capacité réservée pour les charges de production**
5. **Implémentez l’auto-scaling quand c’est approprié**
6. **Testez la performance avec des charges réalistes**
7. **Planifiez la croissance sans surdimensionner**
8. **Utilisez les niveaux gratuits pour le développement quand possible**

### À ne pas faire

1. **N’utilisez pas les SKU production pour le développement**
2. **Ne négligez pas la disponibilité régionale des SKU**
3. **N’oubliez pas les coûts de transfert de données**
4. **Ne surdimensionnez pas sans justification**
5. **Ne sous-estimez pas l’impact des dépendances**
6. **Ne réglez pas les limites d’auto-scaling trop haut**
7. **N’oubliez pas les exigences de conformité**
8. **Ne prenez pas de décisions basées uniquement sur le prix**

---

**Astuce pro** : Utilisez Azure Cost Management et Advisor pour obtenir des recommandations personnalisées d’optimisation de vos sélections de SKU selon les schémas d’utilisation réels.

---

**Navigation**
- **Leçon précédente** : [Planification de la capacité](capacity-planning.md)
- **Leçon suivante** : [Vérifications préalables](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->