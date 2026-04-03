# 変更ログ - AZD For Beginners

## はじめに

この変更ログは、AZD For Beginners リポジトリにおける注目すべき変更、更新、および改善点を記録します。セマンティックバージョニングの原則に従い、バージョン間で何が変更されたかをユーザーが理解できるようにこのログを維持しています。

## 学習目標

この変更ログを確認することで、あなたは次のことができます:
- 新機能やコンテンツの追加について情報を得る
- 既存ドキュメントの改善点を理解する
- 正確さを確保するためのバグ修正や訂正を追跡する
- 学習資料の進化を時間を追って追跡する

## 学習成果

変更ログのエントリを確認した後、あなたは以下ができるようになります:
- 学習に利用可能な新しいコンテンツやリソースを識別する
- どのセクションが更新または改善されたかを理解する
- 最新の資料に基づいて学習計画を立てる
- 将来の改善のためにフィードバックや提案を提供する

## バージョン履歴

### [v3.19.1] - 2026-03-27

#### 初心者オンボーディングの明確化、セットアップ検証、および最終AZDコマンドの整理
**このバージョンは、AZD 1.23 検証スイープに続く初心者向けのドキュメント修正を行います: AZD優先の認証ガイダンスを明確化し、ローカルセットアップ検証スクリプトを追加し、主要コマンドをライブの AZD CLI に対して検証し、変更ログ外に残っていた最後の廃止された英語ソースのコマンド参照を削除します。**

#### 追加
- **🧪 初心者向けセットアップ検証スクリプト** `validate-setup.ps1` と `validate-setup.sh` により、学習者が第1章を開始する前に必要なツールを確認できるようにしました
- **✅ 事前セットアップ検証手順** ルートの README と第1章の README に追加し、`azd up` の前に不足している前提条件が検出されるようにしました

#### 変更
- **🔐 初心者向け認証ガイダンス** を一貫して `azd auth login` を AZD ワークフローの主要経路として扱い、Azure CLI コマンドを直接使用する場合を除き `az login` はオプションとして明記するようにしました
- **📚 第1章のオンボーディングフロー** を、インストール、認証、および最初のデプロイ手順の前にローカルセットアップを検証するよう学習者に案内するように変更しました
- **🛠️ バリデータのメッセージ** を、AZD専用の初心者向け経路に関して必須要件とオプションの Azure CLI 警告を明確に分離するようにしました
- **📖 設定、トラブルシューティング、および例のドキュメント** を、必要な AZD 認証とオプションの Azure CLI サインインを区別するように更新しました（以前は文脈なしに両方が提示されていました）

#### 修正
- **📋 残存していた英語ソースのコマンド参照** を現在の AZD 形式に更新しました。チートシートの `azd config show` や、Azure ポータルの概要ガイダンスを意図した `azd monitor --overview` などを含みます
- **🧭 第1章の初心者向けの表現** を緩和し、すべてのテンプレートと Azure リソースに対してエラーゼロやロールバックを保証するかのような過度の約束を避けるようにしました
- **🔎 ライブ CLI 検証** により、現在サポートされているコマンドを確認しました: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, `azd down --force --purge`

#### 更新されたファイル
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 の検証、ワークショップ環境の拡張、および AI モデルのリフレッシュ
**このバージョンは `azd` `1.23.12` に対するドキュメント検証を実行し、古くなった AZD コマンド例を更新し、AI モデルのガイダンスを現在のデフォルトにリフレッシュし、ワークショップの指示を GitHub Codespaces 以外にも dev コンテナやローカルクローンでもサポートするように広げます。**

#### 追加
- **✅ 中核章およびワークショップ文書全体にわたる検証ノート** を追加し、より新しいまたは古い CLI ビルドを使用する学習者のためにテストされた AZD ベースラインを明示しました
- **⏱️ 長時間実行される AI アプリのデプロイ用タイムアウトガイダンス** を `azd deploy --timeout 1800` を例に追加しました
- **🔎 拡張機能の検査手順** を AI ワークフローのドキュメントに `azd extension show azure.ai.agents` で追加しました
- **🌐 ワークショップ環境ガイダンスの拡張** を行い、GitHub Codespaces、dev コンテナ、MkDocs を使ったローカルクローンをカバーするようにしました

#### 変更
- **📚 章イントロの README** に、基礎、構成、インフラ、マルチエージェント、事前デプロイ、トラブルシューティング、プロダクションの各セクションで `azd 1.23.12` に対する検証が行われていることを一貫して記載するようにしました
- **🛠️ AZD コマンド参照** をドキュメント全体で現在の形式に更新しました:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` または `azd env get-value(s)`（文脈に応じて）
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`（Application Insights の概要を想定する箇所）
- **🧪 プロビジョン プレビュー例** を `azd provision --preview` や `azd provision --preview -e production` のような現在サポートされている使用法に簡素化しました
- **🧭 ワークショップのフロー** を更新し、学習者が Codespaces、dev コンテナ、またはローカルクローンでラボを完了できるようにしました（Codespaces のみを前提としないように）
- **🔐 認証ガイダンス** を、AZD ワークフローでは `azd auth login` を推奨し、Azure CLI コマンドを直接使用する場合に `az login` をオプションとして位置づけるようにしました

#### 修正
- **🪟 Windows インストールコマンド** をインストールガイドで現在の `winget` パッケージ表記に正規化しました
- **🐧 Linux インストールガイダンス** を修正し、サポートされていないディストロ固有の `azd` パッケージマネージャ指示を避け、適宜リリースアセットを参照するようにしました
- **📦 AI モデル例** を `gpt-35-turbo` や `text-embedding-ada-002` といった古いデフォルトから、`gpt-4.1-mini`、`gpt-4.1`、`text-embedding-3-large` のような現在の例に更新しました
- **📋 デプロイおよび診断スニペット** を、ログ、スクリプト、トラブルシューティング手順で現在の環境およびステータスコマンドを使用するよう修正しました
- **⚙️ GitHub Actions ガイダンス** を `Azure/setup-azd@v1.0.0` から `Azure/setup-azd@v2` に更新しました
- **🤖 MCP/Copilot 同意ガイダンス** を `azd mcp consent` から `azd copilot consent list` に更新しました

#### 改善
- **🧠 AI 章のガイダンス** を、プレビュー感受性のある `azd ai` の挙動、テナント固有のログイン、現在の拡張機能の使用法、および更新されたモデル展開の推奨に関してより良く説明するようにしました
- **🧪 ワークショップ手順** を、より現実的なバージョン例と明確な環境セットアップ文言に変更しました（ハンズオンラボ向け）
- **📈 プロダクションおよびトラブルシューティング文書** を、現在のモニタリング、フォールバックモデル、およびコスト階層の例とより整合させました

#### 更新されたファイル
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI コマンド、コンテンツ検証、およびテンプレート拡張
**このバージョンは `azd ai`、`azd extension`、および `azd mcp` コマンドのカバレッジをすべての AI 関連章に追加し、agents.md の壊れたリンクと非推奨コードを修正し、チートシートを更新し、検証済みの説明と新しい Azure AI AZD テンプレートで例のテンプレートセクションを全面的に改訂します。**

#### 追加
- **🤖 AZD AI CLI カバレッジ** を 7 ファイルに拡張（以前は第8章のみ）:
  - `docs/chapter-01-foundation/azd-basics.md` — 新しい「Extensions and AI Commands」セクションで `azd extension`、`azd ai agent init`、および `azd mcp` を紹介
  - `docs/chapter-02-ai-development/agents.md` — オプション4: `azd ai agent init` とテンプレート対マニフェスト方式の比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」および「Agent-First Deployment」の小節
  - `docs/chapter-05-multi-agent/README.md` — クイックスタートがテンプレートベースとマニフェストベースの両方のデプロイパスを表示
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — デプロイセクションに `azd ai agent init` オプションを追加
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「診断のための AZD AI 拡張コマンド」小節
  - `resources/cheat-sheet.md` — `azd extension`、`azd ai agent init`、`azd mcp`、および `azd infra generate` を含む「AI & Extensions Commands」セクションを新設
- **📦 新しい AZD AI 例テンプレート** を `microsoft-foundry-integration.md` に追加:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly、Semantic Kernel、および音声チャットサポートを備えた .NET RAG チャット
  - **azure-search-openai-demo-java** — Langchain4J を使用した Java RAG チャットで、ACA/AKS のデプロイオプションあり
  - **contoso-creative-writer** — Azure AI Agent Service、Bing Grounding、および Prompty を使ったマルチエージェントのクリエイティブライティングアプリ
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB を使ったサーバーレス RAG、Ollama によるローカル開発対応
  - **chat-with-your-data-solution-accelerator** — 管理ポータル、Teams 統合、PostgreSQL/Cosmos DB オプションを備えたエンタープライズ向け RAG アクセラレータ
  - **azure-ai-travel-agents** — .NET、Python、Java、TypeScript のサーバーを含むマルチエージェント MCP オーケストレーション参照アプリ
  - **azd-ai-starter** — 最小限の Azure AI インフラ Bicep スターターテンプレート
  - **🔗 Awesome AZD AI ギャラリーへのリンク** — [awesome-azd AI ギャラリー](https://azure.github.io/awesome-azd/?tags=ai) への参照（80以上のテンプレート）

#### 修正
- **🔗 agents.md のナビゲーション**: Previous/Next のリンクを第2章 README のレッスン順（Microsoft Foundry Integration → Agents → AI Model Deployment）と一致させました
- **🔗 agents.md の壊れたリンク**: `production-ai-practices.md` を `../chapter-08-production/production-ai-practices.md` に修正（3箇所）
- **📦 agents.md の非推奨コード**: `opencensus` を `azure-monitor-opentelemetry` + OpenTelemetry SDK に置き換えました
- **🐛 agents.md の無効な API**: `max_tokens` を `create_agent()` から `create_run()` の `max_completion_tokens` に移動しました
- **🔢 agents.md のトークンカウント**: 大まかな `len//4` 推定を `tiktoken.encoding_for_model()` に置き換えました
- **azure-search-openai-demo**: デフォルトホストの変更（2024年10月）に伴い、サービス表記を「Cognitive Search + App Service」から「Azure AI Search + Azure Container Apps」に訂正しました
- **contoso-chat**: 説明をリポジトリの実際のタイトルと技術スタックに合わせて Azure AI Foundry + Prompty を参照するよう更新しました

#### 削除
- **ai-document-processing**: 機能しないテンプレート参照（リポジトリが公開されていないため）を削除しました

#### 改善
- **📝 agents.md exercises**: Exercise 1 now shows expected output and `azd monitor` step; Exercise 2 includes full `FunctionTool` registration code; Exercise 3 replaces vague guidance with concrete `prepdocs.py` commands
- **📚 agents.md resources**: Updated documentation links to current Azure AI Agent Service docs and quickstart
- **📋 agents.md Next Steps table**: Added AI Workshop Lab link for complete chapter coverage

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**This version improves README.md chapter navigation with an enhanced table format.**

#### Changed
- **Course Map Table**: Enhanced with direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Removed redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links in Course Map table verified

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**This version updates product references to current Microsoft branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references updated across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name updated to reflect current branding

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**This version restructures the documentation into dedicated chapter folders for clearer navigation.**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| File | From | To |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 Chapter README files**: Created README.md in each chapter folder with:
  - Learning objectives and duration
  - Lesson table with descriptions
  - Quick start commands
  - Navigation to other chapters

#### Changed
- **🔗 Updated all internal links**: 78+ paths updated across all documentation files
- **🗺️ Main README.md**: Updated Course Map with new chapter structure
- **📝 examples/README.md**: Updated cross-references to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**This version added chapter navigation README files (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**This version adds a comprehensive guide for deploying AI agents with Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide covering:
  - What AI agents are and how they differ from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises with success criteria

#### Content Structure
- **Introduction**: Agent concepts for beginners
- **Quick Start**: Deploy agents with `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams of agent patterns
- **Configuration**: Tool setup and environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**This version updates the development container configuration with modern tools and better defaults for the AZD learning experience.**

#### Changed
- **🐳 Base Image**: Updated from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Renamed from "Python 3" to "AZD for Beginners" for clarity

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Pre-configured ports for common development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ VS Code Settings**: Added default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Added MkDocs minify plugin
  - Added pre-commit for code quality
  - Added Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now verifies AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**This version significantly improves the README.md to be more accessible for beginners and adds essential resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation of when to use each tool with practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [テンプレートを提出する](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where to start based on developer experience

#### Changed
- **README Structure**: Reorganized for progressive disclosure - key information first
- **Introduction Section**: Rewrote to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Eliminated duplicate troubleshooting section
- **Troubleshooting Commands**: Fixed `azd logs` reference to use valid `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Added `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Removed remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes applied to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements specifically aimed at developers new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**This version corrects non-existent AZD commands throughout the documentation, ensuring all code examples use valid Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Comprehensive audit and correction of invalid commands:
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Changed hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Changed
- **Rollback Strategies**: Updated documentation to use Git-based rollback (AZD doesn't have native rollback)
- **Log Viewing**: Replaced `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Removed non-existent parallel/incremental deployment flags, provided valid alternatives

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands validated against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**This version completes the interactive workshop modules, fixes all broken documentation links, and improves overall content quality for AI developers using Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: New contribution guidelines document with:
  - Clear instructions for reporting issues and proposing changes
  - Documentation standards for new content
  - Code example guidelines and commit message conventions
  - Community engagement information

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Fully completed wrap-up module with:
  - Comprehensive summary of workshop accomplishments
  - Key concepts mastered section covering AZD, templates, and Microsoft Foundry
  - Learning journey continuation recommendations
  - Workshop challenge exercises with difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Updated learning objectives with:
  - GitHub Copilot with MCP servers activation guidance
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Completed with:
  - Resource cleanup and cost management objectives
  - `azd down` usage for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery guidance
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Resolved 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Updated from "Under Construction" to active workshop status with February 2026 date

- **🔗 Workshop Navigation**: Fixed broken navigation links in workshop README.md pointing to non-existent lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Removed "under construction" warning, workshop is now complete and ready for use
- **Navigation Consistency**: Ensured all workshop modules have proper inter-module navigation
- **Learning Path References**: Updated chapter cross-references to use correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files have valid internal links
- ✅ Workshop modules 0-7 are complete with learning objectives
- ✅ Navigation between chapters and modules functions correctly
- ✅ Content is suitable for AI developers using Microsoft AZD
- ✅ Beginner-friendly language and structure maintained throughout
- ✅ CONTRIBUTING.md provides clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script verified all .md internal links
- **Content Audit**: Manual review of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns applied

#### Notes
- **Scope**: Changes applied to English documentation only
- **Translations**: Translation folders not updated in this version (automated translation will sync later)
- **Workshop Duration**: Complete workshop now provides 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**This version adds comprehensive A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment with automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python applications with custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization strategies
  - Live metrics streaming and real-time debugging
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructure templates for secure deployments
  - Node.js application code with Azure SDK integration
  - 3 complete exercises (enable managed identity, user-assigned identity, Key Vault rotation)
  - Security best practices and RBAC configurations
  - Troubleshooting guide and cost analysis
  - Production-ready passwordless authentication patterns

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coordination patterns (sequential, parallel, hierarchical, event-driven, consensus)
  - Complete orchestrator service implementation (Python/Flask, 1,500+ lines)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Service Bus integration for message queuing
  - Cosmos DB state management for distributed systems
  - 6 Mermaid diagrams showing agent interactions
  - 3 advanced exercises (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/month) with optimization strategies
  - Application Insights integration for monitoring

#### Enhanced
- **Pre-deployment Chapter**: Now includes comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Enhanced with professional authentication patterns
- **Production Readiness**: Complete coverage from security to observability
- **Course Outline**: Updated to reference new lessons in Chapters 3 and 6

#### Changed
- **Learning Progression**: Better integration of security and monitoring throughout course
- **Documentation Quality**: Consistent A-grade standards (95-97%) across new lessons
- **Production Patterns**: Complete end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons include complete working code (not snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises with verification steps (9 total)
- ✅ Production-ready Bicep templates deployable via `azd up`
- ✅ Cost analysis and optimization strategies
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints with verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Comprehensive monitoring guide
- **docs/getting-started/authsecurity.md**: - Professional security patterns
- **docs/pre-deployment/coordination-patterns.md**: - Advanced multi-agent architectures
- **Overall New Content**: - Consistent high-quality standards

#### Technical Implementation
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**This version enhances documentation quality across the repository and adds a complete Microsoft Foundry Models deployment example with gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Added hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Added verification section to deployment guide:
  - Health check procedures
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### Enhanced
- **examples/README.md**: Updated to A-grade quality (93%):
  - Added azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Changed
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Improved
- **Developer Experience**: Microsoft Foundry Models deployment now takes 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers have clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validated
- ✅ Microsoft Foundry Models example fully functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index accurately reflects 4 local examples
- ✅ No duplicate external links in tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**This version introduces comprehensive, production-ready container application deployment examples using Azure Developer CLI (AZD), with full documentation and integration into the learning path.**

#### Added
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Changed
- **README.md**: 「Local Examples - Container Applications」セクションの下に新しいコンテナアプリの例を表示およびリンクするように更新
- **examples/README.md**: コンテナアプリの例を強調表示し、比較マトリクスのエントリを追加し、技術/アーキテクチャの参照を更新
- **Course Outline & Study Guide**: 関連章で新しいコンテナアプリの例とデプロイパターンを参照するように更新

#### Validated
- ✅ すべての新しい例は `azd up` でデプロイ可能で、ベストプラクティスに従っています
- ✅ ドキュメントの相互リンクとナビゲーションが更新されています
- ✅ 例は初心者から上級者向けのシナリオを網羅しており、プロダクションのマイクロサービスも含む

#### Notes
- **Scope**: 英語のドキュメントと例のみ
- **Next Steps**: 今後のリリースで追加の高度なコンテナパターンとCI/CD自動化を拡張

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**このバージョンでは、Microsoft の公式リブランディングを反映し、英語ドキュメント全体で「Microsoft Foundry」から「Microsoft Foundry」への包括的な製品名変更を実施しています。**

#### Changed
- **🔄 Product Name Update**: 「Microsoft Foundry」から「Microsoft Foundry」への完全なリブランディング
  - 英語ドキュメントの `docs/` フォルダー全体での参照を更新
  - フォルダー名変更: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ファイル名変更: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 合計: 7つのドキュメントファイルにわたって23件のコンテンツ参照を更新

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` が `docs/microsoft-foundry/` にリネーム
  - すべての相互参照を新しいフォルダ構成に合わせて更新
  - ドキュメント全体でナビゲーションリンクを検証

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - すべての内部リンクを新しいファイル名に合わせて更新

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ナビゲーションリンクを3件更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 製品名参照を4件更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 既に Microsoft Foundry を使用（以前の更新による）
  - `docs/microsoft-foundry/production-ai-practices.md` - 参照を3件更新（概要、コミュニティのフィードバック、ドキュメント）
  - `docs/getting-started/azd-basics.md` - クロスリファレンスリンクを4件更新
  - `docs/getting-started/first-project.md` - 章ナビゲーションリンクを2件更新
  - `docs/getting-started/installation.md` - 次章リンクを2件更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 参照を3件更新（ナビゲーション、Discordコミュニティ）
  - `docs/troubleshooting/common-issues.md` - ナビゲーションリンクを1件更新
  - `docs/troubleshooting/debugging.md` - ナビゲーションリンクを1件更新

- **Course Structure Files** (2 files):
  - `README.md` - 参照を17件更新（コース概要、章タイトル、テンプレートセクション、コミュニティインサイト）
  - `course-outline.md` - 参照を14件更新（概要、学習目標、章リソース）

#### Validated
- ✅ 英語ドキュメントに "ai-foundry" フォルダパスの残存がゼロであることを確認
- ✅ 英語ドキュメントに "Microsoft Foundry" 製品名参照の残存がゼロであることを確認
- ✅ 新しいフォルダ構成でナビゲーションリンクがすべて機能していることを確認
- ✅ ファイルとフォルダのリネームが正常に完了
- ✅ 章間の相互参照を検証済み

#### Notes
- **Scope**: 変更は `docs/` フォルダー内の英語ドキュメントにのみ適用
- **Translations**: 翻訳フォルダー（`translations/`）はこのバージョンでは更新されていません
- **Workshop**: ワークショップ資料（`workshop/`）はこのバージョンでは更新されていません
- **Examples**: 例ファイルはまだレガシー名を参照している可能性があります（今後の更新で対処予定）
- **External Links**: 外部URLおよびGitHubリポジトリ参照は変更されていません

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**このバージョンでは、Azure Developer CLI の新しいプレビュー機能に対する包括的なサポートを導入し、ワークショップのユーザー体験を強化しています。**

#### Added
- **🧪 azd provision --preview Feature Documentation**: 新しいインフラプレビュ機能の包括的なカバレッジ
  - コマンドリファレンスとチートシート内の使用例
  - プロビジョニングガイドへの詳細な統合（ユースケースと利点）
  - より安全なデプロイ検証のための事前チェック統合
  - 安全最優先のデプロイ手順を含む入門ガイドの更新
- **🚧 Workshop Status Banner**: ワークショップ開発状況を示すプロフェッショナルなHTMLバナー
  - 明確なユーザー伝達のためのグラデーションデザインと工事表示
  - 透明性のための最終更新タイムスタンプ
  - すべてのデバイスでのモバイル対応デザイン

#### Enhanced
- **Infrastructure Safety**: プレビュー機能をデプロイメントドキュメント全体に統合
- **Pre-deployment Validation**: 自動化スクリプトにインフラプレビューのテストを追加
- **Developer Workflow**: プレビューをベストプラクティスとして含めるようコマンドシーケンスを更新
- **Workshop Experience**: コンテンツ開発状況に関する明確な期待値設定

#### Changed
- **Deployment Best Practices**: まずプレビューを行うワークフローを推奨アプローチに変更
- **Documentation Flow**: 学習プロセスの早い段階にインフラ検証を移動
- **Workshop Presentation**: 開発タイムラインを明示したプロフェッショナルな状況表示

#### Improved
- **Safety-First Approach**: デプロイ前にインフラ変更を検証可能に
- **Team Collaboration**: プレビュー結果をレビューや承認のために共有可能に
- **Cost Awareness**: プロビジョニング前にリソースコストをより良く把握可能に
- **Risk Mitigation**: 事前検証によるデプロイ失敗の削減

#### Technical Implementation
- **Multi-document Integration**: プレビュー機能を4つの主要ファイルに跨って文書化
- **Command Patterns**: ドキュメント全体で一貫した構文と例を提供
- **Best Practice Integration**: 検証ワークフローとスクリプトにプレビューを組み込み
- **Visual Indicators**: 新機能を見つけやすくする明確な「NEW」マーク

#### Workshop Infrastructure
- **Status Communication**: グラデーションスタイルのプロフェッショナルなHTMLバナー
- **User Experience**: 開発状況を明確に伝え混乱を防止
- **Professional Presentation**: 期待値を設定しつつリポジトリの信頼性を維持
- **Timeline Transparency**: 透明性のための2025年10月の最終更新タイムスタンプ

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**このバージョンでは、ブラウザベースのインタラクティブガイドと構造化された学習パスを備えた包括的なワークショップ資料を導入しています。**

#### Added
- **🎥 Interactive Workshop Guide**: MkDocsプレビュー機能を備えたブラウザベースのワークショップ体験
- **📝 Structured Workshop Instructions**: 発見からカスタマイズまでの7ステップのガイド学習パス
  - 0-Introduction: ワークショップの概要とセットアップ
  - 1-Select-AI-Template: テンプレートの発見と選択プロセス
  - 2-Validate-AI-Template: デプロイと検証手順
  - 3-Deconstruct-AI-Template: テンプレートのアーキテクチャの理解
  - 4-Configure-AI-Template: 設定とカスタマイズ
  - 5-Customize-AI-Template: 高度な変更と反復
  - 6-Teardown-Infrastructure: クリーンアップとリソース管理
  - 7-Wrap-up: まとめと次のステップ
- **🛠️ Workshop Tooling**: 学習体験を強化するためのMaterialテーマを使用したMkDocs設定
- **🎯 Hands-On Learning Path**: 3ステップの方法論（発見 → デプロイ → カスタマイズ）
- **📱 GitHub Codespaces Integration**: シームレスな開発環境のセットアップ

#### Enhanced
- **AI Workshop Lab**: 2〜3時間の構造化された学習体験を拡張
- **Workshop Documentation**: ナビゲーションと視覚補助を備えたプロフェッショナルな提示
- **Learning Progression**: テンプレート選択から本番デプロイまでの明確なステップバイステップガイダンス
- **Developer Experience**: ストリームライン化された開発ワークフローのための統合ツール

#### Improved
- **Accessibility**: 検索、コピー機能、テーマ切替を備えたブラウザベースのインターフェイス
- **Self-Paced Learning**: 異なる学習速度に対応する柔軟なワークショップ構成
- **Practical Application**: 実運用のAIテンプレートデプロイシナリオ
- **Community Integration**: ワークショップサポートと共同作業のためのDiscord統合

#### Workshop Features
- **Built-in Search**: キーワードおよびレッスンの迅速な検索
- **Copy Code Blocks**: すべてのコード例に対するホバーでコピー機能
- **Theme Toggle**: ダーク/ライトモード切替サポート
- **Visual Assets**: 理解を深めるスクリーンショットと図
- **Help Integration**: コミュニティサポートのための直接Discordアクセス

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**このバージョンでは、リポジトリ全体のナビゲーションを強化し、包括的な章ベースの学習構造を導入しています。**

#### Added
- **📚 Chapter-Based Learning System**: コース全体を8つの段階的学習章に再構成
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: すべてのドキュメントに一貫したナビゲーションヘッダーとフッターを導入
- **🎯 Progress Tracking**: コース完了チェックリストと学習検証システム
- **🗺️ Learning Path Guidance**: 異なる経験レベルと目標のための明確なエントリーポイント
- **🔗 Cross-Reference Navigation**: 関連章と前提条件を明確にリンク

#### Enhanced
- **README Structure**: 章ベースの組織による構造化学習プラットフォームへ変革
- **Documentation Navigation**: 各ページに章のコンテキストと進行ガイダンスを追加
- **Template Organization**: 例とテンプレートを適切な学習章にマッピング
- **Resource Integration**: チートシート、FAQ、学習ガイドを関連章に接続
- **Workshop Integration**: ハンズオンラボを複数の章の学習目標に割り当て

#### Changed
- **Learning Progression**: 線形ドキュメントから柔軟な章ベースの学習へ移行
- **Configuration Placement**: 設定ガイドをより良い学習フローのためにChapter 3に配置
- **AI Content Integration**: 学習全体でAI固有のコンテンツをより良く統合
- **Production Content**: 企業向け学習者のために高度なパターンをChapter 8に集約

#### Improved
- **User Experience**: 明確なナビゲーションパンくずリストと章進行インジケーター
- **Accessibility**: コース横断が容易になる一貫したナビゲーションパターン
- **Professional Presentation**: 学術・企業研修に適した大学スタイルのコース構成
- **Learning Efficiency**: 改善された構成により関連コンテンツの検索時間を短縮

#### Technical Implementation
- **Navigation Headers**: 40以上のドキュメントファイルにわたる標準化された章ナビゲーション
- **Footer Navigation**: 一貫した進行ガイダンスと章完了インジケーター
- **Cross-Linking**: 関連概念を結ぶ包括的な内部リンクシステム
- **Chapter Mapping**: テンプレートと例を学習目標に明確に関連付け

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8章システムに合わせて学習ガイドを再構成
- **🎯 Chapter-Based Assessment**: 各章に特定の学習目標と実践課題を含む評価
- **📋 Progress Tracking**: 測定可能な成果と完了チェックリストを含む週間学習スケジュール
- **❓ Assessment Questions**: 各章の知識検証問題と専門的な成果
- **🛠️ Practical Exercises**: 実際のデプロイシナリオとトラブルシューティングを含むハンズオン活動
- **📊 Skill Progression**: 基本概念から企業パターンまでの明確な進展とキャリア開発フォーカス
- **🎓 Certification Framework**: 専門的なスキル育成の成果とコミュニティの認知制度
- **⏱️ Timeline Management**: マイルストーン検証を含む10週間の構造化プラン

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**このバージョンでは、マルチエージェント小売ソリューションを改善し、エージェント名の明確化とドキュメントの強化を行いました。**

#### Changed
- **Multi-Agent Terminology**: 小売マルチエージェントソリューション全体で「Cora agent」を「Customer agent」に置換し、より分かりやすく
- **Agent Architecture**: 一貫した「Customer agent」命名を使用するように、すべてのドキュメント、ARMテンプレート、コード例を更新
- **Configuration Examples**: 更新された命名規約を使用した最新のエージェント設定パターン
- **Documentation Consistency**: すべての参照がプロフェッショナルで説明的なエージェント名を使用するよう確保

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template を Customer エージェント参照で更新
- **Architecture Diagrams**: エージェント名の更新に合わせて Mermaid 図を更新
- **Code Examples**: Python クラスと実装例で CustomerAgent 名称を使用するように変更
- **Environment Variables**: すべてのデプロイ スクリプトを CUSTOMER_AGENT_NAME 構成に更新

#### Improved
- **Developer Experience**: ドキュメント内でエージェントの役割と責任がより明確に
- **Production Readiness**: エンタープライズの命名規則との整合性が向上
- **Learning Materials**: 教育目的で直感的なエージェント名付け
- **Template Usability**: エージェントの機能とデプロイ パターンの理解が簡素化

#### Technical Details
- CustomerAgent 参照で Mermaid のアーキテクチャ図を更新
- Python 例で CoraAgent クラス名を CustomerAgent に置換
- ARM テンプレート JSON 構成を "customer" エージェント タイプに変更
- 環境変数を CORA_AGENT_* から CUSTOMER_AGENT_* パターンに更新
- すべてのデプロイ コマンドとコンテナ構成を更新

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**このバージョンはリポジトリを Microsoft Foundry 統合を含む包括的な AI 応用学習リソースに変革します。**

#### Added
- **🤖 AI-First Learning Path**: AI 開発者とエンジニアを優先する完全な再構成
- **Microsoft Foundry Integration Guide**: AZD と Microsoft Foundry サービスの接続に関する包括的ドキュメント
- **AI Model Deployment Patterns**: モデル選定、構成、および本番展開戦略を網羅した詳細ガイド
- **AI Workshop Lab**: AI アプリケーションを AZD デプロイ可能なソリューションに変換する 2～3 時間のハンズオン ワークショップ
- **Production AI Best Practices**: AI ワークロードのスケーリング、監視、セキュリティのためのエンタープライズ対応パターン
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models、Cognitive Services、AI デプロイに関する包括的トラブルシューティング
- **AI Template Gallery**: 複雑度評価付きの Microsoft Foundry テンプレートの注目コレクション
- **Workshop Materials**: ハンズオン ラボと参考資料を含む完全なワークショップ構成

#### Enhanced
- **README Structure**: Microsoft Foundry Discord の 45% のコミュニティ関心データに基づいた AI 開発者向け構成
- **Learning Paths**: 学生や DevOps エンジニア向けの従来パスに並んで専用の AI 開発者向け学習経路を追加
- **Template Recommendations**: azure-search-openai-demo、contoso-chat、openai-chat-app-quickstart を含む注目の AI テンプレート
- **Community Integration**: AI 専用チャンネルとディスカッションを含む Discord コミュニティ サポートを強化

#### Security & Production Focus
- **Managed Identity Patterns**: AI 専用の認証とセキュリティ構成
- **Cost Optimization**: トークン使用量の追跡と AI ワークロードの予算管理
- **Multi-Region Deployment**: グローバルな AI アプリケーション展開戦略
- **Performance Monitoring**: AI 固有のメトリクスと Application Insights 統合

#### Documentation Quality
- **Linear Course Structure**: 初級から上級の AI 展開パターンへの論理的な進行
- **Validated URLs**: すべての外部リポジトリリンクを検証済みでアクセス可能
- **Complete Reference**: すべての内部ドキュメントリンクを検証し機能確認済み
- **Production Ready**: 実世界の例を含むエンタープライズ向けデプロイ パターン

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**このバージョンはリポジトリ構造とコンテンツ表示の大幅な見直しを表します。**

#### Added
- **Structured Learning Framework**: すべてのドキュメントページに Introduction、Learning Goals、Learning Outcomes セクションを追加
- **Navigation System**: ガイド付き学習進行のためにすべてのドキュメントに Previous/Next レッスンリンクを追加
- **Study Guide**: 学習目標、練習問題、および評価資料を含む包括的な study-guide.md
- **Professional Presentation**: アクセシビリティと専門的外観向上のためにすべての絵文字アイコンを削除
- **Enhanced Content Structure**: 学習資料の整理と流れを改善

#### Changed
- **Documentation Format**: 一貫した学習重視の構成で全ドキュメントを標準化
- **Navigation Flow**: すべての学習資料で論理的な進行を実装
- **Content Presentation**: 装飾要素を排除し、明確でプロフェッショナルなフォーマットに変更
- **Link Structure**: 新しいナビゲーション システムをサポートするために内部リンクを更新

#### Improved
- **Accessibility**: スクリーンリーダー互換性向上のため絵文字依存を削除
- **Professional Appearance**: エンタープライズ学習に適したクリーンで学術的な外観
- **Learning Experience**: 各レッスンに明確な目的と成果を持つ構造化アプローチ
- **Content Organization**: 関連トピック間の論理的な流れと接続を改善

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - 完全な Getting-Started ガイドシリーズ
  - 包括的なデプロイとプロビジョニングのドキュメント
  - 詳細なトラブルシューティング資料とデバッグ ガイド
  - 事前デプロイ検証ツールと手順

- **Getting Started Module**
  - AZD Basics: コア概念と用語
  - Installation Guide: プラットフォーム別セットアップ手順
  - Configuration Guide: 環境設定と認証
  - First Project Tutorial: ステップバイステップのハンズオン学習

- **Deployment and Provisioning Module**
  - Deployment Guide: 完全なワークフロー ドキュメント
  - Provisioning Guide: Bicep を用いた Infrastructure as Code
  - 本番展開のベストプラクティス
  - マルチサービス アーキテクチャ パターン

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure リソースの可用性検証
  - SKU Selection: サービス階層に関する包括的ガイダンス
  - Pre-flight Checks: 自動検証スクリプト (PowerShell and Bash)
  - コスト見積もりと予算計画ツール

- **Troubleshooting Module**
  - Common Issues: よく発生する問題と解決策
  - Debugging Guide: 系統的なトラブルシューティング手法
  - 高度な診断技術とツール
  - パフォーマンス監視と最適化

- **Resources and References**
  - Command Cheat Sheet: 必須コマンドのクイックリファレンス
  - Glossary: 用語および略語の包括的定義
  - FAQ: よくある質問への詳細な回答
  - 外部リソースリンクとコミュニティ接続

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Windows、macOS、Linux 向けのインストールと構成ガイド
- **Multiple Skill Levels**: 学生からプロの開発者までを対象としたコンテンツ
- **Practical Focus**: ハンズオンの例と実世界のシナリオ
- **Comprehensive Coverage**: 基本概念から高度なエンタープライズパターンまで
- **Security-First Approach**: 全体を通じて組み込まれたセキュリティのベストプラクティス
- **Cost Optimization**: コスト効率の良いデプロイとリソース管理のガイダンス

#### Documentation Quality
- **Detailed Code Examples**: 実用的でテスト済みのコードサンプル
- **Step-by-Step Instructions**: 明確で実行可能なガイダンス
- **Comprehensive Error Handling**: 一般的な問題に対するトラブルシューティング
- **Best Practices Integration**: 業界標準と推奨事項の統合
- **Version Compatibility**: 最新の Azure サービスと azd 機能に対応

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face、Azure Machine Learning、カスタムモデルとの統合パターン
- **AI Agent Frameworks**: LangChain、Semantic Kernel、AutoGen のデプロイ用テンプレート
- **Advanced RAG Patterns**: Azure AI Search 以外のベクトルデータベースオプション (Pinecone, Weaviate など)
- **AI Observability**: モデル性能、トークン使用量、応答品質の監視強化

#### Developer Experience
- **VS Code Extension**: AZD + Microsoft Foundry の統合開発体験
- **GitHub Copilot Integration**: AZD テンプレート生成の AI 支援
- **Interactive Tutorials**: AI シナリオ向けの自動検証付きハンズオンコーディング演習
- **Video Content**: AI 展開に焦点を当てた視覚学習者向け補助ビデオチュートリアル

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI モデルのガバナンス、コンプライアンス、監査トレイル
- **Multi-Tenant AI**: 分離された AI サービスで複数顧客に対応するパターン
- **Edge AI Deployment**: Azure IoT Edge およびコンテナ インスタンスとの統合
- **Hybrid Cloud AI**: AI ワークロードのマルチクラウドおよびハイブリッド展開パターン

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning パイプラインとの MLOps 統合
- **Advanced Security**: ゼロトラスト パターン、プライベート エンドポイント、高度な脅威保護
- **Performance Optimization**: 高スループット AI アプリケーション向けの高度なチューニングとスケーリング戦略
- **Global Distribution**: AI アプリケーション向けのコンテンツ配信とエッジキャッシュのパターン

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: 包括的な Microsoft Foundry 統合 (完了)
- ✅ **Interactive Tutorials**: ハンズオン AI ワークショップ ラボ (完了)
- ✅ **Advanced Security Module**: AI 固有のセキュリティ パターン (完了)
- ✅ **Performance Optimization**: AI ワークロードのチューニング戦略 (完了)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI に焦点を当てたデプロイ シナリオの追加 (完了)
- ✅ **Extended FAQ**: AI 固有の質問とトラブルシューティング (完了)
- **Tool Integration**: 強化された IDE とエディタ統合ガイド
- ✅ **Monitoring Expansion**: AI 固有のモニタリングとアラート パターン (完了)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: モバイル学習向けのレスポンシブデザイン
- **Offline Access**: ダウンロード可能なドキュメントパッケージ
- **Enhanced IDE Integration**: AZD + AI ワークフロー向けの VS Code 拡張
- **Community Dashboard**: リアルタイムのコミュニティ指標と貢献トラッキング

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: セマンティック バージョニングに従う (major.minor.patch)
2. **Date**: リリースまたは更新日 (YYYY-MM-DD 形式)
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: 変更内容の簡潔な説明
5. **Impact Assessment**: 既存ユーザーへの影響

### Change Categories

#### Added
- 新機能、ドキュメントセクション、または機能強化
- 新しい例、テンプレート、学習リソース
- 追加ツール、スクリプト、ユーティリティ

#### Changed
- 既存機能やドキュメントの変更
- 明確性や正確性を向上させる更新
- コンテンツや構成の再編成

#### Deprecated
- 段階的に廃止される機能やアプローチ
- 削除予定のドキュメントセクション
- より良い代替手段がある手法

#### Removed
- もはや関連性のない機能、ドキュメント、例
- 古くなった情報や非推奨のアプローチ
- 冗長または統合されたコンテンツ

#### Fixed
- ドキュメントやコードの誤りの修正
- 報告された問題や欠陥の解決
- 正確性や機能性の改善

#### Security
- セキュリティに関連する改善や修正
- セキュリティベストプラクティスの更新
- セキュリティ脆弱性の解決

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- ユーザー側の対応が必要な破壊的変更
- コンテンツや構成の大幅な再構築
- 基本的なアプローチや方法論を変更する変更

#### Minor Version (X.Y.0)
- 新機能やコンテンツの追加
- 後方互換性を維持する強化
- 追加の例、ツール、リソース

#### Patch Version (X.Y.Z)
- バグ修正と訂正
- 既存コンテンツへの小さな改善
- 明確化や小規模な強化

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: 問題を報告するか改善を提案 (AI 固有の問題も歓迎)
- **Discord Discussions**: アイデアを共有し Microsoft Foundry コミュニティと交流
- **Pull Requests**: コンテンツへの直接的な改善を貢献、特に AI テンプレートとガイド
- **Microsoft Foundry Discord**: AZD + AI に関する #Azure チャンネルに参加
- **Community Forums**: より広範な Azure 開発者コミュニティで議論に参加

### Feedback Categories
- **AI Content Accuracy**: AI サービス統合とデプロイ情報の修正
- **Learning Experience**: AI 開発者の学習フロー改善の提案
- **Missing AI Content**: 追加の AI テンプレート、パターン、例の要望
- **Accessibility**: 多様な学習ニーズへの改善
- **AI Tool Integration**: より良い AI 開発ワークフロー統合の提案
- **Production AI Patterns**: エンタープライズ向け AI デプロイ パターンの要望

### Response Commitment
- **Issue Response**: 報告された問題に 48 時間以内に対応
- **Feature Requests**: 1 週間以内に評価
- **Community Contributions**: 1 週間以内にレビュー
- **Security Issues**: 優先度を高めて即時対応

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: コンテンツの正確性とリンクの検証
- **Quarterly Updates**: 主要なコンテンツ追加と改善
- **Semi-Annual Reviews**: 包括的な再構築と強化
- **Annual Releases**: 重要な改善を伴うメジャーリリース

### Monitoring and Quality Assurance
- **Automated Testing**: コード例とリンクの定期的検証
- **Community Feedback Integration**: ユーザー提案の定期的な反映
- **Technology Updates**: 最新の Azure サービスと azd リリースに合わせた整合
- **Accessibility Audits**: 包摂的デザイン原則の定期的レビュー

## Version Support Policy

### Current Version Support
- <strong>最新のメジャーバージョン</strong>: 定期的なアップデートによる完全なサポート
- <strong>前のメジャーバージョン</strong>: 12か月間のセキュリティアップデートと重要な修正
- <strong>レガシーバージョン</strong>: コミュニティサポートのみ、公式の更新なし

### 移行ガイダンス
メジャーバージョンがリリースされると、以下を提供します:
- <strong>移行ガイド</strong>: 段階的な移行手順
- <strong>互換性に関する注意</strong>: 破壊的な変更に関する詳細
- <strong>ツールサポート</strong>: 移行を支援するスクリプトやユーティリティ
- <strong>コミュニティサポート</strong>: 移行に関する質問のための専用フォーラム

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [学習ガイド](resources/study-guide.md)
- <strong>次のレッスン</strong>: [メイン README](README.md) に戻る

<strong>最新情報を受け取る</strong>: 新しいリリースや学習資料の重要な更新に関する通知を受け取るために、このリポジトリをウォッチしてください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されています。正確性に努めておりますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることにご注意ください。原文（原言語の文書）を正式な出典としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の利用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->