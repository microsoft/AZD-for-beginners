<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T14:12:07+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "ja"
}
-->
# Azure AI FoundryとAZDの統合

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: 初めてのプロジェクト](../getting-started/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 設定](../getting-started/configuration.md)

## 概要

このガイドでは、Azure AI FoundryサービスをAzure Developer CLI (AZD)と統合し、AIアプリケーションのデプロイを効率化する方法を説明します。Azure AI FoundryはAIアプリケーションの構築、デプロイ、管理を包括的にサポートするプラットフォームであり、AZDはインフラとデプロイプロセスを簡素化します。

## Azure AI Foundryとは？

Azure AI Foundryは、Microsoftが提供するAI開発の統合プラットフォームで、以下を含みます:

- **モデルカタログ**: 最先端のAIモデルへのアクセス
- **プロンプトフロー**: AIワークフローのビジュアルデザイナー
- **AI Foundryポータル**: AIアプリケーションの統合開発環境
- **デプロイオプション**: 多様なホスティングとスケーリングオプション
- **安全性とセキュリティ**: 責任あるAI機能の組み込み

## AZD + Azure AI Foundry: 組み合わせのメリット

| 機能 | Azure AI Foundry | AZD統合のメリット |
|------|------------------|------------------|
| **モデルデプロイ** | ポータルでの手動デプロイ | 自動化された再現可能なデプロイ |
| **インフラ** | クリック操作でのプロビジョニング | コードとしてのインフラ (Bicep) |
| **環境管理** | 単一環境に焦点 | 複数環境 (開発/ステージング/本番) |
| **CI/CD統合** | 限定的 | GitHub Actionsのネイティブサポート |
| **コスト管理** | 基本的なモニタリング | 環境別のコスト最適化 |

## 前提条件

- 適切な権限を持つAzureサブスクリプション
- Azure Developer CLIのインストール済み
- Azure OpenAIサービスへのアクセス
- Azure AI Foundryの基本的な知識

## コア統合パターン

### パターン1: Azure OpenAI統合

**ユースケース**: Azure OpenAIモデルを使用したチャットアプリケーションのデプロイ

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

**インフラ (main.bicep):**
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

### パターン2: AI検索 + RAG統合

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

### パターン3: ドキュメントインテリジェンス統合

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
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開発環境の設定:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vaultを使用した安全な設定

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
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### 環境別のデプロイ

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## モニタリングと可観測性

### Application Insights統合

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

### マネージドIDの設定

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

### 自動スケーリングの設定

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

### 問題1: OpenAIのクォータ超過

**症状:**
- クォータエラーでデプロイが失敗
- アプリケーションログに429エラー

**解決策:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題2: 認証失敗

**症状:**
- AIサービス呼び出し時の401/403エラー
- 「アクセス拒否」のメッセージ

**解決策:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題3: モデルデプロイの問題

**症状:**
- デプロイでモデルが利用できない
- 特定のモデルバージョンが失敗

**解決策:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
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

### RAGを活用したエンタープライズチャット

**リポジトリ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**サービス**: Azure OpenAI + Search + Container Apps + Cosmos DB

**クイックスタート**:
```bash
azd init --template contoso-chat
azd up
```

## 次のステップ

1. **サンプルを試す**: ユースケースに合ったテンプレートから始める
2. **ニーズに合わせてカスタマイズ**: インフラとアプリケーションコードを修正
3. **モニタリングを追加**: 包括的な可観測性を実装
4. **コストを最適化**: 予算に合わせた設定を調整
5. **デプロイを安全に**: エンタープライズセキュリティパターンを実装
6. **本番環境へスケール**: マルチリージョンと高可用性機能を追加

## コミュニティとサポート

- **Azure AI Foundry Discord**: [#Azureチャンネル](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [課題とディスカッション](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [公式ドキュメント](https://learn.microsoft.com/azure/ai-studio/)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: 初めてのプロジェクト](../getting-started/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 設定](../getting-started/configuration.md)

**ヘルプが必要ですか？** コミュニティディスカッションに参加するか、リポジトリで課題をオープンしてください。Azure AI + AZDコミュニティが成功をサポートします！

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。