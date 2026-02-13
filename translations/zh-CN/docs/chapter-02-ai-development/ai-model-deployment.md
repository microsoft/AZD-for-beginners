# 使用 Azure Developer CLI 部署 AI 模型

**章节导航：**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第2章 - AI 优先开发
- **⬅️ 上一章**: [Microsoft Foundry 集成](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 实验室](ai-workshop-lab.md)
- **🚀 下一个章节**: [第3章：配置](../chapter-03-configuration/configuration.md)

本指南提供了使用 AZD 模板部署 AI 模型的全面说明，涵盖从模型选择到生产部署模式的所有内容。

## 目录

- [模型选择策略](../../../../docs/chapter-02-ai-development)
- [用于 AI 模型的 AZD 配置](../../../../docs/chapter-02-ai-development)
- [部署模式](../../../../docs/chapter-02-ai-development)
- [模型管理](../../../../docs/chapter-02-ai-development)
- [生产注意事项](../../../../docs/chapter-02-ai-development)
- [监控与可观察性](../../../../docs/chapter-02-ai-development)

## 模型选择策略

### Azure OpenAI 模型

为您的用例选择合适的模型：

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

### 模型容量规划

| 模型类型 | 用例 | 建议容量 | 成本考虑 |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | 聊天、问答 | 10-50 TPM | 对大多数工作负载具有成本效益 |
| GPT-4 | 复杂推理 | 20-100 TPM | 成本较高，用于高级功能 |
| Text-embedding-ada-002 | 搜索、RAG（检索增强生成） | 30-120 TPM | 对语义搜索至关重要 |
| Whisper | 语音转文本 | 10-50 TPM | 音频处理工作负载 |

## 用于 AI 模型的 AZD 配置

### Bicep 模板配置

通过 Bicep 模板创建模型部署：

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

### 环境变量

配置您的应用环境：

```bash
# .env 配置
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## 部署模式

### 模式 1：单区域部署

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

适用场景：
- 开发和测试
- 单一市场应用
- 成本优化

### 模式 2：多区域部署

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

适用场景：
- 全球应用
- 高可用性需求
- 负载分布

### 模式 3：混合部署

将 Azure OpenAI 与其他 AI 服务结合：

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

在 AZD 配置中跟踪模型版本：

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

使用 AZD 钩子进行模型更新：

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B 测试

部署多个模型版本：

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

## 生产注意事项

### 容量规划

根据使用模式计算所需容量：

```python
# 容量计算示例
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

# 使用示例
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### 自动伸缩配置

为 Container Apps 配置自动伸缩：

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

### 成本优化

实施成本控制：

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

## 监控与可观察性

### Application Insights 集成

为 AI 工作负载配置监控：

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

### 自定义指标

跟踪 AI 特有指标：

```python
# 用于 AI 模型的自定义遥测
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

### 健康检查

实现 AI 服务健康监控：

```python
# 健康检查端点
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # 测试 OpenAI 连接
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

## 后续步骤

1. **查阅 [Microsoft Foundry 集成指南](microsoft-foundry-integration.md)** 以了解服务集成模式
2. **完成 [AI 实验室](ai-workshop-lab.md)** 以获得实践经验
3. **实施 [生产 AI 实践](production-ai-practices.md)** 以用于企业部署
4. **查看 [AI 故障排除指南](../chapter-07-troubleshooting/ai-troubleshooting.md)** 以获取常见问题处理

## 资源

- [Azure OpenAI 模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps 缩放](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI 模型成本优化](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**章节导航：**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第2章 - AI 优先开发
- **⬅️ 上一章**: [Microsoft Foundry 集成](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 实验室](ai-workshop-lab.md)
- **🚀 下一个章节**: [第3章：配置](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能存在错误或不准确之处。应以原文（原始语言版本）为权威来源。对于重要信息，建议采用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->