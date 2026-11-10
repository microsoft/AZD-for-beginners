# SKU 選択ガイド - 適切な Azure サービス階層の選び方

**章ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第6章 - 事前展開の検証と計画
- **⬅️ 前へ**: [キャパシティプランニング](capacity-planning.md)
- **➡️ 次へ**: [事前チェック](preflight-checks.md)
- **🚀 次の章**: [第7章: トラブルシューティング](../chapter-07-troubleshooting/common-issues.md)

## はじめに

この包括的なガイドは、さまざまな環境、ワークロード、および要件に対して最適な Azure サービス SKU（ストックキーピングユニット）を選択するのに役立ちます。パフォーマンスのニーズ、コストの考慮事項、スケーラビリティの要件を分析して、Azure Developer CLI の展開に最も適したサービス階層を選ぶ方法を学びます。

## 学習目標

このガイドを修了することで、以下を習得できます:
- Azure SKU の概念、料金モデル、および機能の違いを理解する
- 開発、ステージング、本番の環境固有の SKU 選択戦略を習得する
- ワークロードの要件を分析し、適切なサービス階層にマッチさせる
- インテリジェントな SKU 選択によるコスト最適化戦略を実施する
- SKU 選択のためのパフォーマンステストと検証技術を適用する
- 自動 SKU 推奨とモニタリングの設定を行う

## 学習成果

修了時には、次のことが可能になります:
- ワークロード要件と制約に基づき適切な Azure サービス SKU を選択する
- 適切な階層選択によるコスト効果の高い複数環境アーキテクチャを設計する
- SKU 選択に対するパフォーマンスベンチマーキングと検証を実施する
- SKU 推奨とコスト最適化の自動化ツールを作成する
- 要件変化に対応した SKU マイグレーションとスケーリング戦略を計画する
- Azure Well-Architected Framework の原則をサービス階層選択に適用する

## 目次

- [SKU の理解](#understanding-skus)
- [環境ベースの選択](#environment-based-selection)
- [サービス固有のガイドライン](#service-specific-guidelines)
- [コスト最適化戦略](#cost-optimization-strategies)
- [パフォーマンスの考慮事項](#performance-considerations)
- [クイックリファレンステーブル](#quick-reference-tables)
- [検証ツール](#validation-tools)

---

## SKU の理解

> **例の範囲:** 以下の YAML SKU マップやパフォーマンス設定は設計ノートであり、`azure.yaml` スキーマやロードツールの設定ではありません。Bicep ブロックは代替案・断片であり、パラメーターと親リソースを宣言し、組み合わせる際には固有のシンボリック名を使い、モジュールを動作するプロジェクトに接続します。価格、制限、地域/SKU の可用性は展開前にサブスクリプションで確認が必要です。

### SKU とは何か？

SKU（ストックキーピングユニット）は、Azure リソースの異なるサービス階層とパフォーマンスレベルを表します。SKUごとに以下が異なります:

- <strong>パフォーマンス特性</strong>（CPU、メモリ、スループット）
- <strong>機能の可用性</strong>（スケーリングオプション、SLA レベル）
- <strong>料金モデル</strong>（消費ベース、予約容量など）
- <strong>地域の可用性</strong>（すべての SKU が全地域で利用可能とは限らない）

### SKU 選択の重要な要素

1. <strong>ワークロード要件</strong>
   - 予想されるトラフィック/負荷パターン
   - パフォーマンス要件（CPU、メモリ、I/O）
   - ストレージの必要性とアクセスパターン

2. <strong>環境タイプ</strong>
   - 開発/テスト環境と本番環境の違い
   - 可用性要件
   - セキュリティとコンプライアンスニーズ

3. <strong>予算制約</strong>
   - 初期コスト対運用コスト
   - 予約容量割引
   - オートスケーリングのコスト影響

4. <strong>成長予測</strong>
   - スケーラビリティ要件
   - 将来の機能ニーズ
   - マイグレーションの複雑さ

---

## 環境ベースの選択

### 開発環境

<strong>優先事項</strong>: コスト最適化、基本機能、簡単なプロビジョニング/デプロビジョニング

#### 推奨 SKU
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

#### 特徴
- **App Service**: 単純なテスト用に F1 (無料) または B1 (ベーシック)
- <strong>データベース</strong>: 最小限のリソースを持つベーシック階層
- <strong>ストレージ</strong>: ローカル冗長のみの標準
- <strong>コンピュート</strong>: 共有リソースで許容可能
- <strong>ネットワーキング</strong>: ベーシック構成

### ステージング/テスト環境

<strong>優先事項</strong>: 本番に近い構成、コストバランス、パフォーマンステスト機能

#### 推奨 SKU
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

#### 特徴
- <strong>パフォーマンス</strong>: 本番容量の70-80%
- <strong>機能</strong>: ほとんどの本番機能が有効
- <strong>冗長性</strong>: 地理的冗長性の一部
- <strong>スケーリング</strong>: テスト用の限定的なオートスケーリング
- <strong>モニタリング</strong>: フルモニタリングスタック

### 本番環境

<strong>優先事項</strong>: パフォーマンス、可用性、セキュリティ、コンプライアンス、スケーラビリティ

#### 推奨 SKU
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

#### 特徴
- <strong>高可用性</strong>: 99.9%以上の SLA 要件
- <strong>パフォーマンス</strong>: 専用リソース、高スループット
- <strong>セキュリティ</strong>: プレミアムセキュリティ機能
- <strong>スケーリング</strong>: フルオートスケーリング能力
- <strong>モニタリング</strong>: 包括的な可観測性

---

## サービス固有のガイドライン

### Azure App Service

#### SKU 決定マトリックス

| ユースケース | 推奨 SKU | 理由 |
|----------|----------------|-----------|
| 開発/テスト | F1 (無料) または B1 (ベーシック) | コスト効果が高く、テストに十分 |
| 小規模本番アプリ | S1 (標準) | カスタムドメイン、SSL、自動スケール |
| 中規模本番アプリ | P1V3 (プレミアム V3) | より良いパフォーマンス、機能拡張 |
| 高トラフィックアプリ | P2V3 または P3V3 | 専用リソース、高パフォーマンス |
| ミッションクリティカルアプリ | I1V2 (アイソレーテッド V2) | ネットワーク隔離、専用ハードウェア |

#### 構成例

<strong>開発</strong>
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

<strong>本番</strong>
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

#### SKU 選択フレームワーク

1. **DTU ベース（Database Transaction Units）**
   - **Basic**: 5 DTU - 開発/テスト用
   - **Standard**: S0-S12 (10-3000 DTU) - 汎用
   - **Premium**: P1-P15 (125-4000 DTU) - パフォーマンス重要

2. **vCore ベース**（本番推奨）
   - **General Purpose**: バランスの取れたコンピュートとストレージ
   - **Business Critical**: 低レイテンシ、高 IOPS
   - **Hyperscale**: 高スケーラビリティストレージ；現在のサイズ制限と地域サポートを確認

#### 構成例

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

#### 環境タイプ

1. <strong>消費ベース</strong>
   - 従量課金
   - 開発および変動ワークロードに適合
   - 共有インフラストラクチャ

2. **専用（ワークロードプロファイル）**
   - 専用計算リソース
   - 予測可能なパフォーマンス
   - 本番ワークロードに最適

#### 構成例

**開発（消費）**
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

**本番（専用）**
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

ゾーン冗長性には対応地域のインフラおよび適切な VNet/サブネット構成も必要であり、ここでは省略しています。この例では 3 つの専用ノードを予算に計上し、アプリのクロスゾーン配布のため少なくとも 2 つのレプリカを設定し、レプリカとノード共にゾーン障害に備えてサイズを調整します。詳細は [Container Apps の信頼性ガイダンス](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)を参照ください。このプロファイルにアプリを配置するには、アプリの `workloadProfileName: 'production-profile'` を設定する必要があり、プロファイル作成だけではアプリは移動しません。

### Azure Cosmos DB

#### スループットモデル

1. <strong>手動プロビジョニングスループット</strong>
   - 予測可能なパフォーマンス
   - 予約容量割引
   - 安定したワークロードに最適

2. <strong>オートスケールプロビジョニングスループット</strong>
   - 使用量に基づく自動スケール
   - 使用分のみ支払い（最低限あり）
   - 変動ワークロードに適合

3. <strong>サーバーレス</strong>
   - リクエストごと課金
   - プロビジョニングされたスループットなし
   - 開発および断続的なワークロードに理想的

#### SKU 例

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

### Azure Storage アカウント

#### ストレージアカウントの種類

1. **Standard_LRS** - 開発用、重要でないデータ
2. **Standard_GRS** - 本番用、地理的冗長性を要する場合
3. **Premium_LRS** - 高性能アプリケーション用
4. **Premium_ZRS** - ゾーン冗長性付き高可用性

#### パフォーマンス階層

- **Standard**: 汎用、コスト効果が高い
- **Premium**: 高性能、低レイテンシシナリオ

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

## コスト最適化戦略

### 1. 予約容量

1〜3年分のリソースを予約して大幅割引を得る:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

予約オファリングと対象リソースタイプは異なるため、すべてのサービス/SKU が予約をサポートしていると仮定せず、カタログや購入条件を確認してください。

### 2. 適切なサイズ選定

小さい SKU から開始し、実際の使用に基づいてスケールアップ:

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

### 3. オートスケーリング設定

コスト最適化のためにインテリジェントなスケーリングを実装:

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

### 4. スケジュールスケーリング

オフピーク時間に縮小:

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

## パフォーマンスの考慮事項

### 基本パフォーマンス要件

SKU 選択前に明確なパフォーマンス要件を定義:

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

### 負荷テスト

異なる SKU をテストしてパフォーマンスを検証:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### モニタリングと最適化

包括的なモニタリングを設定:

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

## クイックリファレンステーブル

### App Service SKU クイックリファレンス

| SKU | 階層 | vCPU | RAM | ストレージ | 価格帯 | ユースケース |
|-----|------|------|-----|---------|-------------|----------|
| F1 | 無料 | 共有 | 1GB | 1GB | 無料 | 開発 |
| B1 | ベーシック | 1 | 1.75GB | 10GB | $ | 小規模アプリ |
| S1 | 標準 | 1 | 1.75GB | 50GB | $$ | 本番 |
| P1V3 | プレミアム V3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | アイソレーテッド V2 | 2 | 8GB | 1TB | $$$$ | エンタープライズ |

### SQL Database SKU クイックリファレンス

| SKU | 階層 | DTU/vCore | ストレージ | 価格帯 | ユースケース |
|-----|------|-----------|---------|-------------|----------|
| Basic | ベーシック | 5 DTU | 2GB | $ | 開発 |
| S2 | 標準 | 50 DTU | 250GB | $$ | 小規模本番 |
| P2 | プレミアム | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | 汎用 | 4 vCore | 4TB | $$$ | バランス型 |
| BC_Gen5_8 | ビジネスクリティカル | 8 vCore | 4TB | $$$$ | ミッションクリティカル |

### Container Apps SKU クイックリファレンス

| モデル | 料金体系 | CPU/メモリ | ユースケース |
|-------|---------|------------|----------|
| 消費ベース | 従量課金 | 環境/プロファイルによりサポートされる CPU/メモリ組み合わせ | 開発または本番、変動負荷 |
| 専用 D4 | 専用ノード課金 | ノードあたり 4 vCPU、16GiB | 持続的負荷/分離ニーズ |
| 専用 D8 | 専用ノード課金 | ノードあたり 8 vCPU、32GiB | より高い持続負荷 |

---

## 検証ツール

### SKU 可用性チェッカー

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

### コスト見積もりスクリプト

**擬似コードのみ:** 下記の `Get-ResourceCost` は、現在の地域別/契約料金および使用想定を用いて実装すべきプロジェクト固有関数であり、PowerShell や Azure コマンドレットではありません。

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

### パフォーマンス検証

以下の YAML は要件スケッチであり、**Azure Load Testing、JMeter、Locust、k6 の入力スキーマではありません**。ロードテストコマンドを使う前に、選択したツールの実際の設定に翻訳してください。

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

## ベストプラクティスまとめ

### やることリスト

1. **小さく始め、使用に応じてスケールアップする**
2. **環境ごとに異なる SKU を使う**
3. <strong>パフォーマンスとコストを継続的にモニタリングする</strong>
4. <strong>本番ワークロードには予約容量を活用する</strong>
5. <strong>適切な場所でオートスケーリングを実装する</strong>
6. <strong>現実的なワークロードでパフォーマンステストを行う</strong>
7. <strong>成長を見込んだ計画を立てるが過剰プロビジョニングは避ける</strong>
8. <strong>可能な限り開発には無料階層を使う</strong>

### やってはいけないことリスト

1. **開発に本番用 SKU を使わない**
2. **地域の SKU 可用性を無視しない**
3. <strong>データ転送コストを忘れない</strong>
4. <strong>正当な理由なしに過剰プロビジョニングしない</strong>
5. <strong>依存関係の影響を無視しない</strong>
6. <strong>オートスケーリングの上限を高く設定しすぎない</strong>
7. <strong>コンプライアンス要件を忘れない</strong>
8. <strong>価格だけで判断しない</strong>

---

<strong>プロのヒント</strong>: Azure Cost Management と Advisor を活用して、実際の使用パターンに基づく SKU 選択の最適化のためのパーソナライズされた推奨を受け取ってください。

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [キャパシティプランニング](capacity-planning.md)
- <strong>次のレッスン</strong>: [事前チェック](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->