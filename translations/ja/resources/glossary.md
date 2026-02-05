# 用語集 - AzureとAZDの用語

**全章の参考資料**
- **📚 コースホーム**: [AZD初心者向け](../README.md)
- **📖 基本を学ぶ**: [第1章: AZDの基本](../docs/getting-started/azd-basics.md)
- **🤖 AI用語**: [第2章: AIファースト開発](../docs/ai-foundry/azure-ai-foundry-integration.md)

## はじめに

この包括的な用語集は、Azure Developer CLIとAzureクラウド開発で使用される用語、概念、略語の定義を提供します。技術文書の理解、問題解決、AZDプロジェクトやAzureサービスについて効果的にコミュニケーションを取るための重要な参考資料です。

## 学習目標

この用語集を使用することで、以下を達成できます:
- Azure Developer CLIの基本的な用語と概念を理解する
- Azureクラウド開発の語彙と技術用語を習得する
- インフラストラクチャコードやデプロイ用語を効率的に参照する
- Azureサービス名、略語、その目的を理解する
- 問題解決やデバッグ用語の定義にアクセスする
- 高度なAzureアーキテクチャと開発概念を学ぶ

## 学習成果

この用語集を定期的に参照することで、以下が可能になります:
- 適切なAzure Developer CLI用語を使用して効果的にコミュニケーションを取る
- 技術文書やエラーメッセージをより明確に理解する
- Azureサービスや概念を自信を持ってナビゲートする
- 適切な技術用語を使用して問題を解決する
- チームディスカッションに正確な技術言語で貢献する
- Azureクラウド開発の知識を体系的に拡張する

## A

**ARMテンプレート**  
Azure Resource Managerテンプレート。JSONベースのインフラストラクチャコード形式で、Azureリソースを宣言的に定義およびデプロイするために使用されます。

**App Service**  
Azureのプラットフォームサービス(PaaS)で、ウェブアプリケーション、REST API、モバイルバックエンドをインフラ管理なしでホストします。

**Application Insights**  
Azureのアプリケーションパフォーマンス監視(APM)サービスで、アプリケーションのパフォーマンス、可用性、使用状況に関する深い洞察を提供します。

**Azure CLI**  
Azureリソースを管理するためのコマンドラインインターフェイス。AZDで認証や一部の操作に使用されます。

**Azure Developer CLI (azd)**  
テンプレートとインフラストラクチャコードを使用して、Azureへのアプリケーションの構築とデプロイを迅速化する開発者向けコマンドラインツール。

**azure.yaml**  
AZDプロジェクトの主要な構成ファイルで、サービス、インフラストラクチャ、デプロイフックを定義します。

**Azure Resource Manager (ARM)**  
Azureのデプロイと管理サービスで、リソースの作成、更新、削除のための管理レイヤーを提供します。

## B

**Bicep**  
Microsoftが開発したAzureリソースをデプロイするためのドメイン固有言語(DSL)。ARMテンプレートよりも簡潔な構文を提供し、ARMにコンパイルされます。

**Build**  
ソースコードのコンパイル、依存関係のインストール、アプリケーションのデプロイ準備を行うプロセス。

**ブルーグリーンデプロイ**  
ダウンタイムとリスクを最小限に抑えるために、2つの同一の本番環境(ブルーとグリーン)を使用するデプロイ戦略。

## C

**Container Apps**  
複雑なインフラ管理なしでコンテナ化されたアプリケーションを実行できるAzureのサーバーレスコンテナサービス。

**CI/CD**  
継続的インテグレーション/継続的デプロイ。コード変更の統合とアプリケーションのデプロイを自動化するプラクティス。

**Cosmos DB**  
Azureのグローバル分散型マルチモデルデータベースサービスで、スループット、レイテンシー、可用性、一貫性に関する包括的なSLAを提供します。

**Configuration**  
アプリケーションの動作やデプロイオプションを制御する設定とパラメータ。

## D

**Deployment**  
アプリケーションとその依存関係をターゲットインフラストラクチャにインストールおよび構成するプロセス。

**Docker**  
コンテナ化技術を使用してアプリケーションを開発、出荷、実行するためのプラットフォーム。

**Dockerfile**  
Dockerコンテナイメージを構築するための指示を含むテキストファイル。

## E

**Environment**  
アプリケーションの特定のインスタンス(例: 開発、ステージング、本番)を表すデプロイターゲット。

**Environment Variables**  
アプリケーションが実行時にアクセスできるキーと値のペアとして保存された構成値。

**Endpoint**  
アプリケーションやサービスにアクセスできるURLまたはネットワークアドレス。

## F

**Function App**  
インフラ管理なしでイベント駆動型コードを実行できるAzureのサーバーレスコンピュートサービス。

## G

**GitHub Actions**  
GitHubリポジトリと統合されたCI/CDプラットフォームで、ワークフローを自動化します。

**Git**  
ソースコードの変更を追跡するための分散型バージョン管理システム。

## H

**Hooks**  
デプロイライフサイクルの特定のポイント(例: preprovision, postprovision, predeploy, postdeploy)で実行されるカスタムスクリプトやコマンド。

**Host**  
アプリケーションがデプロイされるAzureサービスタイプ(例: appservice, containerapp, function)。

## I

**Infrastructure as Code (IaC)**  
コードを使用してインフラを定義および管理するプラクティス。

**Init**  
通常テンプレートから新しいAZDプロジェクトを初期化するプロセス。

## J

**JSON**  
JavaScript Object Notation。構成ファイルやAPIレスポンスで一般的に使用されるデータ交換形式。

**JWT**  
JSON Web Token。JSONオブジェクトとして情報を安全に送信するための標準。

## K

**Key Vault**  
秘密、キー、証明書を安全に保存および管理するAzureのサービス。

**Kusto Query Language (KQL)**  
Azure Monitor、Application Insights、その他のAzureサービスでデータを分析するためのクエリ言語。

## L

**Load Balancer**  
複数のサーバーやインスタンスにネットワークトラフィックを分散するサービス。

**Log Analytics**  
クラウドおよびオンプレミス環境からのテレメトリデータを収集、分析、対応するAzureサービス。

## M

**Managed Identity**  
Azureサービスが他のAzureサービスに認証するための自動管理されたIDを提供するAzure機能。

**Microservices**  
アプリケーションを小さく独立したサービスの集合として構築するアーキテクチャアプローチ。

**Monitor**  
アプリケーションとインフラストラクチャ全体の観測性を提供するAzureの統合監視ソリューション。

## N

**Node.js**  
サーバーサイドアプリケーションを構築するためのChromeのV8 JavaScriptエンジン上に構築されたJavaScriptランタイム。

**npm**  
Node.jsの依存関係とパッケージを管理するパッケージマネージャー。

## O

**Output**  
インフラストラクチャデプロイから返される値で、アプリケーションや他のリソースで使用できます。

## P

**Package**  
アプリケーションコードと依存関係をデプロイのために準備するプロセス。

**Parameters**  
デプロイをカスタマイズするためにインフラストラクチャテンプレートに渡される入力値。

**PostgreSQL**  
Azureで管理サービスとしてサポートされているオープンソースのリレーショナルデータベースシステム。

**Provisioning**  
インフラストラクチャテンプレートで定義されたAzureリソースを作成および構成するプロセス。

## Q

**Quota**  
Azureサブスクリプションやリージョンで作成できるリソースの制限。

## R

**Resource Group**  
同じライフサイクル、権限、ポリシーを共有するAzureリソースの論理コンテナ。

**Resource Token**  
AZDによって生成される一意の文字列で、リソース名がデプロイ間で一意であることを保証します。

**REST API**  
HTTPメソッドを使用してネットワークアプリケーションを設計するためのアーキテクチャスタイル。

**Rollback**  
アプリケーションやインフラストラクチャ構成の以前のバージョンに戻すプロセス。

## S

**Service**  
azure.yamlで定義されたアプリケーションのコンポーネント(例: ウェブフロントエンド、APIバックエンド、データベース)。

**SKU**  
ストックキーピングユニット。Azureリソースの異なるサービス階層や性能レベルを表します。

**SQL Database**  
Microsoft SQL Serverに基づいたAzureの管理リレーショナルデータベースサービス。

**Static Web Apps**  
ソースコードリポジトリからフルスタックウェブアプリケーションを構築およびデプロイするためのAzureサービス。

**Storage Account**  
Blob、ファイル、キュー、テーブルを含むデータオブジェクトのクラウドストレージを提供するAzureサービス。

**Subscription**  
リソースグループとリソースを保持するAzureアカウントコンテナで、関連する請求とアクセス管理を含みます。

## T

**Template**  
一般的なシナリオのためのアプリケーションコード、インフラストラクチャ定義、構成を含む事前構築されたプロジェクト構造。

**Terraform**  
Azureを含む複数のクラウドプロバイダーをサポートするオープンソースのインフラストラクチャコードツール。

**Traffic Manager**  
グローバルAzureリージョン間でトラフィックを分散するAzureのDNSベースのトラフィックロードバランサー。

## U

**URI**  
Uniform Resource Identifier。特定のリソースを識別する文字列。

**URL**  
Uniform Resource Locator。リソースの場所と取得方法を指定するURIの一種。

## V

**Virtual Network (VNet)**  
Azureでプライベートネットワークを構築するための基本的な構成要素で、分離とセグメンテーションを提供します。

**VS Code**  
Visual Studio Code。AzureとAZDとの統合が優れた人気のコードエディタ。

## W

**Webhook**  
特定のイベントによってトリガーされるHTTPコールバックで、CI/CDパイプラインで一般的に使用されます。

**What-if**  
デプロイを実行せずに、デプロイによって行われる変更を表示するAzure機能。

## Y

**YAML**  
YAML Ain't Markup Language。azure.yamlのような構成ファイルで使用される人間が読みやすいデータシリアル化標準。

## Z

**Zone**  
Azureリージョン内の物理的に分離された場所で、冗長性と高可用性を提供します。

---

## 一般的な略語

| 略語 | 完全な形式 | 説明 |
|------|-----------|------|
| AAD | Azure Active Directory | IDとアクセス管理サービス |
| ACR | Azure Container Registry | コンテナイメージレジストリサービス |
| AKS | Azure Kubernetes Service | 管理されたKubernetesサービス |
| API | Application Programming Interface | ソフトウェアを構築するためのプロトコル |
| ARM | Azure Resource Manager | Azureのデプロイと管理サービス |
| CDN | Content Delivery Network | 分散型サーバーネットワーク |
| CI/CD | Continuous Integration/Continuous Deployment | 自動化された開発プラクティス |
| CLI | Command Line Interface | テキストベースのユーザーインターフェイス |
| DNS | Domain Name System | ドメイン名をIPアドレスに変換するシステム |
| HTTPS | Hypertext Transfer Protocol Secure | HTTPの安全なバージョン |
| IaC | Infrastructure as Code | コードを使用してインフラを管理 |
| JSON | JavaScript Object Notation | データ交換形式 |
| JWT | JSON Web Token | 安全な情報送信のためのトークン形式 |
| KQL | Kusto Query Language | Azureデータサービスのクエリ言語 |
| RBAC | Role-Based Access Control | ユーザーロールに基づくアクセス制御 |
| REST | Representational State Transfer | ウェブサービスのアーキテクチャスタイル |
| SDK | Software Development Kit | 開発ツールのコレクション |
| SLA | Service Level Agreement | サービスの可用性/性能に関するコミットメント |
| SQL | Structured Query Language | リレーショナルデータベースを管理する言語 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 暗号化プロトコル |
| URI | Uniform Resource Identifier | リソースを識別する文字列 |
| URL | Uniform Resource Locator | リソースの場所を指定するURIの一種 |
| VM | Virtual Machine | コンピュータシステムのエミュレーション |
| VNet | Virtual Network | Azureのプライベートネットワーク |
| YAML | YAML Ain't Markup Language | データシリアル化標準 |

---

## Azureサービス名のマッピング

| 一般名 | Azure公式サービス名 | azdホストタイプ |
|--------|---------------------|----------------|
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

## コンテキスト固有の用語

### 開発用語
- **ホットリロード**: 開発中にアプリケーションを再起動せずに自動更新
- **ビルドパイプライン**: コードをビルドおよびテストする自動化プロセス
- **デプロイスロット**: App Service内のステージング環境
- **環境の均一性**: 開発、ステージング、本番環境を類似させること

### セキュリティ用語
- **Managed Identity**: 自動的な資格情報管理を提供するAzure機能
- **Key Vault**: 秘密、キー、証明書の安全な保存
- **RBAC**: Azureリソースのロールベースアクセス制御
- **ネットワークセキュリティグループ**: ネットワークトラフィックを制御する仮想ファイアウォール

### 監視用語
- **テレメトリ**: 測定値とデータの自動収集
- **アプリケーションパフォーマンス監視(APM)**: ソフトウェアの性能を監視
- **Log Analytics**: ログデータを収集および分析するサービス
- **アラートルール**: メトリクスや条件に基づく自動通知

### デプロイ用語
- **ブルーグリーンデプロイ**: ダウンタイムゼロのデプロイ戦略
- **カナリーデプロイ**: ユーザーの一部に段階的に展開
- **ローリングアップデート**: アプリケーションインスタンスの順次置き換え
- **ロールバック**: アプリケーションの以前のバージョンに戻す

---

**使用のヒント**: `Ctrl+F`を使用して、この用語集内の特定の用語を迅速に検索してください。関連する用語は相互参照されています。

---

**ナビゲーション**
- **前のレッスン**: [チートシート](cheat-sheet.md)
- **次のレッスン**: [FAQ](faq.md)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は責任を負いません。