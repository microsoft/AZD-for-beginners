<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:40:06+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ja"
}
-->
# 学習ガイド - AZD初心者向け

## はじめに

この包括的な学習ガイドは、Azure Developer CLI (azd) を習得するための構造化された学習目標、重要な概念、練習問題、評価資料を提供します。このガイドを活用して進捗を追跡し、重要なトピックをすべて網羅していることを確認してください。

## 学習目標

この学習ガイドを完了することで、以下を達成できます：
- Azure Developer CLI の基本的および高度な概念を習得する
- Azure アプリケーションのデプロイと管理における実践的なスキルを開発する
- デプロイのトラブルシューティングと最適化に自信を持つ
- 本番環境向けのデプロイ手法とセキュリティの考慮事項を理解する

## 学習成果

この学習ガイドのすべてのセクションを完了した後、以下ができるようになります：
- azd を使用して完全なアプリケーションアーキテクチャを設計、デプロイ、管理する
- 包括的なモニタリング、セキュリティ、コスト最適化戦略を実装する
- 複雑なデプロイ問題を独自にトラブルシューティングする
- カスタムテンプレートを作成し、azd コミュニティに貢献する

## コース構成

### モジュール 1: 初めてのステップ (1～2週目)

#### 学習目標
- Azure Developer CLI の基本とコア概念を理解する
- 開発環境に azd を正常にインストールして設定する
- 既存のテンプレートを使用して初めてのデプロイを完了する
- azd プロジェクト構造を把握し、主要なコンポーネントを理解する

#### 習得すべき重要な概念
- テンプレート、環境、サービス
- azure.yaml の設定構造
- 基本的な azd コマンド (init, up, down, deploy)
- Infrastructure as Code の原則
- Azure の認証と認可

#### 練習問題

**演習 1.1: インストールとセットアップ**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**演習 1.2: 初めてのデプロイ**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**演習 1.3: プロジェクト構造の分析**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### 自己評価質問
1. azd アーキテクチャの3つのコア概念は何ですか？
2. azure.yaml ファイルの目的は何ですか？
3. 環境は異なるデプロイターゲットを管理する上でどのように役立ちますか？
4. azd で使用できる認証方法は何ですか？
5. 初めて `azd up` を実行すると何が起こりますか？

### モジュール 2: 設定と環境 (3週目)

#### 学習目標
- 環境管理と設定を習得する
- 高度な azure.yaml 設定を理解する
- 環境固有の設定と変数を実装する
- 異なるシナリオに対する認証を設定する

#### 習得すべき重要な概念
- 環境階層と変数の優先順位
- サービス設定とパラメータ
- フックとライフサイクルイベント
- 認証方法 (ユーザー、サービスプリンシパル、マネージドアイデンティティ)
- 設定ファイルの管理

#### 練習問題

**演習 2.1: マルチ環境セットアップ**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**演習 2.2: 高度な設定**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**演習 2.3: セキュリティ設定**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自己評価質問
1. azd は環境変数の優先順位をどのように処理しますか？
2. デプロイフックとは何で、いつ使用すべきですか？
3. 異なる環境で異なる SKU を設定する方法は？
4. 異なる認証方法のセキュリティ上の影響は何ですか？
5. 秘密情報や機密設定データをどのように管理しますか？

### モジュール 3: デプロイとプロビジョニング (4週目)

#### 学習目標
- デプロイワークフローとベストプラクティスを習得する
- Bicep テンプレートを使用した Infrastructure as Code を理解する
- 複雑なマルチサービスアーキテクチャを実装する
- デプロイのパフォーマンスと信頼性を最適化する

#### 習得すべき重要な概念
- Bicep テンプレートの構造とモジュール
- リソースの依存関係と順序
- デプロイ戦略 (ブルーグリーン、ローリングアップデート)
- マルチリージョンデプロイ
- データベース移行とデータ管理

#### 練習問題

**演習 3.1: カスタムインフラストラクチャ**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**演習 3.2: マルチサービスアプリケーション**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**演習 3.3: データベース統合**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自己評価質問
1. ARM テンプレートより Bicep を使用する利点は何ですか？
2. azd デプロイでデータベース移行をどのように処理しますか？
3. ダウンタイムゼロのデプロイ戦略にはどのようなものがありますか？
4. サービス間の依存関係をどのように管理しますか？
5. マルチリージョンデプロイの考慮事項は何ですか？

### モジュール 4: デプロイ前の検証 (5週目)

#### 学習目標
- 包括的なデプロイ前チェックを実装する
- 容量計画とリソース検証を習得する
- SKU の選択とコスト最適化を理解する
- 自動化された検証パイプラインを構築する

#### 習得すべき重要な概念
- Azure リソースのクォータと制限
- SKU 選択基準とコストへの影響
- 自動化された検証スクリプトとツール
- 容量計画の方法論
- パフォーマンステストと最適化

#### 練習問題

**演習 4.1: 容量計画**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**演習 4.2: プレフライト検証**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**演習 4.3: SKU 最適化**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自己評価質問
1. SKU 選択の決定に影響を与える要因は何ですか？
2. デプロイ前に Azure リソースの利用可能性をどのように検証しますか？
3. プレフライトチェックシステムの主要な構成要素は何ですか？
4. デプロイコストをどのように見積もり、管理しますか？
5. 容量計画に必要なモニタリングは何ですか？

### モジュール 5: トラブルシューティングとデバッグ (6週目)

#### 学習目標
- 系統的なトラブルシューティング方法論を習得する
- 複雑なデプロイ問題のデバッグに精通する
- 包括的なモニタリングとアラートを実装する
- インシデント対応と復旧手順を構築する

#### 習得すべき重要な概念
- 一般的なデプロイ失敗パターン
- ログ分析と相関技術
- パフォーマンスモニタリングと最適化
- セキュリティインシデントの検出と対応
- 災害復旧と事業継続

#### 練習問題

**演習 5.1: トラブルシューティングシナリオ**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**演習 5.2: モニタリングの実装**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**演習 5.3: インシデント対応**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自己評価質問
1. azd デプロイのトラブルシューティングにおける系統的アプローチは何ですか？
2. 複数のサービスやリソース間でログをどのように相関させますか？
3. 問題の早期検出に最も重要なモニタリング指標は何ですか？
4. 効果的な災害復旧手順をどのように実装しますか？
5. インシデント対応計画の主要な構成要素は何ですか？

### モジュール 6: 高度なトピックとベストプラクティス (7～8週目)

#### 学習目標
- エンタープライズグレードのデプロイパターンを実装する
- CI/CD の統合と自動化を習得する
- カスタムテンプレートを開発し、コミュニティに貢献する
- 高度なセキュリティとコンプライアンス要件を理解する

#### 習得すべき重要な概念
- CI/CD パイプライン統合パターン
- カスタムテンプレートの開発と配布
- エンタープライズガバナンスとコンプライアンス
- 高度なネットワークとセキュリティ設定
- パフォーマンス最適化とコスト管理

#### 練習問題

**演習 6.1: CI/CD の統合**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**演習 6.2: カスタムテンプレートの開発**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**演習 6.3: エンタープライズ実装**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自己評価質問
1. azd を既存の CI/CD ワークフローに統合する方法は？
2. カスタムテンプレート開発の重要な考慮事項は何ですか？
3. azd デプロイにおけるガバナンスとコンプライアンスをどのように実装しますか？
4. エンタープライズ規模のデプロイにおけるベストプラクティスは何ですか？
5. azd コミュニティに効果的に貢献する方法は？

## 実践プロジェクト

### プロジェクト 1: 個人ポートフォリオウェブサイト
**複雑度**: 初級  
**期間**: 1～2週間

以下を使用して個人ポートフォリオウェブサイトを構築およびデプロイします：
- Azure Storage を使用した静的ウェブサイトホスティング
- カスタムドメイン設定
- グローバルパフォーマンス向上のための CDN 統合
- 自動デプロイパイプライン

**成果物**:
- Azure にデプロイされた動作するウェブサイト
- ポートフォリオデプロイ用のカスタム azd テンプレート
- デプロイプロセスのドキュメント
- コスト分析と最適化の推奨事項

### プロジェクト 2: タスク管理アプリケーション
**複雑度**: 中級  
**期間**: 2～3週間

以下を含むフルスタックタスク管理アプリケーションを作成します：
- App Service にデプロイされた React フロントエンド
- 認証付きの Node.js API バックエンド
- マイグレーション付きの PostgreSQL データベース
- Application Insights モニタリング

**成果物**:
- ユーザー認証付きの完全なアプリケーション
- データベーススキーマとマイグレーションスクリプト
- モニタリングダッシュボードとアラートルール
- マルチ環境デプロイ設定

### プロジェクト 3: マイクロサービス型 Eコマースプラットフォーム
**複雑度**: 上級  
**期間**: 4～6週間

以下を含むマイクロサービスベースの Eコマースプラットフォームを設計および実装します：
- 複数の API サービス (カタログ、注文、支払い、ユーザー)
- Service Bus を使用したメッセージキュー統合
- パフォーマンス最適化のための Redis キャッシュ
- 包括的なログとモニタリング

**成果物**:
- 完全なマイクロサービスアーキテクチャ
- サービス間通信パターン
- パフォーマンステストと最適化
- 本番環境向けのセキュリティ実装

## 評価と認定

### 知識チェック

各モジュール終了後に以下の評価を完了してください：

**モジュール 1 評価**: 基本概念とインストール  
- コア概念に関する選択問題  
- 実践的なインストールと設定タスク  
- 簡単なデプロイ演習  

**モジュール 2 評価**: 設定と環境  
- 環境管理シナリオ  
- 設定トラブルシューティング演習  
- セキュリティ設定の実装  

**モジュール 3 評価**: デプロイとプロビジョニング  
- インフラ設計課題  
- マルチサービスデプロイシナリオ  
- パフォーマンス最適化演習  

**モジュール 4 評価**: デプロイ前の検証  
- 容量計画ケーススタディ  
- コスト最適化シナリオ  
- 検証パイプラインの実装  

**モジュール 5 評価**: トラブルシューティングとデバッグ  
- 問題診断演習  
- モニタリング実装タスク  
- インシデント対応シミュレーション  

**モジュール 6 評価**: 高度なトピック  
- CI/CD パイプライン設計  
- カスタムテンプレート開発  
- エンタープライズアーキテクチャシナリオ  

### 最終キャップストーンプロジェクト

すべての概念の習得を示す完全なソリューションを設計および実装してください：

**要件**:
- マルチティアアプリケーションアーキテクチャ  
- 複数のデプロイ環境  
- 包括的なモニタリングとアラート  
- セキュリティとコンプライアンスの実装  
- コスト最適化とパフォーマンス調整  
- 完全なドキュメントと運用手順書  

**評価基準**:
- 技術的な実装の品質  
- ドキュメントの完全性  
- セキュリティとベストプラクティスの遵守  
- パフォーマンスとコストの最適化  
- トラブルシューティングとモニタリングの有効性  

## 学習リソースと参考資料

### 公式ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep ドキュメント](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティリソース
- [AZD テンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub リポジトリ](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 無料アカウント](https://azure.microsoft.com/free/)
- [Azure DevOps 無料プラン](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 追加ツール
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 学習スケジュールの推奨

### フルタイム学習 (8週間)
- **1～2週目**: モジュール 1～2 (初めてのステップ、設定)
- **3～4週目**: モジュール 3～4 (デプロイ、デプロイ前)
- **5～6週目**: モジュール 5～6 (トラブルシュ
3. **オープンソースに貢献する**: テンプレートやソリューションをコミュニティと共有しましょう  
4. **他の人に教える**: 概念を他の人に説明することで、自分自身の理解も深まります  
5. **好奇心を持ち続ける**: 新しいAzureサービスや統合パターンを継続的に探求しましょう  

---

**ナビゲーション**  
- **前のレッスン**: [FAQ](faq.md)  
- **次のレッスン**: [Changelog](../changelog.md)  

**学習進捗の追跡**: このガイドを活用して学習の旅を追跡し、Azure Developer CLIのすべての概念と実践を包括的にカバーできるようにしましょう。  

---

**免責事項**:  
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当社は責任を負いません。