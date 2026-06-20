# 変更履歴 - AZD For Beginners

## はじめに

この変更履歴は、AZD For Beginners リポジトリに対するすべての注目すべき変更、更新、および改善点を記録します。私たちはセマンティックバージョニングの原則に従い、バージョン間で何が変わったかをユーザーが理解できるようこのログを維持しています。

## 学習目標

この変更履歴を確認することで、あなたは次のことができます：
- 新機能やコンテンツの追加情報を把握する
- 既存のドキュメントに対する改善点を理解する
- 正確性を確保するためのバグ修正や訂正を追跡する
- 学習教材の進化を時間を追ってフォローする

## 学習成果

変更履歴エントリを確認した後、あなたは次のことができるようになります：
- 学習に利用できる新しいコンテンツやリソースを特定する
- どのセクションが更新または改善されたかを理解する
- 最新の教材に基づいて学習計画を立てる
- 今後の改善のためにフィードバックや提案を寄せる

## バージョン履歴

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**このバージョンは、azd-coverage 分析で明らかになった残りの中級ギャップを埋めます：独自テンプレートの作成と公開方法、再現可能な dev-container/Codespaces 環境、Pulumi インフラプロバイダー、Azure DevOps の CI/CD ウォークスルー、サービスプリンシパル認証、ホスト選択ガイダンス（AKS/Spring Apps）、`azd restore`/`azd package` の説明、フックのエラー処理、およびチーム/共有環境の実践。**

#### 追加
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — 独自の azd テンプレートの作成：必要な構成（`azure.yaml`, `infra/`, `src/`）、`metadata.template` フィールド、`uniqueString()` リソーストークンと `azd-env-name` タグによるインフラのパラメータ化、`azd init --template <local-path>` でのローカルテスト、GitHub への公開、そして Awesome AZD ギャラリーへの提出
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers と GitHub Codespaces を用いた再現可能な azd 環境：公式の `ghcr.io/azure/azure-dev/azd` フィーチャーを使った最小限の `.devcontainer/devcontainer.json`、言語固有のフィーチャー、コンテナホスト向けの `docker-in-docker`、およびリモートサインインのための `azd auth login --use-device-code`
- **🧩 Pulumi with azd** セクション `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`、Pulumi フォルダ構成、azd 環境にマップされたスタック、必要な出力/タグ付け、および同一の `azd up` / `azd down` ワークフロー
- **🎯 ホスト選択ガイダンス** `docs/chapter-04-infrastructure/provisioning.md` — 初心者向けの `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, `springapp` の比較と、AKS または Azure Spring Apps を選ぶべきタイミングのガイダンス
- **🛠️ Azure DevOps CI/CD ウォークスルー** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`、OIDC によるワークロード アイデンティティ フェデレーションを使ったサービスコネクション、生成される `azure-dev.yml`、および変数グループの設定
- **🔑 サービスプリンシパル（Pattern 4）** を `docs/chapter-03-configuration/authsecurity.md` に追加 — `az ad sp create-for-rbac`、クライアントシークレットとフェデレーテッド/OIDC 資格情報を使った非対話型 `azd auth login`、使うべき状況、および安全な資格情報保存方法
- **🪝 フックのエラー処理** 小節 `docs/chapter-04-infrastructure/deployment-guide.md` — 終了コードと `set -e`、`continueOnError`、`azd hooks run` によるフックの単体テスト、OS 固有のシェル、`--debug`
- **👥 チーム / 共有環境** セクション `docs/chapter-03-configuration/configuration.md` — `.azure/` に何を置くか、何を gitignore すべきか、開発者ごとの環境、`azd env list`/`select`、および CI/CD での環境値の提供方法
- **🧰 `azd restore` と拡張された `azd package`** の説明を `resources/cheat-sheet.md` に追加 — 依存関係の復元とデプロイなしでのデプロイ可能なアーティファクトのビルド

#### 変更
- **🧭 Chapter 4 lessons table** に「独自テンプレートの作成」レッスン（Lesson 3）を追加して更新
- **🧭 Chapter 1 lessons table** に「Dev Containers & Codespaces」レッスン（Lesson 5）を追加して更新；`bring-your-own-app.md` と `dev-containers.md` 間のナビゲーションフッターを接続

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**このバージョンは、完全な初心者向けガイドの最大のギャップを埋めます。2つの実践的なハンズオンレッスン（デプロイ可能なマルチエージェントのウォークスルーと既存アプリへの azd 追加）、初心者向けのフックス入門、azd と Terraform のセクション、ステップバイステップの GitHub Actions パイプラインウォークスルー、新しいプレビュー拡張機能の解説、および明示的なデプロイ検証チェックリストを追加しました。**

#### 追加
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 実践的でデプロイ可能な 2 エージェントのウォークスルー（オーケストレーター + スペシャリスト）を提供（実際のテンプレート `contoso-creative-writer` を使用）、マルチエージェントを使うべき場合、`azd up` ワークフロー、デプロイされたリソースの理解、エージェント間のトレーシング、カスタマイズ、クリーンアップをカバー
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — 既存プロジェクトに azd を追加する方法：`azd init`（"use code in the current directory"）、`azure.yaml` と `infra/` の理解、`azd infra generate`、ホスト検出、`azd up` によるデプロイ
- **🌐 Terraform with azd** セクションを `docs/chapter-04-infrastructure/provisioning.md` に追加 — `infra.provider: terraform` 設定、`.tf` フォルダ構成、必要な `AZURE_*` 出力と `azd-env-name` タグ付け、および同一の `azd up` / `azd down` ワークフロー（Terraform サポートが主張されていたが Bicep のみが示されていたギャップを埋める）
- **⚙️ ステップバイステップの GitHub Actions ウォークスルー** `docs/chapter-08-production/production-ai-practices.md` — GitHub リポジトリから自動デプロイまで：`azd pipeline config`、OIDC フェデレーテッド資格情報（保存されたシークレット不要）、生成される `azure-dev.yml`、およびシークレットと変数のガイダンス
- **🪝 初心者向け「フックは初めて？」導入** `docs/chapter-04-infrastructure/deployment-guide.md` — フックとは何か、フックステージ表、最小限の最初のフック、`azd hooks run` によるフックの手動実行
- **✅ 「デプロイを検証する」チェックリスト** を `docs/chapter-01-foundation/first-project.md` のステップ 5 に追加 — スモークテスト、ヘルスエンドポイントの確認、および明示的な成功基準
- **🧩 新しいプレビュー拡張機能の説明** `azure.ai.skills` と `azure.ai.connections`（それらが何か、いつ使うか）を `docs/chapter-08-production/production-ai-practices.md` に追加

#### 変更
- **🧭 Chapter 5 lessons table** を修正：`multi-agent-basics.md` が現在 Lesson 1（唯一の完全ハンズオンレッスン）であり、Lesson 2 は Chapter 6 にあり、Retail シナリオはワンコマンドのテンプレートではなくアーキテクチャのブループリントであることを正直にラベリング
- **🧭 Chapter 1 lessons table** に「Bring Your Own App」レッスン（Lesson 4）を追加
- **🔗 ナビゲーションフッター** 更新：`first-project.md` は `bring-your-own-app.md` への前方リンクを含むように

#### 修正
- **🧱 「主張されたが欠落していた」Terraform ギャップを解消** — コースが以前 Terraform サポートを参照していたがそれを示していなかった問題を解決
- **🔀 Chapter 5 の誤解を招くクロスリンクを修正** — 完全なマルチエージェント実装が存在するかのように示唆していた箇所を是正（実際はアーキテクチャのブループリントのみ）

#### 更新ファイル
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(新規)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(新規)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**このバージョンは、`azd` `1.25.6`（2026年6月）および `azure.ai.agents` `0.1.40-preview` 拡張に対してコースを再検証し、エージェントの「スキャフォールド」から完全なエージェントライフサイクル（テスト → 評価 → 最適化 → 検査 → 削除）への AI ガイダンスを拡張し、新しい `azure.ai.skills` と `azure.ai.connections` プレビュー拡張を表面化し、".NET Aspire" → "Aspire" の製品リブランドを注記します。**

#### 追加
- **🔁 初心者および AI エンジニア向けのフルエージェントライフサイクルのカバレッジ** をドキュメント全体に追加：
  - `docs/chapter-01-foundation/azd-basics.md` — エクステンションと AI コマンドのセクションにライフサイクル表（scaffold → test → measure → improve → inspect → clean up）を追加
  - `docs/chapter-08-production/production-ai-practices.md` — `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, `delete --force` を扱う「エージェントライフサイクルの管理」セクションを追加
  - `resources/cheat-sheet.md` — `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, `delete --force` を含む AI エージェントコマンドを拡張
- **🧩 新しいプレビュー拡張機能** を文書化：`azure.ai.skills`（再利用可能なエージェントスキル）と `azure.ai.connections`（Foundry 接続）を拡張テーブルとチートシートに追加
- **⏱️ 応答時間ガイダンス** — `azd ai agent invoke` の例に総レイテンシと time-to-first-byte を表示することを注記
- **📌 バージョンバナー** をルート README に追加し、学習者に `azd version` と `azd upgrade` を促す

#### 変更
- **✅ 検証ベースラインを更新**：`azd 1.23.12`（2026年3月）から `azd 1.25.6`（2026年6月）へ、すべてのチャプター README とワークショップドキュメントで更新
- **🤖 Chapter 2 の拡張注記** を `azure.ai.agents` `0.1.18-preview` から `0.1.40-preview` に更新
- **🧪 ワークショップ検証例**（`azd version` 出力）を `1.25.6` に更新
- **🧭 README「What's New in azd Today」** を刷新して、エンドツーエンドのエージェントライフサイクル、新しい AI 拡張機能、および最近の品質向上修正（`azd init` の冪等性、`azd auth login` の古いトークン消去、`azd tool` の初回実行プロンプト）を強調
- **📖 Chapter 2 agents.md (Option 4)** は、`azd up` で止まらず、デプロイ後のライフサイクルコマンドに学習者を案内するように変更

#### 修正
- **🏷️ 製品名称** — Aspire のリブランド注記を追加（".NET Aspire" は単に "Aspire" に）；azd の Aspire サポートには変更なし
- **🔎 ライブリリース検証** — Azure Developer CLI のリリースフィードに対して検証済み：安定 CLI `1.25.6`（2026-06-12）および `azure.ai.agents` `0.1.40-preview`（2026-06-15）

#### 更新ファイル
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**このバージョンは AZD 1.23 の検証スイープを受けた初心者向けドキュメント修正を行っています: AZD を最初に考慮した認証ガイダンスを明確化し、ローカルセットアップ検証スクリプトを追加し、主要コマンドをライブの AZD CLI と照合して検証し、チェンジログ外の最後の廃止された英語ソースのコマンド参照を削除しています。**

#### Added
- **🧪 初心者向けセットアップ検証スクリプト** `validate-setup.ps1` と `validate-setup.sh` を追加し、学習者が第1章を開始する前に必要なツールを確認できるようにしました
- **✅ 事前セットアップ検証ステップ** をルート README と第1章 README に追加し、`azd up` の前に前提条件の欠落を検出できるようにしました

#### Changed
- **🔐 初心者向け認証ガイダンス** を一貫して `azd auth login` を AZD ワークフローの主要経路として扱うようにし、Azure CLI コマンドを直接使用する場合を除き `az login` はオプションとして明示しました
- **📚 第1章のオンボーディングフロー** が、インストール、認証、最初のデプロイ手順の前にローカルセットアップを検証するよう学習者を案内するようになりました
- **🛠️ 検証ツールのメッセージ** が、AZD 専用の初心者パスにおけるブロッキング要件とオプションの Azure CLI 警告を明確に分離するようになりました
- **📖 設定、トラブルシューティング、サンプルドキュメント** が、必要な AZD 認証とオプションの Azure CLI サインインを区別するように更新され、両者が文脈なしに提示されていた箇所を改善しました

#### Fixed
- **📋 残っていた英語ソースのコマンド参照** を現在の AZD 形式に更新しました。チートシートの `azd config show` や、Azure ポータルの概要ガイダンス意図の箇所での `azd monitor --overview` を含みます
- **🧭 第1章の初心者向けの主張** を緩め、すべてのテンプレートや Azure リソースに対してエラーゼロやロールバック保証を過剰に断言しないようにしました
- **🔎 ライブ CLI 検証** により、`azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, および `azd down --force --purge` の現在のサポートを確認しました

#### Files Updated
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

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**このバージョンは `azd` `1.23.12` に対するドキュメント検証スイープを実行し、古くなった AZD コマンド例を更新し、AI モデルガイダンスを現在のデフォルトにリフレッシュし、ワークショップの手順を GitHub Codespaces から dev コンテナやローカルクローンにも対応するように拡張します。**

#### Added
- **✅ コア章とワークショップドキュメント全体への検証メモ** を追加し、新しいまたは古い CLI ビルドを使用する学習者のためにテストされた AZD ベースラインを明示しました
- **⏱️ 長時間実行される AI アプリのデプロイ向けタイムアウトガイダンス** を `azd deploy --timeout 1800` として追加しました
- **🔎 拡張機能検査ステップ** を AI ワークフロードキュメントに `azd extension show azure.ai.agents` で追加しました
- **🌐 ワークショップ環境ガイダンスの拡張** により、GitHub Codespaces、dev コンテナ、MkDocs を使ったローカルクローンを網羅しました

#### Changed
- **📚 章イントロ README** が、基礎、設定、インフラストラクチャ、マルチエージェント、事前デプロイ、トラブルシューティング、本番セクションにわたって `azd 1.23.12` に対する検証を一貫して注記するようになりました
- **🛠️ AZD コマンド参照** をドキュメント全体で現在の形式に更新しました:
  - `azd config list` → `azd config show`
  - `azd env show` → 文脈に応じて `azd env list` または `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights の概要が意図される箇所では `azd monitor --overview`
- **🧪 プロビジョンプレビュー例** を、`azd provision --preview` や `azd provision --preview -e production` といった現在サポートされている使用法に簡素化しました
- **🧭 ワークショップフロー** を更新し、学習者が Codespaces、dev コンテナ、またはローカルクローンのいずれでもラボを完了できるようにしました（Codespaces のみを想定しない）
- **🔐 認証ガイダンス** を、AZD ワークフローに対して `azd auth login` を優先し、Azure CLI コマンドを直接使用する場合にのみ `az login` を位置づけるように変更しました

#### Fixed
- **🪟 Windows インストールコマンド** をインストールガイド内で現在の `winget` パッケージ表記に正規化しました
- **🐧 Linux インストールガイダンス** を、サポートされていないディストリビューション固有の `azd` パッケージマネージャー指示を避け、適切な場合にリリースアセットを参照するように修正しました
- **📦 AI モデル例** を `gpt-35-turbo` や `text-embedding-ada-002` のような古いデフォルトから、`gpt-4.1-mini`, `gpt-4.1`, `text-embedding-3-large` といった現在の例に更新しました
- **📋 デプロイと診断スニペット** をログ、スクリプト、トラブルシューティング手順で現在の環境およびステータスコマンドを使用するように修正しました
- **⚙️ GitHub Actions ガイダンス** を `Azure/setup-azd@v1.0.0` から `Azure/setup-azd@v2` に更新しました
- **🤖 MCP/Copilot 同意ガイダンス** を `azd mcp consent` から `azd copilot consent list` に更新しました

#### Improved
- **🧠 AI 章のガイダンス** を改善し、プレビューに依存する `azd ai` の挙動、テナント固有のログイン、現在の拡張機能使用法、モデルデプロイの推奨をより明確に説明するようにしました
- **🧪 ワークショップ手順** をより現実的なバージョン例と明確な環境セットアップ言語で更新し、ハンズオンラボを改善しました
- **📈 本番運用およびトラブルシューティング文書** を、現在の監視、フォールバックモデル、およびコスト層の例に合わせて整合させました

#### Files Updated
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

#### AZD AI CLI Commands, Content Validation & Template Expansion
**このバージョンは、AI 関連の章全体に `azd ai`, `azd extension`, `azd mcp` コマンドのカバレッジを追加し、agents.md の壊れたリンクと廃止コードを修正し、チートシートを更新し、検証済みの説明と新しい Azure AI AZD テンプレートで Example Templates セクションを大幅に改訂します。**

#### Added
- **🤖 AZD AI CLI カバレッジ** を 7 ファイルに拡張（以前は第8章のみ）:
  - `docs/chapter-01-foundation/azd-basics.md` — `azd extension`, `azd ai agent init`, `azd mcp` を紹介する新しい「Extensions and AI Commands」セクション
  - `docs/chapter-02-ai-development/agents.md` — オプション 4: テンプレート対マニフェストアプローチの比較表を含む `azd ai agent init`
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「AZD Extensions for Foundry」と「Agent-First Deployment」サブセクション
  - `docs/chapter-05-multi-agent/README.md` — クイックスタートがテンプレートベースとマニフェストベースの両方のデプロイパスを表示
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — デプロイセクションに `azd ai agent init` オプションを追加
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — 「診断用の AZD AI 拡張コマンド」サブセクション
  - `resources/cheat-sheet.md` — `azd extension`, `azd ai agent init`, `azd mcp`, `azd infra generate` を含む新しい「AI & Extensions Commands」セクション
- **📦 新しい AZD AI 例テンプレート** を `microsoft-foundry-integration.md` に追加:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly、Semantic Kernel、音声チャット対応の .NET RAG チャット
  - **azure-search-openai-demo-java** — ACA/AKS デプロイオプションを持つ Langchain4J を使用した Java RAG チャット
  - **contoso-creative-writer** — Azure AI Agent Service、Bing Grounding、Prompty を使用したマルチエージェントのクリエイティブライティングアプリ
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB を用いたサーバーレス RAG、Ollama ローカル開発サポート付き
  - **chat-with-your-data-solution-accelerator** — 管理ポータル、Teams 統合、PostgreSQL/Cosmos DB オプションを備えたエンタープライズ向け RAG アクセラレータ
  - **azure-ai-travel-agents** — .NET、Python、Java、TypeScript のサーバーを含むマルチエージェント MCP オーケストレーション参照アプリ
  - **azd-ai-starter** — 最小限の Azure AI インフラ Bicep スターターテンプレート
  - **🔗 Awesome AZD AI Gallery link** — 参照: [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（80以上のテンプレート）

#### Fixed
- **🔗 agents.md のナビゲーション**: 前/次リンクが第2章 README のレッスン順（Microsoft Foundry Integration → Agents → AI Model Deployment）に一致するように修正
- **🔗 agents.md の壊れたリンク**: `production-ai-practices.md` を `../chapter-08-production/production-ai-practices.md` に修正（3箇所）
- **📦 agents.md の廃止コード**: `opencensus` を `azure-monitor-opentelemetry` + OpenTelemetry SDK に置換
- **🐛 agents.md の無効な API**: `max_tokens` を `create_agent()` から `create_run()` の `max_completion_tokens` に移動
- **🔢 agents.md のトークンカウント**: 粗い `len//4` 推定を `tiktoken.encoding_for_model()` に置換
- **azure-search-openai-demo**: サービス記述を "Cognitive Search + App Service" から "Azure AI Search + Azure Container Apps" に修正（デフォルトホストは 2024年10月 に変更）
- **contoso-chat**: 説明を Azure AI Foundry + Prompty を参照するよう更新し、リポジトリの実際のタイトルと技術スタックに一致させました

#### Removed
- **ai-document-processing**: 非機能のテンプレート参照（リポジトリが公開されておらず AZD テンプレートとして利用不可）を削除しました

#### Improved
- **📝 agents.md の演習**: 演習1に期待される出力と `azd monitor` ステップを表示、演習2に完全な `FunctionTool` 登録コードを追加、演習3は曖昧なガイダンスを具体的な `prepdocs.py` コマンドに置換
- **📚 agents.md のリソース**: ドキュメントリンクを最新の Azure AI Agent Service ドキュメントとクイックスタートに更新
- **📋 agents.md の Next Steps テーブル**: 完全な章カバレッジのために AI ワークショップラボへのリンクを追加

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
#### コースナビゲーションの強化
**このバージョンでは、強化された表形式で README.md の章ナビゲーションを改善しています。**

#### 変更点
- **Course Map Table**: 直接のレッスンリンク、所要時間の推定、および複雑さの評価を追加
- **Folder Cleanup**: 重複する古いフォルダー（deployment/, getting-started/, pre-deployment/, troubleshooting/）を削除
- **Link Validation**: Course Map 表内の21件以上の内部リンクをすべて検証済み

### [v3.16.0] - 2026-02-05

#### 製品名の更新
**このバージョンでは、製品参照を現在の Microsoft ブランディングに更新しています。**

#### 変更点
- **Microsoft Foundry → Microsoft Foundry**: 非翻訳ファイル全体の参照を更新
- **Azure AI Agent Service → Foundry Agents**: サービス名を現在のブランディングに合わせて更新

#### 更新されたファイル
- `README.md` - メインコースのランディングページ
- `changelog.md` - バージョン履歴
- `course-outline.md` - コース構成
- `docs/chapter-02-ai-development/agents.md` - AI エージェントガイド
- `examples/README.md` - 例のドキュメント
- `workshop/README.md` - ワークショップのランディングページ
- `workshop/docs/index.md` - ワークショップのインデックス
- `workshop/docs/instructions/*.md` - すべてのワークショップ指示ファイル

---

### [v3.15.0] - 2026-02-05

#### 主要なリポジトリ再構成: 章ベースのフォルダー名
**このバージョンでは、より明確なナビゲーションのためにドキュメントを専用の章フォルダーに再構成しています。**

#### フォルダー名の変更
旧フォルダーは章番号付きフォルダーに置き換えられました:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 追加: `docs/chapter-05-multi-agent/`

#### ファイル移動
| ファイル | 元 | 宛先 |
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
- **📚 章ごとの README ファイル**: 各章フォルダーに README.md を作成しました。内容:
  - 学習目標と所要時間
  - 説明付きのレッスン表
  - クイックスタートコマンド
  - 他の章へのナビゲーション

#### 変更
- **🔗 すべての内部リンクを更新**: ドキュメント全体で78件以上のパスを更新
- **🗺️ メイン README.md**: 新しい章構成でコースマップを更新
- **📝 examples/README.md**: 章フォルダーへの参照を更新

#### 削除
- 古いフォルダー構造 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### リポジトリ再構成: 章ナビゲーション
**このバージョンでは章ナビゲーション README ファイルを追加しました（v3.15.0 で置き換えられました）。**

---

### [v3.13.0] - 2026-02-05

#### 新しい AI エージェントガイド
**このバージョンでは、Azure Developer CLI を使用した AI エージェントのデプロイに関する包括的なガイドを追加しています。**

#### 追加
- **🤖 docs/microsoft-foundry/agents.md**: 次を網羅する完全なガイド:
  - AI エージェントとは何か、チャットボットとどのように異なるか
  - 3つのクイックスタートエージェンステンプレート（Foundry Agents、Prompty、RAG）
  - エージェントのアーキテクチャパターン（シングルエージェント、RAG、マルチエージェント）
  - ツールの構成とカスタマイズ
  - 監視およびメトリクスの追跡
  - コストに関する考慮事項と最適化
  - よくあるトラブルシューティングシナリオ
  - 成功基準を含む3つのハンズオン演習

#### コンテンツ構成
- <strong>イントロダクション</strong>: 初心者向けのエージェント概念
- <strong>クイックスタート</strong>: `azd init --template get-started-with-ai-agents` を使用してエージェントをデプロイ
- <strong>アーキテクチャパターン</strong>: エージェントパターンの図解
- <strong>構成</strong>: ツールセットアップと環境変数
- <strong>監視</strong>: Application Insights 統合
- <strong>演習</strong>: 漸進的なハンズオン学習（各20〜45分）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 環境の更新
**このバージョンでは、AZD 学習体験のために開発コンテナ構成を最新のツールとより良いデフォルトに更新しています。**

#### 変更点
- **🐳 ベースイメージ**: `python:3.12-bullseye` から `python:3.12-bookworm` に更新（最新の Debian 安定版）
- **📛 コンテナ名**: 明確化のため "Python 3" から "AZD for Beginners" に改名

#### 追加
- **🔧 新しい Dev Container 機能**:
  - `azure-cli`（Bicep サポート有効）
  - `node:20`（AZD テンプレート用の LTS バージョン）
  - `github-cli`（テンプレート管理用）
  - `docker-in-docker`（コンテナアプリのデプロイ用）

- **🔌 ポートフォワーディング**: 一般的な開発用に事前設定されたポート:
  - 8000 (MkDocs プレビュー)
  - 3000 (Web アプリ)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新しい VS Code 拡張機能**:
  - `ms-python.vscode-pylance` - 強化された Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions サポート
  - `ms-azuretools.vscode-docker` - Docker サポート
  - `ms-azuretools.vscode-bicep` - Bicep 言語サポート
  - `ms-azure-devtools.azure-resource-groups` - Azure リソース管理
  - `yzhang.markdown-all-in-one` - Markdown 編集
  - `DavidAnson.vscode-markdownlint` - Markdown リント
  - `bierner.markdown-mermaid` - Mermaid 図サポート
  - `redhat.vscode-yaml` - YAML サポート（azure.yaml 用）
  - `eamodio.gitlens` - Git 可視化
  - `mhutchie.git-graph` - Git 履歴

- **⚙️ VS Code 設定**: Python インタプリタ、保存時のフォーマット、空白のトリミングのデフォルト設定を追加

- **📦 requirements-dev.txt の更新**:
  - MkDocs minify プラグインを追加
  - コード品質のための pre-commit を追加
  - Azure SDK パッケージ（azure-identity、azure-mgmt-resource）を追加

#### 修正
- **Post-Create コマンド**: コンテナ開始時に AZD と Azure CLI のインストールを検証するようになりました

---

### [v3.11.0] - 2026-02-05

#### 初心者向け README の全面改訂
**このバージョンでは README.md を大幅に改善し、初心者にアクセスしやすくするとともに AI 開発者向けの重要なリソースを追加しています。**

#### 追加
- **🆚 Azure CLI と AZD の比較**: 各ツールをいつ使うべきかを実例とともに明確に説明
- **🌟 Awesome AZD リンク集**: コミュニティテンプレートギャラリーと貢献リソースへの直接リンク:
  - [Awesome AZD ギャラリー](https://azure.github.io/awesome-azd/) - 200+ のすぐにデプロイ可能なテンプレート
  - [テンプレートを提出する](https://github.com/Azure/awesome-azd/issues) - コミュニティへの貢献
- **🎯 クイックスタートガイド**: 簡略化した3ステップの入門セクション（インストール → ログイン → デプロイ）
- **📊 経験に基づくナビゲーション表**: 開発者の経験に応じてどこから始めるべきかを明確に案内

#### 変更
- **README 構成**: 漸進的開示のために再編成 - 重要情報を先に配置
- <strong>導入セクション</strong>: 完全な初心者向けに「`azd up` の魔法」を説明するために書き直し
- <strong>重複コンテンツの削除</strong>: 重複していたトラブルシューティングセクションを削除
- <strong>トラブルシューティングコマンド</strong>: `azd logs` の参照を有効な `azd monitor --logs` に修正

#### 修正
- **🔐 認証コマンド**: cheat-sheet.md に `azd auth login` と `azd auth logout` を追加
- <strong>無効なコマンド参照</strong>: README のトラブルシューティングセクションから残存していた `azd logs` を削除

#### 注記
- <strong>適用範囲</strong>: 変更はメインの README.md と resources/cheat-sheet.md に適用
- <strong>対象読者</strong>: 変更は AZD に不慣れな開発者を特に想定

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI コマンドの正確性の更新
**このバージョンでは、ドキュメント全体の存在しない AZD コマンドを修正し、すべてのコード例が有効な Azure Developer CLI 構文を使用するようにしています。**

#### 修正
- **🔧 存在しない AZD コマンドを削除**: 無効なコマンドの包括的な監査と修正:
  - `azd logs` (存在しない) → `azd monitor --logs` または Azure CLI の代替に置換
  - `azd service` サブコマンド (存在しない) → `azd show` と Azure CLI に置換
  - `azd infra import/export/validate` (存在しない) → 削除または有効な代替に置換
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` フラグ (存在しない) → 削除
  - `azd provision --what-if/--rollback` フラグ (存在しない) → `--preview` を使用するよう更新
  - `azd config validate` (存在しない) → `azd config list` に置換
  - `azd info`, `azd history`, `azd metrics` (存在しない) → 削除

- **📚 コマンド修正を行ったファイル**:
  - `resources/cheat-sheet.md`: コマンド参照の大幅な見直し
  - `docs/deployment/deployment-guide.md`: ロールバックとデプロイ戦略を修正
  - `docs/troubleshooting/debugging.md`: ログ解析セクションを修正
  - `docs/troubleshooting/common-issues.md`: トラブルシューティングコマンドを更新
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD デバッグセクションを修正
  - `docs/getting-started/azd-basics.md`: 監視コマンドを修正
  - `docs/getting-started/first-project.md`: 監視とデバッグの例を更新
  - `docs/getting-started/installation.md`: ヘルプとバージョン例を修正
  - `docs/pre-deployment/application-insights.md`: ログ表示コマンドを修正
  - `docs/pre-deployment/coordination-patterns.md`: エージェントデバッグコマンドを修正

- **📝 バージョン参照の更新**:
  - `docs/getting-started/installation.md`: ハードコードされた `1.5.0` のバージョンを汎用の `1.x.x` に変更し、リリースへのリンクを追加

#### 変更
- <strong>ロールバック戦略</strong>: AZD にネイティブなロールバック機能がないため、Git ベースのロールバックを使用するよう文書を更新
- <strong>ログ表示</strong>: `azd logs` の参照を `azd monitor --logs`、`azd monitor --live`、および Azure CLI コマンドに置換
- <strong>パフォーマンスセクション</strong>: 存在しない並列/増分デプロイフラグを削除し、有効な代替案を提示

#### 技術的詳細
- **有効な AZD コマンド**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有効な azd monitor フラグ**: `--live`, `--logs`, `--overview`
- <strong>削除された機能</strong>: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 注記
- <strong>検証</strong>: コマンドは Azure Developer CLI v1.23.x に対して検証済み

---

### [v3.9.0] - 2026-02-05

#### ワークショップ完了とドキュメント品質の更新
**このバージョンでは対話型ワークショップモジュールを完成させ、壊れたドキュメントリンクをすべて修正し、Microsoft AZD を使用する AI 開発者向けのコンテンツ品質を向上させています。**

#### 追加
- **📝 CONTRIBUTING.md**: 新しい貢献ガイドラインドキュメント:
  - 問題報告および変更提案のための明確な手順
  - 新規コンテンツのためのドキュメント基準
  - コード例ガイドラインとコミットメッセージの規約
  - コミュニティへの参加情報

#### 完了
- **🎯 Workshop Module 7 (Wrap-up)**: 完全に完了したラップアップモジュール:
  - ワークショップの成果の包括的な要約
  - AZD、テンプレート、および Microsoft Foundry を網羅する修得した主要概念セクション
  - 学習継続のための推奨事項
  - 難易度評価付きのワークショップ課題演習
  - コミュニティのフィードバックおよびサポートリンク

- **📚 Workshop Module 3 (Deconstruct)**: 学習目標を更新:
  - MCP サーバーでの GitHub Copilot 有効化ガイダンス
  - AZD テンプレートのフォルダ構造の理解
  - Infrastructure-as-code (Bicep) の組織パターン
  - ハンズオンラボの手順

- **🔧 Workshop Module 6 (Teardown)**: 完了:
  - リソースのクリーンアップとコスト管理の目的
  - 安全なインフラのデプロビジョニング解除のための `azd down` の使用
  - ソフト削除された Cognitive Services の復旧ガイダンス
  - GitHub Copilot と Azure Portal のための追加探索プロンプト

#### 修正済み
- **🔗 Broken Link Fixes**: 15+ の壊れた内部ドキュメントリンクを解決:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md へのパスを修正
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md と production-ai-practices.md へのパスを修正
  - `docs/getting-started/first-project.md`: 存在しない cicd-integration.md を deployment-guide.md に置き換え
  - `examples/retail-scenario.md`: FAQ とトラブルシューティング ガイドのパスを修正
  - `examples/container-app/microservices/README.md`: コースホームとデプロイガイドのパスを修正
  - `resources/faq.md` と `resources/glossary.md`: AI チャプターの参照を更新
  - `course-outline.md`: 講師用ガイドと AI ワークショップラボの参照を修正

- **📅 Workshop Status Banner**: 「Under Construction」からアクティブなワークショップステータスに更新（2026年2月日付）
- **🔗 Workshop Navigation**: workshop README.md における存在しない lab-1-azd-basics フォルダを指していた壊れたナビゲーションリンクを修正

#### 変更点
- **Workshop Presentation**: 「under construction」警告を削除し、ワークショップは完成して使用可能になりました
- **Navigation Consistency**: すべてのワークショップモジュールが適切なモジュール間ナビゲーションを持つことを保証
- **Learning Path References**: チャプター間のクロスリファレンスを正しい microsoft-foundry パスを使用するよう更新

#### 検証済み
- ✅ すべての英語 Markdown ファイルは内部リンクが有効です
- ✅ ワークショップモジュール 0～7 は学習目標を含めて完了しています
- ✅ チャプターとモジュール間のナビゲーションは正しく機能します
- ✅ コンテンツは Microsoft AZD を使用する AI 開発者に適しています
- ✅ 初心者に優しい言語と構成が全体を通して維持されています
- ✅ CONTRIBUTING.md はコミュニティ貢献者に明確なガイダンスを提供します

#### 技術的実装
- **Link Validation**: 自動 PowerShell スクリプトがすべての .md 内部リンクを検証
- **Content Audit**: ワークショップの完全性と初心者適合性の手動レビュー
- **Navigation System**: 一貫した章およびモジュールナビゲーションパターンを適用

#### 注記
- **Scope**: 変更は英語ドキュメントのみ適用
- **Translations**: このバージョンでは翻訳フォルダは更新されていません（自動翻訳は後で同期されます）
- **Workshop Duration**: 完成したワークショップは現在 3～4 時間のハンズオン学習を提供します

---

### [v3.8.0] - 2025-11-19

#### 高度なドキュメント: モニタリング、セキュリティ、マルチエージェントパターン
**このバージョンは、Application Insights 統合、認証パターン、および本番環境デプロイのためのマルチエージェント調整に関する包括的な A グレードのレッスンを追加します。**

#### 追加
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD に焦点を当てた自動プロビジョニングを伴うデプロイ
  - Application Insights + Log Analytics の完全な Bicep テンプレート
  - カスタムテレメトリを備えた動作する Python アプリケーション（1,200 行以上）
  - AI/LLM モニタリングパターン（Microsoft Foundry Models のトークン／コスト追跡）
  - 6 件の Mermaid 図（アーキテクチャ、分散トレーシング、テレメトリフロー）
  - 3 つのハンズオン演習（アラート、ダッシュボード、AI モニタリング）
  - Kusto クエリ例とコスト最適化戦略
  - ライブメトリクスストリーミングとリアルタイムデバッグ
  - 本番向けパターンを含む 40～50 分の学習時間

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 つの認証パターン（接続文字列、Key Vault、マネージド ID）
  - セキュアなデプロイのための完全な Bicep インフラテンプレート
  - Azure SDK 統合を含む Node.js アプリケーションコード
  - 3 つの完全な演習（マネージド ID の有効化、ユーザー割り当て ID、Key Vault のローテーション）
  - セキュリティのベストプラクティスと RBAC 設定
  - トラブルシューティング ガイドとコスト分析
  - 本番対応のパスワードレス認証パターン

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 つの調整パターン（順次、並列、階層、イベント駆動、コンセンサス）
  - オーケストレーターサービスの完全な実装（Python/Flask、1,500 行以上）
  - 3 つの特殊化されたエージェント実装（Research、Writer、Editor）
  - メッセージキューイングのための Service Bus 統合
  - 分散システムのための Cosmos DB ステート管理
  - エージェント間の相互作用を示す 6 枚の Mermaid 図
  - 3 つの上級演習（タイムアウト処理、リトライロジック、サーキットブレーカー）
  - 最適化戦略付きのコスト内訳（$240-565/月）
  - モニタリングのための Application Insights 統合

#### 強化
- **Pre-deployment Chapter**: プレデプロイメント章は包括的なモニタリングと調整パターンを含むようになりました
- **Getting Started Chapter**: Getting Started 章は専門的な認証パターンで強化
- **Production Readiness**: セキュリティからオブザーバビリティまでの完全なカバレッジ
- **Course Outline**: 第3章と第6章の新しいレッスンを参照するよう更新

#### 変更
- **Learning Progression**: コース全体でのセキュリティとモニタリングのより良い統合
- **Documentation Quality**: 新しいレッスン全体で一貫した A グレード基準（95-97%）
- **Production Patterns**: エンタープライズデプロイ向けのエンドツーエンドの完全なカバレッジ

#### 改善点
- **Developer Experience**: 開発から本番モニタリングへの明確な道筋
- **Security Standards**: 認証とシークレット管理の専門的なパターン
- **Observability**: AZD と完全な Application Insights 統合
- **AI Workloads**: Microsoft Foundry Models とマルチエージェントシステム向けの専門的なモニタリング

#### 検証済み
- ✅ すべてのレッスンには完全に動作するコードが含まれています（スニペットではなく）
- ✅ 視覚学習のための Mermaid 図（3 レッスン合計で 19 図）
- ✅ 検証手順を含むハンズオン演習（合計 9 件）
- ✅ `azd up` でデプロイ可能な本番対応の Bicep テンプレート
- ✅ コスト分析と最適化戦略
- ✅ トラブルシューティングガイドとベストプラクティス
- ✅ 検証コマンドを伴うナレッジチェックポイント

#### ドキュメント評価結果
- **docs/pre-deployment/application-insights.md**: - 包括的なモニタリングガイド
- **docs/getting-started/authsecurity.md**: - プロフェッショナルなセキュリティパターン
- **docs/pre-deployment/coordination-patterns.md**: - 高度なマルチエージェントアーキテクチャ
- **Overall New Content**: - 一貫した高品質基準

#### 技術的実装
- **Application Insights**: Log Analytics + カスタムテレメトリ + 分散トレーシング
- **Authentication**: マネージド ID + Key Vault + RBAC パターン
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + オーケストレーション
- **Monitoring**: ライブメトリクス + Kusto クエリ + アラート + ダッシュボード
- **Cost Management**: サンプリング戦略、保存ポリシー、予算管理

### [v3.7.0] - 2025-11-19

#### ドキュメント品質の改善と新しい Microsoft Foundry Models の例
**このバージョンはリポジトリ全体のドキュメント品質を向上させ、gpt-4.1 チャットインターフェイスを備えた完全な Microsoft Foundry Models デプロイ例を追加します。**

#### 追加
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` に作業する実装を伴う gpt-4.1 デプロイの完全版:
  - Microsoft Foundry Models の完全なインフラストラクチャ（gpt-4.1 モデルのデプロイ）
  - 会話履歴付きの Python コマンドラインチャットインターフェース
  - API キーの安全な保存のための Key Vault 統合
  - トークン使用追跡とコスト推定
  - レート制限とエラーハンドリング
  - 35～45 分のデプロイガイドを含む包括的な README
  - 本番対応の 11 ファイル（Bicep テンプレート、Python アプリ、構成）

- **📚 Documentation Exercises**: 構成ガイドにハンズオン演習を追加:
  - 演習 1: マルチ環境構成（15 分）
  - 演習 2: シークレット管理の練習（10 分）
  - 明確な成功基準と検証手順

- **✅ Deployment Verification**: デプロイガイドに検証セクションを追加:
  - ヘルスチェック手順
  - 成功基準チェックリスト
  - すべてのデプロイコマンドの期待される出力
  - トラブルシューティングのクイックリファレンス

#### 強化
- **examples/README.md**: A グレード品質に更新（93%）:
  - azure-openai-chat をすべての関連セクションに追加
  - ローカル例の数を 3 から 4 に更新
  - AI アプリケーション例の表に追加
  - 中級ユーザー向けクイックスタートに統合
  - Microsoft Foundry Templates セクションに追加
  - 比較マトリクスと技術検索セクションを更新
- **Documentation Quality**: B+ (87%) → A- (92%) に改善（docs フォルダ全体）:
  - 重要なコマンド例に期待される出力を追加
  - 構成変更の検証手順を含めた
  - 実践的な演習でハンズオン学習を強化

#### 変更
- **Learning Progression**: 中級学習者向けの AI 例のより良い統合
- **Documentation Structure**: 明確な成果を持つより実践的な演習
- **Verification Process**: 主要なワークフローに明確な成功基準を追加

#### 改善点
- **Developer Experience**: Microsoft Foundry Models のデプロイは現在 35～45 分（複雑な代替案は 60～90 分）
- **Cost Transparency**: Microsoft Foundry Models 例の明確なコスト見積もり（$50-200/月）
- **Learning Path**: AI 開発者は azure-openai-chat による明確な入口を持つ
- **Documentation Standards**: 一貫した期待出力と検証手順

#### 検証済み
- ✅ Microsoft Foundry Models の例は `azd up` で完全に動作
- ✅ すべての 11 の実装ファイルは構文的に正しい
- ✅ README の手順は実際のデプロイ体験と一致
- ✅ ドキュメントリンクが 8 箇所以上で更新済み
- ✅ 例のインデックスは 4 つのローカル例を正確に反映
- ✅ 表内に重複する外部リンクはありません
- ✅ すべてのナビゲーション参照が正しい

#### 技術的実装
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps パターン
- **Security**: マネージド ID 対応、シークレットは Key Vault に保存
- **Monitoring**: Application Insights 統合
- **Cost Management**: トークン追跡と使用最適化
- **Deployment**: 完全なセットアップのための単一 `azd up` コマンド

### [v3.6.0] - 2025-11-19

#### 大規模アップデート: コンテナアプリのデプロイ例
**このバージョンは Azure Developer CLI (AZD) を使用した包括的で本番対応のコンテナアプリケーションデプロイ例を導入し、完全なドキュメントと学習パスへの統合を行います。**

#### 追加
- **🚀 Container App Examples**: `examples/container-app/` に新しいローカル例:
  - [マスターガイド](examples/container-app/README.md): コンテナ化されたデプロイの完全な概要、クイックスタート、本番運用、および高度なパターン
  - [シンプル Flask API](../../examples/container-app/simple-flask-api): スケールトゥゼロ、ヘルスプローブ、モニタリング、およびトラブルシューティングを備えた初心者向け REST API
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices): 本番対応のマルチサービスデプロイ（API Gateway、Product、Order、User、Notification）、非同期メッセージング、Service Bus、Cosmos DB、Azure SQL、分散トレーシング、ブルーグリーン/カナリアデプロイ
- **Best Practices**: コンテナ化ワークロードに関するセキュリティ、モニタリング、コスト最適化、および CI/CD ガイダンス
- **Code Samples**: 完全な `azure.yaml`、Bicep テンプレート、およびマルチ言語サービス実装（Python、Node.js、C#、Go）
- **Testing & Troubleshooting**: エンドツーエンドのテストシナリオ、モニタリングコマンド、トラブルシューティングガイダンス

#### 変更
- **README.md**: "Local Examples - Container Applications" の下で新しいコンテナアプリ例をフィーチャーしリンクを更新
- **examples/README.md**: コンテナアプリ例を強調し、比較マトリクスのエントリを追加し、技術/アーキテクチャ参照を更新
- **Course Outline & Study Guide**: 関連章で新しいコンテナアプリ例とデプロイパターンを参照するよう更新

#### 検証済み
- ✅ すべての新しい例は `azd up` でデプロイ可能でベストプラクティスに従う
- ✅ ドキュメントのクロスリンクとナビゲーションを更新済み
- ✅ 例は初心者から上級までのシナリオをカバーし、本番マイクロサービスを含む

#### 注記
- **Scope**: 英語のドキュメントと例のみ
- **Next Steps**: 今後のリリースで追加の高度なコンテナパターンと CI/CD 自動化を拡張予定

### [v3.5.0] - 2025-11-19

#### 製品リブランディング: Microsoft Foundry
**このバージョンは Microsoft の公式リブランディングを反映して、英語ドキュメント全体で製品名を "Microsoft Foundry" から "Microsoft Foundry" に包括的に変更します。**

#### 変更
- **🔄 Product Name Update**: "Microsoft Foundry" から "Microsoft Foundry" への完全なリブランディング
  - 英語ドキュメントの `docs/` フォルダ内のすべての参照を更新
  - フォルダ名変更: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ファイル名を変更しました: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 合計: 7つのドキュメントファイルにまたがり23件のコンテンツ参照を更新

- **📁 フォルダ構成の変更**:
  - `docs/ai-foundry/` を `docs/microsoft-foundry/` にリネーム
  - 新しいフォルダ構成を反映するようにすべてのクロスリファレンスを更新
  - ドキュメント全体のナビゲーションリンクを検証済み

- **📄 ファイル名の変更**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - すべての内部リンクを新しいファイル名に更新

#### 更新されたファイル
- <strong>チャプタードキュメント</strong> (7ファイル):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ナビゲーションリンクを3件更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 製品名参照を4件更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 既に Microsoft Foundry を使用（以前の更新による）
  - `docs/microsoft-foundry/production-ai-practices.md` - 参照を3件更新（概要、コミュニティフィードバック、ドキュメント）
  - `docs/getting-started/azd-basics.md` - クロスリファレンスリンクを4件更新
  - `docs/getting-started/first-project.md` - チャプターナビゲーションリンクを2件更新
  - `docs/getting-started/installation.md` - 次の章へのリンクを2件更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 参照を3件更新（ナビゲーション、Discordコミュニティ）
  - `docs/troubleshooting/common-issues.md` - ナビゲーションリンクを1件更新
  - `docs/troubleshooting/debugging.md` - ナビゲーションリンクを1件更新

- <strong>コース構成ファイル</strong> (2ファイル):
  - `README.md` - 参照を17件更新（コース概要、章タイトル、テンプレートセクション、コミュニティインサイト）
  - `course-outline.md` - 参照を14件更新（概要、学習目標、章リソース）

#### 検証済み
- ✅ 英語ドキュメントに "ai-foundry" フォルダパスの参照は残っていません
- ✅ 英語ドキュメントに "Microsoft Foundry" 製品名の参照は残っていません
- ✅ 新しいフォルダ構成で全てのナビゲーションリンクが機能することを確認済み
- ✅ ファイルとフォルダのリネームが正常に完了
- ✅ 章間のクロスリファレンスを検証済み

#### 注意事項
- <strong>適用範囲</strong>: 変更は `docs/` フォルダ内の英語ドキュメントにのみ適用
- <strong>翻訳</strong>: `translations/` フォルダはこのバージョンでは更新されていません
- <strong>ワークショップ</strong>: `workshop/` の教材はこのバージョンでは更新されていません
- <strong>例示</strong>: サンプルファイルはレガシー名称を参照している場合があり（将来の更新で対処予定）
- <strong>外部リンク</strong>: 外部URLおよびGitHubリポジトリ参照は変更なし

#### コントリビューター向け移行ガイド
もしローカルブランチやドキュメントで旧構成を参照している場合:
1. フォルダ参照を更新してください: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ファイル参照を更新してください: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 製品名を置換してください: "Microsoft Foundry" → "Microsoft Foundry"
4. すべての内部ドキュメントリンクが正しく機能することを検証してください

---

### [v3.4.0] - 2025-10-24

#### インフラプレビューと検証の強化
**このバージョンでは新しい Azure Developer CLI プレビュー機能の包括的サポートを導入し、ワークショップのユーザー体験を向上させます。**

#### 追加
- **🧪 azd provision --preview 機能ドキュメント**: 新しいインフラプレビュー機能の包括的な解説
  - コマンドリファレンスとチートシート内の使用例
  - プロビジョニングガイドへの統合（ユースケースと利点の説明）
  - より安全なデプロイ検証のための事前チェック統合
  - セーフティファーストなデプロイ手順を含む入門ガイドの更新
- **🚧 ワークショップステータスバナー**: ワークショップの開発状況を示すプロフェッショナルなHTMLバナー
  - 明確な通知のためのグラデーションデザインと工事表示
  - 透明性のための最終更新タイムスタンプ
  - すべてのデバイスに対応するモバイルレスポンシブデザイン

#### 強化
- <strong>インフラの安全性</strong>: プレビュー機能をデプロイ関連ドキュメント全体に統合
- <strong>事前検証</strong>: 自動化スクリプトにインフラプレビューテストを追加
- <strong>開発者ワークフロー</strong>: ベストプラクティスとしてプレビューを含むコマンドシーケンスを更新
- <strong>ワークショップ体験</strong>: コンテンツ開発状況に関する明確な期待値を設定

#### 変更
- <strong>デプロイベストプラクティス</strong>: プレビュー優先のワークフローを推奨アプローチに変更
- <strong>ドキュメントの流れ</strong>: インフラ検証を学習プロセスの早期に移動
- <strong>ワークショップの提示</strong>: 開発タイムラインを明示するプロフェッショナルなステータス表示

#### 改善
- <strong>安全優先アプローチ</strong>: インフラ変更をデプロイ前に検証可能に
- <strong>チーム協働</strong>: プレビュー結果を共有してレビューや承認が可能
- <strong>コスト意識</strong>: プロビジョニング前にリソースコストをより明確に把握
- <strong>リスク軽減</strong>: 事前検証によるデプロイ失敗の低減

#### 技術的実装
- <strong>マルチドキュメント統合</strong>: プレビュー機能を4つの主要ファイルにまたがって文書化
- <strong>コマンドパターン</strong>: ドキュメント全体で一貫した構文と例を提供
- <strong>ベストプラクティス統合</strong>: 検証ワークフローとスクリプトにプレビューを組み込み
- <strong>視覚的指標</strong>: 新機能を明確に示すマークアップの追加

#### ワークショップインフラ
- <strong>ステータスの伝達</strong>: グラデーションスタイルのプロフェッショナルなHTMLバナー
- <strong>ユーザー体験</strong>: 開発状況の明示により混乱を防止
- <strong>プロフェッショナルな提示</strong>: リポジトリの信頼性を維持しつつ期待値を設定
- <strong>タイムラインの透明性</strong>: 2025年10月の最終更新タイムスタンプで説明責任を担保

### [v3.3.0] - 2025-09-24

#### ワークショップ教材とインタラクティブラーニング体験の強化
**このバージョンではブラウザベースのインタラクティブガイドと構造化された学習パスを備えた包括的なワークショップ教材を導入します。**

#### 追加
- **🎥 インタラクティブワークショップガイド**: MkDocs プレビュー機能を活用したブラウザベースのワークショップ体験
- **📝 構造化されたワークショップ手順**: 発見からカスタマイズまでの7ステップのガイド学習パス
  - 0-Introduction: ワークショップの概要とセットアップ
  - 1-Select-AI-Template: テンプレートの発見と選択プロセス
  - 2-Validate-AI-Template: デプロイと検証手順
  - 3-Deconstruct-AI-Template: テンプレートアーキテクチャの理解
  - 4-Configure-AI-Template: 設定とカスタマイズ
  - 5-Customize-AI-Template: 高度な修正と反復
  - 6-Teardown-Infrastructure: クリーンアップとリソース管理
  - 7-Wrap-up: 要約と次のステップ
- **🛠️ ワークショップツーリング**: Material テーマを使用した MkDocs の設定で学習体験を強化
- **🎯 ハンズオン学習パス**: 3ステップのメソッド論（Discovery → Deployment → Customization）
- **📱 GitHub Codespaces 統合**: シームレスな開発環境セットアップ

#### 強化
- **AIワークショップラボ**: 2〜3時間の構造化された学習体験に拡張
- <strong>ワークショップドキュメント</strong>: ナビゲーションと視覚資料を備えたプロフェッショナルな提示
- <strong>学習の進行</strong>: テンプレート選択から本番デプロイまでの明確な手順
- <strong>開発者体験</strong>: 開発ワークフローを合理化する統合ツール

#### 改善
- <strong>アクセシビリティ</strong>: 検索、コピー機能、テーマ切替を備えたブラウザベースのインターフェース
- <strong>自己学習の柔軟性</strong>: 学習速度に応じたワークショップ構成
- <strong>実践的適用</strong>: 実際のAIテンプレートデプロイシナリオ
- <strong>コミュニティ統合</strong>: ワークショップサポートと協働のための Discord 統合

#### ワークショップ機能
- <strong>組み込み検索</strong>: キーワードとレッスンの迅速な検索
- <strong>コードブロックのコピー</strong>: コード例すべてにホバーでコピー機能
- <strong>テーマ切替</strong>: ダーク/ライトモード対応
- <strong>視覚資産</strong>: 理解を助けるスクリーンショットと図
- <strong>ヘルプ統合</strong>: コミュニティサポートのための直接Discordアクセス

### [v3.2.0] - 2025-09-17

#### 大規模なナビゲーション再構築と章ベースの学習システム
**このバージョンでは、リポジトリ全体を通じた強化されたナビゲーションと章ベースの包括的な学習構造を導入します。**

#### 追加
- **📚 章ベースの学習システム**: コース全体を8つの進行的な学習章に再構成
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 分)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 時間)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 分)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 時間)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 時間)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 時間)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 時間)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 時間)
- **📚 包括的なナビゲーションシステム**: ドキュメント全体で一貫したナビゲーションヘッダーとフッターを導入
- **🎯 進捗トラッキング**: コース完了チェックリストと学習確認システム
- **🗺️ 学習パスガイダンス**: 異なる経験レベルと目標に対する明確なエントリポイント
- **🔗 クロスリファレンスナビゲーション**: 関連章と前提条件を明確にリンク

#### 強化
- **README 構造**: 章ベースの組織で構造化された学習プラットフォームに変換
- <strong>ドキュメントナビゲーション</strong>: すべてのページに章のコンテキストと進行ガイダンスを追加
- <strong>テンプレートの整理</strong>: 例とテンプレートを適切な学習章にマッピング
- <strong>リソース統合</strong>: チートシート、FAQ、学習ガイドを関連章に接続
- <strong>ワークショップ統合</strong>: ハンズオンラボを複数章の学習目標にマップ

#### 変更
- <strong>学習の進行</strong>: 線形ドキュメントから柔軟な章ベース学習へ移行
- <strong>設定ガイドの配置</strong>: 設定ガイドを第3章に再配置して学習フローを改善
- **AIコンテンツの統合**: 学習の旅全体にわたってAI固有コンテンツをより良く統合
- <strong>本番向けコンテンツ</strong>: 企業向けの高度なパターンを第8章に集約

#### 改善
- <strong>ユーザー体験</strong>: 明確なナビゲーションクラウムブリードと章進行インジケーター
- <strong>アクセシビリティ</strong>: コースの移動が容易になる一貫したナビゲーションパターン
- <strong>プロフェッショナルな提示</strong>: 学術・企業研修に適した大学風のコース構成
- <strong>学習効率</strong>: 改善された構成により関連コンテンツの検索時間を削減

#### 技術的実装
- <strong>ナビゲーションヘッダー</strong>: 40+ のドキュメントファイルで章ナビゲーションを標準化
- <strong>フッターナビゲーション</strong>: 一貫した進行ガイダンスと章完了の指標
- <strong>クロスリンク</strong>: 関連概念を結ぶ包括的な内部リンクシステム
- <strong>章のマッピング</strong>: テンプレートと例を学習目標に明確に紐付け

#### スタディガイドの強化
- **📚 包括的な学習目標**: 8章システムに合わせてスタディガイドを再構成
- **🎯 章ベースの評価**: 各章に特定の学習目標と実践演習を含む
- **📋 進捗トラッキング**: 測定可能な成果と完了チェックリストを含む週次学習スケジュール
- **❓ 評価問題**: 各章の知識検証問題と実務的な成果
- **🛠️ 実践演習**: 実際のデプロイシナリオとトラブルシューティングを伴うハンズオン課題
- **📊 スキルの進行**: 基本概念から企業向けパターンまでの明確な成長軸とキャリア開発支援
- **🎓 認定フレームワーク**: プロフェッショナル開発成果とコミュニティの認知制度
- **⏱️ タイムライン管理**: マイルストーン検証を含む構造化された10週間学習計画

### [v3.1.0] - 2025-09-17

#### マルチエージェントAIソリューションの強化
**このバージョンはマルチエージェント小売ソリューションを改善し、エージェント命名とドキュメントを強化します。**

#### 変更
- <strong>マルチエージェント用語</strong>: "Cora agent" を "Customer agent" に置換して理解しやすく
- <strong>エージェントアーキテクチャ</strong>: retail-multi-agent ソリューションの全ドキュメント、ARM テンプレート、コード例を一貫して "Customer agent" 命名を使用するよう更新
- <strong>設定例</strong>: エージェント設定パターンを更新された命名規則でモダン化
- <strong>ドキュメントの一貫性</strong>: すべての参照がプロフェッショナルで記述的なエージェント名を使用するよう整備

#### 強化
- **ARM テンプレートパッケージ**: retail-multiagent-arm-template を Customer agent 参照で更新
- <strong>アーキテクチャ図</strong>: 更新されたエージェント命名で Mermaid 図をリフレッシュ
- <strong>コード例</strong>: Python クラスと実装例を CustomerAgent 命名に更新
- <strong>環境変数</strong>: すべてのデプロイスクリプトで CUSTOMER_AGENT_NAME 慣例を使用するよう更新

#### 改善
- <strong>開発者体験</strong>: ドキュメントでのエージェント役割と責任がより明確に
- <strong>本番準備</strong>: 企業命名規約との整合性が向上
- <strong>学習教材</strong>: 教育目的でより直感的なエージェント命名
- <strong>テンプレートの使いやすさ</strong>: エージェント機能とデプロイパターンの理解が簡素化

#### 技術的詳細
- Mermaid アーキテクチャ図を CustomerAgent 参照で更新
- CoraAgent クラス名を CustomerAgent に置換した Python 例を更新
- ARM テンプレート JSON 構成を "customer" エージェントタイプに変更
- 環境変数を CORA_AGENT_* から CUSTOMER_AGENT_* パターンに更新
- すべてのデプロイコマンドとコンテナ構成をリフレッシュ

### [v3.0.0] - 2025-09-12

#### 大きな変更 - AI開発者フォーカスと Microsoft Foundry 統合
**このバージョンはリポジトリを包括的なAI重視の学習リソースに変革し、Microsoft Foundry 統合を追加します。**

#### 追加
- **🤖 AIファースト学習パス**: AI開発者とエンジニアを優先した完全な再構成
- **Microsoft Foundry 統合ガイド**: AZD と Microsoft Foundry サービスの接続に関する包括的なドキュメント
- **AIモデルデプロイメントパターン**: モデル選定、設定、プロダクションデプロイ戦略を網羅した詳細ガイド
- **AI Workshop Lab**: AZDへデプロイ可能なソリューションにAIアプリケーションを変換するための2〜3時間の実践ワークショップ
- **Production AI Best Practices**: スケーリング、監視、保護のためのエンタープライズ対応パターン
- **AI-Specific Troubleshooting Guide**: Microsoft Foundryモデル、Cognitive Services、およびAIデプロイの問題に関する包括的なトラブルシューティング
- **AI Template Gallery**: 複雑さの評価付きMicrosoft Foundryテンプレートの注目コレクション
- **Workshop Materials**: 実践ラボと参考資料を備えた完全なワークショップ構成

#### 拡張
- **README Structure**: Microsoft Foundry Discordのコミュニティ関心データ45%を反映したAI開発者向け
- **Learning Paths**: 学生やDevOpsエンジニア向けの従来パスに並ぶ専用のAI開発者向けジャーニー
- **Template Recommendations**: azure-search-openai-demo、contoso-chat、openai-chat-app-quickstartを含む注目のAIテンプレート
- **Community Integration**: AI専用チャンネルとディスカッションを備えたDiscordコミュニティサポートの強化

#### セキュリティと本番重視
- **Managed Identity Patterns**: AI固有の認証およびセキュリティ構成
- **Cost Optimization**: AIワークロードのトークン使用量追跡と予算管理
- **Multi-Region Deployment**: グローバルなAIアプリケーション展開の戦略
- **Performance Monitoring**: AI固有のメトリクスとApplication Insights統合

#### ドキュメント品質
- **Linear Course Structure**: 初級から上級のAIデプロイパターンへの論理的な進行
- **Validated URLs**: すべての外部リポジトリリンクが検証されアクセス可能
- **Complete Reference**: すべての内部ドキュメントリンクが検証され機能する
- **Production Ready**: 実例を伴うエンタープライズ向けデプロイメントパターン

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### 追加
- **Structured Learning Framework**: すべてのドキュメントページに導入、学習目標、学習成果セクションを追加
- **Navigation System**: ガイド付き学習進行のために、すべてのドキュメントに前/次レッスンリンクを追加
- **Study Guide**: 学習目標、演習、評価資料を含む包括的な study-guide.md
- **Professional Presentation**: アクセシビリティとプロフェッショナルな外観の向上のために全ての絵文字アイコンを削除
- **Enhanced Content Structure**: 学習資料の整理と流れを改善

#### 変更点
- **Documentation Format**: 一貫した学習重視の構成で全ドキュメントを標準化
- **Navigation Flow**: すべての学習資料を通じた論理的な進行を実装
- **Content Presentation**: 明確でプロフェッショナルな書式を優先し装飾要素を削除
- **Link Structure**: 新しいナビゲーションシステムをサポートするためにすべての内部リンクを更新

#### 改善点
- **Accessibility**: スクリーンリーダーの互換性向上のため絵文字依存を排除
- **Professional Appearance**: 企業学習に適したクリーンでアカデミックな表示
- **Learning Experience**: 各レッスンに明確な目標と成果を持つ構造化されたアプローチ
- **Content Organization**: 関連トピック間でのより良い論理的な流れと接続

### [v1.0.0] - 2025-09-09

#### 初回リリース - 包括的なAZD学習リポジトリ

#### 追加
- <strong>コアドキュメント構成</strong>
  - 包括的な getting-started ガイドシリーズ
  - 包括的なデプロイとプロビジョニングのドキュメント
  - 詳細なトラブルシューティング資料とデバッグガイド
  - 事前デプロイ検証ツールと手順

- <strong>入門モジュール</strong>
  - AZD 基本: コア概念と用語
  - インストールガイド: プラットフォーム別のセットアップ手順
  - 構成ガイド: 環境設定と認証
  - 最初のプロジェクトチュートリアル: ステップバイステップの実践学習

- <strong>デプロイおよびプロビジョニングモジュール</strong>
  - デプロイガイド: 完全なワークフロードキュメント
  - プロビジョニングガイド: Bicepを使用したInfrastructure as Code
  - 本番デプロイのベストプラクティス
  - マルチサービスアーキテクチャパターン

- <strong>事前デプロイ検証モジュール</strong>
  - 容量計画: Azureリソースの可用性検証
  - SKU選択: サービスタイアに関する包括的ガイダンス
  - 事前チェック: 自動検証スクリプト（PowerShellおよびBash）
  - コスト見積もりと予算計画ツール

- <strong>トラブルシューティングモジュール</strong>
  - 一般的な問題: よく発生する問題とその解決策
  - デバッグガイド: 系統的なトラブルシューティング手法
  - 高度な診断技術とツール
  - パフォーマンス監視と最適化

- <strong>リソースと参考資料</strong>
  - コマンドチートシート: 主要コマンドのクイックリファレンス
  - 用語集: 用語と略語の包括的定義
  - FAQ: よくある質問への詳細な回答
  - 外部リソースリンクとコミュニティ接続

- <strong>例とテンプレート</strong>
  - シンプルなウェブアプリケーションの例
  - 静的サイトデプロイテンプレート
  - コンテナアプリケーションの設定
  - データベース統合パターン
  - マイクロサービスアーキテクチャの例
  - サーバーレス関数の実装

#### 特徴
- **Multi-Platform Support**: Windows、macOS、Linux向けのインストールと設定ガイド
- **Multiple Skill Levels**: 学生からプロ開発者までを対象としたコンテンツ
- **Practical Focus**: 実践的な例と実際のシナリオ
- **Comprehensive Coverage**: 基本概念から高度なエンタープライズパターンまで
- **Security-First Approach**: セキュリティベストプラクティスを随所に統合
- **Cost Optimization**: コスト効率の良いデプロイとリソース管理のガイダンス

#### ドキュメント品質
- **Detailed Code Examples**: 実践的でテスト済みのコードサンプル
- **Step-by-Step Instructions**: 明確で実行可能なガイダンス
- **Comprehensive Error Handling**: 一般的な問題へのトラブルシューティング
- **Best Practices Integration**: 業界標準と推奨事項
- **Version Compatibility**: 最新のAzureサービスとazd機能に対応

## 今後の強化予定

### Version 3.1.0 (計画中)
#### AIプラットフォーム拡張
- **Multi-Model Support**: Hugging Face、Azure Machine Learning、およびカスタムモデル向けの統合パターン
- **AI Agent Frameworks**: LangChain、Semantic Kernel、AutoGenデプロイ向けテンプレート
- **Advanced RAG Patterns**: Azure AI Searchを超えるベクターデータベースオプション（Pinecone、Weaviateなど）
- **AI Observability**: モデル性能、トークン使用量、応答品質の強化監視

#### 開発者体験
- **VS Code Extension**: AZD + Microsoft Foundryの統合開発体験
- **GitHub Copilot Integration**: AI支援によるAZDテンプレート生成
- **Interactive Tutorials**: AIシナリオ向けの自動検証付き実践コーディング演習
- **Video Content**: AIデプロイに焦点を当てた視覚学習者向け補助ビデオチュートリアル

### Version 4.0.0 (計画中)
#### エンタープライズ向けAIパターン
- **Governance Framework**: AIモデルのガバナンス、コンプライアンス、および監査トレイル
- **Multi-Tenant AI**: 顧客ごとに分離されたAIサービスを提供するためのパターン
- **Edge AI Deployment**: Azure IoT Edgeおよびコンテナインスタンスとの統合
- **Hybrid Cloud AI**: AIワークロード向けのマルチクラウドおよびハイブリッドデプロイパターン

#### 先進機能
- **AI Pipeline Automation**: Azure Machine LearningパイプラインとのMLOps統合
- **Advanced Security**: ゼロトラストパターン、プライベートエンドポイント、および高度な脅威保護
- **Performance Optimization**: 高スループットAIアプリ向けの高度なチューニングとスケーリング戦略
- **Global Distribution**: AIアプリケーション向けのコンテンツ配信およびエッジキャッシュパターン

### Version 3.0.0 (Planned) - 現行リリースで置換
#### 提案された追加 - 既に v3.0.0 で実装済み
- ✅ **AIに特化したコンテンツ**: Microsoft Foundryの包括的統合（完了）
- ✅ <strong>インタラクティブチュートリアル</strong>: 実践的なAIワークショップラボ（完了）
- ✅ <strong>高度なセキュリティモジュール</strong>: AI固有のセキュリティパターン（完了）
- ✅ <strong>パフォーマンス最適化</strong>: AIワークロードのチューニング戦略（完了）

### Version 2.1.0 (計画中) - v3.0.0で部分的に実装済み
#### 小規模な強化 - 現在のリリースで一部完了
- ✅ <strong>追加の例</strong>: AIに焦点を当てたデプロイシナリオ（完了）
- ✅ **拡張FAQ**: AI固有の質問とトラブルシューティング（完了）
- **Tool Integration**: IDEおよびエディタの統合ガイドの強化
- ✅ <strong>監視の拡張</strong>: AI固有の監視およびアラートパターン（完了）

#### 今後のリリースに向けて計画中
- **Mobile-Friendly Documentation**: モバイル学習向けのレスポンシブデザイン
- **Offline Access**: ダウンロード可能なドキュメントパッケージ
- **Enhanced IDE Integration**: AZD + AIワークフロー向けのVS Code拡張
- **Community Dashboard**: リアルタイムのコミュニティ指標と貢献トラッキング

## チェンジログへの貢献

### 変更の報告方法
このリポジトリに貢献する際、チェンジログのエントリには次を含めてください:

1. <strong>バージョン番号</strong>: セマンティックバージョニングに従う（major.minor.patch）
2. <strong>日付</strong>: リリースまたは更新日（YYYY-MM-DD形式）
3. <strong>カテゴリ</strong>: Added, Changed, Deprecated, Removed, Fixed, Security
4. <strong>明確な説明</strong>: 何が変更されたかの簡潔な説明
5. <strong>影響評価</strong>: 変更が既存ユーザーに与える影響

### 変更カテゴリ

#### 追加
- 新機能、ドキュメントセクション、または機能
- 新しい例、テンプレート、または学習リソース
- 追加のツール、スクリプト、またはユーティリティ

#### 変更
- 既存の機能またはドキュメントの修正
- 明確さや正確さを向上させる更新
- コンテンツや構成の再構成

#### 廃止予定
- 段階的に廃止されつつある機能やアプローチ
- 削除予定のドキュメントセクション
- より良い代替手段がある方法

#### 削除
- もはや関連性のない機能、ドキュメント、または例
- 古い情報や廃止されたアプローチ
- 冗長または統合されたコンテンツ

#### 修正
- ドキュメントやコードの誤りの修正
- 報告された問題や不具合の解決
- 正確性や機能性の向上

#### セキュリティ
- セキュリティ関連の改善または修正
- セキュリティベストプラクティスの更新
- セキュリティ脆弱性の解決

### セマンティックバージョニングのガイドライン

#### メジャーバージョン (X.0.0)
- ユーザーの対応を必要とする破壊的変更
- コンテンツや構成の大幅な再構成
- 基本的なアプローチや手法を変更する変更

#### マイナーバージョン (X.Y.0)
- 新機能やコンテンツの追加
- 下位互換性を維持する改善
- 追加の例、ツール、またはリソース

#### パッチバージョン (X.Y.Z)
- バグ修正と訂正
- 既存コンテンツの小規模な改善
- 明確化と小さな改善

## コミュニティからのフィードバックと提案

この学習リソースの改善のため、コミュニティからのフィードバックを積極的に歓迎します:

### フィードバックの提供方法
- **GitHub Issues**: 問題を報告したり改善を提案してください（AI固有の問題歓迎）
- **Discord Discussions**: アイデアを共有し Microsoft Foundry コミュニティと交流してください
- **Pull Requests**: コンテンツへの直接的な改善、特にAIテンプレートやガイドへの貢献
- **Microsoft Foundry Discord**: AZD + AIの議論のために #Azure チャンネルに参加してください
- **Community Forums**: より広範なAzure開発者ディスカッションに参加してください

### フィードバックカテゴリ
- **AI Content Accuracy**: AIサービスの統合およびデプロイに関する情報の修正
- **Learning Experience**: AI開発者向け学習フローの改善提案
- **Missing AI Content**: 追加のAIテンプレート、パターン、または例の要望
- **Accessibility**: 多様な学習ニーズへの改善
- **AI Tool Integration**: より良いAI開発ワークフロー統合の提案
- **Production AI Patterns**: エンタープライズ向けAIデプロイパターンの要望

### 対応のコミットメント
- **Issue Response**: 報告された問題に対して48時間以内
- **Feature Requests**: 1週間以内に評価
- **Community Contributions**: 1週間以内にレビュー
- **Security Issues**: 優先度を高くし迅速に対応

## メンテナンススケジュール

### 定期更新
- **Monthly Reviews**: コンテンツの正確性とリンク検証
- **Quarterly Updates**: 主要なコンテンツ追加と改善
- **Semi-Annual Reviews**: 包括的な再構成と強化
- **Annual Releases**: 重要な改善を伴うメジャーバージョンの更新

### 監視と品質保証
- **Automated Testing**: コード例とリンクの定期的な検証
- **Community Feedback Integration**: ユーザー提案の定期的な反映
- **Technology Updates**: 最新のAzureサービスとazdリリースへの整合
- **Accessibility Audits**: 包摂的デザイン原則の定期的なレビュー

## バージョンサポートポリシー

### 現行バージョンサポート
- **Latest Major Version**: 定期的な更新を伴う完全サポート
- **Previous Major Version**: 12ヶ月間のセキュリティ更新と重要な修正
- **Legacy Versions**: コミュニティサポートのみ、公式更新なし

### マイグレーションガイダンス
メジャーバージョンがリリースされた際、以下を提供します:
- **Migration Guides**: ステップバイステップの移行手順
- **Compatibility Notes**: 破壊的変更に関する詳細
- **Tool Support**: 移行を支援するスクリプトやユーティリティ
- **Community Support**: 移行に関する質問の専用フォーラム

---

<strong>ナビゲーション</strong>
- **Previous Lesson**: [学習ガイド](resources/study-guide.md)
- **Next Lesson**: [メイン README](README.md) に戻る

<strong>最新情報を受け取る</strong>: このリポジトリをウォッチして、新しいリリースや学習資料の重要な更新の通知を受け取ってください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->