<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-19T18:09:59+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ja"
}
-->
# 小売業向けマルチエージェントソリューション - インフラテンプレート

**第5章: 本番展開パッケージ**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 関連章**: [第5章: マルチエージェントAIソリューション](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 シナリオガイド**: [完全なアーキテクチャ](../retail-scenario.md)
- **🎯 クイックデプロイ**: [ワンクリック展開](../../../../examples/retail-multiagent-arm-template)

> **⚠️ インフラテンプレートのみ**  
> このARMテンプレートは、マルチエージェントシステムの**Azureリソース**を展開します。  
>  
> **展開される内容 (15-25分):**
> - ✅ Azure OpenAI (GPT-4o、GPT-4o-mini、3地域での埋め込みモデル)
> - ✅ AI検索サービス (空の状態、インデックス作成準備済み)
> - ✅ コンテナアプリ (プレースホルダーイメージ、コード展開準備済み)
> - ✅ ストレージ、Cosmos DB、Key Vault、Application Insights
>  
> **含まれない内容 (開発が必要):**
> - ❌ エージェント実装コード (顧客エージェント、在庫エージェント)
> - ❌ ルーティングロジックとAPIエンドポイント
> - ❌ フロントエンドチャットUI
> - ❌ 検索インデックススキーマとデータパイプライン
> - ❌ **推定開発時間: 80-120時間**
>  
> **このテンプレートを使用する場合:**
> - ✅ マルチエージェントプロジェクトのAzureインフラをプロビジョニングしたい
> - ✅ エージェント実装を別途開発する予定
> - ✅ 本番対応のインフラ基盤が必要
>  
> **使用しない場合:**
> - ❌ すぐに動作するマルチエージェントデモを期待している
> - ❌ 完全なアプリケーションコード例を探している

## 概要

このディレクトリには、マルチエージェント顧客サポートシステムの**インフラ基盤**を展開するための包括的なAzure Resource Manager (ARM) テンプレートが含まれています。このテンプレートは、必要なAzureサービスをすべてプロビジョニングし、適切に構成および接続された状態で、アプリケーション開発の準備を整えます。

**展開後に得られるもの:** 本番対応のAzureインフラ  
**システムを完成させるために必要なもの:** エージェントコード、フロントエンドUI、データ構成 (詳細は[アーキテクチャガイド](../retail-scenario.md)を参照)

## 🎯 展開される内容

### コアインフラ (展開後の状態)

✅ **Azure OpenAIサービス** (API呼び出し準備済み)
  - 主地域: GPT-4o展開 (20K TPM容量)
  - 副地域: GPT-4o-mini展開 (10K TPM容量)
  - 第三地域: テキスト埋め込みモデル (30K TPM容量)
  - 評価地域: GPT-4oグレーダーモデル (15K TPM容量)
  - **状態:** 完全動作可能 - 即座にAPI呼び出し可能

✅ **Azure AI検索** (空の状態 - 構成準備済み)
  - ベクトル検索機能有効化
  - 標準ティア (1パーティション、1レプリカ)
  - **状態:** サービス稼働中、インデックス作成が必要
  - **必要なアクション:** スキーマを使用して検索インデックスを作成

✅ **Azureストレージアカウント** (空の状態 - アップロード準備済み)
  - Blobコンテナ: `documents`, `uploads`
  - セキュア構成 (HTTPSのみ、公開アクセスなし)
  - **状態:** ファイル受け入れ準備済み
  - **必要なアクション:** 製品データとドキュメントをアップロード

⚠️ **コンテナアプリ環境** (プレースホルダーイメージ展開済み)
  - エージェントルーターアプリ (nginxデフォルトイメージ)
  - フロントエンドアプリ (nginxデフォルトイメージ)
  - 自動スケーリング構成 (0-10インスタンス)
  - **状態:** プレースホルダーコンテナ稼働中
  - **必要なアクション:** エージェントアプリケーションを構築して展開

✅ **Azure Cosmos DB** (空の状態 - データ準備済み)
  - データベースとコンテナ事前構成済み
  - 低遅延操作向けに最適化
  - TTL有効化による自動クリーンアップ
  - **状態:** チャット履歴を保存する準備済み

✅ **Azure Key Vault** (オプション - シークレット準備済み)
  - ソフト削除有効化
  - 管理ID用RBAC構成済み
  - **状態:** APIキーと接続文字列を保存する準備済み

✅ **Application Insights** (オプション - モニタリング稼働中)
  - Log Analyticsワークスペースに接続済み
  - カスタムメトリクスとアラート構成済み
  - **状態:** アプリケーションからのテレメトリを受信する準備済み

✅ **ドキュメントインテリジェンス** (API呼び出し準備済み)
  - S0ティア (本番ワークロード向け)
  - **状態:** アップロードされたドキュメントを処理する準備済み

✅ **Bing検索API** (API呼び出し準備済み)
  - S1ティア (リアルタイム検索向け)
  - **状態:** ウェブ検索クエリを処理する準備済み

### 展開モード

| モード | OpenAI容量 | コンテナインスタンス | 検索ティア | ストレージ冗長性 | 最適用途 |
|-------|------------|---------------------|-----------|-----------------|----------|
| **最小** | 10K-20K TPM | 0-2レプリカ | 基本 | LRS (ローカル) | 開発/テスト、学習、概念実証 |
| **標準** | 30K-60K TPM | 2-5レプリカ | 標準 | ZRS (ゾーン) | 本番、中程度のトラフィック (<10Kユーザー) |
| **プレミアム** | 80K-150K TPM | 5-10レプリカ、ゾーン冗長 | プレミアム | GRS (地理) | エンタープライズ、高トラフィック (>10Kユーザー)、99.99% SLA |

**コスト影響:**
- **最小 → 標準:** 約4倍のコスト増 ($100-370/月 → $420-1,450/月)
- **標準 → プレミアム:** 約3倍のコスト増 ($420-1,450/月 → $1,150-3,500/月)
- **選択基準:** 予想される負荷、SLA要件、予算制約

**容量計画:**
- **TPM (Tokens Per Minute):** モデル展開全体の合計
- **コンテナインスタンス:** 自動スケーリング範囲 (最小-最大レプリカ)
- **検索ティア:** クエリ性能とインデックスサイズ制限に影響

## 📋 前提条件

### 必要なツール
1. **Azure CLI** (バージョン2.50.0以上)
   ```bash
   az --version  # バージョンを確認する
   az login      # 認証する
   ```

2. **アクティブなAzureサブスクリプション** (所有者または共同作成者アクセス権)
   ```bash
   az account show  # サブスクリプションを確認する
   ```

### 必要なAzureクォータ

展開前に、ターゲット地域で十分なクォータがあることを確認してください:

```bash
# お住まいの地域でのAzure OpenAIの利用可能性を確認する
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAIのクォータを確認する（gpt-4oの例）
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Container Appsのクォータを確認する
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**最低必要クォータ:**
- **Azure OpenAI:** 3-4地域でのモデル展開
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **注意:** GPT-4oは一部地域でウェイトリストがある可能性 - [モデルの利用可能性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)を確認
- **コンテナアプリ:** 管理環境 + 2-10コンテナインスタンス
- **AI検索:** 標準ティア (ベクトル検索には基本ティアは不十分)
- **Cosmos DB:** 標準プロビジョニングスループット

**クォータ不足の場合:**
1. Azureポータル → クォータ → 増加をリクエスト
2. またはAzure CLIを使用:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. 利用可能な代替地域を検討

## 🚀 クイックデプロイ

### オプション1: Azure CLIを使用

```bash
# テンプレートファイルをクローンまたはダウンロードする
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# デプロイメントスクリプトを実行可能にする
chmod +x deploy.sh

# デフォルト設定でデプロイする
./deploy.sh -g myResourceGroup

# プレミアム機能を使用して本番環境にデプロイする
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### オプション2: Azureポータルを使用

[![Azureにデプロイ](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### オプション3: Azure CLIを直接使用

```bash
# リソースグループを作成する
az group create --name myResourceGroup --location eastus2

# テンプレートをデプロイする
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ 展開タイムライン

### 期待される内容

| フェーズ | 所要時間 | 実行内容 |
|-------|----------|--------------||
| **テンプレート検証** | 30-60秒 | AzureがARMテンプレートの構文とパラメータを検証 |
| **リソースグループ設定** | 10-20秒 | リソースグループを作成 (必要に応じて) |
| **OpenAIプロビジョニング** | 5-8分 | 3-4つのOpenAIアカウントを作成しモデルを展開 |
| **コンテナアプリ** | 3-5分 | 環境を作成しプレースホルダーコンテナを展開 |
| **検索とストレージ** | 2-4分 | AI検索サービスとストレージアカウントをプロビジョニング |
| **Cosmos DB** | 2-3分 | データベースを作成しコンテナを構成 |
| **モニタリング設定** | 2-3分 | Application InsightsとLog Analyticsを設定 |
| **RBAC構成** | 1-2分 | 管理IDと権限を構成 |
| **展開合計** | **15-25分** | 完全なインフラ準備完了 |

**展開後:**
- ✅ **インフラ準備完了:** すべてのAzureサービスがプロビジョニングされ稼働中
- ⏱️ **アプリケーション開発:** 80-120時間 (あなたの責任)
- ⏱️ **インデックス構成:** 15-30分 (スキーマが必要)
- ⏱️ **データアップロード:** データセットサイズによる
- ⏱️ **テストと検証:** 2-4時間

---

## ✅ 展開成功の確認

### ステップ1: リソースプロビジョニングの確認 (2分)

```bash
# すべてのリソースが正常にデプロイされたことを確認する
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**期待される結果:** 空のテーブル (すべてのリソースが「成功」ステータスを表示)

### ステップ2: Azure OpenAI展開の確認 (3分)

```bash
# すべてのOpenAIアカウントを一覧表示する
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# プライマリ地域のモデル展開を確認する
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**期待される結果:** 
- 3-4つのOpenAIアカウント (主、副、第三、評価地域)
- 各アカウントに1-2つのモデル展開 (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### ステップ3: インフラエンドポイントのテスト (5分)

```bash
# コンテナアプリのURLを取得する
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# ルーターエンドポイントをテストする（プレースホルダー画像が応答します）
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**期待される結果:** 
- コンテナアプリが「稼働中」ステータスを表示
- プレースホルダーnginxがHTTP 200または404で応答 (アプリケーションコードはまだなし)

### ステップ4: Azure OpenAI APIアクセスの確認 (3分)

```bash
# OpenAIのエンドポイントとキーを取得する
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# GPT-4oのデプロイをテストする
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**期待される結果:** JSONレスポンスでチャット完了 (OpenAIが機能していることを確認)

### 稼働中 vs 未稼働

**✅ 展開後に稼働中:**
- Azure OpenAIモデルが展開されAPI呼び出しを受け付ける
- AI検索サービスが稼働中 (空の状態、インデックスなし)
- コンテナアプリが稼働中 (プレースホルダーnginxイメージ)
- ストレージアカウントがアクセス可能でアップロード準備済み
- Cosmos DBがデータ操作準備済み
- Application Insightsがインフラテレメトリを収集
- Key Vaultがシークレット保存準備済み

**❌ まだ稼働していない (開発が必要):**
- エージェントエンドポイント (アプリケーションコード未展開)
- チャット機能 (フロントエンド + バックエンド実装が必要)
- 検索クエリ (検索インデックス未作成)
- ドキュメント処理パイプライン (データ未アップロード)
- カスタムテレメトリ (アプリケーション計測が必要)

**次のステップ:** [展開後の構成](../../../../examples/retail-multiagent-arm-template)を参照してアプリケーションを開発・展開

---

## ⚙️ 構成オプション

### テンプレートパラメータ

| パラメータ | タイプ | デフォルト | 説明 |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | すべてのリソース名のプレフィックス |
| `location` | string | リソースグループの場所 | 主展開地域 |
| `secondaryLocation` | string | "westus2" | マルチ地域展開の副地域 |
| `tertiaryLocation` | string | "francecentral" | 埋め込みモデルの地域 |
| `environmentName` | string | "dev" | 環境指定 (dev/staging/prod) |
| `deploymentMode` | string | "standard" | 展開構成 (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | マルチ地域展開を有効化 |
| `enableMonitoring` | bool | true | Application Insightsとログを有効化 |
| `enableSecurity` | bool | true | Key Vaultと強化セキュリティを有効化 |

### パラメータのカスタマイズ

`azuredeploy.parameters.json`を編集:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ アーキテクチャ概要

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 展開スクリプトの使用方法

`deploy.sh`スクリプトはインタラクティブな展開体験を提供します:

```bash
# ヘルプを表示
./deploy.sh --help

# 基本的なデプロイ
./deploy.sh -g myResourceGroup

# カスタム設定を使用した高度なデプロイ
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# マルチリージョンなしの開発デプロイ
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### スクリプトの特徴

- ✅ **前提条件の検証** (Azure CLI、ログイン状態、テンプレートファイル)
- ✅ **リソースグループ管理** (存在しない場合は作成)
- ✅ **テンプレート検証** 展開前
- ✅ **進捗モニタリング** カラー出力付き
- ✅ **展開出力** 表示
- ✅ **展開後のガイダンス**

## 📊 展開のモニタリング

### 展開ステータスの確認

```bash
# デプロイメントを一覧表示する
az deployment group list --resource-group myResourceGroup --output table

# デプロイメントの詳細を取得する
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# デプロイメントの進行状況を監視する
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### 展開出力

展開が成功すると、以下の出力が利用可能になります:

- **フロントエンドURL**: Webインターフェースの公開エンドポイント
- **ルーターURL**: エージェントルーターのAPIエンドポイント
- **OpenAIエンドポイント**: 主および副のOpenAIサービスエンドポイント
- **検索サービス**: Azure AI検索サービスエンドポイント
- **ストレージアカウント**: ドキュメント用ストレージアカウント名
- **Key Vault**: Key Vaultの名前 (有効化されている場合)
- **Application Insights**: モニタリングサービスの名前 (有効化されている場合)

## 🔧 展開後: 次のステップ
> **📝 重要:** インフラはデプロイ済みですが、アプリケーションコードの開発とデプロイが必要です。

### フェーズ1: エージェントアプリケーションの開発 (あなたの責任)

ARMテンプレートは、**プレースホルダーのnginxイメージを持つ空のContainer Apps**を作成します。以下を実施してください:

**必要な開発作業:**
1. **エージェントの実装** (30～40時間)
   - GPT-4o統合のカスタマーサービスエージェント
   - GPT-4o-mini統合の在庫管理エージェント
   - エージェントのルーティングロジック

2. **フロントエンド開発** (20～30時間)
   - チャットインターフェースUI (React/Vue/Angular)
   - ファイルアップロード機能
   - レスポンスのレンダリングとフォーマット

3. **バックエンドサービス** (12～16時間)
   - FastAPIまたはExpressルーター
   - 認証ミドルウェア
   - テレメトリ統合

**参照:** [アーキテクチャガイド](../retail-scenario.md) 詳細な実装パターンとコード例

### フェーズ2: AI検索インデックスの設定 (15～30分)

データモデルに一致する検索インデックスを作成します:

```bash
# 検索サービスの詳細を取得する
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# スキーマでインデックスを作成する（例）
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**リソース:**
- [AI検索インデックススキーマ設計](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [ベクター検索設定](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### フェーズ3: データのアップロード (所要時間はデータ量による)

製品データやドキュメントが揃ったら:

```bash
# ストレージアカウントの詳細を取得する
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# ドキュメントをアップロードする
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# 例: 単一ファイルをアップロードする
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### フェーズ4: アプリケーションの構築とデプロイ (8～12時間)

エージェントコードを開発したら:

```bash
# 1. 必要に応じてAzure Container Registryを作成する
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. エージェントルーターイメージをビルドしてプッシュする
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. フロントエンドイメージをビルドしてプッシュする
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. コンテナアプリをイメージで更新する
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. 環境変数を設定する
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### フェーズ5: アプリケーションのテスト (2～4時間)

```bash
# アプリケーションのURLを取得する
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# エージェントのエンドポイントをテストする（コードがデプロイされた後）
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# アプリケーションログを確認する
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### 実装リソース

**アーキテクチャと設計:**
- 📖 [完全なアーキテクチャガイド](../retail-scenario.md) - 詳細な実装パターン
- 📖 [マルチエージェント設計パターン](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**コード例:**
- 🔗 [Azure OpenAIチャットサンプル](https://github.com/Azure-Samples/azure-search-openai-demo) - RAGパターン
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - エージェントフレームワーク (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - エージェントオーケストレーション (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - マルチエージェント会話

**推定総作業時間:**
- インフラデプロイ: 15～25分 (✅ 完了)
- アプリケーション開発: 80～120時間 (🔨 あなたの作業)
- テストと最適化: 15～25時間 (🔨 あなたの作業)

## 🛠️ トラブルシューティング

### よくある問題

#### 1. Azure OpenAIのクォータ超過

```bash
# 現在のクォータ使用量を確認する
az cognitiveservices usage list --location eastus2

# クォータ増加をリクエストする
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Appsのデプロイ失敗

```bash
# コンテナアプリのログを確認する
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# コンテナアプリを再起動する
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. 検索サービスの初期化

```bash
# 検索サービスのステータスを確認する
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# 検索サービスの接続性をテストする
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### デプロイの検証

```bash
# すべてのリソースが作成されていることを検証する
az resource list \
  --resource-group myResourceGroup \
  --output table

# リソースの正常性を確認する
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 セキュリティに関する考慮事項

### キー管理
- すべてのシークレットはAzure Key Vaultに保存 (有効化時)
- Container AppsはマネージドIDを使用して認証
- ストレージアカウントはセキュアなデフォルト設定 (HTTPSのみ、パブリックBlobアクセスなし)

### ネットワークセキュリティ
- Container Appsは可能な限り内部ネットワークを使用
- 検索サービスはプライベートエンドポイントオプションで構成
- Cosmos DBは必要最小限の権限で構成

### RBAC設定
```bash
# 管理対象IDに必要なロールを割り当てる
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 コスト最適化

### コスト見積もり (月額, USD)

| モード | OpenAI | Container Apps | Search | Storage | 合計推定 |
|-------|--------|----------------|--------|---------|----------|
| 最小 | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| 標準 | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| プレミアム | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### コストモニタリング

```bash
# 予算アラートを設定する
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 更新とメンテナンス

### テンプレートの更新
- ARMテンプレートファイルをバージョン管理
- 開発環境で変更をテスト
- 更新にはインクリメンタルデプロイモードを使用

### リソースの更新
```bash
# 新しいパラメーターで更新する
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### バックアップとリカバリー
- Cosmos DBの自動バックアップ有効化
- Key Vaultのソフトデリート有効化
- Container Appのリビジョンを保持してロールバック可能

## 📞 サポート

- **テンプレートの問題:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azureサポート:** [Azureサポートポータル](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **コミュニティ:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ マルチエージェントソリューションのデプロイ準備はできましたか？**

開始コマンド: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->