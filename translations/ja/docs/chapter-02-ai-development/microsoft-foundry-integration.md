# Microsoft Foundry と AZD の統合

**Chapter Navigation:**
- **📚 コース ホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前の章**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ 次へ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 次の章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## 概要

このガイドでは、Microsoft Foundry サービスを Azure Developer CLI (AZD) と統合して、AI アプリケーションのデプロイを効率化する方法を示します。Microsoft Foundry は AI アプリケーションの構築、デプロイ、管理のための包括的なプラットフォームを提供し、AZD はインフラストラクチャとデプロイのプロセスを簡素化します。

## Microsoft Foundryとは？

Microsoft Foundry は、AI 開発のための統合プラットフォームで、以下を含みます:

- **Model Catalog**: 最新の AI モデルへのアクセス
- **Prompt Flow**: AI ワークフローのためのビジュアルデザイナー
- **Microsoft Foundry Portal**: AI アプリケーション向けの統合開発環境
- **Deployment Options**: 複数のホスティングおよびスケーリングオプション
- **Safety and Security**: 責任ある AI 機能の組み込み

## AZD + Microsoft Foundry：より良い連携

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | 手動のポータルでのデプロイ | 自動化され再現可能なデプロイ |
| **Infrastructure** | クリックでのプロビジョニング | Infrastructure as Code (Bicep) |
| **Environment Management** | 単一環境フォーカス | マルチ環境 (dev/staging/prod) |
| **CI/CD Integration** | 制限あり | GitHub Actions のネイティブサポート |
| **Cost Management** | 基本的な監視 | 環境別のコスト最適化 |

## 前提条件

- 適切な権限を持つ Azure サブスクリプション
- Azure Developer CLI がインストールされていること
- Microsoft Foundry Models サービスへのアクセス
- Microsoft Foundry の基本的な理解

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## コア統合パターン

### パターン1: Microsoft Foundry Models 統合

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

### パターン2: AI Search + RAG 統合

<strong>ユースケース</strong>: 検索強化生成 (RAG) アプリケーションのデプロイ

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

<strong>ユースケース</strong>: ドキュメント処理と解析のワークフロー

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

**本番構成:**
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

**開発構成:**
```bash
# 開発向けのコスト最適化設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 無料枠
```

### Key Vault を使った安全な構成

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

## デプロイ ワークフロー

### Foundry 用の AZD 拡張機能

AZD は Microsoft Foundry サービスを扱うための AI 特化機能を追加する拡張機能を提供します:

```bash
# Foundry agents 拡張機能をインストールする
azd extension install azure.ai.agents

# ファインチューニング拡張機能をインストールする
azd extension install azure.ai.finetune

# カスタムモデル拡張機能をインストールする
azd extension install azure.ai.models

# インストール済みの拡張機能を一覧表示する
azd extension list --installed

# 現在インストールされているエージェント拡張機能のバージョンを確認する
azd extension show azure.ai.agents
```

AI 拡張はプレビュー段階で急速に進化しています。ここで示した通りにコマンドが動作しない場合は、プロジェクト自体をトラブルシューティングする前に関連拡張をアップグレードしてください。

### `azd ai` を使ったエージェント中心のデプロイ

エージェントマニフェストがある場合、`azd ai agent init` を使って Foundry Agent Service に接続されたプロジェクトのスケルトンを作成します:

```bash
# エージェントマニフェストから初期化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure にデプロイ
azd up
```

最近のプレビューリリースでは `azure.ai.agents` にテンプレートベースの初期化サポートが追加され、`azd ai agent init` に対応しています。新しいエージェントサンプルに従う場合は、インストール済みバージョンで利用可能な正確なフラグについて拡張のヘルプを確認してください。

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

### ワンコマンドデプロイ

```bash
# 1つのコマンドですべてをデプロイする
azd up

# または段階的にデプロイする
azd provision  # インフラのみ
azd deploy     # アプリケーションのみ

# 長時間稼働するAIアプリのデプロイ用（azd 1.23.11+）
azd deploy --timeout 1800
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

## 🔐 セキュリティベストプラクティス

### 管理対象 ID の構成

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

### オートスケーリング構成

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

## 一般的な問題のトラブルシューティング

### 問題1: OpenAI クォータ超過

**症状:**
- デプロイがクォータエラーで失敗する
- アプリケーションログに 429 エラー

**解決策:**
```bash
# 現在のクォータ使用状況を確認する
az cognitiveservices usage list --location eastus

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 容量を一時的に減らす
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題2: 認証エラー

**症状:**
- AI サービス呼び出しで 401/403 エラー
- "Access denied" メッセージ

**解決策:**
```bash
# ロール割り当てを検証する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# マネージドIDの構成を確認する
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vaultへのアクセスを検証する
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題3: モデルデプロイの問題

**症状:**
- デプロイでモデルが利用できない
- 特定のモデルバージョンが失敗する

**解決策:**
```bash
# リージョンごとに利用可能なモデルを一覧表示する
az cognitiveservices model list --location eastus

# bicep テンプレート内のモデルバージョンを更新する
# モデルの容量要件を確認する
```

## サンプルテンプレート

### RAG チャットアプリケーション (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>説明</strong>: 最も人気のある Azure AI サンプル — 独自のドキュメントに対して質問できる本番対応の RAG チャットアプリ。チャットには GPT-4.1-mini、埋め込みには text-embedding-3-large、検索には Azure AI Search を使用。マルチモーダル文書、音声入出力、Microsoft Entra 認証、Application Insights トレースをサポート。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG チャットアプリケーション (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>説明</strong>: Python の RAG チャットサンプルの .NET/C# 相当。ASP.NET Core Minimal API と Blazor WebAssembly フロントエンドで構築。ボイスチャット、GPT-4o-mini vision サポート、.NET MAUI Blazor ハイブリッドのデスクトップ/モバイルクライアントを含む。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG チャットアプリケーション (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>説明</strong>: Langchain4J を使用した AI オーケストレーションの Java 版 RAG サンプル。マイクロサービスのイベント駆動アーキテクチャ、複数の検索戦略（テキスト、ベクター、ハイブリッド）、Azure Document Intelligence を使ったドキュメントアップロード、Azure Container Apps または Azure Kubernetes Service へのデプロイをサポート。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry を使ったエンタープライズ小売コパイロット

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>説明</strong>: Microsoft Foundry と Prompty を使ったエンドツーエンドの小売向け RAG コパイロット。製品カタログや顧客注文データに基づいた回答を生成する Contoso Outdoor のチャットボット。GenAIOps のフルワークフローを示す — Prompty でプロトタイプ、AI支援の評価者で評価、AZD を使って Container Apps にデプロイ。

<strong>クイックスタート</strong>:
```bash
azd init --template contoso-chat
azd up
```

### クリエイティブライティング マルチエージェントアプリケーション

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>説明</strong>: Prompty を使った AI エージェントのオーケストレーションを示すマルチエージェントサンプル。リサーチエージェント（Bing Grounding in Azure AI Agent Service）、プロダクトエージェント（Azure AI Search）、ライターエージェント、エディターエージェントが協力して調査に基づいた記事を作成。GitHub Actions での評価を含む CI/CD を含む。

<strong>クイックスタート</strong>:
```bash
azd init --template contoso-creative-writer
azd up
```

### サーバーレス RAG チャット (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>説明</strong>: LangChain.js を使用した完全サーバーレスの RAG チャットボット。API には Azure Functions、ホスティングには Azure Static Web Apps を使用。Azure Cosmos DB をベクターストア兼チャット履歴データベースとして利用。ローカル開発で Ollama を使ったゼロコストテストをサポート。

<strong>クイックスタート</strong>:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data ソリューションアクセラレータ

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>説明</strong>: ドキュメントのアップロード/管理用の管理ポータル、複数のオーケストレータオプション（Semantic Kernel, LangChain, Prompt Flow）、音声からテキスト、Microsoft Teams 統合、PostgreSQL または Cosmos DB の選択肢を備えたエンタープライズグレードの RAG ソリューションアクセラレータ。運用向け RAG シナリオのカスタマイズ可能な出発点として設計。

<strong>クイックスタート</strong>:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI トラベルエージェント — マルチエージェント MCP オーケストレーション

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

<strong>説明</strong>: LangChain.js、LlamaIndex.TS、Microsoft Agent Framework の 3 つのフレームワークを使ったマルチエージェント AI オーケストレーションのリファレンスアプリケーション。4 言語の MCP (Model Context Protocol) サーバーをサーバーレスの Azure Container Apps としてデプロイし、OpenTelemetry 監視を提供。

<strong>クイックスタート</strong>:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI スターター

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

<strong>説明</strong>: 構成済みの機械学習モデルで Azure AI サービスをデプロイする最小限の Bicep テンプレート。フルアプリケーションスタックを必要とせず、Azure AI インフラだけをプロビジョニングしたい場合の軽量な出発点。

<strong>クイックスタート</strong>:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## 次のステップ

1. <strong>サンプルを試す</strong>: ユースケースに合った既成テンプレートから始める
2. <strong>ニーズに合わせてカスタマイズ</strong>: インフラとアプリケーションコードを変更する
3. <strong>監視を追加</strong>: 包括的な可観測性を実装する
4. <strong>コストを最適化</strong>: 予算に合わせて構成を微調整する
5. <strong>デプロイを保護</strong>: エンタープライズ向けのセキュリティパターンを実装する
6. <strong>本番へスケール</strong>: マルチリージョンと高可用性機能を追加する

## 🎯 ハンズオン演習

### 演習1: Microsoft Foundry Models チャットアプリをデプロイ (30 分)
<strong>ゴール</strong>: 本番対応の AI チャットアプリをデプロイしてテストする

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
- [ ] 質問して AI による応答を得られる
- [ ] Application Insights にテレメトリデータが表示される
- [ ] リソースが正常にクリーンアップされる

<strong>推定コスト</strong>: テスト 30 分で $5-10

### 演習2: マルチモデルデプロイの構成 (45 分)
<strong>ゴール</strong>: 異なる構成で複数の AI モデルをデプロイする

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

**成功基準:**
- [ ] 複数のモデルが正常にデプロイされている
- [ ] 異なるキャパシティ設定が適用されている
- [ ] モデルに API 経由でアクセスできる
- [ ] アプリケーションから両方のモデルを呼び出せる

### 演習3: コスト監視の実装 (20 分)
<strong>ゴール</strong>: 予算アラートとコスト追跡を設定する

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
- [ ] Azure に予算アラートが作成されている
- [ ] メール通知が構成されている
- [ ] Azure ポータルでコストデータを確認できる
- [ ] 予算の閾値が適切に設定されている

## 💡 よくある質問

<details>
<summary><strong>開発中に Microsoft Foundry Models のコストを減らすにはどうすればよいですか？</strong></summary>

1. <strong>無料枠を使う</strong>: Microsoft Foundry Models は月 50,000 トークンの無料枠を提供
2. <strong>容量を減らす</strong>: 開発時は 30+ の代わりに 10 TPM に設定する
3. **azd down を使う**: 開発していないときはリソースをデアロケートする
4. <strong>レスポンスをキャッシュする</strong>: 繰り返しのクエリには Redis キャッシュを実装する
5. <strong>プロンプトエンジニアリングを使う</strong>: 効率的なプロンプトでトークン使用量を削減する


```bash
# 開発用設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models と OpenAI API の違いは何ですか？</strong></summary>

**Microsoft Foundry Models**:
- エンタープライズ向けのセキュリティとコンプライアンス
- プライベートネットワーク統合
- SLA（サービスレベル保証）
- マネージドIDによる認証
- より高いクォータが利用可能

**OpenAI API**:
- 新しいモデルへのより迅速なアクセス
- セットアップが簡単
- 参入障壁が低い
- パブリックインターネットのみ

本番アプリケーションでは、**Microsoft Foundry Models が推奨されます**。
</details>

<details>
<summary><strong>Microsoft Foundry Models のクォータ超過エラーはどのように対処しますか？</strong></summary>

```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus2

# 別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up

# 一時的に容量を減らす
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# クォータ増加をリクエストする
# Azure ポータル > クォータ > 増加をリクエスト に移動する
```
</details>

<details>
<summary><strong>Microsoft Foundry Models で自分のデータを使用できますか？</strong></summary>

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
<summary><strong>AI モデルのエンドポイントはどのように保護しますか？</strong></summary>

<strong>ベストプラクティス</strong>:
1. マネージドIDを使用する（APIキーは使用しない）
2. プライベートエンドポイントを有効にする
3. ネットワークセキュリティグループを構成する
4. レート制限を実装する
5. シークレットには Azure Key Vault を使用する

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
- **AZD GitHub**: [Issues およびディスカッション](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [公式ドキュメント](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh の Microsoft Foundry スキル](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - エディタに Azure + Foundry エージェントスキルを `npx skills add microsoft/github-copilot-for-azure` でインストールしてください

---

**章ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: Chapter 2 - AI-First Development
- **⬅️ 前の章**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ 次**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 次の章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**お困りですか？** コミュニティのディスカッションに参加するか、リポジトリでイシューを作成してください。Azure AI + AZD コミュニティがあなたの成功を支援します！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->