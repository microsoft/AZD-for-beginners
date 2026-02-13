# Triển khai Mô hình AI với Azure Developer CLI

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển theo hướng AI
- **⬅️ Trước**: [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Tiếp**: [Phòng thí nghiệm Workshop AI](ai-workshop-lab.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

Hướng dẫn này cung cấp các chỉ dẫn toàn diện để triển khai các mô hình AI bằng cách sử dụng mẫu AZD, bao gồm mọi thứ từ lựa chọn mô hình đến các mẫu triển khai trong môi trường sản xuất.

## Mục lục

- [Chiến lược lựa chọn mô hình](../../../../docs/chapter-02-ai-development)
- [Cấu hình AZD cho mô hình AI](../../../../docs/chapter-02-ai-development)
- [Các mẫu triển khai](../../../../docs/chapter-02-ai-development)
- [Quản lý mô hình](../../../../docs/chapter-02-ai-development)
- [Cân nhắc khi đưa vào sản xuất](../../../../docs/chapter-02-ai-development)
- [Giám sát và khả năng quan sát](../../../../docs/chapter-02-ai-development)

## Chiến lược lựa chọn mô hình

### Các mô hình Azure OpenAI

Chọn mô hình phù hợp cho trường hợp sử dụng của bạn:

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

### Lập kế hoạch dung lượng mô hình

| Loại mô hình | Trường hợp sử dụng | Dung lượng khuyến nghị | Cân nhắc chi phí |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Trò chuyện, Hỏi & Đáp | 10-50 TPM | Tiết kiệm chi phí cho hầu hết các khối lượng công việc |
| GPT-4 | Suy luận phức tạp | 20-100 TPM | Chi phí cao hơn, dùng cho các tính năng cao cấp |
| Text-embedding-ada-002 | Tìm kiếm, RAG | 30-120 TPM | Cần thiết cho tìm kiếm ngữ nghĩa |
| Whisper | Nhận dạng giọng nói | 10-50 TPM | Khối lượng công việc xử lý âm thanh |

## Cấu hình AZD cho mô hình AI

### Cấu hình mẫu Bicep

Tạo các triển khai mô hình thông qua các mẫu Bicep:

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

### Biến môi trường

Cấu hình môi trường ứng dụng của bạn:

```bash
# Cấu hình .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Các mẫu triển khai

### Mẫu 1: Triển khai một vùng

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

Phù hợp cho:
- Phát triển và kiểm thử
- Ứng dụng cho một thị trường
- Tối ưu chi phí

### Mẫu 2: Triển khai đa vùng

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Phù hợp cho:
- Ứng dụng toàn cầu
- Yêu cầu tính sẵn sàng cao
- Phân phối tải

### Mẫu 3: Triển khai kết hợp

Kết hợp Azure OpenAI với các dịch vụ AI khác:

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

## Quản lý mô hình

### Quản lý phiên bản

Theo dõi phiên bản mô hình trong cấu hình AZD của bạn:

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

### Cập nhật mô hình

Sử dụng hook của AZD để cập nhật mô hình:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Kiểm thử A/B

Triển khai nhiều phiên bản mô hình:

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

## Cân nhắc khi đưa vào sản xuất

### Lập kế hoạch dung lượng

Tính dung lượng cần thiết dựa trên mô hình sử dụng:

```python
# Ví dụ tính dung lượng
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

# Ví dụ sử dụng
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Cấu hình tự động mở rộng

Cấu hình tự động mở rộng cho Container Apps:

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

### Tối ưu chi phí

Thực hiện các biện pháp kiểm soát chi phí:

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

## Giám sát và khả năng quan sát

### Tích hợp Application Insights

Cấu hình giám sát cho khối lượng công việc AI:

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

### Các chỉ số tùy chỉnh

Theo dõi các chỉ số đặc thù cho AI:

```python
# Giám sát tùy chỉnh cho các mô hình AI
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

### Kiểm tra sức khỏe

Triển khai giám sát trạng thái dịch vụ AI:

```python
# Các endpoint kiểm tra trạng thái hoạt động
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Kiểm tra kết nối OpenAI
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

## Bước tiếp theo

1. **Xem lại [Hướng dẫn Tích hợp Microsoft Foundry](microsoft-foundry-integration.md)** cho các mẫu tích hợp dịch vụ
2. **Hoàn thành [Phòng thí nghiệm Workshop AI](ai-workshop-lab.md)** để có kinh nghiệm thực hành
3. **Triển khai [Thực hành AI cho môi trường sản xuất](production-ai-practices.md)** cho các triển khai doanh nghiệp
4. **Tham khảo [Hướng dẫn Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** cho các vấn đề phổ biến

## Tài nguyên

- [Tình trạng sẵn có của mô hình Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Mở rộng Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Tối ưu chi phí cho mô hình AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển theo hướng AI
- **⬅️ Trước**: [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Tiếp**: [Phòng thí nghiệm Workshop AI](ai-workshop-lab.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:

Tài liệu này đã được dịch bằng dịch vụ dịch thuật bằng AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa sai sót hoặc không chính xác. Văn bản gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->