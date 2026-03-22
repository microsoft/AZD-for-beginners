# Microsoft Foundry と AZD の統合

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 次の章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## 概要

本ガイドでは、Microsoft Foundry サービスを Azure Developer CLI (AZD) と統合して、AI アプリケーションのデプロイを効率化する方法を示します。Microsoft Foundry は AI アプリケーションの構築、デプロイ、管理のための包括的なプラットフォームを提供し、AZD はインフラストラクチャとデプロイのプロセスを簡素化します。

## Microsoft Foundry とは？

Microsoft Foundry は Microsoft の統合された AI 開発プラットフォームで、以下を含みます:

- **Model Catalog**: 最先端の AI モデルへのアクセス
- **Prompt Flow**: AI ワークフローのビジュアルデザイナー
- **Microsoft Foundry Portal**: AI アプリケーションのための統合開発環境
- **Deployment Options**: 複数のホスティングおよびスケーリングオプション
- **Safety and Security**: 組み込みの責任ある AI 機能

## AZD + Microsoft Foundry: 連携による利点

| 機能 | Microsoft Foundry | AZD 統合の利点 |
|---------|-----------------|------------------------|
| **Model Deployment** | マニュアルのポータルデプロイ | 自動化された再現可能なデプロイ |
| **Infrastructure** | クリックでのプロビジョニング | Infrastructure as Code (Bicep) |
| **Environment Management** | 単一環境フォーカス | マルチ環境（dev/staging/prod） |
| **CI/CD Integration** | 限定的 | ネイティブな GitHub Actions サポート |
| **Cost Management** | 基本的なモニタリング | 環境別のコスト最適化 |

## 前提条件

- 適切な権限を持つ Azure サブスクリプション
- Azure Developer CLI がインストール済みであること
- Microsoft Foundry Models サービスへのアクセス
- Microsoft Foundry に関する基本的な知識

## コア統合パターン

### パターン 1: Microsoft Foundry Models の統合

<strong>ユースケース</strong>: Microsoft Foundry Models を使用したチャットアプリケーションのデプロイ

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

<strong>ユースケース</strong>: リトリーバル拡張生成（RAG）アプリケーションのデプロイ

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

<strong>ユースケース</strong>: ドキュメントの処理および解析ワークフロー

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

### 環境変数のセットアップ

**本番構成:**
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

**開発構成:**
```bash
# 開発向けのコスト最適化設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 無料枠
```

### Key Vault を使ったセキュアな構成

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

### Foundry 用 AZD 拡張機能

AZD は Microsoft Foundry サービスと連携して AI 固有の機能を追加する拡張機能を提供します:

```bash
# Foundry Agents 拡張機能をインストールする
azd extension install azure.ai.agents

# ファインチューニング拡張機能をインストールする
azd extension install azure.ai.finetune

# カスタムモデル拡張機能をインストールする
azd extension install azure.ai.models

# インストール済み拡張機能を一覧表示する
azd extension list
```

### `azd ai` を使ったエージェントファーストのデプロイ

エージェントマニフェストがある場合は、`azd ai agent init` を使用して Foundry Agent Service に接続されたプロジェクトのスキャフォールドを作成します:

```bash
# エージェントのマニフェストから初期化する
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure にデプロイする
azd up
```

フルコマンド参照とフラグについては [AZD AI CLI コマンド](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) を参照してください。

### 単一コマンドでのデプロイ

```bash
# 1つのコマンドですべてをデプロイ
azd up

# または段階的にデプロイ
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

## モニタリングと可観測性

### Application Insights の統合

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

### マネージドID の構成

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

### 問題 1: OpenAI クォータ超過

**症状:**
- デプロイがクォータエラーで失敗する
- アプリケーションログで 429 エラーが発生する

**解決策:**
```bash
# 現在のクォータ使用状況を確認する
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
- AI サービス呼び出し時に 401/403 エラー
- "Access denied" メッセージ

**解決策:**
```bash
# ロール割り当てを検証する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# マネージド ID の構成を確認する
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault へのアクセスを検証する
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3: モデルのデプロイ問題

**症状:**
- デプロイにモデルが利用できない
- 特定モデルバージョンが失敗する

**解決策:**
```bash
# 地域別の利用可能なモデルを一覧表示する
az cognitiveservices model list --location eastus

# Bicep テンプレート内のモデルバージョンを更新する
# モデルの容量要件を確認する
```

## サンプルテンプレート

### RAG チャットアプリケーション (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>説明</strong>: 最も人気のある Azure AI サンプル — 本番対応の RAG チャットアプリで、自身のドキュメントに関して質問できます。チャットには GPT-4.1-mini、埋め込みには text-embedding-ada-002、検索には Azure AI Search を使用します。マルチモーダルドキュメント、音声入出力、Microsoft Entra 認証、Application Insights トレースをサポートします。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG チャットアプリケーション (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>説明</strong>: Python RAG チャットサンプルの .NET/C# 相当。ASP.NET Core Minimal API と Blazor WebAssembly フロントエンドで構築されています。ボイスチャット、GPT-4o-mini vision サポート、および同梱の .NET MAUI Blazor ハイブリッドのデスクトップ/モバイルクライアントを含みます。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG チャットアプリケーション (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>説明</strong>: Langchain4J を使用した RAG チャットサンプルの Java 版。マイクロサービスのイベント駆動アーキテクチャ、複数の検索戦略（テキスト、ベクター、ハイブリッド）、Azure Document Intelligence を使ったドキュメントアップロード、および Azure Container Apps または Azure Kubernetes Service 上へのデプロイをサポートします。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>説明</strong>: Azure AI Foundry と Prompty を利用したエンドツーエンドの小売 RAG コパイロット。Contoso Outdoor 小売店向けチャットボットで、製品カタログと顧客注文データに基づいた応答を行います。プロトタイプは Prompty、評価は AI 支援の評価者で行い、AZD を介して Container Apps にデプロイする GenAIOps ワークフローを示します。

<strong>クイックスタート</strong>:
```bash
azd init --template contoso-chat
azd up
```

### クリエイティブライティング マルチエージェントアプリケーション

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>説明</strong>: Prompty を使ったエージェントオーケストレーションを示すマルチエージェントサンプル。リサーチエージェント（Bing Grounding in Azure AI Agent Service）、プロダクトエージェント（Azure AI Search）、ライターエージェント、エディターエージェントが協調して、十分に調査された記事を生成します。GitHub Actions を使った CI/CD と評価を含みます。

<strong>クイックスタート</strong>:
```bash
azd init --template contoso-creative-writer
azd up
```

### サーバーレス RAG チャット (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>説明</strong>: LangChain.js を使用した完全サーバーレスの RAG チャットボット。API に Azure Functions、ホスティングに Azure Static Web Apps を使用します。Azure Cosmos DB をベクターストアとチャット履歴データベースの両方として使用します。ローカル開発では Ollama を使った無償テストをサポートします。

<strong>クイックスタート</strong>:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>説明</strong>: ドキュメントアップロード/管理用の管理ポータルを備えたエンタープライズ対応の RAG ソリューションアクセラレータ。複数のオーケストレータオプション（Semantic Kernel、LangChain、Prompt Flow）、音声からテキスト、Microsoft Teams 統合、および PostgreSQL または Cosmos DB バックエンドの選択肢を提供します。プロダクション向け RAG シナリオのカスタマイズ可能な出発点として設計されています。

<strong>クイックスタート</strong>:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI トラベルエージェント — マルチエージェント MCP オーケストレーション

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

<strong>説明</strong>: LangChain.js、LlamaIndex.TS、Microsoft Agent Framework の 3 つのフレームワークを使ったマルチエージェント AI オーケストレーションのリファレンスアプリケーション。MCP（Model Context Protocol）サーバーを 4 言語で提供し、サーバーレスの Azure Container Apps としてデプロイ、OpenTelemetry によるモニタリングを備えています。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

<strong>説明</strong>: 構成済みの機械学習モデルで Azure AI サービスをデプロイする最小限の Bicep テンプレート。フルアプリケーションスタックが不要で、Azure AI インフラのみをプロビジョニングしたい場合の軽量な出発点です。

<strong>クイックスタート</strong>:
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>さらにテンプレートを参照</strong>: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) を訪れて、言語やシナリオ別の 80+ の AI 特化 AZD テンプレートを参照してください。

## 次のステップ

1. <strong>サンプルを試す</strong>: ユースケースに合った事前構築テンプレートから始める
2. <strong>ニーズに合わせてカスタマイズ</strong>: インフラとアプリケーションコードを修正する
3. <strong>モニタリングを追加</strong>: 包括的な可観測性を実装する
4. <strong>コストを最適化</strong>: 予算に合わせた設定を微調整する
5. <strong>デプロイを保護</strong>: エンタープライズ向けのセキュリティパターンを適用する
6. <strong>本番スケールへ</strong>: マルチリージョンおよび高可用性の機能を追加する

## 🎯 実践演習

### 演習 1: Microsoft Foundry Models チャットアプリをデプロイ (30 分)
<strong>目標</strong>: 本番対応の AI チャットアプリケーションをデプロイし、テストする

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
- [ ] 質問して AI による応答が得られる
- [ ] Application Insights にテレメトリデータが表示される
- [ ] リソースが正常にクリーンアップされる

<strong>推定コスト</strong>: テスト 30 分で $5-10

### 演習 2: マルチモデルデプロイの構成 (45 分)
<strong>目標</strong>: 異なる構成で複数の AI モデルをデプロイする

```bash
# カスタムのBicep構成を作成する
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
- [ ] 複数のモデルが正常にデプロイされている
- [ ] 異なるキャパシティ設定が適用されている
- [ ] モデルが API 経由でアクセス可能である
- [ ] アプリケーションから両方のモデルを呼び出せる

### 演習 3: コスト監視の実装 (20 分)
<strong>目標</strong>: 予算アラートとコスト追跡を設定する

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
- [ ] 電子メール通知が構成されている
- [ ] Azure ポータルでコストデータを表示できる
- [ ] 予算閾値が適切に設定されている

## 💡 よくある質問

<details>
<summary><strong>Microsoft Foundry Models の開発中のコストをどのように削減できますか？</strong></summary>

1. <strong>フリーティアを利用する</strong>: Microsoft Foundry Models は月額 50,000 トークンを無料で提供します
2. <strong>容量を減らす</strong>: 開発では 30+ ではなく 10 TPM に設定する
3. **azd down を使用する**: アクティブに開発していないときはリソースを解放する
4. <strong>レスポンスをキャッシュする</strong>: 繰り返しのクエリには Redis キャッシュを実装する
5. <strong>プロンプトエンジニアリングを活用する</strong>: 効率的なプロンプトでトークン使用量を削減する

```bash
# 開発用の設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models と OpenAI API の違いは何ですか？</strong></summary>

**Microsoft Foundry Models**:
- エンタープライズ向けのセキュリティとコンプライアンス
- プライベートネットワーク統合
- SLA の保証
- マネージド ID 認証
- より高いクォータが利用可能

**OpenAI API**:
- 新しいモデルへのより速いアクセス
- より簡単なセットアップ
- 参入障壁が低い
- 公開インターネットのみ

本番アプリケーションには、<strong>Microsoft Foundry Models を推奨</strong>します。
</details>

<details>
<summary><strong>Microsoft Foundry Models のクォータ超過エラーをどのように対処しますか?</strong></summary>

```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus2

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 容量を一時的に減らす
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# クォータの増加をリクエストする
# Azure ポータル > クォータ > 増加のリクエストに移動する
```
</details>

<details>
<summary><strong>Microsoft Foundry Models で自分のデータを使用できますか?</strong></summary>

はい！RAG（Retrieval Augmented Generation）には **Azure AI Search** を使用してください:

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
<summary><strong>AI モデルのエンドポイントをどのように保護しますか?</strong></summary>

<strong>ベストプラクティス</strong>:
1. Managed Identity（API キーを使用しない）を使用する
2. プライベートエンドポイントを有効にする
3. ネットワークセキュリティグループを構成する
4. レート制限を実装する
5. 機密情報には Azure Key Vault を使用する

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
- **AZD GitHub**: [Issues とディスカッション](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [公式ドキュメント](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh の Microsoft Foundry スキル](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - エディタに Azure + Foundry エージェントスキルをインストールするには `npx skills add microsoft/github-copilot-for-azure`

---

**章ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [第1章: あなたの最初のプロジェクト](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AI モデルのデプロイ](ai-model-deployment.md)
- **🚀 次の章**: [第3章: 構成](../chapter-03-configuration/configuration.md)

**助けが必要ですか？** コミュニティのディスカッションに参加するか、リポジトリで Issue を開いてください。Azure AI + AZD コミュニティは、あなたの成功を支援するためにここにあります！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めておりますが、自動翻訳は誤りや不正確さを含む可能性があることをご承知おきください。原文（原言語の文書）を正式な信頼できる情報源と見なしてください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用に起因するいかなる誤解や誤訳についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->