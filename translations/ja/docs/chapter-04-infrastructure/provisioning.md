# AZD を使った Azure リソースのプロビジョニング

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 第4章 - インフラストラクチャをコード化 & デプロイ
- **⬅️ Previous**: [デプロイメントガイド](deployment-guide.md)
- **➡️ Next Chapter**: [第5章: マルチエージェント AI ソリューション](../../examples/retail-scenario.md)
- **🔧 Related**: [第6章: デプロイ前検証](../chapter-06-pre-deployment/capacity-planning.md)

## はじめに

この包括的ガイドでは、Azure Developer CLI を使用して Azure リソースをプロビジョニングおよび管理するために必要なすべてを取り扱います。Bicep、ARM テンプレート、Terraform、Pulumi を使って、基本的なリソース作成から高度なエンタープライズ向けインフラストラクチャアーキテクチャまで、Infrastructure as Code (IaC) パターンを実装する方法を学びます。

## 学習目標

このガイドを完了すると、次のことができるようになります:
- Infrastructure as Code の原則と Azure リソースのプロビジョニングを習得する
- Azure Developer CLI がサポートする複数の IaC プロバイダーを理解する
- 一般的なアプリケーションアーキテクチャ向けに Bicep テンプレートを設計・実装する
- リソースのパラメータ、変数、および環境固有の設定を構成する
- ネットワーキングやセキュリティを含む高度なインフラパターンを実装する
- リソースのライフサイクル、更新、および依存関係の解決を管理する

## 学習成果

完了後、次のことができるようになります:
- Bicep と ARM テンプレートを使用して Azure インフラを設計・プロビジョニングする
- 適切なリソース依存関係を持つ複雑なマルチサービスアーキテクチャを構成する
- 複数の環境と構成に対するパラメータ化されたテンプレートを実装する
- インフラプロビジョニングの問題をトラブルシューティングし、デプロイ失敗を解決する
- インフラ設計に Azure Well-Architected Framework の原則を適用する
- インフラの更新を管理し、インフラのバージョニング戦略を実装する

## インフラプロビジョニングの概要

Azure Developer CLI は複数の Infrastructure as Code (IaC) プロバイダーをサポートしています:
- **Bicep**（推奨） - Azure のドメイン固有言語
- **ARM Templates** - JSON ベースの Azure Resource Manager テンプレート
- **Terraform** - マルチクラウド向けインフラツール
- **Pulumi** - プログラミング言語で記述するモダンなインフラストラクチャ as code

## Azure リソースの理解

### リソース階層
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### アプリケーション向けの一般的な Azure サービス
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep インフラテンプレート

### 基本的な Bicep テンプレート構造
```bicep
// infra/main.bicep
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

// Resource Group (created automatically by azd)
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: '${applicationName}-${environmentName}-rg'
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
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
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

### 高度な Bicep パターン

#### モジュラーインフラ
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
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|18-lts'
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

#### 条件付きリソース作成
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

## 🌐 azd での Terraform の使用

Bicep は azd のデフォルトですが、チームがすでに Terraform を標準化している場合やマルチクラウドのインフラを管理している場合には、azd は **Terraform** もサポートします。azd のワークフロー（`azd up`、`azd provision`、`azd down`）は同一で、変更されるのはインフラ言語とフォルダー構成だけです。

### azd に Terraform を使わせる

Terraform プロバイダーを指す `infra` セクションを `azure.yaml` に追加します:

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

### Terraform のフォルダー構成

Terraform プロバイダーを使用する場合、`infra/` フォルダーは Bicep の代わりに `.tf` ファイルを使用します:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### 最小限の `main.tf`

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

### azd が Terraform の outputs に接続する方法

azd は Terraform の **outputs** を読み取り、エンドポイントを認識して環境値をアプリに配線します。出力名は重要です — azd は特定の名前を探します:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **重要:** azd は環境ごとのリソースを追跡するために `azd-env-name` タグと `AZURE_*` 出力を使用します。常にリソースグループに "azd-env-name" = var.environment_name のタグを付けて、`azd down` がすべてを見つけて削除できるようにしてください。

### Terraform でのデプロイ

コマンドは Bicep とまったく同じです:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd は内部で 'terraform plan' を実行します
azd up                    # プロビジョニング + デプロイ
azd down --force          # Terraform が管理するリソースを破棄します
```

> **前提条件:** Terraform はインストールされ、`PATH` に登録されている必要があります。azd は Terraform の <em>ワークフロー</em> を管理しますが、Terraform のインストールは行いません。状態管理については、azd はデフォルトでローカルステートを使用します。チームで使用する場合は `provider.tf` 内でリモートバックエンド（例えば Azure Storage バックエンド）を構成してください。

完全な実行可能な Terraform ベースのスターターについては、[Awesome AZD gallery](https://azure.github.io/awesome-azd/) を参照して Terraform でフィルターするか、公式の [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) を参照してください。

## 🧩 azd での Pulumi の使用

チームが DSL の代わりに一般目的言語（TypeScript、Python、Go、または C#）でインフラを書いている場合、azd は **Pulumi** もサポートします。Terraform と同様に、`azd up` / `azd provision` / `azd down` のワークフローは変更されず、違うのはインフラツールとフォルダー構成だけです。

### azd に Pulumi を使わせる

```yaml
# azure.yaml
name: my-pulumi-app
infra:
  provider: pulumi      # default is "bicep"
  path: infra           # folder containing your Pulumi program
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Pulumi のフォルダー構成

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### 最小限の `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// azd が追跡してクリーンアップできるように、すべてのリソースにタグを付ける
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd はこれらの出力を読み取り、あなたの環境に取り込みます
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### スタックは azd の環境にマッピングされる

Pulumi はデプロイを <strong>スタック</strong> に整理し、azd は各 azd 環境を同名の Pulumi スタックにマッピングします。`azd env new staging` を実行すると、azd は `staging` Pulumi スタックを選択（または作成）します。同じく `azd-env-name` タグ付けと `AZURE_*` 出力ルールが適用されるため、`azd down` はすべてを見つけて削除できます。

### Pulumi でのデプロイ

```bash
azd auth login
azd env new dev
azd provision --preview   # azd は内部で 'pulumi preview' を実行します
azd up                    # プロビジョニング + デプロイ
azd down --force          # 'pulumi destroy' を実行します
```

> **前提条件:** Pulumi はインストールされ、`PATH` に登録されている必要があり、状態バックエンド（Pulumi Cloud または Azure Blob Storage のようなセルフ管理バックエンド）が必要です。azd は Pulumi の <em>ワークフロー</em> を管理しますが、インストールは行いません。公式の [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) を参照してください。

## 🎯 サービスのホスト選択

`host` フィールドはコードの実行先を決定します。azd はいくつかのホストをサポートしており、適切なホストを選ぶことはインフラ言語よりも重要です。ここでは初心者向けの比較を示します:

| `host` value | 適しているケース | 理由 |
|--------------|------------------|-----|
| `appservice` | 従来型のウェブアプリと API | 最も簡単な PaaS。コンテナ不要 |
| `staticwebapp` | フロントエンド SPA（React、Vue、Angular） | グローバル CDN + 無料 SSL、組み込みの API サポート |
| `function` | イベント駆動・サーバーレスワークロード | ゼロまでスケールダウン、実行ごとに課金 |
| `containerapp` | コンテナ化されたマイクロサービス | サーバーレスコンテナ、ゼロまでスケールダウン、組み込みのイングレス |
| `aks` | 複雑なオーケストレーションが必要な場合 | 真に必要な場合にフルな Kubernetes 制御を提供 |
| `springapp` | Java Spring Boot アプリ | Spring 向けに調整されたマネージド Azure Spring Apps ランタイム |

### AKS を選ぶべきとき

**Azure Kubernetes Service (`host: aks`)** は Kubernetes のフルパワーを提供します — カスタムコントローラー、サービスメッシュ、複雑なネットワーキング、詳細なスケジューリングなど。その力は運用上のオーバーヘッドを伴います: ノードプール、アップグレード、クラスタネットワーキングを管理する必要があります。

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **可能ならよりシンプルに始めてください。** 多くのマイクロサービスでは、**Container Apps** がクラスタを管理せずにコンテナ、オートスケーリング、ゼロまでのスケールダウンを提供します。Kubernetes 固有の機能が必要な場合のみ AKS を選んでください。

### Azure Spring Apps を使うとき

**Azure Spring Apps (`host: springapp`)** は Spring Boot のために作られたマネージドランタイムです。サービスディスカバリ、コンフィグサーバー、ブルーグリーンデプロイなどを扱うため、Java チームが自分でインフラを運用する必要がありません。

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> 既存の Spring Boot アプリがあり、それらに最適化されたランタイムを求めている場合は `springapp` を使用してください。Spring 固有のニーズがない新しいコンテナ化された Java アプリの場合、`containerapp` の方がシンプルな選択となることが多いです。

## 🗃️ データベースのプロビジョニング

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

## 🔒 セキュリティとシークレット管理

### Key Vault 統合
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

### マネージド ID の構成
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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 ネットワーキングと接続

### Virtual Network の構成
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

### SSL を使った Application Gateway
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

## 📊 モニタリングと可観測性

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

### カスタムメトリクスとアラート
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [webApp.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
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

## 🔧 環境固有の構成

### 異なる環境向けのパラメータファイル
```json
// infra/main.parameters.dev.json
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

```json
// infra/main.parameters.prod.json
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

### 条件付きリソースプロビジョニング
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: '${applicationName}devstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: '${applicationName}prodstorage${resourceToken}'
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

## 🚀 高度なプロビジョニングパターン

### マルチリージョンデプロイ
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

### インフラのテスト
```bicep
// infra/test/main.test.bicep
param location string = resourceGroup().location

module mainTemplate '../main.bicep' = {
  name: 'main-template-test'
  params: {
    environmentName: 'test'
    location: location
    applicationName: 'testapp'
  }
}

// Test assertions
resource testScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'test-deployment'
  location: location
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '8.0'
    scriptContent: '''
      $webAppName = "${mainTemplate.outputs.WEB_NAME}"
      $response = Invoke-WebRequest -Uri "https://${mainTemplate.outputs.WEB_URL}/health" -UseBasicParsing
      if ($response.StatusCode -ne 200) {
        throw "Health check failed"
      }
      Write-Output "All tests passed!"
    '''
    timeout: 'PT10M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🧪 インフラのプレビューと検証（新機能）

### デプロイ前にインフラの変更をプレビューする

`azd provision --preview` 機能を使うと、実際にリソースをデプロイする前に <strong>インフラプロビジョニングをシミュレート</strong> できます。これは `terraform plan` や `bicep what-if` の精神に似ており、Azure 環境に加えられる変更の <strong>ドライランビュー</strong> を提供します。

#### 🛠️ 機能概要
- **IaC テンプレートを解析します**（Bicep または Terraform）
- <strong>リソース変更のプレビューを表示します</strong>: 追加、削除、更新
- <strong>変更は適用されません</strong> — 読み取り専用で安全に実行できます

#### ユースケース
```bash
# デプロイ前にインフラの変更をプレビューする
azd provision --preview

# 特定の環境向けのプレビュー
azd provision --preview -e production
```

このコマンドは次のことに役立ちます:
- <strong>リソースをコミットする前にインフラ変更を検証する</strong>
- <strong>開発サイクルの早い段階で設定ミスを検出する</strong>
- <strong>チーム環境で安全に協力する</strong>
- **意図しない権限でのデプロイを防ぎ、最小権限のデプロイを確実にする**

特に有用なのは次の場合です:
- 複雑なマルチサービス環境で作業しているとき
- 本番インフラに変更を加えるとき
- PR 承認前にテンプレート変更を検証するとき
- インフラパターンを新しいチームメンバーに教育するとき

### プレビュー出力の例
正確なプレビュー出力はプロバイダーやプロジェクト構成によって異なりますが、結果は何かが適用される前に提案される変更を明確に示すべきです。

```bash
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

## �🔄 リソースの更新と移行

### 安全なリソース更新
```bash
# まずインフラの変更をプレビューしてください（推奨）
azd provision --preview

# プレビューを確認した後に変更を適用する
azd provision --confirm-with-no-prompt

# ロールバックするには、Git を使ってインフラの変更を元に戻してください:
git revert HEAD  # 最後のインフラのコミットを元に戻す
azd provision    # 以前のインフラの状態を適用する
```

### データベースのマイグレーション
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
  }
}
```

## 🎯 ベストプラクティス

### 1. リソース命名規則
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. タグ戦略
```bicep
var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'created-date': utcNow('yyyy-MM-dd')
}
```

### 3. パラメータ検証
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

### 4. 出力の整理
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

## 次のステップ

- [デプロイ前の計画](../chapter-06-pre-deployment/capacity-planning.md) - リソースの可用性を検証する
- [一般的な問題](../chapter-07-troubleshooting/common-issues.md) - インフラの問題をトラブルシュートする
- [デバッグガイド](../chapter-07-troubleshooting/debugging.md) - プロビジョニングの問題をデバッグする
- [SKU 選択](../chapter-06-pre-deployment/sku-selection.md) - 適切なサービス階層を選択する

## 追加リソース

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [デプロイメントガイド](deployment-guide.md)
- **Next Lesson**: [キャパシティプランニング](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->