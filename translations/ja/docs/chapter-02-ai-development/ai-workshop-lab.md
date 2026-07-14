# AI ワークショップラボ: AI ソリューションを AZD でデプロイ可能にする

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番AIベストプラクティス](production-ai-practices.md)
- **🚀 次の章**: [第3章: 構成](../chapter-03-configuration/configuration.md)

## ワークショップ概要

このハンズオンラボでは、既存のAIテンプレートを使用し、Azure Developer CLI（AZD）を使ったデプロイ手順を開発者が学べます。Microsoft Foundryサービスを使った本番AIデプロイの重要なパターンを習得します。

> **検証ノート（2026-07-13）:** 本ワークショップは `azd` `1.27.1` で検証済みです。ローカルのインストールが古い場合は、認証、テンプレートおよびデプロイのワークフローを下記と一致させるために先にAZDをアップデートしてください。

**所要時間:** 2〜3時間  
**レベル:** 中級  
**前提条件:** 基本的なAzure知識、AI/MLの概念理解

## 🎓 学習目標

このワークショップ終了時には以下ができるようになります:
- ✅ 既存AIアプリをAZDテンプレート利用に変換する
- ✅ Microsoft FoundryサービスをAZDで構成する
- ✅ AIサービス向けの安全な資格情報管理を実装する
- ✅ 監視を備えた本番対応AIアプリをデプロイする
- ✅ 一般的なAIデプロイ問題をトラブルシュートする

## 前提条件

### 必要なツール
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) インストール済み
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) インストール済み
- [Git](https://git-scm.com/) インストール済み
- コードエディター（VS Code推奨）

### Azureリソース
- コントリビューターアクセス権を持つAzureサブスクリプション
- Microsoft Foundry Modelsサービスへのアクセス（またはアクセス権申請可能）
- リソースグループ作成権限

### 知識の前提
- Azureサービスの基本理解
- コマンドライン操作に慣れていること
- 基本的なAI/ML概念（API、モデル、プロンプト）

## ラボセットアップ

### ステップ1: 環境準備

1. **ツールのインストール確認：**
```bash
# AZDのインストールを確認してください
azd version

# Azure CLIを確認してください
az --version

# AZDのワークフローのためにAzureにログインしてください
azd auth login

# 診断中にazコマンドを実行する予定がある場合にのみAzure CLIにログインしてください
az login
```

複数テナントを跨いだ作業やサブスクリプションが自動検出されない場合は、`azd auth login --tenant-id <tenant-id>` を再実行してください。

2. **ワークショップリポジトリをクローン：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## モジュール1: AIアプリのためのAZD構造の理解

### AI向けAZDテンプレートの構成

AI対応AZDテンプレートのキーとなるファイルを確認しましょう：

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

### **ラボ演習 1.1: 構成を探る**

1. **azure.yamlファイルを検査：**
```bash
cat azure.yaml
```

**確認ポイント:**
- AIコンポーネントのサービス定義
- 環境変数のマッピング
- ホスト構成

2. **main.bicepインフラ構成をレビュー：**
```bash
cat infra/main.bicep
```

**識別すべきAIパターン:**
- Microsoft Foundry Modelsのサービスプロビジョニング
- Azure AI Search連携
- セキュアなキー管理
- ネットワークセキュリティ構成

### **ディスカッションポイント：** なぜこれらのパターンがAIに重要か

- <strong>サービス依存関係</strong>: AIアプリは複数の連携サービスを必要とすることが多い
- <strong>セキュリティ</strong>: APIキーとエンドポイントは安全に管理する必要がある
- <strong>スケーラビリティ</strong>: AIのワークロードには独特のスケール要件がある
- <strong>コスト管理</strong>: 不適切な設定だとAIサービスが高額になる可能性がある

## モジュール2: 最初のAIアプリをデプロイ

### ステップ2.1: 環境の初期化

1. **新しいAZD環境を作成：**
```bash
azd env new myai-workshop
```

2. **必要なパラメーターを設定：**
```bash
# お好みのAzureリージョンを設定します
azd env set AZURE_LOCATION eastus

# オプション: 特定のOpenAIモデルを設定します
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ステップ2.2: インフラとアプリのデプロイ

1. **AZDでデプロイ：**
```bash
azd up
```

**`azd up` 時の処理内容:**
- ✅ Microsoft Foundry Modelsのサービスをプロビジョニング
- ✅ Azure AI Searchサービスを作成
- ✅ Webアプリ用App Serviceをセットアップ
- ✅ ネットワークとセキュリティを構成
- ✅ アプリケーションコードをデプロイ
- ✅ 監視とログを設定

2. <strong>デプロイ状況を監視</strong>し、作成されるリソースを確認しましょう。

### ステップ2.3: デプロイの検証

1. **デプロイ済みリソースを確認：**
```bash
azd show
```

2. **デプロイ済みアプリを開く：**
```bash
azd show
```

`azd show` 出力に表示されるWebエンドポイントを開く。

3. **AI機能をテスト：**
  - Webアプリにアクセス
  - サンプルクエリを試す
  - AI応答が正常に動作するか確認

### **ラボ演習 2.1: トラブルシューティング練習**

<strong>シナリオ</strong>: デプロイは成功したがAIが応答しない場合。

**よくある問題チェックリスト:**
1. **OpenAI APIキー**: 正しく設定されているか確認
2. <strong>モデルの利用可能性</strong>: 地域がモデルに対応しているか確認
3. <strong>ネットワーク接続</strong>: サービス間の通信が可能か確認
4. **RBAC権限**: アプリがOpenAIへアクセスできるか確認

**デバッグコマンド:**
```bash
# 環境変数を確認する
azd env get-values

# デプロイメントログを表示する
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAIのデプロイメント状況を確認する
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## モジュール3: ニーズに応じたAIアプリのカスタマイズ

### ステップ3.1: AI構成の修正

1. **OpenAIモデルの更新:**
```bash
# 別のモデルに変更する（お使いの地域で利用可能な場合）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 新しい構成で再デプロイする
azd deploy
```

2. **追加AIサービスの追加:**

`infra/main.bicep` を編集して Document Intelligence を追加:

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

### ステップ3.2: 環境別構成

<strong>ベストプラクティス</strong>: 開発環境と本番環境で異なる構成を使う。

1. **本番環境を作成:**
```bash
azd env new myai-production
```

2. **本番専用パラメーター設定:**
```bash
# 本番環境では通常より多くのSKUを使用します
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 追加のセキュリティ機能を有効にする
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ラボ演習 3.1: コスト最適化**

<strong>チャレンジ</strong>: コスト効果の高い開発用構成に設定しよう。

**タスク:**
1. 無料/基本ティアで設定できるSKUを特定
2. 最小コストの環境変数を設定
3. デプロイして本番構成とコスト比較

**解決のヒント:**
- 可能な場合はAzure AI ServicesにF0（無料）ティアを使う
- 開発用のSearch ServiceはBasicティアを使う
- Functionsは消費プランを検討する

## モジュール4: セキュリティと本番ベストプラクティス

### ステップ4.1: 安全な資格情報管理

<strong>現状の課題</strong>: 多くのAIアプリはAPIキーをハードコードまたは非セキュアに保存している。

**AZDの解決策**: マネージドIDとKey Vaultの統合利用。

1. **テンプレートのセキュリティ構成を確認:**
```bash
# キーボルトとマネージドIDの設定を探す
grep -r "keyVault\|managedIdentity" infra/
```

2. **マネージドIDの動作確認:**
```bash
# Webアプリに正しいID構成があるかどうかを確認する
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ステップ4.2: ネットワークセキュリティ

1. <strong>プライベートエンドポイントを有効化</strong>（未設定の場合）:

bicepテンプレートに次を追加:
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

1. **Application Insights を構成:**
```bash
# Application Insightsは自動的に構成されるべきです
# 設定を確認してください:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI特有の監視を設定:**

AI操作用のカスタムメトリックを追加:
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

<strong>タスク</strong>: デプロイにセキュリティのベストプラクティスが実装されているかレビューする。

**チェックリスト:**
- [ ] コードや設定にハードコードされた秘密情報なし
- [ ] サービス間認証にマネージドIDを使用
- [ ] Key Vaultに機密設定を保管
- [ ] ネットワークアクセスが適切に制限されている
- [ ] 監視とログが有効

## モジュール5: 自分のAIアプリを変換する

### ステップ5.1: 評価ワークシート

**アプリ変換前に次を回答:**

1. **アプリケーションアーキテクチャ:**
  - アプリはどんなAIサービスを使うか？
  - 必要な計算リソースは？
  - データベースは必要か？
  - サービス間の依存関係は？

2. **セキュリティ要件:**
  - どんな機密データを扱うか？
  - 準拠すべき規制は？
  - プライベートネットワークは必要か？

3. **スケーリング要件:**
  - 想定負荷は？
  - 自動スケールは必要か？
  - 地域別要件は？

### ステップ5.2: AZDテンプレートを作成

**このパターンに従ってアプリを変換:**

1. **基本構造を作成:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZDテンプレートを初期化します
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

3. **インフラテンプレートを作成:**

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

<strong>チャレンジ</strong>: ドキュメント処理AIアプリ向けのAZDテンプレートを作成しよう。

**要件:**
- コンテンツ解析用のMicrosoft Foundry Models
- OCR用のDocument Intelligence
- ドキュメントアップロード用ストレージアカウント
- 処理ロジック用Function App
- ユーザーインターフェース用Webアプリ

**ボーナスポイント:**
- 適切なエラーハンドリングを追加
- コスト見積もりを含める
- 監視ダッシュボードをセットアップ

## モジュール6: よくある問題のトラブルシューティング

### 一般的なデプロイ問題

#### 問題1: OpenAIサービスのクォータ超過
**症状:** クォータエラーでデプロイ失敗
**解決策:**
```bash
# 現在のクォータを確認する
az cognitiveservices usage list --location eastus

# クォータの増加をリクエストするか、別のリージョンを試す
azd env set AZURE_LOCATION westus2
azd up
```

#### 問題2: モデルが地域で利用できない
**症状:** AI応答失敗またはモデルデプロイエラー
**解決策:**
```bash
# 地域ごとのモデルの利用可能性を確認する
az cognitiveservices model list --location eastus

# 利用可能なモデルに更新する
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 問題3: 権限関連の問題
**症状:** AIサービス呼び出し時に403 Forbiddenエラー
**解決策:**
```bash
# ロールの割り当てを確認する
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 失われたロールを追加する
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### パフォーマンス問題

#### 問題4: AI応答が遅い
**調査手順:**
1. Application Insightsでパフォーマンス指標を確認
2. AzureポータルのOpenAIサービス指標をレビュー
3. ネットワーク接続と遅延を確認

**解決策:**
- よくあるクエリをキャッシュする
- ユースケースに合ったOpenAIモデルを選ぶ
- 高負荷時に読み取りレプリカを検討

### **ラボ演習 6.1: デバッグチャレンジ**

<strong>シナリオ</strong>: デプロイ成功だがアプリケーションが500エラーを返す。

**デバッグタスク:**
1. アプリケーションログを確認
2. サービス接続を確認
3. 認証をテスト
4. 設定をレビュー

**使用ツール:**
- `azd show` でデプロイ概要確認
- Azureポータルでサービスログ詳細確認
- Application Insightsでアプリテレメトリ確認

## モジュール7: 監視と最適化

### ステップ7.1: 包括的な監視をセットアップ

1. **カスタムダッシュボードを作成:**

Azureポータルで以下を含むダッシュボードを作成:
- OpenAIリクエスト数と遅延
- アプリエラー率
- リソース利用率
- コスト追跡

2. **アラートを設定:**
```bash
# 高いエラー率の警告
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
# Azure CLI を使用してコストデータを取得する
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **コスト制御を実施:**
- 予算アラートを設定
- オートスケーリングポリシーを使う
- リクエストキャッシュを導入
- OpenAIのトークン使用量を監視

### **ラボ演習 7.1: パフォーマンス最適化**

<strong>タスク</strong>: AIアプリのパフォーマンスとコストを最適化せよ。

**改善目標:**
- 平均応答時間を20%短縮
- 月額コストを15%削減
- 99.9%の稼働率を維持

**試すべき戦略:**
- 応答キャッシュを導入
- トークン効率を考慮したプロンプト最適化
- 適切な計算SKUを選ぶ
- 適切なオートスケール設定

## 最終チャレンジ: エンドツーエンド実装

### チャレンジシナリオ

本番対応のAI搭載カスタマーサービスチャットボットを以下の要件で作成せよ:

**機能要件:**
- 顧客対応用のWebインターフェース
- Microsoft Foundry Modelsを利用した応答生成
- Azure AI Searchを使った文書検索機能
- 既存顧客データベースとの連携
- 多言語対応

**非機能要件:**
- 同時1000ユーザー対応
- 99.9%の稼働率SLA
- SOC 2コンプライアンス対応
- 月額500ドル以内のコスト
- 複数環境（開発、ステージング、本番）にデプロイ

### 実装ステップ

1. <strong>アーキテクチャ設計</strong>
2. **AZDテンプレート作成**
3. <strong>セキュリティ対策実装</strong>
4. <strong>監視とアラート設定</strong>
5. <strong>デプロイパイプライン作成</strong>
6. <strong>ソリューション文書化</strong>

### 評価基準

- ✅ <strong>機能性</strong>: 要件を全て満たしているか？
- ✅ <strong>セキュリティ</strong>: ベストプラクティスが実装されているか？
- ✅ <strong>スケーラビリティ</strong>: 負荷に耐えられるか？
- ✅ <strong>保守性</strong>: コードおよびインフラが整理されているか？
- ✅ <strong>コスト</strong>: 予算内に収まっているか？

## 追加リソース

### Microsoft公式ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Modelsサービスドキュメント](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ドキュメント](https://learn.microsoft.com/azure/ai-studio/)

### サンプルテンプレート
- [Microsoft Foundry Models チャットアプリ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI チャットアプリクイックスタート](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### コミュニティリソース
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 修了証明書

おめでとうございます！AI ワークショップラボを修了しました。これで以下のことができるはずです：

- ✅ 既存のAIアプリケーションをAZDテンプレートに変換する
- ✅ 本番環境対応のAIアプリケーションをデプロイする
- ✅ AIワークロードのセキュリティベストプラクティスを実装する
- ✅ AIアプリケーションのパフォーマンスを監視し最適化する
- ✅ 一般的なデプロイメントの問題をトラブルシュートする

### 次のステップ
1. これらのパターンを自分自身のAIプロジェクトに適用する
2. テンプレートをコミュニティに還元する
3. 継続的なサポートのためにMicrosoft Foundry Discordに参加する
4. マルチリージョンデプロイなどの高度なトピックを探求する

---

<strong>ワークショップのフィードバック</strong>：ご自身の体験を[Microsoft Foundry Discord #Azure チャンネル](https://discord.gg/microsoft-azure)で共有し、このワークショップの改善にご協力ください。

---

**章のナビゲーション：**
- **📚 コースホーム**： [AZD For Beginners](../../README.md)
- **📖 現在の章**： 第2章 - AIファースト開発
- **⬅️ 前へ**：[AI Model Deployment](ai-model-deployment.md)
- **➡️ 次へ**：[Production AI Best Practices](production-ai-practices.md)
- **🚀 次の章**：[第3章: 設定](../chapter-03-configuration/configuration.md)

**お困りですか？** AZDやAIデプロイに関するサポートやディスカッションのためにコミュニティに参加してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->