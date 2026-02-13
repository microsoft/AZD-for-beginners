# 用語集 - Azure と AZD の用語

**全章共通の参照**
- **📚 コース ホーム**: [AZD For Beginners](../README.md)
- **📖 基礎を学ぶ**: [第1章: AZD の基礎](../docs/getting-started/azd-basics.md)
- **🤖 AI 用語**: [第2章: AI ファースト開発](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## はじめに

この包括的な用語集は、Azure Developer CLI および Azure クラウド開発で使用される用語、概念、および頭字語の定義を提供します。技術文書の理解、問題解決、azd プロジェクトや Azure サービスに関する効果的なコミュニケーションのための必須参照です。

## 学習目標

この用語集を使用することで、あなたは以下を達成できます:
- Azure Developer CLI の基本的な用語と概念を理解する
- Azure クラウド開発の語彙と技術用語を習得する
- Infrastructure as Code およびデプロイメント用語を効率的に参照する
- Azure サービス名、頭字語、およびそれらの目的を理解する
- トラブルシューティングやデバッグ用語の定義にアクセスする
- 高度な Azure アーキテクチャと開発概念を学ぶ

## 学習成果

この用語集を定期的に参照することで、あなたは次のことができるようになります:
- 適切な Azure Developer CLI 用語を使用して効果的にコミュニケーションする
- 技術文書やエラーメッセージをより明確に理解する
- Azure サービスと概念を自信を持って操作する
- 適切な技術用語を使って問題のトラブルシューティングを行う
- 正確な技術用語でチームの議論に貢献する
- Azure クラウド開発の知識を体系的に拡張する

## A

**ARM Template**  
Azure Resource Manager テンプレート。Azure リソースを宣言的に定義およびデプロイするための JSON ベースの Infrastructure as Code 形式。

**App Service**  
インフラストラクチャを管理することなく Web アプリケーション、REST API、モバイルバックエンドをホストするための Azure の PaaS（Platform as a Service）提供。

**Application Insights**  
アプリケーションのパフォーマンス、可用性、使用状況に関する詳細な洞察を提供する Azure のアプリケーションパフォーマンス監視（APM）サービス。

**Azure CLI**  
Azure リソースを管理するためのコマンドラインインターフェース。azd による認証や一部の操作に使用される。

**Azure Developer CLI (azd)**  
テンプレートと Infrastructure as Code を使用してアプリケーションを Azure にビルドおよびデプロイするプロセスを加速する、開発者向けのコマンドラインツール。

**azure.yaml**  
サービス、インフラストラクチャ、デプロイフックを定義する azd プロジェクトの主要な設定ファイル。

**Azure Resource Manager (ARM)**  
リソースの作成、更新、削除のための管理レイヤーを提供する Azure のデプロイおよび管理サービス。

## B

**Bicep**  
Microsoft によって開発された Azure リソースをデプロイするためのドメイン固有言語（DSL）。ARM テンプレートよりも簡潔な構文を提供し、ARM にコンパイルされる。

**Build**  
ソースコードのコンパイル、依存関係のインストール、およびデプロイ用にアプリケーションを準備するプロセス。

**Blue-Green Deployment**  
ダウンタイムとリスクを最小限に抑えるために、2 つの同一の本番環境（ブルーとグリーン）を使用するデプロイメント戦略。

## C

**Container Apps**  
複雑なインフラストラクチャを管理することなくコンテナ化されたアプリケーションを実行できる Azure のサーバーレスコンテナサービス。

**CI/CD**  
継続的インテグレーション／継続的デプロイ。コード変更の統合とアプリケーションのデプロイを自動化するプラクティス。

**Cosmos DB**  
スループット、レイテンシ、可用性、一貫性に関する包括的な SLA を提供する Azure のグローバル分散型マルチモデルデータベースサービス。

**Configuration**  
アプリケーションの動作やデプロイオプションを制御する設定およびパラメーター。

## D

**Deployment**  
対象インフラストラクチャにアプリケーションとその依存関係をインストールおよび構成するプロセス。

**Docker**  
コンテナ化技術を使用してアプリケーションを開発、配布、実行するためのプラットフォーム。

**Dockerfile**  
Docker コンテナイメージをビルドするための指示を含むテキストファイル。

## E

**Environment**  
アプリケーションの特定のインスタンス（例: 開発、ステージング、本番）を表すデプロイ目標。

**Environment Variables**  
アプリケーションが実行時にアクセスできるキーと値のペアとして格納された構成値。

**Endpoint**  
アプリケーションやサービスにアクセスできる URL またはネットワークアドレス。

## F

**Function App**  
インフラストラクチャを管理することなくイベント駆動型コードを実行できる Azure のサーバーレスコンピュートサービス。

## G

**GitHub Actions**  
リポジトリと統合された CI/CD プラットフォームで、ワークフローの自動化を提供する。

**Git**  
ソースコードの変更を追跡するために使用される分散型バージョン管理システム。

## H

**Hooks**  
デプロイライフサイクルの特定のポイント（preprovision、postprovision、predeploy、postdeploy）で実行されるカスタムスクリプトやコマンド。

**Host**  
アプリケーションがデプロイされる Azure サービスの種類（例: appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
手作業によるプロセスではなくコードを通じてインフラストラクチャを定義および管理するプラクティス。

**Init**  
通常テンプレートから新しい azd プロジェクトを初期化するプロセス。

## J

**JSON**  
JavaScript Object Notation。設定ファイルや API レスポンスで一般的に使用されるデータ交換フォーマット。

**JWT**  
JSON Web Token。情報を JSON オブジェクトとして安全に送信するための標準。

## K

**Key Vault**  
シークレット、キー、証明書を安全に保存および管理するための Azure のサービス。

**Kusto Query Language (KQL)**  
Azure Monitor、Application Insights、その他の Azure サービス内のデータを分析するために使用されるクエリ言語。

## L

**Load Balancer**  
複数のサーバーやインスタンスに着信トラフィックを分散するサービス。

**Log Analytics**  
クラウドおよびオンプレミス環境からのテレメトリデータを収集、分析、アクションに変換する Azure サービス。

## M

**Managed Identity**  
Azure の機能で、Azure サービスに対して他の Azure サービスに認証するための自動管理された ID を提供する。

**Microservices**  
アプリケーションを小さく独立したサービスの集合として構築するアーキテクチャ手法。

**Monitor**  
アプリケーションとインフラストラクチャ全体のフルスタック可観測性を提供する Azure の統合監視ソリューション。

## N

**Node.js**  
Chrome の V8 JavaScript エンジン上に構築された、サーバーサイドアプリケーションを構築するための JavaScript ランタイム。

**npm**  
依存関係やパッケージを管理する Node.js 向けのパッケージマネージャー。

## O

**Output**  
インフラストラクチャのデプロイから返され、アプリケーションや他のリソースで使用できる値。

## P

**Package**  
アプリケーションのコードと依存関係をデプロイ用に準備するプロセス。

**Parameters**  
デプロイをカスタマイズするためにインフラテンプレートに渡される入力値。

**PostgreSQL**  
Azure でマネージドサービスとしてサポートされるオープンソースのリレーショナルデータベースシステム。

**Provisioning**  
インフラテンプレートで定義された Azure リソースを作成および構成するプロセス。

## Q

**Quota**  
Azure サブスクリプションまたはリージョンで作成できるリソース量に対する制限。

## R

**Resource Group**  
同じライフサイクル、権限、ポリシーを共有する Azure リソースの論理コンテナ。

**Resource Token**  
デプロイ間でリソース名の一意性を確保するために azd が生成する一意の文字列。

**REST API**  
HTTP メソッドを使用してネットワークアプリケーションを設計するためのアーキテクチャスタイル。

**Rollback**  
アプリケーションまたはインフラ構成を以前のバージョンに戻すプロセス。

## S

**Service**  
azure.yaml で定義されたアプリケーションのコンポーネント（例: Web フロントエンド、API バックエンド、データベース）。

**SKU**  
Stock Keeping Unit。Azure リソースの異なるサービス層やパフォーマンスレベルを表す。

**SQL Database**  
Microsoft SQL Server をベースとした Azure のマネージドリレーショナルデータベースサービス。

**Static Web Apps**  
ソースコードリポジトリからフルスタック Web アプリケーションを構築およびデプロイするための Azure サービス。

**Storage Account**  
BLOB、ファイル、キュー、テーブルなどのデータオブジェクト向けのクラウドストレージを提供する Azure サービス。

**Subscription**  
リソースグループとリソースを保持し、課金とアクセス管理が関連付けられた Azure のアカウントコンテナ。

## T

**Template**  
一般的なシナリオ向けにアプリケーションコード、インフラ定義、構成を含む事前作成されたプロジェクト構造。

**Terraform**  
複数のクラウドプロバイダー（Azure を含む）をサポートするオープンソースの Infrastructure as Code ツール。

**Traffic Manager**  
グローバルな Azure リージョン間でトラフィックを分散するための DNS ベースのトラフィックロードバランサー。

## U

**URI**  
Uniform Resource Identifier。特定のリソースを識別する文字列。

**URL**  
Uniform Resource Locator。リソースの場所と取得方法を指定する URI の一種。

## V

**Virtual Network (VNet)**  
Azure におけるプライベートネットワークの基本構成要素で、分離とセグメンテーションを提供する。

**VS Code**  
Visual Studio Code。優れた Azure と azd の統合を持つ人気のコードエディター。

## W

**Webhook**  
特定のイベントによってトリガーされる HTTP コールバックで、CI/CD パイプラインで一般的に使用される。

**What-if**  
デプロイによってどのような変更が行われるかを、実際に実行することなく表示する Azure の機能。

## Y

**YAML**  
YAML Ain't Markup Language。azure.yaml のような設定ファイルで使用される、人間が読みやすいデータ直列化規格。

## Z

**Zone**  
Azure リージョン内の物理的に分離された場所で、冗長性と高可用性を提供する。

---

## よく使われる頭字語

| 略語 | 正式名称 | 説明 |
|------|-----------|------|
| AAD | Azure Active Directory | ID とアクセス管理サービス |
| ACR | Azure Container Registry | コンテナイメージのレジストリサービス |
| AKS | Azure Kubernetes Service | マネージド Kubernetes サービス |
| API | Application Programming Interface | ソフトウェアを構築するためのプロトコル群 |
| ARM | Azure Resource Manager | Azure のデプロイおよび管理サービス |
| CDN | Content Delivery Network | 分散サーバーのネットワーク |
| CI/CD | Continuous Integration/Continuous Deployment | 開発の自動化プラクティス |
| CLI | Command Line Interface | テキストベースのユーザーインターフェース |
| DNS | Domain Name System | ドメイン名を IP アドレスに変換するシステム |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP のセキュア版 |
| IaC | Infrastructure as Code | コードによるインフラ管理 |
| JSON | JavaScript Object Notation | データ交換フォーマット |
| JWT | JSON Web Token | セキュアな情報送信のためのトークン形式 |
| KQL | Kusto Query Language | Azure データサービス向けのクエリ言語 |
| RBAC | Role-Based Access Control | ユーザーの役割に基づくアクセス制御方式 |
| REST | Representational State Transfer | ウェブサービス向けのアーキテクチャスタイル |
| SDK | Software Development Kit | 開発ツールのコレクション |
| SLA | Service Level Agreement | サービスの可用性／性能に関する保証 |
| SQL | Structured Query Language | リレーショナルデータベースを管理する言語 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 暗号プロトコル |
| URI | Uniform Resource Identifier | リソースを識別する文字列 |
| URL | Uniform Resource Locator | リソースの位置を指定する URI の一種 |
| VM | Virtual Machine | コンピュータシステムのエミュレーション |
| VNet | Virtual Network | Azure におけるプライベートネットワーク |
| YAML | YAML Ain't Markup Language | データ直列化の規格 |

---

## Azure サービス名の対応

| 共通名 | 公式の Azure サービス名 | azd ホスト タイプ |
|--------|-------------------------|-------------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## コンテキスト別用語

### 開発用語
- **Hot Reload**: 開発中に再起動せず自動でアプリケーションを更新する機能
- **Build Pipeline**: コードのビルドとテストを自動化するプロセス
- **Deployment Slot**: App Service 内のステージング環境
- **Environment Parity**: 開発、ステージング、本番環境を類似させて保つこと

### セキュリティ用語
- **Managed Identity**: 自動的な資格情報管理を提供する Azure の機能
- **Key Vault**: シークレット、キー、証明書の安全な保管
- **RBAC**: Azure リソース向けの役割ベースのアクセス制御
- **Network Security Group**: ネットワークトラフィックを制御する仮想ファイアウォール

### 監視用語
- **Telemetry**: 測定値やデータの自動収集
- **Application Performance Monitoring (APM)**: ソフトウェアのパフォーマンス監視
- **Log Analytics**: ログデータの収集と分析のサービス
- **Alert Rules**: メトリックや条件に基づく自動通知

### デプロイ用語
- **Blue-Green Deployment**: ゼロダウンタイムのデプロイ戦略
- **Canary Deployment**: ユーザーのサブセットへ段階的にロールアウトする手法
- **Rolling Update**: アプリケーションインスタンスを順次置換する更新
- **Rollback**: 前のアプリケーションバージョンに戻すこと

---

**使用のヒント**: `Ctrl+F` を使ってこの用語集内の特定の用語を素早く検索してください。用語は該当する場合に相互参照されています。

---

**ナビゲーション**
- **前のレッスン**: [Cheat Sheet](cheat-sheet.md)
- **次のレッスン**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を用いて翻訳されました。正確性には注意を払っていますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることをご承知おきください。重要な情報については、原文（原言語による文書）を正本とみなしてください。重要な内容に関しては、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や解釈の相違についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->