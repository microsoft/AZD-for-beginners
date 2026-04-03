# AI ワークショップラボ: AI ソリューションを AZD でデプロイ可能にする

**章ナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前へ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ 次へ**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 次の章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ワークショップ概要

このハンズオンラボでは、既存の AI テンプレートを取り、Azure Developer CLI (AZD) を使ってデプロイする手順を開発者に案内します。Microsoft Foundry サービスを使用した本番向け AI デプロイの重要なパターンを学習します。

> **検証ノート (2026-03-25):** このワークショップは `azd` `1.23.12` に基づいてレビューされました。ローカルのインストールが古い場合は、認証、テンプレート、およびデプロイのワークフローが以下の手順と一致するように開始前に AZD を更新してください。

**所要時間:** 2-3 時間  
**レベル:** 中級  
**前提条件:** Azure の基本知識、AI/ML の概念に関する基本的理解

## 🎓 学習目標

By the end of this workshop, you will be able to:
- ✅ 既存の AI アプリケーションを AZD テンプレートを使用するよう変換する
- ✅ AZD で Microsoft Foundry サービスを構成する
- ✅ AI サービスのための安全な資格情報管理を実装する
- ✅ 監視付きの本番対応 AI アプリケーションをデプロイする
- ✅ 一般的な AI デプロイの問題をトラブルシューティングする

## 前提条件

### 必要なツール
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) がインストールされている
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) がインストールされている
- [Git](https://git-scm.com/) がインストールされている
- コードエディタ（VS Code 推奨）

### Azure リソース
- Contributor 権限のある Azure サブスクリプション
- Microsoft Foundry Models サービスへのアクセス（またはアクセスを要求できること）
- リソース グループを作成する権限

### 知識の前提
- Azure サービスの基本的理解
- コマンドライン インターフェースに慣れていること
- AI/ML の基本概念（API、モデル、プロンプト）

## ラボ設定

### ステップ 1: 環境準備

1. **ツールのインストールを確認する:**
```bash
# AZD のインストールを確認する
azd version

# Azure CLI を確認する
az --version

# AZD ワークフローのために Azure にログインする
azd auth login

# 診断中に az コマンドを実行する予定がある場合に限り Azure CLI にログインする
az login
```

複数のテナントで作業している場合、またはサブスクリプションが自動的に検出されない場合は、`azd auth login --tenant-id <tenant-id>` を使用して再試行してください。

2. **ワークショップのリポジトリをクローンする:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## モジュール 1: AI アプリケーションのための AZD 構造の理解

### AI 対応 AZD テンプレートの構成要素

AI 対応の AZD テンプレートの主要なファイルを確認します:

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

### **ラボ演習 1.1: 設定を探索する**

1. **azure.yaml ファイルを確認する:**
```bash
cat azure.yaml
```

**注目すべき点:**
- AI コンポーネントのサービス定義
- 環境変数のマッピング
- ホスト構成

2. **main.bicep のインフラをレビューする:**
```bash
cat infra/main.bicep
```

**識別すべき主要な AI パターン:**
- Microsoft Foundry Models サービスのプロビジョニング
- Cognitive Search の統合
- 安全なキー管理
- ネットワークセキュリティの構成

### **ディスカッションポイント:** なぜこれらのパターンが AI に重要なのか

- <strong>サービス依存関係</strong>: AI アプリは複数の協調したサービスを必要とすることが多い
- <strong>セキュリティ</strong>: API キーとエンドポイントは安全に管理する必要がある
- <strong>スケーラビリティ</strong>: AI ワークロードは特有のスケーリング要件がある
- <strong>コスト管理</strong>: 適切に構成されていないと AI サービスは高コストになる可能性がある

## モジュール 2: 最初の AI アプリケーションをデプロイする

### ステップ 2.1: 環境の初期化

1. **新しい AZD 環境を作成する:**
```bash
azd env new myai-workshop
```

2. **必要なパラメーターを設定する:**
```bash
# 使用する Azure リージョンを設定してください
azd env set AZURE_LOCATION eastus

# 任意: 特定の OpenAI モデルを設定してください
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ステップ 2.2: インフラとアプリケーションをデプロイする

1. **AZD でデプロイする:**
```bash
azd up
```

**`azd up` 実行時に何が起こるか:**
- ✅ Microsoft Foundry Models サービスをプロビジョニングする
- ✅ Cognitive Search サービスを作成する
- ✅ Web アプリケーション用の App Service を設定する
- ✅ ネットワークとセキュリティを構成する
- ✅ アプリケーションコードをデプロイする
- ✅ 監視とログ記録を設定する

2. <strong>デプロイの進行状況を監視</strong>し、作成されるリソースに注意してください。

### ステップ 2.3: デプロイを検証する

1. **デプロイされたリソースを確認する:**
```bash
azd show
```

2. **デプロイされたアプリケーションを開く:**
```bash
azd show
```

`azd show` の出力に表示される Web エンドポイントを開いてください。

3. **AI 機能をテストする:**
   - Web アプリケーションに移動する
   - サンプルクエリを試す
   - AI の応答が動作していることを確認する

### **ラボ演習 2.1: トラブルシューティング演習**

<strong>シナリオ</strong>: デプロイは成功したが AI が応答しない。

**確認すべき一般的な問題:**
1. **OpenAI API キー**: 正しく設定されているか確認する
2. <strong>モデルの利用可能性</strong>: お使いのリージョンがモデルをサポートしているか確認する
3. <strong>ネットワーク接続</strong>: サービス間で通信できることを確認する
4. **RBAC 権限**: アプリが OpenAI にアクセスできるか確認する

**デバッグ用コマンド:**
```bash
# 環境変数を確認する
azd env get-values

# デプロイのログを表示する
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAIのデプロイ状況を確認する
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## モジュール 3: ニーズに合わせた AI アプリケーションのカスタマイズ

### ステップ 3.1: AI 設定の変更

1. **OpenAI モデルを更新する:**
```bash
# 別のモデルに切り替える（お住まいの地域で利用可能な場合）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 新しい構成で再デプロイする
azd deploy
```

2. **追加の AI サービスを追加する:**

Document Intelligence を追加するために `infra/main.bicep` を編集する:
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

### ステップ 3.2: 環境別設定

<strong>ベストプラクティス</strong>: 開発と本番で設定を分ける。

1. **本番環境を作成する:**
```bash
azd env new myai-production
```

2. **本番専用のパラメーターを設定する:**
```bash
# 本番環境では通常、より高い SKU を使用します
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 追加のセキュリティ機能を有効にする
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ラボ演習 3.1: コスト最適化**

<strong>チャレンジ</strong>: コスト効率の良い開発のためにテンプレートを構成する。

**タスク:**
1. 無料/ベーシック層に設定できる SKU を特定する
2. 最小コストのために環境変数を構成する
3. デプロイして本番構成とコストを比較する

**解決のヒント:**
- 可能であれば Cognitive Services に F0（無料）層を使用する
- 開発では Search Service に Basic 層を使用する
- Functions には Consumption プランの使用を検討する

## モジュール 4: セキュリティと本番のベストプラクティス

### ステップ 4.1: 安全な資格情報管理

<strong>現在の課題</strong>: 多くの AI アプリは API キーをハードコードするか、安全でないストレージを使用している。

**AZD の解決策**: マネージド ID と Key Vault の統合。

1. **テンプレート内のセキュリティ構成を確認する:**
```bash
# Key Vault とマネージド ID の構成を確認してください
grep -r "keyVault\|managedIdentity" infra/
```

2. **マネージド ID が機能しているか確認する:**
```bash
# Web アプリが正しいアイデンティティ構成になっているか確認する
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ステップ 4.2: ネットワークセキュリティ

1. **プライベート エンドポイントを有効にする**（未構成の場合）:

bicep テンプレートに追加する:
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

### ステップ 4.3: 監視と可観測性

1. **Application Insights を構成する:**
```bash
# Application Insights は自動的に構成されるはずです
# 構成を確認してください:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI 専用の監視を設定する:**

AI 操作のカスタム メトリクスを追加する:
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

<strong>タスク</strong>: セキュリティのベストプラクティスについてデプロイをレビューする。

**チェックリスト:**
- [ ] コードや設定にハードコードされたシークレットがない
- [ ] サービス間認証に Managed Identity を使用している
- [ ] Key Vault に機密設定が格納されている
- [ ] ネットワークアクセスが適切に制限されている
- [ ] 監視とログ記録が有効になっている

## モジュール 5: 独自の AI アプリケーションの変換

### ステップ 5.1: 評価ワークシート

<strong>アプリを変換する前に</strong>、以下の質問に答えてください:

1. **アプリケーションのアーキテクチャ:**
   - アプリはどの AI サービスを使用しているか？
   - 必要なコンピュートリソースは何か？
   - データベースが必要か？
   - サービス間の依存関係は何か？

2. **セキュリティ要件:**
   - アプリはどのような機密データを扱うか？
   - どのようなコンプライアンス要件があるか？
   - プライベートネットワークが必要か？

3. **スケーリング要件:**
   - 想定される負荷はどれくらいか？
   - オートスケーリングが必要か？
   - 地域要件はあるか？

### ステップ 5.2: AZD テンプレートを作成する

**アプリを変換するには次のパターンに従ってください:**

1. 基本構造を作成する:
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD テンプレートを初期化する
azd init --template minimal
```

2. azure.yaml を作成する:
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

3. インフラテンプレートを作成する:

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

### **ラボ演習 5.1: テンプレート作成チャレンジ**

<strong>チャレンジ</strong>: ドキュメント処理 AI アプリの AZD テンプレートを作成する。

**要件:**
- コンテンツ分析のための Microsoft Foundry Models
- OCR のための Document Intelligence
- ドキュメントアップロード用の Storage Account
- 処理ロジック用の Function App
- ユーザーインターフェース用の Web アプリ

**ボーナスポイント:**
- 適切なエラーハンドリングを追加する
- コスト見積もりを含める
- 監視ダッシュボードを設定する

## モジュール 6: 一般的な問題のトラブルシューティング

### 一般的なデプロイの問題

#### 問題 1: OpenAI サービスのクォータ超過
**症状:** クォータエラーでデプロイが失敗する
**解決策:**
```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus

# クォータの引き上げを申請するか、別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題 2: モデルがリージョンで利用できない
**症状:** AI の応答が失敗する、またはモデルのデプロイにエラーが発生する
**解決策:**
```bash
# 地域ごとにモデルの利用状況を確認する
az cognitiveservices model list --location eastus

# 利用可能なモデルに更新する
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題 3: 権限の問題
**症状:** AI サービス呼び出し時に 403 Forbidden エラーが発生する
**解決策:**
```bash
# ロールの割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 不足しているロールを追加する
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### パフォーマンスの問題

#### 問題 4: AI 応答が遅い
**調査手順:**
1. Application Insights でパフォーマンス メトリクスを確認する
2. Azure ポータルで OpenAI サービスのメトリクスを確認する
3. ネットワーク接続とレイテンシを確認する

**解決策:**
- 共通クエリのキャッシュを実装する
- ユースケースに適した OpenAI モデルを使用する
- 高負荷シナリオではリードレプリカを検討する

### **ラボ演習 6.1: デバッグチャレンジ**

<strong>シナリオ</strong>: デプロイは成功したが、アプリケーションが 500 エラーを返す。

**デバッグタスク:**
1. アプリケーションログを確認する
2. サービスの接続性を確認する
3. 認証をテストする
4. 設定をレビューする

**使用するツール:**
- デプロイ概要のための `azd show`
- 詳細なサービスログのための Azure ポータル
- アプリケーションのテレメトリのための Application Insights

## モジュール 7: 監視と最適化

### ステップ 7.1: 包括的な監視の設定

1. **カスタムダッシュボードを作成する:**

Azure ポータルに移動し、次の項目を含むダッシュボードを作成する:
- OpenAI のリクエスト数とレイテンシ
- アプリケーションのエラー率
- リソース使用率
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

### ステップ 7.2: コスト最適化

1. **現在のコストを分析する:**
```bash
# Azure CLI を使用してコストデータを取得する
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **コスト管理を実装する:**
- 予算アラートを設定する
- オートスケーリングポリシーを使用する
- リクエストキャッシュを実装する
- OpenAI のトークン使用量を監視する

### **ラボ演習 7.1: パフォーマンス最適化**

<strong>タスク</strong>: パフォーマンスとコストの両面で AI アプリケーションを最適化する。

**改善するメトリクス:**
- 平均応答時間を 20% 短縮する
- 月間コストを 15% 削減する
- 99.9% の稼働率を維持する

**試すべき戦略:**
- レスポンスキャッシュを実装する
- トークン効率のためにプロンプトを最適化する
- 適切なコンピュート SKU を使用する
- 適切なオートスケーリングを設定する

## 最終チャレンジ: エンドツーエンド実装

### チャレンジシナリオ

次の要件を満たす本番対応の AI 対応カスタマーサービスチャットボットを作成する任務があります:

**機能要件:**
- 顧客対応のための Web インターフェース
- 応答のための Microsoft Foundry Models との統合
- Cognitive Search を使用したドキュメント検索機能
- 既存の顧客データベースとの統合
- 多言語対応

**非機能要件:**
- 1000 同時ユーザーを処理する
- 99.9% の稼働率 SLA
- SOC 2 コンプライアンス
- 月額 500 ドル以下のコスト
- 複数環境（dev、staging、prod）へデプロイする

### 実装手順

1. アーキテクチャを設計する
2. AZD テンプレートを作成する
3. セキュリティ対策を実装する
4. 監視とアラートを設定する
5. デプロイパイプラインを作成する
6. ソリューションをドキュメント化する

### 評価基準

- ✅ <strong>機能性</strong>: すべての要件を満たしているか？
- ✅ <strong>セキュリティ</strong>: ベストプラクティスが実装されているか？
- ✅ <strong>スケーラビリティ</strong>: 負荷に対応できるか？
- ✅ <strong>保守性</strong>: コードとインフラは整理されているか？
- ✅ <strong>コスト</strong>: 予算内に収まっているか？

## 追加リソース

### Microsoft ドキュメント
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry モデル チャット アプリ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI チャット アプリ クイックスタート](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso チャット](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD テンプレート](https://azure.github.io/awesome-azd/)

## 🎓 修了証

おめでとうございます！AI ワークショップ ラボを修了しました。これで次のことができるようになっているはずです：

- ✅ 既存の AI アプリケーションを AZD テンプレートに変換する
- ✅ 本番環境向けの AI アプリケーションをデプロイする
- ✅ AI ワークロードのセキュリティ ベストプラクティスを実装する
- ✅ AI アプリケーションのパフォーマンスを監視して最適化する
- ✅ 一般的なデプロイの問題をトラブルシューティングする

### 次のステップ
1. これらのパターンを自分の AI プロジェクトに適用する
2. テンプレートをコミュニティに還元する
3. 継続的なサポートのために Microsoft Foundry Discord に参加する
4. マルチリージョン デプロイなどの高度なトピックを探求する

---

**Workshop Feedback**: Help us improve this workshop by sharing your experience in the [Microsoft Foundry Discord #Azure チャンネル](https://discord.gg/microsoft-azure).

---

**Chapter Navigation:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AI ファースト開発
- **⬅️ 前へ**: [AI モデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番環境の AI ベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 構成](../chapter-03-configuration/configuration.md)

**Need Help?** Join our community for support and discussions about AZD and AI deployments.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性を期していますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご注意ください。原文（元の言語の文書）が権威ある出典と見なされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用により生じた誤解や解釈の相違について、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->