# 使用 Azure Developer CLI 部署 AI 模型

**章節導覽：**
- **📚 課程首頁**： [AZD 新手指南](../../README.md)
- **📖 目前章節**： 第二章 - AI 優先開發
- **⬅️ 上一節**： [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一節**： [AI 工作坊實作](ai-workshop-lab.md)
- **🚀 下一章節**： [第三章：設定](../chapter-03-configuration/configuration.md)

本指南提供使用 AZD 範本部署 AI 模型的詳細說明，涵蓋從模型選擇到生產部署模式的完整流程。

> **驗證說明 (2026-03-25)：** 本指南中的 AZD 工作流程已使用 `azd` `1.23.12` 版本檢查。對於超出預設服務部署時長的 AI 部署，目前 AZD 釋出版本已支援 `azd deploy --timeout <秒數>`。

## 目錄

- [模型選擇策略](#模型選擇策略)
- [AZD AI 模型設定](#azd-ai-模型設定)
- [部署模式](#部署模式)
- [模型管理](#模型管理)
- [生產考量](#生產考量)
- [監控與可觀察性](#監控與可觀察性)

## 模型選擇策略

### Microsoft Foundry 模型

根據使用情景選擇適合的模型：

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

### 模型容量規劃

| 模型類型 | 使用情境 | 推薦容量 | 成本考量 |
|----------|----------|----------|---------|
| gpt-4.1-mini | 聊天、問答 | 10-50 TPM | 大多工作負載的成本效益首選 |
| gpt-4.1 | 複雜推理 | 20-100 TPM | 成本較高，適用於高階功能 |
| text-embedding-3-large | 搜尋、RAG | 30-120 TPM | 語義搜尋與檢索的強力預設選擇 |
| Whisper | 語音轉文字 | 10-50 TPM | 音訊處理工作負載 |

## AZD AI 模型設定

### Bicep 範本設定

透過 Bicep 範本建立模型部署：

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

### 環境變數

設定應用程式環境：

```bash
# .env 配置
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## 部署模式

### 模式 1：單一區域部署

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

適用於：
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

適用於：
- 全球應用
- 高可用性需求
- 負載分散

### 模式 3：混合部署

結合 Microsoft Foundry 模型與其他 AI 服務：

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

在 AZD 設定中追蹤模型版本：

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

### 模型更新

利用 AZD hooks 進行模型更新：

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# 如果部署時間超過預設逾時時間
azd deploy --timeout 1800
```

### A/B 測試

部署多個模型版本：

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

## 生產考量

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

### 自動擴充設定

設定容器應用的自動擴充：

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

實施成本控管措施：

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

### Application Insights 整合

設定 AI 工作負載的監控：

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

追蹤 AI 專屬指標：

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

## 下一步

1. **檢視 [Microsoft Foundry 整合指南](microsoft-foundry-integration.md)** 以了解服務整合模式
2. **完成 [AI 工作坊實作](ai-workshop-lab.md)**，取得實務經驗
3. **實作 [生產 AI 實務](production-ai-practices.md)**，應用於企業部署
4. **探索 [AI 疑難排解指南](../chapter-07-troubleshooting/ai-troubleshooting.md)**，解決常見問題

## 資源

- [Microsoft Foundry 模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [容器應用擴充](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI 模型成本優化](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**章節導覽：**
- **📚 課程首頁**： [AZD 新手指南](../../README.md)
- **📖 目前章節**： 第二章 - AI 優先開發
- **⬅️ 上一節**： [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一節**： [AI 工作坊實作](ai-workshop-lab.md)
- **🚀 下一章節**： [第三章：設定](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提升準確度，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言文件應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。對因使用本翻譯而產生的任何誤解或誤釋，本公司不負任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->