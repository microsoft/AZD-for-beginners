# Triển khai Mô hình AI với Azure Developer CLI

**Điều hướng Chương:**
- **📚 Trang khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Trước**: [Tác nhân AI](agents.md)
- **➡️ Tiếp theo**: [Phòng thí nghiệm AI Workshop](ai-workshop-lab.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu Hình](../chapter-03-configuration/configuration.md)

Hướng dẫn này cung cấp chỉ dẫn toàn diện về triển khai các mô hình AI sử dụng các mẫu AZD, bao gồm từ lựa chọn mô hình đến các mẫu triển khai trong sản xuất.

> **Đánh giá phát hành (2026-11-04):** Các thay đổi CLI liên quan đã được xem xét so với `azd` `1.37.2`; tính khả dụng mô hình, phiên bản và hạn ngạch vẫn phụ thuộc vào khu vực và tài khoản đăng ký. `azd deploy --timeout <seconds>` kiểm soát cửa sổ triển khai dịch vụ, không phải là đảm bảo kích hoạt tác nhân. Xem [ghi chú phát hành hiện tại và hướng dẫn di cư AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Mục Lục

- [Chiến Lược Lựa Chọn Mô Hình](#model-selection-strategy)
- [Cấu Hình AZD cho Mô Hình AI](#azd-configuration-for-ai-models)
- [Mẫu Triển Khai](#deployment-patterns)
- [Quản Lý Mô Hình](#model-management)
- [Xem Xét Trong Sản Xuất](#production-considerations)
- [Giám Sát và Khả Năng Quan Sát](#monitoring-and-observability)

## Chiến Lược Lựa Chọn Mô Hình

### Mô Hình Azure OpenAI trong Microsoft Foundry

Chọn mô hình phù hợp cho trường hợp sử dụng của bạn:

Khai báo triển khai mô hình trong Bicep (dưới đây), không trong các cài đặt `services.*.config.AZURE_OPENAI_MODELS` tuỳ ý. AZD không giải thích cài đặt đó như danh sách tài nguyên mô hình. `project` của dịch vụ trỏ đến nguồn ứng dụng, không phải thư mục `infra/` của nó.

Ví dụ sử dụng phiên bản `gpt-4.1-mini` đã xuất bản **`2025-04-14`** và phiên bản embedding **`1`**. Xác nhận rằng phiên bản mô hình và SKU triển khai được hỗ trợ ở khu vực/tài khoản mục tiêu của bạn trước khi cấp phát.

### Lập Kế Hoạch Công Suất Mô Hình

| Loại Mô Hình | Trường Hợp Sử Dụng | Yêu Cầu Token Minh Họa | Cân Nhắc Chi Phí |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Trò chuyện, Hỏi & Đáp | 10,000-50,000 TPM | So sánh chi phí và chất lượng cho khối lượng công việc của bạn |
| gpt-4.1 | Nhiệm vụ phức tạp | 20,000-100,000 TPM | Đánh giá cải tiến chất lượng so với chi phí token |
| text-embedding-3-large | Tìm kiếm, RAG | 30,000-120,000 TPM | Tính toán cho cả lưu lượng ingest và truy vấn |
| Whisper | Chuyển đổi giọng nói thành văn bản | Lập kế hoạch dựa trên thời lượng âm thanh và giới hạn yêu cầu | Không áp dụng công thức công suất TPM của mô hình văn bản |

TPM có nghĩa là token mỗi phút. Đối với các triển khai Standard text này, ARM `sku.capacity` là đơn vị **1,000-TPM**, không phải TPM riêng lẻ (công suất `10` nghĩa là 10,000 TPM). Tỷ lệ RPM-to-TPM thay đổi theo loại mô hình/triển khai; kiểm tra cả hai giới hạn với [tài liệu hạn ngạch](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Các phạm vi này chỉ là ví dụ, không phải khuyến nghị kích thước.

## Cấu Hình AZD cho Mô Hình AI

### Cấu Hình Mẫu Bicep

Tạo triển khai mô hình thông qua mẫu Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
    disableLocalAuth: true
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

Đây là ví dụ **hạ tầng phát triển phạm vi nhóm tài nguyên**, không phải mẫu ứng dụng AZD hoàn chỉnh. Tài khoản cho phép truy cập mạng công cộng và yêu cầu xác thực Entra ID/RBAC (`Cognitive Services OpenAI User` cho bên gọi). Sản xuất cần endpoint riêng tư, DNS, và kết nối ứng dụng mô tả trong Chương 8. AZD cũng cần mẫu chính/bản đồ tham số và tài nguyên host ứng dụng; dùng mẫu hoạt động cho triển khai đầy đủ.

### Biến Môi Trường

Cấu hình môi trường ứng dụng của bạn:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Đây là tên do ứng dụng định nghĩa; kết nối chúng vào cấu hình host của bạn. Endpoint Azure OpenAI v1 dùng trong kiểm tra sức khỏe dưới đây không cần tham số truy vấn `api-version` đã lỗi thời; các client `AzureOpenAI` cũ hơn thì cần, vì vậy hãy tuân theo phiên bản API ứng dụng bạn dùng.

## Mẫu Triển Khai

### Mẫu 1: Triển Khai Một Khu Vực

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Phù hợp cho:
- Phát triển và kiểm thử
- Ứng dụng một thị trường
- Tối ưu chi phí

### Mẫu 2: Triển Khai Đa Khu Vực

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Các thuộc tính tài khoản/SKU bị bỏ qua phải được cung cấp; đoạn mã này không thể triển khai như viết. Triển khai mô hình trong mỗi tài khoản và thực hiện định tuyến/chuyển đổi sự cố và kiểm soát dữ liệu cư trú riêng biệt.

Phù hợp cho:
- Ứng dụng toàn cầu
- Yêu cầu tính sẵn sàng cao
- Phân phối tải

### Mẫu 3: Triển Khai Hybrid

Kết hợp Mô hình Microsoft Foundry với các dịch vụ AI khác:

Các đoạn mã sau giả sử tên và `location` được cung cấp bởi mẫu chứa.

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

## Quản Lý Mô Hình

### Kiểm Soát Phiên Bản

Theo dõi phiên bản mô hình trong cấu hình ứng dụng hoặc IaC. JSON này là **ví dụ do ứng dụng định nghĩa**, không phải lược đồ mô hình tích hợp AZD; cần triển khai một phương án dự phòng rõ ràng:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Cập Nhật Mô Hình

Sử dụng hook AZD để kiểm tra khả dụng chỉ đọc, sau đó cập nhật IaC và cấp phát:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Chạy `azd up` **bên ngoài** hook để áp dụng thay đổi hạ tầng mô hình và triển khai mã. Không bao giờ gọi `azd deploy` từ hook `predeploy`: nó sẽ kích hoạt đệ quy hook đó. `azd deploy --timeout 1800` mở rộng timeout triển khai ứng dụng; nó không cập nhật tài nguyên Bicep.

### Kiểm thử A/B

Tài nguyên minh họa dưới đây chọn tên và công suất triển khai; nó tạo **một** triển khai, không phải thử nghiệm A/B. Với thí nghiệm thực, cấp phát hai tài nguyên triển khai riêng biệt, định tuyến một phần kiểm soát yêu cầu tới mỗi cái, và so sánh chất lượng, độ trễ, và chi phí. Nó giả sử `openAi` từ ví dụ tài khoản:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Xem Xét Trong Sản Xuất

### Lập Kế Hoạch Công Suất

Tính toán công suất cần thiết dựa trên mẫu sử dụng:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Kết quả dự kiến: `Required capacity: 9100 TPM`. Với đơn vị công suất 1,000 TPM, làm tròn lên tối thiểu `10`, sau đó kiểm tra ước tính RPM theo mô hình và giới hạn tốc độ dịch vụ (bao gồm ngân sách đầu ra yêu cầu). Ước tính nhu cầu token này không bảo đảm tránh nghẽn.

### Cấu Hình Tự Động Mở Rộng

Cấu hình auto-scaling cho Container Apps:

**Tài nguyên một phần:** kết hợp cài đặt `template.scale` thành Container App đầy đủ với vị trí, môi trường quản lý, ảnh container, tài nguyên, và ingress. Tăng số bản sao không làm tăng hạn ngạch mô hình.

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

### Tối Ưu Chi Phí

Thực hiện kiểm soát chi phí:

**Tài nguyên ngân sách minh họa:** định nghĩa `budgetStartDate` là ngày đầu tiên của tháng hiện tại theo UTC (ví dụ `2026-11-01T00:00:00Z` cho đánh giá này), và thay thế địa chỉ liên hệ. Ngày bắt đầu phải đáp ứng giới hạn ngày hiện tại của dịch vụ. Ngân sách cảnh báo khi dữ liệu thanh toán bị trễ; nó không ngăn chi tiêu.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

## Giám Sát và Khả Năng Quan Sát

### Tích Hợp Application Insights

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

```

Đoạn tài nguyên giả định `applicationInsightsName`, `location`, và `logAnalyticsWorkspace` hiện có. Nó thiết lập giám sát, nhưng không tạo công cụ trong app hoặc tạo chỉ số tùy chỉnh.

### Chỉ Số Tùy Chỉnh

Theo dõi chỉ số đặc thù AI:

Dùng [phân phối OpenTelemetry Azure Monitor](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) được hỗ trợ, không dùng SDK Python `applicationinsights` cũ. Cài `azure-monitor-opentelemetry`, cấu hình `APPLICATIONINSIGHTS_CONNECTION_STRING`, và khởi tạo một lần khi khởi động:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

Đây minh họa phát ra thuộc tính, không phải công cụ gọi mô hình thực tế. Đóng gói yêu cầu thực trong span để đo thời lượng; kiểm tra `dependencies`/`traces` trong Application Insights. Không gửi prompt, phản hồi, khoá, hoặc thông điệp ngoại lệ thô chứa dữ liệu nhạy cảm.

### Kiểm Tra Sức Khỏe

Thực hiện giám sát sức khỏe dịch vụ AI:

Cài đặt `fastapi`, `uvicorn`, `httpx`, và `azure-identity`. Đặt các biến endpoint/triển khai ở trên và cấp quyền `Cognitive Services OpenAI User` cho bên gọi. Đây là **probe readiness** sử dụng Azure OpenAI v1 data plane với Entra ID; nó thực hiện cuộc gọi mô hình có phí. Chạy với `uvicorn health:app` sau khi lưu thành `health.py`. Dùng một kiểm tra liveness nhẹ riêng biệt, giới hạn tốc độ/bộ nhớ cache kết quả readiness, và không mở công khai tuyến đường này nếu không có kiểm soát truy cập.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Dự kiến: `GET /health/ai-models` trả về `200 {"status":"healthy"}` khi triển khai chat được cấu hình có thể sử dụng, hoặc `503` mà không tiết lộ chi tiết bên trên. Liệt kê các triển khai là thao tác quản lý dịch vụ, không phải probe sức khỏe data plane hợp lệ.

## Các Bước Tiếp Theo

1. **Xem xét [Hướng Dẫn Tích Hợp Microsoft Foundry](microsoft-foundry-integration.md)** cho các mẫu tích hợp dịch vụ
2. **Hoàn thành [Phòng Thí Nghiệm AI Workshop](ai-workshop-lab.md)** để có trải nghiệm thực hành
3. **Triển khai [Thực Hành AI Sản Xuất](../chapter-08-production/production-ai-practices.md)** cho các triển khai doanh nghiệp
4. **Khám phá [Hướng Dẫn Khắc Phục Sự Cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** cho các vấn đề phổ biến

## Tài Nguyên

- [Khả Dụng Mô Hình Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Tài Liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Tối Ưu Chi Phí Mô Hình AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Điều hướng Chương:**
- **📚 Trang khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Trước**: [Tác nhân AI](agents.md)
- **➡️ Tiếp theo**: [Phòng thí nghiệm AI Workshop](ai-workshop-lab.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu Hình](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->