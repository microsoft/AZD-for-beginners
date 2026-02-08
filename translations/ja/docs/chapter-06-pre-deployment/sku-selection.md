# SKU 選定ガイド - 適切な Azure サービス階層の選び方

**Chapter Navigation:**
- **📚 コース ホーム**: [AZD 入門](../../README.md)
- **📖 現在のチャプター**: 第6章 - 展開前の検証と計画
- **⬅️ 前へ**: [容量計画](capacity-planning.md)
- **➡️ 次へ**: [事前チェック](preflight-checks.md)
- **🚀 次の章**: [第7章: トラブルシューティング](../chapter-07-troubleshooting/common-issues.md)

## はじめに

この包括的なガイドは、異なる環境、ワークロード、および要件に対して最適な Azure サービス SKU（Stock Keeping Units）を選択するのに役立ちます。パフォーマンス要件、コストの考慮事項、スケーラビリティ要件を分析して、Azure Developer CLI のデプロイメントに最も適したサービス階層を選択する方法を学びます。

## 学習目標

このガイドを完了すると、以下を習得できます:
- Azure SKU の概念、価格モデル、および機能の違いを理解する
- 開発、ステージング、本番向けに環境別の SKU 選定戦略を習得する
- ワークロード要件を分析し、適切なサービス階層と一致させる
- 賢明な SKU 選択を通じてコスト最適化戦略を実装する
- SKU 選択のためのパフォーマンステストおよび検証手法を適用する
- 自動化された SKU 推奨と監視を構成する

## 学習成果

完了後、以下ができるようになります:
- ワークロード要件と制約に基づいて適切な Azure サービス SKU を選択する
- 適切な階層選択によりコスト効率の高いマルチ環境アーキテクチャを設計する
- SKU 選択に対するパフォーマンスベンチマークと検証を実装する
- SKU 推奨とコスト最適化のための自動化ツールを作成する
- 要件の変化に対応した SKU の移行およびスケーリング戦略を計画する
- サービス階層の選択に Azure Well-Architected Framework の原則を適用する

## 目次

- [SKU の理解](../../../../docs/chapter-06-pre-deployment)
- [環境別の選定](../../../../docs/chapter-06-pre-deployment)
- [サービス別ガイドライン](../../../../docs/chapter-06-pre-deployment)
- [コスト最適化戦略](../../../../docs/chapter-06-pre-deployment)
- [パフォーマンスに関する考慮事項](../../../../docs/chapter-06-pre-deployment)
- [クイック参照表](../../../../docs/chapter-06-pre-deployment)
- [検証ツール](../../../../docs/chapter-06-pre-deployment)

---

## SKU の理解

### SKU とは何か？

SKU（Stock Keeping Units）は、Azure リソースの異なるサービス階層とパフォーマンスレベルを表します。各 SKU は次の点で異なります:

- **パフォーマンス特性** (CPU、メモリ、スループット)
- **機能の可用性** (スケーリングオプション、SLA レベル)
- **料金モデル** (従量課金、予約容量)
- **リージョンでの可用性** (すべての SKU がすべてのリージョンで利用できるわけではありません)

### SKU 選定の主要要因

1. **ワークロード要件**
   - 想定されるトラフィック/負荷パターン
   - パフォーマンス要件（CPU、メモリ、I/O）
   - ストレージの要件とアクセスパターン

2. **環境タイプ**
   - 開発/テストと本番
   - 可用性要件
   - セキュリティおよびコンプライアンスの要件

3. **予算の制約**
   - 初期費用と運用コストの比較
   - 予約容量の割引
   - 自動スケーリングのコスト影響

4. **成長予測**
   - スケーラビリティ要件
   - 将来的な機能の必要性
   - 移行の複雑さ

---

## 環境別の選定

### 開発環境

**優先事項**: コスト最適化、基本機能、容易なプロビジョニング/デプロビジョニング

#### 推奨 SKU
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

#### 特性
- **App Service**: 簡単なテストには F1 (Free) または B1 (Basic)
- **Databases**: 最小限のリソースを持つ Basic ティア
- **Storage**: ローカル冗長のみの Standard
- **Compute**: 共有リソースで可
- **Networking**: 基本的な構成

### ステージング/テスト環境

**優先事項**: 本番に近い構成、コストのバランス、パフォーマンステスト機能

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

#### 特性
- **パフォーマンス**: 本番容量の70～80%
- **機能**: ほとんどの本番機能を有効化
- **冗長性**: ある程度の地理的冗長性
- **スケーリング**: テスト用に限定的な自動スケーリング
- **監視**: フルの監視スタック

### 本番環境

**優先事項**: パフォーマンス、可用性、セキュリティ、コンプライアンス、スケーラビリティ

#### 推奨 SKU
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

#### 特性
- **高可用性**: 99.9% 以上の SLA 要件
- **パフォーマンス**: 専用リソース、高スループット
- **セキュリティ**: プレミアムなセキュリティ機能
- **スケーリング**: フルの自動スケーリング機能
- **監視**: 包括的なオブザーバビリティ

---

## サービス別ガイドライン

### Azure App Service

#### SKU 決定マトリクス

| ユースケース | 推奨 SKU | 理由 |
|----------|----------------|-----------|
| 開発/テスト | F1 (Free) or B1 (Basic) | コスト効率が高く、テストに十分 |
| 小規模本番アプリ | S1 (Standard) | カスタムドメイン、SSL、自動スケーリング |
| 中規模本番アプリ | P1V3 (Premium V3) | より高いパフォーマンス、より多くの機能 |
| 高トラフィックアプリ | P2V3 or P3V3 | 専用リソース、高いパフォーマンス |
| ミッションクリティカルアプリ | I1V2 (Isolated V2) | ネットワーク分離、専用ハードウェア |

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

#### SKU 選定フレームワーク

1. **DTU ベース (Database Transaction Units)**
   - **Basic**: 5 DTU - 開発/テスト
   - **Standard**: S0-S12 (10-3000 DTU) - 一般用途
   - **Premium**: P1-P15 (125-4000 DTU) - パフォーマンス重視

2. **vCore ベース** (本番に推奨)
   - **General Purpose**: 計算とストレージのバランス
   - **Business Critical**: 低レイテンシ、高い IOPS
   - **Hyperscale**: 高度にスケーラブルなストレージ（最大 100TB）

#### 例の構成

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

1. **従量課金ベース**
   - 使用量に応じた課金
   - 開発や変動するワークロードに適している
   - 共有インフラ

2. **専用 (ワークロードプロファイル)**
   - 専用の計算リソース
   - 予測可能なパフォーマンス
   - 本番ワークロード向けに適している

#### 構成例

**開発（従量課金）**
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

1. **手動プロビジョニングされたスループット**
   - 予測可能なパフォーマンス
   - 予約容量の割引
   - 安定したワークロードに最適

2. **オートスケールのプロビジョニングスループット**
   - 使用量に基づく自動スケーリング
   - 使用分だけ支払う（最小値あり）
   - 変動するワークロードに適している

3. **サーバーレス**
   - リクエストごとの課金
   - プロビジョニングされたスループットなし
   - 開発や断続的なワークロードに最適

#### SKU の例

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

#### ストレージアカウントの種類

1. **Standard_LRS** - 開発、重要でないデータ
2. **Standard_GRS** - 本番、地理的冗長性が必要
3. **Premium_LRS** - 高パフォーマンスアプリケーション
4. **Premium_ZRS** - ゾーン冗長性による高可用性

#### パフォーマンス層

- **Standard**: 汎用、コスト効率が良い
- **Premium**: 高性能、低レイテンシ向け

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

1〜3年のリソース予約で大幅な割引を獲得できます:

```bash
# 予約オプションを確認する
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 適切なサイズ設定

小さい SKU から開始し、実際の使用状況に基づいてスケールアップする:

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

### 3. 自動スケーリングの構成

コスト最適化のために賢いスケーリングを実装する:

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

### 4. スケジュールされたスケーリング

営業時間外にスケールダウンする:

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

## パフォーマンスに関する考慮事項

### 基本的なパフォーマンス要件

SKU 選定前に明確なパフォーマンス要件を定義する:

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

さまざまな SKU をテストしてパフォーマンスを検証する:

```bash
# Azure Load Testing サービス
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 監視と最適化

包括的な監視を設定する:

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

## クイック参照表

### App Service SKU クイック参照

| SKU | ティア | vCPU | RAM | ストレージ | 価格帯 | ユースケース |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | 共有 | 1GB | 1GB | Free | 開発 |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | 小規模アプリ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | 本番 |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | 高パフォーマンス |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | エンタープライズ |

### SQL データベース SKU クイック参照

| SKU | ティア | DTU/vCore | ストレージ | 価格帯 | ユースケース |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | 開発 |
| S2 | Standard | 50 DTU | 250GB | $$ | 小規模本番 |
| P2 | Premium | 250 DTU | 1TB | $$$ | 高パフォーマンス |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | バランス型 |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | ミッションクリティカル |

### Container Apps SKU クイック参照

| モデル | 価格 | CPU/メモリ | ユースケース |
|-------|---------|------------|----------|
| Consumption | 従量課金 | 0.25-2 vCPU | 開発、変動負荷 |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | 本番 |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | 高パフォーマンス |

---

## 検証ツール

### SKU 可用性チェッカー

```bash
#!/bin/bash
# ターゲットリージョンで SKU の可用性を確認する

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

# 使用方法
check_sku_availability "eastus" "app-service" "P1V3"
```

### コスト見積りスクリプト

```powershell
# 費用見積もり用の PowerShell スクリプト
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
        
        # Azure の Pricing API または料金計算機を使用する
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# 使用方法
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

### 実行すべきこと

1. **小さい構成から始めてスケールアップする** 実際の使用量に基づいて
2. **環境ごとに異なる SKU を使用する**
3. **パフォーマンスとコストを継続的に監視する**
4. **本番ワークロードには予約容量を活用する**
5. **適切な箇所で自動スケーリングを実装する**
6. **実運用に近いワークロードでパフォーマンスをテストする**
7. **成長を見越して計画するが、過剰プロビジョニングは避ける**
8. **可能な場合は開発に無料ティアを使用する**

### やってはいけないこと

1. **開発に本番用 SKU を使用しない**
2. **リージョンごとの SKU 可用性を無視しない**
3. **データ転送コストを忘れない**
4. **正当な理由なしに過剰プロビジョニングを行わない**
5. **依存関係の影響を無視しない**
6. **自動スケーリングの上限を高く設定しすぎない**
7. **コンプライアンス要件を忘れない**
8. **価格だけで判断しない**

---

**プロのヒント**: 実際の使用パターンに基づいて SKU 選択の最適化に関する個別推奨を得るには、Azure Cost Management と Advisor を使用してください。

---

**ナビゲーション**
- **前のレッスン**: [容量計画](capacity-planning.md)
- **次のレッスン**: [事前チェック](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書はAI翻訳サービス「Co-op Translator」(https://github.com/Azure/co-op-translator)を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な点が含まれる場合があることにご注意ください。原文（原言語）の文書を正本としてご参照ください。重要な情報については、専門の翻訳者による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当社は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->