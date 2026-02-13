# 変更ログ - AZD For Beginners

## はじめに

この変更ログは、AZD For Beginners リポジトリにおけるすべての注目すべき変更、更新、および改善点を記録します。セマンティック バージョニングの原則に従い、バージョン間で何が変わったかを利用者が理解できるようにこのログを維持しています。

## 学習目標

この変更ログを確認することで、次のことができます:
- 新機能やコンテンツの追加について把握できる
- 既存ドキュメントの改善点を理解できる
- バグ修正や訂正を追跡し、正確性を確保できる
- 学習資料の進化を時間を追って追える

## 学習到達目標

変更ログのエントリを確認した後、あなたは以下ができるようになります:
- 学習に利用できる新しいコンテンツやリソースを特定できる
- どのセクションが更新・改善されたかを理解できる
- 最新の教材に基づいて学習計画を立てることができる
- 今後の改善のためにフィードバックや提案を提供できる

## バージョン履歴

### [v3.17.0] - 2026-02-05

#### コースナビゲーションの強化
**このバージョンでは、README.md の章ナビゲーションを改善し、表形式を強化しました。**

#### 変更点
- **コースマップ表**: 直接のレッスンリンク、所要時間の目安、および複雑さの評価を追加して強化しました
- **フォルダ整理**: 重複していた古いフォルダ (deployment/, getting-started/, pre-deployment/, troubleshooting/) を削除しました
- **リンク検証**: コースマップ表内の21件以上の内部リンクをすべて検証しました

### [v3.16.0] - 2026-02-05

#### 製品名の更新
**このバージョンでは、製品参照を現在の Microsoft ブランドに更新しました。**

#### 変更点
- **Azure AI Foundry → Microsoft Foundry**: 非翻訳ファイル全体の参照を更新しました
- **Azure AI Agent Service → Foundry Agents**: サービス名を現在のブランドに合わせて更新しました

#### 更新されたファイル
- `README.md` - メインコースのランディングページ
- `changelog.md` - バージョン履歴
- `course-outline.md` - コース構成
- `docs/chapter-02-ai-development/agents.md` - AI エージェント ガイド
- `examples/README.md` - サンプルドキュメント
- `workshop/README.md` - ワークショップのランディングページ
- `workshop/docs/index.md` - ワークショップの目次
- `workshop/docs/instructions/*.md` - すべてのワークショップ指示ファイル

---

### [v3.15.0] - 2026-02-05

#### 主要なリポジトリ再構成: 章ベースのフォルダ名
**このバージョンでは、より明確なナビゲーションのためにドキュメントを専用の章フォルダに再構成しました。**

#### フォルダ名の変更
古いフォルダは章番号付きのフォルダに置き換えられました:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### ファイル移行
| ファイル | 元 | 移動先 |
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
- **📚 章の README ファイル**: 各章フォルダに README.md を作成し、以下を含む:
  - 学習目標と所要時間
  - 説明付きのレッスン表
  - クイックスタートコマンド
  - 他の章へのナビゲーション

#### 変更点
- **🔗 すべての内部リンクを更新**: ドキュメント全体で78件以上のパスを更新しました
- **🗺️ メイン README.md**: 新しい章構成でコースマップを更新しました
- **📝 examples/README.md**: 章フォルダへの相互参照を更新しました

#### 削除
- 旧フォルダ構成 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### リポジトリ再構成: 章ナビゲーション
**このバージョンでは章ナビゲーションの README ファイルを追加しました（v3.15.0 により置き換えられました）。**

---

### [v3.13.0] - 2026-02-05

#### 新しい AI エージェント ガイド
**このバージョンでは、Azure Developer CLI を使用して AI エージェントをデプロイするための包括的なガイドを追加しました。**

#### 追加
- **🤖 docs/microsoft-foundry/agents.md**: 以下を網羅する完全なガイド:
  - AI エージェントとは何か、およびチャットボットとどのように異なるか
  - 3つのクイックスタートエージェントテンプレート（Foundry Agents、Prompty、RAG）
  - エージェントのアーキテクチャパターン（単一エージェント、RAG、マルチエージェント）
  - ツールの設定とカスタマイズ
  - 監視とメトリクストラッキング
  - コストに関する考慮事項と最適化
  - 一般的なトラブルシューティングシナリオ
  - 成功基準を含む3つの実践演習

#### コンテンツ構成
- **導入**: 初心者向けのエージェント概念
- **クイックスタート**: `azd init --template get-started-with-ai-agents` でエージェントをデプロイ
- **アーキテクチャパターン**: エージェントパターンの図解
- **構成**: ツール設定と環境変数
- **監視**: Application Insights との統合
- **演習**: 漸進的な実践学習（各20〜45分）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境の更新
**このバージョンでは、AZD 学習体験のためにモダンなツールとより良いデフォルトを用いた開発コンテナ構成を更新しました。**

#### 変更点
- **🐳 ベースイメージ**: `python:3.12-bullseye` から `python:3.12-bookworm`（最新のDebian安定版）に更新
- **📛 コンテナ名**: 明確化のため "Python 3" から "AZD for Beginners" に名前を変更しました

#### 追加
- **🔧 新しい Dev Container 機能**:
  - Bicep サポートが有効な `azure-cli`
  - `node:20`（AZD テンプレート向けの LTS バージョン）
  - テンプレート管理用の `github-cli`
  - コンテナアプリのデプロイ用 `docker-in-docker`

- **🔌 ポート転送**: 一般的な開発のために事前設定されたポート:
  - 8000（MkDocs プレビュー）
  - 3000（Web アプリ）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新しい VS Code 拡張機能**:
  - `ms-python.vscode-pylance` - 強化された Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions サポート
  - `ms-azuretools.vscode-docker` - Docker サポート
  - `ms-azuretools.vscode-bicep` - Bicep 言語サポート
  - `ms-azure-devtools.azure-resource-groups` - Azure リソース管理
  - `yzhang.markdown-all-in-one` - Markdown 編集
  - `DavidAnson.vscode-markdownlint` - Markdown リント
  - `bierner.markdown-mermaid` - Mermaid 図のサポート
  - `redhat.vscode-yaml` - YAML サポート（azure.yaml 用）
  - `eamodio.gitlens` - Git 可視化
  - `mhutchie.git-graph` - Git 履歴

- **⚙️ VS Code の設定**: Python インタプリタ、保存時のフォーマット、空白トリミングのデフォルト設定を追加しました

- **📦 requirements-dev.txt の更新**:
  - MkDocs minify プラグインを追加
  - コード品質のための pre-commit を追加
  - Azure SDK パッケージ（azure-identity、azure-mgmt-resource）を追加

#### 修正
- **作成後コマンド**: コンテナ起動時に AZD と Azure CLI のインストールを確認するようになりました

---

### [v3.11.0] - 2026-02-05

#### 初心者向け README の大幅改訂
**このバージョンでは README.md を大幅に改善し、初心者にとってよりアクセスしやすくし、AI 開発者向けの重要なリソースを追加しました。**

#### 追加
- **🆚 Azure CLI と AZD の比較**: 各ツールをいつ使うべきかを実用的な例とともに明確に説明
- **🌟 Awesome AZD リンク**: コミュニティテンプレートギャラリーと貢献リソースへの直接リンク:
  - [Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/) - 200以上のデプロイ準備済みテンプレート
  - [テンプレートを提出する](https://github.com/Azure/awesome-azd/issues) - コミュニティへの貢献
- **🎯 クイックスタートガイド**: 簡略化された3ステップの開始セクション（インストール → ログイン → デプロイ）
- **📊 経験ベースのナビゲーション表**: 開発者の経験に基づいてどこから始めるべきかを明確に案内

#### 変更点
- **README の構成**: 段階的な開示を意識して再編成し、重要な情報を先に配置しました
- **導入セクション**: 完全な初心者向けに「The Magic of `azd up`」を説明するように書き直しました
- **重複コンテンツの削除**: 重複していたトラブルシューティングセクションを削除しました
- **トラブルシューティングコマンド**: `azd logs` の参照を有効な `azd monitor --logs` に修正しました

#### 修正
- **🔐 認証コマンド**: `azd auth login` と `azd auth logout` を cheat-sheet.md に追加しました
- **無効なコマンド参照**: README のトラブルシューティングセクションから残っていた `azd logs` を削除しました

#### 注記
- **対象範囲**: 変更は main README.md と resources/cheat-sheet.md に適用されました
- **対象読者**: 変更は特に AZD に不慣れな開発者を対象としています

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI コマンドの正確性の更新
**このバージョンでは、ドキュメント全体の存在しない AZD コマンドを修正し、すべてのコード例が有効な Azure Developer CLI 構文を使用するようにしました。**

#### 修正
- **🔧 存在しない AZD コマンドの削除**: 無効なコマンドの包括的な監査と修正:
  - `azd logs`（存在しません）→ `azd monitor --logs` または Azure CLI の代替で置き換え
  - `azd service` サブコマンド（存在しません）→ `azd show` および Azure CLI に置き換え
  - `azd infra import/export/validate`（存在しません）→ 削除または有効な代替案に置き換え
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` フラグ（存在しません）→ 削除
  - `azd provision --what-if/--rollback` フラグ（存在しません）→ `--preview` を使用するように更新
  - `azd config validate`（存在しません）→ `azd config list` に置き換え
  - `azd info`、`azd history`、`azd metrics`（存在しません）→ 削除

  - **📚 コマンド修正を反映した更新ファイル**:
    - `resources/cheat-sheet.md`: コマンド参照の大幅な見直し
    - `docs/deployment/deployment-guide.md`: ロールバックとデプロイ戦略を修正
    - `docs/troubleshooting/debugging.md`: ログ分析セクションを修正
    - `docs/troubleshooting/common-issues.md`: トラブルシューティングコマンドを更新
    - `docs/troubleshooting/ai-troubleshooting.md`: AZD デバッグセクションを修正
    - `docs/getting-started/azd-basics.md`: 監視コマンドを修正
    - `docs/getting-started/first-project.md`: 監視およびデバッグの例を更新
    - `docs/getting-started/installation.md`: ヘルプおよびバージョン例を修正
    - `docs/pre-deployment/application-insights.md`: ログ表示コマンドを修正
    - `docs/pre-deployment/coordination-patterns.md`: エージェントのデバッグコマンドを修正

  - **📝 バージョン参照の更新**:
    - `docs/getting-started/installation.md`: 固定の `1.5.0` バージョンを汎用の `1.x.x` に変更し、リリースへのリンクを追加しました

#### 変更点
- **ロールバック戦略**: ドキュメントを Git ベースのロールバックを使用するように更新しました（AZD にはネイティブなロールバックはありません）
- **ログ表示**: `azd logs` の参照を `azd monitor --logs`、`azd monitor --live`、および Azure CLI コマンドに置き換えました
- **パフォーマンス セクション**: 存在しない並列/増分デプロイメントフラグを削除し、有効な代替案を提供しました

#### 技術的詳細
- **有効な AZD コマンド**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有効な azd monitor フラグ**: `--live`, `--logs`, `--overview`
- **削除された機能**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 注記
- **検証**: コマンドは Azure Developer CLI v1.23.x に対して検証済み

---

### [v3.9.0] - 2026-02-05

#### ワークショップ完了とドキュメント品質の更新
**このバージョンはインタラクティブなワークショップモジュールを完了し、壊れたドキュメントリンクをすべて修正し、Microsoft AZD を利用する AI 開発者向けのコンテンツ品質を向上させます。**

#### Added
- **📝 CONTRIBUTING.md**: 新しいコントリビューションガイド文書:
  - 問題の報告と変更提案のための明確な手順
  - 新しいコンテンツのためのドキュメント基準
  - コード例に関するガイドラインとコミットメッセージの規約
  - コミュニティ参加に関する情報

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: 完全に完了した総括モジュール（以下を含む）:
  - ワークショップの成果の包括的な要約
  - AZD、テンプレート、および AI Foundry を網羅する習得した主要概念のセクション
  - 学習継続のための推奨事項
  - 難易度評価付きのワークショップ課題演習
  - コミュニティのフィードバックおよびサポートへのリンク

- **📚 Workshop Module 3 (Deconstruct)**: 更新された学習目標（以下を含む）:
  - MCP サーバーを使用した GitHub Copilot の有効化ガイダンス
  - AZD テンプレートのフォルダ構成の理解
  - Infrastructure-as-code (Bicep) の組織化パターン
  - ハンズオン ラボの手順

- **🔧 Workshop Module 6 (Teardown)**: 完了（以下を含む）:
  - リソースのクリーンアップとコスト管理の目的
  - `azd down` の使用法による安全なインフラのデプロビジョニング
  - ソフト削除された Cognitive Services の復元ガイダンス
  - GitHub Copilot と Azure ポータル向けの追加探索プロンプト

#### Fixed
- **🔗 壊れたリンクの修正**: 15件以上の内部ドキュメントリンクを修正:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md へのパスを修正
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md と production-ai-practices.md へのパスを修正
  - `docs/getting-started/first-project.md`: 存在しない cicd-integration.md を deployment-guide.md に置き換え
  - `examples/retail-scenario.md`: FAQ とトラブルシューティング ガイドへのパスを修正
  - `examples/container-app/microservices/README.md`: コースホームとデプロイ ガイドへのパスを修正
  - `resources/faq.md` and `resources/glossary.md`: AI 章の参照を更新
  - `course-outline.md`: インストラクター ガイドと AI ワークショップ ラボの参照を修正

- **📅 Workshop Status Banner**: 「Under Construction」からアクティブなワークショップステータスに更新（2026年2月）
- **🔗 Workshop Navigation**: workshop README.md 内の、存在しない lab-1-azd-basics フォルダを指していた壊れたナビゲーションリンクを修正

#### Changed
- **ワークショップの提示**: 「under construction」警告を削除し、ワークショップは完了して使用可能になりました
- **ナビゲーションの一貫性**: すべてのワークショップモジュールが適切なモジュール間ナビゲーションを持つように保証
- **学習パス参照**: 章間参照を正しい microsoft-foundry パスを使用するよう更新

#### Validated
- ✅ すべての英語の markdown ファイルが有効な内部リンクを持つ
- ✅ ワークショップモジュール 0-7 が学習目標とともに完了
- ✅ 章およびモジュール間のナビゲーションが正しく機能する
- ✅ コンテンツは Microsoft AZD を使用する AI 開発者に適している
- ✅ 全体を通して初心者に優しい言語と構成が維持されている
- ✅ CONTRIBUTING.md がコミュニティ貢献者向けの明確なガイダンスを提供している

#### Technical Implementation
- **リンク検証**: 自動 PowerShell スクリプトがすべての .md 内部リンクを検証
- **コンテンツ監査**: ワークショップの完全性と初心者への適合性の手動レビュー
- **ナビゲーションシステム**: 一貫した章とモジュールのナビゲーションパターンを適用

#### Notes
- **適用範囲**: 変更は英語のドキュメントのみに適用
- **翻訳**: このバージョンでは翻訳フォルダは更新されていません（自動翻訳は後で同期されます）
- **ワークショップ所要時間**: 完全なワークショップは現在 3～4 時間のハンズオン学習を提供

---

### [v3.8.0] - 2025-11-19

#### 高度なドキュメント: 監視、セキュリティ、およびマルチエージェントパターン
**このバージョンは Application Insights 統合、認証パターン、および本番環境デプロイ向けのマルチエージェント調整に関する包括的な A グレードのレッスンを追加します。**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - 自動プロビジョニングによる AZD に焦点を当てたデプロイ
  - Application Insights + Log Analytics 用の完全な Bicep テンプレート
  - カスタムテレメトリを備えた動作する Python アプリケーション（1,200 行以上）
  - AI/LLM 監視パターン（Azure OpenAI のトークン/コスト追跡）
  - 6つの Mermaid 図（アーキテクチャ、分散トレーシング、テレメトリフロー）
  - 3つのハンズオン演習（アラート、ダッシュボード、AI 監視）
  - Kusto クエリ例とコスト最適化戦略
  - ライブメトリクスストリーミングとリアルタイムデバッグ
  - 本番対応パターンで 40～50 分の学習時間

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3つの認証パターン（接続文字列、Key Vault、マネージド ID）
  - セキュアなデプロイのための完全な Bicep インフラテンプレート
  - Azure SDK 統合を含む Node.js アプリケーションコード
  - 3つの完全な演習（マネージド ID の有効化、ユーザー割り当て ID、Key Vault 回転）
  - セキュリティのベストプラクティスと RBAC 構成
  - トラブルシューティングガイドとコスト分析
  - 本番対応のパスワードレス認証パターン

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5つのコーディネーションパターン（逐次、並列、階層、イベント駆動、コンセンサス）
  - オーケストレーターサービスの完全実装（Python/Flask、1,500 行以上）
  - 3つの専門エージェント実装（Research、Writer、Editor）
  - メッセージキューイングのための Service Bus 統合
  - 分散システムのための Cosmos DB 状態管理
  - エージェント間相互作用を示す 6つの Mermaid 図
  - 3つの高度な演習（タイムアウト処理、リトライロジック、サーキットブレーカー）
  - 最適化戦略を含むコスト内訳（$240–565/月）
  - 監視のための Application Insights 統合

#### Enhanced
- **プレデプロイメント章**: 包括的な監視とコーディネーションパターンを含むようになった
- **Getting Started 章**: プロフェッショナルな認証パターンで強化された
- **本番準備性**: セキュリティから可観測性までの完全なカバレッジ
- **コース概要**: 第3章と第6章の新しいレッスンを参照するように更新

#### Changed
- **学習の進行**: コース全体でセキュリティと監視の統合が向上
- **ドキュメント品質**: 新しいレッスン全体で一貫した A 級基準（95-97%）
- **プロダクションパターン**: エンタープライズ導入のためのエンドツーエンドの完全なカバレッジ

#### Improved
- **開発者体験**: 開発から本番監視への明確な道筋
- **セキュリティ基準**: 認証とシークレット管理のためのプロフェッショナルパターン
- **可観測性**: AZD と統合された完全な Application Insights
- **AI ワークロード**: Azure OpenAI とマルチエージェントシステム向けの専門的な監視

#### Validated
- ✅ すべてのレッスンに完全な動作コード（スニペットではない）が含まれている
- ✅ 視覚学習のための Mermaid 図（3 レッスン合計 19 図）
- ✅ 検証手順付きのハンズオン演習（合計 9）
- ✅ `azd up` でデプロイ可能な本番対応の Bicep テンプレート
- ✅ コスト分析と最適化戦略
- ✅ トラブルシューティングガイドとベストプラクティス
- ✅ 検証コマンドを含む知識チェックポイント

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - 包括的な監視ガイド
- **docs/getting-started/authsecurity.md**: - プロフェッショナルなセキュリティパターン
- **docs/pre-deployment/coordination-patterns.md**: - 高度なマルチエージェントアーキテクチャ
- **Overall New Content**: - 一貫した高品質基準

#### Technical Implementation
- **Application Insights**: Log Analytics + カスタムテレメトリ + 分散トレーシング
- **Authentication**: Managed Identity + Key Vault + RBAC パターン
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + オーケストレーション
- **Monitoring**: ライブメトリクス + Kusto クエリ + アラート + ダッシュボード
- **Cost Management**: サンプリング戦略、保持ポリシー、予算管理

### [v3.7.0] - 2025-11-19

#### ドキュメント品質の改善と新しい Azure OpenAI 例
**このバージョンはリポジトリ全体のドキュメント品質を強化し、GPT-4 チャットインターフェイスを備えた完全な Azure OpenAI デプロイ例を追加します。**

#### Added
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation in `examples/azure-openai-chat/`:
  - 完全な Azure OpenAI インフラ（GPT-4 モデルのデプロイ）
  - 会話履歴を備えた Python コマンドラインチャットインターフェース
  - API キーの安全な保存のための Key Vault 統合
  - トークン使用量の追跡とコスト見積もり
  - レート制限とエラーハンドリング
  - 35〜45 分のデプロイガイドを含む包括的な README
  - 本番対応のファイル 11 件（Bicep テンプレート、Python アプリ、設定）

- **📚 Documentation Exercises**: 設定ガイドにハンズオン実践演習を追加:
  - 演習 1: マルチ環境構成（15 分）
  - 演習 2: シークレット管理の実践（10 分）
  - 明確な成功基準と検証手順

- **✅ Deployment Verification**: デプロイガイドに検証セクションを追加:
  - ヘルスチェック手順
  - 成功基準チェックリスト
  - すべてのデプロイコマンドの期待される出力
  - トラブルシューティングのクイックリファレンス

#### Enhanced
- **examples/README.md**: A グレード品質（93%）に更新:
  - azure-openai-chat を関連セクションすべてに追加
  - ローカル例の数を 3 から 4 に更新
  - AI アプリケーション例の表に追加
  - 中級ユーザー向けクイックスタートに統合
  - Microsoft Foundry テンプレートセクションに追加
  - 比較マトリクスと技術探索セクションを更新
- **ドキュメント品質**: docs フォルダ全体で B+ (87%) → A- (92%) に改善:
  - 重要なコマンド例に期待される出力を追加
  - 設定変更の検証手順を含めた
  - 実践的な演習でハンズオン学習を強化

#### Changed
- **学習の進行**: 中級学習者向けに AI 例の統合を改善
- **ドキュメント構造**: 明確な成果を伴う実行可能な演習を増加
- **検証プロセス**: 主要なワークフローに明確な成功基準を追加

#### Improved
- **開発者体験**: Azure OpenAI のデプロイは現在 35～45 分で完了（複雑な代替案の 60～90 分に対して）
- **コストの透明性**: Azure OpenAI 例の明確なコスト見積もり（$50–200/月）
- **学習パス**: AI 開発者は azure-openai-chat による明確なエントリーポイントを持つ
- **ドキュメント基準**: 一貫した期待出力と検証手順

#### Validated
- ✅ Azure OpenAI の例は `azd up` で完全に機能する
- ✅ すべての 11 個の実装ファイルが構文的に正しい
- ✅ README の手順が実際のデプロイ体験と一致する
- ✅ ドキュメントリンクが 8 箇所以上で更新されている
- ✅ 例のインデックスが 4 つのローカル例を正確に反映している
- ✅ テーブル内に重複する外部リンクはない
- ✅ すべてのナビゲーション参照が正しい

#### Technical Implementation
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps パターン
- **Security**: マネージド ID 準備済み、シークレットは Key Vault に格納
- **Monitoring**: Application Insights 統合
- **Cost Management**: トークン追跡と使用の最適化
- **Deployment**: 単一の `azd up` コマンドによる完全セットアップ

### [v3.6.0] - 2025-11-19

#### 大規模アップデート: コンテナアプリのデプロイ例
**このバージョンは Azure Developer CLI (AZD) を使用した、包括的で本番対応のコンテナアプリケーションデプロイ例を導入し、完全なドキュメントと学習パスへの統合を行います。**

#### Added
- **🚀 Container App Examples**: 新しいローカル例を `examples/container-app/` に追加:
  - [マスターガイド](examples/container-app/README.md): コンテナ化されたデプロイの完全な概要、クイックスタート、本番および高度なパターン
  - [シンプルな Flask API](../../examples/container-app/simple-flask-api): スケール・トゥ・ゼロ、ヘルスプローブ、監視、トラブルシューティングを備えた初心者向けの REST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices): 本番対応のマルチサービスデプロイ（API Gateway、Product、Order、User、Notification）、非同期メッセージング、Service Bus、Cosmos DB、Azure SQL、分散トレーシング、ブルー/グリーンおよびカナリアデプロイメント
- **ベストプラクティス**: コンテナ化ワークロード向けのセキュリティ、監視、コスト最適化、CI/CD ガイダンス
- **コードサンプル**: 完全な `azure.yaml`、Bicep テンプレート、および多言語サービス実装（Python、Node.js、C#、Go）
- **テスト & トラブルシューティング**: エンドツーエンドのテストシナリオ、監視コマンド、トラブルシューティングガイダンス

#### Changed
- **README.md**: 「Local Examples - Container Applications」の下で新しいコンテナアプリ例を取り上げ、リンクを更新
- **examples/README.md**: コンテナアプリ例を強調表示し、比較マトリクスのエントリを追加し、技術/アーキテクチャ参照を更新
- **Course Outline & Study Guide**: 関連章の新しいコンテナーアプリの例とデプロイ パターンを参照するように更新

#### Validated
- ✅ すべての新しい例は `azd up` でデプロイ可能であり、ベストプラクティスに従っています
- ✅ ドキュメントの相互リンクとナビゲーションを更新済み
- ✅ 例は初心者から上級者までのシナリオをカバーしており、プロダクションのマイクロサービスも含む

#### Notes
- **Scope**: 英語のドキュメントと例のみ
- **Next Steps**: 将来のリリースで追加の高度なコンテナ パターンと CI/CD 自動化を拡張

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**このバージョンでは、英語ドキュメント全体での製品名の包括的な変更を実施しています。"Microsoft Foundry" から "Microsoft Foundry" への変更を反映しています。**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" から "Microsoft Foundry" への完全なリブランド
  - `docs/` フォルダー内の英語ドキュメント全体の参照を更新
  - フォルダー名の変更: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ファイル名の変更: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 合計: 7つのドキュメント ファイルにわたる23件のコンテンツ参照を更新

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` を `docs/microsoft-foundry/` にリネーム
  - すべての相互参照を新しいフォルダー構造に合わせて更新
  - ドキュメント全体でナビゲーションのリンクを検証済み

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - すべての内部リンクを新しいファイル名を参照するように更新

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ナビゲーション リンクを3か所更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 製品名参照を4か所更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 既に Microsoft Foundry を使用 (以前の更新から)
  - `docs/microsoft-foundry/production-ai-practices.md` - 参照を3か所更新 (概要、コミュニティ フィードバック、ドキュメント)
  - `docs/getting-started/azd-basics.md` - クロスリファレンス リンクを4か所更新
  - `docs/getting-started/first-project.md` - 章ナビゲーション リンクを2か所更新
  - `docs/getting-started/installation.md` - 次の章へのリンクを2か所更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 参照を3か所更新 (ナビゲーション、Discord コミュニティ)
  - `docs/troubleshooting/common-issues.md` - ナビゲーション リンクを1か所更新
  - `docs/troubleshooting/debugging.md` - ナビゲーション リンクを1か所更新

- **Course Structure Files** (2 files):
  - `README.md` - リファレンスを17か所更新 (コース概要、章タイトル、テンプレート セクション、コミュニティの洞察)
  - `course-outline.md` - リファレンスを14か所更新 (概要、学習目標、章のリソース)

#### Validated
- ✅ 英語ドキュメントに残る "ai-foundry" フォルダー パス参照はゼロ
- ✅ 英語ドキュメントに残る "Microsoft Foundry" の製品名参照はゼロ
- ✅ 新しいフォルダー構造でナビゲーションリンクはすべて機能
- ✅ ファイルとフォルダーのリネームは正常に完了
- ✅ 章間の相互参照を検証済み

#### Notes
- **Scope**: 変更は `docs/` フォルダー内の英語ドキュメントにのみ適用
- **Translations**: 翻訳フォルダー (`translations/`) はこのバージョンで更新されていません
- **Workshop**: ワークショップ資料 (`workshop/`) はこのバージョンで更新されていません
- **Examples**: 例ファイルはまだレガシーな命名を参照している場合があります（今後の更新で対処予定）
- **External Links**: 外部の URL および GitHub リポジトリ参照は変更なし

#### Migration Guide for Contributors
ローカル ブランチや旧構造を参照しているドキュメントがある場合:
1. フォルダー参照を更新: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ファイル参照を更新: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 製品名を置換: "Microsoft Foundry" → "Microsoft Foundry"
4. すべての内部ドキュメントリンクが正しく動作することを検証

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**このバージョンでは、新しい Azure Developer CLI のプレビュー機能に対する包括的なサポートを導入し、ワークショップのユーザー体験を強化しています。**

#### Added
- **🧪 azd provision --preview Feature Documentation**: 新しいインフラプレビュー機能の包括的なカバレッジ
  - コマンド参照とチートシートでの使用例
  - プロビジョニング ガイドへの詳細な統合（ユースケースと利点）
  - より安全なデプロイ検証のための事前チェック統合
  - 安全最優先のデプロイ手順を含む入門ガイドの更新
- **🚧 Workshop Status Banner**: ワークショップ開発状況を示すプロフェッショナルな HTML バナー
  - 明確なユーザーコミュニケーションのためのグラデーション デザインと工事表示
  - 透明性のための最終更新タイムスタンプ
  - すべてのデバイスでのモバイル対応デザイン

#### Enhanced
- **Infrastructure Safety**: プレビュー機能をデプロイ関連ドキュメント全体に統合
- **Pre-deployment Validation**: 自動化スクリプトにインフラプレビューテストを含めるように変更
- **Developer Workflow**: コマンドシーケンスを更新し、プレビューをベストプラクティスとして含める
- **Workshop Experience**: コンテンツ開発状況に関する明確な期待値をユーザーに提示

#### Changed
- **Deployment Best Practices**: プレビュー優先のワークフローを推奨アプローチに変更
- **Documentation Flow**: インフラ検証を学習プロセスの早い段階に移動
- **Workshop Presentation**: 明確な開発タイムラインを示すプロフェッショナルなステータス表示

#### Improved
- **Safety-First Approach**: インフラ変更をデプロイ前に検証できるようになった
- **Team Collaboration**: プレビュー結果をレビューや承認のために共有可能
- **Cost Awareness**: プロビジョニング前にリソースコストをより理解可能
- **Risk Mitigation**: 事前検証によりデプロイ失敗を削減

#### Technical Implementation
- **Multi-document Integration**: プレビュー機能を4つの主要ファイルにわたってドキュメント化
- **Command Patterns**: ドキュメント全体で一貫した構文と例を提供
- **Best Practice Integration**: バリデーション ワークフローとスクリプトにプレビューを統合
- **Visual Indicators**: 新機能の発見性を高める明確な NEW マーク

#### Workshop Infrastructure
- **Status Communication**: グラデーションスタイルのプロフェッショナルな HTML バナー
- **User Experience**: 開発状況の明確化により混乱を防止
- **Professional Presentation**: 期待値を設定しつつリポジトリの信頼性を維持
- **Timeline Transparency**: 最終更新タイムスタンプは October 2025（説明責任のため）

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**このバージョンでは、ブラウザベースのインタラクティブガイドと構造化された学習パスを備えた包括的なワークショップ資料を導入しています。**

#### Added
- **🎥 Interactive Workshop Guide**: MkDocs プレビュー機能を備えたブラウザベースのワークショップ体験
- **📝 Structured Workshop Instructions**: 発見からカスタマイズまでの7段階のガイド付き学習パス
  - 0-Introduction: ワークショップの概要とセットアップ
  - 1-Select-AI-Template: テンプレートの発見と選択プロセス
  - 2-Validate-AI-Template: デプロイと検証手順
  - 3-Deconstruct-AI-Template: テンプレートのアーキテクチャの理解
  - 4-Configure-AI-Template: 設定とカスタマイズ
  - 5-Customize-AI-Template: 上級の変更と反復
  - 6-Teardown-Infrastructure: クリーンアップとリソース管理
  - 7-Wrap-up: まとめと次のステップ
- **🛠️ Workshop Tooling**: Material テーマを使用した MkDocs 構成で学習体験を強化
- **🎯 Hands-On Learning Path**: 3ステップの方法論（Discovery → Deployment → Customization）
- **📱 GitHub Codespaces Integration**: シームレスな開発環境セットアップ

#### Enhanced
- **AI Workshop Lab**: 2～3時間の構造化された学習体験で拡張
- **Workshop Documentation**: ナビゲーションと視覚支援を備えたプロフェッショナルな提示
- **Learning Progression**: テンプレート選択からプロダクションデプロイまでの段階的な明確な案内
- **Developer Experience**: 開発ワークフローを合理化する統合ツール

#### Improved
- **Accessibility**: 検索、コピー機能、テーマ切替を備えたブラウザベースのインターフェース
- **Self-Paced Learning**: 学習速度の違いに対応する柔軟なワークショップ構成
- **Practical Application**: 実用的な AI テンプレートのデプロイシナリオ
- **Community Integration**: ワークショップサポートと共同作業のための Discord 統合

#### Workshop Features
- **Built-in Search**: キーワードやレッスンの素早い検索
- **Copy Code Blocks**: すべてのコード例でホバーしてコピー可能な機能
- **Theme Toggle**: 好みに応じたダーク/ライトモードのサポート
- **Visual Assets**: 理解を深めるスクリーンショットと図解
- **Help Integration**: コミュニティサポートのための直接的な Discord アクセス

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**このバージョンでは、リポジトリ全体にわたる強化されたナビゲーションと章ベースの学習構造を導入しています。**

#### Added
- **📚 Chapter-Based Learning System**: コース全体を8つの進行的な学習章に再構成
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: すべてのドキュメントで一貫したナビゲーション ヘッダーとフッターを実装
- **🎯 Progress Tracking**: コース完了チェックリストと学習検証システム
- **🗺️ Learning Path Guidance**: 異なる経験レベルと目標に対する明確なエントリーポイント
- **🔗 Cross-Reference Navigation**: 関連章と前提条件を明確にリンク

#### Enhanced
- **README Structure**: 章ベースの組織で構造化された学習プラットフォームに変換
- **Documentation Navigation**: すべてのページに章のコンテキストと進行案内を追加
- **Template Organization**: 例とテンプレートを適切な学習章にマッピング
- **Resource Integration**: チートシート、FAQ、スタディガイドを関連章に接続
- **Workshop Integration**: ハンズオンラボを複数の章学習目標にマッピング

#### Changed
- **Learning Progression**: 線形ドキュメントから柔軟な章ベース学習に移行
- **Configuration Placement**: 設定ガイドをより良い学習フローのために Chapter 3 に再配置
- **AI Content Integration**: 学習の旅全体で AI 固有のコンテンツをより良く統合
- **Production Content**: 上級パターンを企業向け学習者のために Chapter 8 に集約

#### Improved
- **User Experience**: 明確なナビゲーションのパンくずリストと章の進行インジケーター
- **Accessibility**: コース移動を容易にする一貫したナビゲーション パターン
- **Professional Presentation**: 学術や企業研修に適した大学風のコース構成
- **Learning Efficiency**: 改善された構成により関連コンテンツへの到達時間を短縮

#### Technical Implementation
- **Navigation Headers**: 40+ のドキュメントファイルにわたる標準化された章ナビゲーション
- **Footer Navigation**: 一貫した進行案内と章完了インジケーター
- **Cross-Linking**: 関連概念を結ぶ包括的な内部リンクシステム
- **Chapter Mapping**: テンプレートと例を学習目標に明確に関連付け

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8章システムに合わせて再構成された詳細な学習目標
- **🎯 Chapter-Based Assessment**: 各章に特定の学習目標と実践課題を含む
- **📋 Progress Tracking**: 測定可能な成果と完了チェックリストを含む週間学習スケジュール
- **❓ Assessment Questions**: 各章の知識検証質問とプロフェッショナルな成果
- **🛠️ Practical Exercises**: 実際のデプロイシナリオとトラブルシューティングを伴うハンズオン活動
- **📊 Skill Progression**: 基本概念から企業向けパターンまでの明確なスキル進行とキャリア開発の焦点
- **🎓 Certification Framework**: 専門的な開発成果とコミュニティでの認知システム
- **⏱️ Timeline Management**: マイルストーン検証を含む10週間の構造化された学習計画

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**このバージョンでは、小売向けマルチエージェント ソリューションを改善し、エージェント命名とドキュメントを強化しています。**

#### Changed
- **Multi-Agent Terminology**: 小売マルチエージェント ソリューション全体で "Cora agent" を "Customer agent" に置き換え、より明確に
- **Agent Architecture**: すべてのドキュメント、ARM テンプレート、およびコード例を一貫した "Customer agent" 命名に更新
- **Configuration Examples**: 命名規則を更新したモダンなエージェント構成パターン
- **Documentation Consistency**: すべての参照が専門的で記述的なエージェント名を使用するように保証

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template を Customer agent 参照で更新
- **Architecture Diagrams**: 更新されたエージェント命名で Mermaid 図をリフレッシュ
- **Code Examples**: Python クラスと実装例で CustomerAgent 命名を使用
- **Environment Variables**: すべてのデプロイスクリプトを CUSTOMER_AGENT_NAME の慣例で更新

#### Improved
- **Developer Experience**: ドキュメントにおけるエージェントの役割と責任をより明確化
- **Production Readiness**: エンタープライズの命名規則との整合性を向上
- **Learning Materials**: 教育目的におけるより直感的なエージェント命名
- **Template Usability**: エージェントの機能とデプロイパターンの理解を簡素化

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: AI開発者とエンジニアを優先した完全な再構成
- **Microsoft Foundry Integration Guide**: AZDをMicrosoft Foundryサービスと接続するための包括的なドキュメント
- **AI Model Deployment Patterns**: モデル選定、構成、および本番デプロイ戦略を網羅した詳細ガイド
- **AI Workshop Lab**: AIアプリケーションをAZDでデプロイ可能なソリューションへ変換する2〜3時間のハンズオンワークショップ
- **Production AI Best Practices**: スケーリング、監視、AIワークロードのセキュリティに関するエンタープライズ向けパターン
- **AI-Specific Troubleshooting Guide**: Azure OpenAI、Cognitive Services、およびAIデプロイに関する包括的なトラブルシューティング
- **AI Template Gallery**: 複雑度評価付きのMicrosoft Foundryテンプレートの注目コレクション
- **Workshop Materials**: ハンズオンラボと参照資料を含む完全なワークショップ構成

#### Enhanced
- **README Structure**: Microsoft Foundry Discordの45%のコミュニティ興味データに基づいたAI開発者向け構成
- **Learning Paths**: 学生やDevOpsエンジニア向けの従来のパスと並行する、専用のAI開発者向けジャーニー
- **Template Recommendations**: azure-search-openai-demo、contoso-chat、openai-chat-app-quickstartを含む注目のAIテンプレート
- **Community Integration**: AI専用チャンネルとディスカッションを備えたDiscordコミュニティサポートの強化

#### Security & Production Focus
- **Managed Identity Patterns**: AI固有の認証およびセキュリティ構成
- **Cost Optimization**: トークン使用状況の追跡とAIワークロードの予算管理
- **Multi-Region Deployment**: グローバルなAIアプリケーションデプロイのための戦略
- **Performance Monitoring**: AI固有のメトリクスとApplication Insights統合

#### Documentation Quality
- **Linear Course Structure**: 初級から上級のAIデプロイパターンへの論理的な進行
- **Validated URLs**: すべての外部リポジトリリンクを検証済みでアクセス可能
- **Complete Reference**: すべての内部ドキュメントリンクを検証済みで機能的
- **Production Ready**: 実世界の例を伴うエンタープライズデプロイパターン

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: すべてのドキュメントページに Introduction、Learning Goals、Learning Outcomes セクションを追加
- **Navigation System**: ガイド付き学習進行を提供するために、すべてのドキュメントに前/次レッスンリンクを追加
- **Study Guide**: 学習目標、演習、評価資料を含む包括的な study-guide.md
- **Professional Presentation**: アクセシビリティとプロフェッショナルな外観を向上させるためにすべての絵文字アイコンを削除
- **Enhanced Content Structure**: 学習資料の構成と流れを改善

#### Changed
- **Documentation Format**: 一貫した学習重視の構造で全ドキュメントを標準化
- **Navigation Flow**: すべての学習資料で論理的な進行を実装
- **Content Presentation**: 装飾要素を排し、明確でプロフェッショナルなフォーマットに
- **Link Structure**: 新しいナビゲーションシステムをサポートするために内部リンクを更新

#### Improved
- **Accessibility**: スクリーンリーダー互換性向上のため絵文字依存を削除
- **Professional Appearance**: エンタープライズ学習に適した清潔で学術的な表示
- **Learning Experience**: 各レッスンの明確な目標と成果を伴う構造化アプローチ
- **Content Organization**: 関連トピック間の論理的な流れと接続を改善

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installation and configuration guides for Windows, macOS, and Linux
- **Multiple Skill Levels**: Content designed for students through professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices integrated throughout
- **Cost Optimization**: Guidance for cost-effective deployments and resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common issues
- **Best Practices Integration**: Industry standards and recommendations
- **Version Compatibility**: Up-to-date with latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers with isolated AI services
- **Edge AI Deployment**: Integration with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery and edge caching patterns for AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: ステップごとの移行手順
- **Compatibility Notes**: 破壊的変更に関する詳細
- **Tool Support**: マイグレーションを支援するスクリプトやユーティリティ
- **Community Support**: 移行に関する質問のための専用フォーラム

---

**Navigation**
- **Previous Lesson**: [学習ガイド](resources/study-guide.md)
- **Next Lesson**: [メイン README](README.md) に戻る

**Stay Updated**: このリポジトリをウォッチして、新しいリリースや学習資料に関する重要な更新の通知を受け取ってください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があります。原文（元の言語による文書）を正本としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用に起因するいかなる誤解や誤った解釈についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->