# Microsoft Foundry と AZD の統合

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: 最初のプロジェクト](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)

## 概要

本ガイドでは、Microsoft Foundry サービスと Azure Developer CLI (AZD) を統合し、AIアプリケーションの展開を効率化する方法を示します。Microsoft Foundry は AI アプリの構築・展開・管理のための総合プラットフォームを提供し、AZD はインフラストラクチャと展開プロセスを簡素化します。

## Microsoft Foundry とは？

Microsoft Foundry は Microsoft の統合 AI 開発プラットフォームで、以下を含みます:

- <strong>モデルカタログ</strong>: 最新のAIモデルへのアクセス
- <strong>プロンプトフロー</strong>: AI ワークフローのビジュアルデザイナー
- **Microsoft Foundry ポータル**: AI アプリケーションの統合開発環境
- <strong>デプロイ方法</strong>: 複数のホスティング・スケーリングオプション
- <strong>安全性とセキュリティ</strong>: 責任あるAI機能が組み込み済み

## AZD + Microsoft Foundry: 連携の利点

| 機能 | Microsoft Foundry | AZD 統合のメリット |
|---------|-----------------|------------------------|
| <strong>モデル展開</strong> | ポータルでの手動展開 | 自動かつ繰り返し可能な展開 |
| <strong>インフラストラクチャ</strong> | クリック操作によるプロビジョニング | Infrastructure as Code (Bicep) |
| <strong>環境管理</strong> | 単一環境フォーカス | 複数環境対応（開発・ステージング・本番） |
| **CI/CD 統合** | 限定的 | GitHub Actions ネイティブサポート |
| <strong>コスト管理</strong> | 基本的なモニタリング | 環境別のコスト最適化 |

## 前提条件

- 適切な権限を持つ Azure サブスクリプション
- Azure Developer CLI がインストール済み
- Microsoft Foundry Models サービスへのアクセス
- Microsoft Foundry の基本知識

> **現在の AZD ベースライン:** これらの例は `azd` `1.27.1` で検証済みです。AI エージェントワークフローには、最新のプレビュー拡張機能リリースを使用し、インストール済みバージョンを開始前に確認してください。

## コア統合パターン

### パターン1: Microsoft Foundry Models 統合

<strong>利用ケース</strong>: Microsoft Foundry Models のモデルでチャットアプリを展開

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
// Microsoft Foundry Models Account
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
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### パターン2: AI検索 + RAG 統合

<strong>利用ケース</strong>: 検索強化生成 (RAG) アプリケーションを展開

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

<strong>利用ケース</strong>: ドキュメント処理・分析ワークフロー

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

**本番環境設定:**
```bash
# コアAIサービス
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# モデル構成
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# パフォーマンス設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開発環境設定:**
```bash
# 開発のためのコスト最適化された設定
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

## デプロイメントワークフロー

### Foundry 向け AZD 拡張機能

AZD は Microsoft Foundry サービスでの AI 専用機能を追加する拡張機能を提供します:

```bash
# Foundryエージェント拡張機能をインストールする
azd extension install azure.ai.agents

# ファインチューニング拡張機能をインストールする
azd extension install azure.ai.finetune

# カスタムモデル拡張機能をインストールする
azd extension install azure.ai.models

# インストールされている拡張機能を一覧表示する
azd extension list --installed

# 現在インストールされているエージェント拡張機能のバージョンを確認する
azd extension show azure.ai.agents
```

AI 拡張機能はプレビュー版で急速に進化しています。ここに示す動作と違う場合は、関連拡張機能をアップグレードしてからプロジェクトのトラブルシュートを行ってください。

### `azd ai` を使ったエージェントファーストデプロイ

エージェントマニフェストがあれば、`azd ai agent init` を使い Foundry Agent Service に接続したプロジェクトをスキャフォールドします:

```bash
# エージェントマニフェストから初期化する
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azureにデプロイする
azd up
```

最近の `azure.ai.agents` プレビューリリースでは、`azd ai agent init` のテンプレートベース初期化サポートも追加されました。最新のエージェントサンプルを参照する場合は、インストール済みバージョンの拡張機能ヘルプで利用可能な正確なフラグを確認してください。

完全なコマンドリファレンスとフラグは [AZD AI CLI コマンド](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) を参照してください。

### 単一コマンドデプロイメント

```bash
# すべてを一つのコマンドでデプロイ
azd up

# または段階的にデプロイ
azd provision  # インフラストラクチャのみ
azd deploy     # アプリケーションのみ

# azd 1.23.11以降の長時間実行されるAIアプリのデプロイ用
azd deploy --timeout 1800
```

### 環境別デプロイメント

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

## 🔐 セキュリティベストプラクティス

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

### 問題1: OpenAI クォータ超過

**症状:**
- クォータエラーで展開失敗
- アプリケーションログに429エラー

**解決策:**
```bash
# 現在のクオータ使用量を確認する
az cognitiveservices usage list --location eastus

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 容量を一時的に減らす
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題2: 認証失敗

**症状:**
- AIサービス呼び出し時に401/403エラー
- 「アクセス拒否」メッセージ

**解決策:**
```bash
# ロール割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 管理された ID の構成を確認する
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# キーボルトのアクセスを検証する
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題3: モデル展開問題

**症状:**
- モデルが展開に現れない
- 特定のモデルバージョンで失敗

**解決策:**
```bash
# 地域別の利用可能なモデルを一覧表示する
az cognitiveservices model list --location eastus

# bicepテンプレートのモデルバージョンを更新する
# モデルの容量要件を確認する
```

## サンプルテンプレート

### RAG チャットアプリケーション（Python）

<strong>リポジトリ</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>サービス</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>説明</strong>: 最も人気のある Azure AI サンプル。自分のドキュメントに質問できる本番対応の RAG チャットアプリ。チャットには GPT-4.1-mini、埋め込みは text-embedding-3-large、検索に Azure AI Search を利用。マルチモーダルドキュメント、音声入出力、Microsoft Entra 認証、Application Insights トレースをサポート。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG チャットアプリ (.NET)

<strong>リポジトリ</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>サービス</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>説明</strong>: Python RAGチャットの .NET/C# 版。ASP.NET Core Minimal API と Blazor WebAssembly フロントエンドで構築。音声チャット、GPT-4o-mini ビジョンサポート、.NET MAUI Blazor ハイブリッドのデスクトップ/モバイルクライアントを含む。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG チャットアプリ (Java)

<strong>リポジトリ</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>サービス</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>説明</strong>: Java 版 RAG チャットサンプルで、AI オーケストレーションに Langchain4J を使用。マイクロサービスイベント駆動アーキテクチャ、複数検索戦略（テキスト、ベクター、ハイブリッド）、Azure Document Intelligence のドキュメントアップロード、Azure Container Apps または Azure Kubernetes Service への展開をサポート。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry を用いたエンタープライズ小売コパイロット

<strong>リポジトリ</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>サービス</strong>: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>説明</strong>: Microsoft Foundry と Prompty を使ったエンドツーエンド小売RAGコパイロット。Contoso Outdoor 小売チャットボットで、製品カタログや顧客注文データに基づいて応答。GenAIOps ワークフロー全体を示し、Prompty でプロトタイプ作成、AI支援評価者で評価、AZD経由で Container Apps にデプロイ。

<strong>クイックスタート</strong>:
```bash
azd init --template contoso-chat
azd up
```

### クリエイティブライティング マルチエージェントアプリケーション

<strong>リポジトリ</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>サービス</strong>: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>説明</strong>: Prompty を用いた AI エージェントオーケストレーションのマルチエージェントサンプル。調査エージェント（Bing Grounding in Azure AI Agent Service）、製品エージェント（Azure AI Search）、ライターエージェント、編集者エージェントで協力して調査済み記事を生成。GitHub Actions で評価を含むCI/CDを提供。

<strong>クイックスタート</strong>:
```bash
azd init --template contoso-creative-writer
azd up
```

### サーバーレス RAG チャット (JavaScript/TypeScript)

<strong>リポジトリ</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>サービス</strong>: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>説明</strong>: Azure Functions を API として、Azure Static Web Apps でホスティングする完全サーバーレスの RAG チャットボット。Azure Cosmos DB はベクターストアとチャット履歴データベースの両方で使用。Ollama によるローカル開発がゼロコストで可能。

<strong>クイックスタート</strong>:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data ソリューションアクセラレータ

<strong>リポジトリ</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>サービス</strong>: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>説明</strong>: エンタープライズ対応の RAG ソリューションアクセラレータで、ドキュメントアップロード/管理用管理ポータル、複数オーケストレータオプション（Semantic Kernel、LangChain、Prompt Flow）、音声からテキスト変換、Microsoft Teams 統合、PostgreSQL または Cosmos DB バックエンドを選択可能。実運用の RAG シナリオ向けのカスタマイズ可能な出発点。

<strong>クイックスタート</strong>:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅行エージェント — マルチエージェント MCP オーケストレーション

<strong>リポジトリ</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>サービス</strong>: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP サーバー (.NET, Python, Java, TypeScript)

<strong>説明</strong>: 3つのフレームワーク（LangChain.js、LlamaIndex.TS、Microsoft Agent Framework）を用いたマルチエージェント AI オーケストレーションのリファレンスアプリ。4言語で展開される MCP (Model Context Protocol) サーバーをサーバーレス Azure Container Apps として動作し、OpenTelemetry によるモニタリングを搭載。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI スターター

<strong>リポジトリ</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>サービス</strong>: Azure AI サービス + Azure OpenAI

<strong>説明</strong>: 機械学習モデルを設定して Azure AI サービスをデプロイする最小限の Bicep テンプレート。完全なアプリケーションスタックを必要とせず、Azure AI インフラのみをプロビジョニングしたい場合の軽量な出発点。

<strong>クイックスタート</strong>:
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>さらにテンプレートを見る</strong>: 言語やシナリオ別に80以上の AI 専用 AZD テンプレートが揃う [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) を訪問してください。

## 次のステップ

1. <strong>例を試す</strong>: 利用ケースに合う既成テンプレートから始める
2. <strong>ニーズに合わせてカスタマイズ</strong>: インフラとアプリコードを修正
3. <strong>モニタリング追加</strong>: 包括的な可観測性を実装
4. <strong>コスト最適化</strong>: 予算に応じて設定を調整
5. <strong>デプロイのセキュリティ強化</strong>: エンタープライズセキュリティパターンを導入
6. <strong>本番スケールへ</strong>: 複数リージョンや高可用性の機能追加

## 🎯 ハンズオン演習

### 演習1: Microsoft Foundry Models チャットアプリ展開 (30分)
<strong>目的</strong>: 本番対応の AI チャットアプリを展開・テストする

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

# AIの操作を監視する
azd monitor

# クリーンアップする
azd down --force --purge
```

**達成基準:**
- [ ] クォータエラーなく展開が完了
- [ ] ブラウザからチャットインターフェースにアクセス可能
- [ ] 質問し AI 応答を得られる
- [ ] Application Insights にテレメトリーデータが表示される
- [ ] リソースを正常にクリーンアップできる

<strong>概算コスト</strong>: 30分のテストで5～10ドル

### 演習2: 複数モデルのデプロイ設定 (45分)
<strong>目的</strong>: 異なる設定で複数の AI モデルを展開する

```bash
# カスタムBicep構成を作成する
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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

**達成基準:**
- [ ] 複数モデルが正常に展開される
- [ ] 異なるキャパシティ設定が適用される
- [ ] API 経由でモデルにアクセス可能
- [ ] アプリケーションから両モデルを呼び出せる

### 演習3: コスト監視の実装 (20分)
<strong>目的</strong>: 予算アラートとコスト追跡を設定する

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

# 予算アラートを展開する
azd provision

# 現在の費用を確認する
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**達成基準:**
- [ ] Azure に予算アラートを作成
- [ ] メール通知を設定
- [ ] Azure ポータルでコストデータを閲覧可能
- [ ] 適切に予算閾値を設定

## 💡 よくある質問

<details>
<summary><strong>開発中に Microsoft Foundry Models のコストを減らすには？</strong></summary>

1. <strong>無料プランを利用</strong>: Microsoft Foundry Models は月間50,000トークン無料
2. <strong>キャパシティを下げる</strong>: 開発用には30以上ではなく10 TPM に設定
3. **`azd down` を使う**: 開発していない時はリソースを解放
4. <strong>レスポンスのキャッシュ</strong>: 繰り返しクエリに Redis キャッシュを導入
5. <strong>プロンプトエンジニアリング活用</strong>: 効率的なプロンプトでトークン使用量を削減


```bash
# 開発設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models と OpenAI API の違いは何ですか？</strong></summary>

**Microsoft Foundry Models**:
- エンタープライズのセキュリティとコンプライアンス
- プライベートネットワーク統合
- SLA 保証
- マネージド ID 認証
- より高いクォータが利用可能

**OpenAI API**:
- 新しいモデルへのより速いアクセス
- より簡単なセットアップ
- 参入障壁が低い
- 公共のインターネットのみ

本番アプリケーションには、**Microsoft Foundry Models を推奨します**。
</details>

<details>
<summary><strong>Microsoft Foundry Models のクォータ超過エラーをどのように対処しますか？</strong></summary>

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
# Azure ポータル > クォータ > 増加をリクエスト に移動する
```
</details>

<details>
<summary><strong>Microsoft Foundry Models で自分のデータを使えますか？</strong></summary>

はい！RAG（Retrieval Augmented Generation）には **Azure AI Search** を使います：

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
<summary><strong>AI モデルのエンドポイントをどのように保護しますか？</strong></summary>

<strong>ベストプラクティス</strong>:
1. マネージド ID を使用する（API キー不要）
2. プライベートエンドポイントを有効化
3. ネットワークセキュリティグループを構成
4. レートリミットを実装
5. Azure Key Vault でシークレットを管理

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
- **Agent Skills**: [skills.sh 上の Microsoft Foundry スキル](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - エディターに Azure + Foundry エージェントスキルを `npx skills add microsoft/github-copilot-for-azure` でインストール

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章：あなたの最初のプロジェクト](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **🚀 次章**: [第3章：構成](../chapter-03-configuration/configuration.md)

**ヘルプが必要ですか？** コミュニティディスカッションに参加するか、リポジトリでイシューを開いてください。Azure AI + AZD コミュニティが成功をサポートします！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->