<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T15:15:38+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ja"
}
-->
# 小売業向けマルチエージェントソリューション - ARMテンプレートデプロイ

**第5章: 本番デプロイパッケージ**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 関連章**: [第5章: マルチエージェントAIソリューション](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 シナリオガイド**: [完全実装](../retail-scenario.md)
- **🎯 クイックデプロイ**: [ワンクリックデプロイ](../../../../examples/retail-multiagent-arm-template)

このディレクトリには、小売業向けマルチエージェント顧客サポートソリューションをデプロイするための完全なAzure Resource Manager (ARM) テンプレートが含まれています。これにより、アーキテクチャ全体をコードとして提供します。

## 🎯 デプロイされる内容

### コアインフラストラクチャ
- **Azure OpenAI Services** (高可用性のためのマルチリージョン)
  - プライマリリージョン: 顧客エージェント用GPT-4o
  - セカンダリリージョン: 在庫エージェント用GPT-4o-mini  
  - 第三リージョン: テキスト埋め込みモデル
  - 評価リージョン: GPT-4o評価モデル
- **Azure AI Search** (ベクトル検索機能付き)
- **Azure Storage Account** (ドキュメントとアップロード用のBlobコンテナ)
- **Azure Container Apps Environment** (自動スケーリング対応)
- **Container Apps** (エージェントルーターとフロントエンド用)
- **Azure Cosmos DB** (チャット履歴の保存用)
- **Azure Key Vault** (シークレット管理、オプション)
- **Application Insights** と Log Analytics (モニタリング用、オプション)
- **Document Intelligence** (ドキュメント処理用)
- **Bing Search API** (リアルタイム情報取得用)

### デプロイモード

| モード | 説明 | 使用ケース | リソース |
|-------|------|-----------|----------|
| **Minimal** | コスト最適化された基本デプロイ | 開発、テスト | 基本SKU、単一リージョン、容量削減 |
| **Standard** | 本番ワークロード向けのバランス型デプロイ | 本番、中規模スケール | 標準SKU、マルチリージョン、標準容量 |
| **Premium** | 高性能、エンタープライズ向けデプロイ | エンタープライズ、大規模スケール | プレミアムSKU、マルチリージョン、高容量 |

## 📋 前提条件

1. **Azure CLI** がインストールされ、設定済み
2. **有効なAzureサブスクリプション** (十分なクォータが必要)
3. **ターゲットサブスクリプションでリソースを作成する権限**
4. **リソースクォータ**:
   - Azure OpenAI (リージョンの利用可能性を確認)
   - Container Apps (リージョンによって異なる)
   - AI Search (標準ティア以上を推奨)

## 🚀 クイックデプロイ

### オプション1: Azure CLIを使用

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### オプション2: Azureポータルを使用

[![Azureにデプロイ](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### オプション3: Azure CLIを直接使用

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ 設定オプション

### テンプレートパラメータ

| パラメータ | 型 | デフォルト | 説明 |
|-----------|----|-----------|------|
| `projectName` | string | "retail" | すべてのリソース名のプレフィックス |
| `location` | string | リソースグループの場所 | プライマリデプロイリージョン |
| `secondaryLocation` | string | "westus2" | マルチリージョンデプロイのセカンダリリージョン |
| `tertiaryLocation` | string | "francecentral" | 埋め込みモデル用リージョン |
| `environmentName` | string | "dev" | 環境指定 (dev/staging/prod) |
| `deploymentMode` | string | "standard" | デプロイ構成 (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | マルチリージョンデプロイを有効化 |
| `enableMonitoring` | bool | true | Application Insightsとログを有効化 |
| `enableSecurity` | bool | true | Key Vaultと強化されたセキュリティを有効化 |

### パラメータのカスタマイズ

`azuredeploy.parameters.json` を編集:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ アーキテクチャ概要

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 デプロイスクリプトの使用方法

`deploy.sh` スクリプトはインタラクティブなデプロイ体験を提供します:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### スクリプトの特徴

- ✅ **前提条件の検証** (Azure CLI、ログイン状態、テンプレートファイル)
- ✅ **リソースグループ管理** (存在しない場合は作成)
- ✅ **テンプレート検証** (デプロイ前)
- ✅ **進捗モニタリング** (カラー出力付き)
- ✅ **デプロイ出力** の表示
- ✅ **デプロイ後のガイダンス**

## 📊 デプロイのモニタリング

### デプロイ状況の確認

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### デプロイ出力

デプロイが成功すると、以下の出力が利用可能になります:

- **フロントエンドURL**: Webインターフェースの公開エンドポイント
- **ルーターURL**: エージェントルーターのAPIエンドポイント
- **OpenAIエンドポイント**: プライマリおよびセカンダリOpenAIサービスエンドポイント
- **検索サービス**: Azure AI Searchサービスエンドポイント
- **ストレージアカウント**: ドキュメント用ストレージアカウント名
- **Key Vault**: Key Vaultの名前 (有効化されている場合)
- **Application Insights**: モニタリングサービスの名前 (有効化されている場合)

## 🔧 デプロイ後の設定

### 1. 検索インデックスの設定

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. 初期データのアップロード

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. エージェントエンドポイントのテスト

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. コンテナアプリの設定

ARMテンプレートはプレースホルダーコンテナイメージをデプロイします。実際のエージェントコードをデプロイするには:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ トラブルシューティング

### よくある問題

#### 1. Azure OpenAIクォータ超過

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. コンテナアプリのデプロイ失敗

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. 検索サービスの初期化

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### デプロイの検証

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 セキュリティに関する考慮事項

### キー管理
- すべてのシークレットはAzure Key Vaultに保存されます (有効化されている場合)
- コンテナアプリはマネージドIDを使用して認証します
- ストレージアカウントはセキュアなデフォルト設定 (HTTPSのみ、公開Blobアクセスなし)

### ネットワークセキュリティ
- コンテナアプリは可能な限り内部ネットワークを使用
- 検索サービスはプライベートエンドポイントオプションで設定
- Cosmos DBは必要最低限の権限で設定

### RBAC設定
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 コスト最適化

### コスト見積もり (月額、USD)

| モード | OpenAI | コンテナアプリ | 検索 | ストレージ | 合計推定 |
|-------|--------|----------------|------|-----------|----------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### コストモニタリング

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 更新とメンテナンス

### テンプレートの更新
- ARMテンプレートファイルをバージョン管理
- 開発環境で変更をテスト
- 更新にはインクリメンタルデプロイモードを使用

### リソースの更新
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### バックアップとリカバリー
- Cosmos DBの自動バックアップが有効
- Key Vaultのソフトデリートが有効
- コンテナアプリのリビジョンが保持され、ロールバック可能

## 📞 サポート

- **テンプレートの問題**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azureサポート**: [Azureサポートポータル](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **コミュニティ**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ マルチエージェントソリューションのデプロイ準備は整いましたか？**

以下を開始: `./deploy.sh -g myResourceGroup`

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。元の言語で記載された原文を信頼できる情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤認について、当社は一切の責任を負いません。