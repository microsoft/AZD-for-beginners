# 使用 Azure Developer CLI 部署 AI 模型

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一節**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ 下一節**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

本指南提供使用 AZD 範本部署 AI 模型的完整說明，涵蓋從模型選擇到生產部署模式的所有內容。

## 目錄

- [模型選擇策略](../../../../docs/chapter-02-ai-development)
- [AZD 用於 AI 模型的設定](../../../../docs/chapter-02-ai-development)
- [部署模式](../../../../docs/chapter-02-ai-development)
- [模型管理](../../../../docs/chapter-02-ai-development)
- [生產環境注意事項](../../../../docs/chapter-02-ai-development)
- [監控與可觀察性](../../../../docs/chapter-02-ai-development)

## 模型選擇策略

### Azure OpenAI 模型

為您的使用案例選擇合適的模型：

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
            "name": "gpt-4o-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4o-mini",
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

### 模型容量規劃

| 模型類型 | 使用情境 | 建議容量 | 成本考量 |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | 聊天、問答 | 10-50 TPM | 對大多數工作負載具成本效益 |
| GPT-4 | 複雜推理 | 20-100 TPM | 成本較高，適用於高級功能 |
| Text-embedding-ada-002 | 搜尋、RAG | 30-120 TPM | 對語意搜尋至關重要 |
| Whisper | 語音轉文字 | 10-50 TPM | 音訊處理工作負載 |

## AZD 用於 AI 模型的設定

### Bicep 範本設定

透過 Bicep 範本建立模型部署：

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4o-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

### 環境變數

設定您的應用程式環境：

```bash
# .env 設定
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## 部署模式

### 模式 1：單區域部署

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

適合用於：
- 開發與測試
- 單一市場應用
- 成本優化

### 模式 2：多區域部署

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

適合用於：
- 全球性應用
- 高可用性需求
- 負載分散

### 模式 3：混合部署

將 Azure OpenAI 與其他 AI 服務結合：

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

## 模型管理

### 版本控制

在您的 AZD 設定中追蹤模型版本：

```json
{
  "models": {
    "chat": {
      "name": "gpt-4o-mini",
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

### 模型更新

使用 AZD hooks 進行模型更新：

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B 測試

部署多個模型版本：

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## 生產環境注意事項

### 容量規劃

根據使用模式計算所需容量：

```python
# 容量計算範例
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

# 使用範例
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### 自動擴展設定

為 Container Apps 設定自動擴展：

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

### 成本優化

實施成本控制：

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

## 監控與可觀察性

### 整合 Application Insights

為 AI 工作負載設定監控：

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

### 自訂指標

追蹤 AI 特定指標：

```python
# AI 模型的自訂遙測
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

### 健康檢查

實作 AI 服務健康監控：

```python
# 健康檢查端點
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # 測試 OpenAI 連線
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

## 後續步驟

1. **檢閱 [Microsoft Foundry 整合指南](microsoft-foundry-integration.md)** 以了解服務整合模式
2. **完成 [AI 實作實驗室](ai-workshop-lab.md)** 以獲得實作經驗
3. **實施 [生產 AI 作法](production-ai-practices.md)** 以用於企業部署
4. **參閱 [AI 疑難排解指南](../chapter-07-troubleshooting/ai-troubleshooting.md)** 以處理常見問題

## 資源

- [Azure OpenAI 模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps 縮放](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI 模型成本優化](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一節**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ 下一節**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。儘管我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文應視為具權威性的來源。若涉及重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->