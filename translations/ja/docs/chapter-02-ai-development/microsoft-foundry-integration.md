# Microsoft Foundry と AZD の統合

**Chapter Navigation:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: あなたの最初のプロジェクト](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 構成](../chapter-03-configuration/configuration.md)

## 概要

このガイドは、Microsoft Foundry サービスを Azure Developer CLI (AZD) と統合して、AI アプリケーションのデプロイを効率化する方法を示します。Microsoft Foundry は AI アプリケーションの構築、デプロイ、および管理のための包括的なプラットフォームを提供し、AZD はインフラとデプロイプロセスを簡素化します。

## Microsoft Foundryとは？

Microsoft Foundry は AI 開発のための統合プラットフォームで、以下を含みます:

- **Model Catalog**: 最新のAIモデルへのアクセス
- **Prompt Flow**: AI ワークフローのビジュアルデザイナー
- **AI Foundry Portal**: AI アプリケーションの統合開発環境
- **Deployment Options**: 複数のホスティングおよびスケーリングオプション
- **Safety and Security**: 組み込みの責任ある AI 機能

## AZD + Microsoft Foundry: より良い統合

| 機能 | Microsoft Foundry | AZD 統合の利点 |
|---------|-----------------|------------------------|
| **モデルのデプロイ** | ポータルでの手動デプロイ | 自動化され、再現可能なデプロイ |
| **インフラストラクチャ** | クリックでのプロビジョニング | インフラストラクチャをコードとして管理（Bicep） |
| **環境管理** | 単一環境にフォーカス | 複数環境（dev/staging/prod） |
| **CI/CD 統合** | 限定的 | ネイティブの GitHub Actions サポート |
| **コスト管理** | 基本的な監視 | 環境ごとのコスト最適化 |

## 前提条件

- 適切な権限を持つ Azure サブスクリプション
- Azure Developer CLI がインストールされていること
- Azure OpenAI サービスへのアクセス
- Microsoft Foundry の基本的な理解

## コア統合パターン

### パターン 1: Azure OpenAI 統合

**ユースケース**: Azure OpenAI モデルを使用したチャットアプリのデプロイ

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infrastructure (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### パターン 2: AI Search + RAG 統合

**ユースケース**: 検索補強生成（RAG）アプリケーションのデプロイ

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### パターン 3: ドキュメントインテリジェンス統合

**ユースケース**: ドキュメント処理および分析ワークフロー

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

## 🔧 設定パターン

### 環境変数の設定

**本番環境の設定:**
```bash
# コアAIサービス
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# モデル構成
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# パフォーマンス設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開発環境の設定:**
```bash
# 開発向けのコスト最適化設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 無料枠
```

### Key Vault を使った安全な設定

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

## デプロイワークフロー

### 単一コマンドでのデプロイ

```bash
# 1つのコマンドですべてをデプロイする
azd up

# または段階的にデプロイする
azd provision  # インフラのみ
azd deploy     # アプリケーションのみ
```

### 環境別デプロイ

```bash
# 開発環境
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# 本番環境
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## 監視と可観測性

### Application Insights 統合

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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### コスト監視

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 セキュリティのベストプラクティス

### マネージド ID の設定

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

### ネットワークセキュリティ

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

## パフォーマンス最適化

### キャッシング戦略

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### オートスケーリングの設定

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

## よくある問題のトラブルシューティング

### 課題 1: OpenAI クォータ超過

**症状:**
- デプロイがクォータエラーで失敗する
- アプリケーションログに 429 エラーが表示される

**対処法:**
```bash
# 現在のクォータ使用状況を確認する
az cognitiveservices usage list --location eastus

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 容量を一時的に削減する
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 課題 2: 認証失敗

**症状:**
- AI サービス呼び出し時に 401/403 エラーが発生する
- 「アクセスが拒否されました」と表示される

**対処法:**
```bash
# ロール割り当てを検証する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# マネージド ID の構成を確認する
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault へのアクセスを検証する
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 課題 3: モデルのデプロイ問題

**症状:**
- デプロイでモデルが利用できない
- 特定のモデルバージョンが失敗する

**対処法:**
```bash
# 地域別の利用可能なモデルを一覧表示する
az cognitiveservices model list --location eastus

# Bicep テンプレートのモデルバージョンを更新する
# モデルの容量要件を確認する
```

## サンプルテンプレート

### 基本的なチャットアプリケーション

**リポジトリ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**サービス**: Azure OpenAI + Cognitive Search + App Service

**クイックスタート**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ドキュメント処理パイプライン

**リポジトリ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**サービス**: Document Intelligence + Storage + Functions

**クイックスタート**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG を用いたエンタープライズチャット

**リポジトリ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**サービス**: Azure OpenAI + Search + Container Apps + Cosmos DB

**クイックスタート**:
```bash
azd init --template contoso-chat
azd up
```

## 次のステップ

1. **例を試す**: ユースケースに合った既成テンプレートから始める
2. **ニーズに合わせてカスタマイズ**: インフラとアプリケーションコードを変更する
3. **監視を追加**: 包括的な可観測性を実装する
4. **コストを最適化**: 予算に合わせて設定を微調整する
5. **デプロイを保護する**: エンタープライズ向けのセキュリティパターンを実装する
6. **本番へのスケールアウト**: マルチリージョンと高可用性機能を追加する

## 🎯 ハンズオン演習

### 演習 1: Azure OpenAI チャットアプリをデプロイ (30 分)
**目標**: 本番対応の AI チャットアプリをデプロイしてテストする

```bash
# テンプレートを初期化する
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# 環境変数を設定する
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# デプロイする
azd up

# アプリケーションをテストする
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AIの運用を監視する
azd monitor

# クリーンアップする
azd down --force --purge
```

**成功基準:**
- [ ] デプロイがクォータエラーなく完了する
- [ ] ブラウザでチャットインターフェイスにアクセスできる
- [ ] 質問をして AI による応答を得られる
- [ ] Application Insights にテレメトリデータが表示される
- [ ] リソースを正常にクリーンアップできる

**推定コスト**: $5-10（30 分のテスト）

### 演習 2: マルチモデルデプロイの構成 (45 分)
**目標**: 異なる設定で複数の AI モデルをデプロイする

```bash
# カスタム Bicep 構成を作成する
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# デプロイして検証する
azd provision
azd show
```

**成功基準:**
- [ ] 複数のモデルが正常にデプロイされる
- [ ] 異なる容量設定が適用されている
- [ ] モデルが API 経由でアクセス可能である
- [ ] アプリケーションから両方のモデルを呼び出せる

### 演習 3: コスト監視の実装 (20 分)
**目標**: 予算アラートとコスト追跡を設定する

```bash
# Bicep に予算アラートを追加する
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# 予算アラートをデプロイする
azd provision

# 現在のコストを確認する
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功基準:**
- [ ] Azure で予算アラートが作成されている
- [ ] メール通知が設定されている
- [ ] Azure ポータルでコストデータを確認できる
- [ ] 予算閾値が適切に設定されている

## 💡 よくある質問

<details>
<summary><strong>開発中の Azure OpenAI コストをどのように削減しますか？</strong></summary>

1. **無料枠を利用**: Azure OpenAI は月 50,000 トークンの無料枠を提供しています
2. **容量を減らす**: 開発では 30+ ではなく 10 TPM に設定する
3. **azd down を使用**: アクティブに開発していないときはリソースをデアロケートする
4. **レスポンスをキャッシュ**: 繰り返しのクエリには Redis キャッシュを実装する
5. **プロンプトエンジニアリングを活用**: 効率的なプロンプトでトークン使用量を削減する

```bash
# 開発環境の設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI と OpenAI API の違いは何ですか？</strong></summary>

**Azure OpenAI**:
- エンタープライズ向けのセキュリティとコンプライアンス
- プライベートネットワーク統合
- SLA 保証
- マネージド ID による認証
- より高いクォータが利用可能

**OpenAI API**:
- 新しいモデルへのより速いアクセス
- 簡単なセットアップ
- 参入障壁が低い
- 公共インターネットのみ

本番アプリには、**Azure OpenAI を推奨します**。
</details>

<details>
<summary><strong>Azure OpenAI のクォータ超過エラーをどのように対処しますか？</strong></summary>

```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus2

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 容量を一時的に削減する
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# クォータの増加をリクエストする
# Azure ポータル > クォータ > 増加のリクエストに移動する
```
</details>

<details>
<summary><strong>自分のデータを Azure OpenAI で使えますか？</strong></summary>

はい! RAG (Retrieval Augmented Generation) には **Azure AI Search** を使用します:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

テンプレートは [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) を参照してください。
</details>

<details>
<summary><strong>AI モデルのエンドポイントをどのように保護しますか？</strong></summary>

**ベストプラクティス**:
1. マネージド ID を使用する（API キーは使わない）
2. プライベートエンドポイントを有効にする
3. ネットワークセキュリティグループを設定する
4. レート制限を実装する
5. シークレットは Azure Key Vault を使用する

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

## コミュニティとサポート

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [公式ドキュメント](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: あなたの最初のプロジェクト](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 構成](../chapter-03-configuration/configuration.md)

**助けが必要ですか？** コミュニティのディスカッションに参加するか、リポジトリで issue を作成してください。Azure AI + AZD コミュニティはあなたの成功を支援します！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご注意ください。原文（原語の文書）が権威ある情報源とみなされます。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じた誤解や解釈の相違について、当社は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->