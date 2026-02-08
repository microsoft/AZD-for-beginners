# AI ワークショップ ラボ: AI ソリューションを AZD デプロイ可能にする

**章のナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前へ**: [AI モデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番向け AI ベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)

## ワークショップ概要

このハンズオンラボでは、既存の AI テンプレートを取得し、Azure Developer CLI (AZD) を使用してデプロイするプロセスを開発者に案内します。Microsoft Foundry サービスを使った本番向け AI デプロイの必須パターンを学びます。

**所要時間:** 2〜3時間  
**レベル:** 中級  
**前提条件:** 基本的な Azure の知識、AI/ML の概念に関する基本的な理解

## 🎓 学習目標

このワークショップ終了時には、以下ができるようになります:
- ✅ 既存の AI アプリケーションを AZD テンプレートに変換する
- ✅ AZD を使って Microsoft Foundry サービスを構成する
- ✅ AI サービス向けの安全な資格情報管理を実装する
- ✅ 監視を備えた本番対応の AI アプリケーションをデプロイする
- ✅ 一般的な AI デプロイの問題をトラブルシューティングする

## 前提条件

### 必要なツール
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) がインストールされている
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) がインストールされている
- [Git](https://git-scm.com/) がインストールされている
- コードエディタ (VS Code 推奨)

### Azure リソース
- contributor アクセス権を持つ Azure サブスクリプション
- Azure OpenAI サービスへのアクセス（またはアクセスをリクエストする権限）
- リソース グループ作成の権限

### 知識の前提
- Azure サービスに関する基本的な理解
- コマンドラインインターフェースに慣れていること
- AI/ML の基本概念（API、モデル、プロンプト）

## ラボ設定

### ステップ1: 環境準備

1. **ツールのインストールを確認する:**
```bash
# AZD のインストールを確認する
azd version

# Azure CLI を確認する
az --version

# Azure にログインする
az login
azd auth login
```

2. **ワークショップのリポジトリをクローンする:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## モジュール1: AI アプリケーションのための AZD 構成の理解

### AI 用 AZD テンプレートの構成要素

AI 対応の AZD テンプレートの主要ファイルを確認します:

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

### **ラボ演習 1.1: 設定を確認する**

1. **azure.yaml ファイルを調べる:**
```bash
cat azure.yaml
```

**確認すべき点:**
- AI コンポーネントのサービス定義
- 環境変数のマッピング
- ホスト構成

2. **main.bicep インフラストラクチャを確認する:**
```bash
cat infra/main.bicep
```

**特定すべき主要な AI パターン:**
- Azure OpenAI サービスのプロビジョニング
- Cognitive Search の統合
- 安全なキー管理
- ネットワークセキュリティの構成

### **議論のポイント:** なぜこれらのパターンが AI にとって重要なのか

- **サービス依存関係**: AI アプリはしばしば複数の連携するサービスを必要とする
- **セキュリティ**: API キーとエンドポイントは安全に管理する必要がある
- **スケーラビリティ**: AI ワークロードは独自のスケーリング要件を持つ
- **コスト管理**: AI サービスは適切に構成されていないと高額になる可能性がある

## モジュール2: 最初の AI アプリケーションをデプロイする

### ステップ2.1: 環境の初期化

1. **新しい AZD 環境を作成する:**
```bash
azd env new myai-workshop
```

2. **必要なパラメーターを設定する:**
```bash
# 優先する Azure リージョンを設定してください
azd env set AZURE_LOCATION eastus

# 任意: 特定の OpenAI モデルを設定
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ステップ2.2: インフラストラクチャとアプリケーションをデプロイする

1. **AZD でデプロイする:**
```bash
azd up
```

**`azd up` 実行中に起きること:**
- ✅ Azure OpenAI サービスをプロビジョニングする
- ✅ Cognitive Search サービスを作成する
- ✅ ウェブアプリ用の App Service をセットアップする
- ✅ ネットワーキングとセキュリティを構成する
- ✅ アプリケーションコードをデプロイする
- ✅ 監視とログ記録をセットアップする

2. **デプロイの進行状況を監視する** と作成されているリソースを確認する。

### ステップ2.3: デプロイを検証する

1. **デプロイされたリソースを確認する:**
```bash
azd show
```

2. **デプロイされたアプリケーションを開く:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI 機能をテストする:**
   - ウェブアプリケーションに移動する
   - サンプルクエリを試す
   - AI の応答が正しく動作することを確認する

### **ラボ演習 2.1: トラブルシューティング演習**

**シナリオ**: デプロイは成功したが AI が応答しない。

**確認すべき一般的な問題:**
1. **OpenAI API キー**: 正しく設定されているか確認する
2. **モデルの利用可能性**: お使いのリージョンがそのモデルをサポートしているか確認する
3. **ネットワーク接続性**: サービス間で通信できることを確認する
4. **RBAC の権限**: アプリが OpenAI にアクセスできるか確認する

**デバッグ用コマンド:**
```bash
# 環境変数を確認する
azd env get-values

# デプロイのログを表示する
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI のデプロイ状況を確認する
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## モジュール3: ニーズに合わせた AI アプリケーションのカスタマイズ

### ステップ3.1: AI 設定を変更する

1. **OpenAI モデルを更新する:**
```bash
# 利用可能であれば別のモデルに変更してください
azd env set AZURE_OPENAI_MODEL gpt-4

# 新しい構成で再デプロイしてください
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

### ステップ3.2: 環境固有の構成

**ベストプラクティス**: 開発と本番で異なる構成を使う。

1. **本番環境を作成する:**
```bash
azd env new myai-production
```

2. **本番用のパラメーターを設定する:**
```bash
# 本番環境では通常、より上位のSKUを使用します
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 追加のセキュリティ機能を有効にする
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ラボ演習 3.1: コスト最適化**

**課題**: コスト効率の良い開発向けにテンプレートを構成する。

**タスク:**
1. 無料/ベーシック層に設定できる SKU を特定する
2. 最小コストにするための環境変数を設定する
3. デプロイして本番構成とコストを比較する

**解答のヒント:**
- 可能な場合は Cognitive Services に F0（無料）層を使用する
- 開発環境では Search Service に Basic 層を使用する
- Functions には Consumption プランの使用を検討する

## モジュール4: セキュリティと本番向けベストプラクティス

### ステップ4.1: 資格情報の安全な管理

**現在の課題**: 多くの AI アプリが API キーをハードコーディングしたり安全でないストレージを使用している。

**AZD の解決策**: Managed Identity と Key Vault の統合。

1. **テンプレートのセキュリティ構成を確認する:**
```bash
# Key Vault とマネージド ID の構成を確認する
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity が機能しているか確認する:**
```bash
# ウェブアプリが正しいアイデンティティ構成になっているか確認する
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ステップ4.2: ネットワークセキュリティ

1. **プライベートエンドポイントを有効にする**（まだ構成されていない場合）:

bicep テンプレートに以下を追加する:
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

2. **AI 専用の監視を設定する:**

AI 操作のカスタムメトリクスを追加する:
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

**タスク**: デプロイをセキュリティのベストプラクティスに照らしてレビューする。

**チェックリスト:**
- [ ] コードや構成にハードコーディングされた秘密がない
- [ ] サービス間認証に Managed Identity が使用されている
- [ ] Key Vault に機密構成が格納されている
- [ ] ネットワークアクセスが適切に制限されている
- [ ] 監視とログ記録が有効になっている

## モジュール5: 自分の AI アプリケーションを変換する

### ステップ5.1: 評価ワークシート

**アプリを変換する前に**、以下の質問に答えてください:

1. アプリケーションのアーキテクチャ:
   - アプリはどの AI サービスを使用しているか？
   - どのようなコンピュートリソースが必要か？
   - データベースが必要か？
   - サービス間の依存関係は何か？

2. セキュリティ要件:
   - アプリはどのような機密データを扱うか？
   - どのようなコンプライアンス要件があるか？
   - プライベートネットワーキングが必要か？

3. スケーリング要件:
   - 想定される負荷はどの程度か？
   - オートスケーリングが必要か？
   - 地域要件はあるか？

### ステップ5.2: AZD テンプレートを作成する

**このパターンに従ってアプリを変換する:**

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

**課題**: ドキュメント処理用 AI アプリの AZD テンプレートを作成する。

**要件:**
- コンテンツ解析のための Azure OpenAI
- OCR のための Document Intelligence
- ドキュメントアップロード用の Storage Account
- 処理ロジック用の Function App
- ユーザーインターフェース用の Web アプリ

**ボーナスポイント:**
- 適切なエラーハンドリングを追加する
- コスト見積もりを含める
- 監視ダッシュボードを設定する

## モジュール6: よくある問題のトラブルシューティング

### 一般的なデプロイの問題

#### 問題1: OpenAI サービスの割当量を超えた
**症状:** 割当量エラーでデプロイが失敗する
**解決策:**
```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus

# クォータ増加を申請するか、別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題2: モデルがリージョンで利用できない
**症状:** AI の応答が失敗する、またはモデルのデプロイにエラーが発生する
**解決策:**
```bash
# 地域ごとのモデルの利用可否を確認する
az cognitiveservices model list --location eastus

# 利用可能なモデルに更新する
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 問題3: 権限の問題
**症状:** AI サービスに呼び出しを行う際に 403 Forbidden エラーが発生する
**解決策:**
```bash
# 役割の割り当てを確認
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 不足している役割を追加
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### パフォーマンスの問題

#### 問題4: AI の応答が遅い
**調査手順:**
1. Application Insights でパフォーマンスメトリクスを確認する
2. Azure ポータルで OpenAI サービスのメトリクスを確認する
3. ネットワーク接続性とレイテンシを確認する

**解決策:**
- 共通クエリのキャッシュを実装する
- ユースケースに適した OpenAI モデルを使用する
- 高負荷シナリオではリードレプリカを検討する

### **ラボ演習 6.1: デバッグチャレンジ**

**シナリオ**: デプロイは成功したが、アプリケーションが 500 エラーを返す。

**デバッグタスク:**
1. アプリケーションログを確認する
2. サービスの接続性を確認する
3. 認証をテストする
4. 設定を見直す

**使用するツール:**
- デプロイ概要の確認には `azd show`
- 詳細なサービスログには Azure ポータル
- アプリケーションのテレメトリには Application Insights

## モジュール7: 監視と最適化

### ステップ7.1: 包括的な監視の設定

1. **カスタムダッシュボードを作成する:**

Azure ポータルに移動し、以下を含むダッシュボードを作成する:
- OpenAI のリクエスト数とレイテンシ
- アプリケーションのエラー率
- リソース利用率
- コスト追跡

2. **アラートを設定する:**
```bash
# エラー率が高い場合のアラート
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

2. **コスト管理策を実装する:**
- 予算アラートを設定する
- オートスケーリングポリシーを使用する
- リクエストキャッシュを実装する
- OpenAI のトークン使用量を監視する

### **ラボ演習 7.1: パフォーマンス最適化**

**タスク**: パフォーマンスとコストの両面で AI アプリケーションを最適化する。

**改善すべき指標:**
- 平均応答時間を 20% 減らす
- 月額コストを 15% 減らす
- 99.9% の稼働率を維持する

**試すべき戦略:**
- 応答のキャッシュを実装する
- トークン効率のためにプロンプトを最適化する
- 適切なコンピュート SKU を使用する
- 適切なオートスケーリングを設定する

## 最終チャレンジ: エンドツーエンドの実装

### チャレンジのシナリオ

次の要件を満たす本番対応の AI 搭載カスタマーサービスチャットボットの作成を任されました:

**機能要件:**
- 顧客対応用のウェブインターフェース
- 応答のための Azure OpenAI との統合
- Cognitive Search を使用したドキュメント検索機能
- 既存の顧客データベースとの統合
- 多言語対応

**非機能要件:**
- 1000 同時ユーザーを処理する
- 99.9% の稼働率 SLA
- SOC 2 準拠
- コストを月額 $500 未満に収める
- 複数の環境（dev、staging、prod）にデプロイする

### 実装手順

1. アーキテクチャを設計する
2. AZD テンプレートを作成する
3. セキュリティ対策を実装する
4. 監視とアラートを設定する
5. デプロイパイプラインを作成する
6. ソリューションを文書化する

### 評価基準

- ✅ **機能性**: すべての要件を満たしているか？
- ✅ **セキュリティ**: ベストプラクティスが実装されているか？
- ✅ **スケーラビリティ**: 負荷に耐えられるか？
- ✅ **保守性**: コードとインフラは整理されているか？
- ✅ **コスト**: 予算内に収まっているか？

## 追加リソース

### Microsoft ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### サンプルテンプレート
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### コミュニティリソース
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 修了証
おめでとうございます！AI ワークショップ ラボを修了しました。これで次のことができるようになっているはずです:

- ✅ 既存の AI アプリケーションを AZD テンプレートに変換する
- ✅ 本番稼働可能な AI アプリケーションをデプロイする
- ✅ AI ワークロードのセキュリティ ベストプラクティスを実装する
- ✅ AI アプリケーションのパフォーマンスを監視および最適化する
- ✅ 一般的なデプロイ問題をトラブルシューティングする

### 次のステップ
1. これらのパターンを自分の AI プロジェクトに適用する
2. テンプレートをコミュニティに還元する
3. 継続的なサポートのために Microsoft Foundry Discord に参加する
4. マルチリージョン展開などの高度なトピックを探求する

---

**ワークショップのフィードバック**: このワークショップの改善にご協力ください。ご経験を [Microsoft Foundry Discord の #Azure チャンネル](https://discord.gg/microsoft-azure) で共有してください。

---

**チャプター ナビゲーション:**
- **📚 コース ホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AI ファースト開発
- **⬅️ 前へ**: [AI モデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番環境向け AI のベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 構成](../chapter-03-configuration/configuration.md)

**助けが必要ですか?** AZD と AI のデプロイに関するサポートや議論のためにコミュニティに参加してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書はAI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があります。原文（原言語の文書）を正式な情報源としてご参照ください。重要な情報については、専門の翻訳者による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈の相違についても、一切の責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->