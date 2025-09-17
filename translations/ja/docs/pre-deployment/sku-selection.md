<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T14:18:13+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ja"
}
-->
# SKU選択ガイド - 適切なAzureサービス層の選び方

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第6章 - デプロイ前の検証と計画
- **⬅️ 前へ**: [キャパシティプランニング](capacity-planning.md)
- **➡️ 次へ**: [事前チェック](preflight-checks.md)
- **🚀 次の章**: [第7章: トラブルシューティング](../troubleshooting/common-issues.md)

## はじめに

この包括的なガイドでは、さまざまな環境、ワークロード、要件に応じて最適なAzureサービスSKU（在庫管理単位）を選択する方法を説明します。パフォーマンス要件、コスト考慮事項、スケーラビリティ要件を分析し、Azure Developer CLIデプロイメントに最適なサービス層を選択する方法を学びます。

## 学習目標

このガイドを完了することで、以下を習得できます:
- Azure SKUの概念、価格モデル、機能の違いを理解する
- 開発、ステージング、本番環境に特化したSKU選択戦略をマスターする
- ワークロード要件を分析し、適切なサービス層にマッチさせる
- 賢明なSKU選択を通じてコスト最適化戦略を実装する
- SKU選択のためのパフォーマンステストと検証技術を適用する
- 自動化されたSKU推奨とモニタリングを設定する

## 学習成果

このガイドを完了すると、以下が可能になります:
- ワークロード要件と制約に基づいて適切なAzureサービスSKUを選択する
- 適切な層選択を通じてコスト効率の高いマルチ環境アーキテクチャを設計する
- SKU選択のためのパフォーマンスベンチマークと検証を実装する
- SKU推奨とコスト最適化のための自動化ツールを作成する
- 要件の変化に応じたSKU移行とスケーリング戦略を計画する
- Azure Well-Architected Frameworkの原則をサービス層選択に適用する

## 目次

- [SKUの理解](../../../../docs/pre-deployment)
- [環境別の選択](../../../../docs/pre-deployment)
- [サービス別ガイドライン](../../../../docs/pre-deployment)
- [コスト最適化戦略](../../../../docs/pre-deployment)
- [パフォーマンスの考慮事項](../../../../docs/pre-deployment)
- [クイックリファレンステーブル](../../../../docs/pre-deployment)
- [検証ツール](../../../../docs/pre-deployment)

---

## SKUの理解

### SKUとは？

SKU（在庫管理単位）は、Azureリソースの異なるサービス層やパフォーマンスレベルを表します。各SKUは以下の点で異なります:

- **パフォーマンス特性**（CPU、メモリ、スループット）
- **機能の可用性**（スケーリングオプション、SLAレベル）
- **価格モデル**（従量課金制、予約容量）
- **地域の可用性**（すべてのSKUがすべての地域で利用可能ではない）

### SKU選択の重要な要素

1. **ワークロード要件**
   - 予想されるトラフィック/負荷パターン
   - パフォーマンス要件（CPU、メモリ、I/O）
   - ストレージの必要性とアクセスパターン

2. **環境タイプ**
   - 開発/テスト vs. 本番
   - 可用性要件
   - セキュリティとコンプライアンスのニーズ

3. **予算の制約**
   - 初期コスト vs. 運用コスト
   - 予約容量の割引
   - 自動スケーリングのコスト影響

4. **成長予測**
   - スケーラビリティ要件
   - 将来の機能ニーズ
   - 移行の複雑さ

---

## 環境別の選択

### 開発環境

**優先事項**: コスト最適化、基本機能、簡単なプロビジョニング/デプロビジョニング

#### 推奨SKU
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

#### 特徴
- **App Service**: F1（無料）またはB1（基本）で簡単なテスト
- **データベース**: 最小リソースの基本層
- **ストレージ**: ローカル冗長性のみの標準
- **コンピュート**: 共有リソースで十分
- **ネットワーキング**: 基本構成

### ステージング/テスト環境

**優先事項**: 本番に近い構成、コストバランス、パフォーマンステストの可能性

#### 推奨SKU
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
- **パフォーマンス**: 本番容量の70-80%
- **機能**: 本番機能のほとんどを有効化
- **冗長性**: 一部の地理的冗長性
- **スケーリング**: テスト用の限定的な自動スケーリング
- **モニタリング**: フルモニタリングスタック

### 本番環境

**優先事項**: パフォーマンス、可用性、セキュリティ、コンプライアンス、スケーラビリティ

#### 推奨SKU
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

#### 特徴
- **高可用性**: 99.9%以上のSLA要件
- **パフォーマンス**: 専用リソース、高スループット
- **セキュリティ**: プレミアムセキュリティ機能
- **スケーリング**: フル自動スケーリング機能
- **モニタリング**: 包括的な可観測性

---

## サービス別ガイドライン

### Azure App Service

#### SKU決定マトリックス

| ユースケース | 推奨SKU | 理由 |
|--------------|---------|------|
| 開発/テスト | F1（無料）またはB1（基本） | コスト効率が高く、テストに十分 |
| 小規模本番アプリ | S1（標準） | カスタムドメイン、SSL、自動スケーリング |
| 中規模本番アプリ | P1V3（プレミアムV3） | 高性能、より多くの機能 |
| 高トラフィックアプリ | P2V3またはP3V3 | 専用リソース、高パフォーマンス |
| ミッションクリティカルアプリ | I1V2（アイソレートV2） | ネットワーク分離、専用ハードウェア |

#### 構成例

**開発**
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

**本番**
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

#### SKU選択フレームワーク

1. **DTUベース（データベーストランザクションユニット）**
   - **基本**: 5 DTU - 開発/テスト
   - **標準**: S0-S12（10-3000 DTU） - 一般用途
   - **プレミアム**: P1-P15（125-4000 DTU） - パフォーマンス重視

2. **vCoreベース**（本番向け推奨）
   - **汎用**: コンピュートとストレージのバランス
   - **ビジネスクリティカル**: 低レイテンシ、高IOPS
   - **ハイパースケール**: 高スケーラブルストレージ（最大100TB）

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

1. **従量課金制**
   - 使用量に応じた料金
   - 開発や変動するワークロードに適している
   - 共有インフラ

2. **専用（ワークロードプロファイル）**
   - 専用コンピュートリソース
   - 予測可能なパフォーマンス
   - 本番ワークロードに適している

#### 構成例

**開発（従量課金制）**
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

**本番（専用）**
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

#### スループットモデル

1. **手動プロビジョニングスループット**
   - 予測可能なパフォーマンス
   - 予約容量割引
   - 安定したワークロードに最適

2. **自動スケールプロビジョニングスループット**
   - 使用量に応じた自動スケーリング
   - 最低限の料金で使用分だけ支払う
   - 変動するワークロードに適している

3. **サーバーレス**
   - リクエストごとの料金
   - プロビジョニングスループットなし
   - 開発や断続的なワークロードに最適

#### SKU例

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

#### ストレージアカウントタイプ

1. **Standard_LRS** - 開発、重要でないデータ
2. **Standard_GRS** - 本番、地理的冗長性が必要
3. **Premium_LRS** - 高性能アプリケーション
4. **Premium_ZRS** - ゾーン冗長性を備えた高可用性

#### パフォーマンス層

- **標準**: 一般用途、コスト効率
- **プレミアム**: 高性能、低レイテンシシナリオ

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

1～3年分のリソースを予約して大幅な割引を受ける:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 適切なサイズ選択

小さなSKUから始め、実際の使用量に基づいてスケールアップ:

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

### 3. 自動スケーリング構成

コストを最適化するためのインテリジェントなスケーリングを実装:

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

### 4. スケジュールスケーリング

オフピーク時にスケールダウン:

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

### ベースラインパフォーマンス要件

SKU選択前に明確なパフォーマンス要件を定義:

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

異なるSKUをテストしてパフォーマンスを検証:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
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

## クイックリファレンステーブル

### App Service SKUクイックリファレンス

| SKU | 層 | vCPU | RAM | ストレージ | 価格帯 | ユースケース |
|-----|----|------|-----|-----------|---------|--------------|
| F1 | 無料 | 共有 | 1GB | 1GB | 無料 | 開発 |
| B1 | 基本 | 1 | 1.75GB | 10GB | $ | 小規模アプリ |
| S1 | 標準 | 1 | 1.75GB | 50GB | $$ | 本番 |
| P1V3 | プレミアムV3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | アイソレートV2 | 2 | 8GB | 1TB | $$$$ | エンタープライズ |

### SQL Database SKUクイックリファレンス

| SKU | 層 | DTU/vCore | ストレージ | 価格帯 | ユースケース |
|-----|----|-----------|-----------|---------|--------------|
| Basic | 基本 | 5 DTU | 2GB | $ | 開発 |
| S2 | 標準 | 50 DTU | 250GB | $$ | 小規模本番 |
| P2 | プレミアム | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | 汎用 | 4 vCore | 4TB | $$$ | バランス型 |
| BC_Gen5_8 | ビジネスクリティカル | 8 vCore | 4TB | $$$$ | ミッションクリティカル |

### Container Apps SKUクイックリファレンス

| モデル | 価格 | CPU/メモリ | ユースケース |
|-------|------|-----------|--------------|
| 従量課金制 | 使用量に応じた料金 | 0.25-2 vCPU | 開発、変動負荷 |
| 専用D4 | 予約 | 4 vCPU, 16GB | 本番 |
| 専用D8 | 予約 | 8 vCPU, 32GB | 高性能 |

---

## 検証ツール

### SKU可用性チェッカー

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

### コスト見積もりスクリプト

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

## ベストプラクティスのまとめ

### 実施すべきこと

1. **小さく始めてスケールアップ** 実際の使用量に基づいて調整
2. **異なる環境に異なるSKUを使用**
3. **パフォーマンスとコストを継続的にモニタリング**
4. **本番ワークロードには予約容量を活用**
5. **適切な場所で自動スケーリングを実装**
6. **現実的なワークロードでパフォーマンスをテスト**
7. **成長を計画しつつ、過剰プロビジョニングを避ける**
8. **可能な限り無料層を開発に利用**

### 避けるべきこと

1. **開発に本番SKUを使用しない**
2. **地域のSKU可用性を無視しない**
3. **データ転送コストを忘れない**
4. **正当な理由なく過剰プロビジョニングしない**
5. **依存関係の影響を無視しない**
6. **自動スケーリングの上限を高く設定しすぎない**
7. **コンプライアンス要件を忘れない**
8. **価格だけで決定しない**

---

**プロのヒント**: Azure Cost ManagementとAdvisorを活用して、実際の使用パターンに基づいたSKU選択の最適化に関する個別の推奨を受け取りましょう。

---

**ナビゲーション**
- **前のレッスン**: [キャパシティプランニング](capacity-planning.md)
- **次のレッスン**: [事前チェック](preflight-checks.md)

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてお考えください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。