# 変更履歴 - AZD For Beginners

## はじめに

この変更履歴は、AZD For Beginners リポジトリのすべての重要な変更、更新、および改善を記録しています。セマンティックバージョニングの原則に従い、バージョン間で何が変更されたかをユーザーが理解できるようにこのログを維持しています。

## 学習目標

この変更履歴を確認することで、以下が得られます：
- 新機能やコンテンツ追加についての最新情報を得る
- 既存ドキュメントの改善点を理解する
- バグ修正や訂正を追跡して正確性を確保する
- 学習資料の進化を時系列で追う

## 学習成果

変更履歴のエントリを確認後、以下ができるようになります：
- 利用可能な新しいコンテンツやリソースを特定する
- 更新または改善されたセクションを理解する
- 最新の資料に基づいて学習計画を立てる
- 今後の改善のためにフィードバックや提案を行う

## バージョン履歴

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 リフレッシュ：バージョンの最新化更新
**このバージョンは、`azd` `1.27.1`（2026年7月、最新の安定リリース）および現在のプレビューAIエージェント拡張機能 `azure.ai.agents` `1.0.0-beta.5` に対してコースを再検証し、1.26.0、1.27.0、1.27.1リリース後のすべての「検証済み」バナーを最新化します。**

#### 変更点
- <strong>✅ 検証基準が更新</strong>され、`azd 1.25.6`（2026年6月）から`azd 1.27.1`（2026年7月）へ、ルートREADME、すべての章のREADME、Chapter 1のdev-containerレッスン（バージョン固定例含む）、Chapter 4のカスタムテンプレートレッスン、Chapter 5のマルチエージェントレッスン、ワークショップドキュメントに渡って更新されました
- <strong>🤖 Chapter 2 の基準がリフレッシュ</strong>され、`azd 1.23.12`（2026年3月）から`azd 1.27.1`に、`agents.md`、`ai-model-deployment.md`、`ai-workshop-lab.md`、`microsoft-foundry-integration.md`で更新；検証ノートの日付が2026-07-13に更新
- <strong>🧩 AIエージェント拡張機能がバージョンアップ</strong>され、`azure.ai.agents` `0.1.40-preview`/`0.1.18-preview`から現在の`1.0.0-beta.5`へ、Chapter 2 READMEと`agents.md`で反映
- **🧪 ワークショップ検証例**（`azd version`出力）を`1.27.1`に更新

#### 関連するazdリリースについての注釈（1.26.0 → 1.27.1）
- **1.26.0 (2026-06-24):** Flex ConsumptionのAzure Functions Goサポート、テナント別サブスクリプションフィルターの`azd config sub-filter`、自己完結型拡張バンドル（`azd x pack --bundle`）、および`azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml`でのAzure AI Foundryプロジェクト/エージェントの直接モデリング（Bicep/Terraform不要の初期化）、App Service用コンテナデプロイサポート（`host: appservice` + `language: docker`）、`azd extension`コマンドでの直接`-s/--source`指定、`azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install`の`--no-dependencies`フラグ、カタログ/クォータープロンプトで非推奨モデルのデフォルト除外、複数のバグ修正

#### 更新ファイル
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### 初心者向けギャップフィル #2：テンプレート作成、Dev Containers、Pulumi、Azure DevOps、サービスプリンシパルなど
**このバージョンでは、azdカバレッジ分析で明らかになった残りの中級者向けギャップを埋めています：自分のテンプレートの作成と公開、再現可能なDev Containers/Codespaces環境、Pulumiインフラプロバイダー、Azure DevOps CI/CDのウォークスルー、サービスプリンシパル認証、ホスト選択のガイダンス（AKS/Spring Apps）、`azd restore`/`azd package`の説明、フックエラー処理、チーム/共有環境のプラクティス。**

#### 追加
- **🧱 新しいChapter 4レッスン** `docs/chapter-04-infrastructure/custom-templates.md` — 独自のazdテンプレートの作成方法：必須構造（`azure.yaml`、`infra/`、`src/`）、`metadata.template`フィールド、インフラのパラメータ化（`uniqueString()`リソーストークンと`azd-env-name`タグ）、ローカルで`azd init --template <local-path>`を使ったテスト、GitHubでの公開、Awesome AZDギャラリーへの提出
- **📦 新しいChapter 1レッスン** `docs/chapter-01-foundation/dev-containers.md` — Dev ContainersとGitHub Codespacesを使った再現可能なazd環境：公式`ghcr.io/azure/azure-dev/azd`機能を使った最小限の`.devcontainer/devcontainer.json`、言語固有機能、コンテナホスト用の`docker-in-docker`、リモート署名のための`azd auth login --use-device-code`
- <strong>🧩 azdでのPulumi</strong>セクションを`docs/chapter-04-infrastructure/provisioning.md`に追加 — `infra.provider: pulumi`、Pulumiのフォルダ構成、azd環境にマッピングされたスタック、必要なアウトプット/タグ付け、同一の`azd up` / `azd down`フロー
- <strong>🎯 ホスト選択ガイダンス</strong>を`docs/chapter-04-infrastructure/provisioning.md`に追加 — 初心者に優しい`appservice`、`staticwebapp`、`function`、`containerapp`、`aks`、`springapp`の比較、AKSかAzure Spring Appsを選ぶべき状況の案内
- <strong>🛠️ Azure DevOps CI/CDウォークスルー</strong>を`docs/chapter-08-production/production-ai-practices.md`に追加 — `azd pipeline config --provider azdo`、OIDCを使ったワークロードIDフェデレーションによるサービス接続、生成される`azure-dev.yml`、および変数グループ設定
- <strong>🔑 サービスプリンシパル（パターン4）</strong>を`docs/chapter-03-configuration/authsecurity.md`に追加 — `az ad sp create-for-rbac`、クライアントシークレット対フェデレーテッド/OIDCクレデンシャルによる非対話`azd auth login`、使用タイミング、クレデンシャル安全保管方法
- <strong>🪝 フックエラー処理</strong>のサブセクションを`docs/chapter-04-infrastructure/deployment-guide.md`に追加 — 退出コードと`set -e`、`continueOnError`、`azd hooks run`によるフックの単体テスト、OS固有シェル、`--debug`
- <strong>👥 チーム／共有環境</strong>セクションを`docs/chapter-03-configuration/configuration.md`に追加 — `.azure/`に含まれるもの、gitignore設定、開発者ごとの環境、`azd env list`/`select`、CI/CDでの環境値提供
- **🧰 `azd restore` と拡張された `azd package`**の説明を`resources/cheat-sheet.md`に追加 — 依存関係の復元とデプロイせずにアーティファクトをビルドする方法

#### 変更
- <strong>🧭 Chapter 4のレッスンテーブル</strong>を更新し、新しい「独自テンプレート作成」レッスン（レッスン3）を追加
- <strong>🧭 Chapter 1のレッスンテーブル</strong>を更新し、新しい「Dev Containers & Codespaces」レッスン（レッスン5）を追加；`bring-your-own-app.md`と`dev-containers.md`の間にナビゲーションフッターを接続

### [v3.21.0] - 2026-06-16

#### 初心者向けギャップフィル：ハンズオンのマルチエージェントレッスン、「Bring Your Own App」、Terraform、CI/CDウォークスルー
**このバージョンは、完全初心者ガイドの最大のギャップを埋めるため、2つの新しいハンズオンレッスン（デプロイ可能なマルチエージェントウォークスルーと既存アプリへのazd追加）、初心者向けフック入門、azdでのTerraformセクション、GitHub Actionsパイプラインのステップバイステップウォークスルー、新しいプレビュー拡張機能の解説、明示的なデプロイ検証チェックリストを追加しました。**

#### 追加
- **🤝 新しいChapter 5レッスン** `docs/chapter-05-multi-agent/multi-agent-basics.md` — フルハンズオンでデプロイ可能な2エージェントウォークスルー（オーケストレーター + スペシャリスト）を実際のテンプレート（`contoso-creative-writer`）で解説。マルチエージェントを使うタイミング、`azd up`のワークフロー、デプロイされたリソースの理解、クロスエージェントのトレーシング、カスタマイズ、クリーンアップをカバー
- **📦 新しいChapter 1レッスン** `docs/chapter-01-foundation/bring-your-own-app.md` — 既存プロジェクトに`azd init`でazdを追加する方法（「現在のディレクトリのコードを使用」）、`azure.yaml`と`infra/`の理解、`azd infra generate`、ホスト検出、`azd up`によるデプロイ
- <strong>🌐 azdでのTerraform</strong>セクションを`docs/chapter-04-infrastructure/provisioning.md`に追加 — `infra.provider: terraform`設定、`.tf`フォルダ構成、必要な `AZURE_*`アウトプットと`azd-env-name`タグ付け、同一の`azd up` / `azd down`ワークフロー（Terraformサポートの主張はあったがBicepしか示していなかったギャップを埋める）
- <strong>⚙️ GitHub Actionsのステップバイステップウォークスルー</strong>を`docs/chapter-08-production/production-ai-practices.md`に追加 — リポジトリから自動デプロイまで：`azd pipeline config`、OIDCフェデレーテッドクレデンシャル（秘密情報保存不要）、生成された`azure-dev.yml`、及びシークレットと変数の使い分け
- <strong>🪝 初心者向け「フックを始めよう」紹介</strong>を`docs/chapter-04-infrastructure/deployment-guide.md`に追加 — フックとは何か、フックステージ表、最小限の初フック、`azd hooks run`での手動実行
- <strong>✅ 「デプロイ検証」チェックリスト</strong>を`docs/chapter-01-foundation/first-project.md`のステップ5に追加 — スモークテスト、ヘルスエンドポイントチェック、明示的な成功基準
- **🧩 新しいプレビュー拡張機能**`azure.ai.skills` と `azure.ai.connections` の解説（それらが何か、いつ利用すべきか）を`docs/chapter-08-production/production-ai-practices.md`に追加

#### 変更
- <strong>🧭 Chapter 5のレッスンテーブル</strong>を修正：`multi-agent-basics.md`は現在レッスン1（唯一の完全なハンズオンレッスン）となり、レッスン2はChapter 6に移動、Retailシナリオはアーキテクチャの設計図でありワンコマンドテンプレートではない旨を明示
- <strong>🧭 Chapter 1のレッスンテーブル</strong>に新しい「Bring Your Own App」レッスン（レッスン4）を追加
- <strong>🔗 ナビゲーションフッター</strong>を更新：`first-project.md`から`bring-your-own-app.md`へのリンクを追加

#### 修正
- <strong>🧱 「主張はあるが欠落していた」Terraformギャップ</strong>を閉じる — 以前はTerraformサポートが言及されていたが実例は示されていなかった
- <strong>🔀 誤解を招くChapter 5のクロスリンク</strong>を修正 — 完全なマルチエージェント実装があるかのように誤解させていたが実際は設計図のみだった

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

#### AZD 1.25.6 リフレッシュ、完全なエージェントライフサイクルコマンド & Aspire リブランド

**このバージョンでは、`azd` `1.25.6`（2026年6月）および `azure.ai.agents` `0.1.40-preview` 拡張機能に対するコースの再検証を行い、AIガイダンスを「エージェントのスキャフォールド作成」から完全なエージェントライフサイクル（テスト → 評価 → 最適化 → 検査 → 削除）に拡張し、新しい `azure.ai.skills` と `azure.ai.connections` プレビュー拡張機能を紹介し、また「.NET Aspire」→「Aspire」製品のリブランドについて記載しています。**

#### 追加
- **🔁 ドキュメント全体で初心者とAIエンジニア向けに完全なエージェントライフサイクルのカバレッジを提供：**
  - `docs/chapter-01-foundation/azd-basics.md` — 拡張機能とAIコマンドセクションにライフサイクル表（スキャフォールド → テスト → 測定 → 改善 → 検査 → クリーンアップ）を追加
  - `docs/chapter-08-production/production-ai-practices.md` — `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download`、`delete --force` をカバーした新しい「エージェントライフサイクル管理」セクション
  - `resources/cheat-sheet.md` — `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download`、`delete --force` を拡充したAIエージェントコマンド
- **🧩 ドキュメントに新しいプレビュー拡張機能を追加：再利用可能なエージェントスキルの `azure.ai.skills` と Foundry 接続の `azure.ai.connections` が拡張機能表およびチートシートに追加されました。**
- **⏱️ 応答時間のガイダンス** — `azd ai agent invoke` の例にトータル待ち時間と最初のバイト到着時間を表示する旨を注記
- **📌 ルートREADMEにバージョンバナー** を追加し、学習者に `azd version` と `azd upgrade` を案内

#### 変更
- **✅ バリデーションベースラインの更新** — 全章のREADMEおよびワークショップドキュメントで `azd 1.23.12`（2026年3月）から `azd 1.25.6`（2026年6月）に更新
- **🤖 第2章の拡張機能注記** — `azure.ai.agents` `0.1.18-preview` から `0.1.40-preview` に更新
- **🧪 ワークショップの検証例** (`azd version` の出力) を `1.25.6` に更新
- **🧭 README 「本日のazdの新機能」** を刷新し、エンドツーエンドのエージェントライフサイクル、新しいAI拡張機能、最近の使い勝手の改善（`azd init` の冪等性、`azd auth login` における期限切れトークンのクリア、`azd tool` の初回実行プロンプト）を強調
- **📖 第2章 agents.md（オプション4）** — `azd up` で止まらず、デプロイ後のライフサイクルコマンドへ学習者を案内

#### 修正
- **🏷️ 製品名の表記** — Aspireのリブランド注記を追加（「.NET Aspire」は「Aspire」に変更されました）；azdのAspire対応は変更なし
- **🔎 ライブリリース検証** — Azure Developer CLIのリリースフィードに基づく検証：安定版CLI `1.25.6`（2026-06-12）および `azure.ai.agents` `0.1.40-preview`（2026-06-15）

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

#### 初心者オンボーディングの明確化、セットアップ検証と最終AZDコマンド整理
**このバージョンはAZD 1.23検証の続きとして初心者向けにドキュメントの見直しを実施。AZD優先の認証ガイダンスを明確化し、ローカルセットアップ検証スクリプトを追加、主要コマンドをライブAZD CLIで検証、変更履歴外の古い英語版コマンド記述を除去しています。**

#### 追加
- **🧪 初心者向けセットアップ検証スクリプト** `validate-setup.ps1` と `validate-setup.sh` を追加し、チャプター1開始前に必須ツールの確認が可能に
- **✅ 事前セットアップ検証手順** をルートREADMEおよびチャプター1READMEに追加し、`azd up` 前に不足条件を検出可能に

#### 変更
- **🔐 初心者認証ガイダンス** — `azd auth login` をAZDワークフローの主流ルートとして一貫して扱い、`az login` はAzure CLIコマンドを直接使用する場合のみ任意として案内
- **📚 第1章オンボーディングの流れ** — インストール、認証、最初のデプロイ手順の前にローカルセットアップ検証を行うよう案内
- **🛠️ バリデーターメッセージ** — ブロック要件とオプションのAzure CLI警告を明確に区別し、AZD専用初心者パス用に改善
- **📖 設定、トラブルシューティング、例示ドキュメント** — 必須のAZD認証と任意のAzure CLIサインインを区別して提示

#### 修正
- <strong>📋 残存していた英語版コマンド参照</strong>を現在のAZDフォームに更新、チートシートの `azd config show` やAzureポータル概要案内が意図された `azd monitor --overview` など
- **🧭 第1章の初学者向け表現** — すべてのテンプレートとAzureリソースに対してエラーゼロやロールバック保証など過剰な約束を避けるためにソフト化
- **🔎 ライブCLI検証** — `azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs`、`azd down --force --purge` の現在のサポートを確認

#### 更新ファイル
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

#### AZD 1.23.12検証、ワークショップ環境拡張、AIモデルの刷新
**このバージョンでは、`azd` `1.23.12` に対するドキュメント検証を行い、古くなったAZDコマンド例を更新し、AIモデルガイダンスを最新のデフォルトに刷新、さらにワークショップの指示をGitHub Codespacesから開発用コンテナやローカルクローンにも拡張しています。**

#### 追加
- **✅ コア章とワークショップドキュメントでのバリデーション注記** — 新旧CLIビルド利用者に対してテスト済みのAZDベースラインを明示
- **⏱️ 長時間展開のタイムアウトガイダンス** — `azd deploy --timeout 1800` 使用例
- **🔎 拡張機能検査手順** — AIワークフロードキュメントでの `azd extension show azure.ai.agents` 実行方法
- **🌐 ワークショップ環境のガイダンス拡大** — GitHub Codespaces、開発コンテナ、ローカルクローンでのMkDocs利用についての説明追加

#### 変更
- **📚 各章のイントロREADME** — ファンデーション、構成、インフラ、マルチエージェント、プリデプロイ、トラブルシューティング、生産環境の各セクションで `azd 1.23.12` での検証を一貫して明示
- **🛠️ ドキュメント内のAZDコマンド参照更新**：
  - `azd config list` → `azd config show`
  - `azd env show` → コンテキストに応じて `azd env list` または `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - Application Insights概要案内の場合は `azd monitor` → `azd monitor --overview`
- **🧪 プレビュー展開例の簡略化** — 現在サポートされている `azd provision --preview` や `azd provision --preview -e production` などに修正
- **🧭 ワークショップのフロー変更** — Codespaces限定実行を前提とせず、Codespaces、開発コンテナ、ローカルクローンでラボを完了可能に改訂
- **🔐 認証ガイダンス更新** — AZDワークフローには `azd auth login` を推奨、Azure CLIコマンド直接使用時のみ `az login` をオプションとして案内

#### 修正
- **🪟 Windowsインストールコマンド** — インストールガイド内で現在の `winget` パッケージ表記に統一
- **🐧 Linuxインストールガイダンス** — サポート外のディストリビューション別 `azd` パッケージマネージャー指示を削除、代わりにリリース資産を参照
- **📦 AIモデル例を刷新** — 古いデフォルト `gpt-35-turbo` と `text-embedding-ada-002` から現在例の `gpt-4.1-mini`、`gpt-4.1`、`text-embedding-3-large` へ更新
- **📋 展開と診断スニペット** — ログ、スクリプト、トラブルシューティング手順で現在の環境およびステータスコマンドを使用するよう修正
- **⚙️ GitHub Actionsガイダンス更新** — `Azure/setup-azd@v1.0.0` から `Azure/setup-azd@v2` へ
- **🤖 MCP/Copilot同意ガイダンス変更** — `azd mcp consent` から `azd copilot consent list` へ更新

#### 改善
- **🧠 AI章のガイダンス** — プレビュー対応の `azd ai` 動作、テナント固有のログイン、最新の拡張機能使用法、モデル展開推奨をより良く説明
- **🧪 ワークショップ指示** — より現実的なバージョン例とわかりやすい環境セットアップ表現を使用して実践的ラボに改良
- **📈 本番環境およびトラブルシューティングドキュメント** — 最新の監視、フォールバックモデル、コスト層例により整合性を向上

#### 更新ファイル
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

#### AZD AI CLIコマンド、コンテンツ検証およびテンプレート拡充
**このバージョンは、すべてのAI関連チャプターにわたって `azd ai`、`azd extension`、および `azd mcp` コマンドのカバレッジを追加し、agents.mdの壊れたリンクや非推奨コードを修正し、チートシートを更新し、検証済みの説明および新しいAzure AI AZDテンプレートを用いてサンプルテンプレートセクションを刷新しています。**

#### 追加
- **🤖 AZD AI CLIカバレッジ** — 7ファイルで展開（以前は第8章のみ）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新規「拡張機能とAIコマンド」セクションで `azd extension`、`azd ai agent init`、`azd mcp` を紹介
  - `docs/chapter-02-ai-development/agents.md` — オプション4：`azd ai agent init` とテンプレート対マニフェストアプローチの比較表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 「Foundry向けAZD拡張機能」および「エージェントファーストデプロイ」サブセクション

  - `docs/chapter-05-multi-agent/README.md` — クイックスタートにテンプレートとマニフェストベースの両方のデプロイパスを表示
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deployセクションに`azd ai agent init`オプションを追加
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` —「診断用AZD AI拡張コマンド」サブセクションを追加
  - `resources/cheat-sheet.md` — 新しい「AI & Extensions Commands」セクションに`azd extension`、`azd ai agent init`、`azd mcp`、`azd infra generate`を追加
- **📦 新規AZD AIサンプルテンプレート** が `microsoft-foundry-integration.md` に追加:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly、Semantic Kernel、音声チャット対応の.NET RAGチャット
  - **azure-search-openai-demo-java** — Langchain4Jを使ったJava RAGチャット、ACA/AKSデプロイオプションあり
  - **contoso-creative-writer** — Azure AI Agent Service、Bing Grounding、Promptyを使ったマルチエージェント創作ライティングアプリ
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DBによるサーバーレスRAG、Ollamaローカル開発サポート付き
  - **chat-with-your-data-solution-accelerator** — 管理ポータル、Teams統合、PostgreSQL/Cosmos DBオプション付きエンタープライズRAGアクセラレータ
  - **azure-ai-travel-agents** — .NET、Python、Java、TypeScriptサーバーによるマルチエージェントMCPオーケストレーションリファレンスアプリ
  - **azd-ai-starter** — 最小限のAzure AIインフラBicepスターターテンプレート
  - **🔗 Awesome AZD AIギャラリーリンク** — [awesome-azd AIギャラリー](https://azure.github.io/awesome-azd/?tags=ai)（80以上のテンプレート）への参照

#### 修正
- **🔗 agents.mdナビゲーション**: 前/次リンクが第2章READMEのレッスン順と一致（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.mdのリンク切れ**: `production-ai-practices.md`を`../chapter-08-production/production-ai-practices.md`に修正（3箇所）
- **📦 agents.md廃止コード**: `opencensus`を`azure-monitor-opentelemetry`＋OpenTelemetry SDKに置き換え
- **🐛 agents.md無効API**: `max_tokens`を`create_agent()`から`create_run()`の`max_completion_tokens`に移動
- **🔢 agents.mdトークンカウント**: おおまかな `len//4` 推定値を`tiktoken.encoding_for_model()`に置換
- **azure-search-openai-demo**: サービスを「Cognitive Search + App Service」から「Azure AI Search + Azure Container Apps」に修正（2024年10月にデフォルトホスト変更）
- **contoso-chat**: 説明をAzure AI Foundry + Promptyに更新し、リポジトリの実際のタイトルと技術スタックに一致させた

#### 削除
- **ai-document-processing**: 機能しないテンプレート参照を削除（リポジトリがAZDテンプレートとして公開されていないため）

#### 改善
- **📝 agents.md演習**: 演習1に期待される出力と`azd monitor`手順を追加；演習2に完全な`FunctionTool`登録コードを追加；演習3の曖昧な指示を具体的な`prepdocs.py`コマンドに変更
- **📚 agents.mdリソース**: ドキュメントリンクを最新のAzure AI Agent Serviceドキュメントとクイックスタートに更新
- **📋 agents.md次のステップ表**: AIワークショップラボリンクを追加し章全体をカバー

#### 更新ファイル
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### コースナビゲーションの改善
**このバージョンではREADME.mdの章ナビゲーションを改善された表形式で強化しています。**

#### 変更
- <strong>コースマップの表</strong>: 直接レッスンリンク、所要時間の見積もり、複雑さ評価を追加
- <strong>フォルダーのクリーンアップ</strong>: 冗長な古いフォルダー（deployment/, getting-started/, pre-deployment/, troubleshooting/）を削除
- <strong>リンク検証</strong>: コースマップ表内の21以上の内部リンクすべてを検証済み

### [v3.16.0] - 2026-02-05

#### 製品名の更新
**このバージョンでは製品の言及を最新のMicrosoftブランドに更新しました。**

#### 変更
- **Microsoft Foundry → Microsoft Foundry**: 非翻訳ファイル内のすべての参照を更新
- **Azure AI Agent Service → Foundry Agents**: サービス名を最新ブランドに更新

#### 更新ファイル
- `README.md` - メインコースランディングページ
- `changelog.md` - バージョン履歴
- `course-outline.md` - コース構成
- `docs/chapter-02-ai-development/agents.md` - AIエージェントガイド
- `examples/README.md` - 例のドキュメント
- `workshop/README.md` - ワークショップランディングページ
- `workshop/docs/index.md` - ワークショップインデックス
- `workshop/docs/instructions/*.md` - すべてのワークショップ指示ファイル

---

### [v3.15.0] - 2026-02-05

#### 大規模リポジトリ再構成：章ごとのフォルダー名
**このバージョンでは、ナビゲーションの明確化のために章ごとのフォルダーにドキュメントを再構成しました。**

#### フォルダ名の変更
古いフォルダーは章番号入りフォルダーに置き換えられました：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新規追加: `docs/chapter-05-multi-agent/`

#### ファイルの移動
| ファイル | 元の場所 | 新しい場所 |
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
| pre-deployment内の全ファイル | pre-deployment/ | chapter-06-pre-deployment/ |
| troubleshooting内の全ファイル | troubleshooting/ | chapter-07-troubleshooting/ |

#### 追加
- **📚 章ごとのREADMEファイル**: 各章フォルダーにREADME.mdを作成し以下を含む:
  - 学習目標と所要時間
  - レッスン表と説明
  - クイックスタートコマンド
  - 他の章へのナビゲーション

#### 変更
- **🔗 すべての内部リンクを更新**: 78以上のパスをドキュメント内で更新
- **🗺️ メインREADME.md**: コースマップを新しい章構造に更新
- **📝 examples/README.md**: 章フォルダへのクロスリファレンスを更新

#### 削除
- 古いフォルダー構造（getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### リポジトリ再構成：章ナビゲーション
**このバージョンでは章ナビゲーション用のREADMEファイルを追加しました（v3.15.0で置き換えられました）。**

---

### [v3.13.0] - 2026-02-05

#### 新しいAIエージェントガイド
**このバージョンではAzure Developer CLIを使ったAIエージェントの展開に関する包括的ガイドを追加しました。**

#### 追加
- **🤖 docs/microsoft-foundry/agents.md**: 完全ガイド、以下をカバー:
  - AIエージェントの定義とチャットボットとの違い
  - 3つのクイックスタートエージェントテンプレート（Foundry Agents、Prompty、RAG）
  - エージェントアーキテクチャパターン（シングルエージェント、RAG、マルチエージェント）
  - ツールの設定とカスタマイズ
  - モニタリングとメトリクストラッキング
  - コスト考慮と最適化
  - 一般的なトラブルシューティングシナリオ
  - 3つのハンズオン演習と成功条件

#### コンテンツ構成
- <strong>導入</strong>: 初心者向けのエージェント概念
- <strong>クイックスタート</strong>: `azd init --template get-started-with-ai-agents`でエージェントをデプロイ
- <strong>アーキテクチャパターン</strong>: エージェントパターンの図解
- <strong>設定</strong>: ツールセットアップと環境変数
- <strong>モニタリング</strong>: Application Insights統合
- <strong>演習</strong>: 漸進的なハンズオン学習（各20-45分）

---

### [v3.12.0] - 2026-02-05

#### DevContainer環境の更新
**このバージョンでは、現代的なツールとより良いデフォルト設定で開発コンテナ構成を更新し、AZD学習体験を向上させました。**

#### 変更
- **🐳 ベースイメージ**: `python:3.12-bullseye`から`python:3.12-bookworm`（最新のDebian安定版）に更新
- **📛 コンテナ名**: 「Python 3」から「AZD for Beginners」に変更し分かりやすく

#### 追加
- **🔧 新しいDev Container機能**:
  - Bicepサポートが有効な`azure-cli`
  - AZDテンプレート用のLTS版`node:20`
  - テンプレート管理用`github-cli`
  - コンテナアプリ展開用`docker-in-docker`

- **🔌 ポートフォワーディング**: 一般的な開発用に事前設定されたポート:
  - 8000（MkDocsプレビュー）
  - 3000（ウェブアプリ）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新しいVS Code拡張機能**:
  - `ms-python.vscode-pylance` - 強化されたPythonインテリセンス
  - `ms-azuretools.vscode-azurefunctions` - Azure Functionsサポート
  - `ms-azuretools.vscode-docker` - Dockerサポート
  - `ms-azuretools.vscode-bicep` - Bicep言語サポート
  - `ms-azure-devtools.azure-resource-groups` - Azureリソース管理
  - `yzhang.markdown-all-in-one` - Markdown編集
  - `DavidAnson.vscode-markdownlint` - Markdownリンティング
  - `bierner.markdown-mermaid` - Mermaid図サポート
  - `redhat.vscode-yaml` - YAMLサポート（azure.yaml用）
  - `eamodio.gitlens` - Git視覚化
  - `mhutchie.git-graph` - Git履歴

- **⚙️ VS Code設定**: Pythonインタープリタ、保存時フォーマット、空白トリムのデフォルト設定を追加

- **📦 更新されたrequirements-dev.txt**:
  - MkDocs minifyプラグインを追加
  - コード品質のためのpre-commitを追加
  - Azure SDKパッケージ（azure-identity、azure-mgmt-resource）を追加

#### 修正
- **Post-Createコマンド**: コンテナ起動時にAZDとAzure CLIのインストールを確認するように

---

### [v3.11.0] - 2026-02-05

#### 初心者向けREADMEの大改訂
**このバージョンではREADME.mdを大幅に改善し、初心者にも分かりやすくAI開発者向けの重要なリソースを追加しました。**

#### 追加
- **🆚 Azure CLIとAZDの比較**: どのツールをいつ使うべきか、実例付きで明確に解説
- **🌟 Awesome AZDリンク集**: コミュニティテンプレートギャラリーおよび貢献リソースへの直接リンク:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200以上のデプロイ済テンプレート
  - [テンプレートを投稿する](https://github.com/Azure/awesome-azd/issues) - コミュニティ貢献
- **🎯 クイックスタートガイド**: 簡単な3ステップ（インストール → ログイン → デプロイ）
- **📊 経験ベースのナビゲーション表**: 開発者経験に基づく開始ポイントの明確な案内

#### 変更
- **README構成**: 重要情報を先にそろえた段階的開示形式に再編成
- <strong>導入セクション</strong>: 完全初心者向けに「`azd up`の魔法」を説明するよう書き換え
- <strong>重複コンテンツ削除</strong>: 重複したトラブルシューティングセクションを削除
- <strong>トラブルシューティングコマンド</strong>: `azd logs`参照を正しい`azd monitor --logs`に修正

#### 修正

- **🔐 認証コマンド**: `azd auth login` と `azd auth logout` を cheat-sheet.md に追加
- <strong>無効なコマンド参照</strong>: README のトラブルシューティングセクションから残っていた `azd logs` を削除

#### ノート
- <strong>対象範囲</strong>: 主要な README.md と resources/cheat-sheet.md に変更を適用
- <strong>対象読者</strong>: AZD を初めて使う開発者向けの改善

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI コマンドの正確性更新
**このバージョンではドキュメント全体の存在しない AZD コマンドを修正し、すべてのコード例が有効な Azure Developer CLI 構文を使用するようにしました。**

#### 修正内容
- **🔧 存在しない AZD コマンドの削除**: 無効なコマンドの包括的な監査と修正:
  - `azd logs` (存在しない) → `azd monitor --logs` または Azure CLI の代替に置換
  - `azd service` のサブコマンド (存在しない) → `azd show` と Azure CLI に置換
  - `azd infra import/export/validate` (存在しない) → 削除または有効な代替に置換
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` フラグ (存在しない) → 削除
  - `azd provision --what-if/--rollback` フラグ (存在しない) → `--preview` に更新
  - `azd config validate` (存在しない) → `azd config list` に置換
  - `azd info`, `azd history`, `azd metrics` (存在しない) → 削除

- **📚 コマンド修正が適用されたファイル**:
  - `resources/cheat-sheet.md`: コマンドリファレンスの大幅な見直し
  - `docs/deployment/deployment-guide.md`: ロールバックとデプロイ戦略を修正
  - `docs/troubleshooting/debugging.md`: ログ解析セクションを修正
  - `docs/troubleshooting/common-issues.md`: トラブルシューティングコマンドを更新
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD デバッグセクションを修正
  - `docs/getting-started/azd-basics.md`: モニタリングコマンドを修正
  - `docs/getting-started/first-project.md`: モニタリングとデバッグ例を更新
  - `docs/getting-started/installation.md`: ヘルプとバージョン例を修正
  - `docs/pre-deployment/application-insights.md`: ログ表示コマンドを修正
  - `docs/pre-deployment/coordination-patterns.md`: エージェントデバッグコマンドを修正

- **📝 バージョン参照の更新**: 
  - `docs/getting-started/installation.md`: 固定値 `1.5.0` のバージョンを汎用の `1.x.x` に変更し、リリースへのリンクを追加

#### 変更内容
- <strong>ロールバック戦略</strong>: ドキュメントを Git ベースのロールバックに更新 (AZD ネイティブ機能はなし)
- <strong>ログ表示</strong>: `azd logs` 参照を `azd monitor --logs`、`azd monitor --live`、および Azure CLI コマンドに置換
- <strong>パフォーマンスセクション</strong>: 存在しない並列/インクリメンタルデプロイフラグを削除し、有効な代替を提示

#### 技術的詳細
- **有効な AZD コマンド**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有効な azd monitor フラグ**: `--live`, `--logs`, `--overview`
- <strong>削除された機能</strong>: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### ノート
- <strong>検証</strong>: Azure Developer CLI v1.23.x でコマンドを検証済み

---

### [v3.9.0] - 2026-02-05

#### ワークショップ完了およびドキュメント品質の更新
**このバージョンでは、インタラクティブなワークショップモジュールを完了し、壊れたドキュメントリンクを修正し、Microsoft AZD を使用する AI 開発者向けのコンテンツ品質を向上させました。**

#### 追加
- **📝 CONTRIBUTING.md**: 新しいコントリビューションガイド文書を追加、内容として:
  - 問題報告と変更提案の明確な手順
  - 新規コンテンツのドキュメント基準
  - コード例ガイドラインとコミットメッセージ規約
  - コミュニティ参加情報

#### 完了
- **🎯 ワークショップモジュール7 (まとめ)**: 完全なまとめモジュールを完了し、内容は:
  - ワークショップでの成果の包括的な要約
  - AZD、テンプレート、Microsoft Foundry に関する重要な概念の習得セクション
  - 学習の継続推奨
  - ワークショップチャレンジ演習の難易度評価付き
  - コミュニティのフィードバックとサポートリンク

- **📚 ワークショップモジュール3 (分解)**: 学習目標の更新内容:
  - GitHub Copilot と MCP サーバーのアクティベーションガイダンス
  - AZD テンプレートフォルダー構造の理解
  - インフラストラクチャーコード (Bicep) の組織パターン
  - ハンズオンラボの指示

- **🔧 ワークショップモジュール6 (解体)**: 完了内容:
  - リソースのクリーンアップとコスト管理目標
  - 安全なインフラストラクチャー停止のための `azd down` の使用
  - ソフト削除された認知サービスの回復ガイダンス
  - GitHub Copilot と Azure ポータルの探索用ボーナスプロンプト

#### 修正
- **🔗 壊れたリンクの修正**: 15 以上の内部ドキュメントリンクを修正:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md へのパスを修正
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md と production-ai-practices.md へのパスを修正
  - `docs/getting-started/first-project.md`: 存在しない cicd-integration.md を deployment-guide.md に置換
  - `examples/retail-scenario.md`: FAQ とトラブルシューティングガイドのパスを修正
  - `examples/container-app/microservices/README.md`: コースホームとデプロイガイドのパスを修正
  - `resources/faq.md` と `resources/glossary.md`: AI 章の参照を更新
  - `course-outline.md`: インストラクターガイドと AI ワークショップラボの参照を修正

- **📅 ワークショップステータスバナー**: 「作成中」から 2026年2月のアクティブなワークショップステータスに更新

- **🔗 ワークショップナビゲーション**: 非存在の lab-1-azd-basics フォルダーを指す壊れたワークショップ README.md のナビゲーションリンクを修正

#### 変更
- <strong>ワークショッププレゼンテーション</strong>: 「作成中」警告を削除し、ワークショップは完成して使用準備完了
- <strong>ナビゲーションの一貫性</strong>: すべてのワークショップモジュールに適切なモジュール間ナビゲーションを確保
- <strong>学習パス参照</strong>: 正しい microsoft-foundry パスを使うよう変更

#### 検証済み
- ✅ すべての英語マークダウンファイルに有効な内部リンクあり
- ✅ ワークショップモジュール0～7が学習目標と共に完成
- ✅ 章間およびモジュール間のナビゲーションが正しく機能
- ✅ Microsoft AZD を使用する AI 開発者向けに適したコンテンツ
- ✅ 初心者に優しい言語と構造を全体で維持
- ✅ CONTRIBUTING.md にてコミュニティ貢献者向けに明確なガイダンスを提供

#### 技術的実装
- <strong>リンク検証</strong>: 自動 PowerShell スクリプトで全 .md 内部リンクを検証
- <strong>コンテンツ監査</strong>: ワークショップの完成度と初心者向け適合性を手動でレビュー
- <strong>ナビゲーションシステム</strong>: 一貫した章およびモジュールナビゲーションパターンを適用

#### ノート
- <strong>対象範囲</strong>: 変更は英語ドキュメントのみ
- <strong>翻訳</strong>: このバージョンでは翻訳フォルダーは更新されず（自動翻訳が後で同期予定）
- <strong>ワークショップ期間</strong>: 完成したワークショップは3～4時間のハンズオン学習を提供

---

### [v3.8.0] - 2025-11-19

#### 高度なドキュメント: モニタリング、セキュリティ、およびマルチエージェントパターン
**このバージョンでは、Application Insights 統合、認証パターン、および本番デプロイ向けのマルチエージェント調整に関する包括的な A グレードのレッスンを追加しました。**

#### 追加
- **📊 Application Insights 統合レッスン**: `docs/pre-deployment/application-insights.md` にて:
  - AZD に焦点を当てた自動プロビジョニング付きデプロイ
  - Application Insights + Log Analytics の完全な Bicep テンプレート
  - カスタムテレメトリ付きの動作する Python アプリケーション (1,200 行以上)
  - AI/LLM モニタリングパターン (Microsoft Foundry Models のトークン/コスト追跡)
  - 6 つの Mermaid ダイアグラム (アーキテクチャ、分散トレーシング、テレメトリフロー)
  - 3 つのハンズオン演習 (アラート、ダッシュボード、AI モニタリング)
  - Kusto クエリ例とコスト最適化戦略
  - ライブメトリクスストリーミングとリアルタイムデバッグ
  - 40～50分の学習時間で本番対応パターンを提供

- **🔐 認証およびセキュリティパターンレッスン**: `docs/getting-started/authsecurity.md` にて:
  - 3 つの認証パターン (接続文字列、Key Vault、マネージドアイデンティティ)
  - 安全なデプロイのための完全な Bicep インフラストラクチャーテンプレート
  - Azure SDK 統合付き Node.js アプリケーションコード
  - 3 つの完全な演習 (マネージドアイデンティティの有効化、ユーザー割り当てアイデンティティ、Key Vault ローテーション)
  - セキュリティのベストプラクティスと RBAC 設定
  - トラブルシューティングガイドとコスト分析
  - 本番対応のパスワードレス認証パターン

- **🤖 マルチエージェント調整パターンレッスン**: `docs/pre-deployment/coordination-patterns.md` にて:
  - 5 つの調整パターン (逐次、並列、階層、イベント駆動、コンセンサス)
  - 完全なオーケストレーターサービス実装 (Python/Flask、1,500 行以上)
  - 3 つの専門エージェント実装 (リサーチ、ライター、エディター)
  - メッセージキューイングのための Service Bus 統合
  - 分散システム用の Cosmos DB 状態管理
  - エージェント相互作用を示す 6 つの Mermaid ダイアグラム
  - 3 つの高度な演習 (タイムアウト処理、リトライロジック、サーキットブレーカー)
  - コスト詳細 ($240-565/月) と最適化戦略
  - モニタリングのための Application Insights 統合

#### 強化
- <strong>プレデプロイメント章</strong>: 包括的なモニタリングおよび調整パターンを追加
- <strong>入門章</strong>: プロフェッショナルな認証パターンで強化
- <strong>本番準備</strong>: セキュリティから可観測性までの完全なカバレッジ
- <strong>コース概要</strong>: 第3章と第6章の新レッスンへの参照を更新

#### 変更
- <strong>学習の進行</strong>: セキュリティおよびモニタリングの統合を改善
- <strong>ドキュメント品質</strong>: 新レッスンで一貫した A グレード基準 (95-97%)
- <strong>本番パターン</strong>: エンタープライズデプロイ向けの完全なエンドツーエンドカバレッジ

#### 改善
- <strong>デベロッパーエクスペリエンス</strong>: 開発から本番モニタリングへの明確なパス
- <strong>セキュリティ基準</strong>: 認証およびシークレット管理のプロフェッショナルパターン
- <strong>可観測性</strong>: AZD と統合された完全な Application Insights
- **AI ワークロード**: Microsoft Foundry Models とマルチエージェントシステム用の専門的モニタリング

#### 検証済み
- ✅ すべてのレッスンで完全な動作コードを含む（スニペットではない）
- ✅ 視覚的学習用の Mermaid ダイアグラム19枚 (3レッスン合計)
- ✅ 検証手順付きハンズオン演習9回
- ✅ `azd up` でデプロイ可能な本番対応 Bicep テンプレート
- ✅ コスト分析および最適化戦略
- ✅ トラブルシューティングガイドとベストプラクティス
- ✅ 検証コマンド付き知識チェックポイント

#### ドキュメント評価結果
- **docs/pre-deployment/application-insights.md**: - 包括的なモニタリングガイド
- **docs/getting-started/authsecurity.md**: - プロフェッショナルなセキュリティパターン
- **docs/pre-deployment/coordination-patterns.md**: - 高度なマルチエージェントアーキテクチャ
- <strong>全体の新規コンテンツ</strong>: - 一貫した高品質基準

#### 技術的実装
- **Application Insights**: Log Analytics + カスタムテレメトリ + 分散トレーシング
- <strong>認証</strong>: マネージドアイデンティティ + Key Vault + RBAC パターン
- <strong>マルチエージェント</strong>: Service Bus + Cosmos DB + Container Apps + オーケストレーション
- <strong>モニタリング</strong>: ライブメトリクス + Kusto クエリ + アラート + ダッシュボード
- <strong>コスト管理</strong>: サンプリング戦略、保持ポリシー、予算管理

### [v3.7.0] - 2025-11-19

#### ドキュメント品質の向上と新 Microsoft Foundry Models 例の追加
**このバージョンではリポジトリ全体のドキュメント品質を向上させ、gpt-4.1 チャットインターフェースを備えた Microsoft Foundry Models の完全な展開例を追加しました。**

#### 追加
- **🤖 Microsoft Foundry Models チャット例**: `examples/azure-openai-chat/` における gpt-4.1 の完全展開と動作実装:
  - Microsoft Foundry Models の完全なインフラストラクチャー (gpt-4.1 モデル展開)
  - 会話履歴付きの Python コマンドラインチャットインターフェース
  - セキュアな API キー保管のための Key Vault 統合
  - トークン使用量追跡とコスト推定
  - レート制限およびエラー処理
  - 35～45分のデプロイガイドを含む包括的な README
  - 11個の本番対応ファイル (Bicep テンプレート、Python アプリ、設定)
- **📚 ドキュメント演習**: 設定ガイドに対するハンズオン演習を追加:
  - 演習1: マルチ環境設定 (15分)
  - 演習2: シークレット管理の練習 (10分)
  - 明確な成功基準と検証手順
- **✅ デプロイ検証**: デプロイガイドに検証セクションを追加:
  - ヘルスチェック手順
  - 成功基準チェックリスト
  - すべてのデプロイコマンドの期待される出力
  - トラブルシューティングクイックリファレンス

#### 強化
- **examples/README.md**: A グレード品質に更新 (93%):
  - azure-openai-chat をすべての関連セクションに追加
  - ローカルの例の数を3から4に更新
  - AI アプリケーション例の表に追加
  - 中級者向けクイックスタートに統合
  - Microsoft Foundry テンプレートセクションに追加
  - 比較マトリクスと技術探索セクションを更新
- <strong>ドキュメント品質</strong>: docs フォルダー全体で B+ (87%) から A- (92%) に向上

  - 重要なコマンド例に期待される出力を追加
  - 設定変更の検証手順を含める
  - 実践的な演習によるハンズオン学習を強化

#### 変更点
- <strong>学習の進行</strong>: 中級学習者向けAI例の統合を改善
- <strong>ドキュメント構成</strong>: 明確な成果のある実践演習を増強
- <strong>検証プロセス</strong>: 主要なワークフローに明確な成功基準を追加

#### 改善点
- <strong>開発者体験</strong>: Microsoft Foundry Modelsの展開時間が35〜45分に短縮（従来の複雑な方法は60〜90分）
- <strong>コストの透明性</strong>: Microsoft Foundry Models例の月額コスト見積もり（$50〜200）が明示
- <strong>学習パス</strong>: AI開発者向けにazure-openai-chatを明確なエントリーポイントとして設定
- <strong>ドキュメント標準</strong>: 期待される出力と検証手順の一貫性を確保

#### 検証済み
- ✅ Microsoft Foundry Models例が `azd up` で完全に動作証明済み
- ✅ 全11ファイルの構文が正しいことを確認済み
- ✅ READMEの指示が実際の展開体験と一致
- ✅ 8カ所以上のドキュメントリンクを更新済み
- ✅ 4つのローカル例を正確に反映した例のインデックス
- ✅ テーブル内の重複する外部リンクなし
- ✅ 全てのナビゲーション参照が正しい

#### 技術的実装
- **Microsoft Foundry Modelsアーキテクチャ**: gpt-4.1 + Key Vault + Container Appsのパターン
- <strong>セキュリティ</strong>: マネージドID採用、秘密情報はKey Vaultに保存
- <strong>モニタリング</strong>: Application Insights統合
- <strong>コスト管理</strong>: トークン追跡と利用最適化
- <strong>展開</strong>: 完全セットアップを単一の `azd up` コマンドで実施

### [v3.6.0] - 2025-11-19

#### メジャーアップデート: コンテナアプリ展開例
**このバージョンでは、Azure Developer CLI（AZD）を使用した本格派のコンテナアプリケーション展開例を包括的に導入し、学習パスに完全に統合したドキュメントを提供します。**

#### 追加
- **🚀 コンテナアプリの例**: `examples/container-app/` に新たにローカル例を追加：
  - [マスターガイド](examples/container-app/README.md): コンテナ化展開の完全概要、クイックスタート、本番環境、応用パターン
  - [シンプルFlask API](../../examples/container-app/simple-flask-api): 初心者向けREST APIでスケールゼロ、ヘルスプローブ、モニタリング、トラブルシューティングを備える
  - [マイクロサービスアーキテクチャ](../../examples/container-app/microservices): 本番対応の多サービス展開（API Gateway、Product、Order、User、Notification）、非同期メッセージング、Service Bus、Cosmos DB、Azure SQL、分散トレーシング、ブルーグリーン／カナリア展開
- <strong>ベストプラクティス</strong>: コンテナ化ワークロードのセキュリティ、モニタリング、コスト最適化、CI/CDのガイダンス
- <strong>コードサンプル</strong>: 完全な`azure.yaml`、Bicepテンプレート、多言語サービス実装（Python、Node.js、C#、Go）
- **テスト＆トラブルシューティング**: エンドツーエンドのテストシナリオ、モニタリングコマンド、トラブルシューティングガイド

#### 変更
- **README.md**: 新たなコンテナアプリ例を「ローカル例 - コンテナアプリケーション」セクションに追加しリンクを更新
- **examples/README.md**: コンテナアプリ例の強調表示、比較マトリクスの追加、技術・構成情報の更新
- **コース概要＆学習ガイド**: 関連章に新たなコンテナアプリ例と展開パターンを参照として追加

#### 検証済み
- ✅ 新規例はすべて `azd up` で展開可能かつベストプラクティスに準拠
- ✅ ドキュメントのクロスリンクとナビゲーションを更新済み
- ✅ 例は初級から上級のシナリオ、マイクロサービス本番までカバー

#### 注意事項
- <strong>対象範囲</strong>: 英語のドキュメントと例のみ対応
- <strong>今後の方針</strong>: 追加の高度なコンテナパターンとCI/CD自動化の拡充を予定

### [v3.5.0] - 2025-11-19

#### 製品リブランド: Microsoft Foundry
**このバージョンは、Microsoftの公式リブランドに連動し、英語ドキュメント内の製品名を「Microsoft Foundry」から「Microsoft Foundry」へ包括的に変更しています。**

#### 変更点
- **🔄 製品名の更新**: 「Microsoft Foundry」から「Microsoft Foundry」への完全なリブランディング
  - `docs/`フォルダー内の英語ドキュメント全体で全参照を更新
  - フォルダー名を `docs/ai-foundry/` → `docs/microsoft-foundry/` に変更
  - ファイル名を `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md` に変更
  - 合計7ファイル中23箇所のコンテンツ参照を更新

- **📁 フォルダー構造の変更**:
  - `docs/ai-foundry/` を `docs/microsoft-foundry/` にリネーム
  - 全クロスリファレンスを新フォルダー構造に合わせて更新
  - 全ドキュメントでナビゲーションリンクを検証

- **📄 ファイル名変更**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - すべての内部リンクを新ファイル名に更新

#### 更新済みファイル
- <strong>章ドキュメント</strong> (7ファイル):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ナビゲーションリンク3カ所を更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 製品名参照4カ所を更新
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 既にMicrosoft Foundryを使用（前回更新済み）
  - `docs/microsoft-foundry/production-ai-practices.md` - 参照3カ所を更新（概要、コミュニティフィードバック、ドキュメント）
  - `docs/getting-started/azd-basics.md` - クロスリファレンスリンク4カ所を更新
  - `docs/getting-started/first-project.md` - 章ナビゲーションリンク2カ所を更新
  - `docs/getting-started/installation.md` - 次章リンク2カ所を更新
  - `docs/troubleshooting/ai-troubleshooting.md` - 参照3カ所を更新（ナビゲーション、Discordコミュニティ）
  - `docs/troubleshooting/common-issues.md` - ナビゲーションリンク1カ所を更新
  - `docs/troubleshooting/debugging.md` - ナビゲーションリンク1カ所を更新

- <strong>コース構成ファイル</strong> (2ファイル):
  - `README.md` - 参照17カ所を更新（コース概要、章タイトル、テンプレートセクション、コミュニティインサイト）
  - `course-outline.md` - 参照14カ所を更新（概要、学習目標、章リソース）

#### 検証済み
- ✅ 英語ドキュメント内に「ai-foundry」フォルダパスの残存なし
- ✅ 英語ドキュメント内に「Microsoft Foundry」製品名の古い参照なし
- ✅ 新しいフォルダ構造ですべてのナビゲーションリンクが機能
- ✅ ファイルとフォルダの名称変更を正常に完了
- ✅ 章間のクロスリファレンスを検証済み

#### 注意事項
- <strong>対象範囲</strong>: 変更は`docs/`フォルダー内の英語ドキュメントのみ
- <strong>翻訳</strong>: このバージョンで翻訳フォルダー（`translations/`）は更新なし
- <strong>ワークショップ</strong>: ワークショップ資料（`workshop/`）は更新なし
- <strong>例</strong>: 例ファイルは旧名称を参照している可能性あり（今後の更新で対応予定）
- <strong>外部リンク</strong>: 外部URLとGitHubリポジトリの参照は変更なし

#### 貢献者向け移行ガイド
古い構成を参照するローカルブランチやドキュメントがある場合は：
1. フォルダー参照を更新：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ファイル参照を更新：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 製品名を置換：「Microsoft Foundry」→「Microsoft Foundry」
4. すべての内部ドキュメントリンクが機能するか検証

---

### [v3.4.0] - 2025-10-24

#### インフラプレビューと検証の強化
**このバージョンでは、新しいAzure Developer CLIのプレビューフィーチャーを包括的にサポートし、ワークショップのユーザー体験を強化します。**

#### 追加
- **🧪 azd provision --preview 機能ドキュメント**: 新機能であるインフラプレビュー機能の詳細説明
  - チートシート内のコマンドリファレンスと使用例
  - プロビジョニングガイドへの詳細統合、ユースケースと利点を含む
  - より安全な展開検証のための事前チェック統合
  - セーフティファースト展開練習を反映した入門ガイドの更新
- **🚧 ワークショップステータスバナー**: ワークショップ開発状況を示すプロ仕様のHTMLバナー
  - グラデーションデザインと工事中インジケーターで明確にユーザーへ通知
  - 透明性を高める最終更新タイムスタンプ表示
  - すべてのデバイス対応のレスポンシブデザイン

#### 強化
- <strong>インフラの安全性</strong>: 展開ドキュメント全体にプレビュー機能を組み込み
- <strong>展開前検証</strong>: 自動化スクリプトにインフラプレビューテストを追加
- <strong>開発者ワークフロー</strong>: プレビューをベストプラクティスとしてコマンドシーケンスを更新
- <strong>ワークショップ体験</strong>: コンテンツ開発状況について明確に期待値を設定

#### 変更
- <strong>展開ベストプラクティス</strong>: プレビュー優先ワークフローを推奨手法に変更
- <strong>ドキュメントフロー</strong>: 学習プロセスの早い段階にインフラ検証を移動
- <strong>ワークショップ表示</strong>: プロ仕様のステータス表示と明確な開発スケジュール添付

#### 改善
- <strong>安全第一のアプローチ</strong>: 展開前にインフラ変更の検証が可能に
- <strong>チームコラボレーション</strong>: プレビュー結果の共有とレビュー・承認が可能に
- <strong>コスト認識</strong>: プロビジョニング前にリソースコストがより透明化
- <strong>リスク軽減</strong>: 事前検証により展開失敗を削減

#### 技術的実装
- <strong>マルチドキュメントの統合</strong>: 4つの重要ファイルでプレビュー機能を文書化
- <strong>コマンドパターン</strong>: ドキュメント全体で一貫した構文と例示を採用
- <strong>ベストプラクティスの統合</strong>: 検証ワークフローとスクリプトにプレビューを組み込み
- <strong>視覚的指標</strong>: 発見しやすいようNEW機能マークを明示

#### ワークショップインフラ
- <strong>ステータス伝達</strong>: グラデーションスタイルのプロ仕様HTMLバナー
- <strong>ユーザー体験</strong>: 開発状況を明確に伝え誤解防止
- <strong>プロ仕様の提示</strong>: リポジトリの信頼性を保ちつつ期待値を設定
- <strong>タイムライン透明性</strong>: 2025年10月の最終更新日時を示し説明責任を確保

### [v3.3.0] - 2025-09-24

#### ワークショップ資料とインタラクティブラーニング体験の強化
**このバージョンでは、ブラウザベースのインタラクティブガイドと構造化学習パスを備えた包括的なワークショップ資料を導入します。**

#### 追加
- **🎥 インタラクティブワークショップガイド**: MkDocsプレビュー機能を利用したブラウザベースのワークショップ体験
- **📝 構造化されたワークショップ指示**: 発見からカスタマイズまでの7ステップガイド学習パス
  - 0-導入: ワークショップ概要と設定
  - 1-AIテンプレート選択: テンプレート探索と選定プロセス
  - 2-AIテンプレート検証: 展開と検証手順
  - 3-AIテンプレート分解: テンプレート構造の理解
  - 4-AIテンプレート設定: 構成とカスタマイズ
  - 5-AIテンプレートカスタマイズ: 高度な修正と反復
  - 6-インフラ撤収: クリーンアップとリソース管理
  - 7-まとめ: 要約と次のステップ
- **🛠️ ワークショップツール**: Materialテーマ付きMkDocs構成で学習体験を向上
- **🎯 ハンズオン学習パス**: 3段階メソッド（発見 → 展開 → カスタマイズ）
- **📱 GitHub Codespaces統合**: シームレスな開発環境セットアップ

#### 強化
- **AIワークショップラボ**: 2〜3時間の構造化学習体験を拡充
- <strong>ワークショップドキュメント</strong>: ナビゲーションと視覚補助を備えたプロ仕様の提示
- <strong>学習進行</strong>: テンプレート選択から本番展開までの明確な段階的指導
- <strong>開発者体験</strong>: 開発ワークフローを効率化する統合ツール

#### 改善
- <strong>アクセシビリティ</strong>: 検索、コピー機能、テーマ切替を備えたブラウザベースのインターフェイス
- <strong>セルフペース学習</strong>: 各自のスピードに合わせた柔軟なワークショップ構成
- <strong>実用的応用</strong>: 実際のAIテンプレート展開シナリオを提供
- <strong>コミュニティ統合</strong>: ワークショップサポートと協働のためDiscord連携

#### ワークショップ特徴
- <strong>組み込み検索</strong>: キーワードとレッスンの迅速検索
- <strong>コードブロックコピー</strong>: すべてのコード例にホバーでコピー機能
- <strong>テーマ切替</strong>: ダークモード／ライトモード対応で好みに応じた表示
- <strong>視覚資産</strong>: 理解を深めるスクリーンショットと図解
- <strong>ヘルプ連携</strong>: コミュニティサポート用の直接Discordアクセス

### [v3.2.0] - 2025-09-17

#### ナビゲーションの大幅再構成と章別学習システム
**このバージョンでは、リポジトリ全体のナビゲーションを強化し、包括的な章別学習構造を導入します。**

#### 追加
- **📚 章別学習システム**: コース全体を8つの進行的な学習章に再構成
  - 第1章: 基礎とクイックスタート（⭐ - 30〜45分）
  - 第2章: AIファースト開発（⭐⭐ - 1〜2時間）
  - 第3章: 設定と認証（⭐⭐ - 45〜60分）
  - 第4章: インフラコード＆展開（⭐⭐⭐ - 1〜1.5時間）
  - 第5章: マルチエージェントAIソリューション（⭐⭐⭐⭐ - 2〜3時間）
  - 第6章: 展開前検証＆計画（⭐⭐ - 1時間）
  - 第7章: トラブルシューティング＆デバッグ（⭐⭐ - 1〜1.5時間）
  - 第8章: 本番環境＆エンタープライズパターン（⭐⭐⭐⭐ - 2〜3時間）
- **📚 包括的ナビゲーションシステム**: すべてのドキュメントで一貫したヘッダーとフッターのナビゲーション
- **🎯 進捗トラッキング**: コース完了チェックリストと学習検証システム
- **🗺️ 学習パス案内**: 異なる経験レベルと目標に合わせた明確なエントリーポイント
- **🔗 クロスリファレンスナビゲーション**: 関連章と前提条件を明確にリンク

#### 強化
- **README構造**: 章別構成の学習プラットフォームとして再構成
- <strong>ドキュメントナビゲーション</strong>: すべてのページに章のコンテキストと進行案内を追加
- <strong>テンプレート組織</strong>: 例とテンプレートを対応する学習章にマッピング

- <strong>リソース統合</strong>: 関連章に連携したチートシート、FAQ、学習ガイド
- <strong>ワークショップ統合</strong>: 複数の章の学習目標に対応した実践ラボ

#### 変更点
- <strong>学習の進行</strong>: 線形ドキュメントから柔軟な章ベースの学習へ移行
- <strong>設定の配置</strong>: 学習の流れを良くするために設定ガイドを第3章に移動
- **AIコンテンツ統合**: 学習過程全体でAI特有のコンテンツをより良く統合
- <strong>実践コンテンツ</strong>: エンタープライズ向けの高度なパターンを第8章に集約

#### 改善点
- <strong>ユーザー体験</strong>: 明確なナビゲーションパンくずリストと章の進行指標
- <strong>アクセシビリティ</strong>: コースの移動を容易にする一貫したナビゲーションパターン
- <strong>プロフェッショナルなプレゼンテーション</strong>: 学術および企業研修に適した大学スタイルのコース構成
- <strong>学習効率</strong>: 改善された構成により関連コンテンツの検索時間を短縮

#### 技術的実装
- <strong>ナビゲーションヘッダー</strong>: 40ファイル以上のドキュメントで章のナビゲーションを標準化
- <strong>フッターナビゲーション</strong>: 一貫した進行案内と章の完了指標
- <strong>クロスリンク</strong>: 関連概念を結ぶ包括的な内部リンクシステム
- <strong>章マッピング</strong>: テンプレートや例を学習目標に明確に関連付け

#### 学習ガイド強化
- **📚 包括的な学習目標**: 8章システムに合わせて学習ガイドを再構成
- **🎯 章ベースの評価**: 各章に特定の学習目標と実践的演習を含む
- **📋 進捗追跡**: 測定可能な成果とチェックリスト付きの週毎の学習スケジュール
- **❓ 評価質問**: プロフェッショナルな成果を伴う各章の知識検証質問
- **🛠️ 実践演習**: 本番環境展開シナリオとトラブルシューティングを含む実地活動
- **📊 スキル進行**: 基本概念からエンタープライズパターンまでの明確な段階的向上とキャリア育成重視
- **🎓 認定フレームワーク**: プロフェッショナル開発成果とコミュニティ認知システム
- **⏱️ タイムライン管理**: マイルストーン検証付きの体系的な10週間学習計画

### [v3.1.0] - 2025-09-17

#### 強化されたマルチエージェントAIソリューション
**このバージョンでは、エージェント名の改善とドキュメントの強化によってマルチエージェント小売ソリューションを改善しました。**

#### 変更点
- <strong>マルチエージェント用語</strong>: 小売マルチエージェントソリューション全体で「Cora agent」を「Customer agent」に置き換え、理解を明確化
- <strong>エージェントアーキテクチャ</strong>: 一貫した「Customer agent」名称を使うように全ドキュメント、ARMテンプレート、コード例を更新
- <strong>設定例</strong>: エージェント構成パターンをモダンな命名規則で更新
- <strong>ドキュメントの一貫性</strong>: すべての参照に専門的で説明的なエージェント名を使用することを保証

#### 強化点
- **ARMテンプレートパッケージ**: retail-multiagent-arm-templateをCustomer agent参照で更新
- <strong>アーキテクチャ図</strong>: Mermaid図を更新してエージェント名変更反映
- <strong>コード例</strong>: Pythonクラスと実装例をCustomerAgent命名に更新
- <strong>環境変数</strong>: すべての展開スクリプトをCUSTOMER_AGENT_NAME規約に変更

#### 改善点
- <strong>開発者体験</strong>: ドキュメント上でのエージェント役割と責任の明確化
- <strong>本番準備</strong>: エンタープライズ命名規則との更なる整合性
- <strong>学習資料</strong>: 教育目的でより直感的なエージェント名称
- <strong>テンプレートの使いやすさ</strong>: エージェントの機能や展開パターンの理解を簡素化

#### 技術的詳細
- CustomerAgent参照でMermaidアーキテクチャ図を更新
- Python例でCoraAgentクラス名をCustomerAgentに置換
- ARMテンプレートJSON設定で "customer" エージェントタイプを使用するよう修正
- 環境変数をCORA_AGENT_<em>からCUSTOMER_AGENT_</em>パターンに更新
- すべての展開コマンドとコンテナ設定を刷新

### [v3.0.0] - 2025-09-12

#### 大幅な変更 - AI開発者に注力しMicrosoft Foundryを統合
**このバージョンはリポジトリを包括的なAI中心の学習リソースに変革し、Microsoft Foundry統合を行いました。**

#### 追加点
- **🤖 AI優先学習パス**: AI開発者とエンジニアを優先した完全な再構築
- **Microsoft Foundry統合ガイド**: AZD と Microsoft Foundry サービス接続の総合ドキュメント
- **AIモデル展開パターン**: モデル選択、設定、実運用展開戦略の詳細ガイド
- **AIワークショップラボ**: AIアプリケーションをAZD展開可能なソリューションに変換する2-3時間のハンズオンワークショップ
- **本番AIベストプラクティス**: スケーリング、監視、セキュリティの企業対応パターン
- **AI特有のトラブルシューティングガイド**: Microsoft Foundryモデル、Cognitive ServicesおよびAI展開問題の包括的トラブルシューティング
- **AIテンプレートギャラリー**: 複雑度評価付きのMicrosoft Foundryテンプレート集
- <strong>ワークショップ資料</strong>: ハンズオンラボと参考資料を含む完全なワークショップ構成

#### 強化点
- **README構成**: Microsoft Foundry Discordの45%コミュニティ関心データに基づくAI開発者向け
- <strong>学習パス</strong>: 学生とDevOpsエンジニア向けの伝統的なパスと並行してAI開発者向けの専用パスを提供
- <strong>テンプレート推奨</strong>: azure-search-openai-demo、contoso-chat、openai-chat-app-quickstartを含むAIテンプレートを特集
- <strong>コミュニティ統合</strong>: AI特化チャネルとディスカッションを備えたDiscordコミュニティサポート強化

#### セキュリティと本番対応
- <strong>マネージドアイデンティティパターン</strong>: AI向け認証とセキュリティ設定
- <strong>コスト最適化</strong>: AIワークロードのトークン使用量追跡と予算管理
- <strong>マルチリージョン展開</strong>: グローバルなAIアプリケーション展開戦略
- <strong>パフォーマンス監視</strong>: AI特有のメトリクスとApplication Insights統合

#### ドキュメント品質
- <strong>線形コース構成</strong>: 初級から上級AI展開パターンまでの論理的進行
- **検証済みURL**: すべての外部リポジトリリンクが確認済みでアクセス可能
- <strong>完全なリファレンス</strong>: すべての内部ドキュメントリンクが検証済みで機能
- <strong>本番対応</strong>: 実例付きのエンタープライズ展開パターン

### [v2.0.0] - 2025-09-09

#### 大幅な変更 - リポジトリ再構成とプロフェッショナル強化
**このバージョンはリポジトリ構造とコンテンツ表現の大幅な改訂を表します。**

#### 追加点
- <strong>構造化された学習フレームワーク</strong>: すべてのドキュメントページに導入、学習目標、学習成果セクションを追加
- <strong>ナビゲーションシステム</strong>: すべてのドキュメントに前後レッスンリンクを追加し案内付き学習進行を実現
- <strong>学習ガイド</strong>: 学習目標、練習問題、評価資料を含む包括的なstudy-guide.md
- <strong>プロフェッショナルなプレゼンテーション</strong>: アクセシビリティ向上と専門的外観のため絵文字アイコンをすべて削除
- <strong>コンテンツ構造強化</strong>: 学習資料の整理と流れを改善

#### 変更点
- <strong>ドキュメント形式</strong>: 一貫した学習焦点の構造で全ドキュメントを標準化
- <strong>ナビゲーションの流れ</strong>: すべての学習資料で論理的な進行を実装
- <strong>コンテンツ表現</strong>: 装飾要素を排除し明確で専門的なフォーマットへ
- <strong>リンク構造</strong>: 新しいナビゲーションシステムを支援するため全内部リンクを更新

#### 改善点
- <strong>アクセシビリティ</strong>: スクリーンリーダー互換性向上のため絵文字依存を排除
- <strong>プロフェッショナルな外観</strong>: 企業学習に適したクリーンで学術的なプレゼンテーション
- <strong>学習体験</strong>: 各レッスンに明確な目標と成果を持つ構造化されたアプローチ
- <strong>コンテンツの整理</strong>: 関連トピック間の論理的な流れと接続を強化

### [v1.0.0] - 2025-09-09

#### 初版 - 包括的なAZD学習リポジトリ

#### 追加点
- <strong>コアドキュメント構造</strong>
  - 完全な入門ガイドシリーズ
  - 包括的な展開およびプロビジョニングドキュメント
  - 詳細なトラブルシューティング資料とデバッグガイド
  - 展開前検証ツールと手順

- <strong>はじめにモジュール</strong>
  - AZDの基本: コア概念と用語
  - インストールガイド: プラットフォーム別セットアップ手順
  - 設定ガイド: 環境設定と認証
  - 最初のプロジェクトチュートリアル: ステップバイステップの実践学習

- <strong>展開およびプロビジョニングモジュール</strong>
  - 展開ガイド: 完全なワークフロードキュメント
  - プロビジョニングガイド: BicepによるInfrastructure as Code
  - 本番展開のベストプラクティス
  - マルチサービスアーキテクチャパターン

- <strong>展開前検証モジュール</strong>
  - キャパシティプランニング: Azureリソースの可用性検証
  - SKU選択: 包括的なサービス階層ガイド
  - 展開前チェック: 自動化検証スクリプト（PowerShellとBash）
  - コスト見積もりと予算計画ツール

- <strong>トラブルシューティングモジュール</strong>
  - 一般的な問題: よくある問題と解決法
  - デバッグガイド: 系統的トラブルシューティング手法
  - 高度な診断技術とツール
  - パフォーマンス監視と最適化

- <strong>リソースとリファレンス</strong>
  - コマンドチートシート: 重要コマンドのクイックリファレンス
  - 用語集: 包括的な用語と略語の定義
  - FAQ: よくある質問への詳細回答
  - 外部リソースリンクとコミュニティ接続

- <strong>例とテンプレート</strong>
  - シンプルなウェブアプリケーション例
  - 静的ウェブサイト展開テンプレート
  - コンテナアプリケーション設定
  - データベース統合パターン
  - マイクロサービスアーキテクチャ例
  - サーバーレス関数実装

#### 特長
- <strong>マルチプラットフォーム対応</strong>: Windows、macOS、Linuxのインストールおよび設定ガイド
- <strong>複数スキルレベル対応</strong>: 学生からプロフェッショナル開発者向けのコンテンツ
- <strong>実践重視</strong>: 実地例と実世界シナリオ
- <strong>包括的カバレッジ</strong>: 基本概念から高度な企業パターンまで
- <strong>セキュリティファーストのアプローチ</strong>: セキュリティベストプラクティスを随所に統合
- <strong>コスト最適化</strong>: コスト効果の高い展開とリソース管理のガイダンス

#### ドキュメント品質
- <strong>詳細なコード例</strong>: 実践的でテスト済みのコードサンプル
- <strong>ステップバイステップ指示</strong>: 明確で実行可能なガイド
- <strong>包括的なエラー処理</strong>: 一般的な問題に対するトラブルシューティング
- <strong>ベストプラクティス統合</strong>: 業界標準と推奨事項
- <strong>バージョン互換性</strong>: 最新のAzureサービスとazd機能に対応

## 今後の計画中機能拡張

### バージョン 3.1.0（計画中）
#### AIプラットフォーム拡張
- <strong>マルチモデル対応</strong>: Hugging Face、Azure Machine Learning、カスタムモデルの統合パターン
- **AIエージェントフレームワーク**: LangChain、Semantic Kernel、AutoGen展開用テンプレート
- **高度なRAGパターン**: Azure AI Search以外のベクターデータベースオプション（Pinecone、Weaviate等）
- **AI可視化**: モデル性能、トークン使用状況、応答品質の監視強化

#### 開発者体験
- **VS Code拡張**: 統合されたAZD + Microsoft Foundry開発体験
- **GitHub Copilot統合**: AI支援のAZDテンプレート生成
- <strong>インタラクティブチュートリアル</strong>: AIシナリオ向け自動検証付きコード演習
- <strong>動画コンテンツ</strong>: AI展開に特化した視覚学習者向け補助動画チュートリアル

### バージョン 4.0.0（計画中）
#### エンタープライズAIパターン
- <strong>ガバナンスフレームワーク</strong>: AIモデルのガバナンス、コンプライアンス、監査記録
- **マルチテナントAI**: 複数顧客に対応する隔離されたAIサービスのパターン
- **エッジAI展開**: Azure IoT Edgeやコンテナインスタンスとの統合
- **ハイブリッドクラウドAI**: AIワークロードのマルチクラウドおよびハイブリッド展開パターン

#### 高度機能
- **AIパイプライン自動化**: Azure Machine Learningパイプラインを用いたMLOps統合
- <strong>高度なセキュリティ</strong>: ゼロトラストパターン、プライベートエンドポイント、高度な脅威対策
- <strong>パフォーマンス最適化</strong>: 高スループットAIアプリケーションのチューニングとスケーリング戦略
- <strong>グローバル分散</strong>: AIアプリケーションのコンテンツ配信とエッジキャッシュパターン

### バージョン 3.0.0（計画）- 現行リリースにより置換済み
#### 提案された追加機能 - 現行v3.0.0で実装済み
- ✅ **AIに特化したコンテンツ**: Microsoft Foundry統合の包括化（完了）
- ✅ <strong>インタラクティブチュートリアル</strong>: ハンズオンAIワークショップラボ（完了）
- ✅ <strong>高度なセキュリティモジュール</strong>: AI特化セキュリティパターン（完了）
- ✅ <strong>パフォーマンス最適化</strong>: AIワークロードチューニング戦略（完了）

### バージョン 2.1.0（計画）- v3.0.0で部分的に実装済み
#### 小規模改良 - 一部は現行リリースで完了
- ✅ <strong>追加例</strong>: AIに特化した展開シナリオ（完了）
- ✅ **拡張FAQ**: AI特有の質問とトラブルシューティング（完了）
- <strong>ツール統合</strong>: IDEおよびエディター統合ガイドの強化
- ✅ <strong>監視拡張</strong>: AI特有の監視とアラートパターン（完了）

#### 今後のリリースで計画中
- <strong>モバイル対応ドキュメント</strong>: モバイル学習に適したレスポンシブデザイン
- <strong>オフラインアクセス</strong>: ダウンロード可能なドキュメントパッケージ
- **強化されたIDE統合**: AZD + AIワークフロー用のVS Code拡張
- <strong>コミュニティダッシュボード</strong>: リアルタイムのコミュニティ指標および貢献追跡

## 変更履歴への貢献方法

### 変更報告
このリポジトリに貢献する際は、変更履歴の記入に以下を含めてください：

1. <strong>バージョン番号</strong>: セマンティックバージョニング（major.minor.patch）に従うこと
2. <strong>日付</strong>: リリースまたは更新日をYYYY-MM-DD形式で記載
3. <strong>カテゴリー</strong>: Added、Changed、Deprecated、Removed、Fixed、Security
4. <strong>明確な説明</strong>: 何が変更されたかの簡潔な説明
5. <strong>影響評価</strong>: 既存ユーザーに対する影響の評価

### 変更カテゴリー

#### Added
- 新機能、ドキュメントセクション、または機能拡張
- 新しい例、テンプレート、または学習資源
- 追加のツール、スクリプト、またはユーティリティ

#### Changed
- 既存機能やドキュメントへの変更
- 明確さや正確さを高めるための更新
- コンテンツや構造の再編成

#### Deprecated
- 段階的に廃止される機能や手法
- 削除予定のドキュメントセクション
- より良い代替手段がある方法

#### Removed
- もはや関連性のない機能、ドキュメント、または例
- 廃止された情報や手法
- 重複または統合されたコンテンツ

#### Fixed
- ドキュメントやコードの誤りの修正
- 報告された問題や不具合の解決
- 正確さや機能性の改善


#### セキュリティ
- セキュリティ関連の改善または修正
- セキュリティのベストプラクティスの更新
- セキュリティ脆弱性の解決

### セマンティックバージョニングガイドライン

#### メジャーバージョン (X.0.0)
- ユーザーアクションを必要とする破壊的変更
- コンテンツや組織の大幅な再構成
- 基本的なアプローチや手法を変更する変更

#### マイナーバージョン (X.Y.0)
- 新機能やコンテンツの追加
- 後方互換性を維持した改善
- 追加の例、ツール、またはリソース

#### パッチバージョン (X.Y.Z)
- バグ修正と訂正
- 既存コンテンツの小規模改善
- 明確化や小さな改善

## コミュニティのフィードバックと提案

本学習リソースの改善のために、コミュニティからのフィードバックを積極的に募集しています:

### フィードバックの提供方法
- **GitHub Issues**: 問題の報告や改善提案（AI特有の問題も歓迎）
- **Discord Discussions**: アイデア共有や Microsoft Foundry コミュニティとの交流
- **Pull Requests**: コンテンツへの直接的な改善貢献、特にAIテンプレートやガイド
- **Microsoft Foundry Discord**: #Azure チャンネルでAZD + AIの議論に参加
- **Community Forums**: より広範な Azure 開発者の議論に参加

### フィードバックのカテゴリ
- **AIコンテンツの正確性**: AIサービスの統合やデプロイ情報の訂正
- <strong>学習体験</strong>: AI開発者の学習フロー改善の提案
- **不足しているAIコンテンツ**: 追加のAIテンプレート、パターン、または例のリクエスト
- <strong>アクセシビリティ</strong>: 多様な学習ニーズへの対応改善
- **AIツール統合**: AI開発ワークフローの統合改善の提案
- **プロダクションAIパターン**: エンタープライズAIデプロイパターンのリクエスト

### 対応の約束
- <strong>問題対応</strong>: 報告された問題には48時間以内に対応
- <strong>機能リクエスト</strong>: 1週間以内に評価
- <strong>コミュニティへの貢献</strong>: 1週間以内にレビュー
- <strong>セキュリティ問題</strong>: 優先的に迅速対応

## メンテナンススケジュール

### 定期更新
- <strong>月次レビュー</strong>: コンテンツの正確さとリンク検証
- <strong>四半期更新</strong>: 大幅なコンテンツ追加および改善
- <strong>半年ごとのレビュー</strong>: 包括的な再構成と強化
- <strong>年次リリース</strong>: メジャーバージョンアップと大幅な改善

### モニタリングと品質保証
- <strong>自動テスト</strong>: コード例やリンクの定期的な検証
- <strong>コミュニティフィードバックの統合</strong>: ユーザー提案の定期的な取り込み
- <strong>技術更新</strong>: 最新のAzureサービスやazdリリースとの整合
- <strong>アクセシビリティ監査</strong>: 包括的なデザイン原則の定期レビュー

## バージョンサポートポリシー

### 現行バージョンサポート
- <strong>最新メジャーバージョン</strong>: 定期的な更新を含む完全サポート
- <strong>前メジャーバージョン</strong>: 12ヶ月間のセキュリティ更新と重要な修正
- <strong>レガシーバージョン</strong>: コミュニティサポートのみ、公式更新なし

### 移行ガイダンス
メジャーバージョンのリリース時に、以下を提供します:
- <strong>移行ガイド</strong>: ステップバイステップの移行手順
- <strong>互換性ノート</strong>: 破壊的変更の詳細
- <strong>ツールサポート</strong>: 移行支援用スクリプトやユーティリティ
- <strong>コミュニティサポート</strong>: 移行に関する質問のための専用フォーラム

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [Study Guide](resources/study-guide.md)
- <strong>次のレッスン</strong>: [Main README](README.md) に戻る

<strong>最新情報を入手</strong>: このリポジトリをウォッチして、新リリースや学習資料の重要な更新の通知を受け取ってください。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->