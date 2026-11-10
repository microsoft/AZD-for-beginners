# Provisionnement des ressources Azure avec AZD

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 4 - Infrastructure en tant que Code & Déploiement
- **⬅️ Précédent** : [Guide de déploiement](deployment-guide.md)
- **➡️ Chapitre suivant** : [Chapitre 5 : Solutions IA Multi-Agents](../../examples/retail-scenario.md)
- **🔧 Relié** : [Chapitre 6 : Validation Pré-Déploiement](../chapter-06-pre-deployment/capacity-planning.md)

## Introduction

Ce guide couvre le provisionnement et la gestion des ressources Azure en utilisant Azure Developer CLI avec ses fournisseurs intégrés Bicep et Terraform.

> Révisé avec `azd 1.37.2` (novembre 2026). Sauf indication contraire, les exemples Bicep, Terraform et scripts sont des **fragments illustratifs**, pas un modèle complet. Intégrez-les dans un projet qui fournit les paramètres, modules, identités, réseau et code applicatif référencés. Le provisionnement Azure n’a pas été exécuté lors de cette revue.

## Objectifs d’apprentissage

En complétant ce guide, vous allez :
- Maîtriser les principes de l’Infrastructure en tant que Code et le provisionnement des ressources Azure
- Comprendre les multiples fournisseurs IaC supportés par Azure Developer CLI
- Concevoir et implémenter des modèles Bicep pour des architectures applicatives courantes
- Configurer les paramètres des ressources, les variables et les paramètres spécifiques à l’environnement
- Mettre en œuvre des patterns avancés d’infrastructure incluant réseau et sécurité
- Gérer le cycle de vie des ressources, les mises à jour et la résolution des dépendances

## Résultats d’apprentissage

Après achèvement, vous serez capable de :
- Concevoir et provisionner l’infrastructure Azure en utilisant des modèles Bicep et ARM
- Configurer des architectures multi-services complexes avec des dépendances de ressource appropriées
- Implémenter des modèles paramétrés pour plusieurs environnements et configurations
- Résoudre les problèmes de provisionnement d’infrastructure et corriger les échecs de déploiement
- Appliquer les principes du Azure Well-Architected Framework à la conception d’infrastructure
- Gérer les mises à jour d’infrastructure et implémenter des stratégies de versionnement d’infrastructure

## Aperçu du provisionnement d’infrastructure

Azure Developer CLI supporte plusieurs fournisseurs Infrastructure en tant que Code (IaC) :
- **Bicep** (recommandé) - le langage spécifique au domaine d’Azure
- **Modèles ARM** - Bicep compile en ARM ; le JSON ARM brut n'est pas une ressource intégrée distincte `infra.provider`
- **Terraform** - Outil d'infrastructure multi-cloud
- **Fournisseurs d'extension** - Nécessitent une extension de fournisseur installée séparément et sa configuration documentée ; ne présumez pas qu'une chaîne de fournisseur est prise en charge

## Comprendre les ressources Azure

### Hiérarchie des ressources
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Services Azure courants pour les applications
- **Calcul** : Service App, Applications conteneurisées, Fonctions, Machines virtuelles
- **Stockage** : Compte de stockage, Cosmos DB, Base de données SQL, PostgreSQL
- **Mise en réseau** : Réseau virtuel, Passerelle d'application, CDN
- **Sécurité** : Key Vault, Application Insights, Log Analytics
- **IA/ML** : Services Azure AI, Azure OpenAI, Azure Machine Learning

## Modèles d’infrastructure Bicep

### Structure de base d’un modèle Bicep
```bicep
// infra/modules/web.bicep - resource-group-scoped module fragment
targetScope = 'resourceGroup'
@description('The name of the environment')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The name of the application')
param applicationName string = 'myapp'

// Variables
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
}

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${applicationName}-${environmentName}-plan'
  location: location
  tags: tags
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
    reserved: true // Linux App Service Plan
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  tags: union(tags, { 'azd-service-name': 'web' })
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
    httpsOnly: true
  }
}

// Output values for azd
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output WEB_NAME string = webApp.name
```

Pour un projet azd complet, appelez ce module depuis un `infra/main.bicep` au niveau de l’abonnement qui crée un groupe de ressources étiqueté et transmet sa portée. Faites correspondre `environmentName`/`location` dans `main.parameters.json`. La balise `azd-service-name: web` associe la ressource à `services.web` ; les noms de sortie arbitraires seuls ne configurent pas la découverte de services.

### Modèles Bicep avancés

#### Infrastructure modulaire
```bicep
// infra/modules/app-service.bicep
@description('App Service configuration')
param name string
param location string
param planId string
param appSettings array = []

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
}

output hostname string = webApp.properties.defaultHostName
output principalId string = webApp.identity.principalId
```

```bicep
// infra/main.bicep - Using modules
module webAppModule 'modules/app-service.bicep' = {
  name: 'webApp'
  params: {
    name: '${applicationName}-web-${resourceToken}'
    location: location
    planId: appServicePlan.id
    appSettings: [
      {
        name: 'API_URL'
        value: apiModule.outputs.endpoint
      }
      {
        name: 'DATABASE_URL'
        value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-url)'
      }
    ]
  }
}
```

#### Création conditionnelle de ressources
```bicep
@description('Whether to create a database')
param createDatabase bool = true

@description('Database SKU')
param databaseSku string = 'Basic'

resource database 'Microsoft.Sql/servers/databases@2021-11-01' = if (createDatabase) {
  name: '${sqlServer.name}/${applicationName}-db'
  location: location
  sku: {
    name: databaseSku
    tier: databaseSku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
```

## 🌐 Utiliser Terraform avec azd

Bicep est le langage par défaut d'azd, mais azd prend également en charge **Terraform**—utile si votre équipe l'utilise déjà en standard ou si vous gérez une infrastructure multi-cloud. Le workflow azd (`azd up`, `azd provision`, `azd down`) est identique ; seul le langage d'infrastructure et la structure des dossiers changent.

### Indiquer à azd d’utiliser Terraform

Ajoutez une section `infra` dans `azure.yaml` pointant vers le fournisseur Terraform :

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Structure des dossiers Terraform

Avec le fournisseur Terraform, votre dossier `infra/` contient des fichiers `.tf` au lieu de Bicep :

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Un fragment `main.tf`

Ceci crée seulement un groupe de ressources et un plan, pas un service déployable. Vous devez également déclarer les variables d'entrée, un fournisseur `azurerm` compatible, l’application web et sa correspondance tag/service-nom de ressource.

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### Comment azd se connecte à vos sorties Terraform

azd lit les **outputs** Terraform pour en faire des valeurs d’environnement. Ce fragment suppose que vous avez défini `azurerm_linux_web_app.web` ; la découverte de service exige toujours un nom de ressource correspondant ou un tag `azd-service-name` :

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Important :** azd utilise le tag `azd-env-name` et les sorties `AZURE_*` pour suivre les ressources par environnement. Tagguez toujours votre groupe de ressources avec `"azd-env-name" = var.environment_name` afin que `azd down` puisse tout retrouver et supprimer.

### Déployer avec Terraform

Les commandes sont exactement les mêmes qu’avec Bicep :

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Prérequis :** Terraform doit être installé et disponible sur votre `PATH`. azd gère le *workflow* Terraform mais ne l’installe pas pour vous. Pour l’état, azd utilise par défaut l’état local ; pour les équipes, configurez un backend distant (par exemple, un backend Azure Storage) dans `provider.tf`.

Pour des starters complets et exécutables basés sur Terraform, parcourez la [galerie Awesome AZD](https://azure.github.io/awesome-azd/) et filtrez pour Terraform, ou consultez la documentation officielle [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Autres outils d'infrastructure

Pulumi n’est pas un fournisseur de provisioning intégré à azd 1.37.2. Définir seul `infra.provider: pulumi` n’établit pas une intégration fonctionnelle, et `azd env new` ne crée/sélectionne pas automatiquement une stack Pulumi. Si vous utilisez un autre outil IaC, suivez la documentation d’une extension fournisseur vérifiée ou gérez explicitement son cycle de vie dans votre propre workflow. Ce cours ne fournit ni ne valide un fournisseur Pulumi.

## 🎯 Choisir un hébergeur pour votre service

Le champ `host` dans `azure.yaml` décide où votre code s’exécute. azd supporte plusieurs hébergeurs — choisir le bon est plus important que le langage d’infrastructure. Voici une comparaison adaptée aux débutants :

| `host` valeur | Meilleur pour | Pourquoi |
|--------------|----------|-----|
| `appservice` | Applications web traditionnelles et APIs | PaaS le plus simple ; pas besoin de conteneurs |
| `staticwebapp` | SPAs front-end (React, Vue, Angular) | CDN global + SSL gratuit, prise en charge API intégrée |
| `function` | Charges de travail événementielles et serverless | Échelle à zéro, paiement à l'exécution |
| `containerapp` | Microservices conteneurisés | Conteneurs serverless, échelle à zéro, ingress intégré |
| `aks` | Besoins complexes d'orchestration | Contrôle Kubernetes complet quand c'est vraiment nécessaire |
| `springapp` | Déploiements existants Azure Spring Apps | Cible héritée ; service retiré le 31 mars 2028 et fermé aux nouveaux clients |

### Quand choisir AKS

**Azure Kubernetes Service (`host: aks`)** vous donne toute la puissance de Kubernetes — contrôleurs personnalisés, maillages de services, réseau complexe, planification fine. Cette puissance s'accompagne d'une charge opérationnelle : vous gérez les pools de nœuds, les mises à jour et le réseau du cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Commencez plus simplement si possible.** Pour la plupart des microservices, **Container Apps** vous offre des conteneurs, de l'autoscaling, et l'échelle à zéro sans gérer un cluster. Choisissez AKS uniquement quand vous avez besoin de fonctionnalités spécifiques à Kubernetes.

### Quand utiliser Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** est un runtime managé spécialement conçu pour Spring Boot. Il gère la découverte de services, le serveur de configuration, et le déploiement blue-green pour que les équipes Java ne gèrent pas leur propre infrastructure.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Ne sélectionnez pas Azure Spring Apps pour un nouveau projet débutant : il est fermé aux nouveaux clients et [sera retiré le 31 mars 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Préférez des alternatives supportées comme Container Apps et planifiez la migration des déploiements existants.

## 🗃️ Provisionnement de base de données

### Cosmos DB
```bicep
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${applicationName}-cosmos-${resourceToken}'
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  parent: cosmosAccount
  name: '${applicationName}db'
  properties: {
    resource: {
      id: '${applicationName}db'
    }
  }
}

resource todoContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  parent: cosmosDatabase
  name: 'todos'
  properties: {
    resource: {
      id: 'todos'
      partitionKey: {
        paths: ['/userId']
        kind: 'Hash'
      }
    }
  }
}
```

### PostgreSQL
**Prérequis pour le fragment :** déclarer `@secure() param databasePassword string` et utiliser une valeur forte fournie. Choisissez un accès public **ou** intégrez le sous-réseau délégué/DNS privé ci-dessous ; les deux extraits ne se connectent pas automatiquement entre eux.

```bicep
resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${applicationName}-postgres-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '14'
    administratorLogin: 'dbadmin'
    administratorLoginPassword: databasePassword
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    highAvailability: {
      mode: 'Disabled'
    }
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  parent: postgresServer
  name: '${applicationName}db'
  properties: {
    charset: 'utf8'
    collation: 'en_US.utf8'
  }
}

// Allow Azure services to connect
resource firewallRule 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2022-12-01' = {
  parent: postgresServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
```

La règle `0.0.0.0` permet les connexions depuis les services Azure au-delà de votre propre abonnement. Ce n'est pas un réseau privé ; préférez une conception réseau restreinte pour les charges de travail réelles.

## 🔒 Sécurité et gestion des secrets

### Intégration de Key Vault
```bicep
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${applicationName}-kv-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

// Grant Key Vault access to the web app
resource webAppKeyVaultAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, webApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '4633458b-17de-408a-b874-0445c86b69e6' // Key Vault Secrets User
    )
    principalId: webApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Store database connection string in Key Vault
resource databaseConnectionSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'database-connection-string'
  properties: {
    value: 'Server=${postgresServer.properties.fullyQualifiedDomainName};Database=${postgresDatabase.name};Port=5432;User Id=${postgresServer.properties.administratorLogin};Password=${databasePassword};'
  }
}
```

### Configuration des identités gérées
```bicep
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DATABASE_CONNECTION_STRING'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

Pour une identité attribuée par le système, ne définissez pas `AZURE_CLIENT_ID` sur son ID principal. Une identité attribuée par l'utilisateur utilise son **ID client**, pas son ID d'objet/principal. La référence Key Vault nécessite également l'affectation de rôle coffre-fort de l'identité de l'application et l'accès réseau.

## 🌍 Réseautique et connectivité

### Configuration du réseau virtuel
```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${applicationName}-vnet-${resourceToken}'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.KeyVault'
            }
          ]
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'postgres-delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private DNS Zone for PostgreSQL
resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${applicationName}.postgres.database.azure.com'
  location: 'global'
  tags: tags
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${applicationName}-dns-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}
```

### Passerelle d'application avec SSL
**Fragment d'architecture incomplet, pas une passerelle déployable :** ajoutez un `gateway-subnet` dédié au VNet ainsi que des pools backend, des paramètres HTTP, des auditeurs, des règles de routage avec priorités, et un certificat TLS (ou une référence Key Vault autorisée). Ouvrir simplement le port 443 ne configure pas HTTPS.

```bicep
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${applicationName}-agw-pip-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: '${applicationName}-agw-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/gateway-subnet'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port443'
        properties: {
          port: 443
        }
      }
    ]
  }
}
```

## 📊 Surveillance et observabilité

### Application Insights
```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${applicationName}-logs-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${applicationName}-ai-${resourceToken}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Output connection string for applications
output APPLICATION_INSIGHTS_CONNECTION_STRING string = applicationInsights.properties.ConnectionString
```

### Métriques personnalisées et alertes
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [appServicePlan.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          metricNamespace: 'Microsoft.Web/serverfarms'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

## 🔧 Configurations spécifiques à l'environnement

### Fichiers de paramètres pour différents environnements
Les deux fichiers ci-dessous sont des **exemples alternatifs de fichiers de paramètres**. azd ne sélectionne pas automatiquement `main.parameters.dev.json` ou `main.parameters.prod.json` selon le nom de l'environnement. Utilisez le vrai `main.parameters.json` avec substitutions d'environnement (par exemple `${APP_SERVICE_SKU=B1}`), et déclarez/consommez chaque paramètre dans Bicep.

Contenu d'exemple pour `infra/main.parameters.dev.json` :

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "B1"
    },
    "databaseSku": {
      "value": "Standard_B1ms"
    },
    "enableBackup": {
      "value": false
    }
  }
}
```

Contenu d'exemple pour `infra/main.parameters.prod.json` :

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "P1v3"
    },
    "databaseSku": {
      "value": "Standard_D2s_v3"
    },
    "enableBackup": {
      "value": true
    },
    "replicaCount": {
      "value": 3
    }
  }
}
```

### Provisionnement conditionnel des ressources
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: 'stdev${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: 'stprod${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
```

## 🚀 Modèles avancés de provisionnement

### Déploiement multi-régions
```bicep
@description('Primary region')
param primaryLocation string = 'eastus2'

@description('Secondary region')
param secondaryLocation string = 'westus2'

// Primary region resources
module primaryRegion 'modules/region.bicep' = {
  name: 'primary-region'
  params: {
    location: primaryLocation
    isPrimary: true
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Secondary region resources
module secondaryRegion 'modules/region.bicep' = {
  name: 'secondary-region'
  params: {
    location: secondaryLocation
    isPrimary: false
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: '${applicationName}-tm-${resourceToken}'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: '${applicationName}-${environmentName}'
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryRegion.outputs.webAppId
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryRegion.outputs.webAppId
          priority: 2
        }
      }
    ]
  }
}
```

### Tests d'infrastructure
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Le provisionnement de l'infrastructure ne déploie pas votre code applicatif. Exécutez les contrôles d'application uniquement après `azd deploy`/`azd up`, et utilisez `/health` seulement si votre application l'implémente. Les scripts de déploiement ARM créent des ressources Azure et nécessitent une identité supplémentaire, des versions d'exécution prises en charge, et des autorisations ; ils ne sont pas des tests unitaires locaux.

## 🧪 Aperçu et validation de l'infrastructure (NOUVEAU)

### Prévisualisez les modifications d'infrastructure avant le déploiement

La fonctionnalité `azd provision --preview` vous permet de **simuler le provisionnement de l'infrastructure** avant de déployer réellement les ressources. C'est similaire en esprit à `terraform plan` ou `bicep what-if`, vous offrant une **vue en simulation** des changements qui seraient effectués dans votre environnement Azure.

#### 🛠️ Ce que cela fait
- **Analyse vos modèles IaC** (Bicep ou Terraform)
- **Montre un aperçu des changements de ressources** : ajouts, suppressions, mises à jour
- **N'applique pas les changements d'infrastructure proposés par le fournisseur** — inspectez d'abord les hooks de projet ; les scripts peuvent avoir des effets secondaires et la prévisualisation requiert néanmoins les autorisations Azure

#### Cas d'utilisation
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Cette commande vous aide à :
- **Valider les modifications d'infrastructure** avant de déployer les ressources
- **Détecter tôt les mauvaises configurations** dans le cycle de développement
- **Collaborer en toute sécurité** dans les environnements d'équipe
- **Assurer des déploiements au moindre privilège** sans surprises

C'est particulièrement utile lorsque :
- Travail avec des environnements multi-services complexes
- Modifications d'une infrastructure de production
- Validation des modifications de modèle avant approbation de PR
- Formation des nouveaux membres d'équipe aux modèles d'infrastructure

### Exemple de sortie d'aperçu
La sortie exacte de l'aperçu varie selon le fournisseur et la structure du projet, mais le résultat doit clairement identifier les modifications proposées avant toute application.

```text
$ azd provision --preview

🔍 Previewing infrastructure changes...

The following resources will be created:
  + azurerm_resource_group.rg
  + azurerm_app_service_plan.plan
  + azurerm_linux_web_app.web
  + azurerm_cosmosdb_account.cosmos

The following resources will be modified:
  ~ azurerm_key_vault.kv
    ~ access_policy (forces replacement)

The following resources will be destroyed:
  - azurerm_storage_account.old_storage

⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## �🔄 Mises à jour et migrations de ressources

### Mises à jour sécurisées des ressources
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes after preview confirmation
azd provision
# In automation, --no-prompt uses known values and fails on unresolved decisions;
# it is not an approval bypass.

# For rollback, use Git to revert infrastructure changes:
git revert HEAD  # Revert last infrastructure commit
azd provision    # Apply previous infrastructure state
```

### Migrations de bases de données
**Modèle de script de déploiement incomplet :** nécessite une identité attribuée par l'utilisateur configurée là où c'est nécessaire, un environnement d'exécution Azure CLI pris en charge, des outils de migration disponibles, un répertoire/configuration de migration fourni, et une connectivité à la base de données. Il ne peut pas être exécuté uniquement en collant cette ressource dans un modèle.

```bicep
resource migrationScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'database-migration'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.40.0'
    scriptContent: '''
      # Install database migration tools
      npm install -g db-migrate db-migrate-pg
      
      # Run migrations
      db-migrate up --config database.json --env production
      
      echo "Database migration completed successfully"
    '''
    environmentVariables: [
      {
        name: 'DATABASE_URL'
        secureValue: databaseConnectionString
      }
    ]
    timeout: 'PT30M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🎯 Bonnes pratiques

### 1. Conventions de nommage des ressources
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Stratégie d'étiquetage
```bicep
// utcNow is only allowed in a parameter default, not directly in a variable.
param deploymentDate string = utcNow('yyyy-MM-dd')

var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'deployment-date': deploymentDate
}
```

### 3. Validation des paramètres
```bicep
@description('Environment name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Location for resources')
@allowed(['eastus2', 'westus2', 'centralus'])
param location string

@description('App Service SKU')
@allowed(['B1', 'B2', 'S1', 'S2', 'P1v3', 'P2v3'])
param appServiceSku string = 'B1'
```

### 4. Organisation des sorties
```bicep
// Service endpoints
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output API_URL string = 'https://${apiApp.properties.defaultHostName}'

// Resource identifiers
output WEB_APP_NAME string = webApp.name
output API_APP_NAME string = apiApp.name
output DATABASE_NAME string = database.name

// Connection strings (for secure reference)
output DATABASE_CONNECTION_STRING_KEY string = '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
```

## Prochaines étapes

- [Planification avant déploiement](../chapter-06-pre-deployment/capacity-planning.md) - Valider la disponibilité des ressources
- [Problèmes courants](../chapter-07-troubleshooting/common-issues.md) - Résoudre les problèmes d'infrastructure
- [Guide de débogage](../chapter-07-troubleshooting/debugging.md) - Déboguer les problèmes de provisioning
- [Sélection de SKU](../chapter-06-pre-deployment/sku-selection.md) - Choisir les niveaux de service appropriés

## Ressources supplémentaires

- [Documentation Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Modèles Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadre Azure bien architecturé](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Leçon précédente** : [Guide de déploiement](deployment-guide.md)
- **Leçon suivante** : [Planification de la capacité](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->