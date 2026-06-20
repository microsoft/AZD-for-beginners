# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD 初心者向け](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AIモデルのデプロイ](ai-model-deployment.md)
- **➡️ Next**: [本番向けAIベストプラクティス](production-ai-practices.md)
- **🚀 Next Chapter**: [第3章: 設定](../chapter-03-configuration/configuration.md)

## ワークショップ概要

このハンズオンラボでは、既存のAIテンプレートを取得し、Azure Developer CLI (AZD) を使用してデプロイする手順を開発者に案内します。Microsoft Foundry サービスを使用した本番向けAIデプロイの基本パターンを学びます。

> **Validation note (2026-03-25):** このワークショップは `azd` `1.23.12` に対してレビューされました。ローカルのインストールが古い場合は、認証、テンプレート、デプロイのワークフローが以下の手順と一致するように開始前にAZDを更新してください。

**所要時間:** 2-3時間  
**レベル:** 中級  
**事前条件:** 基本的なAzure知識、AI/MLの概念に関する馴染み

## 🎓 学習目標

ワークショップ終了時には、次のことができるようになります:
- ✅ 既存のAIアプリケーションをAZDテンプレートを使うように変換する
- ✅ AZDでMicrosoft Foundryサービスを構成する
- ✅ AIサービスのための安全な資格情報管理を実装する
- ✅ 監視を備えた本番対応のAIアプリケーションをデプロイする
- ✅ 一般的なAIデプロイの問題をトラブルシュートする

## 前提条件

### 必要なツール
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) がインストールされていること
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) がインストールされていること
- [Git](https://git-scm.com/) がインストールされていること
- コードエディタ（VS Code 推奨）

### Azure リソース
- Contributorアクセス権を持つAzureサブスクリプション
- Microsoft Foundry Modelsサービスへのアクセス（またはアクセス申請の可能性）
- リソースグループ作成の権限

### 知識の前提
- Azureサービスの基本的な理解
- コマンドラインインターフェースに慣れていること
- AI/MLの基本概念（API、モデル、プロンプト）

## ラボセットアップ

### ステップ1: 環境準備

1. **ツールのインストールを確認する:**
```bash
# AZD のインストールを確認する
azd version

# Azure CLI を確認する
az --version

# AZD ワークフローのために Azure にログインする
azd auth login

# 診断中に az コマンドを実行する予定がある場合にのみ Azure CLI にログインする
az login
```

複数のテナントで作業する場合やサブスクリプションが自動的に検出されない場合は、`azd auth login --tenant-id <tenant-id>` を使用して再試行してください。

2. **ワークショップリポジトリをクローンする:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## モジュール1: AIアプリケーションのためのAZD構造の理解

### AI対応AZDテンプレートの構成

AI対応のAZDテンプレートの主要ファイルを確認します:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **ラボ演習 1.1: 設定の確認**

1. **azure.yaml ファイルを確認する:**
```bash
cat azure.yaml
```

**確認ポイント:**
- AIコンポーネントのサービス定義
- 環境変数のマッピング
- ホスト設定

2. **main.bicep インフラを見直す:**
```bash
cat infra/main.bicep
```

**識別すべき主要なAIパターン:**
- Microsoft Foundry Models サービスのプロビジョニング
- Azure AI Search の統合
- 安全なキー管理
- ネットワークセキュリティの設定

### **ディスカッションポイント:** なぜこれらのパターンがAIにとって重要なのか

- <strong>サービスの依存関係</strong>: AIアプリは複数の連携サービスを必要とすることが多い
- <strong>セキュリティ</strong>: APIキーやエンドポイントは安全に管理する必要がある
- <strong>スケーラビリティ</strong>: AIワークロードには独自のスケーリング要件がある
- <strong>コスト管理</strong>: AIサービスは適切に構成しないと高額になる可能性がある

## モジュール2: 最初のAIアプリケーションをデプロイする

### ステップ2.1: 環境の初期化

1. **新しいAZD環境を作成する:**
```bash
azd env new myai-workshop
```

2. **必要なパラメータを設定する:**
```bash
# 希望する Azure リージョンを設定する
azd env set AZURE_LOCATION eastus

# 任意: 特定の OpenAI モデルを指定する
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ステップ2.2: インフラとアプリケーションをデプロイする

1. **AZDでデプロイ:**
```bash
azd up
```

**`azd up` 実行時に起こること:**
- ✅ Microsoft Foundry Models サービスをプロビジョニングする
- ✅ Azure AI Search サービスを作成する
- ✅ Webアプリ用の App Service を設定する
- ✅ ネットワーキングとセキュリティを設定する
- ✅ アプリケーションコードをデプロイする
- ✅ 監視とログ記録を設定する

2. <strong>デプロイの進行を監視</strong>し、作成されるリソースに注目してください。

### ステップ2.3: デプロイを検証する

1. **デプロイされたリソースを確認する:**
```bash
azd show
```

2. **デプロイされたアプリケーションを開く:**
```bash
azd show
```

`azd show` の出力に表示されるウェブエンドポイントを開いてください。

3. **AI機能をテストする:**
   - Webアプリにアクセスする
   - サンプルクエリを試す
   - AIの応答が機能していることを確認する

### **ラボ演習 2.1: トラブルシューティング演習**

<strong>シナリオ</strong>: デプロイは成功したがAIが応答しない。

**確認すべき一般的な問題:**
1. **OpenAI APIキー**: 正しく設定されているか確認する
2. <strong>モデルの利用可能性</strong>: お使いのリージョンでモデルがサポートされているか確認する
3. <strong>ネットワーク接続性</strong>: サービス間で通信できることを確認する
4. **RBAC権限**: アプリがOpenAIにアクセスできるか確認する

**デバッグ用コマンド:**
```bash
# 環境変数を確認する
azd env get-values

# デプロイのログを表示する
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAIのデプロイ状況を確認する
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## モジュール3: ニーズに合わせたAIアプリのカスタマイズ

### ステップ3.1: AI構成の変更

1. **OpenAIモデルを更新する:**
```bash
# 別のモデルに変更する（お住まいの地域で利用可能な場合）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 新しい構成で再デプロイする
azd deploy
```

2. **追加のAIサービスを追加する:**

`infra/main.bicep` を編集して Document Intelligence を追加します:

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

### ステップ3.2: 環境固有の構成

<strong>ベストプラクティス</strong>: 開発環境と本番環境で異なる構成を使用する。

1. **本番環境を作成する:**
```bash
azd env new myai-production
```

2. **本番用の特定パラメータを設定する:**
```bash
# 本番環境では通常、上位のSKUを使用します
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 追加のセキュリティ機能を有効にする
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ラボ演習 3.1: コスト最適化**

<strong>課題</strong>: 開発コストを抑えるようテンプレートを構成する。

**タスク:**
1. 無料/ベーシック層に設定できるSKUを特定する
2. 最小コストにするための環境変数を設定する
3. デプロイして本番構成とコストを比較する

**解決のヒント:**
- 可能な場合は Azure AI Services に F0 (free) ティアを使用する
- 開発環境では Search Service に Basic ティアを使用する
- Functions には Consumption プランを検討する

## モジュール4: セキュリティと本番のベストプラクティス

### ステップ4.1: 安全な資格情報管理

<strong>現在の課題</strong>: 多くのAIアプリがAPIキーをハードコードしたり、安全でないストレージを使用したりしている。

**AZDの解決策**: Managed Identity と Key Vault の統合。

1. **テンプレートのセキュリティ構成を確認する:**
```bash
# Key Vault とマネージドIDの構成を確認する
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity が機能していることを確認する:**
```bash
# ウェブアプリが正しいアイデンティティ構成になっているか確認する
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ステップ4.2: ネットワークセキュリティ

1. <strong>プライベートエンドポイントを有効にする</strong>（まだ構成されていない場合）:

bicep テンプレートに追加:
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

### ステップ4.3: 監視と可観測性

1. **Application Insights を構成する:**
```bash
# Application Insights は自動的に構成されるはずです
# 構成を確認してください:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI特有の監視を設定する:**

AI操作のカスタムメトリクスを追加:
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

### **ラボ演習 4.1: セキュリティ監査**

<strong>タスク</strong>: デプロイをセキュリティのベストプラクティスに沿ってレビューする。

**チェックリスト:**
- [ ] コードや設定にハードコードされたシークレットがない
- [ ] サービス間認証に Managed Identity を使用している
- [ ] Key Vault が機密設定を保存している
- [ ] ネットワークアクセスが適切に制限されている
- [ ] 監視とログ記録が有効になっている

## モジュール5: 自分のAIアプリケーションを変換する

### ステップ5.1: 評価ワークシート

<strong>アプリを変換する前に</strong>、次の質問に答えてください:

1. **アプリケーションアーキテクチャ:**
   - あなたのアプリはどのAIサービスを使用しているか？
   - どのようなコンピュートリソースが必要か？
   - データベースは必要か？
   - サービス間の依存関係は何か？

2. **セキュリティ要件:**
   - アプリはどのような機微なデータを扱うか？
   - どのようなコンプライアンス要件があるか？
   - プライベートネットワーキングは必要か？

3. **スケーリング要件:**
   - 想定される負荷はどれくらいか？
   - オートスケーリングは必要か？
   - 地域要件はあるか？

### ステップ5.2: AZDテンプレートを作成する

**アプリを変換するには次のパターンに従ってください:**

1. **基本構造を作成する:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD テンプレートを初期化する
azd init --template minimal
```

2. **azure.yaml を作成する:**
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

3. **インフラテンプレートを作成する:**

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

**infra/modules/openai.bicep** - OpenAIモジュール:
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

### **ラボ演習 5.1: テンプレート作成チャレンジ**

<strong>課題</strong>: ドキュメント処理AIアプリ用のAZDテンプレートを作成する。

**要件:**
- コンテンツ分析のための Microsoft Foundry Models
- OCRのための Document Intelligence
- ドキュメントアップロード用の Storage Account
- 処理ロジック用の Function App
- ユーザーインターフェース用の Web アプリ

**ボーナスポイント:**
- 適切なエラーハンドリングを追加する
- コスト見積もりを含める
- 監視ダッシュボードを設定する

## モジュール6: 一般的な問題のトラブルシューティング

### 一般的なデプロイ問題

#### 問題1: OpenAIサービスのクォータ超過
**症状:** デプロイがクォータエラーで失敗する
**解決策:**
```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus

# クォータの増加を申請するか、別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題2: モデルがリージョンで利用できない
**症状:** AIの応答が失敗する、またはモデルのデプロイエラーが発生する
**解決策:**
```bash
# 地域ごとにモデルの利用可能性を確認する
az cognitiveservices model list --location eastus

# 利用可能なモデルに更新する
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題3: 権限の問題
**症状:** AIサービス呼び出し時に 403 Forbidden エラーが発生する
**解決策:**
```bash
# ロール割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 不足しているロールを追加する
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### パフォーマンスの問題

#### 問題4: AIの応答が遅い
**調査手順:**
1. Application Insights でパフォーマンスメトリクスを確認する
2. Azureポータルで OpenAI サービスのメトリクスを確認する
3. ネットワーク接続とレイテンシを確認する

**解決策:**
- よく使われるクエリのキャッシュを実装する
- ユースケースに適した OpenAI モデルを使用する
- 高負荷シナリオではリードレプリカを検討する

### **ラボ演習 6.1: デバッグチャレンジ**

<strong>シナリオ</strong>: デプロイは成功したが、アプリケーションが 500 エラーを返す。

**デバッグタスク:**
1. アプリケーションログを確認する
2. サービス接続を確認する
3. 認証をテストする
4. 設定を見直す

**使用するツール:**
- デプロイ概要には `azd show`
- 詳細なサービスログには Azure ポータル
- アプリケーションテレメトリには Application Insights

## モジュール7: 監視と最適化

### ステップ7.1: 包括的な監視を設定する

1. **カスタムダッシュボードを作成する:**

Azure ポータルに移動して次を含むダッシュボードを作成します:
- OpenAI のリクエスト数とレイテンシ
- アプリケーションのエラー率
- リソース利用状況
- コスト追跡

2. **アラートを設定する:**
```bash
# 高いエラー率のアラート
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ステップ7.2: コスト最適化

1. **現在のコストを分析する:**
```bash
# Azure CLI を使用してコストデータを取得する
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **コストコントロールを実装する:**
- 予算アラートを設定する
- オートスケーリングポリシーを使用する
- リクエストキャッシュを実装する
- OpenAIのトークン使用量を監視する

### **ラボ演習 7.1: パフォーマンス最適化**

<strong>タスク</strong>: パフォーマンスとコストの両面でAIアプリケーションを最適化する。

**改善すべき指標:**
- 平均応答時間を20%削減
- 月間コストを15%削減
- 99.9%の稼働率を維持

**試すべき戦略:**
- 応答キャッシュを実装する
- トークン効率のためにプロンプトを最適化する
- 適切なコンピュートSKUを使用する
- 適切なオートスケーリングを設定する

## 最終チャレンジ: エンドツーエンド実装

### チャレンジシナリオ

本番対応のAI対応カスタマーサービスチャットボットを作成する任務があります。次の要件を満たしてください:

**機能要件:**
- 顧客とのやり取り用のWebインターフェース
- 応答のための Microsoft Foundry Models との統合
- Azure AI Search を使用したドキュメント検索機能
- 既存の顧客データベースとの統合
- 多言語サポート

**非機能要件:**
- 同時1000ユーザーを処理できること
- 99.9% の稼働率 SLA
- SOC 2 準拠
- 月額500ドル未満のコスト
- 複数環境へデプロイ（dev、staging、prod）

### 実装手順

1. <strong>アーキテクチャを設計する</strong>
2. **AZDテンプレートを作成する**
3. <strong>セキュリティ対策を実装する</strong>
4. <strong>監視とアラートを設定する</strong>
5. <strong>デプロイパイプラインを作成する</strong>
6. <strong>ソリューションをドキュメント化する</strong>

### 評価基準

- ✅ <strong>機能性</strong>: すべての要件を満たしているか？
- ✅ <strong>セキュリティ</strong>: ベストプラクティスが実装されているか？
- ✅ <strong>スケーラビリティ</strong>: 負荷を処理できるか？
- ✅ <strong>保守性</strong>: コードとインフラは整然としているか？
- ✅ <strong>コスト</strong>: 予算内に収まっているか？

## 追加リソース

### Microsoft ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service ドキュメント](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ドキュメント](https://learn.microsoft.com/azure/ai-studio/)

### サンプルテンプレート
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso チャット](https://github.com/Azure-Samples/contoso-chat)

### コミュニティ リソース
- [Microsoft Foundry の Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI の GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD テンプレート](https://azure.github.io/awesome-azd/)

## 🎓 修了証

おめでとうございます！ AI ワークショップ ラボを修了しました。これで以下ができるはずです:

- ✅ 既存の AI アプリケーションを AZD テンプレートに変換する
- ✅ 本番対応の AI アプリケーションをデプロイする
- ✅ AI ワークロードのセキュリティのベスト プラクティスを実装する
- ✅ AI アプリケーションのパフォーマンスを監視し最適化する
- ✅ 一般的なデプロイの問題をトラブルシューティングする

### 次のステップ
1. これらのパターンを自分の AI プロジェクトに適用する
2. テンプレートをコミュニティに提供する
3. 継続的なサポートのために Microsoft Foundry の Discord に参加する
4. マルチリージョン展開などの高度なトピックを探求する

---

**Workshop Feedback**: Help us improve this workshop by sharing your experience in the [Microsoft Foundry Discord の #Azure チャンネル](https://discord.gg/microsoft-azure).

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AI-First Development
- **⬅️ 前へ**: [AI モデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番向け AI ベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)

**ヘルプが必要ですか？** AZD と AI のデプロイに関するサポートや議論のためにコミュニティに参加してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->