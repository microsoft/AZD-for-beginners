# 5. テンプレートのカスタマイズ

!!! tip "このモジュールの終了時には次のことができるようになります"

    - [ ] デフォルトの AI エージェント機能を調査した
    - [ ] 独自のインデックスで AI 検索を追加した
    - [ ] トレース指標を有効化して分析した
    - [ ] 評価実行を行った
    - [ ] レッドチーミングスキャンを実行した
    - [ ] **Lab 5: カスタマイズ計画を作成した** 

---

## 5.1 AI エージェントの機能

!!! success "Lab 01でこれを完了しました"

- <strong>ファイル検索</strong>: 知識取得のための OpenAI 組み込みファイル検索
- <strong>引用</strong>: 応答における自動ソース帰属
- <strong>カスタマイズ可能な指示</strong>: エージェントの動作や性格を変更する
- <strong>ツール統合</strong>: カスタム機能のための拡張可能なツールシステム

---

## 5.2 知識取得オプション

!!! task "これを完了するには変更を行い再デプロイする必要があります"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Foundry Agents に組み込まれている
- ドキュメントの自動処理とインデックス作成
- 追加設定不要

**Azure AI Search (Optional):**

- ハイブリッドなセマンティック検索とベクトル検索
- カスタムインデックス管理
- 高度な検索機能
- 利用には `USE_AZURE_AI_SEARCH_SERVICE=true` が必要

---

## 5.3 [トレースとモニタリング](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "これを完了するには変更を行い再デプロイする必要があります"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**トレース:**

- OpenTelemetry 統合
- 要求/応答の追跡
- パフォーマンス指標
- Microsoft Foundry ポータルで利用可能

**ロギング:**

- Container Apps のアプリケーションログ
- 相関 ID を用いた構造化ログ
- リアルタイムおよび履歴ログの閲覧

---

## 5.4 [エージェントの評価](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ローカル評価:**

- 品質評価のための組み込み評価器
- カスタム評価スクリプト
- パフォーマンスベンチマーク

**継続的モニタリング:**

- ライブインタラクションの自動評価
- 品質指標の追跡
- パフォーマンス回帰の検出

**CI/CD 統合:**

- GitHub Actions ワークフロー
- 自動テストと評価
- 統計的比較テスト

---

## 5.5 [AI レッドチーミングエージェント](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI レッドチーミング:**

- 自動化されたセキュリティスキャン
- AI システムのリスク評価
- 複数カテゴリにわたる安全性評価

**認証:**

- Azure サービス用のマネージド ID
- オプションの Azure App Service 認証
- 開発用の基本認証フォールバック



!!! quote "このラボの終了時にあなたが持っているべきもの"
    - [ ] シナリオ要件を定義する
    - [ ] 環境変数（config）をカスタマイズする
    - [ ] エージェント指示（task）をカスタマイズする
    - [ ] カスタマイズされたテンプレートをデプロイする（app）
    - [ ] デプロイ後のタスクを完了する（manual）
    - [ ] テスト評価を実行する

この例は、小売企業向けユースケースのテンプレートをカスタマイズし、2つの専門エージェントと複数のモデルデプロイメントを組み合わせる方法を示しています。

---

## 5.6 あなた向けにカスタマイズ！

### 5.6.1. シナリオ要件

#### **エージェントのデプロイ:** 

   - Shopper Agent: 顧客が製品を見つけ比較するのを支援する
   - Loyalty Agent: 顧客の報酬とプロモーションを管理する

#### **モデルのデプロイ:**

   - `gpt-4.1`: プライマリのチャットモデル
   - `o3`: 複雑なクエリ向けの推論モデル
   - `gpt-4.1-nano`: 単純なやり取り向けの軽量モデル
   - `text-embedding-3-large`: 検索用の高品質な埋め込み

#### **機能:**

   - トレースとモニタリングを有効化
   - 製品カタログのための AI Search
   - 品質保証のための評価フレームワーク
   - セキュリティ検証のためのレッドチーミング

---

### 5.6.2 シナリオ実装


#### 5.6.2.1. 事前デプロイ設定

セットアップスクリプトを作成する (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# 環境名を設定する
azd env set AZURE_ENV_NAME "retail-ai-agents"

# リージョンを設定する（モデルの利用可能性に基づいて選択）
azd env set AZURE_LOCATION "eastus2"

# すべてのオプションサービスを有効にする
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# 主要チャットモデルを設定する（gpt-4.1はgpt-4.1に最も近い利用可能なモデルとして）
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 強化された検索のための埋め込みモデルを設定する
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# エージェント名を設定する（最初のエージェントが作成されます）
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# 検索インデックスを設定する
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: エージェントの指示

`custom-agents/shopper-agent-instructions.md` を作成する：

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

`custom-agents/loyalty-agent-instructions.md` を作成する：

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

#### 5.6.2.3: デプロイスクリプト

`deploy-retail.sh` を作成する：

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# 前提条件を検証する
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# 環境をセットアップする
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# 選択したリージョンのクォータを確認する
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# インフラストラクチャとアプリケーションをデプロイする
echo "🏗️  Deploying Azure infrastructure..."
azd up

# デプロイの出力を取得する
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# WebアプリのURLを取得する
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: デプロイ後の構成

`configure-retail-agents.sh` を作成する：

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# デプロイメント情報を取得する
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# 手動設定の手順
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
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
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: テストと検証

`test-retail-deployment.sh` を作成する：

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 環境変数が設定されていることを確認する
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Webアプリケーションの可用性をテストする
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

# 設定されていれば評価を実行する
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
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 期待される結果

この実装ガイドに従うと、以下が得られます:

1. **デプロイ済みインフラストラクチャ:**

      - モデルデプロイメントを含む Microsoft Foundry プロジェクト
      - Web アプリケーションをホストする Container Apps
      - 製品カタログ用の AI Search サービス
      - 監視用の Application Insights

2. **初期エージェント:**

      - 基本指示で構成された Shopper Agent
      - ファイル検索機能が有効化された
      - トレースとモニタリングが設定された

3. **カスタマイズの準備完了:**

      - Loyalty Agent を追加するためのフレームワーク
      - カスタム指示テンプレート
      - テストと検証用スクリプト
      - モニタリングと評価の設定

4. **本番稼働準備:**

      - レッドチーミングによるセキュリティスキャン
      - パフォーマンス監視
      - 品質評価フレームワーク
      - スケーラブルなアーキテクチャ

この例は、AZD テンプレートを特定のエンタープライズシナリオ向けに拡張およびカスタマイズしつつ、セキュリティ、モニタリング、およびスケーラビリティのベストプラクティスを維持する方法を示しています。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確さが含まれる可能性があることにご注意ください。原文（原言語の文書）を権威ある情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用により生じた誤解や誤訳について、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->