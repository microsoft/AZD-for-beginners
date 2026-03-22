# Study Guide - Comprehensive Learning Objectives

**Learning Path Navigation**
- **📚 Course Home**: [AZD 入門](../README.md)
- **📖 Start Learning**: [第1章: 基礎とクイックスタート](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progress Tracking**: [コース完了](../README.md#-course-completion--certification)

## Introduction

この包括的な学習ガイドは、構造化された学習目標、主要概念、実践演習、および評価資料を提供し、Azure Developer CLI (azd) を習得するのに役立ちます。このガイドを使用して進捗を追跡し、すべての重要なトピックを網羅していることを確認してください。

## Learning Goals

この学習ガイドを完了すると、あなたは次のことができるようになります:
- Azure Developer CLI の基本および上級概念を完全に習得する
- Azure アプリケーションのデプロイと管理に関する実践的スキルを身につける
- デプロイのトラブルシューティングと最適化に自信を持つ
- 本番準備が整ったデプロイ手法とセキュリティ上の考慮事項を理解する

## Learning Outcomes

この学習ガイドのすべてのセクションを完了した後、あなたは次のことができるようになります:
- azd を使用して完全なアプリケーションアーキテクチャを設計、デプロイ、および管理する
- 包括的なモニタリング、セキュリティ、およびコスト最適化戦略を実装する
- 複雑なデプロイの問題を独立してトラブルシューティングする
- カスタムテンプレートを作成し、azd コミュニティに貢献する

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (Week 1)
**Duration**: 30-45 minutes | **Complexity**: ⭐

#### Learning Objectives
- Azure Developer CLI のコア概念と用語を理解する
- 開発プラットフォームに AZD を正常にインストールおよび構成する
- 既存のテンプレートを使用して最初のアプリケーションをデプロイする
- AZD のコマンドラインインターフェースを効果的に操作する

#### Key Concepts to Master
- AZD プロジェクトの構造とコンポーネント (azure.yaml, infra/, src/)
- テンプレートベースのデプロイワークフロー
- 環境構成の基本
- リソースグループとサブスクリプションの管理

#### Practical Exercises
1. **Installation Verification**: Install AZD and verify with `azd version`
2. **First Deployment**: Deploy todo-nodejs-mongo template successfully
3. **Environment Setup**: Configure your first environment variables
4. **Resource Exploration**: Navigate deployed resources in Azure Portal

#### Assessment Questions
- AZD プロジェクトのコアコンポーネントは何ですか？
- テンプレートから新しいプロジェクトを初期化するにはどうしますか？
- `azd up` と `azd deploy` の違いは何ですか？
- AZD で複数の環境をどのように管理しますか？

---

### Chapter 2: AI-First Development (Week 2)
**Duration**: 1-2 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- Microsoft Foundry サービスを AZD ワークフローと統合する
- AI 搭載アプリケーションをデプロイおよび構成する
- RAG (Retrieval-Augmented Generation) の実装パターンを理解する
- AI モデルのデプロイとスケーリングを管理する

#### Key Concepts to Master
- Microsoft Foundry Models サービスの統合と API 管理
- AI Search の構成とベクトルインデクシング
- モデルデプロイ戦略とキャパシティ計画
- AI アプリケーションのモニタリングとパフォーマンス最適化

#### Practical Exercises
1. **AI Chat Deployment**: Deploy azure-search-openai-demo template
2. **RAG Implementation**: Configure document indexing and retrieval
3. **Model Configuration**: Set up multiple AI models with different purposes
4. **AI Monitoring**: Implement Application Insights for AI workloads

#### Assessment Questions
- AZD テンプレートで Microsoft Foundry Models サービスをどのように構成しますか？
- RAG アーキテクチャの主要コンポーネントは何ですか？
- AI モデルのキャパシティとスケーリングをどのように管理しますか？
- AI アプリケーションにとって重要なモニタリング指標は何ですか？

---

### Chapter 3: Configuration & Authentication (Week 3)
**Duration**: 45-60 minutes | **Complexity**: ⭐⭐

#### Learning Objectives
- 環境構成と管理戦略を習得する
- セキュアな認証パターンとマネージド ID を実装する
- 適切な命名規則でリソースを整理する
- 複数環境デプロイ (dev, staging, prod) を構成する

#### Key Concepts to Master
- 環境階層と構成の優先度
- マネージド ID とサービスプリンシパル認証
- シークレット管理のための Key Vault 統合
- 環境固有のパラメータ管理

#### Practical Exercises
1. **Multi-Environment Setup**: Configure dev, staging, and prod environments
2. **Security Configuration**: Implement managed identity authentication
3. **Secrets Management**: Integrate Azure Key Vault for sensitive data
4. **Parameter Management**: Create environment-specific configurations

#### Assessment Questions
- AZD で異なる環境をどのように構成しますか？
- サービスプリンシパルよりもマネージド ID を使用する利点は何ですか？
- アプリケーションのシークレットをどのように安全に管理しますか？
- AZD の構成階層はどのようになっていますか？

---

### Chapter 4: Infrastructure as Code & Deployment (Week 4-5)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐⭐

#### Learning Objectives
- Bicep インフラストラクチャテンプレートを作成およびカスタマイズする
- 高度なデプロイパターンとワークフローを実装する
- リソースプロビジョニング戦略を理解する
- スケーラブルなマルチサービスアーキテクチャを設計する

- コンテナ化されたアプリケーションを Azure Container Apps と AZD を使用してデプロイする


#### Key Concepts to Master
- Bicep テンプレートの構造とベストプラクティス
- リソース依存関係とデプロイ順序
- パラメータファイルとテンプレートのモジュール化
- カスタムフックとデプロイ自動化
- コンテナアプリのデプロイパターン (クイックスタート、本番、マイクロサービス)

#### Practical Exercises
1. **Custom Template Creation**: Build a multi-service application template
2. **Bicep Mastery**: Create modular, reusable infrastructure components
3. **Deployment Automation**: Implement pre/post deployment hooks
4. **Architecture Design**: Deploy complex microservices architecture
5. **Container App Deployment**: Deploy the [シンプルな Flask API](../../../examples/container-app/simple-flask-api) and [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) examples using AZD

#### Assessment Questions
- AZD 用のカスタム Bicep テンプレートはどのように作成しますか？
- インフラコードを整理するためのベストプラクティスは何ですか？
- テンプレート内のリソース依存関係はどのように扱いますか？
- ダウンタイムゼロの更新をサポートするデプロイパターンは何ですか？

---

### Chapter 5: Multi-Agent AI Solutions (Week 6-7)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- マルチエージェント AI アーキテクチャを設計および実装する
- エージェントの協調と通信をオーケストレーションする
- モニタリングを備えた本番対応の AI ソリューションをデプロイする
- エージェントの専門化とワークフローパターンを理解する
- マルチエージェントソリューションの一部としてコンテナ化されたマイクロサービスを統合する

#### Key Concepts to Master
- マルチエージェントアーキテクチャのパターンと設計原則
- エージェント間の通信プロトコルとデータフロー
- AI エージェントのロードバランシングとスケーリング戦略
- マルチエージェントシステムの本番監視
- コンテナ化環境でのサービス間通信

#### Practical Exercises
1. **Retail Solution Deployment**: Deploy the complete multi-agent retail scenario
2. **Agent Customization**: Modify Customer and Inventory agent behaviors
3. **Architecture Scaling**: Implement load balancing and auto-scaling
4. **Production Monitoring**: Set up comprehensive monitoring and alerting
5. **Microservices Integration**: Extend the [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) example to support agent-based workflows

#### Assessment Questions
- 効果的なマルチエージェント通信パターンをどのように設計しますか？
- AI エージェントのワークロードをスケーリングする際の主要な考慮点は何ですか？
- マルチエージェント AI システムをどのように監視およびデバッグしますか？
- AI エージェントの信頼性を確保するための本番パターンは何ですか？

---

### Chapter 6: Pre-Deployment Validation & Planning (Week 8)
**Duration**: 1 hour | **Complexity**: ⭐⭐

#### Learning Objectives
- 包括的なキャパシティ計画とリソース検証を実行する
- コスト効率の高い最適な Azure SKU を選択する
- 自動化されたプリフライトチェックと検証を実装する
- コスト最適化戦略を含むデプロイ計画を作成する

#### Key Concepts to Master
- Azure リソースのクォータと容量制限
- SKU 選定基準とコスト最適化
- 自動検証スクリプトとテスト
- デプロイ計画とリスク評価

#### Practical Exercises
1. **Capacity Analysis**: Analyze resource requirements for your applications
2. **SKU Optimization**: Compare and select cost-effective service tiers
3. **Validation Automation**: Implement pre-deployment check scripts
4. **Cost Planning**: Create deployment cost estimates and budgets

#### Assessment Questions
- デプロイ前に Azure のキャパシティをどのように検証しますか？
- SKU 選択の決定に影響を与える要因は何ですか？
- プリデプロイ検証をどのように自動化しますか？
- デプロイコストを最適化するための戦略は何ですか？

---

### Chapter 7: Troubleshooting & Debugging (Week 9)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- AZD デプロイに対する体系的なデバッグ手法を構築する
- 一般的なデプロイおよび構成の問題を解決する
- AI 固有の問題とパフォーマンスの問題をデバッグする
- 事前検知のためのモニタリングとアラートを実装する

#### Key Concepts to Master
- 診断手法とロギング戦略
- 一般的な障害パターンとその解決策
- パフォーマンスモニタリングと最適化
- インシデント対応と復旧手順

#### Practical Exercises
1. **Diagnostic Skills**: Practice with intentionally broken deployments
2. **Log Analysis**: Use Azure Monitor and Application Insights effectively
3. **Performance Tuning**: Optimize slow-performing applications
4. **Recovery Procedures**: Implement backup and disaster recovery

#### Assessment Questions
- 最も一般的な AZD デプロイの失敗にはどのようなものがありますか？
- 認証および権限の問題をどのようにデバッグしますか？
- 本番問題を防ぐためのモニタリング戦略は何ですか？
- Azure でアプリケーションのパフォーマンスをどのように最適化しますか？

---

### Chapter 8: Production & Enterprise Patterns (Week 10-11)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- エンタープライズグレードのデプロイ戦略を実装する
- セキュリティパターンとコンプライアンスフレームワークを設計する
- モニタリング、ガバナンス、およびコスト管理を確立する
- AZD 統合によるスケーラブルな CI/CD パイプラインを作成する
- 本番向けコンテナアプリデプロイのベストプラクティスを適用する（セキュリティ、モニタリング、コスト、CI/CD）

#### Key Concepts to Master
- エンタープライズのセキュリティおよびコンプライアンス要件
- ガバナンスフレームワークとポリシー実装
- 高度なモニタリングとコスト管理
- CI/CD 統合と自動デプロイパイプライン
- コンテナ化ワークロードのブルーグリーンおよびカナリアデプロイ戦略

#### Practical Exercises
1. **Enterprise Security**: Implement comprehensive security patterns
2. **Governance Framework**: Set up Azure Policy and resource management
3. **Advanced Monitoring**: Create dashboards and automated alerting
4. **CI/CD Integration**: Build automated deployment pipelines
5. **Production Container Apps**: Apply security, monitoring, and cost optimization to the [マイクロサービスアーキテクチャ](../../../examples/container-app/microservices) example

#### Assessment Questions
- AZD デプロイでエンタープライズセキュリティをどのように実装しますか？
- コンプライアンスとコスト管理を確保するためのガバナンスパターンは何ですか？
- 本番システム向けにスケーラブルなモニタリングをどのように設計しますか？
- AZD ワークフローに適した CI/CD パターンは何ですか？

#### Learning Objectives
- Azure Developer CLI の基本とコア概念を理解する
- 開発環境に azd を正常にインストールおよび構成する
- 既存のテンプレートを使用して最初のデプロイを完了する
- azd プロジェクト構造をナビゲートし、主要コンポーネントを理解する

#### Key Concepts to Master
- テンプレート、環境、およびサービス
- azure.yaml 構成の構造
- 基本的な azd コマンド (init, up, down, deploy)
- Infrastructure as Code の原則
- Azure の認証と認可

#### Practice Exercises

**Exercise 1.1: Installation and Setup**
```bash
# 以下のタスクを完了してください:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# シンプルなウェブアプリケーションをデプロイする:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Project Structure Analysis**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Self-Assessment Questions
1. azd アーキテクチャの三つの主要概念は何ですか？
2. azure.yaml ファイルの目的は何ですか？
3. 環境は異なるデプロイ対象をどのように管理するのに役立ちますか？
4. azd で使用できる認証方法には何がありますか？
5. 初めて `azd up` を実行すると何が起こりますか？

---

## Progress Tracking and Assessment Framework
```bash
# 複数の環境を作成および構成する:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercise 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercise 2.3: Security Configuration**
```bash
# セキュリティのベストプラクティスを実装する:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Self-Assessment Questions
1. azd は環境変数の優先順位をどのように扱いますか？
2. デプロイフックとは何で、いつ使用すべきですか？
3. 異なる環境で異なる SKU をどのように構成しますか？
4. 異なる認証方法のセキュリティ上の影響は何ですか？
5. シークレットや機密構成データをどのように管理しますか？

### Module 3: Deployment and Provisioning (Week 4)

#### Learning Objectives
- デプロイワークフローとベストプラクティスを習得する
- Bicep テンプレートによる Infrastructure as Code を理解する
- 複雑なマルチサービスアーキテクチャを実装する
- デプロイのパフォーマンスと信頼性を最適化する

#### Key Concepts to Master
- Bicep テンプレートの構造とモジュール
- リソース依存関係と順序
- デプロイ戦略 (ブルーグリーン、ローリングアップデート)
- マルチリージョンデプロイ
- データベースのマイグレーションとデータ管理

#### Practice Exercises

**Exercise 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercise 3.2: Multi-Service Application**
```bash
# マイクロサービスアーキテクチャを展開する:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# データベースの展開パターンを実装する:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Self-Assessment Questions
1. Bicep を ARM テンプレートより使用する利点は何ですか？
2. azd デプロイでデータベースのマイグレーションをどのように処理しますか？
3. ダウンタイムゼロデプロイのための戦略にはどのようなものがありますか？
4. サービス間の依存関係はどのように管理しますか？
5. マルチリージョンデプロイでの考慮事項は何ですか？

### Module 4: Pre-Deployment Validation (Week 5)

#### Learning Objectives
- 包括的な事前デプロイチェックを実装する
- キャパシティプランニングとリソース検証を習得する
- SKUの選択とコスト最適化を理解する
- 自動化された検証パイプラインを構築する

#### 習得すべき主要概念
- Azure のリソースクォータと制限
- SKU 選択基準とコストへの影響
- 自動化された検証スクリプトとツール
- キャパシティプランニングの手法
- パフォーマンステストと最適化

#### 演習

**Exercise 4.1: Capacity Planning**
```bash
# 容量検証を実装する:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# 包括的な検証パイプラインを構築する:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# サービス構成を最適化する:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自己評価の質問
1. SKU 選択の決定に影響を与える要因は何ですか？
2. デプロイ前に Azure リソースの可用性をどのように検証しますか？
3. プリフライトチェックシステムの主要コンポーネントは何ですか？
4. デプロイコストをどのように見積もり、管理しますか？
5. キャパシティプランニングにとって重要な監視項目は何ですか？

### モジュール5: トラブルシューティングとデバッグ（6週目）

#### 学習目標
- 系統的なトラブルシューティング手法を習得する
- 複雑なデプロイ問題のデバッグに精通する
- 包括的な監視とアラートを実装する
- インシデント対応とリカバリ手順を構築する

#### 習得すべき主要概念
- 一般的なデプロイ失敗パターン
- ログ解析と相関手法
- パフォーマンス監視と最適化
- セキュリティインシデントの検出と対応
- 災害復旧と事業継続

#### 演習

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# よくある問題の解決を練習する：
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# 包括的な監視を設定する:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# インシデント対応手順を作成する:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自己評価の質問
1. azd デプロイのための系統的なトラブルシューティングのアプローチは何ですか？
2. 複数のサービスやリソースにまたがるログをどのように相関させますか？
3. 早期問題検出のために最も重要な監視メトリクスは何ですか？
4. 効果的な災害復旧手順をどのように実装しますか？
5. インシデント対応計画の主要コンポーネントは何ですか？

### モジュール6: 高度なトピックとベストプラクティス（7〜8週目）

#### 学習目標
- エンタープライズ向けのデプロイパターンを実装する
- CI/CD 統合と自動化を習得する
- カスタムテンプレートを開発しコミュニティに貢献する
- 高度なセキュリティとコンプライアンス要件を理解する

#### 習得すべき主要概念
- CI/CD パイプライン統合パターン
- カスタムテンプレートの開発と配布
- エンタープライズガバナンスとコンプライアンス
- 高度なネットワーキングとセキュリティ構成
- パフォーマンス最適化とコスト管理

#### 演習

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# カスタムテンプレートを作成して公開する:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# エンタープライズレベルの機能を実装する:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自己評価の質問
1. azd を既存の CI/CD ワークフローにどのように統合しますか？
2. カスタムテンプレート開発における主要な考慮事項は何ですか？
3. azd デプロイでガバナンスとコンプライアンスをどのように実装しますか？
4. エンタープライズ規模のデプロイにおけるベストプラクティスは何ですか？
5. azd コミュニティに効果的に貢献するにはどうすればよいですか？

## 実践プロジェクト

### Project 1: Personal Portfolio Website
**Complexity**: Beginner  
**Duration**: 1-2 weeks

個人ポートフォリオサイトを構築してデプロイする:
- Azure Storage 上での静的ウェブサイトホスティング
- カスタムドメインの設定
- グローバルパフォーマンスのための CDN 統合
- 自動デプロイパイプライン

**Deliverables**:
- Azure にデプロイされた稼働中のウェブサイト
- ポートフォリオデプロイ用のカスタム azd テンプレート
- デプロイ手順のドキュメント
- コスト分析と最適化の推奨事項

### Project 2: Task Management Application
**Complexity**: Intermediate  
**Duration**: 2-3 weeks

フルスタックのタスク管理アプリケーションを作成する:
- App Service にデプロイされた React フロントエンド
- 認証を備えた Node.js API バックエンド
- マイグレーションを行う PostgreSQL データベース
- Application Insights による監視

**Deliverables**:
- ユーザー認証を備えた完全なアプリケーション
- データベーススキーマとマイグレーションスクリプト
- 監視ダッシュボードとアラートルール
- マルチ環境デプロイ構成

### Project 3: Microservices E-commerce Platform
**Complexity**: Advanced  
**Duration**: 4-6 weeks

マイクロサービスベースの e コマースプラットフォームを設計・実装する:
- 複数の API サービス（カタログ、注文、決済、ユーザー）
- Service Bus を使用したメッセージキュー統合
- パフォーマンス最適化のための Redis キャッシュ
- 包括的なロギングと監視

**Reference Example**: See [Microservices Architecture](../../../examples/container-app/microservices) for a production-ready template and deployment guide

**Deliverables**:
- 完全なマイクロサービスアーキテクチャ
- サービス間通信パターン
- パフォーマンステストと最適化
- 本番対応のセキュリティ実装

## 評価と認定

### 知識チェック

各モジュールの後にこれらの評価を完了してください:

**Module 1 Assessment**: 基本概念とインストール
- コア概念に関する多肢選択問題
- 実践的なインストールと構成タスク
- 簡単なデプロイ演習

**Module 2 Assessment**: 構成と環境
- 環境管理シナリオ
- 構成トラブルシューティング演習
- セキュリティ構成の実装

**Module 3 Assessment**: デプロイとプロビジョニング
- インフラ設計の課題
- マルチサービスデプロイシナリオ
- パフォーマンス最適化演習

**Module 4 Assessment**: 事前デプロイ検証
- キャパシティプランニングのケーススタディ
- コスト最適化シナリオ
- 検証パイプラインの実装

**Module 5 Assessment**: トラブルシューティングとデバッグ
- 問題診断演習
- 監視実装タスク
- インシデント対応シミュレーション

**Module 6 Assessment**: 高度なトピック
- CI/CD パイプライン設計
- カスタムテンプレート開発
- エンタープライズアーキテクチャのシナリオ

### 最終キャップストーンプロジェクト

すべての概念の習得を示す完全なソリューションを設計・実装してください:

<strong>要件</strong>:
- マルチティアアプリケーションアーキテクチャ
- 複数のデプロイ環境
- 包括的な監視とアラート
- セキュリティとコンプライアンスの実装
- コスト最適化とパフォーマンスチューニング
- 完全なドキュメントとランブック

<strong>評価基準</strong>:
- 技術的実装の品質
- ドキュメントの完全性
- セキュリティとベストプラクティスの順守
- パフォーマンスとコスト最適化
- トラブルシューティングと監視の有効性

## 学習リソースと参考文献

### 公式ドキュメント
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep ドキュメント](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)

### コミュニティリソース
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 追加ツール
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 学習スケジュールの推奨

### フルタイム学習（8週間）
- **Week 1-2**: モジュール1-2（入門、構成）
- **Week 3-4**: モジュール3-4（デプロイ、事前デプロイ）
- **Week 5-6**: モジュール5-6（トラブルシューティング、高度なトピック）
- **Week 7-8**: 実践プロジェクトと最終評価

### パートタイム学習（16週間）
- **Week 1-4**: モジュール1（入門）
- **Week 5-7**: モジュール2（構成と環境）
- **Week 8-10**: モジュール3（デプロイとプロビジョニング）
- **Week 11-12**: モジュール4（事前デプロイ検証）
- **Week 13-14**: モジュール5（トラブルシューティングとデバッグ）
- **Week 15-16**: モジュール6（高度なトピックと評価）

---

## 進捗追跡と評価フレームワーク

### 章ごとの完了チェックリスト

各章を通じて、次の測定可能な成果で進捗を追跡してください:

#### 📚 Chapter 1: 基礎とクイックスタート
- [ ] <strong>インストール完了</strong>: AZD をインストールしてプラットフォームで検証した
- [ ] <strong>最初のデプロイ</strong>: todo-nodejs-mongo テンプレートを正常にデプロイした
- [ ] <strong>環境セットアップ</strong>: 最初の環境変数を構成した
- [ ] <strong>リソースナビゲーション</strong>: Azure ポータルでデプロイされたリソースを確認した
- [ ] <strong>コマンド習熟</strong>: 基本的な AZD コマンドに慣れている

#### 🤖 Chapter 2: AI ファースト開発
- [ ] **AI テンプレートデプロイ**: azure-search-openai-demo を正常にデプロイした
- [ ] **RAG 実装**: ドキュメントのインデックス化と検索を構成した
- [ ] <strong>モデル構成</strong>: 異なる目的の複数の AI モデルを設定した
- [ ] **AI 監視**: AI ワークロード向けに Application Insights を実装した
- [ ] <strong>パフォーマンス最適化</strong>: AI アプリケーションのパフォーマンスを調整した

#### ⚙️ Chapter 3: 構成と認証
- [ ] <strong>マルチ環境セットアップ</strong>: dev、staging、prod 環境を構成した
- [ ] <strong>セキュリティ実装</strong>: マネージドID認証を設定した
- [ ] <strong>シークレット管理</strong>: 機密データのために Azure Key Vault を統合した
- [ ] <strong>パラメータ管理</strong>: 環境固有の構成を作成した
- [ ] <strong>認証の習熟</strong>: 安全なアクセスパターンを実装した

#### 🏗️ Chapter 4: インフラストラクチャコード & デプロイ
- [ ] <strong>カスタムテンプレート作成</strong>: マルチサービスアプリケーションテンプレートを構築した
- [ ] **Bicep 習熟**: モジュール化された再利用可能なインフラコンポーネントを作成した
- [ ] <strong>デプロイ自動化</strong>: プリ／ポストデプロイフックを実装した
- [ ] <strong>アーキテクチャ設計</strong>: 複雑なマイクロサービスアーキテクチャをデプロイした
- [ ] <strong>テンプレート最適化</strong>: パフォーマンスとコストのためにテンプレートを最適化した

#### 🎯 Chapter 5: マルチエージェント AI ソリューション
- [ ] <strong>小売ソリューションデプロイ</strong>: 完全なマルチエージェント小売シナリオをデプロイした
- [ ] <strong>エージェントカスタマイズ</strong>: カスタマーおよびインベントリエージェントの挙動を変更した
- [ ] <strong>アーキテクチャのスケーリング</strong>: ロードバランシングとオートスケーリングを実装した
- [ ] <strong>本番監視</strong>: 包括的な監視とアラートを設定した
- [ ] <strong>パフォーマンスチューニング</strong>: マルチエージェントシステムのパフォーマンスを最適化した

#### 🔍 Chapter 6: 事前デプロイ検証と計画
- [ ] <strong>キャパシティ分析</strong>: アプリケーションのリソース要件を分析した
- [ ] **SKU 最適化**: コスト効率の良いサービス階層を選択した
- [ ] <strong>検証自動化</strong>: 事前デプロイチェックスクリプトを実装した
- [ ] <strong>コスト計画</strong>: デプロイコストの見積もりと予算を作成した
- [ ] <strong>リスク評価</strong>: デプロイリスクを特定し軽減した

#### 🚨 Chapter 7: トラブルシューティングとデバッグ
- [ ] <strong>診断スキル</strong>: 故意に壊されたデプロイを正常にデバッグした
- [ ] <strong>ログ分析</strong>: Azure Monitor と Application Insights を効果的に使用した
- [ ] <strong>パフォーマンスチューニング</strong>: パフォーマンスの低いアプリケーションを最適化した
- [ ] <strong>復旧手順</strong>: バックアップと災害復旧を実装した
- [ ] <strong>監視設定</strong>: 積極的な監視とアラートを作成した

#### 🏢 Chapter 8: 本番運用とエンタープライズパターン
- [ ] <strong>エンタープライズセキュリティ</strong>: 包括的なセキュリティパターンを実装した
- [ ] <strong>ガバナンスフレームワーク</strong>: Azure Policy とリソース管理を設定した
- [ ] <strong>高度な監視</strong>: ダッシュボードと自動アラートを作成した
- [ ] **CI/CD 統合**: 自動デプロイパイプラインを構築した
- [ ] <strong>コンプライアンス実装</strong>: エンタープライズのコンプライアンス要件を満たした

### 学習タイムラインとマイルストーン

#### Week 1-2: 基礎構築
- <strong>マイルストーン</strong>: AZD を使用して最初の AI アプリケーションをデプロイ
- <strong>検証</strong>: パブリック URL でアクセス可能な稼働中のアプリケーション
- <strong>スキル</strong>: 基本的な AZD ワークフローと AI サービス統合

#### Week 3-4: 構成の習熟
- <strong>マイルストーン</strong>: 安全な認証を伴うマルチ環境デプロイ
- <strong>検証</strong>: 同一アプリケーションが dev/staging/prod にデプロイされている
- <strong>スキル</strong>: 環境管理とセキュリティ実装

#### Week 5-6: インフラの専門知識
- <strong>マイルストーン</strong>: 複雑なマルチサービスアプリケーションのカスタムテンプレート
- <strong>検証</strong>: 別のチームメンバーが再利用できるテンプレートとしてデプロイできる
- <strong>スキル</strong>: Bicep の習熟とインフラ自動化

#### Week 7-8: 高度な AI 実装
- <strong>マイルストーン</strong>: 本番対応のマルチエージェント AI ソリューション
- <strong>検証</strong>: 監視下で実世界の負荷を処理できるシステム
- <strong>スキル</strong>: マルチエージェントオーケストレーションとパフォーマンス最適化

#### Week 9-10: 本番準備
- <strong>マイルストーン</strong>: 完全なコンプライアンスを備えたエンタープライズグレードのデプロイ
- <strong>検証</strong>: セキュリティレビューとコスト最適化監査を通過
- <strong>スキル</strong>: ガバナンス、監視、CI/CD 統合

### 評価と認定

#### 知識検証の方法
1. <strong>実践的なデプロイ</strong>: 各章のための稼働中アプリケーション
2. <strong>コードレビュー</strong>: テンプレートと構成の品質評価
3. <strong>問題解決</strong>: トラブルシューティングシナリオと解決策
4. <strong>ピアティーチング</strong>: 他の学習者に概念を説明する
5. <strong>コミュニティ貢献</strong>: テンプレートや改善を共有する

#### プロフェッショナル開発の成果
- <strong>ポートフォリオプロジェクト</strong>: 8 の本番対応デプロイ
- <strong>テクニカルスキル</strong>: 業界標準の AZD と AI デプロイの専門知識
- <strong>問題解決能力</strong>: 独立したトラブルシューティングと最適化
- <strong>コミュニティでの評価</strong>: Azure 開発者コミュニティへの積極的な参加
- <strong>キャリアの向上</strong>: クラウドおよび AI の職種に直接応用できるスキル

#### 成功指標
- <strong>デプロイ成功率</strong>: >95% のデプロイが成功
- <strong>トラブルシューティング時間</strong>: 一般的な問題は <30 分
- <strong>パフォーマンス最適化</strong>: コストとパフォーマンスの改善を実証
- <strong>セキュリティ準拠</strong>: すべてのデプロイが企業のセキュリティ基準を満たす
- <strong>知識移転</strong>: 他の開発者を指導できる能力

### 継続的な学習とコミュニティ参加

#### 最新情報の把握
- **Azure Updates**: Azure Developer CLI のリリースノートをフォローする
- **Community Events**: Azure および AI 開発者向けイベントに参加する
- **Documentation**: コミュニティ向けのドキュメントやサンプルに貢献する
- **Feedback Loop**: コース内容や Azure サービスにフィードバックを提供する

#### キャリア開発
- **Professional Network**: Azure と AI の専門家とつながる
- **Speaking Opportunities**: カンファレンスやミートアップで学んだことを発表する機会
- **Open Source Contribution**: AZD テンプレートやツールに貢献する
- **Mentorship**: 他の開発者の AZD 学習を導く

---

**章ナビゲーション:**
- **📚 コースホーム**: [AZD 入門](../README.md)
- **📖 学習開始**: [第1章: 基礎とクイックスタート](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進捗追跡**: 総合的な8章構成の学習システムで自分の進捗を追跡する
- **🤝 コミュニティ**: [Azure Discord](https://discord.gg/microsoft-azure) でサポートや議論を行う

<strong>学習進捗の追跡</strong>: この構造化されたガイドを利用して、段階的かつ実践的な学習を通じて Azure Developer CLI を習得し、測定可能な成果と職業的成長の利点を得る。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
この文書はAI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性に努めていますが、自動翻訳には誤りや不正確さが含まれる場合があることにご注意ください。原文（その母語で書かれた文書）を権威ある情報源としてご参照ください。重要な情報については、専門家による翻訳を推奨します。本翻訳の利用によって生じたいかなる誤解や解釈の相違についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->