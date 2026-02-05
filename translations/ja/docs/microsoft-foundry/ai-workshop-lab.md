# AIワークショップラボ: AIソリューションをAZDでデプロイ可能にする

**章ナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番環境AIのベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 設定](../getting-started/configuration.md)

## ワークショップ概要

このハンズオンラボでは、既存のAIテンプレートを使用してAzure Developer CLI (AZD) を使ったデプロイ方法を開発者に案内します。Microsoft Foundryサービスを活用した本番環境向けAIデプロイメントの基本パターンを学びます。

**所要時間:** 2～3時間  
**レベル:** 中級  
**前提条件:** Azureの基本知識、AI/MLの概念に関する基本的な理解

## 🎓 学習目標

このワークショップを終えると、以下ができるようになります:
- ✅ 既存のAIアプリケーションをAZDテンプレートに変換する
- ✅ Microsoft FoundryサービスをAZDで設定する
- ✅ AIサービスのための安全な資格情報管理を実装する
- ✅ 監視機能を備えた本番環境向けAIアプリケーションをデプロイする
- ✅ 一般的なAIデプロイメントの問題をトラブルシューティングする

## 前提条件

### 必要なツール
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) のインストール
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) のインストール
- [Git](https://git-scm.com/) のインストール
- コードエディタ (VS Code推奨)

### Azureリソース
- コントリビュータ権限を持つAzureサブスクリプション
- Azure OpenAIサービスへのアクセス (またはアクセスリクエストの能力)
- リソースグループ作成権限

### 知識の前提条件
- Azureサービスの基本的な理解
- コマンドラインインターフェースの基本的な理解
- AI/MLの基本概念 (API、モデル、プロンプト)

## ラボセットアップ

### ステップ1: 環境準備

1. **ツールのインストールを確認:**
```bash
# AZDのインストールを確認する
azd version

# Azure CLIを確認する
az --version

# Azureにログインする
az login
azd auth login
```

2. **ワークショップリポジトリをクローン:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## モジュール1: AIアプリケーション向けAZD構造の理解

### AI対応AZDテンプレートの構造

AI対応AZDテンプレートの主要ファイルを確認します:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **ラボ演習1.1: 設定を確認する**

1. **azure.yamlファイルを確認:**
```bash
cat azure.yaml
```

**確認ポイント:**
- AIコンポーネントのサービス定義
- 環境変数のマッピング
- ホスト構成

2. **main.bicepインフラストラクチャを確認:**
```bash
cat infra/main.bicep
```

**特定すべきAIパターン:**
- Azure OpenAIサービスのプロビジョニング
- Cognitive Searchの統合
- 安全なキー管理
- ネットワークセキュリティ構成

### **ディスカッションポイント:** これらのパターンがAIにとって重要な理由

- **サービス依存関係**: AIアプリは複数のサービスの連携が必要
- **セキュリティ**: APIキーやエンドポイントの安全な管理が必要
- **スケーラビリティ**: AIワークロードには特有のスケーリング要件がある
- **コスト管理**: 適切に構成しないとAIサービスは高額になる可能性がある

## モジュール2: 初めてのAIアプリケーションをデプロイする

### ステップ2.1: 環境を初期化する

1. **新しいAZD環境を作成:**
```bash
azd env new myai-workshop
```

2. **必要なパラメータを設定:**
```bash
# お好みのAzureリージョンを設定してください
azd env set AZURE_LOCATION eastus

# 任意: 特定のOpenAIモデルを設定してください
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ステップ2.2: インフラストラクチャとアプリケーションをデプロイする

1. **AZDでデプロイ:**
```bash
azd up
```

**`azd up`中に行われること:**
- ✅ Azure OpenAIサービスをプロビジョニング
- ✅ Cognitive Searchサービスを作成
- ✅ Webアプリケーション用のApp Serviceを設定
- ✅ ネットワークとセキュリティを構成
- ✅ アプリケーションコードをデプロイ
- ✅ 監視とログを設定

2. **デプロイ進行状況を監視**し、作成されるリソースを確認。

### ステップ2.3: デプロイを確認する

1. **デプロイされたリソースを確認:**
```bash
azd show
```

2. **デプロイされたアプリケーションを開く:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI機能をテスト:**
   - Webアプリケーションにアクセス
   - サンプルクエリを試す
   - AIの応答が機能していることを確認

### **ラボ演習2.1: トラブルシューティング練習**

**シナリオ**: デプロイは成功したが、AIが応答しない。

**確認すべき一般的な問題:**
1. **OpenAI APIキー**: 正しく設定されているか確認
2. **モデルの利用可能性**: 使用しているリージョンでモデルがサポートされているか確認
3. **ネットワーク接続**: サービス間の通信が可能か確認
4. **RBAC権限**: アプリがOpenAIにアクセスできるか確認

**デバッグコマンド:**
```bash
# 環境変数を確認する
azd env get-values

# デプロイメントログを表示する
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAIのデプロイメント状況を確認する
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## モジュール3: AIアプリケーションをニーズに合わせてカスタマイズする

### ステップ3.1: AI設定を変更する

1. **OpenAIモデルを更新:**
```bash
# 別のモデルに変更する（地域で利用可能な場合）
azd env set AZURE_OPENAI_MODEL gpt-4

# 新しい構成で再展開する
azd deploy
```

2. **追加のAIサービスを追加:**

`infra/main.bicep`を編集してDocument Intelligenceを追加:

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

### ステップ3.2: 環境固有の設定

**ベストプラクティス**: 開発環境と本番環境で異なる設定を使用。

1. **本番環境を作成:**
```bash
azd env new myai-production
```

2. **本番環境固有のパラメータを設定:**
```bash
# 本番環境では通常、より高いSKUを使用します
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 追加のセキュリティ機能を有効にします
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ラボ演習3.1: コスト最適化**

**課題**: 開発においてコスト効率の良いテンプレートを設定。

**タスク:**
1. 無料/基本ティアに設定可能なSKUを特定
2. コストを最小限に抑える環境変数を設定
3. デプロイして本番環境設定とコストを比較

**ヒント:**
- Cognitive Servicesでは可能な限りF0 (無料) ティアを使用
- 開発ではSearch ServiceのBasicティアを使用
- FunctionsではConsumptionプランを検討

## モジュール4: セキュリティと本番環境のベストプラクティス

### ステップ4.1: 資格情報管理のセキュリティを強化

**現在の課題**: 多くのAIアプリがAPIキーをハードコーディングまたは安全でないストレージを使用。

**AZDソリューション**: マネージドID + Key Vaultの統合。

1. **テンプレート内のセキュリティ設定を確認:**
```bash
# Key VaultとManaged Identityの設定を探す
grep -r "keyVault\|managedIdentity" infra/
```

2. **マネージドIDが機能していることを確認:**
```bash
# Webアプリが正しいアイデンティティ構成を持っているか確認する
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ステップ4.2: ネットワークセキュリティ

1. **プライベートエンドポイントを有効化** (未設定の場合):

Bicepテンプレートに追加:
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

1. **Application Insightsを設定:**
```bash
# アプリケーションインサイトは自動的に構成される必要があります
# 構成を確認してください:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI特有の監視を設定:**

AI操作用のカスタムメトリクスを追加:
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

### **ラボ演習4.1: セキュリティ監査**

**タスク**: デプロイメントをセキュリティベストプラクティスに基づいてレビュー。

**チェックリスト:**
- [ ] コードや設定にハードコーディングされた秘密情報がない
- [ ] サービス間認証にマネージドIDを使用
- [ ] Key Vaultに機密設定を保存
- [ ] ネットワークアクセスが適切に制限されている
- [ ] 監視とログが有効化されている

## モジュール5: 独自のAIアプリケーションを変換する

### ステップ5.1: アセスメントワークシート

**アプリを変換する前に**, 以下の質問に答えてください:

1. **アプリケーションアーキテクチャ:**
   - アプリが使用するAIサービスは何ですか？
   - 必要なコンピュートリソースは？
   - データベースが必要ですか？
   - サービス間の依存関係は？

2. **セキュリティ要件:**
   - アプリが扱う機密データは？
   - 準拠すべきコンプライアンス要件は？
   - プライベートネットワーキングが必要ですか？

3. **スケーリング要件:**
   - 予想される負荷は？
   - 自動スケーリングが必要ですか？
   - リージョン要件は？

### ステップ5.2: AZDテンプレートを作成

**このパターンに従ってアプリを変換:**

1. **基本構造を作成:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZDテンプレートを初期化
azd init --template minimal
```

2. **azure.yamlを作成:**
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

3. **インフラストラクチャテンプレートを作成:**

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

### **ラボ演習5.1: テンプレート作成チャレンジ**

**課題**: ドキュメント処理AIアプリ用のAZDテンプレートを作成。

**要件:**
- コンテンツ分析用のAzure OpenAI
- OCR用のDocument Intelligence
- ドキュメントアップロード用のStorage Account
- 処理ロジック用のFunction App
- ユーザーインターフェース用のWebアプリ

**ボーナスポイント:**
- 適切なエラーハンドリングを追加
- コスト見積もりを含める
- 監視ダッシュボードを設定

## モジュール6: 一般的な問題のトラブルシューティング

### 一般的なデプロイメントの問題

#### 問題1: OpenAIサービスのクォータ超過
**症状:** デプロイがクォータエラーで失敗
**解決策:**
```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus

# クォータの増加をリクエストするか、別のリージョンを試してください
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題2: モデルがリージョンで利用不可
**症状:** AI応答が失敗またはモデルデプロイエラー
**解決策:**
```bash
# 地域ごとのモデルの利用可能性を確認する
az cognitiveservices model list --location eastus

# 利用可能なモデルに更新する
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 問題3: 権限の問題
**症状:** AIサービス呼び出し時に403 Forbiddenエラー
**解決策:**
```bash
# ロールの割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 欠けているロールを追加する
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### パフォーマンスの問題

#### 問題4: AI応答が遅い
**調査手順:**
1. Application Insightsでパフォーマンスメトリクスを確認
2. AzureポータルでOpenAIサービスメトリクスを確認
3. ネットワーク接続と遅延を確認

**解決策:**
- 一般的なクエリにキャッシュを実装
- ユースケースに適したOpenAIモデルを使用
- 高負荷シナリオ用にリードレプリカを検討

### **ラボ演習6.1: デバッグチャレンジ**

**シナリオ**: デプロイは成功したが、アプリケーションが500エラーを返す。

**デバッグタスク:**
1. アプリケーションログを確認
2. サービス接続を確認
3. 認証をテスト
4. 設定を確認

**使用ツール:**
- `azd show`でデプロイ概要を確認
- Azureポータルで詳細なサービスログを確認
- Application Insightsでアプリケーションテレメトリを確認

## モジュール7: 監視と最適化

### ステップ7.1: 包括的な監視を設定

1. **カスタムダッシュボードを作成:**

Azureポータルに移動し、以下を含むダッシュボードを作成:
- OpenAIリクエスト数と遅延
- アプリケーションエラー率
- リソース使用率
- コスト追跡

2. **アラートを設定:**
```bash
# 高エラー率の警告
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ステップ7.2: コスト最適化

1. **現在のコストを分析:**
```bash
# Azure CLIを使用してコストデータを取得する
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **コスト管理を実施:**
- 予算アラートを設定
- 自動スケーリングポリシーを使用
- リクエストキャッシュを実装
- OpenAIのトークン使用量を監視

### **ラボ演習7.1: パフォーマンス最適化**

**タスク**: AIアプリケーションをパフォーマンスとコストの両面で最適化。

**改善すべきメトリクス:**
- 平均応答時間を20%削減
- 月間コストを15%削減
- 99.9%の稼働率を維持

**試すべき戦略:**
- 応答キャッシュを実装
- トークン効率のためプロンプトを最適化
- 適切なコンピュートSKUを使用
- 適切な自動スケーリングを設定

## 最終チャレンジ: エンドツーエンドの実装

### チャレンジシナリオ

以下の要件を満たす本番環境向けAIカスタマーサービスチャットボットを作成してください:

**機能要件:**
- 顧客との対話用Webインターフェース
- 応答用のAzure OpenAIとの統合
- Cognitive Searchを使用したドキュメント検索機能
- 既存の顧客データベースとの統合
- 多言語対応

**非機能要件:**
- 1000人の同時ユーザーを処理
- 99.9%の稼働率SLA
- SOC 2準拠
- 月額500ドル以下のコスト
- 複数の環境 (開発、ステージング、本番) へのデプロイ

### 実装手順

1. **アーキテクチャを設計**
2. **AZDテンプレートを作成**
3. **セキュリティ対策を実装**
4. **監視とアラートを設定**
5. **デプロイメントパイプラインを作成**
6. **ソリューションを文書化**

### 評価基準

- ✅ **機能性**: すべての要件を満たしているか？
- ✅ **セキュリティ**: ベストプラクティスが実装されているか？
- ✅ **スケーラビリティ**: 負荷に対応できるか？
- ✅ **保守性**: コードとインフラが整理されているか？
- ✅ **コスト**: 予算内に収まっているか？

## 追加リソース

### Microsoftドキュメント
- [Azure Developer CLIドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAIサービスドキュメント](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundryドキュメント](https://learn.microsoft.com/azure/ai-studio/)

### サンプルテンプレート
- [Azure OpenAIチャットアプリ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAIチャットアプリクイックスタート](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contosoチャット](https://github.com/Azure-Samples/contoso-chat)

### コミュニティリ
おめでとうございます！AIワークショップラボを完了しました。これで以下のことができるようになったはずです：

- ✅ 既存のAIアプリケーションをAZDテンプレートに変換する
- ✅ 本番環境対応のAIアプリケーションをデプロイする
- ✅ AIワークロードのセキュリティベストプラクティスを実装する
- ✅ AIアプリケーションのパフォーマンスを監視・最適化する
- ✅ よくあるデプロイメントの問題をトラブルシュートする

### 次のステップ
1. これらのパターンを自身のAIプロジェクトに適用する
2. テンプレートをコミュニティに還元する
3. Microsoft Foundry Discordに参加して継続的なサポートを受ける
4. マルチリージョンデプロイメントなどの高度なトピックを探求する

---

**ワークショップのフィードバック**: [Microsoft Foundry Discord #Azureチャンネル](https://discord.gg/microsoft-azure)で体験を共有して、このワークショップの改善にご協力ください。

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前章**: [AIモデルのデプロイメント](ai-model-deployment.md)
- **➡️ 次章**: [本番環境AIのベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 設定](../getting-started/configuration.md)

**ヘルプが必要ですか？** AZDやAIデプロイメントに関するサポートやディスカッションのために、コミュニティに参加してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->