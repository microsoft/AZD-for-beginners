# Azure Developer CLI を使用した AI モデルのデプロイ

**章のナビゲーション:**
- **📚 コース ホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: Chapter 2 - AI-First Development
- **⬅️ 前へ**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ 次へ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 次の章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

このガイドは、AZD テンプレートを使用した AI モデルのデプロイに関する包括的な手順を提供します。モデル選定から本番デプロイのパターンまでを網羅しています。

## 目次

- [モデル選定戦略](#model-selection-strategy)
- [AI モデル向けの AZD 構成](#ai-モデル向けの-azd-構成)
- [デプロイ パターン](#デプロイ-パターン)
- [モデル管理](#モデル管理)
- [本番での考慮事項](#本番での考慮事項)
- [監視と可観測性](#監視と可観測性)

## Model Selection Strategy

### Microsoft Foundry モデル モデル

ユースケースに適したモデルを選択してください:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### モデルのキャパシティ計画

| モデルタイプ | ユースケース | 推奨キャパシティ | コストに関する考慮事項 |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | チャット、Q&A | 10-50 TPM | ほとんどのワークロードでコスト効果が高い |
| gpt-4.1 | 複雑な推論 | 20-100 TPM | コストが高いため、プレミアム機能に使用 |
| Text-embedding-ada-002 | 検索、RAG | 30-120 TPM | 意味的検索に不可欠 |
| Whisper | 音声認識 | 10-50 TPM | 音声処理ワークロード |

## AI モデル向けの AZD 構成

### Bicep テンプレート構成

Bicep テンプレートでモデルのデプロイを作成します:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

### 環境変数

アプリケーションの環境を構成します:

```bash
# .env の設定
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## デプロイ パターン

### パターン 1: 単一リージョン展開

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

適しているケース:
- 開発およびテスト
- 単一市場向けアプリケーション
- コスト最適化

### パターン 2: マルチリージョン展開

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

適しているケース:
- グローバルアプリケーション
- 高可用性要件
- 負荷分散

### パターン 3: ハイブリッド展開

Microsoft Foundry モデルを他の AI サービスと組み合わせます:

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## モデル管理

### バージョン管理

AZD 構成でモデルのバージョンを追跡します:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### モデル更新

モデル更新には AZD フックを使用します:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B テスト

複数のモデルバージョンをデプロイします:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## 本番での考慮事項

### キャパシティ計画

使用パターンに基づいて必要なキャパシティを計算します:

```python
# 容量計算の例
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# 使用例
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### オートスケーリング構成

Container Apps のオートスケーリングを構成します:

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### コスト最適化

コスト管理を実装します:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## 監視と可観測性

### Application Insights 統合

AI ワークロードの監視を構成します:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### カスタムメトリクス

AI 固有のメトリクスを追跡します:

```python
# AIモデル向けのカスタムテレメトリ
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### ヘルスチェック

AI サービスのヘルス監視を実装します:

```python
# ヘルスチェック用エンドポイント
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI 接続をテストする
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## 次のステップ

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md) を確認する** サービス統合パターンについて
2. **[AI Workshop Lab](ai-workshop-lab.md) を完了する** 実践的な経験のために
3. **[Production AI Practices](production-ai-practices.md) を実装する** エンタープライズ展開のために
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) を参照する** 一般的な問題について

## リソース

- [Microsoft Foundry モデルの利用可能性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps のスケーリング](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI モデルのコスト最適化](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**章のナビゲーション:**
- **📚 コース ホーム**: [AZD For Beginners](../../README.md)
- **📖 現在の章**: Chapter 2 - AI-First Development
- **⬅️ 前へ**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ 次へ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 次の章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-opトランスレーター](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性を期していますが、自動翻訳には誤りや不正確さが含まれる可能性があることにご注意ください。原文（原言語）の文書を正式な情報源と見なしてください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の使用により生じた誤解や解釈の相違について、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->