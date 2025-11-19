<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-19T20:45:34+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "ja"
}
-->
# AZDを使ったコンテナアプリのデプロイ例

このディレクトリには、Azure Developer CLI (AZD) を使用して Azure Container Apps にコンテナ化されたアプリケーションをデプロイするための包括的な例が含まれています。これらの例は、実際のパターン、ベストプラクティス、および本番環境向けの設定を示しています。

## 📚 目次

- [概要](../../../../examples/container-app)
- [前提条件](../../../../examples/container-app)
- [クイックスタート例](../../../../examples/container-app)
- [本番環境向け例](../../../../examples/container-app)
- [高度なパターン](../../../../examples/container-app)
- [ベストプラクティス](../../../../examples/container-app)

## 概要

Azure Container Apps は、インフラ管理を必要とせずにマイクロサービスやコンテナ化されたアプリケーションを実行できる完全管理型のサーバーレスコンテナプラットフォームです。AZDと組み合わせることで、以下の利点があります：

- **簡単なデプロイ**: 単一コマンドでインフラとコンテナをデプロイ
- **自動スケーリング**: HTTPトラフィックやイベントに基づいてゼロからスケールアウト
- **統合ネットワーキング**: 組み込みのサービスディスカバリーとトラフィック分割
- **マネージドID**: Azureリソースへの安全な認証
- **コスト最適化**: 使用したリソース分だけ支払い

## 前提条件

始める前に、以下を確認してください：

```bash
# AZDのインストールを確認
azd version

# Azure CLIを確認
az version

# Dockerを確認（カスタムイメージのビルド用）
docker --version

# Azureにログイン
azd auth login
az login
```

**必要なAzureリソース:**
- 有効なAzureサブスクリプション
- リソースグループ作成権限
- Container Apps環境へのアクセス

## クイックスタート例

### 1. シンプルなWeb API (Python Flask)

Azure Container Appsで基本的なREST APIをデプロイします。

**例: Python Flask API**

```yaml
# azure.yaml
name: flask-api-demo
metadata:
  template: flask-api-demo@0.0.1-beta
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
```

**デプロイ手順:**

```bash
# テンプレートから初期化する
azd init --template todo-python-mongo

# インフラをプロビジョニングしてデプロイする
azd up

# デプロイをテストする
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**主な特徴:**
- 0から10レプリカまでの自動スケーリング
- ヘルスプローブとリブネスチェック
- 環境変数の注入
- Application Insightsとの統合

### 2. Node.js Express API

MongoDB統合を備えたNode.jsバックエンドをデプロイします。

```bash
# Node.js APIテンプレートを初期化する
azd init --template todo-nodejs-mongo

# 環境変数を設定する
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# デプロイする
azd up

# ログを表示する
azd logs api
```

**インフラのハイライト:**
```bicep
// Bicep snippet from infra/main.bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-${resourceToken}'
  location: location
  properties: {
    managedEnvironmentId: containerEnv.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
        transport: 'auto'
      }
      secrets: [
        {
          name: 'mongodb-connection'
          value: mongoConnection
        }
      ]
    }
    template: {
      containers: [
        {
          name: 'api'
          image: containerImage
          env: [
            {
              name: 'DATABASE_URL'
              secretRef: 'mongodb-connection'
            }
          ]
        }
      ]
      scale: {
        minReplicas: 0
        maxReplicas: 10
      }
    }
  }
}
```

### 3. 静的フロントエンド + APIバックエンド

ReactフロントエンドとAPIバックエンドを備えたフルスタックアプリケーションをデプロイします。

```bash
# フルスタックテンプレートを初期化する
azd init --template todo-csharp-sql-swa-func

# 設定を確認する
cat azure.yaml

# 両方のサービスをデプロイする
azd up

# アプリケーションを開く
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## 本番環境向け例

### 例1: マイクロサービスアーキテクチャ

**シナリオ**: 複数のマイクロサービスを持つEコマースアプリケーション

**ディレクトリ構造:**
```
microservices-demo/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── container-env.bicep
│   │   ├── product-service.bicep
│   │   ├── order-service.bicep
│   │   └── payment-service.bicep
│   └── core/
│       ├── storage.bicep
│       └── database.bicep
└── src/
    ├── product-service/
    ├── order-service/
    └── payment-service/
```

**azure.yamlの設定:**
```yaml
name: microservices-ecommerce
services:
  product-service:
    project: ./src/product-service
    language: python
    host: containerapp
    
  order-service:
    project: ./src/order-service
    language: csharp
    host: containerapp
    
  payment-service:
    project: ./src/payment-service
    language: nodejs
    host: containerapp
```

**デプロイ:**
```bash
# プロジェクトを初期化する
azd init

# 本番環境を設定する
azd env new production

# 本番設定を構成する
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# すべてのサービスをデプロイする
azd up

# デプロイを監視する
azd monitor --overview
```

### 例2: AI対応コンテナアプリ

**シナリオ**: Azure OpenAI統合を備えたAIチャットアプリケーション

**ファイル: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# セキュアなアクセスのためにマネージドIDを使用する
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key VaultからOpenAIキーを取得する
    openai_key = client.get_secret("openai-api-key").value
    openai.api_key = openai_key
    
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_message}]
    )
    
    return jsonify({"response": response.choices[0].message.content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**ファイル: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ファイル: infra/main.bicep**
```bicep
param location string = resourceGroup().location
param environmentName string

var resourceToken = uniqueString(subscription().id, environmentName, location)

// Container Apps Environment
module containerEnv './app/container-env.bicep' = {
  name: 'container-env-${resourceToken}'
  params: {
    location: location
    environmentName: environmentName
  }
}

// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'kv-${resourceToken}'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
  }
}

// Container App with Managed Identity
module aiChatApp './app/container-app.bicep' = {
  name: 'ai-chat-app-${resourceToken}'
  params: {
    location: location
    environmentId: containerEnv.outputs.environmentId
    containerImage: 'your-registry.azurecr.io/ai-chat:latest'
    keyVaultName: keyVault.name
  }
}
```

**デプロイコマンド:**
```bash
# 環境を設定する
azd init --template ai-chat-app
azd env new dev

# OpenAIを構成する
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# デプロイする
azd up

# APIをテストする
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### 例3: キュー処理を行うバックグラウンドワーカー

**シナリオ**: メッセージキューを使用した注文処理システム

**ディレクトリ構造:**
```
queue-worker/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── api.bicep
│   │   └── worker.bicep
│   └── core/
│       ├── storage-queue.bicep
│       └── servicebus.bicep
└── src/
    ├── api/
    └── worker/
```

**ファイル: src/worker/processor.py**
```python
import os
from azure.storage.queue import QueueClient
from azure.identity import DefaultAzureCredential

def process_orders():
    credential = DefaultAzureCredential()
    queue_url = os.getenv('AZURE_QUEUE_URL')
    
    queue_client = QueueClient.from_queue_url(
        queue_url=queue_url,
        credential=credential
    )
    
    while True:
        messages = queue_client.receive_messages(max_messages=10)
        for message in messages:
            # 注文を処理する
            print(f"Processing order: {message.content}")
            
            # メッセージを完了する
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ファイル: azure.yaml**
```yaml
name: order-processing
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    
  worker:
    project: ./src/worker
    language: python
    host: containerapp
```

**デプロイ:**
```bash
# 初期化
azd init

# キュー構成でデプロイ
azd up

# キューの長さに基づいてワーカーをスケール
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## 高度なパターン

### パターン1: ブルーグリーンデプロイ

```bash
# トラフィックなしで新しいリビジョンを作成する
azd deploy api --revision-suffix blue --no-traffic

# 新しいリビジョンをテストする
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# トラフィックを分割する（20%をブルー、80%を現在に）
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ブルーへの完全移行
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### パターン2: AZDを使用したカナリアデプロイ

**ファイル: .azure/dev/config.json**
```json
{
  "deploymentStrategy": "canary",
  "canary": {
    "initialTrafficPercentage": 10,
    "incrementPercentage": 10,
    "intervalMinutes": 5
  }
}
```

**デプロイスクリプト:**
```bash
#!/bin/bash
# deploy-canary.sh

# 新しいリビジョンを10%のトラフィックでデプロイする
azd deploy api --revision-mode multiple

# メトリクスを監視する
azd monitor --service api --duration 5m

# トラフィックを徐々に増やす
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5分待つ
done
```

### パターン3: マルチリージョンデプロイ

**ファイル: azure.yaml**
```yaml
name: global-app
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    regions:
      - eastus
      - westeurope
      - southeastasia
```

**ファイル: infra/multi-region.bicep**
```bicep
param regions array = ['eastus', 'westeurope', 'southeastasia']

module containerApps './app/container-app.bicep' = [for region in regions: {
  name: 'app-${region}'
  params: {
    location: region
    environmentName: environmentName
  }
}]

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: 'tm-global-app'
  location: 'global'
  properties: {
    trafficRoutingMethod: 'Performance'
    endpoints: [for i in range(0, length(regions)): {
      name: 'endpoint-${regions[i]}'
      type: 'Microsoft.Network/trafficManagerProfiles/externalEndpoints'
      properties: {
        target: containerApps[i].outputs.fqdn
        endpointStatus: 'Enabled'
      }
    }]
  }
}
```

**デプロイ:**
```bash
# すべての地域にデプロイする
azd up

# エンドポイントを確認する
azd show --output json | jq '.services.api.endpoints'
```

### パターン4: Dapr統合

**ファイル: infra/app/dapr-enabled.bicep**
```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'dapr-app'
  properties: {
    configuration: {
      dapr: {
        enabled: true
        appId: 'order-service'
        appPort: 8000
        appProtocol: 'http'
      }
    }
    template: {
      containers: [
        {
          name: 'app'
          image: containerImage
        }
      ]
    }
  }
}
```

**Daprを使用したアプリケーションコード:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # 状態を保存
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # イベントを公開
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ベストプラクティス

### 1. リソースの整理

```bash
# 一貫した命名規則を使用する
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# コスト追跡のためにリソースにタグを付ける
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. セキュリティのベストプラクティス

```bicep
// Always use managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
}

// Store secrets in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  properties: {
    enableRbacAuthorization: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}

// Use private endpoints
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  properties: {
    subnet: {
      id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: 'containerapp-connection'
        properties: {
          privateLinkServiceId: containerApp.id
        }
      }
    ]
  }
}
```

### 3. パフォーマンス最適化

```yaml
# azure.yaml with performance settings
services:
  api:
    project: ./src/api
    host: containerapp
    resources:
      cpu: 1.0
      memory: 2Gi
    scale:
      minReplicas: 2
      maxReplicas: 20
      rules:
        - name: http-rule
          http:
            concurrent: 100
```

### 4. 監視と可観測性

```bash
# アプリケーションインサイトを有効にする
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# リアルタイムでログを表示する
azd logs api --follow

# メトリクスを監視する
azd monitor --service api

# アラートを作成する
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. コスト最適化

```bash
# 使用されていないときはゼロにスケールする
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# 開発環境にはスポットインスタンスを使用する
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# 予算アラートを設定する
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD統合

**GitHub Actionsの例:**
```yaml
name: Deploy to Azure Container Apps

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1
      
      - name: Login to Azure
        run: |
          azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
        env:
          AZURE_ENV_NAME: ${{ secrets.AZURE_ENV_NAME }}
          AZURE_LOCATION: ${{ secrets.AZURE_LOCATION }}
```

## コマンドリファレンス

```bash
# 新しいコンテナアプリプロジェクトを初期化する
azd init --template <template-name>

# インフラストラクチャとアプリケーションをデプロイする
azd up

# アプリケーションコードのみをデプロイする（インフラストラクチャをスキップ）
azd deploy

# インフラストラクチャのみをプロビジョニングする
azd provision

# デプロイされたリソースを表示する
azd show

# ログをストリームする
azd logs <service-name> --follow

# アプリケーションを監視する
azd monitor --overview

# リソースをクリーンアップする
azd down --force --purge
```

## トラブルシューティング

### 問題: コンテナが起動しない

```bash
# ログを確認する
azd logs api --tail 100

# コンテナイベントを表示する
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ローカルでテストする
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### 問題: コンテナアプリのエンドポイントにアクセスできない

```bash
# イングレス構成を確認する
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# 内部イングレスが有効かどうかを確認する
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### 問題: パフォーマンスの問題

```bash
# リソース使用率を確認する
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# リソースをスケールアップする
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## 追加リソースと例
- [マイクロサービスの例](./microservices/README.md)
- [シンプルなFlask APIの例](./simple-flask-api/README.md)
- [Azure Container Apps ドキュメント](https://learn.microsoft.com/azure/container-apps/)
- [AZDテンプレートギャラリー](https://azure.github.io/awesome-azd/)
- [Container Apps サンプル](https://github.com/Azure-Samples/container-apps-samples)
- [Bicepテンプレート](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## コントリビューション

新しいコンテナアプリの例を追加するには：

1. 新しいサブディレクトリを作成し、例を追加
2. 完全な`azure.yaml`、`infra/`、`src/`ファイルを含める
3. デプロイ手順を含む包括的なREADMEを追加
4. `azd up`でデプロイをテスト
5. プルリクエストを送信

---

**サポートが必要ですか？** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) コミュニティに参加して、サポートや質問を受け付けています。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->