<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-19T21:27:34+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "ja"
}
-->
# Azure OpenAI チャットアプリケーション

**学習レベル:** 中級 ⭐⭐ | **所要時間:** 35-45分 | **コスト:** 月額 $50-200

Azure Developer CLI (azd) を使用してデプロイされた完全な Azure OpenAI チャットアプリケーション。この例では、GPT-4 のデプロイ、セキュアな API アクセス、シンプルなチャットインターフェースを実現します。

## 🎯 学べること

- GPT-4 モデルを使用した Azure OpenAI Service のデプロイ
- Key Vault を使用した OpenAI API キーのセキュリティ保護
- Python を使ったシンプルなチャットインターフェースの構築
- トークン使用量とコストのモニタリング
- レート制限とエラーハンドリングの実装

## 📦 含まれる内容

✅ **Azure OpenAI Service** - GPT-4 モデルのデプロイ  
✅ **Python チャットアプリ** - シンプルなコマンドラインチャットインターフェース  
✅ **Key Vault 統合** - API キーのセキュアな保存  
✅ **ARM テンプレート** - 完全なインフラストラクチャコード  
✅ **コストモニタリング** - トークン使用量の追跡  
✅ **レート制限** - クォータの枯渇を防止  

## アーキテクチャ

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## 前提条件

### 必須

- **Azure Developer CLI (azd)** - [インストールガイド](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure サブスクリプション** (OpenAI アクセス付き) - [アクセス申請](https://aka.ms/oai/access)
- **Python 3.9+** - [Python のインストール](https://www.python.org/downloads/)

### 前提条件の確認

```bash
# azdバージョンを確認（1.5.0以上が必要）
azd version

# Azureログインを確認
azd auth login

# Pythonバージョンを確認
python --version  # または python3 --version

# OpenAIアクセスを確認（Azureポータルで確認）
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ 重要:** Azure OpenAI を利用するには申請が必要です。まだ申請していない場合は [aka.ms/oai/access](https://aka.ms/oai/access) をご覧ください。承認には通常 1～2 営業日かかります。

## ⏱️ デプロイのタイムライン

| フェーズ | 所要時間 | 実行内容 |
|---------|----------|----------|
| 前提条件の確認 | 2-3分 | OpenAI クォータの利用可能性を確認 |
| インフラのデプロイ | 8-12分 | OpenAI、Key Vault、モデルのデプロイ |
| アプリケーションの設定 | 2-3分 | 環境と依存関係のセットアップ |
| **合計** | **12-18分** | GPT-4 とのチャットが可能に |

**注意:** 初回の OpenAI デプロイは、モデルのプロビジョニングにより時間がかかる場合があります。

## クイックスタート

```bash
# 例に移動する
cd examples/azure-openai-chat

# 環境を初期化する
azd env new myopenai

# すべてをデプロイする（インフラストラクチャ + 設定）
azd up
# 次のプロンプトが表示されます:
# 1. Azureサブスクリプションを選択する
# 2. OpenAIが利用可能な場所を選択する（例: eastus, eastus2, westus）
# 3. デプロイメントに12～18分待つ

# Pythonの依存関係をインストールする
pip install -r requirements.txt

# チャットを開始する！
python chat.py
```

**期待される出力:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ デプロイの確認

### ステップ 1: Azure リソースの確認

```bash
# 展開されたリソースを表示
azd show

# 予想される出力は次のようになります:
# - OpenAIサービス: (リソース名)
# - Key Vault: (リソース名)
# - デプロイメント: gpt-4
# - ロケーション: eastus (または選択した地域)
```

### ステップ 2: OpenAI API のテスト

```bash
# OpenAIエンドポイントとキーを取得する
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API呼び出しをテストする
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**期待されるレスポンス:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### ステップ 3: Key Vault アクセスの確認

```bash
# Key Vault内のシークレットを一覧表示
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**期待されるシークレット:**
- `openai-api-key`
- `openai-endpoint`

**成功基準:**
- ✅ GPT-4 を使用した OpenAI サービスがデプロイされている
- ✅ API 呼び出しが有効なレスポンスを返す
- ✅ シークレットが Key Vault に保存されている
- ✅ トークン使用量の追跡が機能している

## プロジェクト構造

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## アプリケーションの機能

### チャットインターフェース (`chat.py`)

このチャットアプリケーションには以下が含まれます:

- **会話履歴** - メッセージ間のコンテキストを保持
- **トークンカウント** - 使用量を追跡し、コストを推定
- **エラーハンドリング** - レート制限や API エラーの優雅な処理
- **コスト推定** - メッセージごとのリアルタイムコスト計算
- **ストリーミング対応** - オプションでストリーミングレスポンスをサポート

### コマンド

チャット中に使用可能なコマンド:
- `quit` または `exit` - セッションを終了
- `clear` - 会話履歴をクリア
- `tokens` - 総トークン使用量を表示
- `cost` - 推定総コストを表示

### 設定 (`config.py`)

環境変数から設定を読み込み:
```python
AZURE_OPENAI_ENDPOINT  # キーボールトから
AZURE_OPENAI_API_KEY   # キーボールトから
AZURE_OPENAI_MODEL     # デフォルト: gpt-4
AZURE_OPENAI_MAX_TOKENS # デフォルト: 800
```

## 使用例

### 基本的なチャット

```bash
python chat.py
```

### カスタムモデルでのチャット

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### ストリーミング対応のチャット

```bash
python chat.py --stream
```

### 会話例

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## コスト管理

### トークンプライシング (GPT-4)

| モデル | 入力 (1K トークンあたり) | 出力 (1K トークンあたり) |
|-------|--------------------------|--------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### 月額コストの見積もり

使用パターンに基づく:

| 使用レベル | メッセージ/日 | トークン/日 | 月額コスト |
|-----------|--------------|------------|------------|
| **軽量** | 20 メッセージ | 3,000 トークン | $3-5 |
| **中程度** | 100 メッセージ | 15,000 トークン | $15-25 |
| **重度** | 500 メッセージ | 75,000 トークン | $75-125 |

**基本インフラコスト:** 月額 $1-2 (Key Vault + 最小限のコンピュート)

### コスト削減のヒント

```bash
# 1. 簡単なタスクにはGPT-3.5-Turboを使用する（20倍安い）
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. 短い応答には最大トークン数を減らす
export AZURE_OPENAI_MAX_TOKENS=400

# 3. トークン使用量を監視する
python chat.py --show-tokens

# 4. 予算アラートを設定する
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## モニタリング

### トークン使用量の確認

```bash
# Azure ポータルで:
# OpenAI リソース → メトリクス → "トークントランザクション" を選択

# または Azure CLI 経由で:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API ログの確認

```bash
# ストリーム診断ログ
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# クエリログ
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## トラブルシューティング

### 問題: "アクセス拒否" エラー

**症状:** API 呼び出し時に 403 Forbidden

**解決策:**
```bash
# 1. OpenAIアクセスが承認されていることを確認する
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. APIキーが正しいことを確認する
azd env get-value AZURE_OPENAI_API_KEY

# 3. エンドポイントURLの形式を確認する
azd env get-value AZURE_OPENAI_ENDPOINT
# 次の形式である必要があります: https://[name].openai.azure.com/
```

### 問題: "レート制限超過"

**症状:** 429 Too Many Requests

**解決策:**
```bash
# 1. 現在のクォータを確認する
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. クォータの増加をリクエストする（必要に応じて）
# Azureポータル → OpenAIリソース → クォータ → 増加をリクエスト

# 3. リトライロジックを実装する（chat.pyに既に実装済み）
# アプリケーションは指数バックオフで自動的にリトライします
```

### 問題: "モデルが見つかりません"

**症状:** デプロイメントで 404 エラー

**解決策:**
```bash
# 1. 利用可能なデプロイメントを一覧表示する
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. 環境内のモデル名を確認する
echo $AZURE_OPENAI_MODEL

# 3. 正しいデプロイメント名に更新する
export AZURE_OPENAI_MODEL=gpt-4  # または gpt-35-turbo
```

### 問題: 高いレイテンシー

**症状:** 応答時間が遅い (>5 秒)

**解決策:**
```bash
# 1. 地域の遅延を確認する
# ユーザーに最も近い地域にデプロイする

# 2. より速い応答のためにmax_tokensを減らす
export AZURE_OPENAI_MAX_TOKENS=400

# 3. より良いUXのためにストリーミングを使用する
python chat.py --stream
```

## セキュリティのベストプラクティス

### 1. API キーの保護

```bash
# キーをソース管理にコミットしないでください
# Key Vault を使用する（既に設定済み）

# 定期的にキーをローテーションする
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. コンテンツフィルタリングの実装

```python
# Azure OpenAIには組み込みのコンテンツフィルタリングが含まれています
# Azureポータルで構成します:
# OpenAIリソース → コンテンツフィルター → カスタムフィルターを作成

# カテゴリ: ヘイト、性的、暴力、自傷行為
# レベル: 低、中、高フィルタリング
```

### 3. マネージド ID の使用 (本番環境)

```bash
# 本番環境へのデプロイでは、マネージドIDを使用してください
# APIキーの代わりに（Azureでのアプリホスティングが必要です）

# infra/openai.bicep を更新して以下を含めてください:
# identity: { type: 'SystemAssigned' }
```

## 開発

### ローカルでの実行

```bash
# 依存関係をインストールする
pip install -r src/requirements.txt

# 環境変数を設定する
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# アプリケーションを実行する
python src/chat.py
```

### テストの実行

```bash
# テスト依存関係をインストールする
pip install pytest pytest-cov

# テストを実行する
pytest tests/ -v

# カバレッジ付き
pytest tests/ --cov=src --cov-report=html
```

### モデルデプロイメントの更新

```bash
# 異なるモデルバージョンをデプロイする
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## クリーンアップ

```bash
# すべてのAzureリソースを削除する
azd down --force --purge

# これにより削除されます:
# - OpenAIサービス
# - Key Vault（90日間のソフト削除付き）
# - リソースグループ
# - すべてのデプロイメントと構成
```

## 次のステップ

### この例を拡張

1. **Web インターフェースの追加** - React/Vue フロントエンドの構築
   ```bash
   # azure.yamlにフロントエンドサービスを追加
   # Azure Static Web Appsにデプロイ
   ```

2. **RAG の実装** - Azure AI Search を使用したドキュメント検索の追加
   ```python
   # Azure Cognitive Searchを統合する
   # ドキュメントをアップロードしてベクターインデックスを作成する
   ```

3. **関数呼び出しの追加** - ツール使用を有効化
   ```python
   # chat.pyで関数を定義する
   # GPT-4に外部APIを呼び出させる
   ```

4. **マルチモデル対応** - 複数モデルのデプロイ
   ```bash
   # gpt-35-turbo、埋め込みモデルを追加
   # モデルルーティングロジックを実装
   ```

### 関連例

- **[小売マルチエージェント](../retail-scenario.md)** - 高度なマルチエージェントアーキテクチャ
- **[データベースアプリ](../../../../examples/database-app)** - 永続ストレージの追加
- **[コンテナアプリ](../../../../examples/container-app)** - コンテナ化されたサービスとしてデプロイ

### 学習リソース

- 📚 [AZD 初心者向けコース](../../README.md) - メインコースホーム
- 📚 [Azure OpenAI ドキュメント](https://learn.microsoft.com/azure/ai-services/openai/) - 公式ドキュメント
- 📚 [OpenAI API リファレンス](https://platform.openai.com/docs/api-reference) - API 詳細
- 📚 [責任ある AI](https://www.microsoft.com/ai/responsible-ai) - ベストプラクティス

## 追加リソース

### ドキュメント
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - 完全ガイド
- **[GPT-4 モデル](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - モデルの機能
- **[コンテンツフィルタリング](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - 安全機能
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd リファレンス

### チュートリアル
- **[OpenAI クイックスタート](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - 初回デプロイ
- **[チャット補完](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - チャットアプリの構築
- **[関数呼び出し](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - 高度な機能

### ツール
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Web ベースのプレイグラウンド
- **[プロンプトエンジニアリングガイド](https://platform.openai.com/docs/guides/prompt-engineering)** - より良いプロンプトの作成
- **[トークン計算機](https://platform.openai.com/tokenizer)** - トークン使用量の見積もり

### コミュニティ
- **[Azure AI Discord](https://discord.gg/azure)** - コミュニティからのサポート
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A フォーラム
- **[Azure ブログ](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - 最新情報

---

**🎉 成功！** Azure OpenAI をデプロイし、動作するチャットアプリケーションを構築しました。GPT-4 の機能を探索し、さまざまなプロンプトやユースケースを試してみてください。

**質問がありますか？** [問題を報告](https://github.com/microsoft/AZD-for-beginners/issues) または [FAQ](../../resources/faq.md) を確認してください。

**コストアラート:** テストが終了したら `azd down` を実行して、継続的な料金 (~月額 $50-100) を回避してください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の利用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->