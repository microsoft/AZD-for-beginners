# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 第2章 - AIファースト開発
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

このハンズオンラボでは、既存のAIテンプレートを取得して Azure Developer CLI (AZD) を使用してデプロイするプロセスを開発者に案内します。Microsoft Foundry サービスを使用した本番向けAIデプロイの基本パターンを学びます。

**所要時間:** 2〜3時間  
**レベル:** 中級  
**前提条件:** 基本的な Azure の知識、AI/ML の概念に対する理解

## 🎓 Learning Objectives

このワークショップの終了時には、次のことができるようになります:
- ✅ 既存のAIアプリケーションをAZDテンプレートを使用するように変換する
- ✅ AZDでMicrosoft Foundryサービスを構成する
- ✅ AIサービスのための安全な資格情報管理を実装する
- ✅ 監視付きの本番対応AIアプリケーションをデプロイする
- ✅ 一般的なAIデプロイの問題をトラブルシューティングする

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) がインストールされていること
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) がインストールされていること
- [Git](https://git-scm.com/) がインストールされていること
- コードエディタ (VS Code 推奨)

### Azure Resources
- コントリビュータ権限を持つ Azure サブスクリプション
- Microsoft Foundry Models サービスへのアクセス（またはアクセス要求が可能であること）
- リソースグループ作成権限

### Knowledge Prerequisites
- Azure サービスの基本的な理解
- コマンドラインインターフェースに慣れていること
- AI/ML の基本概念（API、モデル、プロンプト）

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD のインストールを確認する
azd version

# Azure CLI を確認する
az --version

# Azure にログインする
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI対応のAZDテンプレート内の主要なファイルを確認してください:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AIコンポーネントのサービス定義
- 環境変数のマッピング
- ホスト構成

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models サービスのプロビジョニング
- Cognitive Search の統合
- セキュアなキー管理
- ネットワークセキュリティ構成

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AIアプリは複数の連携サービスを必要とすることが多い
- **Security**: APIキーやエンドポイントは安全に管理する必要がある
- **Scalability**: AIワークロードは独自のスケーリング要件がある
- **Cost Management**: 適切に構成されていないとAIサービスは高額になる可能性がある

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# 優先する Azure リージョンを設定してください
azd env set AZURE_LOCATION eastus

# 任意: 特定の OpenAI モデルを設定してください
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Microsoft Foundry Models サービスをプロビジョニングする
- ✅ Cognitive Search サービスを作成する
- ✅ Webアプリケーション用の App Service をセットアップする
- ✅ ネットワーキングとセキュリティを構成する
- ✅ アプリケーションコードをデプロイする
- ✅ 監視とログ記録を設定する

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - Webアプリケーションに移動する
   - サンプルクエリを試す
   - AIの応答が機能していることを確認する

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: デプロイは成功したが AI が応答しない。

**Common issues to check:**
1. **OpenAI API keys**: 正しく設定されているか確認する
2. **Model availability**: お使いのリージョンがモデルをサポートしているか確認する
3. **Network connectivity**: サービス間の通信が可能か確認する
4. **RBAC permissions**: アプリが OpenAI にアクセスできるか確認する

**Debugging commands:**
```bash
# 環境変数を確認する
azd env get-values

# デプロイのログを表示する
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAIのデプロイ状況を確認する
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# 別のモデルに切り替えてください（お住まいの地域で利用可能な場合）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 新しい構成で再デプロイしてください
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Step 3.2: Environment-Specific Configurations

**Best Practice**: 開発と本番で異なる構成を使用する。

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# 本番環境では通常、より上位のSKUを使用します
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 追加のセキュリティ機能を有効にする
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: コスト効率の良い開発用にテンプレートを構成する。

**Tasks:**
1. 無料/ベーシックプランに設定できるSKUを特定する
2. 最小コストのために環境変数を設定する
3. デプロイして本番構成とコストを比較する

**Solution hints:**
- 可能な場合は Cognitive Services に F0 (無料) ティアを使用する
- 開発では Search Service に Basic ティアを使用する
- Functions には Consumption プランを検討する

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: 多くのAIアプリがAPIキーをハードコードしたり安全でないストレージを使用している。

**AZD Solution**: マネージドID + Key Vault の統合。

1. **Review the security configuration in your template:**
```bash
# Key Vault とマネージド ID の構成を確認してください
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# ウェブアプリが正しいアイデンティティ構成になっているか確認する
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

Add to your bicep template:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights は自動的に構成されるはずです
# 構成を確認してください:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Add custom metrics for AI operations:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Exercise 4.1: Security Audit**

**Task**: デプロイをセキュリティのベストプラクティスに沿ってレビューする。

**Checklist:**
- [ ] コードや構成にハードコードされたシークレットがない
- [ ] サービス間認証に Managed Identity を使用している
- [ ] Key Vault に機密設定を格納している
- [ ] ネットワークアクセスが適切に制限されている
- [ ] 監視とログ記録が有効になっている

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, 次の質問に答えてください:

1. **Application Architecture:**
   - あなたのアプリはどのAIサービスを使用しているか？
   - 必要なコンピュートリソースは何か？
   - データベースは必要か？
   - サービス間の依存関係は何か？

2. **Security Requirements:**
   - アプリはどのような機密データを扱うか？
   - 準拠すべきコンプライアンス要件は何か？
   - プライベートネットワーキングは必要か？

3. **Scaling Requirements:**
   - 想定する負荷はどの程度か？
   - オートスケーリングは必要か？
   - リージョンに関する要件はあるか？

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD テンプレートを初期化する
azd init --template minimal
```

2. **Create azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Create infrastructure templates:**

**infra/main.bicep** - メインテンプレート:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI モジュール:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: ドキュメント処理AIアプリ用のAZDテンプレートを作成する。

**Requirements:**
- コンテンツ解析のための Microsoft Foundry Models
- OCR のための Document Intelligence
- ドキュメントアップロード用の Storage Account
- 処理ロジック用の Function App
- ユーザーインターフェイス用の Web アプリ

**Bonus points:**
- 適切なエラーハンドリングを追加する
- コスト見積を含める
- 監視ダッシュボードをセットアップする

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** デプロイがクォータエラーで失敗する
**Solutions:**
```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus

# クォータの増加をリクエストするか、別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AIの応答が失敗する、またはモデルデプロイにエラーが出る
**Solutions:**
```bash
# 地域ごとにモデルの利用可能性を確認する
az cognitiveservices model list --location eastus

# 利用可能なモデルに更新する
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AIサービス呼び出し時に403 Forbidden エラーが発生する
**Solutions:**
```bash
# ロール割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 不足しているロールを追加する
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Application Insights でパフォーマンスメトリクスを確認する
2. Azure ポータルで OpenAI サービスのメトリクスをレビューする
3. ネットワーク接続性とレイテンシを検証する

**Solutions:**
- 共通クエリに対してキャッシュを実装する
- ユースケースに適した OpenAI モデルを使用する
- 高負荷シナリオではリードレプリカを検討する

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: デプロイは成功したが、アプリケーションが500エラーを返す。

**Debugging tasks:**
1. アプリケーションログを確認する
2. サービス接続性を検証する
3. 認証をテストする
4. 設定をレビューする

**Tools to use:**
- `azd show` をデプロイ概要のために使用する
- 詳細なサービスログには Azure ポータルを使用する
- アプリケーションのテレメトリには Application Insights を使用する

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure ポータルに移動して、次を含むダッシュボードを作成する:
- OpenAI リクエスト数とレイテンシ
- アプリケーションのエラー率
- リソースの利用状況
- コスト追跡

2. **Set up alerts:**
```bash
# 高いエラー率の警告
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Azure CLI を使用してコストデータを取得する
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- 予算アラートを設定する
- オートスケーリングポリシーを使用する
- リクエストキャッシュを実装する
- OpenAI のトークン使用量を監視する

### **Lab Exercise 7.1: Performance Optimization**

**Task**: パフォーマンスとコストの両方で AI アプリケーションを最適化する。

**改善すべきメトリクス:**
- 平均応答時間を20%削減
- 月間コストを15%削減
- 99.9% の稼働率を維持

**試すべき戦略:**
- 応答キャッシュを実装する
- トークン効率のためにプロンプトを最適化する
- 適切なコンピュートSKUを使用する
- 適切なオートスケーリングを設定する

## Final Challenge: End-to-End Implementation

### Challenge Scenario

本番対応のAI搭載カスタマーサービスチャットボットを作成する任務があります。要件は以下の通りです:

**Functional Requirements:**
- 顧客対話用のWebインターフェイス
- 応答のための Microsoft Foundry Models との統合
- Cognitive Search を使用したドキュメント検索機能
- 既存の顧客データベースとの統合
- 多言語対応

**Non-Functional Requirements:**
- 同時1000ユーザーを処理できること
- 99.9% の稼働SLA
- SOC 2 準拠
- 月額500ドル以下のコスト
- 複数環境へのデプロイ（dev、staging、prod）

### Implementation Steps

1. アーキテクチャを設計する
2. AZD テンプレートを作成する
3. セキュリティ対策を実装する
4. 監視とアラートを設定する
5. デプロイパイプラインを作成する
6. ソリューションをドキュメント化する

### Evaluation Criteria

- ✅ **Functionality**: すべての要件を満たしているか？
- ✅ **Security**: ベストプラクティスが実装されているか？
- ✅ **Scalability**: 負荷を処理できるか？
- ✅ **Maintainability**: コードとインフラは整理されているか？
- ✅ **Cost**: 予算内に収まっているか？

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

おめでとうございます！AI Workshop Lab を修了しました。これで次のことができるはずです：
- ✅ 既存の AI アプリケーションを AZD テンプレートに変換する
- ✅ 本番対応の AI アプリケーションをデプロイする
- ✅ AI ワークロードに対するセキュリティのベストプラクティスを実装する
- ✅ AI アプリケーションのパフォーマンスを監視および最適化する
- ✅ 一般的なデプロイの問題をトラブルシュートする

### 次のステップ
1. これらのパターンを自身の AI プロジェクトに適用する
2. テンプレートをコミュニティに還元する
3. 継続的なサポートのために Microsoft Foundry の Discord に参加する
4. マルチリージョン展開のような高度なトピックを探る

---

<strong>ワークショップのフィードバック</strong>: このワークショップを改善するために、[Microsoft Foundry Discord の #Azure チャンネル](https://discord.gg/microsoft-azure) であなたの経験を共有してください。

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前へ**: [AI モデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番 AI ベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)

**助けが必要ですか？** AZD と AI のデプロイに関するサポートや議論のためにコミュニティに参加してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性に努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご承知ください。原文（原言語）の文書を権威ある情報源としてご参照ください。重要な情報については、専門の翻訳者による人間翻訳を推奨します。本翻訳の使用に起因する誤解や誤った解釈について、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->