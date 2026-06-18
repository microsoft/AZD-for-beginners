# 用語集 - Azure と AZD の用語

**参照（全章）**
- **📚 コースホーム**: [AZD 初心者向け](../README.md)
- **📖 基礎を学ぶ**: [第1章: AZD 基本](../docs/getting-started/azd-basics.md)
- **🤖 AI 用語**: [第2章: AI ファースト開発](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## はじめに

この包括的な用語集は、Azure Developer CLI と Azure クラウド開発で使用される用語、概念、および頭字語の定義を提供します。技術文書の理解、問題解決、および azd プロジェクトや Azure サービスに関する効果的なコミュニケーションのための必須参照です。

## 学習目標

この用語集を使用することで、以下を達成できます:
- Azure Developer CLI の基本的な用語と概念を理解する
- Azure クラウド開発の語彙と技術用語を習得する
- Infrastructure as Code とデプロイに関する用語を効率的に参照する
- Azure サービス名、頭字語、およびそれらの目的を理解する
- トラブルシューティングやデバッグ用語の定義にアクセスする
- 高度な Azure アーキテクチャと開発概念を学ぶ

## 学習成果

この用語集を定期的に参照することで、以下が可能になります:
- 適切な Azure Developer CLI 用語を用いて効果的にコミュニケーションする
- 技術文書やエラーメッセージをより明確に理解する
- Azure サービスや概念を自信を持ってナビゲートする
- 適切な技術用語を使って問題をトラブルシュートする
- 正確な技術用語でチームの議論に貢献する
- 系統的に Azure クラウド開発の知識を拡張する

## A

**ARM Template**  
Azure Resource Manager テンプレート。Azure リソースを宣言的に定義およびデプロイするための JSON ベースの Infrastructure as Code 形式。

**App Service**  
インフラストラクチャを管理せずに Web アプリケーション、REST API、モバイルバックエンドをホストするための Azure のプラットフォームサービス (PaaS)。

**Application Insights**  
アプリケーションのパフォーマンス、可用性、使用状況に関する深い洞察を提供する Azure のアプリケーションパフォーマンス監視 (APM) サービス。

**Azure CLI**  
Azure リソースを管理するためのコマンドラインインターフェイス。azd による認証および一部の操作で使用されます。

**Azure Developer CLI (azd)**  
テンプレートと Infrastructure as Code を使用してアプリケーションを Azure に構築・デプロイするプロセスを加速する、開発者向けのコマンドラインツール。

**azure.yaml**  
サービス、インフラ、およびデプロイフックを定義する azd プロジェクトの主要な設定ファイル。

**Azure Resource Manager (ARM)**  
リソースの作成、更新、削除のための管理レイヤーを提供する Azure のデプロイおよび管理サービス。

## B

**Bicep**  
Microsoft によって開発された Azure リソースをデプロイするためのドメイン固有言語 (DSL)。ARM テンプレートよりも簡潔な構文を提供し、ARM にコンパイルされます。

**Build**  
ソースコードのコンパイル、依存関係のインストール、およびデプロイ準備のプロセス。

**Blue-Green Deployment**  
ダウンタイムとリスクを最小限にするために、二つの同一の本番環境（ブルーとグリーン）を使用するデプロイ戦略。

## C

**Container Apps**  
複雑なインフラを管理せずにコンテナ化されたアプリケーションを実行できる Azure のサーバーレスコンテナサービス。

**CI/CD**  
継続的インテグレーション / 継続的デプロイ。コード変更の統合とアプリケーションのデプロイを自動化するプラクティス。

**Cosmos DB**  
スループット、レイテンシ、可用性、一貫性に関する包括的な SLA を提供する、グローバル分散型のマルチモデルデータベースサービス。

**Configuration**  
アプリケーションの動作やデプロイオプションを制御する設定とパラメータ。

## D

**Deployment**  
アプリケーションとその依存関係をターゲットインフラにインストールおよび構成するプロセス。

**Docker**  
コンテナ化技術を用いてアプリケーションを開発、出荷、実行するためのプラットフォーム。

**Dockerfile**  
Docker コンテナイメージをビルドするための命令を含むテキストファイル。

## E

**Environment**  
アプリケーションの特定のインスタンスを表すデプロイ対象（例: 開発、ステージング、本番）。

**Environment Variables**  
アプリケーションが実行時にアクセスできるキーと値のペアとして格納される設定値。

**Endpoint**  
アプリケーションまたはサービスにアクセスできる URL またはネットワークアドレス。

## F

**Function App**  
インフラを管理することなくイベント駆動型コードを実行できる Azure のサーバーレスコンピューティングサービス。

## G

**GitHub Actions**  
ワークフロー自動化のために GitHub リポジトリと統合された CI/CD プラットフォーム。

**Git**  
ソースコードの変更を追跡するために使用される分散型バージョン管理システム。

## H

**Hooks**  
デプロイライフサイクルの特定のポイント（preprovision、postprovision、predeploy、postdeploy）で実行されるカスタムスクリプトやコマンド。

**Host**  
アプリケーションがデプロイされる Azure のサービスタイプ（例: appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
手動プロセスではなくコードを通じてインフラを定義および管理するプラクティス。

**Init**  
通常はテンプレートから新しい azd プロジェクトを初期化するプロセス。

## J

**JSON**  
JavaScript Object Notation。設定ファイルや API レスポンスによく使用されるデータ交換フォーマット。

**JWT**  
JSON Web Token。情報を安全に当事者間で JSON オブジェクトとして送信するための標準。

## K

**Key Vault**  
シークレット、キー、証明書を安全に保存および管理するための Azure サービス。

**Kusto Query Language (KQL)**  
Azure Monitor、Application Insights、その他の Azure サービスでデータを分析するために使用されるクエリ言語。

## L

**Load Balancer**  
複数のサーバーやインスタンスに着信ネットワークトラフィックを分散するサービス。

**Log Analytics**  
クラウドおよびオンプレミスの環境からのテレメトリデータを収集、分析、活用するための Azure サービス。

## M

**Managed Identity**  
Azure サービスが他の Azure サービスに対して認証するための自動的に管理される ID を提供する Azure の機能。

**Microservices**  
アプリケーションを小さく独立したサービスの集合として構築するアーキテクチャアプローチ。

**Monitor**  
アプリケーションとインフラ全体にわたるフルスタックの可観測性を提供する Azure の統合監視ソリューション。

## N

**Node.js**  
Chrome の V8 JavaScript エンジン上に構築されたサーバーサイドアプリケーションを構築するための JavaScript ランタイム。

**npm**  
Node.js の依存関係とパッケージを管理するパッケージマネージャー。

## O

**Output**  
インフラデプロイから返され、アプリケーションや他のリソースで使用できる値。

## P

**Package**  
アプリケーションコードと依存関係をデプロイ用に準備するプロセス。

**Parameters**  
デプロイをカスタマイズするためにインフラテンプレートに渡される入力値。

**PostgreSQL**  
Azure でマネージドサービスとしてサポートされるオープンソースのリレーショナルデータベースシステム。

**Provisioning**  
インフラテンプレートで定義された Azure リソースを作成および構成するプロセス。

## Q

**Quota**  
Azure サブスクリプションまたはリージョンで作成できるリソースの量に対する制限。

## R

**Resource Group**  
同じライフサイクル、権限、およびポリシーを共有する Azure リソースの論理コンテナ。

**Resource Token**  
azd によって生成され、デプロイ全体でリソース名の一意性を確保するための一意の文字列。

**REST API**  
HTTP メソッドを使用してネットワークアプリケーションを設計するためのアーキテクチャスタイル。

**Rollback**  
アプリケーションまたはインフラ構成を以前のバージョンに戻すプロセス。

## S

**Service**  
azure.yaml で定義されたアプリケーションのコンポーネント（例: Web フロントエンド、API バックエンド、データベース）。

**SKU**  
Stock Keeping Unit。Azure リソースの異なるサービス層や性能レベルを表します。

**SQL Database**  
Microsoft SQL Server をベースにした Azure のマネージドリレーショナルデータベースサービス。

**Static Web Apps**  
ソースコードリポジトリからフルスタック Web アプリケーションを構築およびデプロイするための Azure サービス。

**Storage Account**  
BLOB、ファイル、キュー、テーブルなどのデータオブジェクト向けのクラウドストレージを提供する Azure サービス。

**Subscription**  
リソースグループとリソースを保持し、請求およびアクセス管理を関連付ける Azure のアカウントコンテナ。

## T

**Template**  
アプリケーションコード、インフラ定義、および一般的なシナリオ向けの設定を含む事前構築されたプロジェクト構造。

**Terraform**  
Azure を含む複数のクラウドプロバイダーをサポートするオープンソースの Infrastructure as Code ツール。

**Traffic Manager**  
グローバルな Azure リージョン間でトラフィックを分散する DNS ベースのトラフィックロードバランサー。

## U

**URI**  
Uniform Resource Identifier。特定のリソースを識別する文字列。

**URL**  
Uniform Resource Locator。リソースの所在と取得方法を指定する URI の一種。

## V

**Virtual Network (VNet)**  
Azure におけるプライベートネットワークの基本構成要素で、分離とセグメンテーションを提供します。

**VS Code**  
Visual Studio Code。優れた Azure および azd 統合を備えた人気のコードエディタ。

## W

**Webhook**  
特定のイベントによってトリガーされる HTTP コールバックで、CI/CD パイプラインで一般的に使用されます。

**What-if**  
デプロイを実行せずに、デプロイによってどのような変更が行われるかを示す Azure の機能。

## Y

**YAML**  
YAML Ain't Markup Language。azure.yaml のような設定ファイルで使用される人間が読みやすいデータシリアライズ標準。

## Z

**Zone**  
冗長性と高可用性を提供する Azure リージョン内の物理的に分離されたロケーション。

---

## よく使われる頭字語

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory（現在は Microsoft Entra ID） | アイデンティティおよびアクセス管理サービス |
| ACR | Azure Container Registry | コンテナイメージのレジストリサービス |
| AKS | Azure Kubernetes Service | マネージド Kubernetes サービス |
| API | Application Programming Interface | ソフトウェアを構築するためのプロトコル群 |
| ARM | Azure Resource Manager | Azure のデプロイおよび管理サービス |
| CDN | Content Delivery Network | 分散されたサーバーネットワーク |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化された開発プラクティス |
| CLI | Command Line Interface | テキストベースのユーザーインターフェイス |
| DNS | Domain Name System | ドメイン名を IP アドレスに変換するシステム |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP のセキュアバージョン |
| IaC | Infrastructure as Code | コードを通じたインフラ管理 |
| JSON | JavaScript Object Notation | データ交換フォーマット |
| JWT | JSON Web Token | 安全な情報伝達のためのトークン形式 |
| KQL | Kusto Query Language | Azure データサービス向けのクエリ言語 |
| RBAC | Role-Based Access Control | ユーザーの役割に基づくアクセス制御方式 |
| REST | Representational State Transfer | Web サービスのアーキテクチャスタイル |
| SDK | Software Development Kit | 開発ツールのコレクション |
| SLA | Service Level Agreement | サービスの可用性／性能に関する約束 |
| SQL | Structured Query Language | リレーショナルデータベースを管理する言語 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 暗号プロトコル |
| URI | Uniform Resource Identifier | リソースを識別する文字列 |
| URL | Uniform Resource Locator | リソースの位置を指定する URI の一種 |
| VM | Virtual Machine | コンピュータシステムのエミュレーション |
| VNet | Virtual Network | Azure のプライベートネットワーク |
| YAML | YAML Ain't Markup Language | データシリアライズ標準 |

---

## Azure サービス名の対応表

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## コンテキスト別用語

### 開発用語
- **Hot Reload**: 開発中にアプリケーションを再起動せずに自動的に更新する機能
- **Build Pipeline**: コードをビルドおよびテストする自動化プロセス
- **Deployment Slot**: App Service 内のステージング環境
- **Environment Parity**: 開発、ステージング、本番環境を類似させて保つこと

### セキュリティ用語
- **Managed Identity**: 自動的な資格情報管理を提供する Azure の機能
- **Key Vault**: シークレット、キー、証明書の安全な保管
- **RBAC**: Azure リソースに対するロールベースのアクセス制御
- **Network Security Group**: ネットワークトラフィックを制御する仮想ファイアウォール

### 監視用語
- **Telemetry**: 計測値やデータの自動収集
- **Application Performance Monitoring (APM)**: ソフトウェアのパフォーマンス監視
- **Log Analytics**: ログデータを収集および分析するサービス
- **Alert Rules**: メトリクスや条件に基づく自動通知

### デプロイ用語
- **Blue-Green Deployment**: ゼロダウンタイムのデプロイ戦略
- **Canary Deployment**: 一部のユーザーに対する段階的なリリース
- **Rolling Update**: アプリケーションインスタンスを順次置換する更新方法
- **Rollback**: 以前のアプリケーションバージョンに戻すこと

---

<strong>使用のヒント</strong>: `Ctrl+F` を使ってこの用語集内の特定の用語を素早く検索してください。用語は該当する箇所で相互参照されています。

---

<strong>ナビゲーション</strong>
- <strong>前のレッスン</strong>: [チートシート](cheat-sheet.md)
- <strong>次のレッスン</strong>: [よくある質問 (FAQ)](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->