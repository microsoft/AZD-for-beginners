# Azure Developer CLI を使用した AI モデルのデプロイ

**章ナビゲーション:**
- **📚 コース ホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AI ファースト開発
- **⬅️ 前へ**: [Microsoft Foundry 統合](microsoft-foundry-integration.md)
- **➡️ 次へ**: [AI ワークショップ ラボ](ai-workshop-lab.md)
- **🚀 次の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)

このガイドは、モデル選定から本番デプロイメントパターンまで、AZD テンプレートを使用した AI モデルのデプロイに関する包括的な手順を提供します。

> **検証メモ (2026-03-25):** このガイドの AZD ワークフローは `azd` `1.23.12` に対して確認されました。デフォルトのサービスデプロイメント時間よりも長くかかる AI デプロイについては、現在の AZD リリースは `azd deploy --timeout <seconds>` をサポートしています。

## 目次

- [モデル選定戦略](#モデル選定戦略)
- [AI モデル用の AZD 設定](#ai-モデル用の-azd-設定)
- [デプロイパターン](#デプロイパターン)
- [モデル管理](#モデル管理)
- [本番環境での考慮事項](#本番環境での考慮事項)
- [監視と可観測性](#監視と可観測性)

## モデル選定戦略

### Microsoft Foundry Models モデル

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
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### モデル容量計画

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | チャット、Q&A | 10-50 TPM | ほとんどのワークロードに対して費用対効果が高い |
| gpt-4.1 | 複雑な推論 | 20-100 TPM | コストは高め、プレミアム機能向けに使用 |
| text-embedding-3-large | 検索、RAG | 30-120 TPM | 意味検索と検索に対する堅牢な既定の選択 |
| Whisper | 音声→テキスト | 10-50 TPM | 音声処理ワークロード |

## AI モデル用の AZD 設定

### Bicep テンプレートの設定

Bicep テンプレートを通じてモデルデプロイメントを作成します:

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
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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

アプリケーションの環境を設定します:

```bash
# .env の設定
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## デプロイパターン

### パターン 1: 単一リージョンデプロイメント

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

適している用途:
- 開発およびテスト
- 単一市場向けアプリケーション
- コスト最適化

### パターン 2: マルチリージョンデプロイメント

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

適している用途:
- グローバルアプリケーション
- 高可用性要件
- 負荷分散

### パターン 3: ハイブリッドデプロイメント

Microsoft Foundry Models を他の AI サービスと組み合わせます:

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

AZD 設定でモデルのバージョンを追跡します:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
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

# デプロイがデフォルトのタイムアウトを超える場合
azd deploy --timeout 1800
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

## 本番環境での考慮事項

### キャパシティプランニング

使用パターンに基づいて必要な容量を計算します:

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

### オートスケーリングの構成

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

コスト管理策を実装します:

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

### Application Insights の統合

AI ワークロード向けの監視を構成します:

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
# AIモデルのカスタムテレメトリ
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
        # OpenAI接続のテスト
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

1. **[Microsoft Foundry 統合ガイド](microsoft-foundry-integration.md) を確認してください** サービス統合パターンのために
2. **[AI ワークショップ ラボ](ai-workshop-lab.md) を完了してください** 実践的な経験のために
3. **[本番 AI プラクティス](production-ai-practices.md) を実装してください** エンタープライズのデプロイのために
4. **[AI トラブルシューティングガイド](../chapter-07-troubleshooting/ai-troubleshooting.md) を参照してください** よくある問題について

## リソース

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**章ナビゲーション:**
- **📚 コース ホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第2章 - AI ファースト開発
- **⬅️ 前へ**: [Microsoft Foundry 統合](microsoft-foundry-integration.md)
- **➡️ 次へ**: [AI ワークショップ ラボ](ai-workshop-lab.md)
- **🚀 次の章**: [第3章: 設定](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご留意ください。原文（原言語）の文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の利用に起因して生じたいかなる誤解や誤訳についても、私たちは責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->