# 変更履歴 - AZD For Beginners

## はじめに

この変更履歴は、AZD For Beginners リポジトリの注目すべき変更、更新、改善点をすべて記録します。セマンティックバージョニングの原則に従い、バージョン間で何が変更されたかをユーザーが理解できるようにこのログを維持しています。

## 学習目標

この変更履歴を確認することで、あなたは次のことができます:
- 新機能やコンテンツの追加について把握する
- 既存のドキュメントに対する改善点を理解する
- 正確性を確保するためのバグ修正や訂正を追跡する
- 学習教材の進化を時間を追ってフォローする

## 学習到達目標

変更履歴のエントリを確認した後、あなたは次のことができるようになります:
- 学習のために利用可能な新しいコンテンツやリソースを特定する
- どのセクションが更新または改善されたかを理解する
- 最新の教材に基づいて学習計画を立てる
- 将来の改善のためにフィードバックや提案を提供する

## バージョン履歴

### [v3.18.0] - 2026-03-16

#### AZD AI CLI コマンド、コンテンツ検証、およびテンプレート拡張
**このバージョンでは、すべての AI 関連章に `azd ai`、`azd extension`、および `azd mcp` コマンドの網羅を追加し、agents.md の壊れたリンクと非推奨コードを修正し、チートシートを更新し、検証済みの説明と新しい Azure AI AZD テンプレートで Example Templates セクションを全面的に見直しました。**

#### 追加
- **🤖 AZD AI CLI の適用範囲拡大**（以前は第8章のみ）: 7 ファイルにわたるカバレッジ
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`、`azd ai agent init`、および `azd mcp` を紹介する新しい「Extensions and AI Commands」セクション
  - `docs/chapter-02-ai-development/agents.md` — オプション 4: `azd ai agent init`（テンプレート vs マニフェスト方式の比較表付き）
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」と「Agent-First Deployment」サブセクション
  - `docs/chapter-05-multi-agent/README.md` — クイックスタートでテンプレートベースとマニフェストベースの両方のデプロイパスを表示
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy セクションに `azd ai agent init` オプションを追加
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「AZD AI Extension Commands for Diagnostics」サブセクション
  - `resources/cheat-sheet.md` — `azd extension`、`azd ai agent init`、`azd mcp`、および `azd infra generate` を含む新しい「AI & Extensions Commands」セクション
- **📦 新しい AZD AI サンプルテンプレート**（`microsoft-foundry-integration.md` 内）:
  - **azure-search-openai-demo-csharp** — .NET の RAG チャット（Blazor WebAssembly、Semantic Kernel、音声チャット対応）
  - **azure-search-openai-demo-java** — Langchain4J を使用した Java の RAG チャット（ACA/AKS デプロイオプション）
  - **contoso-creative-writer** — Azure AI Agent Service、Bing Grounding、Prompty を使用したマルチエージェントのクリエイティブライティングアプリ
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB を利用したサーバーレス RAG（Ollama ローカル開発サポートあり）
  - **chat-with-your-data-solution-accelerator** — 管理ポータル、Teams 統合、PostgreSQL/Cosmos DB オプションを備えたエンタープライズ向け RAG アクセラレータ
  - **azure-ai-travel-agents** — .NET、Python、Java、および TypeScript のサーバーを含むマルチエージェント MCP オーケストレーションのリファレンスアプリ
  - **azd-ai-starter** — 最小限の Azure AI インフラ用 Bicep スターターテンプレート
  - **🔗 Awesome AZD AI ギャラリーへのリンク** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) への参照（80以上のテンプレート）

#### 修正
- **🔗 agents.md のナビゲーション**: Previous/Next リンクが第2章 README のレッスン順（Microsoft Foundry Integration → Agents → AI Model Deployment）と一致するようになりました
- **🔗 agents.md の壊れたリンク**: `production-ai-practices.md` を `../chapter-08-production/production-ai-practices.md` に修正（3 箇所）
- **📦 agents.md の非推奨コード**: `opencensus` を `azure-monitor-opentelemetry` + OpenTelemetry SDK に置換
- **🐛 agents.md の無効な API**: `max_tokens` を `create_agent()` から `create_run()` の `max_completion_tokens` に移動
- **🔢 agents.md のトークン数カウント**: 大まかな `len//4` 推定を `tiktoken.encoding_for_model()` に置換
- **azure-search-openai-demo**: サービス表記を「Cognitive Search + App Service」から「Azure AI Search + Azure Container Apps」に修正（デフォルトホストは 2024 年 10 月に変更）
- **contoso-chat**: 説明をリポジトリの実際のタイトルと技術スタックに合わせて Azure AI Foundry + Prompty を参照するよう更新

#### 削除
- **ai-document-processing**: 機能しないテンプレート参照を削除（リポジトリが公開 AZD テンプレートとしてアクセスできないため）

#### 改良
- **📝 agents.md の演習**: 演習 1 に期待される出力と `azd monitor` ステップを表示; 演習 2 に完全な `FunctionTool` 登録コードを追加; 演習 3 は曖昧なガイダンスを具体的な `prepdocs.py` コマンドに置換
- **📚 agents.md のリソース**: ドキュメントリンクを最新の Azure AI Agent Service ドキュメントとクイックスタートに更新
- **📋 agents.md の Next Steps テーブル**: 完全な章カバーのために AI ワークショップラボへのリンクを追加

#### 更新されたファイル
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### コースナビゲーションの強化
**このバージョンでは、README.md の章ナビゲーションを改善し、拡張された表形式を導入しました。**

#### 変更
- <strong>コースマップ表</strong>: 直接のレッスンリンク、所要時間の推定、複雑さの評価を追加して強化
- <strong>フォルダのクリーンアップ</strong>: 冗長な古いフォルダ（deployment/, getting-started/, pre-deployment/, troubleshooting/）を削除
- <strong>リンク検証</strong>: コースマップ表内の 21+ の内部リンクをすべて検証

### [v3.16.0] - 2026-02-05

#### 製品名の更新
**このバージョンでは、製品参照を現在の Microsoft ブランディングに更新しました。**

#### 変更
- **Microsoft Foundry → Microsoft Foundry**: 非翻訳ファイル全体で参照を更新
- **Azure AI Agent Service → Foundry Agents**: サービス名を現在のブランディングに合わせて更新

#### 更新されたファイル
- `README.md` - メインのコースランディングページ
- `changelog.md` - バージョン履歴
- `course-outline.md` - コース構成
- `docs/chapter-02-ai-development/agents.md` - AI エージェントガイド
- `examples/README.md` - 例のドキュメント
- `workshop/README.md` - ワークショップランディングページ
- `workshop/docs/index.md` - ワークショップインデックス
- `workshop/docs/instructions/*.md` - すべてのワークショップ指示ファイル

---

### [v3.15.0] - 2026-02-05

#### 大規模なリポジトリ再構築: 章ベースのフォルダ名
**このバージョンでは、より明確なナビゲーションのためにドキュメントを専用の章フォルダに再構築します。**

#### フォルダ名の変更
古いフォルダは章番号付きフォルダに置き換えられました:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新規追加: `docs/chapter-05-multi-agent/`

#### ファイル移動
| ファイル | From | To |
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

#### 追加
- **📚 章の README ファイル**: 各章フォルダに README.md を作成:
  - 学習目標と所要時間
  - 説明付きのレッスン表
  - クイックスタートコマンド
  - 他章へのナビゲーション

#### 変更
- **🔗 すべての内部リンクを更新**: ドキュメント全体で 78+ のパスを更新
- **🗺️ メイン README.md**: 新しい章構造に合わせてコースマップを更新
- **📝 examples/README.md**: 章フォルダへの相互参照を更新

#### 削除
- 古いフォルダ構造（getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/）を削除

---

### [v3.14.0] - 2026-02-05

#### リポジトリ再構築: 章ナビゲーション
**このバージョンでは章ナビゲーション用の README ファイルを追加しました（v3.15.0 によって置き換えられました）。**

---

### [v3.13.0] - 2026-02-05

#### 新しい AI エージェントガイド
**このバージョンでは、Azure Developer CLI を使用した AI エージェントのデプロイに関する包括的なガイドを追加しました。**

#### 追加
- **🤖 docs/microsoft-foundry/agents.md**: 次の内容を網羅する完全なガイドを追加:
  - AI エージェントとは何か、チャットボットとどのように異なるか
  - 3 つのクイックスタートエージェントテンプレート（Foundry Agents、Prompty、RAG）
  - エージェントのアーキテクチャパターン（単一エージェント、RAG、マルチエージェント）
  - ツールの設定とカスタマイズ
  - モニタリングとメトリクスの追跡
  - コストに関する考慮事項と最適化
  - 一般的なトラブルシューティングのシナリオ
  - 成功基準を備えた 3 つのハンズオン演習

#### コンテンツ構成
- <strong>導入</strong>: 初心者向けのエージェント概念
- <strong>クイックスタート</strong>: `azd init --template get-started-with-ai-agents` でエージェントをデプロイ
- <strong>アーキテクチャパターン</strong>: エージェントパターンの図解
- <strong>設定</strong>: ツールセットアップと環境変数
- <strong>モニタリング</strong>: Application Insights 統合
- <strong>演習</strong>: 進行的なハンズオン学習（各 20–45 分）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境の更新
**このバージョンでは、AZD 学習体験のために開発コンテナ構成を最新ツールとより良いデフォルト設定に更新しました。**

#### 変更
- **🐳 ベースイメージ**: `python:3.12-bullseye` から `python:3.12-bookworm` に更新（最新の Debian 安定版）
- **📛 コンテナ名**: 明確化のため "Python 3" から "AZD for Beginners" に改名

#### 追加
- **🔧 新しい Dev コンテナ機能**:
  - `azure-cli` は Bicep サポートが有効
  - `node:20` (AZD テンプレート向けの LTS バージョン)
  - `github-cli`（テンプレート管理用）
  - `docker-in-docker`（コンテナアプリのデプロイ用）

- **🔌 ポートフォワーディング**: 一般的な開発向けに事前設定されたポート:
  - 8000 (MkDocs プレビュー)
  - 3000 (Web アプリ)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新しい VS Code 拡張機能**:
  - `ms-python.vscode-pylance` - Python の IntelliSense を強化
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions サポート
  - `ms-azuretools.vscode-docker` - Docker サポート
  - `ms-azuretools.vscode-bicep` - Bicep 言語サポート
  - `ms-azure-devtools.azure-resource-groups` - Azure リソース管理
  - `yzhang.markdown-all-in-one` - Markdown 編集
  - `DavidAnson.vscode-markdownlint` - Markdown リント
  - `bierner.markdown-mermaid` - Mermaid 図のサポート
  - `redhat.vscode-yaml` - YAML サポート（azure.yaml 用）
  - `eamodio.gitlens` - Git の可視化
  - `mhutchie.git-graph` - Git 履歴

- **⚙️ VS Code 設定**: Python インタプリタ、保存時のフォーマット、空白トリミングのデフォルト設定を追加

- **📦 requirements-dev.txt を更新**:
  - MkDocs minify プラグインを追加
  - コード品質のための pre-commit を追加
  - Azure SDK パッケージ（azure-identity、azure-mgmt-resource）を追加

#### 修正
- **Post-Create コマンド**: コンテナ起動時に AZD と Azure CLI のインストールを確認するように

---

### [v3.11.0] - 2026-02-05

#### 初心者向け README の大幅改訂
**このバージョンは README.md を初心者にとってよりアクセスしやすく大幅に改善し、AI 開発者向けの重要なリソースを追加しています。**

#### 追加
- **🆚 Azure CLI と AZD の比較**: どのツールをいつ使用するかを実践的な例とともに明確に説明
- **🌟 Awesome AZD リンク**: コミュニティのテンプレートギャラリーと貢献リソースへの直接リンク:
  - [Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/) - 200+ すぐにデプロイ可能なテンプレート
  - [テンプレートを提出](https://github.com/Azure/awesome-azd/issues) - コミュニティへの貢献
- **🎯 クイックスタートガイド**: 簡略化された 3 ステップの開始手順（インストール → ログイン → デプロイ）
- **📊 経験ベースのナビゲーション表**: 開発者の経験に基づいてどこから始めるべきかを明確に案内

#### 変更
- **README 構成**: 段階的開示のために再編成 - 重要な情報を先頭に配置
- <strong>導入セクション</strong>: 完全な初心者向けに "The Magic of `azd up`" を説明するように書き直し
- <strong>重複コンテンツの削除</strong>: 重複していたトラブルシューティングセクションを削除
- <strong>トラブルシューティングコマンド</strong>: `azd logs` の参照を有効な `azd monitor --logs` に修正

#### 修正
- **🔐 認証コマンド**: `azd auth login` と `azd auth logout` を cheat-sheet.md に追加
- <strong>無効なコマンド参照</strong>: README のトラブルシューティングセクションから残存していた `azd logs` を削除

#### 注意事項
- <strong>範囲</strong>: 変更は main README.md と resources/cheat-sheet.md に適用
- <strong>対象読者</strong>: AZD に不慣れな開発者を特に対象とした改善

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI コマンド正確性の更新
**このバージョンはドキュメント全体で存在しない AZD コマンドを修正し、すべてのコード例が有効な Azure Developer CLI 構文を使用するようにしています。**

#### 修正
- **🔧 存在しない AZD コマンドの削除**: 無効なコマンドの包括的な監査と修正:
  - `azd logs` (存在しません) → `azd monitor --logs` または Azure CLI の代替に置換
  - `azd service` のサブコマンド (存在しません) → `azd show` と Azure CLI に置換
  - `azd infra import/export/validate` (存在しません) → 削除または有効な代替に置換
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` フラグ (存在しません) → 削除
  - `azd provision --what-if/--rollback` フラグ (存在しません) → `--preview` を使用するように更新
  - `azd config validate` (存在しません) → `azd config list` に置換
  - `azd info`, `azd history`, `azd metrics` (存在しません) → 削除

- **📚 コマンド修正が適用されたファイル**:
  - `resources/cheat-sheet.md`: コマンド参照の大幅な改訂
  - `docs/deployment/deployment-guide.md`: ロールバックとデプロイ戦略を修正
  - `docs/troubleshooting/debugging.md`: ログ解析セクションを修正
  - `docs/troubleshooting/common-issues.md`: トラブルシューティングコマンドを更新
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD デバッグセクションを修正
  - `docs/getting-started/azd-basics.md`: 監視コマンドを修正
  - `docs/getting-started/first-project.md`: 監視とデバッグの例を更新
  - `docs/getting-started/installation.md`: ヘルプとバージョン例を修正
  - `docs/pre-deployment/application-insights.md`: ログ表示コマンドを修正
  - `docs/pre-deployment/coordination-patterns.md`: エージェントデバッグコマンドを修正

- **📝 バージョン参照を更新**:
  - `docs/getting-started/installation.md`: ハードコードされた `1.5.0` バージョンを汎用の `1.x.x` に変更し、リリースへのリンクを追加

#### 変更
- <strong>ロールバック戦略</strong>: ドキュメントを Git ベースのロールバックに更新（AZD にネイティブなロールバックはないため）
- <strong>ログ表示</strong>: `azd logs` の参照を `azd monitor --logs`、`azd monitor --live`、および Azure CLI コマンドに置換
- <strong>パフォーマンスセクション</strong>: 存在しない並列/インクリメンタルデプロイフラグを削除し、有効な代替を提示

#### 技術的詳細
- **有効な AZD コマンド**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有効な azd monitor フラグ**: `--live`, `--logs`, `--overview`
- <strong>削除された機能</strong>: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 注記
- <strong>検証</strong>: コマンドは Azure Developer CLI v1.23.x に対して検証済み

---

### [v3.9.0] - 2026-02-05

#### ワークショップ完了とドキュメント品質の更新
**このバージョンはインタラクティブなワークショップモジュールを完成させ、すべての壊れたドキュメントリンクを修正し、Microsoft AZD を使用する AI 開発者向けのコンテンツ品質を向上させます。**

#### 追加
- **📝 CONTRIBUTING.md**: 新しい貢献ガイドライン文書（以下を含む）:
  - 問題報告と変更提案の明確な手順
  - 新しいコンテンツのためのドキュメント基準
  - コード例の方針とコミットメッセージ規約
  - コミュニティ参加の情報

#### 完了
- **🎯 ワークショップ モジュール 7（まとめ）**: 完全に完成したラップアップモジュールで:
  - ワークショップの成果の総合的な要約
  - AZD、テンプレート、Microsoft Foundry をカバーする習得した主要概念のセクション
  - 学習継続のための推奨事項
  - 難易度評価付きのワークショップチャレンジ演習
  - コミュニティのフィードバックとサポートリンク

- **📚 ワークショップ モジュール 3（分解）**: 学習目標を更新し:
  - GitHub Copilot と MCP サーバーの有効化手順
  - AZD テンプレートのフォルダ構成の理解
  - Infrastructure-as-code (Bicep) の構成パターン
  - ハンズオンラボの手順

- **🔧 ワークショップ モジュール 6（解体）**: 完了:
  - リソースのクリーンアップとコスト管理の目標
  - 安全なインフラ撤去のための `azd down` の使用
  - ソフト削除された Cognitive Services の復旧ガイダンス
  - GitHub Copilot と Azure ポータルの追加探索プロンプト

#### 修正
- **🔗 壊れたリンクの修正**: 15 件以上の壊れた内部ドキュメントリンクを解消:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md へのパスを修正
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md と production-ai-practices.md へのパスを修正
  - `docs/getting-started/first-project.md`: 存在しない cicd-integration.md を deployment-guide.md に置換
  - `examples/retail-scenario.md`: FAQ とトラブルシューティングガイドへのパスを修正
  - `examples/container-app/microservices/README.md`: コースホームとデプロイガイドへのパスを修正
  - `resources/faq.md` と `resources/glossary.md`: AI チャプター参照を更新
  - `course-outline.md`: インストラクターガイドと AI ワークショップラボ参照を修正

- **📅 ワークショップステータスバナー**: "Under Construction" から 2026 年 2 月の日付でアクティブなワークショップステータスに更新
- **🔗 ワークショップナビゲーション**: workshop README.md 内の存在しない lab-1-azd-basics フォルダを指す壊れたナビゲーションリンクを修正

#### 変更
- <strong>ワークショッププレゼンテーション</strong>: "under construction" 警告を削除し、ワークショップは完了して利用可能に
- <strong>ナビゲーションの整合性</strong>: すべてのワークショップモジュールが適切なモジュール間ナビゲーションを持つように整備
- <strong>学習パス参照</strong>: microsoft-foundry の正しいパスを使用するように章間参照を更新

#### 検証済み
- ✅ すべての英語のマークダウンファイルは内部リンクが有効
- ✅ ワークショップモジュール 0-7 は学習目標とともに完了
- ✅ 章間およびモジュール間のナビゲーションが正しく機能
- ✅ コンテンツは Microsoft AZD を使用する AI 開発者に適している
- ✅ 初心者向けの言語と構成が全体で維持されている
- ✅ CONTRIBUTING.md はコミュニティ貢献者に対して明確なガイダンスを提供

#### 技術的実装
- <strong>リンク検証</strong>: 自動 PowerShell スクリプトで全ての .md の内部リンクを検証
- <strong>コンテンツ監査</strong>: ワークショップの完成度と初心者適合性の手動レビュー
- <strong>ナビゲーションシステム</strong>: 一貫した章およびモジュールのナビゲーションパターンを適用

#### 注意事項
- <strong>範囲</strong>: 変更は英語ドキュメントにのみ適用
- <strong>翻訳</strong>: 翻訳フォルダはこのバージョンでは更新されていません（自動翻訳が後で同期されます）
- <strong>ワークショップ所要時間</strong>: 完全なワークショップは現在 3〜4 時間のハンズオン学習を提供

---

### [v3.8.0] - 2025-11-19

#### 高度なドキュメント: 監視、セキュリティ、マルチエージェントパターン
**このバージョンは、Application Insights 統合、認証パターン、および本番デプロイ用のマルチエージェント調整に関する包括的な A グレードレッスンを追加します。**

#### 追加
- **📊 Application Insights 統合レッスン**: `docs/pre-deployment/application-insights.md` にて:
  - 自動プロビジョニングを伴う AZD 向けデプロイ
  - Application Insights + Log Analytics の完全な Bicep テンプレート
  - カスタムテレメトリを備えた動作する Python アプリケーション（1,200 行以上）
  - AI/LLM 監視パターン（Microsoft Foundry モデルのトークン/コスト追跡）
  - 6つの Mermaid 図（アーキテクチャ、分散トレーシング、テレメトリフロー）
  - 3つのハンズオン演習（アラート、ダッシュボード、AI 監視）
  - Kusto クエリ例とコスト最適化戦略
  - ライブメトリクスストリーミングとリアルタイムデバッグ
  - 本番対応パターンを含む学習時間：40〜50 分

- **🔐 認証とセキュリティパターンのレッスン**: `docs/getting-started/authsecurity.md` にて:
  - 3つの認証パターン（接続文字列、Key Vault、マネージド ID）
  - 安全なデプロイのための完全な Bicep インフラテンプレート
  - Azure SDK 統合を含む Node.js アプリケーションコード
  - 3つの完全な演習（マネージド ID 有効化、ユーザー割り当て ID、Key Vault のローテーション）
  - セキュリティのベストプラクティスと RBAC 設定
  - トラブルシューティングガイドとコスト分析
  - 本番対応のパスワードレス認証パターン

- **🤖 マルチエージェント調整パターンのレッスン**: `docs/pre-deployment/coordination-patterns.md` にて:
  - 5つの調整パターン（逐次、並列、階層、イベント駆動、コンセンサス）
  - 完全なオーケストレータサービス実装（Python/Flask、1,500 行以上）
  - 3つの専門エージェント実装（Research、Writer、Editor）
  - メッセージキューイングのための Service Bus 統合
  - 分散システム向けの Cosmos DB ステート管理
  - エージェント相互作用を示す 6 つの Mermaid 図
  - 3つの高度な演習（タイムアウト処理、リトライロジック、サーキットブレーカー）
  - コスト内訳（$240-565/月）と最適化戦略
  - 監視のための Application Insights 統合

#### 強化
- **Pre-deployment 章**: 包括的な監視と調整パターンを含むように拡張
- **Getting Started 章**: プロフェッショナルな認証パターンを追加して強化
- <strong>本番準備性</strong>: セキュリティから可観測性までの完全なカバレッジ
- <strong>コース概要</strong>: 第3章と第6章の新しいレッスンを参照するように更新

#### 変更
- <strong>学習の進行</strong>: コース全体でセキュリティと監視の統合を改善
- <strong>ドキュメント品質</strong>: 新しいレッスン全体で一貫した A グレード基準（95-97%）を達成
- <strong>本番パターン</strong>: エンタープライズデプロイ向けのエンドツーエンドの完全カバレッジ

#### 改善
- <strong>開発者体験</strong>: 開発から本番監視への明確な経路
- <strong>セキュリティ標準</strong>: 認証とシークレット管理のプロフェッショナルなパターン
- <strong>オブザーバビリティ</strong>: AZD を使用した完全な Application Insights 統合
- **AI ワークロード**: Microsoft Foundry Models とマルチエージェントシステムのための専門的な監視

#### 検証済み
- ✅ すべてのレッスンに完全な動作コードが含まれている（スニペットではない）
- ✅ 視覚学習のための Mermaid 図（合計19、3つのレッスンにまたがる）
- ✅ 検証手順付きのハンズオン演習（合計9）
- ✅ `azd up` でデプロイ可能な本番対応の Bicep テンプレート
- ✅ コスト分析と最適化戦略
- ✅ トラブルシューティングガイドとベストプラクティス
- ✅ 検証コマンド付きの知識チェックポイント

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - 包括的な監視ガイド
- **docs/getting-started/authsecurity.md**: - プロフェッショナルなセキュリティパターン
- **docs/pre-deployment/coordination-patterns.md**: - 高度なマルチエージェントアーキテクチャ
- **Overall New Content**: - 一貫した高品質基準

#### 技術的実装
- **Application Insights**: Log Analytics + カスタムテレメトリ + 分散トレース
- **Authentication**: Managed Identity + Key Vault + RBAC パターン
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + オーケストレーション
- **Monitoring**: ライブメトリクス + Kusto クエリ + アラート + ダッシュボード
- **Cost Management**: サンプリング戦略、保持ポリシー、予算管理

### [v3.7.0] - 2025-11-19

#### ドキュメント品質の改善と Microsoft Foundry Models の新規例
**このバージョンはリポジトリ全体のドキュメント品質を向上させ、gpt-4.1 チャットインターフェイスを備えた完全な Microsoft Foundry Models のデプロイ例を追加します。**

#### 追加
- **🤖 Microsoft Foundry Models チャット例**: `examples/azure-openai-chat/` に実装済みの gpt-4.1 デプロイを含む完全な例:
  - Microsoft Foundry Models のインフラ完全構成（gpt-4.1 モデルのデプロイ）
  - 会話履歴付きの Python コマンドラインチャットインターフェイス
  - API キーを安全に保存するための Key Vault 統合
  - トークン使用量の追跡とコスト見積り
  - レート制限とエラー処理
  - 35-45 分のデプロイガイドを含む包括的な README
  - 本番対応のファイル 11 個（Bicep テンプレート、Python アプリ、構成）
- **📚 ドキュメント演習**: 設定ガイドにハンズオン練習問題を追加:
  - 演習 1: マルチ環境構成（15 分）
  - 演習 2: シークレット管理の実践（10 分）
  - 明確な成功基準と検証手順
- **✅ デプロイ検証**: デプロイガイドに検証セクションを追加:
  - ヘルスチェック手順
  - 成功基準チェックリスト
  - すべてのデプロイコマンドに対する期待される出力
  - トラブルシューティングのクイックリファレンス

#### 強化
- **examples/README.md**: A 評価品質に更新（93%）:
  - azure-openai-chat を関連セクションすべてに追加
  - ローカル例の数を 3 から 4 に更新
  - AI アプリケーション例テーブルに追加
  - 中級者向けクイックスタートに統合
  - Microsoft Foundry テンプレートセクションに追加
  - 比較マトリクスと技術調査セクションを更新
- <strong>ドキュメント品質</strong>: B+（87%）→ A-（92%）に向上（docs フォルダ全体）:
  - 重要なコマンド例に期待される出力を追加
  - 設定変更に対する検証手順を含めた
  - 実践的な演習によるハンズオン学習の強化

#### 変更
- <strong>学習進行</strong>: 中級学習者向けの AI 例のより良い統合
- <strong>ドキュメント構造</strong>: 明確な成果を持つより実践的な演習
- <strong>検証プロセス</strong>: 主要ワークフローに明確な成功基準を追加

#### 改善
- <strong>開発者体験</strong>: Microsoft Foundry Models のデプロイが 35-45 分に短縮（従来の複雑な代替 60-90 分）
- <strong>コスト透明性</strong>: Microsoft Foundry Models 例の明確なコスト見積り ($50-200/month)
- <strong>学習経路</strong>: azure-openai-chat により AI 開発者に明確な導入ポイントを提供
- <strong>ドキュメント基準</strong>: 一貫した期待出力と検証手順の整備

#### 検証済み
- ✅ Microsoft Foundry Models の例は `azd up` で完全に機能する
- ✅ 実装ファイル 11 個は構文上正しい
- ✅ README の手順は実際のデプロイ体験に一致
- ✅ ドキュメントリンクは 8 箇所以上で更新済み
- ✅ 例のインデックスはローカル例 4 件を正確に反映
- ✅ 表内の重複外部リンクは存在しない
- ✅ すべてのナビゲーション参照は正しい

#### 技術的実装
- **Microsoft Foundry Models アーキテクチャ**: gpt-4.1 + Key Vault + Container Apps パターン
- <strong>セキュリティ</strong>: Managed Identity 対応、シークレットは Key Vault に保存
- <strong>モニタリング</strong>: Application Insights 統合
- <strong>コスト管理</strong>: トークン追跡と使用量最適化
- <strong>デプロイ</strong>: 単一の `azd up` コマンドで完全セットアップ

### [v3.6.0] - 2025-11-19

#### 大規模アップデート: Container App デプロイ例
**このバージョンでは、Azure Developer CLI (AZD) を使用した包括的で本番対応のコンテナアプリケーションデプロイ例を導入し、学習パスへの完全なドキュメント統合を行っています。**

#### 追加
- **🚀 Container App の例**: `examples/container-app/` に新しいローカル例を追加:
  - [マスターガイド](examples/container-app/README.md): コンテナ化デプロイの完全な概要、クイックスタート、本番・高度なパターン
  - [シンプルな Flask API](../../examples/container-app/simple-flask-api): スケール・トゥ・ゼロ、ヘルスプローブ、監視、トラブルシューティングを備えた入門向け REST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices): 本番対応のマルチサービスデプロイ（API Gateway、Product、Order、User、Notification）、非同期メッセージング、Service Bus、Cosmos DB、Azure SQL、分散トレース、ブルーグリーン/カナリアデプロイ
- <strong>ベストプラクティス</strong>: コンテナワークロードのセキュリティ、監視、コスト最適化、CI/CD ガイダンス
- <strong>コードサンプル</strong>: 完全な `azure.yaml`、Bicep テンプレート、マルチ言語サービス実装（Python、Node.js、C#、Go）
- **テスト & トラブルシューティング**: エンドツーエンドテストシナリオ、監視コマンド、トラブルシューティングガイダンス

#### 変更
- **README.md**: "Local Examples - Container Applications" の下に新しい container app 例をフィーチャーしリンクを更新
- **examples/README.md**: container app 例を強調表示、比較マトリクスのエントリ追加、技術/アーキテクチャ参照を更新
- **コース概要 & 学習ガイド**: 関連章での container app 例とデプロイパターンへの参照を更新

#### 検証済み
- ✅ すべての新しい例は `azd up` でデプロイ可能でベストプラクティスに従う
- ✅ ドキュメントの相互リンクとナビゲーションを更新済み
- ✅ 例は入門から高度なシナリオまで、本番マイクロサービスを含む範囲をカバー

#### 注意
- <strong>範囲</strong>: 英語のドキュメントと例のみ
- <strong>次のステップ</strong>: 今後のリリースで追加の高度なコンテナパターンと CI/CD 自動化を拡張予定

### [v3.5.0] - 2025-11-19

#### 製品リブランディング: Microsoft Foundry
**このバージョンでは、英語ドキュメント全体で製品名を "Microsoft Foundry" に包括的に変更する更新を実施しています。**

#### 変更
- **🔄 製品名の更新**: "Microsoft Foundry" への完全なリブランディング
  - `docs/` フォルダの英語ドキュメント全体で参照を更新
  - フォルダ名の変更: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ファイル名の変更: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 合計: 7 ファイルにわたる 23 件のコンテンツ参照を更新

- **📁 フォルダ構造の変更**:
  - `docs/ai-foundry/` を `docs/microsoft-foundry/` にリネーム
  - すべての相互参照を新しいフォルダ構造に合わせて更新
  - ナビゲーションリンクを検証

- **📄 ファイルリネーム**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - すべての内部リンクを新しいファイル名参照に更新

#### 更新ファイル
- <strong>章ドキュメント</strong> (7 ファイル):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ナビゲーションリンク 3 件更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 製品名参照 4 件更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 既に Microsoft Foundry を使用（以前の更新から）
  - `docs/microsoft-foundry/production-ai-practices.md` - 参照 3 件更新（概要、コミュニティフィードバック、ドキュメント）
  - `docs/getting-started/azd-basics.md` - クロスリファレンスリンク 4 件更新
  - `docs/getting-started/first-project.md` - 章ナビゲーションリンク 2 件更新
  - `docs/getting-started/installation.md` - 次章リンク 2 件更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 参照 3 件更新（ナビゲーション、Discord コミュニティ）
  - `docs/troubleshooting/common-issues.md` - ナビゲーションリンク 1 件更新
  - `docs/troubleshooting/debugging.md` - ナビゲーションリンク 1 件更新

- <strong>コース構成ファイル</strong> (2 ファイル):
  - `README.md` - 参照 17 件更新（コース概要、章タイトル、テンプレートセクション、コミュニティインサイト）
  - `course-outline.md` - 参照 14 件更新（概要、学習目標、章リソース）

#### 検証済み
- ✅ 英語ドキュメントに残る "ai-foundry" フォルダパス参照はゼロ
- ✅ 英語ドキュメントに残る "Microsoft Foundry" 製品名参照はゼロ
- ✅ 新しいフォルダ構造でナビゲーションリンクはすべて機能
- ✅ ファイルとフォルダのリネームは正常に完了
- ✅ 章間の相互参照を検証済み

#### 注意
- <strong>範囲</strong>: 変更は `docs/` フォルダ内の英語ドキュメントに適用
- <strong>翻訳</strong>: `translations/` フォルダはこのバージョンで更新されていない
- <strong>ワークショップ</strong>: `workshop/` の教材はこのバージョンで更新されていない
- <strong>例</strong>: 例ファイルはまだレガシー命名を参照している可能性がある（今後のアップデートで対応予定）
- <strong>外部リンク</strong>: 外部の URL と GitHub リポジトリ参照は変更なし

#### コントリビューター向け移行ガイド
ローカルブランチや旧構造を参照しているドキュメントがある場合:
1. フォルダ参照を更新: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ファイル参照を更新: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 製品名を置換: "Microsoft Foundry" → "Microsoft Foundry"
4. すべての内部ドキュメントリンクがまだ機能することを検証

---

### [v3.4.0] - 2025-10-24

#### インフラプレビューと検証の強化
**このバージョンは、新しい Azure Developer CLI プレビュー機能の包括的サポートを導入し、ワークショップのユーザー体験を向上させます。**

#### 追加
- **🧪 azd provision --preview 機能ドキュメント**: 新しいインフラプレビュー機能の包括的なカバレッジ
  - コマンドリファレンスとチートシートの使用例
  - ユースケースと利点を含むプロビジョニングガイドへの詳細な統合
  - より安全なデプロイ検証のための事前チェック統合
  - 安全優先のデプロイ手法を含む入門ガイドの更新
- **🚧 ワークショップステータスバナー**: ワークショップ開発状況を示すプロフェッショナルな HTML バナー
  - 明確なユーザーコミュニケーションのためのグラデーションデザインと工事表示
  - 透明性のための最終更新タイムスタンプ
  - すべてのデバイスでのモバイル対応デザイン

#### 強化
- <strong>インフラの安全性</strong>: プレビュー機能がデプロイ文書全体に統合
- <strong>事前デプロイ検証</strong>: 自動化スクリプトにインフラプレビュー検査を追加
- <strong>開発者ワークフロー</strong>: プレビューをベストプラクティスとして含むコマンドシーケンスを更新
- <strong>ワークショップ体験</strong>: コンテンツ開発状況に関する明確な期待値をユーザーに提供

#### 変更
- <strong>デプロイのベストプラクティス</strong>: プレビュー優先ワークフローを推奨アプローチに
- <strong>ドキュメントフロー</strong>: 学習プロセスの初期段階にインフラ検証を移動
- <strong>ワークショッププレゼンテーション</strong>: 明確な開発タイムラインを伴うプロフェッショナルなステータス表現

#### 改善
- <strong>安全優先アプローチ</strong>: デプロイ前にインフラ変更を検証可能に
- <strong>チームコラボレーション</strong>: プレビュー結果をレビューや承認のために共有可能
- <strong>コスト認識</strong>: プロビジョニング前にリソースコストをより良く把握
- <strong>リスク低減</strong>: 事前検証によりデプロイ失敗を削減

#### 技術的実装
- <strong>マルチドキュメント統合</strong>: プレビューフィーチャーは主要な 4 ファイルに文書化
- <strong>コマンドパターン</strong>: ドキュメント全体で一貫した構文と例を提供
- <strong>ベストプラクティス統合</strong>: プレビューが検証ワークフローとスクリプトに含まれる
- <strong>視覚的指標</strong>: 新機能の発見性のための明確な NEW マーク

#### ワークショップインフラ
- <strong>ステータスコミュニケーション</strong>: グラデーションスタイルのプロフェッショナルな HTML バナー
- <strong>ユーザー体験</strong>: 開発ステータスの明確化により混乱を防止
- <strong>プロフェッショナルなプレゼンテーション</strong>: リポジトリの信頼性を維持しつつ期待値を設定
- <strong>タイムラインの透明性</strong>: 2025 年 10 月の最終更新タイムスタンプによる説明責任

### [v3.3.0] - 2025-09-24

#### ワークショップ教材とインタラクティブ学習体験の強化
**このバージョンでは、ブラウザベースのインタラクティブガイドと構造化された学習パスを備えた包括的なワークショップ教材を導入します。**

#### 追加
- **🎥 インタラクティブワークショップガイド**: ブラウザベースのワークショップ体験（MkDocs プレビュー機能付き）
- **📝 構造化されたワークショップ手順**: 発見からカスタマイズまでの 7 段階のガイド付き学習パス
  - 0-Introduction: ワークショップの概要とセットアップ
  - 1-Select-AI-Template: テンプレートの発見と選択プロセス
  - 2-Validate-AI-Template: デプロイと検証手順
  - 3-Deconstruct-AI-Template: テンプレートアーキテクチャの理解
  - 4-Configure-AI-Template: 設定とカスタマイズ
  - 5-Customize-AI-Template: 上級の修正と反復
  - 6-Teardown-Infrastructure: クリーンアップとリソース管理
  - 7-Wrap-up: 要約と次のステップ
- **🛠️ ワークショップ用ツール**: 強化された学習体験のための MkDocs 設定と Material テーマ
- **🎯 ハンズオン学習パス**: 3 ステップの方法論（Discovery → Deployment → Customization）
- **📱 GitHub Codespaces 統合**: シームレスな開発環境のセットアップ

#### 強化
- **AI Workshop Lab**: 2〜3 時間の包括的な構造化学習体験を拡張
- <strong>ワークショップドキュメント</strong>: ナビゲーションと視覚補助を備えたプロフェッショナルなプレゼンテーション
- <strong>学習進行</strong>: テンプレート選択から本番デプロイまでの明確な段階的ガイダンス
- <strong>開発者体験</strong>: 開発ワークフローを効率化する統合ツール群

#### 改善
- <strong>アクセシビリティ</strong>: 検索、コピー機能、テーマ切替を備えたブラウザベースのインターフェイス
- <strong>自分のペースで学習</strong>: 異なる学習速度に対応する柔軟なワークショップ構造
- <strong>実践的応用</strong>: 実際の AI テンプレートデプロイシナリオ
- <strong>コミュニティ統合</strong>: ワークショップのサポートとコラボレーションのための Discord 統合

#### ワークショップの機能
- <strong>組み込み検索</strong>: キーワードやレッスンの迅速な発見
- <strong>コードブロックのコピー</strong>: すべてのコード例でホバーしてコピーする機能
- <strong>テーマ切替</strong>: 好みに合わせたダーク/ライトモードのサポート
- <strong>視覚資産</strong>: 理解を深めるためのスクリーンショットと図解
- <strong>ヘルプ統合</strong>: コミュニティサポートへの直接的な Discord アクセス

### [v3.2.0] - 2025-09-17

#### 大規模なナビゲーション再構築と章ベースの学習システム
**このバージョンは、リポジトリ全体にわたるナビゲーション強化を伴う包括的な章ベース学習構造を導入します。**

#### 追加
- **📚 章ベースの学習システム**: コース全体を 8 つの段階的な学習章に再構成
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 包括的なナビゲーションシステム**: すべてのドキュメントに一貫したナビゲーションヘッダーとフッターを配置
- **🎯 進捗追跡**: コース完了チェックリストと学習検証システム
- **🗺️ 学習パスのガイダンス**: 異なる経験レベルや目的に合わせた明確なエントリーポイント
- **🔗 クロスリファレンスナビゲーション**: 関連章や前提条件を明確にリンク

#### 強化
- **README 構造**: 章ベースの組織で構造化された学習プラットフォームに変換
- <strong>ドキュメントナビゲーション</strong>: 各ページに章の文脈と進行ガイダンスを追加
- <strong>テンプレートの整理</strong>: 例とテンプレートを適切な学習章にマッピング
- <strong>リソース統合</strong>: チートシート、FAQ、学習ガイドを関連章に接続
- <strong>ワークショップ統合</strong>: ハンズオンラボを複数の章学習目標にマッピング

#### 変更
- <strong>学習の進行</strong>: 線形ドキュメントから柔軟な章ベース学習へ移行
- <strong>設定ガイドの配置</strong>: より良い学習フローのために設定ガイドを Chapter 3 に再配置
- **AI コンテンツの統合**: 学習全体にわたる AI 固有コンテンツの統合を強化
- <strong>本番コンテンツ</strong>: 企業向けの上級パターンを Chapter 8 に集約

#### 改善
- <strong>ユーザー体験</strong>: 明確なナビゲーションパンくずリストと章進行インジケータ
- <strong>アクセシビリティ</strong>: コース横断のための一貫したナビゲーションパターン
- <strong>プロフェッショナルなプレゼンテーション</strong>: 大学風のコース構成で学術・企業研修に適合
- <strong>学習効率</strong>: 改善された組織により関連コンテンツの検索時間を短縮

#### 技術的実装
- <strong>ナビゲーションヘッダー</strong>: 40+ のドキュメントファイル全体で標準化された章ナビゲーション
- <strong>フッターナビゲーション</strong>: 一貫した進行ガイダンスと章完了インジケータ
- <strong>クロスリンク</strong>: 関連概念を結ぶ包括的な内部リンクシステム
- <strong>章マッピング</strong>: テンプレートと例を学習目標に明確に紐付け

#### 学習ガイドの強化
- **📚 包括的な学習目標**: 8 章システムに合わせて再構成された学習ガイド
- **🎯 章ベースの評価**: 各章に特定の学習目標と実践課題を含む
- **📋 進捗追跡**: 測定可能な成果と完了チェックリストを備えた週次学習スケジュール
- **❓ 評価問題**: 各章の知識検証問題と専門的な成果
- **🛠️ 実践演習**: 実際のデプロイシナリオとトラブルシューティングを伴うハンズオン活動
- **📊 スキル進行**: 基礎概念から企業パターンまでの明確な段階的向上とキャリア開発フォーカス
- **🎓 認定フレームワーク**: プロフェッショナル開発成果とコミュニティ認知システム
- **⏱️ タイムライン管理**: マイルストーン検証を含む構造化された 10 週間学習計画

### [v3.1.0] - 2025-09-17

#### 強化されたマルチエージェント AI ソリューション
**このバージョンでは、エージェントの命名とドキュメントを改善することで小売向けマルチエージェントソリューションを強化します。**

#### 変更
- **Multi-Agent Terminology**: 小売マルチエージェントソリューション全体で「Cora agent」を「Customer agent」に置換して明確化
- **Agent Architecture**: 一貫した「Customer agent」命名を使用するようにすべてのドキュメント、ARM テンプレート、およびコード例を更新
- **Configuration Examples**: 更新された命名規約を用いたエージェント設定パターンのモダナイズ
- **Documentation Consistency**: すべての参照がプロフェッショナルで説明的なエージェント名を使用するよう整備

#### 強化
- **ARM Template Package**: retail-multiagent-arm-template を Customer agent 参照で更新
- **Architecture Diagrams**: エージェント命名を更新した Mermaid 図をリフレッシュ
- **Code Examples**: Python クラスと実装例で CustomerAgent 命名を使用
- **Environment Variables**: すべてのデプロイスクリプトを CUSTOMER_AGENT_NAME 形式に更新

#### 改善
- <strong>開発者体験</strong>: ドキュメント内でのエージェントの役割と責任がより明確に
- <strong>本番準備</strong>: 企業の命名規約との整合性が向上
- <strong>学習教材</strong>: 教育目的で直感的なエージェント命名
- <strong>テンプレートの使いやすさ</strong>: エージェント機能とデプロイパターンの理解が簡素化

#### 技術的詳細
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### 大幅な変更 - AI 開発者フォーカスと Microsoft Foundry 統合
**このバージョンは、リポジトリを Microsoft Foundry 統合を含む包括的な AI 集中型学習リソースへと変革します。**

#### 追加
- **🤖 AI-First Learning Path**: AI 開発者とエンジニアを優先する完全な再構成
- **Microsoft Foundry Integration Guide**: AZD を Microsoft Foundry サービスに接続するための包括的ドキュメント
- **AI Model Deployment Patterns**: モデル選択、設定、そして本番デプロイ戦略を網羅する詳細ガイド
- **AI Workshop Lab**: AI アプリケーションを AZD でデプロイ可能なソリューションに変換するための 2～3 時間のハンズオンワークショップ
- **Production AI Best Practices**: AI ワークロードのスケーリング、監視、およびセキュリティに関する企業向けパターン
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models、Cognitive Services、および AI デプロイの問題に関する包括的なトラブルシューティング
- **AI Template Gallery**: 複雑度評価付きの Microsoft Foundry テンプレートの注目コレクション
- **Workshop Materials**: ハンズオンラボと参考資料を備えた完全なワークショップ構成

#### 強化
- **README 構造**: Microsoft Foundry Discord の 45% のコミュニティ関心データを反映した AI 開発者フォーカス
- <strong>学習パス</strong>: 学生や DevOps エンジニア向けの従来のパスと並行した専用の AI 開発者向けルート
- <strong>テンプレート推奨</strong>: azure-search-openai-demo、contoso-chat、openai-chat-app-quickstart などの注目 AI テンプレート
- <strong>コミュニティ統合</strong>: AI 固有のチャンネルと議論を備えた強化された Discord コミュニティサポート

#### セキュリティと本番フォーカス
- **Managed Identity Patterns**: AI 固有の認証とセキュリティ構成
- <strong>コスト最適化</strong>: トークン使用量の追跡と AI ワークロード向けの予算管理
- <strong>マルチリージョンデプロイ</strong>: グローバルな AI アプリケーションデプロイのための戦略
- <strong>パフォーマンス監視</strong>: AI 固有のメトリクスと Application Insights 統合

#### ドキュメント品質
- <strong>線形コース構造</strong>: 初級から上級の AI デプロイパターンへの論理的進行
- **検証済み URL**: すべての外部リポジトリリンクが検証されアクセス可能
- <strong>完全な参照</strong>: すべての内部ドキュメントリンクが検証され機能
- <strong>本番対応</strong>: 実際の例を伴う企業向けデプロイパターン

### [v2.0.0] - 2025-09-09

#### 大幅な変更 - リポジトリ再構成とプロフェッショナルな強化
**このバージョンは、リポジトリ構造とコンテンツ表示の大幅なオーバーホールを表します。**

#### 追加
- <strong>構造化された学習フレームワーク</strong>: すべてのドキュメントページに「導入」「学習目標」「学習成果」セクションを追加
- <strong>ナビゲーションシステム</strong>: ガイド付き学習進行のためにすべてのドキュメントに「前へ/次へ」リンクを追加
- <strong>スタディガイド</strong>: 学習目標、実践演習、評価資料を含む包括的な study-guide.md
- <strong>プロフェッショナルなプレゼンテーション</strong>: アクセシビリティとプロフェッショナルな外観を向上させるためにすべての絵文字アイコンを削除
- <strong>コンテンツ構造の強化</strong>: 学習資料の組織と流れを改善

#### 変更
- <strong>ドキュメントフォーマット</strong>: すべてのドキュメントを一貫した学習重視構造で標準化
- <strong>ナビゲーションフロー</strong>: すべての学習資料を通じた論理的進行を実装
- <strong>コンテンツ表示</strong>: 装飾要素を削除し、明確で専門的なフォーマットを採用
- <strong>リンク構造</strong>: 新しいナビゲーションシステムをサポートするためにすべての内部リンクを更新

#### 改善
- <strong>アクセシビリティ</strong>: スクリーンリーダー互換性向上のために絵文字依存を削除
- <strong>プロフェッショナルな外観</strong>: 企業向け学習に適したクリーンで学術的なスタイル
- <strong>学習体験</strong>: 各レッスンの明確な目標と成果を伴う構造化されたアプローチ
- <strong>コンテンツの整理</strong>: 関連トピック間の論理的な流れと接続を改善

### [v1.0.0] - 2025-09-09

#### 初回リリース - 包括的な AZD 学習リポジトリ

#### 追加
- <strong>コアドキュメント構造</strong>
  - 完全な getting-started ガイドシリーズ
  - 包括的なデプロイとプロビジョニングのドキュメント
  - 詳細なトラブルシューティングリソースとデバッグガイド
  - プレデプロイ検証ツールと手順

- <strong>はじめにモジュール</strong>
  - AZD 基礎: コア概念と用語
  - インストールガイド: プラットフォーム別セットアップ手順
  - 設定ガイド: 環境設定と認証
  - 最初のプロジェクトチュートリアル: ステップバイステップのハンズオン学習

- <strong>デプロイとプロビジョニングモジュール</strong>
  - デプロイガイド: 完全なワークフロードキュメント
  - プロビジョニングガイド: Bicep を使用した Infrastructure as Code
  - 本番デプロイのベストプラクティス
  - マルチサービスアーキテクチャパターン

- <strong>プレデプロイ検証モジュール</strong>
  - キャパシティ計画: Azure リソースの可用性検証
  - SKU 選定: サービス階層に関する包括的ガイダンス
  - プレフライトチェック: 自動化検証スクリプト（PowerShell と Bash）
  - コスト見積もりと予算計画ツール

- <strong>トラブルシューティングモジュール</strong>
  - 一般的な問題: よくある問題と解決策
  - デバッグガイド: システマティックなトラブルシューティング手法
  - 上級診断技術とツール
  - パフォーマンス監視と最適化

- <strong>リソースと参考</strong>
  - コマンドチートシート: 必須コマンドのクイックリファレンス
  - 用語集: 用語と略語の包括的定義
  - FAQ: よくある質問への詳細な回答
  - 外部リソースリンクとコミュニティ接続

- <strong>例とテンプレート</strong>
  - シンプルな Web アプリケーションの例
  - 静的サイトデプロイテンプレート
  - コンテナアプリケーションの構成
  - データベース統合パターン
  - マイクロサービスアーキテクチャの例
  - サーバーレス関数の実装

#### 機能
- <strong>マルチプラットフォームサポート</strong>: Windows、macOS、Linux 向けのインストールと設定ガイド
- <strong>複数のスキルレベル</strong>: 学生からプロの開発者までを対象としたコンテンツ
- <strong>実践重視</strong>: ハンズオン例と実世界のシナリオ
- <strong>包括的なカバレッジ</strong>: 基礎概念から上級企業パターンまで
- <strong>セキュリティファーストアプローチ</strong>: 全体に組み込まれたセキュリティベストプラクティス
- <strong>コスト最適化</strong>: コスト効率の良いデプロイとリソース管理のガイダンス

#### ドキュメント品質
- <strong>詳細なコード例</strong>: 実用的でテスト済みのコードサンプル
- <strong>ステップバイステップの手順</strong>: 明確で実行可能なガイダンス
- <strong>包括的なエラーハンドリング</strong>: 一般的な問題に対するトラブルシューティング
- <strong>ベストプラクティスの統合</strong>: 業界標準と推奨事項
- <strong>バージョン互換性</strong>: 最新の Azure サービスと azd 機能に対応

## 今後の計画された機能強化

### Version 3.1.0 (Planned)
#### AI プラットフォーム拡張
- **Multi-Model Support**: Hugging Face、Azure Machine Learning、およびカスタムモデル向けの統合パターン
- **AI Agent Frameworks**: LangChain、Semantic Kernel、AutoGen デプロイ用のテンプレート
- **Advanced RAG Patterns**: Azure AI Search を超えるベクターデータベースオプション（Pinecone、Weaviate など）
- **AI Observability**: モデル性能、トークン使用量、応答品質の監視強化

#### Developer Experience
- **VS Code Extension**: 統合された AZD + Microsoft Foundry の開発体験
- **GitHub Copilot Integration**: AI 支援による AZD テンプレート生成
- **Interactive Tutorials**: AI シナリオ向けの自動検証付きハンズオンコーディング演習
- **Video Content**: AI デプロイに焦点を当てた視覚学習者向け補足ビデオチュートリアル

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI モデルのガバナンス、コンプライアンス、および監査トレイル
- **Multi-Tenant AI**: 顧客ごとに分離された AI サービスを提供するためのパターン
- **Edge AI Deployment**: Azure IoT Edge およびコンテナ インスタンスとの統合
- **Hybrid Cloud AI**: AI ワークロード向けのマルチクラウドおよびハイブリッド展開パターン

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning パイプラインとの MLOps 統合
- **Advanced Security**: ゼロトラストパターン、プライベートエンドポイント、および高度な脅威対策
- **Performance Optimization**: 高スループット AI アプリケーション向けの高度なチューニングおよびスケーリング戦略
- **Global Distribution**: AI アプリケーション向けのコンテンツ配信およびエッジキャッシングパターン

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (完了)
- ✅ **Interactive Tutorials**: ハンズオン AI ワークショップラボ (完了)
- ✅ **Advanced Security Module**: AI 固有のセキュリティパターン (完了)
- ✅ **Performance Optimization**: AI ワークロードのチューニング戦略 (完了)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI に焦点を当てたデプロイシナリオ (完了)
- ✅ **Extended FAQ**: AI 固有の質問とトラブルシューティング (完了)
- **Tool Integration**: IDE およびエディタ統合ガイドの強化
- ✅ **Monitoring Expansion**: AI 固有の監視およびアラートパターン (完了)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: モバイル学習向けのレスポンシブデザイン
- **Offline Access**: ダウンロード可能なドキュメントパッケージ
- **Enhanced IDE Integration**: AZD + AI ワークフロー向けの VS Code 拡張
- **Community Dashboard**: リアルタイムのコミュニティ指標と貢献追跡

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: セマンティックバージョニングに従う（major.minor.patch）
2. **Date**: リリースまたは更新日（YYYY-MM-DD 形式）
3. **Category**: Added、Changed、Deprecated、Removed、Fixed、Security
4. **Clear Description**: 何が変更されたかの簡潔な説明
5. **Impact Assessment**: 既存ユーザーへの影響

### Change Categories

#### Added
- 新機能、ドキュメントセクション、または機能
- 新しい例、テンプレート、または学習リソース
- 追加のツール、スクリプト、またはユーティリティ

#### Changed
- 既存の機能やドキュメントの修正
- 明瞭さや正確性を向上させる更新
- コンテンツや構成の再編成

#### Deprecated
- 段階的に廃止される機能やアプローチ
- 削除予定のドキュメントセクション
- より良い代替手段があるメソッド

#### Removed
- もはや関連性のない機能、ドキュメント、または例
- 古い情報や廃止されたアプローチ
- 冗長または統合されたコンテンツ

#### Fixed
- ドキュメントやコードのエラー修正
- 報告された問題や障害の解決
- 正確性や機能の改善

#### Security
- セキュリティ関連の改善または修正
- セキュリティベストプラクティスの更新
- セキュリティ脆弱性の解決

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- ユーザーの対応が必要な破壊的変更
- コンテンツや組織の大規模な再構成
- 基本的なアプローチや方法論を変更する変更

#### Minor Version (X.Y.0)
- 新機能やコンテンツの追加
- 後方互換性を維持する強化
- 追加の例、ツール、またはリソース

#### Patch Version (X.Y.Z)
- バグ修正や訂正
- 既存コンテンツの小さな改善
- 明確化や小規模な改良

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: 問題を報告したり改善を提案してください（AI 固有の問題も歓迎）
- **Discord Discussions**: アイデアを共有し、Microsoft Foundry コミュニティと交流してください
- **Pull Requests**: 特に AI テンプレートやガイドに対するコンテンツの直接的な改善に貢献してください
- **Microsoft Foundry Discord**: AZD + AI に関する議論は #Azure チャンネルに参加してください
- **Community Forums**: より広範な Azure 開発者ディスカッションに参加してください

### Feedback Categories
- **AI Content Accuracy**: AI サービスの統合およびデプロイ情報の訂正
- **Learning Experience**: AI 開発者向けの学習フロー改善の提案
- **Missing AI Content**: 追加の AI テンプレート、パターン、または例のリクエスト
- **Accessibility**: 多様な学習ニーズへの配慮の改善
- **AI Tool Integration**: より良い AI 開発ワークフロー統合の提案
- **Production AI Patterns**: エンタープライズ向け AI 展開パターンのリクエスト

### Response Commitment
- **Issue Response**: 報告された問題には 48 時間以内に対応
- **Feature Requests**: 要求は 1 週間以内に評価
- **Community Contributions**: 1 週間以内にレビュー
- **Security Issues**: 優先対応で即時対応

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: コンテンツの正確性とリンク検証
- **Quarterly Updates**: 主要なコンテンツ追加と改善
- **Semi-Annual Reviews**: 包括的な再構成と強化
- **Annual Releases**: 重要な改善を伴うメジャーリリース

### Monitoring and Quality Assurance
- **Automated Testing**: コード例とリンクの定期的な検証
- **Community Feedback Integration**: ユーザー提案の定期的な取り込み
- **Technology Updates**: 最新の Azure サービスおよび azd リリースに整合
- **Accessibility Audits**: 包摂的デザイン原則の定期的なレビュー

## Version Support Policy

### Current Version Support
- **Latest Major Version**: 定期的な更新を含むフルサポート
- **Previous Major Version**: 12 か月間のセキュリティ更新および重要な修正
- **Legacy Versions**: コミュニティサポートのみ、公式の更新はなし

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: ステップバイステップの移行手順
- **Compatibility Notes**: 破壊的変更に関する詳細
- **Tool Support**: 移行を支援するスクリプトやユーティリティ
- **Community Support**: 移行に関する質問のための専用フォーラム

---

**Navigation**
- **Previous Lesson**: [学習ガイド](resources/study-guide.md)
- **Next Lesson**: Return to [メイン README](README.md)

**Stay Updated**: このリポジトリをウォッチして、学習資料の新しいリリースや重要な更新に関する通知を受け取ってください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確さが含まれる場合があることにご注意ください。原文（原語の文書）を正式な情報源とみなしてください。重要な情報については、プロの翻訳者による翻訳をお勧めします。本翻訳の利用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->