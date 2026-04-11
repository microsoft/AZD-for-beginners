# 5. テンプレートのカスタマイズ

!!! tip "このモジュールの終了時には以下ができるようになります"

    - [ ] 既定のAIエージェントの機能を確認した
    - [ ] 独自のインデックスでAI検索を追加した
    - [ ] トレーシングのメトリクスを有効化して分析した
    - [ ] 評価実行を実施した
    - [ ] レッドチーミングスキャンを実行した
    - [ ] **ラボ5: カスタマイズ計画を作成した** 

---

## 5.1 AI エージェントの機能

!!! success "ラボ01で完了しました"

- **File Search**: OpenAIの組み込みファイル検索による知識取得
- **Citations**: 応答における自動的な情報源の帰属
- **Customizable Instructions**: エージェントの動作やパーソナリティを変更可能
- **Tool Integration**: カスタム機能のための拡張可能なツールシステム

---

## 5.2 知識取得のオプション

!!! task "これを完了するには変更して再デプロイする必要があります"    
    
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
- 追加の構成は不要

**Azure AI Search (Optional):**

- セマンティック検索とベクトル検索のハイブリッド
- カスタムインデックス管理
- 高度な検索機能
- 必要: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [トレーシングと監視](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "これを完了するには変更して再デプロイする必要があります"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**トレーシング:**

- OpenTelemetry の統合
- リクエスト/レスポンスの追跡
- パフォーマンス指標
- Microsoft Foundry ポータルで利用可能

**ログ:**

- Container Apps のアプリケーションログ
- 相関 ID を用いた構造化ログ
- リアルタイムおよび履歴ログの閲覧

---

## 5.4 [エージェント評価](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**ローカル評価:**

- 品質評価のための組み込み評価ツール
- カスタム評価スクリプト
- パフォーマンスベンチマーク

**継続的モニタリング:**

- ライブ対話の自動評価
- 品質指標の追跡
- パフォーマンス回帰の検出

**CI/CD 統合:**

- GitHub Actions ワークフロー
- 自動テストと評価
- 統計的比較テスト

---

## 5.5 [AI レッドチーミング エージェント](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI レッドチーミング:**

- 自動化されたセキュリティスキャン
- AI システムのリスク評価
- 複数のカテゴリーにわたる安全性評価

**認証:**

- Azure サービス用のマネージド ID
- 任意の Azure App Service 認証
- 開発用のベーシック認証フォールバック



!!! quote "このラボの終了時に以下を達成しているはずです"
    - [ ] シナリオ要件を定義した
    - [ ] 環境変数をカスタマイズした（config）
    - [ ] エージェント指示をカスタマイズした（task）
    - [ ] カスタマイズしたテンプレートをデプロイした（app）
    - [ ] デプロイ後の手動タスクを完了した（manual）
    - [ ] テスト評価を実行した

この例は、2つの専門エージェントと複数のモデルデプロイメントを用いたエンタープライズ向け小売ユースケース向けにテンプレートをカスタマイズする方法を示しています。

---

## 5.6 あなた向けにカスタマイズ!

### 5.6.1. シナリオ要件

#### **Agent Deployments:** 

   - Shopper Agent: 顧客が製品を検索および比較するのを支援する
   - Loyalty Agent: 顧客の報酬とプロモーションを管理する

#### **Model Deployments:**

   - `gpt-4.1`: プライマリーチャットモデル
   - `o3`: 複雑なクエリ向けの推論モデル
   - `gpt-4.1-nano`: 単純なやり取り向けの軽量モデル
   - `text-embedding-3-large`: 検索向けの高品質な埋め込み

#### **Features:**

   - トレーシングとモニタリングが有効化されている
   - 製品カタログのためのAI検索
   - 品質保証のための評価フレームワーク
   - セキュリティ検証のためのレッドチーミング

---

### 5.6.2 シナリオ実装


#### 5.6.2.1. デプロイ前の設定

Create a setup script (`setup-retail.sh`)

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

# 主要チャットモデルを設定する（gpt-4.1はgpt-4.1に最も近い利用可能モデルとして）
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 検索機能を強化するための埋め込みモデルを設定する
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

#### 5.6.2.2: エージェント指示

Create `custom-agents/shopper-agent-instructions.md`:

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

Create `custom-agents/loyalty-agent-instructions.md`:

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

Create `deploy-retail.sh`:

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

# 環境を設定する
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

# インフラとアプリケーションをデプロイする
echo "🏗️  Deploying Azure infrastructure..."
azd up

# デプロイの出力を取得する
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# WebアプリのURLを取得する
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')

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

#### 5.6.2.4: デプロイ後の設定

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# デプロイ情報を取得する
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

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 環境変数が設定されていることを確認する
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Webアプリケーションの可用性をテストする
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')
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

# 設定されている場合は評価を実行する
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

### 5.6.4 期待される成果

After following this implementation guide, you will have:

1. **デプロイされたインフラストラクチャ:**

      - モデルデプロイメントを備えた Microsoft Foundry プロジェクト
      - Web アプリケーションをホストする Container Apps
      - 製品カタログ用の AI Search サービス
      - 監視用の Application Insights

2. **初期エージェント:**

      - 基本指示で構成された Shopper Agent
      - ファイル検索機能が有効化されている
      - トレーシングとモニタリングが設定されている

3. **カスタマイズ準備完了:**

      - Loyalty Agent を追加するためのフレームワーク
      - カスタム指示テンプレート
      - テストおよび検証スクリプト
      - モニタリングと評価の設定

4. **本番準備:**

      - レッドチーミングによるセキュリティスキャン
      - パフォーマンス監視
      - 品質評価フレームワーク
      - スケーラブルなアーキテクチャ

この例は、セキュリティ、監視、スケーラビリティに関するベストプラクティスを維持しながら、AZD テンプレートを特定のエンタープライズシナリオ向けに拡張およびカスタマイズする方法を示しています。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な表現が含まれる場合がありますのでご注意ください。原文（原言語の文書）を正本として参照してください。重要な情報については、専門の翻訳者による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->