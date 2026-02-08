# AI エージェントと Azure Developer CLI

**章のナビゲーション:**
- **📚 コースホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: 第2章 - AIファースト開発
- **⬅️ 前へ**: [AIモデルのデプロイ](ai-model-deployment.md)
- **➡️ 次へ**: [本番AIの実践](production-ai-practices.md)
- **🚀 上級**: [マルチエージェントソリューション](../../examples/retail-scenario.md)

---

## はじめに

AI エージェントは、環境を認識し、意思決定を行い、特定の目標を達成するために行動を取る自律的なプログラムです。プロンプトに応答する単純なチャットボットとは異なり、エージェントは次のことができます:

- **ツールを使用** - API を呼び出す、データベースを検索する、コードを実行する
- **計画と推論** - 複雑なタスクをステップに分解する
- **コンテキストから学習** - メモリを保持し、動作を適応させる
- **協力** - 他のエージェントと協働する（マルチエージェントシステム）

このガイドでは、Azure Developer CLI (azd) を使用して AI エージェントを Azure にデプロイする方法を示します。

## 学習目標

このガイドを完了すると、次のことができるようになります:
- AI エージェントが何か、チャットボットとどのように異なるかを理解する
- AZD を使用して事前構築された AI エージェントテンプレートをデプロイする
- カスタムエージェントのために Foundry Agents を構成する
- 基本的なエージェントパターン（ツール使用、RAG、マルチエージェント）を実装する
- デプロイしたエージェントを監視およびデバッグする

## 学習成果

完了後、次のことができるようになります:
- 単一のコマンドで AI エージェントアプリケーションを Azure にデプロイする
- エージェントのツールと機能を構成する
- エージェントで検索強化生成（RAG）を実装する
- 複雑なワークフローのためにマルチエージェントアーキテクチャを設計する
- 一般的なエージェントデプロイの問題をトラブルシューティングする

---

## 🤖 エージェントはチャットボットと何が違う？

| 特徴 | チャットボット | AI エージェント |
|---------|---------|----------|
| **動作** | プロンプトに応答する | 自律的に行動を取る |
| **ツール** | なし | APIを呼び出す、検索、コード実行が可能 |
| **メモリ** | セッションベースのみ | セッションを超えて永続的なメモリ |
| **計画** | 単一の応答 | 複数ステップの推論 |
| **協力** | 単一の存在 | 他のエージェントと協働できる |

### シンプルな類推

- **チャットボット** = 案内デスクで質問に答える親切な人
- **AI エージェント** = 電話をかけたり、予約を入れたり、タスクを完了したりする個人アシスタント

---

## 🚀 クイックスタート: 最初のエージェントをデプロイする

### オプション1: Foundry Agents テンプレート（推奨）

```bash
# AIエージェントのテンプレートを初期化する
azd init --template get-started-with-ai-agents

# Azure にデプロイする
azd up
```

**デプロイされるもの：**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**時間：** 約15–20分
**コスト：** 約$100-150/月（開発）

### オプション2: OpenAI Agent with Prompty

```bash
# Promptyベースのエージェントテンプレートを初期化する
azd init --template agent-openai-python-prompty

# Azure にデプロイする
azd up
```

**デプロイされるもの：**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ サンプルのエージェント実装

**時間：** 約10–15分
**コスト：** 約$50-100/月（開発）

### オプション3: RAG チャットエージェント

```bash
# RAGチャットテンプレートを初期化
azd init --template azure-search-openai-demo

# Azure にデプロイ
azd up
```

**デプロイされるもの：**
- ✅ Azure OpenAI
- ✅ Azure AI Search with sample data
- ✅ ドキュメント処理パイプライン
- ✅ 引用付きチャットインターフェース

**時間：** 約15–25分
**コスト：** 約$80-150/月（開発）

---

## 🏗️ エージェントアーキテクチャパターン

### パターン1: ツールを持つ単一エージェント

最も単純なエージェントパターン—複数のツールを使用できる単一のエージェント。

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**適している例：**
- カスタマーサポートボット
- リサーチアシスタント
- データ分析エージェント

**AZD テンプレート：** `azure-search-openai-demo`

### パターン2: RAG エージェント（Retrieval-Augmented Generation）

応答を生成する前に関連文書を検索するエージェント。

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**適している例：**
- 企業のナレッジベース
- ドキュメントQ&Aシステム
- コンプライアンスや法務調査

**AZD テンプレート：** `azure-search-openai-demo`

### パターン3: マルチエージェントシステム

複雑なタスクで協働する複数の専門化されたエージェント。

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**適している例：**
- 複雑なコンテンツ生成
- 複数ステップのワークフロー
- 異なる専門知識を必要とするタスク

**詳細：** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ エージェントツールの構成

エージェントはツールを使用できると強力になります。一般的なツールを構成する方法は次のとおりです:

### Foundry Agents におけるツールの構成

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# カスタムツールを定義する
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# ツールを用いてエージェントを作成する
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境構成

```bash
# エージェント固有の環境変数を設定する
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 更新された構成でデプロイする
azd deploy
```

---

## 📊 エージェントの監視

### Application Insights の統合

すべての AZD エージェントテンプレートには監視用の Application Insights が含まれています：

```bash
# モニタリングダッシュボードを開く
azd monitor --overview

# ライブログを表示
azd monitor --logs

# ライブメトリクスを表示
azd monitor --live
```

### 追跡すべき主要メトリクス

| メトリクス | 説明 | 目標 |
|--------|-------------|--------|
| レスポンス遅延 | 応答生成に要する時間 | < 5秒 |
| トークン使用量 | リクエストごとのトークン数 | コストを監視 |
| ツール呼び出し成功率 | ツール実行の成功割合 | > 95% |
| エラーレート | 失敗したエージェントリクエスト | < 1% |
| ユーザー満足度 | フィードバックスコア | > 4.0/5.0 |

### エージェントのカスタムロギング

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 コストに関する考慮事項

### パターン別推定月額コスト

| パターン | 開発環境 | 本番 |
|---------|-----------------|------------|
| 単一エージェント | $50-100 | $200-500 |
| RAG エージェント | $80-150 | $300-800 |
| マルチエージェント（2-3エージェント） | $150-300 | $500-1,500 |
| エンタープライズマルチエージェント | $300-500 | $1,500-5,000+ |

### コスト最適化のヒント

1. **簡単なタスクには GPT-4o-mini を使用する**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **繰り返しのクエリにはキャッシュを実装する**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **トークン制限を設定する**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # 応答の長さを制限する
   )
   ```

4. **使用していないときはゼロスケールにする**
   ```bash
   # Container Apps は自動的にゼロまでスケールします
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 エージェントのトラブルシューティング

### よくある問題と解決策

<details>
<summary><strong>❌ エージェントがツール呼び出しに応答しない</strong></summary>

```bash
# ツールが正しく登録されているか確認する
azd show

# OpenAI のデプロイを確認する
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# エージェントのログを確認する
azd monitor --logs
```

**一般的な原因：**
- ツールの関数シグネチャの不一致
- 必要な権限が欠落している
- API エンドポイントにアクセスできない
</details>

<details>
<summary><strong>❌ エージェント応答の高いレイテンシ</strong></summary>

```bash
# ボトルネックは Application Insights で確認する
azd monitor --live

# より高速なモデルの使用を検討する
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**最適化のヒント：**
- ストリーミング応答を使用する
- 応答キャッシュを実装する
- コンテキストウィンドウのサイズを減らす
</details>

<details>
<summary><strong>❌ エージェントが誤ったまたは幻覚的な情報を返す</strong></summary>

```python
# システムプロンプトを改善する
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# グラウンディングのための検索機能を追加する
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # 応答を文書に基づいて行う
)
```
</details>

<details>
<summary><strong>❌ トークン制限超過エラー</strong></summary>

```python
# コンテキストウィンドウの管理を実装する
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # 大まかな見積もり
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 ハンズオン演習

### 演習1: 基本的なエージェントをデプロイする（20分）

**目標：** AZD を使用して最初の AI エージェントをデプロイする

```bash
# ステップ1: テンプレートを初期化する
azd init --template get-started-with-ai-agents

# ステップ2: Azureにログインする
azd auth login

# ステップ3: デプロイする
azd up

# ステップ4: エージェントをテストする
# 出力に表示されているURLを開く

# ステップ5: クリーンアップする
azd down --force --purge
```

**達成基準：**
- [ ] エージェントが質問に応答する
- [ ] 監視ダッシュボードにアクセスできる
- [ ] リソースが正常にクリーンアップされる

### 演習2: カスタムツールを追加する（30分）

**目標：** カスタムツールでエージェントを拡張する

1. エージェントテンプレートをデプロイする
2. 新しいツール関数を作成する：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 天気サービスへのAPI呼び出し
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. ツールをエージェントに登録する
4. エージェントが新しいツールを使用するかテストする

**達成基準：**
- [ ] エージェントが天気に関するクエリを認識する
- [ ] ツールが正しく呼び出される
- [ ] 応答に天気情報が含まれる

### 演習3: RAG エージェントを構築する（45分）

**目標：** ドキュメントから質問に回答するエージェントを作成する

```bash
# RAGテンプレートをデプロイする
azd init --template azure-search-openai-demo
azd up

# あなたのドキュメントをアップロードする
# (テンプレートのデータ取り込みガイドに従う)

# ドメイン固有の質問でテストする
```

**達成基準：**
- [ ] アップロードしたドキュメントからエージェントが回答する
- [ ] 応答に引用が含まれる
- [ ] 範囲外の質問で幻覚が発生しない

---

## 📚 次のステップ

AI エージェントを理解したので、これらの上級トピックを探求してください:

| トピック | 説明 | リンク |
|-------|-------------|------|
| **マルチエージェントシステム** | 複数の協働するエージェントでシステムを構築する | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **協調パターン** | オーケストレーションと通信パターンを学ぶ | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **本番デプロイ** | 企業向けのエージェントデプロイ | [Production AI Practices](production-ai-practices.md) |
| **エージェント評価** | エージェントのパフォーマンスをテストおよび評価する | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 追加リソース

### 公式ドキュメント
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### エージェント向け AZD テンプレート
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### コミュニティリソース
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**ナビゲーション**
- **前のレッスン**: [AIモデルのデプロイ](ai-model-deployment.md)
- **次のレッスン**: [本番AIの実践](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書はAI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性の確保に努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることにご注意ください。原文（原語の文書）を正式な情報源とみなしてください。重要な情報については、専門の翻訳者による人間翻訳をお勧めします。本翻訳の利用に起因する誤解や誤訳について、当方は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->