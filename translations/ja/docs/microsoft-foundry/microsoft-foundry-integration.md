<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-19T22:00:49+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "ja"
}
-->
# Microsoft Foundry と AZD の統合

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: 初めてのプロジェクト](../getting-started/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 設定](../getting-started/configuration.md)

## 概要

このガイドでは、Microsoft Foundry サービスを Azure Developer CLI (AZD) と統合し、AI アプリケーションのデプロイを効率化する方法を説明します。Microsoft Foundry は AI アプリケーションの構築、デプロイ、管理を包括的にサポートするプラットフォームであり、AZD はインフラストラクチャとデプロイプロセスを簡素化します。

## Microsoft Foundry とは？

Microsoft Foundry は、AI 開発のための Microsoft の統合プラットフォームで、以下を含みます:

- **モデルカタログ**: 最先端の AI モデルへのアクセス
- **プロンプトフロー**: AI ワークフローのビジュアルデザイナー
- **AI Foundry ポータル**: AI アプリケーションの統合開発環境
- **デプロイオプション**: 多様なホスティングとスケーリングオプション
- **安全性とセキュリティ**: 責任ある AI 機能を内蔵

## AZD + Microsoft Foundry: 組み合わせのメリット

| 機能 | Microsoft Foundry | AZD 統合のメリット |
|---------|-----------------|------------------------|
| **モデルデプロイ** | ポータルでの手動デプロイ | 自動化された再現可能なデプロイ |
| **インフラストラクチャ** | クリック操作でのプロビジョニング | コードとしてのインフラ (Bicep) |
| **環境管理** | 単一環境にフォーカス | 複数環境 (開発/ステージング/本番) |
| **CI/CD 統合** | 限定的 | ネイティブな GitHub Actions サポート |
| **コスト管理** | 基本的なモニタリング | 環境別のコスト最適化 |

## 前提条件

- 適切な権限を持つ Azure サブスクリプション
- Azure Developer CLI のインストール
- Azure OpenAI サービスへのアクセス
- Microsoft Foundry の基本的な知識

## コア統合パターン

### パターン 1: Azure OpenAI 統合

**ユースケース**: Azure OpenAI モデルを使用したチャットアプリケーションのデプロイ

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

**インフラストラクチャ (main.bicep):**
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

### パターン 2: AI 検索 + RAG 統合

**ユースケース**: 検索強化生成 (RAG) アプリケーションのデプロイ

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

**ユースケース**: ドキュメント処理と分析ワークフロー

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
# 開発用のコスト最適化設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 無料枠
```

### Key Vault を使用したセキュアな設定

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
# すべてを1つのコマンドでデプロイ
azd up

# または段階的にデプロイ
azd provision  # インフラのみ
azd deploy     # アプリケーションのみ
```

### 環境別のデプロイ

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

## モニタリングと可観測性

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

### コストモニタリング

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

### マネージド ID 設定

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

### キャッシュ戦略

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

### 自動スケーリング設定

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

### 問題 1: OpenAI のクォータ超過

**症状:**
- デプロイがクォータエラーで失敗
- アプリケーションログに 429 エラー

**解決策:**
```bash
# 現在のクォータ使用量を確認する
az cognitiveservices usage list --location eastus

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 一時的に容量を減らす
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題 2: 認証エラー

**症状:**
- AI サービス呼び出し時の 401/403 エラー
- 「アクセス拒否」のメッセージ

**解決策:**
```bash
# ロールの割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 管理対象IDの構成を確認する
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vaultのアクセスを検証する
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3: モデルデプロイの問題

**症状:**
- デプロイにモデルが利用できない
- 特定のモデルバージョンが失敗

**解決策:**
```bash
# 地域ごとに利用可能なモデルを一覧表示
az cognitiveservices model list --location eastus

# bicepテンプレートでモデルバージョンを更新
# モデルの容量要件を確認
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

### RAG を活用したエンタープライズチャット

**リポジトリ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**サービス**: Azure OpenAI + Search + Container Apps + Cosmos DB

**クイックスタート**:
```bash
azd init --template contoso-chat
azd up
```

## 次のステップ

1. **サンプルを試す**: ユースケースに合ったテンプレートから始める
2. **ニーズに合わせてカスタマイズ**: インフラストラクチャとアプリケーションコードを修正
3. **モニタリングを追加**: 包括的な可観測性を実装
4. **コストを最適化**: 予算に合わせて設定を調整
5. **デプロイをセキュアに**: エンタープライズセキュリティパターンを実装
6. **本番環境にスケール**: マルチリージョンと高可用性機能を追加

## 🎯 実践演習

### 演習 1: Azure OpenAI チャットアプリのデプロイ (30分)
**目標**: 本番対応の AI チャットアプリケーションをデプロイしてテスト

```bash
# テンプレートを初期化
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# 環境変数を設定
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# デプロイ
azd up

# アプリケーションをテスト
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AIの操作を監視
azd monitor

# クリーンアップ
azd down --force --purge
```

**成功基準:**
- [ ] クォータエラーなしでデプロイが完了
- [ ] ブラウザでチャットインターフェースにアクセス可能
- [ ] 質問をして AI の応答を得られる
- [ ] Application Insights にテレメトリデータが表示される
- [ ] リソースを正常にクリーンアップ

**推定コスト**: テスト30分で $5-10

### 演習 2: マルチモデルデプロイの設定 (45分)
**目標**: 異なる設定で複数の AI モデルをデプロイ

```bash
# カスタムBicep構成を作成する
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

# デプロイして確認する
azd provision
azd show
```

**成功基準:**
- [ ] 複数のモデルが正常にデプロイ
- [ ] 異なるキャパシティ設定が適用
- [ ] モデルが API 経由でアクセス可能
- [ ] アプリケーションから両方のモデルを呼び出せる

### 演習 3: コストモニタリングの実装 (20分)
**目標**: 予算アラートとコスト追跡を設定

```bash
# Bicepに予算アラートを追加する
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
- [ ] Azure で予算アラートを作成
- [ ] メール通知を設定
- [ ] Azure ポータルでコストデータを確認可能
- [ ] 適切な予算閾値を設定

## 💡 よくある質問

<details>
<summary><strong>開発中に Azure OpenAI のコストを削減するには？</strong></summary>

1. **無料枠を利用**: Azure OpenAI は月50,000トークン無料
2. **キャパシティを削減**: 開発用に 10 TPM に設定
3. **azd down を使用**: 開発中でないときにリソースを解放
4. **レスポンスをキャッシュ**: 繰り返しのクエリに Redis キャッシュを実装
5. **プロンプトエンジニアリングを活用**: 効率的なプロンプトでトークン使用を削減

```bash
# 開発構成
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI と OpenAI API の違いは？</strong></summary>

**Azure OpenAI**:
- エンタープライズ向けのセキュリティとコンプライアンス
- プライベートネットワーク統合
- SLA 保証
- マネージド ID 認証
- 高いクォータが利用可能

**OpenAI API**:
- 新しいモデルへの迅速なアクセス
- シンプルなセットアップ
- 低い参入障壁
- 公共インターネットのみ

本番アプリケーションには、**Azure OpenAI が推奨されます**。
</details>

<details>
<summary><strong>Azure OpenAI のクォータ超過エラーをどう対処する？</strong></summary>

```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus2

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 一時的に容量を減らす
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# クォータの増加をリクエストする
# Azureポータル > クォータ > 増加をリクエスト に移動する
```
</details>

<details>
<summary><strong>Azure OpenAI で自分のデータを使用できますか？</strong></summary>

はい！**Azure AI Search** を使用して RAG (検索強化生成) を実現できます:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) テンプレートをご覧ください。
</details>

<details>
<summary><strong>AI モデルのエンドポイントをどのようにセキュアにしますか？</strong></summary>

**ベストプラクティス**:
1. マネージド ID を使用 (API キー不要)
2. プライベートエンドポイントを有効化
3. ネットワークセキュリティグループを設定
4. レート制限を実装
5. Azure Key Vault を使用してシークレットを管理

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

- **Microsoft Foundry Discord**: [#Azure チャンネル](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [課題とディスカッション](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [公式ドキュメント](https://learn.microsoft.com/azure/ai-studio/)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: 初めてのプロジェクト](../getting-started/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 設定](../getting-started/configuration.md)

**お困りですか？** コミュニティディスカッションに参加するか、リポジトリで課題を作成してください。Azure AI + AZD コミュニティが成功をサポートします！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）が公式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳をお勧めします。この翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->