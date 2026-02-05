# 5. テンプレートのカスタマイズ

!!! tip "このモジュールを終えると以下ができるようになります"

    - [ ] デフォルトのAIエージェント機能を探索する
    - [ ] 独自のインデックスを使用してAI検索を追加する
    - [ ] トレーシングメトリクスを有効化し分析する
    - [ ] 評価実行を実施する
    - [ ] レッドチーミングスキャンを実施する
    - [ ] **ラボ5: カスタマイズプランを構築する**

---

## 5.1 AIエージェント機能

!!! success "これはラボ01で完了しました"

- **ファイル検索**: OpenAIの組み込みファイル検索による知識取得
- **引用**: 応答内での自動的なソースの帰属
- **カスタマイズ可能な指示**: エージェントの動作や性格を変更可能
- **ツール統合**: カスタム機能のための拡張可能なツールシステム

---

## 5.2 知識取得オプション

!!! task "これを完了するには変更を加え再デプロイする必要があります"    
    
    ```bash title=""
    # 環境変数を設定
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # データをアップロードしインデックスを作成
    ```

---

**OpenAIファイル検索（デフォルト）:**

- Azure AIエージェントサービスに組み込み
- 自動的なドキュメント処理とインデックス作成
- 追加の設定は不要

**Azure AI検索（オプション）:**

- ハイブリッドセマンティックおよびベクトル検索
- カスタムインデックス管理
- 高度な検索機能
- `USE_AZURE_AI_SEARCH_SERVICE=true`が必要

---

## 5.3 [トレーシングとモニタリング](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "これを完了するには変更を加え再デプロイする必要があります"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**トレーシング:**

- OpenTelemetry統合
- リクエスト/レスポンスの追跡
- パフォーマンスメトリクス
- AI Foundryポータルで利用可能

**ログ記録:**

- Container Apps内のアプリケーションログ
- 相関IDを使用した構造化ログ
- リアルタイムおよび履歴ログの閲覧

---

## 5.4 [エージェント評価](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ローカル評価:**

- 品質評価のための組み込み評価ツール
- カスタム評価スクリプト
- パフォーマンスベンチマーク

**継続的モニタリング:**

- ライブインタラクションの自動評価
- 品質メトリクスの追跡
- パフォーマンスの退行検出

**CI/CD統合:**

- GitHub Actionsワークフロー
- 自動テストと評価
- 統計的比較テスト

---

## 5.5 [AIレッドチーミングエージェント](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AIレッドチーミング:**

- 自動セキュリティスキャン
- AIシステムのリスク評価
- 複数カテゴリにわたる安全性評価

**認証:**

- AzureサービスのマネージドID
- オプションのAzure App Service認証
- 開発用の基本認証フォールバック

!!! quote "このラボを終えると以下が完了しているはずです"
    - [ ] シナリオ要件を定義する
    - [ ] 環境変数をカスタマイズする（設定）
    - [ ] エージェント指示をカスタマイズする（タスク）
    - [ ] カスタマイズされたテンプレートをデプロイする（アプリ）
    - [ ] デプロイ後のタスクを完了する（手動）
    - [ ] テスト評価を実施する

この例では、2つの専門エージェントと複数のモデルデプロイメントを備えた企業向け小売ユースケースのためにテンプレートをカスタマイズする方法を示しています。

---

## 5.6 あなたのためにカスタマイズ！

### 5.6.1 シナリオ要件

#### **エージェントデプロイメント:** 

   - ショッパーエージェント: 顧客が製品を見つけ比較するのを支援
   - ロイヤルティエージェント: 顧客の報酬とプロモーションを管理

#### **モデルデプロイメント:**

   - `gpt-4.1`: 主なチャットモデル
   - `o3`: 複雑なクエリのための推論モデル
   - `gpt-4.1-nano`: 簡単なインタラクションのための軽量モデル
   - `text-embedding-3-large`: 検索のための高品質な埋め込み

#### **機能:**

   - トレーシングとモニタリングを有効化
   - 製品カタログのためのAI検索
   - 品質保証のための評価フレームワーク
   - セキュリティ検証のためのレッドチーミング

---

### 5.6.2 シナリオ実装

#### 5.6.2.1 デプロイ前の設定

セットアップスクリプトを作成 (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2 エージェント指示

`custom-agents/shopper-agent-instructions.md`を作成:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

`custom-agents/loyalty-agent-instructions.md`を作成:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3 デプロイメントスクリプト

`deploy-retail.sh`を作成:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4 デプロイ後の設定

`configure-retail-agents.sh`を作成:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in AI Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3 テストと検証

`test-retail-deployment.sh`を作成:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Run evaluation if configured
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 期待される成果

この実装ガイドに従うことで以下が達成されます:

1. **インフラのデプロイ:**

      - モデルデプロイメントを備えたAI Foundryプロジェクト
      - WebアプリケーションをホスティングするContainer Apps
      - 製品カタログのためのAI検索サービス
      - モニタリングのためのApplication Insights

2. **初期エージェント:**

      - 基本指示で構成されたショッパーエージェント
      - ファイル検索機能を有効化
      - トレーシングとモニタリングを構成

3. **カスタマイズの準備:**

      - ロイヤルティエージェントを追加するためのフレームワーク
      - カスタム指示テンプレート
      - テストと検証スクリプト
      - モニタリングと評価のセットアップ

4. **本番準備:**

      - レッドチーミングによるセキュリティスキャン
      - パフォーマンスモニタリング
      - 品質評価フレームワーク
      - スケーラブルなアーキテクチャ

この例では、AZDテンプレートを特定の企業シナリオに拡張しカスタマイズする方法を示し、セキュリティ、モニタリング、スケーラビリティのベストプラクティスを維持します。

---

