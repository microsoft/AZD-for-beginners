<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T17:24:23+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ja"
}
-->
# SKU選択ガイド - 適切なAzureサービス階層の選び方

## はじめに

この包括的なガイドでは、さまざまな環境、ワークロード、要件に最適なAzureサービスSKU（Stock Keeping Units）を選択する方法を説明します。パフォーマンスニーズ、コストの考慮事項、スケーラビリティ要件を分析し、Azure Developer CLIデプロイメントに最適なサービス階層を選択する方法を学びます。

## 学習目標

このガイドを完了することで、以下を理解できます：
- Azure SKUの概念、価格モデル、機能の違いを理解する
- 開発、ステージング、運用環境に特化したSKU選択戦略を習得する
- ワークロード要件を分析し、適切なサービス階層にマッチさせる
- 賢明なSKU選択を通じてコスト最適化戦略を実施する
- SKU選択のためのパフォーマンステストと検証技術を適用する
- 自動化されたSKU推奨とモニタリングを設定する

## 学習成果

このガイドを完了すると、以下ができるようになります：
- ワークロード要件と制約に基づいて適切なAzureサービスSKUを選択する
- 適切な階層選択を用いてコスト効率の良いマルチ環境アーキテクチャを設計する
- SKU選択のためのパフォーマンスベンチマークと検証を実施する
- SKU推奨とコスト最適化のための自動化ツールを作成する
- 要件の変化に応じたSKU移行とスケーリング戦略を計画する
- Azure Well-Architected Frameworkの原則をサービス階層選択に適用する

## 目次

- [SKUの理解](../../../../docs/pre-deployment)
- [環境別選択](../../../../docs/pre-deployment)
- [サービス別ガイドライン](../../../../docs/pre-deployment)
- [コスト最適化戦略](../../../../docs/pre-deployment)
- [パフォーマンスの考慮事項](../../../../docs/pre-deployment)
- [クイックリファレンステーブル](../../../../docs/pre-deployment)
- [検証ツール](../../../../docs/pre-deployment)

---

## SKUの理解

### SKUとは？

SKU（Stock Keeping Units）は、Azureリソースの異なるサービス階層とパフォーマンスレベルを表します。各SKUは以下の点で異なります：

- **パフォーマンス特性**（CPU、メモリ、スループット）
- **機能の利用可能性**（スケーリングオプション、SLAレベル）
- **価格モデル**（消費ベース、予約容量）
- **地域の利用可能性**（すべてのSKUがすべての地域で利用可能ではない）

### SKU選択の重要な要素

1. **ワークロード要件**
   - 予想されるトラフィック/負荷パターン
   - パフォーマンス要件（CPU、メモリ、I/O）
   - ストレージニーズとアクセスパターン

2. **環境タイプ**
   - 開発/テスト vs. 運用
   - 可用性要件
   - セキュリティとコンプライアンスのニーズ

3. **予算制約**
   - 初期コスト vs. 運用コスト
   - 予約容量割引
   - 自動スケーリングのコスト影響

4. **成長予測**
   - スケーラビリティ要件
   - 将来の機能ニーズ
   - 移行の複雑さ

---

## 環境別選択

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
- **データベース**: 最小リソースの基本階層
- **ストレージ**: 標準でローカル冗長のみ
- **コンピュート**: 共有リソースで十分
- **ネットワーク**: 基本構成

### ステージング/テスト環境

**優先事項**: 運用に近い構成、コストバランス、パフォーマンステスト能力

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
- **パフォーマンス**: 運用容量の70-80%
- **機能**: 運用機能のほとんどを有効化
- **冗長性**: 一部の地理的冗長性
- **スケーリング**: テスト用の限定的な自動スケーリング
- **モニタリング**: 完全なモニタリングスタック

### 運用環境

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
- **スケーリング**: 完全な自動スケーリング能力
- **モニタリング**: 包括的な可観測性

---

## サービス別ガイドライン

### Azure App Service

#### SKU決定マトリックス

| 使用ケース | 推奨SKU | 理由 |
|------------|---------|------|
| 開発/テスト | F1（無料）またはB1（基本） | コスト効率が良く、テストに十分 |
| 小規模運用アプリ | S1（標準） | カスタムドメイン、SSL、自動スケーリング |
| 中規模運用アプリ | P1V3（プレミアムV3） | 高性能、より多くの機能 |
| 高トラフィックアプリ | P2V3またはP3V3 | 専用リソース、高性能 |
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

**運用**
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

1. **DTUベース（Database Transaction Units）**
   - **基本**: 5 DTU - 開発/テスト
   - **標準**: S0-S12（10-3000 DTU） - 一般用途
   - **プレミアム**: P1-P15（125-4000 DTU） - パフォーマンス重視

2. **vCoreベース**（運用に推奨）
   - **一般用途**: コンピュートとストレージのバランス
   - **ビジネスクリティカル**: 低レイテンシ、高IOPS
   - **ハイパースケール**: 高度にスケーラブルなストレージ（最大100TB）

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

1. **消費ベース**
   - 使用量に応じた料金
   - 開発や変動するワークロードに適している
   - 共有インフラ

2. **専用（ワークロードプロファイル）**
   - 専用コンピュートリソース
   - 予測可能なパフォーマンス
   - 運用ワークロードに適している

#### 構成例

**開発（消費ベース）**
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

**運用（専用）**
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
   - 最低限の料金で利用可能
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
2. **Standard_GRS** - 運用、地理的冗長性が必要
3. **Premium_LRS** - 高性能アプリケーション
4. **Premium_ZRS** - ゾーン冗長性を備えた高可用性

#### パフォーマンス階層

- **標準**: 一般用途、コスト効率が良い
- **プレミアム**: 高性能、低レイテンシのシナリオ

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

1～3年間リソースを予約して大幅な割引を受ける：

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 適切なサイズ選択

小さなSKUから始め、実際の使用量に基づいてスケールアップ：

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

インテリジェントなスケーリングを実施してコストを最適化：

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

オフ時間中にスケールダウン：

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

### 基本的なパフォーマンス要件

SKU選択前に明確なパフォーマンス要件を定義：

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

異なるSKUをテストしてパフォーマンスを検証：

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### モニタリングと最適化

包括的なモニタリングを設定：

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

| SKU | 階層 | vCPU | RAM | ストレージ | 価格帯 | 使用ケース |
|-----|------|------|-----|------------|---------|------------|
| F1 | 無料 | 共有 | 1GB | 1GB | 無料 | 開発 |
| B1 | 基本 | 1 | 1.75GB | 10GB | $ | 小規模アプリ |
| S1 | 標準 | 1 | 1.75GB | 50GB | $$ | 運用 |
| P1V3 | プレミアムV3 | 2 | 8GB | 250GB | $$$ | 高性能 |
| I1V2 | アイソレートV2 | 2 | 8GB | 1TB | $$$$ | エンタープライズ |

### SQL Database SKUクイックリファレンス

| SKU | 階層 | DTU/vCore | ストレージ | 価格帯 | 使用ケース |
|-----|------|-----------|------------|---------|------------|
| Basic | 基本 | 5 DTU | 2GB | $ | 開発 |
| S2 | 標準 | 50 DTU | 250GB | $$ | 小規模運用 |
| P2 | プレミアム | 250 DTU | 1TB | $$$ | 高性能 |
| GP_Gen5_4 | 一般用途 | 4 vCore | 4TB | $$$ | バランス型 |
| BC_Gen5_8 | ビジネスクリティカル | 8 vCore | 4TB | $$$$ | ミッションクリティカル |

### Container Apps SKUクイックリファレンス

| モデル | 価格 | CPU/メモリ | 使用ケース |
|-------|------|-----------|------------|
| 消費ベース | 使用量に応じた料金 | 0.25-2 vCPU | 開発、変動負荷 |
| 専用D4 | 予約 | 4 vCPU, 16GB | 運用 |
| 専用D8 | 予約 | 8 vCPU, 32GB | 高性能 |

---

## 検証ツール

### SKU利用可能性チェッカー

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

### Do's

1. **小さく始めてスケールアップ** 実際の使用量に基づいて
2. **異なる環境に異なるSKUを使用**
3. **パフォーマンスとコストを継続的にモニタリング**
4. **運用ワークロードに予約容量を活用**
5. **適切な場所で自動スケーリングを実施**
6. **現実的なワークロードでパフォーマンスをテスト**
7. **成長を計画しつつ過剰プロビジョニングを避ける**
8. **可能な場合は無料階層を開発に使用**

### Don'ts

1. **開発に運用SKUを使用しない**
2. **地域のSKU利用可能性を無視しない**
3. **データ転送コストを忘れない**
4. **正当な理由なしに過剰プロビジョニングしない**
5. **依存関係の影響を無視しない**
6. **自動スケーリングの制限を高く設定しすぎない**
7. **コンプライアンス要件を忘れない**
8. **価格だけで決定を下さない**

---

**プロのヒント**: Azure Cost ManagementとAdvisorを使用して、実際の使用パターンに基づいたSKU選択の最適化に関する個別の推奨を取得しましょう。

---

**ナビゲーション**
- **前のレッスン**: [容量計画](capacity-planning.md)
- **次のレッスン**: [事前チェック](preflight-checks.md)

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてお考えください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解について、当社は責任を負いません。