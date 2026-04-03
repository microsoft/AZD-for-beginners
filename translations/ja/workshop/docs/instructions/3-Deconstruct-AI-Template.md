# 3. テンプレートの分解

!!! tip "このモジュールの終了時には次のことができるようになります"

    - [ ] Azure支援のためにMCPサーバーとともにGitHub Copilotを有効化する
    - [ ] AZDテンプレートのフォルダ構成とコンポーネントを理解する
    - [ ] インフラストラクチャ・アズ・コード（Bicep）の構成パターンを探索する
    - [ ] **演習 3:** GitHub Copilot を使用してリポジトリのアーキテクチャを探索・理解する 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**しかし今は、プロジェクト構造とコードベースを理解し、事前の経験や AZD の理解がなくても AZD テンプレートをカスタマイズできるようになる必要があります！**

---

## 1. GitHub Copilot を有効にする

### 1.1 GitHub Copilot Chat をインストール

It's time to explore [GitHub Copilot（エージェントモード）](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot 無料プラン](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, and it is often already available in Codespaces or dev container environments. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat is ready**.

### 1.2 MCP サーバーのインストール

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP サーバー](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP サーバー](../../../../../workshop/docs/instructions)

To activate these:

1. Create a file called `.vscode/mcp.json` if it does not exist
1. Copy the following into that file - and start the servers!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "`npx` がインストールされていないというエラーが発生する場合があります（修正方法を表示するには展開してください）"

      修正するには、`.devcontainer/devcontainer.json` ファイルを開き、features セクションに次の行を追加します。その後、コンテナを再ビルドしてください。これで `npx` がインストールされているはずです。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat をテストする

**まず VS Code のコマンドラインから `azd auth login` を使用して Azure に認証してください。直接 Azure CLI コマンドを実行する予定がある場合のみ `az login` も使用してください。**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `私の Azure リソース グループを一覧表示`
1. `#foundry 現在のデプロイメントを一覧表示`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search Azure Developer CLI とは何ですか?`
1. `#microsoft_docs_search 展開済みモデルとチャットするための Python チュートリアルを見せて`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `AAD を使用したインタラクティブなチャットクライアントの Python コード例を教えて`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

<strong>これでテンプレートリポジトリの探索を開始する準備が整いました</strong>

---

## 2. アーキテクチャの分解

??? prompt "ASK: docs/images/architecture.png のアプリケーションアーキテクチャを1段落で説明してください"

      このアプリケーションは Azure 上に構築された AI 搭載のチャットアプリケーションで、最新のエージェントベースのアーキテクチャを示しています。ソリューションの中心は Azure Container App で、主要なアプリケーションコードをホストし、ユーザーの入力を処理して AI エージェントを通じてインテリジェントな応答を生成します。 
      
      アーキテクチャは Microsoft Foundry Project を AI 機能の基盤として活用し、基盤となる言語モデル（例: gpt-4.1-mini）やエージェント機能を提供する Azure AI Services に接続します。ユーザーのやり取りは React ベースのフロントエンドから FastAPI バックエンドへ流れ、バックエンドはコンテキストに沿った応答を生成するために AI エージェントサービスと通信します。 
      
      システムはファイル検索または Azure AI Search サービスを通じたナレッジ取得機能を組み込み、エージェントがアップロードされた文書から情報を取得して引用できるようにします。運用面の優秀性のために、アーキテクチャにはトレーシング、ログ記録、パフォーマンス最適化のための Application Insights と Log Analytics Workspace を含む包括的なモニタリングが組み込まれています。 
      
      Azure Storage はアプリケーションデータとファイルアップロードのための blob ストレージを提供し、Managed Identity は資格情報を保存することなく Azure リソース間の安全なアクセスを確保します。ソリューション全体はスケーラビリティと保守性を考慮して設計されており、コンテナ化されたアプリケーションは負荷に応じて自動的にスケールし、Azure のマネージドサービスのエコシステムを通じて組み込みのセキュリティ、モニタリング、CI/CD 機能を提供します。

![アーキテクチャ](../../../../../translated_images/ja/architecture.48d94861e6e6cdc0.webp)

---

## 3. リポジトリ構成

!!! prompt "ASK: テンプレートのフォルダ構成を説明してください。視覚的な階層図から始めてください。"

??? info "回答: 視覚的階層図"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 構成とセットアップ
      │   ├── azure.yaml                    # Azure Developer CLI の構成
      │   ├── docker-compose.yaml           # ローカル開発用コンテナ
      │   ├── pyproject.toml                # Python プロジェクトの構成
      │   ├── requirements-dev.txt          # 開発依存関係
      │   └── .devcontainer/                # VS Code Dev コンテナ設定
      │
      ├── 🏗️ インフラ（infra/）
      │   ├── main.bicep                    # メインのインフラテンプレート
      │   ├── api.bicep                     # API 固有のリソース
      │   ├── main.parameters.json          # インフラパラメーター
      │   └── core/                         # モジュール化されたインフラコンポーネント
      │       ├── ai/                       # AI サービスの構成
      │       ├── host/                     # ホスティングインフラ
      │       ├── monitor/                  # 監視とログ
      │       ├── search/                   # Azure AI Search の設定
      │       ├── security/                 # セキュリティとアイデンティティ
      │       └── storage/                  # ストレージアカウント設定
      │
      ├── 💻 アプリケーションソース（src/）
      │   ├── api/                          # バックエンド API
      │   │   ├── main.py                   # FastAPI アプリケーションのエントリ
      │   │   ├── routes.py                 # API ルート定義
      │   │   ├── search_index_manager.py   # 検索機能
      │   │   ├── data/                     # API データ処理
      │   │   ├── static/                   # 静的 Web アセット
      │   │   └── templates/                # HTML テンプレート
      │   ├── frontend/                     # React/TypeScript フロントエンド
      │   │   ├── package.json              # Node.js 依存関係
      │   │   ├── vite.config.ts            # Vite ビルド構成
      │   │   └── src/                      # フロントエンド ソースコード
      │   ├── data/                         # サンプルデータファイル
      │   │   └── embeddings.csv            # 事前計算済み埋め込み
      │   ├── files/                        # 知識ベースファイル
      │   │   ├── customer_info_*.json      # 顧客データサンプル
      │   │   └── product_info_*.md         # 製品ドキュメント
      │   ├── Dockerfile                    # コンテナ構成
      │   └── requirements.txt              # Python 依存関係
      │
      ├── 🔧 自動化とスクリプト（scripts/）
      │   ├── postdeploy.sh/.ps1           # 展開後のセットアップ
      │   ├── setup_credential.sh/.ps1     # 資格情報の構成
      │   ├── validate_env_vars.sh/.ps1    # 環境変数の検証
      │   └── resolve_model_quota.sh/.ps1  # モデルクオータ管理
      │
      ├── 🧪 テストと評価
      │   ├── tests/                        # 単体テストと結合テスト
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # エージェント評価フレームワーク
      │   │   ├── evaluate.py               # 評価ランナー
      │   │   ├── eval-queries.json         # テストクエリ
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 開発用プレイグラウンド
      │   │   ├── 1-quickstart.py           # クイックスタート例
      │   │   └── aad-interactive-chat.py   # 認証例
      │   └── airedteaming/                 # AI セーフティ評価
      │       └── ai_redteaming.py          # レッドチームテスト
      │
      ├── 📚 ドキュメント（docs/）
      │   ├── deployment.md                 # デプロイガイド
      │   ├── local_development.md          # ローカルセットアップ手順
      │   ├── troubleshooting.md            # よくある問題と修正
      │   ├── azure_account_setup.md        # Azure 前提条件
      │   └── images/                       # ドキュメント用アセット
      │
      └── 📄 プロジェクトメタデータ
         ├── README.md                     # プロジェクト概要
         ├── CODE_OF_CONDUCT.md           # コミュニティガイドライン
         ├── CONTRIBUTING.md              # 貢献ガイド
         ├── LICENSE                      # ライセンステキスト
         └── next-steps.md                # 展開後のガイダンス
      ```

### 3.1 コア アプリケーションのアーキテクチャ

This template follows a **full-stack web application** pattern with:

- <strong>バックエンド</strong>: Python FastAPI と Azure AI 統合
- <strong>フロントエンド</strong>: TypeScript/React と Vite ビルドシステム
- <strong>インフラストラクチャ</strong>: Azure Bicep テンプレートによるクラウドリソース
- <strong>コンテナ化</strong>: 一貫したデプロイのための Docker

### 3.2 インフラストラクチャ・アズ・コード (Bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: すべての Azure リソースをオーケストレーションする
   - **`core/` モジュール**: サービスごとの再利用可能なコンポーネント
      - AI サービス（Microsoft Foundry Models、AI Search）
      - コンテナホスティング（Azure Container Apps）
      - 監視（Application Insights、Log Analytics）
      - セキュリティ（Key Vault、Managed Identity）

### 3.3 アプリケーションソース（`src/`）

**バックエンド API（`src/api/`）**:

- FastAPI ベースの REST API
- Foundry Agents 統合
- ナレッジ取得のための検索インデックス管理
- ファイルアップロードと処理機能

**フロントエンド（`src/frontend/`）**:

- モダンな React/TypeScript SPA
- 迅速な開発と最適化されたビルドのための Vite
- エージェントとのやり取り用チャットインターフェース

**ナレッジベース（`src/files/`）**:

- サンプルの顧客および製品データ
- ファイルベースのナレッジ取得のデモ
- JSON と Markdown フォーマットの例


### 3.4 DevOps と自動化

**スクリプト（`scripts/`）**:

- クロスプラットフォームの PowerShell と Bash スクリプト
- 環境の検証とセットアップ
- 展開後の構成
- モデルクオータの管理

**Azure Developer CLI 統合**:

- `azure.yaml` による `azd` ワークフロー構成
- 自動プロビジョニングとデプロイ
- 環境変数の管理

### 3.5 テストと品質保証

**評価フレームワーク（`evals/`）**:

- エージェントのパフォーマンス評価
- クエリ応答の品質テスト
- 自動評価パイプライン

**AI セーフティ（`airedteaming/`）**:

- AI セーフティのためのレッドチームテスト
- セキュリティ脆弱性のスキャン
- 責任ある AI の実践

---

## 4. おめでとうございます 🏆

GitHub Copilot Chat を MCP サーバーとともに使用して、リポジトリを探索しました。

- [X] GitHub Copilot を Azure 向けに有効化した
- [X] アプリケーションアーキテクチャを理解した
- [X] AZD テンプレート構成を探索した

これにより、このテンプレートの _infrastructure as code_ 資産の概要が把握できます。次に、AZD の設定ファイルを見ていきます。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。  
正確性を期していますが、自動翻訳には誤りや不正確さが含まれる場合があることにご注意ください。  
原文（原語版）は信頼できる正式な情報源とみなしてください。  
重要な情報については、専門の人による翻訳を推奨します。  
本翻訳の使用により生じた誤解や誤訳について、当社は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->