# 用語集 - Azure と AZD 用語

<strong>全章の参照用</strong>
- **📚 コースホーム**: [AZD 初心者向け](../README.md)
- **📖 基礎学習**: [第1章: AZD の基礎](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI 用語**: [第2章: AI ファースト開発](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## はじめに

この包括的な用語集は、Azure Developer CLI および Azure クラウド開発で使用される用語、概念、略語の定義を提供します。技術ドキュメントの理解、トラブルシューティング、azd プロジェクトや Azure サービスについて効果的にコミュニケーションするために必須のリファレンスです。

## 学習目標

この用語集を使用することで、以下を達成できます:
- 重要な Azure Developer CLI の用語や概念を理解する
- Azure クラウド開発の語彙や技術用語を習得する
- Infrastructure as Code とデプロイ用語を効果的に参照する
- Azure サービス名、略語、およびそれらの目的を理解する
- トラブルシューティングやデバッグ用語の定義にアクセスする
- 高度な Azure アーキテクチャと開発概念を学ぶ

## 学習成果

定期的にこの用語集を参照することで、以下が可能になります:
- 適切な Azure Developer CLI 用語を使った効果的なコミュニケーション
- 技術ドキュメントやエラーメッセージのより明確な理解
- 自信を持って Azure サービスと概念をナビゲートする
- 適切な技術用語を用いた問題のトラブルシューティング
- 正確な技術用語を用いたチームディスカッションへの貢献
- 系統的な Azure クラウド開発知識の拡大

## A

**ARM テンプレート**  
Azure Resource Manager テンプレート。Azure リソースを宣言的に定義およびデプロイする JSON ベースの Infrastructure as Code 形式。

**App Service**  
インフラ管理不要で Web アプリケーション、REST API、モバイルバックエンドをホストする Azure のプラットフォーム・アズ・ア・サービス (PaaS)。

**Application Insights**  
アプリケーションのパフォーマンス、可用性、使用状況を深く分析する Azure のアプリケーションパフォーマンスモニタリング (APM) サービス。

**Azure CLI**  
Azure リソースを管理するためのコマンドラインインターフェース。AZD を補完するが、ログインは別途必要。AZD のコア認証は `azd auth login` を使用。

**Azure Developer CLI (azd)**  
テンプレートと Infrastructure as Code を利用して Azure へのアプリケーションの構築とデプロイを加速する開発者向けコマンドラインツール。

**azure.yaml**  
azd プロジェクトのメイン設定ファイルで、サービス、インフラ、デプロイフックを定義。

**Azure Resource Manager (ARM)**  
Azure のデプロイおよび管理サービスで、リソースの作成、更新、削除の管理レイヤーを提供。

## B

**Bicep**  
マイクロソフトが開発した Azure リソースデプロイ用のドメイン固有言語 (DSL)。ARM テンプレートよりシンプルな構文で ARM にコンパイルされる。

<strong>ビルド</strong>  
ソースコードのコンパイル、依存関係のインストール、アプリケーションのデプロイ準備のプロセス。

<strong>ブルーグリーンデプロイメント</strong>  
2つの同一の本番環境（青と緑）を用いることでダウンタイムとリスクを最小化するデプロイ戦略。

## C

**Container Apps**  
複雑なインフラ管理不要でコンテナ化されたアプリを実行できる Azure のサーバーレスコンテナサービス。

**CI/CD**  
継続的インテグレーション／継続的デプロイ。コード変更の統合とアプリデプロイの自動化プラクティス。

**Cosmos DB**  
Azure のグローバル分散型マルチモデルデータベースサービス。スループット、遅延、可用性、一貫性に対して包括的 SLA を提供。

<strong>設定</strong>  
アプリケーションの動作やデプロイオプションを制御する設定値やパラメータ。

## D

<strong>デプロイメント</strong>  
ターゲットインフラ上にアプリケーションおよび依存関係をインストール・設定するプロセス。

**Docker**  
コンテナ技術を用いたアプリの開発、発送、実行プラットフォーム。

**Dockerfile**  
Docker コンテナイメージビルド用の命令を記載したテキストファイル。

## E

<strong>環境</strong>  
アプリケーションの特定インスタンスを表すデプロイターゲット（例: 開発、ステージング、本番）。

<strong>環境変数</strong>  
実行時にアプリケーションがアクセスできるキーと値の形で保存される設定値。

<strong>エンドポイント</strong>  
アプリケーションやサービスにアクセス可能な URL またはネットワークアドレス。

## F

**Function App**  
イベント駆動コードをインフラ管理不要で実行可能にする Azure のサーバーレスコンピューティングサービス。

## G

**GitHub Actions**  
GitHub リポジトリと統合された CI/CD プラットフォームでワークフローの自動化が可能。

**Git**  
ソースコード変更を追跡する分散型バージョン管理システム。

## H

<strong>フック</strong>  
デプロイライフサイクルの特定段階（preprovision、postprovision、predeploy、postdeploy）で実行されるカスタムスクリプトまたはコマンド。

<strong>ホスト</strong>  
アプリケーションがデプロイされる Azure サービスの種類（例: appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
コードによってインフラを定義・管理するプラクティス。手動操作を減らす。

**Init**  
通常テンプレートから新たに azd プロジェクトを初期化するプロセス。

## J

**JSON**  
JavaScript Object Notation。設定ファイルや API レスポンスでよく使われるデータ交換形式。

**JWT**  
JSON Web Token。情報を安全に JSON オブジェクトとして送信する標準形式。

## K

**Key Vault**  
秘密情報、キー、証明書を安全に保管・管理する Azure サービス。

**Kusto クエリ言語 (KQL)**  
Azure Monitor、Application Insights など Azure サービスのデータ分析に使われるクエリ言語。

## L

<strong>ロードバランサー</strong>  
複数のサーバーやインスタンス間で受信ネットワークトラフィックを分散するサービス。

**Log Analytics**  
クラウドおよびオンプレ環境からのテレメトリデータ収集、分析、アクションを提供する Azure サービス。

## M

**Managed Identity**  
自動的に認証情報を管理し、他の Azure サービスの認証に利用可能な Azure の機能。

<strong>マイクロサービス</strong>  
アプリケーションを小さく独立したサービス群として構築するアーキテクチャ手法。

**Monitor**  
アプリケーションとインフラ全体を可観測にする Azure の統合モニタリングソリューション。

## N

**Node.js**  
Chrome の V8 JavaScript エンジン上に構築されたサーバーサイド JavaScript ランタイム。

**npm**  
Node.js の依存関係とパッケージを管理するパッケージマネージャー。

## O

<strong>アウトプット</strong>  
インフラデプロイから返され、アプリや他リソースで利用可能な値。

## P

<strong>パッケージ</strong>  
アプリコードと依存関係をデプロイ準備するプロセス。

<strong>パラメーター</strong>  
デプロイカスタマイズのためインフラテンプレートに渡す入力値。

**PostgreSQL**  
Azure でマネージドサービスとしてサポートされるオープンソースのリレーショナルデータベースシステム。

<strong>プロビジョニング</strong>  
インフラテンプレートで定義された Azure リソースを作成・設定するプロセス。

## Q

<strong>クォータ</strong>  
Azure サブスクリプションまたはリージョンに作成可能なリソース量の制限。

## R

<strong>リソースグループ</strong>  
同じライフサイクル、権限、ポリシーを共有する Azure リソースの論理コンテナ。

<strong>リソーストークン</strong>  
azd が生成する一意の文字列で、デプロイ間でリソース名の重複を防ぐ。

**REST API**  
HTTP メソッドを使ったネットワークアプリケーション設計のアーキテクチャスタイル。

<strong>ロールバック</strong>  
アプリケーションやインフラ設定を以前のバージョンに戻すプロセス。

## S

<strong>サービス</strong>  
azure.yaml で定義されたアプリケーションの構成要素（例: Web フロントエンド、API バックエンド、データベース）。

**SKU**  
ストックキーユニット。Azure リソースのサービス階層や性能レベルを表す。

**SQL Database**  
Microsoft SQL Server ベースの Azure マネージド関係データベースサービス。

**Static Web Apps**  
ソースコードリポジトリからフルスタック Web アプリを構築・デプロイする Azure サービス。

**Storage Account**  
BLOB、ファイル、キュー、テーブルなどのデータオブジェクト向けクラウドストレージを提供する Azure サービス。

<strong>サブスクリプション</strong>  
リソースグループやリソースを保持し、課金やアクセス管理が紐づく Azure アカウントのコンテナ。

## T

<strong>テンプレート</strong>  
アプリコード、インフラ定義、共通シナリオ向け設定を含む事前構築プロジェクト構造。

**Terraform**  
Azure を含む複数クラウドプロバイダー対応のオープンソース Infrastructure as Code ツール。

**Traffic Manager**  
グローバルな Azure リージョンにトラフィックを分散する Azure の DNS ベース トラフィックロードバランサー。

## U

**URI**  
Uniform Resource Identifier。特定のリソースを識別する文字列。

**URL**  
Uniform Resource Locator。リソースの場所と取得方法を指定する URI の一種。

## V

**Virtual Network (VNet)**  
Azure でプライベートネットワークを作るための基本構成要素で、分離とセグメント化を提供。

**VS Code**  
Visual Studio Code。優れた Azure と azd 統合を持つ人気のコードエディタ。

## W

**Webhook**  
特定イベントで発動する HTTP コールバック。CI/CD パイプラインでよく使われる。

**What-if**  
実際のデプロイを実行せずに、どのような変更が発生するかを示す Azure の機能。

## Y

**YAML**  
YAML Ain't Markup Language。azure.yaml のような設定ファイルに使われる人間が読みやすいデータシリアライズ標準。

## Z

<strong>ゾーン</strong>  
Azure リージョン内の物理的に分離された場所で、冗長性と高可用性を提供。

---

## 一般的な略語

| 略語 | 正式名称 | 説明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory (現在は Microsoft Entra ID) | アイデンティティとアクセス管理サービス |
| ACR | Azure Container Registry | コンテナイメージのレジストリサービス |
| AKS | Azure Kubernetes Service | マネージド Kubernetes サービス |
| API | Application Programming Interface | ソフトウェア構築のためのプロトコルセット |
| ARM | Azure Resource Manager | Azure のデプロイおよび管理サービス |
| CDN | Content Delivery Network | 分散型サーバーネットワーク |
| CI/CD | 継続的インテグレーション／継続的デプロイ | 自動化された開発プラクティス |
| CLI | コマンドラインインターフェース | テキストベースユーザーインターフェース |
| DNS | ドメインネームシステム | ドメイン名を IP アドレスに変換するシステム |
| HTTPS | ハイパーテキスト転送プロトコル セキュア | HTTP の安全なバージョン |
| IaC | Infrastructure as Code | コードを使ったインフラ管理 |
| JSON | JavaScript Object Notation | データ交換フォーマット |
| JWT | JSON Web Token | 安全な情報伝達のためのトークン形式 |
| KQL | Kusto クエリ言語 | Azure データサービス向けクエリ言語 |
| RBAC | Role-Based Access Control | ユーザー役割に基づくアクセス制御 |
| REST | Representational State Transfer | Web サービスのアーキテクチャスタイル |
| SDK | ソフトウェア開発キット | 開発ツールのコレクション |
| SLA | サービスレベルアグリーメント | サービス可用性・性能に関する約束 |
| SQL | Structured Query Language | 関係データベースの管理言語 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 暗号化プロトコル |
| URI | Uniform Resource Identifier | リソース識別用文字列 |
| URL | Uniform Resource Locator | リソース位置指定用 URI のタイプ |
| VM | 仮想マシン | コンピューターシステムのエミュレーション |
| VNet | 仮想ネットワーク | Azure 内のプライベートネットワーク |
| YAML | YAML Ain't Markup Language | データシリアライズ標準 |

---

## Azure サービス名マッピング

| 一般名 | 正式 Azure サービス名 | azd ホストタイプ |
|-------------|------------------------------|---------------|
| Web アプリ | Azure App Service | `appservice` |
| API アプリ | Azure App Service | `appservice` |
| コンテナアプリ | Azure Container Apps | `containerapp` |
| ファンクション | Azure Functions | `function` |
| スタティックサイト | Azure Static Web Apps | `staticwebapp` |
| データベース | Azure Database for PostgreSQL | インフラリソースで、アプリではない `host` |
| NoSQL データベース | Azure Cosmos DB | インフラリソースで、アプリではない `host` |
| ストレージ | Azure Storage Account | インフラリソースで、組み込みアプリではない `host` |
| キャッシュ | Azure Managed Redis | インフラリソースで、アプリではない `host` |
| 検索 | Azure AI Search | インフラリソースで、アプリではない `host` |
| メッセージング | Azure Service Bus | インフラリソースで、アプリではない `host` |

`services.<name>.host` はアプリケーションのデプロイターゲットを選択するもので、Azure リソースの省略形ではありません。データベース、キャッシュ、検索サービス、キューは通常インフラプロバイダーによってプロビジョニングされ、アウトプットや設定を通じてアプリに接続されます。

---

## コンテキスト固有用語

### 開発用語
- <strong>ホットリロード</strong>: 再起動せずに開発中にアプリを自動更新
- <strong>ビルドパイプライン</strong>: コードビルド・テストの自動化プロセス
- <strong>デプロイスロット</strong>: App Service 内のステージング環境
- <strong>環境の同等性</strong>: 開発、ステージング、本番環境を類似状態に保つこと

### セキュリティ用語
- **Managed Identity**: 自動認証情報管理を提供する Azure 機能
- **Key Vault**: 秘密情報、キー、証明書の安全な保管
- **RBAC**: Azure リソースの役割ベースアクセス制御
- <strong>ネットワークセキュリティグループ</strong>: ネットワークトラフィック管理用仮想ファイアウォール

### モニタリング用語
- <strong>テレメトリ</strong>: 計測値やデータの自動収集
- **アプリケーションパフォーマンスモニタリング (APM)**: ソフトウェアパフォーマンス監視
- **Log Analytics**: ログデータ収集・分析サービス
- <strong>アラートルール</strong>: メトリックや条件に基づく自動通知

### デプロイ用語
- <strong>ブルーグリーンデプロイメント</strong>: ダウンタイムゼロを目指すデプロイ戦略
- <strong>カナリアデプロイメント</strong>: 一部ユーザーへの段階的ロールアウト
- <strong>ローリングアップデート</strong>: アプリインスタンスの逐次入れ替え
- <strong>ロールバック</strong>: 前バージョンへの復帰

---

<strong>使い方のヒント</strong>: 用語集内の特定用語をすばやく検索するには `Ctrl+F` を活用してください。関連用語はクロスリファレンスされています。

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [チートシート](cheat-sheet.md)
- <strong>次のレッスン</strong>: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->