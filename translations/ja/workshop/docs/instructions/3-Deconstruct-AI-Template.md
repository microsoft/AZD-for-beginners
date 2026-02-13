# 3. テンプレートを分解する

!!! tip "このモジュールの終了時には次のことができるようになります"

    - [ ] Azure 支援のために MCP サーバーと共に GitHub Copilot を有効化する
    - [ ] AZD テンプレートのフォルダ構造とコンポーネントを理解する
    - [ ] インフラストラクチャ・アズ・コード（Bicep）の構成パターンを調査する
    - [ ] **Lab 3:** GitHub Copilot を使用してリポジトリのアーキテクチャを調査・理解する 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**しかし今、プロジェクト構造とコードベースを理解し、AZD の事前知識なしに AZD テンプレートをカスタマイズできるようになる必要があります！**

---

## 1. GitHub Copilot を有効化する

### 1.1 GitHub Copilot Chat をインストールする

さて、[GitHub Copilot（エージェントモード）](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) を使って探検する時間です。これにより、自然言語でタスクを高レベルに説明し、実行の支援を得ることができます。このラボでは、完了とチャットのやり取りに月間制限がある [Copilot 無料プラン](https://github.com/github-copilot/signup) を使用します。

拡張機能はマーケットプレイスからインストールできますが、Codespaces 環境には既に利用可能なはずです。_Copilot アイコンのドロップダウンから `Open Chat` をクリックし、`What can you do?` のようなプロンプトを入力してください_ - ログインを求められる場合があります。 **GitHub Copilot Chat が利用可能です。**

### 1.2 MCP サーバーをインストールする

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

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

??? warning "`npx` がインストールされていないというエラーが出る場合があります（修正を見るにはクリック）"

      To fix,this open the `.devcontainer/devcontainer.json` file and add this line to the features section. Then rebuild the container. You should now have `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 GitHub Copilot Chat をテストする

**まずは VS Code のコマンドラインから `az login` を使って Azure に認証してください。**

これで Azure サブスクリプションの状態を照会したり、デプロイ済みリソースや設定について質問したりできるはずです。以下のプロンプトを試してみてください：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Azure ドキュメントについて質問し、Microsoft Docs MCP サーバーに基づいた回答を得ることもできます。以下のプロンプトを試してみてください：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

あるいはタスクを完了するためのコードスニペットを要求することもできます。次のプロンプトを試してください。

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**これでテンプレートリポジトリの探索を開始する準備ができました**

---

## 2. アーキテクチャを分解する

??? prompt "ASK: docs/images/architecture.png にあるアプリケーションのアーキテクチャを1段落で説明してください"

      このアプリケーションは、Azure 上に構築された AI 搭載のチャットアプリケーションで、モダンなエージェントベースのアーキテクチャを示しています。ソリューションは、主要なアプリケーションコードをホストする Azure Container App を中心に構成され、ユーザー入力を処理して AI エージェントを通じて応答を生成します。 
      
      アーキテクチャは AI 機能の基盤として Microsoft Foundry Project を活用し、GPT-4o-mini のような言語モデルやエージェント機能を提供する Azure AI Services に接続します。ユーザーのやり取りは React ベースのフロントエンドから FastAPI バックエンドへ流れ、コンテキストに基づいた応答を生成するために AI エージェントサービスと通信します。 
      
      システムはファイル検索や Azure AI Search サービスを通じたナレッジ取得機能を組み込み、エージェントがアップロードされたドキュメントから情報を取得して引用できるようにしています。運用の優秀性のために、トレーシング、ログ、パフォーマンス最適化のために Application Insights と Log Analytics Workspace による包括的な監視が含まれます。 
      
      Azure Storage はアプリケーションデータやファイルアップロードのための BLOB ストレージを提供し、Managed Identity は資格情報を格納せずに Azure リソース間の安全なアクセスを保証します。ソリューション全体はスケーラビリティと保守性を考慮して設計されており、コンテナ化されたアプリケーションは需要に応じて自動スケーリングし、Azure のマネージドサービスエコシステムを通じて組み込みのセキュリティ、監視、CI/CD 機能を提供します。

![アーキテクチャ](../../../../../translated_images/ja/architecture.48d94861e6e6cdc0.webp)

---

## 3. リポジトリ構成

!!! prompt "ASK: テンプレートのフォルダ構成を説明してください。まず視覚的な階層図から始めてください。"

??? info "回答: 視覚的な階層図"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1 コアアプリケーションのアーキテクチャ

This template follows a **full-stack web application** pattern with:

- **バックエンド**: Python FastAPI と Azure AI 統合
- **フロントエンド**: TypeScript/React と Vite ビルドシステム
- **インフラストラクチャ**: クラウド リソースのための Azure Bicep テンプレート
- **コンテナ化**: 一貫したデプロイのための Docker

### 3.2 インフラをコード化（Bicep）

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: すべての Azure リソースをオーケストレーションする
   - **`core/` modules**: 異なるサービス向けの再利用可能なコンポーネント
      - AI サービス (Azure OpenAI、AI Search)
      - コンテナホスティング (Azure Container Apps)
      - モニタリング (Application Insights、Log Analytics)
      - セキュリティ (Key Vault、Managed Identity)

### 3.3 アプリケーションソース（`src/`）

**バックエンド API（`src/api/`）**:

- FastAPI ベースの REST API
- Foundry Agents の統合
- ナレッジ取得のための検索インデックス管理
- ファイルアップロードと処理機能

**フロントエンド（`src/frontend/`）**:

- モダンな React/TypeScript の SPA
- 高速な開発と最適化されたビルドのための Vite
- エージェントとのやり取り用チャットインターフェース

**ナレッジベース（`src/files/`）**:

- サンプルの顧客および製品データ
- ファイルベースのナレッジ取得を示す
- JSON と Markdown フォーマットの例


### 3.4 DevOps と自動化

**スクリプト（`scripts/`）**:

- クロスプラットフォームの PowerShell と Bash スクリプト
- 環境の検証とセットアップ
- デプロイ後の構成
- モデルのクォータ管理

**Azure Developer CLI 統合**:

- `azure.yaml` による `azd` ワークフローの設定
- 自動プロビジョニングとデプロイ
- 環境変数の管理

### 3.5 テストと品質保証

**評価フレームワーク（`evals/`）**:

- エージェントの性能評価
- クエリ応答の品質テスト
- 自動評価パイプライン

**AI セーフティ（`airedteaming/`）**:

- AI セーフティのためのレッドチームテスト
- セキュリティ脆弱性のスキャン
- 責任ある AI の実践

---

## 4. おめでとうございます 🏆

You successfully used GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] Azure 用に GitHub Copilot を有効化した
- [X] アプリケーションのアーキテクチャを理解した
- [X] AZD テンプレート構造を調査した

This gives you a sense of the _infrastructure as code_ assets for this template. Next, we'll look at the configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は、AI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な表現が含まれる場合があります。原文（原語で記載された文書）を権威ある情報源としてください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や誤訳についても当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->