<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-19T18:27:19+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "ja"
}
-->
# AI特化型トラブルシューティングガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第7章 - トラブルシューティングとデバッグ
- **⬅️ 前章**: [デバッグガイド](debugging.md)
- **➡️ 次章**: [第8章: 本番環境とエンタープライズパターン](../microsoft-foundry/production-ai-practices.md)
- **🤖 関連**: [第2章: AIファースト開発](../microsoft-foundry/microsoft-foundry-integration.md)

**前章:** [本番AIの実践](../microsoft-foundry/production-ai-practices.md) | **次章:** [AZDの始め方](../getting-started/README.md)

この包括的なトラブルシューティングガイドは、AZDを使用してAIソリューションを展開する際に発生する一般的な問題に対処し、Azure AIサービスに特化した解決策とデバッグ技術を提供します。

## 目次

- [Azure OpenAIサービスの問題](../../../../docs/troubleshooting)
- [Azure AI検索の問題](../../../../docs/troubleshooting)
- [コンテナアプリの展開問題](../../../../docs/troubleshooting)
- [認証と権限エラー](../../../../docs/troubleshooting)
- [モデル展開の失敗](../../../../docs/troubleshooting)
- [パフォーマンスとスケーリングの問題](../../../../docs/troubleshooting)
- [コストとクォータ管理](../../../../docs/troubleshooting)
- [デバッグツールと技術](../../../../docs/troubleshooting)

## Azure OpenAIサービスの問題

### 問題: OpenAIサービスが地域で利用不可

**症状:**
```
Error: The requested resource type is not available in the location 'westus'
```

**原因:**
- 選択した地域でAzure OpenAIが利用不可
- 優先地域でクォータが枯渇
- 地域の容量制約

**解決策:**

1. **地域の利用可能性を確認:**
```bash
# OpenAIの利用可能なリージョンを一覧表示
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD設定を更新:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **代替地域を使用:**
```bicep
// infra/main.bicep - Multi-region fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### 問題: モデル展開クォータ超過

**症状:**
```
Error: Deployment failed due to insufficient quota
```

**解決策:**

1. **現在のクォータを確認:**
```bash
# クォータ使用量を確認
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **クォータ増加をリクエスト:**
```bash
# クォータ増加リクエストを提出する
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **モデル容量を最適化:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### 問題: 無効なAPIバージョン

**症状:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**解決策:**

1. **サポートされているAPIバージョンを使用:**
```python
# 最新のサポートされているバージョンを使用してください
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **APIバージョンの互換性を確認:**
```bash
# サポートされているAPIバージョンを一覧表示
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI検索の問題

### 問題: 検索サービスの価格帯が不十分

**症状:**
```
Error: Semantic search requires Basic tier or higher
```

**解決策:**

1. **価格帯をアップグレード:**
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'  // Minimum for semantic search
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    semanticSearch: 'standard'
  }
}
```

2. **セマンティック検索を無効化 (開発用):**
```bicep
// For development environments
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  sku: {
    name: 'free'
  }
  properties: {
    semanticSearch: 'disabled'
  }
}
```

### 問題: インデックス作成の失敗

**症状:**
```
Error: Cannot create index, insufficient permissions
```

**解決策:**

1. **検索サービスキーを確認:**
```bash
# 検索サービスの管理キーを取得する
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **インデックススキーマを確認:**
```python
# インデックススキーマを検証する
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **マネージドIDを使用:**
```bicep
// Grant search permissions to managed identity
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, searchIndexDataContributorRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
    principalType: 'ServicePrincipal'
  }
}
```

## コンテナアプリの展開問題

### 問題: コンテナビルドの失敗

**症状:**
```
Error: Failed to build container image
```

**解決策:**

1. **Dockerfileの構文を確認:**
```dockerfile
# Dockerfile - Python AI app example
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

2. **依存関係を検証:**
```txt
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **ヘルスチェックを追加:**
```python
# main.py - ヘルスチェックエンドポイントを追加
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### 問題: コンテナアプリの起動失敗

**症状:**
```
Error: Container failed to start within timeout period
```

**解決策:**

1. **起動タイムアウトを延長:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          probes: [
            {
              type: 'startup'
              httpGet: {
                path: '/health'
                port: 8000
              }
              initialDelaySeconds: 30
              periodSeconds: 10
              timeoutSeconds: 5
              failureThreshold: 10  // Allow more time for AI models to load
            }
          ]
        }
      ]
    }
  }
}
```

2. **モデルの読み込みを最適化:**
```python
# モデルを遅延ロードして起動時間を短縮する
import asyncio
from contextlib import asynccontextmanager

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # ここでAIクライアントを初期化する
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # 起動
    app.state.model_manager = ModelManager()
    yield
    # シャットダウン
    pass

app = FastAPI(lifespan=lifespan)
```

## 認証と権限エラー

### 問題: マネージドIDの権限拒否

**症状:**
```
Error: Authentication failed for Azure OpenAI Service
```

**解決策:**

1. **ロール割り当てを確認:**
```bash
# 現在の役割の割り当てを確認する
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **必要なロールを割り当て:**
```bicep
// Required role assignments for AI services
var cognitiveServicesOpenAIUserRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
var searchIndexDataContributorRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAi
  name: guid(openAi.id, containerApp.id, cognitiveServicesOpenAIUserRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: cognitiveServicesOpenAIUserRole
    principalType: 'ServicePrincipal'
  }
}
```

3. **認証をテスト:**
```python
# 管理対象ID認証をテストする
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### 問題: Key Vaultへのアクセス拒否

**症状:**
```
Error: The user, group or application does not have secrets get permission
```

**解決策:**

1. **Key Vaultの権限を付与:**
```bicep
resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: containerApp.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
  }
}
```

2. **アクセスポリシーではなくRBACを使用:**
```bicep
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, containerApp.id, 'Key Vault Secrets User')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalType: 'ServicePrincipal'
  }
}
```

## モデル展開の失敗

### 問題: モデルバージョンが利用不可

**症状:**
```
Error: Model version 'gpt-4-32k' is not available
```

**解決策:**

1. **利用可能なモデルを確認:**
```bash
# 利用可能なモデルを一覧表示
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **モデルのフォールバックを使用:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4o-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-35-turbo'
  version: '0125'
}

// Try primary model first, fallback if unavailable
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: primaryModel
  }
  sku: {
    name: 'Standard'
    capacity: 10
  }
}
```

3. **展開前にモデルを検証:**
```python
# 展開前のモデル検証
import httpx

async def validate_model_availability(model_name: str, version: str) -> bool:
    """Check if model is available before deployment."""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/models",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            models = response.json()
            return any(
                model["id"] == f"{model_name}-{version}"
                for model in models.get("data", [])
            )
    except Exception:
        return False
```

## パフォーマンスとスケーリングの問題

### 問題: 高い応答遅延

**症状:**
- 応答時間 > 30秒
- タイムアウトエラー
- ユーザー体験の低下

**解決策:**

1. **リクエストタイムアウトを実装:**
```python
# 適切なタイムアウトを設定する
import httpx

client = httpx.AsyncClient(
    timeout=httpx.Timeout(
        connect=5.0,
        read=30.0,
        write=10.0,
        pool=10.0
    )
)
```

2. **応答キャッシュを追加:**
```python
# レスポンス用のRedisキャッシュ
import redis.asyncio as redis
import json

class ResponseCache:
    def __init__(self, redis_url: str):
        self.redis = redis.from_url(redis_url)
        
    async def get_cached_response(self, query_hash: str) -> str | None:
        """Get cached response if available."""
        cached = await self.redis.get(f"ai_response:{query_hash}")
        return cached.decode() if cached else None
        
    async def cache_response(self, query_hash: str, response: str, ttl: int = 3600):
        """Cache AI response with TTL."""
        await self.redis.setex(f"ai_response:{query_hash}", ttl, response)
```

3. **自動スケーリングを設定:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      scale: {
        minReplicas: 2
        maxReplicas: 20
        rules: [
          {
            name: 'http-requests'
            http: {
              metadata: {
                concurrentRequests: '5'  // Scale aggressively for AI workloads
              }
            }
          }
          {
            name: 'cpu-utilization'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '60'  // Lower threshold for AI apps
              }
            }
          }
        ]
      }
    }
  }
}
```

### 問題: メモリ不足エラー

**症状:**
```
Error: Container killed due to memory limit exceeded
```

**解決策:**

1. **メモリ割り当てを増加:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          resources: {
            cpu: json('1.0')
            memory: '2Gi'  // Increase for AI workloads
          }
        }
      ]
    }
  }
}
```

2. **メモリ使用を最適化:**
```python
# メモリ効率の良いモデル処理
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # 処理前にメモリ使用量を確認
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # ガベージコレクションを強制実行
            
        result = await self._process_ai_request(request)
        
        # 処理後のクリーンアップ
        gc.collect()
        return result
```

## コストとクォータ管理

### 問題: 予期しない高コスト

**症状:**
- Azure請求が予想以上に高額
- トークン使用量が推定を超過
- 予算アラートが発動

**解決策:**

1. **コスト管理を実装:**
```python
# トークン使用状況の追跡
class TokenTracker:
    def __init__(self, monthly_limit: int = 100000):
        self.monthly_limit = monthly_limit
        self.current_usage = 0
        
    async def track_usage(self, prompt_tokens: int, completion_tokens: int):
        """Track token usage with limits."""
        total_tokens = prompt_tokens + completion_tokens
        self.current_usage += total_tokens
        
        if self.current_usage > self.monthly_limit:
            raise Exception("Monthly token limit exceeded")
            
        return total_tokens
```

2. **コストアラートを設定:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500  // $500 monthly limit
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

3. **モデル選択を最適化:**
```python
# コストを意識したモデル選択
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # 1Kトークンごと
    'gpt-4': 0.03,          # 1Kトークンごと
    'gpt-35-turbo': 0.0015  # 1Kトークンごと
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4o-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4'
```

## デバッグツールと技術

### AZDデバッグコマンド

```bash
# 詳細なログを有効にする
azd up --debug

# デプロイメントのステータスを確認する
azd show

# デプロイメントログを表示する
azd logs --follow

# 環境変数を確認する
azd env get-values
```

### アプリケーションデバッグ

1. **構造化ログ:**
```python
import logging
import json

# AIアプリケーションのための構造化ログを設定する
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_ai_request(model: str, tokens: int, latency: float, success: bool):
    """Log AI request details."""
    logger.info(json.dumps({
        'event': 'ai_request',
        'model': model,
        'tokens': tokens,
        'latency_ms': latency,
        'success': success
    }))
```

2. **ヘルスチェックエンドポイント:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAIの接続を確認する
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # 検索サービスを確認する
    try:
        search_client = SearchIndexClient(
            endpoint=AZURE_SEARCH_ENDPOINT,
            credential=DefaultAzureCredential()
        )
        indexes = await search_client.list_index_names()
        checks['search'] = {'status': 'healthy', 'indexes': list(indexes)}
    except Exception as e:
        checks['search'] = {'status': 'unhealthy', 'error': str(e)}
    
    return checks
```

3. **パフォーマンスモニタリング:**
```python
import time
from functools import wraps

def monitor_performance(func):
    """Decorator to monitor function performance."""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start_time = time.time()
        try:
            result = await func(*args, **kwargs)
            success = True
        except Exception as e:
            result = None
            success = False
            raise
        finally:
            end_time = time.time()
            latency = (end_time - start_time) * 1000
            
            logger.info(json.dumps({
                'function': func.__name__,
                'latency_ms': latency,
                'success': success
            }))
        
        return result
    return wrapper
```

## 一般的なエラーコードと解決策

| エラーコード | 説明 | 解決策 |
|--------------|------|--------|
| 401 | 認証失敗 | APIキーとマネージドID設定を確認 |
| 403 | 禁止 | RBACロール割り当てを確認 |
| 429 | レート制限 | 指数バックオフ付きのリトライロジックを実装 |
| 500 | 内部サーバーエラー | モデル展開状況とログを確認 |
| 503 | サービス利用不可 | サービスの正常性と地域の利用可能性を確認 |

## 次のステップ

1. **[AIモデル展開ガイド](ai-model-deployment.md)** を確認して展開のベストプラクティスを学ぶ
2. **[本番AIの実践](production-ai-practices.md)** を完了してエンタープライズ対応ソリューションを構築
3. **[Microsoft Foundry Discord](https://aka.ms/foundry/discord)** に参加してコミュニティサポートを受ける
4. **問題を報告** [AZD GitHubリポジトリ](https://github.com/Azure/azure-dev) にAZD特有の問題を提出

## リソース

- [Azure OpenAIサービスのトラブルシューティング](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [コンテナアプリのトラブルシューティング](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI検索のトラブルシューティング](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第7章 - トラブルシューティングとデバッグ
- **⬅️ 前章**: [デバッグガイド](debugging.md)
- **➡️ 次章**: [第8章: 本番環境とエンタープライズパターン](../microsoft-foundry/production-ai-practices.md)
- **🤖 関連**: [第2章: AIファースト開発](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLIのトラブルシューティング](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期すよう努めておりますが、自動翻訳には誤りや不正確さが含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->